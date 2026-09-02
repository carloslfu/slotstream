---
type: plan
meta-type: operational
id: 01m1hhwngmy3nesj4k8dxby8v2
created: 2026-09-02T17:15:27.636615+00:00
updated: 2026-09-02T17:15:27.636615+00:00
summary: M1 — Expert-locality study (1–2 d, the cheap de-risk)
date: 2026-08-28
doc: plan
kind: milestone
level: '3'
order: '210'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: M1 — Expert-locality study (1–2 d, the cheap de-risk)
---
Traces: instrument the Python reference (mlx-lm branch) to dump per-layer top-k ids.
(a) **Proxy, free, local**: Qwen3-Next-80B-A3B (same 512-expert/top-10 routing family)
fits this Mac at 3–4-bit — collect traces across chat/code/long-doc/agentic corpora.
(b) **Real model, small paid run (approval-gated, ~US$30–60)**: rented 2×H200 (or 4×A100)
running the official FP8 via vLLM day-0 recipe with a 20-line router-logging patch; 1–2M
tokens ≈ ~1–2 GB of traces. Build the **cache simulator** (replays traces vs policy ×
size × prefetch-window; also computes prefill per-chunk expert coverage and hot-set
concentration).
**Exit:** h(size) curves per workload committed; eviction policy + prefetch window chosen;
preset table §5 updated; explicit go/no-go note for `lite16` (needs h ≥ ~0.6 @ 5.5 GB) and
`edge8`.
