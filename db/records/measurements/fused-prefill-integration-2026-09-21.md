---
type: measurement
id: 01m32yc3c8kgtmwcg6k6f7cydc
created: 2026-09-21T21:36:23.432123+00:00
updated: 2026-09-22T05:41:23.359502+00:00
summary: Qualified fused prefill integration and remaining bottlenecks
date: 2026-09-21
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Remaining workspace, expert-read, larger-compute and sparse-attention opportunities were tested in [[records/measurements/prefill-opportunities-2026-09-21]]; original integration result is unchanged.
order: '1612'
runs: '[[sources/runs/2026/09/2026-09-21-fused-integration-correctness]], [[sources/runs/2026/09/2026-09-21-fused-integration-performance]], [[sources/runs/2026/09/2026-09-21-fused-integration-compatibility]], [[sources/runs/2026/09/2026-09-21-fused-integration-excluded-timings]]'
title: Qualified fused prefill integration and remaining bottlenecks
status: measured
---
The upstream fused D256 prefill path is integrated in the working tree, with matched CLI and Mac-app dependencies, shader packaging, cache identity and numerical/runtime qualification. This is local integration, not a published release. Automatic forcing is limited to the tested Mac17,9 / M5 Pro / macOS build 25G83 profile. Other devices retain MLX dispatch; explicit forcing still requires supported NAX hardware and BF16 prefill geometry.

## Measured gain and limits

| Fixture | Comparison | Eligible pairs | Result |
| --- | --- | ---: | --- |
| inventory8195 | legacy to fused | 3 | 5.22% less prefill time, 1.0550x throughput |
| inventory8195 | mlx32-default to fused | 2 | 1.80% less prefill time, preliminary only; fewer than three clean pairs |
| inventory8195 | legacy to mlx32-default | 2 | 2.95% less prefill time, preliminary only; fewer than three clean pairs |

All three integrated pairs improve prefill time, by 3.74% to 5.66%; median saved time is 1.55 seconds. The fused candidate stays below 8.23 GB physical peak in these three cells. The third normal-dispatch control has paging, so it is excluded from both component comparisons while the clean old/fused pair remains eligible. No 16K speed percentage is qualified.

The main comparison uses this 48 GB Mac, a 10 GB engine target, identical raw inventory prompts, 256-row compute and fresh processes. It reports medians of eligible paired ratios. The original 8.1 GB pilot is retained separately and supplies no speed claim. These results do not imply the same gain at another memory budget, on another Mac, on warm-prefix hits or for every prompt. Read-scope schedules and routing can change the number of expert reads; the report preserves them for each pair. No across-study percentage is compounded with earlier prompt optimizations. The integrated old-backend comparison and the fusion-only comparison have separate eligibility counts. Fewer than three clean fusion-only pairs cannot establish a qualified fusion-only percentage. Adoption concerns the complete tested integration; it does not imply that all its gain came from attention.

## Integration and correctness

mlx-swift is pinned at ab924c82ead3b970caaa1c0ac11171de23f0305a with MLX 0.32.2 and matching verified shaders. Upstream [D256 NAX attention](https://github.com/ml-explore/mlx/pull/3842) is by wyanzhao; [force_fused](https://github.com/ml-explore/mlx/pull/4185) is by hojin12312. The later [automatic array-mask dispatch](https://github.com/ml-explore/mlx/pull/4416) is by dwijenpatel and is unnecessary for this explicitly selected path. The integration and qualification here use those upstream mechanisms.

Causal and explicit sparse masks pass an independent scalar Double oracle on actual BF16 inputs. Decode/short verify and unsupported dtypes preserve their paths. Both main-layer and draft-head Python comparisons pass under the new backend; the MTP reference is bit exact. Exact warm/cold cache logits, disk reopen, invalidation, pool changes, speculative rollback, vision, APIs and real app lifecycle checks pass. Backend/environment/GPU/OS identity prevents an old disk checkpoint from inheriting changed arithmetic. The old MLX 0.31 draft-head golden still differs and remains visible; no historical golden is regenerated and no tolerance is widened. The old arbitrary-rechunk heuristic is a reproducible optional diagnostic, while actual same-schedule cache equivalence stays mandatory.

The catalogue passes 72 groups / 31,677 assertions; the final upgrade rerun passes seven acceptance groups. The preceding full battery's 26 passing live groups remain supported by identical production engine semantics, with comment-only engine changes and re-run CLI diagnostics documented by source hashes. All three real Mac checks, the scripted UI suite, bundle build, external Swift consumer and final static/installer gates pass. Numerical and behavioral evidence is bounded and is not a general claim of improved model quality.

## What limits further gains

1. The planner still prices the unfused query-by-context intermediates in `ContextWorkspace.prefillBytes`. Fusion removes the full per-head score/probability buffers, but indexer masks, dense/GDN activations, expert workspace and short-path fallbacks still need reservations. A backend-aware reservation and larger compute passes need independent physical-peak, cancellation, retained-cache and exact-resume qualification before adoption.
2. Memory-eligible expert-read scopes can dominate the outcome. At 8.1 GB the pilot reads more than 912 GB for 8195 tokens; at 10 GB the first baseline cell keeps an 8192-token scope and reads about 60 GB. At 16K, later scopes can contract as context and retained state grow. The opportunity is fewer rereads while retaining the process ceiling, not simply raising a memory limit or multiplying a kernel speedup into a full-request promise.
3. The pinned fused kernel loops over key tiles and computes QK before applying an arbitrary mask. Truly sparse tiled attention could avoid discarded-key work, but per-query selections make efficient matrix tiling and reuse difficult. Kernel-level measurements and actual selection locality are needed; the existing experimental scalar selected-attention kernel is not automatically promoted.
4. Expert matrix multiplication, GDN/dense layers, host synchronization and storage remain. Observed stage counters in the benchmark identify waits but do not fully attribute the remaining GPU work. A full trace should guide the next kernel change. The later upstream dispatch patch alone does not add another kernel gain to an already forced path.

Raw evidence: [[sources/runs/2026/09/2026-09-21-fused-integration-correctness]], [[sources/runs/2026/09/2026-09-21-fused-integration-performance]], [[sources/runs/2026/09/2026-09-21-fused-integration-compatibility]], [[sources/runs/2026/09/2026-09-21-fused-integration-excluded-timings]]. Adoption: [[records/decisions/qualified-upstream-fused-prefill]].
