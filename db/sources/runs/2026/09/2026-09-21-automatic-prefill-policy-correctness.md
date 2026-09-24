---
type: run
id: 01m33fxxkdeays5getxrayz1r6
created: 2026-09-22T02:43:13.133925+00:00
updated: 2026-09-22T02:43:13.556375+00:00
summary: 'Automatic prefill policy: default behavior and integration checks'
binary: 3e094a2bb555c5704498da1ba940cb031158dd5867813c83d063abf4b562090e
captured_at: 2026-09-21
command: run_qualification.py; run_remaining.py; run_step.py; analyze.py; summarize.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Automatic prefill policy: default behavior and integration checks'
tool: Frozen Swift model checks and paired benchmark
---
[Raw capture](../../../artifacts/automatic-prefill-policy-2026-09-21/capture.tar.gz) and [member hashes](../../../artifacts/automatic-prefill-policy-2026-09-21/manifest.json).

All final checks run without optimization environment flags. The catalogue passes 73 groups and 31816 assertions. Explicit real-model assertion counts are equality16: 12, lifecycle: 1914, checkpoint: 25, mtp-equality: 10, mtp-vision: 873. The 16387-token state test exercises the complete 16384-token read envelope at a floor-sized pool and proves exact logits, every retained state byte, teacher-forced continuation, output IDs and chronological passes. Its complete process peak, including fingerprinting and continuation, is 7.888063632 GB. Allocation history differs between its sequential arms, so it is not a speed comparison.

Lifecycle tests exercise cancellation, partial-scope rollback, I/O failure, memory refusal, checkpoint splits and smaller-scope fallback. The existing lifecycle fixture explicitly tests legacy hand-seeded checkpoint semantics; the separate deployed checkpoint test retains aligned resume, warm/cold equality, disk reopen and arithmetic-identity refusal. MTP and image tests retain their original reservation and group policy under the new default. No golden or tolerance is changed.

The catalogue's first attempt reported two failures for requested 64/128-row passes: the pure policy advertised a larger cap because the underlying scheduling helper clamps them to 256. The actual automatic dispatcher already refuses those requested shapes. PrefillReadPolicy now checks the requested range before advertising an expanded cap; the complete catalogue rerun passes. candidate-v1, the failed output and the final source comparison remain preserved. Source changes from the previous build are limited to the coupled policy/default, its generator wiring, comments and diagnostics.

The ordinary CLI completes the 8195-token prompt at 8.1 GB and with fusion disabled at 10 GB. Their actual process peaks and output identities are in functional-summary.json and raw metrics. Full paired-input/output/compute/pool equality is checked even for timing-excluded cells in pair-correctness.json. The complete Mac build/scripted suites and static/planner/installer gates pass. Final brain/projection checks are preserved beside the immutable archive after record registration. This is a local, unreleased source/build change; no commit, push or installation is performed.
