---
type: design
meta-type: conclusion
id: 01m1hhwmzskff9btdcvvysdy9z
created: 2026-09-02T17:15:27.097845+00:00
updated: 2026-09-02T17:15:27.097845+00:00
summary: 3.1 Component sizes at 4-bit
date: 2026-08-28
doc: plan
level: '3'
order: '50'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 3.1 Component sizes at 4-bit
---

| Component | Params | 4-bit size | Placement |
|---|---|---|---|
| Routed experts (48×512) | 120.8B | **67.948 GB** ✅measured | SSD, slot-cached |
| — one expert record (3 × 2560×640) | 4.92M | **2,764,800 B** ✅measured | unit of streaming |
| — one layer's experts (512) | 2.52B | 1.4156 GB ✅measured | unit of prefill sweep |
| Shared experts (48) | 0.24B | 133 MB | resident, always |
| Routers (48 × 2560×512) | 63M | 126 MB (bf16) | resident (routing precedes fetch) |
| Dense trunk (GDN+QSA+HC+norms) | ~2.7B | 1.5 GB (2.2 GB @6-bit) | resident |
| Embeddings + lm_head (untied) | 1.27B | 0.72 GB | resident |
| N-gram/PLE store | 51.2B | **32.0 GB** ✅measured (320,001,536 rows × 100 B) | SSD, page-cached, exact-prefetched |
| MTP block | ~4B | 2.25 GB (est.; absent from the pinned conversion) | optional, off in v0 |
| Vision encoder | ~0.4B | 0.43 GB @8-bit | optional, off in v0 |
| **Fully resident total** | ~180B | **~102 GB** | doesn't fit even in 48 GB → streaming is mandatory on the dev Mac too; exceeds the default wired limit even on 128 GB (see §5) |

Resident floor (v0 text-only, trunk @6-bit): **≈ 3.3 GB** + KV + GDN state (113 MB fp32)
+ MLX graph/activations (~0.4 GB) + slot pool + ngram row cache (128–256 MB) + IO staging
(~128 MB).

KV by context: 8k → 0.23 GB · 32k → 0.90 · 64k → 1.8 · 128k → 3.6 · 262k → 7.4 (bf16;
fp8-KV halves this, later knob).
