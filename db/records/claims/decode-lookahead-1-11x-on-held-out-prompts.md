---
type: claim
id: 01m2dg6wek75wr51nxh7qe9vrd
created: 2026-09-13T13:44:49.363261+00:00
updated: 2026-09-13T13:47:38.081926+00:00
summary: The decode lookahead makes decode 1.11x faster on held-out prompts
basis: measured
gate: none
needle: 1.11x
supported_by: '[[records/measurements/decode-path-serialization-b1-cohort-replication-2026-09-13]]'
surfaces: README.md, docs/CLI.md, docs/ENGINEERING.md, llms.txt
title: The decode lookahead makes decode 1.11x faster on held-out prompts
status: current
---
Aggregate 1.114 (bootstrap 1.104 to 1.121) on the twelve held-out B1 prompts, three rounds at 512 outputs, a 20 GB target with two drafts on one 48 GB M5 Pro; every family at 1.064 or above and every output identical. Every surface rounds it down to 1.11x. `slotstream-checks decode-lookahead-defaults` pins the default to the measured configuration; nothing gates the ratio. Adopted in [[records/decisions/decode-lookahead-default-with-the-draft-head]].
