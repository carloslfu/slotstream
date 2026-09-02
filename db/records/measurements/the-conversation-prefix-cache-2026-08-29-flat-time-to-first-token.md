---
type: measurement
id: 01m1hhwkv2m434v7xb0198fvfr
created: 2026-09-02T17:15:25.922597+00:00
updated: 2026-09-02T17:15:25.922597+00:00
summary: 'The conversation prefix cache (2026-08-29): flat time-to-first-token'
date: 2026-08-29
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '290'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'The conversation prefix cache (2026-08-29): flat time-to-first-token'
status: measured
---

Every request called `model.makeState()`, so a chat re-prefilled its whole
history every turn and paid again for tokens it had already processed. The fix
is to keep the state that produced one reply and let the next request extend it
when its prompt starts with exactly the ids that state consumed.

**What it buys.** Eight turns over HTTP against `--memory-gb 16` (77 experts per
layer), each turn adding ~155 tokens of context, temperature 0, measured as
time to the first streamed token:

| turn | prompt tokens | TTFT cached | TTFT uncached |
|---|---|---|---|
| 1 | 152 | 7.29 s | 5.68 s |
| 2 | 307 | 7.15 s | 8.96 s |
| 3 | 462 | 6.03 s | 10.16 s |
| 4 | 617 | 6.30 s | 11.65 s |
| 5 | 772 | 6.87 s | 11.05 s |
| 6 | 927 | 6.50 s | 13.99 s |
| 7 | 1082 | 6.04 s | 18.60 s |
| 8 | 1237 | **6.01 s** | **25.81 s** |
| whole conversation | | **52.2 s** | **105.9 s** |

Cached TTFT is **flat** — it does not care how long the conversation is, because
only the new tokens are prefilled. Uncached it grows linearly and is already
4.3x worse by turn 8 of a conversation that is only 1,237 tokens long. Turn 1 is
slightly *slower* cached, which is the honest cost of storing the state.

The ~6 s floor is not prefill. It is the fixed per-request cost of a cold expert
cache at this pool size; the prefix cache removes the part that scales, not the
part that does not.
