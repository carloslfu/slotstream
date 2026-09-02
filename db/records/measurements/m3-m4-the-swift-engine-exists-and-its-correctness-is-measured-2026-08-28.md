---
type: measurement
id: 01m1hhwkh6ka2sr0v6vnestwsm
created: 2026-09-02T17:15:25.606600+00:00
updated: 2026-09-02T17:15:25.606600+00:00
summary: M3/M4 — The Swift engine exists and its correctness is measured (2026-08-28)
date: 2026-08-28
doc: measurements
level: '2'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M3/M4
order: '130'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: M3/M4 — The Swift engine exists and its correctness is measured (2026-08-28)
status: measured
---

The full engine was built (`Sources/`): qwen4_exp in Swift over mlx-swift —
GDN (vendored `gatedDeltaUpdate`), QSA + indexer, MoE over the SlotPool
(`gatherQuantizedMM`), hyper-connections, PLE/n-gram with CPU hashing + row
dequant, tokenizer + Jinja chat template (swift-transformers), sampler,
prefill/decode loop, Ollama-compatible server, CLI.
