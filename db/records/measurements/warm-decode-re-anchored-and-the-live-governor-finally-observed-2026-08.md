---
type: measurement
id: 01m1hhwkspecbmpxkp98yt5fmy
created: 2026-09-02T17:15:25.878692+00:00
updated: 2026-09-02T17:15:25.878692+00:00
summary: Warm decode re-anchored, and the live governor finally observed (2026-08-30)
date: 2026-08-30
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '260'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Warm decode re-anchored, and the live governor finally observed (2026-08-30)
status: measured
---

Two things had been asserted in the docs for two releases without being
re-measured on the shipped build. Both turned out to need correcting.

**The decode estimate was 25 to 45% optimistic in the middle of its own range.**
The old curve interpolated between 30/layer = 5.6 tok/s and 181/layer = 20.0.
Re-measured on 0.1.6 with the pool warm:

| experts/layer | measured | old estimate |
|---|---|---|
| 30 | 6.0 | 5.6 |
| 60 | 8.2 | 9.2 |
| 120 | **11.2** | **14.8** |
| 150 | 11.6 | 17.3 |

Three checks make this trustworthy. **It is not a regression from 0.1.6's
changes**: 0.1.5 and 0.1.6 were A/B'd interleaved at an identical 60/layer and
came out the same (7.4 / 8.0, then 8.1 / 8.2). **It is not under-warming**:
fourteen consecutive generations at 120/layer plateau at the second one and hold
11.0 to 11.4, so three samples is enough. And the curve is **nearly flat from
120 to 150**, meaning the plateau starts far below the 181 the old curve
assumed.

The 20.0 figure at 181/layer could not be re-verified: that config peaks at
27.4 GB against 26.6 GB reclaimable. Forcing it anyway — which is what
`--experts-per-layer` is for, and it is never resized by the clamp — drove the
machine to 158 MB free and 13 GB of swap, and produced a wide 12.5 to 18.6
band that is not a clean measurement of anything. The estimator now
interpolates the verified points and **holds flat above them** rather than
extrapolating to a number nobody has reproduced. Under-promising is the right
failure direction for a planner.

**The elastic governor had never been watched doing its job.** Its *policy* was
covered through 19 branches, and `elastic-check` proved the pool can be resized
without changing the math, but nothing had exercised the loop that connects
them: poll, decide, take the generation lock, resize, update the plan, log.
A 5 GB memory hog did not trigger it — correctly, because the replan credits
back the pool and fixed footprint, so it still wanted *more* than it had.

`slotstream elastic-drill` closes it using the availability seam instead:

```
start:   1615 slots (~34/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~34 → ~18 experts/layer (4.5 → 2.4 GB pool, cold)
squeeze:  862 slots (~18/layer) -> Nile, Amazon, Yangtze
cooldown: held at 862 slots, as designed
elastic: memory freed — cache ~18 → ~69 experts/layer (2.4 → 9.2 GB pool, contents kept)
recover: 3312 slots (~69/layer) -> Nile, Amazon, Yangtze
```

Shrink, cooldown, grow, and **byte-identical output at every size**.

One hazard found while building it, now documented on the seam itself:
`availabilityOverride` does not make the allocation imaginary. Simulating 60 GB
free on a machine with 7 GB made the governor take a real 25.4 GB pool and drove
swap from 13 to 39 GB. Anything using that seam must bound the simulated value
by `deviceAvailableGB()`, which the drill now does — and it skips rather than
fails when the machine is too busy to leave shrink headroom.
