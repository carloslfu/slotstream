---
type: measurement
id: 01m1hhwm0bacgjyvcbdwmtxqyq
created: 2026-09-02T17:15:26.091433+00:00
updated: 2026-09-02T17:15:26.091433+00:00
summary: Reference implementation
date: 2026-08-28
doc: measurements
level: '2'
order: '360'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Reference implementation
status: analysis
---

`Tools/reference/qwen4_exp.py` (vendored, from the pinned conversion) — the port
oracle. Confirms: PLE at layer 1; QSA indexer returns `None` when `kv_len ≤ 2048`
(so **dense attention is exact only up to the 2048-token budget** — the review-pass
correction was right); GDN state fp32; router in full precision
(`quant_predicate` excludes `mlp.gate`); MTP and vision tower dropped by `sanitize`.
mlx-lm 0.31.3 already provides `gated_delta_update`, `SwitchGLU`, `ArraysCache`;
`qwen4_exp` itself is **not** in mlx-lm 0.31.3 (confirms the open-PR status).

---
