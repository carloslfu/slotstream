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

