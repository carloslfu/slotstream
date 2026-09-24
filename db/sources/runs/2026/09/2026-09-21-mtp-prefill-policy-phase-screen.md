---
type: run
id: 01m33r1acycak21wg0nvdwmyfz
created: 2026-09-22T05:04:53.150829+00:00
updated: 2026-09-22T05:04:53.578182+00:00
summary: 'MTP phase accounting versus bounded writes: one-pair screen'
binary: b24c9f3f37d8674a91fb9306b28f4e5a88c01682d58ae25ed0a9b6e8f6bae41c
captured_at: 2026-09-21
command: finish_qualification.py; timing.py; regressions.py; run_step.py; analyze.py; summarize.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'MTP phase accounting versus bounded writes: one-pair screen'
tool: Frozen Swift model checks and paired benchmark
---
[Raw capture](../../../artifacts/mtp-prefill-policy-2026-09-21/capture.tar.gz) and [member hashes](../../../artifacts/mtp-prefill-policy-2026-09-21/manifest.json).

One fresh-process pair compares frozen V1 phase accounting alone against the final automatic policy, at the same 10 GB, 640-slot, compute 256, MTP/two-draft configuration. This isolates the additional write/group tradeoff as a screen; one pair is insufficient for a repeatable speed percentage.

| Round | Control prefill seconds | Automatic prefill seconds | Pair eligibility |
| --- | ---: | ---: | --- |
| 1 | 146.360 | 55.538 | Excluded: swap activity during cell; timing excluded |

Earlier fixed-group experiments found piecewise writes slower. That negative evidence remains valid. The new policy pays those barriers only when they allow at least twice as many rows in a larger group; the comparison here tests that changed benefit. Exact raw cells and any paging exclusions remain in phase-screen/ and analysis.json.
