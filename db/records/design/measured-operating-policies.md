---
type: design
meta-type: conclusion
id: 01m246aw461nyrejaspmzhxkms
created: 2026-09-09T22:59:04.454986+00:00
updated: 2026-09-09T22:59:04.454986+00:00
summary: Measured operating policies and revision criteria
date: 2026-09-09
doc: plan
level: '2'
order: '145'
title: Measured operating policies and revision criteria
---
Maintaining good operating choices is part of the product: model selection, inference, context, memory, responsiveness and resource use must work together. A useful default saves users from repeating the engineering investigation. It may deliberately leave capacity unused when further allocation has no demonstrated benefit. Best means the best-supported tradeoff for the stated objective and evidence, not proof of a universal optimum.

## Classify the number before changing it

| Kind | Meaning and revision rule |
|---|---|
| Model or format fact | An exact dimension, byte count or format requirement. Verify against the pinned artifact; do not tune it independently. |
| Safety or correctness bound | Protects physical feasibility, numerical validity or ownership. A performance preference never overrides it. |
| Qualification limit | Marks the configuration actually validated. Expanding it requires the corresponding acceptance gates, not merely spare capacity. |
| Operating default | Chooses a practical resource/performance tradeoff. Retain a justified default until evidence or an explicit change of objective warrants revision. Document any supported override and its consequences. |
| Estimator bound | Limits what a prediction may claim. Holding an estimate flat outside its verified range does not establish a flat physical response. |

A value can serve several roles; state each one and separate their controls. A manual operating override does not waive a safety or qualification limit. Some legacy explicit paths warn rather than refuse, so describe their actual behavior instead of inventing protection.

## Record the reasoning where it is used

For each important new or materially revised tuning value, keep a named code constant and a nearby explanation linked to a canonical record. Record:

- Purpose and units, including whether a budget covers the whole process or one component.
- Kind of limit and evidence basis: measured observation, derived arithmetic, bounded estimate or provisional engineering choice.
- Tested model/revision, engine/backend, hardware and workload scope, with links to evidence and failed or excluded runs.
- The objective and tradeoff, including costs displaced elsewhere in the stack.
- Automatic behavior, allowed override and consequences for resizing, safety checks and user control.
- The condition that would justify revision and the gate that checks implementation behavior.

Keep this proportional to the decision; this does not require a separate record for every loop literal. Existing records can own a coherent family of constants. Examples include expert-cache targets, prefill candidates, draft activation thresholds, I/O concurrency, context qualification and allocator allowances. Preserve their distinct evidence rather than treating every number as one type of cap.

## Make the best supported choice with incomplete evidence

Use first principles to identify the bottleneck and feasible alternatives, then the available measurements to choose a conservative default. More RAM, larger batches or greater concurrency can displace useful resources or hit another bottleneck. Unavailable target hardware does not itself invalidate the existing choice or require automatic benchmarking on every user's machine.

When a revision is justified, compare configurations with matched work, controlled warm/cold state and relevant context/draft settings. Measure user-visible time and the full resource cost; fewer cache misses or a faster estimate alone is insufficient. Freeze meaningful comparison criteria before scored runs and retain failures. Change the default only within its proven safety and correctness envelope. A simpler measured profile may suffice; a live tuner needs evidence that its benefit repays its complexity and transition cost.

## Memory ceiling example and maintenance

The base automatic total-process ceiling remains 33 GB. The clean development-Mac cache ladder showed diminishing returns near 120 to 150 experts/layer, and the target accommodates the chosen prefill workspace. An enabled draft head adds its separately charged cost. RAM share, Metal limits and live availability may lower the target. Explicit memory sizing bypasses the operating ceiling and pins the cache.

The original larger-target sweep evaluated an already-bounded prediction curve. It cannot prove that all larger allocations have no benefit. The existing ceiling is still a defensible default; no allocation change is justified merely by that limitation in the evidence. See [[records/measurements/automatic-memory-default-evidence-scope-2026-09-09]], [[records/decisions/auto-target-is-the-33-gb-knee-not-70-percent-of-ram]] and [[records/claims/auto-memory-target-ceiling-33-gb]].

Keep code comments, CLI help/diagnostics, policy checks, canonical decisions/claims and relevant README/guides aligned. Regenerate PLAN.md, MEASUREMENTS.md and llms-full.txt from their declared sources. Preserve historical source bytes and annotate interpretations through records. This policy documents ongoing engineering responsibility; it does not claim a completed audit of every existing constant or authorize new benchmarks, spending, telemetry or background tuning.
