---
type: claim
id: 01m2s5k2vmg91na4r1yz33mjre
created: 2026-09-18T06:25:00+00:00
updated: 2026-10-03T23:49:14.949294979+00:00
summary: 'Withdrawn historical fio rate claim: original run is missing; current physical-byte corroborated file-reader measurements use a different protocol.'
basis: measured
gate: none; these are properties of one operator's hardware, not of the build
needle: external NVMe reads 3.18 GB/s and whose internal SSD reads 1.81 GB/s
supported_by:
- '[[records/measurements/mirror-reads-across-two-disks-2026-09-18]]'
surfaces: docs/CLI.md
title: Historical disk-rate claim withdrawn for missing original fio output
withdrawn_by: '[[records/measurements/mirror-physical-read-witness-2026-10-04]]'
status: withdrawn
---
Withdrawn because the original fio output for the reported September disk rates is not retained. The dated September measurement preserves what was reported, but those rates do not support a current disk rating or an asserted Thunderbolt ceiling.

The new [[records/measurements/mirror-physical-read-witness-2026-10-04]] uses a prospectively declared existing-file protocol, checked cache controls and physical-driver read deltas for all 36 points. It has different access geometry and cache limits, so its results do not establish the reason for any historical difference. The current CLI no longer presents the unsupported historical rates as machine properties.
