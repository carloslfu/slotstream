---
type: claim
id: 01m1t5edz7vmdf8wqr1wftpn9t
created: 2026-09-06T01:31:08.135324+00:00
updated: 2026-09-13T17:08:29.813107+00:00
summary: --max-context 65536 fixes a 65,536-token window
basis: derived
gate: Tools/planner_gates.sh and Tools/openai_tools_gate.py
needle: '65536'
supported_by: '[[records/measurements/hermes-context-and-openai-integration-2026-09-05]]'
surfaces: docs/API.md, docs/CLI.md, docs/CLIENTS.md, docs/HERMES.md, llms.txt, docs/ENGINEERING.md, docs/DOWNLOAD-FORMAT.md, docs/HERMES-NOTES.md, README.md, docs/HARDWARE.md
title: --max-context 65536 fixes a 65,536-token window
status: current
---
The explicit window selector is enforced by ContextPolicy and reported by both discovery endpoints. Hermes uses it so its configured `context_length` matches the served window on every Mac; auto may pick 65,536 tokens or more by itself from 36 GB ([[records/measurements/automatic-context-window-plans-2026-09-13]]). The measurement distinguishes this policy and bounded text capacity from answer quality or the model training window.
