---
type: run
id: 01m37jgvd5zsy8kepd56qjekev
created: 2026-09-23T16:45:28.356932+00:00
updated: 2026-09-23T16:45:29.052977+00:00
summary: Native Sevra replay and bounded warm cache growth
binary: c16171402453841b477f065beed40f66c15bde5a86b093702016f97d3ecd3de1
captured_at: 2026-09-23
command: measure_app.py; monitor_app.py; elastic-check; elastic-drill; optimization-state-check --variant pool-requests; static_gates.sh; build_sevra_mac.sh
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Native Sevra replay and bounded warm cache growth
tool: Sevra native UI, authenticated local CLI and slotstream diagnostics
---
[Capture](../../../artifacts/sevra-native-replay-growth-2026-09-23/capture.tar.gz), [manifest](../../../artifacts/sevra-native-replay-growth-2026-09-23/manifest.json). Archive SHA-256: `80ad14989711b86703cfa7e488febf3e00ceca9638050afce618d51ea4160b1c`. Every captured file was read back and hash-checked. Original optimization and baseline captures remain byte-for-byte unchanged.

After the user unlocked the Mac, the rebuilt native app completed a new synthetic bicycle/rain/RAM conversation and short greeting. The first prompt used the native composer; subsequent prompts used `sevra-local chat` against that same app-owned thread. Native conversation metrics were inspected. Automatic budget/readiness and thinking-off stayed selected. The model ran in only the GUI process; builds and standalone model checks ran after quitting it. Actual availability was used, with no pressure hog or simulated app availability.

The first replay used app SHA-256 `fc962d03c3c421f6abb6388cc9beefd5ef99f0c499b81781a0dd2bfdc46ac1c5`: rates 12.77, 15.02 and 14.60 tok/s; 512 cached tokens on the greeting; first load 10.362 s and same-process reload 1.360 s. Its four-request interval peaked at 29.148 GB, but the later idle/resize/reload observation peaked at 38.493 GB. This exceeded the selected 33 GB ceiling and fails the process-memory gate, despite completed answers. Global paging is separately preserved in `first-native/app-observation-summary.json`. The growth path gathered occupied rows into an extra large tensor, and final-size admission did not price replacement transients.

The correction appends zeroed capacity to existing tensor pieces, preserves indices and maps, frees each old piece before continuing, and clears freed allocator cache. The governor admits the complete temporary growth against current physical footprint, target and fresh real system availability. Unknown/insufficient readings defer growth without dropping the current usable cache. There is no new option, headroom override or numerical/provenance relaxation.

## Final rebuilt native replay

App SHA-256: `c16171402453841b477f065beed40f66c15bde5a86b093702016f97d3ecd3de1`. Its manifest matches current working development inputs. The same prompts ran in another fresh synthetic thread. Automatic resolved to 33.000 GB within the 33 GB ceiling.

| Request | Answer tokens | Writing tok/s | First token, excluding load | Read / reused tokens |
| --- | ---: | ---: | ---: | ---: |
| cold-bicycle | 225 | 16.19 | 4.86 s | 143 / 0 |
| warm-rain | 266 | 16.54 | 4.78 s | 418 / 0 |
| warm-caching | 243 | 16.31 | 7.98 s | 737 / 0 |
| warm-short | 2 | Tiny reply | 4.13 s | 490 / 512 |


First preparation was 9.085 s. Release memory now followed by the same short greeting loaded the model in 1.281 s, then took 9.765 s to first token. The short history was below the existing 2,048-token disk-save threshold, so this reload correctly had 0 restored tokens. Fast model verification is not free prompt reading.

The complete sampled final interval, including idle and reload, peaked at 29.652 GB. Global deltas were 2322 swap-in and 0 swap-out pages. Thermal states: nominal. `app-observation-summary.json` retains boundaries, sample count and memory observations. These single live-host native replays have different generated text/lengths and slightly different initial budgets from the older app. They verify actual integration and remain excluded from clean throughput-anchor replacement.

## Qualification

The engine catalogue passed 73 groups and 31,919 assertions. Exact-byte pool checks cover all quantized pieces, preserved resident mappings and duplicate aliases with dense/sparse bookkeeping combinations. The four-generation elastic check retained identical output through grow/shrink/regrow. The 13 GB live-governor drill shrank, honored its cooldown and recovered with identical output IDs; kernel lifetime physical peak was 9.243 GB. Simulated policy checks cover the observed insufficient-transient case and unavailable readings; no real pressure was induced to force a rejection. Full static gates and the native bundle build passed. `checks.json`, build logs and separate exact-byte follow-up preserve exact commands/results. Earlier automatic-MTP, thinking, tool, privacy and reload qualification remains linked from the optimization measurement.
