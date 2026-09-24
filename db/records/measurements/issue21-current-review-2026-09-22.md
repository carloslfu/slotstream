---
type: measurement
id: 01m35tyamm25nkcq4324pnrh94
created: 2026-09-23T00:34:09.684149+00:00
updated: 2026-09-23T03:08:45.180557+00:00
summary: 'Issue 21 reassessment: v0.2.23 release acceptance is complete; fresh 51K/restart checks pass, but nullable-string schema and branched-cache defects remain.'
date: 2026-09-22
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Historical review at 13934f5; both reproduced edge cases are subsequently repaired and qualified in [[records/measurements/issue21-edge-fixes-2026-09-22]]. Original intermittent failures remain unproven.
order: '1640'
runs: '[[sources/runs/2026/09/2026-09-22-issue21-current-review]]'
title: 'Issue 21 current-code reassessment: shipped repairs and remaining edge cases'
status: measured
---
The earlier confirmed issue-21 repairs are present in published v0.2.23 and current production code. Publication and acceptance of the exact final release bytes are complete. This supersedes those two outstanding-work statements in the historical [[records/measurements/issue21-long-context-qualification-2026-09-21]], without changing its frozen evidence. A fresh review found two additional actionable edge cases, reproduced but not repaired in this audit.

Evidence: [[sources/runs/2026/09/2026-09-22-issue21-current-review]]. Reviewed HEAD is `13934f50486c6211a4d70687c79ab9960436d8fa`; production `Sources/Slotstream` is identical to v0.2.23. Existing uncommitted diagnostic/CLI experiments were preserved. This audit made no production changes.

## New findings

**P2: nullable string type arrays lose streaming and type fidelity.** `ToolDefinition.schema` in `Sources/Slotstream/ToolCallSplitter.swift:560` recognizes scalar `type` and the special nullable `anyOf` form, but treats `{"type":["string","null"]}` as unknown. Type arrays are a [valid JSON Schema representation](https://json-schema.org/understanding-json-schema/reference/type). The actual parser probe emitted 200 incremental argument deltas for the scalar and `anyOf` forms and none before close for the type-array form. It also converted the declared string `00123` to integer 123. Normalize the equivalent single-non-null type forms, preserve declared string bytes and add incremental, numeric-string, nullable-value and truncation cases. Genuine unions need an explicit conservative policy. These results establish buffering and wrong coercion; this audit did not test capped wire output for this schema shape.

**P2: longest cache branch can hide a compatible retained branch.** `Engine.swift:565` asks `PrefixCache.peek(extending:)` for the longest descendant, then abandons splicing at line 571 if that descendant's assistant reply does not match the submitted history. Neither it nor the persistent selector tries a shorter compatible branch. A metadata-only probe retained both branches and reproduced selection/rejection of the wrong one through real library helpers, including the persistent policy. For omitted reasoning, fallback rendering loses the exact saved IDs and can cause avoidable rereading. This is a cache-reuse defect, not acceptance of an incompatible numerical state, and not a proven cause of the reporter's process exits. Select compatible assistant-turn candidates before committing to a descendant, across RAM and disk, and add branched-history regression coverage. Preserve the existing public longest-entry lookup contract if adding a separate candidate API.

## Original report, one item at a time

| Reported behavior | Current disposition |
| --- | --- |
| Whole-context reread on follow-up | Linear omitted-reasoning conversations and persisted exact IDs now work, including the fresh 51K/restart run. The branch-selection edge case above remains; legitimate memory/provenance misses must still reread. |
| Long tool argument delivered only at completion | Incremental string parsing and bounded scanning shipped and pass. Nullable type arrays remain a confirmed hole. |
| Tools present but unused | Fresh bounded cap and natural completion pass, including a 16000-token allowance. No actual 16000-token generation was run. |
| Streaming cap lacks terminal result | Fresh plain/tool cases return length, requested usage and DONE. The original generic missing-terminal failure did not reproduce independently. |
| Omitted max_tokens becomes 512 | Current Chat Completions uses the advertised output budget, capped by remaining request context, rather than the historical 512-token cap. This was already repaired after v0.2.20. |
| store rejected | store:false and declared compatibility fields are accepted. store:true and unsupported semantics retain explicit refusals. Arbitrary unknown fields are not silently accepted. |
| Ollama tools rejected | Intentionally unsupported; refusal now directs clients to the OpenAI endpoint. |
| Sparse progress and misleading ETA | Time-based prefill progress, recent-rate estimates, request-phase heartbeats and cache diagnostics are present. |
| Intermittent daemon exits and prolonged busy stall | Still unreproduced. The exact reporter client and complete logs remain unavailable in the issue. |
| Pressure-related long-context tail collapse | Not qualified as fixed. This review ran no induced-pressure workload or clean timing comparison. |

## What newer changes accomplished

[[records/measurements/release-0-2-23-published-2026-09-22]] establishes public distribution, identical CI/public/installed bytes, 32 native acceptance gates, a 13-assertion 16K MTP gate and 31 installed-serving checks. This audit reopened the raw capture, verified all 134 members and inspected its results; it did not rerun that entire battery. The first release attempt's unexplained CLI exit code 2 remains preserved, followed by successful isolated and complete reruns. It cannot establish the cause of the reported daemon failures.

The release adds automatic expert read grouping, the pinned fused MLX backend, MTP phase accounting/bounded writes, cache arithmetic provenance and backend/environment identity checks. These improve qualified prompt workloads and prevent unsafe reuse. [[records/measurements/published-prompt-speed-audit-2026-09-22]] separately demonstrates reuse savings and records long-prompt timing exclusions.

The expanded read-sharing and reduced workspace accounting in `PrefillReadPolicy` and `ContextMemory` are deliberately confined to the measured 256-query/16K-key envelope and qualified platform. Outside it the established conservative accounting remains, even if a kernel itself still fuses. Removing those limits without allocation, parity, cancellation and timing qualification would not be a justified fix for the 51K tail.

## Fresh verification

The current build passed all 57 T0 groups, 29659 assertions and runtime checks. The live issue-21 suite passed caps, incremental truncated string arguments, omitted-reasoning reuse, disconnect survival and restart. All 24 OpenAI compatibility checks passed.

On the new backend, the long conversation grew from 30288 to 51364 to 51407 prompt tokens. Reuse advanced from 30208 to 51200 tokens. The last request reread only 207 tokens and returned identical answer, reasoning and usage after restart. The configured window was 131072, target 13.5 GB, MTP and vision off. Final replies allowed 16000 output tokens but naturally produced 21. These are functional results, not full-window, long-generation or pressure/timing qualification. All owned servers were reaped and the model lock was free.

Required follow-up is to repair the two reproduced edge cases with focused regressions, then repeat the affected serving/cache checks. The issue-specific live scripts are documented but are not directly called from `verify.sh`, `e2e_release.sh` or the workflows at this checkout; include durable coverage of these cases in the accepted regression path. Obtain an exact recurrence/client trace before claiming a cause for the original exits or stall, and qualify any broader long-context performance change separately. Passing suites establish the checked behaviors, not a general bug-free guarantee.
