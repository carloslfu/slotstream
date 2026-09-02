---
type: claim
id: 01m1hhwp4vgemyhf448srq7bth
created: 2026-09-02T17:15:28.283311+00:00
updated: 2026-09-02T17:15:28.283311+00:00
summary: Warm decode is about 12 tok/s on the 48 GB dev Mac
basis: measured
gate: none
needle: 12 tok/s
supported_by:
- '[[records/measurements/warm-decode-re-anchored-and-the-live-governor-finally-observed-2026-08]]'
- '[[records/measurements/the-rebuild-eliminated-and-the-numbers-that-ship-2026-09-02]]'
surfaces: README.md, llms.txt, docs/HARDWARE.md
title: Warm decode is about 12 tok/s on the 48 GB dev Mac
status: current
---

The re-anchored warm-decode ladder reads 11.2 tok/s at 120 experts per layer and 11.6 at 150, flat above that; with the draft head on at auto's 28 GB floor the same machine reads 12.8 (10.3 plain). "~12" is the rounded plain number at the auto plan. No automated speed gate exists; a change here is caught only by re-measuring.
