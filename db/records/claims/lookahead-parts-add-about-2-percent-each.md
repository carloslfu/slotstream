---
type: claim
id: 01m2dg6wjh8sq1bp6vx8jpk67e
created: 2026-09-13T13:44:49.489008+00:00
updated: 2026-09-13T13:44:49.489008+00:00
summary: The router weight cache and the deferred GPU drains each add about 2% over prefetch
basis: measured
gate: none
needle: about 2% each
supported_by: '[[records/measurements/decode-path-serialization-attribution-2026-09-13]]'
surfaces: docs/ENGINEERING.md
title: The router weight cache and the deferred GPU drains each add about 2% over prefetch
status: current
---
1.021 and 1.022 over B0 prefetch, 1.046 together, on the exploration prompts over four rounds at 256 outputs; prefetch itself was 1.090 over the shipped path there. The parts were selected on these prompts, so the ratios apportion the held-out 1.114 rather than stand as held-out claims.
