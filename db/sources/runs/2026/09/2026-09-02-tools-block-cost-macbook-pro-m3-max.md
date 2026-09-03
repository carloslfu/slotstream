---
type: run
id: 01m2xjt0a6b1m5ptz8q2k7h4j
created: 2026-09-02T22:21:19+00:00
updated: 2026-09-02T22:21:19+00:00
summary: 'Tools-block prefill cost on the pinned checkpoint: two tool schemas add 311 prompt tokens (~150 each) versus the same one-turn request without tools.'
binary: 'local release build of the tools branch, built 2026-09-02 (same build as the verify.sh run record)'
captured_at: 2026-09-02T21:55:00+00:00
command: 'paired /v1/chat/completions probes, max_tokens 1, temperature 0, identical 22-token prompt with and without a two-tool tools array'
discarded: false
machines:
- '[[records/machines/macbook-pro-m3-max-48gb]]'
title: tools-block prompt-token cost, 2026-09-02
tool: manual probes
---

The per-request cost of announcing tools, measured as the token delta of the
rendered prompt (usage.prompt_tokens), not the wall clock (which mixes in
cache state):

- without tools: prompt_tokens=22
- with 2 tools:  prompt_tokens=333
- delta: 311 tokens, ~150 per tool with schema and description

At the standing 34.6 GB auto plan of the serving Mac (~130 tok/s prefill),
that is roughly 2.4 s of extra first-turn prefill per conversation; follow-up
turns amortize it via the prefix cache.

```
without tools: prompt_tokens=22 wall=3.6s
with 2 tools:  prompt_tokens=333 wall=11.8s
tools block overhead: 311 tokens (1414% of a 1-turn prompt), +8.2s prefill wall
```
