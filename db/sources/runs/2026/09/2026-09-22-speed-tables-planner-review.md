---
type: run
id: 01m356k5hh5a5098321r8h9f6a
created: 2026-09-22T18:38:32.497599+00:00
updated: 2026-09-22T18:38:32.912512+00:00
summary: Read-only installed-binary checks reproduce every automatic memory/context row; no model launch or new timing benchmark.
binary: 5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89
captured_at: 2026-09-22
command: slotstream doctor --sim-ram RAM [--max-context WINDOW] --json
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Published planner verification for the public speed tables
tool: Published slotstream doctor and exact table reconciliation
---
Read-only `doctor` output from the installed 0.2.23 executable, SHA-256 `5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89`.

[Raw capture](../../../artifacts/speed-tables-review-2026-09-22/capture.tar.gz), [per-file manifest](../../../artifacts/speed-tables-review-2026-09-22/manifest.json). Archive SHA-256: `d13c721c82b769ba7dd425880d8939b3572263fe863f9f38aac336d4b866bcdd`. Every archived entry was extracted in memory and checked against its SHA-256.

The capture contains exact commands, exits, stdout and stderr for ten automatic RAM simulations (8, 16, 18, 24, 32, 36, 48, 64, 96 and 128 decimal GB), plus explicit 32,768/65,536-token window simulations at 16, 24, 32, 36, 48 and 64 GB. All nine viable automatic plans match the documented rounded target, MTP choice and context window; the 8 GB simulation refuses as documented. The historical prefill estimates still print about 6.4 minutes at the 16 GB simulation's smaller window, about 3 minutes from 24 GB at that window, and about 8 minutes from 24 GB at the larger window.

No model loaded and no new inference time was measured. Doctor's numbers verify current planner output, not performance on the simulated hardware. The new prompt-policy and cache results are sourced from their existing qualified raw captures. Interpretation: [[records/measurements/speed-tables-review-2026-09-22]].
