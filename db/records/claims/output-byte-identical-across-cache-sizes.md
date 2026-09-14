---
type: claim
id: 01m1hhwpc0twa126aay6nbqs5v
created: 2026-09-02T17:15:28.512460+00:00
updated: 2026-09-13T14:46:28.802190+00:00
summary: Greedy output is byte-identical across cache sizes and live resizes
basis: measured
gate: Tools/verify.sh
needle: byte-identical
supported_by:
- '[[records/measurements/the-headline-the-full-125b-51b-model-generates-on-this-48-gb-machine]]'
- '[[records/measurements/the-elastic-pool-2026-08-28-serve-resizes-itself-while-running]]'
surfaces: llms.txt, docs/ENGINEERING.md
title: Greedy output is byte-identical across cache sizes and live resizes
status: current
---

Golden equivalence on the full model (30 experts per layer against 181, identical greedy text) and across a live grow and shrink; `elastic-check` in verify.sh is the standing gate. This is about the expert pool; prefix-cache reuse is equivalent, not bit-identical (see the equivalence question).

## Scope audit, 2026-09-13

The equality claim concerns changing expert-cache placement with the other
generation settings fixed. A different total memory target can change prefill
grouping or activate speculative decoding, which is outside this claim. The
original headline record explicitly preserves its golden-equivalence result
while retracting its warm-decode number; its superseded status must be read
with that note rather than treated as a blanket retraction.
