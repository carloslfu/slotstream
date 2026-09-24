---
type: run
id: 01m33r18x2j3cxackqm0rrmctq
created: 2026-09-22T05:04:51.618451+00:00
updated: 2026-09-22T05:04:52.114721+00:00
summary: 'Automatic MTP prefill: paired latency evidence'
binary: b24c9f3f37d8674a91fb9306b28f4e5a88c01682d58ae25ed0a9b6e8f6bae41c
captured_at: 2026-09-21
command: finish_qualification.py; timing.py; regressions.py; run_step.py; analyze.py; summarize.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Automatic MTP prefill: paired latency evidence'
tool: Frozen Swift model checks and paired benchmark
---
[Raw capture](../../../artifacts/mtp-prefill-policy-2026-09-21/capture.tar.gz) and [member hashes](../../../artifacts/mtp-prefill-policy-2026-09-21/manifest.json).

The same frozen binary compares `SLOTSTREAM_OPT_FUSED_WORKSPACE=0` against the default automatic policy. Both retain fused attention. Configuration: inventory16387, 10 GB target, 640 slots, compute 256, MTP on with two drafts, greedy maximum 16 outputs, fresh processes, sampled physical footprint. Every primary cell actually emitted 11 tokens and finished at its stop token. The M5 Pro / 48 GB machine uses the pinned MLX 0.32.2 backend. Filesystem cache is uncontrolled; no purge. Source, binary, shader, model-header and exact token identities are preserved.

Each cell waits for 120 consecutive nominal, normal-power seconds. Eligibility requires completion, no global swap activity, nominal power/thermal before and after, matching prompt/output IDs, pool, compute geometry and sampling, and physical peak <= 10 GB. Every primary pair has matching inputs, outputs and compute passes. All three matched pairs are eligible. Median paired prefill-time reduction is 65.40%; median paired request-time reduction is 64.53%.

| Round | Control prefill seconds | Automatic prefill seconds | Pair eligibility |
| --- | ---: | ---: | --- |
| 1 | 153.279 | 56.106 | Eligible |
| 2 | 155.217 | 52.859 | Eligible |
| 3 | 155.869 | 53.936 | Eligible |

The generated analysis.json preserves every exclusion, observed read group, requested read byte count, actual peak and drafted-token count. Requested expert bytes are engine requests, not physical SSD traffic. This is a synthetic long-prompt/MTP result, not a universal throughput or cross-hardware claim. The sequential equality diagnostic is separate and must not be substituted for fresh-process timing.
