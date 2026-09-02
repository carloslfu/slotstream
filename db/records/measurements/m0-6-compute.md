---
type: measurement
id: 01m1hhwkdgs4vmhjbe9neecsrb
created: 2026-09-02T17:15:25.488649+00:00
updated: 2026-09-02T17:15:25.488649+00:00
summary: M0.6 — Compute
date: 2026-08-28
doc: measurements
level: '2'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '90'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: M0.6 — Compute
status: measured
---

| Measurement | Value |
|---|---|
| Unified-memory bandwidth (bf16 add, 537 MB arrays) | **235.1 GB/s** |
| Single 4-bit `quantized_matmul`, batch 1, 7.37 MB weights | 156.2 µs = **47.2 GB/s** |

The batch-1 quantized matmul reaches only 20% of memory bandwidth: at this size the
kernel is launch/occupancy-bound, not bandwidth-bound. So the naive "3.375 GB of
active weights ÷ 47.2 GB/s = 14 tok/s" extrapolation is **not** a valid compute
ceiling — the real model issues many ops per layer with better parallelism (and the
MoE path gathers 11 experts per layer at once). The honest compute number has to
come from running the model, not from extrapolating one kernel.
