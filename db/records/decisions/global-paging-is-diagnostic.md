---
type: decision
id: 01m28pnn6stvtxnghzajs59zkp
created: 2026-09-11T17:01:32.760934+00:00
updated: 2026-09-11T17:01:32.760934+00:00
summary: Treat host-wide paging as diagnostics, separate from functional and process-memory acceptance; preserve actual headroom, pressure and budget safeguards.
decided_on: 2026-09-11
evidence: '[[records/measurements/release-0-2-15-open-apps-testing-2026-09-11]]'
reversible_if: Process-attributed evidence and a concrete contract justify a paging bound; system-wide activity alone is insufficient.
title: Global macOS paging is diagnostic for functional acceptance
status: standing
---
Carlos approved removing global macOS paging as a correctness/release gate on September 11, 2026: “Okay remove that gate. Make sure everything makes sense because on Mac we don't control this thing”.

Host VM swap counters cover all applications. Their increase does not identify the responsible process, demonstrate that Slotstream exceeded its budget, or invalidate completed numerical checks. Slotstream can still contribute to system pressure indirectly; the counter's lack of attribution does not license ignoring real headroom or pressure.

## Standing policy

- Ordinary release acceptance, speculative decoding, governor transitions, context capacity and process-budget checks must not abort or fail solely because global swap counters increase. Record the observations separately. Missing paging telemetry is unknown, never evidence of a clean interval.
- Retain real reclaimable-memory preflights and live headroom floors, actual process-footprint ceilings including native lifetime peaks, OS pressure cancellation, allocation admission, the one-model lock and full completed-work/numerical checks.
- A serial build uses owned-process memory and real headroom for safety. Global swap changes are diagnostic by default. Explicit frozen clean-interval protocols remain reproducible.
- Performance qualification is independent. Preserve the declared clean-interval exclusions for timing comparisons. Functional acceptance under paging does not establish clean timing, a speed improvement or the absence of system impact.
- Do not manipulate macOS paging or close a user's applications to manufacture a functional pass. Stop test-owned models and waiters when their work ends.

## Evidence and scope

The original v0.2.15 candidate's repeated MTP checks were interrupted by small host-wide swap-in deltas while observed process peaks stayed below their target. Paging also occurred without a model running. Those intervals and the API result remain as recorded in [[records/measurements/release-0-2-15-open-apps-testing-2026-09-11]].

This is a prospective correction to the test's causal interpretation. Preserve frozen raw runs, original exclusions and historical claims. Do not relabel interrupted checks as passes: the updated candidate must finish them. Numerical tolerances, workloads, model settings and cache/draft defaults are unchanged.

Implementation applies to native MTP/governor/context diagnostics, the shared Python memory assessor, context resource orchestration, ordinary verification and the serial-build default. Benchmark-specific assessors and frozen experimental cohorts retain their original contracts.
