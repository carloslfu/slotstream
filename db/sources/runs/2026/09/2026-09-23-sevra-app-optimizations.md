---
type: run
id: 01m37frkh2he5xyb0zpzgakwam
created: 2026-09-23T15:57:16.706303+00:00
updated: 2026-09-23T15:57:17.152896+00:00
summary: Sevra desktop optimization trials and real-model acceptance
binary: 5ee04173f63676351f3ffebbd7479c09b199115219f67e63ba9b614e1f8f9bfa
captured_at: 2026-09-23
command: run_checks.py; run_speed.py; make build SLOTSTREAM_BUILD_JOBS=2; Tools/build_sevra_mac.sh; Tools/static_gates.sh; slotstream-checks --tier t0 --tier t1
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Sevra desktop optimization trials and real-model acceptance
tool: Native development app checks, real engine, native memory probe, Swift release builds and static gates
---
[Capture](../../../artifacts/sevra-app-optimizations-2026-09-23/capture.tar.gz), [manifest](../../../artifacts/sevra-app-optimizations-2026-09-23/manifest.json). Archive SHA-256: `f9c9eb0eff059b82eb756cb58eab5b0cf4dc8101e345bc0bfc81003b85adc5e8`. Every file was read back and hash-checked. The capture contains synthetic inputs, exact commands, binary identities, per-request statistics, numeric process/VM observations, failed runs, build/check logs and implementation sources. Disposable Homes, IPC capabilities and unrelated user conversations are excluded.

All model work was serialized. Each launch checked real reclaimable memory against its explicit target plus 3 GB. Correctness defaults retained 10 GB; MTP was separately requested as a 26 GB performance profile. The GUI was quit before model diagnostics. No simulated availability or pressure hog was used. Processes were waited/reaped before another model or build.

## Final paired comparison

`run_speed.py 26 plain:final-1-plain chat:final-1-chat chat:final-2-chat plain:final-2-plain plain:final-3-plain chat:final-3-chat` runs `sevra-mac-checks --real-speed --memory-gb 26 --arm <arm> --short-only` once per label. Both complete allocations include the configured lookahead correction. The checker executable SHA-256 was `5ee04173f63676351f3ffebbd7479c09b199115219f67e63ba9b614e1f8f9bfa`. Every arm completed three identical fixed input histories (353, 582 and 809 prompt tokens) with a 96-token output cap, then regenerated the third input cold and required exact output IDs within that arm. Across arms the generated prose can differ. The numerical pass policy remains part of the cache identity.

Plain decoding disables MTP and retains the engine schedule. Chat enables automatic MTP and the Desktop short-prompt policy under the engine's generation lock. Order alternates across three pairs. `final-summary.json` computes medians, including the per-process sum of prefill plus decode for the three normal turns. It excludes model construction, the fourth parity replay and UI overhead. Fixed inputs prevent output differences from changing later input lengths.

Global paging was 20 in / 0 out pages for plain and 0 in / 0 out for chat. Thermal observations included nominal and fair. These comparisons remain diagnostic and are excluded from clean public anchor replacement. Peak physical-footprint statistics were 22.204 and 22.345 GB, below each 26 GB budget.

## Screening and failures

The earlier screen compared plain, automatic MTP, fixed 256/512/1024 batches, and 256/512 batches retaining the larger workspace reserve. Always-small batches made the longer inventory slower. Three rotating plain/auto/hybrid rounds also exercised 1,631- and 9,295-token inventories with correct answers. These earlier builds did not charge the roughly 40 MB optional correction in the initial planner call, although it was loaded; their pools therefore differ slightly from the final priced comparison. They are screening evidence, not the final exact app allocation. Their global paging and thermal changes are retained. One `pair-3-chat` preflight refused before loading; the separate retry is preserved without overriding real memory.

The full native checks initially exposed an automatic budget mismatch when MTP raised the CLI ceiling beyond Desktop's displayed ceiling. Desktop now supplies an explicit adaptive total ceiling. The initial MTP cache check and its diagnostic retry exposed a different issue: after unloading, physical footprint fell from about 22.1 GB to 2.6 GB while availability stayed at 19.66 GB. Immediate replanning then selected about 17.1 GB, disabled MTP and correctly rejected the incompatible disk checkpoint. Waiting only the remaining host-statistics refresh window fixed the problem: `cache-mtp-retry2` reloaded at 26 GB with MTP, restored 2,048 tokens and completed all subsequent lifecycle checks. Its load took 2.085 seconds, including the immediate-reload wait.

## Acceptance

The full runtime suite passed; native composer/presentation/scroll/thinking/apps/memory UI suites passed in the initial native run. The corrected performance policy and session verification were rechecked. Real metrics, MTP disk/private cache, cancellation/recovery, typed tool call, short-to-long schedule crossover, thinking forced close/Answer now/plain continuation, complete Cedar source-to-reviewed-document workflow, small-budget lifecycle and ordinary disk-cache checks passed. The engine catalogue passed 73 checks and 31,907 assertions without failures/skips. Static gates passed. The store retains its two pre-existing historical warnings.

The new development app was rebuilt and its bundled input manifest exactly matches the current source inputs. The final visible-app replay could not start because the Mac was locked; native UI control explicitly required manual unlock. These new rates come from the real engine and app-runtime checks, not a completed new UI replay. The earlier actual-app baseline remains unchanged.
