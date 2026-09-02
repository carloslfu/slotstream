---
type: plan
meta-type: operational
id: 01m1hhwnwwy3h6c1jape7jk273
created: 2026-09-02T17:15:28.028541+00:00
updated: 2026-09-02T17:15:28.028541+00:00
summary: N5 — Real GUI and editor clients
date: 2026-08-30
doc: plan
kind: queue-item
level: '3'
order: '330'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: N5 — Real GUI and editor clients
---

Open WebUI and one editor client (Zed or Continue via the OpenAI path) — the remaining
M6 exit criteria.

The claim that used to stand here — that the Ollama CLI and the OpenAI Python SDK were
both "proven end to end as of 0.1.5, so the wire protocol is not in doubt" — was wrong,
and it is exactly the mistake the claims discipline in `CLAUDE.md` is about: it was
asserted from this document rather than checked against the system. 0.1.8's strict
validator broke `ollama run` and `ollama show`, and no gate noticed for three releases,
because nothing here ran the real CLI. Both clients are now genuinely exercised —
`ollama list`, `ollama ps`, `ollama show`, one-shot and interactive `ollama run`, and
the OpenAI SDK's streamed and non-streamed paths — and the request shapes they send are
gated in `Tools/api_robustness.sh`. An editor client and Open WebUI remain untested.
