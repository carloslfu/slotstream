---
type: decision
id: 01m1yyewfrt423tbtwgznn692f
created: 2026-09-07T22:05:15.128605+00:00
updated: 2026-09-07T22:05:15.128605+00:00
summary: Select exact compact BF16 storage and reject ring eviction variants
decided_on: 2026-09-07
evidence: '[[records/plan/whole-engine-optimization-2026-09-04]]'
reversible_if: Final integrated acceptance exposes a regression, or a substantively changed ring implementation earns the original exactness, resource, nonregression and benefit gates in a prospective fixed study.
title: Select exact compact BF16 storage and reject ring eviction variants
status: standing
---
Compact BF16 row storage is selected for the final integrated optimization candidate after the original full-cache resource test and ordinary-serving guard both qualified on V304. Storage preserves the exact BF16 bit patterns already produced by dequantization. The qualified cache workload halves payload and reduces physical memory; the serving guard establishes nonregression, without an additional whole-engine speed claim.

Both FIFO ring variants remain disabled. Their original full-cache component study completed with enough clean pairs and exact outputs, but neither met the required five-percent eviction benefit. No serving study is required to reject a candidate that already fails its prerequisite benefit gate.

The selection does not activate defaults or a shared executable. The final combined configuration must complete its remaining native, serving, lifetime, resource, client, calibration and delivery requirements. All original failed or excluded runs remain preserved.

Raw evidence and the independent source/math audit: [[sources/runs/2026/09/2026-09-07-optimization-compact-cache-component-and-serving-qualification]]. Unified execution state: [[records/plan/whole-engine-optimization-2026-09-04]].
