---
type: run
id: 01m41s5s6ebg0m88qsnszqpwp0
created: 2026-10-03T21:02:00.910066210+00:00
updated: 2026-10-03T21:03:39.449162257+00:00
summary: 'Current-source mirror pairs on Mac mini M4 with explicit keepalive off: identical 200-token output and no observed swap.'
binary: 94a8df46462dfc1b3241bc9f14db5d25c2d76299a861fc4475b171a7cc02df6d
captured_at: 2026-10-03
command: Recorded keepalive.py; each command and the prospective AB/BA protocol are retained in sources/artifacts/mirror-current-main-20261003.
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Current-source mirror pairs and keepalive diagnosis on Mac mini M4
tool: slotstream run
---
Three interleaved AB/BA pairs on source commit `26b68c429fd7257289db42ed3bd0afb044484bc8`, base `143b575870ae2a1580beda2e70f0f3a72f75f5f7`. Each arm delivers 200 greedy tokens with seed 1, MTP on, 118 experts/layer and an 8,192-token context. Both arms explicitly use `--gpu-keepalive off` on this Mac; these are not default-auto performance results.

Binary SHA256: `94a8df46462dfc1b3241bc9f14db5d25c2d76299a861fc4475b171a7cc02df6d`.
Metal SHA256: `2d2e729831a995a39778164c93ea1b2e8d87f7d8b1e717386d3d816f46f416b2`.
Source archive SHA256: `dc98f521195ff6878af40e7079a86ae27421cdd4ccbf690781840f5891fe4677`.
Swift.org Swift 6.3, pinned MLX revision `ab924c82ead3b970caaa1c0ac11171de23f0305a`, macOS 15 MLX-metal 0.32.2.

Both copies passed `pull --verify --dir <copy>` on this executable: all 25 pinned files, 105.3 GB. The optional tap-correction sidecar is absent on both. Admission requires 28 GB reclaimable for three consecutive samples and quiet preflight; every model command acquires the native exclusion lock. Fresh processes empty application caches; OS/SSD cache state is uncontrolled. All six runs completed without observed global swap, memory pressure cancellation or runtime error. All six stdout digests and token-ID sequences are identical.

| Round | Arm | tok/s | Decode seconds | Decode I/O seconds | Prefill read GB/s |
|---|---|---:|---:|---:|---:|
| 1 | single | 6.1255 | 32.650284 | 10.787891 | 3.2021 |
| 1 | mirror | 7.0682 | 28.295598 | 7.341715 | 4.7017 |
| 2 | mirror | 7.0722 | 28.279589 | 7.306459 | 4.7008 |
| 2 | single | 6.1328 | 32.611282 | 10.784675 | 3.2042 |
| 3 | single | 6.1360 | 32.594460 | 10.784512 | 3.2066 |
| 3 | mirror | 7.1087 | 28.134618 | 7.268098 | 4.7196 |

Medians: decode 6.132846870 to 7.072238484 tok/s; median paired ratio 1.153899743. Decode I/O 10.784674924 to 7.306458619 s. Prefill reads 3.204211020 to 4.701667139 GB/s. The mirror serves 35.15–35.51% of all routed bytes. This one prompt/cache/device profile does not qualify other hardware or cold SSD performance.

A separate same-executable 12-token off/auto/off diagnosis retains identical token IDs and no observed swap. Off decode 1.679916042 and 1.663101541 s, repeated auto 33.345823334 s (19.95 times the off median). An official v0.2.27 executable with the same MLX revision and pinned macOS 15 library was also slow with auto. The evidence locates the slowdown in the keepalive control on this machine; it does not establish a toolchain defect or the internal Metal scheduling mechanism.

Raw output, metrics, admission samples, exact commands, prospectively declared protocol and source driver: [artifact manifest](../../../artifacts/mirror-current-main-20261003/SHA256SUMS), [pairs](../../../artifacts/mirror-current-main-20261003/pairs/protocol.json), [keepalive diagnosis](../../../artifacts/mirror-current-main-20261003/keepalive/comparison.json), [copy verification](../../../artifacts/mirror-current-main-20261003/copies/).
