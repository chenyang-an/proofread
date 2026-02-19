# Proofread: ch2_sec3

## Section Title
Deduction Theorem

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
- **Line ~48**: "$C\limplies C_k$" — The variable `C` should be `A`. The induction hypothesis for $C_k$ (which equals $C_j \limplies C_i$) is that $\Gamma \vdash A \limplies C_k$, i.e., $\Gamma \vdash A \limplies (C_j \limplies C_i)$. The text currently reads "$A\limplies C_j$ and $C\limplies C_k$" but the second conjunct should be "$A\limplies C_k$". This is a typo: `C` instead of `A`.

### A2. Grammar / Style
- **Line ~22**: "Since $\Gamma, A \vdash A$, Modus Ponens, gives $\Gamma, A \vdash B$." — The comma after "Modus Ponens" is extraneous and creates a comma splice separating the subject from its verb. Should be: "Since $\Gamma, A \vdash A$, Modus Ponens gives $\Gamma, A \vdash B$."
- **Line ~45**: "Suppose $C_i$ is inferred from Modus Ponens from $C_j$ and~$C_k$" — The preposition is doubled: "inferred from ... from". Should be either "inferred by Modus Ponens from $C_j$ and~$C_k$" or "inferred from $C_j$ and~$C_k$ by Modus Ponens".
- **Line ~105**: "And, $A\limplies B,\ B\limplies C,\, A \vdash C$ holds by combining..." — Starting a sentence with "And," is stylistically acceptable but the comma after "And" is unnecessary. Minor style point; could be "And $A\limplies B,\ldots$" or simply remove the leading "And, ".

### A3. LaTeX Issues
- **Line ~53**: `$\Gamma \vdash A \limplies C_j \limplies C_i$` — Missing parentheses around `C_j \limplies C_i`. Since $C_k = C_j \limplies C_i$, the induction hypothesis for $C_k$ should read $\Gamma \vdash A \limplies (C_j \limplies C_i)$. Without parentheses, under right-association the formula is technically the same, but it is inconsistent with line ~54 where the PL2 instance explicitly writes `(A \limplies C_j \limplies C_i)` with grouping. Adding parentheses would improve clarity: `$\Gamma \vdash A \limplies (C_j \limplies C_i)$`.
- **Line ~54**: `$\Gamma \vdash (A \limplies C_j \limplies C_i) \limplies (A\limplies C_j) \limplies (A \limplies C_i)$` — The PL2 axiom scheme is stated (in sec2) as `[A → (B → C)] → [(A → B) → (A → C)]` with outer brackets around the consequent. This instance is missing the outer grouping around `(A\limplies C_j) \limplies (A \limplies C_i)`. Should be: `$\Gamma \vdash (A \limplies C_j \limplies C_i) \limplies [(A\limplies C_j) \limplies (A \limplies C_i)]$`. Without brackets, under strict left-to-right parsing this could be misread. (Same issue noted for ch2_sec2.)

### A4. Notation Inconsistencies
None found.

### A5. Reference / Label Issues
- **Line ~41**: `\ref{example:AimpliesA}` — This references an example from sec2 (the proof that $\vdash A \limplies A$). Cannot verify the label resolves correctly from this file alone; flagging for verification that the label `example:AimpliesA` exists in ch2_sec2 or elsewhere. [Uncertain]

## Task B: Mathematical Correctness

### B1. Definitions
- **Line ~77–88**: The notion of "derived rule of inference" is introduced here and described informally. The context index lists this as defined in sec3, which matches. The description is clear: a derived rule is one that can be simulated by multiple PL steps. No issues with the definition itself.

### B2. Theorem Statements
- **Line ~109–112**: Corollary \ref{coro:HypSyl} states: "If $\Gamma \vDash A \limplies B$ and $\Gamma \vDash B \limplies C$, then $\Gamma \vDash A \limplies C$." Note this uses semantic entailment ($\vDash$) throughout, not syntactic provability ($\vdash$). This is a semantic corollary. However, the theorem it is stated as a corollary of (Theorem \ref{thm:HypSyl}) is a purely syntactic result ($\vdash$). The corollary follows from the theorem only via the Soundness Theorem (if $\vdash A$ then $\vDash A$), which is not proved until sec6. [Uncertain] — This may be intentional if the author considers the semantic version obvious from the syntactic one (or derivable from Chapter 1's semantic deduction theorem independently), but the logical dependency should be verified. If the Soundness Theorem hasn't been established yet at this point in the text, the corollary's justification is forward-referencing.

### B3. Proof Steps
- **Line ~48**: The induction hypotheses are stated as "that $A\limplies C_j$ and $C\limplies C_k$ are theorems of~$\Gamma$." The second hypothesis should be "$A \limplies C_k$" (i.e., $\Gamma \vdash A \limplies C_k$). The use of "$C$" instead of "$A$" is a mathematical error in the text (typo). Since $C_k = C_j \limplies C_i$, the induction hypothesis gives $\Gamma \vdash A \limplies (C_j \limplies C_i)$. This error propagates in meaning: the proof step in line ~53 correctly writes $\Gamma \vdash A \limplies C_j \limplies C_i$ (which matches $A \limplies C_k$), so the proof derivation itself is correct — only the English statement of the hypothesis on line ~48 contains the typo.
- **Line ~33–34**: The proof says "We prove by induction on~$i$" and "The proof by induction splits into three cases." Technically, the three cases (axiom/hypothesis, the formula $A$, and Modus Ponens) are not an induction base case / inductive step structure — they are the three sub-cases that arise at each step $i$. The induction is on the index $i$ of the proof sequence, where the inductive step uses the fact that $j, k < i$. This is strong induction (complete induction). The presentation conflates the case split with the induction structure, which is standard in textbooks but could be flagged: there is no explicit "base case" (e.g., $i = 1$). In the base case $i = 1$, Modus Ponens cannot apply (no earlier formulas), so only Cases 1 and 2 apply, which is correct. [Uncertain] — The presentation is standard and correct; flagging only for completeness.

### B4. Formulas and Symbolic Expressions
- **Line ~54**: The PL2 instance `$(A \limplies C_j \limplies C_i) \limplies (A\limplies C_j) \limplies (A \limplies C_i)$` — As noted in A3, the missing outer brackets create a potential scope ambiguity. Mathematically, under right-association of `→`, the formula is correct: it is $[A \to (C_j \to C_i)] \to [(A \to C_j) \to (A \to C_i)]$. But without brackets, a strict left-to-right parse would give $\{[A \to (C_j \to C_i)] \to (A \to C_j)\} \to (A \to C_i)$, which is not a PL2 instance.
- **Line ~53**: `$\Gamma \vdash A \limplies C_j \limplies C_i$` — This is the induction hypothesis for $C_k = C_j \limplies C_i$. Under right-association, this reads $\Gamma \vdash A \to (C_j \to C_i)$, which is correct. Explicit parentheses would improve clarity.

### B5. Examples and Counterexamples
None found.

## Summary

- **Typos/Grammar/LaTeX issues found**: 7
- **Mathematical issues found**: 4
- **Confidence**: High — The section is self-contained and the Deduction Theorem proof is standard material. The chapter context index provided sufficient information to verify all references and notation. The most significant finding is the typo on line ~48 (`C` instead of `A`), which is a clear error in the text.
