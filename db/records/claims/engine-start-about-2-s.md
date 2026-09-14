---
type: claim
id: 01m1hhwp5a7bpqw6320k8wncfa
created: 2026-09-02T17:15:28.298047+00:00
updated: 2026-09-13T14:48:38.790210+00:00
summary: Historical engine load is about 2 s; current startup verification is additional
basis: measured
gate: none
needle: ~2 s
supported_by:
- '[[records/measurements/the-headline-the-full-125b-51b-model-generates-on-this-48-gb-machine]]'
surfaces: docs/ENGINEERING.md
title: Historical engine load is about 2 s; current startup verification is additional
status: current
---

Measured 2.3 s cold and 1.1 s with page-cached residents on the first full-model run (2026-08-28).

## Scope audit, 2026-09-13

The public surface now labels this engine-load number historical. The
source's supersession applies to its warm-decode number, not every observation,
but no current cold-start qualification follows. Current CLI startup verifies
full model hashes before loading; the old load time does not cover that step,
prompt prefill, queuing or the first visible answer.
