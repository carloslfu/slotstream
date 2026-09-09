---
type: claim
id: 01m1t5edzv7gc6rez72800jqg3
created: 2026-09-06T01:31:08.155313+00:00
updated: 2026-09-09T03:17:50.243167+00:00
summary: Hermes guide sends a 4096-token output ceiling
basis: derived
gate: Tools/hermes_config_gate.py; Tools/hermes_integration_gate.py
needle: 'max_tokens: 4096'
supported_by: '[[records/measurements/hermes-configuration-hardening-2026-09-08]]'
surfaces: docs/HERMES.md
title: Hermes guide sends a 4096-token output ceiling
status: current
---
The guide applies this ceiling through named-provider extra_body for main replies and through the separate compression task extra_body for summaries. The configuration gate reads the guide and checks actual request construction. This replaces the earlier, unsupported claim that model.max_tokens configured the CLI or reserved context space. The setting limits generation; Hermes internal reservation accounting is separate.
