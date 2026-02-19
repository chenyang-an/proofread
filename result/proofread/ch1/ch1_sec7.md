# Proofread: ch1_sec7

## Section Title
Boolean Functions and DNF and CNF

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
- **Line ~48**: "if $x$ equal $\True$" → "if $x$ equals $\True$" — Line 47 uses "equals" but line 48 uses "equal"; should be consistent (verb "equals" to match singular subject "$x$").
- **Line ~88**: "this gives a well-definition of~$f_A$" → "this gives a well-defined $f_A$" (or rephrase to "this shows that $f_A$ is well-defined") — "well-definition" is not standard English; the intended meaning is that $f_A$ is well-defined.
- **Line ~174**: "the indicated conjunction (and) of the formulas $L_{i,1}$ though $L_{i,k}$" → "through $L_{i,k}$" — "though" is a typo for "through".
- **Line ~356**: "the Boolean functon presented by $p_1 \liff p_2$" — Two errors on this line: (1) "functon" → "function" (missing letter "i"); (2) "presented" → "represented" — the technical term defined in Definition \ref{def:defineBooleanFunction} (line 85) and used consistently throughout the section is "represents," not "presents."

### A2. Grammar / Style
- **Line ~149**: "$x_1,\ldots, x_k \in \{T,F\}$" — The rest of the section and chapter consistently uses `\True` and `\False` for Boolean values. This should be `\{\True,\False\}` for consistency.
- **Line ~196–198**: "By inspection, $A$~represents the function~$f$: this is because the $C_{i_m}$'s and their associated truth assignments~$\varphi_{i_m}$ enumerate the cases where~$f$ is true and because each $C_i$ is satisfied by a unique~$\varphi_i$." — Long sentence conflating two justifications. Consider splitting into two sentences for clarity. (Borderline style issue — flag for author review.)
- **Line ~204**: "Theorem~\ref{thm:ContradictionSemantic} showed that every function can be represented by a formula..." — Wrong theorem reference. `thm:ContradictionSemantic` is "Γ⊨A iff Γ∪{¬A} is unsatisfiable" (per the context index). The theorem that showed every Boolean function can be represented is `thm:adequateStd`, just proved above. Should be `Theorem~\ref{thm:adequateStd}`.
- **Line ~283**: "If $f$~is the constant $\False$ function, and then $p_1 \land \lnot p_1$" → "If $f$~is the constant $\False$ function, then $p_1 \land \lnot p_1$" — Extraneous "and" before "then".

### A3. LaTeX Issues
- **Line ~149**: `\{T,F\}` should be `\{\True,\False\}` — Uses plain letters T and F rather than the `\True`/`\False` macros used everywhere else in the chapter. (Same underlying issue as A2.1, flagged here as a LaTeX macro inconsistency.)
- **Line ~299**: `\begin{proof}(Sketch)` — The "(Sketch)" annotation is outside the proof environment's optional argument. Should be `\begin{proof}[Proof (Sketch)]` or `\begin{proof}[Sketch]` for proper LaTeX formatting. As written, "(Sketch)" will appear as body text immediately after "Proof." rather than being part of the proof header.
- **Line ~397**: `DNF formula (\ref{eq:nliffDNF})` — Wrong equation reference. The formula shown on this line is $(p_1 \land p_2) \lor (\lnot p_1 \land \lnot p_2)$, which is equation `eq:liffDNF` (lines 362–363). The label `eq:nliffDNF` (lines 370–371) points to $(\lnot p_1 \land p_2) \lor (p_1 \land \lnot p_2)$, which is a different formula. Should be `(\ref{eq:liffDNF})`.

### A4. Notation Inconsistencies
- The use of `\rightarrow` in the definition of Boolean function (line 38, `f: \{\True, \False\}^k \rightarrow \{\True, \False\}`) is acceptable — this is a function arrow, not the logical implication connective `\limplies`. No issue.

None found beyond items already noted.

### A5. Reference / Label Issues
- **Line ~204**: `Theorem~\ref{thm:ContradictionSemantic}` — Wrong theorem. Per the context index, `thm:ContradictionSemantic` states "Γ⊨A iff Γ∪{¬A} is unsatisfiable." The text attributes to it the claim that every function can be represented by a formula using only ¬, ∨, ∧. This is the content of `thm:adequateStd`. Should be `\ref{thm:adequateStd}`. (Same issue as A2.3.)
- **Line ~397**: `(\ref{eq:nliffDNF})` — Wrong equation label. The formula displayed is eq:liffDNF, not eq:nliffDNF. Should be `(\ref{eq:liffDNF})`. (Same issue as A3.3.)

## Task B: Mathematical Correctness

### B1. Definitions
None found. All definitions (Boolean function, represents, literal, conjunction of literals, DNF, clause, CNF, disjunction, conjunction) are well-formed, non-circular, and consistent with the chapter context index.

### B2. Theorem Statements
None found. The adequacy theorems (Theorems \ref{thm:adequateStd}, \ref{thm:adequateStdDNF}, \ref{thm:adequateStdCNF}) and Corollary \ref{coro:DNFCNF} are correctly stated and match standard results.

### B3. Proof Steps
- **Line ~183**: "$\varphi_{i^\prime}(L_{i^\prime, j})=\False$ for at least one~$j$" — Wrong subscript on $L$. The goal is to show $\varphi_{i'}(C_i) = \False$, which requires showing $\varphi_{i'}(L_{i,j}) = \False$ for some $j$ (a literal from $C_i$, which is built from $L_{i,j}$'s). The text writes $L_{i',j}$, which is a literal from $C_{i'}$, not from $C_i$. Should be $\varphi_{i^\prime}(L_{i, j})=\False$.
- **Line ~204**: "Theorem~\ref{thm:ContradictionSemantic} showed that every function can be represented..." — Wrong theorem reference, as noted in A2.3 and A5.1. The mathematical claim is attributed to the wrong theorem.

### B4. Formulas and Symbolic Expressions
- **Line ~194**: "$A = \bigor_{m=1}^\ell C_m := C_{i_1} \lor C_{i_2} \lor \cdots \lor C_{i_\ell}$" — Notational inconsistency: the left-hand side of the `:=` uses $C_m$ (indexed by $m$ from 1 to $\ell$), suggesting the formulas are $C_1, C_2, \ldots, C_\ell$. But the right-hand side expansion uses $C_{i_1}, C_{i_2}, \ldots, C_{i_\ell}$ where $i_m \in \mathcal{I}$. The big-or should be $\bigor_{m=1}^\ell C_{i_m}$ to match the expansion.

### B5. Examples and Counterexamples
- **Line ~116**: The claim that $f = f_{p_2 \limplies p_1}$ is verified correct. $p_2 \to p_1$ is True when $p_2$ is False or $p_1$ is True, matching $f$'s definition ($x_1 = \True$ or $x_2 = \False$). No issue.
- **Line ~397**: The distributive-law derivation begins with "DNF formula (\ref{eq:nliffDNF})" but the formula shown is $(p_1 \land p_2) \lor (\lnot p_1 \land \lnot p_2)$, which is eq:liffDNF (lines 362–363), not eq:nliffDNF (lines 370–371). The derivation itself is mathematically correct; only the equation label annotation is wrong. (Same as A3.3/A5.2.)
- **Line ~460**: The figure caption states the formula is tautologically equivalent to "$r \lor ( \lnot r \land \lnot q \lor p)$". From the decision tree (lines 441–454) and truth table (lines 431–434): $r = \True$ → True; $r = \False, q = \True$ → False; $r = \False, q = \False, p = \True$ → True; $r = \False, q = \False, p = \False$ → False. The DNF from the True-leaves is $r \lor (\lnot r \land \lnot q \land p)$. The caption writes `$\lnot q \lor p$` (with $\lor$) where it should be `$\lnot q \land p$` (with $\land$). The `\lor` should be `\land`.

## Summary

- **Typos/Grammar/LaTeX issues found**: 11 (A1: 4, A2: 4, A3: 3; A5 entries are duplicates of A2/A3 entries)
- **Mathematical issues found**: 4 (B3: 2, B4: 1, B5: 1; B3.2 and B5.2 are duplicates of Task A entries)
- **Confidence**: High — The section covers standard material on Boolean functions, DNF, and CNF. The chapter context index provided sufficient information to verify all definitions, theorem statements, cross-references, and examples.
