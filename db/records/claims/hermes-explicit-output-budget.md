---
type: claim
id: 01m1swa0sckv139kvazpwp7fjz
created: 2026-09-05T22:51:26.380755+00:00
updated: 2026-09-05T22:51:26.380755+00:00
summary: Hermes example reserves a 4096-token output allowance
basis: derived
gate: Tools/hermes_integration_gate.py
needle: 'max_tokens: 4096'
supported_by: '[[records/measurements/hermes-context-and-openai-integration-2026-09-05]]'
surfaces: docs/HERMES.md
title: Hermes example reserves a 4096-token output allowance
status: current
---
This is an explicit integration-profile setting for main agent output and auxiliary summaries, not a changed server default or a model-wide recommendation. The live client gate records and verifies the main request budget, complete summary termination, and subsequent recall.
