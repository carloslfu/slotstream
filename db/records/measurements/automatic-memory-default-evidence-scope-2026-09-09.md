---
type: measurement
meta-type: conclusion
id: 01m246aw4wr0h2vqqwbhwy27ty
created: 2026-09-09T22:59:04.476883+00:00
updated: 2026-09-09T22:59:04.476883+00:00
summary: 'Automatic memory default: evidence scope and retained policy (2026-09-09)'
date: 2026-09-09
doc: measurements
level: '3'
order: '391'
title: 'Automatic memory default: evidence scope and retained policy (2026-09-09)'
status: analysis
---
This clarification keeps the current automatic memory policy and every historical run unchanged. It separates the evidence behind the policy from the predictions produced by that same policy.

The preceding [[records/measurements/the-auto-memory-target-70-of-ram-was-the-wrong-shape-2026-08-31]] describes a sweep using `doctor --json`. Its flat larger-target speed values are planner predictions, whose decode curve already stops extrapolating at its upper verified anchor. They are not an independent benchmark of larger allocations. The historical wording that nothing larger decoded or prefilled faster must be read as a statement about those estimates, not a measured universal result.

The real ladder in [[records/measurements/warm-decode-re-anchored-and-the-live-governor-finally-observed-2026-08]] records 11.2 tok/s at 120 experts/layer and 11.6 at 150 on the development Mac. It shows diminishing gains over that measured interval. The larger-cache observation at 181 was not reproducible without memory-pressure contamination and remains excluded from a stronger throughput claim.

The 33 GB base target remains the best-supported operating choice so far for the implemented model and planning objective, accommodating expert cache and prefill workspace without consuming more memory solely because a machine has it. This is a policy judgment, not proof of an optimum on every hardware/workload pair. The 70% RAM share is an upper bound on auto, not a lower bound. The draft charge and the existing availability/Metal bounds remain separate.

A better comparable hardware/workload result can justify changing the default. Until then, explicit sizing is the supported way to explore another tradeoff, with its documented fixed-cache behavior. A model-free planner gate proves target selection, arithmetic and diagnostics; it does not measure allocation, physical peaks or speed. No new benchmark or numerical default is introduced by this clarification.

Controlling decision: [[records/decisions/auto-target-is-the-33-gb-knee-not-70-percent-of-ram]]. General engineering contract: [[records/design/measured-operating-policies]].
