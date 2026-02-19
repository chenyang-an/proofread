# Proofread: ch2_sec5

## Section Title
Constructing PL-Proofs

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
None found.

### A2. Grammar / Style
- **Line ~68**: "Item~(7) can be much harder to use than the other eight items" — There are items (1)–(10), so excluding item (7) leaves nine other items, not eight. Should be "the other nine items" (or "the other items" to avoid counting altogether).
- **Line ~77**: "proving the existence of $\PL$-proof is shown" — Missing indefinite article "a". Should be "proving the existence of a $\PL$-proof is shown" or alternatively use the plural form "proving the existence of $\PL$-proofs is shown".

### A3. LaTeX Issues
- **Line ~187**: `$B, \, A,\, B\limplies \lnot A \}$` — Missing opening `\{`. The closing brace `\}` has no matching `\{`. Should be `$\{B, \, A,\, B\limplies \lnot A \}$` (or wrapped in `\hbox{$\{ B, \, A,\, B\limplies \lnot A \}$ is inconsistent.}` to match the pattern used elsewhere in Example 1).
- **Line ~145**: [Uncertain] `\label{page:constructingPL}` is placed after `\end{center}` but before `\end{figure}`, at the very end of the figure environment. Since this label is referenced via `\pageref{page:constructingPL}`, it should work for page referencing, but its placement after the figure content (rather than inside the minipage or adjacent to visible content) could in some LaTeX configurations cause it to refer to the wrong page if the float moves. Consider placing the label inside the minipage or immediately after `\begin{figure}` with a `\phantomsection` for robustness.

### A4. Notation Inconsistencies
None found.

### A5. Reference / Label Issues
- **Line ~26**: [Uncertain] `Exercise~\ref{exer:altProfCompletePL}` — The label name contains "Prof" which looks like a typo for "Proof". Expected: `exer:altProofCompletePL`. This could be the actual label name, but it looks suspicious and should be verified against the exercises section.

## Task B: Mathematical Correctness

### B1. Definitions
None found.

### B2. Theorem Statements
None found.

### B3. Proof Steps
- **Line ~164**: (Example 1) "Using item (9) twice, namely using Modus Tollens on the last three formulas" — The set at this point is {A, A→(¬B→C), B→D, C→D, ¬D}. "The last three formulas" refers to B→D, C→D, and ¬D. Modus Tollens is applied to (B→D, ¬D) yielding ¬B, and to (C→D, ¬D) yielding ¬C. This correctly involves three of the five formulas, and "the last three" is accurate if the formulas are ordered as listed. The mathematical content is correct.
- **Line ~184**: (Example 2) The second bullet says "By proof by contradiction, STS: $B\limplies \lnot A \, \vdash A\limplies \lnot B$". This step reduces showing {¬(A→¬B), B→¬A} is inconsistent to showing B→¬A ⊢ A→¬B. The justification is: by item (4), to prove {¬(A→¬B), B→¬A} is inconsistent (i.e., Γ,¬A is inconsistent where Γ = {B→¬A} and ¬A = ¬(A→¬B)), it suffices to show Γ ⊢ A, i.e., B→¬A ⊢ A→¬B. This is correct.
- **Line ~189**: The last paragraph of Example 2 says "since it contains~$A$, and since it has proof of~$\lnot A$ by Modus Ponens." — The set {B, A, B→¬A} contains B and B→¬A; Modus Ponens on these yields ¬A, which contradicts the A that is also in the set. This is correct.

### B4. Formulas and Symbolic Expressions
- **Line ~17**: (Item (5)) "To prove $\Gamma\cup\{A\limplies B\}$ is inconsistent, it suffices to prove first that $\Gamma \vdash A$ and second that $\Gamma \cup \{B\}$ is inconsistent." The text says this is justified by Theorem `thm:casesAimpliesB`(b), which states: Γ∪{A→B} is inconsistent iff both Γ∪{¬A} and Γ∪{B} are inconsistent. Item (5) uses "Γ ⊢ A" instead of "Γ∪{¬A} is inconsistent", but these are equivalent by proof by contradiction (Theorem thm:proofbyContra1). So item (5) is a valid reformulation of one direction of the theorem. Mathematically sound; no error.

### B5. Examples and Counterexamples
- **Line ~148**: (Example 1) Verified step-by-step. Starting from A→(B∨C), B→D, C→D ⊢ A→D: expand B∨C to ¬B→C; apply Deduction Theorem (item 1) to move A into hypotheses; apply proof by contradiction (item 6) to add ¬D; apply Modus Tollens (item 9) twice on (B→D, ¬D) and (C→D, ¬D) to get ¬B and ¬C; apply Modus Ponens (item 8) twice on (A, A→(¬B→C)) to get ¬B→C, then on (¬B, ¬B→C) to get C. The final set {A, C, ¬B, ¬C, ¬D} contains C and ¬C. All steps are correct.
- **Line ~176**: (Example 2) Verified step-by-step. The goal ¬(A→¬B) ⊢ ¬(B→¬A) reduces via: proof by contradiction → proof by contradiction (item 4) → Deduction Theorem → proof by contradiction, to showing {B, A, B→¬A} is inconsistent. Modus Ponens on B and B→¬A gives ¬A, contradicting A. All steps are correct.
- **Line ~73**: "Items (8) and~(9) are still valid if $\Gamma^*$ is instead defined to omit the formula $A\limplies B$." — This is correct: if Γ already contains A and A→B (for item 8), then B is derivable by Modus Ponens regardless of whether A→B remains in the set. Similarly for item (9) with Modus Tollens. Omitting A→B from Γ* does not affect the deductive power since the consequence has been added. Mathematically sound.

## Summary

- **Typos/Grammar/LaTeX issues found**: 5
- **Mathematical issues found**: 0 (7 items verified correct, no errors found)
- **Confidence**: High — This section is primarily a summary/guide for constructing PL-proofs using previously established results, with two worked examples. The examples were verified step-by-step and are correct. The chapter context index provided sufficient information to check all references and mathematical content.
