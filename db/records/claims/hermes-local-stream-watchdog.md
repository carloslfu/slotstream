---
type: claim
id: 01m1swa0t6jv145csdy6crphyx
created: 2026-09-05T22:51:26.406407+00:00
updated: 2026-09-05T22:51:26.406407+00:00
summary: Hermes example sets a bounded local stream watchdog
basis: derived
gate: Tools/hermes_integration_gate.py
needle: 'local_stream_stale_timeout: 1800'
supported_by: '[[records/measurements/hermes-context-and-openai-integration-2026-09-05]]'
surfaces: docs/HERMES.md
title: Hermes example sets a bounded local stream watchdog
status: current
---
This is a selected local-client timeout in seconds, not a throughput guarantee. It leaves room for the measured long prefill on the qualification machine. The guide directs users of slower hardware to adjust it from their own measurements.
