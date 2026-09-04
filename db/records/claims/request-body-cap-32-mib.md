---
type: claim
id: 01m1mtw5x0qbspvtej8xyx4dt6
created: 2026-09-03T23:50:12.128818+00:00
updated: 2026-09-03T23:50:12.147050+00:00
summary: A request body over 32 MiB is refused with 413
basis: derived
gate: api_robustness.sh sends 40,000,000 and expects 413
needle: 32 MiB
supported_by: '[[records/measurements/v1-the-vision-tower-cost-and-correctness-2026-09-03]]'
surfaces: docs/API.md
title: A request body over 32 MiB is refused with 413
status: current
---
Raised from 4 MiB when images needed to fit in a body; a 24 MiB picture is the largest one it can carry, base64 costing 4/3. The robustness gate's oversize probe moved with it — at 9,999,999 bytes it had silently stopped testing anything.