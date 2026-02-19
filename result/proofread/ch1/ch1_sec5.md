# Proofread: ch1_sec5

## Section Title
Truth Tables

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
None found.

### A2. Grammar / Style
- **Line ~52**: "Figure~\ref{fig:truthpOqpNq} and the left-hand side of Figure~\ref{fig:p1p2p1} gives two examples" → "give two examples" — Compound subject ("Figure X and the left-hand side of Figure Y") requires the plural verb "give", not the singular "gives".

### A3. LaTeX Issues
- **Line ~271**: Caption of `fig:decisionPqrEquivPqr` writes `$(p\limplies q \limplies r) \limplies (p \land q \limplies r)$`, using `\limplies` as the main connective. However, the formula $A$ defined at line 71 (`eq:pqrEquivPqr`) uses `\liff` as the main connective. — Suggested fix: change the caption formula to `$(p\limplies q \limplies r) \liff (p \land q \limplies r)$`.
- **Line ~293**: Parenthesis font mismatch. The expression `($\False \lor \False)$` has the opening parenthesis `(` in text mode while the closing `)` is inside math mode. All other similar expressions on lines 288–296 place both parentheses inside math mode, e.g., `$(\False \land B)$`, `$(\True \lor B)$`. This will cause a subtle font difference between the two parentheses in the rendered output. — Suggested fix: change `($\False \lor \False)$` to `$(\False \lor \False)$`.

### A4. Notation Inconsistencies
None found.

### A5. Reference / Label Issues
- **Line ~51**: `\ref{fig:truthpOqpNq}` and `\ref{fig:p1p2p1}` are cross-section references to figures presumably defined in earlier sections. Cannot verify these labels exist from this section alone. Label naming conventions are consistent with the chapter's style; flagged only as unverifiable locally.

## Task B: Mathematical Correctness

### B1. Definitions
- **Line ~198–200**: **Partial truth assignment** is defined as "an assignment of truth values to some subset of the propositional variables appearing in $A$." This matches context index item 22. Well-formed.
- **Line ~218–222**: **Decision tree (binary)** is defined informally as "a procedure that queries the truth values of variables one at a time." The text explicitly states "Rather than define this formally, we illustrate with an example." Matches context index item 23. Acceptable.

### B2. Theorem Statements
None found. This section contains no formal theorems.

### B3. Proof Steps
None found. This section contains no formal proofs.

### B4. Formulas and Symbolic Expressions
- **Line ~71**: Formula $(p \limplies q\limplies r) \liff ( p \land q \limplies r )$ is well-formed. By right-to-left association, $p \limplies q \limplies r$ parses as $p \limplies (q \limplies r)$. Since $\land$ has higher precedence than $\limplies$, $p \land q \limplies r$ parses as $(p \land q) \limplies r$. The main connective is $\liff$.
- **Line ~271**: Caption formula uses `\limplies` where it should use `\liff` as the main connective. Same finding as A3 above — this is a mathematical error that changes the stated formula from the biconditional (the tautology demonstrated by the truth tables) to a one-directional implication.
- **Lines ~287–291**: Truth value determination rule 1 (value True): $\lnot \False$, $(\True \lor B)$, $(B \lor \True)$, $(\True \land \True)$, $(\False \limplies B)$, $(B \limplies \True)$, $(\False \liff \False)$, $(\True \liff \True)$. All correct by the standard truth table definitions.
- **Lines ~292–296**: Truth value determination rule 2 (value False): $\lnot \True$, $(\False \lor \False)$, $(\False \land B)$, $(B \land \False)$, $(\True \limplies \False)$, $(\False \liff \True)$, $(\True \liff \False)$. All correct.
- **Lines ~287–301**: The rules are intentionally not exhaustive — e.g., $(\True \land B)$ simplifies to $B$ but is not listed since it doesn't determine a definite truth value without knowing $B$. The text at lines 298–301 explicitly handles this: "If, however, the truth value of $A$ does not get determined in this way, then further variables need to be queried." The design is correct.

### B5. Examples and Counterexamples
- **Lines ~86–93**: Compact truth table for $(p \limplies q\limplies r) \liff ( p \land q \limplies r )$. Verified all 8 rows:
  - Row 1 (T,T,T): left=$T\to(T\to T)=T$, right=$(T\land T)\to T=T$, $T\liff T=T$. ✓
  - Row 2 (T,T,F): left=$T\to(T\to F)=T\to F=F$, right=$(T\land T)\to F=F$, $F\liff F=T$. ✓
  - Row 3 (T,F,T): left=$T\to(F\to T)=T\to T=T$, right=$(T\land F)\to T=T$, $T\liff T=T$. ✓
  - Row 4 (T,F,F): left=$T\to(F\to F)=T\to T=T$, right=$(T\land F)\to F=T$, $T\liff T=T$. ✓
  - Row 5 (F,T,T): left=$F\to(T\to T)=T$, right=$(F\land T)\to T=T$, $T\liff T=T$. ✓
  - Row 6 (F,T,F): left=$F\to(T\to F)=F\to F=T$, right=$(F\land T)\to F=T$, $T\liff T=T$. ✓
  - Row 7 (F,F,T): left=$F\to(F\to T)=T$, right=$(F\land F)\to T=T$, $T\liff T=T$. ✓
  - Row 8 (F,F,F): left=$F\to(F\to F)=F\to T=T$, right=$(F\land F)\to F=T$, $T\liff T=T$. ✓
  - All rows yield True. Confirmed tautology.
- **Lines ~139–140**: Claim that Figure~\ref{fig:reducedPqrEquivPqr} has "half as many rows" as Figure~\ref{fig:pqrEquivPqr}. Reduced table has 4 rows, full table has 8 rows. 4 = 8/2. ✓
- **Lines ~151–154**: Reduced truth table (4 rows). Verified:
  - Row 1 (−,−,T): When $r=T$: $q\to r=T$, $p\to T=T$, anything$\to T=T$, so $T\liff T=T$. ✓
  - Row 2 (−,F,F): When $q=F,r=F$: $q\to r=F\to F=T$, $p\to T=T$, $p\land F=F$, $F\to F=T$, $T\liff T=T$. ✓
  - Row 3 (T,T,F): $q\to r=F$, $p\to F=F$, $p\land q=T$, $T\to F=F$, $F\liff F=T$. ✓
  - Row 4 (F,T,F): $q\to r=F$, $p\to F=F\to F=T$, $p\land q=F$, $F\to F=T$, $T\liff T=T$. ✓
  - Coverage: Row 1 covers 4 assignments ($r=T$); Row 2 covers 2 ($q=F,r=F$); Rows 3–4 cover 1 each ($q=T,r=F,p=T/F$). Total = 8 = $2^3$. ✓
- **Lines ~178–190**: Two reduced truth tables for $p\limplies q \limplies p\land q$ (i.e., $p \to (q \to (p \land q))$).
  - Left table (lines 178–180): Row 1 ($p=F$): $F\to(\ldots)=T$. ✓ Row 2 ($p=T,q=F$): $q\to(p\land q)=F\to F=T$, $p\to T=T$. ✓ Row 3 ($p=T,q=T$): $p\land q=T$, $q\to T=T$, $p\to T=T$. ✓ Coverage: 2+1+1=4. ✓
  - Right table (lines 187–189): Row 1 ($q=F$): $q\to(\ldots)=F\to(\ldots)=T$, $p\to T=T$. ✓ Row 2 ($p=F,q=T$): $F\to(\ldots)=T$. ✓ Row 3 ($p=T,q=T$): same as left row 3. ✓ Coverage: 2+1+1=4. ✓
- **Lines ~44–47**: Claim that a formula with more than about 100 variables would need more truth table lines than the age of the universe in nanoseconds. $2^{100} \approx 1.27 \times 10^{30} \gg 4\times 10^{26}$. Correct. ✓
- **Lines ~252–265**: Decision tree in `fig:decisionPqrEquivPqr`. Root queries $r$: if $T$, leaf $\varphi(A)=T$; if $F$, query $q$: if $F$, leaf $\varphi(A)=T$; if $T$, query $p$: both $T$ and $F$ yield leaf $\varphi(A)=T$. Four leaves correspond to the 4 rows of the reduced truth table (lines 151–154). All leaves labeled $\varphi(A)=\True$ confirms tautology. ✓

## Summary

- **Typos/Grammar/LaTeX issues found**: 3 (subject-verb agreement at line 52; caption connective error at line 271; parenthesis text/math mode mismatch at line 293)
- **Mathematical issues found**: 1 (caption formula uses $\limplies$ instead of $\liff$ — same as the LaTeX finding at line 271)
- **Confidence**: High — This section is primarily expository with truth tables, reduced truth tables, and decision trees. No formal proofs. All truth table entries were verified row by row, and the decision tree was checked against the reduced truth table. The chapter context index provided sufficient information for all checks.
