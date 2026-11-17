---
type: run
id: 01m7fzpy6mhwrdt3jtbbn2aaqx
created: 2026-11-15T16:12:42.068857292+00:00
updated: 2026-11-15T16:13:04.574598906+00:00
summary: 'PR #143 prefill-guard usage sequence at ctx138240: db0f6c8c, 53f3fa58 and 200fb398'
binary: db0f6c8c 16a8b0fa48a32485d1d2acfc24b6dda5f08ae49ced6cd630eed6d46e4226359a; 53f3fa58 034dc881e210fd9a43f40a40546892fccbae90a40b2cac52bfbe3eb4547e20fd; 200fb398 b028311176b88c8b85acbc515ba1037bd0c5c35c066f4a623eea34351a2cde61
captured_at: 2026-11-15
command: Exact command per run in archived */command.txt; driver resume_all_20261115.sh
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb-three-copies]]'
title: 'PR #143 prefill-guard usage sequence at ctx138240: db0f6c8c, 53f3fa58 and 200fb398'
tool: External usage-sequence harness (archived study/harness.py)
---
[2026-11-15-pr143-guard-usage.tar.xz](2026-11-15-pr143-guard-usage.tar.xz) preserves 466 evidence files. SHA-256 `d81f04c10d8f49ea909a18ed5dcf9fe9c76b6637f77428d3fc227e89b2d8e491`. Every member was read back and compared with its input. Model weights, executables, prefix-cache state and the cleanup script and its logs are excluded. The user directory in paths is replaced with `/Users/USER`; nothing else is rewritten.

Three release builds ran the same usage sequence one after another: `db0f6c8c` (the wired limit on base `981ce2dd`, with the old prefill guard; SHA-256 `16a8b0fa48a32485d1d2acfc24b6dda5f08ae49ced6cd630eed6d46e4226359a`), `53f3fa58` (adds both sequence-charging fixes; SHA-256 `034dc881e210fd9a43f40a40546892fccbae90a40b2cac52bfbe3eb4547e20fd`) and `200fb398` (adds BF16 attention pricing; SHA-256 `b028311176b88c8b85acbc515ba1037bd0c5c35c066f4a623eea34351a2cde61`). `resume_all_20261115.sh` is the driver and `resume-20261115.log` has one result line per run. The driver also installed an oMLX release before the runs and ran two calibrations of another project after them; those steps are not part of this evidence. Each run directory holds `command.txt` (the exact command), `run.log`, a 60 s `vm_stat`/`sysctl vm.swapusage`/`footprint` sampler in `samples/`, and the harness output in `study/`: the harness and helper scripts, the protocol, model and mirror verification, and in `usage-ctx138240/` the manifest with the server command, per-phase timings, peaks and swap counter deltas, every request and response body, the server logs and 0.5 s memory-pressure samples.

The harness is an external usage-sequence tool. It starts `slotstream serve --memory-gb 27 --max-context 138240 --mtp on --vision on` with two `--mirror` copies, a disk prefix cache and `SLOTSTREAM_PREFILL_CHUNK=256`, sends one image request, and then runs one main conversation from 100027 tokens, appending about 4096 tokens per turn up to 124878, with two side conversations, one side follow-up and one title request interleaved. The last main turn (126986 tokens) asks for a long reply; a fresh process then restores that turn from disk and replays it.

`usage-db0f6c8-interrupted-20261114` started on 2026-11-14 and was stopped by the operator during its first prefill, before any response; it has no result and is kept for completeness. `usage-db0f6c8` ends with an HTTP 503 at its third main turn; `turn-3-error.json` is the server's refusal. The other two runs complete every phase.
