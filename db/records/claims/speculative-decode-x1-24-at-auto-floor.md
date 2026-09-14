---
type: claim
id: 01m1hhwp8w1rc9x8482r7zrwrk
created: 2026-09-02T17:15:28.412916+00:00
updated: 2026-09-13T13:44:49.810067+00:00
summary: Speculative decode multiplied decode by 1.24 at the former auto floor on the dev Mac
basis: measured
gate: none
needle: ×1.24
supported_by:
- '[[records/measurements/the-rebuild-eliminated-and-the-numbers-that-ship-2026-09-02]]'
surfaces: docs/CLI.md, llms.txt, docs/ENGINEERING.md
title: Speculative decode multiplied decode by 1.24 at the former auto floor on the dev Mac
status: current
---
Greedy, 10.3 to 12.8 tok/s at 122 experts per layer once a rejected draft rolls back instead of re-running; ×1.18 with the server's default sampling, ×1.33 on a code prompt. Below the floor every size measured a loss (M9 ladder). `mtp-check` gates correctness, not the multiplier.

The multiplier is historical evidence measured at depth one. The current adopted depth-two default has no new auto-floor multiplier established by this claim. The activation threshold is a separate policy; later forced-MTP results at smaller budgets do not retroactively change the historical ladder.
**Updated 2026-09-13.** "The floor" above is the former 120-per-layer floor. From 0.2.16 the floor is 76 per layer ([[records/decisions/draft-head-auto-floor-76-per-layer]]); this multiplier stays historical.
