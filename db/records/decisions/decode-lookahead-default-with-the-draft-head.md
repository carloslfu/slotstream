---
type: decision
id: 01m2dg0ergyn265p9pzp507n22
created: 2026-09-13T13:41:18.736801+00:00
updated: 2026-09-13T13:41:18.736801+00:00
summary: Router-reuse prefetch, FP32 router weights and a four-layer GPU barrier run wherever the draft head does, charged 373 MiB; held out at 1.114 with identical output
decided_on: 2026-09-13
evidence: '[[records/measurements/decode-path-serialization-b1-cohort-replication-2026-09-13]]'
reversible_if: A held-out cohort or a field report shows slower decode or different output with it on, or a memory regression traces to its 373 MiB charge
title: The decode lookahead is on by default with the draft head
status: standing
---
Carlos asked to ship the decode-path work as the default and, asked which Macs should get it, answered "make your best guess". This records the choice made on that delegation.

**Decision.** The qualified decode lookahead is the default wherever the draft head runs on a cache that reaches the head's activation floor ([[records/decisions/draft-head-auto-floor-76-per-layer]]). It is the exact configuration the held-out B1 replication measured:

- router-reuse expert prefetch at stride 2: top 24 per target, issue cap 32, margin threshold 0.062, 32 staging records, 16 read lanes, slot adoption with at most 64 reserved slots, GPU forecasts;
- the FP32 router weight cache;
- a GPU barrier every four layers, with each forecast and completed-layer tick riding the next routing readback.

A T0 check parses the B1 candidate environment and requires it to equal the built-in configuration, so the default cannot drift from what was measured.

**Evidence.** On the twelve held-out B1 prompts at a 20 GB target with two drafts, the candidate decoded at 1.114 against the shipped path (bootstrap 1.104 to 1.121), every family at 1.064 or above, every family's request duration shorter and every output identical; median 11.79 to 13.47 tok/s ([[records/measurements/decode-path-serialization-b1-cohort-replication-2026-09-13]], rescored with true medians). The attribution sweep apportions it: prefetch 1.090, router cache 1.021 and barrier 1.022 over prefetch, 1.046 for both ([[records/measurements/decode-path-serialization-attribution-2026-09-13]]).

**Memory.** The plan charges 373 MiB before the expert pool is sized: the prefetch's 128 MiB staging reserve and 245 MiB of FP32 router copies (49 routers of 512 by 2560). The automatic ceiling does not rise for it; the bytes come out of the pool, about three experts per layer. `doctor` and the startup banner print the decision and the charge.

**Safety.** A deferred barrier keeps five layers of pins alive. A pass whose routed experts could not all stay pinned with the victim scan's 256-slot margin, such as a long pool pass or a pool the governor shrank, drains at every layer instead, which is the original path and computes the same values. A head forced below the floor runs without the lookahead, and the governor re-plans with the engine's decision and charge.

**Overrides.** `SLOTSTREAM_OPT_EXPERT_PREFETCH=0` turns the default off and charges nothing. `SLOTSTREAM_OPT_ROUTER_WEIGHTS` and `SLOTSTREAM_DECODE_BARRIER_LAYERS` still override their parts. `SLOTSTREAM_OPT_EXPERT_PREFETCH=1`, or an explicit `SLOTSTREAM_EXPERT_LOOKAHEAD_RESERVE_MIB`, selects the experimental configuration the tuning variables describe; tuning variables alone leave the default unchanged. Comparisons against the former default must set the switch to 0.

**Scope.** Timed on one 48 GB M5 Pro at a 20 GB target with two drafts, caches of about 88 experts per layer. The automatic ceiling's larger caches, 149 to 161 experts per layer, and other chips and SSDs are not timed; the public tier estimates hold flat above the measured cache size rather than extrapolate.
