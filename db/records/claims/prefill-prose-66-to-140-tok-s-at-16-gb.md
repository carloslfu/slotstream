---
type: claim
id: 01m1ht96c9fctc83gar3xwt4jx
created: 2026-09-02T19:42:06.729729+00:00
updated: 2026-09-02T19:42:06.729729+00:00
summary: The sweep reads a 10,490-token prose prompt at 140 tok/s at a 16 GB target, against 66 for the 0.2.2 code
basis: measured
gate: Tools/verify.sh (sweep-check)
needle: 66 → 140
supported_by: '[[records/measurements/n2-the-prefill-sweep-grouped-gemm-over-staging-contiguous-reads-no-pool-writes-2026-09-02]]'
surfaces: README.md
title: The sweep reads a 10,490-token prose prompt at 140 tok/s at a 16 GB target, against 66 for the 0.2.2 code
status: current
---
A 34,000-character excerpt of PLAN.md, 10,490 tokens, at `--memory-gb 16`: the shipped build read 140.1 / 139.2 tok/s in two interleaved rounds against 67.3 / 67.6 for the commit before the sweep; the sweep without the parallel n-gram fetch read 107.9 / 106.5. Prose routes to nearly every expert of every layer and reads 4% more bytes than the acceptance prompt at the same pass.
