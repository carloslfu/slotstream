---
type: measurement
id: 01m2dvs3g9mb8bx03wa96ba11t
created: 2026-09-13T17:07:00.745357+00:00
updated: 2026-09-13T17:07:00.745357+00:00
summary: Auto takes 32,768 tokens through 32 GB, 65,536 from 36 GB, 131,072 at 64 GB and 262,144 from 96 GB; weights-free checks pass
date: 2026-09-13
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Weights-free checks and simulated plans; no model process and no timing. Costs are planner estimates for 2,000 prompt tokens and a 400-token reply.
order: '1400'
runs: '[[sources/runs/2026/09/2026-09-13-automatic-context-window-tier-plans]]'
title: 'Automatic context window: plans by Mac memory'
status: measured
---
Weights-free checks and simulated `doctor` plans for the candidate that picks the context window for each Mac ([[records/plan/configurable-context-window-2026-09-06]]). Carlos asked on 2026-09-13 for auto to choose the best window for every memory tier and for `--max-context` to accept the model's 262,144 tokens, using best guesses from what the development Mac can measure. No model process ran for these plans, and nothing here is timed.

**Rule.** Auto takes the largest of 32,768, 65,536, 131,072 and 262,144 tokens whose plan keeps speculative decoding and the decode lookahead as the 32,768-token plan has them, retains one complete conversation of that length, and adds at most 10% to the planner's estimated time for 2,000 prompt tokens and a 400-token reply. Tiers are judged on RAM and Metal working set. Live availability is applied at startup, which lowers the window rather than drop the draft head. Each candidate's automatic ceiling rises by that window's own charge.

**Plans.** Candidate `3626ba67` built from `dfc9b36`, draft file available, availability equal to RAM, working set 75% of RAM:

| Simulated RAM | Window | Target | Draft head | Experts per layer | Estimated request cost | Target and experts at 32,768 | Next window |
|---|---|---|---|---|---|---|---|
| 16 GB | 32,768 | 10.0 GB | off | 20 | +0.0% | same | 65,536: does not fit with one complete conversation retained |
| 18 GB | 32,768 | 11.5 GB | off | 28 | +0.0% | same | 65,536: does not fit with one complete conversation retained |
| 24 GB | 32,768 | 16.0 GB | off | 54 | +0.0% | same | 65,536: adds 17.7% to a typical request, above the 10% limit |
| 32 GB | 32,768 | 22.0 GB | on | 74 | +0.0% | same | 65,536: turns speculative decoding off |
| 36 GB | 65,536 | 25.0 GB | on | 75 | +8.9% | 25.0 GB, 96 | 131,072: turns speculative decoding off |
| 48 GB | 65,536 | 33.6 GB | on | 140 | +2.3% | 33.6 GB, 161 | 131,072: adds 15.5% to a typical request, above the 10% limit |
| 64 GB | 131,072 | 43.2 GB | on | 149 | +0.0% | 34.6 GB, 149 | 262,144: adds 17.8% to a typical request, above the 10% limit |
| 96, 128 and 192 GB | 262,144 | 54.7 GB | on | 149 | +0.0% | 34.6 GB, 149 | model limit |

The 8 GB simulation is refused, as before. Simulations at 40, 56, 72 and 80 GB, which match no current Mac, pick 65,536, 131,072, 262,144 and 262,144 tokens.

**This Mac.** The development Mac reads 51.5 GB of RAM and a 40.2 GB working set. Auto picks 65,536 tokens at a 36.1 GB target with 158 experts per layer. Larger candidates: 65,536 chosen, adds 1.2% to a typical request; 131,072 rejected, adds 10.4% to a typical request, above the 10% limit; 262,144 rejected, turns speculative decoding off.

**Checks.** On candidate `3626ba67`, T0 passed 38 of 38 checks and the planner gates passed 90 of 90, including the automatic section: each tier's window, quiet and busy starts, fixed caches and explicit windows. The development build of the same source bytes also passed the policy proxy with 964,209 Swift assertions, including case C23 for the automatic window, 130 of 130 context gates and all nine windows of the explicit-window matrix. The frozen default allocation stays byte-identical at an explicit 32,768 tokens on all four fixture tiers.

**Limits.** These are allocation plans from M5 Pro-based estimates, not timed tiers. A Mac's marketed memory, Metal limit and live availability can differ from the decimal-GB inputs. The window charges are exact ledger arithmetic, but native capacity runs existed only through 65,536 tokens before this change. The representative request does not price long-prompt waits, which have no calibrated estimate above 128,256 tokens.
