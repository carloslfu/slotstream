---
type: run
title: 'verify.sh full battery, tools-v1 clean run (2026-09-03)'
tool: verify.sh
command: 'bash Tools/verify.sh'
binary: '.build/release/slotstream (tools-v1 b9c712c build) + Tools/verify.sh'
machines: '[[records/machines/macbook-pro-m3-max-48gb]]'
captured_at: 2026-09-03
discarded: false
created: 2026-09-03T06:48:43+00:00
updated: 2026-09-03T06:48:43+00:00
summary: 'Full verify.sh battery on tools-v1: 190 PASS / 0 FAIL (robustness 75/0), first fully green run on this machine after the mtp-parity regen-at-gate fix and the unseeded-gate determinism fix (b9c712c).'
---

Full acceptance battery on the tools-v1 branch after the standing LaunchAgent
server was paused for the run (memory safety: one model process). Environment:
32.1 GB reclaimable at start (`slotstream doctor`), no other slotstream
processes. Raw output:

```
$ bash Tools/verify.sh
... (gates as committed at b9c712c) ...

== serving robustness (inputs that used to crash or corrupt output) ==
PASS  unseeded requests vary, as the API documents (6 distinct in 12)
PASS  an explicit seed still reproduces exactly
PASS  different seeds take the sampler down different streams
...
robustness: passed 75, failed 0
PASS  serving robustness suite

passed 20, failed 0
```

Totals: 190 PASS / 0 FAIL across the whole battery (robustness 75/0,
planner 64/0, sampler golden 16/0, RSS peaks 6.4 GB and 8.7 GB under the
10 GB target, prefix/mtp/elastic gates all pass). This is the first fully
green run of the battery on this machine: the run before it (2026-09-02,
275 gates) had the machine-dependent mtp-parity gate red, since fixed by
regen-at-gate, and one robustness gate that failed spuriously ~half the
time (three-draw collision on a peaked reply distribution), since made
deterministic in b9c712c.
