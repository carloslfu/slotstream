---
type: run
id: 01m32mwcd5mwxj781y6nfkcmsn
created: 2026-09-21T18:50:31.205602+00:00
updated: 2026-09-21T18:50:31.837612+00:00
summary: 'Fused attention loaded-engine pairs: two clean preliminary comparisons'
binary: Isolated MLX 0.32.2 slotstream; see identity.json in the archive
captured_at: 2026-09-21
command: run.py fused-review-performance
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Fused attention loaded-engine pairs: two clean preliminary comparisons'
tool: Isolated Swift loaded-engine diagnostic
---
[Raw paired performance experiment](../../../artifacts/fused-review-2026-09-21/performance.tar.gz), with [verified member hashes](../../../artifacts/fused-review-2026-09-21/performance-manifest.json). It uses the same frozen binary and source identity as [[sources/runs/2026/09/2026-09-21-fused-review-correctness]].

The predeclared diagnostic loads one floor-sized engine, disables prefix reuse, reads the same 8195-token inventory fixture in both arms, uses 256-token compute passes, 4096-token expert-read scopes and a 1024-token workspace tile, and requests one output token. Both arms run MLX 0.32.2; the only selected attention difference is the explicit fused flag. One warmup per arm precedes five pairs, alternating their order. A pair is timing-eligible only if neither arm observes global swap-ins or swap-outs. Global paging does not fail functional completion or process-memory checks.

All 21 workload-completion and physical-memory assertions pass. Rounds 1 and 2 are clean. Their unfused/fused prefill times are 40.860658833/38.723229541 seconds and 41.259546375/39.303033125 seconds. The median paired throughput ratio is 1.052488905, equivalent to 4.987122% less prefill time. With only two eligible pairs this is preliminary evidence, not a release-qualified speed guarantee. Rounds 0, 3 and 4 are excluded from timing estimates. Do not count the warmups, choose the fastest arm, or promote the excluded pairs.

Both arms process the whole prompt; the raw continuation reaches EOS at the one-token generation boundary. These are prefill timings, not a quality comparison or a meaningful answer-generation benchmark. Measured physical peaks stay below 7.281 GB, within the 10 GB test ceiling. Lifetime peaks and arm order do not support a claim that whole-process memory decreased. Fused routing reads roughly 0.4% fewer expert bytes on this fixture, so the result measures the integrated candidate behavior, not an isolated kernel time.

The small full-prompt effect is compatible with larger component gains: expert SSD reads and the rest of the model still dominate this configuration. It is not a measurement of longer contexts, larger compute passes, other Mac generations, or the entire dependency upgrade relative to shipping MLX 0.31.1. Original component results remain separately scoped to attention kernels.
