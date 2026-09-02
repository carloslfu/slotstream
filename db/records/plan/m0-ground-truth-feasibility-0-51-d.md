---
type: plan
meta-type: operational
id: 01m1hhwnfjwshk7g506894t6tg
created: 2026-09-02T17:15:27.602908+00:00
updated: 2026-09-02T17:15:27.602908+00:00
summary: M0 — Ground truth & feasibility (0.5–1 d)
date: 2026-08-28
doc: plan
kind: milestone
level: '3'
order: '200'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: M0 — Ground truth & feasibility (0.5–1 d)
---
Download the pinned community MLX 4-bit conversion; script that recomputes §3 from the
actual `config.json` + safetensors index (fail loudly on drift). Read the reference
`qwen4_exp.py` / PR #1788; document the exact n-gram hashing + lookup count, MTP wiring,
QSA indexer math into §2. Write `DiskBench` (pread QD×size sweep incl. 2.76 MB and
4–16 KiB patterns, F_NOCACHE on/off) and run on this Mac; record Metal
recommendedMaxWorkingSetSize and default wired limit; check `mlx-swift-lm` for an existing
Qwen3-Next/GDN Swift implementation (if present, M3 shrinks by days). Verify
swift-transformers Jinja handles this chat template.
**Exit:** §2/§3 tables re-verified; SSD curve measured; weights source pinned (or fallback
conversion plan triggered); `gatherQMM` + quantized in-place updates confirmed available
in mlx-swift (slot-write microbench specced); M3 effort re-estimated.
