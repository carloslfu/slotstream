---
type: run
id: 01m1vx4yqvtxsxx6rrnkm80hs1
created: 2026-09-06T17:44:37.882659+00:00
updated: 2026-09-06T17:44:38.118437+00:00
summary: Expanded HTTP matrix exposes supplied-controller pressure bypass
binary: 06d3a3c3b73dcf8b5d6f255f0444c211b22c7435afb8229469f44453fe997652
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Expanded HTTP matrix exposes supplied-controller pressure bypass
tool: Native Swift diagnostics and Python CLI gates
---
# Expanded HTTP failure and preserved correction rationale

Build 11's `context-serving` matrix fails 114 of 834 assertions. Of those,
112 are pressure-before/pressure-after contracts across seven response forms
with queuing both enabled and disabled. The test supplies a deterministic
request controller, which lacks the ordinary controller's OS-pressure closure.
The Engine's independent pressure-ticket checks were incorrectly conditional
on the default-off responsive-governor option. A supplied or direct controller
could therefore bypass a pending pressure ticket and finish successfully.

Build 12 removes that option condition at the Engine's three ticket checks.
The remaining two failures are a warm-prefix fixture assumption: the baseline
consumes its final sampled token, leaving 516 retained tokens after a 515-token
prompt and one reply. The fixture now measures the actual retained prefix,
extends it, and checks reuse against that exact length. No admission, cleanup,
status, terminal-success or numerical criterion is weakened.

The other memory, deadline, queue, client-cap and terminal contracts passed.
This failed run remains evidence; the corrected expanded live matrix has not
yet run at this capture. The earlier smaller passing HTTP suite does not
override this counterexample.

Command: `slotstream optimization-state-check --variant context-serving --json`.
This short correctness run overlapped a separately coordinated anonymous model
download. All timing and capacity interpretations are excluded. Public context
remains 65536, and the feature is unreleased.

## Frozen build identity

```json
{
  "binary_sha256": "06d3a3c3b73dcf8b5d6f255f0444c211b22c7435afb8229469f44453fe997652",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "456830af3c78b8619445acd25bf8ee6cf9514568cb16cbedc47b7bf825aaaec4"
}
```

## http-11/stdout.txt

SHA-256 `f70bad1e0599eb236e741fe1b90e4307515aae9fcb1e8d2d4a7448697b933b5c`; 129502 bytes.

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
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 279\r\nConnection: close",
      "name" : "generate JSON\/pressure-before\/queued=false: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"total_duration\":2173614500,\"prompt_eval_duration\":794964625,\"created_at\":\"2026-09-06T17:08:58Z\",\"response\":\"\\n\\n<think>\\nThe user wants me to\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":12,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_count\":8,\"eval_duration\":1378379417}",
      "name" : "generate JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 20, want 0",
      "name" : "generate JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : false
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/x-ndjson\r\nTransfer-Encoding: chunked\r\nConnection: close",
      "name" : "generate NDJSON\/pressure-before\/queued=false: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"created_at\":\"2026-09-06T17:08:59Z\",\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"response\":\"\\n\\n\"}\n{\"created_at\":\"2026-09-06T17:08:59Z\",\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false,\"response\":\"<think>\"}\n{\"created_at\":\"2026-09-06T17:08:59Z\",\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"response\":\"\\n\"}\n{\"created_at\":\"2026-09-06T17:08:59Z\",\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"response\":\"The\"}\n{\"created_at\":\"2026-09-06T17:08:59Z\",\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false,\"response\":\" user\"}\n{\"created_at\":\"2026-09-06T17:09:00Z\",\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"response\":\" wants\"}\n{\"created_at\":\"2026-09-06T17:09:00Z\",\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"response\":\" me\"}\n{\"created_at\":\"2026-09-06T17:09:00Z\",\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"response\":\" to\"}\n{\"total_duration\":2138659457,\"prompt_eval_duration\":792708208,\"created_at\":\"2026-09-06T17:09:00Z\",\"response\":\"\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":12,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_count\":8,\"eval_duration\":1345688334}\n",
      "name" : "generate NDJSON\/pressure-before\/queued=false: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 20, want 0",
      "name" : "generate NDJSON\/pressure-before\/queued=false: failed state absent",
      "passed" : false
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 316\r\nConnection: close",
      "name" : "chat JSON\/pressure-before\/queued=false: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"total_duration\":2730943000,\"prompt_eval_duration\":1279655417,\"created_at\":\"2026-09-06T17:09:03Z\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":24,\"eval_count\":8,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_duration\":1450992208,\"message\":{\"content\":\"one two three four five six seven eight\",\"role\":\"assistant\"}}",
      "name" : "chat JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "chat JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : false
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/x-ndjson\r\nTransfer-Encoding: chunked\r\nConnection: close",
      "name" : "chat NDJSON\/pressure-before\/queued=false: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\"one\"},\"created_at\":\"2026-09-06T17:09:04Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"content\":\" two\",\"role\":\"assistant\"},\"created_at\":\"2026-09-06T17:09:04Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\" three\"},\"created_at\":\"2026-09-06T17:09:04Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"content\":\" four\",\"role\":\"assistant\"},\"created_at\":\"2026-09-06T17:09:05Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\" five\"},\"created_at\":\"2026-09-06T17:09:05Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"content\":\" six\",\"role\":\"assistant\"},\"created_at\":\"2026-09-06T17:09:05Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\" seven\"},\"created_at\":\"2026-09-06T17:09:05Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\" eight\"},\"created_at\":\"2026-09-06T17:09:05Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"total_duration\":2545929083,\"prompt_eval_duration\":1268208083,\"created_at\":\"2026-09-06T17:09:05Z\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":24,\"eval_count\":8,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_duration\":1277474208,\"message\":{\"content\":\"\",\"role\":\"assistant\"}}\n",
      "name" : "chat NDJSON\/pressure-before\/queued=false: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "chat NDJSON\/pressure-before\/queued=false: failed state absent",
      "passed" : false
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 381\r\nConnection: close",
      "name" : "OpenAI JSON\/pressure-before\/queued=false: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"model\":\"qwen3.8-flash-next:4bit\",\"usage\":{\"prompt_tokens\":24,\"completion_tokens\":8,\"prompt_tokens_details\":{\"cached_tokens\":0},\"total_tokens\":32},\"choices\":[{\"message\":{\"content\":\"one two three four five six seven eight\",\"role\":\"assistant\"},\"index\":0,\"finish_reason\":\"length\"}],\"object\":\"chat.completion\",\"id\":\"chatcmpl-DAD8BD64-C0F4-436D-9428-8E6C78B6759C\",\"created\":1788714545}",
      "name" : "OpenAI JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "OpenAI JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : false
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: text\/event-stream\r\nTransfer-Encoding: chunked\r\nConnection: close",
      "name" : "OpenAI SSE\/pressure-before\/queued=false: correct header status",
      "passed" : false
    },
    {
      "detail" : "data: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\"one\",\"role\":\"assistant\"},\"index\":0,\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-46CBAD87-70C5-4330-9802-5EA7E69A169B\",\"created\":1788714548}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"finish_reason\":null,\"index\":0,\"delta\":{\"content\":\" two\"}}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-46CBAD87-70C5-4330-9802-5EA7E69A169B\",\"created\":1788714548}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"finish_reason\":null,\"delta\":{\"content\":\" three\"},\"index\":0}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-46CBAD87-70C5-4330-9802-5EA7E69A169B\",\"created\":1788714548}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"finish_reason\":null,\"index\":0,\"delta\":{\"content\":\" four\"}}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-46CBAD87-70C5-4330-9802-5EA7E69A169B\",\"created\":1788714548}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"finish_reason\":null,\"index\":0,\"delta\":{\"content\":\" five\"}}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-46CBAD87-70C5-4330-9802-5EA7E69A169B\",\"created\":1788714548}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\" six\"},\"finish_reason\":null,\"index\":0}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-46CBAD87-70C5-4330-9802-5EA7E69A169B\",\"created\":1788714548}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\" seven\"},\"index\":0,\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-46CBAD87-70C5-4330-9802-5EA7E69A169B\",\"created\":1788714548}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"content\":\" eight\"},\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-46CBAD87-70C5-4330-9802-5EA7E69A169B\",\"created\":1788714548}\n\ndata: {\"object\":\"chat.completion.chunk\",\"choices\":[{\"delta\":{},\"index\":0,\"finish_reason\":\"length\"}],\"id\":\"chatcmpl-46CBAD87-70C5-4330-9802-5EA7E69A169B\",\"created\":1788714548,\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: [DONE]\n\n",
      "name" : "OpenAI SSE\/pressure-before\/queued=false: typed terminal",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: no success DONE",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: no successful finish",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "OpenAI SSE\/pressure-before\/queued=false: failed state absent",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: text\/event-stream\r\nTransfer-Encoding: chunked\r\nConnection: close",
      "name" : "Gateway SSE\/pressure-before\/queued=false: correct header status",
      "passed" : false
    },
    {
      "detail" : "data: {\"type\":\"stream-start\",\"warnings\":[]}\n\ndata: {\"id\":\"gen_20082b5e\",\"modelId\":\"slotstream\\\/qwen3.8-flash-next:4bit\",\"timestamp\":\"2026-09-06T17:09:10Z\",\"type\":\"response-metadata\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-start\"}\n\ndata: {\"delta\":\"one\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" two\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" three\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" four\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" five\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" six\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" seven\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" eight\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-end\"}\n\ndata: {\"finishReason\":{\"raw\":\"length\",\"unified\":\"length\"},\"type\":\"finish\",\"usage\":{\"inputTokens\":{\"cacheRead\":0,\"cacheWrite\":0,\"noCache\":24,\"total\":24},\"outputTokens\":{\"reasoning\":0,\"text\":8,\"total\":8}}}\n\ndata: [DONE]\n\n",
      "name" : "Gateway SSE\/pressure-before\/queued=false: typed terminal",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: no success DONE",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: no successful finish",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "Gateway SSE\/pressure-before\/queued=false: failed state absent",
      "passed" : false
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
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 279\r\nConnection: close",
      "name" : "generate JSON\/pressure-after\/queued=false: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"total_duration\":2183261583,\"prompt_eval_duration\":803812583,\"created_at\":\"2026-09-06T17:09:16Z\",\"response\":\"\\n\\n<think>\\nThe user wants me to\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":12,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_count\":8,\"eval_duration\":1379172458}",
      "name" : "generate JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 20, want 0",
      "name" : "generate JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : false
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
      "detail" : "{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:09:17Z\",\"response\":\"\\n\\n\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:09:18Z\",\"response\":\"<think>\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:09:18Z\",\"response\":\"\\n\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:09:18Z\",\"response\":\"The\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:09:18Z\",\"response\":\" user\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:09:18Z\",\"response\":\" wants\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:09:18Z\",\"response\":\" me\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:09:19Z\",\"response\":\" to\"}\n{\"total_duration\":2197346667,\"prompt_eval_duration\":808862250,\"created_at\":\"2026-09-06T17:09:19Z\",\"response\":\"\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":12,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_count\":8,\"eval_duration\":1388181583}\n",
      "name" : "generate NDJSON\/pressure-after\/queued=false: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 20, want 0",
      "name" : "generate NDJSON\/pressure-after\/queued=false: failed state absent",
      "passed" : false
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 316\r\nConnection: close",
      "name" : "chat JSON\/pressure-after\/queued=false: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"total_duration\":2609753125,\"prompt_eval_duration\":1289884375,\"created_at\":\"2026-09-06T17:09:21Z\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":24,\"eval_count\":8,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_duration\":1319595792,\"message\":{\"role\":\"assistant\",\"content\":\"one two three four five six seven eight\"}}",
      "name" : "chat JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "chat JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : false
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
      "detail" : "{\"created_at\":\"2026-09-06T17:09:23Z\",\"message\":{\"content\":\"one\",\"role\":\"assistant\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:09:23Z\",\"message\":{\"content\":\" two\",\"role\":\"assistant\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:09:23Z\",\"message\":{\"content\":\" three\",\"role\":\"assistant\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:09:23Z\",\"message\":{\"role\":\"assistant\",\"content\":\" four\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:09:23Z\",\"message\":{\"content\":\" five\",\"role\":\"assistant\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:09:23Z\",\"message\":{\"role\":\"assistant\",\"content\":\" six\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:09:24Z\",\"message\":{\"content\":\" seven\",\"role\":\"assistant\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:09:24Z\",\"message\":{\"role\":\"assistant\",\"content\":\" eight\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"total_duration\":2601094167,\"prompt_eval_duration\":1291574208,\"created_at\":\"2026-09-06T17:09:24Z\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":24,\"eval_count\":8,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_duration\":1309279833,\"message\":{\"role\":\"assistant\",\"content\":\"\"}}\n",
      "name" : "chat NDJSON\/pressure-after\/queued=false: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "chat NDJSON\/pressure-after\/queued=false: failed state absent",
      "passed" : false
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 381\r\nConnection: close",
      "name" : "OpenAI JSON\/pressure-after\/queued=false: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"choices\":[{\"index\":0,\"message\":{\"role\":\"assistant\",\"content\":\"one two three four five six seven eight\"},\"finish_reason\":\"length\"}],\"object\":\"chat.completion\",\"created\":1788714564,\"id\":\"chatcmpl-6C01814F-6785-4548-BEEC-18BAA53C4ACB\",\"usage\":{\"prompt_tokens_details\":{\"cached_tokens\":0},\"prompt_tokens\":24,\"completion_tokens\":8,\"total_tokens\":32},\"model\":\"qwen3.8-flash-next:4bit\"}",
      "name" : "OpenAI JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "OpenAI JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : false
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
      "detail" : "data: {\"choices\":[{\"delta\":{\"role\":\"assistant\",\"content\":\"one\"},\"index\":0,\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"created\":1788714566,\"id\":\"chatcmpl-9888AB69-9E78-454F-B7C5-060E32D1E720\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"finish_reason\":null,\"index\":0,\"delta\":{\"content\":\" two\"}}],\"object\":\"chat.completion.chunk\",\"created\":1788714566,\"id\":\"chatcmpl-9888AB69-9E78-454F-B7C5-060E32D1E720\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"delta\":{\"content\":\" three\"},\"finish_reason\":null,\"index\":0}],\"object\":\"chat.completion.chunk\",\"created\":1788714566,\"id\":\"chatcmpl-9888AB69-9E78-454F-B7C5-060E32D1E720\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"finish_reason\":null,\"delta\":{\"content\":\" four\"},\"index\":0}],\"object\":\"chat.completion.chunk\",\"created\":1788714566,\"id\":\"chatcmpl-9888AB69-9E78-454F-B7C5-060E32D1E720\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"index\":0,\"delta\":{\"content\":\" five\"},\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"created\":1788714566,\"id\":\"chatcmpl-9888AB69-9E78-454F-B7C5-060E32D1E720\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"index\":0,\"delta\":{\"content\":\" six\"},\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"created\":1788714566,\"id\":\"chatcmpl-9888AB69-9E78-454F-B7C5-060E32D1E720\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"index\":0,\"delta\":{\"content\":\" seven\"},\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"created\":1788714566,\"id\":\"chatcmpl-9888AB69-9E78-454F-B7C5-060E32D1E720\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"index\":0,\"finish_reason\":null,\"delta\":{\"content\":\" eight\"}}],\"object\":\"chat.completion.chunk\",\"created\":1788714566,\"id\":\"chatcmpl-9888AB69-9E78-454F-B7C5-060E32D1E720\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"object\":\"chat.completion.chunk\",\"choices\":[{\"index\":0,\"delta\":{},\"finish_reason\":\"length\"}],\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788714566,\"id\":\"chatcmpl-9888AB69-9E78-454F-B7C5-060E32D1E720\"}\n\ndata: [DONE]\n\n",
      "name" : "OpenAI SSE\/pressure-after\/queued=false: typed terminal",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: no success DONE",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: no successful finish",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "OpenAI SSE\/pressure-after\/queued=false: failed state absent",
      "passed" : false
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
      "detail" : "data: {\"type\":\"stream-start\",\"warnings\":[]}\n\ndata: {\"id\":\"gen_03b113fa\",\"modelId\":\"slotstream\\\/qwen3.8-flash-next:4bit\",\"timestamp\":\"2026-09-06T17:09:29Z\",\"type\":\"response-metadata\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-start\"}\n\ndata: {\"delta\":\"one\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" two\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" three\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" four\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" five\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" six\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" seven\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" eight\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-end\"}\n\ndata: {\"finishReason\":{\"raw\":\"length\",\"unified\":\"length\"},\"type\":\"finish\",\"usage\":{\"inputTokens\":{\"cacheRead\":0,\"cacheWrite\":0,\"noCache\":24,\"total\":24},\"outputTokens\":{\"reasoning\":0,\"text\":8,\"total\":8}}}\n\ndata: [DONE]\n\n",
      "name" : "Gateway SSE\/pressure-after\/queued=false: typed terminal",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: no success DONE",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: no successful finish",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "Gateway SSE\/pressure-after\/queued=false: failed state absent",
      "passed" : false
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
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 279\r\nConnection: close",
      "name" : "generate JSON\/pressure-before\/queued=true: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"total_duration\":2292034334,\"prompt_eval_duration\":807999583,\"created_at\":\"2026-09-06T17:10:08Z\",\"response\":\"\\n\\n<think>\\nThe user wants me to\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":12,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_count\":8,\"eval_duration\":1483763000}",
      "name" : "generate JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 20, want 0",
      "name" : "generate JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : false
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/x-ndjson\r\nTransfer-Encoding: chunked\r\nConnection: close",
      "name" : "generate NDJSON\/pressure-before\/queued=true: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"created_at\":\"2026-09-06T17:10:09Z\",\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false,\"response\":\"\\n\\n\"}\n{\"created_at\":\"2026-09-06T17:10:09Z\",\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false,\"response\":\"<think>\"}\n{\"created_at\":\"2026-09-06T17:10:09Z\",\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false,\"response\":\"\\n\"}\n{\"created_at\":\"2026-09-06T17:10:09Z\",\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false,\"response\":\"The\"}\n{\"created_at\":\"2026-09-06T17:10:09Z\",\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false,\"response\":\" user\"}\n{\"created_at\":\"2026-09-06T17:10:09Z\",\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"response\":\" wants\"}\n{\"created_at\":\"2026-09-06T17:10:10Z\",\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"response\":\" me\"}\n{\"created_at\":\"2026-09-06T17:10:10Z\",\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false,\"response\":\" to\"}\n{\"total_duration\":2204591500,\"prompt_eval_duration\":803114291,\"created_at\":\"2026-09-06T17:10:10Z\",\"response\":\"\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":12,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_count\":8,\"eval_duration\":1401216292}\n",
      "name" : "generate NDJSON\/pressure-before\/queued=true: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 20, want 0",
      "name" : "generate NDJSON\/pressure-before\/queued=true: failed state absent",
      "passed" : false
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 316\r\nConnection: close",
      "name" : "chat JSON\/pressure-before\/queued=true: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"total_duration\":2616413000,\"prompt_eval_duration\":1290865417,\"created_at\":\"2026-09-06T17:10:13Z\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":24,\"eval_count\":8,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_duration\":1325259208,\"message\":{\"role\":\"assistant\",\"content\":\"one two three four five six seven eight\"}}",
      "name" : "chat JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "chat JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : false
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/x-ndjson\r\nTransfer-Encoding: chunked\r\nConnection: close",
      "name" : "chat NDJSON\/pressure-before\/queued=true: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\"one\"},\"created_at\":\"2026-09-06T17:10:14Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\" two\"},\"created_at\":\"2026-09-06T17:10:14Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"content\":\" three\",\"role\":\"assistant\"},\"created_at\":\"2026-09-06T17:10:14Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\" four\"},\"created_at\":\"2026-09-06T17:10:14Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\" five\"},\"created_at\":\"2026-09-06T17:10:15Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\" six\"},\"created_at\":\"2026-09-06T17:10:15Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\" seven\"},\"created_at\":\"2026-09-06T17:10:15Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"done\":false,\"message\":{\"role\":\"assistant\",\"content\":\" eight\"},\"created_at\":\"2026-09-06T17:10:15Z\",\"model\":\"qwen3.8-flash-next:4bit\"}\n{\"total_duration\":2660767250,\"prompt_eval_duration\":1281935917,\"created_at\":\"2026-09-06T17:10:15Z\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":24,\"eval_count\":8,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_duration\":1378572000,\"message\":{\"role\":\"assistant\",\"content\":\"\"}}\n",
      "name" : "chat NDJSON\/pressure-before\/queued=true: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "chat NDJSON\/pressure-before\/queued=true: failed state absent",
      "passed" : false
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 381\r\nConnection: close",
      "name" : "OpenAI JSON\/pressure-before\/queued=true: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"model\":\"qwen3.8-flash-next:4bit\",\"usage\":{\"prompt_tokens\":24,\"completion_tokens\":8,\"prompt_tokens_details\":{\"cached_tokens\":0},\"total_tokens\":32},\"choices\":[{\"finish_reason\":\"length\",\"index\":0,\"message\":{\"role\":\"assistant\",\"content\":\"one two three four five six seven eight\"}}],\"object\":\"chat.completion\",\"id\":\"chatcmpl-C6A0250D-949C-447C-B540-1848E36AB032\",\"created\":1788714615}",
      "name" : "OpenAI JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "OpenAI JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : false
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: text\/event-stream\r\nTransfer-Encoding: chunked\r\nConnection: close",
      "name" : "OpenAI SSE\/pressure-before\/queued=true: correct header status",
      "passed" : false
    },
    {
      "detail" : "data: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"role\":\"assistant\",\"content\":\"one\"},\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-030F6861-76BC-41EB-9A9A-1086A135FD70\",\"created\":1788714618}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\" two\"},\"finish_reason\":null,\"index\":0}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-030F6861-76BC-41EB-9A9A-1086A135FD70\",\"created\":1788714618}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"finish_reason\":null,\"index\":0,\"delta\":{\"content\":\" three\"}}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-030F6861-76BC-41EB-9A9A-1086A135FD70\",\"created\":1788714618}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"finish_reason\":null,\"delta\":{\"content\":\" four\"}}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-030F6861-76BC-41EB-9A9A-1086A135FD70\",\"created\":1788714618}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"finish_reason\":null,\"index\":0,\"delta\":{\"content\":\" five\"}}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-030F6861-76BC-41EB-9A9A-1086A135FD70\",\"created\":1788714618}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\" six\"},\"finish_reason\":null,\"index\":0}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-030F6861-76BC-41EB-9A9A-1086A135FD70\",\"created\":1788714618}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"content\":\" seven\"},\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-030F6861-76BC-41EB-9A9A-1086A135FD70\",\"created\":1788714618}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"finish_reason\":null,\"delta\":{\"content\":\" eight\"},\"index\":0}],\"object\":\"chat.completion.chunk\",\"id\":\"chatcmpl-030F6861-76BC-41EB-9A9A-1086A135FD70\",\"created\":1788714618}\n\ndata: {\"object\":\"chat.completion.chunk\",\"choices\":[{\"finish_reason\":\"length\",\"index\":0,\"delta\":{}}],\"id\":\"chatcmpl-030F6861-76BC-41EB-9A9A-1086A135FD70\",\"created\":1788714618,\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: [DONE]\n\n",
      "name" : "OpenAI SSE\/pressure-before\/queued=true: typed terminal",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: no success DONE",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: no successful finish",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "OpenAI SSE\/pressure-before\/queued=true: failed state absent",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: text\/event-stream\r\nTransfer-Encoding: chunked\r\nConnection: close",
      "name" : "Gateway SSE\/pressure-before\/queued=true: correct header status",
      "passed" : false
    },
    {
      "detail" : "data: {\"type\":\"stream-start\",\"warnings\":[]}\n\ndata: {\"id\":\"gen_73225dcf\",\"modelId\":\"slotstream\\\/qwen3.8-flash-next:4bit\",\"timestamp\":\"2026-09-06T17:10:20Z\",\"type\":\"response-metadata\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-start\"}\n\ndata: {\"delta\":\"one\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" two\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" three\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" four\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" five\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" six\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" seven\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" eight\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-end\"}\n\ndata: {\"finishReason\":{\"raw\":\"length\",\"unified\":\"length\"},\"type\":\"finish\",\"usage\":{\"inputTokens\":{\"cacheRead\":0,\"cacheWrite\":0,\"noCache\":24,\"total\":24},\"outputTokens\":{\"reasoning\":0,\"text\":8,\"total\":8}}}\n\ndata: [DONE]\n\n",
      "name" : "Gateway SSE\/pressure-before\/queued=true: typed terminal",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: no success DONE",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: no successful finish",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "Gateway SSE\/pressure-before\/queued=true: failed state absent",
      "passed" : false
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
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 279\r\nConnection: close",
      "name" : "generate JSON\/pressure-after\/queued=true: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"total_duration\":2302723375,\"prompt_eval_duration\":804559042,\"created_at\":\"2026-09-06T17:10:27Z\",\"response\":\"\\n\\n<think>\\nThe user wants me to\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":12,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_count\":8,\"eval_duration\":1497878500}",
      "name" : "generate JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 20, want 0",
      "name" : "generate JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : false
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
      "detail" : "{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:10:27Z\",\"response\":\"\\n\\n\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:10:28Z\",\"response\":\"<think>\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:10:28Z\",\"response\":\"\\n\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:10:28Z\",\"response\":\"The\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:10:28Z\",\"response\":\" user\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:10:28Z\",\"response\":\" wants\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:10:28Z\",\"response\":\" me\"}\n{\"done\":false,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-06T17:10:29Z\",\"response\":\" to\"}\n{\"total_duration\":2206100125,\"prompt_eval_duration\":808728666,\"created_at\":\"2026-09-06T17:10:29Z\",\"response\":\"\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":12,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_count\":8,\"eval_duration\":1397040917}\n",
      "name" : "generate NDJSON\/pressure-after\/queued=true: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 20, want 0",
      "name" : "generate NDJSON\/pressure-after\/queued=true: failed state absent",
      "passed" : false
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 316\r\nConnection: close",
      "name" : "chat JSON\/pressure-after\/queued=true: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"total_duration\":2627050709,\"prompt_eval_duration\":1295748834,\"created_at\":\"2026-09-06T17:10:31Z\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":24,\"eval_count\":8,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_duration\":1331032542,\"message\":{\"role\":\"assistant\",\"content\":\"one two three four five six seven eight\"}}",
      "name" : "chat JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "chat JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : false
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
      "detail" : "{\"created_at\":\"2026-09-06T17:10:33Z\",\"message\":{\"role\":\"assistant\",\"content\":\"one\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:10:33Z\",\"message\":{\"role\":\"assistant\",\"content\":\" two\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:10:33Z\",\"message\":{\"role\":\"assistant\",\"content\":\" three\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:10:33Z\",\"message\":{\"content\":\" four\",\"role\":\"assistant\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:10:33Z\",\"message\":{\"content\":\" five\",\"role\":\"assistant\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:10:34Z\",\"message\":{\"role\":\"assistant\",\"content\":\" six\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:10:34Z\",\"message\":{\"content\":\" seven\",\"role\":\"assistant\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"created_at\":\"2026-09-06T17:10:34Z\",\"message\":{\"role\":\"assistant\",\"content\":\" eight\"},\"model\":\"qwen3.8-flash-next:4bit\",\"done\":false}\n{\"total_duration\":2605205333,\"prompt_eval_duration\":1282823291,\"created_at\":\"2026-09-06T17:10:34Z\",\"done\":true,\"done_reason\":\"length\",\"prompt_eval_count\":24,\"eval_count\":8,\"model\":\"qwen3.8-flash-next:4bit\",\"eval_duration\":1322120042,\"message\":{\"role\":\"assistant\",\"content\":\"\"}}\n",
      "name" : "chat NDJSON\/pressure-after\/queued=true: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "chat NDJSON\/pressure-after\/queued=true: failed state absent",
      "passed" : false
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "detail" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 381\r\nConnection: close",
      "name" : "OpenAI JSON\/pressure-after\/queued=true: correct header status",
      "passed" : false
    },
    {
      "detail" : "{\"choices\":[{\"index\":0,\"message\":{\"content\":\"one two three four five six seven eight\",\"role\":\"assistant\"},\"finish_reason\":\"length\"}],\"object\":\"chat.completion\",\"created\":1788714634,\"id\":\"chatcmpl-31125C9F-24CA-4AC1-A634-E7C1FCA0E34C\",\"usage\":{\"prompt_tokens_details\":{\"cached_tokens\":0},\"prompt_tokens\":24,\"completion_tokens\":8,\"total_tokens\":32},\"model\":\"qwen3.8-flash-next:4bit\"}",
      "name" : "OpenAI JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "OpenAI JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : false
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
      "detail" : "data: {\"choices\":[{\"delta\":{\"content\":\"one\",\"role\":\"assistant\"},\"finish_reason\":null,\"index\":0}],\"object\":\"chat.completion.chunk\",\"created\":1788714637,\"id\":\"chatcmpl-F48FC5AA-C237-4EEA-A47C-7678CC4B26A8\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"index\":0,\"delta\":{\"content\":\" two\"},\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"created\":1788714637,\"id\":\"chatcmpl-F48FC5AA-C237-4EEA-A47C-7678CC4B26A8\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"delta\":{\"content\":\" three\"},\"index\":0,\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"created\":1788714637,\"id\":\"chatcmpl-F48FC5AA-C237-4EEA-A47C-7678CC4B26A8\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"index\":0,\"finish_reason\":null,\"delta\":{\"content\":\" four\"}}],\"object\":\"chat.completion.chunk\",\"created\":1788714637,\"id\":\"chatcmpl-F48FC5AA-C237-4EEA-A47C-7678CC4B26A8\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"index\":0,\"delta\":{\"content\":\" five\"},\"finish_reason\":null}],\"object\":\"chat.completion.chunk\",\"created\":1788714637,\"id\":\"chatcmpl-F48FC5AA-C237-4EEA-A47C-7678CC4B26A8\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"finish_reason\":null,\"delta\":{\"content\":\" six\"},\"index\":0}],\"object\":\"chat.completion.chunk\",\"created\":1788714637,\"id\":\"chatcmpl-F48FC5AA-C237-4EEA-A47C-7678CC4B26A8\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"delta\":{\"content\":\" seven\"},\"finish_reason\":null,\"index\":0}],\"object\":\"chat.completion.chunk\",\"created\":1788714637,\"id\":\"chatcmpl-F48FC5AA-C237-4EEA-A47C-7678CC4B26A8\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"choices\":[{\"index\":0,\"finish_reason\":null,\"delta\":{\"content\":\" eight\"}}],\"object\":\"chat.completion.chunk\",\"created\":1788714637,\"id\":\"chatcmpl-F48FC5AA-C237-4EEA-A47C-7678CC4B26A8\",\"model\":\"qwen3.8-flash-next:4bit\"}\n\ndata: {\"object\":\"chat.completion.chunk\",\"choices\":[{\"index\":0,\"delta\":{},\"finish_reason\":\"length\"}],\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788714637,\"id\":\"chatcmpl-F48FC5AA-C237-4EEA-A47C-7678CC4B26A8\"}\n\ndata: [DONE]\n\n",
      "name" : "OpenAI SSE\/pressure-after\/queued=true: typed terminal",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: no success DONE",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: no successful finish",
      "passed" : false
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "OpenAI SSE\/pressure-after\/queued=true: failed state absent",
      "passed" : false
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
      "detail" : "data: {\"type\":\"stream-start\",\"warnings\":[]}\n\ndata: {\"id\":\"gen_35128a6b\",\"modelId\":\"slotstream\\\/qwen3.8-flash-next:4bit\",\"timestamp\":\"2026-09-06T17:10:39Z\",\"type\":\"response-metadata\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-start\"}\n\ndata: {\"delta\":\"one\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" two\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" three\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" four\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" five\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" six\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" seven\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" eight\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-end\"}\n\ndata: {\"finishReason\":{\"raw\":\"length\",\"unified\":\"length\"},\"type\":\"finish\",\"usage\":{\"inputTokens\":{\"cacheRead\":0,\"cacheWrite\":0,\"noCache\":24,\"total\":24},\"outputTokens\":{\"reasoning\":0,\"text\":8,\"total\":8}}}\n\ndata: [DONE]\n\n",
      "name" : "Gateway SSE\/pressure-after\/queued=true: typed terminal",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: no success DONE",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: no successful finish",
      "passed" : false
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "detail" : "got 32, want 0",
      "name" : "Gateway SSE\/pressure-after\/queued=true: failed state absent",
      "passed" : false
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
      "name" : "warm admission: only missing token is admitted",
      "passed" : false
    },
    {
      "name" : "warm admission: retained estimate is inside budget",
      "passed" : false
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
  "passed" : false
}

````

## http-11/stderr.txt

SHA-256 `5d779feaba2edfef122f98420fbad7ec3a88317e083a1acf0e4ce36a2bf40a8c`; 103 bytes.

````text
engine ready in 0.8s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]

````
