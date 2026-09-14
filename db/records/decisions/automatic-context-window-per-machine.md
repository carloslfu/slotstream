---
type: decision
id: 01m2e00j7vn1wjhmkjzy20hha5
created: 2026-09-13T18:20:59.515193+00:00
updated: 2026-09-13T18:20:59.515193+00:00
summary: Auto picks the largest of 32,768, 65,536, 131,072 and 262,144 tokens that keeps speculative decoding, retains one conversation and adds at most 10% to a typical request
decided_on: 2026-09-13
evidence: '[[records/measurements/automatic-context-window-plans-2026-09-13]], [[records/measurements/automatic-context-window-131072-read-2026-09-13]], [[records/measurements/automatic-context-window-draft-head-131072-2026-09-13]]'
reversible_if: A native run at an automatic window exceeds its plan or diverges with the draft head, a tier's measured typical request slows beyond the 10% tolerance, or users on large Macs report the raised automatic target crowding other apps
title: Auto chooses the context window per Mac, up to the model's 262,144 tokens
status: standing
---
Carlos asked on 2026-09-13 to open the context window to the model's limit, have auto choose the best default for every memory tier, update the hardware tables, and make best guesses from what this Mac can measure. This records the choice made on that delegation.

**Decision.** Auto mode, the default for `serve`, `run` and `doctor`, chooses the largest of 32,768, 65,536, 131,072 and 262,144 tokens whose plan, judged on the machine's RAM and Metal working set:

- keeps speculative decoding and the decode lookahead as the 32,768-token plan has them;
- retains one complete conversation of that length, so a follow-up turn reads only its new tokens;
- adds at most 10% to the planner's estimated time for a representative request of 2,000 prompt tokens and a 400-token reply.

The candidates double from the default and end at the pinned model's limit. Each candidate's automatic ceiling rises by that window's own charge, the context state above 32,768 tokens plus the retained conversation, still bounded by 70% of RAM, the working set minus 2 GB and live availability. At startup the engine takes the largest candidate up to that choice that fits the memory reclaimable now without turning off speculative decoding or the lookahead that the live 32,768-token plan keeps, and the announcement says when it lowered the window. The memory governor replans within the chosen window and cannot load or unload the draft head after startup, so a busy start lowers the window instead of dropping the head for the session.

**Units and kind.** Tokens of prompt plus reply per request. This is an operating default in the sense of [[records/design/measured-operating-policies]], built on a model-format fact, 27,648 bytes of attention state per token across 12 layers, and on the planner's safety bounds, which it never overrides. The 10% tolerance and the one-conversation rule are engineering choices, not measurements.

**Result by simulated memory.** Draft file available and no other memory in use ([[records/measurements/automatic-context-window-plans-2026-09-13]]):

| Simulated RAM | Window | Target | Next window |
|---|---|---|---|
| 16 GB | 32,768 | 10.0 GB | 65,536 can't retain a complete conversation |
| 18 GB | 32,768 | 11.5 GB | 65,536 can't retain a complete conversation |
| 24 GB | 32,768 | 16.0 GB | 65,536 adds 17.7% |
| 32 GB | 32,768 | 22.0 GB | 65,536 turns speculative decoding off |
| 36 GB | 65,536 | 25.0 GB | 131,072 turns speculative decoding off |
| 48 GB | 65,536 | 33.6 GB | 131,072 adds 15.5% |
| 64 GB | 131,072 | 43.2 GB | 262,144 adds 17.8% |
| 96, 128 and 192 GB | 262,144 | 54.7 GB | none; it is the model limit |

This Mac, with 51.5 GB of RAM and a 40.2 GB working set, picks 65,536; 131,072 would add 10.4%.

**Tradeoff.** At 36 GB the doubled window costs 21 experts per layer, 96 to 75, and 8.9% of the representative request, which the tolerance admits: a 36 GB Mac gets twice the window for an estimated reply about a tenth slower. At 48 GB it costs 2.3%. From 64 GB the window's memory comes from room the 32,768-token plan left unused. The cache and speed estimates stay the same, and the automatic target rises from 34.6 GB to 43.2 GB at 64 GB and 54.7 GB from 96 GB, which leaves less memory for other apps. Live availability still lowers both. A long prompt takes longer to read in any window, and the request-to-first-token budget still defaults to 30 minutes.

**Evidence and basis.** Derived from the planner, not timed per tier. The 32,768 and 65,536-token windows had native capacity evidence before this change. On 2026-09-13 a 131,072-token window completed a 130,944-token prompt and a 128-token reply at a 16 GB target on the development Mac, with a 14.80 GB sampled peak against the ledger's 15.00 GB ([[records/measurements/automatic-context-window-131072-read-2026-09-13]]). With the draft head on, the same prompt at the same window stayed inside an 18 GB plan, with a 16.44 GB sampled peak against 17.00 GB, and its 128-token greedy reply matched the draft-off run token for token ([[records/measurements/automatic-context-window-draft-head-131072-2026-09-13]]). No 262,144-token native run exists: that day every target from 18 to 24 GB was refused on this Mac, so the full window rests on the same ledger that bounded the measured windows. Decode and prefill estimates come from M5 Pro anchors, and the 131,072-token read took 38 minutes, about a third longer than the position-independent estimate for its later passes.

**Overrides.** `--max-context N` fixes any window from 1 to 262,144, and `--max-context 32768` restores the former plan. `--experts-per-layer` and `--pool-gb` keep the 32,768-token default. A fixed `--memory-gb` target still gets an automatic window, priced inside that target: on the development Mac a 20 GB target picks 65,536 tokens at 9.6%. `--max-ram-percent` lowers auto's share of RAM. An explicit window above 32,768 retains a complete conversation when the plan holds it, and otherwise the plan says how many tokens a follow-up reuses. Requests with images stay within 65,536 tokens.

**Gates.** `Tools/planner_gates.sh` covers each tier, quiet and busy starts, fixed caches, explicit windows and the JSON candidates. `Tools/context_proxy.swift` case C23 runs the policy against production sources. `Tools/context_gates.py` checks `Tools/fixtures/context-automatic-v1.json` and keeps the frozen default allocation byte-identical at an explicit 32,768 through `Tools/fixtures/context-default-v2.json`.
