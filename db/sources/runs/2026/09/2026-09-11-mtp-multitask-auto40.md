---
type: run
id: 01m278snyfrypw3hezhcmx9mq7
created: 2026-09-11T03:39:50.095403+00:00
updated: 2026-09-11T03:40:00.073219+00:00
summary: Complete automatic 40% RAM MTP depth comparison with all 54 experiments and all exclusions preserved
binary: slotstream 0.2.14; SHA256 49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7
captured_at: 2026-09-11
command: python3 .build/mtp-multitask-20260911/study.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Complete MTP depth study with automatic 40% RAM and normal multitasking
tool: Stock Slotstream 0.2.14 serving metrics and resource guards
---
Complete stock-serving MTP-depth study under the automatic 40% RAM policy, with ordinary user applications left open. All 48 primary cells and all six longer finalist cells completed. Each cell also completed its own 128-token warmup, for 108 generation requests in total. No failed or excluded row was replaced, and there was no early stop.

`discarded: false` means this collection contains usable measurement evidence. It does not make every row eligible or qualify a new production default: 36 of 48 primary timings and one of six longer timings passed the resource rules. Twelve primary and four longer timings overlapped with global swap activity. The last longer timing failed the thermal rule. All exclusions, raw output tokens and request wires are preserved; excluded timings must not be used to claim a speed advantage.

Artifacts captured before the derived measurement:

- [Complete archive manifest and hashes](../../../artifacts/mtp-multitask-auto40-2026-09-11/manifest.json).
- [509 original files: drivers, all rows, request/response wires, logs and resource observations](../../../artifacts/mtp-multitask-auto40-2026-09-11/raw-results-and-drivers.tar.gz).
- [Reproducible offline analysis and paired comparisons](../../../artifacts/mtp-multitask-auto40-2026-09-11/analysis.json).
- [Completion, resource and reproducibility audit](../../../artifacts/mtp-multitask-auto40-2026-09-11/audit.json).
- [Prospective protocol](../../../artifacts/mtp-multitask-auto40-2026-09-11/protocol.json) and [driver freeze](../../../artifacts/mtp-multitask-auto40-2026-09-11/freeze.json).
- [Automatic finalist selection](../../../artifacts/mtp-multitask-auto40-2026-09-11/finalist-selection.json).
- [Stopped processes, free model lock and unchanged production bytes](../../../artifacts/mtp-multitask-auto40-2026-09-11/cleanup-proof.json).
- [Executed binary and compiled source identity](../../../artifacts/mtp-multitask-auto40-2026-09-11/build-identity.json).
- [Final host observation](../../../artifacts/mtp-multitask-auto40-2026-09-11/after.json).

The driver was `python3 .build/mtp-multitask-20260911/study.py`. Each owned child used the frozen installed Slotstream 0.2.14 binary with `serve --max-ram-percent 40 --mtp on|off --max-context 32768`, the local checkpoint and an isolated local port. Exact commands, environments and sampling requests are stored per cell. Prefix caching and elasticity remained enabled; prefill size and expert-cache size remained automatic. No explicit memory target, expert count, simulated availability or disabled-elasticity override was used.

Only the existing `SLOTSTREAM_BENCH_DETAILS=1` diagnostics and `SLOTSTREAM_DRAFT_DEPTH` were set in test-child environments. The native 20 ms physical-footprint sampler was enabled by those diagnostics; GPU/CPU tracing was not enabled or added. No installation, production source or global setting changed. Installed executable SHA256: `49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7`. Metal SHA256: `198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597`. All 150 files in the compiled-source identity still matched after the run. The separate documentation commit that landed during testing changed no compiled source.

Every archive member was decompressed and checked against its original SHA256 and length. Binary copies stay in the ignored study directory; their identities are durable here. Model identity includes configuration/tokenizer hashes and weight-header hashes, sizes and timestamps, not a new hash of the full weight payload. To repeat offline analysis, extract the archive and run its `analyze.py` beside `protocol.json`, `study/results.jsonl` and `confirmation/results.jsonl`. A new live experiment must use a fresh output directory and newly checked resource headroom.

The complete results are interpreted in [[records/measurements/mtp-depth-auto40-multitasking-2026-09-11]]. The earlier fixed-total-memory attempts remain separate in [[sources/runs/2026/09/2026-09-11-mtp-depth-fixed-total]].
