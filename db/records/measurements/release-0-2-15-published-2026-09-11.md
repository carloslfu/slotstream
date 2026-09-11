---
type: measurement
id: 01m28wq2nknyh04dn58fncmkh2
created: 2026-09-11T18:47:10.771875+00:00
updated: 2026-09-11T18:51:26.465461+00:00
summary: 'v0.2.15 published, installed and accepted: 25 of 25 model gates on the exact CI artifact and 31 of 31 installed-release checks'
date: 2026-09-11
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Functional acceptance under the paging-diagnostic policy; no clean-timing or throughput qualification is claimed.
order: '1200'
runs: '[[sources/runs/2026/09/2026-09-11-release-0-2-15-published-and-installed]]'
title: v0.2.15 published, installed and accepted
status: measured
---
**v0.2.15 is published, installed and functionally accepted.** The exact CI artifact passed all twenty-five model gates, the published archive verified against that artifact with a valid attestation, the installer replaced 0.2.14 on this machine, and the installed binary passed all thirty-one end-to-end release checks. Every user application and unrelated workload stayed open throughout.

Release: [v0.2.15](https://github.com/carloslfu/slotstream/releases/tag/v0.2.15), tagged on `48d11f288237e9b697264621297890eead7ffb0a`, published 2026-09-11T17:42:30Z. Archive SHA-256 `d9ea8246d7868620a0c9e0766f7ba637522739d66da8e5fa5d44b2190fc6d4fa`; binary SHA-256 `8abb02b639285335b4fc3113819ebc6fe084bbf017fab2b4a52de3e471a551e3`. The CI candidate, the re-downloaded public archive and the installed binary are byte-identical.

## What qualified

| Phase | Result |
|---|---|
| Main CI 34626184507, commit `48d11f2` | Coverage, weights-free and public-library jobs all succeeded |
| Model acceptance on the downloaded CI binary | 25 of 25 gates, 0 failures, 1,103.77 seconds |
| Release workflow 34629147966 | Succeeded; published archive matches the CI artifact |
| Provenance | `gh attestation verify` confirmed the sigstore bundle for `refs/tags/v0.2.15` |
| Installation | 0.2.14 replaced by 0.2.15, exit code 0, digest re-checked |
| Installed-release end-to-end | 31 of 31 checks, 0 failures |

The twenty-five gates are the sixteen numbered checks plus weights provenance, planner gates, sampler and governor gates, the full elastic drill, speculative decode gates, the behavioural quality probe, the serving robustness suite, vision tower parity and the vision serving suite. The 150 compiled inputs and the eight frozen drivers were hashed before and after and were unchanged.

## Why this reaches twenty-five when the candidate stopped at twenty-four

The combined MTP and vision gate had previously been cancelled four times by a rule that failed acceptance whenever any process on the whole Mac touched swap. That rule was removed by [[records/decisions/global-paging-is-diagnostic]]. This acceptance was therefore decided by the original numerical and work assertions, the actual process-footprint ceilings, real headroom and OS pressure handling, with global paging recorded separately as a diagnostic.

Do not read the twenty-fifth gate as the earlier zero-swap condition being satisfied. It was not. The condition was retired as a test-design defect, and the preserved exclusions in [[records/measurements/release-0-2-15-open-apps-testing-2026-09-11]] stay as they were recorded.

The acceptance interval observed 271 system-wide swap-ins and zero swap-outs, with reclaimable memory rising from 28,482,207,744 to 30,258,495,488 bytes.

## The shipped default, observed on the public binary

The installed-release probe ran with no depth override and drafted 30 tokens over 15 verification passes, exactly two per pass, accepting 16. This is the two-draft default from [[records/decisions/draft-depth-defaults-to-two]] arriving through a published artifact rather than a local build. Its lifetime physical-footprint peak was 7,203,164,480 bytes against a 10 GB target, and that generator interval observed no paging in either direction.

## Limits
No clean-timing or throughput qualification is claimed here. The acceptance interval deliberately shared the machine with ordinary work, which is what functional acceptance is now allowed to do and what a speed measurement still is not. The depth-two choice remains a mixed-workload preference, not a universal improvement.

Every commit that has landed on `main` after the released build changes documentation, projections and store records only. None touches `Sources/`, `Package.swift`, `Package.resolved` or the `Makefile`, so the published artifact remains the exact build of `48d11f2`.

Expert lookahead and expert prefetching are reviewed, planned and unimplemented. This release ships the plan, not that acceleration.

At closure no Slotstream process remained, the native model lock was free, no application was closed or paused, and no persistent production instrumentation or environment setting changed.
