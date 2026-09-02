---
type: claim
id: 01m1hhwp6833jvg5w6800ywvx1
created: 2026-09-02T17:15:28.328356+00:00
updated: 2026-09-02T17:15:28.328356+00:00
summary: The weights are 105.3 GB across 25 files
basis: derived
gate: Tools/verify.sh
needle: 105.3 GB
supported_by:
- '[[records/measurements/m0-2-model-ground-truth-byte-exact-from-safetensors-headers]]'
- '[[records/measurements/the-head-exists-again-the-pinned-conversion-had-dropped-it]]'
surfaces: README.md, llms.txt, docs/CLI.md
title: The weights are 105.3 GB across 25 files
status: current
---

Byte-exact inventory of the pinned conversion (103.8 GB, M0.2) plus the 1.471 GB draft head recovered from the official release (M9). `pull --verify` re-hashes every file and is a verify.sh gate, so a size change fails there.
