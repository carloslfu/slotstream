---
type: run
id: 01m4234ks8z7hfwvhp156fmjy9
created: 2026-10-03T23:56:08.360211127+00:00
updated: 2026-10-04T00:17:04.516698690+00:00
summary: 'Paired mirror reads on main 57aa493: all six 200-token outputs match, no swap, explicit keepalive off.'
binary: 327c55366c3639fb789d02780e2e7b696207c496fcb94bd521cac1059b621427
captured_at: 2026-10-03
command: followup-model.py; prospective protocol and all six commands retained in sources/artifacts/mirror-qualified-20261004/pairs
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Paired mirror reads on main 57aa493 with explicit keepalive off
tool: slotstream run
---
Three prospectively declared interleaved AB/BA pairs on source `f37412f65d2382cafd930172c9aec9da51cf3265`, main base `57aa493cb2797dfcc03c9c5ff308f0634ded39b8`. Each arm completes 200 greedy tokens, seed 1, MTP on, 118 experts/layer, context 8192 and explicit `--gpu-keepalive off`. Both copies pass all 25 pinned SHA256 checks (105.3 GB) on this executable before inference; the optional tap-correction sidecar is absent on both.

Binary SHA256: `327c55366c3639fb789d02780e2e7b696207c496fcb94bd521cac1059b621427`.
Metal SHA256: `2d2e729831a995a39778164c93ea1b2e8d87f7d8b1e717386d3d816f46f416b2`.
Source archive SHA256: `0d8dbdf50a539befcf7c3817bfa6550cddb702ee83029e11e007a36bdc87d4a7`.
Mac mini M4 / 32 GB / macOS 15.7.4, swift.org Swift 6.3, MLX 0.32.2 at revision `ab924c82ead3b970caaa1c0ac11171de23f0305a`.

Admission requires 28 GB reclaimable for three consecutive samples, quiet preflight and the native model exclusion lock. All six runs are eligible: complete output, no runtime/request errors or pressure cancellation, no observed global swap, both lifetime RSS and physical-footprint peaks below 28 GB. All six prompt/output token-ID sequences and stdout SHA256 values match. Fresh processes clear application caches; OS/SSD cache is uncontrolled. This is this machine/profile, not default-auto or cold-SSD qualification. No excluded arm was replaced.

| Round | Arm | tok/s | Decode seconds | Decode I/O seconds | Prefill read GB/s |
|---|---|---:|---:|---:|---:|
| 1 | single | 5.983489361 | 33.425312208 | 10.825926368 | 3.198072653 |
| 1 | mirror | 7.059065718 | 28.332361250 | 7.385706209 | 4.787029147 |
| 2 | mirror | 7.011681090 | 28.523830083 | 7.432206662 | 4.819968754 |
| 2 | single | 6.138429944 | 32.581621333 | 10.781442592 | 3.203592113 |
| 3 | single | 6.131650593 | 32.617644625 | 10.775990109 | 3.208837105 |
| 3 | mirror | 7.089165952 | 28.212063500 | 7.317273036 | 4.714244061 |

Median decode rates: 6.131650593 to 7.059065718 tok/s. Median paired rate ratio: 1.156159479 (+15.615948%). The paired-ratio median and the ratio of the two arm medians are distinct statistics. Median decode I/O: 10.781442592 to 7.385706209 s. Median prefill reads: 3.203592113 to 4.787029147 GB/s, computed from the recorded prefillReadBytes/prefillIOSeconds. The internal copy serves 35.227685–35.865387% of routed bytes. Maximum observed lifetime footprint is 20923366376 bytes; lifetime RSS 19988856832 bytes.

The earlier [[sources/runs/2026/10/2026-10-03-mirror-current-main-paired]] is separate evidence on source26b68c4/base143b575. Its off/auto/off control identifies the keepalive slowdown on this Mac, without proving an internal Metal mechanism or an Apple-toolchain defect. Production defaults were not changed. Disk file-reader qualification is separately retained in [[sources/runs/2026/10/2026-10-04-mirror-physical-read-witness]]; it does not predict engine throughput.

Exact commands, protocol, admissions, all metrics/IDs/output, copy verification, executable/source identity and driver: [manifest](../../../artifacts/mirror-qualified-20261004/SHA256SUMS), [protocol](../../../artifacts/mirror-qualified-20261004/pairs/protocol.json), [rows](../../../artifacts/mirror-qualified-20261004/pairs/rows.json), [summary](../../../artifacts/mirror-qualified-20261004/pairs/summary.json), [derived medians](../../../artifacts/mirror-qualified-20261004/pairs/derived-summary.json), [copies](../../../artifacts/mirror-qualified-20261004/copies/). Capture is October 3 UTC / October 4 Europe/Berlin. The repaired full-model acceptance started after these pairs; its completion is reported separately.
