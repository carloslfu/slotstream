---
type: measurement
id: 01m1hhwkgswp1mcx9d5yb3k0em
created: 2026-09-02T17:15:25.593058+00:00
updated: 2026-09-02T17:15:25.593058+00:00
summary: 'M0.8 — The decisive finding: MLX cannot sparsely materialise a mmap''d tensor'
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '120'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'M0.8 — The decisive finding: MLX cannot sparsely materialise a mmap''d tensor'
status: measured
---

A 5-token raw prompt should touch only ~9% of experts (≈6.2 GB) and still died. So I
measured the two gather paths directly, on lazily-loaded real tensors:

| Operation | Data actually needed | **MLX materialised** | Amplification |
|---|---|---|---|
| `mx.take(ngram_shard, 16 rows)` | 1.3 KB | **200 MB** (the whole shard) | ~150,000× |
| `mx.gather_qmm(x, experts, rhs_indices=top-10)` | 27.6 MB | **471.9 MB** (all 512 experts of the layer) | 17× |

Scaled up: the expert path materialises **1.4 GB per layer → 68 GB** across 48
layers, and the n-gram path materialises **250 MB per touched shard → up to 32 GB**
across 128 shards. Together ≈100 GB. That is the whole checkpoint, and it is why
every stock run died regardless of prompt length.

**This converts slotstream's central design choice from an optimisation into a
requirement.** MLX offers no sparse-materialisation path out of a memory-mapped
tensor: any gather or take over a lazily-loaded array evaluates the entire source
tensor. Therefore the only way to run this model in bounded memory under MLX is
exactly the plan's architecture:

1. `pread` precisely the records needed (2.7648 MB per expert; 16 KiB pages for
   n-gram rows),
2. place them into a **pre-allocated, bounded, fully-resident** pool,
3. gather over that pool — where every element is already resident, so no
   materialisation surprise exists.

The measurements in §M0.3 confirm each step is fast: `gatherQuantizedMM` over a
resident pool is bit-exact, slot fills run at 49–75 GB/s in place, and the SSD feeds
records at 17.3 GB/s. **The design is not just viable — under MLX it is the only
option, and every component of it has now been measured working in isolation.**

Honest scope note: because of this, **no end-to-end generation of the full model was
achieved on this 48 GB Mac in this session.** The stock path cannot do it, and the
bounded path requires the slot pool that M3/M4 build. What has been proven is that
every mechanism the bounded path depends on works, and that nothing simpler will
substitute for it.

Practical note for the runbook: `mlx_lm.load()` must never be called on this model
without `lazy=True`, and `slotstream doctor` should refuse to start a configuration
whose resident set exceeds the measured working-set limit rather than letting the OS
swap.
