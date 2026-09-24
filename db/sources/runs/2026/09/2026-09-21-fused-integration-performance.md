---
type: run
id: 01m32yc3bpg07ah4t31sh0kcmm
created: 2026-09-21T21:36:23.414713+00:00
updated: 2026-09-21T21:37:06.625580+00:00
summary: Fused MLX integration paired prompt performance
binary: 052ff65fae371e670198e1a1fa818e2c138de376c8b70e99b758892ec7c91b35
captured_at: 2026-09-21
command: settled_bench.py; analyze_final.py; earlier main_benchmark.py and run_loaded.py attempts retained separately
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Fused MLX integration paired prompt performance
tool: Frozen three-arm paired benchmarks
---
[Raw capture](../../../artifacts/fused-integration-2026-09-21/capture.tar.gz) and [verified member hashes](../../../artifacts/fused-integration-2026-09-21/manifest.json).

The final settled protocol compares the saved MLX 0.31.1 executable, new MLX 0.32.2 with normal dispatch, and the same new executable with qualified fusion. Main qualification uses a 10 GB target, 256-row compute, MTP off, one output token and fresh processes. The final fixture contains exactly 8195 raw tokens; earlier separate attempts also included 16387 tokens. Three alternating rounds, cooling until nominal before each cell, source/model identities, power/load observations, process memory, exact prompt/output IDs and raw stage counters are retained. Filesystem cache is uncontrolled. This is first-prefill latency, not a cold-SSD claim.

A pair must complete with identical prompt token IDs, compute schedule, pool and MTP settings, no paging, nominal thermal state before and after, normal power, and physical peak no greater than 10 GB. Read-scope choices and expert bytes are reported separately: automatic memory scheduling and numerical routing are part of the integrated candidate, not silently held invariant. Results use the median of paired ratios, never a best run or the ratio of separately computed time medians. At least three eligible pairs are required to qualify a fixture/comparison.

| Fixture | Comparison | Eligible pairs | Result |
| --- | --- | ---: | --- |
| inventory8195 | legacy to fused | 3 | 5.22% less prefill time, 1.0550x throughput |
| inventory8195 | mlx32-default to fused | 2 | 1.80% less prefill time, preliminary only; fewer than three clean pairs |
| inventory8195 | legacy to mlx32-default | 2 | 2.95% less prefill time, preliminary only; fewer than three clean pairs |

Full arithmetic, pair membership, exclusions and observed profiles are in `benchmark-analysis.json`. Launch/request reductions are recorded separately from prefill. A single output token is a timing instrument, not an answer-quality test; numerical and behavioral qualification is recorded in the correctness run. Stage timers cover observed CPU/I/O/GPU waits and are not a complete GPU attribution.
