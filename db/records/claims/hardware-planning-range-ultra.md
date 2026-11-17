---
type: claim
id: 01m2dtc5r6kezxmcb1sx89z6bm
created: 2026-09-13T16:42:28.486089+00:00
updated: 2026-11-17T17:14:00.192614+00:00
summary: Estimated warm reply range for 96 GB or more Macs
basis: estimated
gate: none; semantic review against the supporting evidence
needle: ~20–32 tok/s
supported_by: '[[records/measurements/hardware-planning-ranges-2026-09-13]]'
surfaces: docs/HARDWARE.md
title: Estimated warm reply range for 96 GB or more Macs
status: current
---
~20–32 tok/s is a rough planning range, not a measurement of every Mac in this
memory band or a performance bound. Endpoint construction, mixed-release
scope, hardware-transfer assumptions and revision conditions are in
[[records/measurements/hardware-planning-ranges-2026-09-13]]. Public surfaces
must label the range estimated, keep the High and 96 GB+ manual-target and
M5 Max-class hardware assumptions visible, and label the 96 GB+ row as the case
where the model fits in memory, outside Slotstream's target range
([[records/decisions/target-range-macs-that-cannot-hold-the-model]]). No
calibrated probability or universal speed guarantee is supported.
