---
type: plan
meta-type: operational
id: 01m1hhwnvsashajx2krwj1bjzb
created: 2026-09-02T17:15:27.993444+00:00
updated: 2026-09-02T17:15:27.993444+00:00
summary: N3 and N4 — removed from the queue (2026-08-30)
date: 2026-08-30
doc: plan
kind: queue-item
level: '3'
order: '320'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: N3 and N4 — removed from the queue (2026-08-30)
---

Both were dropped as work items. They are recorded here rather than deleted so
that neither gets re-proposed from first principles later; the measurements are
in MEASUREMENTS.md.

- **N3 (the 104 GB download).** Three levers, all closed. Hosting is not the
  bottleneck — Cloudflare R2 measured no faster than Hugging Face (42 to 51
  against 36 to 50 MB/s) on a link that does 134, and Hugging Face is free.
  Serving before the download completes fails on arithmetic, not engineering: a
  missing expert is a wrong answer rather than a slow one, so the fetch must
  block, and one token needs ~1.3 GB of experts — about 26 s per token until the
  download catches up, which is worse than the progress bar it would replace.
  That left a smaller build, which needs a billed re-quantization run and a
  quality gate to prove it cost nothing.
- **N4 (quality against the FP8 reference).** That gate needs an inference
  credential for Qwen3.8-Flash-Next FP8 — Qwen's own DashScope or an aggregator
  carrying it. None is provisioned and it is paid.
  `Tools/quality_probe.sh` remains in the battery: 15 checkable items covering
  recall, arithmetic, sorting, instruction obedience, translation and code. It
  catches gross quantization damage and gates any future re-quantization. It is
  **not** a comparison against FP8 and must never be described as one.
