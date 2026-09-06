---
type: claim
id: 01m1t5ee0srbxahva8qj2ksavt
created: 2026-09-06T01:31:08.185292+00:00
updated: 2026-09-06T01:31:08.185292+00:00
summary: Non-streamed OpenAI inference failures return HTTP 500
basis: derived
gate: Tools/openai_tools_gate.py
needle: 500 | Inference failure
supported_by: '[[records/measurements/hermes-context-and-openai-integration-2026-09-05]]'
surfaces: docs/API.md
title: Non-streamed OpenAI inference failures return HTTP 500
status: current
---
Non-streamed truncated required calls return this error status. A streaming response whose headers were already sent instead emits an SSE error without a successful finish or DONE marker. The live gate checks both cases.
