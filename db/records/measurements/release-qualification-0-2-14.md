---
type: measurement
id: 01m26rab8sbwpy9sxpr9ex8fsn
created: 2026-09-10T22:51:50.425333+00:00
updated: 2026-09-10T22:51:50.425333+00:00
summary: v0.2.14 exact CI archive publication and local installed-artifact qualification
date: 2026-09-10
doc: measurements
level: '3'
machines: '[[records/machines/github-actions-macos-26]], [[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1140'
runs: '[[sources/runs/2026/09/2026-09-10-release-0-2-14-candidate-gates]]'
title: v0.2.14 release qualification
status: analysis
---
**Status: v0.2.14 awaiting successful main CI, publication and installed-artifact acceptance.**

This release carries the completed unified optimization campaign and the
intervening public integration/documentation work. The unpublished preparation
history remains in [[records/measurements/release-qualification-0-2-12]] and
[[records/measurements/release-qualification-0-2-13]]. Those failed tags are
preserved and have no binary release archives.

The planner fixture independently requires the precise malformed-checkpoint
error from CheckpointIndex before checking the inference startup path. It now
recognizes the exact human-readable model-allocation refusals as well as coded
planner refusals. A later generation refusal cannot substitute for startup,
and successful exits, traps and missing parser errors still fail. Both command
statuses and diagnostics are printed when a check fails. Seven local helper
tests pass, and the preserved old-helper counterexample rejects the live guard
descriptions. The static entry-point fixture suite also passes all 22 tests.
Hosted CI must confirm the corrected path before a release tag is created.

## Build once and publish the tested archive

Main CI builds the candidate, archives its binary, pinned Metal library,
build identity and reconstructible source, then runs the planner, full static,
sampler/governor and check-catalogue gates. It verifies that the tested files
still match the candidate. Independent library and coverage jobs must also
pass for the whole workflow to succeed. The early archived artifact remains
available for debugging if a later check fails; it is not a public release.

The release workflow accepts only a successful main push CI run for its exact
commit. It downloads that artifact, verifies its checksum, every identity hash
and the complete reconstructed source against the tag checkout, and verifies
the CLI version. It signs and publishes those same archive bytes without a
second compilation. Failed or unfinished CI is ineligible. Nine verifier tests
pass, including corruption, stale or forged source, mismatched binaries,
missing/duplicate/unsafe members and refusal to overwrite output.

The only compiled-source difference from the passing instrumented candidate
is the version string. Inference algorithms, tuning constants, context limits
and the original model acceptance workload are unchanged.

## Required public installation acceptance

The public download must match the successful CI archive by SHA-256, pass
GitHub provenance verification and match its source/binary identity. The
ordinary public installer is used against its latest-release URL. Local
acceptance then requires all 25 original full model gates and all 31 installed
release checks, with no skipped required gate. One model process runs at a
time, explicit small test profiles retain their real-memory preflights, and
the previous installation is retained for rollback.

Evidence: [[sources/runs/2026/09/2026-09-10-release-0-2-14-candidate-gates]].
The established performance scope remains
[[records/measurements/optimization-final-composition-2026-09-09]] and
[[records/measurements/user-server-throughput-2026-09-10]]. Selected/reference
comparisons within that build are not a direct A/B against the prior public
release. Sustained decode was flat or slightly slower in the measured profiles;
there is no universal TPS improvement claim.
