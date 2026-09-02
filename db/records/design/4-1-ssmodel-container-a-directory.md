---
type: design
meta-type: conclusion
id: 01m1hhwn51ns0ftqs8tj934zrv
created: 2026-09-02T17:15:27.265044+00:00
updated: 2026-09-02T17:15:27.265044+00:00
summary: 4.1 .ssmodel container (a directory)
date: 2026-08-28
doc: plan
level: '3'
order: '100'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 4.1 `.ssmodel` container (a directory)
---

- `manifest.json` — format version, source repo+revision, quant recipe per component,
  tensor inventory with shapes/dtypes, record geometry, per-file sha256, default preset
  hints, hot-set list (expert ids by global frequency, from calibration; refreshed from
  runtime stats).
- `resident.safetensors` — trunk, shared experts, routers, embeddings, norms. Loaded whole.
- `experts.bin` — 24,576 fixed-size records, `idx = layer×512 + expert`,
  record = packed(gate|up|down: weights+scales+biases) padded to 16 KiB multiple
  (**2,764,800 → 2,768,896 B**, ✅measured); pure `pread(fd, idx × record_size)`.
  **67.948 GB**.
  Note: in the source checkpoint each layer's 512 experts are *already contiguous*
  per projection (`[512, 640, 320]` etc.), verified by matching a direct `pread` of
  expert *i* against `mx.load(...)[i]`. So a working engine can stream straight from
  the original shards with **9 preads per expert**; `experts.bin` collapses that to
  **1**. The repack is a measured optimisation, not a prerequisite — which makes it
  safe to build the engine first and A/B the repack's real benefit.
- `ngram.bin` — ✅measured geometry: **320,001,536 rows** (128 shards × 2,500,012)
  of **160 dims**, quant group size **32**, packed **100 B/row** (80 weight + 10
  scales + 10 biases), **32.0 GB**. The repack's job here is *interleaving*: in the
  source checkpoint a row's three parts live in three different tensors ~3.25 GB
  apart, so an unrepacked reader needs **3 preads per row = 48 per token**; packing
  each row contiguously makes it **16 per token**. Rows stay packed (not padded):
  at 100 B a row straddles a 16 KiB page only ~0.6% of the time, and padding to
  128 B would cost +9 GB of disk for nothing. Read in 16 KiB aligned windows
  (~163 rows each); the cache is **page-granular, not row-granular**.
- `mtp.safetensors`, `vision.safetensors` — optional, absent in v0 default build.
- `tokenizer/` — tokenizer.json, tokenizer_config.json (chat template), generation_config.

Repack is **bit-exact** (no requantization): source = a vetted community MLX 4-bit
conversion (pipenetwork first candidate; spot-checked, checksummed, revision-pinned), so
our quality baseline equals mlx-lm's by construction. Own conversion from official
FP8/BF16 on a rented box is the fallback if community quants prove broken (billed, so it
needs an explicit decision).
