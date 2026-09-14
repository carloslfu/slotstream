---
type: claim
id: 01m1hhwpa9e6h7te9vpqfjpv2s
created: 2026-09-02T17:15:28.457232+00:00
updated: 2026-09-13T17:19:07.831327+00:00
summary: Auto keeps a 32,768-token window through 32 GB of RAM
basis: derived
gate: Tools/planner_gates.sh
needle: 32,768
supported_by:
- '[[records/measurements/adversarial-review-of-the-serving-layer-2026-08-29-0-1-5]]'
- '[[records/measurements/resolution-bound-expert-load-staging-2026-08-31]]'
surfaces: docs/API.md, docs/CLIENTS.md, llms.txt, docs/ENGINEERING.md, README.md, docs/HARDWARE.md
title: Auto keeps a 32,768-token window through 32 GB of RAM
status: current
---
32,768 tokens is the first automatic candidate and the window every plan used before 0.2.17. Auto keeps it on Macs through 32 GB of RAM, when the cache size is fixed with `--experts-per-layer` or `--pool-gb`, and whenever a larger window would turn speculative decoding off, cost more than the 10% tolerance or fail to retain a complete conversation ([[records/measurements/automatic-context-window-plans-2026-09-13]]). A fixed `--memory-gb` target still lets auto weigh larger windows inside that target. `--max-context 32768` restores the window on any Mac. This is an enforced policy claim, not a claim that the original release measured this exact prompt length. See [[records/measurements/hermes-context-and-openai-integration-2026-09-05]] for larger-context qualification and the initial budget counterexample.
