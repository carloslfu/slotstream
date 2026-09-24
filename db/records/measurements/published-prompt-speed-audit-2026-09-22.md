---
type: measurement
id: 01m35638k4bnhfqttjr857cj2r
created: 2026-09-22T18:29:51.332226+00:00
updated: 2026-09-22T18:31:15.669064+00:00
summary: 'Published v0.2.23 audit: 123 requests; repeated exact prefix reuse is faster, short gains are inconsistent, and long timing exclusions and default-profile limits remain explicit.'
date: 2026-09-22
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Repeated prefix ablation is not a release delta; short gains are inconsistent and excluded long timings stay unqualified.
order: '1625'
runs: '[[sources/runs/2026/09/2026-09-22-published-prompt-speed-audit]]'
title: Published v0.2.23 multi-prompt speed audit
status: measured
---
**The published improvements save real work, but they do not produce a universal speedup.** This audit adds 123 completed HTTP requests on the 48 GiB M5 Pro, comparing the installed v0.2.22 and v0.2.23 binaries and selected same-binary feature ablations. The strongest new repeated result is an 85.6% reduction in a cached prose follow-up's request time. That comparison disables checkpoints in the control; it is not an 85.6% release-to-release gain. Short requests have no consistent improvement. Many long-request timing pairs fail the declared no-paging gate, so they support mechanism and correctness observations but no new qualified latency percentage.

The runtime under test is the already published [[records/measurements/release-0-2-23-published-2026-09-22]]. This audit changes only the benchmark validator and its regression tests. It does not change the inference engine, app defaults or release binary.

#### Method and coverage

The frozen protocols exercise prose, code and structured job records, short prompts through 24K tokens, first and warmed requests, MTP on/off, in-memory and disk reuse, and explicit 8.1, 10 and 24 GB memory targets. The model is `qwen38-flash-next-mlx-4bit`. Every run retains the model/build identities, effective plan, actual expert-read groups and compute passes, requested expert bytes, streamed output, generator/client timers, complete memory peak, thermal state and global paging observations. Stage timers overlap; requested expert bytes are application requests, not physical SSD traffic. No cold-device claim is made.

Most first-request comparisons cap output at one token to isolate prompt processing. Prefix comparisons cap at 16 output tokens; they are bounded continuations, not complete-answer quality benchmarks. The initial separate uncached pilot includes longer decode workloads. The final disk diagnostic requires at least eight emitted tokens and produces 16 on every request.

The normal-cache matrix and subsequent settled confirmation are separate prospective cohorts. Initial uncached pilots changed the expert-pool budget and therefore cannot represent normal cache-enabled defaults. Confirmation uses continuous nominal thermal settling, 120 seconds for long requests and 30 for short/cache requests. Arm order alternates. Three clean pairs within one protocol are required for a repeated timing claim; studies and previously published runs are never pooled to meet that threshold. Percent reductions are medians of paired reductions, not ratios of independently calculated medians. One- or two-pair results remain preliminary. Paging and thermal exclusions retain all slow outliers and are not evidence of an engine correctness failure.

There are 115 completed matrix/pilot requests plus four initial and four corrected disk-diagnostic requests: 123 total. The matrix records 81 measured cells, of which 37 meet their original gates; cells are not paired comparisons. Reconciliation passes 1,035 emitted-metric checks on the 115 requests. The final disk diagnostic passes all 32 checks. These checks do not replace the release's independent numerical and quality acceptance. Two interrupted pilot requests and the initial disk fixture's empty-output failure remain separate evidence.

#### New timing results

| Comparison | Result | What can be concluded |
|---|---|---|
| 2K prose follow-up, v0.2.23 checkpoints disabled versus default, 10 GB, MTP off | Three clean pairs; median request 30.730 to 4.419 seconds; median paired reduction 85.62%; prefill 28.558 to 2.268 seconds | Exact 2,048-token reuse skips most repeated prefill. All 16 output IDs/text and decode work match. This is a reuse ablation, not a release delta. |
| Complete two-request prose sequence, same study | Only one clean complete pair; summed request time 51.748 to 22.424 seconds | Preliminary only. The three clean follow-ups do not establish three clean complete sessions. |
| 8K code, v0.2.22 versus v0.2.23, 24 GB, MTP on, planner-owned 1,024-row passes | One clean pair; request 47.556 to 44.496 seconds, 6.44% lower; prefill 6.48% lower | Preliminary larger-profile release benefit. Both plans use 3,698 slots and the same 4K + 1K read groups. Peak 18.812 to 18.496 GB, below 24 GB. |
| Short warmed requests, v0.2.22 versus v0.2.23, 8.1 GB, cache disabled | Three clean exact-output pairs; paired request changes are 2.49% slower, 2.00% faster and 4.62% slower | No consistent short-request gain. This 827-slot setup study is separate from the normal-cache 640-slot profile. |
| Short normal-cache first requests, 8.1 GB, MTP off | Two clean pairs; prefill 1.504 to 1.526 seconds, median paired 1.44% slower | Preliminary and small; no meaningful consistent improvement established. |
| 2K prose first request, release comparison, 10 GB | One clean pair; prefill 17.057 to 14.197 seconds, 16.77% lower | Preliminary prefill observation. First output IDs differ between backends; not an exact-output full-request claim. The separate settled confirmation has no clean pairs. |
| 8K code, same v0.2.23 backend, fused off versus fused on | One clean pair; prefill 31.112 to 30.665 seconds, 1.44% lower | Preliminary kernel attribution. Default workspace accounting gives 30.652 seconds, 1.48% lower than the same reference. All arms already use the same 8K read group. |

The 24 GB screen does not force `SLOTSTREAM_PREFILL_CHUNK`. It requires 30 GB of real reclaimable memory before launch. It is not a measurement of the current larger automatic target near 32 GB.

#### Long prompts: strong work reduction, excluded new timing percentages

| Workload | Requested expert reads and actual grouping | Timing status |
|---|---|---|
| Normal-cache 8K code, old versus new, 10 GB, MTP off | About 1.036 TB to 70.630 GB; candidate uses 8,192 + 12 tokens | All three pairs have paging. Old client times 104.470/106.901/112.320 seconds; new 68.205/39.470/37.788. The slow first candidate stays in the record; its cause is unproven. |
| 16K structured data, same new binary with workspace accounting off versus default, 10 GB, MTP on | 1,428.343 to 67.898 GB; reference begins at 6,656 then contracts to 256; default uses 16,384 + 13 | All three pairs excluded because reference requests page. Prefill reference 141.392/147.359/154.384 seconds; default 53.236/53.092/54.641. Exact first output and chronological compute match. |
| 8K prose at the 8.1 GB floor, old versus new | 1,183.683 to 947.909 GB; new first group 2,048 then 256 | One paging-excluded pair. The tight budget limits the read-sharing benefit. |
| 24K code, 10 GB, MTP on, old versus new | 3,647.565 to 1,294.300 GB; new first group 16,384 then 256 | One paging-excluded pair. The post-16K contraction remains visible. Peak stays below 9.326 GB. |

An initial 16K prose release comparison also encountered thermal drift and paging and was stopped; it supplies no new clean speed percentage. All completed matrix peaks stay inside their requested target. Global paging counters do not identify the responsible process, and a 20-second idle control cannot establish the cause of paging during inference.

#### Reuse, disk restore and the benchmark correction

The MTP-on code follow-up study produces the same 16 tokens and decode work in all three pairs and reuses exactly 2,048 tokens. However, the frozen validator rejects candidate cells because warmup declines a second optional complete-prompt checkpoint after storing the useful boundary. The shared retention budget is 7,595 tokens; native counters show one warmup refusal, zero measured refusals and zero errors. Original invalid verdicts and timings remain unchanged.

`Tools/serve_bench.py` now accepts prospectively declared exact refusal counts for every phase and arm, restricted to integer counts from zero through two. Existing protocols still require zero; storage errors, reuse, forks, stores, identity and resource gates remain strict. Regression coverage passes 51 tests, and offline replay of all six captured MTP cells passes the corrected functional validator. This is not retrospective timing qualification. The analysis itself passes 12 unit tests.

The final 8K code diagnostic compares memory-only serve against an attached disk cache, using normal chat formatting and MTP off at 10 GB. Both requests emit the same 16 answer tokens in both arms. Disk restores 8,192 tokens; its follow-up takes 3.693 seconds versus 40.991 seconds for the memory-only miss. The first requests take 35.230 and 33.733 seconds respectively. Complete two-request sums are 38.924 versus 74.724 seconds. This is one functional pair with paging in different stages, so no qualified percentage is claimed. All memory targets and 32 functional checks pass.

The preserved initial raw fixture restored 7,936 tokens but both follow-ups returned immediate EOS. Its same-output check was vacuous; independent reconciliation found the missing generated answers. The corrected fixture and minimum-output requirement were frozen before execution. The initial result is excluded from generated-answer equivalence evidence.

#### Attribution and remaining opportunities

1. **Read sharing explains the largest mechanism gain.** Longer groups fetch an expert once for more chronological compute passes. Fused attention reduces intermediates and enables honest workspace accounting, but the whole policy gain is not a kernel-only gain. The upstream kernel is credited in [[records/measurements/fused-prefill-integration-2026-09-21]], not an invention of this audit.
2. **Larger planner passes and more than 16K keys still leave headroom.** `Sources/Slotstream/PrefillReadPolicy.swift` grants the expanded envelope only for 256-row queries and at most 16K keys. Read-only plans choose 1,024-row passes at 16/20/24 GB and 2,048 rows on the larger automatic profile. The 24 GB comparison retains the same read groups and nearly identical requested bytes. Qualifying workspace accounting at those actual pass sizes and beyond 16K is a concrete next experiment, with allocation, cancellation and exact-state gates before adoption. No unmeasured gain is assigned to it.
3. **Desktop still explicitly disables MTP.** `apps/macos/Runtime/Performance.swift` requests MTP off and a 32,768-token context. Engine/CLI automatic MTP gains therefore do not imply Desktop MTP gains. A change needs the app's feasible-budget guard reviewed too, since it uses a 33 GB base ceiling. This audit does not silently change that default.
4. **Long in-memory checkpoint retention is not always affordable.** `Generate.swift` selects the deepest boundary; `PrefixCache.swift` then charges stepped actual capacity plus the active reservation while preserving valuable other conversations. Both v0.2.22 and v0.2.23 refuse the 8K memory snapshots in the captured profile. This limitation predates the release. A shallower boundary might fit but also splits expert reads, so the deciding metric must include first-request cost and subsequent reuse. The disk diagnostic proves the existing persistent path can avoid this miss. Ordinary eligible Desktop Homes attach disk state; private/thinking workflows preserve their separate policy.
5. **Read admission depends on live allocation history.** Warm misses can contract groups. MLX's `set_cache_limit` changes a ceiling without immediately purging its existing pool; admission uses current physical footprint. The diagnostic establishes the symptom, not that clearing the allocator is the cure. Earlier cold-clear failures do not answer the warm-miss question. A bounded trim/admission experiment should measure the full sequence and cancellation cost before changing defaults.
6. **Current reuse is not all newly introduced.** v0.2.22 already has aligned and complete-prompt caching and the same deepest-boundary selection. v0.2.23 changes expert-read checkpoint boundaries, disk pass provenance, app attachment and live thinking-to-answer continuation. The new checkpoint ablation cannot be advertised as its incremental release speedup. CLI help also still describes an approximately 120-expert MTP floor while the planner constant is 76; this is a documentation discrepancy, not measured performance.

Prior experiments on larger compute passes, selected scalar attention, GPU compaction, allocator clearing and fixed piece writes remain rejected or unqualified as recorded in [[records/measurements/prefill-opportunities-2026-09-21]]. Reviewed concurrent decode experiments also failed to justify defaults; their snapshot is in this audit's archive, separate from these new measurements.

#### Earlier evidence retained, not counted as new runs

[[records/measurements/prompt-speed-qualification-2026-09-21]] has three clean 8K pairs with 15.2% less prefill from guarded larger reads. [[records/measurements/fused-prefill-integration-2026-09-21]] has three clean pairs with 5.22% less prefill for the complete backend integration. [[records/measurements/mtp-prefill-policy-2026-09-21]] has three clean 16K/10 GB MTP pairs with 65.40% less prefill and 64.53% less request time from the same-backend policy comparison. These percentages describe different baselines and cannot be multiplied or pooled.

The published release acceptance already covers independent numerical references, raw state/logits/continuation/output equality, 4,878 bounded writes, persistent restart, native app lifecycle and live thinking-to-answer handoff. Those checks were reviewed here, not rerun or counted in the 123 requests. No new repeated wall-time claim is made for thinking-to-answer UX. This audit does not qualify other hardware, the full approximately 32 GB automatic profile, unrestricted long sessions, whole-answer quality across all prompts or a complete GPU trace decomposition.

Raw evidence: [[sources/runs/2026/09/2026-09-22-published-prompt-speed-audit]] and [[sources/runs/2026/09/2026-09-22-published-prompt-speed-audit-excluded]].
