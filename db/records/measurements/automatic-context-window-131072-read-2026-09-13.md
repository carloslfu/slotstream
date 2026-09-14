---
type: measurement
id: 01m2dxrk49esw17671h5s7r802
created: 2026-09-13T17:41:41.129023+00:00
updated: 2026-09-13T17:41:41.129023+00:00
summary: 'A 131,072-token window completed inside its 16 GB plan: 14.80 GB sampled peak against 15.00 planned, 38.1-minute read; estimates run optimistic past 65,536'
date: 2026-09-13
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: One cold text rung with the draft head and vision off on a synthetic filler prompt; not the frozen campaign and not a clean timing interval.
order: '1410'
runs: '[[sources/runs/2026/09/2026-09-13-context-capacity-131072-cold]]'
title: 'Automatic context window: a 131,072-token read inside its plan'
status: measured
---
The largest window the development Mac could hold on 2026-09-13 completed its whole prompt and reply inside the planner's memory ledger ([[sources/runs/2026/09/2026-09-13-context-capacity-131072-cold]]). It is native evidence for the 131,072-token automatic window of 64 GB Macs ([[records/measurements/automatic-context-window-plans-2026-09-13]]), taken at a much smaller target than those Macs use.

**Capacity.** A 130,944-token synthetic prompt and a required 128-token reply filled the window at a 16 GB target, with the draft head, vision and prefix retention off. The sampled physical footprint peaked at 14.80 GB against the ledger's 15.00 GB expected peak. The run had no abort, pressure cancellation or runtime error. The frozen driver marked it failed because the Mac's global swap-in counter rose by 200 pages; under [[records/decisions/global-paging-is-diagnostic]] that is recorded, not a capacity failure.

**Reading time.** The prompt took 38.1 minutes at 57.3 tok/s overall. Passes of 256 tokens slowed from 173 tok/s early in the prompt to 39 tok/s past 115,000 tokens, and the 128-token passes after 128,256 averaged 28.7 tok/s. The planner's anchors ignore position. For this schedule they estimate 6.4 minutes to 32,768 tokens, where 4.3 were measured, 12.9 to 65,536, where 12.5 were measured, and 25.1 for the 256-token part to 128,256, where 36.5 were measured.

**Anchor decision.** A 128-token anchor was not added, although a preregistered rule allowed one. The anchor family is measured on an 8,016-token acceptance prompt at a matched cache and changes only with a complete envelope, and this synthetic filler read short-context 256-token passes at twice that family's rate. Waits above 128,256 tokens stay uncalibrated, and the public guides quote this run's 38 minutes as a measured reference instead.

**Limits.** One cold text rung at one small target on one busy Mac, not the frozen campaign. Larger targets use larger early passes and a bigger cache, so this reading time does not predict a 64 GB Mac. No 262,144-token native run exists: every target from 18 to 24 GB was refused on this Mac at the time. The draft head at this window is recorded separately.
