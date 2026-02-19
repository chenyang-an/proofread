#!/bin/bash
# run.sh - Proofread pipeline with verification loop for ch1_sec1
set -e

# === Configuration ===
BASE="/home/cyanz/lean/proofread"
SECTION="ch1_sec1"
CHAPTER_NUM=1
CHAPTER_TITLE="Propositional Logic: Syntax and Semantics"

UNIT="$BASE/proofread_material/unit"
PROMPTS="$BASE/agent/prompt"
CONTEXT="$BASE/proofread_material/context"
RESULT="$BASE/result/proofread/ch${CHAPTER_NUM}"
VERIFICATION="$BASE/result/verification/ch${CHAPTER_NUM}"
LOG_DIR="$BASE/agent/log"
LOG_FILE="$LOG_DIR/run_log.txt"
STATUS_FILE="$LOG_DIR/AUTO_RUN_STATUS.md"

MAX_ITERATIONS=3

mkdir -p "$CONTEXT" "$RESULT" "$VERIFICATION" "$LOG_DIR"

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
                echo "--- Stats: ${duration_min}m${duration_sec}s | \$${cost} | in:${input_tokens} out:${output_tokens} ---"
                ;;
        esac
    done | tee -a "$LOG_FILE"

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
    done | tee -a "$LOG_FILE" >&2

    # Extract result to stdout for capture
    local result=$(grep '"type":"result"' "$tmpfile" 2>/dev/null | jq -r '.result // empty')
    rm -f "$tmpfile"
    echo "$result"
}

log() {
    echo "$1" | tee -a "$LOG_FILE"
}

update_status() {
    local iteration=$1
    local step=$2
    local state=$3
    local details=$4

    cat > "$STATUS_FILE" << EOF
# Proofread Pipeline - Auto Status

| Field | Value |
|-------|-------|
| **Status** | $state |
| **Section** | $SECTION |
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

# === Cleanup on exit ===
cleanup() {
    local exit_code=$?
    pkill -P $$ 2>/dev/null || true

    if [ $exit_code -eq 0 ]; then
        update_status "$CURRENT_ITER" "Completed" "FINISHED" "Proofread verified successfully!"
    elif [ $exit_code -eq 1 ]; then
        update_status "$CURRENT_ITER" "Stopped" "STOPPED" "Max iterations reached."
    elif [ $exit_code -eq 130 ]; then
        update_status "$CURRENT_ITER" "Interrupted" "INTERRUPTED" "Process interrupted by user (Ctrl+C)."
    else
        update_status "$CURRENT_ITER" "Error" "ERROR" "Process terminated unexpectedly (exit code: $exit_code)"
    fi
    append_history "Process ended with exit code $exit_code"
}

trap 'exit 130' INT TERM
trap cleanup EXIT

# === Initialize ===
START_TIME=$(date '+%Y-%m-%d %H:%M:%S')
CURRENT_ITER=0
echo "" > "$STATUS_FILE.history"
append_history "Proofread pipeline started for $SECTION"

echo "" >> "$LOG_FILE"
log "============================================"
log "Proofread Run Started at $START_TIME"
log "Section: $SECTION"
log "Max Iterations: $MAX_ITERATIONS"
log "============================================"

# ============================================================
# Phase 1: Build context index for Chapter 1 (runs once)
# ============================================================
if [ ! -f "$CONTEXT/ch${CHAPTER_NUM}_context.md" ]; then
    log ""
    log "=== Phase 1: Building context index for Chapter $CHAPTER_NUM ==="
    update_status "0" "Phase 1: Context Index" "RUNNING" "Building chapter context index..."
    append_history "Phase 1: Context index build started"

    PHASE1_INSTRUCTIONS=$(cat "$PROMPTS/phase1_context_builder.md")

    PHASE1_SECTIONS=""
    for i in 1 2 3 4 5 6 7 8 9 10 11; do
        f="$UNIT/ch${CHAPTER_NUM}_sec${i}.txt"
        if [ -f "$f" ]; then
            PHASE1_SECTIONS="${PHASE1_SECTIONS}
========== File: ch${CHAPTER_NUM}_sec${i}.txt ==========
$(cat "$f")
"
        fi
    done
    f="$UNIT/ch${CHAPTER_NUM}_exercises.txt"
    if [ -f "$f" ]; then
        PHASE1_SECTIONS="${PHASE1_SECTIONS}
========== File: ch${CHAPTER_NUM}_exercises.txt ==========
$(cat "$f")
"
    fi

    PHASE1_PROMPT="${PHASE1_INSTRUCTIONS}

---

## Your Task

Process **Chapter ${CHAPTER_NUM}: ${CHAPTER_TITLE}**
Chapter number: ${CHAPTER_NUM}

Here are all the section files in order:

${PHASE1_SECTIONS}

Write the context index to $CONTEXT/ch${CHAPTER_NUM}_context.md following the output format specified above."

    run_claude "$PHASE1_PROMPT"

    if [ ! -f "$CONTEXT/ch${CHAPTER_NUM}_context.md" ]; then
        log "  ERROR: Context index was not created!"
        exit 2
    fi

    log "  -> Saved context index to $CONTEXT/ch${CHAPTER_NUM}_context.md"
    append_history "Phase 1: Context index build completed"
else
    log ""
    log "=== Phase 1: Skipped (context index already exists) ==="
fi

# ============================================================
# Main Loop: Proofread -> Check -> Verdict
# ============================================================
for i in $(seq 1 $MAX_ITERATIONS); do
    CURRENT_ITER=$i

    log ""
    log "========================================"
    log "=== ITERATION $i of $MAX_ITERATIONS ==="
    log "========================================"
    append_history "Iteration $i started"

    # --------------------------------------------------
    # Step 1: Phase 2 - Proofread the section
    # --------------------------------------------------
    update_status "$i" "1/3 Proofreading" "RUNNING" "Running Phase 2 proofreader on $SECTION..."
    append_history "Iteration $i: Proofreading started"
    log "Iteration $i: Proofreading $SECTION"

    PHASE2_INSTRUCTIONS=$(cat "$PROMPTS/phase2_proofreader.md")
    CH_CONTEXT=$(cat "$CONTEXT/ch${CHAPTER_NUM}_context.md")
    SEC_CONTENT=$(cat "$UNIT/${SECTION}.txt")

    # If this is a re-run, include the previous verification feedback
    FEEDBACK=""
    if [ -f "$VERIFICATION/${SECTION}_check.md" ]; then
        FEEDBACK="

### Previous Verification Feedback

The previous proofread attempt was reviewed and found issues. Read the verification report below carefully and address all problems identified — fix false positives, catch missed issues, and correct line numbers.

$(cat "$VERIFICATION/${SECTION}_check.md")"
    fi

    PHASE2_PROMPT="${PHASE2_INSTRUCTIONS}

---

## Your Task

Proofread section: **${SECTION}**
${FEEDBACK}

### Chapter Context Index

${CH_CONTEXT}

### Section Content (${SECTION}.txt)

${SEC_CONTENT}

Write the proofread report to $RESULT/${SECTION}.md following the output format specified above."

    run_claude "$PHASE2_PROMPT"

    if [ ! -f "$RESULT/${SECTION}.md" ]; then
        log "  ERROR: Proofread report was not created!"
        exit 2
    fi

    log "Iteration $i: Proofreading completed"
    append_history "Iteration $i: Proofreading completed"

    # --------------------------------------------------
    # Step 2: Phase 3 - Verify the proofread report
    # --------------------------------------------------
    update_status "$i" "2/3 Verification" "RUNNING" "Running Phase 3 checker on $SECTION..."
    append_history "Iteration $i: Verification started"
    log "Iteration $i: Verification started"

    PHASE3_INSTRUCTIONS=$(cat "$PROMPTS/phase3_result_verification.md")

    PHASE3_PROMPT="${PHASE3_INSTRUCTIONS}

---

## Your Task

Verify the proofread report for section: **${SECTION}**

Read these files:
- Original section: $UNIT/${SECTION}.txt
- Context index: $CONTEXT/ch${CHAPTER_NUM}_context.md
- Proofread report: $RESULT/${SECTION}.md

Write the verification result to $VERIFICATION/${SECTION}_check.md following the output format specified above."

    run_claude "$PHASE3_PROMPT"

    if [ ! -f "$VERIFICATION/${SECTION}_check.md" ]; then
        log "  ERROR: Verification report was not created!"
        exit 2
    fi

    log "Iteration $i: Verification completed"
    append_history "Iteration $i: Verification completed"

    # --------------------------------------------------
    # Step 3: Phase 4 - Verdict
    # --------------------------------------------------
    update_status "$i" "3/3 Verdict" "RUNNING" "Checking verdict..."
    append_history "Iteration $i: Checking verdict"
    log "Iteration $i: Checking verdict"

    PHASE4_INSTRUCTIONS=$(cat "$PROMPTS/phase4_verdict.md")

    VERDICT_PROMPT="${PHASE4_INSTRUCTIONS}

Read the verification result at: $VERIFICATION/${SECTION}_check.md

Reply with exactly one word: DONE or CONTINUE."

    VERDICT_OUTPUT=$(run_claude_capture "$VERDICT_PROMPT")
    DECISION=$(echo "$VERDICT_OUTPUT" | tail -1)

    log "Iteration $i: Verdict = $DECISION"
    append_history "Iteration $i: Decision = $DECISION"

    if [[ "$DECISION" == *"DONE"* ]]; then
        log ""
        log "========================================"
        log "=== PROOFREAD VERIFIED! ==="
        log "=== $SECTION Complete ==="
        log "========================================"
        append_history "SUCCESS - Proofread verified"
        exit 0
    fi

    log ">>> Continuing to next iteration..."
    sleep 2
done

log ""
log "========================================"
log "=== MAX ITERATIONS REACHED ==="
log "========================================"
append_history "STOPPED - Max iterations reached"
exit 1
