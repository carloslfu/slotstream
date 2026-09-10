---
type: run
id: 01m1wafga7zpymgsf0b11y8285
created: 2026-09-06T21:37:35.046736+00:00
updated: 2026-09-06T21:37:35.474691+00:00
summary: Actual Hermes CLI passes its configured 65K window and reply budget
binary: ad2ce4e7aab9fd5f1c0819ee876ec17288e9303d67b360ca3b3a6bb148b7bbed
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Actual Hermes CLI passes its configured 65K window and reply budget
tool: Native Swift diagnostics and Python CLI gates
---
# Real Hermes CLI extension

The unchanged separately installed Hermes release at
commit29112bef099274229cadff79cdff7bf7b99c4b77 completes its real one-shot CLI
entry point against build20. It returns exit0 and exactly OK, uses the
documented explicit65536 context and4096 main output budget, and executes
zero tools. Its separate HERMES_HOME preserves existing user settings. Dummy
local credentials and a loopback-only connection guard prevent provider use;
one attempted nonlocal background connection is refused by that guard.

Command: pinned-Hermes-python Tools/hermes_integration_gate.py <clean-source>
<output> --port11620 --context65536 --cli. The one server uses --memory-gb10
--mtp off --vision off --max-context65536 --max-prefill-wait0 --no-elastic.
This is the actual client CLI, rather than a custom reproduction of its wire
format. Its terminal dispatcher is constrained to refuse all tool execution
for the greeting fixture. The existing agent tool/follow-up/title gate was
captured separately on build18.

Forced compression is a separate still-running test at this capture; image
extensions, full-window capacity and release/install/rollback remain open.
This coordinated download-overlap interval supports compatibility only, not
latency or capacity. The public projection names its omissions and binds the
full raw local result and HTTP transcript by exact SHA-256 and byte count.

## Frozen build identity

```json
{
  "binary_sha256": "ad2ce4e7aab9fd5f1c0819ee876ec17288e9303d67b360ca3b3a6bb148b7bbed",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "eee2fb76aa1c04f08daa3ab4dde7792b3ec2be4caf74c73c62904a452a410bfc"
}
```

## hermes-cli-20-public.json

SHA-256 `ee3a04d38ad1662544d7355f62d0275fd6eb4c27a53f352818890d4592bdcc70`; 659 bytes.

````text
{
  "passed": true,
  "cli_exit": 0,
  "cli_answers": [
    "OK"
  ],
  "main_output_budgets": [
    4096
  ],
  "executions": [],
  "expected_context": 65536,
  "client_revision": "29112bef099274229cadff79cdff7bf7b99c4b77",
  "blocked_nonlocal_connection_attempts": 1,
  "projection": "Whitelisted exact result fields; network addresses and private scratch paths omitted.",
  "raw_files": {
    "result.json": {
      "sha256": "c6c0da16ac9ee78eff8c38529c1c0fc201ca114d3aa00e99cba3c6776b34479b",
      "bytes": 229
    },
    "http.json": {
      "sha256": "96352f97af0848ced18f215a84609d3a0679a71e0854f1c8f49e5c9c735da921",
      "bytes": 26032
    }
  }
}

````
