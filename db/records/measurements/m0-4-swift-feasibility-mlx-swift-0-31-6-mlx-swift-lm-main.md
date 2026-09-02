---
type: measurement
id: 01m1hhwk94bg1cen89ptjfkkn6
created: 2026-09-02T17:15:25.348818+00:00
updated: 2026-09-02T17:15:25.348818+00:00
summary: M0.4 — Swift feasibility (mlx-swift 0.31.6, mlx-swift-lm main)
date: 2026-08-28
doc: measurements
level: '2'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '50'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: M0.4 — Swift feasibility (mlx-swift 0.31.6, mlx-swift-lm main)
status: measured
---

Resolved and inspected. **Far more prior art than the plan assumed:**

| Need | Status in Swift |
|---|---|
| Slot-pool gather | ✅ `MLX.gatherQuantizedMM(x, w, scales:, biases:, rhsIndices:, transpose:, groupSize:, bits:, mode:, sortedIndices:)` — `Ops.swift:1468`, wraps `mlx_gather_qmm` |
| MoE block | ✅ `SwitchGLU` / `QuantizedSwitchLinear` in `MLXLMCommon/SwitchLayers.swift`, incl. a `gatherSort`/`scatterUnsort` fast path and a custom Metal unsort kernel |
| **Gated DeltaNet** | ✅ `Qwen3NextGatedDeltaNet` + `gatedDeltaUpdate` in `MLXLLM/Models/Qwen3Next.swift`, with `conv1d`, `dt_bias`, `A_log`, and a `decodeConv` fast path |
| Attention / norms | ✅ `scaledDotProductAttention`, `rmsNorm` in MLXFast |
| Slot writes | ✅ `MLXArray` subscript assignment (`ArrayAt.swift`, `MLXArray+Indexing.swift`) |
| **QSA indexer** | ❌ must implement (genuinely novel) |
| **Hyper-connections** | ❌ must implement (small: 2 low-rank matmuls + sigmoid) |
| **N-gram / PLE** | ❌ must implement (streaming-critical) |

**This materially shrinks M3.** The plan's long pole assumed porting GDN from
scratch; `Qwen3Next.swift` is a near-drop-in (qwen4_exp splits `in_proj` into
qkv/z/b/a where qwen3_next fuses them — mechanical). Remaining novel Swift work is
the QSA indexer, hyper-connections, and the PLE path.
