---
type: claim
id: 01m1ht96cr6ad63khz6js8wcdg
created: 2026-09-02T19:42:06.744799+00:00
updated: 2026-09-02T19:42:06.744799+00:00
summary: The sweep reads the 7,960-token prompt at 93 tok/s at the 8.1 GB floor, against 51 for the 0.2.2 code, at a lower peak
basis: measured
gate: Tools/verify.sh (memory promise on the 7,960-token prompt)
needle: 51 → 93
supported_by: '[[records/measurements/n2-the-prefill-sweep-grouped-gemm-over-staging-contiguous-reads-no-pool-writes-2026-09-02]]'
surfaces: README.md
title: The sweep reads the 7,960-token prompt at 93 tok/s at the 8.1 GB floor, against 51 for the 0.2.2 code, at a lower peak
status: current
---
The 7,960-token acceptance prompt at `--memory-gb 8.1`, one round each: the shipped build 93.1 tok/s at a 6.2 GB peak (the MLX buffer cache capped while the prompt is read), against 50.8 tok/s at 7.7 GB for the commit before the sweep; the sweep without the cap read 88.1 to 88.3 at 7.9 GB.
