---
type: measurement
meta-type: fact
id: 01m315jjynmakz9n9jhra05zpb
created: 2026-09-21T05:03:47.157092+00:00
updated: 2026-09-21T05:03:47.157092+00:00
summary: 'Issue 21: confirmed serving bugs repaired, remaining crash and pressure reports unverified'
date: 2026-09-21
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Functional checks only; no clean timing claim or reproduction of the reported long-context pressure workload.
order: '1590'
runs: '[[sources/runs/2026/09/2026-09-21-issue21-regressions]]'
title: 'Issue 21: confirmed serving bugs repaired, remaining crash and pressure reports unverified'
status: measured
---
[Issue 21](https://github.com/carloslfu/slotstream/issues/21) combines confirmed server bugs, behavior already corrected after the reported release, deliberate compatibility limits, and failures that have not been reproduced. The confirmed streaming and conversation-splicing defects are repaired. This does not establish that every reported symptom is fixed.

## One-by-one disposition

| Reported problem | Finding and resulting behavior |
| --- | --- |
| Long tool arguments arrive only at completion | Confirmed. The parser retained and repeatedly searched a growing parameter buffer; Chat Completions ignored provisional events. Declared string arguments now stream escaped JSON fragments during generation. The parser searches a bounded suffix and keeps completed executable calls separate from provisional fragments. |
| Capped tool generation has no finish or usage | Confirmed. An incomplete call became an SSE error. Budget exhaustion now ends with `finish_reason: length`, requested usage and `[DONE]`, preserving partial arguments. Non-streaming follows the same contract. Partial JSON is not an executable completed call; undeclared tools and malformed completed output still fail. |
| Follow-up prompts miss saved states | Confirmed splicing defect. A retained descendant could include several assistant turns, but matching compared it all with the first assistant message. Matching now slices and validates one assistant turn at a time, splicing only that turn's native IDs. This repairs that cause, not every nearly-identical prompt. |
| Disk restore loses native history | Additional reproduced defect. Memory retained generated reasoning IDs; aligned disk checkpoints lacked the suffix after their numerical boundary. The intermediate restart reconstructed 1628 prompt tokens instead of 1654 and changed reasoning. Disk heads now optionally retain exact conversation IDs independently from numerical-state tokens. The repaired replay reconstructs 1654 prompt tokens and identical answer and reasoning, restoring 1536 numerical tokens. |
| Sparse progress and stale tail ETA | Confirmed observability limitation. Progress appears after a completed pass once five seconds have elapsed, including a slow short suffix. ETA uses the recent interval and says “at this rate.” A separate request heartbeat reports the checked phase while a pass is still running. Initial estimates remain estimates. |
| No reason given for cache misses | Added diagnostics for disabled/empty/evicted cache, prefix/model/image mismatch, incompatible pass boundaries, missing logits, fork failure and disk restore refusal. Hits report source and reused-token counts. |
| Omitted `max_tokens` defaults to 512 | Already corrected after 0.2.20. Current policy uses one quarter of context, capped at 8192; explicit budgets remain available. Contract checks cover this bounded default. Unlimited generation is not promised. |
| `store` and unknown optional fields rejected | `store: false` was already accepted after 0.2.20 and is now exercised by the live OpenAI gate. Persistence-requesting or unsupported semantics remain explicitly rejected. Arbitrary unknown fields are not silently ignored; the accepted surface is documented. |
| Plain streamed cap has no terminal event | Not reproduced in official 0.2.20 or the repaired build. Both capped plain and unused-tools text streamed content, length termination, usage and `[DONE]`. Regression fixtures preserve that behavior. |
| Ollama tools/tool-role rejected | Intentional adapter scope. Refusal now directs clients to `/v1/chat/completions`, with matching documentation. This work does not add Ollama tool calling. |
| Silent whole-process exits | Not reproduced. Existing SIGPIPE protections remain. A live TCP reset during output was followed by a successful request in the same server. Writer failures now identify socket, drain, cancellation or queue causes. A numeric-conversion trap reproduced in 0.2.20 was already fixed after that release; no evidence links it to the reported exits. |
| Busy pre-prefill stall after restore | Not reproduced with the available fixture. Added phase heartbeat and cancellation/deadline checks around encoding and between history-splicing steps. These improve diagnosis and cooperatively bound work; they do not prove the reported cause is fixed. |
| Long-context pressure slowdown | Not reproduced or performance-qualified here. Pressure eviction and exact-prefix/boundary requirements remain intentional. No pressure workload was induced or reporter-hardware run performed. |

## Preserved invariants

Conversation metadata never becomes a numerical resume boundary: only the original checkpoint tokens select restored state, and generated suffixes are reread under the existing fresh-equivalent pass rule. Metadata shares the head's disk quota, expiration, deletion and clear lifecycle. Legacy heads decode; invalid token metadata is refused. Atomic replacement preserves tensor bytes, using APFS cloning when available and a bounded copy otherwise. Requests prohibiting persistence write no conversation metadata.

Chat Completions emits one call identity with ordered fragments. Incomplete JSON is exposed only with length termination marking the incomplete response. Completed calls keep validation and typed coercion. Other protocol adapters retain completed-call behavior, and nonblocking socket output remains bounded.

## Evidence and limits

[[sources/runs/2026/09/2026-09-21-issue21-regressions]] preserves the official baseline, intermediate failed restart, final executable/source identities and raw evidence. The final build passed all 56 T0 checks (29468 assertions), a tensor-format round trip (94 assertions), all 24 OpenAI compatibility checks, live capped text/tool streaming, three-turn reasoning reuse, TCP-reset survival and identical disk-restart replay. A weights-free parser regression covers 16000 escaped Unicode fragments before closing the call; live fixtures use smaller explicit budgets to exercise termination.

These are functional checks at an 8.1 GB target with MTP and vision off on the development Mac, not a clean benchmark, the full release battery or the reporter's long-context workload. Exact source is archived because other tasks edited the shared checkout. The exact client and complete logs were offered but not attached to the issue at capture time. Silent exits, the busy stall and pressure-related tail throughput remain open pending reproducible or diagnostic evidence.
