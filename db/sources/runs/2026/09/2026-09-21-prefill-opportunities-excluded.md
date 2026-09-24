---
type: run
id: 01m33766dr7xw0zf6q2sq3qctc
created: 2026-09-22T00:10:27.128501+00:00
updated: 2026-09-22T00:11:22.298697+00:00
summary: 'Remaining prefill opportunities: excluded and preparatory runs'
binary: e82dcb1901af794469e918e278f86744ffd628f73ec3a837e99db9d0ed7adb65
captured_at: 2026-09-21
command: run_screens.py; run_v2.py; run_confirmatory.py; run_final_checks.py; run_verified_checks.py; run_post_checks.py; sparse_probe.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Remaining prefill opportunities: excluded and preparatory runs'
tool: Frozen Swift model checks and paired benchmark; captured-tensor MLX probe
---
[Raw capture](../../../artifacts/prefill-opportunities-2026-09-21/capture.tar.gz) and [member hashes and omitted-payload manifest](../../../artifacts/prefill-opportunities-2026-09-21/manifest.json).

Every primary cell and exclusion is retained. Main round1 baseline has paging and ends thermally fair; round2 baseline has the same exclusions, and round2 larger has paging. Extension round1 combined and round2 larger/combined have paging. No excluded cell is relabeled eligible because the swap-in count is small. Global paging is not a functional failure.

confirmatory-extension-preparation-only was stopped during initial cooldown, before any model launch, to correct continuation of AB/BA ordering. Its explicit aborted record and logs are preserved; it is not a measurement round. Early screens have their own thermal/paging observations and supply no qualified speed percentage. The initial sparse component capture lacked a thermal receipt; sparse-probe16-settled is the subsequent nominal/no-paging confirmation, preserved separately.
