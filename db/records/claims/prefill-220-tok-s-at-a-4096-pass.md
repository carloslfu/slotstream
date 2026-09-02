---
type: claim
id: 01m1ht96a8gadh55hch7pj8hd0
created: 2026-09-02T19:42:06.664317+00:00
updated: 2026-09-02T19:42:06.664317+00:00
summary: Prefill at a 4096-token pass is about 220 tok/s on the dev Mac (estimated from the sweep's ladder)
basis: estimated
gate: Tools/planner_gates.sh
needle: 220 tok/s
supported_by: '[[records/measurements/n2-the-prefill-sweep-grouped-gemm-over-staging-contiguous-reads-no-pool-writes-2026-09-02]]'
surfaces: README.md, docs/HARDWARE.md
title: Prefill at a 4096-token pass is about 220 tok/s on the dev Mac (estimated from the sweep's ladder)
status: current
---
The planner's number for a 4096-token pass, rounded down from the sweep's measured 222 tok/s at a matched 60-experts-per-layer pool and 247 at a 16 GB target by override, on the 8k acceptance prompt. The auto plan that actually picks 4096 (33 GB, 152 per layer) has not run on this Mac since the sweep landed, so the README banner and the HARDWARE.md row present it as an estimate; ordinary prose reads about 30% slower than this prompt.
