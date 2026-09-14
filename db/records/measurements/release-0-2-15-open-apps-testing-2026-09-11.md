---
type: measurement
id: 01m28gd7hehzj0n7mmgvsa10a0
created: 2026-09-11T15:12:05.166921+00:00
updated: 2026-09-11T18:47:24.806849+00:00
summary: 'v0.2.15 testing with apps open: API passes, strict MTP resource gate remains unqualified'
date: 2026-09-11
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: The 31 API checks stand as recorded. The four MTP exclusions were produced by the zero-swap acceptance rule retired the same day by records/decisions/global-paging-is-diagnostic; that gate later completed on the published artifact.
order: '1195'
runs: '[[sources/runs/2026/09/2026-09-11-release-0-2-15-open-apps-mtp-excluded]], [[sources/runs/2026/09/2026-09-11-release-0-2-15-candidate-api-passed]]'
superseded_by: '[[records/measurements/release-0-2-15-published-2026-09-11]]'
title: 'v0.2.15 testing with apps open: API passes, strict MTP resource gate remains unqualified'
status: superseded
---
**Testing with applications left running has finished its bounded runs: all 31 candidate API checks passed. The original model suite remains 24 of 25 gates qualified because all four new full MTP/vision attempts were rejected by the strict system-wide swap guard. Full model acceptance, publication and installation are not complete.**

Carlos explicitly required that no applications or other work be closed. This phase obeyed that instruction. The earlier proposed pause of another task was never performed and is superseded by this constraint. Chrome and Wispr Flow were observed running at closure. Every owned model and test server is stopped; the native lock is free.

The candidate is still source commit `ee4d1af5b3d63c2b5670c814b40b25432415eb46`, binary SHA-256 `31eefbbb4791beddb0f8674ab1c1875c2eb1c4a034f5cdd0fa1abcba31e373cf`. All 150 compiled inputs match; the successful main CI and earlier 24 model passes remain the evidence in [[records/measurements/release-0-2-15-prepublication-2026-09-11]]. No runtime source, model weight, inference setting or native acceptance assertion was changed to obtain these results.

## Additional API qualification

The complete 31-check end-to-end script passed against the exact uninstalled CI candidate at a 10 GB target, with MTP on and vision off. This covers API/CLI compatibility, streaming, Unicode, long prompts, malformed/hostile input, seeded sampling, prefix reuse, four concurrent clients and disconnect recovery. Its default-depth probe recorded 30 drafts over 15 verification passes and populated the native lifetime footprint statistic. No depth environment override was present. This confirms configuration behavior and ordinary functional operation; it is not a speed comparison or a zero-swap measurement. It does not claim that the new binary was installed.

## Remaining strict memory gate

| Attempt | Maximum observed process bytes | Native swap-ins | Native swap-outs | Outcome |
| --- | ---: | ---: | ---: | --- |
| 1 | 10,422,621,560 | 4 | 0 | Resource interval rejected |
| 2 | 10,362,000,712 | 12 | 0 | Resource interval rejected |
| 3 | 8,507,675,112 | 4 | 0 | Guard stopped early |
| 4 | 10,372,159,392 | 4 | 0 | Resource interval rejected |

All are below the original 12,000,000,000-byte ceiling, but every attempt returned exit 1 and `memory_validated: false`. The last reached passing text/vision determinism, speculation-ran and numerical recording/rollback checks; its global paging guard then prevented complete cross-request MTP state qualification. This is not all 25 gates passed, and partial functional successes do not substitute for the missing full gate. The error specifically includes global paging, and the counters prove swap-ins; they do not identify which process caused them or establish a runtime allocation defect.

The optional two-minute stable-swap preflight repeatedly restarted even without a model running. The API suite used that idle time on one server, and the waiting wrapper detected it and did not launch a second model. After that server stopped, the task's idle preflight wrapper was deliberately interrupted and the remaining attempts used the original real-headroom preflight. This removed an extra waiting policy, not a native acceptance check. The workload, 48-token generations, 12 GB ceiling and strict native zero-swap assertions remained unchanged. All unsuccessful intervals and the wrapper lifecycle are preserved.

## Installed and release state

The installed public executable remains v0.2.14. No v0.2.15 tag, publication, public-artifact installation or installed-v0.2.15 verification occurred. There is no background retry loop or newly running server. Bench details were confined to the test child's environment; production configuration was not changed. Further full acceptance requires a valid original MTP interval; this record does not authorize relaxing it or closing other work.

Failed native attempts: [[sources/runs/2026/09/2026-09-11-release-0-2-15-open-apps-mtp-excluded]]. Passing API evidence: [[sources/runs/2026/09/2026-09-11-release-0-2-15-candidate-api-passed]].
