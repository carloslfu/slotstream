---
type: run
id: 01m36f8z9kyt0hew80s1htx2qb
created: 2026-09-23T06:29:30.035210+00:00
updated: 2026-09-23T06:29:30.444515+00:00
summary: 'v0.2.24 versus v0.2.23: 72 captured requests, timing claims withheld'
binary: 'v0.2.23: 5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89; v0.2.24: bbdfcaffa8959ac1ca3e39d1f804cc4491aaa98dd8f649d5f239713a6ba10499'
captured_at: 2026-09-23
command: python3 performance-harness/compare.py; python3 performance-harness/analyze.py; python3 audit_performance.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'v0.2.24 versus v0.2.23: 72 captured requests, timing claims withheld'
tool: Frozen release_speed_bench, compare.py, analyze.py and independent raw-capture audit
---
Three interleaved paired rounds ran after publication and installation: old/new, new/old, old/new. Both versions are actual released executables. The final frozen protocol is `performance-protocol-v3.json`, SHA-256 `3003072ef46ebbc10965d38c6593c7835dba41f54e08174df6c15a8e216b0ca8`. Earlier preparation protocols and methods are retained; all revisions preceded the first timing request. The final audit verifies that the frozen inputs remained unchanged during measurement.

Original bytes are preserved in [capture.tar.gz](../../../artifacts/release-0.2.24-performance-2026-09-23/capture.tar.gz), with a [per-file manifest](../../../artifacts/release-0.2.24-performance-2026-09-23/manifest.json) and [verification receipt](../../../artifacts/release-0.2.24-performance-2026-09-23/receipt.json). Capture SHA-256: `57bd98600da9b69c21ff7e52cec7a5553c0a0624949bb78d74c2a09b4d5ce9e5`. All 411 included files were read back from the archive and checked against their recorded SHA-256. Disposable tensor caches and Python bytecode are excluded with their paths and sizes recorded; request, response, wire, process, memory and method evidence remains.

The M5 Pro Mac17,9 has 48 GiB unified memory and ran macOS 26.6.2. Both versions used a 10 GB target, 32768 context, MTP off, vision off and normal automatic prefill policy. Each of six sessions starts a fresh server and later restarts it for a disk-reuse request. The harness admits only one model process at a time, records readiness/load/paging and uses the same frozen fixtures. OS file-cache residency is uncontrolled; a first-read prompt is not a cold-SSD measurement.

Code and prose fixtures each contain 2048 raw tokens, 2061 after formatting, and use capped 128-token output windows for fresh and repeat requests. Other fixtures cover scalar/nullable truncated tool arguments, a numeric-looking nullable string, deterministic branch seeds, an alpha follow-up and restart replay. Each session also has a one-output-token warmup, which is excluded from performance claims.

All 72 request captures replay correctly, all 12 code/prose comparisons have identical prompt/output token IDs, and all 12 server processes exited zero and were reaped. Seed answers/reasoning/usage match between releases. Within the new release, the branch answer/reasoning and prompt/output counts match after restart; its deeper checkpoint can advance reuse.

This run is marked discarded for aggregate speed claims: 68/72 requests pass the shared-desktop primary environment screen, but only 40/72 also have no observed global swap-in or swap-out activity. No measured family supplies the required three strict eligible pairs. `performance-audit.json` names the four CPU-load exclusions and records the final claim policy. The frozen analyzer mechanically treats warmup as a family and reports three eligible pairs; its single output token is not a valid throughput measurement and that result must not be advertised. No timing exclusion invalidates the independently checked wire/type/cache-count findings.

The derived results and limits are in [[records/measurements/release-0-2-24-performance-2026-09-23]]. This is not an MTP speed study or a full-answer quality comparison.
