---
type: claim
id: 01m1hhwpem6dxbex9vcnrg74f3
created: 2026-09-02T17:15:28.596+00:00
updated: 2026-09-02T17:15:28.596+00:00
summary: Prefill at a 4096-token pass is about 125 tok/s on the dev Mac
basis: estimated
gate: none
needle: 125 tok/s
supported_by:
- '[[records/measurements/prefill-a-bigger-pass-really-is-faster-measured-at-a-matched-pool-2026]]'
surfaces: README.md, docs/HARDWARE.md
title: Prefill at a 4096-token pass is about 125 tok/s on the dev Mac
status: withdrawn
---


Measured: 112.9 tok/s at a 2048 pass on an 8,016-token prompt, and 4096 beat 2048 by ×1.15 in three paired rounds at a matched pool, which implies about 130; 125 is the planner's estimate kept under the evidence, because the 4096 pass could not run at its natural 36 GB target. The HARDWARE.md row presents it as this machine's number; it is an estimate and the row should say so.

Withdrawn 2026-09-02: the sweep's ladder and 4096-token runs of 2026-09-02 (222 at a matched 60-per-layer pool, 247 at 16 GB by override) replaced it; the planner now says 220.
