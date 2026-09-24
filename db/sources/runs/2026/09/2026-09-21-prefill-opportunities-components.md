---
type: run
id: 01m33766wpvxst5t9khkqwdmje
created: 2026-09-22T00:10:27.606566+00:00
updated: 2026-09-22T00:11:22.318114+00:00
summary: 'Remaining prefill opportunities: workspace, larger passes and sparse attention'
binary: c332baffdcd4a483f5bde79259d3d5a6e0e6aa1cdbe7d9d7d5852d951771aac2
captured_at: 2026-09-21
command: run_screens.py; run_v2.py; run_confirmatory.py; run_final_checks.py; run_verified_checks.py; run_post_checks.py; sparse_probe.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Remaining prefill opportunities: workspace, larger passes and sparse attention'
tool: Frozen Swift model checks and paired benchmark; captured-tensor MLX probe
---
[Raw capture](../../../artifacts/prefill-opportunities-2026-09-21/capture.tar.gz) and [member hashes and omitted-payload manifest](../../../artifacts/prefill-opportunities-2026-09-21/manifest.json).

Early one-cell screens test original accounting, fused-aware accounting, clearing allocator buffers before admission, and their combination. With the old 8192-token cap, accounting alone reduces requested expert bytes somewhat but has no qualified speed result. Clearing buffers leaves expert read counts unchanged and has no demonstrated repeatable gain; that code/control is removed from the retained implementation.

The normal 10 GB CLI accepts 512-token compute but changes the pool from 961 to 840 slots and immediately samples EOS in this fixture; it cannot be treated as the matched 256-token comparison. A 1024-token CLI override refuses at planning, before loading the model. The independent bounded probe then tests 256/512/1024 at the same 640-slot floor pool, 10 GB physical envelope and identical 8195-token input. All three fit: peaks 7.2532, 7.2311 and 6.9318 GB. Screen prefill times are 32.3433, 38.5833 and 42.6190 seconds; reads are 60.17, 108.29 and 237.29 GB. These are single screens without a full thermal timing receipt, not qualified speed ratios. The 512-token output differs and is EOS; larger-pass numerical/task fidelity is not assumed. The 1024 result disproves physical impossibility at this bounded configuration, not the need for conservative general planning. Neither larger pass is adopted.

The sparse component probe captures BF16 Q/K/V and actual sparse masks from three real layers at 16384 keys and 256 query rows. It tests the existing scalar selected-block kernel and GPU key compaction over 32/64/128/256-query groups against upstream force_fused. Compaction includes union/count, host synchronization, ordering, gathers, dispatch and concatenation. Five alternating rounds follow warmup. The settled run has nominal temperature at both ends, normal power and no paging. All outputs are finite; a float64 oracle checks nine head/row samples per layer, with maximum relative L2 error 0.003645 across these variants. This is bounded component fidelity, not a full-model quality result.

All 75 same-round variant comparisons are slower; sparse-paired-analysis.json preserves every ratio. All tested sparse variants are slower. Scalar selected attention achieves 0.279 to 0.281 times fused throughput. Compaction achieves 0.251 to 0.757 times fused throughput, and its best median paired latency ratio is 1.3266, about 33% slower. Only 0.59% to 1.27% of native 64-query by 32-key tiles are wholly masked; 64-query unions retain about 75% to 91% of keys. Per-query sparsity supplies little whole-tile skipping in this layout. Reject these implementations, not the possibility of a future differently organized sparse kernel. Large captured tensors are retained locally and identified by SHA-256; the public archive includes reproduction inputs, commands, source and raw results.
