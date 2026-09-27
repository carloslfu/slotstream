---
type: claim
id: 01m1jprea7c6hgmtxdgpzth8xf
created: 2026-09-03T03:59:46.503841+00:00
updated: 2026-09-27T05:04:11.851250+00:00
summary: Hardware results are measured on real Macs from 16 to 128 GB; planner estimates remain separate.
basis: measured
gate: none
needle: measured on real Macs
supported_by: '[[records/measurements/c1-mac-mini-m2-16gb-base-storage-community-2026-09-02]]'
surfaces: README.md, docs/HARDWARE.md
title: Hardware results measured on real Macs
status: current
---
Replaces the withdrawn "Only the 48 GB row is measured on real hardware", which
named its own trigger: a second machine record. That arrived on 2026-09-02 with
[[records/measurements/c1-mac-mini-m2-16gb-base-storage-community-2026-09-02]].

The measured rows are 48 GB ([[records/machines/macbook-pro-m5-pro-48gb]]) and
16 GB ([[records/machines/mac-mini-m2-16gb]]). The 8, 24, and 32 GB rows remain
estimates from the 48 GB curve. Both surfaces must say which is which, and the
phrase "measured on real hardware" must not return: it is the withdrawn claim's
needle and the gate fails on it.

## Additional reports, 2026-09-08

The two-row description above records the initial correction. The hardware
table now also includes the 128 GB M5 Max and 32 GB M5 Air, supported by
[[records/measurements/c2-macbook-pro-m5-max-128gb-community]] and
[[records/measurements/c3-macbook-air-m5-32gb-community]]. The 8 and 24 GB
sizes still have no community rows. The separate planner table remains
estimated, including sizes for which an actual report is now available.

## Manual M5 Max targets, 2026-09-13

Both public hardware tables now include the same M5 Max's manual target
results alongside auto. These are additional configurations of the existing
machine, not additional machines or current-release reruns. See
[[records/measurements/c2-macbook-pro-m5-max-128gb-community]].

## Table presentation, 2026-09-13

README now has a separately labeled rough-estimate table and an actual
results table with distinct installed RAM, version and process-target columns.
The estimate table must not inherit this measured claim. Its assumptions live
in [[records/measurements/hardware-planning-ranges-2026-09-13]].

## Additional reports, 2026-09-24

The hardware tables now also include a 64 GB M3 Max, a 64 GB M4 Max measured
from its internal SSD and from a 10 Gb/s external drive, a 36 GB M4 Max and
the 16 GB M2's 0.2.3 re-run, supported by
[[records/measurements/c4-macbook-pro-m3-max-64gb-community]],
[[records/measurements/c5-macbook-pro-m4-max-64gb-community]],
[[records/measurements/c6-macbook-pro-m4-max-36gb-community]] and
[[records/measurements/c1-mac-mini-m2-16gb-base-storage-community-2026-09-02]].
The 18 and 24 GB sizes still have no community rows.

## A 24 GB report, 2026-09-27

The hardware tables now also include a 24 GB M4 Pro, on 0.2.24 and in its
0.2.25 re-run, supported by
[[records/measurements/c7-macbook-pro-m4-pro-24gb-community]]. The 18 GB size
still has no community row.
