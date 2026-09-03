---
type: claim
id: 01m1hhwpbh18ww4vz6k9b4145t
created: 2026-09-02T17:15:28.497976+00:00
updated: 2026-09-02T17:15:28.497976+00:00
summary: A full 32k prompt waits about 13.7 min on a 16 GB Mac
basis: estimated
gate: Tools/planner_gates.sh
needle: 13.7 min
supported_by:
- '[[records/measurements/prefill-a-bigger-pass-really-is-faster-measured-at-a-matched-pool-2026]]'
- '[[records/measurements/prefill-second-pass-2026-08-30-the-cost-model-was-wrong-read-ahead-does]]'
surfaces: README.md, docs/TROUBLESHOOTING.md
title: A full 32k prompt waits about 13.7 min on a 16 GB Mac
status: withdrawn
---


The same planner arithmetic applied to the 16 GB tier, which is itself an estimate from the 48 GB curve; nothing has been measured on a 16 GB Mac.

Withdrawn 2026-09-02: recomputed from the sweep's ladder on 2026-09-02: about 6.4 min.
