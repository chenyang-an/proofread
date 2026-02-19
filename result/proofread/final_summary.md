# Proofread Summary

**Date:** 2026-02-19
**Sections Processed:** 21

---

## Overall Statistics

| Category | Count |
|----------|-------|
| Typos / Spelling | 22 |
| Grammar / Style | 18 |
| LaTeX Issues | 17 |
| Notation Inconsistencies | 6 |
| Reference / Label Issues | 9 |
| Definition Issues | 1 |
| Theorem Statement Issues | 3 |
| Proof Step Issues | 12 |
| Formula Issues | 6 |
| Example / Counterexample Issues | 3 |
| **Total** | **97** |

---

## Per-Chapter Summary

### Chapter 1: Propositional Logic

**Sections:** sec1 (Introduction), sec2 (Propositional Formulas), sec3 (Definition of Truth), sec4 (Satisfiability, Tautologies, Implication), sec5 (Truth Tables), sec6 (Tautologies and Equivalences), sec7 (Boolean Functions, DNF, CNF), sec8 (Propositional Languages), sec9 (Proofs by Induction), sec10 (Propositional Substitution), sec11 (Algorithms), exercises
**Total Issues:** 55 (Task A: 44, Task B: 11)

#### Key Findings
- **sec7 (Boolean Functions, DNF, CNF)** has the highest density of issues (15 total), including wrong theorem references (`thm:ContradictionSemantic` cited instead of `thm:adequateStd`), a wrong equation label (`eq:nliffDNF` instead of `eq:liffDNF`), a wrong subscript in a proof step (line ~183), and a formula error in a figure caption (`\lor` instead of `\land` at line ~460).
- **sec4 (Satisfiability)** contains a mathematical error: the all-False assignment is missing from the enumeration of satisfying assignments for Γ' in Example GammaSat2 (line ~144).
- **ch1_exercises** has 11 issues including duplicate item labels (line ~323–324), a "3-ary binary connective" terminology contradiction (line ~375), and misspelled label names (`exer:mirrow`, `table:concertEighteen` vs. `exer:convertEighteen`).
- **sec5 (Truth Tables)** has a caption formula that uses `\limplies` where `\liff` is needed (line ~271), changing the meaning of the stated formula.
- **sec6** misspells "Peirce" as "Pierce" (line ~82) — a recurring error also found in ch2_exercises.

#### Recurring Patterns
- "if and only if" phrase frequently broken: missing second "if" in sec4 (line ~187), sec10 (line ~233 "iff and only if"), and ch2 sections
- Misspelling of "Peirce" as "Pierce" appears in sec6 (line ~82) and ch2_exercises (line ~144)
- Double spaces in source appear in sec1 (line ~7) and sec8 (line ~212)
- `\label` naming inconsistencies: `table:concertEighteen` vs. `exer:convertEighteen` (exercises), `exer:mirrow` for "mirror"

---

### Chapter 2: Propositional Proofs

**Sections:** sec1 (Introduction), sec2 (The Proof System PL), sec3 (Deduction Theorem), sec4 (Consistency and Proof by Contradiction), sec5 (Constructing PL-Proofs), sec6 (Soundness and Completeness), sec7 (Proof of Completeness Theorem), sec8 (Compactness Theorem), exercises
**Total Issues:** 42 (Task A: 29, Task B: 13)

#### Key Findings
- **sec7 (Proof of Completeness Theorem)** has the most critical errors: systematic use of `Γ` where `Π` is required in lines ~144, ~145, and ~151–152, and `Γ` instead of `Γ_i` in the inductive definition at line ~45. These errors could mislead readers about the proof's correctness.
- **sec2 (The Proof System PL)** has missing brackets in PL2 axiom instances (lines ~142, ~153) that could cause scope ambiguity.
- **sec3 (Deduction Theorem)** contains a typo `C` instead of `A` in the statement of the induction hypothesis (line ~48), and the PL2 bracket issue persists (line ~54).
- **sec4 (Consistency)** cites "PL3" where "PL4" is the correct axiom in two places (lines ~19–21).
- **ch2_exercises** has a theorem label mismatch: "Soundness Theorem" is referenced with `\ref{thm:completePL}` (the Completeness Theorem label) at line ~183–184.

#### Recurring Patterns
- Missing brackets/parentheses in PL2 axiom instances: sec2 (lines ~142, ~153), sec3 (line ~54) — at least 3 occurrences across 2 sections
- "if and only if" broken: sec7 (line ~88), sec8 (line ~17)
- Wrong variable/symbol in proof text: sec3 (`C` for `A`, line ~48), sec6 (`A` for `A_i`, line ~110), sec7 (`Γ` for `Π`, lines ~144–152)
- Missing words ("us", "as", "a", "if") scattered across multiple sections

---

## Cross-Chapter Patterns

- **"if and only if" broken in 5 locations across both chapters**: ch1_sec4 (line ~187), ch1_sec10 (line ~233), ch2_sec4 (line ~233), ch2_sec7 (line ~88), ch2_sec8 (line ~17). This appears to be a systematic authorial tendency.
- **Misspelling "Pierce" for "Peirce"** in ch1_sec6 (line ~82) and ch2_exercises (line ~144). Should be corrected globally.
- **Missing parentheses/brackets in PL2 axiom instances** across ch2_sec2, ch2_sec3. The PL2 axiom is stated with explicit brackets in its definition, but instances in proofs consistently omit the outer brackets on the consequent, creating potential scope ambiguity.
- **Variable confusion in proof steps**: wrong subscripts or variables appear in ch1_sec8 (`p_1` for `p_i`, line ~111), ch1_sec9 (`p_1` for `p_i`, line ~24), ch2_sec3 (`C` for `A`, line ~48), ch2_sec6 (`A` for `A_i`, line ~110), ch2_sec7 (`Γ` for `Π` or `Γ_i`, lines ~45, ~144–152).
- **`\hbox` vs. `\text` usage** noted in ch1_sec3 — minor LaTeX modernization point.

## High-Priority Issues

| # | Chapter | Section | Line | Category | Description |
|---|---------|---------|------|----------|-------------|
| 1 | 2 | sec7 | ~45 | Proof Step | `Γ` should be `Γ_i` in inductive definition of Γ_{i+1}; checking consistency against wrong set |
| 2 | 2 | sec7 | ~144–152 | Proof Step | Systematic `Γ` vs. `Π` error — 4 occurrences in Completeness proof; `Π` is the correct set throughout |
| 3 | 1 | sec4 | ~144 | Example | Missing all-False satisfying assignment for Γ' = {p_i → p_{i+1}} — claim "these are the only" is wrong |
| 4 | 1 | sec7 | ~183 | Proof Step | Wrong subscript `L_{i',j}` should be `L_{i,j}` in DNF adequacy proof |
| 5 | 1 | sec7 | ~204 | Reference | Wrong theorem cited: `thm:ContradictionSemantic` should be `thm:adequateStd` |
| 6 | 2 | sec4 | ~19–21 | Proof Step | "PL3 axiom" should be "PL4 axiom" — wrong axiom cited twice |
| 7 | 2 | sec6 | ~110 | Proof Step | `A ∈ Γ` should be `A_i ∈ Γ` in Soundness proof base case |
| 8 | 2 | sec3 | ~48 | Proof Step | Typo `C` instead of `A` in induction hypothesis of Deduction Theorem proof |
| 9 | 1 | sec5 | ~271 | Formula | Caption uses `\limplies` instead of `\liff` — changes the formula's meaning |
| 10 | 1 | sec7 | ~460 | Formula | Caption writes `\lnot q \lor p` where `\lnot q \land p` is correct |
| 11 | 1 | sec7 | ~397 | Reference | Wrong equation label `eq:nliffDNF` should be `eq:liffDNF` |
| 12 | 2 | exercises | ~183 | Reference | "Soundness Theorem" referenced with Completeness Theorem label `thm:completePL` |
| 13 | 1 | sec4 | ~181 | Formula | Variable `C` should be `B` in notational definition of `Γ, A ⊨ B` |
| 14 | 1 | sec8 | ~59 | LaTeX | Mismatched delimiters: opens with `(` but closes with `\}` |
| 15 | 1 | sec8 | ~111 | Proof Step | `p_1` should be `p_i` (same variable confusion as sec9 line ~24) |

## Low-Priority / Uncertain Issues

**Pedagogical choices (likely intentional):**
- ch1_sec1 (line ~192): Quantifier notation `∀x` used before formal introduction in a motivating example
- ch1_sec3 (lines ~24–56): Missing explicit base case in recursive definition of φ — implicit from preamble
- ch2_sec2 (line ~122): `⊃` vs. `⊇` convention for superset — author should clarify intent
- ch2_sec3 (lines ~33–34): Strong induction presented without explicit base case — standard textbook style

**Minor LaTeX/style issues:**
- ch1_sec3 (line ~32): `\hbox` used instead of modern `\text` in math mode
- ch1_sec11 (line ~10): Inconsistent indexing commands (`\emph` + `\index` vs. `\idxnm`)
- ch1_exercises (line ~249): Deprecated `{\em both}` vs. `\emph{both}`
- ch1_exercises (line ~321): Fragile spacing hack `~~\`
- ch2_sec2 (line ~21): `% XXX` TODO marker left in source
- ch1_sec1 (line ~7): Double space in source (collapsed by LaTeX but unclean in source)

**Uncertain complexity claim:**
- ch1_sec11 (line ~29): "tautology checking is hard for NP" — strictly, TAUT is co-NP-complete, not NP-hard

**Uncertain cross-references (could not verify from individual files):**
- ch1_sec2 (line ~141): `\ref{sec:proofsByInduction}` — label not in context index
- ch2_sec5 (line ~26): `\ref{exer:altProfCompletePL}` — "Prof" looks like typo for "Proof"
- ch2_exercises (line ~90): `\ref{example:implyAorB}` — unverifiable locally
- ch2_exercises (line ~177): `\pageref{eq:lastOrAxiom}` — forward reference, unverifiable locally

---

## Recommendations

1. **Fix variable/symbol errors in proofs immediately.** The `Γ` vs. `Π` confusion in ch2_sec7 (Completeness proof) and the `Γ` vs. `Γ_i` error are the most serious issues — they affect the correctness of central proofs and could confuse students trying to follow the arguments.

2. **Add consistent brackets to PL2 axiom instances.** The PL2 schema is stated with explicit brackets, but every instance in proofs omits them. Establish a convention (either always bracket or never bracket) and apply it uniformly across ch2_sec2, ch2_sec3, and any other sections referencing PL2.

3. **Global search-and-replace for recurring errors:** "Pierce" → "Peirce" (2 occurrences); fix all 5 broken "if and only if" phrases; fix all `p_1`/`p_i` subscript confusions.

4. **Audit all `\ref` and `\label` commands.** Several wrong theorem/equation references were found (sec7 `thm:ContradictionSemantic` for `thm:adequateStd`, sec7 `eq:nliffDNF` for `eq:liffDNF`, exercises `thm:completePL` for `thm:soundPL`). A systematic check of all cross-references would catch any remaining mismatches.

5. **Review the ch1_sec4 Example GammaSat2.** The missing all-False satisfying assignment is a genuine mathematical error in a worked example that students will rely on. Either add the all-False case to the enumeration or revise the claim about uniqueness.
