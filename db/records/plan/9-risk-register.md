---
type: plan
meta-type: operational
id: 01m1hhwp11avtmqwhxb1ntbhcx
created: 2026-09-02T17:15:28.161912+00:00
updated: 2026-09-02T17:15:28.161912+00:00
summary: 9. Risk register
date: 2026-08-28
doc: plan
kind: risks
level: '2'
order: '380'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 9. Risk register
---

| Risk | Likelihood | Mitigation |
|---|---|---|
| Expert locality worse than assumed (flat router → low h) | medium | **downgraded**: at the measured 17.3 GB/s even h=0 sustains ~13 tok/s, so low locality costs speed, not viability. M1 still sizes the tiers |
| Model is far slower than hoped for *compute* reasons (launch-bound decode) | **medium-high, newly elevated** | batch-1 4-bit matmul measured at 47 GB/s vs 235 GB/s bandwidth → decode is kernel-launch-bound. Mitigation: MLX compiled graphs (`Qwen3NextCompiledDecodeTests` shows upstream does this), fewer/larger kernels, MTP self-speculation. Measure on the real model before optimising |
| Community 4-bit conversion broken/requantized badly | medium | spot-check vs FP8 endpoint at M0; pin revision; fallback own conversion on rented box (approval-gated) |
| mlx-lm PR churn / reference impl bugs | medium | vendor the exact reference revision into repo; layerwise parity catches divergence |
| GDN port numerics (fp32 state, chunked scan) | medium | §6.2 layerwise harness from day one; keep pure-MLX-op version as oracle for any later Metal kernel |
| QSA indexer complexity (core path — dense is only exact ≤ 2048 tokens) | medium | port from reference impl; dense path as ≤2k test oracle; +1–2 d already in the M3 estimate |
| ~~`gatherQMM`/slice-write perf in mlx-swift~~ | **RESOLVED** ✅ | `MLX.gatherQuantizedMM` exists and is bit-identical to `quantizedMatmul`; batched slot scatter measured 49.8 GB/s (Swift) / 74.9 GB/s (Python, 27 GB pool), in place. ~12× faster than the SSD can feed it |
| **mlx-swift Metal shaders cannot be built by SwiftPM CLI — needs Xcode** | **CONFIRMED, resolved by vendoring** | mlx-swift's own README says so; this machine has CLT only. Workaround shipped: colocate the prebuilt `mlx.metallib` next to the binary. **Scope correction 2026-08-30 — this does not block writing new kernels.** It is about building mlx-swift's *bundled* library. A custom kernel goes through `MLXFast.metalKernel`, which JIT-compiles Metal source at runtime with no offline toolchain; `GatedDelta.swift` already ships one, and a fresh kernel was verified compiling and running on this CLT-only machine. The two were conflated and the grouped-GEMM work was wrongly called blocked |
| F_NOCACHE semantics/perf on APFS | low-med | DiskBench A/Bs it at M0; pagecache mode as fallback |
| Wired-limit ceilings on ≤16 GB Macs | high (known) | doctor measures + documents `iogpu.wired_limit_mb`; budgets sized under recommendedMaxWorkingSetSize; never auto-sudo |
| Thermal throttling on fanless Airs | high (known) | W5 soak captures sustained numbers; publish sustained not burst |
| Model is 2 days old — ecosystem/weights churn | high | pin everything; manifest checksums; §2 re-verify step in M0 is repeatable |
| Scope creep (vision, MTP, batching, other models) | high | §8 gates; v0 = text, single-flight, this model only |
