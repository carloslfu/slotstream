---
type: run
id: 01m2e00ht71wy4kp2cn5kxf17v
created: 2026-09-13T18:20:59.079516+00:00
updated: 2026-09-13T18:20:59.079516+00:00
summary: 'Draft head on at 131,072 tokens: complete prompt and 128-token reply inside an 18 GB plan, 16.44 GB sampled peak against 17.00 planned, reply identical to the draft-off run'
binary: 3626ba6795c124fc1a0587eb017b82ff1cd449925efd8808905cc62150aee7db (candidate built from dfc9b36)
captured_at: 2026-09-13
command: SLOTSTREAM_PREFIX_CACHE=0 slotstream context-check --tokens 130944 --reply-tokens 128 --memory-gb 18 --mtp on --vision off --max-prefill-wait 0 --wall-seconds 7200 --sample-footprint --json
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Context capacity: the draft head at a 131,072-token window'
tool: slotstream context-check, preregistered draft-head runner
---
Preregistered draft-head run at the 131,072-token window, run after the draft-off rung ([[sources/runs/2026/09/2026-09-13-context-capacity-131072-cold]]) on the same candidate and the same synthetic prompt. Its purpose was native evidence for speculative decoding beyond the formerly qualified 65,536-token draft-head limit, and greedy parity against the draft-off reply.

## Preregistration

Written before the run while the draft-off rung was still reading its prompt:

- Candidate `3626ba6795c124fc1a0587eb017b82ff1cd449925efd8808905cc62150aee7db`, model verified by the draft-off rung's `pull --verify` in the same session.
- Every `SLOTSTREAM_*` variable removed and `SLOTSTREAM_PREFIX_CACHE=0`.
- Start only after the draft-off rung exited, with no `slotstream`, `slotstream-checks`, `swift-frontend` or `swift-driver` process, normal pressure, at least 21 GB reclaimable, and a plan-only result of 131,072 tokens with the draft head on.
- Hard stops: context-check's reclaimable floor, its 7,200 s wall ceiling and an outer 7,320 s timeout.
- Pass: exit 0, fits, no abort, 130,944 prompt tokens, 128 output tokens, configured window 131,072, and output identical to the draft-off reply. A parity failure would return the draft-head limit to 65,536 before release.

## Command

    SLOTSTREAM_PREFIX_CACHE=0 slotstream context-check --tokens 130944 --reply-tokens 128 --memory-gb 18 --mtp on --vision off --model <dir> --max-prefill-wait 0 --wall-seconds 7200 --sample-footprint --json

The preflight found no competing process, pressure level 1 and 28.5 GB reclaimable. The plan resolved 131,072 tokens with the draft head on, 29 experts per layer, 256-token passes, an expected peak of 17.00 GB and the decode lookahead off, because an explicit head below its 76-per-layer floor runs without it.

## Result

| Observation | Value |
|---|---|
| Exit, fits, abort, verdict | 0, true, none, OK |
| Prompt | 130,944 tokens, identical to the draft-off prompt |
| Reply | 128 tokens, identical to the draft-off reply; finish `length` |
| Configured window | 131,072 |
| Draft head | 85 tokens drafted and 85 accepted over 43 verify passes |
| Sampled physical footprint peak | 16.437 GB against a 16.998 GB ledger peak and an 18 GB target |
| MLX peak, footprint at end, lifetime RSS | 14.122 GB, 15.420 GB, 4.419 GB |
| Prompt read | 2,415.4 s at 54.2 tok/s |
| Reply decode | 32.7 s |
| Request | 2,448.2 s |
| Global swap | swap-ins 7,582 to 7,811, swap-outs unchanged |

Every preregistered pass condition held. The 229 swap-in pages are recorded as diagnostic under [[records/decisions/global-paging-is-diagnostic]]. The schedule ran 501 passes of 256 tokens and 21 of 128 tokens, like the draft-off rung.

## Limits

The filler prompt's continuation is highly predictable, so full draft acceptance says nothing about acceptance on real text. The run covers one window at one small target, with the lookahead off. Timing is not a clean interval: other apps were open. Artifacts live under `.build/context-native-131072-e2-mtp/`, ignored by git: `stdout.txt` `af80319617990f99…`, `stderr.txt` `7143a28bd07a9eb7…`, `manifest.json` `39110e9efc109213…`, `plan.stdout.json` `30a525b80741a7d6…`.
