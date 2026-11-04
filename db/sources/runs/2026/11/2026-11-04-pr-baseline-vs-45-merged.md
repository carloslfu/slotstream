---
type: run
id: 01m6m16jxggvf6y8cmb5djy24m
created: 2026-11-04T19:39:59.280235+00:00
updated: 2026-11-04T19:40:18.705609+00:00
summary: Frozen original-versus-45-PR release-build benchmark
binary: Frozen baseline c0c55d86866d77ae7fc2bf7b57b1c0faf7f9df25 and main d566a418bf41d5d41c92c218220f917c1a7fb575 release builds; hashes in body and archive
captured_at: 2026-11-04
command: /Users/carlos/Projects/slotstream/.venv/bin/python Tools/prefill_bench.py --arm baseline=/tmp/slotstream-pr-followup-20261104/baseline-build/slotstream --arm merged=/tmp/slotstream-pr-followup-20261104/merged-build/slotstream --rounds 3 --prompts short,prose --chunks 256 --memory-gb 8.1 --max-tokens 32 --mtp off --sample-footprint --timeout 300 --out /tmp/slotstream-pr-followup-20261104/baseline-vs-merged
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Original baseline versus 45 reviewed PRs
tool: Tools/prefill_bench.py
---
[2026-11-04-pr-baseline-vs-45-merged.tar.xz](2026-11-04-pr-baseline-vs-45-merged.tar.xz) preserves 59 exact raw files, including the frozen harness manifest, fixtures, all twelve process results and sampled memory metrics, paired summaries, and both build identities. SHA-256 `be1ca63e511843b6b6ab160527225acbc74cb3ed28cb9ef3e948f76b073bec05`. Binary, metallib, model weights and duplicate source archives are excluded; build identities preserve their hashes.

The original baseline is commit `c0c55d86866d77ae7fc2bf7b57b1c0faf7f9df25`. The comparison is the first 45 reviewed PRs, remote main `d566a418bf41d5d41c92c218220f917c1a7fb575`, tree `702becbf8e6930e014a98c2141b1b3b2b3926d36`. Both are independent release builds with the same pinned metallib. The comparison binary is SHA-256 `6327e60419c3dcf8fceb7aaa0f5c314bbd67908398d7c4fcc9b7569e4ce7d79a`; the baseline is `ea94b6867021362759c96f49d03c5f50ab183044a4315b2a6cebe8db549c5ffe`.

Three interleaved paired rounds per short/prose fixture use a fresh process, 8.1 GB target, 256-token passes, 32 generated tokens, seed 7, greedy sampling, MTP off and sampled process footprint. Filesystem cache is uncontrolled, with no purge. Every cell is eligible and every paired output-ID list is equal. No overlapping model or build process was used.

This is a bounded regression comparison on one 48 GB M5 Pro Mac. It does not qualify every client, prompt length, target Mac or power condition, and is not evidence for a new default optimization.
