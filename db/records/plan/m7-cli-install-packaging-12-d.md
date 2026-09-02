---
type: plan
meta-type: operational
id: 01m1hhwnq09da1byay5d3fewcf
created: 2026-09-02T17:15:27.840233+00:00
updated: 2026-09-02T17:15:27.840233+00:00
summary: M7 — CLI, install, packaging (1–2 d)
date: 2026-08-28
doc: plan
kind: milestone
level: '3'
order: '270'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: M7 — CLI, install, packaging (1–2 d)
---
`pull` (resumable HF download + repack + verify + disk preflight), `doctor`, `install`
(LaunchAgent), config/env/logs, `make install`, `gh release` arm64 binary.
**Exit:** clean-machine bring-up in ≤ 3 commands ≤ 30 min (download-dominated).
