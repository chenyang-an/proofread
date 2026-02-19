# Proofread: ch1_sec10

## Section Title
Propositional Substitution

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
None found.

### A2. Grammar / Style
- **Line ~233**: "iff and only if" → "if and only if" — The text reads `$A\vDash B$ holds iff` (end of line 233) `and only if` (start of line 234), which is a malformed hybrid of "iff" and "if and only if". "iff" already means "if and only if", so "iff and only if" is redundant/erroneous. Should be either "if and only if" or just "iff".

### A3. LaTeX Issues
- **Line ~185**: `\varphi(p_\ell) = \varphi(A)` in the inline definition of φ′ — The inline text says "Define $\varphi^\prime$ to be the truth assignment such that $\varphi(p_\ell) = \varphi(A)$", but this should be `$\varphi^\prime(p_\ell) = \varphi(A)$`. The prime is missing on the first φ. The displayed equation (eq:truthassignVariant) on lines 187–191 correctly uses `\varphi^\prime(p_j)`, so this is an error in the inline text only.
- **Line ~208**: `\varphi^\pprime` — The macro `\pprime` is used in the footnote (lines 208–210) for a double-prime notation on φ. This is a non-standard macro (standard LaTeX would use `\varphi''` or `\varphi^{\prime\prime}`). Verify that `\pprime` is defined in the preamble. If defined, this is fine; flagging for verification only.

### A4. Notation Inconsistencies
- **Line ~217**: In Corollary \ref{coro:instanceTaut} part (c), the text writes `A_1(C/p_i),\ldots A_k(C/p_i)` — there is a missing comma after `\ldots`. Should be `A_1(C/p_i),\ldots, A_k(C/p_i)` with a comma before `A_k`. Compare with the hypothesis on the same line which correctly writes `A_1,\ldots, A_k \vDash B` with a comma after `\ldots`.

### A5. Reference / Label Issues
None found.

## Task B: Mathematical Correctness

### B1. Definitions
None found.

### B2. Theorem Statements
None found.

### B3. Proof Steps
- **Line ~185**: In the proof of Theorem \ref{thm:substituteProp2}, the inline text states: "Define $\varphi^\prime$ to be the truth assignment such that $\varphi(p_\ell) = \varphi(A)$ and otherwise agrees with $\varphi$." As noted under A3, this should read $\varphi^\prime(p_\ell) = \varphi(A)$, not $\varphi(p_\ell) = \varphi(A)$. As written, it describes a property of the original assignment φ rather than the new assignment φ′. The displayed equation immediately following (lines 187–191) is correct.
- **Line ~201**: In the third line of the chain of equalities in the proof of Theorem \ref{thm:substituteProp2}, the justification states: "By $B \tautEq C$ since $p_\ell$ does not appear in $B$ or $C$". The reasoning is that since $p_\ell$ does not appear in $B$ or $C$, the substitution $B(p_\ell/p_i)$ is essentially a renaming of $p_i$ to $p_\ell$, and tautological equivalence is preserved under renaming. The footnote (lines 205–210) elaborates rigorously. The step is correct.
- **Line ~208**: [Uncertain] The footnote argues: "$\varphi^\prime(B(p_\ell/p_i))=\varphi^{\prime\prime}(B)=\varphi^{\prime\prime}(C)=\varphi^\prime(C(p_\ell/p_i))$". The first and third equalities use the fact that evaluating $B(p_\ell/p_i)$ under φ′ is the same as evaluating $B$ under the $p_i$-variant φ″ where φ″(p_i) = φ′(p_ℓ). This follows from Theorem \ref{thm:substituteProp1}. The middle equality φ″(B) = φ″(C) follows from $B \tautEq C$. This reasoning is correct.
- **Line ~233**: In the proof of Corollary \ref{coro:instanceTaut} part (b), the text says "$A\vDash B$ holds iff and only if $\vDash A\limplies B$". Beyond the grammatical issue noted in A2, the mathematical content invokes the Semantic Deduction Theorem (Theorem \ref{thm:deductionSemanticProp}), which is correct.
- **Line ~240**: In the proof of part (c), the text states: "$A_1,\ldots, A_k \vDash B$ holds if and only if $A_1\land \cdots\land A_k \limplies B$ is a tautology." This is correct by the theorem that for finite Γ = {A₁,…,Aₖ}, Γ ⊨ B iff A₁∧…∧Aₖ ⊨ B, combined with the Semantic Deduction Theorem.

### B4. Formulas and Symbolic Expressions
- **Line ~216**: In Corollary \ref{coro:instanceTaut}, part (b) ends with `$A(C/p_i) \vDash B(C/p_i)$` without terminal punctuation (no period). Part (a) at line 215 correctly ends with a period ("is a tautology."), and part (c) at line 217 also ends with a period. Only part (b) is missing its terminal period.

### B5. Examples and Counterexamples
- **Line ~37**: The first example computes $A(((p_2\land p_3)\limplies p_1)/p_1)$ where $A = (p_1 \limplies (p_2 \limplies p_1))$. Replacing both occurrences of $p_1$ in $A$ with $((p_2\land p_3)\limplies p_1)$ gives $(((p_2\land p_3)\limplies p_1) \limplies (p_2 \limplies ((p_2\land p_3)\limplies p_1)))$. This is correct.
- **Line ~46**: The parallel substitution example computes $A(C,D/p_1,p_2)$ where $A = (p_1 \limplies (p_2 \limplies p_1))$, $C = (p_2\land p_3)$, $D = (p_1\land p_4)$. Replacing $p_1$ with $C$ and $p_2$ with $D$ in parallel gives $((p_2\land p_3) \limplies ((p_1\land p_4) \limplies (p_2\land p_3)))$. This is correct.
- **Line ~59**: The claim about sequential substitution: "$A(C/p_1)(D/p_2)$ is the same as $A(C',D/p_1,p_2)$ where $C'$ is $C(D/p_2)$." Verification: $A(C/p_1)$ replaces both $p_1$'s in $A$ with $C = (p_2\land p_3)$, giving $((p_2\land p_3) \limplies (p_2 \limplies (p_2\land p_3)))$. Then substituting $D = (p_1\land p_4)$ for $p_2$ gives $(((p_1\land p_4)\land p_3) \limplies ((p_1\land p_4) \limplies ((p_1\land p_4)\land p_3)))$. For the parallel version: $C' = C(D/p_2) = ((p_1\land p_4)\land p_3)$. Then $A(C',D/p_1,p_2)$ replaces $p_1$ with $C'$ and $p_2$ with $D$, giving $(((p_1\land p_4)\land p_3) \limplies ((p_1\land p_4) \limplies ((p_1\land p_4)\land p_3)))$. These match. The claim is correct.

## Summary

- **Typos/Grammar/LaTeX issues found**: 4
- **Mathematical issues found**: 1 (the missing prime on φ in the inline definition of φ′ at line ~185, which is both a LaTeX error and a mathematical/notational error)
- **Confidence**: High — The section covers standard material on propositional substitution. The context index provided sufficient information to verify all references, notation, and mathematical claims. The proofs are standard structural inductions and the examples were verified by hand.
