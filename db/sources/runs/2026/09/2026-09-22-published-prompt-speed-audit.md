---
type: run
id: 01m35638htdm784zvtnjk9pp13
created: 2026-09-22T18:29:51.290077+00:00
updated: 2026-09-22T18:31:15.605545+00:00
summary: 'Published v0.2.23 audit: 123 requests; repeated exact prefix reuse is faster, short gains are inconsistent, and long timing exclusions and default-profile limits remain explicit.'
binary: 5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89
captured_at: 2026-09-22
command: Frozen serve_bench protocols; long-prefix diagnostics; paired analysis and reconciliation
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Published v0.2.23 multi-prompt speed audit capture
tool: Installed release binaries, native serve metrics and Python analysis
---
The installed v0.2.22 and v0.2.23 executables and same-v0.2.23 feature ablations were tested on the 48 GiB M5 Pro. The v0.2.23 executable SHA-256 is `5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89`; v0.2.22 is `ac6d194ee9fc986f775701f468cf1550575965e24f519a9d7daad3c4baa741a0`. The runtime and tagged release are unchanged.

[Complete capture](../../../artifacts/prompt-speed-audit-2026-09-22/capture.tar.gz) and [per-file manifest](../../../artifacts/prompt-speed-audit-2026-09-22/manifest.json). Archive SHA-256: `028cecddf96f27d1c81d6cb476813b772dbb33ab34a540f293025dc5c7a1cf6b`. All 874 archive entries were re-read and verified against the manifest. Repeated identical source archives use tar hardlinks; generated prefix-cache blobs and Python bytecode are omitted, while cache inventories and state hashes remain. Public binary/shader identities are recorded rather than duplicating their distribution bytes.

The capture contains prospective protocols and fixtures, exact source identities, controller and server logs, every completed request and original verdict, streamed responses, timing/resource observations, pilot and prelaunch failures, paired analysis, sequence-cost analysis, independent reconciliation, the benchmark patch and regression output, and separately identified reviewed prior evidence. It preserves 123 completed HTTP requests: 115 matrix/pilot requests and eight long-prefix diagnostic requests. Two interrupted requests are listed separately. Of 81 recorded measured matrix cells, 37 meet their original gates. Eligibility is applied per comparison and cohort; no replacement rounds or pooling manufacture a three-pair result.

Three clean prose follow-up pairs demonstrate exact 2,048-token reuse and a median paired request-time reduction of 85.62% against checkpoints disabled in the same release. This is not a release-to-release claim. Larger-profile and kernel-attribution screens have only one clean pair each. Short-request comparisons show no consistent gain. The corrected disk diagnostic restores 8,192 tokens with identical nonempty 16-token outputs; it is functional evidence, not a repeated timing qualification.

All 1,035 emitted-metric checks on the 115 requests and all 32 corrected disk checks pass. The benchmark validator's 51 regression tests, six offline captured-cell functional replays and 12 analysis tests pass. Those replays do not change original timing verdicts. Complete observed peaks remain within target. All owned model servers/controllers were stopped and reaped. No inference implementation or application default is changed by this audit.

Interpretation and limits: [[records/measurements/published-prompt-speed-audit-2026-09-22]]. Exclusions: [[sources/runs/2026/09/2026-09-22-published-prompt-speed-audit-excluded]].
