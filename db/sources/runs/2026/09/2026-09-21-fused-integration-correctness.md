---
type: run
id: 01m32yc39r4jh9mwebws42zfwz
created: 2026-09-21T21:36:23.352371+00:00
updated: 2026-09-21T21:36:46.509088+00:00
summary: Fused MLX integration numerical, runtime and app qualification
binary: 052ff65fae371e670198e1a1fa818e2c138de376c8b70e99b758892ec7c91b35
captured_at: 2026-09-21
command: final_pipeline.py; verify.sh; app_real_checks.py; reference_checks.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Fused MLX integration numerical, runtime and app qualification
tool: Swift catalogue, real-model acceptance, Python references and native app checks
---
[Raw capture](../../../artifacts/fused-integration-2026-09-21/capture.tar.gz) and [verified member hashes](../../../artifacts/fused-integration-2026-09-21/manifest.json).

Candidate `052ff65fae371e670198e1a1fa818e2c138de376c8b70e99b758892ec7c91b35` uses the exact source archive and pinned Metal library in `candidate/`. The final `verify-upgrade/` run executes extracted, unchanged call sites from the final acceptance script: all seven upgrade gates pass. `catalogue-release/` passes 72 groups and 31,677 assertions. `checkpoint-final/` passes 25 fused-checkpoint assertions, 208 selected-attention component assertions, and 19 assertions for each ordinary and MTP phase transition. Fusion executes 1080 tiles; same-backend warm/cold and disk-reopen logits remain exact.

`verify-final/` retains the earlier complete battery: 26 pass, three fail. The failures are preserved historical cross-backend layer and MTP comparisons, and the old arbitrary-rechunk depth heuristic. Final acceptance retains the old layer tolerance with one-row projections, adds required independent current-backend main-layer and MTP references, and keeps `prefix-exact-check` strict. The historical draft-head comparison still fails and is explicitly reported as a diagnostic. It is not relabeled a passing parity result. `qualification-source-comparison.json` shows that production engine changes after the full battery are a comment in Layers.swift; the other compiled change is the CLI diagnostic contract, re-run on the final binary.

The full battery includes pinned weight hashes, pool-size and resize identity, full governor and adaptive-server drills, sweep identity, live MTP/rollback and row verification, process memory, long-context retrieval, all 15 behavioral cases, all 74 API robustness cases, independent vision reference and all 25 vision-serving cases. Raw failures and intermediate attempts remain in the capture.

`projection-old/` and `projection-new/` compare identical packed 4-bit inputs against an independent float64 dequantization/dot oracle across 63 cases each. All meet the preset numerical bound; newer errors are smaller in 45 cases. This does not establish a full-model quality improvement. The final independent Python model reference is in `verify-upgrade-data/current-layers/` and `current-mtp/`: layer relative errors remain within the unchanged bound and the four draft-head outputs match exactly. Python and toolchain versions are captured. The first unbounded reference-loader attempt hit its memory guard and is preserved; the final storage-only adapter loads requested n-gram rows and peaks below its ceiling.

The complete scripted Mac suite and bundle build pass. All three `app-real-*` checks pass for disk-cache save/unload/reload and privacy exclusions, real thinking/Answer now transitions, and displayed metric equality. The app runner uses the same production engine semantics as the final CLI; its exact executable, Metal and source identities are preserved. Owner-directed response-details close disables the closing animation to avoid an independently reproduced UI timeout; the test was not weakened.
