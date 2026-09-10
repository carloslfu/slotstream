---
type: measurement
id: 01m26rab8sbwpy9sxpr9ex8fsn
created: 2026-09-10T22:51:50.425333+00:00
updated: 2026-09-10T23:52:52.085042+00:00
summary: 'Published v0.2.14: CI and installed API passed; two local zero-swap model gates remain unqualified'
date: 2026-09-10
doc: measurements
level: '3'
machines: '[[records/machines/github-actions-macos-26]], [[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1140'
runs: '[[sources/runs/2026/09/2026-09-10-release-0-2-14-candidate-gates]], [[sources/runs/2026/09/2026-09-10-release-0-2-14-publication]], [[sources/runs/2026/09/2026-09-10-release-0-2-14-governor-invalid-interval]], [[sources/runs/2026/09/2026-09-10-release-0-2-14-initial-local-acceptance]], [[sources/runs/2026/09/2026-09-10-release-0-2-14-local-requalification]], [[sources/runs/2026/09/2026-09-10-release-0-2-14-installed-api-and-serving]]'
title: v0.2.14 release qualification
status: analysis
---
**Status: v0.2.14 is published, installed and serving locally. CI passed; 23 of 25 original model gates and all 31 installed-release checks are qualified. Full local public-artifact acceptance remains incomplete because the governor and long-prompt memory gates have not completed a zero-swap interval.**

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
The restored normal demo server reports `0.2.14` and returned `OK` to the
bounded smoke request. That response is not a performance benchmark.

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
| Original model battery | 23 of 25 unique gates qualified across the initial pass and unchanged targeted reruns |
| Speculation and vision | Complete original 12 GB diagnostic passed determinism, exercised vision and validated its zero-swap memory interval |
| Context diagnostic | Original 2,048-token, 10 GB check passed both fit and zero-swap memory assertions |
| Quality and serving | 15 quality probes, 74 API robustness checks and 25 vision-serving checks passed in the original full suite |
| Installed-release suite | All 31 checks passed, including concurrent clients, prefix reuse and disconnect recovery |
| Full live-governor memory interval | Unqualified after the initial attempt and three unchanged reruns; system swap-ins interrupted each interval |
| Long-prompt memory interval | Unqualified after the initial attempt and two unchanged reruns; recall passed, but system swap-ins invalidated each memory interval |

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
Chrome and Wispr Flow were running; neither was closed. Their presence is not
proof that either caused a particular event. The normal demo was restored
after all test processes stopped. A quiet preflight by itself does not prove
that the subsequent interval stayed quiet, which is why the rejected attempts
remain unqualified.

Exact initial run and prospective correction:
[[sources/runs/2026/09/2026-09-10-release-0-2-14-governor-invalid-interval]] and
[[sources/runs/2026/09/2026-09-10-release-0-2-14-initial-local-acceptance]].
All later attempts and current qualification:
[[sources/runs/2026/09/2026-09-10-release-0-2-14-local-requalification]].
Installed API and normal-service restoration:
[[sources/runs/2026/09/2026-09-10-release-0-2-14-installed-api-and-serving]].

## Remaining release acceptance and performance scope

Only the full live-governor and long-prompt zero-swap memory gates remain.
Resume when a sufficiently quiet interval is available, or after Carlos
authorizes temporarily interrupting active apps. Pause only the verified
normal demo process, rerun those exact two workloads and assertions, preserve
every result, then restore normal serving. Already passed gates do not need
repetition unless the binary, drivers or another relevant condition changes.
Do not report complete public-artifact model acceptance until both pass.

The completed optimization campaign and its original qualified candidate are
separate evidence from this new public-artifact acceptance. Established
performance scope remains
[[records/measurements/optimization-final-composition-2026-09-09]] and
[[records/measurements/user-server-throughput-2026-09-10]]. Selected/reference
comparisons within that build are not a direct A/B against the prior public
release. Sustained decode was flat or slightly slower in the measured profiles;
there is no universal TPS improvement claim. Functional rerun durations and
the excluded swap intervals do not create new performance claims.
