---
type: decision
id: 01m1mtwzyt37m4040ewaxmjm87
created: 2026-09-03T23:50:38.810825+00:00
updated: 2026-09-03T23:50:38.839691+00:00
summary: The vision tower is announced by the memory plan and charged when it loads, never folded into the fixed footprint
decided_on: 2026-09-03
evidence: '[[records/measurements/v1-the-vision-tower-cost-and-correctness-2026-09-03]]'
reversible_if: a majority of requests carry images, or the tier table is re-measured with the tower resident
title: The vision tower is announced by the memory plan and charged when it loads, never folded into the fixed footprint
status: standing
---
Folding 0.9 GB into `fixedFootprintGB` would move every published memory number — the README tier table, the 32 GB peak, the planner goldens — for every user, to buy a capability most requests never use. So `serve` prints the cost as a conditional line, `--vision off` declines it, and `Engine.ensureVisionTower` refuses with a 400 when the machine cannot spare it at the moment the first picture arrives. The option this rules out is the one the first implementation took: allocate it silently and leave the printed plan wrong by a gigabyte.