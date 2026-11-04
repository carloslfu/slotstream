---
type: measurement
id: 01m6m17tp81ycmkedm4pk9xpba
created: 2026-11-04T19:40:40.008318+00:00
updated: 2026-11-04T19:40:40.008318+00:00
summary: Original-versus-45-PR exact-output and bounded latency comparison
date: 2026-11-04
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1940'
runs: '[[sources/runs/2026/11/2026-11-04-pr-baseline-vs-45-merged]]'
title: 'PR hardening: first integrated baseline comparison'
status: measured
---
The first 45 reviewed PRs were built together and compared with the original pre-review baseline on the same 48 GB M5 Pro. [[sources/runs/2026/11/2026-11-04-pr-baseline-vs-45-merged]] preserves the raw twelve-process experiment and binary identities.

The original commit is `c0c55d86866d77ae7fc2bf7b57b1c0faf7f9df25`. The comparison is main `d566a418bf41d5d41c92c218220f917c1a7fb575`, tree `702becbf8e6930e014a98c2141b1b3b2b3926d36`. Each arm has its own release executable and the same pinned metallib. Fresh processes start with empty expert and prefix caches; filesystem caching is uncontrolled and not purged.

Three interleaved paired rounds for each short/prose fixture use an 8.1 GB target, 256-token passes, greedy output, seed 7, MTP off and 32 generated tokens. Every paired output-ID list is identical. All twelve cells are eligible, with no excluded or swapping round. Median paired complete-request reductions are 1.47% for short and 1.41% for prose. These small differences do not establish a general speed improvement; they show no meaningful slowdown in these bounded cases.

This comparison does not qualify all prompts, longer contexts, MTP, clients, power conditions or the full 16–64 GB target range. It does not adopt a new default optimization. The remaining engine PRs and validation corrections are qualified separately before integration.
