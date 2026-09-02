---
type: measurement
id: 01m1hhwk6yjyrcrhamvvc2nqzr
created: 2026-09-02T17:15:25.278547+00:00
updated: 2026-09-02T17:15:25.278547+00:00
summary: N-gram store — plan was structurally wrong
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '30'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: N-gram store — plan was structurally wrong
status: measured
---

| Property | Plan assumed | **Actual** |
|---|---|---|
| Rows | 20.0 M | **320,001,536** (128 shards × 2,500,012) |
| Row dim | 2560 | **160** (= 2560 / 16 ngram heads) |
| Row bytes @4-bit | 1,440 | **100** (80 weight + 10 scales + 10 biases) |
| Quant group size | 64 | **32** (shape [rows, 5] over 160 dims) |
| Total | 28.8 GB | **32.0 GB** |
| Lookups/token | ~16 rows ≈ 23 KB | **16 rows = 1,600 B of data** |

Structure (from `qwen4_exp.py`): `ngram_heads = (ngram_size−1) × heads_per_ngram
= 2 × 8 = 16`; each head has its own ~20M-entry table sized to a distinct prime
(`_nth_prime_after(19_999_999, g+1)`); tables are concatenated and split into 128
shards of 2,500,012 rows. Index = `splitmix64`-derived multipliers XOR-mixed over
the token n-gram, mod the head's prime, plus the head's offset. PLE is injected at
**layer index 1** (`ple_layer_ids: [2]`, 1-based).

**Design implications:** the per-token n-gram payload is 20× smaller than planned
(1.6 KB, not 23 KB), but it is **16 scattered ~100 B reads**, and each row's
weight/scales/biases live in *three different tensors* — so a naive reader does
**48 scattered reads per token**. The repack must interleave each row's three
parts into one contiguous 100 B (pad 128 B) record, turning 48 reads into 16, and
the row cache should be **page-granular (16 KiB holds ~128 rows)**, not row-granular.
