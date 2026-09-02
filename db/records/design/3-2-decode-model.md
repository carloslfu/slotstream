---
type: design
meta-type: conclusion
id: 01m1hhwn0t70g8bdjzr4710akp
created: 2026-09-02T17:15:27.130626+00:00
updated: 2026-09-02T17:15:27.130626+00:00
summary: 3.2 Decode model
date: 2026-08-28
doc: plan
level: '3'
order: '60'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 3.2 Decode model
---

Per token: 48 layers × 10 routed experts = 480 expert-uses. With hit rate *h* on the slot
cache:

```
miss_bytes/token = 480 × (1 − h) × 2.7648 MB     (+ 16 ngram rows ≈ 1.6 KB, prefetched)
t_token ≈ max(t_compute, miss_bytes / BW_ssd_eff) + stalls
```

- `t_compute` floor: unified-memory bandwidth measured at **235 GB/s**, so a purely
  bandwidth-bound token (3.375 GB active) would be 14 ms → ~70 tok/s. But a batch-1
  4-bit matmul was measured at only **47 GB/s** (launch/occupancy-bound, not
  bandwidth-bound), so decode is dominated by **kernel-launch count**, not bytes.
  The real figure must come from running the model; do not extrapolate from either
  number alone.
- `BW_ssd_eff` (this Mac, measured never-repeat cold): **17.3 GB/s** at expert-record
  size, saturating by QD8; 9.46 GB/s even at QD1. Small-page IO is ~100× worse at
  QD1 (4 KiB: 0.08 GB/s, 53.6 µs latency) — the quantitative case for record-sized
  reads over page-granular mmap. Base-capacity SSDs on small Macs will be much
  slower; Stage C must re-measure per machine.
- Worst case h=0 (cold): 1.33 GB/token → 77 ms = **13 tok/s**, from IO alone. The
  8 GB tier is memory-constrained, not bandwidth-constrained.
- Per-layer fetch parallelism is bounded (only that layer's ≤10 misses are known before
  its MoE runs), so latency hiding comes from (a) QD within the layer, (b) overlapping the
  fetch with the shared-expert branch (independent of routed experts), (c) **cross-token
  prefetch** (issue predicted per-layer expert sets for token t+1 right after sampling
  token t — prediction = union of each layer's experts over the last W tokens).

IO-side decode bounds at the **measured 17.3 GB/s** (see MEASUREMENTS.md §M0.5;
the 5–7 GB/s originally assumed here was ~3× too pessimistic):

| h | miss MB/tok | IO ms/tok | IO-bound cap |
|---|---|---|---|
| 0.98 | 27 | 1.5 | 650 tok/s |
| 0.90 | 133 | 7.7 | 130 tok/s |
| 0.50 | 663 | 38 | 26 tok/s |
| **0.00** | 1,327 | **77** | **13 tok/s** |

**The headline consequence: even a zero-hit cache sustains ~13 tok/s from IO.**
Streaming bandwidth is therefore *not* the binding constraint on any tier; memory
(what fits) and compute (kernel-launch-bound decode) are. h still governs how far
above that floor a tier lands, so M1 still matters — but it is no longer the
difference between "viable" and "not".

The single biggest unknown in this whole plan is **h(cache_size, workload)** for this
model's router. Everything else is deterministic byte-pushing. Hence M1 exists to measure
exactly that, cheaply, before the expensive Swift work depends on it.
