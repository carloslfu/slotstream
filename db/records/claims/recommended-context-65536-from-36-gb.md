---
type: claim
id: 01m2dg6wknfv854x9ta2drzzy7
created: 2026-09-13T13:44:49.525471+00:00
updated: 2026-09-13T17:08:29.499690+00:00
summary: Auto picks a 65,536-token window from 36 GB and 32,768 below
basis: derived
gate: Tools/planner_gates.sh
needle: 65,536 from 36 GB
supported_by: '[[records/measurements/automatic-context-window-plans-2026-09-13]]'
surfaces: README.md, docs/HARDWARE.md
title: Auto picks a 65,536-token window from 36 GB and 32,768 below
status: current
---
From `doctor --sim-ram` automatic plans on the 0.2.17 candidate ([[records/measurements/automatic-context-window-plans-2026-09-13]]). At 24 GB a 65,536-token window would add 17.7% to a typical request and at 32 GB it would turn speculative decoding off, so auto keeps 32,768 tokens. At 36 GB it adds 8.9%, within the 10% tolerance, and keeps the draft head and the lookahead. Before 0.2.17 this was a recommendation and every plan started at 32,768 tokens.

## Scope audit, 2026-09-13

The thresholds come from decimal-GB what-if plans, with draft weights available and no competing memory use. They are planning decisions, not qualification of every Mac sold with those memory labels. Mac marketed RAM, Metal capacity and available memory can differ from the simulated inputs, and a busy start can lower the window.
