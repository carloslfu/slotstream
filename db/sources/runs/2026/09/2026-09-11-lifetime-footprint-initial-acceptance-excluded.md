---
type: run
id: 01m281pv5v487mhpdrthrdv3e8
created: 2026-09-11T10:55:11.547370+00:00
updated: 2026-09-11T10:56:11.556140+00:00
summary: Initial memory-reporting acceptance with swap exclusions
binary: 'Local unpublished builds: 35b82a9d6b2a6eae7fb0b0cdb844d1f64e02fb4a90ef41cc5fbc2a9afcaf4324 and final 5e302b1863e527e2708be14b058fe9ac23fdeee9b16ca81a2255a670912a7526'
captured_at: 2026-09-11
command: SLOTSTREAM_TEST_BINARY=.build/memory-reporting-audit-20260911/candidate/slotstream SLOTSTREAM_VERIFY_OUT=.build/memory-reporting-audit-20260911/verification bash Tools/verify.sh
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Initial memory-reporting acceptance with swap exclusions
tool: Tools/verify.sh
---
Raw files are preserved byte-for-byte in the [source archive](../../../artifacts/lifetime-footprint-2026-09-11/raw-checks-and-source.tar.gz). Its [manifest](../../../artifacts/lifetime-footprint-2026-09-11/manifest.json) verifies every member and the reconstructed archive. The source archives independently reconstruct all 150 compiled-identity inputs for each candidate. verify.log records 20 passed and five failed gates. The MTP, short memory, long memory and two context checks encountered global swap-ins despite remaining under their memory targets; no new swap-outs were observed in those intervals. Preserve this run as excluded from full resource qualification. Its valid functional outputs are retained, not converted into a blanket acceptance pass. verification/ contains the original captured observations and vision vectors. Later isolated MTP, short and context reruns passed without swap.
