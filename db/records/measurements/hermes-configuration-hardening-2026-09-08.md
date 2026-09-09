---
type: measurement
id: 01m222q1vkjqybwhdxvme6xq1c
created: 2026-09-09T03:17:20.368479+00:00
updated: 2026-09-09T03:32:01.133880+00:00
summary: Hermes configuration correction and regression checks
date: 2026-09-08
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '779'
runs: '[[sources/runs/2026/09/2026-09-08-hermes-config-latest]], [[sources/runs/2026/09/2026-09-08-hermes-config-reported-version]], [[sources/runs/2026/09/2026-09-08-hermes-live-hardening]], [[sources/runs/2026/09/2026-09-08-hermes-cli-hardening]], [[sources/runs/2026/09/2026-09-08-hermes-protocol-regression]], [[sources/runs/2026/09/2026-09-08-hermes-final-config-regression]]'
title: Hermes configuration correction and regression checks
status: measured
---
The earlier guide placed the main output limit in `model.max_tokens`, but Hermes CLI initialization did not forward that field to the agent. The earlier live integration gate passed a limit directly to `AIAgent`, so its successful requests did not establish that the copied guide applied the same limit. This was a documentation and test-coverage error on our side. It did not establish a Slotstream decoder failure.

The revised guide defines a provider named `slotstream`, with its endpoint, placeholder credential, chat-completions mode and `extra_body.max_tokens` together. Main requests carry 4,096 output tokens; compression requests independently carry 4,096, and title requests carry 64. Both auxiliary tasks explicitly receive a 1,800-second timeout. The main stream watchdog remains separately configured. Reasoning stays an optional user preference.

#### Configuration regression checks

Unmodified Hermes commits `b1f003e18633298d549668b8e186af84cca45b76` and `4a39a3ff8bea45ab5a6b646ce26ced88a8fed079` each pass eleven cases through the real CLI configuration and request code, with synthetic HTTP and all real socket connections disabled. The guide's YAML is the input, not a separately maintained test configuration.

The cases cover the clean guide, legacy and current providers named `custom` plus conflicting environment settings, optional reasoning, an edited main output cap, missing and disabled providers, local HTTP 503 and 401 responses, truncated and empty summaries, and the explicit default-profile diagnostic command with a conflicting sticky profile. Main requests preserve the configured endpoint and 65,536-token context. Failure cases make no cloud inference request, failed summaries preserve history, and titles successfully retry after unsupported constrained output is rejected. These are configuration and transport-construction tests, not real-model results.

Raw configuration results: [[sources/runs/2026/09/2026-09-08-hermes-config-latest]] and [[sources/runs/2026/09/2026-09-08-hermes-config-reported-version]].

#### Real-model follow-through

Released Slotstream 0.2.11, binary SHA-256 `7f540b73b5ff4cf48975ff122a3d17f57e53103e616ad84a76cfc71d551be5b8`, served unmodified latest Hermes using the revised guide through CLI initialization. The bounded server used `--max-context 65536 --mtp off --memory-gb 10`, with 30.4 GB reclaimable observed before launch and only one model process. This functional run is not a throughput or memory-capacity benchmark.

With stale generic-provider settings present, the real terminal read executed once, the follow-up recalled the code without another read, and the tool-free length probe completed the full list after 1,095 generated tokens with `finish_reason: stop`. The request carried `max_tokens: 4096`. Every captured inference request stayed on loopback. A metadata connection was blocked by the test's network guard; this is not a claim that every Hermes feature is offline.

The real compressor reduced the 39-message, 99,684-character fixture to 25 messages and 86,585 characters. Its 4,096-token request completed with `stop` after 724 generated tokens. The diagnostic code appeared only in the generated summary at index 4. An actual subsequent turn read 18,659 prompt tokens and recovered the exact code without executing another tool. This is forced compression and recall evidence, not an automatic-threshold stress test. The observed compression threshold was 55,705 tokens.

The length request's cap, complete list and summary-only recall assertions were also checked against the preserved original captures after tightening those assertions in the gate. The multi-turn run used `127.0.0.1`; final CLI smoke runs preserve the guide's `localhost` spelling. Raw receipt: [[sources/runs/2026/09/2026-09-08-hermes-live-hardening]].

Both final CLI smoke runs returned exactly `OK`, exited zero and sent a 4,096-token main limit to `http://localhost:11434/v1/chat/completions`, with auxiliary requests independently capped and timed. The diagnostic command explicitly selects the default profile and classic CLI; the ordinary fresh guide also selects that frontend by default. This does not qualify every alternative Hermes frontend. Their wire captures are in [[sources/runs/2026/09/2026-09-08-hermes-cli-hardening]].

The unchanged released server passed 24 live OpenAI protocol checks, including streamed and ordinary tool-result loops, parallel call identity with reversed results, reasoning separation, invalid histories and unsupported format rejection. A deliberately truncated required tool produced an inference error; its streamed form published neither an executable partial call nor a successful completion terminator. Raw requests and responses are in [[sources/runs/2026/09/2026-09-08-hermes-protocol-regression]]. No new inference-engine behavior was needed for these configuration fixes.

Both complete configuration suites passed again after final failure-assertion review, with the final gate and YAML hashes preserved. The owned test server was stopped and its port had no listener. Final verification: [[sources/runs/2026/09/2026-09-08-hermes-final-config-regression]].

#### Scope and remaining boundaries

A named provider protects this setup from collisions with the generic `custom` path; editing that named provider or explicitly configuring a fallback can still change routing. A wrong active profile can still select different settings; the diagnostic command uses `--profile default` to select the configured root. Neither the screenshot nor these reproductions identify which setting was present on another person's laptop.

The request override repairs the wire limit. It does not repair Hermes's separate internal reservation accounting. Keep compression enabled, allow room for input and follow the server's advertised maximum when adjusting limits. Tests of failed summary publication do not prove general memory quality or every long-conversation path. The server still rejects unsupported constrained JSON, and Hermes's successful plain-text title retry does not provide schema guarantees.

The first long-output fixture left tools enabled and triggered calculator calls. The guard refused them and the run was interrupted; it is retained as discarded fixture evidence in [[sources/runs/2026/09/2026-09-08-hermes-long-output-fixture-discarded]]. The replacement disables tools only for its length probe. Earlier protocol, vision and memory-capacity qualifications remain separate; their direct-agent output-limit checks are not evidence for the old guide's CLI configuration path.

#### Explicit proxy environments

A final source and pure-function check on both Hermes versions confirmed that an explicit HTTP proxy is selected for the local endpoint unless its hostname is excluded. Setting both NO_PROXY and no_proxy to include localhost and 127.0.0.1 selects a direct connection for both spellings. The guide now documents preserving existing exclusions and checking the profile .env, which can override the shell. This is an additional environment condition; it does not explain a log whose resolved endpoint already names OpenRouter. No proxy server or inference request was used in this check. Raw result: [[sources/runs/2026/09/2026-09-08-hermes-proxy-exclusions]].
