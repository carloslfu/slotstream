---
type: measurement
id: 01m1hhwkja1yjs6k8zz73sjtek
created: 2026-09-02T17:15:25.642532+00:00
updated: 2026-09-02T17:15:25.642532+00:00
summary: Verification results (all against the Python reference implementation)
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M3/M4
order: '140'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Verification results (all against the Python reference implementation)
status: measured
---

| Test | Result |
|---|---|
| Chat template (system+user, non-thinking) | **token-for-token identical** to `transformers.apply_chat_template` |
| N-gram row ids (6-token prompt × 16 heads) | **exact match** (splitmix64/prime/XOR/floormod port) |
| N-gram row CPU dequant vs `mx.dequantize` | **exact** to printed precision (gs32 4-bit + bf16 rounding) |
| Layer 0 (GDN + MoE-over-slot-pool + hyper-conn) | **bit-exact** (max abs 0.00000) |
| Layer 1 (adds PLE injection, streamed rows) | **bit-exact** |
| Layer 2 (GDN + MoE) | max abs 9.8e-4, RMS-rel 0.13% |
| Layer 3 (QSA attention) | max abs 1.0e-2, RMS-rel 2.4% |
