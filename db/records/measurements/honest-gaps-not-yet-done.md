---
type: measurement
id: 01m1hhwkz7qfmfpncda03bzex7
created: 2026-09-02T17:15:26.055235+00:00
updated: 2026-09-02T17:15:26.055235+00:00
summary: Honest gaps (not yet done)
date: 2026-08-28
doc: measurements
level: '3'
milestone: M4/M5/M6
note: The 2026-08-28 view of what was not yet done; several items closed since (the QSA indexer past 2048 tokens, the sampler golden, the governor policy, Open WebUI). Later records carry the closures.
order: '350'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Honest gaps (not yet done)
status: analysis
---

Dense-sweep prefill and cross-token prefetch. Sizing the pass from the memory
plan took prefill from 40 to 92 tok/s (8k prompt: 199 s to 87 s), but the sweep
is still naive and prefill remains the slow axis for long prompts; decode after
a long context also runs below the short-prompt anchors (5.0 tok/s at
30/layer after 7,960 tokens). Real ≤16 GB
hardware validation (floor and 16-GB-target behavior emulated and
stress-tested here, but never run on a physically smaller, slower-SSD Mac). A
hosted web GUI (e.g. Open WebUI) driven end to end (browser streaming client
proven; the full product not installed here). LaunchAgent `install`
(foreground `serve` is the supported mode). The planner now charges KV and
indexer growth through the prefill-pass budget rather than modelling context
length directly, so a prompt far longer than the 8k the coefficient was fitted
to is still bounded by `--max-context` rather than predicted. The governor's
policy is tested as a pure function, which is stronger than the one-off hog
measurement but is not the same as observing the daemon under live pressure.

Closed 2026-08-29 (see the two sections above): the QSA indexer past its
2048-token budget, the sampler golden, and the governor policy.
