---
type: measurement
id: 01m1hhwkp2fas7bx95hejrdcr0
created: 2026-09-02T17:15:25.762457+00:00
updated: 2026-09-02T17:15:25.762457+00:00
summary: Ollama API surface
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '180'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Ollama API surface
status: measured
---

`Tools/api_test.sh` (raw-socket transport; this sandbox proxies curl/urllib —
external clients on a normal machine are unaffected): `/api/version`, `/api/tags`,
`/api/chat` non-streaming + NDJSON streaming, `/api/generate`,
`/v1/chat/completions` non-streaming + SSE with `[DONE]`, `/api/embed` clean
reject — **all pass**. Instruction following through the whole stack verified
("Reply with exactly: SLOTSTREAM OK" → `SLOTSTREAM OK`; "2+2" → `4`).

Engine code: ~2,300 lines of Swift (`Sources/`), single binary + colocated
metallib via `make build`.
