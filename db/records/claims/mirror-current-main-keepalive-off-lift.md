---
type: claim
id: 01m41s5s7tnghww56gyzgx4zpt
created: 2026-10-03T21:02:00.954043553+00:00
updated: 2026-10-03T23:57:36.896190959+00:00
summary: Current-baseline mirror pairs with keepalive off measured decode 6.13 to 7.06 tok/s and prefill reads 3.20 to 4.79 GB/s.
basis: measured
gate: none; repeat the prospectively declared AB/BA protocol against the same qualified profile
needle: decode from 6.13 to 7.06 tok/s and prefill reads from 3.20 to 4.79 GB/s
supported_by: '[[records/measurements/mirror-current-baseline-paired-2026-10-04]]'
surfaces: docs/CLI.md
title: Current-source mirror lift on the explicit keepalive-off profile
status: current
---
Medians of three prospectively declared interleaved AB/BA pairs on Mac mini M4, source `f37412f` based on main `57aa493`. Each arm delivers 200 greedy tokens, seed 1, MTP on, 118 experts/layer, context 8192 and explicit `--gpu-keepalive off`. All token IDs and stdout digests match, both copies pass pinned SHA256 verification, no global swap is observed, and lifetime RSS/physical footprint stay below 28 GB. Scope is this machine/prompt/cache/public profile. OS/SSD cache and default-auto performance are not qualified. Exact commands, identities and raw results are in the linked run.
