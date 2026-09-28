---
type: measurement
id: 01m33yva9w6njhe11qz3sc07je
created: 2026-09-22T07:03:56.476692+00:00
updated: 2026-09-22T07:03:56.476692+00:00
summary: 'Remaining decode opportunities: current-backend tests do not qualify new defaults'
date: 2026-09-22
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1616'
runs: '[[sources/runs/2026/09/2026-09-22-decode-opportunities]], [[sources/runs/2026/09/2026-09-22-decode-opportunities-excluded]]'
title: 'Remaining decode opportunities: current-backend tests do not qualify new defaults'
status: measured
---
The two remaining decode proposals were implemented or exercised against the current release source and measured before deciding whether to keep them. Neither qualified a production default change. Production engine sources remain byte-identical to baseline; only hidden diagnostics and their correctness checks change.

## Scope and method

Baseline is commit `14fb9aa3c253908cf7705b62780b28039ab42f92`, after release 0.2.23, on the M5 Pro 48 GiB development Mac, macOS build 25G83, with MLX 0.32.2 and the pinned Qwen Flash-Next checkpoint. Build identities, source archives, prospective protocols, raw results and every excluded or interrupted attempt are preserved in the linked runs. These experiments concern decode after prompt preparation. They do not establish another CPU/GPU/SSD percentage decomposition or a model-quality improvement.

Both proposals target actual waits or a small amount of GPU pointwise work. The previous host elapsed-time categories are not a budget of removable graph-construction time; see [[records/decisions/decode-host-time-is-waiting-not-graph-construction]]. Deferring a barrier cannot eliminate the next router result dependency or an expert cache miss. Pointwise hyper-connection fusion leaves the weight projections, attention, expert reads and most model arithmetic unchanged. MLX 0.32.2 already compiles SiLU, further reducing the additional work available to fuse.

## Deferred layer barriers in plain decode

The existing control was sufficient: compare `SLOTSTREAM_DECODE_BARRIER_LAYERS=1` with `4`, using the same frozen V1 executable. MTP and lookahead are off; memory target is 10 GB, actual pool is 1217 slots in every arm, elastic resizing and prefix caching are disabled, and the actual context cap is 32768. Every arm has a separate same-prompt warmup followed by a greedy measured request capped at 192 output tokens. Workloads are public code, reasoning and prose fixtures. Order alternates across rounds. Expert counts are application reads, not physical SSD-device bytes; filesystem cache is uncontrolled.

The frozen adoption gate requires at least 3% median paired decode-time reduction across nine eligible pairs, no workload regressing by more than 1%, exact outputs, equal decode work, no more than 1% additional expert reads and physical peak within target. Global swap activity or nonnominal thermal observations exclude timing. An added readiness wait strengthens preparation without relaxing those gates.

| Workload | Eligible pairs | Paired decode-time reduction |
| --- | ---: | --- |
| Code | 2 | +8.04% and -33.94% |
| Reasoning | 3 | +1.79%, +1.66%, +0.44%; median +1.66% |
| Prose | 1 | +2.87% |

All six eligible pairs have exact output IDs/text and matched decode work. Their observed median reduction is 1.73%. A second code pair is paging-excluded. The slow third code pair passes the frozen interval gates and stays included. A macOS scanner was observed afterward during that cohort; there is no trace proving it caused the slowdown. This noisy outlier is neither silently discarded nor treated as a causal 34% regression estimate.

The bounded study stopped for failure-only futility: even assigning 100% savings to all three remaining planned pairs would put the final median at only 2.8734%, below 3%. One in-progress prose process was stopped and its incomplete logs preserved. This stopping rule cannot declare success and does not manufacture a completed nine-pair study. The 8.1 GB follow-up was conditional on a promising 10 GB result, so it was not run. Larger budgets, other Macs and other workloads remain unqualified by this test.

Decision: keep the existing one-layer default where lookahead is absent, the existing qualified four-layer lookahead behavior, and the explicit override. The small reasoning/prose signal remains a plausible workload-specific gain, but this test does not justify broadening the automatic default.

## Hyper-connection pointwise fusion

The archived compiled gate/mix/injection prototype was restored behind a default-off control, with unchanged projections and an expanded exact BF16 self-check. Testing used actual production attention dispatch: stock at the shorter context, split above the existing 6144 threshold. This avoids treating a historical forced-split-at-4K result as production evidence.

The component screen used one 13 GB process, a 16384-token context cap, actual contexts of roughly 4068 and 8183 tokens, rows 1 through 3, twelve paired positions after warmup and rotated mode order. Each arm starts from the same model-state checkpoint. The larger diagnostic target permits all experts in a verify pass to remain resident; it is not a small-memory end-to-end serving claim. Recorded physical peaks in the two eligible long-context runs are about 11.84 GB, below the explicit target.

Initial screens revealed that one warmup pass does not always establish an all-hit CLOCK cache. Those timings were not promoted. The corrected diagnostic warms each actual mode separately, restores the same state, requires zero expert misses before and during timing, and records native VM/thermal observations around the timing loop. Startup paging remains recorded separately. A bounded optional settle after preparation requires ten nominal observations, with a 180-second abort limit; it is a diagnostic observation policy, not a guarantee that temperature cannot change between observations.

| Actual ~8K context | Three-row paired median change | All timed expert misses | Logits |
| --- | --- | ---: | --- |
| Eligible process 1 | 0.640% slower | 0 | Exact |
| Eligible process 2 | 0.727% slower | 0 | Exact |

These two timing windows have unchanged native swap counters, nominal thermal observations and low-power mode off. The 24 paired three-row positions contain only one reduction of at least 3%. Even twelve remaining perfect observations could raise the planned final median only to 0.0692%; the third process was stopped during preparation under the failure-only rule. One-row medians improve by 0.49% and 0.93%; two-row medians regress by 1.23% and 1.04%. None supplies the required repeatable 3% component improvement. The 4K attempts were excluded for misses, paging or thermal conditions, so no clean 4K speed estimate is claimed.

Decision: remove the production prototype and its control. There is no full-request fusion speed claim. Exact arithmetic alone does not justify carrying production complexity when the relevant measured component does not improve. Raw prototype source is retained for a future backend or kernel change.

## Retained implementation and verification

The useful implementation is diagnostic-only:

- A `decode-barrier` state-check variant compares the deployed arithmetic under one- and four-layer drains, including exact logits, main-model state tensors, ordered router traces, verify rollback at each kept row and continued logits. It also checks bounded pin generations and retained pins. The final check passes 1130 assertions. This main-model test does not by itself certify every MTP-head tensor.
- `mtp-passcost` rebuilds long prefixes in bounded 256-token passes; its attention-mode comparisons prove each mode is all-hit before timing, fail on timed expert reads and emit raw per-position results plus timing-window conditions and physical peak. The optional thermal settle and additional probes exist only in the hidden diagnostic command.
- The lifecycle check now covers both deployed aligned-prefix resume and legacy extend-only resume. Its old assertions incorrectly demanded reuse of tiny, unaligned decoded continuations under the new deployed policy. The original test failed identically at barriers one and four. The corrected test verifies that deployed mode rebuilds and creates a fresh aligned draft, while legacy reuse refuses stale draft verification. Cancellation at a committed 256-token prefill boundary remains covered.

The final build passes 1130 barrier/state assertions and 154 lifecycle assertions at each barrier setting. The passcost smoke completes eighteen zero-miss samples, reports its timing conditions and peaks at 9036485168 bytes under the 13 GB target. This stock/split/exact smoke checks the diagnostic contract; it does not assert those distinct attention modes produce identical logits. The complete static suite passes, including 420 memory-override cases and installer checks.

The prototype changes are not shipped, normal run/serve instrumentation is unchanged, and no inference service is left running. Raw successful, excluded, interrupted and initially failing checks are linked separately rather than overwritten.

Runs: [[sources/runs/2026/09/2026-09-22-decode-opportunities]], [[sources/runs/2026/09/2026-09-22-decode-opportunities-excluded]]. Decision: [[records/decisions/decode-opportunities-stay-opt-in-2026-09-22]].
