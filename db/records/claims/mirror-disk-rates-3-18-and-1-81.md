---
type: claim
id: 01m2s5k2vmg91na4r1yz33mjre
created: 2026-09-18T06:25:00.000000+00:00
updated: 2026-09-18T06:25:00.000000+00:00
summary: The two disks behind the mirror measurement saturate at 3.18 GB/s (external NVMe) and 1.81 GB/s (internal SSD)
basis: measured
gate: none; these are properties of one operator's hardware, not of the build
needle: external NVMe reads 3.18 GB/s and whose internal SSD reads 1.81 GB/s
supported_by:
- '[[records/measurements/mirror-reads-across-two-disks-2026-09-18]]'
surfaces: docs/CLI.md
title: The mirrored machine's disks read 3.18 and 1.81 GB/s
status: current
---
Saturated sequential-read rates, not single-reader rates: the external NVMe needs
2 concurrent readers to reach 3.18 GB/s and the internal SSD needs 4 to reach
1.81 GB/s, and one reader alone gets 2.09 and 1.13 GB/s respectively. The
saturated pair is the right one to quote next to a mirror, because the read path
holds about ten requests open and so operates above both knees.

Both figures describe [[records/machines/mac-mini-m4-32gb]] and are quoted in the
documentation as an example of a machine where a mirror pays, not as a
specification of slotstream. The external number is a Thunderbolt 4 link ceiling
rather than a drive ceiling, so a different enclosure on the same drive would
change it.
