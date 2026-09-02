---
type: measurement
id: 01m1hhwkpz68146fmmxy9crtd2
created: 2026-09-02T17:15:25.791154+00:00
updated: 2026-09-02T17:15:25.791154+00:00
summary: 'The availability clamp (2026-08-28): auto respects what other apps hold'
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '200'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'The availability clamp (2026-08-28): auto respects what other apps hold'
status: measured
---

Static sizing alone had a first-impression failure mode: a 48 GB Mac with 30 GB
already in use would still get a 36 GB target → swap storm. Auto now also reads
**currently reclaimable memory** and clamps to it (minus max(1.5 GB, 5% RAM)
slack) when that is the binding constraint.

**Choosing the "available" definition** (probed live on this machine):

| Candidate | Value at probe time | Verdict |
|---|---|---|
| `kern.memorystatus_level` (= `memory_pressure` "free %") | 88% = 45.4 GB | rejected — counts other apps' compressible/swappable memory as free; sizing a GPU pool against it *causes* the swap storm |
| `host_statistics64`: free (raw counter incl. speculative) + purgeable + external file-backed | 33.8 GB | **adopted** — pages reclaimable without compressing or swapping anyone |

**Live pressure test** (21.5 GB hog of distinct `bytearray`s over a 64 MB
urandom block — page-level incompressible, allocation at memcpy speed):

| Phase | Reclaimable | Auto target | Result |
|---|---|---|---|
| Before | ~29–33 GB | 26.7–34.4 GB (clamp gently binding — this session's apps) | note printed |
| Hog up | 13.2 GB | **10.7 GB** (47/layer) | run completed: **9.4 GB actual peak**, 6.4 tok/s cold, coherent output, no thrash |
| Hog killed | 36.9 GB | 34.4 GB | sprang back, no restart needed for the *next* process |

Semantics: the clamp applies to **auto only** and only at startup; explicit
knobs are honored unchanged with an informational "only X GB is reclaimable"
note. On a pristine machine the clamp sits above the ceiling and never binds,
preserving deterministic sizing. Cross-machine behavior is pinned by seven
simulated-setup gates in `Tools/verify.sh` driven by
`doctor --sim-ram/--sim-working-set/--sim-available` (48 pristine → 36.0
unclamped; 48 busy → 15.4 + note; 16 pristine → 9.8 unclamped; 16 busy → 6.2
floor + heavy-paging warning; 8 GB → 6.2 floor + too-small warning; 128 GB →
fully resident; explicit 30 GB on busy 48 → honored + info note).
