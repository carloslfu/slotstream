---
type: measurement
id: 01m1hhwkkdzaeyac158qff38gv
created: 2026-09-02T17:15:25.677133+00:00
updated: 2026-09-02T17:15:25.677133+00:00
summary: 'The parity method finding: pin the MLX version or you measure the wrong thing'
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M3/M4
order: '150'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'The parity method finding: pin the MLX version or you measure the wrong thing'
status: measured
---

First parity runs compared against Python **mlx 0.32.2** and showed 3–4%
everywhere. Rerunning the identical computation under **mlx 0.31.1** (what
mlx-swift 0.31.6 vendors): the same `quantized_matmul` differs between 0.31.1 and
0.32.2 by up to 0.5 absolute (0.19% of max) — **kernel changes between MLX
versions dominate porting error**. Against version-matched goldens, my first
divergence (hyper-connection `down` matmul) became **0.0 — bit-identical**.

The residual layer-2/3 drift enters at a few bf16 ulps in one low-rank projection
(mlpHC `down`, 558/15,360 elements at ≈3 ulps) with bit-exact inputs — consistent
with mlx-swift's vendored MLX commit not being byte-identical to the 0.31.1 wheel
for one kernel variant, then amplified by RMS-norm rescaling into the next layer.
Since layers 0–1 prove every structural path (streaming MoE, GDN, PLE,
hyper-connections, embeddings) bit-exact, this is numerics skew, not porting
error. Parity gate adopted: layers 0–1 must be bit-exact; deeper layers RMS-rel
≤ 3e-2 (tracked, with the ulp origin documented).
