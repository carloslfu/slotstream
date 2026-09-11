---
type: measurement
meta-type: conclusion
id: 01m27310j3f9e4fepfrhgqdwqg
created: 2026-09-11T01:58:58.883851+00:00
updated: 2026-09-11T02:03:20.302621+00:00
summary: Fixed-total-memory MTP depth testing did not qualify a new default
date: 2026-09-11
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1150'
runs: '[[sources/runs/2026/09/2026-09-11-mtp-depth-fixed-total]]'
title: 'MTP draft depth at equal total RAM: no new default qualified'
status: measured
---
**No new draft-depth default qualified. Keep depth one as the existing conservative default; these runs do not prove it is optimal.** Depths zero (MTP off), one, two and three were exercised, but the repeated comparison could not obtain enough resource-clean pairs. No production setting was changed.

**What was tested.** Installed Slotstream 0.2.14 on the 48 GiB M5 Pro with its internal 2 TB SSD and the local 4-bit Qwen3.8-Flash-Next checkpoint. Every measured response followed a same-prompt 128-token warmup in a fresh server. Each measured response emitted 128 tokens. Greedy sampling, seed 42, thinking disabled, prefill chunk 256, maximum context 32,768, prefix retention off and elastic resizing off were fixed. The four planned setting orders were 0/1/3/2, 1/2/0/3, 2/3/1/0 and 3/0/2/1. Prompt order rotated by round. These are short-context and short-output measurements; the code tutorial in the 24 GB cohort generated mostly introductory prose. The 20 GB cohort replaced it with a prompt that begins directly with Python code. Prose and arithmetic fixtures were retained. No cross-budget or cross-fixture pooling is valid.

**Why equal total memory matters.** The plain arm does not load the MTP head and can spend that memory on cached experts. All speculative arms load the same head regardless of depth. Letting plain decoding keep an unnecessary loaded head would conceal this tradeoff.

| Total process target | Plain expert slots | MTP expert slots, any tested depth |
| --- | ---: | ---: |
|24 GB|6,281|5,702|
|20 GB|4,834|4,255|

Each slot holds 2,764,800 bytes, so the 579-slot difference is 1.6008192 GB of quantized expert-cache capacity. The targets are budget inputs, not claims of measured allocation: accepted measured requests peaked below 22 GB in the 24 GB cohort and below 18 GB in the 20 GB cohort. No explicit pool override or simulated availability was used.

**Qualification rule, frozen before timing.** A candidate needed at least three clean same-round pairs against depth one on each of three workloads, an equal-workload geometric mean of median paired throughput ratios of at least 1.03, and no workload median ratio below 0.95. A pair is excluded when either member fails. Throughput is the native emitted-token count divided by native decode seconds; model loading, prompt prefill and HTTP serialization are outside that decode interval. First-request and client timing remain in the raw evidence. Larger acceptance percentages do not substitute for this end-to-end decode criterion.

**What completed and why it stopped.**

| Cohort | Planned measured responses | Completed measured responses | Individually clean | Clean matched pairs against depth one |
| --- | ---: | ---: | ---: | --- |
|24 GB|48|11|7|One plain/one-draft pair on arithmetic; none for depths two or three|
|20 GB|48|15|5|One three-draft/one-draft pair on prose; none for plain or depth two|

The 24 GB preflight refused the next launch with 28.58 GB reclaimable against its 29 GB minimum. A separate 20 GB study was started at a 25 GB preflight after the optional user preference question received no reply; this was an explicitly stated working assumption, not user approval of a new default. The two early 20 GB code baselines both encountered system swap activity. With four fixed rounds, at most two eligible code pairs remained possible, fewer than the required three for any candidate. A later code request also reported non-nominal thermal state. The remaining work was stopped for resource-based inability to qualify. This was an unplanned early stop and the original full matrix was not completed. The prospective 512-output confirmation never ran.

**The two surviving matched comparisons are observations, not repeatable rankings.** At 24 GB the arithmetic prompt produced 12.0561 tok/s with MTP off and 13.2185 tok/s at depth one, a 1.09642 ratio in its sole clean pair. At 20 GB prose produced 10.7757 tok/s at depth one and 11.2826 tok/s at depth three, a 1.04704 ratio in its sole clean pair. Neither pair meets the repetition or workload coverage requirement. Other individually clean results cannot be paired with a contaminated sibling to advertise a speedup. All individual rates and all excluded timings are retained in the linked analysis.

**What the evidence does establish.** The stock runtime exercised the requested depths; MTP acceptance, verification counts and file-read counters were captured. All 26 completed warmup/measured pairs reproduced identical output-token sequences within their setting. Changing draft depth can change the generated token sequence because the target model evaluates different batch shapes; cross-depth identity is not promised and output differences remain visible. These runs therefore compare generated workloads, not forced identical token paths or model-quality scores. No complete-program, reasoning-quality, sampled-distribution or long-context qualification was performed.

A larger draft can reduce target-model traversals per emitted token, but it also runs more draft-head steps, verifies more positions, performs rollback/reconciliation, and may read experts for rejected positions. The resident head also reduces expert-cache capacity at a fixed total budget. The balance depends on acceptance, verification batch cost, routing, cache size and prompt. This is why a depth recommendation from a fully resident GPU server cannot establish the optimum of this SSD-offloaded Mac configuration. The counters record requested expert-file bytes, not measured physical NAND traffic.

**Resource and instrumentation limits.** Swap counters are global to the Mac; these data cannot attribute an increment to the model or another app. Four 24 GB and nine 20 GB measured responses had swap activity and were excluded. One additional 20 GB response failed the thermal gate. No new swap-out count was observed across either cohort; existing swap occupancy was not erased. Thermal and low-power observations are OS policy readings, not direct GPU clock or temperature measurements. The watcher sampled resource conditions every two seconds, and the stock generator sampled physical footprint every 20 ms. Clean readings do not prove complete host isolation or zero timing noise. The common sampler's overhead was not independently calibrated here. GPU/CPU profiling instrumentation was not enabled or added.

**Next qualifying test.** Use a new frozen cohort after the Mac is quiet, with nominal thermal state, stable swap counters and the declared memory headroom. Repeat all four depths in balanced order, keep the actual-code fixture and same total RAM, then confirm any eligible improvement with the prospectively described longer output. Preserve these attempts and do not replace their failed rows. Until then, the correct statement is that one remains the default and the optimum is unproven.

**Cleanup and evidence.** Every launched test process exited, the native model lock was free, no competing model/build job remained in the scoped inventory, and the installed executable and Metal hashes matched their pre-test identities. The demo server was not restarted. Raw evidence, reproducible analysis, protocol limits and the stop reason are in [[sources/runs/2026/09/2026-09-11-mtp-depth-fixed-total]]. The earlier depth study remains historical evidence in [[records/measurements/the-rebuild-eliminated-and-the-numbers-that-ship-2026-09-02]]; this incomplete study neither supersedes it nor changes any published speed claim.
