---
type: measurement
id: 01m2c7d1zgbg0575xyywc4bqms
created: 2026-09-13T01:51:40.016195+00:00
updated: 2026-09-13T01:51:40.016195+00:00
summary: 'Prefetch coverage: top above ten is inert under the margin threshold, an A/A spread of 0.991 to 1.022; stride 1, stride union and no threshold cut demand reads but run slower'
date: 2026-09-12
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Exploration sweep on three prompts at 256 outputs over two rounds; the B0 coverage setting stays; composition, draft depth and router weights follow; no public claim.
order: '1270'
runs: '[[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-2]]'
title: 'Decode path serialization, round 2: the B0 prefetch coverage is already the best point; closer or wider forecasts trade demand reads for waits'
status: measured
---
**Outcome: the B0 prefetch setting is already the best coverage point in this sweep. Candidate lists deeper than ten are inert, and forecasts that are closer or wider trade demand reads for waits on reads still in flight.** Reference: the B0 setting (top 10, stride 2, margin threshold 0.062). Paired geometric means over six request-round pairs; outputs identical to the reference in every cell.

| configuration | paired ratio | pairs above 1 | demand records | demand misses | promoted while in flight | join and adopt per run |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| top 32, stride 2 | 1.022 | 4 of 6 | 15,654 | 14,243 | 152 | 0.01 s |
| top 24, stride 2 | 1.015 | 5 of 6 | 15,661 | 14,248 | 184 | 0.02 s |
| top 16, stride 2 | 0.991 | 4 of 6 | 15,656 | 14,244 | 138 | 0.01 s |
| top 10, stride 2 (B0) | reference | | 15,695 | 14,276 | 189 | 0.02 s |
| top 16, strides 1 and 2 | 0.991 | 1 of 6 | 10,366 | 8,971 | 5,169 | 2.10 s |
| top 24, stride 1 | 0.969 | 3 of 6 | 12,455 | 10,820 | 16,126 | 2.59 s |
| top 24, no threshold | 0.555 | 0 of 5 | 7,098 | 5,752 | 14,032 | 7.27 s |

**Deeper lists are inert, which makes them an A/A test.** Margins are measured against each row's tenth logit, so from the tenth rank down every margin is zero or negative and the threshold removes it. Top 16, 24 and 32 therefore issue the same reads as top 10: 28,598 to 28,602 candidates, with 0.8% more reads let through by the larger per-target issue cap. Their paired ratios, 0.991, 1.015 and 1.022, with single pairs from 0.848 to 1.085, measure the exploration sweep's own noise: a six-pair difference inside about 2.5% is not evidence here. Round 1's barrier results at K of 3 and above (1.038 to 1.051, every pair above 1) sit outside that band; K = 2 (1.025) sits at its edge.

**Closer and wider forecasts arrive too late to pay.** Stride 1 forecasts one layer ahead. Its forecasts are more accurate (wasted bytes halve, 32.3 to 16.1 GB per run, and demand misses fall 24%), but 16,126 of its reads were still in flight when the layer needed the expert, and joining and adopting them took 2.59 s per run against 0.02 s at stride 2. Forecasting from both strides issues 35% more reads, cuts demand records 34% and spends 2.10 s joining and adopting, for 0.991 with one pair of six above 1. Removing the threshold issues 4.2 times the reads, queues a million deferred lane acquisitions and runs at 0.555. Fewer demand records is not the objective by itself: a speculative read pays only when it lands before its layer asks and does not queue behind other speculative reads.

**Combination rule.** The pre-registered rule for step 6 (at least five pairs, paired mean at least 1.01, at least 80% of pairs above 1) selects top 24 at stride 2 for this lever, out of the A/A set. Its overrides are the top and the issue cap, so it carries no measurable change into the combined candidate, and no gain is attributed to coverage. The rule is permissive at six pairs, as this sweep shows directly; the held-out B1 cohort remains the test that counts.

**Also measured.** Layer completeness stayed at 2.2% to 2.5% at every setting. One no-threshold cell was excluded for host swap-outs; system swap held 0.25 MB afterwards and every configuration peaked at 18.8 GB.

**Limits and next.** Three exploration prompts at 256 outputs over two rounds, not a held-out cohort. The composition of the deferred barrier with prefetch is round 3. No public claim.

Commands, tables, counters and hashes: [[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-2]].
