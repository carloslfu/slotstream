---
type: native-spec
meta-type: operational
id: 01m2gb639kg290sh168ce1fd53
created: 2026-09-14T16:14:44.019337+00:00
updated: 2026-09-24T06:11:54.776044+00:00
summary: Mac native implementation baseline and dependency qualification
---
# Mac implementation baseline

Recorded September 14, 2026: Apple Silicon development host, macOS 26.6.2 build 25G83, Swift 6.3.3 (swiftlang-6.3.3.1.3), Command Line Tools selected. Full Xcode is not installed. The standalone package retains macOS 14 as its API deployment floor. The development app bundle requires macOS 26 because it carries the matching macOS 26 Metal resource. This prevents an unqualified older system from attempting that bundle. Only the recorded development host is tested; broader installed coverage requires its own Metal/dependency qualification.

The current root Swift package, products, model geometry and MLX dependencies are preserved. Mac sources live under apps/macos; the public engine sources remain in place. SevraRuntime is owned by this Mac implementation and consumed by its app and internal CLI. No web-based native UI replacement is allowed.

Tools/build_sevra_mac.sh produces a development-only app bundle with the pinned dbmd executable and the existing matching Metal library. Ad-hoc signing is not Developer ID trust, notarization, a supported updater, or a public alpha. The local build captures exact source/dependency/helper/resource hashes before and after compilation, refuses changing inputs, bundles dbmd, Metal and licensed fonts, and verifies its ad-hoc signature. A SwiftPM build and plist validation do not establish that the Xcode app target, a clean standard-user install, notarization or updating work. Since September 21, CI builds the Xcode app target in Release and verifies its bundle and ad hoc signature; that establishes the target builds, not that the built app runs. See [[records/design/sevra-spec/implementation-status]].

Initial real functional runs use an explicit 10 GB engine target and existing verified read-only model files. This is a bounded test policy, not the maintained product recommendation. Preserve the engine's one-model process lock. Check reclaimable memory before model launches; do not run model loads in parallel. The qualified development implementation enables a disposable per-Home disk prefix cache for ordinary non-thinking conversations. Incognito and conversations with thinking receipts keep inference state off disk; Home/privacy transitions clear held memory before encoding. Backups exclude the cache. See [[records/measurements/prompt-speed-qualification-2026-09-21]].

The shipping profile, signed dependencies, full acquisition qualification, broad lifecycle/hardware qualification and same-hardware model-value comparison remain required. The adaptive memory implementation below adds scoped development behavior and separate checks. A successful response alone cannot mark these gates passed.

[[records/design/sevra-spec/overview]]

## Adaptive memory and model readiness
The native app defaults to automatic memory planning and starts the engine’s
elastic governor. Custom limits are auto plans constrained by a RAM-share
bound, not the CLI’s pinned explicit allocation. CLI semantics stay unchanged.
The current text profile keeps MTP/vision off. Its planning window was 8,192
tokens until September 17 and is now 32,768, the engine's smallest automatic
window; see Context and job budgets in
[[records/design/sevra-spec/runtime-contract]]. No model swap, context
reduction or provider fallback occurs under pressure.

The supported custom range rounds the engine’s minimum up to half a decimal
GB and caps the current product profile at the lower of its measured 33 GB
operating ceiling, the Metal working set less 2 GB, and physical memory less
the engine’s headroom reserve. The range is hardware-dependent, not changed
by transient availability. Unknown availability and plans whose complete
expected peak or target exceed reclaimable memory less the existing headroom
reserve are refused. The CLI’s legacy advisory floor cannot force a load.
These inherit engine feasibility and measured-policy contracts; they are not
new hardware-performance claims. Broader custom ranges require qualification.

Idle release is a conservative development operating policy: at least 600
seconds normally or 300 in Low Power Mode/serious thermal conditions, extended
to four times the longest observed model/context preparation duration, capped at
1,800 seconds. Its purpose is to amortize expensive reloads while returning
memory; these timings are not a measured optimum. Keep-ready overrides idle
release, but not pressure, sleep or explicit release. Since September 24,
Incognito cleanup after each private reply drops that conversation's prompt
state and the allocator's reusable buffers but keeps the weights loaded;
nothing from it was written to disk.
Revise these delays using paired cold/warm everyday-work measurements.

The runtime applies the latest pending settings only between complete jobs;
new messages queue through resource handoff. Unload drains governor work before
releasing the engine and allocator caches. A dedicated inference executor and
independent metadata locks keep UI polling away from the generation lock.
Physical footprint is sampled once for CPU/GPU memory; the current planned
allocation is labeled as an estimate. Preferences survive relaunch separately
from Home data. Releasing RAM never deletes persistent chats or personal memory.
Sleep interrupts accepted queued work and cancels active work before release;
wake never automatically replays it. Context overflow refuses with preserved
messages instead of silently trimming history.

The policy sweep, deferred-change/handoff and sleep fixtures live in
`apps/macos/Checks/PerformanceChecks.swift`. Its explicit real-model mode
uses bounded custom budgets and does not induce OS pressure. Full pressure,
sleep/wake and thermal qualification across supported Macs remains open.
