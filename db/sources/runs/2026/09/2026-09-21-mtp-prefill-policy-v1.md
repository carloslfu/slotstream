---
type: run
id: 01m33r19xkc7t8vj3ed0wpd3p0
created: 2026-09-22T05:04:52.659263+00:00
updated: 2026-09-22T05:04:53.089392+00:00
summary: 'MTP phase accounting alone: larger-scope gate failure preserved'
binary: e30cbec04f066c0a39fea413142e182178a41d671603e609095e2d1b44a7c438
captured_at: 2026-09-21
command: finish_qualification.py; timing.py; regressions.py; run_step.py; analyze.py; summarize.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'MTP phase accounting alone: larger-scope gate failure preserved'
tool: Frozen Swift model checks and paired benchmark
---
[Raw capture](../../../artifacts/mtp-prefill-policy-2026-09-21/capture.tar.gz) and [member hashes](../../../artifacts/mtp-prefill-policy-2026-09-21/manifest.json).

V1 removed the blanket MTP exclusion and added separate phase accounting. Raw logits, every retained state byte, continuation, speculative IDs and the 10 GB physical ceiling passed, but the newly required group > 8192 assertion failed: the largest admitted group was 8192. Preserve the failed report and candidate-v1 binary/source identity. The followup did not weaken that assertion or enlarge its pool/budget. It changed actual expert-buffer lifetimes and priced the largest replacement piece, after which V2 and final both passed the original larger-group assertion.
