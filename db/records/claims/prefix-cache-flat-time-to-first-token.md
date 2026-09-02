---
type: claim
id: 01m1hhwp811xvdapzpva01tykj
created: 2026-09-02T17:15:28.384995+00:00
updated: 2026-09-02T17:15:28.384995+00:00
summary: 'Time to first token stays flat across a conversation: 6.0 s at turn eight against 25.8 s uncached'
basis: measured
gate: Tools/verify.sh
needle: 25.8 s
supported_by:
- '[[records/measurements/the-conversation-prefix-cache-2026-08-29-flat-time-to-first-token]]'
surfaces: README.md
title: 'Time to first token stays flat across a conversation: 6.0 s at turn eight against 25.8 s uncached'
status: current
---

Eight-turn conversation at a 16 GB target, 2026-08-29. `prefix-check` gates that reuse stays equivalent, bounded, and deterministic; the timing itself is not gated.
