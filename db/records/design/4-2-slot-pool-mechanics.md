---
type: design
meta-type: conclusion
id: 01m1hhwn610ktz3pf2njdm2d0x
created: 2026-09-02T17:15:27.297399+00:00
updated: 2026-09-02T17:15:27.297399+00:00
summary: 4.2 Slot pool mechanics
date: 2026-08-28
doc: plan
level: '3'
order: '110'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 4.2 Slot pool mechanics
---

> **Measured 2026-08-28 — the slot pool is mandatory, not an optimisation.**
> MLX has no sparse-materialisation path out of a memory-mapped tensor:
> `mx.gather_qmm` with top-10 indices materialises **all 512 experts of the layer**
> (471.9 MB for one projection → ~68 GB across the model), and a 16-row `mx.take`
> on an n-gram shard materialises **the whole 200 MB shard** to read 1.3 KB. Stock
> lazy loading therefore pulls in ~100 GB and dies on any prompt length. A
> pre-allocated, fully-resident, bounded pool that we fill by explicit `pread` is
> the only construction that avoids this under MLX. See MEASUREMENTS.md §M0.8.


- One **global pool across layers** (all experts share the shape 3×2560×640): quantized
  weight/scales/biases tensors sized `[S, …]`; per layer, router output ids are mapped
  through the slot table → `gatherQMM(x, pool…, rhs_indices: slots)`. Misses trigger IO;
  the token's active slots are pinned until the step completes.
- Eviction: start with CLOCK + frequency byte (approximates LFU-with-decay); simulator
  (M1) also scores LRU and W-TinyLFU on real traces — cheapest adequate policy wins.
- Slot fill v0: staging buffer → sliced write into the quantized pool arrays (they're
  plain uint32/fp16 tensors; a 2.76 MB device copy is ~µs against memcpy bandwidth).
  v1 option if profiling demands: pread directly into the pool's MTLBuffer contents
  (shared storage mode on Apple Silicon needs no sync) — measure before adopting.
- Resizing: default is a **single pool** — `gatherQMM` gathers within one tensor, and
  sharding the pool would put per-segment dispatch on the hot path. Governor shrink/grow
  = rebuild the pool at the new size (rare event, costs seconds, keeps the hot path
  clean). A segmented variant is adopted only if microbenching shows per-segment
  dispatch overhead is negligible.
- **M3-entry gate — the slot-write microbench (before any streaming work):** prove that
  scattered writes into the quantized pool tensors execute in place (MLX buffer donation
  — no full-pool copy per update) and sustain > 5 GB/s of slot fills. If MLX's
  functional-update semantics force copies at this size, switch to preads directly into
  the pool's MTLBuffer contents (shared storage mode needs no sync on Apple Silicon).
