---
type: measurement
id: 01m1hhwmm38tc6055dsmr8hmey
created: 2026-09-02T17:15:26.723028+00:00
updated: 2026-09-02T17:15:26.723028+00:00
summary: The bound per client link
date: 2026-09-02
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M11
order: '600'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: The bound per client link
status: analysis
---

| Client link (round trip to the bridge) | Today's client, 8 connections | Best possible | Gap |
|---|---|---|---|
| 10 to 100 Mbit/s, any distance | link-bound | link-bound | none |
| 100 Mbit/s to 1 Gbit/s, up to ~150 ms | 95 to 100% of link (Helsinki: 106 at 8, 110 at 16) | 100% | 0 to 5% |
| 1 Gbit/s at 250 to 300 ms | ~80% of link, derived from the window term | 100% | ~20% |
| 2.5 Gbit/s at 70 ms | link-bound: 8 × ~60 MB/s covers ~290 MB/s | link-bound | none |
| 5 to 10 Gbit/s at 70 ms | ~480 MB/s at 8; ~625 at 32 if on one node | ~1.1 GB/s, the Mac's 10 GbE NIC | ~2×, unmeasured |

In time: 1 Gbit/s is 15.5 min measured (M10); 2.5 Gbit/s is about 6 min and
10 Gbit/s about 1.6 min by the link alone, neither measured.
