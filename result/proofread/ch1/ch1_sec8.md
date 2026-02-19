# Proofread: ch1_sec8

## Section Title
Propositional Languages

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
None found.

### A2. Grammar / Style
- **Line ~212**: "Hence it is  tautologically equivalent to the CNF formula" — double space before "tautologically". Minor typographic issue.

### A3. LaTeX Issues
- **Line ~59**: `$\lnot ( \lnot C_1 \lor \cdots \lor \lnot C_k \}$` — mismatched delimiters: the expression opens with `(` but closes with `\}`. Should be `$\lnot ( \lnot C_1 \lor \cdots \lor \lnot C_k )$`. The `\}` here will render as a literal right brace in math mode rather than a closing parenthesis, producing a visually broken formula.

### A4. Notation Inconsistencies
None found.

### A5. Reference / Label Issues
None found.

## Task B: Mathematical Correctness

### B1. Definitions
None found.

### B2. Theorem Statements
None found.

### B3. Proof Steps
- **Line ~58–60**: In the proof of Theorem \ref{thm:adequateRecapBis}, the De Morgan step converts $C_1 \land C_2 \land \cdots \land C_k$ to $\lnot(\lnot C_1 \lor \cdots \lor \lnot C_k)$. The mathematical content is correct (De Morgan's law applied to a conjunction gives the negation of the disjunction of the negations), but the rendering is broken by the delimiter mismatch noted in A3 above. Aside from the delimiter issue, the proof logic is sound.
- **Line ~111**: `$\varphi(p_1) = \True$ for all~$i$` — the subscript should be $p_i$, not $p_1$. The intent is to define $\varphi$ so that $\varphi(p_i) = \True$ for all $i$, but as written it says $\varphi(p_1) = \True$ for all $i$, which is a single redundant statement about $p_1$. This is a typo: `p_1` should be `p_i`. (Note: line 107 correctly uses `\varphi(p_i) =\True` for the same claim.)
- **Line ~108–109**: [Uncertain] The statement "$f_{\lnot p_1} = \False$ when $\varphi(p_i) = \True$ for all $i$" is slightly informal. Strictly, $f_{\lnot p_1}$ is a Boolean function, so one would write $f_{\lnot p_1}(\True) = \False$. However, the context makes the intent clear (the all-True assignment gives $\False$ for $\lnot p_1$), and this may be acceptable shorthand in the author's style.

### B4. Formulas and Symbolic Expressions
- **Line ~59**: (Same as A3/B3 above) The formula `$\lnot ( \lnot C_1 \lor \cdots \lor \lnot C_k \}$` has mismatched delimiters, making it not well-formed as rendered. Should end with `)` not `\}`.

### B5. Examples and Counterexamples
None found.

## Summary

- **Typos/Grammar/LaTeX issues found**: 3
- **Mathematical issues found**: 2 (one definite typo in subscript at line ~111, one uncertain notational informality at line ~108–109)
- **Confidence**: High — this section is self-contained and deals with standard material on propositional language adequacy. The chapter context index provided sufficient information to verify all references, definitions, and proof steps.
