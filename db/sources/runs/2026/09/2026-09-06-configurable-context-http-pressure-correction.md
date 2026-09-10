---
type: run
id: 01m1vyt060rzd5mqkr86x9cy73
created: 2026-09-06T18:13:36.064037+00:00
updated: 2026-09-06T18:13:36.266184+00:00
summary: Corrected expanded HTTP matrix passes 835 assertions
binary: c5ec46cb1d8c6e0af3140ff906b0c0f168419f4a193d419d17e8ba66a8ca6520
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Corrected expanded HTTP matrix passes 835 assertions
tool: Native Swift diagnostics and Python CLI gates
---
# Corrected request-pressure and terminal contracts

Build 13 passes all 835 assertions in `context-serving`. This closes the
supplied-controller pressure bypass and actual-length warm-prefix fixture
counterexample preserved in the build 11 run. Before/after-header failures,
seven response forms with queueing enabled/disabled, clean pins/cache and a
successful subsequent request pass. CLI95 and planner64 also pass.

Command: `slotstream optimization-state-check --variant context-serving --json`.
Commands for the weight-free gates retain their previous CLI/planner entry
points and identify build 13. This bounded model run overlaps a coordinated
anonymous model download: all timing and capacity interpretations are excluded.

A later source review identified separate proof gaps in aggregate main/draft
allocation credits, provisional draft spans and concurrent preparation
ownership. Those have prospective source corrections and new tests, but are
not covered by this HTTP result. Full C01-C22 acceptance remains open.

## Frozen build identity

```json
{
  "binary_sha256": "c5ec46cb1d8c6e0af3140ff906b0c0f168419f4a193d419d17e8ba66a8ca6520",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "20e895babbbc3e39a797dc11d263bd8a4bd34514a0286459fc7df97e98526516"
}
```

## context-serving-13/stdout.txt

SHA-256 `cb00c737d1399c61d29239b009ef57ec45fce21be2815a025be0b268b25d0bb4`; 96493 bytes.

````text
{
  "items" : [
    {
      "name" : "generate JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-decode\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-decode\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: clock actually advanced",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: healthy HTTP completion",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: released pins",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: clock actually advanced",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: healthy HTTP completion",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: released pins",
      "passed" : true
    },
    {
      "name" : "warm admission: seed succeeds",
      "passed" : true
    },
    {
      "name" : "warm admission: seed retained exact consumed history",
      "passed" : true
    },
    {
      "name" : "warm admission: only missing token is admitted",
      "passed" : true
    },
    {
      "name" : "warm admission: retained estimate is inside budget",
      "passed" : true
    },
    {
      "name" : "cold admission: identical total prompt refused",
      "passed" : true
    },
    {
      "name" : "cold admission: no prompt computation",
      "passed" : true
    },
    {
      "name" : "cold admission: truthful submitted token count",
      "passed" : true
    },
    {
      "name" : "cold admission: failed state absent",
      "passed" : true
    },
    {
      "name" : "client cap: typed pre-header refusal",
      "passed" : true
    },
    {
      "name" : "client cap: server remains unchanged",
      "passed" : true
    },
    {
      "name" : "client cap: later client succeeds",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=0: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=0: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "queued request expires before headers",
      "passed" : true
    },
    {
      "name" : "\/v1\/models: metadata stays responsive during occupied generation gate",
      "passed" : true
    },
    {
      "name" : "\/coding-agent\/v1\/models: metadata stays responsive during occupied generation gate",
      "passed" : true
    },
    {
      "name" : "invalid legacy mutation preserves advertised cap",
      "passed" : true
    },
    {
      "name" : "invalid legacy mutation fails without allocation",
      "passed" : true
    },
    {
      "name" : "valid legacy assignment recovers",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "context-serving",
  "passed" : true
}

````

## context-serving-13/stderr.txt

SHA-256 `5d779feaba2edfef122f98420fbad7ec3a88317e083a1acf0e4ce36a2bf40a8c`; 103 bytes.

````text
engine ready in 0.8s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]

````

## cli-13.json

SHA-256 `e2b617e8676f03bfeb559f941fdf3b269ff35b1631b573f0b2fab90fb12d4654`; 135054 bytes.

````text
{
  "passed": true,
  "assertions": [
    {
      "name": "diagnostic --reply-tokens default is explicit",
      "passed": true,
      "detail": null
    },
    {
      "name": "diagnostic --wall-seconds default is explicit",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 16 preserved",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 16 additions declared",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 16 ledger agrees",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 16 wait policy",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 16 additions declared",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 16 ledger agrees",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 16 wait policy",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 24 preserved",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 24 additions declared",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 24 ledger agrees",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 24 wait policy",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 24 additions declared",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 24 ledger agrees",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 24 wait policy",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 32 preserved",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 32 additions declared",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 32 ledger agrees",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 32 wait policy",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 32 additions declared",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 32 ledger agrees",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 32 wait policy",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 48 preserved",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 48 additions declared",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 48 ledger agrees",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 48 wait policy",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 48 additions declared",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 48 ledger agrees",
      "passed": true,
      "detail": null
    },
    {
      "name": "default 48 wait policy",
      "passed": true,
      "detail": null
    },
    {
      "name": "full schedule from 0",
      "passed": true,
      "detail": null
    },
    {
      "name": "uncalibrated schedule from 0 labeled unknown",
      "passed": true,
      "detail": null
    },
    {
      "name": "full schedule from 1",
      "passed": true,
      "detail": null
    },
    {
      "name": "uncalibrated schedule from 1 labeled unknown",
      "passed": true,
      "detail": null
    },
    {
      "name": "full schedule from 32768",
      "passed": true,
      "detail": null
    },
    {
      "name": "uncalibrated schedule from 32768 labeled unknown",
      "passed": true,
      "detail": null
    },
    {
      "name": "full schedule from 65535",
      "passed": true,
      "detail": null
    },
    {
      "name": "uncalibrated schedule from 65535 labeled unknown",
      "passed": true,
      "detail": null
    },
    {
      "name": "full schedule from 128256",
      "passed": true,
      "detail": null
    },
    {
      "name": "uncalibrated schedule from 128256 labeled unknown",
      "passed": true,
      "detail": null
    },
    {
      "name": "full schedule from 131071",
      "passed": true,
      "detail": null
    },
    {
      "name": "uncalibrated schedule from 131071 labeled unknown",
      "passed": true,
      "detail": null
    },
    {
      "name": "full schedule from 262079",
      "passed": true,
      "detail": null
    },
    {
      "name": "uncalibrated schedule from 262079 labeled unknown",
      "passed": true,
      "detail": null
    },
    {
      "name": "full schedule from 262143",
      "passed": true,
      "detail": null
    },
    {
      "name": "uncalibrated schedule from 262143 labeled unknown",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve rejects ['--max-context', '0']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve validates policy before weights ['--max-context', '0']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve rejects ['--max-context', '262145']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve validates policy before weights ['--max-context', '262145']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve rejects ['--max-prefill-wait', 'nan']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve validates policy before weights ['--max-prefill-wait', 'nan']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve rejects ['--max-prefill-wait', 'inf']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve validates policy before weights ['--max-prefill-wait', 'inf']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve rejects ['--max-prefill-wait', '-1']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve validates policy before weights ['--max-prefill-wait', '-1']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve rejects ['--max-prefill-wait', '1e300']",
      "passed": true,
      "detail": null
    },
    {
      "name": "serve validates policy before weights ['--max-prefill-wait', '1e300']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run rejects ['--max-context', '0']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run validates policy before weights ['--max-context', '0']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run rejects ['--max-context', '262145']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run validates policy before weights ['--max-context', '262145']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run rejects ['--max-prefill-wait', 'nan']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run validates policy before weights ['--max-prefill-wait', 'nan']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run rejects ['--max-prefill-wait', 'inf']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run validates policy before weights ['--max-prefill-wait', 'inf']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run rejects ['--max-prefill-wait', '-1']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run validates policy before weights ['--max-prefill-wait', '-1']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run rejects ['--max-prefill-wait', '1e300']",
      "passed": true,
      "detail": null
    },
    {
      "name": "run validates policy before weights ['--max-prefill-wait', '1e300']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor rejects ['--max-context', '0']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor validates policy before weights ['--max-context', '0']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor rejects ['--max-context', '262145']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor validates policy before weights ['--max-context', '262145']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor rejects ['--max-prefill-wait', 'nan']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor validates policy before weights ['--max-prefill-wait', 'nan']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor rejects ['--max-prefill-wait', 'inf']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor validates policy before weights ['--max-prefill-wait', 'inf']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor rejects ['--max-prefill-wait', '-1']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor validates policy before weights ['--max-prefill-wait', '-1']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor rejects ['--max-prefill-wait', '1e300']",
      "passed": true,
      "detail": null
    },
    {
      "name": "doctor validates policy before weights ['--max-prefill-wait', '1e300']",
      "passed": true,
      "detail": null
    },
    {
      "name": "diagnostic rejects before allocation ['--tokens', '262144']",
      "passed": true,
      "detail": null
    },
    {
      "name": "diagnostic rejects before allocation ['--tokens', '-1']",
      "passed": true,
      "detail": null
    },
    {
      "name": "diagnostic rejects before allocation ['--tokens', '9223372036854775807']",
      "passed": true,
      "detail": null
    },
    {
      "name": "diagnostic rejects before allocation ['--reply-tokens', '9223372036854775807']",
      "passed": true,
      "detail": null
    },
    {
      "name": "diagnostic rejects before allocation ['--reply-tokens', '0']",
      "passed": true,
      "detail": null
    },
    {
      "name": "diagnostic rejects before allocation ['--wall-seconds', 'nan']",
      "passed": true,
      "detail": null
    },
    {
      "name": "successful tool turn is deliverable",
      "passed": true,
      "detail": null
    },
    {
      "name": "failed/incomplete tool turn is inert []",
      "passed": true,
      "detail": null
    },
    {
      "name": "failed/incomplete tool turn is inert [{'error': {'code': 'insufficient_memory'}}]",
      "passed": true,
      "detail": null
    },
    {
      "name": "failed/incomplete tool turn is inert [{'error': {'code': 'prefill_deadline_exceeded'}}]",
      "passed": true,
      "detail": null
    },
    {
      "name": "failed/incomplete tool turn is inert [{'choices': [{'delta': {}, 'finish_reason': 'length'}]}, '[DONE]']",
      "passed": true,
      "detail": null
    },
    {
      "name": "failed/incomplete tool turn is inert [{'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}]",
      "passed": true,
      "detail": null
    },
    {
      "name": "failed/incomplete tool turn is inert [{'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, {'error': {'code': 'inference_error'}}, '[DONE]']",
      "passed": true,
      "detail": null
    }
  ],
  "commands": [
    {
      "args": [
        "context-check",
        "--help"
      ],
      "code": 0,
      "stdout": "OVERVIEW: Measure what reading an N-token prompt costs on this Mac: time,\ntok/s, peak memory, and whether it stayed inside the plan\n\nUSAGE: slotstream context-check <options>\n\nOPTIONS:\n  --model <model>         Model name or directory (default\n                          qwen3.8-flash-next:4bit; a name resolves to the dev\n                          checkout's models/ or ~/.slotstream/models) (default:\n                          qwen3.8-flash-next:4bit)\n  --memory-gb <memory-gb> Total memory target for the whole process, in GB.\n        The easiest knob: how much of this Mac slotstream may use. The expert\n        cache gets what remains after the conservatively charged\n        resident/runtime/context footprint and a 1 GB margin. Run `slotstream\n        doctor --memory-gb N` for the exact cache size. Default: auto -- 70% of\n        RAM, kept 2 GB under the Metal working-set limit; the chosen plan is\n        announced at startup. --experts-per-layer / --pool-gb take precedence.\n  --experts-per-layer <experts-per-layer>\n                          Expert cache size, in experts per layer (1...512).\n        The precise memory<->speed knob. Each of the 48 layers has 512 experts\n        of 2.76 MB; the cache holds N x 48 of them, so pool = N x 0.133 GB\n        (e.g. 226/layer = 30 GB, 181/layer = 24 GB, 30/layer = 4 GB) plus the\n        fixed runtime/context footprint. The pool itself is one GLOBAL cache\n        shared across layers -- N is the intuitive unit, not a per-layer quota:\n        hot layers borrow slots from cold ones. Takes precedence over\n        --memory-gb/--pool-gb. Default: auto (see `slotstream doctor`).\n  --pool-gb <pool-gb>     Raw expert-pool size in GB (1 GB \u2248 7.5\n                          experts/layer). Beats --memory-gb; loses to\n                          --experts-per-layer.\n  --max-ram-percent <max-ram-percent>\n                          Auto only: the largest share of this Mac's RAM auto\n                          may target (default 70).\n        Lower it to keep more of the machine for your other apps; auto still\n        sizes down on its own when they are actually holding memory. It cannot\n        raise the target past the point where more cache stops buying decode\n        speed (~33 GB) \u2014 use --memory-gb for that. Ignored when an explicit\n        memory knob is given.\n  --mtp <mtp>             Speculative decode with the MTP draft head: auto | on\n                          | off (default auto). (default: auto)\n        The model's own next-next-token head drafts a few tokens and the main\n        model verifies them in one batched pass. Costs a fixed 1.6 GB of\n        memory; auto enables it only when the expert cache still reaches ~120\n        experts/layer after paying, which is where the multiplier beats\n        spending the same RAM on cache. Needs the separately converted\n        mtp.safetensors next to the model (Tools/mtp_convert.py).\n  --vision <vision>       Accept images: auto | on | off (default auto).\n                          (default: auto)\n        The checkpoint carries a vision tower; auto loads it the first time a\n        request sends a picture and keeps it resident after that (+0.9 GB, on\n        top of the plan below, and refused if the machine cannot spare it at\n        that moment). off refuses images outright, which is what to use when\n        the announced peak is the number that matters.\n  --tokens <tokens>       Prompt length in tokens (rungs double from 2048 up to\n                          here with --ladder) (default: 8192)\n  --reply-tokens <reply-tokens>\n                          Required output tokens, reserved before loading\n                          (default: 16)\n  --max-prefill-wait <max-prefill-wait>\n                          Accepted request to first token budget in minutes; 0\n                          disables only time (default: 30.0)\n  --wall-seconds <wall-seconds>\n                          Independent wall-clock ceiling for each diagnostic\n                          rung (default: 7200.0)\n  --sample-footprint      Sample request physical footprint every 20 ms,\n                          separately from lifetime RSS\n  --ladder                Run 2048, 4096, ... up to --tokens, stopping at the\n                          first rung that leaves the plan\n  --min-free-gb <min-free-gb>\n                          Abort a pass when reclaimable memory falls below this\n                          (default: the planner's slack, 5% of RAM, at least\n                          1.5 GB)\n  --json                  Machine-readable output, one object per rung\n  --version               Show the version.\n  -h, --help              Show help information.\n\n",
      "stderr": ""
    },
    {
      "args": [
        "doctor",
        "--sim-ram",
        "17.2",
        "--sim-working-set",
        "11.8",
        "--sim-available",
        "12.5",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"availability_clamped\" : false,\n  \"context_feasibility\" : {\n    \"limiting_resource\" : \"implementation_limit\",\n    \"maximum_feasible_window\" : 65536,\n    \"maximum_memory_ledger\" : {\n      \"active_capacity_bytes\" : 1811939328,\n      \"additional_active_bytes\" : 905969664,\n      \"expected_peak_bytes\" : 9722740992,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 905969664,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 1769472000,\n      \"prefill_bytes\" : 332800000,\n      \"retained_capacity_bytes\" : 168791040,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"maximum_pool_slots\" : 640,\n    \"maximum_prefill_chunk\" : 256,\n    \"refusal\" : null,\n    \"requested_memory_ledger\" : {\n      \"active_capacity_bytes\" : 905969664,\n      \"additional_active_bytes\" : 0,\n      \"expected_peak_bytes\" : 8799795456,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 0,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 2477260800,\n      \"prefill_bytes\" : 332800000,\n      \"retained_capacity_bytes\" : 349996032,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"requested_window\" : 32768,\n    \"scope\" : \"memory feasibility; independent of prefill deadline\"\n  },\n  \"context_qualification\" : false,\n  \"device_available_gb\" : 12.5,\n  \"device_ram_gb\" : 17.199999999999999,\n  \"device_working_set_gb\" : 11.800000000000001,\n  \"est_prefill_s_at_max_context\" : 385.50588235294038,\n  \"est_prefill_tok_s\" : 85,\n  \"est_warm_tok_s\" : 3.7333333333333334,\n  \"expected_peak_gb\" : 8.8000000000000007,\n  \"experts_per_layer_cached\" : 19,\n  \"fully_resident\" : false,\n  \"implementation_context_limit\" : 65536,\n  \"max_context_tokens\" : 32768,\n  \"max_prefill_wait_minutes\" : 30,\n  \"max_ram_percent\" : 70,\n  \"memory_ledger\" : {\n    \"active_capacity_bytes\" : 905969664,\n    \"additional_active_bytes\" : 0,\n    \"expected_peak_bytes\" : 8799795456,\n    \"fixed_bytes\" : 5300000000,\n    \"long_context_reserve_bytes\" : 0,\n    \"mtp_resident_bytes\" : 0,\n    \"planning_margin_bytes\" : 1000000000,\n    \"pool_bytes\" : 2477260800,\n    \"prefill_bytes\" : 332800000,\n    \"retained_capacity_bytes\" : 349996032,\n    \"retained_recurrent_bytes\" : 339738624,\n    \"version\" : 1,\n    \"vision_resident_bytes\" : 0\n  },\n  \"model_context_limit\" : 262144,\n  \"mtp\" : false,\n  \"mtp_context_limit\" : 65536,\n  \"pool_gb\" : 2.5,\n  \"pool_slots\" : 896,\n  \"prefill_chunk\" : 256,\n  \"prefill_wait_scope\" : \"accepted_request_to_first_model_token\",\n  \"prefix_cache_max_tokens\" : 12659,\n  \"runtime_prefix_cache_enabled\" : true,\n  \"source\" : \"auto\",\n  \"target_gb\" : 9.8000000000000007,\n  \"vision\" : false,\n  \"vision_charged_gb\" : 0,\n  \"vision_context_limit\" : 65536,\n  \"vision_resident_gb\" : 0,\n  \"vision_resident_reserved\" : false\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "doctor",
        "--sim-ram",
        "17.2",
        "--sim-working-set",
        "11.8",
        "--sim-available",
        "12.5",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"availability_clamped\" : false,\n  \"context_feasibility\" : {\n    \"limiting_resource\" : \"implementation_limit\",\n    \"maximum_feasible_window\" : 65536,\n    \"maximum_memory_ledger\" : {\n      \"active_capacity_bytes\" : 1811939328,\n      \"additional_active_bytes\" : 905969664,\n      \"expected_peak_bytes\" : 9722740992,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 905969664,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 1769472000,\n      \"prefill_bytes\" : 332800000,\n      \"retained_capacity_bytes\" : 168791040,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"maximum_pool_slots\" : 640,\n    \"maximum_prefill_chunk\" : 256,\n    \"refusal\" : null,\n    \"requested_memory_ledger\" : {\n      \"active_capacity_bytes\" : 905969664,\n      \"additional_active_bytes\" : 0,\n      \"expected_peak_bytes\" : 8799795456,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 0,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 2477260800,\n      \"prefill_bytes\" : 332800000,\n      \"retained_capacity_bytes\" : 349996032,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"requested_window\" : 32768,\n    \"scope\" : \"memory feasibility; independent of prefill deadline\"\n  },\n  \"context_qualification\" : false,\n  \"device_available_gb\" : 12.5,\n  \"device_ram_gb\" : 17.199999999999999,\n  \"device_working_set_gb\" : 11.800000000000001,\n  \"est_prefill_s_at_max_context\" : 385.50588235294038,\n  \"est_prefill_tok_s\" : 85,\n  \"est_warm_tok_s\" : 3.7333333333333334,\n  \"expected_peak_gb\" : 8.8000000000000007,\n  \"experts_per_layer_cached\" : 19,\n  \"fully_resident\" : false,\n  \"implementation_context_limit\" : 65536,\n  \"max_context_tokens\" : 32768,\n  \"max_prefill_wait_minutes\" : 30,\n  \"max_ram_percent\" : 70,\n  \"memory_ledger\" : {\n    \"active_capacity_bytes\" : 905969664,\n    \"additional_active_bytes\" : 0,\n    \"expected_peak_bytes\" : 8799795456,\n    \"fixed_bytes\" : 5300000000,\n    \"long_context_reserve_bytes\" : 0,\n    \"mtp_resident_bytes\" : 0,\n    \"planning_margin_bytes\" : 1000000000,\n    \"pool_bytes\" : 2477260800,\n    \"prefill_bytes\" : 332800000,\n    \"retained_capacity_bytes\" : 349996032,\n    \"retained_recurrent_bytes\" : 339738624,\n    \"version\" : 1,\n    \"vision_resident_bytes\" : 0\n  },\n  \"model_context_limit\" : 262144,\n  \"mtp\" : false,\n  \"mtp_context_limit\" : 65536,\n  \"pool_gb\" : 2.5,\n  \"pool_slots\" : 896,\n  \"prefill_chunk\" : 256,\n  \"prefill_wait_scope\" : \"accepted_request_to_first_model_token\",\n  \"prefix_cache_max_tokens\" : 12659,\n  \"runtime_prefix_cache_enabled\" : true,\n  \"source\" : \"auto\",\n  \"target_gb\" : 9.8000000000000007,\n  \"vision\" : false,\n  \"vision_charged_gb\" : 0,\n  \"vision_context_limit\" : 65536,\n  \"vision_resident_gb\" : 0,\n  \"vision_resident_reserved\" : false\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "doctor",
        "--sim-ram",
        "25.8",
        "--sim-working-set",
        "18",
        "--sim-available",
        "21",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"availability_clamped\" : false,\n  \"context_feasibility\" : {\n    \"limiting_resource\" : \"implementation_limit\",\n    \"maximum_feasible_window\" : 65536,\n    \"maximum_memory_ledger\" : {\n      \"active_capacity_bytes\" : 1811939328,\n      \"additional_active_bytes\" : 905969664,\n      \"expected_peak_bytes\" : 14998977792,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 905969664,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 5427302400,\n      \"prefill_bytes\" : 1331200000,\n      \"retained_capacity_bytes\" : 788797440,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"maximum_pool_slots\" : 1963,\n    \"maximum_prefill_chunk\" : 1024,\n    \"refusal\" : null,\n    \"requested_memory_ledger\" : {\n      \"active_capacity_bytes\" : 905969664,\n      \"additional_active_bytes\" : 0,\n      \"expected_peak_bytes\" : 14999033088,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 0,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 7122124800,\n      \"prefill_bytes\" : 1331200000,\n      \"retained_capacity_bytes\" : 905969664,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"requested_window\" : 32768,\n    \"scope\" : \"memory feasibility; independent of prefill deadline\"\n  },\n  \"context_qualification\" : false,\n  \"device_available_gb\" : 21,\n  \"device_ram_gb\" : 25.800000000000001,\n  \"device_working_set_gb\" : 18,\n  \"est_prefill_s_at_max_context\" : 200.57987878787887,\n  \"est_prefill_tok_s\" : 165,\n  \"est_warm_tok_s\" : 7.6139937176257977,\n  \"expected_peak_gb\" : 15,\n  \"experts_per_layer_cached\" : 54,\n  \"fully_resident\" : false,\n  \"implementation_context_limit\" : 65536,\n  \"max_context_tokens\" : 32768,\n  \"max_prefill_wait_minutes\" : 30,\n  \"max_ram_percent\" : 70,\n  \"memory_ledger\" : {\n    \"active_capacity_bytes\" : 905969664,\n    \"additional_active_bytes\" : 0,\n    \"expected_peak_bytes\" : 14999033088,\n    \"fixed_bytes\" : 5300000000,\n    \"long_context_reserve_bytes\" : 0,\n    \"mtp_resident_bytes\" : 0,\n    \"planning_margin_bytes\" : 1000000000,\n    \"pool_bytes\" : 7122124800,\n    \"prefill_bytes\" : 1331200000,\n    \"retained_capacity_bytes\" : 905969664,\n    \"retained_recurrent_bytes\" : 339738624,\n    \"version\" : 1,\n    \"vision_resident_bytes\" : 0\n  },\n  \"model_context_limit\" : 262144,\n  \"mtp\" : false,\n  \"mtp_context_limit\" : 65536,\n  \"pool_gb\" : 7.0999999999999996,\n  \"pool_slots\" : 2576,\n  \"prefill_chunk\" : 1024,\n  \"prefill_wait_scope\" : \"accepted_request_to_first_model_token\",\n  \"prefix_cache_max_tokens\" : 32768,\n  \"runtime_prefix_cache_enabled\" : true,\n  \"source\" : \"auto\",\n  \"target_gb\" : 16,\n  \"vision\" : false,\n  \"vision_charged_gb\" : 0,\n  \"vision_context_limit\" : 65536,\n  \"vision_resident_gb\" : 0,\n  \"vision_resident_reserved\" : false\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "doctor",
        "--sim-ram",
        "25.8",
        "--sim-working-set",
        "18",
        "--sim-available",
        "21",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"availability_clamped\" : false,\n  \"context_feasibility\" : {\n    \"limiting_resource\" : \"implementation_limit\",\n    \"maximum_feasible_window\" : 65536,\n    \"maximum_memory_ledger\" : {\n      \"active_capacity_bytes\" : 1811939328,\n      \"additional_active_bytes\" : 905969664,\n      \"expected_peak_bytes\" : 14998977792,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 905969664,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 5427302400,\n      \"prefill_bytes\" : 1331200000,\n      \"retained_capacity_bytes\" : 788797440,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"maximum_pool_slots\" : 1963,\n    \"maximum_prefill_chunk\" : 1024,\n    \"refusal\" : null,\n    \"requested_memory_ledger\" : {\n      \"active_capacity_bytes\" : 905969664,\n      \"additional_active_bytes\" : 0,\n      \"expected_peak_bytes\" : 14999033088,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 0,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 7122124800,\n      \"prefill_bytes\" : 1331200000,\n      \"retained_capacity_bytes\" : 905969664,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"requested_window\" : 32768,\n    \"scope\" : \"memory feasibility; independent of prefill deadline\"\n  },\n  \"context_qualification\" : false,\n  \"device_available_gb\" : 21,\n  \"device_ram_gb\" : 25.800000000000001,\n  \"device_working_set_gb\" : 18,\n  \"est_prefill_s_at_max_context\" : 200.57987878787887,\n  \"est_prefill_tok_s\" : 165,\n  \"est_warm_tok_s\" : 7.6139937176257977,\n  \"expected_peak_gb\" : 15,\n  \"experts_per_layer_cached\" : 54,\n  \"fully_resident\" : false,\n  \"implementation_context_limit\" : 65536,\n  \"max_context_tokens\" : 32768,\n  \"max_prefill_wait_minutes\" : 30,\n  \"max_ram_percent\" : 70,\n  \"memory_ledger\" : {\n    \"active_capacity_bytes\" : 905969664,\n    \"additional_active_bytes\" : 0,\n    \"expected_peak_bytes\" : 14999033088,\n    \"fixed_bytes\" : 5300000000,\n    \"long_context_reserve_bytes\" : 0,\n    \"mtp_resident_bytes\" : 0,\n    \"planning_margin_bytes\" : 1000000000,\n    \"pool_bytes\" : 7122124800,\n    \"prefill_bytes\" : 1331200000,\n    \"retained_capacity_bytes\" : 905969664,\n    \"retained_recurrent_bytes\" : 339738624,\n    \"version\" : 1,\n    \"vision_resident_bytes\" : 0\n  },\n  \"model_context_limit\" : 262144,\n  \"mtp\" : false,\n  \"mtp_context_limit\" : 65536,\n  \"pool_gb\" : 7.0999999999999996,\n  \"pool_slots\" : 2576,\n  \"prefill_chunk\" : 1024,\n  \"prefill_wait_scope\" : \"accepted_request_to_first_model_token\",\n  \"prefix_cache_max_tokens\" : 32768,\n  \"runtime_prefix_cache_enabled\" : true,\n  \"source\" : \"auto\",\n  \"target_gb\" : 16,\n  \"vision\" : false,\n  \"vision_charged_gb\" : 0,\n  \"vision_context_limit\" : 65536,\n  \"vision_resident_gb\" : 0,\n  \"vision_resident_reserved\" : false\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "doctor",
        "--sim-ram",
        "34.4",
        "--sim-working-set",
        "25.8",
        "--sim-available",
        "29",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"availability_clamped\" : false,\n  \"context_feasibility\" : {\n    \"limiting_resource\" : \"implementation_limit\",\n    \"maximum_feasible_window\" : 65536,\n    \"maximum_memory_ledger\" : {\n      \"active_capacity_bytes\" : 1811939328,\n      \"additional_active_bytes\" : 905969664,\n      \"expected_peak_bytes\" : 22797376768,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 905969664,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 11114496000,\n      \"prefill_bytes\" : 2662400000,\n      \"retained_capacity_bytes\" : 1568802816,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"maximum_pool_slots\" : 4020,\n    \"maximum_prefill_chunk\" : 2048,\n    \"refusal\" : null,\n    \"requested_memory_ledger\" : {\n      \"active_capacity_bytes\" : 905969664,\n      \"additional_active_bytes\" : 0,\n      \"expected_peak_bytes\" : 22799865088,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 0,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 13591756800,\n      \"prefill_bytes\" : 2662400000,\n      \"retained_capacity_bytes\" : 905969664,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"requested_window\" : 32768,\n    \"scope\" : \"memory feasibility; independent of prefill deadline\"\n  },\n  \"context_qualification\" : false,\n  \"device_available_gb\" : 29,\n  \"device_ram_gb\" : 34.399999999999999,\n  \"device_working_set_gb\" : 25.800000000000001,\n  \"est_prefill_s_at_max_context\" : 183.62673762010354,\n  \"est_prefill_tok_s\" : 205,\n  \"est_warm_tok_s\" : 9.9214872229491249,\n  \"expected_peak_gb\" : 22.800000000000001,\n  \"experts_per_layer_cached\" : 102,\n  \"fully_resident\" : false,\n  \"implementation_context_limit\" : 65536,\n  \"max_context_tokens\" : 32768,\n  \"max_prefill_wait_minutes\" : 30,\n  \"max_ram_percent\" : 70,\n  \"memory_ledger\" : {\n    \"active_capacity_bytes\" : 905969664,\n    \"additional_active_bytes\" : 0,\n    \"expected_peak_bytes\" : 22799865088,\n    \"fixed_bytes\" : 5300000000,\n    \"long_context_reserve_bytes\" : 0,\n    \"mtp_resident_bytes\" : 0,\n    \"planning_margin_bytes\" : 1000000000,\n    \"pool_bytes\" : 13591756800,\n    \"prefill_bytes\" : 2662400000,\n    \"retained_capacity_bytes\" : 905969664,\n    \"retained_recurrent_bytes\" : 339738624,\n    \"version\" : 1,\n    \"vision_resident_bytes\" : 0\n  },\n  \"model_context_limit\" : 262144,\n  \"mtp\" : false,\n  \"mtp_context_limit\" : 65536,\n  \"pool_gb\" : 13.6,\n  \"pool_slots\" : 4916,\n  \"prefill_chunk\" : 2048,\n  \"prefill_wait_scope\" : \"accepted_request_to_first_model_token\",\n  \"prefix_cache_max_tokens\" : 32768,\n  \"runtime_prefix_cache_enabled\" : true,\n  \"source\" : \"auto\",\n  \"target_gb\" : 23.800000000000001,\n  \"vision\" : false,\n  \"vision_charged_gb\" : 0,\n  \"vision_context_limit\" : 65536,\n  \"vision_resident_gb\" : 0,\n  \"vision_resident_reserved\" : false\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "doctor",
        "--sim-ram",
        "34.4",
        "--sim-working-set",
        "25.8",
        "--sim-available",
        "29",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"availability_clamped\" : false,\n  \"context_feasibility\" : {\n    \"limiting_resource\" : \"implementation_limit\",\n    \"maximum_feasible_window\" : 65536,\n    \"maximum_memory_ledger\" : {\n      \"active_capacity_bytes\" : 1811939328,\n      \"additional_active_bytes\" : 905969664,\n      \"expected_peak_bytes\" : 22797376768,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 905969664,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 11114496000,\n      \"prefill_bytes\" : 2662400000,\n      \"retained_capacity_bytes\" : 1568802816,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"maximum_pool_slots\" : 4020,\n    \"maximum_prefill_chunk\" : 2048,\n    \"refusal\" : null,\n    \"requested_memory_ledger\" : {\n      \"active_capacity_bytes\" : 905969664,\n      \"additional_active_bytes\" : 0,\n      \"expected_peak_bytes\" : 22799865088,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 0,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 13591756800,\n      \"prefill_bytes\" : 2662400000,\n      \"retained_capacity_bytes\" : 905969664,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"requested_window\" : 32768,\n    \"scope\" : \"memory feasibility; independent of prefill deadline\"\n  },\n  \"context_qualification\" : false,\n  \"device_available_gb\" : 29,\n  \"device_ram_gb\" : 34.399999999999999,\n  \"device_working_set_gb\" : 25.800000000000001,\n  \"est_prefill_s_at_max_context\" : 183.62673762010354,\n  \"est_prefill_tok_s\" : 205,\n  \"est_warm_tok_s\" : 9.9214872229491249,\n  \"expected_peak_gb\" : 22.800000000000001,\n  \"experts_per_layer_cached\" : 102,\n  \"fully_resident\" : false,\n  \"implementation_context_limit\" : 65536,\n  \"max_context_tokens\" : 32768,\n  \"max_prefill_wait_minutes\" : 30,\n  \"max_ram_percent\" : 70,\n  \"memory_ledger\" : {\n    \"active_capacity_bytes\" : 905969664,\n    \"additional_active_bytes\" : 0,\n    \"expected_peak_bytes\" : 22799865088,\n    \"fixed_bytes\" : 5300000000,\n    \"long_context_reserve_bytes\" : 0,\n    \"mtp_resident_bytes\" : 0,\n    \"planning_margin_bytes\" : 1000000000,\n    \"pool_bytes\" : 13591756800,\n    \"prefill_bytes\" : 2662400000,\n    \"retained_capacity_bytes\" : 905969664,\n    \"retained_recurrent_bytes\" : 339738624,\n    \"version\" : 1,\n    \"vision_resident_bytes\" : 0\n  },\n  \"model_context_limit\" : 262144,\n  \"mtp\" : false,\n  \"mtp_context_limit\" : 65536,\n  \"pool_gb\" : 13.6,\n  \"pool_slots\" : 4916,\n  \"prefill_chunk\" : 2048,\n  \"prefill_wait_scope\" : \"accepted_request_to_first_model_token\",\n  \"prefix_cache_max_tokens\" : 32768,\n  \"runtime_prefix_cache_enabled\" : true,\n  \"source\" : \"auto\",\n  \"target_gb\" : 23.800000000000001,\n  \"vision\" : false,\n  \"vision_charged_gb\" : 0,\n  \"vision_context_limit\" : 65536,\n  \"vision_resident_gb\" : 0,\n  \"vision_resident_reserved\" : false\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "doctor",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"availability_clamped\" : false,\n  \"context_feasibility\" : {\n    \"limiting_resource\" : \"implementation_limit\",\n    \"maximum_feasible_window\" : 65536,\n    \"maximum_memory_ledger\" : {\n      \"active_capacity_bytes\" : 1811939328,\n      \"additional_active_bytes\" : 905969664,\n      \"expected_peak_bytes\" : 31998465280,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 905969664,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 20072448000,\n      \"prefill_bytes\" : 2662400000,\n      \"retained_capacity_bytes\" : 1811939328,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"maximum_pool_slots\" : 7260,\n    \"maximum_prefill_chunk\" : 2048,\n    \"refusal\" : null,\n    \"requested_memory_ledger\" : {\n      \"active_capacity_bytes\" : 905969664,\n      \"additional_active_bytes\" : 0,\n      \"expected_peak_bytes\" : 31998252288,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 0,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 20127744000,\n      \"prefill_bytes\" : 5324800000,\n      \"retained_capacity_bytes\" : 905969664,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"requested_window\" : 32768,\n    \"scope\" : \"memory feasibility; independent of prefill deadline\"\n  },\n  \"context_qualification\" : false,\n  \"device_available_gb\" : 44,\n  \"device_ram_gb\" : 51.5,\n  \"device_working_set_gb\" : 40.200000000000003,\n  \"est_prefill_s_at_max_context\" : 182.26443163340733,\n  \"est_prefill_tok_s\" : 220,\n  \"est_warm_tok_s\" : 11.6,\n  \"expected_peak_gb\" : 32,\n  \"experts_per_layer_cached\" : 152,\n  \"fully_resident\" : false,\n  \"implementation_context_limit\" : 65536,\n  \"max_context_tokens\" : 32768,\n  \"max_prefill_wait_minutes\" : 30,\n  \"max_ram_percent\" : 70,\n  \"memory_ledger\" : {\n    \"active_capacity_bytes\" : 905969664,\n    \"additional_active_bytes\" : 0,\n    \"expected_peak_bytes\" : 31998252288,\n    \"fixed_bytes\" : 5300000000,\n    \"long_context_reserve_bytes\" : 0,\n    \"mtp_resident_bytes\" : 0,\n    \"planning_margin_bytes\" : 1000000000,\n    \"pool_bytes\" : 20127744000,\n    \"prefill_bytes\" : 5324800000,\n    \"retained_capacity_bytes\" : 905969664,\n    \"retained_recurrent_bytes\" : 339738624,\n    \"version\" : 1,\n    \"vision_resident_bytes\" : 0\n  },\n  \"model_context_limit\" : 262144,\n  \"mtp\" : false,\n  \"mtp_context_limit\" : 65536,\n  \"pool_gb\" : 20.100000000000001,\n  \"pool_slots\" : 7280,\n  \"prefill_chunk\" : 4096,\n  \"prefill_wait_scope\" : \"accepted_request_to_first_model_token\",\n  \"prefix_cache_max_tokens\" : 32768,\n  \"runtime_prefix_cache_enabled\" : true,\n  \"source\" : \"auto\",\n  \"target_gb\" : 33,\n  \"vision\" : false,\n  \"vision_charged_gb\" : 0,\n  \"vision_context_limit\" : 65536,\n  \"vision_resident_gb\" : 0,\n  \"vision_resident_reserved\" : false\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "doctor",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"availability_clamped\" : false,\n  \"context_feasibility\" : {\n    \"limiting_resource\" : \"implementation_limit\",\n    \"maximum_feasible_window\" : 65536,\n    \"maximum_memory_ledger\" : {\n      \"active_capacity_bytes\" : 1811939328,\n      \"additional_active_bytes\" : 905969664,\n      \"expected_peak_bytes\" : 31998465280,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 905969664,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 20072448000,\n      \"prefill_bytes\" : 2662400000,\n      \"retained_capacity_bytes\" : 1811939328,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"maximum_pool_slots\" : 7260,\n    \"maximum_prefill_chunk\" : 2048,\n    \"refusal\" : null,\n    \"requested_memory_ledger\" : {\n      \"active_capacity_bytes\" : 905969664,\n      \"additional_active_bytes\" : 0,\n      \"expected_peak_bytes\" : 31998252288,\n      \"fixed_bytes\" : 5300000000,\n      \"long_context_reserve_bytes\" : 0,\n      \"mtp_resident_bytes\" : 0,\n      \"planning_margin_bytes\" : 1000000000,\n      \"pool_bytes\" : 20127744000,\n      \"prefill_bytes\" : 5324800000,\n      \"retained_capacity_bytes\" : 905969664,\n      \"retained_recurrent_bytes\" : 339738624,\n      \"version\" : 1,\n      \"vision_resident_bytes\" : 0\n    },\n    \"requested_window\" : 32768,\n    \"scope\" : \"memory feasibility; independent of prefill deadline\"\n  },\n  \"context_qualification\" : false,\n  \"device_available_gb\" : 44,\n  \"device_ram_gb\" : 51.5,\n  \"device_working_set_gb\" : 40.200000000000003,\n  \"est_prefill_s_at_max_context\" : 182.26443163340733,\n  \"est_prefill_tok_s\" : 220,\n  \"est_warm_tok_s\" : 11.6,\n  \"expected_peak_gb\" : 32,\n  \"experts_per_layer_cached\" : 152,\n  \"fully_resident\" : false,\n  \"implementation_context_limit\" : 65536,\n  \"max_context_tokens\" : 32768,\n  \"max_prefill_wait_minutes\" : 30,\n  \"max_ram_percent\" : 70,\n  \"memory_ledger\" : {\n    \"active_capacity_bytes\" : 905969664,\n    \"additional_active_bytes\" : 0,\n    \"expected_peak_bytes\" : 31998252288,\n    \"fixed_bytes\" : 5300000000,\n    \"long_context_reserve_bytes\" : 0,\n    \"mtp_resident_bytes\" : 0,\n    \"planning_margin_bytes\" : 1000000000,\n    \"pool_bytes\" : 20127744000,\n    \"prefill_bytes\" : 5324800000,\n    \"retained_capacity_bytes\" : 905969664,\n    \"retained_recurrent_bytes\" : 339738624,\n    \"version\" : 1,\n    \"vision_resident_bytes\" : 0\n  },\n  \"model_context_limit\" : 262144,\n  \"mtp\" : false,\n  \"mtp_context_limit\" : 65536,\n  \"pool_gb\" : 20.100000000000001,\n  \"pool_slots\" : 7280,\n  \"prefill_chunk\" : 4096,\n  \"prefill_wait_scope\" : \"accepted_request_to_first_model_token\",\n  \"prefix_cache_max_tokens\" : 32768,\n  \"runtime_prefix_cache_enabled\" : true,\n  \"source\" : \"auto\",\n  \"target_gb\" : 33,\n  \"vision\" : false,\n  \"vision_charged_gb\" : 0,\n  \"vision_context_limit\" : 65536,\n  \"vision_resident_gb\" : 0,\n  \"vision_resident_reserved\" : false\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "prefill-schedule",
        "--tokens",
        "262144",
        "--from",
        "0",
        "--chunk",
        "4096",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"chunk\" : 4096,\n  \"est_seconds\" : null,\n  \"from\" : 0,\n  \"measured_query_key_product\" : 32833536,\n  \"min_chunk\" : 64,\n  \"pass_count\" : 1427,\n  \"passes\" : [\n    4096,\n    2048,\n    2048,\n    2048,\n    2048,\n    2048,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64\n  ],\n  \"tail_aware\" : false,\n  \"tokens\" : 262144\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "prefill-schedule",
        "--tokens",
        "262143",
        "--from",
        "1",
        "--chunk",
        "4096",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"chunk\" : 4096,\n  \"est_seconds\" : null,\n  \"from\" : 1,\n  \"measured_query_key_product\" : 32833536,\n  \"min_chunk\" : 64,\n  \"pass_count\" : 1429,\n  \"passes\" : [\n    4096,\n    2048,\n    2048,\n    2048,\n    2048,\n    2048,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    1024,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    63\n  ],\n  \"tail_aware\" : false,\n  \"tokens\" : 262143\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "prefill-schedule",
        "--tokens",
        "229376",
        "--from",
        "32768",
        "--chunk",
        "4096",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"chunk\" : 4096,\n  \"est_seconds\" : null,\n  \"from\" : 32768,\n  \"measured_query_key_product\" : 32833536,\n  \"min_chunk\" : 64,\n  \"pass_count\" : 1402,\n  \"passes\" : [\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    512,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64\n  ],\n  \"tail_aware\" : false,\n  \"tokens\" : 229376\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "prefill-schedule",
        "--tokens",
        "196609",
        "--from",
        "65535",
        "--chunk",
        "4096",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"chunk\" : 4096,\n  \"est_seconds\" : null,\n  \"from\" : 65535,\n  \"measured_query_key_product\" : 32833536,\n  \"min_chunk\" : 64,\n  \"pass_count\" : 1336,\n  \"passes\" : [\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    256,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    1\n  ],\n  \"tail_aware\" : false,\n  \"tokens\" : 196609\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "prefill-schedule",
        "--tokens",
        "133888",
        "--from",
        "128256",
        "--chunk",
        "4096",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"chunk\" : 4096,\n  \"est_seconds\" : null,\n  \"from\" : 128256,\n  \"measured_query_key_product\" : 32833536,\n  \"min_chunk\" : 64,\n  \"pass_count\" : 1090,\n  \"passes\" : [\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64\n  ],\n  \"tail_aware\" : false,\n  \"tokens\" : 133888\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "prefill-schedule",
        "--tokens",
        "131073",
        "--from",
        "131071",
        "--chunk",
        "4096",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"chunk\" : 4096,\n  \"est_seconds\" : null,\n  \"from\" : 131071,\n  \"measured_query_key_product\" : 32833536,\n  \"min_chunk\" : 64,\n  \"pass_count\" : 1069,\n  \"passes\" : [\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    128,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    64,\n    1\n  ],\n  \"tail_aware\" : false,\n  \"tokens\" : 131073\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "prefill-schedule",
        "--tokens",
        "65",
        "--from",
        "262079",
        "--chunk",
        "4096",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"chunk\" : 4096,\n  \"est_seconds\" : null,\n  \"from\" : 262079,\n  \"measured_query_key_product\" : 32833536,\n  \"min_chunk\" : 64,\n  \"pass_count\" : 2,\n  \"passes\" : [\n    64,\n    1\n  ],\n  \"tail_aware\" : false,\n  \"tokens\" : 65\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "prefill-schedule",
        "--tokens",
        "1",
        "--from",
        "262143",
        "--chunk",
        "4096",
        "--json"
      ],
      "code": 0,
      "stdout": "{\n  \"chunk\" : 4096,\n  \"est_seconds\" : null,\n  \"from\" : 262143,\n  \"measured_query_key_product\" : 32833536,\n  \"min_chunk\" : 64,\n  \"pass_count\" : 1,\n  \"passes\" : [\n    1\n  ],\n  \"tail_aware\" : false,\n  \"tokens\" : 1\n}\n",
      "stderr": ""
    },
    {
      "args": [
        "serve",
        "--max-context",
        "0",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-context must be between 1 and 65536 (prompt plus reply). The pinned model limit is 262144; the released implementation limit is 65536. A model limit does not guarantee memory fit or answer quality.\n"
    },
    {
      "args": [
        "serve",
        "--max-context",
        "262145",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-context must be between 1 and 65536 (prompt plus reply). The pinned model limit is 262144; the released implementation limit is 65536. A model limit does not guarantee memory fit or answer quality.\n"
    },
    {
      "args": [
        "serve",
        "--max-prefill-wait",
        "nan",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy\n"
    },
    {
      "args": [
        "serve",
        "--max-prefill-wait",
        "inf",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy\n"
    },
    {
      "args": [
        "serve",
        "--max-prefill-wait",
        "-1",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 64,
      "stdout": "",
      "stderr": "Error: Missing value for '--max-prefill-wait <max-prefill-wait>'\nHelp:  --max-prefill-wait <max-prefill-wait>  Accepted request to first model token budget in minutes; 0 disables only time\nUsage: slotstream serve [--model <model>] [--memory-gb <memory-gb>] [--experts-per-layer <experts-per-layer>] [--pool-gb <pool-gb>] [--max-ram-percent <max-ram-percent>] [--mtp <mtp>] [--vision <vision>] [--port <port>] [--max-context <max-context>] [--max-prefill-wait <max-prefill-wait>] [--no-elastic] [--no-prefix-cache]\n  See 'slotstream serve --help' for more information.\n"
    },
    {
      "args": [
        "serve",
        "--max-prefill-wait",
        "1e300",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy\n"
    },
    {
      "args": [
        "run",
        "--max-context",
        "0",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-context must be between 1 and 65536 (prompt plus reply). The pinned model limit is 262144; the released implementation limit is 65536. A model limit does not guarantee memory fit or answer quality.\n"
    },
    {
      "args": [
        "run",
        "--max-context",
        "262145",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-context must be between 1 and 65536 (prompt plus reply). The pinned model limit is 262144; the released implementation limit is 65536. A model limit does not guarantee memory fit or answer quality.\n"
    },
    {
      "args": [
        "run",
        "--max-prefill-wait",
        "nan",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy\n"
    },
    {
      "args": [
        "run",
        "--max-prefill-wait",
        "inf",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy\n"
    },
    {
      "args": [
        "run",
        "--max-prefill-wait",
        "-1",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 64,
      "stdout": "",
      "stderr": "Error: Missing value for '--max-prefill-wait <max-prefill-wait>'\nHelp:  --max-prefill-wait <max-prefill-wait>  Accepted request to first model token budget in minutes; 0 disables only time\nUsage: slotstream run <options>\n  See 'slotstream run --help' for more information.\n"
    },
    {
      "args": [
        "run",
        "--max-prefill-wait",
        "1e300",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy\n"
    },
    {
      "args": [
        "doctor",
        "--max-context",
        "0",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-context must be between 1 and 65536 (prompt plus reply). The pinned model limit is 262144; the released implementation limit is 65536. A model limit does not guarantee memory fit or answer quality.\n"
    },
    {
      "args": [
        "doctor",
        "--max-context",
        "262145",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-context must be between 1 and 65536 (prompt plus reply). The pinned model limit is 262144; the released implementation limit is 65536. A model limit does not guarantee memory fit or answer quality.\n"
    },
    {
      "args": [
        "doctor",
        "--max-prefill-wait",
        "nan",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy\n"
    },
    {
      "args": [
        "doctor",
        "--max-prefill-wait",
        "inf",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy\n"
    },
    {
      "args": [
        "doctor",
        "--max-prefill-wait",
        "-1",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 64,
      "stdout": "",
      "stderr": "Error: Missing value for '--max-prefill-wait <max-prefill-wait>'\nHelp:  --max-prefill-wait <max-prefill-wait>  Accepted request to first model token budget in minutes; 0 disables only time\nUsage: slotstream doctor <options>\n  See 'slotstream doctor --help' for more information.\n"
    },
    {
      "args": [
        "doctor",
        "--max-prefill-wait",
        "1e300",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 1,
      "stdout": "",
      "stderr": "Error: --max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy\n"
    },
    {
      "args": [
        "context-check",
        "--tokens",
        "262144",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 64,
      "stdout": "",
      "stderr": "Error: --tokens plus --reply-tokens must fit the model limit of 262144\nUsage: slotstream context-check <options>\n  See 'slotstream context-check --help' for more information.\n"
    },
    {
      "args": [
        "context-check",
        "--tokens",
        "-1",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 64,
      "stdout": "",
      "stderr": "Error: Missing value for '--tokens <tokens>'\nHelp:  --tokens <tokens>  Prompt length in tokens (rungs double from 2048 up to here with --ladder)\nUsage: slotstream context-check <options>\n  See 'slotstream context-check --help' for more information.\n"
    },
    {
      "args": [
        "context-check",
        "--tokens",
        "9223372036854775807",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 64,
      "stdout": "",
      "stderr": "Error: --tokens plus --reply-tokens must fit the model limit of 262144\nUsage: slotstream context-check <options>\n  See 'slotstream context-check --help' for more information.\n"
    },
    {
      "args": [
        "context-check",
        "--reply-tokens",
        "9223372036854775807",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 64,
      "stdout": "",
      "stderr": "Error: --tokens plus --reply-tokens must fit the model limit of 262144\nUsage: slotstream context-check <options>\n  See 'slotstream context-check --help' for more information.\n"
    },
    {
      "args": [
        "context-check",
        "--reply-tokens",
        "0",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 64,
      "stdout": "",
      "stderr": "Error: --tokens plus --reply-tokens must fit the model limit of 262144\nUsage: slotstream context-check <options>\n  See 'slotstream context-check --help' for more information.\n"
    },
    {
      "args": [
        "context-check",
        "--wall-seconds",
        "nan",
        "--model",
        "/nonexistent/context-gate-no-model"
      ],
      "code": 64,
      "stdout": "",
      "stderr": "Error: --wall-seconds must be finite, positive and at most 86400\nUsage: slotstream context-check <options>\n  See 'slotstream context-check --help' for more information.\n"
    }
  ]
}

````

## planner-13.txt

SHA-256 `4fcf35c9315de57daffdca7ba713b20614ae6a5bebaf9378910a33779a32b2c1`; 3353 bytes.

````text
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: refuses an unphysical minimum allocation
PASS  8GB Mac: refuses an unphysical minimum allocation
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 refuses physical overcommit without trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
PASS  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
PASS  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
PASS  --model with a corrupt safetensors header
PASS  safetensors dtype/shape byte mismatch rejected
PASS  safetensors header over 100MB rejected before allocation
PASS  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: full model window obeys the product without exemptions
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 64, failed 0

````
