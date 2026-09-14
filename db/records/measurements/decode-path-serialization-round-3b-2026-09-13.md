---
type: measurement
id: 01m2ckt1bq75a4m4vvmxqgnb0g
created: 2026-09-13T05:28:28.279521+00:00
updated: 2026-09-13T05:28:28.279521+00:00
summary: Forecasts on the routing readback remove round 3's loss and stay exact; the rule picks period 4 at 1.087, but without two slow reference cells it reads 1.014, a gain of about 1%
date: 2026-09-13
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Exploration sweep on three prompts at 256 outputs over two rounds; the registered selection carries period 4 into the combination; the screen and held-out cohort decide; no public claim.
order: '1310'
runs: '[[sources/runs/2026/09/2026-09-13-decode-path-serialization-round-3b]]'
title: 'Decode path serialization, round 3b: forecasts on the routing readback fix round 3 but add about 1%'
status: measured
---
**Outcome: consuming router forecasts at the next routing readback removes round 3's loss and stays exact, but the gain it leaves is small: at barrier period 4, 1.014 over the four pairs not affected by two slow reference cells, all four above 1; the other periods sit between 0.96 and 1.00 on those pairs.** Reference: the B0 prefetch setting with a barrier at every layer. Outputs identical to the reference in every cell; exact parity at K = 8 on the six correctness requests.

| barrier period | paired ratio, all clean pairs | pairs above 1 | without the r0206 pairs | pairs above 1 | median pair |
| ---: | ---: | ---: | ---: | ---: | ---: |
| 2 | 1.065 | 3 of 6 | 0.991 | 1 of 4 | 0.999 |
| 3 | 1.084 | 3 of 5 | 0.992 | 1 of 3 | 1.007 |
| 4 | 1.087 | 6 of 6 | 1.014 | 4 of 4 | 1.025 |
| 8 | 1.125 | 3 of 4 | 0.998 | 1 of 2 | 1.103 |
| 16 | 1.058 | 3 of 6 | 0.960 | 1 of 4 | 0.999 |

**Two slow reference cells carry the headline ratios.** Both r0206 reference cells ran at 10.99 and 9.78 tok/s, slower than every other r0206 cell at barrier period 1 that evening (11.6 to 13.3 across rounds 2 to 5). Their demand records and decode I/O time match the other configurations' r0206 cells, and the excess, 1.2 to 2.1 s in round 0 and 3.8 to 4.1 s in round 1, is outside I/O. Neither tripped the eligibility rule, which sees swap-outs and page-ins but not processor or GPU contention from other processes. A slow reference inflates every ratio in its pair, so r0206 adds ratios of 1.12 to 1.37 to every period; without those pairs the periods read 0.96 to 1.01.

**Round 3's loss is gone.** At K = 3, stride 2, round 3 ran at 0.865 with a third of its forecasts never issued ([[records/measurements/decode-path-serialization-round-3-2026-09-12]]). Here the same configuration issues and adopts as many reads as K = 1 (28,405 and 13,720 against 28,386 and 13,708) and demand misses are unchanged. Forecasts reach the scheduler one attention block later, so about 2,800 to 3,700 reads are still in flight when their layer asks, against 394 at K = 1, and joining and adopting them takes 0.14 to 0.18 s per run against 0.03 s.

**Combination rule.** The pre-registered rule reads all clean pairs and selects K = 4 (six pairs, all above 1), carrying `SLOTSTREAM_DECODE_BARRIER_LAYERS=4` into step 6; K = 8 had only four clean pairs. The selection stands as registered: the setting is exact, and the screen against the shipped path and the held-out cohort measure what it adds. This round supports a gain of about 1% at K = 4, not 8.7%.

**Limits.** Three exploration prompts at 256 outputs over two rounds; three cells excluded for host swap-outs. The reading without r0206 drops pairs after seeing them and is not the registered estimator. No public claim.

Commands, per-pair ratios, counters and hashes: [[sources/runs/2026/09/2026-09-13-decode-path-serialization-round-3b]].
