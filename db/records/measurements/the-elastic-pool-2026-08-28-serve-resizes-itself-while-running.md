---
type: measurement
id: 01m1hhwkqesewt9az3fw091658
created: 2026-09-02T17:15:25.806052+00:00
updated: 2026-09-02T17:15:25.806052+00:00
summary: 'The elastic pool (2026-08-28): serve resizes itself while running'
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '210'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'The elastic pool (2026-08-28): serve resizes itself while running'
status: measured
---

A startup-time size can't be right for a daemon's lifetime — the machine's
state keeps changing. The governor (`Governor.swift`) resizes the pool between
requests, under the engine's generation lock. Mechanics chosen for their memory
transients: **grow** gathers contents into the larger tensors one piece at a
time (transient ≤ one piece ≈ 1 GB; growth only happens when availability
covers it) — cache stays warm; **shrink** frees the old tensors *before*
allocating the small ones (transient = max(old,new), never the sum) and
restarts cold — under pressure, holding two pools to preserve warmth would
spike memory at exactly the wrong moment, and a cold cache refills from SSD in
seconds.

**Correctness across live resizes** — `slotstream elastic-check`, now a
standing verify gate: four greedy generations in one process across
30 → 181 → 30 → 50 experts/layer (grow-with-copy, shrink-cold, regrow) are
**byte-identical** (6.4 s / 9.6 s / 7.0 s / 5.4 s).

**Live experiment 1 — growing 21.5 GB hog against a running server** (first
policy iteration): the poll shed the pool in a cascade
220 → 183 → 145 → 108 → 75 → 37 → 14 experts/layer (29.2 → 1.8 GB) as the hog
grew; a request under pressure and a request after recovery were both
**byte-identical** to the pre-hog baseline; after the hog exited the pool grew
back **with contents kept**, and `/api/show` tracked every step.

**Policy learning (why the triggers are absolute GB, not relative):** with the
feasibility replan crediting everything a restart would release (pool + fixed
footprint — without the fixed credit the equilibrium double-reserves ~4 GB),
the honest adjustment under contention is a few GB regardless of pool size — a
"shrink at <85% of current" trigger can never fire on a 30 GB pool. Final
policy: shrink when desired ≤ current − 1 GB (one-step convergence), grow when
desired ≥ current + 2 GB after 60 s of calm and cooldown; pressure events shed
absolute chunks (warning ≥2 GB/15%, critical ≥4 GB/50%), repeating until calm.
Startup counts as the first resize — launch-time availability can undercount
for a minute (page-reclaim lag from a predecessor process), and growing on
that transient caused churn until the cooldown covered it.

**Live experiment 2 — passive hog, final policy:** equilibrium *held* (no
shed): macOS chose to swap the idle hog's pages rather than raise pressure,
and keeping the hot pool while the OS pages out idle memory is the correct
allocation — the earlier cascade penalized the active workload to protect
idle bytes. **Live experiment 3 — ACTIVE 24 GB hog (every page touched
continuously for 75 s):** still no OS pressure event on this machine — macOS
absorbed the overcommit by compressing/swapping the *idle slots of our own
pool* (Metal shared-storage buffers are ordinary pageable VM). Honest status:
the pressure-event path is implemented and its arithmetic reviewed, but it has
**never been observed firing live** here — the availability poll is the
primary actor in practice, events are the backstop for machines/loads that do
reach system pressure (`sudo memory_pressure -S` would test it directly but
needs root).
