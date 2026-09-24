---
type: claim
id: 01m356k610nkgqjndsgf8eehkq
created: 2026-09-22T18:38:32.992837+00:00
updated: 2026-09-22T18:38:32.992837+00:00
summary: Qualified long MTP prefill policy reduces paired prefill time
basis: measured
gate: Tools/claims_gate.py
needle: '| 16K inventory prompt, MTP on | Larger-read workspace policy off | 155.22 s → 53.94 s prefill | 65.40% |'
supported_by: '[[records/measurements/mtp-prefill-policy-2026-09-21]]'
surfaces: README.md, docs/HARDWARE.md
title: Qualified long MTP prefill policy reduces paired prefill time
status: current
---
Three clean matched pairs on the M5 Pro / 48 GB with a 10 GB target, 16,387 synthetic inventory tokens, MTP on with two drafts and 11 actual outputs. Both arms use the same pre-release binary and fused attention; control disables fused-workspace accounting. Times are rounded arm medians, while 65.40% is the median of paired reductions. This policy shipped in 0.2.23. It is not a complete release-to-release or decode-throughput claim.
