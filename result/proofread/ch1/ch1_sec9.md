# Proofread: ch1_sec9

## Section Title
Examples of Proofs by Induction

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
- **Line ~24**: "$\varphi(p_1) \neq \varphi^\prime(p_i)$" → "$\varphi(p_i) \neq \varphi^\prime(p_i)$" — The subscript on the first occurrence should be `p_i`, not `p_1`. This sentence restates the hypothesis of Theorem \ref{thm:varsDependOnProp} (lines 19–23) in contrapositive form. The theorem universally quantifies over each `p_i` appearing in A, so the contrapositive should say "φ(pᵢ) ≠ φ'(pᵢ) only if pᵢ does not appear in A", with the same variable pᵢ on both sides. As written, it says φ(p₁) ≠ φ'(pᵢ), which mixes the specific variable p₁ with the generic pᵢ.

### A2. Grammar / Style
- **Line ~103**: "Prove that $n=m+1$." — This imperative "Prove that" appears inside a `\begin{theorem}...\end{theorem}` environment (lines 100–104), which reads like an exercise prompt rather than a theorem statement. Standard phrasing would be declarative: "Then $n = m+1$." Line 105 confirms this is intended as a theorem ("Exercise~\ref{exer:numVars} asks for a proof of this theorem"), so the "Prove that" is likely a leftover from an exercise formulation.

### A3. LaTeX Issues
- **Line ~95**: `\ref{exer:moreOpensCloses}-\ref{exer:uniqueReadability}` — Uses a hyphen (`-`) between the two `\ref` commands for an exercise range. Standard LaTeX typesetting for a range of numbers uses an en-dash (`--`). Should be `\ref{exer:moreOpensCloses}--\ref{exer:uniqueReadability}`.

### A4. Notation Inconsistencies
None found.

### A5. Reference / Label Issues
None found.

## Task B: Mathematical Correctness

### B1. Definitions
None found.

### B2. Theorem Statements
- **Line ~88–93**: Theorem \ref{thm:moreOpensCloses} states that if a formula begins with '(' then any nonempty proper initial subexpression has strictly more open than close parentheses, and hence is not a formula. The "hence is not a formula" conclusion follows from Theorem \ref{thm:equalParens} (equal parentheses in any formula). The statement is correct. No proof is given here (deferred to exercises), which is fine.
- **Line ~100–104**: Theorem \ref{thm:numVars} states: if a formula has $m$ occurrences of binary connectives and $n$ occurrences of propositional variables, then $n = m+1$. This is mathematically correct for the standard definition of propositional formulas (built from variables, negation, and binary connectives with parentheses). The identity n = m + 1 follows by straightforward structural induction. No mathematical issues (the style issue with "Prove that" is noted under A2).

### B3. Proof Steps
- **Line ~26–45**: Proof of Theorem \ref{thm:varsDependOnProp}. The induction structure is correct and complete: base case (variable pᵢ, line 29), induction step #1 (negation ¬B, lines 32–36), induction step #2 (binary connective B ∘ C, lines 37–43). Each step correctly argues that the variables of the subformulas are a subset of the variables of A, applies the induction hypothesis, and uses the definition of truth. All three cases of the inductive definition of propositional formulas (Definition \ref{def:propositionalFmla}) are covered. No issues found.
- **Line ~61–78**: Proof of Theorem \ref{thm:equalParens}. The induction structure is correct: base case (variable pᵢ has 0 parentheses, lines 66–67), induction step #1 (¬B has the same parentheses as B, lines 68–71), induction step #2 ((B ∘ C) adds exactly one open and one close parenthesis, lines 72–76). The arithmetic $m_A = m_B + m_C + 1$ and $n_A = n_B + n_C + 1$ is correct. No issues found.

### B4. Formulas and Symbolic Expressions
- **Line ~24**: `$\varphi(p_1) \neq \varphi^\prime(p_i)$` — Mathematically incorrect due to mismatched subscripts. The intended contrapositive of the theorem hypothesis (lines 21–22) should read `$\varphi(p_i) \neq \varphi^\prime(p_i)$` with `p_i` on both sides. As written, the left side refers to the specific variable p₁ while the right side refers to the generic pᵢ, which does not correctly restate the universal hypothesis. (Same underlying issue as A1.1.)

### B5. Examples and Counterexamples
- **Line ~85–86**: The four listed nonempty proper initial subexpressions of "$(p_1 \land p_2)$" — namely "(", "$(p_1$", "$(p_1\land$", and "$(p_1\land p_2$" — are exactly the correct nonempty proper prefixes of the 5-symbol string $(p_1 \land p_2)$. Each contains at least one symbol but is not the entire string. No issues found.

## Summary

- **Typos/Grammar/LaTeX issues found**: 3
- **Mathematical issues found**: 1 (the p_1 vs. p_i typo at line ~24, which is both a typo and a mathematical error)
- **Confidence**: High — This section contains standard induction proofs on propositional formulas, and the chapter context index provides all necessary background. The proofs are straightforward and well-structured. All issues are clearly identifiable.
