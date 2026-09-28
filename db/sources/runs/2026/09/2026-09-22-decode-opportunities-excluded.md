---
type: run
id: 01m33yva9ae8060nnpfax5jhkj
created: 2026-09-22T07:03:56.458452+00:00
updated: 2026-09-22T07:04:24.602907+00:00
summary: 'Decode opportunities: excluded timing, interrupted trials and original test failures'
binary: 772e8fe5bc969f68801f70a509f2e65500988422e4f26a46be5a302d2f2000ad
captured_at: 2026-09-22
command: Tools/optimization_build.py; Tools/serve_bench.py; barrier_remaining.py; hc_run_v2.py; hc_run_v3.py; hc_run.py; final_v2_checks.py (exact arguments in archived scripts/manifests)
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode opportunities: excluded timing, interrupted trials and original test failures'
tool: Frozen Swift model/state checks, served-request A/B and verification-pass timing
---
[Immutable raw capture](../../../artifacts/decode-opportunities-2026-09-22/raw-protocols-results-and-source.tar.gz) and [archive/member hashes](../../../artifacts/decode-opportunities-2026-09-22/manifest.json).

This wrapper is `discarded: true` for timing. Raw results remain intact. Successful correctness checks in an excluded interval remain functional evidence, subject to their own assertions; they are not clean speed evidence. Eligible results are described in [[sources/runs/2026/09/2026-09-22-decode-opportunities]].

- Barrier code round 2: candidate interval has global swap activity. Both arms are exact, but the pair is excluded from timing.
- Barrier prose round 2: incomplete candidate process stopped after the aggregate median gate became unattainable. Its `KeyboardInterrupt`/incomplete-result and owned-child cleanup records are retained. There is no completed pair.
- HC V2 4K: exact arithmetic, but six smaller-row timing cells contain one to ten expert misses. All-hit attribution fails. Its zero-miss three-row subset is not promoted as a separately selected successful experiment.
- HC V3 4K rounds 1 through 3: all-hit and exact, but paging excludes round 1 and nonnominal thermal conditions exclude rounds 2 and 3. No 4K speed qualification.
- HC V3 first 8K attempt: interrupted during preparation to add timing-window observations and post-preparation thermal settling. Incomplete logs remain.
- HC V4 third 8K attempt: interrupted during preparation for mathematical failure-only futility. It contributes no timing observation.
- Initial final-build lifecycle checks at barriers 4 and 1 fail the same six stale expectations. They demanded legacy reuse of tiny decoded prefixes under deployed aligned resume. Raw failures remain in `final-checks/lifecycle` and `final-checks/lifecycle-baseline`; the later diagnostic explicitly tests both policies and preserves cancellation, state and stale-draft assertions.

The code round 3 slow pair is deliberately NOT excluded here. It passes the frozen interval rules and remains in the primary calculation. A subsequently observed OS scanner limits interpretation of causation, but is not retroactive permission to drop an unfavorable result.

The HC V4 first two processes have startup paging, but their instrumented timing windows have no observed swap activity. This distinction is recorded rather than labeling whole processes clean or silently dropping their startup counters. Baseline and candidate arithmetic is exact, not a numerical-quality claim for arbitrary prompts.
