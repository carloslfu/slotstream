---
type: design
meta-type: conclusion
id: 01m1hhwmyq15pk3spfxd84gf4y
created: 2026-09-02T17:15:27.063171+00:00
updated: 2026-09-02T17:15:27.063171+00:00
summary: 3. The byte math (first principles)
date: 2026-08-28
doc: plan
level: '2'
order: '40'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 3. The byte math (first principles)
---

Quantization overhead (MLX affine, group size 64): bits + 0.5 bpp for fp16 scale+bias
→ 4-bit = 0.5625 B/param, 6-bit = 0.8125, 8-bit = 1.0625, 3-bit = 0.4375.
