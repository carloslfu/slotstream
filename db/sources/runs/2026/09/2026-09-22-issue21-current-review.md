---
type: run
id: 01m35twgqs4b244c1y0t93e45t
created: 2026-09-23T00:33:10.393630+00:00
updated: 2026-09-23T00:34:09.499613+00:00
summary: 'Current-code issue 21 audit: published acceptance verified, fresh API and 51K restart pass, two additional defects reproduced.'
binary: 981fe6fb8064e1d457946effaca4e9f279b823f9ba6707cf991af4863de8b38d
captured_at: 2026-09-22
command: T0/runtime; run-live.py; issue21_long_context.py --max-context 131072; compiled parser/cache probes; release archive verification
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Issue 21 current-code review and regression evidence
tool: slotstream-checks; Swift parser/cache probes; Python HTTP/SSE harnesses
---
Current-code follow-up to [[sources/runs/2026/09/2026-09-21-issue21-qualification]]. The review compares GitHub issue 21, published v0.2.23, current HEAD `13934f50486c6211a4d70687c79ab9960436d8fa` and the shared checkout. Production `Sources/Slotstream` matches the release tag exactly. The current build differs from the installed release in three diagnostic/CLI benchmark sources only. No production code was changed by this review.

## Immutable evidence

[Raw capture](../../../artifacts/issue21-current-review-2026-09-22/capture.tar.gz) and [per-file manifest](../../../artifacts/issue21-current-review-2026-09-22/capture-manifest.json) were written before this transcription. All 72 archive members were reopened and verified against byte counts and SHA-256. The capture contains build identity and exact source archive, review receipts, current issue JSON, probe source and link commands, raw T0/runtime output, live driver and gate copies, HTTP requests/SSE, server logs, restart results and long-context driver/results. Executables and generated prefix-state files are excluded.

The current executable is `981fe6fb8064e1d457946effaca4e9f279b823f9ba6707cf991af4863de8b38d`. Its source hashes still matched the checkout after testing. The independently published executable is `5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89`; its existing release evidence is [[sources/runs/2026/09/2026-09-22-release-0-2-23-published-and-installed]]. This review reopened that release archive, verified all 134 members and inspected the acceptance logs and receipts. The full release battery was not rerun here.

## Commands and observations

Principal fresh commands, with exact paths/arguments in the capture:

```text
<candidate>/slotstream-checks --tier t0 --json
<candidate>/slotstream runtime-check
python3 <captured run-live.py>
python3 Tools/issue21_long_context.py --binary <candidate>/slotstream --out <capture>/long131k --max-context 131072
swiftc <captured branch-probe.swift and current library objects>
swiftc <captured nullable-probe.swift and current library objects>
```

T0 passed 57 groups and 29659 assertions, no failures or skips. Runtime passed. The live driver passed issue-21 streaming/cap termination, a 256-token truncated string argument, three-turn omitted-reasoning reuse, TCP-reset survival, all 24 OpenAI checks and exact restart replay. Ordinary server target was 8.1 GB, configured context 32768, MTP and vision off. Both servers exited cleanly and were reaped.

The long-context driver used 13.5 GB at configured context 131072, with a target-plus-3 GB real reclaimable preflight, one owned model process at a time, MTP and vision off. Prompt sizes were 30288, 51364 and 51407. Reuse advanced from 30208 to 51200 tokens. The last request reread 207 tokens; its answer, reasoning and usage were identical after restart. Both final requests allowed 16000 output tokens and naturally generated 21. Both servers were reaped with exit code zero. The final receipt found no model process and no model-lock holder.

The branch probe uses metadata-only states and real `PrefixCache`, assistant-turn slicing/compatibility helpers and persistent policy. It proves selection of a longer incompatible branch despite a compatible shorter retained branch. It is not a real-model branched HTTP conversation. The schema probe uses the real parser: string and `anyOf` shapes emitted 200 argument deltas before close and preserved `00123` as a string; the nullable type-array shape emitted zero deltas and produced integer 123.

## Limits

This is functional evidence, not a clean-host timing comparison. No induced memory pressure, reporter-hardware reproduction, full configured-window prompt or actual 16000-token generation was run. The original intermittent daemon exits and prolonged CPU-busy stall did not reproduce. The exact reporter client and complete logs remain absent from the issue. A separate release CLI exit with discarded stderr is preserved in the earlier release evidence; this review does not identify it as the same failure.
