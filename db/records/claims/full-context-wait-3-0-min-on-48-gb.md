---
type: claim
id: 01m1ht96avrybwaatpt19n50ye
created: 2026-09-02T19:42:06.683125+00:00
updated: 2026-09-02T19:42:06.683125+00:00
summary: A full 32k prompt waits about 3.0 min before its first token on a 48 GB Mac
basis: derived
gate: Tools/planner_gates.sh
needle: 3.0 min
supported_by: '[[records/measurements/n2-the-prefill-sweep-grouped-gemm-over-staging-contiguous-reads-no-pool-writes-2026-09-02]]'
surfaces: README.md, docs/TROUBLESHOOTING.md
title: A full 32k prompt waits about 3.0 min before its first token on a 48 GB Mac
status: current
---
The planner's wait from the sweep's ladder (85 / 125 / 165 / 205 / 220 tok/s for 256 to 4096-token passes, measured on the acceptance prompt) and the shrinking pass schedule; planner_gates.sh checks that doctor's wait equals prefill-schedule's and stays monotone. No 32k prompt has been read end to end on this machine since the sweep landed.
