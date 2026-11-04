---
type: run
id: 01m6m5eq50nqjrfphfbh0h5tdd
created: 2026-11-04T20:54:20.064758+00:00
updated: 2026-11-04T20:54:20.675358+00:00
summary: 'Discarded PR comparison prose timing pair: global paging'
binary: dfc058b53b9e4a02fe492ec38f5c2edd30d8d4b5aad1d48d402cebdea07e1ff9
captured_at: 2026-11-04
command: Original complete comparison command and exit in check-status.json; discarded pair is round 3, prose, 256-token pass, baseline then final, 8.1 GB, MTP off
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Discarded PR comparison prose timing pair: global paging'
tool: Tools/prefill_bench.py
---
The original final comparison's third prose pair is discarded for timing. The final arm recorded eight global swap-in pages and no additional swap-out pages. Both children completed successfully and paired output IDs agree, but the frozen harness correctly excludes that timing. The captured process also passes its explicit memory gate; global counters are not attributed to this process.

Exact raw files are retained in [2026-11-04-pr-integrated-qualification.tar.xz](2026-11-04-pr-integrated-qualification.tar.xz), SHA-256 `2665e324c3c53c77e370b10be298260c4c0ca63546f091c8b26d4eca3bfe1cb8`, under `baseline-vs-final/3-prose-256-baseline/` and `baseline-vs-final/3-prose-256-final/`. The recorded command and failing benchmark exit are in `check-status.json`. The unchanged-settings replacement is frozen in `final-benchmark-replacement-plan.json`, and all original and replacement pairs are accounted for in `final-benchmark-analysis.json`. See [[records/measurements/pr-hardening-integrated-qualification]].
