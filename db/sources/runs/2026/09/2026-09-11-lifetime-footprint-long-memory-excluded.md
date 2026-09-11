---
type: run
id: 01m281pv6eb18qd4vtjnfv4qc6
created: 2026-09-11T10:55:11.566600+00:00
updated: 2026-09-11T10:56:12.425163+00:00
summary: Repeated long-prompt memory intervals excluded by swap-ins
binary: 'Local unpublished builds: 35b82a9d6b2a6eae7fb0b0cdb844d1f64e02fb4a90ef41cc5fbc2a9afcaf4324 and final 5e302b1863e527e2708be14b058fe9ac23fdeee9b16ca81a2255a670912a7526'
captured_at: 2026-09-11
command: python3 .build/memory-reporting-audit-20260911/resource_retries.py; python3 .build/memory-reporting-audit-20260911/resource_final.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Repeated long-prompt memory intervals excluded by swap-ins
tool: slotstream run; memory_gate.py
---
Raw files are preserved byte-for-byte in the [source archive](../../../artifacts/lifetime-footprint-2026-09-11/raw-checks-and-source.tar.gz). Its [manifest](../../../artifacts/lifetime-footprint-2026-09-11/manifest.json) verifies every member and the reconstructed archive. The source archives independently reconstruct all 150 compiled-identity inputs for each candidate. resource-retries/long.json and resource-final/long.json both contain successful 7972-token recall with the answer SEVENTEEN, native lifetime peaks below the 10 GB target, four global swap-ins and zero new swap-outs. Both are excluded from zero-swap qualification. The resource scripts and exact argument arrays are preserved. Do not weaken the memory gate or attribute global paging to a process based on these counters. The final context case in the same driver passed independently with zero swap.
