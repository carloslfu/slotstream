---
type: measurement
id: 01m2dgm1j3j2ay1zry0ptmj5ad
created: 2026-09-13T13:52:00.579893+00:00
updated: 2026-09-13T13:52:00.579893+00:00
summary: 0.2.16 defaults pass every weights-free check; auto runs the draft head and decode lookahead from a 21 GB target, 32 GB Macs and up; 8 GB plans are refused
date: 2026-09-13
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Weights-free implementation qualification and simulated plans by Mac memory; no model process and no timing.
order: '1370'
runs: '[[sources/runs/2026/09/2026-09-13-decode-lookahead-default-tier-plans]]'
title: 'Decode lookahead default: checks and plans by Mac memory'
status: measured
---
**Outcome: the 0.2.16 defaults are implemented and pass every weights-free check. Auto now runs the draft head and the decode lookahead from a 21 GB target, which puts 32 GB Macs and up on them at the default context; an 8 GB Mac is refused because even the smallest plan does not fit.** The decode lookahead is the exact configuration the held-out B1 replication measured at 1.114 ([[records/measurements/decode-path-serialization-b1-cohort-replication-2026-09-13]]); this record prices where the defaults turn on, not a new timing.

**What changed.** The planner decides the lookahead with the head and charges its 373 MiB, the prefetch staging reserve and the FP32 router copies, before sizing the expert pool. The engine loads the qualified configuration when the plan chose it and no prefetch switch is set, then turns on the router cache and a four-layer barrier unless the environment names either. A deferred barrier falls back to draining every layer when a pass could not keep that many layers pinned. The governor re-plans with the engine's decision and charge. The head's automatic floor is 76 experts per layer after its charge ([[records/decisions/draft-head-auto-floor-76-per-layer]], [[records/decisions/decode-lookahead-default-with-the-draft-head]]).

**Checks.** On the 0.2.16 build, 50 of 50 T0 and T1 checks pass (29,987 assertions), including a new 32-assertion check that parses the B1 candidate environment and requires it to equal the built-in configuration. The planner gates pass 73 of 73 with new checks at the floor, by Mac size, at the 65,536-token window and for the `SLOTSTREAM_OPT_EXPERT_PREFETCH=0` override. The static gates passed on the build before the version bump. Two checks failed on the first build and one on the second; each was a fixture or expectation error, recorded with its fix in the run.

**Plans by Mac memory**, pristine what-if at the default window:

| Mac RAM | automatic target | experts per layer | head and lookahead | plain-decode estimate |
| --- | ---: | ---: | --- | ---: |
| 8 GB | refused | | | |
| 16 GB | 10 GB | 20 | off | 4.00 |
| 18 GB | 11.5 GB | 28 | off | 5.54 |
| 24 GB | 16 GB | 54 | off | 7.61 |
| 32 GB | 22 GB | 74 | on | 8.68 |
| 36 GB | 25 GB | 96 | on | 9.68 |
| 48 GB | 33.6 GB | 161 | on | 11.60 |
| 64 GB and up | 34.6 GB | 149 | on | 11.56 |

At the 65,536-token window a 32 GB Mac's cache falls below the floor and runs without the head, while 36 GB keeps both; a 16 GB Mac's cache drops from 20 to 13 experts per layer, and a full window waits about 12.9 minutes against 6.4 at 32,768. From 24 GB a full 32,768-token prompt waits 3.0 to 3.3 minutes and a 65,536-token one 7.5 to 7.8 minutes. These plans back the public tier tables, their context recommendations and [[records/claims/recommended-context-65536-from-36-gb]].

**Limits.** Planner arithmetic on simulated machines; estimates use the M5 Pro curve and do not include speculative decoding. No model process ran: a functional run of the automatic path needs a target of at least 21 GB, which the host's reclaimable memory did not allow while another application's virtual machine held about 9.7 GB. Public speed figures come from the B1 measurement, the 0.2.14 depth study and the claims that cite them.

Commands, build identities, per-size plans and hashes: [[sources/runs/2026/09/2026-09-13-decode-lookahead-default-tier-plans]].
