---
type: decision
id: 01m45g3m6zjxhzbrfcy3dv0xqh
created: 2026-10-05T07:40:30.814970+00:00
updated: 2026-10-05T07:40:30.814970+00:00
summary: Preserve the ungraded answer and correct only the instruction worker interpreter in a new frozen continuation
decided_on: 2026-10-05
evidence: '[[records/decisions/final-paired-task-quality-protocol]], [[records/plan/same-model-quantization-and-automatic-memory-2026-10-02]]'
reversible_if: A separately frozen execution correction preserves every original answer and all costs without changing the quality gates or selecting tasks from outcomes.
title: Recover the first instruction grade with its matching Python runtime
status: standing
---
Use the separately frozen recovery in [[sources/runs/2026/10/2026-10-05-heldout-instruction-worker-recovery]] for the first instruction-worker import failure. The previous continuation stopped after journaling a complete original-model answer and before producing its first instruction grade. Synthetic reproduction identifies a Python ABI mismatch: the coordinator used Python 3.9 against a package bundle containing a Python 3.12 regex extension. The existing Python 3.12 interpreter passes the exact unchanged worker on public synthetic success and refusal fixtures. This is an execution correction under [[records/decisions/final-paired-task-quality-protocol]], following [[records/decisions/heldout-unanswered-startup-continuation]].

Keep both earlier runs, protocols and answer bytes unchanged and incomplete. The new owner authenticates every completed prefix and the one ungraded complete answer. Bind the exact existing Python 3.12 image and the previous frozen instruction-worker source, without changing its package data or resource limits. Grade that saved answer once after this freeze, then generate only the unanswered cells in their original order. Mark the grading attempt durably before invocation; another failure must remain visible and must not trigger a retry or answer replacement. Run the real synthetic worker preflight before every new model session's owning job.

The current host's task-grading function definitions are unchanged, verified structurally against the old source. Correct final instruction replay to treat physical worker footprint as bounded custody, as already done for other execution observations. Preserve both original and replay footprints; compare all actual grading fields exactly. A footprint observation is not a deterministic grade, and this correction changes no pass criterion.

Carry all previous active job time, attempted native sessions including both failures, and receipt allocation into the original total budgets. Keep native binaries, weights, task sample and order, resets, generation limits, seeds, family weights, margins, alpha and paired analysis unchanged. Do not inspect partial outcomes or choose further work from a partial score. Final replay and statistics require every frozen job to complete. An inconclusive or failed result does not qualify the candidate. Product, image, long-context, memory, speed, distribution and release gates remain independent.
