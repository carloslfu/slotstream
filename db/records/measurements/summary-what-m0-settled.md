---
type: measurement
id: 01m1hhwm1e0tpwwaxpd53shvk8
created: 2026-09-02T17:15:26.126510+00:00
updated: 2026-09-02T17:15:26.126510+00:00
summary: Summary — what M0 settled
date: 2026-08-28
doc: measurements
level: '2'
order: '370'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Summary — what M0 settled
status: analysis
---

**Verified correct in the plan** (no change needed): expert record geometry
(2,764,800 B exactly), routed-expert total (67.948 GB), per-layer expert block
(1.4156 GB), shared experts (133 MB), routers (126 MB), total checkpoint (~104 GB),
16 KiB record padding arithmetic, and the review-pass correction that QSA's dense
path is exact only up to the 2048-token indexer budget.

**Corrected by measurement**: n-gram store structure (320 M rows × 160 dims × 100 B
= 32.0 GB, group size 32 — not 20 M × 2560 × 1440 B = 28.8 GB) and its per-token cost
(1.6 KB, not 23 KB); resident floor (3.822 GB, not ~3.3); SSD throughput (17.3 GB/s,
not 5–7); the memory ceiling that actually binds (Metal working set 37.4 GiB, not
48 GB of RAM); and the low-end decode estimates, which were pessimistic on the IO
axis by roughly an order of magnitude.

**Discovered, unplanned**: (1) MLX cannot sparsely materialise a memory-mapped
tensor, which makes the bounded slot pool mandatory rather than optional and merges
M3/M4 into one gating milestone; (2) mlx-swift's Metal shaders cannot be built by
SwiftPM CLI — Xcode or a vendored metallib is required, which changes M7 packaging;
(3) `mlx_lm.load()` defaults to `lazy=False` and will drive a 48 GB Mac to 48 GB of
swap; (4) decode is kernel-launch-bound (batch-1 matmul reaches 20% of memory
bandwidth), which displaces IO as the top performance risk.

**De-risked**: the M3 entry gate (slot writes 49–75 GB/s, in place, ~12× faster than
the SSD can feed them), `gatherQuantizedMM` bit-exactness in both Python and Swift,
and the existence of Swift GDN/MoE prior art.

**Not achieved**: no end-to-end generation of the full model, because the stock path
cannot produce one on this machine and the bounded path is M3/M4 work. No expert
locality curves from the real model (the trace collector and simulator are built and
the simulator is validated on synthetic input, but collecting real traces requires
the same bounded forward pass). M1's h-curves remain open — though they no longer
gate viability, only tier sizing.
