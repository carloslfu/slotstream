---
type: log
---

# Curator log

## [2026-11-04 20:54] update | records/measurements/pr-hardening-integrated-qualification.md
Qualify all 75 reviewed PRs: retain original and integrated build evidence, correct validation gaps, preserve one excluded timing pair and its frozen replacement, and record bounded native, static, consumer, live-model and paired performance checks.

## [2026-11-15 16:13] create | records/measurements/pr143-wired-limit-swap-ab.md
PR #143 wired-limit A/B at 27 GB on the three-copy Mac mini: base 981ce2dd lost its server after 82292 and 50304 swap-outs; head 200fb398 completed all phases with 0. Archive 158 files, machine record and the wired-limit decision with its reversal criterion.

## [2026-11-15 16:13] create | records/measurements/pr143-prefill-guard-usage-sequence.md
PR #143 prefill-guard usage sequence at ctx138240: db0f6c8c (old guard) refused the third main turn by 98.7 MB; 53f3fa58 and 200fb398 completed all requests and the disk-restore replay with peaks 25.64 and 25.53 GB. Archive 466 files including one operator-interrupted run.

## [2026-11-15 21:41] create | records/decisions/demand-read-threads-stay-an-experimental-switch.md
Keep demand read lanes on real threads behind SLOTSTREAM_OPT_DEMAND_THREADS, off by default, after PR #141's one-Mac comparison showed more reads in flight without faster generation. Bound the thread pool, wake one thread per lane, and gate identical output and failed-read recovery with the switch on.

## [2026-11-15 23:50] update | records/decisions/demand-read-threads-stay-an-experimental-switch.md
Add the removal rule: a mirrored-disk comparison of real generation that shows no gain removes the switch, so the experiment ends in a promotion or a removal.

## [2026-11-16 00:31] update | records/decisions/wire-mlx-buffers-to-the-memory-target.md
Make the wired limit opt-in (SLOTSTREAM_OPT_WIRED_LIMIT=1): clamp it to the Metal working set, report a refusal instead of ending the process, follow a moved target and restore the previous limit. State what a default needs.

## [2026-11-17 14:01] create | sources/runs/2026/11/2026-11-17-pr143-4423adb-rerun.md
PR #143 reruns on 4423adb5 with SLOTSTREAM_WIRED_LIMIT=1

## [2026-11-17 14:01] create | records/measurements/pr143-opt-in-wired-limit-rerun.md
PR #143 reruns on 4423adb5 with SLOTSTREAM_WIRED_LIMIT=1

## [2026-11-17 14:01] update | records/machines/mac-mini-m4-32gb-three-copies.md
Record the Metal working set and link the 4423adb5 rerun

## [2026-11-17 14:01] update | records/decisions/wire-mlx-buffers-to-the-memory-target.md
Record the Metal working set and link the 4423adb5 rerun

## [2026-11-17 16:26] update | records/measurements/pr143-opt-in-wired-limit-rerun.md
Explain the two slower prefills from the archived evidence: the read scope was not taken on those turns, the host had less reclaimable memory at those decisions, and the larger regrowth charge cannot be ruled out

## [2026-11-17 16:26] update | records/decisions/wire-mlx-buffers-to-the-memory-target.md
Correction to the 2026-11-15 entry for this record: the switch is SLOTSTREAM_WIRED_LIMIT=1. The name SLOTSTREAM_OPT_WIRED_LIMIT in that entry never shipped

## [2026-11-17 17:18] update | records/decisions/newcomer-documentation.md
Shorten the README from 2948 to 1051 whitespace-delimited words and move the author after 510 rather than 2814 words. Link existing prompt-processing and speed tables, move memory and disk guidance to HARDWARE, preserve the author copy and all 46 original anchors, and repair one stale Hermes setup link. Update 20 active claim surfaces without altering measured evidence or withdrawn-claim checks. Rendered desktop preview, 294 local documentation links, generated docs and all brain gates pass with zero errors or warnings. No engine or release change.

