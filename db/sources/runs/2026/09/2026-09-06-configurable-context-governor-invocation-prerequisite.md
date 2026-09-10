---
type: run
id: 01m1w3ja85x1z8syw8zzs00qa5
created: 2026-09-06T19:36:47.109604+00:00
updated: 2026-09-06T19:36:47.280549+00:00
summary: Pressure fixture invocation stopped because its required option was missing
binary: 932c662f914981f240ed7b917847e9bc8a44a31aaf77428f8343c74cef9e5034
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Pressure fixture invocation stopped because its required option was missing
tool: Native Swift diagnostics and Python CLI gates
---
# Invocation prerequisite failure

A new bounded batch invoked governor-boundary-mtp without its required
SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR=1. The diagnostic exited immediately with a
clear prerequisite error and emitted no check report. This is an invocation
failure, not a product regression or a pressure/capacity result. No subsequent
HTTP or retained-state case ran in this batch, and the model process exited.

Review before the corrected invocation found a separate old-fixture mismatch:
its fake-zero governor availability must now leave admission refused until a
feasible recovery poll. The request's physical availability reader is already
independent of that planner seam. A prospective fixture correction explicitly
tests refused work, then chooses a recovery reading bounded by actual
reclaimable memory and verifies no growth plus exact retry output. Pressure
observability also needs to retain latency when the request guard runs before
the legacy callback. These edits require build 18 and do not inherit a pass.

Command: slotstream optimization-state-check --variant governor-boundary-mtp --json.

## Frozen build identity

```json
{
  "binary_sha256": "932c662f914981f240ed7b917847e9bc8a44a31aaf77428f8343c74cef9e5034",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "f6b812717fa77bf32bfa998b328ec5023c7e1a1a510b257ceb82f27edef9d1fe"
}
```

## governor-boundary-mtp-17/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## governor-boundary-mtp-17/stderr.txt

SHA-256 `fa2b96ab82ec594e7cba9cd1fbc82d194c7480b5da32fb2bbff65bed0033be15`; 186 bytes.

````text
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), mtp draft head on, eos [248044, 248046]
Error: diagnostic requires SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR=1

````
