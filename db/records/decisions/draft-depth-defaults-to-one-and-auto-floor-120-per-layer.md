---
type: decision
id: 01m1hhwphecskh0fhqca4tawhb
created: 2026-09-02T17:15:28.686373+00:00
updated: 2026-09-02T17:15:28.686373+00:00
summary: Speculative decode drafts one token by default and auto enables it only at 120 experts per layer and up
decided_on: 2026-09-02
evidence:
- '[[records/measurements/where-it-pays-measured-at-every-cache-size-that-fit-2026-09-01-redone]]'
- '[[records/measurements/depth-and-the-plateau-a-b-that-moved-the-default-from-4-to-1-2026-09-02]]'
- '[[records/measurements/the-rebuild-eliminated-and-the-numbers-that-ship-2026-09-02]]'
reversible_if: a verify pass costs less than about a sixth of a pass per extra token, or a cache below 120 experts per layer measures a speculative gain
title: Speculative decode drafts one token by default and auto enables it only at 120 experts per layer and up
status: standing
---

Depth 4 read ×0.88 at auto's size and a loss at every smaller cache; depths 1 and 2 read ×1.17 and ×1.13, and with the rejection rollback depth 1 reads ×1.24. The once-written ×1.5 to 1.9 assumed a five-token verify pass costs one token's pass; measured, it costs 1.65, which caps depth 1 at ×1.4.
