---
type: measurement
id: 01m33fxy2ka9fz5avqkjqpcvd4
created: 2026-09-22T02:43:13.619380+00:00
updated: 2026-09-22T05:04:53.699748+00:00
summary: 'Automatic prefill policy: validation and bounded adoption'
date: 2026-09-21
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1614'
runs: '[[sources/runs/2026/09/2026-09-21-automatic-prefill-policy-timing]], [[sources/runs/2026/09/2026-09-21-automatic-prefill-policy-correctness]]'
title: 'Automatic prefill policy: validation and bounded adoption'
status: measured
---
Historical initial automatic-policy validation, preserved below. MTP is now included through [[records/measurements/mtp-prefill-policy-2026-09-21]]; the earlier paging-excluded study is not relabeled successful.

The engine now selects the combined fused-workspace and expert-read policy automatically on the existing qualified M5 Pro profile. Carlos explicitly requested automatic behavior instead of user opt-in after being told the speed result lacked three clean pairs. This is a bounded product adoption supported by exact-state, lifecycle, memory and integration checks. It is **not a claim that the frozen performance-adoption criterion passed**: the new study has zero eligible matched pairs, and the earlier 41.67% result remains one preliminary pair.

## Automatic behavior

Deployment enables fused workspace accounting alongside the already qualified fused kernel. One internal PrefillReadPolicy checks the actual GPU/NAX capability, BF16 weights, attention geometry, MTP/image mode and attention fallbacks. Its default larger read envelope applies only to 256-query computation and ends within 16384 keys. At later positions, on other compute shapes, or when the attention path cannot use the reservation, the established automatic cap remains. Each candidate still passes the same physical-footprint, live-headroom and request-ownership admission. A larger maximum never grants memory, changes compute rows or bypasses a checkpoint.

The Mac app, CLI and serving adapters inherit this through the shared engine. There is no new UI control or startup tuning benchmark. Explicit reference configurations and older serialized settings keep original reservations. SLOTSTREAM_OPT_FUSED_WORKSPACE=0 restores original accounting and automatic cap; disabling forced fusion also disables the combined automatic path. Independent read-cap overrides remain diagnostic tools, not a setup requirement. MTP, images, CPU and unqualified hardware retain their existing automatic policy.

## Evidence and limits

| Round | Previous default prefill seconds | Automatic policy prefill seconds | Timing eligibility |
| --- | ---: | ---: | --- |
| 1 | 145.658 | 84.924 | Excluded: paging |
| 2 | 142.374 | 76.459 | Excluded: paging |
| 3 | 139.276 | 88.428 | Excluded: paging |

These raw times are excluded from a qualified speed estimate. All primary default runs request 355.763 GB of expert data versus 1239.147 GB, with the same output IDs and compute schedule; requested bytes are not physical SSD bytes. All complete below 10 GB. The study stops after the three initial pairs because both allowed extensions could yield at most two eligible pairs. The original protocol, initial analyzer, explicit early-failure rationale, all cells and the controlled driver exit are preserved. No further extension or cross-study pooling earns a passed result.

The full 16K state comparison, default catalogue, lifecycle, aligned checkpoint/disk, MTP/image, 8.1 GB boundary and fusion-disabled checks pass. Mac and static suites pass. See the raw correctness run for exact counts, peaks and the small-pass boundary correction discovered by the first catalogue attempt. Broader hardware, larger contexts and MTP workspace reductions remain unqualified; the guarded default falls back there. A reproducible performance regression should revise the policy, and a reliable speed percentage still requires a new independently frozen clean-host study.

Decision: [[records/decisions/automatic-prefill-read-policy]]. Previous experiment and exclusions: [[records/measurements/prefill-opportunities-2026-09-21]]. Raw evidence: [[sources/runs/2026/09/2026-09-21-automatic-prefill-policy-timing]], [[sources/runs/2026/09/2026-09-21-automatic-prefill-policy-correctness]].
