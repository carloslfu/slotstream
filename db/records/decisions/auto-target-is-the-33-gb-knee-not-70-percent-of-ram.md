---
type: decision
id: 01m1hhwphxd76wk482gpha1k3x
created: 2026-09-02T17:15:28.701045+00:00
updated: 2026-09-09T22:59:04.524855+00:00
summary: Auto retains the evidence-based 33 GB default; larger-target predictions do not prove a universal performance plateau.
decided_on: 2026-08-31
evidence:
- '[[records/measurements/the-auto-memory-target-70-of-ram-was-the-wrong-shape-2026-08-31]]'
reversible_if: comparable real measurements show a better speed/memory tradeoff at a different default while preserving correctness and memory limits
title: Auto targets the 33 GB knee of the measured curve, never a share of RAM above it
status: standing
---
Auto retains the 33 GB base total-process ceiling as the current best-supported speed/memory tradeoff for this model. The draft head's charge, user RAM-share bound, Metal working-set bound and live-availability clamp remain distinct. The RAM share is an upper bound on automatic allocation. Explicit sizing can exceed the policy ceiling and keeps the cache fixed.

The measured development-Mac cache ladder shows diminishing gains near its upper clean points. The historical larger-target sweep inspected planner estimates; because the curve already holds flat beyond its verified anchors, that sweep is not proof that larger allocations cannot help. This clarification corrects the earlier wording without reversing the default or changing measured results.

Retain the default until comparable real measurements demonstrate a better resource/performance tradeoff. Lack of access to another Mac or its unused RAM alone is not a reason to remove a justified cap or introduce a live tuner. Keep the estimator's internal consistency gate, while distinguishing it from actual performance qualification.

Evidence: [[records/measurements/warm-decode-re-anchored-and-the-live-governor-finally-observed-2026-08]], [[records/measurements/the-auto-memory-target-70-of-ram-was-the-wrong-shape-2026-08-31]] and [[records/measurements/automatic-memory-default-evidence-scope-2026-09-09]]. Maintenance contract: [[records/design/measured-operating-policies]].
