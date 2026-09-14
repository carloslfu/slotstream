---
type: decision
id: 01m2dg99ybq5zxr3qp1pvejh22
created: 2026-09-13T13:46:08.715419+00:00
updated: 2026-09-13T13:46:08.715419+00:00
summary: Auto enables the draft head when the cache keeps 76 experts per layer after its charge, a 21 GB target, so 32 GB Macs and up; the former floor was 120
decided_on: 2026-09-13
evidence: '[[records/measurements/mtp-depth-auto40-multitasking-2026-09-11]]'
reversible_if: Clean paired measurements show two drafts slower than plain decode at a cache between 76 and 120 experts per layer, or a slower SSD measures a loss there
title: The draft head's automatic floor is 76 experts per layer
status: standing
---
Carlos asked to ship the decode lookahead as the default and delegated which Macs get it ("make your best guess"). The lookahead needs the draft head, and under the former 120-experts-per-layer floor auto turned the head on only from a 28 GB target, which only 48 GB Macs and up reach. This lowers the floor to where the head was measured faster.

**Decision.** `Planner.mtpAutoFloorPerLayer` is 76: auto enables the draft head when the expert cache still holds at least 76 experts per layer after the head's charge. With the default prefix cache that is a 21 GB target, so auto runs the head, and with it the decode lookahead, on 32 GB Macs and up at the default context. A 32 GB Mac at the 65,536-token window falls below the floor and runs without them; a 36 GB Mac keeps them. The planner gates check a 24 GB Mac without the head, a 32 GB Mac with it and a 32 GB Mac at 65,536 tokens without it ([[records/measurements/decode-lookahead-default-2026-09-13]]).

**Why 120 was stale.** It came from the M9 ladder of 2026-09-01, which read a loss at every cache below 120 per layer (×0.55 to ×0.96 from 20 to 57 per layer). The next day, at 57 per layer, one draft read ×1.12, and ×1.20 once a rejected draft rolled back instead of re-running ([[records/measurements/the-rebuild-eliminated-and-the-numbers-that-ship-2026-09-02]]). On 0.2.14 the automatic 40% RAM study measured two drafts at 3,667 slots, 76.4 experts per layer, against plain decode on the same memory: 31.7% faster on the equal-workload aggregate, positive on prose, code and arithmetic, from two clean pairs per workload ([[records/measurements/mtp-depth-auto40-multitasking-2026-09-11]]). The held-out B1 cohorts ran the head at about 88 per layer. The floor sits at the smallest cache measured faster with two drafts, not at 57, whose ×1.20 was one draft on the 2026-09-02 engine.

**What it replaces.** The activation floor in [[records/decisions/draft-depth-defaults-to-one-and-auto-floor-120-per-layer]], which [[records/decisions/draft-depth-defaults-to-two]] kept at 120. Draft depth stays two, the RAM share stays 70% and the ceiling stays 33 GB, 34.6 GB with the head.

**Limits.** The 76-per-layer evidence is small-sample and short-context, on one M5 Pro; slower SSDs, where each miss costs more, are unmeasured. `--mtp off` restores plain decode.
