---
type: claim
id: 01m1mtw5tpz4596vnmj705t6y9
created: 2026-09-03T23:50:12.054182+00:00
updated: 2026-09-03T23:51:28.936508+00:00
summary: A picture costs at most 2,304 tokens
basis: derived
gate: vision-check pins the geometry for three sizes including the cap
needle: 2,304 tokens
supported_by: '[[records/measurements/v1-the-vision-tower-cost-and-correctness-2026-09-03]]'
surfaces: README.md, docs/API.md, llms.txt
title: A picture costs at most 2,304 tokens
status: current
---
The engine caps one image at 1536x1536 pixels, which is 96x96 patches and, after the 2x2 spatial merge, 2,304 tokens. The reference processor would allow 16.7M pixels (16,384 tokens); the cap is slotstream's, so one picture cannot eat half the context or a tower pass the memory plan did not price.