---
type: claim
id: 01m2s5k2vmbcsq9fkd4k406r48
created: 2026-09-18T06:25:00.000000+00:00
updated: 2026-09-18T06:40:00.000000+00:00
summary: On the mirrored two-disk Mac mini the slower internal disk ends up serving about 29% of the bytes
basis: measured
gate: none; only re-running the paired A/B in the supporting measurement would catch this drifting
needle: serving about 29% of the bytes
supported_by:
- '[[records/measurements/mirror-reads-across-two-disks-2026-09-18]]'
surfaces: docs/CLI.md, CHANGELOG.md
title: The slower disk serves about 29% of a mirrored run's bytes
status: current
---
The router's own accounting puts the internal disk at 28.6%, 29.6% and 28.2% of
bytes over the three mirrored rounds, and `iostat` independently measures 30.6%
at the devices. The two do not have to agree exactly, because the engine counts
only the bytes it asked for while `iostat` counts everything the device moved,
including readahead and metadata.

"About 29%" is deliberately imprecise. The split is not configured and not
constant: it is whatever the learned throughputs make it, so a faster or slower
second disk would land somewhere else. The number documents what this hardware
settles at, which is the point of quoting it at all — an operator who sees a very
different split has a different machine, not a broken mirror.
