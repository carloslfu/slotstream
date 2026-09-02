---
type: claim
id: 01m1hhwpa9e6h7te9vpqfjpv2s
created: 2026-09-02T17:15:28.457232+00:00
updated: 2026-09-02T17:15:28.457232+00:00
summary: Prompt plus completion is capped at 32,768 tokens per request
basis: derived
gate: Tools/planner_gates.sh
needle: 32,768
supported_by:
- '[[records/measurements/adversarial-review-of-the-serving-layer-2026-08-29-0-1-5]]'
- '[[records/measurements/resolution-bound-expert-load-staging-2026-08-31]]'
surfaces: README.md, docs/API.md, llms.txt
title: Prompt plus completion is capped at 32,768 tokens per request
status: current
---

The cap is enforced code (a 400 past it, `--max-context` can only lower it) and the prefill schedule keeps every pass inside the measured 4096 × 8016 query-by-key product. No record here holds a `context-check` at 32,768 tokens: every peak-memory measurement used prompts of at most 7,960 tokens, so the surfaces' wording "the largest context measured so far" is not backed by a run at that length. A `context-check --tokens 32768` captured under `sources/runs/` is what would make this claim measured.
