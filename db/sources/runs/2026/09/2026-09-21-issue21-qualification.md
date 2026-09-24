---
type: run
id: 01m31bnqcxh1pvgrafj816x7k3
created: 2026-09-21T06:50:21.468823+00:00
updated: 2026-09-21T06:50:36.991604+00:00
summary: 'Issue 21: full acceptance, long conversations and final checkout regression evidence'
binary: cc39e86eab88e3873d4c2fad47fb1e0505df63eb75d3d79da8da750c3e42fce0; final checkout 7a4ae53bb0ce8e1fbdeb0df7f83685cea7c7b28e341a779814fb6e6fa48d0694
captured_at: 2026-09-21
command: frozen build; T0/T1; optimization-state-check; Tools/static_gates.sh; Tools/verify.sh; issue21 and adaptive live harnesses
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Issue 21: full acceptance, long conversations and final checkout regression evidence'
tool: slotstream-checks; acceptance and Python HTTP/SSE harnesses
---
This follow-up extends [[sources/runs/2026/09/2026-09-21-issue21-regressions]] with long conversations, the full acceptance battery, additional serving diagnostics and a final live check of the shared checkout. It preserves unsuccessful intermediate attempts as well as the passing runs. Functional qualification was performed on [[records/machines/macbook-pro-m5-pro-48gb]] with ordinary applications open. Timings and global paging are diagnostic, not clean throughput measurements.

## Immutable raw evidence

Every archive was created before this transcription, reopened, and verified against a per-member byte count and SHA-256 manifest. Executables and generated prefix-state directories are excluded. Build identities, exact build-source archives, test drivers, commands, requests, raw SSE, arrival times, server output and result files are included.

| Archive | Contents | Manifest |
| --- | --- | --- |
| [Initial qualification](../../../artifacts/issue21-qualification-2026-09-21/initial-qualification.tar.gz) | Passing long conversation at a configured 64K window, supplied many-turn fixture, initial stale diagnostic failures, initial static mismatch and failed intermediate compilation | [Hashes](../../../artifacts/issue21-qualification-2026-09-21/initial-qualification-manifest.json) |
| [Intermediate qualification](../../../artifacts/issue21-qualification-2026-09-21/integrated-qualification-before-final-fixtures.tar.gz) | Full static pass, remaining stale fixture failures, and attempts refused by compiler/model resource exclusion | [Hashes](../../../artifacts/issue21-qualification-2026-09-21/integrated-qualification-before-final-fixtures-manifest.json) |
| [Full suite and long context](../../../artifacts/issue21-qualification-2026-09-21/qualified-full-suite-and-long-context.tar.gz) | Passing T0/T1, serving/pressure/persistence diagnostics, all full acceptance gates, live API tests, configured 131K-window conversation and exact restart replay | [Hashes](../../../artifacts/issue21-qualification-2026-09-21/qualified-full-suite-and-long-context-manifest.json) |
| [Final checkout verification](../../../artifacts/issue21-qualification-2026-09-21/final-checkout-verification.tar.gz) | Final build, T0/runtime checks, live streaming/tool/cache/reset/restart tests, bounded adaptive server, source identity and process cleanup | [Hashes](../../../artifacts/issue21-qualification-2026-09-21/final-checkout-verification-manifest.json) |

No failed or resource-refused attempt counts as a pass. The initial static mismatch arose because the frozen binary preceded another task's fractional-memory formatting change. The intermediate compile error was a diagnostic optional-Bool assertion and was repaired before qualification. The final diagnostic failures and their corrections are explained in [[records/measurements/issue21-long-context-qualification-2026-09-21]].

## Executable boundaries

Several tasks edited this checkout. Each model run uses a copied executable and metallib with an exact source archive, so concurrent rebuilding cannot replace a running test's executable.

| Executable SHA-256 | Scope |
| --- | --- |
| `440020be36756e136dd5e4b91b0f679cd5fc28b6911f275c8f4dade70cac6bdf` | Initial 64K-window long conversation and supplied 200-turn fixture |
| `cdc7dd7be078b613ebbb47c31a4d690676c006dec3fe430e0a712a49a1d402d3` | Full static gates passed; remaining stale diagnostic assertions were subsequently corrected |
| `cc39e86eab88e3873d4c2fad47fb1e0505df63eb75d3d79da8da750c3e42fce0` | All 29 full acceptance gates, all 15 T1 groups, serving/pressure/persistence diagnostics, live API regression and 131K-window long conversation |
| `7a4ae53bb0ce8e1fbdeb0df7f83685cea7c7b28e341a779814fb6e6fa48d0694` | Final checkout: all 56 T0 groups with 29478 assertions, runtime check, live issue-21 suite, 24 OpenAI checks, exact small-conversation restart and adaptive server |

Between the last two builds, five files changed: `ContextFeasibility.swift`, `Engine.swift`, `Governor.swift`, `Machine.swift` and `Plan.swift`. These were another task's legacy Swift callable overloads and validation/enforcement of explicitly supplied adaptive memory limits. The issue-21 parser, output, splicing and persistent metadata changes remained the same. The overloads delegate with a nil custom limit; the ordinary fixed-target paths used by the long runs retain their prior policy. The separate provenance is [[sources/runs/2026/09/2026-09-21-adaptive-memory-third-review]]. The full 29-gate battery was not repeated on the final executable. The final source hashes matched the checkout at capture time.

## Reproduction commands

The archives contain the exact orchestration drivers and command arguments. Principal commands were:

```text
python3 Tools/optimization_build.py --out <isolated-build-directory> --jobs 2
<candidate>/slotstream-checks --tier t0 --json
<candidate>/slotstream-checks --tier t1 --json
<candidate>/slotstream runtime-check
<candidate>/slotstream optimization-state-check --variant <variant> --json
bash Tools/static_gates.sh
bash Tools/verify.sh
python3 Tools/issue21_gate.py --port <test-server-port> --output <new-directory>
python3 Tools/issue21_long_context.py --binary <candidate>/slotstream --out <new-directory> --max-context 65536
python3 Tools/issue21_long_context.py --binary <candidate>/slotstream --out <new-directory> --max-context 131072
python3 Tools/adaptive_memory_e2e.py --binary <candidate>/slotstream --out <new-directory>
```

The archived live driver starts the server and invokes both `issue21_gate.py` and `openai_tools_gate.py`, then restarts over its private prefix cache and checks exact replay. The acceptance orchestration binds `SLOTSTREAM_TEST_BINARY` to the candidate and captures its driver hashes and source changes. Variants were `context-serving`, `output-serving`, `governor-boundary`, `governor-boundary-mtp`, `persistent-prefix` and `persistent-prefix-mtp`.

Ordinary live API runs used an 8.1 GB target, context 32768, MTP off and vision off. Long runs used 10 GB at configured context 65536 and 13.5 GB at configured context 131072, with target-plus-3 GB reclaimable preflight, MTP off and vision off. The full battery used its documented bounded governor, MTP and vision exceptions. Only one model process ran at a time; lock or compiler conflicts caused a wait/refusal, never a bypass. No memory hog was used.

## Observed long-conversation results

Both long-window runs completed this same prompt progression with a tool schema present and previous assistant reasoning omitted from the client history:

| Request | Prompt tokens | Reused numerical tokens | New tokens read |
| --- | ---: | ---: | ---: |
| First | 30288 | 0 | 30288 |
| Second | 51367 | 30208 | 21159 |
| Third | 51413 | 51200 | 213 |
| Third after process restart | 51413 | 51200 | 213 |

The third request and its restart replay produced identical answer, reasoning and usage. In the configured 131K-window run, both allowed 16000 output tokens and finished naturally after 24. The separate short unused-tools request also accepted a 16000-token allowance and finished naturally. These are allowance/admission tests, not 16000-token live generations. The earlier parser fixture covers 16000 escaped Unicode fragments without weights; the live truncated-tool fixture hits the same length boundary at 256 generated tokens.

The supplied 200-turn fixture completed and reused its retained prefix. It contains synthetic historical turns supplied in a request, not 200 real sequential model generations, and does not certify every history-splicing path.

## Acceptance and limits

`qualification/full-verify.log` ends with `passed 29, failed 0`. This includes weight verification, goldens, planner/sampler, cache equality and resize, bounded governor recovery, adaptive server, prefix/logit parity, sweep, MTP parity, short/long process-memory checks, context admission, quality, API robustness and vision. Additional serving diagnostics passed with and without MTP where applicable. The final checkout's live test passed truncated streaming with length/usage/DONE, multi-turn reuse, TCP reset survival, all 24 OpenAI compatibility checks and exact disk restart.

The final adaptive server retained its 10 GB ceiling through the production governor's startup cooldown and answered a request. Its report records `passed: true` and `server_reaped: true`. The final cleanup receipt records no owned test processes, a free model lock and no source-hash mismatch.

The largest prompt tested here was 51413 tokens, not a full 131072-token prompt. This does not reproduce the reporter's exact client, hardware or induced memory pressure. The original intermittent exits and prolonged busy stall remain unexplained because neither reproduced and the offered client/full logs were absent. Tail timing is not a benchmark or a demonstrated throughput repair. Changes remain local; this is not release evidence for a published version.
