---
type: measurement
id: 01m363qqvq22nj9fnbbppf2qvd
created: 2026-09-23T03:07:51.031832+00:00
updated: 2026-09-23T06:29:30.563306+00:00
summary: Issue 21 nullable tool strings and branched conversation reuse repaired
date: 2026-09-22
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Originally local fixes, now published in v0.2.24 with full native and installed acceptance; see the publication record. Original intermittent failures remain unproven.
order: '1645'
runs: '[[sources/runs/2026/09/2026-09-22-issue21-edge-fixes]]'
title: Issue 21 nullable tool strings and branched conversation reuse repaired
status: measured
---
Both additional defects from [[records/measurements/issue21-current-review-2026-09-22]] are repaired and covered by durable regressions. Changes are local and unreleased. Raw evidence was captured first in [[sources/runs/2026/09/2026-09-22-issue21-edge-fixes]].

## Repairs

`ToolDefinition.schema` recognizes a single non-null type in a JSON Schema type array, including both orders of string and null. Nullable strings now use the same incremental parser path as scalar strings and the existing nullable anyOf form. Numeric-looking strings retain their leading zeros and string type. Genuine unions, malformed members and unresolved declarations retain conservative handling. The parser's existing interpretation of literal string contents, including the word null, is preserved.

`PrefixCache` now offers an internal matching lookup that considers transcript metadata from both memory and disk before choosing the longest accepted candidate. Engine validates the current assistant turn through that lookup, so an incompatible longer branch cannot hide a shorter matching branch. Candidate validation occurs outside cache locks and propagates request cancellation. The public longest-entry lookup remains available with its prior behavior. No numerical checkpoint admission, arithmetic provenance, token-equality requirement, expiry/identity filter or memory budget was relaxed.

The issue-specific live suite is now part of Tools/verify.sh through Tools/issue21_e2e.py. It owns bounded servers, preserves wire evidence and checks exact restart replay. Its branch fixture uses deterministic supplied histories; the parser/output regressions also run in the ordinary catalogue and CI.

## Fresh results on the repaired build

Executable SHA-256: `3e3de25a36f9265e5b11472452f311650143dd36f4e71f938c3794c6d0fc8a06`. Every recorded source hash still matched the checkout at functional capture.

| Check | Result |
| --- | --- |
| Catalogue | 57 T0 and 16 T1 groups passed, 31907 assertions, no failures or skips |
| Runtime diagnostics | Passed |
| Nullable-string streaming | Character-split round trips and 16000-fragment output fixtures passed; real HTTP truncation streamed incrementally and ended with length, requested usage and DONE |
| Branch regression | Same requests fail on the pre-fix executable and pass on the repaired build; seed answers and reasoning match exactly across builds |
| OpenAI compatibility | All 24 checks passed |
| Process and persistence | TCP-reset survival and identical answer/reasoning/usage after restart passed |
| Numerical reuse | Exact-prefix check passed: generated tokens and prompt logits match cold reads bit for bit; edited history rebuilds |
| Long conversation | Prompt grew from 30288 to 51364 to 51407 tokens, advancing reuse from 30208 to 51200; final reread was 207 tokens and restart was identical |

The branch reproduction is stronger than the original metadata-only probe. A longer retained branch previously made Engine discard a compatible branch's saved reasoning, yielding a 1541-token follow-up prompt and 1024 cached tokens. The repaired request preserves the 1597-token prompt and reuses 1280 tokens. This demonstrates the repaired selection failure; it is not a universal performance benchmark or a claim that every cache miss is erroneous.

## Scope and remaining uncertainty

Ordinary HTTP checks used an 8.1 GB target and context 32768; numerical equality used 10 GB. The long test used the established 13.5 GB exception at configured context 131072 with a real target-plus-3 GB preflight. MTP and vision were off for these serving workloads. All owned model servers were stopped and reaped.

The largest actual prompt was 51407 tokens. A 16000-token allowance produced a short natural answer; it was not a 16000-token live generation. The full release battery previously passed on published v0.2.23, but was not rerun for this patch. Fresh coverage is the complete T0/T1 catalogue, runtime, targeted native equality, live OpenAI/issue-21 tests and long-context restart checks.

The original intermittent daemon exits, prolonged CPU-busy stall and pressure-related tail slowdown remain unreproduced. These repairs cannot certify a cause or cure for those observations. No memory-hog experiment, reporter-hardware reproduction or clean throughput comparison was run. Existing diagnostic/CLI experiments were preserved; publication, version bump and installation were not part of this repair.

## Final validation

The full static suite passed on the repaired executable, including syntax, harness, catalogue-support, download/installer, planner, memory-override and documentation checks. The source audit still matched the frozen build. Final evidence and process cleanup are linked from [[sources/runs/2026/09/2026-09-22-issue21-edge-fixes]]. The store retains its two historical log warnings; this repair does not rewrite historical logs.

## Publication follow-up
The original repair capture above remains unchanged. These fixes were subsequently published as v0.2.24 on September 23. Full release qualification and public installation passed: [[records/measurements/release-0-2-24-published-2026-09-23]]. Post-release comparison and timing limits: [[records/measurements/release-0-2-24-performance-2026-09-23]].
