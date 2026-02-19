# Proofread: ch2_sec2

## Section Title
The Proof System PL

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
- **Line ~6**: `\nocite{HilbertAckermmann:Grundzuge}` — "Ackermmann" has a doubled 'n'; the standard spelling is "Ackermann". If this is a BibTeX key it must match the .bib file, but the key itself appears to contain a typo.
- **Line ~13**: `Grundz{\"u}ge der theoretischen Logic` — The German word for "Logic" is "Logik". The title should be `theoretischen Logik` (German) rather than `Logic` (English).

### A2. Grammar / Style
- **Line ~28**: `Other connectives such $\lor$, $\land$ and $\liff$` — Missing "as" after "such". Should be "Other connectives such **as** $\lor$, $\land$ and $\liff$".

### A3. LaTeX Issues
- **Line ~21**: `% XXX` — Author TODO marker left in the source. This should be resolved or removed before publication.
- **Line ~61**: `\BinaryInfC{B}` — The conclusion `B` is not wrapped in math mode (`$B$`). All other `\BinaryInfC` uses in this section (lines ~82, ~207, ~212) wrap their content in `$...$`. This should be `\BinaryInfC{$B$}` for consistency and correct rendering.

### A4. Notation Inconsistencies
- **Line ~141**: `$\lnot A \limplies A \limplies B$` — The inner parentheses around `(A \limplies B)` are omitted. PL3 is stated on line ~50 as `$\lnot A \limplies (A \limplies B)$` with explicit parentheses. While right-association may make this unambiguous, the omission is inconsistent with how the axiom is formally stated just above. Similarly on line ~142, the outer grouping brackets of the PL2 instance are omitted (compare with the bracketed form on line ~49). Recommend adding parentheses for consistency with the axiom definitions: `$\lnot A \limplies (A \limplies B)$` on line ~141, and matching brackets on line ~142.
- **Line ~142**: `$(\lnot A \limplies A \limplies B)\limplies (\lnot A \limplies A) \limplies (\lnot A\limplies B)$` — This PL2 instance omits the outer square brackets/parentheses around the consequent. The PL2 schema is stated as `[A → (B → C)] → [(A → B) → (A → C)]`, so this instance should have `[(\lnot A \limplies A) \limplies (\lnot A\limplies B)]` bracketed. Without these brackets, under left-to-right reading the formula could be misparsed. Recommend: `$(\lnot A \limplies (A \limplies B))\limplies [(\lnot A \limplies A) \limplies (\lnot A\limplies B)]$`.

### A5. Reference / Label Issues
- **Line ~177**: `\ref{exer:AimpAorB}` — Cannot verify this reference resolves correctly from this section alone. Flagging for verification that the label `exer:AimpAorB` exists in the exercises file.

## Task B: Mathematical Correctness

### B1. Definitions
None found.

### B2. Theorem Statements
- **Line ~122**: In Theorem \ref{thm:subsetHypsProp}(a), the condition is `$\Gamma^\prime \supset \Gamma$` using `\supset`. In some conventions `⊃` means *proper* superset, excluding the case `Γ′ = Γ`. If proper superset is intended, the theorem is slightly weaker than necessary (the case `Γ′ = Γ` trivially holds). If `⊃` is intended to mean `⊇` (superset-or-equal), this is fine but may confuse readers who read `⊃` as strict. [Uncertain] — Flagging for the author to verify whether `\supset` vs. `\supseteq` is the intended convention.

### B3. Proof Steps
- **Line ~222**: The proof of Theorem \ref{thm:PLclosedsubst} ends with "This is proved by induction on the steps in the $\PL$-proof." The preceding argument is more of a proof sketch: it shows that axioms are closed under substitution and that MP inferences are preserved, then asserts the inductive conclusion. The actual induction (on the index $i$ of the proof sequence, showing each $A_i(B/p_i)$ is valid in the new sequence) is left implicit. This is standard for a textbook and likely intentional, but flagging since the induction is invoked without being fully carried out. [Uncertain]

### B4. Formulas and Symbolic Expressions
- **Line ~141**: `$\lnot A \limplies A \limplies B$` — As noted in A4, the missing parentheses `(A \limplies B)` create a formula that, while correct under right-association, does not visually match the PL3 axiom scheme as stated. Mathematically the formula is the same under the standard convention, so this is not an error, but it could confuse readers.
- **Line ~142**: `$(\lnot A \limplies A \limplies B)\limplies (\lnot A \limplies A) \limplies (\lnot A\limplies B)$` — The missing outer brackets around `(\lnot A \limplies A) \limplies (\lnot A\limplies B)` means that under strict left-to-right parsing (without right-association), this formula would read as `[(¬A → (A → B)) → (¬A → A)] → (¬A → B)`, which is *not* the intended PL2 instance. Under the standard right-association convention for `→`, it parses correctly. Since the PL2 axiom was presented with explicit brackets for clarity (line ~49), the same convention should be used here to avoid ambiguity.
- **Line ~153**: `$(A \limplies ((A\limplies A) \limplies A)) \limplies (A\limplies (A\limplies A)) \limplies (A\limplies A)$` — Same issue: the outer brackets around `(A\limplies (A\limplies A)) \limplies (A\limplies A)` are missing compared to the PL2 schema. The PL2 instance should be `$[A \limplies ((A\limplies A) \limplies A)] \limplies [(A\limplies (A\limplies A)) \limplies (A\limplies A)]$`. Mathematically correct under right-association, but inconsistent with the bracketed presentation of PL2.

### B5. Examples and Counterexamples
- **Example (line ~137)**: Verified. The PL3 instance (with schema A=A, B=B) and PL2 instance (with schema A=¬A, B=A, C=B) are correct, and the Modus Ponens step correctly derives the conclusion.
- **Example (line ~149)**: Verified. The PL2 instance (with schema A=A, B=(A→A), C=A) and both PL1 instances are correct. The two Modus Ponens steps correctly derive A → A.
- **Example (line ~165)**: Verified. `B → (A ∨ B)` unfolds to `B → (¬A → B)` which is PL1 (schema A=B, B=¬A). `¬¬A → (A ∨ B)` unfolds to `¬¬A → (¬A → B)` which is PL3 (schema A=¬A, B=B). Both are correct.
- **Example (line ~180)**: Verified. The three-step proof of `B ⊢ A → B` using PL1 and Modus Ponens is correct.
- **Example (line ~189)**: Verified. `A ⊢ A` via a single-formula proof is correct by condition (2) of the definition (the formula is in Γ).

## Summary

- **Typos/Grammar/LaTeX issues found**: 7
- **Mathematical issues found**: 4 (all related to missing parentheses/brackets in PL2 instances; 1 uncertain convention issue with ⊃ vs ⊇; 1 uncertain proof sketch note)
- **Confidence**: High — The section defines the proof system and gives foundational examples. The chapter context index provided sufficient information to verify all definitions, theorem statements, and proof steps. All examples were verified to be mathematically correct; the issues found are primarily presentational (missing brackets that could cause misreading).
