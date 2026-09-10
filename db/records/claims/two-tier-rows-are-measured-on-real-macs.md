---
type: claim
id: 01m1jprea7c6hgmtxdgpzth8xf
created: 2026-09-03T03:59:46.503841+00:00
updated: 2026-09-09T01:48:49.897807+00:00
summary: Hardware reports cover the M5 Pro, M2 mini, M5 Max, and M5 Air; planner estimates remain separate.
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
