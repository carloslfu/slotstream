---
type: run
meta-type: fact
created: 2026-09-21T15:39:18.449481+00:00
updated: 2026-09-21T15:39:18.449481+00:00
summary: Isolated memory commit compiles and passes policy, CLI, general checks and the previously blocked real server rerun.
title: Adaptive memory isolated commit qualification
tool: clean release build, policy proxy, CLI matrix and bounded real server
command: Exact commands and raw outputs below and in the evidence archive
binary: dc27f9a68d9568239563238cbd13e319374719cd1dca777d85212188b93b36eb
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
captured_at: 2026-09-21
discarded: false
---
# Isolated memory commit qualification

Prepared the memory-only changes over `5d24e189337d35169623f7680a3a509adb911a36` in a separate scratch checkout. Excluded the concurrent issue-21 parser, conversation-cache, progress and diagnostics changes, including their hunks in Engine, Server and the CLI. Regenerated documentation and db.md indexes from the selected sources. The original working tree's unrelated changes remain intact. This verifies that the memory commit stands on its own, after [[sources/runs/2026/09/2026-09-21-adaptive-memory-third-review]].

The clean release build passed. The exact candidate passed 420 CLI cases, 964828 pure assertions including 591 memory assertions, and 54 T0 groups with 29130 assertions and no failures or skips. This T0 count excludes the other task's uncommitted checks. Harness suites passed 22 verification, seven planner and four consumer checks. An initial planner-harness invocation used a nonexistent filename; the corrected Tools/planner_gates_test.py run passed. That command error is retained and is not a product failure.

The previously blocked live rerun now passes on this binary: a real server retains the fractional 9.99 GB adaptive ceiling through its production timer, status calls and a completed inference request. The server is reaped. Normal shared process exclusion and real reclaimable-memory preflight were used. No memory hog or larger-hardware allocation was attempted. This does not repeat the full release acceptance battery or qualify a real 64 GiB Mac.

The earlier receipts retain native UI and lifecycle results. The native memory source changes are identical in this isolated commit; they are not reported as fresh native test runs here. Claims and generated-file checks pass. Store validation has zero errors and two pre-existing historical log warnings.

[Raw evidence archive](../../../artifacts/adaptive-memory-commit-2026-09-21/evidence.tar.gz) and [member manifest](../../../artifacts/adaptive-memory-commit-2026-09-21/manifest.json) retain exact outputs, binary identity and candidate Swift source hashes. Executables and weights are excluded. All archived members were verified by hash.

```sh
swift build -c release -j 2
python3 Tools/context_proxy.py --out /tmp/memory-commit-proxy
.build/release/slotstream-checks --tier t0 --json
python3 Tools/memory_override_gate.py --binary .build/release/slotstream --out /tmp/memory-commit-cli.json
python3 Tools/adaptive_memory_e2e.py --binary <isolated-checkout>/.build/release/slotstream --limit-gb 9.99 --out /tmp/memory-commit-server
python3 Tools/verify_binary_test.py
python3 Tools/planner_gates_test.py
python3 Tools/consumer_smoke_test.py
```

The adaptive server command runs from the normal workspace to find its installed weights; its binary comes from the isolated checkout and the driver is byte-identical in both trees. The other commands run in the isolated checkout. Memory changes remain listed under Unreleased for the next release. The published version remains 0.2.22; no date or next version is promised, and no release tag or publication is authorized by this commit request.

## Public server result

```json
{
  "passed": true,
  "binary_sha256": "dc27f9a68d9568239563238cbd13e319374719cd1dca777d85212188b93b36eb",
  "limit_gb": 9.99,
  "no_elastic": false,
  "preflight_available_gb": 23.210098688,
  "command": [
    "slotstream",
    "serve",
    "--memory-limit-gb",
    "9.99",
    "--max-context",
    "32768",
    "--max-prefill-wait",
    "17",
    "--mtp",
    "off",
    "--vision",
    "off",
    "--port",
    "62406"
  ],
  "completion": {
    "index": 0,
    "message": {
      "content": "The Nile.",
      "role": "assistant"
    },
    "finish_reason": "stop"
  },
  "server_reaped": true
}
```
