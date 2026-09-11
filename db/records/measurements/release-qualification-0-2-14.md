---
type: measurement
id: 01m26rab8sbwpy9sxpr9ex8fsn
created: 2026-09-10T22:51:50.425333+00:00
updated: 2026-09-11T09:31:18.677329+00:00
summary: 'Published v0.2.14: CI, all 25 original model gates and all 31 installed-release checks passed'
date: 2026-09-11
doc: measurements
level: '3'
machines: '[[records/machines/github-actions-macos-26]], [[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1140'
runs: '[[sources/runs/2026/09/2026-09-10-release-0-2-14-candidate-gates]], [[sources/runs/2026/09/2026-09-10-release-0-2-14-publication]], [[sources/runs/2026/09/2026-09-10-release-0-2-14-governor-invalid-interval]], [[sources/runs/2026/09/2026-09-10-release-0-2-14-initial-local-acceptance]], [[sources/runs/2026/09/2026-09-10-release-0-2-14-local-requalification]], [[sources/runs/2026/09/2026-09-10-release-0-2-14-installed-api-and-serving]], [[sources/runs/2026/09/2026-09-11-release-0-2-14-final-memory-acceptance]]'
title: v0.2.14 release qualification
status: measured
---
**Status, September 11: v0.2.14 is published, installed and serving locally. CI, all 25 original model gates and all 31 installed-release checks pass. The final unchanged governor and long-prompt memory tests completed with zero swap activity. Full local public-artifact acceptance is complete for this exact release.**

Release: [v0.2.14](https://github.com/carloslfu/slotstream/releases/tag/v0.2.14),
tagged at `ac7d7e53ca2397bb8840a97f028509fbb0a8f688` after the complete
[main CI run](https://github.com/carloslfu/slotstream/actions/runs/34539578315)
passed. The [publication run](https://github.com/carloslfu/slotstream/actions/runs/34541172114)
published the exact successful CI archive without recompiling it.

Public archive SHA-256:
`2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52`.
The public download matched the CI artifact exactly, passed GitHub attestation
verification, and reconstructed every source file with matching hashes. The
ordinary public installer installed those exact binary, Metal, identity and
source-archive bytes. The previous installation remains available for rollback.
The normal demo server was restored after the September 11 checks, reports
`0.2.14` and returned `OK` to the bounded smoke request. Chrome and Wispr Flow
were reopened. That response is not a performance benchmark.

## Release and CI qualification

This release carries the completed unified optimization campaign, intervening
public integration/documentation work, and completed decode-profiling records.
Profiling instrumentation remained isolated and is not in production sources.
The unpublished preparation history remains in
[[records/measurements/release-qualification-0-2-12]] and
[[records/measurements/release-qualification-0-2-13]]. Those failed tags are
preserved and have no binary release archives.

The corrected planner fixture independently requires the exact malformed
checkpoint error before checking startup. It accepts the exact early memory
refusal descriptions and prints both command diagnostics on failure. Seven
helper regressions, 22 static entry-point regressions and nine archive-verifier
regressions passed. The successful hosted run then passed the full static,
runtime, sampler/governor, check-catalogue, public-library and coverage jobs.
The instrumented catalogue passed 44 groups and 27,381 assertions, with no
failed or skipped group. Coverage floors remained enforced.

Main CI archives the candidate, tests it and verifies that the tested bytes
still match the archive. Publication requires successful main CI for the exact
tag commit, verifies the checksum, identity, reconstructed source and version,
then signs and publishes the same archive. Failed or unfinished CI is
ineligible. The only compiled-source difference from the earlier passing
instrumented candidate is the version string. A concurrent documentation-only
child commit was preserved for the final documentation push; its compiled
source closure is identical to the release commit.

Evidence: [[sources/runs/2026/09/2026-09-10-release-0-2-14-candidate-gates]] and
[[sources/runs/2026/09/2026-09-10-release-0-2-14-publication]].

## Installed public-artifact acceptance

The original full suite ran unchanged against the installed public binary.
It finished **20 passed, five failed, with no required skip**. The failures
came from four model runs: governor, combined MTP/vision, long-prompt memory,
and context-check, whose fit and memory assertions both failed on swap activity.
All observed peaks in those excluded intervals were below their explicit
targets and there were no new swap-outs. The original strict zero-swap gates
still rejected them; these are preserved failures, not passing measurements.

| Area | Current public-artifact evidence |
| --- | --- |
| Original model battery | 25 of 25 unique gates qualified across the initial pass and unchanged targeted reruns |
| Speculation and vision | Complete original 12 GB diagnostic passed determinism, exercised vision and validated its zero-swap memory interval |
| Context diagnostic | Original 2,048-token, 10 GB check passed both fit and zero-swap memory assertions |
| Quality and serving | 15 quality probes, 74 API robustness checks and 25 vision-serving checks passed in the original full suite |
| Installed-release suite | All 31 checks passed, including concurrent clients, prefix reuse and disconnect recovery |
| Full live-governor memory interval | Passed September 11 with zero swap activity; all four earlier invalid intervals remain preserved |
| Long-prompt memory interval | Passed September 11 with zero swap activity and exact recall; all three earlier invalid intervals remain preserved |

Reruns retained the exact installed identity, original driver hashes, targets,
prompts, token limits, full cooldown and acceptance assertions. Each used a
bounded readiness check requiring normal pressure, adequate reclaimable
memory, no competing model/compiler and a stable zero-swap preflight.
No production code or acceptance assertion was weakened. The first
governor-only completion protocol was never executed; its superseding attempts
and the independent remaining-case checks are preserved with their outcomes.
The passed installed-release suite was reused by exact binary identity instead
of being repeated.

System-wide counters do not identify the process responsible for swap-ins.
During the September 10 attempts, Chrome and Wispr Flow were running; neither
was closed. Their presence is not
proof that either caused a particular event. The normal demo was restored
after all test processes stopped. A quiet preflight by itself does not prove
that the subsequent interval stayed quiet, which is why the rejected attempts
remain invalidated.

Exact initial run and prospective correction:
[[sources/runs/2026/09/2026-09-10-release-0-2-14-governor-invalid-interval]] and
[[sources/runs/2026/09/2026-09-10-release-0-2-14-initial-local-acceptance]].
September 10 targeted attempts:
[[sources/runs/2026/09/2026-09-10-release-0-2-14-local-requalification]].
Installed API and normal-service restoration:
[[sources/runs/2026/09/2026-09-10-release-0-2-14-installed-api-and-serving]].

## Final memory acceptance, September 11

Carlos authorized temporarily closing Chrome and Wispr Flow. Both apps and
their helpers exited before testing. No Slotstream server was listening at
startup. Each model ran alone after the original 30-second stable-swap,
normal-pressure readiness check, requiring at least 16 GB reclaimable for the
governor and 13 GB for the long prompt. Governor startup observed 30.06 GB
reclaimable. The twelve original driver hashes match the frozen protocol and
the release tag; only output and frozen-driver paths changed in the wrapper.
No workload, cooldown, token limit, memory ceiling or assertion changed.

| Final check | Result | Maximum observed process memory | Ceiling |
| --- | --- | --- | --- |
| Full governor drill | Shrink, full 60-second cooldown and regrowth passed; all three nonempty output-ID sequences identical; zero swap-ins and swap-outs | 10,984,885,632 bytes | 13,000,000,000 bytes |
| Original long prompt | 7,972 prompt tokens; four output tokens; completed answer `SEVENTEEN`; both memory and recall gates passed; zero swap-ins and swap-outs | 8,094,469,432 bytes | 10,000,000,000 bytes |

Both process-memory intervals contain complete 20 ms sampling. The maximum
also considers the lifetime RSS high-water mark and final physical footprint.
These are bounded-memory observations, not memory-saving percentages.

The aggregate is the initial 20 passing gates, three previously qualified
targeted gates, and these two new passes. All are tied to the same published
binary and original acceptance drivers; the separate 31-check installed suite
is reused by exact identity. Earlier failed attempts remain failed. Closing
apps allowed this attempt to qualify, but system-wide counters cannot assign
the earlier swap-ins to either app or establish a causal diagnosis.

After both model processes exited, normal `slotstream serve` was restored and
answered `OK`; both authorized apps were reopened. Exact raw results, frozen
driver identity, unchanged assertions and restoration receipts are in
[[sources/runs/2026/09/2026-09-11-release-0-2-14-final-memory-acceptance]].

## Acceptance and performance scope

No required local v0.2.14 release-acceptance gate remains open. This conclusion
covers the published artifact at `ac7d7e53ca2397bb8840a97f028509fbb0a8f688`.
The later adoption of two draft tokens and the prospective Expert Lookahead
plan are separate source identities and work. This rerun neither installs nor
qualifies those changes; the public v0.2.14 binary remains unchanged.

The completed optimization campaign and its original qualified candidate are
separate evidence from this new public-artifact acceptance. Established
performance scope remains
[[records/measurements/optimization-final-composition-2026-09-09]] and
[[records/measurements/user-server-throughput-2026-09-10]]. Selected/reference
comparisons within that build are not a direct A/B against the prior public
release. Sustained decode was flat or slightly slower in the measured profiles;
there is no universal TPS improvement claim. Functional rerun durations and
the excluded swap intervals do not create new performance claims.
