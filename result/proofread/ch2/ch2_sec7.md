# Proofread: ch2_sec7

## Section Title
Proof of the Completeness Theorem

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
- **Line ~88**: "if and only $\lnot A \notin \Pi$" → "if and only **if** $\lnot A \notin \Pi$" — missing word "if" in "if and only if"
- **Line ~135**: "The induction hypothesis tells that the claim holds for~$B$" → "The induction hypothesis tells **us** that the claim holds for~$B$" — missing word "us" (or alternatively: "states that", "says that")

### A2. Grammar / Style
- **Line ~19**: "The idea behind completeness, is that $\Gamma$ is ``maximal''" — spurious comma before "is"; should be "The idea behind completeness is that..."

### A3. LaTeX Issues
None found.

### A4. Notation Inconsistencies
- **Line ~144**: `$(B\limplies C) \in \Gamma$` — should be `$(B\limplies C) \in \Pi$`. The proof of Lemma \ref{lem:completePL} is about the set $\Pi$, but the second induction step switches to $\Gamma$ in three places (lines ~144, ~145). This is also a mathematical error (see B3).
- **Line ~145**: `$B\notin\Gamma$ or $C \in \Gamma$` — should be `$B\notin\Pi$ or $C \in \Pi$`. Same issue as above.
- **Line ~151**: `$\varphi(A)=\True$ for every $A\in \Gamma$` — This line is part of the proof of Lemma \ref{lem:completePL}, which establishes that $\Pi$ is satisfiable. The claim (line ~130) proves $\varphi(A) = \True$ iff $A \in \Pi$. Since $\Gamma \subseteq \Pi$ is not assumed in this lemma (Lemma \ref{lem:completePL} only assumes $\Pi$ is complete and consistent), the conclusion should say $\Pi$ is satisfiable, not $\Gamma$. The text "the set $\Gamma$~is satisfiable" should read "the set $\Pi$~is satisfiable".

### A5. Reference / Label Issues
None found.

## Task B: Mathematical Correctness

### B1. Definitions
None found.

### B2. Theorem Statements
None found.

### B3. Proof Steps
- **Line ~45**: In the inductive definition of $\Gamma_{i+1}$, the first case reads "if $\Gamma \cup\{A_i\}$ is consistent" — this should be "if $\Gamma_i \cup\{A_i\}$ is consistent". As written, the consistency check is against the original set $\Gamma$ rather than the current stage $\Gamma_i$. Since $\Gamma \subseteq \Gamma_i$, consistency of $\Gamma \cup \{A_i\}$ does not imply consistency of $\Gamma_i \cup \{A_i\}$. The proof of the claim at line ~62 invokes Corollary \ref{coro:extendConsis} on $\Gamma_i$, confirming that the intended condition is consistency of $\Gamma_i \cup \{A_i\}$.
- **Line ~53**: Claim part (a) states "$\Gamma_i \supseteq \Gamma_{i-1}$" for each $i$, but $\Gamma_{i-1}$ is undefined when $i = 0$. The claim should either start from $i \geq 1$ for the first conjunct, or be rephrased (e.g., "For each $i \geq 1$, $\Gamma_i \supseteq \Gamma_{i-1}$; and for each $i \geq 0$, $\Gamma_i \supseteq \Gamma$").
- **Line ~144–145**: The second induction step in the proof of Claim \ref{claim:completenessPL} (inside Lemma \ref{lem:completePL}) writes $\Gamma$ where it should write $\Pi$. The chain of equivalences reads "$(B \limplies C) \in \Gamma \Leftrightarrow B \notin \Gamma \text{ or } C \in \Gamma$", but it should read "$(B \limplies C) \in \Pi \Leftrightarrow B \notin \Pi \text{ or } C \in \Pi$" to correctly apply Lemma \ref{lem:completePLconds}(b) and the induction hypothesis (which relates $\varphi$ to membership in $\Pi$, not $\Gamma$). This is a clear typo — three occurrences of $\Gamma$ should be $\Pi$.
- **Line ~151–152**: The conclusion of the proof of Lemma \ref{lem:completePL} states "Since $\varphi(A) = \True$ for every $A \in \Gamma$, the set $\Gamma$ is satisfiable." But this lemma is about $\Pi$ (the hypothesis is that $\Pi$ is complete and consistent; the claim is that $\Pi$ is satisfiable). The conclusion should say: "Since $\varphi(A) = \True$ for every $A \in \Pi$, the set $\Pi$ is satisfiable." (The variable $\Gamma$ is not in scope in this lemma.)
- **[Uncertain] Line ~100–101**: The proof of Lemma \ref{lem:completePLconds}(b) claims $\{A \limplies B, A, \lnot B\}$ is inconsistent. This is correct because from $A \limplies B$ and $A$ one derives $B$ by Modus Ponens, giving both $\vdash B$ and $\vdash \lnot B$, but the justification is left to the reader. Similarly, line ~106 claims $\{\lnot(A \limplies B), \lnot A\}$ is inconsistent, and line ~108 claims $\{\lnot(A \limplies B), B\}$ is inconsistent. These rely on the fact that $\lnot(A \limplies B)$ is equivalent to $A \land \lnot B$ (i.e., both $A$ and $\lnot B$ are derivable from $\lnot(A \limplies B)$). These claims are standard and likely proved or noted elsewhere, but the reader must verify them. Flagging for completeness.

### B4. Formulas and Symbolic Expressions
None found.

### B5. Examples and Counterexamples
None found.

## Summary

- **Typos/Grammar/LaTeX issues found**: 6
- **Mathematical issues found**: 5
- **Confidence**: High — The section is self-contained and the chapter context index provides sufficient information to verify all references and mathematical claims. The most critical issues are the $\Gamma$ vs. $\Gamma_i$ error in line ~45 and the systematic $\Gamma$ vs. $\Pi$ error in lines ~144–152.
