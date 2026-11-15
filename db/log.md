---
type: log
---

# Curator log

## [2026-11-04 20:54] update | records/measurements/pr-hardening-integrated-qualification.md
Qualify all 75 reviewed PRs: retain original and integrated build evidence, correct validation gaps, preserve one excluded timing pair and its frozen replacement, and record bounded native, static, consumer, live-model and paired performance checks.

## [2026-11-15 21:41] create | records/decisions/demand-read-threads-stay-an-experimental-switch.md
Keep demand read lanes on real threads behind SLOTSTREAM_OPT_DEMAND_THREADS, off by default, after PR #141's one-Mac comparison showed more reads in flight without faster generation. Bound the thread pool, wake one thread per lane, and gate identical output and failed-read recovery with the switch on.

## [2026-11-15 23:50] update | records/decisions/demand-read-threads-stay-an-experimental-switch.md
Add the removal rule: a mirrored-disk comparison of real generation that shows no gain removes the switch, so the experiment ends in a promotion or a removal.

