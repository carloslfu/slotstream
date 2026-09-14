---
type: claim
id: 01m2dtc5pganyhyfdfrkr853h6
created: 2026-09-13T16:42:28.432889+00:00
updated: 2026-09-13T16:42:28.432889+00:00
summary: Estimated warm reply range for 16 to less than 24 GB Macs
basis: estimated
gate: none; semantic review against the supporting evidence
needle: ~1–6 tok/s
supported_by: '[[records/measurements/hardware-planning-ranges-2026-09-13]]'
surfaces: README.md, docs/HARDWARE.md
title: Estimated warm reply range for 16 to less than 24 GB Macs
status: current
---
~1–6 tok/s is a rough planning range, not a measurement of every Mac in this
memory band or a performance bound. Endpoint construction, mixed-release
scope, hardware-transfer assumptions and revision conditions are in
[[records/measurements/hardware-planning-ranges-2026-09-13]]. Public surfaces
must label the range estimated and keep the High/Ultra manual-target and
M5 Max-class hardware assumptions visible. No calibrated probability or
universal speed guarantee is supported.
