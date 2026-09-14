---
type: measurement
id: 01m2e5bvwg8td9t21yqrxscn0d
created: 2026-09-13T19:54:32.720848+00:00
updated: 2026-09-13T19:54:32.720848+00:00
summary: 'v0.2.17 published, installed and accepted: 25 of 25 model gates on the exact CI artifact and 31 of 31 installed-release checks'
date: 2026-09-13
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Functional acceptance under the paging-diagnostic policy; no clean-timing or throughput qualification is claimed.
order: '1430'
runs: '[[sources/runs/2026/09/2026-09-13-release-0-2-17-published-and-installed]]'
title: v0.2.17 published, installed and accepted
status: measured
---
**v0.2.17 is published, installed and functionally accepted.** It ships the model's full 262,144-token limit and the per-Mac automatic window from [[records/decisions/automatic-context-window-per-machine]]. The exact CI artifact passed all twenty-five model gates, the published archive matched that artifact with a valid attestation, the installer replaced 0.2.16 on this machine, and the installed binary passed all thirty-one end-to-end release checks. Every user application stayed open throughout.

Release: [v0.2.17](https://github.com/carloslfu/slotstream/releases/tag/v0.2.17), tagged on `d25dffff1f3f56e70ddb9f11b82e7dc1b843f041`, published 2026-09-13T19:49:26Z. Archive SHA-256 `66eb2ae95b325e75280d675fcf2afb3d61ef27db5500dea462faadef457b6042`; binary SHA-256 `1d761999c461c19237f4efa84947265c6253890ea57824ca62b7e2892e8f32aa`. The CI candidate, the re-downloaded public archive and the installed binary are byte-identical.

## What qualified

| Phase | Result |
|---|---|
| Main CI 34775403549, commit `d25dfff` | Coverage, weights-free and public-library jobs all succeeded |
| Candidate verification | Archive and binary digests recorded; 162 source files match the checkout |
| Model acceptance on the downloaded CI binary | 25 of 25 gates, 0 failures, 1,065 seconds |
| Release workflow 34778829372 | Succeeded; the public archive matches the CI artifact |
| Provenance | `gh attestation verify` confirmed the archive for `carloslfu/slotstream` |
| Installation | 0.2.16 replaced by 0.2.17, exit code 0, binary digest re-checked; 0.2.16 kept beside it |
| Installed-release end-to-end | 31 of 31 checks, 0 failures, 72 seconds |

## The first acceptance run did not count

The first run on the same artifact ended at 23 passed and 1 failed because the worktree it ran from had no mlx 0.31.1 reference environment, so vision parity could not run and the suite counted the skip as a failure. No product gate failed. The environment was linked in and the complete suite ran again on a fresh download of the same artifact, which passed all twenty-five gates. Both runs are in [[sources/runs/2026/09/2026-09-13-release-0-2-17-published-and-installed]].

## The automatic window on the public binary

At a 10 GB target with the draft head on, the installed server chose a 32,768-token window and printed the rule it applied: the largest of 32,768, 65,536, 131,072 and 262,144 tokens that keeps speculative decoding, retains one complete conversation and adds at most 10% to a typical request. This is the automatic window reaching a user through a published artifact rather than a local build.

## Limits

No clean-timing or throughput qualification is claimed; the acceptance interval shared the machine with ordinary work. The installed-release checks ran at a 32,768-token window. The windows above that rest on the 131,072-token rungs ([[records/measurements/automatic-context-window-131072-read-2026-09-13]], [[records/measurements/automatic-context-window-draft-head-131072-2026-09-13]]) and the memory ledger; 262,144 tokens has not run natively. The open items in [[records/plan/configurable-context-window-2026-09-06]] are unchanged.
