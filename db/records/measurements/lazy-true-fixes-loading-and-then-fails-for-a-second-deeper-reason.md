---
type: measurement
id: 01m1hhwkfp7ed89cdp7xeen7de
created: 2026-09-02T17:15:25.558138+00:00
updated: 2026-09-02T17:15:25.558138+00:00
summary: lazy=True fixes loading — and then fails for a second, deeper reason
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '110'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: '`lazy=True` fixes loading — and then fails for a second, deeper reason'
status: measured
---

With `load(..., lazy=True)`:

| Step | Result |
|---|---|
| `load()` | **0.4 s, 0.00 GB active, 0.00 GB peak** |

That is the plan's "first token in seconds, never a full-model load" claim, confirmed
on the real 97 GB checkpoint. But the run then **died silently during prefill of a
63-token prompt**, with no traceback — killed while paging.

**Why, and why it matters:** lazy mapping defers materialisation, it does not bound
it. A 63-token prefill routes to ~all 24,576 expert records (coverage
≈ 1−e^(−10·63/512) ≈ 70% per layer, and near-total across 48 layers), and every
touched expert becomes a **live MLX array with no way to release it**. Residency
therefore climbs monotonically toward the full 68 GB and the process dies. Nothing in
the stock path can evict a touched expert.

**This is the precise gap slotstream fills.** Lazy mmap gives you deferred loading;
it does not give you a *bounded working set*. The slot pool — fixed capacity plus an
eviction policy — is what converts "loads lazily, then dies" into "runs in a chosen
footprint forever". The observation also independently confirms §3.3's premise that
on-demand caching is the wrong mode for prefill: the dense sweep exists exactly
because prefill's expert coverage approaches 100%.

Measured IO during that naive page-fault prefill: **21.8 KB mean transfer, ~271 tps,
6.1 MB/s sustained** (an earlier sample caught a burst at 9,012 tps / 148 MB/s).
Against the 17.3 GB/s this same SSD delivers on record-sized reads, page-fault-driven
streaming runs **two to three orders of magnitude below device capability**.
