# Proofread: ch1_exercises

## Section Title
Exercises

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
- **Line ~60**: "Propoises have wings" → "Porpoises have wings" — Misspelling of "Porpoises" in the variable definition table. The correct spelling "porpoises" is used throughout Exercise 3 (lines 41–52).
- **Line ~83**: "The mirror will break only if is made of glass." → "The mirror will break only if **it** is made of glass." — Missing pronoun "it" in item (b) of the mirror exercise.
- **Line ~113**: "The coffee does not break unless it is made of glass." → "The coffee **pot** does not break unless it is made of glass." — Missing word "pot" in item (f). All other items in this exercise (lines 108–114) say "The coffee pot …".
- **Line ~412**: "the identify function" → "the identity function" — Misspelling of "identity".

### A2. Grammar / Style
None found.

### A3. LaTeX Issues
- **Line ~249**: `{\em both}` — Uses deprecated old-style LaTeX emphasis command. Modern LaTeX convention is `\emph{both}`. This still compiles correctly but is inconsistent with modern practice. (Very low severity.)
- **Line ~321**: `~~\` — Unusual spacing hack (two non-breaking spaces followed by a forced line break) at the start of the exercise. This compiles but is a fragile formatting approach. (Very low severity.)
- **Line ~323–324**: Duplicate item label `\item[(a)]`. Line 323 has `\item[(a)] Show that $\{ \oplus, \liff \}$ is not adequate.` and line 324 has `\item[(a)] Show that $\{ \lnot, \oplus, \liff \}$ is not adequate.` The second `\item[(a)]` should be `\item[(b)]`, and the current `\item[(b)]` on line 325 should be `\item[(c)]`.
- **Line ~375**: "Let $f$ be a new 3-ary binary connective" — The word "binary" contradicts "3-ary". A 3-ary connective takes three arguments, whereas "binary" means 2-ary. Should read "3-ary connective" (dropping "binary").

### A4. Notation Inconsistencies
None found.

### A5. Reference / Label Issues
- **Line ~28–30**: The exercise label is `\label{exer:convertEighteen}` (line 28, with "convert") but the page reference on line 30 is `\pageref{table:concertEighteen}` (with "concert"). The discrepancy between "convert" and "concert" is suspicious — one of these is likely a typo. If `table:concertEighteen` is not defined elsewhere with that exact spelling, this would produce a LaTeX warning or broken cross-reference. Even if both labels exist independently, the inconsistency strongly suggests a typo in one of them.
- **Line ~67**: `\label{exer:mirrow}` — The label uses "mirrow" which appears to be a misspelling of "mirror". This won't cause a LaTeX compilation error (labels are arbitrary strings), but it is inconsistent with the English word and could cause confusion if referenced elsewhere with the correct spelling "mirror".

## Task B: Mathematical Correctness

### B1. Definitions
None found.

### B2. Theorem Statements
None found.

### B3. Proof Steps
None found.

### B4. Formulas and Symbolic Expressions
- **Line ~154**: [Uncertain] $\Gamma_2 := \{ p_i\liff \lnot p_{i+2} : i\ge 1 \} \cup \{ p_i\liff \lnot p_{i+3} : i\ge 1 \}$. Verification: From the first set, $p_i$ and $p_{i+2}$ have opposite truth values for all $i \ge 1$. From the second set, $p_i$ and $p_{i+3}$ have opposite truth values for all $i \ge 1$. Combining: $p_1 \liff \lnot p_3$ and $p_1 \liff \lnot p_4$, so $p_3 \liff p_4$. But also $p_2 \liff \lnot p_4$ (first set, $i=2$) and $p_2 \liff \lnot p_5$ (second set, $i=2$). From $p_1 \liff \lnot p_3$ and $p_3 \liff \lnot p_5$ (first set, $i=3$), we get $p_1 \liff p_5$. Also $p_1 \liff \lnot p_4$ and $p_2 \liff \lnot p_4$ gives $p_1 \liff p_2$. Then from $p_1 \liff \lnot p_3$ (first set): odd-indexed variables all equivalent to $p_1$, even-indexed all equivalent to $p_1$ as well (since $p_1 \liff p_2$), but then $p_1 \liff \lnot p_3$ gives $p_1 \liff \lnot p_1$, a contradiction. So $\Gamma_2$ is unsatisfiable. The exercise asks to "state whether it is satisfiable or not", so this is well-posed as intended.
- **Line ~375**: "3-ary binary connective" — This is a mathematical terminology error (also flagged in A3). A connective cannot be both 3-ary and binary simultaneously. "Binary" means 2-ary. Should read "3-ary connective".

### B5. Examples and Counterexamples
- **Line ~247–250**: [Uncertain] The exercise asks whether there exists a formula using at least three variables that is in both CNF and DNF. Verification: Yes. For example, $p \land q \land r$ is a conjunction of single-literal clauses (hence CNF) and is also a single conjunction of literals (hence DNF with one disjunct). Similarly, $p \lor q \lor r$ is a single clause (hence CNF with one clause) and is a disjunction of single-literal conjunctions (hence DNF). The exercise is well-posed.
- **Line ~323**: [Uncertain] The exercise asks to show $\{ \oplus, \liff \}$ is not adequate. Verification: Both $\oplus$ and $\liff$ are affine/linear functions over GF(2). Compositions of affine functions remain affine. Since $p \land q$ is not affine, it cannot be represented by any $\{\oplus, \liff\}$-formula. The exercise is well-posed.
- **Line ~324**: [Uncertain] The exercise asks to show $\{ \lnot, \oplus, \liff \}$ is not adequate. Verification: Adding $\lnot$ preserves the affine class ($\lnot p = 1 \oplus p$ is affine). All $\{\lnot, \oplus, \liff\}$-formulas represent affine Boolean functions. Since $p \land q$ is not affine, this set is indeed not adequate. The exercise is well-posed.
- **Line ~341**: [Uncertain] The exercise asks to prove $\{ \TMaj^k \}$ is not adequate (for $k \ge 2$). Verification: $\TMaj^k$ is monotone (increasing inputs never decreases the output). Compositions of monotone functions are monotone. Since $\lnot p$ is not monotone, it cannot be represented. The exercise is well-posed.
- **Line ~344**: [Uncertain] The exercise asks to prove $\{ \lnot, \TMaj^k \}$ is not adequate when $k$ is odd. Verification: For odd $k$, $\TMaj^k$ is self-dual: $\TMaj^k(\lnot x_1, \ldots, \lnot x_k) = \lnot \TMaj^k(x_1, \ldots, x_k)$. Negation is also self-dual. Compositions of self-dual functions are self-dual. Since $p \land q$ is not self-dual (e.g., $T \land T = T$ but $\lnot(F \land F) = T \ne F$), it cannot be represented. The exercise is well-posed.

## Summary

- **Typos/Grammar/LaTeX issues found**: 10
- **Mathematical issues found**: 1 (the "3-ary binary" terminology error at line 375; the remaining B-section items are verification notes confirming exercises are well-posed)
- **Confidence**: High — The exercises section consists primarily of problem statements rather than proofs, so the main concerns are well-formedness of statements, correct notation, and typographical accuracy. The chapter context index provided sufficient information to check notation consistency and cross-references. The file has 477 lines and all line numbers have been verified against the actual source.
