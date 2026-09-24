---
type: run
id: 01m33fxx3hz0rqhtq0n3gqs24p
created: 2026-09-22T02:43:12.625034+00:00
updated: 2026-09-22T02:43:13.066559+00:00
summary: 'Automatic prefill policy: timing exclusions and failed qualification'
binary: 3e094a2bb555c5704498da1ba940cb031158dd5867813c83d063abf4b562090e
captured_at: 2026-09-21
command: run_qualification.py; run_remaining.py; run_step.py; analyze.py; summarize.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Automatic prefill policy: timing exclusions and failed qualification'
tool: Frozen Swift model checks and paired benchmark
---
[Raw capture](../../../artifacts/automatic-prefill-policy-2026-09-21/capture.tar.gz) and [member hashes](../../../artifacts/automatic-prefill-policy-2026-09-21/manifest.json).

The new default is compared with the prior final verified build, with no optimization environment variables in either arm. The explicit fixture controls are the same: inventory16387, 10 GB, compute256, MTP off, greedy one-token output, sampled footprint and fresh processes. Effective pool is 961. Filesystem cache is uncontrolled; all binary, shader, source, fixture and model-header identities are preserved. Candidate binary: 3e094a2bb555c5704498da1ba940cb031158dd5867813c83d063abf4b562090e. Baseline binary: 686a6955f614c397087ac0473ced5d2a5373065133d3f2d0fc2d160a5209a297.

The frozen protocol requires three clean matched pairs, with three initial rounds and at most two optional extensions. Every timed cell waits for 120 consecutive nominal, normal-power seconds. Timing eligibility still requires no global paging, nominal thermal at both ends, identical inputs/output IDs/pool/compute, and physical peak at or below the declared target. All six initial processes complete. Every pair is excluded because at least one cell has paging. Two baseline cells are individually eligible, but none forms a matched eligible pair.

| Round | Previous default prefill seconds | Automatic policy prefill seconds | Timing eligibility |
| --- | ---: | ---: | --- |
| 1 | 145.658 | 84.924 | Excluded: paging |
| 2 | 142.374 | 76.459 | Excluded: paging |
| 3 | 139.276 | 88.428 | Excluded: paging |

The original protocol and analysis script are preserved. After paging made all three initial pairs ineligible, a documented early failure stop was added: even two clean extensions could not reach three qualifying pairs. The current third pair was completed; no extension model was launched. The analyzer emits futility-stop.json and exit10, which stops the first driver. run_remaining.py then completes the prespecified smaller-prompt screen and functional checks. No timing threshold is relaxed, no old study is pooled, and this is a failed performance qualification, not a passed promotion gate.

Every primary candidate requests 355763404800 expert bytes versus 1239147417600 in the prior default. These are application-requested bytes, not measured SSD traffic. The first group is 14336 versus 8192 tokens, while all chronological compute passes and output IDs match. Candidate physical peak is at most 8.617757888 GB. The smaller inventory8195 screen has nominal thermal state and no paging in both cells. Prefill is 30.058812041 seconds for the baseline and 29.522505541 for automatic; both select [8192, 3] and request 60167577600 expert bytes. Candidate peak is 8.195935376 GB. One pair cannot establish repeatability or a speed gain. Full receipts are preserved separately. The previous study's one clean 41.67% reduction remains preliminary and is not a new measurement of this default.
