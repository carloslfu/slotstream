---
type: measurement
id: 01m2dakhejbf0136jvgdnm0p8z
created: 2026-09-13T12:06:52.626064+00:00
updated: 2026-09-13T13:44:49.886218+00:00
summary: 'Attribution on one binary: router weight cache 1.021 and barrier period 4 1.022 over B0 prefetch, together 1.046 with all 15 pairs above 1; B0 prefetch 1.090 over shipped; exact'
date: 2026-09-13
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Registered attribution on the exploration prompts, four rounds at 256 outputs; apportions the held-out 1.114 and selects nothing; cited by one public claim.
order: '1350'
runs: '[[sources/runs/2026/09/2026-09-13-decode-path-serialization-attribution]]'
title: 'Decode path serialization, attribution: each new part adds about 2% over B0 prefetch, 4.6% together'
status: measured
---
**Outcome: on one binary, the two new parts each add about 2% on top of B0 prefetch and 4.6% together, every pair above 1 and outputs exact; B0 prefetch itself is 1.090 over the shipped path on these prompts.** Reference: B0 prefetch. Exploration prompts r0005, r0206, r0096 and r0074 over four rounds at 256 outputs; 78 of 80 cells clean.

| configuration | against B0 prefetch | pairs above 1 | approximate 95% interval |
| --- | ---: | ---: | --- |
| shipped path | 0.918, so B0 prefetch is 1.090 over it | 1 of 15 | 0.894 to 0.943 |
| B0 plus the router weight cache | 1.021 | 11 of 15 | 0.994 to 1.050 |
| B0 plus barrier period 4, forecasts on the routing readback | 1.022 | 13 of 14 | 1.008 to 1.036 |
| combined candidate | 1.046 | 15 of 15 | 1.024 to 1.069 |

**The parts compose.** 1.021 × 1.022 = 1.044 against 1.046 measured together, so the router weight cache (compute saved in every router matmul) and the deferred barrier (synchronizations removed) do not overlap. Both agree with their earlier readings: the cache measured 1.017 in [[records/measurements/decode-path-serialization-round-5-2026-09-12]], and barrier period 4 about 1.01 on the pairs round 3b could trust ([[records/measurements/decode-path-serialization-round-3b-2026-09-13]]). The six-pair screen's 1.018 for the combination ([[records/measurements/decode-path-serialization-combination-screen-2026-09-13]]) sat inside its noise band; sixteen pairs place it at 1.046.

**Apportioning the held-out result.**

| step | gain | where measured |
| --- | ---: | --- |
| B0 prefetch over the shipped path | 1.090 here; 1.105 held out | this sweep; [[records/measurements/expert-lookahead-2-b0-cohort-2026-09-12]] |
| router weight cache over B0 | 1.021 | this sweep |
| barrier period 4 with forecasts on the routing readback, over B0 | 1.022 | this sweep |
| both over B0 | 1.046 | this sweep |
| combined candidate over the shipped path | about 1.14 here; 1.114 held out | this sweep; [[records/measurements/decode-path-serialization-b1-cohort-replication-2026-09-13]] |

**Limits.** Exploration prompts at 256 outputs; intervals are normal approximations on log ratios. The parts were selected on these prompts, so the held-out 1.114 is the claim and these ratios apportion it. The held-out figures are the rescored ones ([[sources/runs/2026/09/2026-09-13-cohort-rescoring-true-medians]]); the cohort report first gave 1.124 and 1.120 by taking the upper middle value of even-count medians. No public claim.

Commands, per-prompt ratios and hashes: [[sources/runs/2026/09/2026-09-13-decode-path-serialization-attribution]].
**Adoption (2026-09-13).** The combined candidate is the 0.2.16 default ([[records/decisions/decode-lookahead-default-with-the-draft-head]]). docs/ENGINEERING.md quotes this sweep's split through [[records/claims/lookahead-parts-add-about-2-percent-each]].
