# Proofread: ch1_sec2

## Section Title
Propositional Formulas

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
None found.

### A2. Grammar / Style
None found.

### A3. LaTeX Issues
- **Line ~29**: `\begin{itemizeLoose}` with `\item[(a)]`, `\item[(b)]`, `\item[(c)]` — Using `\item[...]` with custom labels inside an `itemize`-like environment works but is unconventional. This is consistent with the rest of the section (and ch1_sec1), so likely intentional. Not flagged as an error, just noting the pattern is used consistently.

None found beyond standard patterns used throughout.

### A4. Notation Inconsistencies
None found. The section uses `\lnot`, `\land`, `\lor`, `\limplies`, and `\liff` consistently, matching the chapter context index conventions. Variables use the `p_i` formal convention and informal `p, q, r` convention as documented.

### A5. Reference / Label Issues
- **Line ~106**: `Definition~\ref{def:propositionalFmla}` — Correct, matches the label defined at line ~27 of this section.
- **Line ~139**: `Definition~\ref{def:truthProp}` — References a definition in sec3. Consistent with context index entry for sec3.
- **Line ~141**: `Section~\ref{sec:proofsByInduction}` — References a section for "proofs by induction on the complexity of formulas." This label is not listed in the context index. [Uncertain] The context index lists sec9 as containing theorems about formula structure (Theorems on equal parentheses, proper initial subexpressions, number of variables). The label `sec:proofsByInduction` may refer to sec9 or another section. Should verify this label resolves correctly.

## Task B: Mathematical Correctness

### B1. Definitions
- **Line ~27–35**: **Definition of propositional formulas** (Definition \ref{def:propositionalFmla}) — The inductive definition is well-formed: (a) provides the base case (variables $p_i$ for $i \ge 1$); (b) provides the negation closure rule; (c) provides closure under binary connectives with required parentheses. This is standard and correct. The implicit "nothing else is a formula" clause is stated in the text immediately after the definition (line ~37).

- **Line ~54–61**: **Precedence of connectives** — The stated precedence is: (1) $\lnot$ highest, (2) $\land$ and $\lor$ second, (3) $\limplies$ and $\liff$ lowest, with right-to-left association for same precedence. This matches the context index entry (Definition 8). The convention that $\land$ and $\lor$ have the *same* precedence is worth noting — some authors give $\land$ higher precedence than $\lor$. This is clearly a deliberate choice since the text later (line ~91) advises against writing $A \lor B \land C$ to avoid confusion.

### B2. Theorem Statements
- **Line ~123–124**: The **unique readability** property is stated informally: "if $C$ is a propositional formula, then there is a unique way to express it in one of the forms (a)-(c)." This is correct as a statement. The text does not provide a formal proof here but asserts it as a consequence of the parenthesization requirement.

### B3. Proof Steps
None found. This section does not contain formal proofs; it is definitional.

### B4. Formulas and Symbolic Expressions
- **Line ~42–49**: The examples of propositional formulas are checked:
  - $p_1$, $p_2$, $p_{1000}$: valid by clause (a). ✓
  - $\lnot p_2$: valid by (a) then (b). ✓
  - $\lnot \lnot p_2$: valid by applying (b) twice. ✓
  - $(p_1 \limplies (\lnot p_2 \limplies p_1))$: valid — inner formula $(\lnot p_2 \limplies p_1)$ is formed by (a), (b), (c); then outer implication by (c). ✓
  - $((p_1 \limplies \lnot p_2) \limplies p_1)$: valid similarly. ✓
  - $\lnot((p_1 \liff \lnot\lnot\lnot p_2) \limplies (\lnot p_2 \lor (p_1 \land p_1)))$: valid — built up from variables through negations, binary connectives with parentheses, then outer negation. ✓

- **Line ~51**: "$p_1 \land p_2$ is not a propositional formula due to missing parentheses" — Correct. The formal definition requires $(p_1 \land p_2)$ with parentheses. ✓

- **Line ~52**: "$(\lnot p_3)$ is not a propositional formula due to having extra parentheses" — Correct. Clause (b) produces $\lnot A$ without wrapping parentheses; parentheses are only introduced by clause (c) for binary connectives. ✓

- **Line ~53**: "$p \lor r$ is not a propositional formula due to using variables other than the $p_i$'s" — Correct. The formal definition only allows variables $p_i$ (with numeric subscripts). ✓

- **Line ~64–78**: Precedence examples checked:
  - $\lnot p_1 \lor \lnot p_2 \lor p_3$ → $(\lnot p_1 \lor (\lnot p_2 \lor p_3))$: $\lnot$ binds tightest, then $\lor$ associates right-to-left. ✓
  - $\lnot p_1 \limplies \lnot p_2 \limplies p_3$ → $(\lnot p_1 \limplies (\lnot p_2 \limplies p_3))$: $\lnot$ binds first, then $\limplies$ associates right-to-left. ✓
  - $\lnot(p_1 \limplies \lnot p_2) \limplies p_3$ → $(\lnot(p_1 \limplies \lnot p_2) \limplies p_3)$: The explicit parentheses around $(p_1 \limplies \lnot p_2)$ are preserved; $\lnot$ applies to that group; then $\limplies$ forms the outer formula. ✓
  - $p_1 \lor \lnot p_2 \limplies \lnot p_3 \land p_4$ → $((p_1 \lor \lnot p_2) \limplies (\lnot p_3 \land p_4))$: $\lnot$ binds first, then $\lor$ and $\land$ (same precedence, but each side only has one such connective so no association issue), then $\limplies$ at lowest precedence. ✓

- **Line ~86–88**: The claim that $\limplies$ is not associative is correct: $p \limplies (q \limplies r)$ is not equivalent to $(p \limplies q) \limplies r$. The former is a tautology when $p$ is false (since the outer implication holds), while the latter can be false (e.g., $p=$F, $q=$F, $r=$F gives $(F \to F) \to F = T \to F = F$, but $F \to (F \to F) = F \to T = T$). ✓

- **Line ~88–89**: The claim that $p \limplies (q \limplies r)$ is equivalent to $p \land q \limplies r$ — This is the Exportation equivalence listed in the context index (sec6). Correct. ✓

### B5. Examples and Counterexamples
- **Line ~42–53**: All examples and non-examples verified above. The explanations for why certain expressions are not formulas are correct.

- **Line ~64–78**: All precedence/abbreviation examples verified above.

- **Line ~91–93**: The text states $A \lor B \land C$ means $A \lor (B \land C)$ and $A \limplies B \liff C$ means $A \limplies (B \liff C)$ under the stated conventions. Let me verify:
  - $A \lor B \land C$: $\land$ and $\lor$ have the same precedence, so right-to-left association gives $A \lor (B \land C)$. ✓
  - $A \limplies B \liff C$: $\limplies$ and $\liff$ have the same (lowest) precedence, so right-to-left association gives $A \limplies (B \liff C)$. ✓

## Summary

- **Typos/Grammar/LaTeX issues found**: 0
- **Mathematical issues found**: 0
- **Confidence**: High — This section is primarily definitional (defining propositional formulas, stating precedence conventions, and discussing induction/recursion on formulas). All definitions match standard presentations. All examples were verified. The one uncertain item is the `\ref{sec:proofsByInduction}` label (A5), which cannot be fully verified without access to the full document's label definitions, but it is plausibly correct given the context index mentions sec9 covers structural induction proofs on formulas.
