---
type: measurement
id: 01m281pv7hxndcwtb6wrzyads7
created: 2026-09-11T10:55:11.601790+00:00
updated: 2026-09-11T10:55:11.601790+00:00
summary: Released-GPU peak underreporting fixed; fixed budgets enlarge actual caches; long zero-swap acceptance remains excluded
date: 2026-09-11
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1180'
runs: '[[sources/runs/2026/09/2026-09-11-lifetime-footprint-and-fixed-budget-audit]], [[sources/runs/2026/09/2026-09-11-lifetime-footprint-initial-acceptance-excluded]], [[sources/runs/2026/09/2026-09-11-lifetime-footprint-long-memory-excluded]], [[sources/runs/2026/09/2026-09-11-lifetime-footprint-live-budget-integration]]'
title: Lifetime footprint reporting and fixed-budget audit
status: measured
---
The current source still lost earlier GPU memory peaks. This audit reproduced the defect, replaced the counter with the native lifetime physical-footprint high-water, and checked fixed-budget planning and allocation. It found no silent 48 GB override failure in the exercised planner and runtime paths. The fix is local and unreleased.

## Confirmed defect and correction

The old counter took the maximum of lifetime RSS and current physical footprint. RSS can omit GPU allocations, while current footprint falls after those allocations are freed. A peak could therefore disappear from the report. Against the unchanged baseline production counter, a bounded Metal test observed about 267 MB, freed the buffers, and then reported only about 65 MB as the peak. Seven assertions failed. The corrected counter retained the earlier peak after release and passed the same GPU lifecycle, CPU allocation, concurrent-read and independent-sampling checks. No model was loaded for that reproduction.

The implementation reads `task_vm_info.ledger_phys_footprint_peak`, checks that the returned kernel structure covers the field, and rejects unavailable or invalid signed values. The compatibility peak combines the native lifetime peak, lifetime RSS and current footprint. Current usage remains distinct. The optional `lifetimePhysicalFootprintPeakBytes` statistics field preserves decoding of older saved observations. Common generation completion and all Engine early returns now record memory, including cancellation and refusal paths that could previously leave zero values. The CLI distinguishes lifetime and sampled peaks; context-check no longer mislabels the combined process peak as RSS.

The memory acceptance gate includes the native lifetime counter when supplied, while retaining request sampling and the unchanged zero-swap requirement. Lifetime peaks include loading and earlier requests, so they cannot be attributed exclusively to the latest request. Historical values have not been retroactively remeasured. The historical automatic-plan 32 GB figure on the public surfaces is now correctly identified as an estimate, and its claim uses a specific needle rather than matching unrelated hardware tiers.

## Fixed-budget checks and limits

The public doctor interface passed 304 cases across simulated 32, 48, 64, 96 and 128 GiB Macs, several explicit targets and context sizes, MTP off/on/auto, available-memory refusals, option precedence and malformed/nonfinite inputs. These cases load no model and do not qualify those devices. In the simulated 64 GiB, default-context, MTP-off case, an explicit 48 GB target enlarged the pool from 7,280 to 12,705 slots. It was not silently held at the automatic plan. An explicit expert or pool setting still takes documented precedence, and inadequate available memory causes a refusal rather than an undisclosed smaller fixed cache.

Two real local servers at 8.1 and 10 GB confirmed that the runtime plan matched doctor and that the larger plan increased allocated pool bytes by 1,031,270,400 and startup physical footprint by 1,031,012,352. Six requests checked short/long/short lifetime accounting, stable fixed pool sizing and current `/api/ps` usage. Four CLI cases covered normal completion, empty input, exhausted context and preparation refusal. A doctor invocation does not reconfigure an already running server. A memory budget also need not be fully used while context and temporary reservations are idle.

One request in the integration sequence had global swap-ins. It is retained as excluded from resource/performance qualification; the startup plan and allocation observations are functional evidence only. These scaled local runs do not establish behavior on an M2 Ultra 64 GiB machine or prove the cause of any uninstrumented customer observation.

## Validation and artifact scope

The first frozen candidate passed the 44-group catalogue with 27,397 assertions, all 26 governor cases, the serving robustness suite with 74 checks, and vision serving with 25 checks. Real-model checks covered output equality across budgets, growth/shrink/regrowth, the full elastic governor drill, prefix reuse, sweep behavior, MTP, vision parity and long-context recall. The initial acceptance battery reported 20 passed and five failed; every failure was a strict resource exclusion for global swap-ins, with no target overrun or new swap-outs observed in those intervals.

Isolated reruns qualified the full MTP/vision diagnostic, short memory gate and both context-check gates with zero swap. Together with the original valid gates, 24 of the 25 acceptance gates qualify on the same accounting and engine implementation. The 7,972-token recall repeatedly answered SEVENTEEN and stayed below the 10 GB target, but continued to observe four global swap-ins. Its zero-swap memory gate remains unqualified. This audit does not call the complete acceptance battery passed or attribute global paging to a particular process.

A final rebuild changed only the human-readable context-check label. `final-source-comparison.json` proves that this is the only compiled-source difference from the candidate used for the broad model battery. The final build passed the full static gates and another isolated 2k context check. The native positive and negative controls, source archives, fixture failures and resource exclusions remain in the linked raw archive. The original counter's failing negative control is expected evidence, not a failed corrected implementation.

The final source matches the reconstructed build identity, and the model lock is free. No installed binary, release, tag or remote branch was changed. No inference about an unobserved customer command, server configuration or measurement tool is warranted.
