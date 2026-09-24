---
type: claim
id: 01m2q4d63jzt8gjvt7wf4g5j1x
created: 2026-09-17T07:30:57.266639+00:00
updated: 2026-09-23T17:54:18.617026+00:00
summary: Sevra reads folders of up to 2,000 files
basis: derived
gate: sevra-mac-checks pins the value in --basics and refuses a 2,001-file folder in its audit checks
needle: up to 2,000 files
note: Replaced on September 23 by live folder navigation without a file-count acceptance cap; historical policy and evidence retained.
surfaces: docs/SEVRA-MAC.md
title: Sevra reads folders of up to 2,000 files
status: withdrawn
---
`SourceLimits.files` in `apps/macos/Runtime/Sources.swift` owns the value. A folder with more files, or with more than 10,000 visible entries, is refused whole instead of being listed in part. `sevra-mac-checks --basics` pins the value, and the audit check refuses a folder of 2,001 files repeatedly without leaking descriptors. Under [[records/design/measured-operating-policies]] this is a safety bound on the inventory made when a folder is attached. It is not a measured optimum. Revise it with inventory and search timings from real folders. Contract: [[records/design/sevra-spec/runtime-contract]]. Evidence: [[sources/runs/2026/09/2026-09-17-sevra-mac-basics]].
