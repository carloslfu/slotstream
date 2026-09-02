---
type: measurement
id: 01m1hhwk81y1qh9qreg5ct1e7g
created: 2026-09-02T17:15:25.313353+00:00
updated: 2026-09-02T17:15:25.313353+00:00
summary: M0.3 — MLX slot-pool capability (the M3 entry gate)
date: 2026-08-28
doc: measurements
level: '2'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '40'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: M0.3 — MLX slot-pool capability (the M3 entry gate)
status: measured
---

`Tools/slotbench3.py`. Batch = 48 experts (132.7 MB), the plausible per-token miss set.

| Pool | Strategy | ms/batch | GB/s | Verdict |
|---|---|---|---|---|
| 5.66 GB (2,048 slots ≈ 43/layer) | contiguous slice | 1.24 | 107.31 | PASS |
| | `slice_update` | 1.34 | 98.74 | PASS |
| | **batch scatter** | **2.70** | **49.22** | PASS |
| | per-slot assign | 9.19 | 14.44 | PASS |
| **27.10 GB (9,800 slots ≈ 204/layer)** | contiguous slice | 1.17 | 113.80 | PASS |
| | `slice_update` | 1.18 | 112.72 | PASS |
| | **batch scatter** | **1.77** | **74.86** | PASS |
| | per-slot assign | 7.79 | 17.03 | PASS |

- **In-place confirmed**: peak memory 27.32 GB against a 27.10 GB pool + 0.13 GB
  staging. No full-pool copy.
- Throughput *improves* with pool size (49 → 75 GB/s), confirming cost is
  proportional to the batch, not the pool.
- **Gate passed with ~12× margin**: writing 48 experts costs 1.77 ms vs ~22 ms for
  the SSD to deliver those bytes at 6 GB/s. Slot writes are not the bottleneck.

⚠️ **Methodology note — a wrong first measurement.** `slotbench.py` (v1) called
`mx.eval()` after *every single expert*, which measured per-write GPU sync, not the
copy, and reported 1.54 GB/s at 27 GB — an apparent gate failure. Batching writes
before one `eval` is what a real engine does; v1's number is an artifact. Retained
in-repo as a caution.

`gather_qmm` correctness: `mx.gather_qmm` over the pool vs `mx.quantized_matmul` on
the same expert → **max abs diff 0.000e+00** (bit-identical). vs dequantize-then-dense
→ 6.6e-3 relative (expected 4-bit quantization error).
