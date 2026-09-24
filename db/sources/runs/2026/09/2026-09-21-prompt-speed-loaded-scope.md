---
type: run
id: 01m32eptwsy5adwmxf39tw9thw
created: 2026-09-21T17:02:37.977162+00:00
updated: 2026-09-21T17:09:12.854877+00:00
summary: 'Loaded-engine read-scope timing: three eligible paired rounds'
binary: SHA-256 identities and exact source archives in experiments.tar.gz
captured_at: 2026-09-21
command: Archived commands and drivers; see body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Loaded-engine read-scope timing: three eligible paired rounds'
tool: Slotstream native diagnostics and paired Python harness
---
Raw bytes: [experiment archive](../../../artifacts/prompt-speed-2026-09-21/experiments.tar.gz) and [verified member hashes](../../../artifacts/prompt-speed-2026-09-21/experiments-manifest.json). The archive was captured and reopened to check every member before this record was authored. It contains commands, inputs, output, stderr, unsuccessful attempts, build identities and reconstructible source archives; it excludes executables and model weights.

Command: `slotstream optimization-state-check --variant prompt-scopes-bench --model <verified Qwen3.8-Flash-Next directory> --json`, using `scope-loaded-bin` and its archived source/identity.

A separately defined follow-up experiment uses one loaded floor-sized engine, two discarded warmup arms, then five alternating pairs. Prefix reuse is disabled. The same 8195-token inventory prompt, 256-token compute passes, 1024-row expert tile, compact frontier and greedy single output token are used throughout. Per-request swap counters exclude contaminated intervals; no compiler or other model ran alongside this benchmark. The predeclared decision requires at least three clean pairs, median speedup of at least 1.05, identical output and compute shapes, fewer expert read bytes, and process peaks under 10 GB.

`scope-loaded.json` passes all 37 checks. Rounds 1, 2 and 3 qualify; rounds 0 and 4 are discarded for timing because at least one arm paged. The median eligible ratio is 1.1791871788763149, equivalent to about 15.2% less prefill time. Read bytes are 104581324800 versus 58511462400 per prompt. These are measurements of this loaded-engine workload on this M5 Pro, not a cold-start, whole-response, all-hardware or universal long-context speed claim.
