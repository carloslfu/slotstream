---
type: measurement
id: 01m1hhwmrjwc0gs2vg4y0gzrkn
created: 2026-09-02T17:15:26.866175+00:00
updated: 2026-09-02T17:15:26.866175+00:00
summary: Open, each needing an explicit go
date: 2026-09-02
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M11
order: '640'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Open, each needing an explicit go
status: analysis
---

- **One hour on a rented 10 Gbit/s host** (billed): the current client at 8,
  32 and 64 connections against Hugging Face, next to `hf_xet` on the same
  model. Decides between client tuning and implementing Xet.
- **A Xet download path in Swift**, roughly a week: token endpoint,
  reconstruction call, signed multi-range fetches, LZ4 and byte-grouping
  decompression, reassembly, then the existing sha256 gate.
- **Pull from a LAN peer.**
