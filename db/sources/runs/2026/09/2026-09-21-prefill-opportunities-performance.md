---
type: run
id: 01m33765y00xaycfzfy3gj0w5b
created: 2026-09-22T00:10:26.624709+00:00
updated: 2026-09-22T00:11:22.278622+00:00
summary: 'Remaining prefill opportunities: paired timing and ablation'
binary: e82dcb1901af794469e918e278f86744ffd628f73ec3a837e99db9d0ed7adb65
captured_at: 2026-09-21
command: run_screens.py; run_v2.py; run_confirmatory.py; run_final_checks.py; run_verified_checks.py; run_post_checks.py; sparse_probe.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Remaining prefill opportunities: paired timing and ablation'
tool: Frozen Swift model checks and paired benchmark; captured-tensor MLX probe
---
[Raw capture](../../../artifacts/prefill-opportunities-2026-09-21/capture.tar.gz) and [member hashes and omitted-payload manifest](../../../artifacts/prefill-opportunities-2026-09-21/manifest.json).

The frozen baseline is the previously integrated MLX 0.32.2 fused executable, not the old MLX 0.31 release. The primary study uses inventory16387, a 10 GB target, 256-token compute, MTP off, greedy one-token output and fresh processes. Three arms isolate the larger read-group maximum from its combination with fused workspace accounting. Effective pool size is 961 in every primary arm. Filesystem cache is uncontrolled; expert-read counters are application bytes, not physical SSD traffic.

The protocol freezes three alternating rounds plus at most two extensions if fewer than three pairs qualify. The extension continues the reversed/forward ordering and strengthens cooldown to 120 consecutive nominal seconds before each process. Eligibility remains unchanged: identical input/output IDs, pool and compute passes, successful execution, physical peak within 10 GB, no global swapins/outs, nominal thermal at generator entry and exit, and low-power mode off. No best-of selection, cross-round pairing or further extension is allowed.

All fifteen model processes complete. Only one baseline/combined pair qualifies: 137.62609625 to 80.271301625 seconds, 41.674359869% less prefill, 57.354794625 seconds saved. It is preliminary, below the required three clean pairs. Larger-only has two eligible pairs with opposing results, including the slow 174.565900667-second cell; that outlier remains included. Its median paired reduction is -2.461196097%, not a qualified regression estimate. Larger-to-combined has two eligible pairs and a preliminary median reduction of 44.258067035%. Full pair membership and all exclusions are in confirmatory-analysis.json. The slow larger-only cell selects 11264 tokens first instead of 11008 and reads fewer bytes, yet its measured GPU wait rises from roughly 10.6 to 26.2 seconds and non-I/O time rises too. Its cause remains unresolved; neither background load nor compilation is asserted without a trace.

The combined prototype reduces primary application expert reads from about 1239 GB to 356 GB, retaining the same 256-token chronological computation and first output. Its first read group reaches 14336 tokens versus 8192 for the baseline; its physical peak is below 8.54 GB. The five combined prefill observations span about 72 to 95 seconds versus about 137 to 138 seconds for baseline, but excluded observations do not qualify the speed estimate. These are not complete-answer latency or model-quality measurements.

The final retained implementation is narrower than the timed V2 prototype: only 256-query BF16 text through 16384 keys gets reduced workspace accounting, with MTP off; CPU, images and other fallbacks retain original accounting. The rejected cache-clear control is removed. Timings remain attributed to V2, while final correctness has its own executable and source identity. qualification-source-diff.patch and the verified-source comparison preserve the differences. No automatic default is changed.
