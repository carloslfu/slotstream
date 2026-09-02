---
type: design
meta-type: conclusion
id: 01m1hhwmtzy3hdem9bswjz5d4q
created: 2026-09-02T17:15:26.943840+00:00
updated: 2026-09-02T17:15:26.943840+00:00
summary: slotstream — Qwen3.8-Flash-Next on every Apple Silicon Mac
date: 2026-08-28
doc: plan
level: '1'
order: '0'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: slotstream — Qwen3.8-Flash-Next on every Apple Silicon Mac
---

**One binary. MLX + Swift. SSD-streamed experts + n-gram/PLE store, RAM cache slots as the
speed↔memory knob, Ollama-compatible API.**

Created 2026-08-28. This file is the whole plan: design, math, build phases, test matrix,
and the living status tracker. Update it in place as milestones land (checkboxes + the
Measured columns). Everything marked **est.** is a first-principles estimate to be replaced
by a measurement; everything marked **verified** came from the model config or a live check.

---
