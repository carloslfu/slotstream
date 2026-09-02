---
type: measurement
id: 01m1hhwm2z5f7r1a5tq95cjd8x
created: 2026-09-02T17:15:26.175770+00:00
updated: 2026-09-02T17:15:26.175770+00:00
summary: 'The auto memory target: 70% of RAM was the wrong shape (2026-08-31)'
date: 2026-08-31
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '390'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'The auto memory target: 70% of RAM was the wrong shape (2026-08-31)'
status: measured
---

Auto targeted `min(70% of RAM, workingSet - 2)`, then clamped to
`available - max(1.5, 5% of RAM)`. Two things were wrong with that, and only
the second one matters.

The small one: of *reclaimable* memory it took up to 93%, leaving a fixed
~2.4 GB cushion on a 48 GB Mac however much was free.

The real one: **the target scaled with RAM, and the speed did not.** Measured a
GB at a time with `doctor --json`:

| RAM | old target | est. decode |
|---|---|---|
| 48 GB | 33.6 GB | ~12 tok/s |
| 64 GB | 44.8 GB | ~12 tok/s |
| 128 GB | 89.6 GB (83 GB peak) | ~12 tok/s |

A 128 GB Mac gave up 83 GB to run at the speed 33 reaches. The decode curve
plateaus at 150 experts/layer (11.2 tok/s at 120, 11.6 at 150) and the plan
lands 150 well before it runs out of machine.

**33 GB is the knee**, and it is a two-sided one: it is the smallest target
where the cache clears the decode plateau *and* the budget still affords the
4096-token prefill pass (125 tok/s against 113 at 2048). Sweeping 34 to 84 GB
moves neither number. That the old 70% rule produced 33.6 GB on a 48 GB Mac is
why this never showed up: it was accidentally right for the author's machine
and wrong for every larger one. Auto now takes
`min(33, ramPercent% of RAM, workingSet - 2)`, and the ceiling also makes the
availability clamp stop binding on a quiet 48 GB Mac — 22.8 GB stays free
instead of 14.4, with no loss of speed.

`--max-ram-percent P` exposes the share. Deliberately no knob lifts the
ceiling: `--memory-gb`, `--experts-per-layer` and `--pool-gb` already do that
precisely, and full residency (512/layer, ~88 GB) stays reachable for anyone
wanting to test the one unreproduced hint of a further step at 181/layer.

**A bug this found: more memory could plan a slower machine.** `--memory-gb 26`
planned a *smaller* cache than 25 (116 against 128 per layer) and a slower
decode, because crossing a quarter of the pool budget doubled the prefill pass
from 2.7 to 5.3 GB — more than the GB just added. Pass sizing now scores
candidates by `prompt/prefill + reply/decode` seconds rather than "biggest that
fits", which prices both sides in the same unit. Swept 7 to 90 GB, the
estimated request time never gets worse as the target grows;
`Tools/monotonic_plan.py` is that invariant as a gate.

Two dead ends on the way there, both from optimising decode alone: requiring a
pass step to cost *no* decode collapsed it to 256 tokens on small machines
(94 to 40 tok/s prefill), and a 2% tolerance still let three steps through. The
total-time objective subsumes both.

**Method note.** The first version of the monotonicity gate read the banner and
reported a regression at 31 GB that did not exist: the banner rounds tok/s to
whole numbers, so 11.58 prints as 12 and 11.19 as 11. `doctor --json` now emits
`est_warm_tok_s` and `est_prefill_tok_s` unrounded, and the gate reads those.
Anything asserting on a plan should.
