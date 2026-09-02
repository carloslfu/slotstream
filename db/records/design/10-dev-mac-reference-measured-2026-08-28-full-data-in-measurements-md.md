---
type: design
meta-type: conclusion
id: 01m1hhwp1hjyqndpz0r1xcbmdg
created: 2026-09-02T17:15:28.177325+00:00
updated: 2026-09-02T17:15:28.177325+00:00
summary: 10. Dev-Mac reference (measured 2026-08-28 — full data in MEASUREMENTS.md)
date: 2026-08-28
doc: plan
level: '2'
order: '390'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 10. Dev-Mac reference (measured 2026-08-28 — full data in MEASUREMENTS.md)
---

MacBook Pro, Apple M5 Pro, 48 GB unified, 18 cores, 2 TB SSD (APPLE SSD AP2048Z),
macOS 26 (Darwin 25.6.0), Swift 6.3.3, page size 16 KiB.

| Measured | Value |
|---|---|
| Metal working set | 40,200,896,512 B (**37.4 GiB**) |
| Metal max single buffer | 30,150,672,384 B (**28.1 GiB**) |
| `iogpu.wired_limit_mb` | 0 (default) |
| Unified-memory bandwidth | **235.1 GB/s** |
| Batch-1 4-bit matmul | 47.2 GB/s (launch-bound) |
| SSD random 2.7648 MB, cold never-repeat | 9.46 (QD1) → **17.3 GB/s** (QD8+) |
| SSD random 4 KiB / 16 KiB, QD1 | 0.08 / 0.27 GB/s (53.6 / 60.1 µs) |
| Slot scatter, 204-experts/layer (27 GB) pool | **74.9 GB/s**, in place |
| Xcode | **not installed** (CLT only) — see risk register |
