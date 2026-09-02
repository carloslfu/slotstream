---
type: decision
id: 01m1hhwpjdwgvsrfr04wbsdfgw
created: 2026-09-02T17:15:28.717185+00:00
updated: 2026-09-02T17:15:28.717185+00:00
summary: The conversation prefix cache holds four states and only ever extends, never rewinds
decided_on: 2026-08-30
evidence:
- '[[records/measurements/one-slot-was-not-enough-what-a-real-client-did-to-the-cache-2026-08-30]]'
- '[[records/measurements/the-conversation-prefix-cache-2026-08-29-flat-time-to-first-token]]'
- '[[records/plan/n1-conversation-prefix-cache-kv-gdn-state-reuse-across-requests]]'
reversible_if: a real client pattern shows four retained states thrashing while memory allows more, or a rewindable recurrent state lands
title: The conversation prefix cache holds four states and only ever extends, never rewinds
status: standing
---

One slot passed every synthetic test and then scored 0 hits against Open WebUI, whose title-generation request lands between turns; the GDN recurrent state is a fold with no inverse, so reuse is exact-prefix-extend or full rebuild.
