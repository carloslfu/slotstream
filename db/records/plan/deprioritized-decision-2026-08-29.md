---
type: plan
meta-type: operational
id: 01m1hhwnxb75108mehdn46vjg4
created: 2026-09-02T17:15:28.043849+00:00
updated: 2026-09-02T17:15:28.043849+00:00
summary: Deprioritized (decision 2026-08-29)
date: 2026-08-29
doc: plan
kind: deprioritized
level: '3'
order: '340'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: Deprioritized (decision 2026-08-29)
---

Not abandoned, but explicitly behind N1–N5. None of these changes whether a person keeps
using slotstream; they are credibility artifacts and completeness for the milestone map:

- **M8 in full** — the `slotstream bench` subcommand, the W1–W7 workloads, the §5
  Measured column, the presets freeze. Days of building a measurement rig whose output is
  a table. Do targeted measurements ad hoc instead.
- **`lite16` on a real 16 GB Mac** — also blocked on someone else's hardware.
- **M1 locality traces**, **LaunchAgent**. (M9 MTP left this list 2026-09-01 — built; see the M9 design note addendum.)
- *Exception on the soak:* a leak that only appears after 30 minutes is a real bug, not a
  credibility item. Ordinary daily use covers it in the meantime; W5 does not have to be
  built to catch it.

---
