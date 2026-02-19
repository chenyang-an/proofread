# Proofread: ch1_sec1

## Section Title
Introduction to Propositional Logic

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
- **Line ~108**: "if and only if you are eighteen" → "if and only if you are **over** eighteen" — The variable $e$ is defined on line 94 as "You are over eighteen years old", but the footnote sentence on line 108 says "you are eighteen", dropping the word "over". This changes the meaning.

### A2. Grammar / Style
- **Line ~45**: "The $\land$~(``and'') operator is also called \idxem{conjunction}," — This line ends with a comma, but the following line 46 ("The $\lor$~... \idxem{disjunction}.") and the preceding line 44 ("... \idxem{negation}.") both end with periods. The comma should be a period for consistency, since the next line begins a new statement about a different operator.

### A3. LaTeX Issues
- **Line ~7**: "it  deals" — Double space between "it" and "deals" in the source. While LaTeX collapses multiple spaces in output, this is likely an unintentional artifact in the source.
- **Line ~104**: `\label{table:concertEighteen}` is placed inside a bare `center` environment (line 98: `\begin{center}`, line 105: `\end{center}`), not inside a `table` float. The label prefix `table:` suggests it should be in a `table` environment. As written, any `\ref{table:concertEighteen}` will resolve to the enclosing section number rather than a table number. Consider wrapping in a `table` environment or removing/renaming the label if unused.

### A4. Notation Inconsistencies
None found.

### A5. Reference / Label Issues
None found. (The `\label{table:concertEighteen}` issue is covered in A3 above.)

## Task B: Mathematical Correctness

### B1. Definitions
None found.

### B2. Theorem Statements
None found.

### B3. Proof Steps
None found.

### B4. Formulas and Symbolic Expressions
- **Line ~83**: "``$A$ unless~$B$'' may translate to $A \lor B$" — Verified correct. "$A$ unless $B$" means "if B is not true then A is true", i.e., $\lnot B \limplies A$, which is equivalent to $A \lor B$. The text also states this can translate to $(\lnot A) \limplies B$, which is also equivalent to $A \lor B$. The specific example on lines 78–79 ("The grass is not wet unless it is raining" with $A = \lnot w$ and $B = r$) gives $(\lnot w) \lor r$, which checks out: $\lnot r \limplies \lnot w \equiv w \limplies r \equiv (\lnot w) \lor r$. All correct.
- **Line ~87**: "``If $A$, then~$B$'' means the same thing in propositional logic as $(\lnot A) \lor B$." — Verified correct: $A \limplies B \equiv \lnot A \lor B$ is a standard equivalence.
- **Line ~192**: [Uncertain] The text uses $\forall x$ quantifier notation ($\forall x (P(x)\limplies O(x))$) in a chapter about propositional logic where quantifiers have not yet been formally introduced. This is likely an intentional pedagogical choice — an informal motivating example appealing to the reader's mathematical intuition before first-order logic is covered in a later chapter. Probably fine, but worth noting.

### B5. Examples and Counterexamples
- **Lines ~128–141 (Figure 1, truth table for connectives)**: Verified all 16 entries in the truth table for $\lnot$, $\lor$, $\land$, $\limplies$, and $\liff$:
  - $\lnot$: $\lnot\True = \False$, $\lnot\False = \True$. Correct.
  - $\True \lor \True = \True$, $\True \lor \False = \True$, $\False \lor \True = \True$, $\False \lor \False = \False$. Correct.
  - $\True \land \True = \True$, $\True \land \False = \False$, $\False \land \True = \False$, $\False \land \False = \False$. Correct.
  - $\True \limplies \True = \True$, $\True \limplies \False = \False$, $\False \limplies \True = \True$, $\False \limplies \False = \True$. Correct.
  - $\True \liff \True = \True$, $\True \liff \False = \False$, $\False \liff \True = \False$, $\False \liff \False = \True$. Correct.
- **Lines ~208–212 (Figure 2, $P(x) \limplies O(x)$ table)**: Verified all 3 rows:
  - $x=1$: $P(1)=\False$ (1 is not a prime greater than 2), $O(1)=\True$ (1 is odd), $\False \limplies \True = \True$. Correct.
  - $x=2$: $P(2)=\False$ (2 is not a prime greater than 2), $O(2)=\False$ (2 is even), $\False \limplies \False = \True$. Correct.
  - $x=3$: $P(3)=\True$ (3 is a prime greater than 2), $O(3)=\True$ (3 is odd), $\True \limplies \True = \True$. Correct.

## Summary

- **Typos/Grammar/LaTeX issues found**: 4 (A1.1, A2.1, A3.1, A3.2)
- **Mathematical issues found**: 0 (B4.3 is an uncertain observation about a pedagogical choice, not an error)
- **Confidence**: High — This is an introductory section with no proofs or complex definitions. The main content is motivational examples and truth tables, all of which were verified. The chapter context index was sufficient to check notation consistency.
