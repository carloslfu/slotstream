---
type: measurement
id: 01m1t5edyhtkshayqdcbx6php4
created: 2026-09-06T01:31:08.113169+00:00
updated: 2026-09-09T03:17:50.112692+00:00
summary: 'Hermes integration: context qualification and OpenAI agent protocol'
date: 2026-09-05
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: The direct-agent output-budget checks did not prove the old guide CLI configuration. See [[records/measurements/hermes-configuration-hardening-2026-09-08]] for the correction; other protocol, memory and vision results retain their recorded scope.
order: '780'
runs: '[[sources/runs/2026/09/2026-09-05-hermes-release-published-install]]'
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

At qualification time the installed release was unchanged. The user subsequently requested installation; the normal local `slotstream` command was first switched to the exact verified local Hermes binary and matching Metal library, with the previous install preserved for rollback. The installed runtime and context-planning checks passed; see [[sources/runs/2026/09/2026-09-05-hermes-local-install-verified]]. At that point no issue reply or release had been published. The first verified local binary, source archive, identity and complete client captures are retained under `.build/hermes-integration/`. This qualification applies to that frozen source closure; separate ongoing engine optimizations in the working tree are not silently included in these results.

#### Clean release candidate, 0.2.8

The release candidate starts from public main `770dba6` and includes the Hermes adapter, its context-budget support, and the connection documentation. Concurrent engine experiments are excluded. The default context and neural implementation remain unchanged. Elastic replanning retains the selected larger window, and undersized explicit or automatic targets are rejected before allocation. The full-context diagnostic samples physical footprint and requires complete prefill plus a reply.

On this clean candidate, 65,520 prompt tokens plus one reply completed at the 10 GB text-only target, using 256-token prefill passes. The sampled physical peak was 9.651146928 GB against the 9.742730496 GB plan; RSS alone was 8.472694984 GB. Prefill took 1,323.152083992958 seconds. No abort or additional system swap-out occurred. This independently qualifies the release's bounded text capacity and memory configuration; it does not extend the result to full-window images, other hardware, or answer quality.

The final local fast gates pass: 24 optimized catalogue groups with 637 assertions, 64 planner checks, installer/static gates, 16 sampler/governor gates, and an external Swift package consumer. All existing coverage floors are preserved; the HTTP server's measured coverage rises from 10.51% to 12.91%, with separate floors for the new adapter files. The clean brain and generated projections pass, including 78 registered claim checks. The completed real-client release matrix follows below.

Raw outputs, source hashes, and the small validator-test visibility bridge between the context and final local binaries are preserved in [[sources/runs/2026/09/2026-09-05-hermes-release-context-and-gates]].

#### Clean release client acceptance

The clean release candidate passed the complete real-client matrix and [public CI run 34005877377](https://github.com/carloslfu/slotstream/actions/runs/34005877377) at commit `2a69ac0be4148a6f351cc18159c8dbff49ba3f7e`. Both the released Hermes agent and the recorded main snapshot executed the actual terminal fixture and recalled its code on a follow-up; the released CLI returned `OK`. Vision discovery, the image answer, and the title fallback passed.

The released Hermes compressor reduced the same forced fixture from 39 to 25 messages and from 99,684 to 87,082 characters. Its local auxiliary request had a 4,096-token allowance and completed with `stop` after 859 output tokens. The exact diagnostic code occurred only in the handoff at index 4, and the subsequent actual agent turn recovered it from an 18,243-token prompt. This remains a forced-compaction test rather than an automatic-threshold stress test.

The release server also passed 27 OpenAI wire checks, all 19 existing image-serving checks in the clean public source, the native gateway's real tool/result round trip, and the actual Ollama image CLI. The final local binary passed all 74 ordinary API robustness checks. The larger historical counts above include other source in the earlier frozen workspace and are not substituted for this release's results. Complete clean-source checks and their identities are preserved in [[sources/runs/2026/09/2026-09-05-hermes-release-client-acceptance]].

All owned test servers were stopped. The clean brain has zero validation errors and warnings. CI passed its build, static gates, sampler/governor checks, optimized catalogue, external Swift consumer, and coverage ratchet. This acceptance qualified the unchanged tested implementation for release; the published CI asset and installation verification follow below.

#### Published release and verified installation

[Slotstream v0.2.8](https://github.com/carloslfu/slotstream/releases/tag/v0.2.8) is public. [Release workflow 34006921406](https://github.com/carloslfu/slotstream/actions/runs/34006921406) built and attested it from tag commit `f05b15dfa4d109ae32b882688ce615c3454cffe1`. The only changes after the full code CI commit are documentation and engineering evidence, and that tag's documentation CI also passed.

The downloaded archive's SHA-256 is `d1266daed642951cbfba22f75c1bcd7b321c5356738c14a0858d15f2ec4da817`. Checksum and signed-provenance verification passed, including the workflow, tag, source commit, and artifact digest. The public installer activated binary `3ccf3e9e8b5989e3f4bb85e3ba5ec51c48e9dba7fea68c2e7811bcc27a2316c8` and the matching pinned Metal library. The normal `slotstream` command returns `0.2.8` outside the repository, and the previous local Hermes installation remains intact for rollback.

The exact installed CI binary passed runtime checks and context/vision planning, then served the actual released Hermes client. Terminal fixture execution, follow-up recall, title fallback, vision discovery, the `Dog` image answer, and the actual CLI's `OK` response all passed. The bounded server used `--memory-gb 11 --max-context 65536 --vision on --mtp off` after measuring 36.269719552 GB reclaimable and waiting for the shared model/build lock. Its test server was stopped afterward. Full-window memory, forced compaction, and the broader wire matrix remain the separate qualification results above; this additional run verifies the published artifact and installation.

Publication, installer, provenance, runtime, and installed-client outputs are preserved in [[sources/runs/2026/09/2026-09-05-hermes-release-published-install]]. The source, raw synthetic captures and downloaded CI package are also retained locally under `.build/hermes-release-v0.2.8/`. The release was published from an isolated worktree while concurrent engine experiments were preserved in the canonical development workspace. The issue remains open, and no reply was posted.
