---
type: run
id: 01m27vx4gkry57zdz5dw7zhz6f
created: 2026-09-11T09:13:46.259416+00:00
updated: 2026-09-11T09:13:46.651611+00:00
summary: 'Two-draft full MTP check: swap-limited retry attempt'
binary: unpublished local build; SHA256 e32e9cd33b569984bc5c15f21b79ae2cb601f99392ffb6ea6e5aedf12f460be7
captured_at: 2026-09-11
command: .build/draft-default-two-20260911/build/candidate/slotstream mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Two-draft full MTP check: swap-limited retry attempt'
tool: slotstream mtp-check
---
This full MTP diagnostic attempt is discarded for qualification. The native memory guard stopped it after observing global swap activity. Raw command/readiness observations and stdout/stderr remain byte-for-byte in `mtp-check-retry/` inside the [original archive](../../../artifacts/draft-depth-two-default-2026-09-11/raw-checks-and-source.tar.gz). No default override was present. MTP and vision were explicitly on at a 12 GB target, with the real preflight and native guards unchanged. This is an incomplete resource-sensitive gate, not a passed full MTP qualification or a throughput result. The child exited and cleanup was verified in the [audit](../../../artifacts/draft-depth-two-default-2026-09-11/implementation-audit.json).

A bounded readiness wait obtained stable swap counters and nominal thermals before launch; the native guard still observed swap activity during the diagnostic.
