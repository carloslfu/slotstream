---
type: decision
id: 01m33fxy362rpzjrhjpe13xm7k
created: 2026-09-22T02:43:13.638204+00:00
updated: 2026-09-22T05:04:53.680440+00:00
summary: Apply supported prefill improvements automatically
decided_on: 2026-09-21
evidence: '[[records/measurements/automatic-prefill-policy-2026-09-21]]'
reversible_if: A reproduced state, cache or physical-memory failure, or clean paired performance regression, narrows or removes the automatic policy; broader profiles require separate evidence.
title: Apply supported prefill improvements automatically
status: standing
---
MTP followup: [[records/decisions/automatic-mtp-prefill-read-policy]] replaces the initial MTP exclusion after separate phase and expert-buffer qualification. The original adoption and evidence below remain historical facts.

At Carlos's explicit direction, make the supported combined prefill optimization an internal engine policy rather than user opt-in. The prior explanation had already stated that only one timing pair was clean and three were required for performance qualification. His follow-up requests automatic behavior where it helps and a simpler user experience. Adopt the bounded policy after the functional, physical-memory and integration gates in [[records/measurements/automatic-prefill-policy-2026-09-21]].

This explicitly reverses [[records/decisions/prefill-opportunities-remain-experimental]] as a product-default decision. The new timing study fails its frozen performance-adoption criterion; it is not promoted or relabeled successful. The default is adopted on exactness/memory evidence, the previous clean directional observation and consistent read reduction, with the performance uncertainty retained. No new qualified percentage or general hardware-speed claim is published.

Couple larger automatic read groups to valid fused workspace accounting. Keep chronological math, actual memory admission, checkpoints, cancellation and the existing fallback. Retain internal diagnostic overrides and the explicit reference API, but require no user setting in ordinary app/CLI/server usage. Wider hardware, context, MTP and image activation needs its own evidence.
