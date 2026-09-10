---
type: measurement
id: 01m26m86458wn87fxaj6bp506h
created: 2026-09-10T21:40:45.317682+00:00
updated: 2026-09-10T21:41:15.278010+00:00
summary: Public release preparation, coverage reconciliation and installed-artifact acceptance for v0.2.12
date: 2026-09-10
doc: measurements
level: '3'
machines: '[[records/machines/github-actions-macos-26]], [[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1120'
runs: '[[sources/runs/2026/09/2026-09-10-release-0-2-12-prepublication-corrections]]'
title: v0.2.12 release qualification
status: analysis
---
**Status: preparing the public release; final CI and installed-artifact acceptance remain pending.**

The original unified optimization campaign is complete in its recorded scope.
This release binds that implementation to the intervening public documentation,
configuration and operating-policy changes. The inference algorithms and tuning
constants are unchanged; planner/help presentation and the version are updated.
The public context ceiling is unchanged. Larger context qualification remains a
separate plan, not a claim made by this release.

## Clean-build identity correction

The first CI run compiled successfully but failed to bind its artifact because
SwiftPM replaced `.build/release` with an architecture-specific symlink, losing
the pre-build receipt. The Makefile now asks SwiftPM for its real output path
before and after the build. A compiler-free fixture reproduces the original
failure, verifies a clean build in a path with spaces, proves non-build targets
do not invoke SwiftPM, and still refuses source mutation during the build.
All five identity tests pass. The public archive will include the CI identity
and reconstructible source archive inside its attested payload.

Independent external-consumer and coverage builds now run in separate CI jobs.
Every original CI command is retained. This parallelism uses separate hosted
runners; local model and compiler work remain serial.

## Coverage review

The completed instrumented job at `4927998` passed 44 check groups and 27,342
assertions with no failed or skipped check, then failed the coverage ratchet.
It reported 82 new files with no baseline and ten lower per-file percentages.
This is T0/T1 coverage; it does not instrument the separate native-model suite.

Two floors remain unchanged. The server comparison exposed removed stock-SDK
no-op and image/text conversion checks, which are restored. The context-budget
and governor checks are also restored with explicit refusal/hold/shrink cases.
The prefix-cache comparison lost only an attributed closing brace; added tests
exercise partial image checkpoints, processor identity mismatch, invalid and
overflowing extents, state preservation on rejection, and reset/drop behavior.
Fresh CI must confirm both retained floors.

For the other eight files, exact unchanged-line mapping found no previously
covered line losing its hit. Absolute hit counts stayed equal or increased;
new native-only paths enlarged their denominators. Their T0/T1 baselines are
updated individually from the preserved report, with no automatic global
reset. New-file baselines use measured coverage, including explicit zeroes for
native-only diagnostics. The gate still rejects missing or regressing floors.

| File | Previous hit/found lines | Candidate hit/found lines | Previous floor | Measured floor |
|---|---:|---:|---:|---:|
| `Sources/Slotstream/Engine.swift` | 101/683 | 101/1087 | 14.79% | 9.29% |
| `Sources/Slotstream/Generate.swift` | 81/429 | 114/1305 | 17.25% | 8.74% |
| `Sources/Slotstream/Model.swift` | 23/278 | 34/973 | 8.27% | 3.49% |
| `Sources/Slotstream/NgramStore.swift` | 6/294 | 6/447 | 2.04% | 1.34% |
| `Sources/Slotstream/VisionPrompt.swift` | 33/54 | 33/118 | 58.93% | 27.97% |
| `Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift` | 146/175 | 161/198 | 83.43% | 81.31% |
| `Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift` | 119/136 | 361/422 | 86.73% | 85.55% |
| `Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift` | 511/561 | 612/689 | 90.31% | 88.82% |

No aggregate percentage is presented as coverage of the complete inference
implementation. Final release testing will run the original full model battery
and installed-release checks against the actual public download.

Evidence: [[sources/runs/2026/09/2026-09-10-release-0-2-12-prepublication-corrections]].
Performance remains in [[records/measurements/optimization-final-composition-2026-09-09]]
and practical serving observations in [[records/measurements/user-server-throughput-2026-09-10]].
