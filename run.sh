#!/bin/bash
# run.sh - Proofread pipeline: split book, then proofread every section sequentially
set -e

# === Usage ===
RAW_DATA_DIR="${1:?Usage: run.sh <path-to-raw-data>}"

# === Configuration ===
BASE="$(cd "$(dirname "$0")" && pwd)"
UNIT="$BASE/proofread_material/unit"
PROMPTS="$BASE/agent/prompt"
CONTEXT="$BASE/proofread_material/context"
LOG_DIR="$BASE/agent/log"
GLOBAL_LOG="$LOG_DIR/run_log.txt"
LOG_FILE="$GLOBAL_LOG"
GLOBAL_STATUS="$LOG_DIR/AUTO_RUN_STATUS.md"
STATUS_FILE="$GLOBAL_STATUS"
SPLIT_SCRIPT="$BASE/agent/code/split_sections.py"

MAX_ITERATIONS=3

# Chapter title lookup
get_chapter_title() {
    case "$1" in
        1) echo "Propositional Logic: Syntax and Semantics" ;;
        2) echo "Propositional Logic: Proofs" ;;
        3) echo "First-Order Logic: Syntax and Semantics" ;;
        4) echo "First-Order Logic: Proofs" ;;
        5) echo "Algorithms, Informally" ;;
        6) echo "Turing Machines" ;;
        7) echo "Arithmetic and Incompleteness" ;;
        *) echo "Chapter $1" ;;
    esac
}

mkdir -p "$UNIT" "$CONTEXT" "$LOG_DIR"

# === Helper: run claude (fire-and-forget, display progress) ===
run_claude() {
    local prompt="$1"
    local tmpfile=$(mktemp)

    claude --dangerously-skip-permissions --verbose --output-format stream-json -p "$prompt" 2>&1 | tee "$tmpfile" | while IFS= read -r line; do
        local type=$(echo "$line" | jq -r '.type // empty' 2>/dev/null)
        case "$type" in
            assistant)
                echo "$line" | jq -r '.message.content[]? | select(.type == "tool_use") | ">>> Tool: \(.name)" + (if .name == "Bash" then " - " + (.input.command // "" | .[0:200]) else "" end)' 2>/dev/null
                ;;
            user)
                echo "$line" | jq -r '.tool_use_result // empty | if . != "" then "<<< \(.)" else empty end' 2>/dev/null | head -c 500
                echo ""
                ;;
            result)
                local result=$(echo "$line" | jq -r '.result // empty')
                local duration_ms=$(echo "$line" | jq -r '.duration_ms // 0')
                local duration_min=$((duration_ms / 60000))
                local duration_sec=$(( (duration_ms % 60000) / 1000 ))
                local cost=$(echo "$line" | jq -r '.total_cost_usd // "N/A"')
                local input_tokens=$(echo "$line" | jq -r '.usage.input_tokens // "N/A"')
                local output_tokens=$(echo "$line" | jq -r '.usage.output_tokens // "N/A"')
                echo "$result"
                echo "--- Stats: ${duration_min}m${duration_sec}s | \$${cost} | in:${input_tokens} out:${output_tokens} ---"
                ;;
        esac
    done | if [ "$LOG_FILE" != "$GLOBAL_LOG" ]; then
        tee -a "$LOG_FILE" >> "$GLOBAL_LOG"
    else
        tee -a "$LOG_FILE"
    fi

    rm -f "$tmpfile"
}

# === Helper: run claude and capture result text (for verdict) ===
run_claude_capture() {
    local prompt="$1"
    local tmpfile=$(mktemp)

    claude --dangerously-skip-permissions --verbose --output-format stream-json -p "$prompt" > "$tmpfile" 2>&1

    # Display progress to stderr and log
    cat "$tmpfile" | while IFS= read -r line; do
        local type=$(echo "$line" | jq -r '.type // empty' 2>/dev/null)
        case "$type" in
            assistant)
                echo "$line" | jq -r '.message.content[]? | select(.type == "tool_use") | ">>> Tool: \(.name)" + (if .name == "Bash" then " - " + (.input.command // "" | .[0:200]) else "" end)' 2>/dev/null
                ;;
            user)
                echo "$line" | jq -r '.tool_use_result // empty | if . != "" then "<<< \(.)" else empty end' 2>/dev/null | head -c 500
                echo ""
                ;;
            result)
                local result=$(echo "$line" | jq -r '.result // empty')
                local duration_ms=$(echo "$line" | jq -r '.duration_ms // 0')
                local duration_min=$((duration_ms / 60000))
                local duration_sec=$(( (duration_ms % 60000) / 1000 ))
                local cost=$(echo "$line" | jq -r '.total_cost_usd // "N/A"')
                local input_tokens=$(echo "$line" | jq -r '.usage.input_tokens // "N/A"')
                local output_tokens=$(echo "$line" | jq -r '.usage.output_tokens // "N/A"')
                echo "$result"
                echo "--- Stats: ${duration_min}m${duration_sec}s | \$${cost} | in:${input_tokens} out:${output_tokens} ---"
                ;;
        esac
    done | if [ "$LOG_FILE" != "$GLOBAL_LOG" ]; then
        tee -a "$LOG_FILE" >> "$GLOBAL_LOG"
    else
        tee -a "$LOG_FILE"
    fi >&2

    # Extract result to stdout for capture
    local result=$(grep '"type":"result"' "$tmpfile" 2>/dev/null | jq -r '.result // empty')
    rm -f "$tmpfile"
    echo "$result"
}

log() {
    echo "$1" | tee -a "$GLOBAL_LOG"
    # Also write to section log if it differs from global
    if [ "$LOG_FILE" != "$GLOBAL_LOG" ]; then
        echo "$1" >> "$LOG_FILE"
    fi
}

update_status() {
    local section=$1
    local iteration=$2
    local step=$3
    local state=$4
    local details=$5

    cat > "$STATUS_FILE" << EOF
# Proofread Pipeline - Auto Status

| Field | Value |
|-------|-------|
| **Status** | $state |
| **Section** | $section |
| **Current Iteration** | $iteration / $MAX_ITERATIONS |
| **Current Step** | $step |
| **Started At** | $START_TIME |
| **Last Updated** | $(date '+%Y-%m-%d %H:%M:%S') |
| **PID** | $$ |

## Current Activity
$details

## Progress History
$(cat "$STATUS_FILE.history" 2>/dev/null || echo "No history yet")
EOF
}

append_history() {
    echo "- [$(date '+%H:%M:%S')] $1" >> "$STATUS_FILE.history"
}

# ============================================================
# Phase 1: Build context index for a chapter
# Args: CHAPTER_NUM CHAPTER_TITLE
# ============================================================
build_context_index() {
    local ch_num=$1
    local ch_title=$2

    if [ -f "$CONTEXT/ch${ch_num}_context.md" ]; then
        log "=== Phase 1: Skipped for Chapter $ch_num (context index already exists) ==="
        return 0
    fi

    # Set per-chapter log for Phase 1
    local ch_log_dir="$LOG_DIR/ch${ch_num}"
    mkdir -p "$ch_log_dir"
    LOG_FILE="$ch_log_dir/phase1_log.txt"

    log ""
    log "=== Phase 1: Building context index for Chapter $ch_num ==="
    update_status "ch${ch_num}" "0" "Phase 1: Context Index" "RUNNING" "Building chapter $ch_num context index..."
    append_history "Chapter $ch_num: Context index build started"

    local PHASE1_INSTRUCTIONS
    PHASE1_INSTRUCTIONS=$(cat "$PROMPTS/phase1_context_builder.md")

    local PHASE1_PROMPT="${PHASE1_INSTRUCTIONS}

---

## Your Task

Process **Chapter ${ch_num}: ${ch_title}**
Chapter number: ${ch_num}
Section files directory: ${UNIT}/

Read all section files for this chapter from the directory above (ch${ch_num}_sec1.txt, ch${ch_num}_sec2.txt, ..., and ch${ch_num}_exercises.txt if it exists).

Write the context index to $CONTEXT/ch${ch_num}_context.md following the output format specified above."

    run_claude "$PHASE1_PROMPT"

    if [ ! -f "$CONTEXT/ch${ch_num}_context.md" ]; then
        log "  ERROR: Context index for Chapter $ch_num was not created!"
        LOG_FILE="$GLOBAL_LOG"
        return 1
    fi

    log "  -> Saved context index to $CONTEXT/ch${ch_num}_context.md"
    append_history "Chapter $ch_num: Context index build completed"

    # Reset to global log
    LOG_FILE="$GLOBAL_LOG"
}

# ============================================================
# Proofread a single section (Phase 2 -> Phase 3 -> Phase 4 loop)
# Args: SECTION CHAPTER_NUM RESULT_DIR VERIFICATION_DIR
# ============================================================
proofread_section() {
    local section=$1
    local ch_num=$2
    local result_dir=$3
    local verif_dir=$4

    # Set per-section log
    local sec_log_dir="$LOG_DIR/ch${ch_num}/${section}"
    mkdir -p "$sec_log_dir"
    LOG_FILE="$sec_log_dir/run_log.txt"

    for i in $(seq 1 $MAX_ITERATIONS); do
        log ""
        log "  --- $section: Iteration $i of $MAX_ITERATIONS ---"
        append_history "$section: Iteration $i started"

        # Step 1: Phase 2 - Proofread
        update_status "$section" "$i" "1/3 Proofreading" "RUNNING" "Running Phase 2 proofreader on $section..."
        append_history "$section: Iteration $i: Proofreading started"
        log "  $section: Proofreading (iter $i)"

        local PHASE2_INSTRUCTIONS
        PHASE2_INSTRUCTIONS=$(cat "$PROMPTS/phase2_proofreader.md")

        local FEEDBACK=""
        if [ -f "$verif_dir/${section}_check.md" ]; then
            FEEDBACK="

### Previous Verification Feedback

The previous proofread attempt was reviewed and found issues. Read the verification report at the path below carefully and address all problems identified — fix false positives, catch missed issues, and correct line numbers.

Verification report: ${verif_dir}/${section}_check.md"
        fi

        local PHASE2_PROMPT="${PHASE2_INSTRUCTIONS}

---

## Your Task

Proofread section: **${section}**

Section file: ${UNIT}/${section}.txt
Context index: ${CONTEXT}/ch${ch_num}_context.md
${FEEDBACK}

Read the section file and context index from the paths above, then write the proofread report to ${result_dir}/${section}.md following the output format specified above."

        run_claude "$PHASE2_PROMPT"

        if [ ! -f "$result_dir/${section}.md" ]; then
            log "  ERROR: Proofread report for $section was not created!"
            LOG_FILE="$GLOBAL_LOG"
            return 1
        fi

        log "  $section: Proofreading completed (iter $i)"
        append_history "$section: Iteration $i: Proofreading completed"

        # Step 2: Phase 3 - Verify
        update_status "$section" "$i" "2/3 Verification" "RUNNING" "Running Phase 3 checker on $section..."
        append_history "$section: Iteration $i: Verification started"
        log "  $section: Verification (iter $i)"

        local PHASE3_INSTRUCTIONS
        PHASE3_INSTRUCTIONS=$(cat "$PROMPTS/phase3_result_verification.md")

        local PHASE3_PROMPT="${PHASE3_INSTRUCTIONS}

---

## Your Task

Verify the proofread report for section: **${section}**

Read these files:
- Original section: $UNIT/${section}.txt
- Context index: $CONTEXT/ch${ch_num}_context.md
- Proofread report: ${result_dir}/${section}.md

Write the verification result to ${verif_dir}/${section}_check.md following the output format specified above."

        run_claude "$PHASE3_PROMPT"

        if [ ! -f "$verif_dir/${section}_check.md" ]; then
            log "  ERROR: Verification report for $section was not created!"
            LOG_FILE="$GLOBAL_LOG"
            return 1
        fi

        log "  $section: Verification completed (iter $i)"
        append_history "$section: Iteration $i: Verification completed"

        # Step 3: Phase 4 - Verdict
        update_status "$section" "$i" "3/3 Verdict" "RUNNING" "Checking verdict for $section..."
        append_history "$section: Iteration $i: Checking verdict"
        log "  $section: Checking verdict (iter $i)"

        local PHASE4_INSTRUCTIONS
        PHASE4_INSTRUCTIONS=$(cat "$PROMPTS/phase4_verdict.md")

        local VERDICT_PROMPT="${PHASE4_INSTRUCTIONS}

Read the verification result at: ${verif_dir}/${section}_check.md

Reply with exactly one word: DONE or CONTINUE."

        local VERDICT_OUTPUT
        VERDICT_OUTPUT=$(run_claude_capture "$VERDICT_PROMPT")
        local DECISION
        DECISION=$(echo "$VERDICT_OUTPUT" | tail -1)

        log "  $section: Verdict = $DECISION (iter $i)"
        append_history "$section: Iteration $i: Decision = $DECISION"

        if [[ "$DECISION" == *"DONE"* ]]; then
            log "  >>> $section: VERIFIED"
            append_history "$section: SUCCESS - Proofread verified"
            LOG_FILE="$GLOBAL_LOG"
            return 0
        fi

        log "  >>> $section: Continuing to next iteration..."
        sleep 2
    done

    log "  >>> $section: MAX ITERATIONS REACHED"
    append_history "$section: STOPPED - Max iterations reached"
    LOG_FILE="$GLOBAL_LOG"
    return 1
}

# === Cleanup on exit ===
cleanup() {
    local exit_code=$?
    pkill -P $$ 2>/dev/null || true

    # Write final status to both current chapter and global status
    if [ $exit_code -eq 0 ]; then
        update_status "ALL" "-" "Completed" "FINISHED" "All sections processed!"
    elif [ $exit_code -eq 130 ]; then
        update_status "-" "-" "Interrupted" "INTERRUPTED" "Process interrupted by user (Ctrl+C)."
    else
        update_status "-" "-" "Error" "ERROR" "Process terminated unexpectedly (exit code: $exit_code)"
    fi
    append_history "Process ended with exit code $exit_code"

    # Also write to global status if we were in a chapter
    if [ "$STATUS_FILE" != "$GLOBAL_STATUS" ]; then
        STATUS_FILE="$GLOBAL_STATUS"
        if [ $exit_code -eq 0 ]; then
            update_status "ALL" "-" "Completed" "FINISHED" "All sections processed!"
        elif [ $exit_code -eq 130 ]; then
            update_status "-" "-" "Interrupted" "INTERRUPTED" "Process interrupted by user (Ctrl+C)."
        else
            update_status "-" "-" "Error" "ERROR" "Process terminated unexpectedly (exit code: $exit_code)"
        fi
        append_history "Process ended with exit code $exit_code"
    fi
}

trap 'exit 130' INT TERM
trap cleanup EXIT

# === Initialize ===
START_TIME=$(date '+%Y-%m-%d %H:%M:%S')
echo "" > "$STATUS_FILE.history"
append_history "Proofread pipeline started"

echo "" >> "$LOG_FILE"
log "============================================"
log "Proofread Run Started at $START_TIME"
log "Raw data: $RAW_DATA_DIR"
log "Max Iterations per section: $MAX_ITERATIONS"
log "============================================"

# ============================================================
# Step 0: Split book into sections
# ============================================================
log ""
log "=== Step 0: Splitting book into sections ==="
append_history "Splitting book into sections"

python3 "$SPLIT_SCRIPT" "$RAW_DATA_DIR" "$UNIT"

log "=== Splitting complete ==="
append_history "Splitting complete"

# ============================================================
# Discover chapters and process sequentially
# ============================================================
CHAPTERS=$(ls "$UNIT"/ch*_sec1.txt 2>/dev/null | sed 's|.*/ch\([0-9]*\)_sec1\.txt|\1|' | sort -n)

if [ -z "$CHAPTERS" ]; then
    log "ERROR: No sections found in $UNIT after splitting!"
    exit 2
fi

TOTAL_SECTIONS=0
COMPLETED_SECTIONS=0
FAILED_SECTIONS=0

# Count total sections
for ch_num in $CHAPTERS; do
    for f in "$UNIT"/ch${ch_num}_sec*.txt "$UNIT"/ch${ch_num}_exercises.txt; do
        [ -f "$f" ] && TOTAL_SECTIONS=$((TOTAL_SECTIONS + 1))
    done
done

log "Found chapters: $CHAPTERS"
log "Total sections to proofread: $TOTAL_SECTIONS"

for ch_num in $CHAPTERS; do
    CHAPTER_TITLE=$(get_chapter_title "$ch_num")
    RESULT_DIR="$BASE/result/proofread/ch${ch_num}"
    VERIF_DIR="$BASE/result/verification/ch${ch_num}"
    CH_LOG_DIR="$LOG_DIR/ch${ch_num}"
    mkdir -p "$RESULT_DIR" "$VERIF_DIR" "$CH_LOG_DIR"

    # Per-chapter status file
    STATUS_FILE="$CH_LOG_DIR/AUTO_RUN_STATUS.md"
    echo "" > "$STATUS_FILE.history"

    log ""
    log "========================================================"
    log "=== CHAPTER $ch_num: $CHAPTER_TITLE ==="
    log "========================================================"
    append_history "Chapter $ch_num started: $CHAPTER_TITLE"

    # Phase 1: Build context index
    build_context_index "$ch_num" "$CHAPTER_TITLE"

    # Discover sections for this chapter (sorted numerically)
    SECTIONS=""
    for f in $(ls "$UNIT"/ch${ch_num}_sec*.txt 2>/dev/null | sort -V); do
        SECTIONS="$SECTIONS $(basename "$f" .txt)"
    done
    if [ -f "$UNIT/ch${ch_num}_exercises.txt" ]; then
        SECTIONS="$SECTIONS ch${ch_num}_exercises"
    fi

    # Process each section
    for section in $SECTIONS; do
        PROCESSED=$((COMPLETED_SECTIONS + FAILED_SECTIONS + 1))
        log ""
        log "========================================"
        log "=== [$PROCESSED/$TOTAL_SECTIONS] $section ==="
        log "========================================"
        append_history "$section: Started"

        # Skip if proofread already verified
        if [ -f "$RESULT_DIR/${section}.md" ] && [ -f "$VERIF_DIR/${section}_check.md" ]; then
            if grep -q "PASS" "$VERIF_DIR/${section}_check.md" 2>/dev/null; then
                log "  Skipping $section (already verified)"
                append_history "$section: Skipped (already verified)"
                COMPLETED_SECTIONS=$((COMPLETED_SECTIONS + 1))
                continue
            fi
        fi

        if proofread_section "$section" "$ch_num" "$RESULT_DIR" "$VERIF_DIR"; then
            COMPLETED_SECTIONS=$((COMPLETED_SECTIONS + 1))
        else
            FAILED_SECTIONS=$((FAILED_SECTIONS + 1))
            log "  WARNING: $section did not pass verification after $MAX_ITERATIONS iterations"
        fi
    done

    append_history "Chapter $ch_num completed"

    # Reset to global status
    STATUS_FILE="$GLOBAL_STATUS"
done

# ============================================================
# Phase 5: Summarize the entire proofread
# ============================================================
log ""
log "============================================"
log "=== Phase 5: Generating proofread summary ==="
log "============================================"
append_history "Phase 5: Summary generation started"

SUMMARY_DIR="$BASE/result/summary"
mkdir -p "$SUMMARY_DIR"
LOG_FILE="$LOG_DIR/phase5_summary_log.txt"

PHASE5_INSTRUCTIONS=$(cat "$PROMPTS/phase5_summary.md")
SUMMARY_PROMPT="${PHASE5_INSTRUCTIONS}

---

## Your Task

Read all proofread reports under: $BASE/result/proofread/

Write the summary to: ${SUMMARY_DIR}/proofread_summary.md"

run_claude "$SUMMARY_PROMPT"

LOG_FILE="$GLOBAL_LOG"

if [ -f "${SUMMARY_DIR}/proofread_summary.md" ]; then
    log "  -> Summary saved to ${SUMMARY_DIR}/proofread_summary.md"
else
    log "  WARNING: Summary was not created"
fi

append_history "Phase 5: Summary generation completed"

log ""
log "============================================"
log "=== PROOFREAD PIPELINE COMPLETE ==="
log "============================================"
log "Total sections: $TOTAL_SECTIONS"
log "Completed: $COMPLETED_SECTIONS"
log "Failed (max iterations): $FAILED_SECTIONS"
log "============================================"
append_history "Pipeline complete: $COMPLETED_SECTIONS/$TOTAL_SECTIONS verified, $FAILED_SECTIONS failed"

exit 0
