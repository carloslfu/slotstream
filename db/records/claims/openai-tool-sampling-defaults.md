---
type: claim
id: 01m1t5ee18yscjg0dfcv4b8f68
created: 2026-09-06T01:31:08.200294+00:00
updated: 2026-09-06T01:31:08.200294+00:00
summary: OpenAI tool requests reuse the native agent sampler
basis: derived
gate: Tools/openai_tools_gate.py and Tools/hermes_integration_gate.py
needle: 0.2, top_p 0.9 and presence_penalty 0
supported_by: '[[records/measurements/hermes-context-and-openai-integration-2026-09-05]]'
surfaces: docs/API.md
title: OpenAI tool requests reuse the native agent sampler
status: current
---
The OpenAI adapter chooses SampleParams.agent for tool-enabled requests. These are existing native-agent defaults applied to the newly supported wire dialect. Explicit request values override them; they are not a guarantee of tool accuracy.
