# Chapter 1 Context Index: Propositional Logic: Syntax and Semantics

## Notation

- `\lnot` — logical negation ("not")
- `\land` — conjunction ("and")
- `\lor` — disjunction ("or")
- `\limplies` — implication ("if … then …", →)
- `\liff` — biconditional / equivalence ("if and only if", ↔)
- `\True` — the Boolean value "True"
- `\False` — the Boolean value "False"
- `\vDash` — double turnstile; `\vDash A` means A is a tautology; `Γ \vDash A` means Γ tautologically implies A
- `\nvDash` — negation of `\vDash`; `Γ \nvDash A` means Γ does not tautologically imply A
- `\tautEq` — tautological equivalence; `A \tautEq B` means A and B are tautologically equivalent
- `\oplus` — parity / exclusive-or connective ("xor")
- `|` — nand (Sheffer stroke); `A | B` has truth value of `\lnot(A \land B)`
- `\downarrow` — nor connective; `A \downarrow B` has truth value of `\lnot(A \lor B)`
- `\top` — nullary connective with truth value True
- `\perp` — nullary connective with truth value False
- `\TCase(A, B, C)` — 3-ary "if-then-else" connective; value is φ(B) if φ(A)=True, else φ(C)
- `\TMaj^k` — k-ary majority connective; true when ≥ k/2 of arguments are true
- `\PL` — the Hilbert-style proof system for propositional logic (defined in Chapter 2)
- `\bigand` — "big and" notation for iterated conjunction
- `\bigor` — "big or" notation for iterated disjunction
- `\Ptime` — polynomial time complexity class (P)
- `\NP` — nondeterministic polynomial time complexity class
- `A(B/p)` — result of substituting formula B for every occurrence of variable p in formula A
- `A(B₁,…,Bₖ/p_{i₁},…,p_{iₖ})` — parallel substitution of Bⱼ for p_{iⱼ} in A
- `f_A` — the Boolean function represented by formula A (Definition \ref{def:defineBooleanFunction})

## Definitions (in order of appearance)

1. [sec1] **Negation (¬)** — "not" operator; true when operand is false
2. [sec1] **Conjunction (∧)** — "and" operator; true when both operands are true
3. [sec1] **Disjunction (∨)** — "or" operator (inclusive or); true when at least one operand is true
4. [sec1] **Implication (→)** — "if … then …" operator; false only when antecedent is true and consequent is false
5. [sec1] **Equivalence (↔)** — "if and only if" operator; true when both operands have the same truth value
6. [sec1] **Truth functional** — connective values determined solely by truth values of arguments
7. [sec2] **Propositional formula** \label{def:propositionalFmla} — inductively defined: (a) pᵢ is a formula; (b) if A is a formula then ¬A is; (c) if A,B are formulas then (A∧B), (A∨B), (A→B), (A↔B) are formulas
8. [sec2] **Precedence of connectives** — ¬ highest, then ∧ and ∨, then → and ↔ lowest; same-precedence associates right to left
9. [sec2] **Unique readability** — every propositional formula can be uniquely parsed into one of the forms pᵢ, ¬A, or (A∘B)
10. [sec3] **Truth assignment** \label{def:truthAssignment} — a mapping φ: {p₁,p₂,…} → {True, False}
11. [sec3] **Definition of truth for propositional formulas** \label{def:truthProp} — recursive extension of a truth assignment to all formulas via the connective truth tables
12. [sec3] **Truth table** — tabulation of all possible truth assignments and the resulting formula values
13. [sec3] **Tautology** (informal, in example) — a formula true under all truth assignments
14. [sec3] **Satisfiable** (informal, in example) — a formula true under some truth assignment
15. [sec4] **Tautology / tautologically valid** (formal) — A is a tautology if φ(A)=True for all truth assignments φ
16. [sec4] **Satisfiable (formula)** — there exists some φ with φ(A)=True
17. [sec4] **Satisfying assignment** — a truth assignment φ such that φ(A)=True
18. [sec4] **Unsatisfiable** — no satisfying assignment exists
19. [sec4] **Satisfiable (set of formulas)** \label{def:satisfiableProp} — a set Γ is satisfiable if some φ makes every formula in Γ true
20. [sec4] **Tautological implication** \label{def:vDash} — A⊨B means every satisfying assignment of A also satisfies B; Γ⊨B means every satisfying assignment of Γ also satisfies B
21. [sec4] **Tautologically equivalent** — A≡B iff both A⊨B and B⊨A, equivalently φ(A)=φ(B) for all φ
22. [sec5] **Partial truth assignment** — an assignment of truth values to some subset of the propositional variables appearing in a formula
23. [sec5] **Decision tree (binary)** — a procedure querying variable truth values one at a time, branching on True/False, until the formula value is determined at a leaf
24. [sec7] **Boolean function** \label{def:BooleanFunction} — a k-ary mapping f: {True,False}^k → {True,False}
25. [sec7] **Represents (a Boolean function)** \label{def:defineBooleanFunction} — formula A represents f_A if f_A(x₁,…,xₖ) = φ(A) where φ(pᵢ)=xᵢ
26. [sec7] **Literal** \label{def:literalProp} — a formula of the form pᵢ or ¬pᵢ
27. [sec7] **Conjunction of literals** — L₁∧L₂∧…∧Lₖ where each Lᵢ is a literal
28. [sec7] **Disjunctive Normal Form (DNF)** \label{def:DNF} — a disjunction of conjunctions of literals
29. [sec7] **Clause** \label{def:clauseAndCNF} — a disjunction of literals L₁∨L₂∨…∨Lₖ
30. [sec7] **Conjunctive Normal Form (CNF)** \label{def:clauseAndCNF} — a conjunction of clauses
31. [sec7] **Disjunction** — a formula A₁∨A₂∨…∨Aₖ; each Aᵢ is a disjunct
32. [sec7] **Conjunction** — a formula B₁∧B₂∧…∧Bₖ; each Bᵢ is a conjunct
33. [sec8] **Language (propositional)** — a set L of propositional connectives
34. [sec8] **L-formula** \label{def:LformulaProp} — a propositional formula using only connectives from L
35. [sec8] **Adequate** \label{def:adequate} — a language L is adequate if every Boolean function is represented by some L-formula
36. [sec8] **Parity connective (⊕)** — A⊕B is true iff exactly one of A, B is true; equivalently addition mod 2
37. [sec8] **Exclusive or (xor)** — synonym for parity connective ⊕
38. [sec8] **Nand / Sheffer stroke (|)** — A|B has truth value ¬(A∧B)
39. [sec8] **Nor (↓)** — A↓B has truth value ¬(A∨B) (defined in exercises)
40. [sec8] **Nullary connectives ⊤ and ⊥** — 0-ary connectives with φ(⊤)=True and φ(⊥)=False
41. [sec8] **TCase (if-then-else connective)** — 3-ary connective: TCase(A,B,C) = φ(B) if φ(A)=True, else φ(C)
42. [sec8] **Majority connective (Maj^k)** — k-ary connective true when ≥k/2 of arguments are true
43. [sec10] **Substitution (propositional)** \label{def:substitutionProp} — A(B₁,…,Bₖ/p_{i₁},…,p_{iₖ}) is the result of simultaneously replacing each p_{iⱼ} in A with Bⱼ, defined recursively
44. [sec10] **Instance** \label{def:instanceProp} — any formula of the form A(B/pᵢ) is an instance of A
45. [sec10] **Variant (p_ℓ-variant)** — truth assignment φ' agreeing with φ on all variables except possibly p_ℓ
46. [sec11] **Feasible algorithm** — an algorithm efficient enough to be carried out in practice
47. [sec11] **Effective algorithm** — an algorithm that can be computed by a specific procedure and gives the correct answer

## Theorems, Lemmas, Corollaries (in order of appearance)

1. [sec4] **Theorem** \label{thm:subsetGammaDelta} — If Γ⊆Δ: (1) φ satisfies Δ implies φ satisfies Γ; (2) Δ satisfiable implies Γ satisfiable; (3) Γ⊨A implies Δ⊨A
2. [sec4] **Theorem** \label{thm:AandNotA} — (a) A, ¬A ⊨ B for any B; (b) if Γ is unsatisfiable then Γ⊨B for any B
3. [sec4] **Theorem (Semantic Deduction Theorem)** \label{thm:deductionSemanticProp} — (a) A⊨B iff ⊨A→B; (b) Γ,A⊨B iff Γ⊨A→B
4. [sec4] **Theorem** (unnamed) — If Γ={A₁,…,Aₖ} is finite, then Γ⊨B iff A₁∧…∧Aₖ⊨B
5. [sec4] **Theorem** \label{thm:pqrEquivPqr} — A≡B iff ⊨A↔B
6. [sec4] **Theorem (Duality: satisfiability vs. validity)** \label{thm:dualSatTaut} — A is a tautology iff ¬A is not satisfiable
7. [sec4] **Theorem** \label{thm:ContradictionSemantic} — Γ⊨A iff Γ∪{¬A} is unsatisfiable
8. [sec7] **Theorem (Adequacy of ¬,∨,∧,→,↔)** \label{thm:adequateStd} — Every k-ary Boolean function is represented by some propositional formula
9. [sec7] **Theorem (Adequacy of DNF)** \label{thm:adequateStdDNF} — Every Boolean function is represented by some DNF formula
10. [sec7] **Theorem (Adequacy of CNF)** \label{thm:adequateStdCNF} — Every Boolean function is represented by some CNF formula
11. [sec7] **Corollary** \label{coro:DNFCNF} — Any propositional formula is tautologically equivalent to some DNF formula and to some CNF formula
12. [sec8] **Theorem** \label{thm:adequateRecap} — {¬,∨,∧,→,↔} and {¬,∨,∧} are both adequate
13. [sec8] **Theorem** \label{thm:adequateRecapBis} — {¬,∨} and {¬,∧} are both adequate
14. [sec8] **Theorem** \label{thm:notImpliesAdequate} — {¬,→} is adequate
15. [sec8] **Theorem** \label{thm:notAdequate2} — (a) {¬} is not adequate; (b) {∧,∨} is not adequate
16. [sec8] **Theorem** \label{thm:nandAdequate} — {|} (nand alone) is adequate
17. [sec8] **Theorem** \label{thm:topLimplies} — {⊥,→} is adequate
18. [sec9] **Theorem** \label{thm:varsDependOnProp} — Truth of a formula depends only on the truth values of variables appearing in it
19. [sec9] **Theorem** \label{thm:equalParens} — In any formula, the number of open parentheses equals the number of close parentheses
20. [sec9] **Theorem** \label{thm:moreOpensCloses} — If A starts with '(', any nonempty proper initial subexpression of A has more open than close parentheses, hence is not a formula
21. [sec9] **Theorem** \label{thm:numVars} — If a formula has m binary connective occurrences and n variable occurrences, then n=m+1
22. [sec10] **Theorem** \label{thm:substituteProp1} — If φ(B)=φ(C), then φ(A(B/pᵢ))=φ(A(C/pᵢ))
23. [sec10] **Corollary** \label{coro:substituteTaut} — If B≡C then A(B/pᵢ)≡A(C/pᵢ)
24. [sec10] **Theorem** \label{thm:substituteProp2} — If B≡C then B(A/pᵢ)≡C(A/pᵢ)
25. [sec10] **Corollary** \label{coro:instanceTaut} — (a) Any instance of a tautology is a tautology; (b) if A⊨B then A(C/pᵢ)⊨B(C/pᵢ); (c) if A₁,…,Aₖ⊨B then A₁(C/pᵢ),…,Aₖ(C/pᵢ)⊨B(C/pᵢ)

## Key Conventions

- Propositional variables are formally p₁, p₂, p₃, …; informally also p, q, r, …
- Uppercase Roman letters (A, B, C, D, E) denote propositional formulas
- Uppercase Greek letters (Γ, Δ) denote sets of propositional formulas
- φ (lowercase Greek phi) denotes a truth assignment
- Parentheses are part of the formal syntax; informally omitted following precedence rules
- `Γ, A ⊨ B` is shorthand for `Γ ∪ {A} ⊨ B`; `A, B ⊨ C` is shorthand for `{A, B} ⊨ C`
- `⊨ A` (with nothing left of ⊨) means A is a tautology (i.e., ∅ ⊨ A)
- Right-to-left association is used when parentheses are omitted among same-precedence connectives
- The "double turnstile" ⊨ is a semantic notion (truth under all assignments), not a syntactic proof relation
- `L_{i,j}` stands for "literal" in the proof of adequacy of DNF

## Named Tautologies and Equivalences (Section 6)

- [sec6] Law of the Excluded Middle: p ∨ ¬p
- [sec6] Noncontradiction: ¬(p ∧ ¬p)
- [sec6] Double Negation: ¬¬p ↔ p
- [sec6] De Morgan's Laws: ¬(p∨q) ≡ (¬p∧¬q); ¬(p∧q) ≡ (¬p∨¬q)
- [sec6] Idempotency: p∨p ≡ p; p∧p ≡ p
- [sec6] Commutativity of ∧, ∨, ↔
- [sec6] Associativity of ∧, ∨, ↔
- [sec6] Distributivity: ∧ over ∨ and ∨ over ∧
- [sec6] Contrapositive: p→q ≡ ¬q→¬p
- [sec6] Exportation: p→(q→r) ≡ (p∧q)→r
- [sec6] Definitions of ∨, ∧, ↔ in terms of ¬ and →: p∨q ≡ ¬p→q; p∧q ≡ ¬(p→¬q); p↔q ≡ (p→q)∧(q→p)
- [sec6] Modus Ponens: p, p→q ⊨ q
- [sec6] Modus Tollens: ¬q, p→q ⊨ ¬p
- [sec6] Hypothetical Syllogism: p→q, q→r ⊨ p→r
- [sec6] Pierce's Law: ((p→q)→p)→p
- [sec6] PL axioms listed: p→(q→p); (p→q→r)→(p→q)→(p→r); ¬p→(p→q); (¬p→p)→p

## Cross-Chapter References

- References Chapter 2 (Propositional Logic: Proofs): proof system PL, Definition \ref{def:PLproof}, Modus Ponens as sole inference rule, Hilbert-style axioms, derived rules (Corollaries \ref{coro:HypSyl} and \ref{coro:modustollens}), Deduction Theorem (Section \ref{sec:propDeductionThm}), proof by contradiction (Theorems \ref{thm:proofbyContra1} and \ref{thm:proofbyContra2})
- References Chapter 5 (Algorithms, Informally): Section \ref{sec:AlgorithmInformal} on informal definition of algorithms and feasibility
- Mentions complexity classes P and NP; notes the open question P =? NP in Section 11
