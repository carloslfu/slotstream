---
type: run
id: 01m363qqcmfsgmj9q0rrgwazn7
created: 2026-09-23T03:07:50.548747+00:00
updated: 2026-09-23T03:09:19.968145+00:00
summary: 'Issue 21 edge fixes: baseline failure and repaired-build qualification'
binary: 3e3de25a36f9265e5b11472452f311650143dd36f4e71f938c3794c6d0fc8a06
captured_at: 2026-09-22
command: optimization_build.py; T0/T1/runtime; issue21_e2e.py; baseline-branch.py; prefix-exact-check; issue21_long_context.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Issue 21 edge fixes: baseline failure and repaired-build qualification'
tool: Swift catalogue; live HTTP/SSE; native prefix equality; bounded build
---
Follow-up repairs to [[sources/runs/2026/09/2026-09-22-issue21-current-review]]. The frozen repaired executable is `3e3de25a36f9265e5b11472452f311650143dd36f4e71f938c3794c6d0fc8a06`. Its source hashes match the checkout. The pre-fix comparison uses `981fe6fb8064e1d457946effaca4e9f279b823f9ba6707cf991af4863de8b38d`, whose exact source archive is retained by the preceding review.

## Raw evidence

[Functional capture](../../../artifacts/issue21-edge-fixes-2026-09-22/functional.tar.gz) and [manifest](../../../artifacts/issue21-edge-fixes-2026-09-22/functional-manifest.json) were written before this transcription. Every member was reopened and verified against its size and SHA-256. They preserve build/source identity, compilation output, patch, complete catalogue output, driver sources, command receipts, requests, raw SSE, server logs, restart results, baseline comparison and exact-prefix diagnostics. Executables and generated tensor-cache directories are excluded.

Principal commands:

```text
python3 Tools/optimization_build.py --out <build> --jobs 2
<candidate>/slotstream-checks --tier t0 --json
<candidate>/slotstream-checks --tier t1 --json
<candidate>/slotstream runtime-check
python3 Tools/issue21_e2e.py --binary <candidate>/slotstream --out <live>
<candidate>/slotstream prefix-exact-check --plan --memory-gb 10 --mtp off --vision off
python3 Tools/issue21_long_context.py --binary <candidate>/slotstream --out <long> --max-context 131072
```

The catalogue passed all 57 T0 groups and all 16 T1 groups, 31907 assertions, with no failures or skips. Runtime checks passed. The parser gates cover nullable type arrays in both orders, singleton declarations, invalid and genuine unions, numeric-looking strings, lexical null/boolean text, empty strings, Unicode/escaping, character splits and streamed length truncation. The OpenAI output fixture now applies its 16000-fragment truncated-string check to scalar, anyOf and both nullable type-array orders. Cache checks cover memory/disk candidates, identity and expiry filtering, reindexed metadata, cancellation, nonconsuming lookup and callbacks outside cache locks.

The live suite used one 8.1 GB server at a time, context 32768, MTP and vision off. Both scalar and nullable-string arguments hit the 256-token cap with incremental fragments, length, usage and DONE. A deterministic supplied-history branch fixture reused 1280 tokens of the shorter matching branch despite a longer incompatible branch. The ordinary omitted-reasoning conversation advanced reuse to 1536 tokens. All 24 OpenAI checks, TCP reset survival and exact answer/reasoning/usage replay after restart passed. No generated tools were executed.

## Before/after branch reproduction

The captured baseline driver replayed the same three branch requests on the pre-fix executable. Both seeded branches returned byte-identical visible answers and reasoning across builds, as independently checked in seed-parity.json. The old follow-up reused only 1024 tokens and encoded a 1541-token prompt after losing saved reasoning. The repaired follow-up preserved a 1597-token prompt and reused 1280 tokens. The new minimum-reuse regression fails on the baseline and passes on the fix. The fixture supplies the initial divergent assistant turns; it does not depend on stochastic regeneration to create different branches.

## Numerical and long-context qualification

The native prefix-exact check passed with a 10 GB target: continued, repeated, short and shared-prefix cases had identical generated IDs and bit-identical prompt logits compared with cold reads. Edited history rebuilt. An initial invocation passed an unsupported max-context flag and exited before loading; its receipt is preserved separately and the supported command passed.

The long driver used the previously qualified 13.5 GB target at configured context 131072, with target-plus-3 GB reclaimable preflight. Actual prompts were 30288, 51364 and 51407 tokens; reuse advanced from 30208 to 51200. The final request reread 207 tokens and returned identical answer, reasoning and usage after a real restart. Its 16000-token allowance naturally produced 21 tokens. Both long-run servers, both ordinary live servers and the baseline server were reaped with exit code zero.

No induced pressure, full-window prompt, actual 16000-token generation or clean timing study was performed. The full native release battery was not repeated for this patch; the targeted native checks, complete T0/T1 catalogue and live serving checks are the fresh scope. Unrelated diagnostic/CLI experiments already present in the shared checkout were preserved in the integrated build.

## Final validation and cleanup

[Final validation capture](../../../artifacts/issue21-edge-fixes-2026-09-22/final-validation.tar.gz) and [manifest](../../../artifacts/issue21-edge-fixes-2026-09-22/final-validation-manifest.json) preserve the complete static-suite output, command/exit receipt, final source audit and process cleanup. The archive was reopened and verified before this addition. Tools/static_gates.sh passed on the same frozen executable. Source hashes still matched; no model process or model-lock holder remained. Disposable test tensor caches were then removed while all wire evidence and build/source receipts were retained.
