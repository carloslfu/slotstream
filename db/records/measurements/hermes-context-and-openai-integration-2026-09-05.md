---
type: measurement
id: 01m1srcqkvyq3fd3z1k3wg093y
created: 2026-09-05T21:43:00.987629+00:00
updated: 2026-09-06T00:26:32.688542+00:00
summary: 'Hermes integration: context qualification and OpenAI agent protocol'
date: 2026-09-05
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '780'
runs: '[[sources/runs/2026/09/2026-09-05-hermes-final-integration-acceptance]]'
title: 'Hermes integration: context qualification and OpenAI agent protocol'
status: measured
---
The integration failure in [issue #11](https://github.com/carloslfu/slotstream/issues/11) has two independent causes: the released OpenAI endpoint rejects agent tool semantics before inference, and Hermes requires a context larger than the served default. The issue does not include the reporter's trace, versions, or configuration; these are independently reproduced failures, not a claim to have identified their exact first request.

#### Protocol and client findings

The OpenAI adapter now reuses the native tool schema, history, reasoning, image, and output parser. It validates call/result identity, restores assistant call order when results arrive out of order, and emits complete OpenAI calls with distinct IDs and stream indices. This reordering matters because the native template renders results positionally without call IDs. Required/named choices, incomplete calls, invalid history, and requested context inflation fail explicitly. Ordinary chat retains its prior template and sampler; tool turns use the existing agent sampler.

Discovery now reports the actual runtime window and the available vision capability. An image-enabled server previously returned only the completion capability, causing unmodified Hermes to report that vision was unsupported despite successful image inference. Hermes's reasoning-off flags and bounded `options.num_ctx` are accepted and enforced. The unsupported constrained-output rejection now triggers Hermes's plain title retry. Constrained JSON generation and strict tool-schema enforcement remain unsupported; argument validation and execution belong to the caller.

The local profile gives main responses and auxiliary summaries explicit output allowances (Hermes otherwise omits the auxiliary limit and inherits the small server default), keeps title and compression requests on the main local provider, and sets a bounded local stream watchdog. The qualified long prefill takes longer than Hermes's prior default watchdog, so transport keepalives alone do not justify leaving that client timeout unchanged. The guide uses speculative decoding off, matching the tested configuration. See `docs/HERMES.md` for the setup guide.

#### Context qualification and its counterexamples

| Run | Completed prompt + reply | Process peak | Expected peak | Result |
|---|---:|---:|---:|---|
| Released diagnostic, default-context plan | 65,520 + 1 | 9.35785704 GB RSS | 8.99949696 GB | Exceeds the estimate |
| Requested-context plan, retained state charged | 65,520 + 1 | 10.056142544 GB sampled footprint | 9.260163328 GB | Exceeds estimate and 10 GB target |
| State plus transient reservation | 65,520 + 1 | 9.735410056 GB sampled footprint | 9.742730496 GB | Fits estimate and 10 GB target |

The first check enlarged its diagnostic engine limit after constructing the ordinary plan. The second correctly charged retained state but missed transient process memory; lifetime RSS alone missed that peak. The final plan charges both retained growth and a conservative reserve throughout the explicitly larger supported range before selecting the pool and prefill batch. The ordinary 32,768-token default and its allocation budget remain unchanged. The explicit ceiling is 65,536, with minimum-pool and availability checks.

The successful run had no abort, inference error, pressure cancellation, or increase in system swap-outs. Its margin to the expected estimate was small; the requested total target still had headroom. This is one measured text-capacity and memory configuration, not a mathematical memory bound, a cross-hardware guarantee, long-context answer-quality evidence, or a throughput comparison. The diagnostic now also requires full prefill and a reply before reporting `fits`.

Raw evidence: [[sources/runs/2026/09/2026-09-05-hermes-context-first-counterexample]], [[sources/runs/2026/09/2026-09-05-hermes-planned-context-counterexample]], and [[sources/runs/2026/09/2026-09-05-hermes-context-qualified]]. The failed runs remain intact.

#### Final client acceptance

Hermes release `v2026.8.31` at `29112bef099274229cadff79cdff7bf7b99c4b77` and main snapshot `9dd6634c5635321cf38840cc30e9b51226689128` both passed real terminal fixture execution, follow-up recall, and the title fallback on final binary `800502693480a7187f81fab231f8516dccc56a7926894e7c0e8c2ce2480ed3f8`. Both report package version 0.21.0; the commits distinguish them. The actual released CLI returned `OK` and exited zero. All captured main tool-enabled requests used the documented 4,096-token output allowance, `reasoning_effort: none`, `think: false`, and bounded `options.num_ctx: 65536`. Discovery selected 65,536 tokens and a 52,224-token compression trigger.

The released agent also discovered vision and answered `Dog` for the fixture image. Its actual auxiliary compressor reduced the 39-message, 99,684-character fixture to 25 messages and 87,350 characters. The summary completed with `stop` after 999 output tokens, exceeding the ordinary 512-token server default and demonstrating why the separate auxiliary allowance matters. The diagnostic code existed only in the summarized middle; after compression it appeared only in the handoff at index 4. A subsequent actual agent turn read 18,367 prompt tokens and recovered the exact code. This is forced-compaction and recall evidence, not an automatic-threshold stress test or a general memory-quality score.

The combined final configuration was `--memory-gb 11 --max-context 65536 --vision on --mtp off` with 30.710185984 GB reclaimable before launch. Its larger explicit target exercises context plus the vision tower, which the smaller text-only qualification did not combine. This functional test does not extend the separate full-context text memory measurement to a full-window multimodal bound.

| Acceptance check | Exact candidate prefix | Result |
|---|---|---|
| Released Hermes agent, image, compaction/recall and actual CLI | `80050269` | Pass |
| Current Hermes agent, terminal tool, follow-up and title | `80050269` | Pass |
| OpenAI HTTP/SSE, parallel calls with reversed results, errors and image tools | `80050269` | 27 checks passed |
| Existing image serving across all dialects and history reuse | `39d236e8` | 25 checks passed |
| Existing ordinary API robustness suite | `666b59f8` | 74 checks passed |
| Native gateway tool/result loop and actual Ollama text CLI | `39d236e8` | Pass |
| Actual Ollama image CLI after capability correction | `80050269` | `Dog`, exit zero |
| Full T0/T1 catalogue | `39d236e8` | 42 groups, 21,945 assertions passed |
| Final T0 catalogue and static components | `80050269` | 31 groups, 20,087 assertions; static components pass |

The final candidate differs from `39d236e8` only in Server.swift's vision capability advertisement. The prior candidate adds tool-result ordering and its assertions to the memory-reserved `666b59f8` source. Exact source identities bridge these results without pretending all gates ran on the same binary. The ordinary context default, plain-chat template/sampler, native gateway, image paths, and installer/planner behavior retain their passing regression coverage. Static validation reports zero errors and the pre-existing unknown log-kind warning; it does not mask that warning.

The earlier real-client checks remain preserved, including the first compression fixture that grew instead of shrinking: [[sources/runs/2026/09/2026-09-05-hermes-openai-real-client-gates]]. Regression results and the vision-discovery counterexample are in [[sources/runs/2026/09/2026-09-05-hermes-adapter-regressions-and-vision-discovery]]. Final acceptance is in [[sources/runs/2026/09/2026-09-05-hermes-final-integration-acceptance]].

At qualification time the installed release was unchanged. The user subsequently requested installation; the normal local `slotstream` command now points to the exact verified Hermes binary and matching Metal library, with the previous install preserved for rollback. The installed runtime and context-planning checks passed; see [[sources/runs/2026/09/2026-09-05-hermes-local-install-verified]]. No issue reply or release has been published. A verified local binary, source archive, identity and complete client captures are retained under `.build/hermes-integration/`. This qualification applies to that frozen source closure; separate ongoing engine optimizations in the working tree are not silently included in these results.
