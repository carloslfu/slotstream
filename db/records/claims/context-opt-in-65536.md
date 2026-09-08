---
type: claim
id: 01m1t5edz7vmdf8wqr1wftpn9t
created: 2026-09-06T01:31:08.135324+00:00
updated: 2026-09-08T22:35:06.291166+00:00
summary: Opt-in served context of 65536 tokens
basis: derived
gate: Tools/planner_gates.sh and Tools/openai_tools_gate.py
needle: '65536'
supported_by: '[[records/measurements/hermes-context-and-openai-integration-2026-09-05]]'
surfaces: docs/API.md, docs/CLI.md, docs/CLIENTS.md, docs/HERMES.md, llms.txt, docs/ENGINEERING.md, docs/DOWNLOAD-FORMAT.md, docs/HERMES-NOTES.md
title: Opt-in served context of 65536 tokens
status: current
---
The explicit served-window selector is enforced by ContextPolicy and reported by both discovery endpoints. The ordinary window remains unchanged. The measurement distinguishes this policy and bounded text capacity from answer quality or the model training window.
