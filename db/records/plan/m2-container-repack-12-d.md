---
type: plan
meta-type: operational
id: 01m1hhwnhnjb4pqshm2bv8hfkp
created: 2026-09-02T17:15:27.669646+00:00
updated: 2026-09-02T17:15:27.669646+00:00
summary: M2 — Container + repack (1–2 d)
date: 2026-08-28
doc: plan
kind: milestone
level: '3'
order: '220'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: M2 — Container + repack (1–2 d)
---
`Tools/repack.py` (Python, tooling-only): MLX safetensors → `.ssmodel` per §4.1, bit-exact,
checksummed, config-driven geometry. Swift `Format/` reader + verifier.
**Exit:** full 4-bit repack on this Mac; random-sampled records byte-equal to source
tensors; `slotstream verify` green.
