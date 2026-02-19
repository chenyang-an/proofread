# Verification: ch1_sec11

**Verification Date:** 2026-02-19
**Section:** ch1_sec11
**Proofread Report:** /home/cyanz/lean/proofread/result/proofread/ch1/ch1_sec11.md

---

## 1. Format Compliance

**Status:** PASS
**Issues:**
- None. All required sections (A1–A5, B1–B5, Summary) are present. Empty sections use "None found." Each finding includes an approximate line number, description, and suggested fix where applicable.

---

## 2. Flag Validation

### Task A Flags (Typos/Grammar/LaTeX)

| # | Flag Description | Reported Line | Verdict | Notes |
|---|-----------------|---------------|---------|-------|
| A1.1 | "Deermining" → "Determining" | ~17 | CONFIRMED | Verified at line 19. Clear misspelling. |
| A2.1 | Missing period at end of itemized entry | ~25 | CONFIRMED | Verified at line 31. All other items in both lists end with a period; this one does not. |
| A2.2 | Ambiguous phrasing "follows from… by Modus Ponens" | ~17 | CONFIRMED | Verified at line 19. Minor ambiguity as noted; the proofreader correctly identifies it as a low-priority style concern. |
| A3.1 | Inconsistent LaTeX: `\emph{…}\index{…}` vs `\idxnm{…}` | ~10 | CONFIRMED | Verified at line 10 vs line 26. Real formatting inconsistency between the introduction of "feasible" and "effective." |

**Summary:** 4 confirmed, 0 false positives, 0 partially correct out of 4

### Task B Flags (Mathematical)

| # | Flag Description | Reported Line | Verdict | Notes |
|---|-----------------|---------------|---------|-------|
| B5.1 | Tautology-checking grouped with SAT as "hard for NP" is imprecise | ~29 | CONFIRMED | Verified at lines 38–39. TAUT is co-NP-complete, not NP-hard (under standard assumptions). The proofreader's analysis is technically sound. The textbook may be intentionally informal (deferred to Chapter 5), but the flag is legitimate. |

**Summary:** 1 confirmed, 0 false positives, 0 partially correct out of 1

---

## 3. Missed Issues

### Missed Typos/Grammar/LaTeX
- **Line ~20**: `$\vec B$ and ~$\vec p$` — There is a space before the tilde (`and ~$\vec p$`), which creates a regular space followed by a non-breaking space, resulting in a double-space effect. Compare with line 17–18 where the tilde is attached directly: `formula~$A$`. For consistency and correct spacing, this should be `and~$\vec p$` (tilde immediately after "and" with no intervening space).

### Missed Mathematical Issues
- None found.

---

## 4. Line Number Accuracy

**Status:** FAIL
**Spot-checked:** 5 flags
**Issues:**
- A1.1: Reported ~17, actual line 19. Off by 2. Acceptable.
- A2.1: Reported ~25, actual line 31. Off by 6. Slightly outside ±5 tolerance.
- A2.2: Reported ~17, actual line 19. Off by 2. Acceptable.
- A3.1: Reported ~10, actual line 10. Exact match.
- B5.1: Reported ~29, actual lines 38–39. Off by ~10. Significantly outside ±5 tolerance.

Two of five spot-checked flags (A2.1 and B5.1) have line numbers outside the ±5 tolerance.

---

## Overall Assessment

**Format Compliance:** PASS
**Flag Accuracy Rate:** 100% (5/5 confirmed)
**False Positive Rate:** 0% (0/5)
**Missed Issues Found:** 1
**Line Number Accuracy:** FAIL

### Verdict: PASS

Despite the line number inaccuracies on two flags, the proofread report is substantively sound:
- All five flags are confirmed correct with 0% false positive rate.
- The one missed issue (spacing before tilde on line 20) is minor — a LaTeX spacing inconsistency, not a substantive error.
- The mathematical analysis (B5.1 on the NP/co-NP distinction) is well-reasoned and technically accurate.
- The section is short (48 lines) and primarily expository, limiting the scope for missed issues.

The line number inaccuracies are a notable weakness but do not rise to the level of requiring full re-proofreading, since all flagged content is identifiable from the descriptions alone. The proofreader should improve line number accuracy in future reports.
