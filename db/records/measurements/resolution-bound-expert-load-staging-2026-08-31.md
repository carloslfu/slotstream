---
type: measurement
id: 01m1hhwm3yxm0tgk1x50v8ss8d
created: 2026-09-02T17:15:26.206103+00:00
updated: 2026-09-02T17:15:26.206103+00:00
summary: 'Resolution: bound expert-load staging (2026-08-31)'
date: 2026-08-31
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '410'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'Resolution: bound expert-load staging (2026-08-31)'
status: measured
---

The discontinuity was the cold expert-fill shape. One 256-token layer can
route all 512 experts, and `SlotPool.ensure` handed all misses to one
`ExpertStore.readBatch`. At 2,764,800 bytes per record that is a **1.415 GB raw
batch** across nine tensors; its MLX scatter materialization and the source
buffers coexist at the high-water point. It looked unrelated to prompt length
because the batch jumps to nearly every expert as soon as a prompt is large
enough, then cannot grow beyond 512.

`ensure` now reads and fully scatters at most **32 records at a time**. Each
slice is evaluated before the next is read, so no later slice can overlap its
staging lifetime. The internal reads remain queue-depth-parallel and the pool
still pins the complete routed set before any MoE math, so this changes memory
and scheduling, never weights, routing, or output.

The exact 7,960-token `--memory-gb 10` acceptance prompt after the change:

| metric | before | bounded staging |
|---|---:|---:|
| process RSS peak | 12.4 GB | **8.6 GB** |
| target verdict | over by 2.4 GB | **under by 1.4 GB** |
| prefill | — | 7,960 tokens / 192.74 s = **41.3 tok/s** |
| prefill split | — | 99.13 s I/O + 44.92 s scatter + 48.69 s compute |

That preserves the planner's conservative 40 tok/s estimate for a 256-token
pass while removing 3.8 GB from the observed high-water mark. The answer
remained `SEVENTEEN`, and the ordinary small-vs-large cache equivalence gate
remains the correctness check. No fixed-footprint inflation is needed.
