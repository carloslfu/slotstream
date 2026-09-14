---
type: claim
id: 01m2dg6wgw8asdg6zw1n2ag5vn
created: 2026-09-13T13:44:49.436975+00:00
updated: 2026-09-13T14:46:28.868383+00:00
summary: Auto turns speculative decode on when the cache still reaches 76 experts per layer after the head, a 21 GB target
basis: derived
gate: Tools/planner_gates.sh
needle: 21 GB target
supported_by: '[[records/measurements/decode-lookahead-default-2026-09-13]]'
surfaces: docs/CLI.md, docs/ENGINEERING.md, llms.txt
title: Auto turns speculative decode on when the cache still reaches 76 experts per layer after the head, a 21 GB target
status: current
---
At the default context, doctor plans the head off at a 20.5 GB target and on at 21 GB. The floor rests on [[records/measurements/mtp-depth-auto40-multitasking-2026-09-11]]: two drafts 31.7% faster than plain decode on the same memory at 76.4 per layer. Decision [[records/decisions/draft-head-auto-floor-76-per-layer]]; replaces [[records/claims/mtp-auto-floor-120-per-layer-28-gb-target]].

## Scope audit, 2026-09-13

The activation threshold is checked after head and context charges but
before the separate decode-lookahead reservation. The final printed cache can
be smaller than the threshold. Physical availability, a different context or
missing draft weights can disable auto MTP even on a larger-memory Mac.
