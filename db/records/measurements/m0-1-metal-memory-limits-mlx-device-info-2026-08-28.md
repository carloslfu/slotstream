---
type: measurement
id: 01m1hhwk4r8c7qejrbb8tzjpxv
created: 2026-09-02T17:15:25.208595+00:00
updated: 2026-09-02T17:15:25.208595+00:00
summary: M0.1 — Metal / memory limits (mlx device_info, 2026-08-28)
date: 2026-08-28
doc: measurements
level: '2'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '10'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: M0.1 — Metal / memory limits (mlx `device_info`, 2026-08-28)
status: measured
---

| Quantity | Value |
|---|---|
| `memory_size` | 51,539,607,552 B (48.0 GiB) |
| `max_recommended_working_set_size` | 40,200,896,512 B (**37.4 GiB**) |
| `max_buffer_length` | 30,150,672,384 B (**28.1 GiB**) |
| architecture | `applegpu_g17s` |
| `iogpu.wired_limit_mb` | 0 (default) |

Consequences:
- Total footprint budget on this Mac is **≤ 37.4 GiB**, not 48. The `pro48` preset
  (~32 GB) fits with ~5 GB headroom.
- `max_buffer_length` caps a **single MLXArray at 28.1 GiB**. The slot pool is
  9 separate tensors (gate/up/down × weight/scales/biases), the largest being
  `gate_proj.weight` at 8/27 of the pool, so a 27 GB pool → 8.0 GiB largest tensor.
  Not binding here, but a **single-tensor pool layout would have been**. Keep the
  9-tensor layout.
