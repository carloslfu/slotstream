---
type: run
id: 01m281pv6zgdx8q0ycnew34201
created: 2026-09-11T10:55:11.583808+00:00
updated: 2026-09-11T10:56:11.990169+00:00
summary: Live fixed-budget integration with one excluded resource interval
binary: 'Local unpublished builds: 35b82a9d6b2a6eae7fb0b0cdb844d1f64e02fb4a90ef41cc5fbc2a9afcaf4324 and final 5e302b1863e527e2708be14b058fe9ac23fdeee9b16ca81a2255a670912a7526'
captured_at: 2026-09-11
command: python3 .build/memory-reporting-audit-20260911/integration.py; python3 .build/memory-reporting-audit-20260911/integration.py --cli-only
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Live fixed-budget integration with one excluded resource interval
tool: slotstream serve and run; local HTTP integration
---
Raw files are preserved byte-for-byte in the [source archive](../../../artifacts/lifetime-footprint-2026-09-11/raw-checks-and-source.tar.gz). Its [manifest](../../../artifacts/lifetime-footprint-2026-09-11/manifest.json) verifies every member and the reconstructed archive. The source archives independently reconstruct all 150 compiled-identity inputs for each candidate. integration/ preserves two sequential 8.1 and 10 GB servers, startup plans and current physical memory, three requests per server, and four CLI edge cases. Functional plan equality, allocation growth, lifetime accounting and CLI assertions pass. The middle request at 10 GB recorded global swap-ins, so this combined run is excluded from resource/performance qualification. Startup allocation observations remain functional evidence; they are not a throughput or clean whole-process memory certificate. Earlier integration fixture mistakes and the aborted zero-token fixture are retained separately in the archive; they were not engine regressions. No customer data is included.
