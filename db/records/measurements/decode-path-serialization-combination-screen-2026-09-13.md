---
type: measurement
id: 01m2cwc4fhme64xay0jd7bgm12
created: 2026-09-13T07:58:09.905875+00:00
updated: 2026-09-13T13:17:58.392331+00:00
summary: Combined candidate (B0 prefetch, barrier period 4 on the routing readback, router weight cache) is exact and screens at 1.104 against shipped, 1.018 over B0 prefetch, five of six pairs above 1
date: 2026-09-13
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Screen on three exploration prompts at 256 outputs over two rounds; selects the cohort candidate; no public claim.
order: '1320'
runs: '[[sources/runs/2026/09/2026-09-13-decode-path-serialization-combination]]'
title: 'Decode path serialization, step 6: the combined candidate screens at 1.104 against shipped, 1.018 over B0'
status: measured
---
**Outcome: the combined candidate (B0 prefetch, barrier period 4 with forecasts on the routing readback, the router weight cache and an inert coverage override) is exact and screens at 1.104 against the shipped path on the exploration prompts, against 1.084 for B0 prefetch alone: 1.018 on top of B0, five of six pairs above 1.** Six clean pairs per configuration.

| configuration | paired ratio against shipped | pairs above 1 | paired ratio against B0 prefetch | median decode seconds | median demand records per output | median decode I/O share |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| shipped | reference | | | 19.18 | 131.3 | 41.3% |
| B0 prefetch | 1.084 | 6 of 6 | reference | 18.31 | 69.3 | 26.1% |
| combined | 1.104 | 6 of 6 | 1.018, 5 of 6 above 1 | 17.70 | 68.9 | 29.6% |

**Reading.** The combination adds 1.8% on top of B0 prefetch, in line with the parts measured alone: the router weight cache at 1.017 ([[records/measurements/decode-path-serialization-round-5-2026-09-12]]) and barrier period 4 at about 1.01 once two slow reference cells are set aside ([[records/measurements/decode-path-serialization-round-3b-2026-09-13]]); the coverage override changes nothing. The combined arms spend less time outside I/O than B0 prefetch (about 12.5 s against 13.5 s per run) and a little more waiting on reads (about 5.2 s against 4.8 s), consistent with forecasts reaching the scheduler one attention block later. B0 prefetch screens at 1.084 here against its held-out 1.105 (rescored from 1.120, [[sources/runs/2026/09/2026-09-13-cohort-rescoring-true-medians]]) ([[records/measurements/expert-lookahead-2-b0-cohort-2026-09-12]]) because these are three prompts at 256 outputs, not the registered cohort.

**Next.** Step 7 runs the combined candidate against the shipped path on the held-out B1 prompts under the B0 gate.

**Limits.** Three exploration prompts at 256 outputs over two rounds; the medians are unpaired and the time split multiplies medians. No public claim.

Commands, per-pair ratios and hashes: [[sources/runs/2026/09/2026-09-13-decode-path-serialization-combination]].
