---
type: run
title: 'verify.sh full battery, tools-v1 after the 0.2.3 merge, fully green (2026-09-03)'
tool: verify.sh
command: 'bash Tools/verify.sh'
binary: '.build/release/slotstream (tools-v1 6d3b3cb build, merged with origin/main 5bf0e67) + Tools/verify.sh'
machines: '[[records/machines/macbook-pro-m3-max-48gb]]'
captured_at: 2026-09-03
discarded: false
summary: 'Post-merge full battery on tools-v1: 191 PASS / 0 FAIL (robustness 75/0), including the sweep gates from 0.2.3 and the two gate fixes (unseeded variation, long-context token budget).'
created: 2026-09-03T00:00:00+00:00
updated: 2026-09-03T00:00:00+00:00
---

Full acceptance battery on tools-v1 after merging origin/main (the 0.2.3
release: prefill sweep, library split, machine-as-value planner). The
standing LaunchAgent server was paused for the run and restored afterwards
with the merged binary (0.2.3 on 11434). Raw tail:

```
== serving robustness ==
robustness: passed 75, failed 0
PASS  serving robustness suite

passed 21, failed 0
```

Totals: 191 PASS / 0 FAIL. Two gate fixes landed on the way: the
unseeded-variation probe (b9c712c, three-draw collision on a peaked
distribution) and the long-context recall budget (6d3b3cb, the sweep's
token stream reasons ~90 tokens before the answer, the old 16-token
budget truncated it). The merge itself was verified against the battery:
one post-merge gate failure (the long-context budget) reproduced by hand
as deterministic and fixed at the gate, not the engine.
