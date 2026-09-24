---
type: run
id: 01m32eptsayh91srvx80452b1x
created: 2026-09-21T17:02:37.866911+00:00
updated: 2026-09-21T17:09:32.703558+00:00
summary: 'Fresh-process read-scope timing: all five pairs excluded'
binary: SHA-256 identities and exact source archives in experiments.tar.gz
captured_at: 2026-09-21
command: Archived commands and drivers; see body
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Fresh-process read-scope timing: all five pairs excluded'
tool: Slotstream native diagnostics and paired Python harness
---
Raw bytes: [experiment archive](../../../artifacts/prompt-speed-2026-09-21/experiments.tar.gz) and [verified member hashes](../../../artifacts/prompt-speed-2026-09-21/experiments-manifest.json). The archive was captured and reopened to check every member before this record was authored. It contains commands, inputs, output, stderr, unsuccessful attempts, build identities and reconstructible source archives; it excludes executables and model weights.

Five alternating pairs compared explicit 4096- and 8192-token read scopes on the same 8195-token synthetic inventory prompt. Both used 256-token compute passes, the compact frontier, a 1024-row expert workspace tile, a 10 GB CLI target, no MTP and greedy one-token output. `scope_pairs.py` records the exact invocation and real-memory preflight.

All outputs and compute shapes matched, every larger scope read fewer expert bytes, and process peaks stayed under 10 GB. However, every pair had at least one interval with increasing host swap counters. `scope-pairs-summary.json` therefore reports zero valid pairs and no median. These timings are discarded for the performance decision. They are preserved as functional and process-memory evidence only. No successful timing claim uses them.
