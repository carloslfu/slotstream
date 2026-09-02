---
type: design
meta-type: conclusion
id: 01m1hhwn85gtgvcxqh4zbh8pvj
created: 2026-09-02T17:15:27.365173+00:00
updated: 2026-09-02T17:15:27.365173+00:00
summary: '4.4 Server: Ollama-compatible surface (v0)'
date: 2026-08-28
doc: plan
level: '3'
order: '130'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: '4.4 Server: Ollama-compatible surface (v0)'
---

- `/api/version`, `/api/tags`, `/api/show`, `/api/ps`, `/api/chat` (streaming NDJSON,
  `think` toggle → chat-template thinking switch, `tools` passthrough into template),
  `/api/generate`, `/api/pull` (streamed progress), `/api/delete`; `/api/embed` → clean
  400 (not an embedder); `/api/create` → 501 with message.
- OpenAI: `/v1/chat/completions` (incl. SSE streaming), `/v1/models`, `/v1/completions`.

**What actually shipped is narrower than this section**, which is the v0 design and
not a description of the server. `/v1/completions`, `/api/delete`, `/api/pull` progress,
and `tools` passthrough do not exist; `keep_alive` is accepted and ignored because the
model never unloads; and of the Ollama options only `temperature`, `top_p`, `top_k`,
`min_p`, `presence_penalty`, `seed`, `num_predict`, and `stop` are honoured — `num_ctx`
and the rest are refused rather than silently dropped. `docs/API.md` is the description
of the shipped surface; read it, not this list.
- Semantics matched to Ollama: `keep_alive` (default 5m; model unload = free slots+KV,
  keep fd/manifest), options mapping (`num_ctx`, `temperature`, `top_p`, `top_k`,
  `min_p`, `presence_penalty`, `seed`, `num_predict`, `stop`), request cancellation on
  client disconnect, single-flight generation with FIFO queue (continuous batching is a
  non-goal in v0).
- Chat template: real Jinja rendering of the shipped `chat_template` via
  swift-transformers' Jinja engine. Recommended defaults per model card: instruct
  t=0.7/top_p=0.8/top_k=20/presence=1.5; thinking t=1.0/top_p=0.95.
- Port: 11434 if free, else 11435 (warn), `--port`/`SLOTSTREAM_HOST` override. Model name
  exposed as `qwen3.8-flash-next:4bit` (+`:mixed-4-8`, `:compact-3bit` variants later).
