---
type: run
id: 01m2dxrjc58467v7ntmtwxn7je
created: 2026-09-13T17:41:40.356960+00:00
updated: 2026-09-13T17:41:40.356960+00:00
summary: '131,072-token window completed inside its 16 GB plan: 14.80 GB sampled peak against 15.00 planned, 38.1-minute read; the frozen driver flagged 200 global swap-ins'
binary: 3626ba6795c124fc1a0587eb017b82ff1cd449925efd8808905cc62150aee7db (candidate built from dfc9b36)
captured_at: 2026-09-13
command: python3 Tools/context_qualification.py protocol-131072.json --out .build/context-native-131072-e1 (context-check --tokens 130944 --reply-tokens 128 --memory-gb 16 --mtp off --vision off --max-prefill-wait 0 --wall-seconds 7200 --sample-footprint --json)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Context capacity: a 131,072-token cold read at a 16 GB target'
tool: Tools/context_qualification.py, slotstream context-check
---
Native capacity rung for the per-Mac automatic context window candidate, run on 2026-09-13 through the repository's own qualification driver. It is the largest window this Mac could hold at the time. `doctor` refused a 262,144-token window at every target from 18 to 24 GB: from 18 to 20 GB the largest feasible window was 215,040 to 232,448 tokens, and from 21 GB the plan exceeded reclaimable memory while a Docker VM held about 10.6 GB.

## Protocol

Frozen before the run by mirroring `Tools/context_acceptance.py bind()` for one rung and validated by `Tools/context_qualification.py`'s own checks. Protocol digest `f448fa1935618532e947af30e3458fdf973cc38caee6fe2655317a72229dbc5b`.

- Window 131,072 tokens: a 130,944-token synthetic prompt plus a required 128-token reply, the protocol's largest allowed reply.
- 16 GB total-process target, draft head off, vision off, prefix retention off, prefill wait policy disabled, 7,200 s wall ceiling.
- Candidate binary `3626ba6795c124fc1a0587eb017b82ff1cd449925efd8808905cc62150aee7db`, metallib `198488eb61359e95…`, source archive `ac5c9c2d9f74f896…`; pinned model revision `aa7c790e804bbf9d491ddb109c3d61bc4a555f7c`.
- Drivers `Tools/context_qualification.py`, `Tools/memory_gate.py` and `Tools/prefill_bench.py` are digested into the protocol.
- This is not the frozen campaign in `Tools/fixtures/context-acceptance-v1.json`, which requires 22 GB and minimum-target 262,144-token profiles and cannot omit one.

The same session preregistered, before this result, a draft-head parity run at the same window and a rule for a 128-token prefill anchor.

## Command

    python3 Tools/context_qualification.py protocol-131072.json --out .build/context-native-131072-e1

The driver verified every pinned payload with `slotstream pull --verify` (exit 0), passed its quiet preflight with 23.1 GB reclaimable and normal pressure, then ran:

    SLOTSTREAM_PREFIX_CACHE=0 slotstream context-check --tokens 130944 --reply-tokens 128 --memory-gb 16 --mtp off --vision off --model <dir> --max-prefill-wait 0 --wall-seconds 7200 --sample-footprint --json

## Result

| Observation | Value |
|---|---|
| Exit, fits, abort, verdict | 0, true, none, OK |
| Prompt and reply | 130,944 prompt tokens read, 128 reply tokens, finish `length`, configured window 131,072 |
| Plan | 30 experts per layer (1,421 slots, 3.9 GB pool), 256-token passes, ledger expected peak 14.997 GB |
| Sampled physical footprint peak | 14.804 GB over 115,675 samples at 20 ms |
| MLX peak, footprint at end, lifetime RSS | 12.408 GB, 13.309 GB, 1.313 GB |
| Prompt read | 2,286.3 s at 57.3 tok/s |
| Reply | 128 tokens in 27.4 s |
| Request | 2,313.8 s |
| Global swap | swap-ins 7,382 to 7,582, swap-outs unchanged |
| Driver verdict | failed only on global swap activity; its memory check passed |

The frozen driver fails a rung on any change in the global swap counters. Under [[records/decisions/global-paging-is-diagnostic]] that change is diagnostic for capacity acceptance. The 200 pages, 3.2 MB, cannot be attributed to this process, whose sampled footprint stayed under the ledger.

The schedule ran 501 passes of 256 tokens and 21 of 128 tokens, all within the measured query-by-key product.

## Read time by position

| Tokens read | Elapsed |
|---|---|
| 8,192 | 42 s |
| 16,384 | 1.6 min |
| 32,768 | 4.3 min |
| 49,152 | 6.8 min |
| 65,536 | 12.5 min |
| 98,304 | 24.0 min |
| 128,256 | 36.5 min |
| 130,944 | 38.1 min |

| Position (tokens) | 256-token pass rate |
|---|---|
| 0 to 16,384 | 172.7 tok/s |
| 16,384 to 32,768 | 100.2 tok/s |
| 32,768 to 49,152 | 108.4 tok/s |
| 49,152 to 65,536 | 48.4 tok/s |
| 65,536 to 81,920 | 49.5 tok/s |
| 81,920 to 98,304 | 45.4 tok/s |
| 98,304 to 114,688 | 40.6 tok/s |
| 114,688 to 128,256 | 38.9 tok/s |

The 21 passes of 128 tokens after 128,256 read 2,688 tokens in 93.8 s, 28.65 tok/s overall and 19.1 to 31.1 tok/s per pass.

## Estimates

The planner prices this schedule's 256-token part at its 85 tok/s anchor: 25.1 min against 36.5 min measured. For the same schedule it estimates 6.4 min to 32,768 tokens against 4.3 measured, and 12.9 min to 65,536 tokens against 12.5 measured. Its anchors do not depend on position, so late passes read slower than it assumes.

The preregistered rule would have added a 25 tok/s anchor for 128-token passes. It was not applied. The anchor family in `PlannerCostModel` comes from the 8,016-token acceptance prompt at a matched cache and changes only with a complete measured envelope, while this run used context-check's synthetic filler at one cache size and read its short-context 256-token passes at twice the 85 tok/s anchor. Waits above 128,256 tokens stay uncalibrated.

## Conditions

This is not a clean timing interval. Other apps were open, and a Docker VM's resident memory fell from about 10.6 GB to 1.5 GB during the run. Artifacts live under `.build/context-native-131072-e1/`, ignored by git: cell `stdout.txt` `47aa485f8de53860…`, cell `stderr.txt` `d5e2ec2d9c98d6fe…`, cell manifest `bb8fcfda307009e2…`, campaign manifest `1f17acd374afc91e…` and model verification manifest `806a80582aa29ead…`.
