# Verification: ch1_exercises

**Verification Date:** 2026-02-19
**Section:** ch1_exercises
**Proofread Report:** /home/cyanz/lean/proofread/result/proofread/ch1/ch1_exercises.md

---

## 1. Format Compliance

**Status:** PASS
**Issues:**
- None. All required sections (A1–A5, B1–B5, Summary) are present. Empty sections correctly state "None found." Each finding includes an approximate line number, description, and suggested fix where applicable.

---

## 2. Flag Validation

### Task A Flags (Typos/Grammar/LaTeX)

| # | Flag Description | Line | Verdict | Notes |
|---|-----------------|------|---------|-------|
| A1.1 | "Propoises" → "Porpoises" | ~60 | CONFIRMED | Verified at line 60. Variable table misspells "Porpoises" while exercise text (lines 41–52) uses the correct spelling throughout. |
| A1.2 | Missing "it" — "only if is made of glass" | ~83 | CONFIRMED | Verified at line 83. Reads "only if is made of glass" — pronoun "it" is missing. |
| A1.3 | "The coffee does not break" → "The coffee pot does not break" | ~113 | CONFIRMED | Verified at line 113. Word "pot" missing. All other items in the exercise say "The coffee pot …". |
| A1.4 | "identify function" → "identity function" | ~412 | CONFIRMED | Verified at line 412. Misspelling of "identity". |
| A3.1 | `{\em both}` deprecated LaTeX emphasis | ~249 | CONFIRMED | Verified at line 249. Uses old-style `{\em ...}` instead of `\emph{...}`. Very low severity — compiles correctly. |
| A3.2 | `~~\` unusual spacing hack | ~321 | CONFIRMED | Verified at line 321. Two non-breaking spaces followed by forced line break. Fragile formatting, very low severity. |
| A3.3 | Duplicate `\item[(a)]` labels | ~323–324 | CONFIRMED | Verified at lines 323–324. Two items labeled (a); the second should be (b) and current (b) on line 325 should be (c). |
| A3.4 | "3-ary binary connective" — contradictory terminology | ~375 | CONFIRMED | Verified at line 375. "Binary" means 2-ary, contradicting "3-ary". Should read "3-ary connective". |
| A5.1 | "convert" vs "concert" label discrepancy | ~28–30 | CONFIRMED | Verified: `\label{exer:convertEighteen}` at line 28 vs `\pageref{table:concertEighteen}` at line 30. These are different label types (exercise label vs table pageref), but "concert"/"convert" inconsistency is suspicious and likely a typo. |
| A5.2 | `\label{exer:mirrow}` misspelling | ~67 | CONFIRMED | Verified at line 67. Label uses "mirrow" instead of "mirror". Won't cause compilation error but is inconsistent and potentially confusing for cross-references. |

**Summary:** 10 confirmed, 0 false positives, 0 partially correct out of 10

### Task B Flags (Mathematical)

| # | Flag Description | Line | Verdict | Notes |
|---|-----------------|------|---------|-------|
| B4.1 | Γ₂ satisfiability verification | ~154 | CONFIRMED | Marked [Uncertain]. Analysis is correct: Γ₂ is unsatisfiable. The constraints force p₁↔p₂ and p₁↔¬p₃, eventually yielding p₁↔¬p₁, a contradiction. The exercise is well-posed. This is a verification note, not an error flag. |
| B4.2 | "3-ary binary connective" terminology error | ~375 | CONFIRMED | Same issue as A3.4. A connective cannot be simultaneously 3-ary and binary. Correctly identified. |
| B5.1 | CNF ∩ DNF with ≥3 variables — well-posedness check | ~247–250 | CONFIRMED | Verification note. Correct: e.g., p∧q∧r is both a single conjunction of literals (DNF) and a conjunction of unit clauses (CNF). Exercise is well-posed. |
| B5.2 | {⊕, ↔} not adequate — verification | ~323 | CONFIRMED | Verification note. Correct reasoning: both ⊕ and ↔ are affine over GF(2); compositions preserve affinity; p∧q is not affine. |
| B5.3 | {¬, ⊕, ↔} not adequate — verification | ~324 | CONFIRMED | Verification note. Correct: adding ¬ preserves the affine class (¬p = 1⊕p is affine). |
| B5.4 | {Maj^k} not adequate — verification | ~341 | CONFIRMED | Verification note. Correct reasoning: Maj^k is monotone; compositions of monotone functions are monotone; ¬p is not monotone. |
| B5.5 | {¬, Maj^k} not adequate for odd k — verification | ~344 | CONFIRMED | Verification note. Correct reasoning: for odd k, Maj^k is self-dual; ¬ is self-dual; compositions of self-dual functions are self-dual; p∧q is not self-dual. |

**Summary:** 7 confirmed, 0 false positives, 0 partially correct out of 7. Note: B4.1 and B5.1–B5.5 are verification notes confirming exercises are well-posed, not error flags. The only actual error flag is B4.2 (= A3.4).

---

## 3. Missed Issues

### Missed Typos/Grammar/LaTeX
None found. The proofreader caught all significant typos, grammar issues, and LaTeX problems upon thorough independent re-reading of the full 477-line section.

### Missed Mathematical Issues
None found. The exercises section consists primarily of problem statements; all are mathematically well-posed based on verification against the chapter context index and standard mathematical logic.

---

## 4. Line Number Accuracy

**Status:** PASS
**Spot-checked:** 10 flags (all flags)
**Issues:**
- All accurate. Every flagged line number matches the actual location exactly (±0 lines in all cases).

| Flag | Reported Line | Actual Line | Δ |
|------|-------------|-------------|---|
| A1.1 "Propoises" | ~60 | 60 | 0 |
| A1.2 missing "it" | ~83 | 83 | 0 |
| A1.3 missing "pot" | ~113 | 113 | 0 |
| A1.4 "identify" | ~412 | 412 | 0 |
| A3.1 `{\em both}` | ~249 | 249 | 0 |
| A3.2 `~~\` | ~321 | 321 | 0 |
| A3.3 duplicate (a) | ~323–324 | 323–324 | 0 |
| A3.4 "3-ary binary" | ~375 | 375 | 0 |
| A5.1 convert/concert | ~28–30 | 28, 30 | 0 |
| A5.2 "mirrow" | ~67 | 67 | 0 |

---

## Overall Assessment

**Format Compliance:** PASS
**Flag Accuracy Rate:** 100% (17 / 17)
**False Positive Rate:** 0% (0 / 17)
**Missed Issues Found:** 0
**Line Number Accuracy:** PASS

### Verdict: PASS

The proofread report is thorough and accurate. All 10 Task A flags and 7 Task B items are confirmed correct with zero false positives. The proofreader identified all significant issues in this exercises section:

- **4 genuine text errors** (A1.1–A1.4): misspelling "Propoises", missing pronoun "it", missing word "pot", misspelling "identify"
- **1 duplicate label error** (A3.3): two `\item[(a)]` entries
- **1 terminology error** (A3.4/B4.2): "3-ary binary connective" is contradictory
- **2 suspicious labels** (A5.1–A5.2): "convert"/"concert" mismatch and "mirrow" misspelling
- **2 minor LaTeX style issues** (A3.1–A3.2): deprecated `{\em}` and unusual `~~\` spacing

The mathematical verification notes in Task B demonstrate sound reasoning (affine functions, monotonicity, self-duality arguments). Line numbers are exact throughout. No missed issues were found upon independent re-reading of the full section.
