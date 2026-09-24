---
type: measurement
id: 01m359g1dvegvqf1carwzdrmcf
created: 2026-09-22T19:29:15.707226+00:00
updated: 2026-09-23T04:19:49.355461+00:00
summary: Incomplete active-Mac calibration preserves functional evidence, corrects historical benchmark equivalence and adds prospective host-load screening.
date: 2026-09-22
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1635'
runs: '[[sources/runs/2026/09/2026-09-22-release-speed-calibration]]'
title: Installed-release speed calibration and benchmark-profile correction
status: analysis
---
No new idle-machine speed baseline or estimator calibration is qualified by this attempt. The installed release produced complete answers, but concurrent host activity and an incomplete repeat matrix prevent updating the README's throughput headline. The same evidence does identify a documentation error: a historical 22 GB controlled benchmark was described as though it measured today's automatic configuration.

## What ran

The prospective protocol requested three rounds across eight existing public code, reasoning, prose, structured-output and dialogue fixtures. These are reused historical fixtures, not newly held-out prompts. Each prompt had a 128-token warmup followed by a natural answer with a 1024-token ceiling. The installed 0.2.23 binary used a fixed 22 GB total budget, normal prefix caching, automatic MTP/lookahead and planner-selected 2048-token passes. The effective expert pool was 3531 slots, or 73.5625 experts per layer. No inference implementation or optimization setting changed.

The attempt completed 27 requests, including 13 naturally finished answers, before being interrupted during its second round. Raw response replay passes for all completed requests; the five applicable narrow arithmetic/JSON checks pass. These checks do not establish general answer quality or release parity. The maximum native lifetime process peak was 18.574897632 GB. The original functional pilot is separate and cannot become a timing anchor.

One identical prose answer read 10.96 tok/s in the first round and 6.32 in the second, with the same output IDs, draft acceptance, forward-pass count and nearly identical expert reads. Active audio/video/browser work was subsequently observed, and the GPU remained busy after the owned model stopped. This supports refusing an idle-machine calibration; it does not prove exactly which app or mechanism caused every timing difference. All original automatic eligibility verdicts remain intact, while the separate population policy excludes the entire incomplete attempt from prospective idle calibration. No slow observation is silently removed to improve a median.

Raw evidence: [[sources/runs/2026/09/2026-09-22-release-speed-calibration]].

## Corrected benchmark interpretation

The historical 15.86 tok/s result on 0.2.19 remains a valid paired forecast comparison. Its frozen protocol forces 256-token passes, prefix caching off, two drafts, adaptive speculation off and the draft-tail experiment off. That leaves about 100 experts per layer at the 22 GB budget. Normal-cache 0.2.23 instead plans 2048-token passes and about 74 experts per layer at the same budget. The memory budget alone does not identify an equivalent runtime configuration.

README, HARDWARE and ENGINEERING now distinguish that controlled benchmark from current automatic behavior. The historical rough speed ranges retain their mixed-version, chip/SSD and configuration assumptions; they are not newly calibrated ranges. The earlier claim that the current 32 GB automatic plan had been measured directly is corrected. Historical records and their original results are preserved with a clarification, not silently rewritten.

## Prospective measurement controls

The revised harness records anonymous background CPU totals and device GPU utilization. Before model launch it requires a continuous nominal, quiet interval; between requests it checks idle GPU activity as well. While the model runs, aggregate GPU use is diagnostic because it includes the model itself, and background CPU remains screened. Thresholds are benchmark screening choices, not physical limits or complete proof of isolation: at most 5% idle GPU utilization, 50% total background CPU and 25% for any one background process, with one core represented by 100%. Samples are taken roughly every two seconds. No process names, arguments or user activity content enter those captures.

It also records the actual server memory plan before and after each request, rejects changes within a request, and does not pool different effective plans. Fixed profiles require measured reclaimable memory above the target plus 3 GB. Adaptive profiles require their expected physical peak plus 3 GB to fit both the independent VM reading and the planner's availability reading, with the declared ceiling retained. The production governor is not disabled to manufacture an automatic result.

The original process-pageins-v1 timing screen and strict global no-swap sensitivity remain separate. Older studies retain their frozen verdicts. Analysis groups actual cache hits and misses separately, checks repeated generated IDs, and tests family-held-out estimate corrections without modifying the planner. The frozen prospective 31K study must check the read-policy boundary before any 16K result is generalized to a full context window.

## Still required

Finish the quiet 22 GB repeat suite; measure the planned 10/16/24 GB and MTP-off profiles; measure new code/prose prompts at 2K, 8K, 16K and near 32K, including misses and repeats; and run the actual adaptive CLI and Desktop engine profiles when physical headroom permits. The observed actual-default preflights did not meet the measurement's physical headroom requirement, and no automatic model process was launched. Desktop's engine policy through HTTP remains distinct from Desktop UI latency.

Other Apple Silicon hardware still needs actual access. The registered Linux server and Windows machine do not qualify this Apple engine. No community report or simulated memory plan is relabeled as a new measurement. The production estimator remains unchanged: its constants also influence automatic context/workspace decisions, so changing a display number alone would silently change policy without a complete measured envelope.

## Validation and final attempt status
Both prospective idle pilot attempts ended without loading a model. The first exhausted its 900-second readiness window; its full observations are preserved in `idle-smoke-v2/`. A second attempt was stopped after continued background CPU work was independently identified as OS media-analysis activity. It left no model process. These are measurement-environment refusals, not inference failures.

Validation: 13 analysis tests, 14 host-load parsing/gate tests, and independent replay of all 27 completed response streams pass. The five applicable narrow arithmetic/JSON output checks pass and are never used to select timing observations. The revised live-plan capture still needs its real-model functional pilot before a v2 timing campaign can qualify. Larger actual-default preflights failed the prescribed headroom test; no adaptive server launched.

## Windowed readiness correction
The earlier pointwise host-load rule rejected ordinary interactive desktop bursts and prevented useful measurement. A separate v3 protocol now evaluates sampled load over the readiness or request window. This is a prospective timing screen for an interactive Mac, not proof of complete host isolation. Historical v1/v2 protocols, raw observations and verdicts remain unchanged.

The v3 window permits mean total background CPU of at most 100% of one core and mean largest-process CPU of at most 50%. Before requests, mean device GPU utilization must be at most 5%. No more than 20% of samples may exceed the burst thresholds of 200% total CPU, 100% largest-process CPU or 20% idle GPU. Aggregate GPU during model work remains diagnostic. CPU values from ps are decaying estimates, not exact interval accounting. These are explicitly chosen screening limits, informed by the earlier false readiness refusals, not measured performance boundaries. They were frozen before any v3 model request.

The independent memory, native process footprint, thermal, power, model-lock, known competing-job and paging checks remain in force. Readiness still requires two minutes of continuous memory and thermal eligibility before loading a model. Between-request readiness remains 15 seconds. Each readiness attempt is now bounded to five minutes. Windowed CPU/GPU screening does not reset the whole readiness interval for one brief desktop spike; sustained competing work still fails it. Raw snapshots retain the stricter v2 pointwise flags for sensitivity analysis.

The host-load suite passes 23 tests, including burst tolerance, sustained-load rejection, unavailable telemetry and unchanged thermal/paging exclusions. The existing 13 analysis tests also pass. A simulated loopback metadata endpoint confirms the nested runtime-plan extraction, but does not replace the required real-model pilot.

Evidence and the completed attempt status: [[sources/runs/2026/09/2026-09-22-release-calibration-load-screen-v3]]. The runtime, released binary, estimator and public speed tables are unchanged. No new speed gain is established by a benchmark-harness correction.

## Native pilot after the readiness correction
After the 10 GB pilot refused insufficient memory, a separately frozen 8.1 GB functional pilot passed both requests on the installed 0.2.23 release. This qualifies the v3 harness live-plan capture on that profile. Both requests retained 640 slots, 256-token compute passes, a 32,768-token window and MTP off; before/after runtime plans agreed with the native effective pool. Exact raw response replay and token/timing accounting pass. Neither request observed global swap activity, and the native lifetime peak was 6.066900808 GB under the 8.1 GB ceiling. The model exited cleanly and was reaped.

The responses were deliberately capped at 16 and 32 output tokens. They validate request/capture wiring, not complete-answer quality or a speed baseline. The pilot remains excluded from calibration, so its token rate cannot update README headline throughput or estimator anchors.

A prospective analysis extension now evaluates full-prefill misses using leave-one-prompt-family-out corrections within the same realized plan. Cached tokens, pilots, unregistered populations, changing plans and unequal outputs cannot train the correction. Nineteen analysis tests pass. This is an exploratory diagnostic, not a fitted production policy or evidence of transfer to other prompt lengths.

The subsequent 10 GB timing attempt and its exact disposition are preserved with the pilot at [[sources/runs/2026/09/2026-09-22-release-calibration-native-pilot-v3]]. Earlier memory refusals and frozen v1/v2/v3 attempts remain unchanged. No runtime optimization or estimator change is established by the pilot.

## Completed 2K installed-release measurements
The subsequent v3 timing phase completed three fresh-server rounds and one prospectively declared code supplemental repetition. Thirteen of fourteen requests qualify under the primary screen; all response captures replay exactly. The measured ranges and cache reuse results are now published separately at [[records/measurements/release-prefill-2k-2026-09-22]], with immutable evidence at [[sources/runs/2026/09/2026-09-22-release-calibration-2k-v3]]. Server history changes the read batches even at an unchanged memory plan, and the strict global no-swap subset is insufficient for a repeated first-read claim. The broader profile matrix, history-independent ETA calibration and full-answer decode baseline remain unfinished; the production estimator is unchanged.

## Longer-prompt continuation and remaining limits
A separate prospective 8K/16K code/prose phase completed eight requests in its first round. All raw captures replay exactly and the maximum native lifetime peak was 8.250117504 GB under the 10 GB target. Two requests failed the original thermal screen. One further repeat is excluded in derived analysis because a documentation checkout by this task overlapped it; the exclusion was registered before inspecting its result and original verdicts remain unchanged. Five observations remain eligible, with no fixture reaching three repetitions.

Every 8K/16K exact repeat in this round reused zero prompt tokens. The normal runtime cache was enabled, but its 13,382-token-unit retention allowance could not keep the requested checkpoint beside the active future sequence reservation. The generator selected the last eligible pass boundary and checkpoint admission refused it. These are real limits in this measured configuration, not evidence that the cache is disabled or that larger-budget profiles have the same result. Initial read batches also differed from later reads despite an unchanged nominal plan.

The second-round readiness attempt timed out before model launch: final-window background GPU averaged 15.90% against the frozen 5% screen. Thermal state had returned to nominal and memory headroom passed. All owned processes were reaped. Evidence: [[sources/runs/2026/09/2026-09-22-release-calibration-long-v3]].

Two follow-up hypotheses deserve matched experiments: trim genuinely unused allocator buffers before choosing an optional read scope when doing so could buy a larger scope, and retain a smaller existing pass-boundary checkpoint when the deepest one cannot fit. MLX cache-limit assignment does not itself immediately trim the cache; the allocator enforces the cap during allocation. Neither idea has been implemented or shown faster in this attempt. Both must preserve numerical pass boundaries, physical and reservation limits, active state, MTP and persistent-cache lineage. Do not turn these hypotheses into a speed claim.
