---
type: claim
id: 01m1hhwpctjzybynrka0p7tqn5
created: 2026-09-02T17:15:28.538902+00:00
updated: 2026-09-02T17:15:28.538902+00:00
summary: The stock loader took the 48 GB machine into 48 GB of swap without a token
basis: measured
gate: none
needle: 48 GB of swap
supported_by:
- '[[records/measurements/m0-7-the-naive-path-fails-why-slotstream-exists]]'
surfaces: README.md
title: The stock loader took the 48 GB machine into 48 GB of swap without a token
status: current
---

M0.7, the measurement that started the project: `mlx_lm.load()` at its default drove the machine to 48.8 GB of swap before the first token.
