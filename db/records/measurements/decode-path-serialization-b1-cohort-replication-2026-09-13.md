---
type: measurement
id: 01m2d3egg6b14rbzczs2j5t3w1
created: 2026-09-13T10:01:47.782378+00:00
updated: 2026-09-13T13:44:49.848453+00:00
summary: 'B1 replication passes every gate: combined candidate 1.114 against shipped (bootstrap 1.104 to 1.121), families 1.064 or above, outputs identical; rescored from 1.124 with true medians'
date: 2026-09-13
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Registered full replication of the held-out cohort, twelve prompts by three rounds at 512 outputs; passes; adopted as the 0.2.16 default and cited by public claims.
order: '1340'
runs: '[[sources/runs/2026/09/2026-09-13-decode-path-serialization-b1-cohort-replication]]'
title: 'Decode path serialization, step 7 replication: the combined candidate passes B1 at 1.114 against shipped'
status: measured
---
**Outcome: the replication passes every registered gate. On the held-out B1 prompts the combined candidate decodes at an aggregate 1.114 against the shipped path (bootstrap 1.104 to 1.121), every family at 1.064 or above, every family's request duration shorter, 34 of 36 pairs eligible and every output identical.** Median decode throughput rose from 11.79 to 13.47 tok/s.

**Correction (2026-09-13).** This record first reported an aggregate of 1.124 (bootstrap 1.105 to 1.122), every family at 1.072 or above and medians of 11.80 to 13.48 tok/s. The cohort report took the upper of the two middle values whenever it formed a median over an even count, so each two-prompt family counted its faster prompt, which is why 1.124 sat above its own bootstrap interval. Scored again from the same pairs with true medians, a family being the geometric mean of its prompt medians as the registered bootstrap already resampled, the aggregate is 1.114. Every gate still passes and the verdict is unchanged: [[sources/runs/2026/09/2026-09-13-cohort-rescoring-true-medians]].

| gate | required | first run | replication |
| --- | --- | ---: | ---: |
| aggregate ratio | at least 1.10 | 1.106 | 1.114 |
| bootstrap lower bound | above 1.00 | 1.073 | 1.104 |
| family floor | at least 0.95 | 1.033 | 1.064 |
| duration regression | at most 5% | none | none |
| clean pairs per prompt | at least 2 | r0245 had 1 | met |
| verdict | | not a pass | pass |

| family | tok/s ratio | duration ratio |
| --- | ---: | ---: |
| prose | 1.176 | 0.923 |
| dialogue | 1.169 | 0.865 |
| multilingual | 1.136 | 0.914 |
| structured | 1.075 | 0.953 |
| code | 1.070 | 0.956 |
| reasoning | 1.064 | 0.943 |

**Standing of the two runs.** The replication was registered before it ran as a complete fresh run of the same candidate, binary, plan and gates; its verdict stands on its own and no pair from the first run entered it. The first run ([[records/measurements/decode-path-serialization-b1-cohort-2026-09-13]]) is reported alongside: it cleared every effect gate and failed only evidence sufficiency, after host swap-outs from another application's virtual machine. The two runs agree family by family within 0.012 except reasoning (1.033 and 1.064).

**What it measures.** The cohort prices the whole candidate against the shipped path: B0 prefetch, barrier period 4 with forecasts on the routing readback, the router weight cache and an inert coverage override. B0 prefetch alone passed at 1.105 on the B0 prompts ([[records/measurements/expert-lookahead-2-b0-cohort-2026-09-12]], rescored the same way); the two cohorts use different prompts, so the increment over B0 is not read from their difference. It is measured in exploration at 1.018 ([[records/measurements/decode-path-serialization-combination-screen-2026-09-13]]) and, on one binary with sixteen pairs, by the attribution sweep registered with this replication.

**Limits.** One machine at the 20 GB profile, text decode with MTP drafts at depth 2, the twelve B1 prompts. Defaults are unchanged and nothing is committed or installed; adopting the flags is separate engineering. No public claim yet.

Commands, per-prompt ratios, exclusions and hashes: [[sources/runs/2026/09/2026-09-13-decode-path-serialization-b1-cohort-replication]]. Rescoring: [[sources/runs/2026/09/2026-09-13-cohort-rescoring-true-medians]].
**Adoption (2026-09-13).** 0.2.16 turns this configuration on by default wherever the draft head runs ([[records/decisions/decode-lookahead-default-with-the-draft-head]]). Public claims citing this record: [[records/claims/decode-lookahead-1-11x-on-held-out-prompts]], [[records/claims/warm-decode-13-5-tok-s-with-the-decode-lookahead]] and [[records/claims/decode-lookahead-11-8-to-13-5-tok-s]].
