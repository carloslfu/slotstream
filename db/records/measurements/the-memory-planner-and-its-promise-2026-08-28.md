---
type: measurement
id: 01m1hhwkpgzpv673q3xh9ggvdt
created: 2026-09-02T17:15:25.776889+00:00
updated: 2026-09-02T17:15:25.776889+00:00
summary: The memory planner and its promise (2026-08-28)
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
note: The log-linear decode curve was replaced on 2026-08-30 (it over-promised 25 to 45% through its middle) and the 70%-of-RAM auto policy by the 33 GB knee on 2026-08-31; the promise test, the fixed-footprint model, and the floor stand.
order: '190'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
superseded_by:
- '[[records/measurements/warm-decode-re-anchored-and-the-live-governor-finally-observed-2026-08]]'
- '[[records/measurements/the-auto-memory-target-70-of-ram-was-the-wrong-shape-2026-08-31]]'
title: The memory planner and its promise (2026-08-28)
status: superseded
---

The default UX is now zero-flag auto-tune (`SlotstreamCore/Plan.swift`), and the
constants in it are derived from the measurements above, not chosen:

- **Fixed (non-pool) footprint modeled at 3.9 GB** = resident weights 3.822 GB
  + n-gram row cache ≤0.13 GB. Measured whole-run peaks actually came in at
  pool + ~3.3 GB (27.3 @ 24.0-GB pool; 7.3 @ 4.0-GB pool) — the model errs
  ~0.6 GB high on purpose so the announce over-promises memory use, never
  under-promises.
- **`--memory-gb G` derivation**: pool = G − 3.9 − 0.5 margin. Promise test,
  measured: `--memory-gb 8` → 27 experts/layer, **actual peak 7.0 GB**
  (predicted 7.5, target 8.0), 5.2 tok/s decode, byte-identical greedy output —
  now a standing gate in `Tools/verify.sh`.
- **Auto policy**: target = min(70% RAM, working set − 2 GB). On this Mac:
  min(36.1, 38.2) = 36.1 GB → 239/layer (31.7 GB pool) → **actual peak 35.0 GB**
  (predicted 35.6) under the 40.2 GB working set. Announced at startup and in
  `/api/show` `details.memory_plan`.
- **est. tok/s in the announce** was log-linear between the two measured
  anchors (30/layer = 5.6, 181/layer = 20.0) and flat above 181 (decode is
  kernel-launch-bound there, §M0.6) — labeled "est. from M5 Pro anchors"
  because other machines' SSD/GPU shift the curve. Spot check: the 8-GB-target
  run's 27/layer estimated ~5.2 and measured 5.22. **This curve was replaced on
  2026-08-30** — it over-promised 25 to 45% through its own middle; see the
  re-anchoring section below for the measured replacement.
- **Floor**: 640 global slots (~14/layer, §SlotPool) ⇒ minimum honest target
  6.2 GB; below it `--memory-gb` refuses with the arithmetic spelled out.
