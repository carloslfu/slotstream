---
type: run
id: 01m33yva8mrfge5qngzf1mm9y3
created: 2026-09-22T07:03:56.436078+00:00
updated: 2026-09-22T07:04:24.156603+00:00
summary: 'Decode opportunities: current-backend eligible timing and correctness'
binary: 772e8fe5bc969f68801f70a509f2e65500988422e4f26a46be5a302d2f2000ad
captured_at: 2026-09-22
command: Tools/optimization_build.py; Tools/serve_bench.py; barrier_remaining.py; hc_run_v2.py; hc_run_v3.py; hc_run.py; final_v2_checks.py (exact arguments in archived scripts/manifests)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode opportunities: current-backend eligible timing and correctness'
tool: Frozen Swift model/state checks, served-request A/B and verification-pass timing
---
[Immutable raw capture](../../../artifacts/decode-opportunities-2026-09-22/raw-protocols-results-and-source.tar.gz) and [archive/member hashes](../../../artifacts/decode-opportunities-2026-09-22/manifest.json).

This wrapper covers eligible timing windows and completed functional checks. Excluded timing and interrupted attempts are explicitly classified in [[sources/runs/2026/09/2026-09-22-decode-opportunities-excluded]], using the same immutable raw archive. Sharing the archive preserves original chronology and does not make all contained timings eligible.

The archive contains prospective protocols and addenda, exact command arrays, raw server/diagnostic outputs, per-request wire captures, per-arm identities, machine/preflight/native-memory observations, source archives for every frozen binary, rejected prototype source and final retained-source diff. Executables and model weights are not included; their identities are. Raw output bytes are archived directly, not reconstructed from the summaries.

## Exact invocations and binary identities

Builds use `python3 Tools/optimization_build.py --out .build/decode-opportunities-20260922/<build> --jobs 2`. The barrier drivers use `Tools/serve_bench.py` and `barrier_remaining.py` with `code-protocol.json`, `reasoning-protocol.json` and `prose-protocol.json`; each manifest and result preserves its exact command/environment. HC drivers are `hc_run_v2.py`, `hc_run_v3.py` and `hc_run.py`; final verification is `final_v2_checks.py`. The archived scripts and per-cell command arrays are the reproducible invocation contract, including input prompt bytes, flags and isolated environment.

- `build-v1`: binary SHA-256 `772e8fe5bc969f68801f70a509f2e65500988422e4f26a46be5a302d2f2000ad`; full source and metallib identity in `build-v1/candidate/build-identity.json`.
- `build-v2`: binary SHA-256 `d05f87419b80b711b56fd5ce7e89eee3d82f34325b625edd611abdcfc76e5722`; full source and metallib identity in `build-v2/candidate/build-identity.json`.
- `build-v3`: binary SHA-256 `832747380b22b02d345e82dfdc45acf198498cc08ba2a385346704c7ba4591ed`; full source and metallib identity in `build-v3/candidate/build-identity.json`.
- `build-v4`: binary SHA-256 `1fb333f4b4238c986f7b98198add700f0fde34a87a2c45a6e63bdaa959a1d738`; full source and metallib identity in `build-v4/candidate/build-identity.json`.
- `build-final`: binary SHA-256 `c86a54bddde25fff563535ecf197e6a3e1e73da767c2de89adcd26346ae2bdd1`; full source and metallib identity in `build-final/candidate/build-identity.json`.
- `build-final-v2`: binary SHA-256 `981fe6fb8064e1d457946effaca4e9f279b823f9ba6707cf991af4863de8b38d`; full source and metallib identity in `build-final-v2/candidate/build-identity.json`.

## Eligible evidence and limits

Barrier timing uses V1 for both arms, a fixed 10 GB target, equal 1217-slot pools, MTP/prefix cache/elastic off, greedy 192-token requests after separate warmup, alternating order and a verified 32768 context cap. Code rounds 1 and 3, all three reasoning rounds and prose round 1 pass the frozen interval conditions. All complete pairs, including the excluded one, are exact. The code round 3 outlier stays in the analysis; the separate background-OS-work observation does not prove its cause. Six eligible pairs have a 1.7259% median decode-time reduction; the planned nine-pair 3% gate cannot be reached even if all remaining observations saved 100%. There is no completed nine-pair qualification or 8.1 GB result.

HC V4 8K rounds 1 and 2 have exact logits and zero expert misses at all timed rows/positions. Their timing-window swap counters are unchanged and thermal/power observations pass, while whole-process preparation paging is preserved separately. Three-row paired medians are 0.6397% and 0.7272% slower. Physical peaks are 11844933032 and 11843933488 bytes under the explicit 13 GB diagnostic target. Twenty-four paired positions are insufficient to support the required 3% benefit even with twelve remaining perfect results. This is component evidence, not a served-token throughput estimate.

V2 state checks pass 1130 barrier and 1129 fusion assertions, including tested main-model state, logits, router traces and rollback continuation. The final retained build repeats barrier state checks and verifies cancellation/resume under both policies and barrier settings. The corrected passcost smoke verifies eighteen zero-miss timing samples, reported observations and a physical peak within target. Static-suite results and command outputs are in `final-v2-checks`. Functional checks do not claim speed merely because they pass.

The failure-only stop is recorded in `futility-rule.md`, `barrier-futility.json` and `hc-futility.json`. It cannot declare a winner or remove a negative observation. All owned model processes are stopped after each bounded invocation; no service or production profiling mode is left enabled.
