---
type: decision
meta-type: conclusion
id: 01m27v42cen3x9p4ky4jxexj5v
created: 2026-09-11T09:00:04.878840+00:00
updated: 2026-09-11T09:13:46.750785+00:00
summary: Two draft tokens are the adopted operating default; activation and memory policies remain separate
decided_on: 2026-09-11
evidence: '[[records/measurements/mtp-depth-auto40-multitasking-2026-09-11]]'
reversible_if: Clean paired measurements across relevant workloads and contexts favor another depth or a correctness/resource regression requires reversal
title: Draft depth defaults to two
status: standing
---
Carlos explicitly adopted two draft tokens after the completed 54-experiment comparison and requested that the tool and its supporting material align with this choice. This is an operating decision with incomplete performance evidence, not a claim that the study passed its prospective universal-default qualification rule.

The automatic-40%-RAM study found depths two and three effectively tied overall in clean repeated comparisons. Two improved prose and code over one in the eligible pairs, while the arithmetic comparison against one had only one eligible pair. There was no clean longer matched pair. Preserve those limitations and all source bytes. Earlier one-draft measurements remain historical evidence at their original settings.

`Generator.defaultDraftDepth` is two. The CLI and Swift library share that implementation. An absent or invalid `SLOTSTREAM_DRAFT_DEPTH` falls back to two; valid integers from 1 through 16 still override it. Programmatic per-generator overrides remain available. The normal context bound can shorten the provisional chain near the context ceiling, and an explicitly enabled experimental adaptive policy may choose fewer drafts. Neither changes the operating default.

This decision supersedes the draft-depth part of [[records/decisions/draft-depth-defaults-to-one-and-auto-floor-120-per-layer]]. The separate MTP auto-activation floor remains 120 cached experts per layer after charging the head. Automatic RAM share remains 70%; the measured 40% multitasking profile remains an explicit choice. No estimator, memory floor, allocation guard, model weights, sampler, rollback algorithm or context limit is relaxed.

New experiments, including Expert Lookahead, fix both baseline and candidate at depth two unless draft depth is their explicit independent variable. At depth two a normal verification pass contains the pending token and two drafts. Update prospective feature/position counts and memory/storage accounting accordingly. Frozen depth-one experiments and deliberately pinned diagnostic fixtures retain their exact configurations; they are not relabeled as two-draft evidence.

The source/default change is separate from publishing a release or replacing the installed public artifact. The accompanying implementation record must state what was built and tested and which executable is installed. Slotstream remains stopped after qualification.

Implementation and evidence: [[records/measurements/draft-depth-two-default-2026-09-11]]. The build, T0, static and serving configuration checks passed. The full MTP gate remains resource-incomplete; the installed public release was not replaced.
