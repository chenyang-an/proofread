# Proofread

An automated proofreading pipeline for LaTeX textbooks. The system uses Claude AI to orchestrate a 5-phase pipeline that splits a book into sections, proofreads each one for typographical, grammatical, and mathematical errors, verifies report quality, and generates a comprehensive summary.

## Quick Start

1. **Install [Claude Code](https://github.com/anthropics/claude-code)** and make sure `claude` is accessible from the command line. Also ensure **Python 3** and **jq** are installed.

2. **Clone this repo:**
   ```bash
   git clone <repo-url>
   ```

3. **Prepare your LaTeX source.** Create a directory somewhere **outside** this repo and place your LaTeX code there:
   - **Single paper:** copy your LaTeX source into a file named `ch1.txt`.
   - **Textbook (multiple chapters):** put each chapter's LaTeX source into its own file — `ch1.txt`, `ch2.txt`, `ch3.txt`, etc.

   **Important:** your LaTeX files must be structured with `\section{...}` commands. The pipeline splits on `\section` boundaries and proofreads per section — content without `\section` markers will be skipped.

4. **Run the pipeline:**
   ```bash
   ./run.sh <path-to-your-latex-directory>
   ```

5. **Read the results** in `result/proofread/` (per-section reports) and `result/summary/proofread_summary.md` (aggregated summary).

> **Warning — Unrestricted file access:** This pipeline invokes Claude with `--dangerously-skip-permissions`, which allows it to read, write, and execute **any file on your system** without confirmation prompts. Review `run.sh` before running and consider using a sandboxed environment.

> **Warning — API cost:** Each run makes many Claude API calls (multiple per section, per iteration). Monitor your usage while the pipeline is running. Per-call duration, cost, and token counts are logged in `agent/log/` (see the [Logs](#logs) section).

## Pipeline Overview

```
Source LaTeX  -->  Phase 0  -->  Phase 1  -->  Phase 2  -->  Phase 3  -->  Phase 4  -->  Phase 5
                   Split       Context      Proofread     Verify       Verdict       Summary
                                              ^                          |
                                              |    CONTINUE              |
                                              +--------------------------+
```

**Phase 0 — Split Sections** (`split_sections.py`): Splits each chapter file into individual section files.
- **Input:** `<raw-data-dir>/ch<N>.txt` (user-provided LaTeX chapter files)
- **Output:** `proofread_material/unit/ch<N>_sec<M>.txt`, `proofread_material/unit/ch<N>_exercises.txt`

**Phase 1 — Context Builder:** Extracts a reference index of notation, definitions, theorems, and conventions for each chapter.
- **Input:** `proofread_material/unit/ch<N>_sec*.txt`, `proofread_material/unit/ch<N>_exercises.txt`
- **Output:** `proofread_material/context/ch<N>_context.md`

**Phase 2 — Proofreader:** Reviews each section for typos, grammar issues, LaTeX errors, and mathematical correctness.
- **Input:** `proofread_material/unit/ch<N>_sec<M>.txt`, `proofread_material/context/ch<N>_context.md` (+ optional `result/verification/ch<N>/ch<N>_sec<M>_check.md` on retry)
- **Output:** `result/proofread/ch<N>/ch<N>_sec<M>.md`

**Phase 3 — Verification:** Evaluates the proofreading report for false positives, missed issues, and format compliance.
- **Input:** `proofread_material/unit/ch<N>_sec<M>.txt`, `proofread_material/context/ch<N>_context.md`, `result/proofread/ch<N>/ch<N>_sec<M>.md`
- **Output:** `result/verification/ch<N>/ch<N>_sec<M>_check.md`

**Phase 4 — Verdict:** Decides whether the report is acceptable (`DONE`) or needs another iteration (`CONTINUE`), up to 3 attempts per section.
- **Input:** `result/verification/ch<N>/ch<N>_sec<M>_check.md`
- **Output:** `DONE` or `CONTINUE` (if `CONTINUE`, loops back to Phase 2)

**Phase 5 — Summary:** Aggregates all per-section reports into a single summary with statistics, patterns, and prioritized recommendations.
- **Input:** `result/proofread/` (all per-section reports)
- **Output:** `result/summary/proofread_summary.md`

## Directory Structure

```
proofread/
├── run.sh                        # Main orchestration script
├── clean.sh                      # Cleanup script
├── agent/
│   ├── prompt/                   # Phase prompt files (1-5)
│   ├── code/
│   │   └── split_sections.py     # LaTeX section splitter
│   └── log/                      # Execution logs (see Logs section below)
│       ├── run_log.txt           # Global pipeline log
│       ├── AUTO_RUN_STATUS.md    # Global live status
│       ├── phase5_summary_log.txt
│       └── ch<N>/
│           ├── phase1_log.txt
│           ├── AUTO_RUN_STATUS.md
│           └── ch<N>_sec<M>/
│               └── run_log.txt
├── proofread_material/
│   ├── unit/                     # Split section files
│   └── context/                  # Chapter context indices
├── result/
│   ├── proofread/                # ** Per-section proofreading reports **
│   ├── verification/             # Verification results
│   └── summary/                  # Final summary report
└── source_document/              # Sample test data
```

## Results

Proofreading reports are written to **`result/proofread/`**, organized by chapter:

```
result/proofread/
├── ch1/
│   ├── ch1_sec1.md
│   ├── ch1_sec2.md
│   └── ch1_exercises.md
├── ch2/
│   └── ...
└── ...
```

Each report covers typos, grammar, LaTeX issues, and mathematical correctness. After a full run, `result/summary/proofread_summary.md` contains the aggregated summary across all chapters.

## Logs

All logs are written to `agent/log/`. They record pipeline progress and Claude CLI output (tool calls, token usage, cost) for debugging and monitoring.

| Log file | Scope | Contents |
|---|---|---|
| `run_log.txt` | Global | Overall pipeline progress: chapter/section start/end, verdicts (`DONE`/`CONTINUE`), errors, and final stats |
| `AUTO_RUN_STATUS.md` | Global | Live status dashboard showing the current section, iteration count, active step, and a timestamped progress history. Updated in-place as the pipeline runs |
| `ch<N>/phase1_log.txt` | Per-chapter | Claude CLI output from Phase 1 (context index building) for chapter N |
| `ch<N>/AUTO_RUN_STATUS.md` | Per-chapter | Live status dashboard scoped to chapter N |
| `ch<N>/ch<N>_sec<M>/run_log.txt` | Per-section | Claude CLI output from Phases 2–4 (proofread/verify/verdict loop) for a specific section, across all iterations |
| `phase5_summary_log.txt` | Global | Claude CLI output from Phase 5 (summary generation) |

## Requirements

- Bash 4+
- Python 3
- [Claude CLI](https://github.com/anthropics/claude-code) (`claude` available in `PATH`)
- `jq`

## Input Format

The pipeline expects a directory of LaTeX chapter files with the following conventions:

**File naming:** `ch<N>.txt` where `<N>` is the chapter number (e.g., `ch1.txt`, `ch2.txt`, `ch10.txt`). Files that do not match this pattern are ignored.

**File content:** Each file should be a LaTeX source containing `\section` commands. The splitter recognises two forms:

- `\section{...}` — numbered sections, output as `ch<N>_sec<M>.txt`
- `\section*{...}` — unnumbered sections (typically Exercises), output as `ch<N>_exercises.txt`

Content before the first `\section` (e.g., `\chapter` header or preamble) is discarded. Each section runs from its `\section` line up to (but not including) the next `\section`.

**Example input file** (`ch1.txt`):

```latex
\chapter{Introduction}          % dropped by the splitter
Some preamble text.             % dropped

\section{Background}            -> ch1_sec1.txt
...

\section{Definitions}           -> ch1_sec2.txt
...

\section*{Exercises}            -> ch1_exercises.txt
...
```

## Usage

Run the pipeline on a directory of LaTeX chapter files (`ch1.txt`, `ch2.txt`, ...):

```bash
./run.sh <path-to-raw-data>
```

Clean all logs and intermediate results:

```bash
./clean.sh
```

## Configuration

Key settings in `run.sh`:

| Variable | Default | Description |
|---|---|---|
| `MAX_ITERATIONS` | `3` | Max verification retries per section |

## Sample Output

Each per-section report in `result/proofread/` follows this format:

```markdown
# Proofread: ch3_sec5

## Section Title
Soundness of the Proof System

## Task A: Typos, Grammar, and LaTeX Issues

### A1. Spelling / Typos
- **Line ~12**: "recusrive" → "recursive" — misspelling
- ...

### A2. Grammar / Style
- **Line ~34**: "the the" — duplicated word
- ...

### A3. LaTeX Issues
- **Line ~56**: `\emph{recursive` — missing closing `}`
- ...

### A4. Notation Inconsistencies
- **Line ~78**: Uses `\rightarrow` for implication but context index defines `\limplies`
- ...

### A5. Reference / Label Issues
- **Line ~90**: `\ref{thm:completnss}` — likely misspelling of `thm:completeness`
- ...

## Task B: Mathematical Correctness

### B1. Definitions
- **Line ~15**: Definition of "valid" — uses "satisfiable" which is not yet defined at this point
- ...

### B2. Theorem Statements
- **Line ~42**: Soundness theorem — missing hypothesis that the proof system is over propositional logic
- ...

### B3. Proof Steps
- **Line ~60**: Claims X follows from Y but the implication requires Z
- ...

### B4. Formulas and Symbolic Expressions
- **Line ~73**: `\forall x (P(x) \land Q(y))` — variable `y` is unbound
- ...

### B5. Examples and Counterexamples
- **Line ~95**: Counterexample claims the formula is unsatisfiable but it is satisfied by the given assignment
- ...

## Summary

- **Typos/Grammar/LaTeX issues found**: 5
- **Mathematical issues found**: 4
- **Confidence**: High — chapter context index provided sufficient information
```
