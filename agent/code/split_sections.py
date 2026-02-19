#!/usr/bin/env python3
"""Split each chapter file in raw_data/ into per-section files in unit/.

Output naming: ch{N}_sec{M}.txt for numbered sections,
               ch{N}_exercises.txt for the \section*{Exercises} at the end.
"""

import os
import re

DEFAULT_RAW_DIR = os.path.join(os.path.dirname(__file__), "raw_data")
DEFAULT_OUT_DIR = os.path.join(os.path.dirname(__file__), "unit")

# Matches both \section{...} and \section*{...}
SECTION_RE = re.compile(r"^\\section\*?\s*[\[{]")


def split_chapter(chapter_path, chapter_num, out_dir):
    with open(chapter_path, "r") as f:
        lines = f.readlines()

    # Find line indices where \section starts
    section_starts = []
    for i, line in enumerate(lines):
        if SECTION_RE.match(line):
            section_starts.append(i)

    if not section_starts:
        print(f"  No sections found in ch{chapter_num}, skipping.")
        return

    # Content before the first section (chapter header / preamble) is dropped
    # Each section runs from its start line to just before the next section
    files_written = []
    numbered = 0
    for idx, start in enumerate(section_starts):
        end = section_starts[idx + 1] if idx + 1 < len(section_starts) else len(lines)
        section_text = "".join(lines[start:end])

        # Decide filename
        if "\\section*" in lines[start]:
            # Unnumbered section (Exercises)
            fname = f"ch{chapter_num}_exercises.txt"
        else:
            numbered += 1
            fname = f"ch{chapter_num}_sec{numbered}.txt"

        out_path = os.path.join(out_dir, fname)
        with open(out_path, "w") as f:
            f.write(section_text)
        files_written.append(fname)

    print(f"  ch{chapter_num}: wrote {len(files_written)} files: {', '.join(files_written)}")


def main():
    import sys
    raw_dir = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_RAW_DIR
    out_dir = sys.argv[2] if len(sys.argv) > 2 else DEFAULT_OUT_DIR

    os.makedirs(out_dir, exist_ok=True)

    for ch_file in sorted(os.listdir(raw_dir)):
        m = re.match(r"ch(\d+)\.txt$", ch_file)
        if not m:
            continue
        chapter_num = int(m.group(1))
        print(f"Processing {ch_file} ...")
        split_chapter(os.path.join(raw_dir, ch_file), chapter_num, out_dir)

    print("\nDone.")


if __name__ == "__main__":
    main()
