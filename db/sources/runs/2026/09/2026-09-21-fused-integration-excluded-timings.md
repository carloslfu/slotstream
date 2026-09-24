---
type: run
id: 01m32yc3b55pbs986x54atx5c6
created: 2026-09-21T21:36:23.397039+00:00
updated: 2026-09-21T21:36:47.426127+00:00
summary: Fused MLX integration excluded and interrupted timings
binary: 052ff65fae371e670198e1a1fa818e2c138de376c8b70e99b758892ec7c91b35
captured_at: 2026-09-21
command: final_pipeline.py benchmark pilot; main_benchmark.py; analyze_bench.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Fused MLX integration excluded and interrupted timings
tool: Paired benchmark eligibility and protocol records
---
[Raw capture](../../../artifacts/fused-integration-2026-09-21/capture.tar.gz) and [verified member hashes](../../../artifacts/fused-integration-2026-09-21/manifest.json).

`bench-main/` is the retained 8.1 GB fresh-process pilot. Its first two completed cells both have paging and the fused cell was interrupted after the protocol amendment, with explicit cleanup. Neither supplies a qualified speed comparison. The completed cells show first read scopes of 2048 tokens followed mostly by 256-token scopes and more than 912 GB of expert reads per 8195-token prompt.

`benchmark-protocol-amendment.json` records moving the main comparison to the app checks' 10 GB budget. Budgets are never pooled. Any later per-cell timing exclusion is retained in its result and the analysis's excluded-pair lists. The 10 GB fresh-process study also stopped after paging exclusions. The warmed-server attempt in `loaded-main/` stopped after macOS reported fair thermal state and paging; it supplies no qualified timing. `settled-protocol.json` freezes the final bounded three-round 8K replication with nominal thermal checks and cooling before each cell. The series remain separate. Global paging is a speed-eligibility exclusion; it is not mislabeled an inference or process-memory failure.
