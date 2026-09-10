---
type: run
id: 01m1wamhfw9fdh2rbz3tzrsb3b
created: 2026-09-06T21:40:20.091561+00:00
updated: 2026-09-06T21:40:20.347904+00:00
summary: Actual Hermes compression finishes normally and preserves the exact diagnostic fact
binary: ad2ce4e7aab9fd5f1c0819ee876ec17288e9303d67b360ca3b3a6bb148b7bbed
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Actual Hermes compression finishes normally and preserves the exact diagnostic fact
tool: Native Swift diagnostics and Python CLI gates
---
# Real Hermes compression extension

The unchanged separately installed Hermes release at
commit29112bef099274229cadff79cdff7bf7b99c4b77 passes the forced-compression
extension against build20 at65536. Its real agent first completes the
allowlisted fixture read, follow-up and local title call. The compressor then
makes one actual model call, finishes with stop, and reduces the constructed
39-message/99684-character history to25messages/87508characters. A subsequent
real agent answer correctly retains HERMES_SLOTSTREAM_INTEGRATION_42 without
another tool. All main agent requests preserve the4096-token output budget;
the actual compression threshold is52224 and discovered num_ctx is65536.

Command: pinned-Hermes-python Tools/hermes_integration_gate.py <clean-source>
<output> --port11620 --context65536 --compress. The single frozen server uses
--memory-gb10 --mtp off --vision off --max-context65536 --max-prefill-wait0
--no-elastic. The client completes within the prospectively bounded650-second
ceiling. The earlier CLI extension and this compression extension share one
server; all owned children exit at completion, the listening socket closes,
and the model exclusion lock is independently acquired/released afterward.

The reduced history preserves Hermes's retained recent messages and structured
handoff; the criterion is actual reduction and exact fact recovery, not an
arbitrary compression ratio. No output, timeout, numerical criterion or
expected fact was changed after observing the run. Raw local result and HTTP
transcript bytes are bound by hashes in the explicitly labeled public
projection. This coordinated download-overlap interval supports compatibility
only; timing and capacity claims remain excluded. Image extensions, P5
full-window capacity and P6 release/install/rollback remain open.

## Frozen build identity

```json
{
  "binary_sha256": "ad2ce4e7aab9fd5f1c0819ee876ec17288e9303d67b360ca3b3a6bb148b7bbed",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "eee2fb76aa1c04f08daa3ab4dde7792b3ec2be4caf74c73c62904a452a410bfc"
}
```

## hermes-compression-20-public.json

SHA-256 `5a2a138639d8a6d85a9526b4118f66682ff405394b6bfab50e905e0d78a8eaef`; 1154 bytes.

````text
{
  "passed": true,
  "context_length": 65536,
  "compression_threshold": 52224,
  "ollama_num_ctx": 65536,
  "main_output_budgets": [
    4096,
    4096,
    4096,
    4096
  ],
  "expected_context": 65536,
  "client_revision": "29112bef099274229cadff79cdff7bf7b99c4b77",
  "compression": {
    "before_messages": 39,
    "after_messages": 25,
    "before_chars": 99684,
    "after_chars": 87508,
    "http_requests": 1,
    "finish_reasons": [
      "stop"
    ]
  },
  "after_compression": {
    "completed": true,
    "final_response": "The exact diagnostic code is `HERMES_SLOTSTREAM_INTEGRATION_42`."
  },
  "tool_turn_completed": true,
  "followup_completed": true,
  "actual_allowlisted_tool_executions": 1,
  "blocked_nonlocal_connection_attempts": 0,
  "projection": "Whitelisted exact result fields; network addresses and private scratch paths omitted.",
  "raw_files": {
    "result.json": {
      "sha256": "c33be745b7e91abf2447e0e449d8b9a1081d5035ad0d8f33ac0d01105eacf7b8",
      "bytes": 185148
    },
    "http.json": {
      "sha256": "360e3b2a618e22742ffe64a8307abbd783f1549346bae6e5c850aa8e95fe50a0",
      "bytes": 475983
    }
  }
}

````
