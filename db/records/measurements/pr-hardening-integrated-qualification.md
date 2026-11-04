---
type: measurement
id: 01m6m5eqt8crfsvb97qeqe3m5h
created: 2026-11-04T20:54:20.744230+00:00
updated: 2026-11-04T20:54:20.744230+00:00
summary: 'PR hardening: integrated qualification'
date: 2026-11-04
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1950'
runs: '[[sources/runs/2026/11/2026-11-04-pr-integrated-qualification]]'
title: 'PR hardening: integrated qualification'
status: measured
---
All 75 PRs from #60 through #134 were individually reviewed. At qualification capture, 45 were already merged and the remaining 26 engine PRs were integrated against current engine-only main, with shared gate registrations and prefix-test imports reconciled. The four archived-tooling PRs, #66, #79, #113 and #129, were closed with scope explanations. Raw per-PR decisions, exact heads and integration trees are in [[sources/runs/2026/11/2026-11-04-pr-integrated-qualification]].

The integrated result preserves all existing checks and includes these corrections:

- #75 keeps optimized-Python validation and requires each qualification flag to be exactly `true`; strings and other truthy values cannot authorize embedding.
- #93 and #111 require expected rejection statuses and option-specific diagnostics or the structured `insufficient_memory` refusal. Missing executables, unrelated failures, unknown options and crashes fail the gates.
- Negative invalid-size fixtures bind values with `--memory-gb=value`, reaching memory validation rather than accepting a missing-argument parser error.
- Doctor now refuses explicitly non-finite or negative `--sim-available`. Zero remains valid input and receives the normal structured physical-memory refusal. Implicit simulated availability retains its existing semantics.
- #131's mocked entry fixture counts the three maintained engine entrypoints. Combined static fixture registration is reconciled without dropping a suite.

The release build passes all 115 native T0/T1 catalogue checks, with zero failures or skips. Full model acceptance, the complete model-free static suite, external Swift-library consumer and software context proxies pass. The live suite covers pinned weight verification, current-backend parity, cache and prefill equality, governor recovery, exact MTP verification, process memory, long-context recall, serving behavior, quality sanity and real-image serving. The historical MLX 0.31 draft-head diagnostic remains visible and differs from the current backend; its old bytes are preserved, and independent current-backend parity passes. The actual maintained n-gram payload has 384 relevant tensors with the layout required by the new guards.

The original pre-review baseline is `c0c55d86866d77ae7fc2bf7b57b1c0faf7f9df25`. Independent frozen baseline and integrated release builds use the same pinned metallib. Three interleaved paired rounds per fixture use 256-token passes, greedy sampling, seed 7, 32 generated tokens and sampled process footprint. One original prose pair is discarded for global paging and retained as [[sources/runs/2026/11/2026-11-04-pr-prose-timing-exclusion]]. A frozen addendum repeats that whole pair with unchanged settings and thresholds. The analysis uses three eligible, non-swapping pairs per fixture, retaining every original and replacement cell; every captured paired output-ID list is identical. The plan was frozen before these runs and requires investigation of a median complete-request slowdown above five percent.

| Prompt | Profile | Median paired request-time reduction | Output IDs |
| --- | --- | ---: | --- |
| code-brief-development | 10 GB, MTP on | 1.51% | identical |
| code | 8.1 GB, MTP off | -0.54% | identical |
| prose | 8.1 GB, MTP off | 4.99% | identical |
| short | 8.1 GB, MTP off | -1.37% | identical |

Every timed cell also passes the production memory gate at its explicit target. Median paired process-peak growth stays within the separately frozen threshold, the larger of 250 MB or five percent of its paired baseline peak. These bounded cases show no meaningful regression against the frozen thresholds. They do not establish a general speedup, qualify the entire 16–64 GB range, or replace full task-quality evaluation. Filesystem cache is uncontrolled with no purge; expert and prefix caches start empty per process. The earlier first-45-PR comparison is [[records/measurements/pr-hardening-initial-baseline]]. No new runtime optimization default, model, app scope or release tag is adopted.
