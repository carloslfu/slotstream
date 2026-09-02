---
type: design
meta-type: conclusion
id: 01m1hhwnyxd0ej8776wxn9xpqr
created: 2026-09-02T17:15:28.093371+00:00
updated: 2026-09-02T17:15:28.093371+00:00
summary: M9 addendum — built and measured (2026-09-01)
date: 2026-09-01
doc: plan
level: '3'
order: '360'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: M9 addendum — built and measured (2026-09-01)
---

The analysis above survived contact with implementation almost intact; the
corrections are recorded here and in MEASUREMENTS.md (M9 section).

- **Weights**: converted from the official release via ranged downloads of
  exactly the 31 `mtp.*` tensors (4.9 GB, 92 s) — `Tools/mtp_convert.py`,
  provenance in `mtp.provenance.json`. Real resident cost **1.47 GB**, not
  the 2.25 estimated. The +1 norm-centering convention was verified
  tensor-by-tensor against the official raw checkpoint before conversion.
- **Port**: the Swift head is **bit-exact** against the MLX Python reference
  (`mtp-parity`, real captured inputs, reference run under mlx 0.31.x — the
  kernel family mlx-swift pins). Semantics follow vLLM's scheme A: the
  chained draft feeds the PRE-mixer multi stream forward.
- **Accept curve (measured, previously unpublished)**: 85.8% at depth 1,
  71.0/53.8/41.3% for 2/3/4-chains; E[tokens/round] 3.52 at depth 4.
- **Enable policy shipped as designed**: `--mtp auto|on|off`; auto turns the
  head on only when the cache still reaches **≥120 experts/layer after its
  1.6 GB** (`mtpAutoFloorPerLayer`), and raises the auto ceiling to 34.6 GB
  so the pool still reaches the knee. A/B ladder on the released 0.2.0 (four
  drafts): **×0.55 / 0.69 / 0.88 / 0.96** at 20 / 29 / 42 / 57 experts/layer
  (round cost 5.2 → 3.0 plain tokens against a 2.87 break-even), and ×0.65
  at a fixed 14 GB target — the "tight memory keeps the experts" argument
  with numbers. The plateau A/B (`slotstream mtp-bench --memory-gb 28
  --pairs 5`, 122/layer with the head on, 20 GB real footprint) measured
  **×0.88 at depth 4, ×1.13 at depth 2, ×1.17 at depth 1**; `mtp-passcost`
  measured the ceiling: a verify pass costs about a sixth of a pass per
  extra token with every expert resident, so the multiplier is at most
  ×1.4 (depth 1) or ×1.5 (depth 2). The ×1.5–1.9 estimate is withdrawn
  (MEASUREMENTS M9). The default draft depth is now 1 (was 4): depth 4
  loses at every size measured, depths 1 and 2 pay 13–17% at auto's size,
  and the shortest chain wastes the least on a rejection.
- **Rebuild eliminated (2026-09-02)**: the verify pass records the GDN /
  conv state after every position (the recurrence stepped per token,
  bit-identical to the fused kernel), so a rejection rolls back with no
  model compute. At 57/layer depth 1 goes ×1.12 → ×1.20, depth 2 → ×1.20;
  at 122/layer depth 1 reads ×1.24 (code ×1.33, list ×1.19, sampled
  ×1.18), depth 2 ×1.27. Gated in `mtp-check` (recording pass exact vs
  batched; rollback state inside 3x the plain re-chunk band; next step inside
  the prefill-rechunk band).
- **One claim corrected**: "byte-identical to plain greedy" was wrong for the
  same reason prefix reuse isn't byte-identical — the verify pass re-batches
  tokens and re-association moves near-tie logits. Gates (`mtp-check`):
  determinism across runs, prefix-cache continuation of speculative
  conversations (next-turn logits inside the prefill-rechunk band, the
  prefix-check method), non-degenerate accept, divergence reported. Sampling
  semantics are exact by construction (sequential draws off verified logits).
- **Governor**: MTP is a startup decision; the elastic governor sizes the
  pool around it (the head's 1.6 GB shows up in availability, so the pool
  self-corrects). "Shed MTP before the pool" from the note is NOT built —
  a live toggle would need golden-equivalence gating of the switch itself;
  revisit only if pressure shedding proves insufficient in practice.
