---
type: plan
meta-type: operational
id: 01m1hhwns2gxssj3sjrbevtg5s
created: 2026-09-02T17:15:27.906429+00:00
updated: 2026-10-07T18:31:40.780416+00:00
summary: 8.1 Next — the ordered queue (post-0.1.5)
date: 2026-08-30
doc: plan
kind: queue
level: '3'
order: '290'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 8.1 Next — the ordered queue (post-0.1.5)
---

Ordering only, deliberately no day estimates. The ordering principle is **what decides
whether someone keeps using this after their first session**, which is not the same as
what completes the milestone map — see the deprioritized list at the end.


**Inference optimization:** [[records/plan/whole-engine-optimization-2026-09-04]] preserves the completed OPT00–OPT36 program. [[records/plan/n6-prefill-bound-the-pass-then-read-each-expert-once]] is its detailed prefill chapter. The new local learned-prediction experiment is [[records/plan/expert-lookahead-local-experiment-2026-09-10]]; it owns its separate implementation packages, resource bounds and acceptance criteria. Historical milestones and failed experiments remain available, and overlapping mechanisms are implemented once.

**Same-model quantization and automatic memory, closed October 7:** [[records/plan/same-model-quantization-and-automatic-memory-2026-10-02]] preserves the completed implementation and research effort. Retain original four-bit, independent initial/runtime automation and user overrides. The full speed target remains unmet; this item has no active experiment queue. Reopening needs a materially new evidence-backed mechanism or an explicit owner change of scope, as recorded in [[records/decisions/same-model-lowbudget-target-remains-unmet]].
