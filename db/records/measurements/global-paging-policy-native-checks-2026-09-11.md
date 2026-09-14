---
type: measurement
id: 01m28qf2ftcvdwa0eyejq6ej6s
created: 2026-09-11T17:15:25.562531+00:00
updated: 2026-09-11T17:15:25.562531+00:00
summary: The previously interrupted MTP/vision check now passes with paging present; governor, context and static checks pass with actual memory safeguards intact.
date: 2026-09-11
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1196'
runs: '[[sources/runs/2026/09/2026-09-11-global-paging-policy-native-pass]]'
title: 'Global paging policy: native checks with apps open'
status: measured
---
**The full MTP/vision check now finishes and passes with host paging present.** Governor shrink/cooldown/regrowth and the context check also pass. The full static suite passes. This validates the corrected functional gate on a local source build; the updated CI artifact and release still require their own acceptance.

Carlos explicitly removed the zero-global-swap acceptance rule. [[records/decisions/global-paging-is-diagnostic]] now separates process-budget and numerical acceptance from timing eligibility. Global counters remain visible; actual headroom, OS pressure cancellation, process ceilings, model exclusion and completed output remain enforced. Native MTP/governor receipts also enforce the kernel lifetime footprint peak, including freed GPU allocations.

| Complete local diagnostic | Maximum observed process bytes | Ceiling | Native swap-ins / swap-outs | Result |
|---|---:|---:|---:|---|
| Original MTP and vision, including cross-request state reuse | 10,349,041,736 | 12 GB | 600 / 0 | Pass |
| Full governor shrink, cooldown and regrowth | 11,000,302,952 | 13 GB | 32 / 0 | Pass |
| Context check, 2,048 prompt tokens | 8,519,322,864 | 10 GB | 0 / 0 during generation | Pass |

The governor preserved identical nonempty token IDs across all three generations. MTP kept its original determinism, vision execution, accept sanity, recording, rollback and reused-state logit criteria. The context request completed inside its plan. Regression fixtures additionally verify that increases in either global counter do not fail functional acceptance, while exceeded physical peaks, missing process-memory evidence, actual pressure cancellations and incomplete deliveries still fail.

The MTP outer launch interval also recorded paging before the native receipt boundary: 604 swap-ins and 580 swap-outs in total. This does not attribute paging to any application and does not qualify clean timing. All applications and unrelated workloads stayed open; every native test process exited. Production generation settings and instrumentation defaults are unchanged.

Source implementation commit: `0f7aae1`; documentation alignment: `48d11f2`. All 150 compiled inputs are bound in the local build identity and reconstructible archive. Historical excluded runs in [[records/measurements/release-0-2-15-open-apps-testing-2026-09-11]] retain their original results; they are not regraded. Full evidence: [[sources/runs/2026/09/2026-09-11-global-paging-policy-native-pass]].
