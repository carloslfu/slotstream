---
type: measurement
id: 01m31bp6ptjvdgf98mbsx8sz3b
created: 2026-09-21T06:50:37.146541+00:00
updated: 2026-09-21T06:50:37.146541+00:00
summary: 'Issue 21: long conversations and full acceptance pass; original intermittent failures remain unproven'
date: 2026-09-21
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Functional qualification across frozen builds; largest actual prompt 51413 tokens, no clean throughput claim or reproduction of the original intermittent exits/stall.
order: '1600'
runs: '[[sources/runs/2026/09/2026-09-21-issue21-qualification]]'
title: 'Issue 21: long conversations and full acceptance qualification'
status: measured
---
The confirmed issue-21 streaming and conversation-cache defects now have passing long-context and full acceptance coverage. This extends [[records/measurements/issue21-serving-regressions-2026-09-21]], whose original findings and narrower evidence remain preserved. It does not establish a cause or fix for every symptom in the report.

## Results

[[sources/runs/2026/09/2026-09-21-issue21-qualification]] preserves raw requests, streams, logs, failures, drivers and exact source/executable identities before this transcription.

| Check | Result |
| --- | --- |
| Full acceptance battery | 29 passed, 0 failed, including MTP, vision, cache/logit equality, bounded pressure recovery, process-memory gates and API robustness |
| Tensor/format tier | All 15 T1 groups passed |
| Serving diagnostics | Context, output, pressure boundary and persistent-prefix checks passed; pressure/persistence variants also passed with MTP |
| Final checkout T0/runtime | All 56 T0 groups passed, 29478 assertions, no skips; runtime check passed |
| Final live API | Issue-21 streaming/termination/cache/disconnect suite, all 24 OpenAI checks and exact disk restart passed |
| Final adaptive server | Kept the explicit 10 GB ceiling through startup cooldown and completed a request |
| Long conversation | Prompt grew from 30288 to 51367 to 51413 tokens; reused numerical state advanced from 30208 to 51200 tokens, including after restart |

The last follow-up reread only 213 tokens. Its reply, reasoning and usage matched after a real server restart. This passed at configured windows 65536 with a 10 GB target and 131072 with a 13.5 GB target, MTP and vision off. The larger-window follow-up and replay allowed 16000 output tokens and naturally produced 24. The window is a configured maximum; the largest actual prompt was 51413 tokens.

The full battery used frozen executable `cc39e86eab88e3873d4c2fad47fb1e0505df63eb75d3d79da8da750c3e42fce0`. After another task added legacy Swift callable overloads and adaptive-policy guards, final checkout executable `7a4ae53bb0ce8e1fbdeb0df7f83685cea7c7b28e341a779814fb6e6fa48d0694` passed T0/runtime, live API/restart and bounded adaptive serving. The 29-gate battery was not repeated on that final executable. The run records each build separately and verifies final source hashes.

## Additional corrections made during qualification

Broader tests exposed stale assumptions in diagnostics. Each was checked against actual engine behavior before changing the assertion:

- Context-serving counted only retained conversation tokens even though ownership includes the numerical checkpoint too. It also expected all 515 prompt tokens to be reusable where the valid aligned boundary is 512. It now checks exact retained history and rereading of the suffix from the actual safe boundary.
- Output-serving expected a generic inference error for low memory. It now requires the typed `insufficient_memory` response and HTTP 503. A second request remains refused while simulated headroom is zero, then succeeds only after a recovery bounded by real available memory and the normal governor policy.
- The pressure-scope fixture injected pressure on a continuation poll that occurred after the read scope had committed. It now injects at an actual layer router callback inside the scope and explicitly requires an aborted read with zero committed tokens. For this focused test, it disables checkpoint splitting temporarily so the intended multi-pass scope exists, then restores the setting. Plain and MTP variants pass.

These are test repairs, not a weakening of numerical resume boundaries or production memory protection. Earlier failed attempts remain in the evidence archives.

## What remains unproven

The original intermittent whole-process exits and 20-minute busy stall did not reproduce. TCP-reset survival, long conversation completion and restart replay passed, but they cannot identify an unobserved failure's cause. A supplied 200-turn history also completed; it was not 200 real sequential generations. The exact client and complete logs were not attached to the issue at capture time.

Live length-boundary tests use bounded generation; a 16000-token allowance is not evidence of 16000 generated tokens. The weights-free parser fixture separately covers 16000 escaped Unicode fragments. The configured 131K-window run is not full-window prompt qualification. No induced pressure workload or reporter-hardware test was run, and long-context tail timing on this active machine is not a performance benchmark. MTP/vision pass their acceptance fixtures, not every combination with this long-conversation workload.

All owned servers were stopped and reaped. The repairs and evidence are local and have not been published as a release. Ollama tool calling remains outside the adapter's supported scope, with an actionable OpenAI-endpoint refusal; unsupported persistence semantics remain explicit refusals.
