# Verification: ch1_sec9

**Verification Date:** 2026-02-19
**Section:** ch1_sec9
**Proofread Report:** /home/cyanz/lean/proofread/result/proofread/ch1/ch1_sec9.md

---

## 1. Format Compliance

**Status:** PASS
**Issues:**
- None. All required sections (A1–A5, B1–B5, Summary) are present. Each finding includes an approximate line number, description, and suggested fix where applicable. Empty sections correctly state "None found."

---

## 2. Flag Validation

### Task A Flags (Typos/Grammar/LaTeX)

| # | Flag Description | Line | Verdict | Notes |
|---|-----------------|------|---------|-------|
| A1.1 | `p_1` should be `p_i` in contrapositive restatement | ~24 | CONFIRMED | Verified at line 24: original reads `$\varphi(p_1) \neq \varphi^\prime(p_i)$`. The theorem (lines 20–22) quantifies over each `p_i` appearing in A, so the contrapositive must have `p_i` on both sides. |
| A2.1 | "Prove that" inside `\begin{theorem}` environment reads like an exercise prompt | ~103 | CONFIRMED | Verified at line 103: text reads "Prove that $n=m+1$." inside a theorem environment (lines 100–104). Line 105 confirms this is a theorem ("Exercise~\ref{exer:numVars} asks for a proof of this theorem"). Declarative phrasing like "Then $n = m+1$." is standard. |
| A3.1 | Hyphen `-` should be en-dash `--` in exercise range | ~95 | CONFIRMED | Verified at line 95: `\ref{exer:moreOpensCloses}-\ref{exer:uniqueReadability}` uses a plain hyphen. Standard LaTeX convention for numeric ranges is an en-dash (`--`). |

**Summary:** 3 confirmed, 0 false positives, 0 partially correct out of 3

### Task B Flags (Mathematical)

| # | Flag Description | Line | Verdict | Notes |
|---|-----------------|------|---------|-------|
| B4.1 | Mismatched subscripts `p_1` vs `p_i` makes formula mathematically incorrect | ~24 | CONFIRMED | Same underlying issue as A1.1. The contrapositive should read `$\varphi(p_i) \neq \varphi^\prime(p_i)$` with matching subscripts. As written, the left side refers to the specific variable p₁ while the right refers to the generic pᵢ. |

*Note:* Entries B2.1–B2.2, B3.1–B3.2, and B5.1 in the proofread report are "no issue found" verification notes rather than problem flags. All are accurate: the theorem statements (lines 88–93, 100–104) are mathematically sound, the proofs (lines 26–45, 61–78) are complete and correct, and the example at lines 85–86 lists the correct nonempty proper initial subexpressions.

**Summary:** 1 confirmed, 0 false positives, 0 partially correct out of 1

---

## 3. Missed Issues

### Missed Typos/Grammar/LaTeX
- None found.

### Missed Mathematical Issues
- None found.

---

## 4. Line Number Accuracy

**Status:** PASS
**Spot-checked:** 4 flags (all distinct problem flags in the report)
**Issues:**
- All accurate:

| Flag | Reported Line | Actual Line | Status |
|------|---------------|-------------|--------|
| A1.1 / B4.1 | ~24 | 24 | Exact |
| A2.1 | ~103 | 103 | Exact |
| A3.1 | ~95 | 95 | Exact |

- Line references in the non-flag verification notes (B2, B3, B5) are also accurate: lines ~88–93 corresponds to lines 88–93, ~100–104 to 100–104, ~26–45 to 26–45, ~61–78 to 61–78, ~85–86 to 85–86.

---

## Overall Assessment

**Format Compliance:** PASS
**Flag Accuracy Rate:** 100% (4 / 4)
**False Positive Rate:** 0% (0 / 4)
**Missed Issues Found:** 0
**Line Number Accuracy:** PASS

### Verdict: PASS

The proofread report is thorough and accurate. All three distinct issues are correctly identified: the `p_1`/`p_i` subscript typo at line 24 (flagged as both a typo in A1 and a mathematical error in B4), the imperative "Prove that" phrasing at line 103 inside a theorem environment (A2), and the hyphen vs. en-dash for the exercise range at line 95 (A3). The mathematical verification notes for the theorem statements (Theorems \ref{thm:moreOpensCloses} and \ref{thm:numVars}), proofs (Theorems \ref{thm:varsDependOnProp} and \ref{thm:equalParens}), and the example of initial subexpressions are all sound. No missed issues were found upon independent line-by-line review. Line numbers are exact throughout.
