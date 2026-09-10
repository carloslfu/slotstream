---
type: measurement
id: 01m1qx09rjxx3rdvvh9sq4gzvk
created: 2026-09-05T04:25:07.601865+00:00
updated: 2026-09-05T04:26:11.744373+00:00
summary: Optimization — retained state and terminal-forward confirmation
date: 2026-09-05
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '760'
runs: '[[sources/runs/2026/09/2026-09-05-optimization-initial-implementation]], [[sources/runs/2026/09/2026-09-05-optimization-second-implementation]]'
title: Optimization — retained state and terminal-forward confirmation
status: measured
---
The first qualified mechanisms are deliberately scoped. They do not establish the combined engine's performance or complete the unified program. Runs and exclusions: [[sources/runs/2026/09/2026-09-05-optimization-initial-implementation]], [[sources/runs/2026/09/2026-09-05-optimization-second-implementation]].

| Mechanism and workload | Result | Limits |
|---|---|---|
| Omit the ordinary decode forward after the last requested token; fixed short prompt, one output token, 640 slots, requested 8.1 GB | Five complete valid confirmation pairs: median paired request-time reduction **14.73%**, median paired saving **0.2056 s**; all five improved; identical output token IDs; decode expert records **472 → 0** | One of the originally scheduled five pairs had swap activity and was wholly excluded. One fixed-policy replacement pair supplied the fifth valid pair. The effect is an avoided terminal forward; it is not a 14.73% steady decode or whole-engine claim. |
| Compact retained GDN/PLE windows; frozen 440-token prose, one output token, 640 slots | Three complete valid pairs: median paired allocator-active reduction **333,414,400 bytes**; median sampled physical high-water **6,446,354,128 → 6,118,690,488 bytes** | 20 ms samples are lower bounds, not continuous peaks. The maximum chunk was explicitly forced to 1024, with a separate transient allowance. Latency was variable; the predeclared memory-benefit plus median-latency-nonregression gate passed. No general prefill speed claim. |

The final-forward confirmation protocol required at least 5% median paired request reduction, at least four of five positive valid pairs, exact IDs and serving acceptance. The measured confirmation clears those thresholds; the 74-case serving battery passed the earlier control combination. Native generation diagnostics checked pending-token ownership, continuation, EOS, stop callbacks and early cancellation. Later cache-reservation and cancellation/validity fixes require their own final integrated verification before release.

Exact compact-MTP-row checks passed 366 assertions; compact n-gram storage passed 1,160 checks including eviction and tiny capacities; incremental indexer blocks passed 1,127 checks at 2,051 tokens, including speculative rollback and continuation. The broader MTP text/image/prefix suite also passed. These are correctness results, not throughput measurements. Build-provenance limits for intermediate checks are recorded with the raw runs.

The value-only sampler threshold passed 16 NumPy reference gates. Its first three-pair request benchmark lost two pairs to swap activity; the remaining pair does not demonstrate a request-speed improvement. Keep that candidate experimental pending component and confirmation measurements.

All these experiments used the same local model and M5 Pro machine. OS filesystem cache was uncontrolled and never globally purged. No result certifies another Mac or justifies raising the context or query-by-key safety envelope.
