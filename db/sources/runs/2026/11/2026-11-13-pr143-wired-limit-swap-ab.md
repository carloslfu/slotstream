---
type: run
id: 01m7fcqn1fd2ybt0ydm6dndvq3
created: 2026-11-15T10:41:02.511215515+00:00
updated: 2026-11-15T10:41:14.058318373+00:00
summary: 'PR #143 wired-limit swap A/B, base 981ce2dd vs head 200fb398, ABBA at 27 GB'
binary: base d9681e021302ef0c0c3f2bf0b6cc236248f7496140d11bd68d95444ef4be2ce7; head b028311176b88c8b85acbc515ba1037bd0c5c35c066f4a623eea34351a2cde61
captured_at: 2026-11-13
command: Exact command per run in archived */command.txt; driver run_pr143_ab.sh
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb-three-copies]]'
title: 'PR #143 wired-limit swap A/B, base 981ce2dd vs head 200fb398, ABBA at 27 GB'
tool: External full-window harness (archived study/harness.py)
---
[2026-11-13-pr143-wired-limit-swap-ab.tar.xz](2026-11-13-pr143-wired-limit-swap-ab.tar.xz) preserves 158 evidence files. SHA-256 `510054a167fa4f93c5c30f4e1c2775cd0e9af91b14c8ce1ed544ecc52d8abe6a`. Every member was read back and compared with its input. Model weights, executables, prefix-cache state and the cleanup script and its logs are excluded. The user directory in paths is replaced with `/Users/USER`; nothing else is rewritten.

Two release builds ran in ABBA order: base `981ce2dd` (SHA-256 `d9681e021302ef0c0c3f2bf0b6cc236248f7496140d11bd68d95444ef4be2ce7`) and head `200fb398` (SHA-256 `b028311176b88c8b85acbc515ba1037bd0c5c35c066f4a623eea34351a2cde61`). `run_pr143_ab.sh` is the driver; `driver.log` has one result line per run. Each run directory holds `command.txt` (the exact command), `run.log`, a 60 s `vm_stat`/`sysctl vm.swapusage`/`footprint` sampler in `samples/`, and the harness output in `study/`: the harness and helper scripts it ran, the protocol, model and mirror verification, and per run `full-ctx32768/manifest.json` with the server command, phase timings, observed peaks and swap counter deltas, the request and response bodies, and the server log.

The harness is an external full-window tool. It starts `slotstream serve --memory-gb 27 --max-context 32768 --mtp on --vision on` with two `--mirror` copies, `--max-prefill-wait 90`, a disk prefix cache and `SLOTSTREAM_PREFILL_CHUNK=256`, sends one image request and then a 32736-token prompt (a fixed slotstream source text), checks an in-process reuse and a fresh-process disk restore of the same prompt, and records `vm_stat` swap counters before and after each phase. Both base runs end with `RemoteDisconnected`; their server logs end at the 15 s progress line of the long prefill without an error line. Both head runs complete all three phases. All four runs are retained.
