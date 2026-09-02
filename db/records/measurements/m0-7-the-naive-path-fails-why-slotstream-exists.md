---
type: measurement
id: 01m1hhwkek03fe86y4hkyetkmf
created: 2026-09-02T17:15:25.523699+00:00
updated: 2026-09-02T17:15:25.523699+00:00
summary: M0.7 — The naive path fails (why slotstream exists)
date: 2026-08-28
doc: measurements
level: '2'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '100'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: M0.7 — The naive path fails (why slotstream exists)
status: measured
---

Downloaded the full 4-bit conversion (97 GB on disk, 11 shards + tokenizer) and ran
it through stock `mlx_lm.load()` on this 48 GB Mac.

**Result: the machine went to 48.8 GB of swap and the process was killed before
emitting a single token.** Root cause, found in
`mlx_lm/utils.py:load_model`:

```python
model.load_weights(list(weights.items()), strict=strict)
if not lazy:
    mx.eval(model.parameters())   # <- materialises all 104 GB
```

`load()` defaults to `lazy=False`. So the out-of-the-box Python path is not merely
slow on a 48 GB machine — it is fatal, and it takes the whole machine into heavy
swap on the way down (the exact failure mode PLAN.md §3.4 predicted for
mmap-and-pray, now observed rather than argued).
