---
type: run
id: 01m1w3ja132kaf3ebr3bvtc7aa
created: 2026-09-06T19:36:46.883590+00:00
updated: 2026-09-06T19:36:47.051317+00:00
summary: Combined candidate preserves the known rejected adaptive MTP counterexample
binary: 932c662f914981f240ed7b917847e9bc8a44a31aaf77428f8343c74cef9e5034
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Combined candidate preserves the known rejected adaptive MTP counterexample
tool: Native Swift diagnostics and Python CLI gates
---
# Unchanged default-off adaptive candidate failure

The adaptive-mtp diagnostic passes 258 of 259 assertions. The sole failure is
exactly the already preserved V50 counterexample: greedy token position 16 is
1002 instead of target-only 3431, with all preceding IDs equal. See
[[sources/runs/2026/09/2026-09-05-optimization-adaptive-speculation-counterexample]].
The optimization owner independently confirmed the exact IDs and scope.

The batch stops at this finding and every native process drains. The adaptive
option remains disabled, as required by its existing rejected status. This
result is not accepted as passing, not re-scored, and does not authorize a
baseline rerun merely to obtain green output. Fixed-MTP cancellation and
lifecycle passed immediately beforehand on this exact identified binary.

Command: slotstream optimization-state-check --variant adaptive-mtp --json.
The run overlaps a coordinated download; all timing and capacity is excluded.

## Frozen build identity

```json
{
  "binary_sha256": "932c662f914981f240ed7b917847e9bc8a44a31aaf77428f8343c74cef9e5034",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "f6b812717fa77bf32bfa998b328ec5023c7e1a1a510b257ceb82f27edef9d1fe"
}
```

## adaptive-mtp-17/stdout.txt

SHA-256 `085a6f2e7949a2061d276cc73c14c88f1052337ea8d79f29898ea957b8fde84f`; 22515 bytes.

````text
{
  "items" : [
    {
      "name" : "replayed cost observations preserve exact IDs",
      "passed" : true
    },
    {
      "name" : "replayed cost observations preserve exact decisions",
      "passed" : true
    },
    {
      "name" : "three useful target steps calibrate before drafting",
      "passed" : true
    },
    {
      "name" : "three expensive draft rounds then disable",
      "passed" : true
    },
    {
      "name" : "requested output count is preserved",
      "passed" : true
    },
    {
      "name" : "plain fallback emits real target tokens",
      "passed" : true
    },
    {
      "name" : "plain fallback leaves the final emitted token pending",
      "passed" : true
    },
    {
      "name" : "disabled head state is invalidated",
      "passed" : true
    },
    {
      "name" : "replayed state has exactly the same fields",
      "passed" : true
    },
    {
      "name" : "replayed state conv.0 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.1 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.10 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.12 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.13 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.14 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.16 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.17 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.18 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.2 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.20 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.21 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.22 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.24 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.25 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.26 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.28 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.29 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.30 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.32 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.33 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.34 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.36 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.37 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.38 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.4 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.40 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.41 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.42 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.44 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.45 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.46 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.5 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.6 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.8 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.9 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.11 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.15 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.19 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.23 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.27 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.3 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.31 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.35 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.39 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.43 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.47 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.7 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.11 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.15 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.19 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.23 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.27 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.3 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.31 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.35 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.39 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.43 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.47 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.7 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ngram is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ple.1 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.0 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.1 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.10 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.12 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.13 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.14 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.16 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.17 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.18 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.2 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.20 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.21 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.22 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.24 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.25 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.26 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.28 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.29 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.30 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.32 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.33 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.34 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.36 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.37 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.38 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.4 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.40 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.41 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.42 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.44 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.45 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.46 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.5 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.6 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.8 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.9 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state tokens is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.11 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.15 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.19 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.23 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.27 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.3 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.31 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.35 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.39 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.43 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.47 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.7 is exact",
      "passed" : true
    },
    {
      "name" : "continued invalid-head prefix emits exact tokens",
      "passed" : true
    },
    {
      "name" : "continued invalid-head prefix is reused",
      "passed" : true
    },
    {
      "name" : "continued prefix never drafts on stale head state",
      "passed" : true
    },
    {
      "name" : "continued prefix has no adaptive head decisions",
      "passed" : true
    },
    {
      "name" : "stop at first plain output preserves exact prefix",
      "passed" : true
    },
    {
      "name" : "stop at first plain output is reported",
      "passed" : true
    },
    {
      "name" : "stop leaves its emitted token unconsumed",
      "passed" : true
    },
    {
      "name" : "stop cannot reactivate the head",
      "passed" : true
    },
    {
      "name" : "resident head stays loaded and must remain charged",
      "passed" : true
    },
    {
      "detail" : "got [418, 11, 198, 27, 91, 1152, 52933, 91, 29, 27, 91, 244288, 60470, 91, 29, 1002], want [418, 11, 198, 27, 91, 1152, 52933, 91, 29, 27, 91, 244288, 60470, 91, 29, 3431]",
      "name" : "adaptive greedy IDs agree with target-only decode",
      "passed" : false
    },
    {
      "name" : "short 1: exact target prefix",
      "passed" : true
    },
    {
      "name" : "short 1: no unused draft",
      "passed" : true
    },
    {
      "name" : "short 1: exact useful calibration count",
      "passed" : true
    },
    {
      "name" : "short 1: pending output accounting",
      "passed" : true
    },
    {
      "name" : "short 1: aligned head",
      "passed" : true
    },
    {
      "name" : "short 2: exact target prefix",
      "passed" : true
    },
    {
      "name" : "short 2: no unused draft",
      "passed" : true
    },
    {
      "name" : "short 2: exact useful calibration count",
      "passed" : true
    },
    {
      "name" : "short 2: pending output accounting",
      "passed" : true
    },
    {
      "name" : "short 2: aligned head",
      "passed" : true
    },
    {
      "name" : "short 3: exact target prefix",
      "passed" : true
    },
    {
      "name" : "short 3: no unused draft",
      "passed" : true
    },
    {
      "name" : "short 3: exact useful calibration count",
      "passed" : true
    },
    {
      "name" : "short 3: pending output accounting",
      "passed" : true
    },
    {
      "name" : "short 3: aligned head",
      "passed" : true
    },
    {
      "name" : "short 4: exact target prefix",
      "passed" : true
    },
    {
      "name" : "short 4: no unused draft",
      "passed" : true
    },
    {
      "name" : "short 4: exact useful calibration count",
      "passed" : true
    },
    {
      "name" : "short 4: pending output accounting",
      "passed" : true
    },
    {
      "name" : "short 4: aligned head",
      "passed" : true
    },
    {
      "name" : "callback 1: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 1: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 1: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 1: head validity",
      "passed" : true
    },
    {
      "name" : "callback 2: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 2: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 2: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 2: head validity",
      "passed" : true
    },
    {
      "name" : "callback 3: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 3: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 3: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 3: head validity",
      "passed" : true
    },
    {
      "name" : "callback 4: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 4: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 4: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 4: head validity",
      "passed" : true
    },
    {
      "name" : "callback 5: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 5: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 5: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 5: head validity",
      "passed" : true
    },
    {
      "name" : "callback 6: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 6: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 6: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 6: head validity",
      "passed" : true
    },
    {
      "name" : "callback 7: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 7: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 7: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 7: head validity",
      "passed" : true
    },
    {
      "name" : "callback 8: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 8: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 8: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 8: head validity",
      "passed" : true
    },
    {
      "name" : "callback 9: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 9: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 9: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 9: head validity",
      "passed" : true
    },
    {
      "name" : "callback 10: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 10: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 10: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 10: head validity",
      "passed" : true
    },
    {
      "name" : "callback 11: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 11: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 11: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 11: head validity",
      "passed" : true
    },
    {
      "name" : "callback 12: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 12: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 12: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 12: head validity",
      "passed" : true
    },
    {
      "name" : "callback 13: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 13: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 13: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 13: head validity",
      "passed" : true
    },
    {
      "name" : "callback 14: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 14: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 14: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 14: head validity",
      "passed" : true
    },
    {
      "name" : "callback 15: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 15: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 15: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 15: head validity",
      "passed" : true
    },
    {
      "name" : "callback 16: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 16: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 16: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 16: head validity",
      "passed" : true
    },
    {
      "name" : "EOS 0: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 0: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 0: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 1: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 1: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 1: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 2: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 2: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 2: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 3: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 3: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 3: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 4: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 4: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 4: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 5: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 5: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 5: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 6: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 6: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 6: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 8: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 8: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 8: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 11: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 11: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 11: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 12: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 12: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 12: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 15: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 15: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 15: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: exact prefix",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: cancellation reason",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: typed cancellation",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: no unrequested fallback",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: pending output accounting",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: aligned reusable head",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: exact prefix",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: cancellation reason",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: typed cancellation",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: no unrequested fallback",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: pending output accounting",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: aligned reusable head",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-adaptive-mtp",
  "passed" : false
}

````

## adaptive-mtp-17/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````
