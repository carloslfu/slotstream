---
type: plan
meta-type: operational
id: 01m1hhwp3605p6f1mjs77q43jy
created: 2026-09-02T17:15:28.230415+00:00
updated: 2026-09-02T17:15:28.230415+00:00
summary: 12. Open questions (answer at the milestone noted)
date: 2026-08-28
doc: plan
kind: questions
level: '2'
order: '410'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 12. Open questions (answer at the milestone noted)
---

1. ✅**ANSWERED (M0).** N-gram indexing: `ngram_heads = (ngram_size−1) × heads_per_ngram
   = 16`; per head, id = XOR of `splitmix64`-derived multipliers over the token n-gram,
   mod that head's distinct prime near 20 M (`_nth_prime_after(19_999_999, g+1)`), plus
   the head's offset; the concatenation is split into 128 shards of 2,500,012 rows.
   Rows are 160-dim, 100 B packed, quant group 32. PLE sits at layer index 1.
2. ✅**ANSWERED (M0).** **16 rows per token = 1,600 B** of n-gram data (≈20× less than
   the 23 KB assumed). Unrepacked that is 48 scattered preads/token; repacked, 16.
3. ✅**ANSWERED (M0), and better than hoped.** `mlx-swift-lm` ships
   `Qwen3NextGatedDeltaNet` + `gatedDeltaUpdate` (with `conv1d`, `dt_bias`, `A_log`,
   a `decodeConv` fast path, and compiled-decode tests), plus `SwitchGLU` /
   `QuantizedSwitchLinear` over `MLX.gatherQuantizedMM`. Novel Swift work reduces to
   the QSA indexer, hyper-connections, and the PLE path.
4. MTP block internals (own experts?) and self-spec accept rates on this model (M9)
   — now the load-bearing unknown for §8.1's enable thresholds, together with
   whether draft-batched expert fetches help fetch-bound tiers at all.
5. h-curves per tier (M1) — **no longer the load-bearing unknown**: at 17.3 GB/s even
   h=0 sustains ~13 tok/s. It now sizes tiers rather than deciding viability.
6. Whether `mixed-4-8` measurably beats all-4-bit on agentic evals worth +disk (M8).
7. External-USB4-NVMe tier viability for 256 GB-disk Macs (M8, one bench row).
8. **NEW — the actual binding constraint.** How much of decode is kernel-launch
   overhead, and how far do MLX compiled graphs close it? Batch-1 matmul hits only
   20% of memory bandwidth. This displaced IO as the top performance risk (M4/M5).
9. ✅**ANSWERED (M7).** Metal shader build: **vendored metallib**. CI builds the
   release with Xcode on its runner and ships `mlx.metallib` beside the binary;
   a CLT-only machine builds and runs fine against it. Separately — and this was
   conflated for two releases — *writing a new kernel* needs neither, because
   `MLXFast.metalKernel` JIT-compiles at runtime, which is how the gated-DeltaNet
   kernel already ships.
10. **NEW (2026-08-29), and the reason N1 exists.** How much of real-world latency is
   re-prefill rather than prefill? Found by inspection, not measurement: state is rebuilt
   per request, so for a conversation it is *all* of it after turn 1. Open sub-question
   for N1: how often does a real client actually send an exactly-extending prefix
   (tool loops and edited history both break it), i.e. what is the true hit rate of an
   extend-only cache?
