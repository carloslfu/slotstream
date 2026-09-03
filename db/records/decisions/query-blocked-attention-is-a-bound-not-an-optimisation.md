---
type: decision
id: 01m1jz3cxmh3j8shgg78qh976p
created: 2026-09-03T06:25:34.132370+00:00
updated: 2026-09-03T06:25:34.149493+00:00
summary: Query-blocked attention is a bound above the measured product, not an optimisation
decided_on: 2026-09-03
evidence: '[[records/measurements/the-pass-peaks-on-a-plateau-not-one-transient-2026-09-03]]'
reversible_if: the PLE and MoE-sweep transients are bounded too, at which point blocking attention below the threshold can be re-measured and may finally lower the peak — or the context cap rises, where the bound is what keeps the pass from having to halve
title: Query-blocked attention is a bound above the measured product, not an optimisation
status: standing
---
Splitting a pass into query blocks is exact (bit-identical at 256 and up, 1.3x
faster in isolation) and bounds a score matrix that otherwise grows with pass x
context. End to end it lowered peak RSS by 0.00 GB, because the phase trace
shows attention, the PLE layer and the MoE sweep peaking within 0.6 GB of each
other: blocking takes 0.58 GB off attention and PLE holds the same maximum. So
it ships with its threshold at `PrefillSchedule.measuredQueryKeyProduct`, which
makes it a no-op at every configuration the planner produces today and a cap
exactly where the schedule already shrinks the pass. It must not be described as
a speed or memory improvement, and it must not be enabled below the threshold
expecting memory back: it costs a few percent there and returns nothing.