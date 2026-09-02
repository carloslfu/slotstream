---
type: claim
id: 01m1hhwpdqv5p3t6dhtycv8sh0
created: 2026-09-02T17:15:28.567138+00:00
updated: 2026-09-02T17:15:28.567138+00:00
summary: Expert read parallelism measured flat from queue depth 12 to 32 and worse above
basis: measured
gate: none
needle: flat from 12 to 32
supported_by:
- '[[records/measurements/prefill-second-pass-2026-08-30-the-cost-model-was-wrong-read-ahead-does]]'
surfaces: docs/CLI.md
title: Expert read parallelism measured flat from queue depth 12 to 32 and worse above
status: current
---

QD 12 and 32 tie at about 4.5 GB/s of prefill IO; 64 and 128 are worse. An expert is nine 307 KB pieces, which is why the SSD's 17.3 GB/s is not reached.
