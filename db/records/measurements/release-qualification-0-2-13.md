---
type: measurement
id: 01m26pdqnj22mvw0gr3c1zq9pb
created: 2026-09-10T22:18:44.274063+00:00
updated: 2026-09-10T22:18:44.274063+00:00
summary: Public v0.2.13 release qualification and installed-artifact acceptance
date: 2026-09-10
doc: measurements
level: '3'
machines: '[[records/machines/github-actions-macos-26]], [[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1130'
runs: '[[sources/runs/2026/09/2026-09-10-release-0-2-13-harness-correction]]'
title: v0.2.13 release qualification
status: analysis
---
**Status: v0.2.13 release preparation; public publication and local artifact acceptance are pending.**

This release carries the completed unified optimization campaign and the
intervening public integration/documentation work. The preparation history,
clean-build correction, restored serving/prefix checks and scoped coverage
review are preserved in [[records/measurements/release-qualification-0-2-12]].
The v0.2.12 tag failed before publication and remains unchanged.

The correction adds the planner-test dependency to the isolated static
entry-point fixture and verifies that its failure stops the pipeline before
native checks. All 22 entry-point tests and the planner helper tests pass
locally. Both CI and release workflows now execute these checks before the
native build, while retaining the complete later static gate.

The complete local static invocation against the older installed 0.2.11
source-qualified executable passed its Python, runtime, pull and transport
checks, including sustained memory. Its single planner failure concerns the
new large-machine help wording absent from that old executable; it is not
counted as a passing current-release gate. The separate installer suite passed.
Current-source CI and full public-artifact acceptance remain required.

The only compiled-source change after the passing instrumented candidate is
the version string from 0.2.12 to 0.2.13. Inference algorithms, tuning constants,
context limits and the original model acceptance workload remain unchanged.
The public archive must pass checksum and signed provenance verification,
match its source identity, and pass the original full local model battery and
installed-release API checks. A prior installation is retained for rollback.

Evidence: [[sources/runs/2026/09/2026-09-10-release-0-2-13-harness-correction]].
Performance remains in [[records/measurements/optimization-final-composition-2026-09-09]]
and [[records/measurements/user-server-throughput-2026-09-10]]. These comparisons
are between selected/reference paths within the same build, not a direct A/B
against the previous public release. Sustained decode was flat or slightly
slower in its measured profiles; this release makes no universal TPS claim.
