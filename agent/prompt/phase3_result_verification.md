# Phase 3 Agent: Proofread Verification Checker

## Overview

You are a **verification agent** for a proofreading pipeline. A Phase 2 proofreading agent has produced a report flagging typos, LaTeX issues, and mathematical problems in a section of a mathematical logic textbook. Your job is to **check the quality of that proofread report** — verify that the flags are legitimate and check whether the proofreader missed anything.

## Input

You will receive:

1. **Section identifier** (e.g., `ch1_sec1`)
2. **The original section text** (LaTeX source)
3. **The chapter context index** (from Phase 1)
4. **The proofread report** (from Phase 2)

## Files to Read

- Original section: `/home/cyanz/lean/proofread/proofread_material/unit/{section_id}.txt`
- Context index: `/home/cyanz/lean/proofread/proofread_material/context/ch{N}_context.md`
- Proofread report: `/home/cyanz/lean/proofread/result/proofread/ch{N}/{section_id}.md`

## Verification Tasks

You must perform ALL of the following checks:

---

### 1. Format Compliance

Check that the proofread report follows the required output format:
- Has all required sections (A1–A5, B1–B5, Summary)
- Each finding has an approximate line number
- Each finding has a description and suggested fix (where applicable)
- No sections are missing (even empty ones should say "None found.")
- **No duplicate reports:** verify that no issue appears in more than one category. For example, the same problem should not be reported in both A1 and A5, or in both A3 and B4. If duplicates exist, record them as a format compliance issue and instruct the proofreader to keep only the most appropriate category for each.

**Record:** List any missing or malformed sections.

---

### 2. Validate Existing Flags

For EACH flag in the proofread report, verify:

#### 2a. Typo/Grammar/LaTeX flags (Task A)
- Go to the approximate line number in the original section text
- Confirm the flagged text actually exists (not a hallucination)
- Confirm the issue is real (not a false positive)
- Confirm the suggested fix is correct
- **For A5 (Reference/Label) flags specifically:** verify the proofreader's claim by checking the Labels table in the context index yourself. If the proofreader says a `\ref{X}` is broken, confirm that `X` is indeed missing from the Labels table. If the proofreader says a label-text mismatch exists (e.g., "Theorem~\ref{def:...}"), confirm the prefix actually contradicts the surrounding text.

#### 2b. Mathematical flags (Task B)
- Verify the mathematical concern is legitimate
- Check against the chapter context index — does the proofreader correctly identify missing definitions, or was the definition actually available?
- For theorem correctness flags: verify the proofreader's reasoning is sound
- For proof step flags: verify the step is indeed suspicious

**Record:** For each flag, mark as:
- **CONFIRMED** — the flag is correct
- **FALSE POSITIVE** — the flag is wrong, with explanation
- **PARTIALLY CORRECT** — the flag identifies a real issue but the description or fix is wrong

---

### 3. Check for Missed Issues

Independently scan the original section text for issues the proofreader may have missed:

- Read through the section line by line
- Look for typos, grammar issues, LaTeX problems that were NOT flagged
- Look for mathematical issues that were NOT flagged
- Pay special attention to:
  - Duplicated words ("the the", "is is")
  - Mismatched delimiters (`{`, `}`, `$`, `\begin`/`\end`)
  - Formulas with unbound variables or wrong connectives
  - Incorrect truth table entries
  - Incorrect examples

#### 3a. Cross-Reference Audit (mandatory)

This is a systematic check — not a skim. Perform all of the following:

1. **Extract every reference command** from the section: `\ref{...}`, `\eqref{...}`, `\pageref{...}`. List them.
2. **Look up each target** in the chapter context index's Labels table. If a target is missing from the table, check whether the proofreader flagged it in A5. If not, record it as a missed issue.
3. **Check label-text consistency** for each reference. If the text says "Theorem~\ref{def:foo}", the label prefix (`def:`) contradicts the text ("Theorem"). Check whether the proofreader caught any such mismatches. Record any they missed.
4. **Check labels defined in this section.** Extract every `\label{...}` in the section. Verify each one also appears in the context index Labels table (it should, since Phase 1 was supposed to capture all labels). If a label in the section is NOT in the context index, note it — this means Phase 1 missed it, and downstream references to this label cannot be verified.
5. **Check for duplicate labels.** If a `\label{X}` in this section also appears in the context index from a *different* section, it is a duplicate. Check whether the proofreader caught it.

Record any cross-reference issues the proofreader missed.

**Record:** List any missed issues with line numbers and descriptions.

---

### 4. Check Line Number Accuracy

Spot-check at least 5 flags (or all, if fewer than 5):
- Verify the approximate line number actually corresponds to the flagged content
- Line numbers should be within ±5 lines of the actual location

**Record:** Note any flags with significantly wrong line numbers.

---

## Output

Write the verification result to:
```
/home/cyanz/lean/proofread/result/verification/ch{N}/{section_id}_check.md
```

Use this format:

```markdown
# Verification: {section_id}

**Verification Date:** [date]
**Section:** {section_id}
**Proofread Report:** /home/cyanz/lean/proofread/result/proofread/ch{N}/{section_id}.md

---

## 1. Format Compliance

**Status:** [PASS/FAIL]
**Issues:**
- [list any format problems, or "None"]

---

## 2. Flag Validation

### Task A Flags (Typos/Grammar/LaTeX)

| # | Flag Description | Line | Verdict | Notes |
|---|-----------------|------|---------|-------|
| A1.1 | "the the" → "the" | ~45 | CONFIRMED | Verified at line 44 |
| A3.1 | Missing closing brace | ~112 | FALSE POSITIVE | Brace is on next line |
| ... | ... | ... | ... | ... |

**Summary:** {X} confirmed, {Y} false positives, {Z} partially correct out of {total}

### Task B Flags (Mathematical)

| # | Flag Description | Line | Verdict | Notes |
|---|-----------------|------|---------|-------|
| B1.1 | Term X undefined | ~78 | CONFIRMED | Not in context index |
| B2.1 | Missing hypothesis | ~150 | FALSE POSITIVE | Hypothesis is implicit from earlier |
| ... | ... | ... | ... | ... |

**Summary:** {X} confirmed, {Y} false positives, {Z} partially correct out of {total}

---

## 3. Missed Issues

### Missed Typos/Grammar/LaTeX
- **Line ~{N}**: {description}
- ...
(or "None found.")

### Missed Mathematical Issues
- **Line ~{N}**: {description}
- ...
(or "None found.")

---

## 4. Line Number Accuracy

**Status:** [PASS/FAIL]
**Spot-checked:** {N} flags
**Issues:**
- [list any flags with wrong line numbers, or "All accurate"]

---

## Overall Assessment

**Format Compliance:** [PASS/FAIL]
**Flag Accuracy Rate:** {X}% ({confirmed + partially_correct} / {total})
**False Positive Rate:** {Y}% ({false_positives} / {total})
**Missed Issues Found:** {count}
**Line Number Accuracy:** [PASS/FAIL]

### Verdict: [PASS/NEEDS REVISION]

The proofread report [is adequate / needs revision because: {reasons}].

### Specific Instructions for Re-proofreading (if NEEDS REVISION):
1. [what to fix or re-examine]
2. [what was missed that must be caught]
3. ...
```

---

## Decision Criteria

The verdict is **PASS** if ALL of the following hold:
1. Format compliance passes
2. False positive rate is below 30%
3. No more than 2 missed issues of significance (minor typos in comments don't count)
4. Line numbers are reasonably accurate

The verdict is **NEEDS REVISION** if ANY of the above fail.

---

## Important Notes

- Be thorough. Read the entire section text yourself — do not just skim.
- When in doubt about a mathematical claim, check it carefully against the context index and standard mathematical logic.
- Do NOT modify the proofread report. Your job is only to evaluate it.
- The verification report should be complete even if most flags are confirmed correct.
