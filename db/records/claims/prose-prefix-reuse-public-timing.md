---
type: claim
id: 01m356k61m0yygpgphjs2wbq6e
created: 2026-09-22T18:38:33.012017+00:00
updated: 2026-09-22T18:38:33.012017+00:00
summary: Exact prose prefix reuse reduces follow-up request time
basis: measured
gate: Tools/claims_gate.py
needle: '| 2K prose follow-up, MTP off | Prefix checkpoints disabled | 30.73 s → 4.42 s request | 85.62% |'
supported_by: '[[records/measurements/published-prompt-speed-audit-2026-09-22]]'
surfaces: README.md, docs/HARDWARE.md
title: Exact prose prefix reuse reduces follow-up request time
status: current
---
Three clean follow-up pairs on installed 0.2.23, M5 Pro / 48 GB, 10 GB target, MTP off. Warmup reads 2,090 tokens; follow-up reads 2,092 and reuses 2,048, emitting the same 16 capped tokens in both arms. Control disables boundary and complete-prompt checkpoints. Times are rounded arm medians; 85.62% is the median paired request reduction. First-request cost is excluded; only one full two-request pair is clean. Prior releases already had caching, so this is not an incremental release gain.
