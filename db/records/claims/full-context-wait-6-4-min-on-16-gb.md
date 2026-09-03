---
type: claim
id: 01m1ht96baf3y8y36fn613yf6r
created: 2026-09-02T19:42:06.698657+00:00
updated: 2026-09-02T19:42:06.698657+00:00
summary: A full 32k prompt waits about 6.4 min on a 16 GB Mac
basis: estimated
gate: Tools/planner_gates.sh
needle: 6.4 min
supported_by: '[[records/measurements/n2-the-prefill-sweep-grouped-gemm-over-staging-contiguous-reads-no-pool-writes-2026-09-02]]'
surfaces: README.md, docs/TROUBLESHOOTING.md
title: A full 32k prompt waits about 6.4 min on a 16 GB Mac
status: current
---
The same planner arithmetic applied to the 16 GB tier (a 256-token pass at 85 tok/s, which the 8.1 GB floor measured at 88 to 93 on this Mac); the tier itself is an estimate from the 48 GB curve and nothing has been measured on a 16 GB Mac.
