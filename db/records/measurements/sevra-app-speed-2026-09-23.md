---
type: measurement
id: 01m36jma63898vkbt9hfv0kn5m
created: 2026-09-23T07:28:07.363306+00:00
updated: 2026-09-23T07:28:07.363306+00:00
summary: 'Sevra desktop speed: short-turn rereads and disabled MTP'
date: 2026-09-23
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Observed app latencies and verified policy gaps; loaded-session timings and MTP comparison are diagnostic, not new public speed anchors.
order: '1660'
runs: '[[sources/runs/2026/09/2026-09-23-sevra-app-speed]]'
title: 'Sevra desktop speed: short-turn rereads and disabled MTP'
status: measured
---
**The actual development app wrote substantial replies at 10.5 to 12.6 tok/s, but spent 4.7 to 8.1 seconds before its first token.** Prompt processing dominates the delay in the short final reply. These are observed live-session timings, not new clean-host throughput anchors. Raw receipts: [[sources/runs/2026/09/2026-09-23-sevra-app-speed]].

| App request | Output tokens | Writing tok/s | First token, excluding load | Prompt tokens read / reused |
| --- | --- | --- | --- | --- |
| Bicycle explanation, first request | 258 | 12.53 | 4.68 s | 143 / 0 |
| Rain explanation, warm | 304 | 10.46 | 6.94 s | 451 / 0 |
| RAM/SSD explanation, warm | 271 | 12.58 | 5.65 s | 808 / 0 |
| Brief greeting, warm | 2 | Not a steady-speed sample | 8.13 s | 1101 / 0 |

The first request also loaded the model for 9.05 seconds. The final greeting spent 8.10 seconds reading context and 0.39 seconds generating its two tokens. The app's displayed rate correctly excludes prompt reading and model load; the tiny final denominator should not be read as steady throughput. All runs used a 33 GB automatic budget, context 32768 and thinking off. Expert hit rates for the substantial replies were 92.4%, 94.0% and 93.5%. No thermal or low-power restriction was observed. Some global swap-ins occurred, so these results are diagnostic.

## Concrete integration gaps

1. The launched app is an older development bundle, built September 21. Its embedded engine version declaration is 0.2.22, with additional then-uncommitted work. The public CLI update to 0.2.24 does not rebuild or replace the app's statically linked engine. Its manifest differs from current engine inputs. This establishes a stale integration, not a measured causal slowdown from every changed file.
2. Desktop's `PerformancePolicy.plan` explicitly requests `mtp: .off`. That source matches the running app's recorded input. The app therefore does not get speculative decoding; this is independent of the Think longer control.
3. Numerical-safe reuse admits only compatible complete compute-pass boundaries. A short prompt that ends inside a large pass supplies no eligible continuation boundary. All four observed app turns reused zero tokens. The present equivalent 33 GB MTP-off engine plan chooses 4096-token passes, illustrating the mismatch between long-prompt efficiency and short-conversation reuse. The old app's exact pass size was not directly instrumented, so that current plan is explanatory evidence, not a reconstructed live plan.
4. Automatic readiness releases the model after about ten idle minutes in this configuration. That saves memory but introduces another load on the next message. The observed first load was 9.05 seconds.

## MTP opportunity and limits

A separate installed-v0.2.24 comparison, with one warmed 33 GB engine and fixed expert pool, measured median plain 13.50 tok/s versus speculative 17.45 tok/s over three rotating pairs. Each arm repeated its own output, but plain and speculative text differed from token 18. The observed ratio is about 1.29. Global paging occurred during the experiment, so this is **not a qualified general speedup or an app improvement already delivered**. It shows that enabling and qualifying the app's automatic MTP path is worth testing. This loop-only comparison retains draft-head memory in both arms and does not reproduce the app's independent MTP-off allocation.

The next implementation work should rebuild and verify the app against current engine inputs, qualify automatic MTP in its ordinary and phased-thinking paths, and measure a short-conversation checkpoint/pass policy without weakening numerical provenance. Improve readiness based on cold/warm latency and memory measurements. Do not silently trade cache correctness for a smaller first-token number or infer a universal optimum from these four requests. No app code or saved performance preference changed in this investigation, and the app was reopened after the diagnostic.
