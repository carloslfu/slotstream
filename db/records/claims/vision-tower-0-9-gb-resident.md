---
type: claim
id: 01m1mtw5s6kd38ggbz4j93t4t2
created: 2026-09-03T23:50:12.006827+00:00
updated: 2026-09-03T23:51:28.908858+00:00
summary: The vision tower costs 0.9 GB, and only when an image arrives
basis: measured
gate: vision-check (the banner line), verify.sh vision parity
needle: 0.9 GB
supported_by: '[[records/measurements/v1-the-vision-tower-cost-and-correctness-2026-09-03]]'
surfaces: README.md, docs/API.md, llms.txt
title: The vision tower costs 0.9 GB, and only when an image arrives
status: current
---
0.898 GB of bf16 tensors read from the checkpoint header (V1). Rounded up to 0.9 in `Planner.visionResidentGB`. Not part of the announced peak: the plan states it and `Engine.ensureVisionTower` charges it against what is reclaimable when the first picture arrives.