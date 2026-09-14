---
type: measurement
id: 01m2ccvsfc0eas8wnqq1eepe6f
created: 2026-09-13T03:27:05.708617+00:00
updated: 2026-09-13T03:27:05.708617+00:00
summary: 'Draft depth under prefetch: depth 3 is 1.022 inside the noise band, depths 4 and 6 lose as each verified position loads its own experts, depth 1 changes the greedy output; depth 2 stays'
date: 2026-09-12
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Exploration sweep on three prompts at 256 outputs over two rounds with per-depth protocol variants; no depth qualifies for the combination; no public claim.
order: '1290'
runs: '[[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-4]]'
title: 'Decode path serialization, round 4: draft depth 2 stays; wider verification passes cost expert reads'
status: measured
---
**Outcome: draft depth 2 stays. Deeper drafts cut forward passes but widen every verification pass, and on an SSD-streamed MoE each verified position loads its own experts; depth 1 changes the greedy output.** Reference: depth 2 with the B0 prefetch setting, each depth under a protocol variant pinning it. Paired geometric means over six pairs.

| draft depth | paired speed | pairs above 1 | forward passes | demand records per pass | seconds per pass | outputs identical to depth 2 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 1 | 0.957 | 1 of 6 | 1.310 | 0.744 | 0.800 | 0 of 6 |
| 2 (reference) | | | 96 | 163.6 | | |
| 3 | 1.022 | 4 of 6 | 0.829 | 1.254 | 1.181 | 6 of 6 |
| 4 | 0.981 | 2 of 6 | 0.755 | 1.516 | 1.351 | 6 of 6 |
| 6 | 0.877 | 0 of 6 | 0.687 | 2.069 | 1.661 | 6 of 6 |

**Why.** Every draft position is verified in the same pass, and every verified position routes to its own experts, so demand records per pass grow with the positions: 25% more at depth 3 (a third more positions), 52% at depth 4 and 107% at depth 6. Acceptance falls at the same time, 10%, 22% and 41% below depth 2, so passes shrink less than their cost grows: the two nearly cancel at depth 3 (1.022, with four pairs of six above 1, inside the exploration noise band measured in [[records/measurements/decode-path-serialization-round-2-2026-09-12]]), and depths 4 and 6 lose. For an SSD-streamed MoE, verification width is paid in reads.

**Depth 1 is not exact.** It diverged from depth 2 at the same output in both rounds of every prompt (outputs 96, 27 and 63). Under the interpretation registered before the round, a depth change alters the verification batch shape, which the engine already documents can flip greedy near-ties (`boundedDraftTail`), so depth 1 is recorded as not exact under a shape change and excluded. It was also slower, at 0.957.

**Combination rule.** No depth qualifies. Depth 3's paired mean clears 1.01, but only four of six pairs are above 1, short of the 80% the rule requires. Step 6 keeps depth 2 and the protocol's pin.

**Limits.** Three exploration prompts at 256 outputs over two rounds, on the round 3 binary at barrier period 1. No public claim.

Commands, tables, counters and hashes: [[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-4]].
