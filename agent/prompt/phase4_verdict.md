# Phase 4: Verdict

Read the verification result file at:
```
/home/cyanz/lean/proofread/result/verification/ch{N}/{section_id}_check.md
```

## Decision Criteria

Reply with ONLY the single word **'DONE'** if ALL of the following criteria are satisfied:

1. **Format Compliance:** The proofread report passes format compliance
2. **Flag Accuracy:** False positive rate is below 30%
3. **No Major Misses:** No more than 2 significant missed issues were found by the checker
4. **Line Accuracy:** Line numbers are reasonably accurate
5. **Overall Verdict:** The checker's overall verdict is "PASS"

Reply with ONLY the single word **'CONTINUE'** otherwise.

## Important

- Your response must be exactly one word: either `DONE` or `CONTINUE`
- Do not include any explanation or additional text
- If the verification result file is empty or missing, reply `CONTINUE`
- If any single criterion fails, reply `CONTINUE`
