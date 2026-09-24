---
type: decision
id: 01m37pegxjfkqsnn30bmrr8p8y
created: 2026-09-23T17:54:06.386910+00:00
updated: 2026-09-23T18:14:44.276641+00:00
summary: Live folder access with bounded navigation, reliable search cursors and fresh-read edit checks
decided_on: 2026-09-23
evidence: '[[records/design/sevra-spec/runtime-contract]]'
reversible_if: Revise operation, cache and cursor bounds when real corpus timings, resource use or model-round costs justify a different tradeoff.
title: Live folder navigation with bounded native cursors
status: standing
---
# Live folder navigation with bounded native cursors

Folder access is a root-scoped grant, not a prerequisite whole-tree inventory. The previous all-or-nothing limit prevented ordinary Documents and project folders from attaching and left the assistant with no source tools. The directory snapshot also hid later creates and renames. Preserve scoped reads and reviewed writes while replacing that snapshot with live, on-demand navigation.

The native runtime contract owns the exact work, output, cache and descriptor bounds and their revision criteria: [[records/design/sevra-spec/runtime-contract]]. Each operation limits work and reports continuation and omitted coverage. These are development operating bounds, not optimal performance measurements. No background watcher or index is needed for correctness: fresh operations read directories, reads revalidate bytes, and continued operations reject changed identities. A future index may accelerate candidate discovery only if current files remain the authority and missed notifications cannot hide data indefinitely.

Darwin directory cookies cannot be reused in a newly opened DIR. Testing exposed repeated pages with that initial approach. The implementation instead leases native streams under a process-wide bound, evicts inactive cursors explicitly, and validates each retained ancestor. File IDs encode an attachment identity and relative path, avoiding an ever-growing metadata registry. The frame, cache and cursor bounds constrain memory independently of corpus cardinality.

The former folder-cap claim is withdrawn, with its historical evidence preserved. Permission groups, source citations, single-file scope, Incognito behavior, reviewed writes and undo remain governed by the same owner. New IDs are internal Mac-app tool handles; Slotstream's independent public engine APIs are unchanged.

Qualification and preserved failures: [[sources/runs/2026/09/2026-09-23-sevra-live-folder-navigation]].
