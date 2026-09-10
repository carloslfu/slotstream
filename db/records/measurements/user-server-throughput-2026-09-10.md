---
type: measurement
id: 01m26h46c4f5n2yxdzgzekdd9k
created: 2026-09-10T20:46:08.772083+00:00
updated: 2026-09-10T20:46:08.772083+00:00
summary: 'Eight clean user-server timings: observed decode rate 10.28 to 15.80 tokens/sec, separate planner estimates, exact repeats, interruptions and limits'
date: 2026-09-10
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '775'
runs: '[[sources/runs/2026/09/2026-09-10-user-server-three-prompts-small-benchmark]] [[sources/runs/2026/09/2026-09-10-user-server-small-benchmark-pressure-attempt-discarded]] [[sources/runs/2026/09/2026-09-10-user-server-small-benchmark-paging-repeat-discarded]]'
title: Three-prompt serving benchmark and throughput expectations
status: measured
---
**What to expect from this observed setup.** On the recorded M5 Pro Mac, the existing auto-sized server produced **10.28 to 15.80 decode tokens per second** across the eight clean short-request observations. A rough expectation of **10 to 16 tokens/sec for similar short requests at these settings** is a description of this observed range, not a guaranteed floor, ceiling, sustained rate or estimate for another machine. Thinking was disabled, greedy sampling was used, and the MTP draft head was enabled. Model, output length, available memory, retained prompt state and background activity matter.

The server's existing planner reported `est_warm_tok_s` of **10.63** at about **121 cached experts per layer**, and **11.47** after automatic residency grew to about **146 per layer**. These are planner estimates, distinct from the observed request rates. Its metadata retained a **27.9 GB advertised auto target** while the pool changed from **5,817 to 7,006 slots**. The target is not an observed peak-memory measurement. This small run does not recalibrate the planner or supply a new MTP multiplier.

The original integrated sustained studies used **10 GB with MTP off** and **12 GB with fixed MTP on**, producing combined-arm median active rates of about **7.00** and **7.30 tokens/sec**, respectively. Those are different memory budgets, workloads and timing definitions from this larger auto-sized server's short requests. They remain in [[records/measurements/optimization-final-composition-2026-09-09]]; the present results neither replace them nor establish another optimization speedup.

**Method and evidence.** Three synthetic prompts cover a sky explanation, a Python function and a longer fictional incident report. Each is sent as an initial request, an exact repeat, and a follow-up including the complete initial user/assistant exchange. Requests run one at a time against the user's already running server, with thinking disabled, temperature zero, seed seven and a maximum of 128 output tokens. Initial means first in this small study, not a cold process, SSD or expert pool. All nine completed responses stop naturally, and all three completed exact repeats match their initial output text. Exact prompts, raw streamed frames with arrival timestamps, outputs, server metadata, memory observations and driver bytes are preserved in [[sources/runs/2026/09/2026-09-10-user-server-three-prompts-small-benchmark]].

| Prompt | Case | Output tokens | First visible text | Complete response | Decode tokens/sec |
| --- | --- | ---: | ---: | ---: | ---: |
| Sky explanation | Initial | 76 | 3.94 s | 9.82 s | 12.92 |
| Sky explanation | Exact repeat | 76 | 2.5 ms | 4.81 s | 15.80 |
| Sky explanation | Follow-up | 47 | 1.51 s | 5.49 s | 11.81 |
| Python function | Initial | 108 | 2.10 s | 10.52 s | 12.83 |
| Python function | Exact repeat | 108 | 2.7 ms | 8.21 s | 13.16 |
| Python function | Follow-up | 32 | 1.86 s | 4.98 s | 10.28 |
| Long report summary | Initial | 103 | 5.56 s | 14.98 s | 10.93 |
| Long report summary | Exact repeat (resumed) | 103 | Excluded: paging | Excluded | Excluded |
| Long report summary | Follow-up (resumed) | 55 | 1.47 s | 5.51 s | 13.60 |

**Interruptions and exclusions.** One additional long-summary repeat attempt is canceled on observed warning memory pressure and has no successful terminal frame: [[sources/runs/2026/09/2026-09-10-user-server-small-benchmark-pressure-attempt-discarded]]. An optional quiet-memory wait sends no requests and expires. The remaining cases then continue under the original live request guards. The completed resumed summary repeat overlaps **11,581 system swap-ins** and is excluded from the timing comparison: [[sources/runs/2026/09/2026-09-10-user-server-small-benchmark-paging-repeat-discarded]]. Its successful content check is not timing qualification. The eight reported timing rows have nominal sampled thermal state and no swap-counter change during their request. The aggregate source is mixed evidence; the two separate sources explicitly mark the discarded attempts/timings and the original source remains unchanged.

Automatic residency changes across the interruption, so the resumed cases are not a matched fixed-pool comparison. Only one observation of each case is taken; no population percentile, significance test, universal rate or causal attribution to a single optimization is claimed. The two short immediate repeats show almost zero prefill time and first visible text in milliseconds; their remaining generation still takes seconds. The ordinary Ollama endpoint does not expose an exact cached-token count, so no unobserved hit count is claimed. The user's server is left running, with no other model/compiler launched and no applications closed.

**Meaning of the timing fields.** First visible text is client time from sending the request to receiving a frame with non-whitespace answer text. Complete response is client time through the successful terminal frame. Decode throughput is the server's `eval_count / (eval_duration / 1e9)`, excluding prefill. It is not the independent inter-output-interval active TPS used by the sustained qualification studies. Follow-ups have different input and output lengths from their base prompt, so total durations are not like-for-like speed comparisons.

**How to see your own numbers.** `slotstream run` prints separate prefill and decode rates after generation; its `--stats-json <path>` option saves the raw measurements. When using the existing server, `/api/chat` and `/api/generate` provide `eval_count` and nanosecond `eval_duration` in their successful final response; streaming clients receive them in the final frame. Calculate the ratio above when the duration is positive. The ordinary OpenAI-compatible response carries token usage without these Ollama duration fields. These are end-of-response observations, not a built-in continuously updating counter. See the CLI guide for commands.

**Long-session context.** The original first-principles optimization program, all OPT00–OPT36 selected/rejected/deferred outcomes, superseded progress, failed attempts, resource and thermal-control changes, qualification evidence and actual local activation remain in [[records/plan/whole-engine-optimization-2026-09-04]]. Integrated preview, prefill, sustained throughput, memory and lifetime results remain in [[records/measurements/optimization-final-composition-2026-09-09]]. The final exact-source and installed-artifact closure is [[sources/runs/2026/09/2026-09-10-optimization-final-program-complete]]. This later user-server benchmark is observational follow-up evidence, not a replacement for that qualification.
