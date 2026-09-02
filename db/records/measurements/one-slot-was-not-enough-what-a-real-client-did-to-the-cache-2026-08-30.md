---
type: measurement
id: 01m1hhwkvhdh98ked42vccvwtk
created: 2026-09-02T17:15:25.937735+00:00
updated: 2026-09-02T17:15:25.937735+00:00
summary: 'One slot was not enough: what a real client did to the cache (2026-08-30)'
date: 2026-08-30
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '300'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'One slot was not enough: what a real client did to the cache (2026-08-30)'
status: measured
---

The cache shipped holding **one** conversation and evicting it on any miss. That
kept peak memory provably unchanged, and it passed every synthetic test —
`prefix-check` drives a clean three-turn chat and saw reuse on every follow-up.

Then it met Open WebUI, and scored **0 hits and 7 misses** across a two-turn
chat.

The reason is not subtle once you watch the traffic: Open WebUI fires a
**title-generation request** immediately after each reply, with a completely
different prompt, and follows it with tag and follow-up-suggestion calls. With
one slot, the chat's state is evicted by the title request before the user's
next turn ever arrives. Every client that decorates a conversation this way —
titles, tags, suggestions, embeddings — defeats a single-slot cache the same
way. **A one-slot prefix cache is a cache that only works in benchmarks.**

The fix is to hold several conversations (four) against one shared token budget,
evicting least-recently-used, and to pick the *longest* matching prefix so a
follow-up resumes the deepest state available. Re-running the identical Open
WebUI chat afterwards: **1 hit**, and the five remaining misses are the
auxiliary requests, which are genuinely new prompts and now occupy their own
slots instead of destroying the chat's.

This costs what the first design avoided: several held states are additive, so
the retention ceiling is now **charged against the memory budget** rather than
being free. At a 16 GB target that is 0.9 GB, and the pool drops from 67 to 60
experts per layer. That is the honest price of the cache working at all outside
a test harness.

The lesson worth keeping: **the synthetic gate could not have found this.**
`prefix-check` drives the conversation itself, so nothing ever interleaves.
Testing against one real client changed the design.
