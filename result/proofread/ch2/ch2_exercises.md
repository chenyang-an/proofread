# Proofread: ch2_exercises

## Section Title
Exercises

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
- **Line ~144**: "Pierce's Law" → "Peirce's Law" — The law is named after Charles Sanders Peirce. The `\idxnm{Pierce's Law}` should be `\idxnm{Peirce's Law}`.

### A2. Grammar / Style
- **Line ~20**: Missing period at end of enumeration item. Items (a)–(c) at lines 17–19 all end with periods, but item (d) `$ \lnot A, A \vdash B$` on line 20 does not. Add a period for consistency with the other items.
- **Line ~26**: Missing hyphen in compound adjective. "three line $\PL$-proof" should be "three-line $\PL$-proof" (hyphenated when used as a compound modifier before a noun).
- **Line ~111–112**: Duplicate enumeration label (ii). The instructions at lines 110–113 read: "(i)~State whether it is unsatisfiable, or satisfiable; (ii)~State whether it is a tautology or not. (ii)~If it is not a tautology, give a truth assignment..." The second (ii) on line 112 should be (iii), and the current (iii) on line 113 should be (iv).
- **Line ~212**: Spurious comma separating subject from verb. The text reads "every truth assignment~$\varphi$, satisfies exactly one of $\Gamma$ and~$\Delta$." The comma after `$\varphi$` incorrectly separates the subject ("every truth assignment φ") from the verb ("satisfies"). Remove the comma: "every truth assignment~$\varphi$ satisfies exactly one of $\Gamma$ and~$\Delta$."
- **Line ~299**: Grammatical error "finitely satisfiability." The phrase "for finitely satisfiability instead of consistency" is ungrammatical — "finitely" is an adverb and cannot modify the noun "satisfiability." Should be "for finite satisfiability instead of consistency."

### A3. LaTeX Issues
None found.

### A4. Notation Inconsistencies
None found.

### A5. Reference / Label Issues
- **Line ~5, 7, 13**: Labels `exer:firstCh3` and `exer:lastExplicitPL` contain "Ch3" in their names, but these exercises are in chapter 2. This suggests a chapter renumbering occurred at some point. While label names are not visible to readers, this is a maintenance concern that could cause author confusion. (Minor.)
- **Line ~90**: `\ref{example:implyAorB}` — cross-reference to an example presumably in an earlier section of chapter 2. Cannot verify from the exercises file alone that this label exists. Flagging for verification.
- **Line ~177**: `\pageref{eq:lastOrAxiom}` — the context index notes this as a forward reference "from a later chapter or appendix." Cannot verify that this label exists from this file alone. Flagging for verification.
- **Line ~183–184**: `\ref{thm:completePL}` label mismatch — the text reads "part~(a) of the Soundness Theorem~\ref{thm:completePL}" but `thm:completePL` is the label for the **Completeness** Theorem (context index entry #22), not the Soundness Theorem (which is `thm:soundPL`, entry #21). Either the text "Soundness" should be changed to "Completeness", or the label should be changed to `\ref{thm:soundPL}`. The exercise label `exer:completenessBtoA` on line 182 also contains "completeness" while the text says "Soundness," further confirming the mismatch.

## Task B: Mathematical Correctness

### B1. Definitions
- **Line ~211–213**: The definition of **complementary** sets is well-formed: "Two sets Γ and Δ of formulas are called complementary if every truth assignment φ satisfies exactly one of Γ and Δ." This matches context index entry #28. No issues (aside from the spurious comma flagged in A2).

### B2. Theorem Statements
None found.

### B3. Proof Steps
None found. (The exercises section contains problem statements, not proofs.)

### B4. Formulas and Symbolic Expressions
- **Line ~44**: Exercise `\ref{exer:firstDeduct}`(b): `$A \limplies B \limplies C \vdash B \limplies A \limplies C$` — Under right-association (the chapter's stated convention), this parses as `A → (B → C) ⊢ B → (A → C)`, which is a correct and standard result (permutation of antecedents via the Deduction Theorem). Mathematically correct.
- **Line ~51**: Exercise `\ref{exer:LongHypSyllogism}`(a): `$\vdash (A\limplies B) \limplies (B\limplies C) \limplies (C\limplies D) \limplies (A\limplies D)$` — Parses as `⊢ (A→B) → ((B→C) → ((C→D) → (A→D)))` under right-association. This is the correct generalized Hypothetical Syllogism. Mathematically correct.
- **Line ~64**: `$\vdash (A \lor B) \limplies \lnot A \limplies B$` — Since A∨B abbreviates ¬A→B, this reduces to ⊢ (¬A→B) → (¬A → B), i.e., ⊢ C→C. Trivially correct.
- **Line ~115**: Exercise (a): `$p \limplies (q\limplies p) \limplies p$` parses as p → ((q→p) → p). This is a tautology: if p=T, the whole formula is T; if p=F, then F → ((q→F) → F) = F → (anything) = T. Correct.
- **Line ~116**: Exercise (b): `$(p \limplies (q\limplies p)) \limplies p$` parses as (p → (q→p)) → p. NOT a tautology: when p=F, the antecedent p → (q→p) = F → (q→F) = T, so the whole formula is T → F = F. Correct analysis.
- **Line ~117**: Exercise (c): `$((p \limplies q)\limplies p) \limplies p$` is Peirce's Law, a well-known tautology. Correctly identified as duplicate of Exercise `\ref{exer:PiercePL}` at line 146.

### B5. Examples and Counterexamples
- **Line ~183–184**: Exercise `\ref{exer:completenessBtoA}` asks to prove "part (a) of the Soundness Theorem implies part (b)." For the Soundness Theorem (entry #21): (a) If Γ is satisfiable, then Γ is consistent; (b) If Γ ⊢ A, then Γ ⊨ A. The direction (a)⟹(b) is valid (proof: if Γ ⊢ A, then Γ∪{¬A} is inconsistent; by contrapositive of (a), Γ∪{¬A} is unsatisfiable; hence Γ ⊨ A). The exercise is well-posed regardless of which theorem is intended, but the label mismatch (flagged in A5) should be resolved.
- **Line ~188–196**: Exercise `\ref{exer:equivComplete}` on extending semantic completeness: if Γ ⊨ pᵢ or Γ ⊨ ¬pᵢ for every i, prove that for every A, either Γ ⊨ A or Γ ⊨ ¬A. This follows by structural induction on formulas. Well-posed.
- **Line ~210–220**: The complementary sets exercise is well-posed. The conclusion follows from compactness: Γ and Δ being complementary means Γ∪Δ is unsatisfiable, so by compactness finite subsets suffice, and the complementarity structure yields the required Γ' ⊨ Γ and Δ' ⊨ Δ.

## Summary

- **Typos/Grammar/LaTeX issues found**: 10
- **Mathematical issues found**: 0 (all formulas and exercises verified correct; the label mismatch in A5 has mathematical presentation consequences but the underlying mathematics is sound)
- **Confidence**: High — The exercises section contains problem statements rather than proofs, so verification focuses on formula well-formedness, tautology claims, and cross-reference accuracy. The chapter context index provided sufficient information to check all flags. Two cross-references (to `example:implyAorB` and `eq:lastOrAxiom`) could not be verified from this file alone but are flagged for the author.
