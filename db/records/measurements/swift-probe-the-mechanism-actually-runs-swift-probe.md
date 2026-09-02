---
type: measurement
id: 01m1hhwka77f9hzg29dpw5g9pf
created: 2026-09-02T17:15:25.383348+00:00
updated: 2026-09-02T17:15:25.383348+00:00
summary: Swift probe — the mechanism actually runs (swift-probe/)
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '60'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Swift probe — the mechanism actually runs (`swift-probe/`)
status: measured
---

A Swift executable that allocates a slot pool, preads expert records from disk, and
gathers over the pool. Measured on this Mac:

| Step | Result |
|---|---|
| Slot pool alloc (1.42 GB, 512 slots) | 0.52 s |
| `gatherQuantizedMM` vs `quantizedMatmul` | **max abs diff 0.0 — bit-identical, PASS** |
| Slot batch scatter (48 experts) | 2.67 ms = **49.77 GB/s**, in place |
| pread 48 records QD1 → QD16 | 15.70 → 59.94 GB/s (cache-warm store; see M0.5 for cold) |

The Swift slot-write figure (49.77 GB/s) independently reproduces the Python
measurement (49.22 GB/s at the same 2,048-slot pool) — two languages, same kernel
path, agreeing to 1%. **The SlotPool architecture is sound in the target language.**
