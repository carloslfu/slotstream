---
type: design
meta-type: conclusion
id: 01m1hhwn72wncbdxbkf7v23zkv
created: 2026-09-02T17:15:27.330751+00:00
updated: 2026-09-02T17:15:27.330751+00:00
summary: 4.3 N-gram/PLE path
date: 2026-08-28
doc: plan
level: '3'
order: '120'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 4.3 N-gram/PLE path
---

> **Measured**: this path is the single worst offender under stock MLX — a 16-row
> lookup materialises a 250 MB shard (~150,000× amplification), and touching most of
> the 128 shards costs the full 32 GB. Explicit row-level `pread` into a small page
> cache is required. Note the contrast with llama.cpp, which mmaps the PLE and lets
> the OS work at 4–16 KiB page granularity — that is survivable; MLX's whole-tensor
> evaluation semantics are not.


Keys for token t's rows are a pure function of input token ids (bi/tri-grams × 8 heads,
✅measured **16 rows × 100 B = 1.6 KB**, touching ≤16 of the 128 shards).
Decode: after sampling token t, issue reads for step t+1
immediately — a handful of 4–16 KiB reads (~0.1–0.3 ms) mostly hidden behind layers 0–1
of that step plus the row cache. Prefill: batch-read the whole
prompt's (deduplicated) rows before layer 2. Small LRU row cache (128–256 MB) absorbs
n-gram repetition in natural text. The exact hashing scheme is read out of the reference
`qwen4_exp.py`/PR #1788 at M0 (`heads_per_ngram 8`, `split_ngram_parts 128` — verify
lookup count per token and per-part addressing; if row addressing turns out non-uniform,
adjust stride/layout accordingly). Quality note: Unsloth warns n-gram tables tolerate ≤4-bit
poorly → ngram bits is an independent knob (4 default, 6/8-bit variants for quality runs —
IO stays trivial; only disk grows).
