---
type: run
id: 01m33r19ejjjz70bw43tajntky
created: 2026-09-22T05:04:52.178178+00:00
updated: 2026-09-22T05:04:52.596989+00:00
summary: 'Automatic MTP prefill: exactness, memory and integration'
binary: b24c9f3f37d8674a91fb9306b28f4e5a88c01682d58ae25ed0a9b6e8f6bae41c
captured_at: 2026-09-21
command: finish_qualification.py; timing.py; regressions.py; run_step.py; analyze.py; summarize.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Automatic MTP prefill: exactness, memory and integration'
tool: Frozen Swift model checks and paired benchmark
---
[Raw capture](../../../artifacts/mtp-prefill-policy-2026-09-21/capture.tar.gz) and [member hashes](../../../artifacts/mtp-prefill-policy-2026-09-21/manifest.json).

Final catalogue: 73 groups, 31841 assertions, all pass. Model assertion counts: mtp-equality16-final: 13, plain-equality16: 13, lifecycle: 1914, checkpoint: 25, mtp-vision: 874. A real server restart test forces MTP on in every server launch and checks the ordinary persistent-prefix path. Native Mac build/scripted regressions and the complete static suite pass. Functional and physical-memory checks retain global paging as diagnostics, independently of clean timing eligibility.

The long MTP equality check requires actual grouping beyond 8192 and actual piecewise writes, while comparing raw prompt logits, all retained tensor bytes, teacher-forced continuation, speculative output IDs and chronological compute passes exactly. It exercises 16384 rows and 4878 piecewise writes. Complete process peak including both sequential arms, fingerprinting and continuation is 9.338720528 GB, below 10 GB. Candidate requested reads are 48580300800 bytes; the sequential control requests 1370118758400. Different allocation histories make this an equality/physical-memory check, not a speed comparison.

The followup MTP/image lifecycle explicitly executes piecewise expert writes through cancellation during draft processing, checked read failure, rollback and exact retry. Automatic selection, checkpoints, disk restoration, head alignment, process/live-headroom fallback and image geometry remain covered. At 8.1 GB, forced MTP correctly refuses its additional resident head; normal automatic mode completes with MTP off, within the original target. The fusion-disabled MTP run also completes within its target. See functional-summary.json and each original receipt. No golden, tolerance or memory ceiling was relaxed.
