---
type: plan
id: 01m2c51px1vcmfywfwy26xfxze
created: 2026-09-13T01:10:31.073254+00:00
updated: 2026-09-13T13:44:49.943258+00:00
summary: 'Remove per-layer host synchronizations so expert reads, GPU work and host work overlap: paired exact sweeps by round, then one pre-registered held-out cohort'
date: 2026-09-12
doc: plan
kind: queue-item
level: '2'
order: '339'
title: 'Decode path serialization: overlap expert I/O, GPU work and host work instead of alternating'
status: closed
---
Opened on 2026-09-12 after the held-out B0 cohort passed ([[records/measurements/expert-lookahead-2-b0-cohort-2026-09-12]]), to take decode further from first principles. Round 1 is recorded in [[records/measurements/decode-path-serialization-round-1-2026-09-12]].

### Problem

[[records/measurements/decode-wall-time-attribution-2026-09-10]] partitions decode into expert I/O 37.2%, GPU work 30.1% and host work 32.7%, summing to 100%: the three alternate instead of overlapping. Each MoE layer materializes its routing on the host and each layer ends in a full evaluation, 96 host-blocking synchronizations per forward pass. Profiles show the host share is mostly waiting ([[records/decisions/decode-host-time-is-waiting-not-graph-construction]]), so the work is overlap and fewer real reads.

### Closed by evidence

Whole-record speculative reads (paired 1.002), nine implemented but disabled host accelerators (paired mean 1.0012), graph compilation of layer spans, and residency speculation ([[records/decisions/residency-speculation-waits-for-layer-completeness]]).

### Rounds, in dependency order

Every configuration is compared with a reference inside the same sweep by paired per-(request, round) ratios, and its output ids must equal the reference's. Exploration uses r0005, r0206 and r0096 at 256 outputs; round 5 adds r0074.

1. Round 1, done: barrier period with multi-generation pins, prefetch off, 1.025 to 1.051 with exact outputs.
2. Round 2, prefetch coverage depth: c10-s2 (the B0 setting, reference), c16-s2, c24-s2, c32-s2, c24-s1, c16 over strides 1 and 2, and c24-s2 without the margin threshold. Exit: each configuration's paired ratio, demand-record ratio and layer completeness recorded.
3. Round 3, composition: deferred router-forecast consumption (forecasts queued with asyncEval and consumed at the next barrier) built, T0 checks and exactness parity with prefetch at K=3, then k1-s2 (reference), k3-s2, k3-s3, k3-s4, k4-s4, k8-s4 and a k1-s3 control, all under prefetch. Exit: exact parity, and a paired answer to whether the barrier gain survives with prefetch on.
4. Round 4, draft depth: depths 1, 2, 3, 4 and 6 under prefetch, each under a protocol variant pinning that depth. Exit: paired ratios with tokens per verify pass and demand records per depth.
5. Round 5, router weight cache: prefetch alone, with the cache, and with the cache plus router top-k, four prompts by four rounds. Exit: whether round 1's 1.010 hint survives at 16 pairs.
6. Combination: the best setting of every lever that gained in rounds 2 to 5 built into one candidate, re-checked for exactness and screened once against the shipped path on the exploration prompts. Exit: an exact combined candidate with its screen ratio.
7. Confirmation: one held-out cohort of the combined candidate against the shipped path on B1, three rounds at 512 outputs, 36 pairs, under `process-pageins-v1` and the B0 gate. Exit: the gate verdict recorded, pass or fail.

### Held-out set B1

Registered before any round 3, 4 or 5 result existed, as `.build/decode-cpu/b1-prompts.json` (sha256 `cf519d2aee0a7470b8e8a62d9cbb7d93b60f54695ccbf20505716ae6848dfbc5`). Test split only, excluding every exploration prompt and every B0 prompt sharing a source document or family with one: code r0062 and r0033, dialogue r0296 and r0295, multilingual r0244 and r0245, prose r0171 and r0173, reasoning r0124 and r0125, structured r0256 and r0257. The exploration prompts are B0 test prompts, so no selection made on them can be confirmed on B0; the B0 result itself predates exploration and stands.

### Limits

One machine at the 20 GB profile. A lever that changes the pinned draft depth needs per-arm protocols in the bench before step 7 can compare it with the shipped path. Nothing is installed, published or committed by this plan.

### Addendum: round 2 recorded (2026-09-12)

Round 2 is done: [[records/measurements/decode-path-serialization-round-2-2026-09-12]]. The B0 coverage setting stays. Top 16, 24 and 32 at stride 2 are inert under the margin threshold, so they form an A/A comparison of the exploration sweep (paired 0.991 to 1.022): exploration differences inside about 2.5% are treated as noise, and no per-lever gain below that is claimed. Under the pre-registered rule the coverage lever carries top 24 with issue cap 32 into step 6, an inert override. Stride 1, the stride union and no threshold cut demand records by 21% to 55% but ran at 0.969, 0.991 and 0.555.

The limit on per-arm protocols is lifted for step 7: `Tools/decode_cohort.py` runs the bench-equivalent cohort with a protocol per arm, and a variant arm may differ from the base only in draft depth.

### Addendum: round 3 recorded, round 3b registered (2026-09-12)

Round 3 is done: [[records/measurements/decode-path-serialization-round-3-2026-09-12]]. Holding router forecasts until the next barrier is exact but loses 7% to 26% under prefetch, with no pair above 1, so its barrier lever has no winner.

Registered before round 3b ran and before any B1 result exists. Round 3b rebuilds with forecasts and completed-layer ticks riding the next layer's routing readback (a `RoutingReadbackQueue` drained inside `MoELayer` before the routes reach any observer), runs the weights-free checks including a new one for that queue, captures exactness with prefetch at K = 8, stride 2, then sweeps k1-s2 (reference), k2-s2, k3-s2, k4-s2, k8-s2 and k16-s2 on the exploration prompts over two rounds. Exit: exact parity and a paired answer to whether routing-readback consumption keeps the barrier gain under prefetch.

Step 6 takes its barrier lever from round 3b (`sweep-routing`) instead of round 3, whose design the rebuilt binary no longer contains; the other levers, the selection rule and step 7 are unchanged. At barrier period 1 the rebuilt binary runs the same path as the one rounds 4 and 5 use, so their results carry over.

### Addendum: round 4 recorded (2026-09-12)

Round 4 is done: [[records/measurements/decode-path-serialization-round-4-2026-09-12]]. No draft depth qualifies: depth 3 ran at 1.022 with four of six pairs above 1, depths 4 and 6 lost because each verified position loads its own experts, and depth 1 changed the greedy output under the registered shape-change interpretation. Step 6 keeps depth 2 and the protocol pin, so the combined candidate needs no protocol variant.
### Addendum: round 5 recorded, cohort start gated on quiet swap (2026-09-12)

Round 5 is done: [[records/measurements/decode-path-serialization-round-5-2026-09-12]]. The router weight cache qualifies at 1.017 over twelve pairs, ten above 1, and carries `SLOTSTREAM_OPT_ROUTER_WEIGHTS=1` into step 6; router top-k on top of it does not.

Eight of round 5's 48 cells were excluded for host swap-outs, all between about 22:55 and 23:29, after a virtualization process belonging to another application started on the host at about 22:48; swap-outs then stopped while it kept running. Registered before round 3b's results and any B1 result: steps 6c and 7 start only after the host swap-out counter has held still for five minutes, on top of the bench's per-arm readiness check. The eligibility rule and the gate are unchanged.

### Addendum: round 3b recorded (2026-09-13)

Round 3b is done: [[records/measurements/decode-path-serialization-round-3b-2026-09-13]]. Consuming forecasts at the next routing readback is exact and removes round 3's loss. The registered rule selected barrier period 4 (1.087 over six pairs, all above 1), and step 6 carries it together with the router weight cache and the inert coverage override. Two slow r0206 reference cells inflate every period's ratio; without them period 4 reads 1.014 over four pairs. The screen and the held-out cohort decide what the combination adds, and no exploration ratio is a claim.

### Addendum: steps 6 and 7 recorded (2026-09-13)

Step 6: [[records/measurements/decode-path-serialization-combination-screen-2026-09-13]]. The rule selected barrier period 4 with forecasts on the routing readback, the router weight cache and the inert coverage override; draft depth stayed at 2. The combined candidate was exact and screened at 1.104 against the shipped path, 1.018 over B0 prefetch.

Step 7: [[records/measurements/decode-path-serialization-b1-cohort-2026-09-13]]. On B1 the candidate ran at 1.116 against the shipped path, with a bootstrap lower bound of 1.073, every family at 1.037 or above, every duration shorter and identical outputs. Evidence was insufficient: r0245 kept one clean pair after host swap-outs from another application's virtual machine, so the registered verdict is not a pass and the status stays in_progress. Remaining exit: a complete B1 rerun of the same candidate on a quiet host, reported alongside this run.
### Addendum: step 7 replication and attribution sweep registered (2026-09-13)

Registered at 03:05, before either ran.

1. Step 7 replication. The same candidate and cohort plan (`plan-b1.json`, sha256 `4c41885fe40e0c6cc15333514ceada7a5a6ed1c81ec866edb2625a0d20475b3b`), the same binary (`ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db`), gates and eligibility rule. All 36 pairs run fresh into their own directory after ten minutes without host swap-outs; the virtualization process from another application, holding 8.4 GB at registration, is not waited out. The replication's verdict stands on its own, the first run is reported alongside it, and no pair from one run fills the other.
2. Attribution sweep. On the exploration prompts r0005, r0206, r0096 and r0074, four rounds at 256 outputs, reference B0 prefetch: the shipped path, B0 prefetch, B0 plus the router weight cache, B0 plus barrier period 4, and the combined candidate (`configs-attribution.json`, sha256 `5ecf111096f09fac9ce44a25866c941947273ea6cd4e3abce0952409d6109237`). It prices each part on one binary with sixteen pairs, selects nothing and changes no candidate.

### Addendum: step 7 replication passed (2026-09-13)

The registered replication passed every gate: [[records/measurements/decode-path-serialization-b1-cohort-replication-2026-09-13]]. On B1 the combined candidate ran at an aggregate 1.124 against the shipped path, with a bootstrap lower bound of 1.105, every family at 1.072 or above, every duration shorter, 34 of 36 pairs eligible and identical outputs; the first run's insufficient evidence is reported alongside it. Step 7's exit is met. The status stays in_progress until the attribution sweep and the closing profiles are recorded. Changing defaults, committing the code and any public claim remain separate decisions.

### Addendum: attribution and closing profiles recorded (2026-09-13)

The registered attribution sweep and the closing profiles are recorded, so every step of this plan has met its exit.

- Confirmation: the combined candidate passed the held-out B1 replication at 1.124 against the shipped path ([[records/measurements/decode-path-serialization-b1-cohort-replication-2026-09-13]]).
- Attribution on one binary ([[records/measurements/decode-path-serialization-attribution-2026-09-13]]): B0 prefetch is 1.090 over the shipped path; over B0 prefetch, the router weight cache adds 1.021, barrier period 4 with forecasts on the routing readback 1.022, and both together 1.046.
- Profiles ([[records/measurements/decode-path-serialization-closing-profiles-2026-09-13]]): decode waiting now splits between file reads and GPU waits, and round 1's profile split is corrected.

Defaults are unchanged and the engine changes are uncommitted. Changing defaults, committing and any public claim are separate decisions.

### Addendum: held-out cohorts rescored with true medians (2026-09-13)

The cohort report took the upper of the two middle values whenever it formed a median over an even count, so each two-prompt family counted its faster prompt. Rescored from the recorded pairs with true medians ([[sources/runs/2026/09/2026-09-13-cohort-rescoring-true-medians]]), the B1 replication is 1.114 (bootstrap 1.104 to 1.121), the first B1 run 1.106 and the B0 cohort 1.105. Every verdict is unchanged, and both passing cohorts still clear the 1.10 gate. The figures 1.124, 1.116 and 1.120 in the addenda above are the uncorrected ones.
### Shipped as the 0.2.16 default (2026-09-13)

The combined candidate that passed the B1 replication is the default in 0.2.16 wherever the draft head runs ([[records/decisions/decode-lookahead-default-with-the-draft-head]]), with the head's floor lowered to 76 experts per layer so 32 GB Macs and up get it ([[records/decisions/draft-head-auto-floor-76-per-layer]]). Implementation checks and plans by Mac size: [[records/measurements/decode-lookahead-default-2026-09-13]].
