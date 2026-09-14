---
type: measurement
id: 01m2e00j775vxgkc862wpyqwx1
created: 2026-09-13T18:20:59.495333+00:00
updated: 2026-09-13T18:20:59.495333+00:00
summary: 'Draft head on at 131,072 tokens: inside its 18 GB plan with a reply identical to the draft-off run; the draft-head limit stays at the model limit'
date: 2026-09-13
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: One preregistered draft-head rung on the synthetic filler prompt; parity is greedy output identity, not acceptance on real text.
order: '1420'
runs: '[[sources/runs/2026/09/2026-09-13-context-draft-head-131072]]'
title: 'Automatic context window: the draft head at 131,072 tokens'
status: measured
---
With the draft head on, the 131,072-token window completed the same 130,944-token prompt and 128-token reply as the draft-off rung inside an 18 GB plan ([[sources/runs/2026/09/2026-09-13-context-draft-head-131072]]). This is the native evidence behind keeping the draft-head limit at the model limit for the automatic windows above 65,536 ([[records/measurements/automatic-context-window-plans-2026-09-13]]).

**Parity.** The greedy reply matched the draft-off reply from [[records/measurements/automatic-context-window-131072-read-2026-09-13]] token for token. The head drafted 85 tokens and all 85 were accepted over 43 verify passes. The filler's continuation is highly predictable, so that acceptance rate does not describe real text.

**Memory.** The sampled physical footprint peaked at 16.44 GB against the ledger's 17.00 GB expected peak and the 18 GB target, with no abort, pressure cancellation or runtime error. Global swap-ins rose by 229 pages, recorded as diagnostic under [[records/decisions/global-paging-is-diagnostic]].

**Limits.** One window, one small target and a head forced below its floor, so the decode lookahead was off. Reading the prompt took 40.3 minutes. No 262,144-token run exists with or without the draft head.
