---
type: measurement
id: 01m2camajz8q2v1ry4c54x8pgd
created: 2026-09-13T02:48:03.935387+00:00
updated: 2026-09-13T02:48:03.935387+00:00
summary: Holding router forecasts until a deferred barrier is exact but costs 7% to 26% under prefetch with no pair above 1; dropped targets, weaker strides and read bursts outweigh the drain saved
date: 2026-09-12
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Exploration sweep on three prompts at 256 outputs over two rounds; the design is replaced in the source by routing-readback consumption, round 3b; no public claim.
order: '1280'
runs: '[[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-3]]'
title: 'Decode path serialization, round 3: forecasts held to a deferred barrier lose 7% to 26% under prefetch'
status: measured
---
**Outcome: holding router forecasts until a deferred barrier is exact but costs 7% to 26% under prefetch, with no pair above 1, so the barrier gain does not survive this design.** Reference k1-s2, the B0 prefetch setting with a barrier at every layer. Paired geometric means over six pairs (five for k3-s4); outputs identical to the reference in every cell; exact parity at K = 3, stride 3 on the six correctness requests.

| configuration | paired ratio | pairs above 1 | range | demand records | adopted | promoted while in flight | deferred lane acquisitions |
| --- | ---: | ---: | --- | ---: | ---: | ---: | ---: |
| K = 1, stride 2 (reference) | | | | 15,685 | 13,706 | 111 | 38,096 |
| K = 1, stride 3 (control) | 0.932 | 1 of 6 | 0.849 to 1.008 | 18,292 | 11,116 | 6 | 41,962 |
| K = 3, stride 3 | 0.877 | 0 of 6 | 0.854 to 0.935 | 18,394 | 11,020 | 5,128 | 108,387 |
| K = 3, stride 2 | 0.865 | 0 of 6 | 0.658 to 0.973 | 21,989 | 8,984 | 4,271 | 27,484 |
| K = 4, stride 4 | 0.814 | 0 of 6 | 0.767 to 0.864 | 20,232 | 9,549 | 4,071 | 200,524 |
| K = 3, stride 4 | 0.797 | 0 of 5 | 0.769 to 0.841 | 20,127 | 9,703 | 2,056 | 187,293 |
| K = 8, stride 4 | 0.740 | 0 of 6 | 0.335 to 0.913 | 27,732 | 3,925 | 1,488 | 87,798 |

**Why.** A forecast is worth its lead time, and holding it to the barrier spends that lead time three ways. At stride 2 a third of the forecasts target the barrier layer itself and reach the scheduler after it completed, so they are never issued: issued reads fall 35% and demand records rise 34%. A longer stride restores the distance but forecasts less accurately: stride 3 alone, at K = 1, adopts 19% fewer reads and runs at 0.932. And the reads that are issued leave in bursts at each barrier: at K = 3, stride 3, deferred lane acquisitions reach 2.6 times the stride-3 control, 5,128 reads were still in flight when their layer asked, and joining and adopting them took 1.69 s per run against 0.01 s. That configuration runs at 0.877 against the control's 0.932, a 5.9% loss at the same stride, where round 1 measured a 3.8% gain for the same period without prefetch. The loss grows with the period, to 0.740 at K = 8.

**What follows.** Deferring the drain needs each forecast consumed before the next layer's routing, not at the next barrier. That routing readback is a synchronization the host takes anyway, so round 3b rebuilds with forecasts and completed-layer ticks riding it, which keeps their lead time within one attention block of K = 1 ([[records/plan/decode-path-serialization-2026-09-12]]).

**Also measured.** Round 1's profiles rule out a third fold. Multi-token passes compact the linear-attention state windows with one evaluation each after the barrier, but that call site holds about 150 to 220 model-thread samples against about 3,700 to 4,000 at the barrier and 14,400 to 16,900 in the MoE call, so folding it could move at most about 1% of layer-loop time, inside the exploration noise band; it was not built. One k3-s4 cell was excluded for host swap-outs.

**Limits.** Three exploration prompts at 256 outputs over two rounds. The design measured here is replaced in the source by round 3b's. No public claim.

Commands, tables, counters and hashes: [[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-3]].
