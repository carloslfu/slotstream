---
type: run
id: 01m285af9fmhzm6ze1qne3bjkh
created: 2026-09-11T11:58:20.463963+00:00
updated: 2026-09-11T11:58:21.116981+00:00
summary: 'v0.2.15 prepublication: CI passed, original resource exclusions and reruns'
binary: 31eefbbb4791beddb0f8674ab1c1875c2eb1c4a034f5cdd0fa1abcba31e373cf
captured_at: 2026-09-11
command: Tools/verify.sh on exact CI candidate; original elastic-drill --slots 1000 --max-memory-gb 13; original mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]], [[records/machines/github-actions-macos-26]]'
title: 'v0.2.15 prepublication: CI passed, original resource exclusions and reruns'
tool: Original Slotstream release acceptance
---
Exact CI candidate for prospective v0.2.15, source commit `ee4d1af5b3d63c2b5670c814b40b25432415eb46`, binary SHA-256 `31eefbbb4791beddb0f8674ab1c1875c2eb1c4a034f5cdd0fa1abcba31e373cf`. Complete main CI 34592671081 succeeded and its downloaded archive/source were verified. No tag or release was created and the installed executable remains v0.2.14.

The complete unchanged original model battery finished 23 passed and two failed. Governor and MTP/vision were rejected by the strict system-swap guard. A targeted governor retry also failed on four swap-ins; the next passed full shrink/cooldown/regrowth with identical token IDs, complete observations and zero swap. The combined MTP/vision rerun passed its functional checks but recorded 12 global swap-ins; the second stopped early after four. All resource exclusions remain failed. This mixed collection is marked discarded for resource/performance use; specific passing functional gates can be reused only by their exact candidate and driver identities.

[The original archive](../../../artifacts/release-v0-2-15-prepublication-2026-09-11/raw-checks-and-source.tar.gz) preserves 95 closed files, including source reconstruction, CI receipts, original battery, all targeted attempts, readiness and stopped-process/locked-Mac status. [The manifest](../../../artifacts/release-v0-2-15-prepublication-2026-09-11/manifest.json) contains a round-trip-verified SHA-256 for each member and archive SHA-256 `95862558070373f0ed3d6a4d054b05b8e393f580d2db5afb7226201758ded1cb`. Publication, installed-check and completion-registration scripts are prospective and unexecuted. Their assertions and future text are not results. Unrelated private process inventory and compiled binaries are excluded; binary/source identities and checksums are included.

The earlier preversion long-prompt retry passed after an initial eight-swap-in exclusion. The exact CI binary independently passed that original long-prompt memory/recall gate, so this release does not rely on transferring the preversion result.
