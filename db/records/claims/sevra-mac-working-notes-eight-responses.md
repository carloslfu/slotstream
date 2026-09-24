---
type: claim
id: 01m311vkqqpk9mtwestw110r0m
created: 2026-09-21T03:58:48.567100+00:00
updated: 2026-09-21T03:58:48.567100+00:00
summary: Sevra keeps working notes in memory for the eight most recent responses
basis: derived
gate: sevra-mac-checks --response-details keeps notes for eight runs and drops the oldest at the ninth
needle: for the eight most recent responses
surfaces: docs/SEVRA-MAC.md
title: Sevra keeps working notes in memory for the eight most recent responses
status: current
---
`SevraRuntime.remember` in `apps/macos/Runtime/Runtime.swift` keeps a run's working notes, one entry per thought, within 64 KiB per run, for at most eight runs, dropping the oldest first. `sevra-mac-checks --response-details` runs nine thinking turns and requires the first run's notes gone and the other eight kept, each exact. Under [[records/design/measured-operating-policies]] this is a privacy and memory bound, not a measured optimum: working notes are never written to disk, so the bound limits how much reasoning text stays in process memory while Sevra is open. Revise it if people ask for older notes and the memory cost is measured. Contract: [[records/design/sevra-spec/runtime-contract]]. Evidence: [[sources/runs/2026/09/2026-09-20-sevra-response-details]].
