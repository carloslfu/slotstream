---
type: run
id: 01m32yc3ak1yd9x5xtn7wg1wv5
created: 2026-09-21T21:36:23.379159+00:00
updated: 2026-09-21T21:36:46.971247+00:00
summary: Fused MLX integration build, installer and SDK compatibility
binary: 052ff65fae371e670198e1a1fa818e2c138de376c8b70e99b758892ec7c91b35
captured_at: 2026-09-21
command: make build SLOTSTREAM_BUILD_JOBS=4; Tools/consumer_smoke.sh; Tools/static_gates.sh
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Fused MLX integration build, installer and SDK compatibility
tool: Optimized build, external consumer, static and installer checks
---
[Raw capture](../../../artifacts/fused-integration-2026-09-21/capture.tar.gz) and [verified member hashes](../../../artifacts/fused-integration-2026-09-21/manifest.json).

`build7/` succeeds and freezes `052ff65fae371e670198e1a1fa818e2c138de376c8b70e99b758892ec7c91b35`. `consumer-final/` builds and runs a fresh external Swift package against both public library products. `static-final2.log` ends in STATIC GATES PASS, including installer activation, checked-in golden digests, transport, planner, memory-option and harness checks. The initial static run failed because its isolated fixture omitted the newly added installer test; the fixture and its failure-propagation coverage were corrected. Both logs and source states are preserved.

Both package lockfiles pin mlx-swift ab924c82ead3b970caaa1c0ac11171de23f0305a, which vendors MLX 0.32.2. CLI, app, Xcode build inputs, coverage and SDK docs use the matching Metal family. The installer chooses older-macOS wheels from the downloaded release's bundled shader digest, preserving installation of the existing 0.31.1 release while main advances. New macOS 14/15/26 wheels were downloaded and hash-verified; only this M5 Pro/macOS profile was physically executed. The dedicated selection test covers both old and new families, unknown-family refusal and keeping the bundled current-OS shader.

No release, commit, push or installation over the user's active app was performed. Changes predating this work remain in the working tree. All benchmark builds have reconstructible source archives; large executable and shader payloads are retained locally and identified by digest.
