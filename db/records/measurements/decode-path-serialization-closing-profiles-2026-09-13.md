---
type: measurement
id: 01m2daxxfh995x3kp2ptaf0kf1
created: 2026-09-13T12:12:32.625227+00:00
updated: 2026-09-13T12:12:32.625227+00:00
summary: 'Whole-thread profiles: B0 prefetch waits 36% on reads and 40% on the GPU; the combination cuts GPU-wait samples 18% and adds 9% reads; round 1''s split covered one thread block'
date: 2026-09-13
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: One prompt and one run per profile; shares of model-thread samples; corrects round 1's profile split; no public claim.
order: '1360'
runs: '[[sources/runs/2026/09/2026-09-13-decode-path-serialization-closing-profiles]]'
title: 'Decode path serialization, closing profiles: decode waits split between file reads and the GPU'
status: measured
---
**Outcome: on the whole model thread, decode waiting now splits between file reads and the GPU. With B0 prefetch the thread spends 36% of its samples in reads and 40% in GPU waits; the combined candidate cuts GPU-wait samples by 18% and adds 9% in reads. Round 1's recorded split covered only one of the thread's two profile blocks.**

| bucket | round 1, prefetch off | round 1, B0 prefetch | B0 prefetch, round 3b binary | combined candidate |
| --- | ---: | ---: | ---: | ---: |
| file reads | 45.2% | 40.0% | 36.1% | 39.3% |
| GPU wait | 35.1% | 41.3% | 39.8% | 32.9% |
| other host work | 8.1% | 9.5% | 14.1% | 16.6% |
| locks and condition variables | 9.0% | 5.9% | 6.1% | 6.3% |
| allocation and memory copy | 2.6% | 3.3% | 3.8% | 4.8% |

**What changed with the combination.** Fewer synchronizations and cheaper router math show up as 1,980 fewer samples in the IOKit trap (11,254 to 9,274). Reads rise by 885 samples (10,212 to 11,097), consistent with forecasts reaching the scheduler one attention block later, which the attribution counters also show as more reads still in flight when their layer asks. Host work outside waiting rises from 14.1% to 16.6% but stays a thin tail: no leaf above 433 samples, and `mlx::core::eval_impl` at 94 and 112 of about 28,000.

**Correction to round 1.** `sample` lists the model thread once per dispatch queue. Round 1's parse kept the cooperative-queue block that runs the layer loop, whose shares reproduce the recorded 69.7% and 73.5% GPU wait, and missed the block where the same thread reads records, which is 91% file reads. Merged, round 1's model thread spent 35.1% (prefetch off) and 41.3% (B0 prefetch) in GPU waits and 45.2% and 40.0% in file reads, and prefetch lowered locks and condition variables from 9.0% to 5.9%, not from 9.9% to 4.4%. Host work outside waiting stays between 8% and 17% in every profile, so [[records/decisions/decode-host-time-is-waiting-not-graph-construction]] stands, with its evidence updated.

**Where the next gains are.** Reads the model waits on are again the largest single cost, and round 2 showed that more speculative reads do not reduce them ([[records/measurements/decode-path-serialization-round-2-2026-09-12]]), so the lever is forecast accuracy at the same lead time. GPU waits are the other third.

**Limits.** One prompt and one run per profile, in 45 s windows that can include warmup decode; shares are of model-thread samples, not wall time. No public claim.

Commands, block tables and hashes: [[sources/runs/2026/09/2026-09-13-decode-path-serialization-closing-profiles]].
