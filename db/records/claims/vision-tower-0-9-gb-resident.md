---
type: claim
id: 01m1mtw5s6kd38ggbz4j93t4t2
created: 2026-09-03T23:50:12.006827+00:00
updated: 2026-09-08T22:35:06.807028+00:00
summary: The vision tower costs 0.9 GB, and only when an image arrives
basis: measured
gate: vision-check (the banner line), verify.sh vision parity
needle: 0.9 GB
supported_by: '[[records/measurements/v1-the-vision-tower-cost-and-correctness-2026-09-03]]'
surfaces: docs/API.md, llms.txt, docs/ENGINEERING.md
title: The vision tower costs 0.9 GB, and only when an image arrives
status: current
---
0.898 GB of BF16 tensors read from the checkpoint header (V1), rounded up to 0.9 in Planner.visionResidentGB. The initial plan exposes vision as allowed but unloaded. Before the first image, Engine.ensureVisionTower charges resident memory inside the original process target, shrinks expert capacity as needed, and requires real headroom. Image attention workspace and owned source pixels are admitted separately before dispatch. Once loaded, the current memory ledger and metadata include the tower reservation.