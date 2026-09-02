---
type: plan
meta-type: operational
id: 01m1hhwnnym6mvegn9xmrwgsa2
created: 2026-09-02T17:15:27.806258+00:00
updated: 2026-09-02T17:15:27.806258+00:00
summary: M6 — Server (2–3 d)
date: 2026-08-28
doc: plan
kind: milestone
level: '3'
order: '260'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: M6 — Server (2–3 d)
---
Hummingbird app per §4.4; NDJSON/SSE streaming; template rendering incl. `think` and
`tools`; keep_alive lifecycle; cancellation; queueing.
**Exit:** Open WebUI, one editor client (Zed/Continue via OpenAI path), and raw `curl`
scripts (incl. `ollama` CLI pointed via `OLLAMA_HOST`) all work: list, chat, stream,
cancel, unload.
