---
type: claim
id: 01m1ht96btb3b2w4k872sy067g
created: 2026-09-02T19:42:06.714052+00:00
updated: 2026-09-02T19:42:06.714052+00:00
summary: The sweep reads the 8k acceptance prompt at 184 tok/s at a 16 GB target, against 91 for the 0.2.2 code
basis: measured
gate: Tools/verify.sh (sweep-check)
needle: 91 → 184 tok/s
supported_by: '[[records/measurements/n2-the-prefill-sweep-grouped-gemm-over-staging-contiguous-reads-no-pool-writes-2026-09-02]]'
surfaces: README.md
title: The sweep reads the 8k acceptance prompt at 184 tok/s at a 16 GB target, against 91 for the 0.2.2 code
status: current
---
Three interleaved rounds on the 8,073-token acceptance prompt at `--memory-gb 16` (a 1024-token pass, 54 experts per layer): 191.8 / 165.5 / 195.0 tok/s against 100.5 / 83.8 / 89.7 for the commit before the sweep, means 184 and 91; the shipped build read 209.5 / 161.8 against 94.6 / 90.1 in two more rounds. Peak 13.2 GB against 13.0.
