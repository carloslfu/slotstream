---
type: plan
meta-type: operational
id: 01m1hhwnkv255gg3j2hbsgqj27
created: 2026-09-02T17:15:27.739332+00:00
updated: 2026-09-02T17:15:27.739332+00:00
summary: M4 — Slot streaming decode → first full-model run (3–5 d) — the gating milestone
date: 2026-08-28
doc: plan
kind: milestone
level: '3'
order: '240'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: M4 — Slot streaming decode → first full-model run (3–5 d) — **the gating milestone**
---

Reordered emphasis after M0.8: because MLX materialises whole tensors out of mmap,
**no full-model forward pass is possible at all until the slot pool exists**. M3's
layerwise parity work is unaffected (its 4–8-layer truncated rig needs only
5.6–11 GB of experts, which does fit), but "run the model" and "stream the model"
are the same milestone, not consecutive ones. Plan M3 and M4 as one continuous push
with a single integration point.

SlotPool + eviction + pinning; ExpertStore/NgramStore with F_NOCACHE read pool; staging →
pool writes; n-gram exact prefetch; Governor v0 (static budgets); golden equivalence
(§6.1). Then the milestone moment: **the full 125B+51B model generating on this 48 GB Mac
under `pro48`.** Sanity-compare outputs against the official FP8 cloud endpoint on a fixed
prompt set (distribution-level, not bit-level).
**Exit:** golden test green; warm-chat decode ≥ 10 tok/s on this Mac (pre-tuning);
footprint within budget ±5%; 30-min soak with zero swap growth.
