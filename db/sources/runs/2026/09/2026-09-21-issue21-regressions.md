---
type: run
meta-type: fact
id: 01m315dzb8b83k9xkvecpb5tqg
created: 2026-09-21T05:01:16.008725+00:00
updated: 2026-09-21T05:02:53.848998+00:00
summary: 'Issue 21: streaming, multi-turn splicing and disk-restart regression evidence'
binary: 756f9a3aafae35d179493fa1c33b5d724176927e4ebc5926289a1a08b346b41c
captured_at: 2026-09-21
command: make build SLOTSTREAM_BUILD_JOBS=2; frozen slotstream-checks T0 and persistent round trip; python3 run_live.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Issue 21: streaming, multi-turn splicing and disk-restart regression evidence'
tool: slotstream-checks; Python HTTP/SSE gates
---
Functional issue-21 qualification on the development Mac, with ordinary user applications open. No induced memory pressure and no clean-throughput claim. Every server used an explicit 8.1 GB target, context 32768, vision off, MTP off, a private test prefix directory, and prefix-cache minimum 512. Model processes ran sequentially and both final servers were stopped and reaped.

## Exact evidence

[Artifact manifest](../../../artifacts/issue21-2026-09-21/manifest.json) records byte lengths and SHA-256 for every archived member; each archive was reopened and every member verified. The archives contain raw requests, SSE, arrival times, server logs, commands, executable build identity and exact build-source archives. They omit binaries and generated model state.

- [Official 0.2.20 baseline](../../../artifacts/issue21-2026-09-21/release-0.2.20.tar.gz): release identity, source probes, numeric-conversion trap stderr, real capped plain/unused-tools streams and incomplete-call error.
- [Intermediate repair and failed restart](../../../artifacts/issue21-2026-09-21/before-disk-history-fix.tar.gz): memory reuse passed but restart lost assistant reasoning from the reconstructed prompt. Retained as a counterexample, not a successful restart verdict.
- [Final repaired build](../../../artifacts/issue21-2026-09-21/fixed.tar.gz): T0, tensor round trip, full live gate, existing OpenAI gate and exact restart replay. Includes the issue and comments as fetched from GitHub.
- [Build transcript](../../../artifacts/issue21-2026-09-21/build.log), [issue gate](../../../artifacts/issue21-2026-09-21/issue21_gate.py), [OpenAI gate](../../../artifacts/issue21-2026-09-21/openai_tools_gate.py).

## Commands and identity

Built with `make build SLOTSTREAM_BUILD_JOBS=2`, then copied the executable, checks executable, metallib, identity and source archive into `/tmp/slotstream-issue21-final/bin` before tests. Source identity was verified by the build. The frozen executable prevents another task's concurrent rebuild from changing a running test.

```text
bin/slotstream-checks --tier t0 --json
bin/slotstream-checks --tier t1 --filter persistent-prefix-round-trip --json
python3 run_live.py
```

The exact `run_live.py` is in the final archive. It launches `bin/slotstream serve --model /Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit --memory-gb 8.1 --max-context 32768 --vision off --mtp off --port <ephemeral-loopback-port> --prefix-cache-dir /tmp/slotstream-issue21-final/prefix --prefix-cache-min-tokens 512`, invokes `Tools/issue21_gate.py` and `Tools/openai_tools_gate.py`, stops the server, restarts over the same disk cache, replays the third conversation request and asserts identical content, reasoning and prompt-token count with a disk hit.

Other tasks were editing the shared checkout. The exact tested source is frozen in the archive. Later changes to engine plan copying, status memory fields and CLI memory-limit validation are outside this run's qualification; the issue-21 parser, splicing, cache metadata and streaming implementations match the tested source.

Executable SHA-256: `756f9a3aafae35d179493fa1c33b5d724176927e4ebc5926289a1a08b346b41c`. Source archive SHA-256: `b9571fb7bf2dfa3980c00032c26c5094d76f8c0cc8db2ebac304c75be0a49461`.

Raw `t0.json`: 56 checks passed, 0 failed, 0 skipped, 29468 assertions.

Raw `persistent-round-trip.json`: 1 checks passed, 0 failed, 0 skipped, 94 assertions.

## Final live stdout, verbatim

```text
reclaimable_GB 29.97
{"name": "plain-cap", "finish": "length", "usage": {"prompt_tokens": 36, "total_tokens": 164, "prompt_tokens_details": {"cached_tokens": 0}, "completion_tokens": 128}, "data_events": 130}
{"name": "tools-unused-cap", "finish": "length", "usage": {"prompt_tokens": 275, "prompt_tokens_details": {"cached_tokens": 0}, "total_tokens": 403, "completion_tokens": 128}, "data_events": 130}
{"name": "long-truncated-argument", "finish": "length", "usage": {"prompt_tokens": 289, "total_tokens": 545, "prompt_tokens_details": {"cached_tokens": 0}, "completion_tokens": 256}, "data_events": 242}
{"name": "cache-turn-1", "finish": "stop", "usage": {"prompt_tokens": 1029, "prompt_tokens_details": {"cached_tokens": 0}, "total_tokens": 1058, "completion_tokens": 29}, "data_events": 29}
{"name": "cache-turn-2", "finish": "stop", "usage": {"prompt_tokens": 1603, "total_tokens": 1632, "prompt_tokens_details": {"cached_tokens": 1024}, "completion_tokens": 29}, "data_events": 29}
{"name": "cache-turn-3", "finish": "stop", "usage": {"total_tokens": 1683, "prompt_tokens_details": {"cached_tokens": 1536}, "prompt_tokens": 1654, "completion_tokens": 29}, "data_events": 29}
PASS stream reset leaves the server able to complete another request
PASS issue 21 streaming, length termination, three-turn reasoning reuse and server survival
PASS runtime context discovery agrees
PASS nonstream returns executable OpenAI function
PASS nonstream preserves function and typed arguments
PASS nonstream includes call identity and usage
PASS nonstream completes tool-result round trip
PASS stream returns executable OpenAI function
PASS stream preserves function and typed arguments
PASS stream includes call identity and usage
PASS stream completes tool-result round trip
PASS parallel false returns one complete call
PASS parallel stream has distinct complete calls
PASS parallel results match by call ID
PASS tool choice none remains text-only
PASS multiple initial instructions survive rendering
PASS reasoning separated from answer
PASS orphan-result rejected before inference
PASS missing-result rejected before inference
PASS context-inflation rejected before inference
PASS reasoning-conflict rejected before inference
PASS unknown-function rejected before inference
PASS unsupported structured output has actionable rejection
PASS budget exhaustion reports length False
PASS budget exhaustion reports length True
PASS request context limit is enforced before inference
{"passed": 24, "context": 32768, "model": "qwen3.8-flash-next:4bit"}
test_server_reaped 48944 0
reclaimable_GB 32.09
PASS restart restores a three-turn spliced conversation with identical output {'total_tokens': 1683, 'completion_tokens': 29, 'prompt_tokens_details': {'cached_tokens': 1536}, 'prompt_tokens': 1654}
test_server_reaped 52486 0
```

## Scope limits

This is functional qualification, not the reporter's full long-context workload. It does not reproduce or close the reported whole-process exits, busy pre-prefill stall, or pressure-related tail-throughput collapse. The exact client and complete logs are not attached to issue 21. The long-argument parser has a weights-free 16000-fragment regression; live cap tests use 128 or 256 tokens to exercise the failure boundaries without an unbounded generation. The full release battery, MTP/live vision combinations, and reporter hardware were not rerun for this change.
