---
type: run
id: 01m27310hj7yz9dwy0n84s773t
created: 2026-09-11T01:58:58.866269+00:00
updated: 2026-09-11T02:02:21.475051+00:00
summary: Inconclusive MTP depth comparison at equal total RAM, with all exclusions preserved
binary: slotstream 0.2.14; SHA256 49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7
captured_at: 2026-09-11
command: python3 .build/mtp-depth-study-20260911/bench.py; python3 .build/mtp-depth-study-20gb-20260911/bench.py; exact commands and protocols in archives
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Inconclusive MTP depth comparison at equal total RAM
tool: Stock Slotstream 0.2.14 serving metrics and resource guards
---
Inconclusive fixed-total-memory MTP-depth study. The two cohorts are separate and must not be pooled. `discarded: true` applies to using this study to select a new default; each raw row retains its independent resource-validity flag.

The first cohort used 24 GB and stopped before its twelfth model launch when reclaimable memory was 28.58 GB, below its frozen 29 GB preflight. Eleven measured responses completed, seven clean. The separate 20 GB cohort used a 25 GB preflight and a corrected actual-code fixture. Fifteen measured responses completed, five clean. Four of the former and nine of the latter measured requests had swap activity; one additional 20 GB request had a non-nominal thermal observation. A final 20 GB attempted cell was interrupted before launch.

Both code baseline requests in the first two 20 GB rounds were ineligible. At most two of the four frozen rounds could therefore supply a clean code pair, below the prespecified minimum of three. The study was stopped for this resource-based inability to qualify, without replacing rows. This early stop was not part of the original fixed-round protocol and is disclosed in the retained stop record; it was not selected by observed speed. Unrun cells are not completed tests. The prospectively described 512-output confirmation was not run because no candidate qualified.

Artifacts captured before the derived measurement:

- [Manifest and archive hashes](../../../artifacts/mtp-depth-fixed-total-2026-09-11/manifest.json).
- [24 GB protocols, pilot, raw wires, resources, all rows and drivers](../../../artifacts/mtp-depth-fixed-total-2026-09-11/24gb-raw-results-and-drivers.tar.gz).
- [20 GB protocols, raw wires, resources, all rows and drivers](../../../artifacts/mtp-depth-fixed-total-2026-09-11/20gb-raw-results-and-drivers.tar.gz).
- [24 GB analysis](../../../artifacts/mtp-depth-fixed-total-2026-09-11/24gb-analysis.json).
- [20 GB analysis](../../../artifacts/mtp-depth-fixed-total-2026-09-11/20gb-analysis.json).
- [Compiled source identity](../../../artifacts/mtp-depth-fixed-total-2026-09-11/build-identity.json).
- [Explicit early-stop reason](../../../artifacts/mtp-depth-fixed-total-2026-09-11/futility-stop.json).
- [Stopped processes, free lock and unchanged installed binary](../../../artifacts/mtp-depth-fixed-total-2026-09-11/cleanup-proof.json).

Every archived member was decompressed and SHA-256 checked against its original bytes. The archives include native per-request token IDs and output text, not just transcribed rates. Stock benchmark diagnostics and a 20 ms native physical-footprint sampler were enabled only in test child environments; no profiling build, GPU tracing, source patch or installed-binary replacement was used. The installed binary SHA256 is 49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7. All compiled source hashes match the checkout recorded at 022cf32ed0264ae50e9bb6c6e95c71940fb7a679. Metal SHA256 is 198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597.

The model identity records hashes for configuration/tokenizer files, headers plus sizes and timestamps for weight files. This run did not rehash the entire weight payload. Binary copies remain in the ignored local study directory; their source identities and exact executed hashes are durable here. To repeat the offline analysis, extract an archive and run its `analyze.py` beside its `protocol.json` and `study/results.jsonl`. To repeat model work, recheck real resource headroom and use a separately frozen new cohort rather than overwriting these results.
