---
type: decision
id: 01m1vqcy9ga25npqyys93p1hh3
created: 2026-09-06T16:04:08.112198+00:00
updated: 2026-09-06T22:06:37.845291+00:00
summary: Use the unchanged compressed Hugging Face package by default, preserving exact original bytes while removing metered R2 model hosting.
decided_on: 2026-09-06
evidence: '[[records/measurements/hugging-face-lossless-download-2026-09-06]]'
reversible_if: Public delivery or integrity no longer meets the qualified contract; any paid hosting replacement requires a new explicit cost decision.
title: Publish lossless Slotpack on Hugging Face and retire R2 model hosting
status: standing
---
Use the separate public Hugging Face Slotpack repository at an exact commit as the default compressed source. Preserve the original model files, pinned hashes, representation and decoder. Keep the raw mirror separate and compatible.

Carlos chose this hosting change to avoid publisher storage/read charges when downloads grow. Free public hosting is best-effort, not an unlimited guarantee. Do not enable paid upgrades, a metered Worker proxy, R2 fallback or hidden telemetry as an automatic response to provider limits.

Honor server throttle windows with cancellable waits. Qualify complete anonymous reconstruction before release, preserve earlier URLs through free static redirects, and retire the redundant R2 copy after fresh Mac and earlier-client acceptance. Complete Linux public qualification, resumed native Mac installation from an initially empty destination, old-client compatibility and main CI have passed. Release installation acceptance and verified R2 retirement are tracked in the linked measurement.

This reverses only the hosting part of [[records/decisions/lossless-cdn-download-default]]. Its lossless representation and original-file integrity decisions remain in force.
