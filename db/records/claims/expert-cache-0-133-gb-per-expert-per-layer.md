---
type: claim
id: 01m1hhwpe5f44xz5653pj6hp8e
created: 2026-09-02T17:15:28.581328+00:00
updated: 2026-09-02T17:15:28.581328+00:00
summary: Each expert per layer costs 0.133 GB of cache
basis: derived
gate: none
needle: 0.133 GB
supported_by:
- '[[records/measurements/m0-2-model-ground-truth-byte-exact-from-safetensors-headers]]'
surfaces: docs/CLI.md, llms.txt
title: Each expert per layer costs 0.133 GB of cache
status: current
---

One expert record is exactly 2,764,800 bytes; 48 layers of one expert each is 132.7 MB, the unit the memory knobs count in.
