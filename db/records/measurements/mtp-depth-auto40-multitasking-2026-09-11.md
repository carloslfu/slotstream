---
type: measurement
meta-type: conclusion
id: 01m278tdvz3w25zpbdth5eaqqs
created: 2026-09-11T03:40:14.591119+00:00
updated: 2026-09-11T03:40:14.591119+00:00
summary: 'Complete multitasking study: two is a practical mixed-workload choice, two and three tie in clean repeated comparisons, and no universal default qualifies'
date: 2026-09-11
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1160'
runs: '[[sources/runs/2026/09/2026-09-11-mtp-multitask-auto40]]'
title: Complete MTP depth comparison with automatic 40% RAM
status: measured
---
**For mixed use on this Mac, two draft tokens are a reasonable practical setting at the tested automatic 40% RAM policy. Two and three were effectively tied in the clean repeated comparison: three did slightly better on code and worse on arithmetic. This is a scoped recommendation, not proof of a universal optimum or qualification to change the shipped one-draft default.** All 54 planned measured responses completed; the longer comparison did not obtain a clean matched pair. No production setting changed and no model was left running.

**Complete study.** Installed Slotstream 0.2.14, the local 4-bit Qwen3.8-Flash-Next checkpoint, 48 GiB M5 Pro and internal 2 TB SSD. The user explicitly requested testing while continuing ordinary work. Their applications remained open. Each cell launched one fresh server, completed a same-prompt 128-token warmup, settled, generated its measured response and stopped the server. Forty-eight primary responses crossed MTP off and depths one, two and three with prose, actual Python generation and arithmetic explanation, repeated four times. Six further responses compared the top two settings at 512 output tokens, one per setting and workload. All 108 warmup/measured requests completed; all 48 short responses emitted 128 tokens and all six longer responses emitted 512.

The depth orders were 0/1/3/2, 1/2/0/3, 2/3/1/0 and 3/0/2/1; workload order rotated. Temperature was zero, seed 42, thinking off, top-p 1, top-k 0, min-p 0 and presence penalty 0. These are short-context greedy performance fixtures, not reasoning-mode, sampled-distribution, completed-program correctness or model-quality qualification. The configured context ceiling was 32,768, but these prompts contained only 68, 119 and 130 tokens. That ceiling is not a tested context length.

**Memory and serving configuration.** All arms used `--max-ram-percent 40`, automatic expert-cache and prefill sizing, elasticity on and prefix caching on. An explicit `--memory-gb` pins the cache and disables elasticity in the current implementation, so it was deliberately omitted for this multitasking profile. Forty percent of this machine's physical RAM is 20.616 GB in decimal units; that was also the study's measured-footprint ceiling, not a claim that every request allocates that amount.

| Setting | Effective expert slots | Automatic prefill chunk |
| --- | ---: | ---: |
| MTP off | 3,764 | 2,048 |
| One, two or three drafts | 3,667 | 1,024 |

These values held in every measured response. The plain arm spends much of the freed draft-head budget on a larger prefill reservation. This is a comparison of the actual automatic serving policies, not an isolated fixed-pool plain-versus-MTP experiment. The speculative arms do have the same pool. Every measured request reused its entire prompt, with zero new prefill tokens. This captures warm repeated-prompt decode, not first-request loading or a long conversation. The 512-token responses extend beyond the 128-token warmup output.

**What the clean short timings show.** Values below are median native decode tokens/sec, with the eligible count in parentheses. Native decode time excludes model loading and prompt prefill. Client timing and first-visible-text timing are preserved separately. Unequal eligible subsets mean dividing these column medians is not a paired speedup estimate.

| Workload | Off | One draft | Two drafts | Three drafts |
| --- | ---: | ---: | ---: | ---: |
| Prose | 6.70 (4) | 7.88 (4) | 9.48 (2) | 9.39 (4) |
| Python code | 7.43 (2) | 9.80 (3) | 11.40 (4) | 12.15 (4) |
| Arithmetic explanation | 8.71 (2) | 9.80 (2) | 10.16 (2) | 9.58 (3) |

The paired comparison is more useful for choosing a setting. Each ratio uses the same workload and round, and a pair is excluded if either member is ineligible.

| Candidate relative to baseline | Prose | Code | Arithmetic | Equal-workload aggregate |
| --- | ---: | ---: | ---: | ---: |
| Two versus one | +20.4%, 2 pairs | +15.5%, 3 pairs | -3.0%, 1 pair | +10.5% |
| Three versus two | +0.2%, 2 pairs | +3.9%, 4 pairs | -4.9%, 2 pairs | -0.3% |
| Two versus off | +25.3%, 2 pairs | +56.3%, 2 pairs | +16.5%, 2 pairs | +31.7% |

The aggregate is the geometric mean of the three workload median throughput ratios. These are descriptive estimates with small samples, not confidence bounds. Different comparisons use different eligible rows; do not subtract their aggregate percentages to manufacture another comparison. In particular, the direct two-versus-three evidence is essentially a tie, not a decisive overall win.

**Finalist selection and longer responses.** The frozen exploratory rule normalized eligible rates within each round/workload block, took each workload's median normalized rate, then used their geometric mean. Settings needed observations in all three workloads. Its order was two, three, one, off, so two and three advanced without using the fallback. The normalized scores are for selection, not measured percentage improvements. They differ from direct paired estimates because the eligible comparison sets differ.

| Longer workload | Two drafts, tok/s | Three drafts, tok/s | Usable matched pair? |
| --- | ---: | ---: | --- |
| Prose | 9.84, excluded for swap | 8.54, excluded for swap | No |
| Code | 11.52, excluded for swap | 8.52, excluded for swap | No |
| Arithmetic | 10.13, eligible | 8.08, excluded for thermal state | No |

The excluded values remain visible as evidence of completed work. They cannot support a two-draft speedup claim. Longer verification is therefore inconclusive, despite all six responses completing.

**Why the shipped default remains unchanged.** The prospective default-change rule required at least two clean same-round pairs against depth one for each workload, an equal-workload aggregate gain of at least 5%, no workload median slowdown exceeding 5%, and at least two clean longer pairs with median gain of at least 3%. Only one arithmetic pair against depth one survived, and there was no clean longer pair. Depth one also did not advance to the longer comparison. No default candidate qualified. The practical suggestion to use two for this user's mixed workload is separate from changing a default for all users, memory budgets, prompts and sampling modes.

**Why more drafts are not automatically faster.** Each additional guess adds draft-head work and another position to the expensive target-model verification pass. Rejected guesses still consumed verification and expert-read work. In the repeated 128-token code fixture, depth two accepted 82 of 92 drafts and depth three 91 of 108; verification passes fell from 46 to 36. In arithmetic, depth two accepted 72 of 110 and depth three 76 of 156; verification passes fell only from 55 to 52. Code therefore gained more useful work from the deeper batch. Acceptance and verification counts were identical across all four repeats of each setting, as were the generated token sequences. Across depths, target batch shapes can change the output sequence; this was not a forced-identical-token comparison or quality test. File-read counters describe requested bytes, not measured physical NAND traffic.

**Stability evidence and its limits.** All 54 measured responses and 54 warmups completed without a crash, watchdog safety stop or memory-pressure cancellation. Sampled OS memory pressure stayed normal. Maximum native sampled physical footprint across both phases was 16.64380632 GB, and minimum watcher-observed reclaimable memory was 7.972814848 GB. There were zero new global swap-outs, but 2,038 swap-in pages across the whole study. Existing swap occupancy was not cleared, and global counters cannot identify which process caused an increment.

Twelve short timings and four longer timings were excluded for swap activity. One further longer timing failed the thermal rule. macOS reported both nominal and fair thermal states during the full run; automatic settling pauses allowed two later primary measurements to start nominally. All clean timing intervals passed the declared thermal/power rules. That does not prove fixed GPU clocks, no heating or complete host isolation. Ordinary application activity still produces timing noise.

The two-second watcher also queried `/api/version`. There were no metadata request errors; p95 response time was about 1.04 ms in the primary phase and 1.01 ms in the longer phase. Watcher scheduling-lateness p95 was 5.16 ms and 10.08 ms, respectively. These are narrow server/scheduling responsiveness proxies, not a measurement of other applications' UI latency, fan noise or energy use. The stock 20 ms physical-footprint sampler's common overhead was not independently calibrated.

**Practical use.** A scoped way to select the suggested configuration is:

```sh
SLOTSTREAM_DRAFT_DEPTH=2 slotstream serve --max-ram-percent 40 --mtp on
```

Leave elasticity enabled and avoid an explicit memory/pool override for this profile. Three is a reasonable alternative for code-heavy use, but the clean repeated difference from two is small. The study does not justify larger depths, another machine, sampled decoding or a universal setting. It also does not guarantee stability under arbitrary additional memory/compute load.

**Evidence and cleanup.** Raw data, all exclusions, frozen drivers, exact requests, reproducible analysis and cleanup proof are in [[sources/runs/2026/09/2026-09-11-mtp-multitask-auto40]]. All 54 owned model PIDs exited, no model remained, and the native model lock was free. The installed executable and Metal hashes were unchanged and all 150 compiled-identity files still matched. Diagnostics existed only in terminated test-child environments. The demo was not restarted. This complete automatic-memory study remains separate from the earlier fixed-memory attempts in [[records/measurements/mtp-depth-fixed-total-inconclusive-2026-09-11]] and does not replace their evidence or published historical speed claims.
