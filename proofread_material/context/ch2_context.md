# Chapter 2 Context Index: Propositional Logic: Proofs

## Notation

- `\PL` — the Hilbert-style proof system PL for propositional logic
- `\vdash` — single turnstile; denotes provability (e.g., `Γ ⊢ A` means A is provable from Γ)
- `\vDash` — double turnstile; denotes tautological validity/implication (from Chapter 1)
- `\limplies` — logical implication connective (→)
- `\lnot` — logical negation (¬)
- `\lor` — logical disjunction (∨); abbreviation for ¬A → B
- `\land` — logical conjunction (∧); abbreviation for ¬(A → ¬B)
- `\liff` — logical biconditional (↔); abbreviation for (A → B) ∧ (B → A)
- `\True` — truth value True
- `\False` — truth value False
- `Γ, A ⊢ B` — shorthand for Γ ∪ {A} ⊢ B
- `B₁, …, Bₖ ⊢ A` — shorthand for {B₁, …, Bₖ} ⊢ A

## Definitions (in order of appearance)

1. [sec1] **Modus Ponens** — inference rule: from A and A → B, infer B
2. [sec1] **Metamathematics** — the use of mathematical tools (especially mathematical logic) to study the formalization of mathematics itself
3. [sec1] **Soundness** (informal) — a formula A should have a proof only if it is a tautology; if A can be proved from Γ, then Γ ⊨ A should hold
4. [sec1] **Completeness** (informal) — any tautology A should have a proof; if Γ ⊨ A holds, then there should be a proof of A from Γ
5. [sec1] **User-friendly / Human-centric** — desirable property that a proof system simulates human reasoning efficiently and is understandable
6. [sec1] **Expression** — a string of symbols; proofs are expressions with specified syntactic properties
7. [sec2] **PL axioms** — four axiom schemes: PL1: A → (B → A); PL2: [A → (B → C)] → [(A → B) → (A → C)]; PL3: ¬A → (A → B); PL4: (¬A → A) → A
8. [sec2] **Hilbert-style proof system** — a proof system using axiom schemes and Modus Ponens as the sole inference rule
9. [sec2] **{¬, →}-formulas** — PL uses only negation and implication; other connectives are abbreviations
10. [sec2] **PL-proof of A** — a sequence of {¬, →}-formulas A₁, …, Aₗ where Aₗ = A and each Aᵢ is either a PL-axiom or inferred by Modus Ponens from two earlier formulas
11. [sec2] **PL-proof of A from hypotheses Γ** \label{def:PLproof} — a sequence A₁, …, Aₗ where Aₗ = A and each Aᵢ is a PL-axiom, a member of Γ, or inferred by Modus Ponens from two earlier formulas
12. [sec2] **PL-derivation** — synonym for PL-proof
13. [sec2] **Theorem** — a formula A such that ⊢ A (has a PL-proof with no hypotheses)
14. [sec2] **Theorem of Γ** — a formula A such that Γ ⊢ A
15. [sec2] **Substitution (closure under)** — replacing a variable pᵢ by a formula B throughout; notation A(B/pᵢ)
16. [sec3] **Derived rule of inference** — an inference rule that is admissible in PL-proofs because it can be simulated by multiple PL steps (sometimes called "admissible rule")
17. [sec3] **Hypothetical Syllogism** — derived rule: from A → B and B → C, infer A → C
18. [sec4] **Inconsistent** \label{def:consistent} — a set Γ of formulas is inconsistent if for some formula A, both Γ ⊢ A and Γ ⊢ ¬A
19. [sec4] **Consistent** \label{def:consistent} — a set Γ is consistent if it is not inconsistent
20. [sec4] **Proof by contradiction** — to prove Γ ⊢ A, it suffices to show Γ ∪ {¬A} is inconsistent
21. [sec4] **Modus Tollens** — derived rule: from A → B and ¬B, infer ¬A
22. [sec4] **Proof-by-cases** — to prove Γ ⊢ B, it suffices to prove Γ, A ⊢ B and Γ, ¬A ⊢ B
23. [sec6] **Sound** — property of PL: every PL-theorem is a tautology; if Γ ⊢ A then Γ ⊨ A
24. [sec6] **Complete** (for PL) — property of PL: every tautology has a PL-proof; if Γ ⊨ A then Γ ⊢ A
25. [sec6] **Tautological Implication (TAUT)** — derived rule: if A₁, …, Aₖ ⊨ B, then from A₁, …, Aₖ one may infer B
26. [sec7] **Complete (set of formulas)** \label{def:completePL} — a set Γ is complete if for every formula A, either A ∈ Γ or ¬A ∈ Γ
27. [sec8] **Finitely satisfiable** — a set Γ is finitely satisfiable if every finite subset of Γ is satisfiable
28. [exercises] **Complementary (sets)** — two sets Γ and Δ are complementary if every truth assignment satisfies exactly one of them

## Theorems, Lemmas, Corollaries (in order of appearance)

1. [sec2] **Theorem** \label{thm:subsetHypsProp} — (a) If Γ ⊢ A and Γ′ ⊃ Γ, then Γ′ ⊢ A. (b) If Γ ⊢ A, then some finite Γ₀ ⊆ Γ satisfies Γ₀ ⊢ A.
2. [sec2] **Theorem** \label{thm:PLclosedsubst} — The set of PL-theorems is closed under substitution: if ⊢ A then ⊢ A(B/pᵢ).
3. [sec3] **Theorem (Deduction Theorem)** \label{thm:deduction} — Γ, A ⊢ B if and only if Γ ⊢ A → B.
4. [sec3] **Theorem (Hypothetical Syllogism)** \label{thm:HypSyl} — ⊢ (A → B) → ((B → C) → (A → C)).
5. [sec3] **Corollary** \label{coro:HypSyl} — If Γ ⊨ A → B and Γ ⊨ B → C, then Γ ⊨ A → C.
6. [sec4] **Theorem** \label{thm:consisSubset} — If Γ is consistent and Π ⊆ Γ, then Π is consistent.
7. [sec4] **Theorem** \label{thm:consistency} — Γ is inconsistent if and only if Γ ⊢ B for every formula B.
8. [sec4] **Corollary** \label{coro:consistency} — For any formulas A and B, A, ¬A ⊢ B.
9. [sec4] **Theorem** \label{thm:finiteConsistEasy} — If Γ is inconsistent, then some finite subset Γ₀ ⊆ Γ is inconsistent.
10. [sec4] **Theorem (Proof by Contradiction, First Version)** \label{thm:proofbyContra1} — Γ ⊢ A iff Γ ∪ {¬A} is inconsistent.
11. [sec4] **Corollary** \label{coro:notnotAimpliesA} — ⊢ ¬¬A → A.
12. [sec4] **Theorem (Proof by Contradiction, Second Version)** \label{thm:proofbyContra2} — Γ ⊢ ¬A iff Γ ∪ {A} is inconsistent.
13. [sec4] **Corollary** \label{coro:AimpliesnotnotA} — ⊢ A → ¬¬A.
14. [sec4] **Theorem (Modus Tollens)** \label{thm:modustollens} — ⊢ (A → B) → (¬B → ¬A).
15. [sec4] **Corollary** \label{coro:modustollens} — If Γ ⊢ A → B and Γ ⊢ ¬B, then Γ ⊢ ¬A.
16. [sec4] **Theorem (Proof by Cases)** \label{thm:byCases} — If Γ ⊢ A → B and Γ ⊢ ¬A → B, then Γ ⊢ B.
17. [sec4] **Corollary** \label{coro:byCases} — If Γ, A ⊢ B and Γ, ¬A ⊢ B, then Γ ⊢ B.
18. [sec4] **Theorem** \label{thm:extendConsis} — Γ is inconsistent iff both Γ ∪ {A} and Γ ∪ {¬A} are inconsistent.
19. [sec4] **Corollary** \label{coro:extendConsis} — If Γ is consistent, then at least one of Γ ∪ {A} and Γ ∪ {¬A} is consistent.
20. [sec4] **Theorem** \label{thm:casesAimpliesB} — (a) Γ, (A → B) ⊢ C iff both Γ, ¬A ⊢ C and Γ, B ⊢ C. (b) Γ ∪ {A → B} is inconsistent iff both Γ ∪ {¬A} and Γ ∪ {B} are inconsistent.
21. [sec6] **Theorem (Soundness Theorem for PL)** \label{thm:soundPL} — (a) If Γ is satisfiable, then Γ is consistent. (b) If Γ ⊢ A, then Γ ⊨ A.
22. [sec6] **Theorem (Completeness Theorem for PL)** \label{thm:completePL} — (a) If Γ is consistent, then Γ is satisfiable. (b) If Γ ⊨ A, then Γ ⊢ A.
23. [sec7] **Theorem (Lindenbaum's Theorem)** \label{thm:lindenbaumPL} — If Γ is consistent, then there exists a consistent, complete set Π ⊇ Γ.
24. [sec7] **Lemma** \label{lem:completePLconds} — If Π is complete and consistent: (a) A ∈ Π iff ¬A ∉ Π; (b) (A → B) ∈ Π iff A ∉ Π or B ∈ Π.
25. [sec7] **Lemma** \label{lem:completePL} — If Π is complete and consistent, then Π is satisfiable.
26. [sec8] **Theorem (Compactness Theorem)** \label{thm:compactnessPL} — (a) Γ is satisfiable iff Γ is finitely satisfiable. (b) Γ ⊨ A iff some finite Γ₀ ⊆ Γ satisfies Γ₀ ⊨ A.

## Key Conventions

- Uppercase Greek letters (Γ, Δ, Π) denote sets of formulas
- Uppercase Roman letters (A, B, C, D) denote {¬, →}-formulas
- All formulas in Chapter 2 are assumed to be {¬, →}-formulas; ∨, ∧, ↔ are abbreviations
- `Γ, A ⊢ B` is shorthand for `Γ ∪ {A} ⊢ B`; set braces are omitted for finite sets of hypotheses
- Γ may be infinite, but any single PL-proof uses only finitely many hypotheses from Γ
- Square brackets in PL2 are ordinary parentheses used for readability
- "STS" is used informally for "it suffices to show"
- "⇔" (Leftrightarrow) is used in proof chains to mean "if and only if"

## Cross-Chapter References

- References Chapter 1: Theorem \ref{thm:deductionSemanticProp} (semantic deduction: Γ ⊨ A → B iff Γ, A ⊨ B)
- References Chapter 1: Theorem \ref{thm:AandNotA}(a) (A, ¬A ⊨ B — semantic analogue of Corollary \ref{coro:consistency})
- References Chapter 1: Theorem \ref{thm:ContradictionSemantic} (Γ ∪ {¬A} unsatisfiable iff Γ ⊨ A)
- References Chapter 1: truth assignments, tautologies, satisfiability, unsatisfiability, tautological implication (⊨)
- References Chapter 1: propositional formulas, propositional variables, connectives
- References Chapter 1: Exercise \ref{exer:byCasesSemantic} (semantic version of proof by cases)
- Forward reference to Section \ref{sec:compactPL} (Compactness Theorem) from Section 4
- Forward reference to first-order logic giving a more meaningful treatment of metamathematics (sec1)
- Exercises reference page \pageref{eq:lastOrAxiom} (last axiom for ∨, from a later chapter or appendix)
