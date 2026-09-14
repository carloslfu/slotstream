---
type: measurement
id: 01m2cwc4g3d5c1hqcvdyxt3qh4
created: 2026-09-13T07:58:09.923603+00:00
updated: 2026-09-13T13:18:19.078821+00:00
summary: 'B1 cohort: combined candidate 1.106 against shipped, lower bound 1.073, families 1.033 or above, identical outputs; not a pass (r0245 kept one clean pair); rescored from 1.116'
date: 2026-09-13
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Held-out cohort, twelve prompts by three rounds at 512 outputs; evidence insufficient under the registered gate; a complete rerun on a quiet host is the remaining exit; no public claim.
order: '1330'
runs: '[[sources/runs/2026/09/2026-09-13-decode-path-serialization-b1-cohort]]'
title: 'Decode path serialization, step 7: B1 cohort at 1.106 against shipped, evidence insufficient'
status: measured
---
**Outcome: on the held-out B1 prompts the combined candidate decoded 10.6% faster than the shipped path (aggregate 1.106, bootstrap 1.073 to 1.128), with every family at 1.033 or above, every duration shorter and every output identical, but the registered verdict is not a pass: one prompt kept a single clean pair where the gate requires two, after host swap-outs from another application's virtual machine.** The plan allows no reruns inside a cohort, so this run records evidence insufficient and success false.

**Correction (2026-09-13).** This record first reported 1.116 (bootstrap 1.073 to 1.129) with every family at 1.037 or above. The cohort report took the upper of the two middle values for medians over an even count; scored again from the same pairs with true medians, the aggregate is 1.106 and the verdict is unchanged: [[sources/runs/2026/09/2026-09-13-cohort-rescoring-true-medians]].

| gate | required | result |
| --- | --- | --- |
| aggregate ratio | at least 1.10 | 1.106 |
| bootstrap lower bound | above 1.00 | 1.073 |
| family floor | at least 0.95 | 1.033 (reasoning) |
| duration regression | at most 5% | every family shorter, 0.862 to 0.972 |
| clean pairs per prompt | at least 2 | r0245 has 1 |

| family | tok/s ratio | duration ratio |
| --- | ---: | ---: |
| dialogue | 1.175 | 0.862 |
| prose | 1.167 | 0.928 |
| multilingual | 1.124 | 0.918 |
| structured | 1.077 | 0.949 |
| code | 1.067 | 0.950 |
| reasoning | 1.033 | 0.972 |

**What it measures.** The cohort compares the whole candidate with the shipped path, so it prices B0 prefetch and the new levers together. It has no B0-only arm; B0 prefetch passed alone at 1.105 on the B0 prompts ([[records/measurements/expert-lookahead-2-b0-cohort-2026-09-12]], rescored the same way), where dialogue and prose also gained most. The increment of barrier period 4 and the router weight cache over B0 is measured only in exploration, at 1.018 ([[records/measurements/decode-path-serialization-combination-screen-2026-09-13]]).

**Why the evidence fell short.** Three of 36 pairs were excluded for host swap-outs: r0244 round 0 and r0245 rounds 0 and 1. A virtualization process from another application held 8.41 GB by the end of the run, and the host swap-out counter rose by 13,960 during the cohort, although it had held still for five minutes before the cohort started.

**Next.** A complete B1 rerun of the same candidate on a host without that memory pressure would test the same registered gates. It is a replication, not a top-up: its verdict would stand on its own, with this run reported alongside. No public claim.

Commands, per-prompt ratios, exclusions and hashes: [[sources/runs/2026/09/2026-09-13-decode-path-serialization-b1-cohort]]. Rescoring: [[sources/runs/2026/09/2026-09-13-cohort-rescoring-true-medians]].
