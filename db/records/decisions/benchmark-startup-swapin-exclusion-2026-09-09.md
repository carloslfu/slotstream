---
type: decision
id: 01m237ycm1keb7kphyymgn9the
created: 2026-09-09T14:07:58.081241+00:00
updated: 2026-09-09T14:07:58.081241+00:00
summary: Explicit paired benchmark startup swap-in exclusion with unchanged hard resource limits
decided_on: 2026-09-09
evidence: '[[records/plan/whole-engine-optimization-2026-09-04]]'
reversible_if: A startup swap-in reveals a resource hazard not caught by retained hard guards, or independent validation shows contaminated timing can be accepted.
title: Startup swap-ins exclude the whole paired timing sample
status: standing
---
# Startup swap-ins exclude the whole paired timing sample

For the explicitly declared V546 paired planner cohorts, classify startup swap-ins with unchanged swap-outs as timing contamination. Exclude the entire paired round from both request and first-job timing. Continue collecting the frozen workload only while every hard resource guard passes.

This deliberately changes one earlier benchmark execution rule: a startup swap-in alone no longer aborts an entire opted-in cohort. The older protocols retain their original behavior. Their failed results remain failed, and no old or pilot response may be pooled into a new cohort.

The second full 12 GB attempt stopped on 28 startup swap-ins despite at least 26,595,131,392 reclaimable bytes throughout the outer interval, no new swap-outs, and no other first-response resource exclusion. All 31 completed responses satisfied the original sixteen-output work and 12 GB sampled process cap. Its preceding measured swap-in event only excluded a pair. The startup and measured phases therefore treated the same kind of timing contamination differently. The earlier 12 GB stop also had an independent short-output fixture problem; that fixture was corrected and independently verified before this second attempt.

Keep the original physical-footprint and owned-RSS limits, startup admission, live headroom, thermal/power checks, workspace contention checks, and immediate stop on new swap-outs. Counter resets, missing or invalid observations, actual work violations, and other hard resource failures cannot become eligible timing samples. The engine's own memory/pressure checks and allocation accounting are unchanged.

Keep all sixteen alternating pairs, sixty-four responses, sixteen output tokens, exact output/work/compute checks on every response including excluded samples, the complete execution allowance, and the original request and first-job acceptance thresholds. The saved startup counters must independently reproduce each mandatory exclusion. A new protocol must explicitly declare `startup_swapin_handling: exclude-pair`; an undeclared protocol keeps the old abort rule.

Twenty-six driver tests preserve the nineteen earlier checks and exercise legacy abort, whole-pair exclusion, invalid declarations, counter anomalies, swap-outs, physical-cap failures, thermal failures, and cleanup. Eight adapter checks retain the fixed cohort and ensure a contaminated pair cannot be silently included again. These are benchmark-method checks, not an inference speedup result or final implementation qualification.

Revisit this decision if a startup swap-in predicts a resource hazard that the retained hard guards fail to detect, or if independent validation shows the exclusion rule admits contaminated timing. Correct the relevant guard or return to aborting; never relax a capacity or numerical requirement to obtain a favorable result.

Evidence:

- [[sources/runs/2026/09/2026-09-09-optimization-public-planner-512-resource-stop-and-first-work-failure]]
- [[sources/runs/2026/09/2026-09-09-optimization-public-planner-repeat-startup-swapin-stop]]
- [[sources/runs/2026/09/2026-09-09-optimization-explicit-startup-swapin-method-and-full-freeze]]
- [[records/plan/whole-engine-optimization-2026-09-04]]
