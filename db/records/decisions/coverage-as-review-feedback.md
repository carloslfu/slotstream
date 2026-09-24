---
type: decision
meta-type: conclusion
id: 01m32kydhnv4bj1d381z467m7k
created: 2026-09-21T18:34:09.333383+00:00
updated: 2026-09-21T18:34:09.333383+00:00
summary: Coverage as review feedback
decided_on: 2026-09-21
reversible_if: A reliable narrowly scoped coverage gate is justified by specific risk and catches useful regressions without excluding relevant test evidence.
title: Coverage as review feedback
status: standing
---
# Coverage as review feedback

Coverage percentages are advisory. Keep the instrumented tests and coverage
collection required: compilation errors, failed checks, missing reports and
invalid reports must fail CI. Do not use job-wide continue-on-error or suppress
collector failures.

The retained per-file snapshot helps reviewers locate changes; it is not a
minimum quality target. Report decreases and new files visibly in CI logs and
the job summary. Do not lower or refresh the snapshot merely to make a run
pass. Existing correctness and release checks remain required.

The triggering [CI run](https://github.com/carloslfu/slotstream/actions/runs/35620540703)
failed its coverage comparison after the adaptive-memory change. The measured
catalogue and transport fixtures omit the separate context-proxy, CLI and
real-model suites. That measurement gap does not prove that every uncovered
branch is adequately tested. Review the actual behavior and add meaningful
checks for any gaps before accepting a change.

Memory budgets and recovery, cache integrity, cancellation, download
verification and public API compatibility deserve explicit boundary and error
checks. Regression tests should fail when their corresponding defect is
reintroduced. Add tests for behavior, not just to execute lines.

The adaptive-memory review retained the existing policy checks and added direct
budget cases for malformed device and target values, unknown or invalid
availability, and a target below the required allocation. The context-policy
runner remains outside the LCOV measurement; the report says so explicitly.

Reconsider a narrow numerical gate only where measurement is reliable, the
scope reflects a specific risk, and maintaining the gate demonstrably catches
useful regressions. No blanket historical-percentage ratchet is required.

This implements Carlos's request to use engineering judgment to improve the
coverage policy. [Google's guidance](https://testing.googleblog.com/2020/08/code-coverage-best-practices.html)
and [Martin Fowler's discussion](https://martinfowler.com/bliki/TestCoverage.html)
inform the decision; the selected policy is specific to this repository.
