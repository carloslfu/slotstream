---
type: measurement
id: 01m285cqbd1j8yf6ptkgrpm222
created: 2026-09-11T11:59:34.253714+00:00
updated: 2026-09-11T18:47:24.755972+00:00
summary: 'v0.2.15 prepared, not published: CI passed and 24 of 25 model gates qualify; final paging gate and app restoration pending'
date: 2026-09-11
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]], [[records/machines/github-actions-macos-26]]'
note: The candidate described here, commit ee4d1af at 24 of 25 gates, is not the build that shipped. v0.2.15 was tagged on 48d11f2 and passed all 25 gates after the zero-swap acceptance rule was retired; the release identity and digests here are superseded.
order: '1190'
runs: '[[sources/runs/2026/09/2026-09-11-release-0-2-15-prepublication]]'
superseded_by: '[[records/measurements/release-0-2-15-published-2026-09-11]]'
title: v0.2.15 prepublication qualification
status: superseded
---
**Testing follow-up, September 11:** [[records/measurements/release-0-2-15-open-apps-testing-2026-09-11]] records all 31 additional candidate API checks passing and four retained MTP paging exclusions with every user application left running. Chrome and Wispr Flow have been reopened; the earlier pause request is superseded by the instruction to leave other work alone. Publication and installation remain pending. The earlier checkpoint below is preserved as history.

**v0.2.15 is prepared and pushed, but not published or installed. Complete main CI passed. Of the 25 original model gates, 24 now qualify; the combined MTP/vision diagnostic still lacks a zero-swap memory interval.**

Release source: `ee4d1af5b3d63c2b5670c814b40b25432415eb46`. [Main CI 34592671081](https://github.com/carloslfu/slotstream/actions/runs/34592671081) passed every coverage, weights-free and public-library job. The exact downloaded CI archive passed source and identity verification. Archive SHA-256: `4f28e283daadcde7020789718e94f757190625c88297c78952d365e0c5454af0`; binary SHA-256: `31eefbbb4791beddb0f8674ab1c1875c2eb1c4a034f5cdd0fa1abcba31e373cf`. Its 150 compiled inputs match the tagged-version preparation source. There is no v0.2.15 tag yet.

## Changes and atomic commits

The release candidate includes the adopted two-draft default, compatibility-preserving lifetime physical-footprint peak reports, native memory-lifecycle and fixed-budget regressions, corrected memory documentation, and the reviewed Expert Lookahead execution plan. Expert prediction and prefetching remain planned work. Existing depth overrides, MTP activation and automatic RAM policies remain intact; there is no new universal throughput claim.

The default/alignment commits are `0b600d8` and `7ea0941`. Final plan review is `b7487fa` (`docs(plan): finalize expert lookahead execution gates`); memory implementation, tests and evidence are `546f292` (`fix(memory): retain lifetime GPU footprint peaks in reports and gates`); version/changelog preparation is `ee4d1af` (`chore(release): prepare v0.2.15`). The later qualification record is documentation only and does not change the candidate's compiled inputs.

## Actual acceptance state

The complete original battery finished 23 passed and two failed. Long-context recall and memory, context diagnostics, 15 quality probes, all 74 API robustness checks, vision parity and all 25 vision-serving checks passed. The original 7,972-token prompt returned `SEVENTEEN`, completed with four output tokens and peaked at 8,102,153,528 bytes under its 10 GB limit, with zero swap activity. The earlier preversion long-prompt gap also closed in its own identity; the CI binary independently passed, so no identity substitution is needed.

The governor and MTP/vision intervals initially failed strict system-swap guards. The first unchanged targeted governor retry also recorded four swap-ins. The second passed full shrink, the original 60-second cooldown and regrowth with all three nonempty output-ID arrays identical, complete memory observations and zero swap. Maximum sampled footprint was 10,386,689,384 bytes under the 13 GB ceiling.

The first targeted MTP/vision rerun passed text/vision determinism, speculation-ran and rollback checks but recorded 12 swap-ins. The second stopped early after four swap-ins. Both observed peaks were below the 12 GB target and neither native interval recorded new swap-outs, but both correctly reported `memory_validated: false`. They remain failed resource intervals, not passing measurements. The original battery's MTP interval also recorded 32 swap-outs. All exclusions are preserved. No workload, target, cooldown or acceptance assertion was relaxed. Readiness checked real headroom, normal pressure, nominal thermal state and 120 stable seconds of swap counters; that preflight does not guarantee a quiet later interval.

## Closure and remaining work

Every owned model process stopped and the native model lock is free. The installed public executable remains v0.2.14. No tag, publication, public-download attestation or installed-v0.2.15 API test has occurred. Test-only detail settings were confined to child environments.

Carlos authorized temporarily closing Chrome and Wispr Flow and reopening them afterward. Both apps were already closed when inspected. At restoration time the computer-use tool reported that the Mac was locked and could not unlock automatically, so reopening remains pending a manual unlock. Separate local verification work was active in a VM; this establishes concurrent workload, not the cause of any particular swap event. Permission to pause that other task temporarily is pending and was not inferred from the Chrome/Wispr authorization.

Next: obtain a clean original MTP/vision interval without disrupting another task, tag the exact already-passing CI commit, let publication reuse that archive, verify the public checksum/source/attestation, install those bytes, run the separate installed-release suite, stop the model and reopen the authorized apps. Do not call this candidate released or fully accepted until those steps have actually completed.

Exact raw evidence and failed intervals: [[sources/runs/2026/09/2026-09-11-release-0-2-15-prepublication]]. Related implementation: [[records/measurements/lifetime-footprint-reporting-and-fixed-budgets-2026-09-11]] and [[records/measurements/draft-depth-two-default-2026-09-11]].
