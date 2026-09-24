---
type: decision
id: 01m32yc3ctk56yh7xkxye6sdpw
created: 2026-09-21T21:36:23.450735+00:00
updated: 2026-09-22T02:44:34.375336+00:00
summary: Adopt qualified upstream fused prefill on the measured M5 Pro profile
decided_on: 2026-09-21
evidence: '[[records/measurements/fused-prefill-integration-2026-09-21]]'
reversible_if: A reproducible numerical, cache, application, memory or paired-performance regression on the qualified profile; wider activation requires its own hardware and OS evidence.
title: Adopt qualified upstream fused prefill on the measured M5 Pro profile
status: standing
---
Follow-up: fused-workspace accounting and larger expert reads now form the guarded automatic policy in [[records/decisions/automatic-prefill-read-policy]]. The kernel qualification and measured gain below remain unchanged; larger compute passes and sparse alternatives remain unadopted.

Adopt the pinned MLX 0.32.2 integration and guarded upstream D256 fused prefill on the measured machine/OS profile, based on [[records/measurements/fused-prefill-integration-2026-09-21]]. Preserve ordinary backend dispatch elsewhere and expose `SLOTSTREAM_OPT_FUSED_PREFILL=0` to restore the normal heuristic. Short verify/decode, dtype and hardware guards remain.

This carries [[records/decisions/kernel-upgrade-fidelity-and-cache-equivalence]] into production code: qualify a kernel upgrade through independent numerical and application evidence while keeping exact same-backend cache equivalence. Historical cross-backend failures remain evidence. Cache identities include the backend, GPU, OS and MLX overrides; old checkpoints must miss rather than inherit different arithmetic.

CLI, app, external package and installer inputs advance together. Older published releases continue selecting their own compatible shader family. Do not claim physical qualification of other Macs or older macOS versions from wheel downloads or pure platform tests. The conservative memory planner is unchanged; fused-workspace pricing, larger passes and sparse tile skipping remain separately gated future work. The integration is local and unreleased.
