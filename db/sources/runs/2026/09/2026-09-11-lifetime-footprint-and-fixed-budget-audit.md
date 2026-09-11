---
type: run
id: 01m281pv549bnc92jfq91sjhmr
created: 2026-09-11T10:55:11.524637+00:00
updated: 2026-09-11T10:56:11.114407+00:00
summary: Native lifetime footprint correction and fixed-budget audit
binary: 'Local unpublished builds: 35b82a9d6b2a6eae7fb0b0cdb844d1f64e02fb4a90ef41cc5fbc2a9afcaf4324 and final 5e302b1863e527e2708be14b058fe9ac23fdeee9b16ca81a2255a670912a7526'
captured_at: 2026-09-11
command: python3 Tools/process_memory_gate.py; SLOTSTREAM_TEST_BINARY=.build/memory-reporting-audit-20260911/candidate-final/slotstream bash Tools/static_gates.sh
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Native lifetime footprint correction and fixed-budget audit
tool: native process-memory gates; static gates; slotstream checks
---
Raw files are preserved byte-for-byte in the [source archive](../../../artifacts/lifetime-footprint-2026-09-11/raw-checks-and-source.tar.gz). Its [manifest](../../../artifacts/lifetime-footprint-2026-09-11/manifest.json) verifies every member and the reconstructed archive. The source archives independently reconstruct all 150 compiled-identity inputs for each candidate. The authoritative negative control is native-baseline-result.json, with the exact baseline counter and probe preserved in native-baseline/. Seven failures are expected against the old counter. native-confirmation.json passes the corrected production counter. static-final.log is the completed final static suite, including the 304-case simulated override matrix. catalogue.log, governor-check.log and the valid functional portions of verify.log retain the broader checks. mtp-retry-1.log qualifies the full image/MTP interval with zero swap. resource-retries/short.json and both isolated context runs qualify their memory intervals. The final build differs from the broad model-test candidate only in the context-check display label; see final-source-comparison.json. No full 25-gate pass is claimed. See the linked excluded runs for all resource limitations.
