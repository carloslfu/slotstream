---
type: claim
id: 01m1hhwpdqv5p3t6dhtycv8sh0
created: 2026-09-02T17:15:28.567138+00:00
updated: 2026-09-13T14:46:28.716021+00:00
summary: Historical development-Mac I/O concurrency comparison; no universal SSD optimum.
basis: measured
gate: none
needle: little benefit from 12 to 32
supported_by:
- '[[records/measurements/prefill-second-pass-2026-08-30-the-cost-model-was-wrong-read-ahead-does]]'
surfaces: docs/CLI.md
title: The development-Mac queue-depth sweep found little benefit from 12 to 32
status: current
---

QD 12 and 32 tie at about 4.5 GB/s of prefill IO; 64 and 128 are worse. An expert is nine 307 KB pieces, which is why the SSD's 17.3 GB/s is not reached.

## Public scope clarified, 2026-09-13

The CLI guide labels this as a development-Mac result. The old sweep used an earlier read path; its throughput and queue-depth behavior do not qualify other SSDs or every current prefill path. The selected default remains intact.
