# Chapter 1 Context Index: Propositional Logic: Syntax and Semantics

## Notation

- `\lnot` — logical negation ("not")
- `\land` — conjunction ("and")
- `\lor` — disjunction ("or")
- `\limplies` — implication ("if ... then ..."), i.e., →
- `\liff` — equivalence / biconditional ("if and only if"), i.e., ↔
- `\True` — the Boolean value "True" (T)
- `\False` — the Boolean value "False" (F)
- `\vDash` — double turnstile; `\vDash A` means A is a tautology; `\Gamma \vDash A` means Γ tautologically implies A
- `\nvDash` — negation of `\vDash`; `\Gamma \nvDash A` means Γ does not tautologically imply A
- `\tautEq` — tautological equivalence; `A \tautEq B` means A and B are tautologically equivalent
- `\oplus` — parity / exclusive or (xor) connective
- `|` — nand (Sheffer stroke); `A | B` equals `\lnot(A \land B)`
- `\downarrow` — nor connective; `A \downarrow B` equals `\lnot(A \lor B)`
- `\top` — nullary connective with truth value True
- `\perp` — nullary connective with truth value False
- `\TCase` — 3-ary "if-then-else" connective; `\TCase(A, B, C)` means "if A then B else C"
- `\TMaj^k` — k-ary majority connective; true when ≥ k/2 of the arguments are true
- `\PL` — the Hilbert-style proof system for propositional logic (defined in Chapter 2)
- `\bigand` — "big and" notation for iterated conjunction
- `\bigor` — "big or" notation for iterated disjunction
- `A(B/p)` — result of substituting formula B for every occurrence of variable p in formula A
- `A(B_1,...,B_k/p_{i_1},...,p_{i_k})` — parallel substitution of B_j for p_{i_j} in A
- `f_A` — the Boolean function represented by formula A (Definition \ref{def:defineBooleanFunction})
- `\Ptime` — polynomial time complexity class (P)
- `\NP` — nondeterministic polynomial time complexity class

## Definitions (in order of appearance)

1. [sec1] **Negation (¬)** — "not" operator; true when operand is false (inline, informal)
2. [sec1] **Conjunction (∧)** — "and" operator; true when both operands are true (inline, informal)
3. [sec1] **Disjunction (∨)** — "or" operator (inclusive or); true when at least one operand is true (inline, informal)
4. [sec1] **Implication (→)** — "if...then..." operator; false only when antecedent is true and consequent is false (inline, informal)
5. [sec1] **Equivalence (↔)** — "if and only if" operator; true when both operands have the same truth value (inline, informal)
6. [sec1] **Truth functional** — connectives whose values depend solely on the truth values of their arguments (inline)
7. [sec2] **Propositional formula** \label{def:propositionalFmla} — inductively defined: (a) each p_i is a formula; (b) if A is a formula then ¬A is a formula; (c) if A, B are formulas then (A∨B), (A∧B), (A→B), (A↔B) are formulas
8. [sec2] **Unique readability** — the property that every propositional formula can be uniquely parsed into one of the forms of Definition \ref{def:propositionalFmla} (inline)
9. [sec2] **Precedence of connectives** — ¬ highest, then ∧ and ∨, then → and ↔ lowest; same-precedence associates right to left (inline)
10. [sec3] **Truth assignment** \label{def:truthAssignment} — a mapping φ : {p_1, p_2, ...} → {T, F} from propositional variables to truth values
11. [sec3] **Definition of Truth for Propositional Formulas** \label{def:truthProp} — recursive extension of a truth assignment to all formulas via the semantics of each connective
12. [sec3] **Truth table** — a table listing all possible truth assignments and the resulting truth values of a formula (inline, informal)
13. [sec3] **Tautology** — a formula true under all truth assignments (inline, informal; formalized in sec4)
14. [sec3] **Satisfiable** — a formula for which there exists at least one truth assignment making it true (inline, informal; formalized in sec4)
15. [sec4] **Tautology / tautologically valid** — A is a tautology iff φ(A) = T for all truth assignments φ (formal, in unnamed definition block)
16. [sec4] **Satisfiable (formula)** — A is satisfiable iff there exists φ with φ(A) = T; φ is a satisfying assignment; if no such φ exists, A is unsatisfiable (formal, in unnamed definition block)
17. [sec4] **Satisfiable (set of formulas)** \label{def:satisfiableProp} — Γ is satisfiable iff there exists φ with φ(A) = T for every A ∈ Γ
18. [sec4] **Tautological implication** \label{def:vDash} — (a) A ⊨ B iff every φ satisfying A also satisfies B; (b) Γ ⊨ B iff every φ satisfying Γ also satisfies B; ⊨ A means A is a tautology
19. [sec4] **Tautologically equivalent** — A ≡_t B iff both A ⊨ B and B ⊨ A, i.e., φ(A) = φ(B) for all φ (unnamed definition block)
20. [sec5] **Partial truth assignment** — an assignment of truth values to some subset of variables appearing in a formula (inline)
21. [sec5] **Compact truth table** — a truth table where subformula values are written below their principal connective rather than in separate columns (inline)
22. [sec5] **Reduced truth table** — a truth table with fewer than 2^k lines, using partial truth assignments that cover all possible full assignments (inline)
23. [sec5] **Decision tree (binary)** — a tree procedure querying variable truth values one at a time, branching on T/F, with leaves giving formula's value (inline)
24. [sec6] **Substitution instance** — a formula obtained by substituting formulas for variables in an axiom (inline)
25. [sec7] **Boolean function** \label{def:BooleanFunction} — a k-ary function f : {T,F}^k → {T,F}
26. [sec7] **Represents (a Boolean function)** \label{def:defineBooleanFunction} — formula A represents k-ary Boolean function f_A where f_A(x_1,...,x_k) = φ(A) with φ(p_i) = x_i
27. [sec7] **Literal** \label{def:literalProp} — a formula of the form p_i or ¬p_i
28. [sec7] **Disjunction** — a formula A_1 ∨ A_2 ∨ ... ∨ A_k (with arbitrary parenthesization); each A_i is a disjunct (inline)
29. [sec7] **Conjunction** — a formula B_1 ∧ B_2 ∧ ... ∧ B_k (with arbitrary parenthesization); each B_i is a conjunct (inline)
30. [sec7] **Conjunction of literals / DNF** \label{def:DNF} — a conjunction of literals is L_1 ∧ ... ∧ L_k; a DNF formula is C_1 ∨ ... ∨ C_ℓ where each C_i is a conjunction of literals
31. [sec7] **Clause / CNF** \label{def:clauseAndCNF} — a clause is a disjunction of literals L_1 ∨ ... ∨ L_k; a CNF formula is C_1 ∧ ... ∧ C_ℓ where each C_i is a clause
32. [sec8] **Language (propositional)** — a set L of propositional connectives (inline)
33. [sec8] **L-formula** \label{def:LformulaProp} — a propositional formula using only connectives from language L
34. [sec8] **Adequate (language)** \label{def:adequate} — a language L is adequate if every Boolean function is represented by some L-formula
35. [sec8] **Parity connective (⊕)** — A ⊕ B is true iff exactly one of A, B is true; also called "exclusive or" / xor (inline)
36. [sec8] **Nand / Sheffer stroke (|)** — A | B has truth value ¬(A ∧ B) (inline)
37. [sec8] **Nor (↓)** — A ↓ B has truth value ¬(A ∨ B) (exercises)
38. [sec8] **Nullary connectives ⊤, ⊥** — φ(⊤) = T and φ(⊥) = F; 0-ary connectives (inline)
39. [sec8] **TCase (if-then-else)** — 3-ary connective: TCase(A,B,C) = φ(B) if φ(A)=T, else φ(C) (inline)
40. [sec8] **Majority connective (Maj^k)** — k-ary connective true when ≥ k/2 arguments are true (inline)
41. [sec10] **Propositional substitution** \label{def:substitutionProp} — A(B_1,...,B_k/p_{i_1},...,p_{i_k}) is defined recursively: replace each p_{i_j} with B_j, recurse through ¬ and binary connectives
42. [sec10] **Instance (of a formula)** \label{def:instanceProp} — any formula of the form A(B/p_i)
43. [sec10] **p_ℓ-variant** — a truth assignment φ' that agrees with φ on all variables except possibly p_ℓ (inline)
44. [sec11] **Feasible algorithm** — an algorithm efficient enough to be carried out in practice (inline, informal)
45. [sec11] **Effective algorithm** — an algorithm that can be computed by a specific procedure and gives the correct answer (inline, informal)

## Theorems, Lemmas, Corollaries (in order of appearance)

1. [sec4] **Theorem** \label{thm:subsetGammaDelta} — If Γ ⊆ Δ, then: (1) any φ satisfying Δ satisfies Γ; (2) if Δ is satisfiable then Γ is satisfiable; (3) if Γ ⊨ A then Δ ⊨ A
2. [sec4] **Theorem** \label{thm:AandNotA} — (a) A, ¬A ⊨ B for any A, B; (b) if Γ is unsatisfiable, then Γ ⊨ B for any B
3. [sec4] **Theorem (Semantic Deduction Theorem)** \label{thm:deductionSemanticProp} — (a) A ⊨ B iff ⊨ A → B; (b) Γ, A ⊨ B iff Γ ⊨ A → B
4. [sec4] **Theorem** (unnamed) — If Γ = {A_1,...,A_k} is finite, then Γ ⊨ B iff A_1 ∧ ... ∧ A_k ⊨ B
5. [sec4] **Theorem** \label{thm:pqrEquivPqr} — A ≡_t B if and only if ⊨ A ↔ B
6. [sec4] **Theorem** \label{thm:dualSatTaut} — A is a tautology iff ¬A is not satisfiable
7. [sec4] **Theorem** \label{thm:ContradictionSemantic} — Γ ⊨ A iff Γ ∪ {¬A} is unsatisfiable
8. [sec7] **Theorem (Adequacy of ¬, ∨, ∧, →, ↔)** \label{thm:adequateStd} — every k-ary Boolean function is represented by some propositional formula
9. [sec7] **Theorem (Adequacy of DNF Formulas)** \label{thm:adequateStdDNF} — every k-ary Boolean function is represented by some DNF formula
10. [sec7] **Theorem (Adequacy of CNF Formulas)** \label{thm:adequateStdCNF} — every k-ary Boolean function is represented by some CNF formula
11. [sec7] **Corollary** \label{coro:DNFCNF} — any propositional formula is tautologically equivalent to some DNF formula and to some CNF formula
12. [sec8] **Theorem** \label{thm:adequateRecap} — {¬, ∨, ∧, →, ↔} and {¬, ∨, ∧} are both adequate
13. [sec8] **Theorem** \label{thm:adequateRecapBis} — {¬, ∨} and {¬, ∧} are both adequate
14. [sec8] **Theorem** \label{thm:notImpliesAdequate} — {¬, →} is adequate
15. [sec8] **Theorem** \label{thm:notAdequate2} — (a) {¬} is not adequate; (b) {∧, ∨} is not adequate
16. [sec8] **Theorem** \label{thm:nandAdequate} — {|} (nand alone) is adequate
17. [sec8] **Theorem** \label{thm:topLimplies} — {⊥, →} is adequate
18. [sec9] **Theorem** \label{thm:varsDependOnProp} — if φ and φ' agree on all variables in A, then φ(A) = φ'(A)
19. [sec9] **Theorem** \label{thm:equalParens} — any formula has equal numbers of open and close parentheses
20. [sec9] **Theorem** \label{thm:moreOpensCloses} — if A starts with '(' and B is a nonempty proper initial subexpression of A, then B has more open than close parentheses (hence B is not a formula)
21. [sec9] **Theorem** \label{thm:numVars} — if A has m occurrences of binary connectives and n occurrences of variables, then n = m + 1
22. [sec10] **Theorem** \label{thm:substituteProp1} — if φ(B) = φ(C), then φ(A(B/p_i)) = φ(A(C/p_i))
23. [sec10] **Corollary** \label{coro:substituteTaut} — if B ≡_t C, then A(B/p_i) ≡_t A(C/p_i)
24. [sec10] **Theorem** \label{thm:substituteProp2} — if B ≡_t C, then B(A/p_i) ≡_t C(A/p_i)
25. [sec10] **Corollary** \label{coro:instanceTaut} — (a) any instance of a tautology is a tautology; (b) if A ⊨ B then A(C/p_i) ⊨ B(C/p_i); (c) if A_1,...,A_k ⊨ B then A_1(C/p_i),...,A_k(C/p_i) ⊨ B(C/p_i)

## Key Conventions

- Uppercase Roman letters (A, B, C, D, E) denote propositional formulas
- Uppercase Greek letters (Γ, Δ) denote sets of propositional formulas
- Lowercase Roman letters (p, q, r) are used informally for propositional variables; formally, variables are p_1, p_2, p_3, ...
- φ (lowercase phi) denotes a truth assignment
- "Formula" in Chapter 1 means {¬, ∨, ∧, →, ↔}-formula (Chapter 2 will use a different convention)
- Parentheses may be informally omitted following precedence rules: ¬ > ∧,∨ > →,↔; right-to-left association for same-precedence
- Notation liberties: "A, B ⊨ C" for "{A,B} ⊨ C"; "Γ, A ⊨ B" for "Γ ∪ {A} ⊨ B"; "⊨ A" for "∅ ⊨ A"
- Modus Ponens is written as an inference rule with A and A → B above the line and B below
- L_{i,j} denotes a literal (p_j or ¬p_j) determined by truth assignment φ_i
- C_i denotes a conjunction of literals corresponding to truth assignment φ_i (in proof of adequacy)

## Cross-Chapter References

- References Chapter 2 (Propositional Logic: Proofs): proof system PL (Definition \ref{def:PLproof}), axioms of PL, Modus Ponens as sole inference rule, derived rules (Corollaries \ref{coro:HypSyl} and \ref{coro:modustollens}), Deduction Theorem (Section \ref{sec:propDeductionThm}), proof by contradiction (Theorems \ref{thm:proofbyContra1} and \ref{thm:proofbyContra2})
- References Chapter 5 (Algorithms, Informally): informal definition of algorithms (Section \ref{sec:AlgorithmInformal})
- References forward to Section \ref{sec:booleanFunctions} (within Ch1) for adequate sets of connectives
- References forward to Section \ref{sec:proofsByInduction} (within Ch1) for proof by induction examples
