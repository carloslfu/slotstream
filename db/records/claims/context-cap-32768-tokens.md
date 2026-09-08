---
type: claim
id: 01m1hhwpa9e6h7te9vpqfjpv2s
created: 2026-09-02T17:15:28.457232+00:00
updated: 2026-09-08T22:35:06.272907+00:00
summary: Prompt plus completion is capped at 32,768 tokens per request
basis: derived
gate: Tools/planner_gates.sh
needle: 32,768
supported_by:
- '[[records/measurements/adversarial-review-of-the-serving-layer-2026-08-29-0-1-5]]'
- '[[records/measurements/resolution-bound-expert-load-staging-2026-08-31]]'
surfaces: docs/API.md, docs/CLIENTS.md, llms.txt, docs/ENGINEERING.md
title: Prompt plus completion defaults to 32,768 tokens per request
status: current
---
The ordinary served window remains 32,768 tokens. The explicitly requested larger window is separate; the planner and library request defaults are gated independently from the maximum. The historical cap became the preserved default during the Hermes integration work. This is an enforced/default-policy claim, not a claim that the original release measured this exact prompt length. See [[records/measurements/hermes-context-and-openai-integration-2026-09-05]] for larger-context qualification and the initial budget counterexample.