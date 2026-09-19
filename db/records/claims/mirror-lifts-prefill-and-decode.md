---
type: claim
id: 01m2s5k2vmpqk7hrn3wvs1yevw
created: 2026-09-18T06:25:00.000000+00:00
updated: 2026-09-18T06:40:00.000000+00:00
summary: A mirror over two disks raises prefill reads from 3.2 to 4.4 GB/s and decode from 6.11 to 7.35 tok/s
basis: measured
gate: none; only re-running the paired A/B in the supporting measurement would catch this drifting
needle: raises prefill from 3.2 to 4.4 GB/s and decode from 6.11 to 7.35 tok/s
supported_by:
- '[[records/measurements/mirror-reads-across-two-disks-2026-09-18]]'
surfaces: docs/CLI.md, CHANGELOG.md
title: A mirror raises prefill to 4.4 GB/s and decode to 7.35 tok/s
status: current
---
Medians of three paired rounds on one machine, same prompt, 200 greedy tokens per
run, `--experts-per-layer 118`. Both figures are ratios against the same runs on
the external disk alone, not against a different configuration: single 6.11 tok/s
and 2.22 GB/s of decode reads, mirrored 7.35 tok/s and 3.08 GB/s. The prefill pair
is that phase's own read rate, and it is higher than decode's because prefill
reads all 6,539 records of a pass with nothing between them, so its queues stay
deep, while decode is partly latency-bound.

The same two numbers appear in the `--mirror` help text in
`Sources/slotstream-cli/main.swift`. Source files are not claim surfaces, so the
gate does not see that copy; a change here has to be carried there by hand.
