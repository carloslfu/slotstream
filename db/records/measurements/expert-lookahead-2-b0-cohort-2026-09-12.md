---
type: measurement
id: 01m2c4qtbndan96wvqtdx8pgbc
created: 2026-09-13T01:05:06.932874+00:00
updated: 2026-09-13T13:17:58.308031+00:00
summary: 'Slot-adoption prefetch passes the held-out B0 gate: aggregate 1.105x, lower bound 1.090, every family faster, 36 of 36 pairs eligible, outputs exact; rescored from 1.120x with true medians'
date: 2026-09-12
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Held-out B0 cohort at the 20 GB profile, 36 of 36 pairs eligible under process-pageins-v1; the validation screen is in the slot-adoption record; no public claim.
order: '1250'
runs: '[[sources/runs/2026/09/2026-09-12-expert-lookahead-2-b0-cohort]]'
title: 'Expert Lookahead 2, slot adoption: the held-out B0 cohort passes the plan gate at 1.105x'
status: measured
---
**Outcome: the slot-adoption router-reuse prefetch passes the held-out B0 gate at an aggregate 1.105x.** The validation screen in [[records/measurements/expert-lookahead-2-slot-adoption-screen-2026-09-12]] measured 1.138x on frozen validation prompts; this record is the sealed held-out cohort the plan requires before the mechanism counts as proven. Candidate 7, whose file reads land in host scratch before a memory copy into the reserved slot, ran six families with two prompts each over three rounds at 512 measured outputs: 36 pairs, every one eligible under the `process-pageins-v1` rule, none excluded.

**Correction (2026-09-13).** This record first reported an aggregate of 1.120x, a lowest family of 1.093 and medians of 12.24 to 13.59 tok/s. The cohort report took the upper of the two middle values whenever it formed a median over an even count, so each two-prompt family counted its faster prompt. Scored again from the same pairs with true medians, a family being the geometric mean of its prompt medians as the registered bootstrap already resampled, the aggregate is 1.105x. It still clears the 1.10 gate and the verdict is unchanged: [[sources/runs/2026/09/2026-09-13-cohort-rescoring-true-medians]].

| gate | required | measured |
| --- | --- | --- |
| aggregate ratio (geometric mean of families, each the geometric mean of its prompt medians) | at least 1.10 | 1.105 |
| lower bootstrap bound (10,000 draws, seed 1729) | above 1.00 | 1.090 |
| lowest family | at least 0.95 | 1.065 (structured) |
| family request duration | no regression above 5% | every family shorter, 0.885 to 0.956 |
| clean pairs per prompt | at least 2 | 3 for all twelve prompts |

Every family is faster: dialogue 1.142, prose 1.130, multilingual 1.126, reasoning 1.086, code 1.083, structured 1.065. Median decode throughput rose from 12.20 to 13.50 tok/s.

**Mechanism.** Demand records fell 47.0% (median 59,390 to 31,462) with the expert hit rate unchanged (0.682 and 0.680), so the gain is reads moved off the critical path, not a larger cache. Precision was 0.557: 843,060 of 1,512,496 speculative records were adopted and 668,920 expired unused. Counting every issued record at full size, speculative reads add at most about 116 GB per request to 87.0 GB of demand reads, an upper bound near 1.24 times the control's 164.2 GB, for a 1.1 times throughput gain. Draft acceptance on the prefetch arm averaged 0.741.

**What it settles.** The plan's initial proof passes for this setting: stride 2, top 10, issue cap 16, margin threshold 0.062, 16 lanes, slot cap 64. The host I/O stall that blocked the cohort before the restart did not recur on candidate 7 across the parity run, the pilot and all 72 cohort arms. Production adoption remains separate engineering: acceptance gates, mode coverage and making the controls a default.

**Limits.** One machine at one profile and a single frozen setting. The earlier swap-stable rule would have admitted 28 of the 36 pairs; the headline uses the approved page-in rule as the protocol specifies. No number here is a public claim.

Raw report fields, counters, commands and artifact hashes: [[sources/runs/2026/09/2026-09-12-expert-lookahead-2-b0-cohort]]. Rescoring: [[sources/runs/2026/09/2026-09-13-cohort-rescoring-true-medians]].
