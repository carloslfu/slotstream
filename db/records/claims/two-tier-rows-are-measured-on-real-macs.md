---
type: claim
id: 01m1jprea7c6hgmtxdgpzth8xf
created: 2026-09-03T03:59:46.503841+00:00
updated: 2026-09-03T03:59:46.503841+00:00
summary: Two tier rows are measured on real Macs; the other three are estimates from the 48 GB curve.
basis: measured
gate: none
needle: measured on real Macs
supported_by: '[[records/measurements/c1-mac-mini-m2-16gb-base-storage-community-2026-09-02]]'
surfaces: README.md, docs/HARDWARE.md
title: Two tier rows are measured on real Macs
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
