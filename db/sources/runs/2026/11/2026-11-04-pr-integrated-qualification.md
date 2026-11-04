---
type: run
id: 01m6m5ep1njzq6b1tkbbaxxn03
created: 2026-11-04T20:54:18.933583+00:00
updated: 2026-11-04T20:54:19.992817+00:00
summary: Integrated PR hardening qualification and paired regression runs
binary: dfc058b53b9e4a02fe492ec38f5c2edd30d8d4b5aad1d48d402cebdea07e1ff9
captured_at: 2026-11-04
command: Exact commands and exits in archived check-status.json; frozen benchmark plan and complete logs retained
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Integrated PR hardening qualification and paired regression runs
tool: Native release catalogue; Tools/verify.sh; Tools/static_gates.sh; Tools/consumer_smoke.sh; Tools/prefill_bench.py
---
[2026-11-04-pr-integrated-qualification.tar.xz](2026-11-04-pr-integrated-qualification.tar.xz) preserves 286 exact evidence files. SHA-256 `2665e324c3c53c77e370b10be298260c4c0ca63546f091c8b26d4eca3bfe1cb8`. Every member is read back and compared with its input. Model weights, executables, metallib and temporary caches are excluded. The reconstructible native build-source archive is included.

The tested release executable is SHA-256 `dfc058b53b9e4a02fe492ec38f5c2edd30d8d4b5aad1d48d402cebdea07e1ff9`, its source archive `9491c0b774b13413566d9b67f9a723253853077c4fe22705c168d6d557fbb5c3`, and metallib `dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed`. The source hashes match the integrated checkout. `final-code.patch` reconstructs all code/tool changes on main `d566a418bf41d5d41c92c218220f917c1a7fb575` without the evidence files themselves. Original PR heads, individual review notes and conflict-resolution trees are retained in `per-pr-review.json` and `integration-rows.jsonl`.

`check-status.json` records exact commands and exits. The complete live-model acceptance log and artifacts, native catalogue results, model-free static suite, external Swift consumer, context proxies and both frozen final baseline comparisons are retained. Benchmark protocols were frozen before the final launches. Original prose round 3 was discarded for timing after eight global swap-in pages; all raw cells remain. A frozen addendum repeats that whole pair without changing settings or thresholds. The aggregate analysis uses the first three eligible pairs per fixture, checks every captured process against the production memory gate, and retains the excluded pair separately. Runs use one model process at a time, explicit bounded targets and real headroom preflights.

Initial focused failures are preserved together with successful corrected reruns. The stronger full memory gate also caught negative values being parsed as options; the final gate binds them with `--memory-gb=value` so actual memory validation must reject them. Its failed full-suite attempt is preserved. The first external-consumer attempt hit a local Git HTTPS-to-SSH rewrite; the successful rerun uses public HTTPS with `GIT_CONFIG_GLOBAL=/dev/null` scoped to that command, without changing user settings or the smoke test. The first full static attempt stopped when the auxiliary checkout lacked `.build` for its receipt; creating that output directory allowed the unchanged suite to continue. The old MLX 0.31 draft-head diagnostic differs; it remains a diagnostic, with independent current-backend parity required and passed. No old reference or failure was rewritten. This is local qualification on one Mac, not a release receipt or proof for all hardware and client workloads.
