---
type: claim
id: 01m1hhwpc0twa126aay6nbqs5v
created: 2026-09-02T17:15:28.512460+00:00
updated: 2026-09-02T17:15:28.512460+00:00
summary: Greedy output is byte-identical across cache sizes and live resizes
basis: measured
gate: Tools/verify.sh
needle: byte-identical
supported_by:
- '[[records/measurements/the-headline-the-full-125b-51b-model-generates-on-this-48-gb-machine]]'
- '[[records/measurements/the-elastic-pool-2026-08-28-serve-resizes-itself-while-running]]'
surfaces: README.md, llms.txt
title: Greedy output is byte-identical across cache sizes and live resizes
status: current
---

Golden equivalence on the full model (30 experts per layer against 181, identical greedy text) and across a live grow and shrink; `elastic-check` in verify.sh is the standing gate. This is about the expert pool; prefix-cache reuse is equivalent, not bit-identical (see the equivalence question).
