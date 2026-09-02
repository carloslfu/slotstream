---
type: claim
id: 01m1hhwpb4qv7765c7qxe1d1mh
created: 2026-09-02T17:15:28.484119+00:00
updated: 2026-09-02T17:15:28.484119+00:00
summary: A full 32k prompt waits about 5.5 min before its first token on a 48 GB Mac
basis: derived
gate: Tools/planner_gates.sh
needle: 5.5 min
supported_by:
- '[[records/measurements/prefill-a-bigger-pass-really-is-faster-measured-at-a-matched-pool-2026]]'
- '[[records/measurements/prefill-second-pass-2026-08-30-the-cost-model-was-wrong-read-ahead-does]]'
surfaces: README.md, docs/TROUBLESHOOTING.md
title: A full 32k prompt waits about 5.5 min before its first token on a 48 GB Mac
status: current
---

The planner's wait estimate from the measured prefill ladder (112.9 tok/s at a 2048 pass on 8,016 tokens, ×1.15 for 4096) and the shrinking pass schedule; planner_gates.sh checks that doctor's wait equals prefill-schedule's and is monotone. No 32k prompt has been read end to end on this machine.
