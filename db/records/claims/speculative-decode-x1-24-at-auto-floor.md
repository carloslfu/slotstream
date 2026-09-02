---
type: claim
id: 01m1hhwp8w1rc9x8482r7zrwrk
created: 2026-09-02T17:15:28.412916+00:00
updated: 2026-09-02T17:15:28.412916+00:00
summary: Speculative decode multiplies decode by 1.24 at auto's floor on the dev Mac
basis: measured
gate: none
needle: ×1.24
supported_by:
- '[[records/measurements/the-rebuild-eliminated-and-the-numbers-that-ship-2026-09-02]]'
surfaces: README.md, docs/CLI.md, llms.txt
title: Speculative decode multiplies decode by 1.24 at auto's floor on the dev Mac
status: current
---

Greedy, 10.3 to 12.8 tok/s at 122 experts per layer once a rejected draft rolls back instead of re-running; ×1.18 with the server's default sampling, ×1.33 on a code prompt. Below the floor every size measured a loss (M9 ladder). `mtp-check` gates correctness, not the multiplier.
