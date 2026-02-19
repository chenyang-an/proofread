# Proofread: ch1_sec6

## Section Title
Examples of Tautologies and Tautological Equivalences

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
- **Line ~82**: "Pierce's Law" → "Peirce's Law" — The law is named after logician Charles Sanders **Peirce** (P-E-I-R-C-E). "Pierce" is a common misspelling of his surname. Note: the chapter context index also has this as "Pierce's Law", so the error is consistent throughout and likely originates in the context index / earlier section.

### A2. Grammar / Style
- **Line ~87**: "The following three tautological implications can be used to define $\lor$, $\land$ and~$\liff$" → "The following three tautological **equivalences** can be used to define $\lor$, $\land$ and~$\liff$" — The paragraph heading correctly says "Tautological equivalences" and the formulas on lines 94–96 all use `\tautEq` (tautological equivalence). The body text incorrectly calls them "tautological implications."

### A3. LaTeX Issues
- **Line ~86**: The paragraph heading uses `$\leftrightarrow$` directly: `\paragraph*{Tautological equivalences defining $\lor$, $\land$ and $\leftrightarrow$.}`. The chapter convention uses the macro `\liff` for the biconditional connective (and this is used consistently elsewhere in the section, e.g., lines 19, 20, 21, 38, 41, 96). — Suggested fix: change `$\leftrightarrow$` to `$\liff$` for consistency.

### A4. Notation Inconsistencies
- **Line ~86**: Same as A3 above. `$\leftrightarrow$` is used where `$\liff$` is the chapter convention for the biconditional.

### A5. Reference / Label Issues
- **Line ~9**: `\ref{chap:PropProofs}` — Cross-chapter reference to Chapter 2. Cannot verify the label exists from this section alone, but naming convention is consistent with the context index. Not flagged as an error.
- **Line ~91**: `\ref{sec:booleanFunctions}` — Forward reference to Section 7 (or 8) of the same chapter. Context index confirms Boolean functions are covered in sec7/sec8. Naming convention appears consistent.
- **Line ~111**: `\ref{def:PLproof}` — Cross-chapter reference to Definition in Chapter 2. Context index confirms this reference exists.
- **Line ~139**: `\ref{coro:HypSyl}` and `\ref{coro:modustollens}` — Cross-chapter references to Corollaries in Chapter 2. Context index confirms these references.
- No broken or suspicious references found.

## Task B: Mathematical Correctness

### B1. Definitions
None found. This section does not introduce new definitions; it lists examples of tautologies and equivalences.

### B2. Theorem Statements
None found. This section contains no formal theorems.

### B3. Proof Steps
None found. This section contains no formal proofs.

### B4. Formulas and Symbolic Expressions

All tautologies and tautological equivalences were verified:

**Simple tautologies (lines 16–21):** All correct.
- Line 16: $p \lor \lnot p$ (Excluded Middle) ✓
- Line 17: $\lnot(p \land \lnot p)$ (Noncontradiction) ✓
- Line 18: $p \to p$ (Self-Implication) ✓
- Line 19: $p \leftrightarrow p$ (Self-Equivalence) ✓
- Line 20: $\lnot\lnot p \leftrightarrow p$ (Double Negation) ✓
- Line 21: $(\lnot p \to p) \leftrightarrow p$ — Verified: φ(p)=T gives T↔T=T; φ(p)=F gives F↔F=T. ✓

**Simple tautological equivalences (lines 32–45):** All correct.
- Lines 32–33: De Morgan's Laws ✓
- Lines 34–35: Idempotency of ∨ and ∧ ✓
- Lines 36–38: Commutativity of ∧, ∨, ↔ ✓
- Lines 39–41: Associativity of ∧, ∨, ↔ ✓
- Lines 42–43: Distributivity of ∧ over ∨ and ∨ over ∧ ✓
- Line 44: Contrapositive ✓
- Line 45: Exportation ✓

**Axioms (lines 68–82):** All correct as tautologies.
- Line 68: $p \to (q \to p)$ — Standard K axiom ✓
- Line 69: $(p \to q \to r) \to (p \to q) \to (p \to r)$ — Standard S axiom ✓
- Line 70: $\lnot p \to (p \to q)$ — Ex falso quodlibet ✓
- Line 71: $(\lnot p \to p) \to p$ — Consequentia mirabilis ✓
- Line 72: $(p \to q) \to (p \to \lnot q) \to \lnot p$ ✓
- Lines 73–74: Conjunction elimination ($p \land q \to p$ and $p \land q \to q$) ✓
- Line 75: $p \to q \to p \land q$ — Conjunction introduction ✓
- Lines 76–77: Disjunction introduction ($p \to p \lor q$ and $q \to p \lor q$) ✓
- Lines 78–79: $(p \to r) \to (q \to r) \to (p \lor q \to r)$ — Disjunction elimination ✓
- Line 80: $(p \to q) \to (r \lor p) \to (r \lor q)$ — Principle of Summation. Verified: assume p→q=T and r∨p=T; if r=T then r∨q=T; if r=F then p=T (from r∨p), so q=T (from p→q), so r∨q=T. ✓
- Line 82: $((p \to q) \to p) \to p$ — Peirce's Law ✓

**Equivalences defining ∨, ∧, ↔ (lines 94–96):** All correct.
- Line 94: $p \lor q \equiv \lnot p \to q$ ✓
- Line 95: $p \land q \equiv \lnot(p \to \lnot q)$ ✓
- Line 96: $p \leftrightarrow q \equiv (p \to q) \land (q \to p)$ ✓

**Tautological implications (lines 106–108):** All correct.
- Line 106: $p, p \to q \vDash q$ (Modus Ponens) ✓
- Line 107: $\lnot q, p \to q \vDash \lnot p$ (Modus Tollens) ✓
- Line 108: $p \to q, q \to r \vDash p \to r$ (Hypothetical Syllogism) ✓

**Proof trees (lines 114–134):** All correct; match the tautological implications stated above.

### B5. Examples and Counterexamples
None found. This section is a list of named tautologies and equivalences without worked examples.

## Summary

- **Typos/Grammar/LaTeX issues found**: 3 (misspelling "Pierce" for "Peirce" at line 82; "tautological implications" should be "tautological equivalences" at line 87; `\leftrightarrow` used instead of `\liff` at line 86)
- **Mathematical issues found**: 0
- **Confidence**: High — This section is a catalogue of standard named tautologies, tautological equivalences, axioms, and inference rules. All formulas were verified against their standard definitions. The chapter context index provided sufficient information for all notation and cross-reference checks.
