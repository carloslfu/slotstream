---
type: measurement
id: 01m32ezrxcceqddh3j74w9b7q3
created: 2026-09-21T17:07:30.860317+00:00
updated: 2026-09-21T21:36:23.489231+00:00
summary: 'Prompt speed: three qualified changes and one rejected attention upgrade'
date: 2026-09-21
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Later production integration is recorded in [[records/measurements/fused-prefill-integration-2026-09-21]]; original measurements and failed cross-backend comparisons are preserved.
order: '1610'
runs: '[[sources/runs/2026/09/2026-09-21-prompt-speed-fresh-scope-discarded]], [[sources/runs/2026/09/2026-09-21-prompt-speed-loaded-scope]], [[sources/runs/2026/09/2026-09-21-prompt-speed-engine-and-fused]], [[sources/runs/2026/09/2026-09-21-prompt-speed-app-qualification]]'
title: 'Prompt speed: three qualified changes and one rejected attention upgrade'
status: measured
---
Three improvements are implemented locally: larger guarded expert-read scopes, exact prefix-checkpoint/restart reuse, and one live thinking-to-answer session. The newer fused-attention candidate remains disabled. No release or cross-hardware speed guarantee is implied.

## Why these changes help

A prompt has several costs: loading and encoding, fetching experts, dense/GDN work, attention, and optional cache I/O. Sharing an expert read across more existing compute passes reduces repeated SSD traffic. Once a scope already touches most experts, doubling its tokens need not double its expert bytes. Reusing an exact prefix removes work already performed. Continuing a live generation phase removes a second read of the thought without pretending generated state equals a fresh prefill on a later turn. Fused attention targets a different cost, avoiding intermediate score traffic, but its altered accumulation can change floating-point results and selected tokens.

## Results

| Opportunity | Implemented behavior | Evidence and limit |
| --- | --- | --- |
| Larger expert-read scopes | Automatic scheduling may share up to 8192 tokens when the scheduled compute pass is 256 rows; other eligible pass sizes retain 4096. Every original compute pass, checkpoint boundary, memory check and smaller-scope fallback remains. | 817 numerical checks pass. Three eligible loaded-engine pairs give median throughput ratio 1.179187, about 15.2% less prefill time on the 8195-token fixture. Expert bytes fall from 104581324800 to 58511462400. The guarded automatic path also runs under 10 GB. |
| Prefix/checkpoint and restart reuse | Read scopes end at the checkpoint actually selected, rather than an obsolete fixed checkpoint. Disk heads record producing pass size; mismatched or unknown arithmetic is refused. The app attaches a per-Home disposable cache for eligible ordinary conversations. | Core 2051-token follow-up reads 259 after reusing 1792, with bit-exact cold logits. Disk reopen, changed-pass refusal and matching-pass restore pass. App restart reuses 2048 and reads 168 instead of 2216, with the same answer. |
| Thinking then answering | `Engine.generatePhased` owns both samplers under one gate and transfers live state. It consumes any pending token once and reads the transition suffix. Generated rows remain ineligible for cold-equivalent later-turn reuse. | Plain and MTP checks pass 19 assertions each. Plain transition logits match an independent reconstruction bit for bit. Real app forced closure, Answer now, natural completion, plain follow-up and metric equality pass. |
| New fused attention | MLX 0.31.1 remains pinned. The isolated MLX 0.32.2 integration is not promoted. | 807 of 810 numerical checks pass, but three continuation/rollback final-token comparisons fail. This is failure of the project's equivalence gate, not proof of worse answer quality. Component speed or a non-interleaved full-model time cannot override it. |

## Privacy, memory and compatibility

Ordinary app caches live in the owning Home's `.sevra/prefix-cache`, inherit the engine's existing quota/age policy, and are excluded from backups. Thinking, historical thinking conversations and incognito do not attach the disk tier. Home/privacy transitions clear held state before encoding; a direct thinking call detaches the tier too. Unavailable disk acceleration falls back to ordinary inference. The real app cache/phase sequence peaks at 8.081 GB under its 10 GB setting and preserves cache-file hashes through private requests.

Legacy generation signatures remain available. The new phase API preserves request context/headroom policy, cancellation and independent output budgets. The legacy explicit cache mode retains its original shared-prefix behavior; aligned production reuse remains stricter. Full shared-prefix regression passes 745 checks, all 56 T0 groups and all 15 component groups pass, and the full native app and static scripts pass. Parity golden bytes remain unchanged.

## Timing boundaries and reproducibility

The first fresh-process scope experiment has no eligible paired rounds and is discarded for timing. The separate loaded-engine experiment has three eligible pairs; rounds 0 and 4 are discarded. All raw results remain available, including intermediate diagnostic, compatibility and compilation failures. Checkpoint/app timings are single functional observations, not additional percentage-speed claims. The measured scope gain applies to this M5 Pro, fixture and bounded loaded configuration. Cold start, other Mac generations, larger compute-pass scopes and universal end-to-end latency remain unmeasured.

Evidence: [[sources/runs/2026/09/2026-09-21-prompt-speed-fresh-scope-discarded]], [[sources/runs/2026/09/2026-09-21-prompt-speed-loaded-scope]], [[sources/runs/2026/09/2026-09-21-prompt-speed-engine-and-fused]], [[sources/runs/2026/09/2026-09-21-prompt-speed-app-qualification]]. Operating decision: [[records/decisions/prompt-speed-qualified-paths]].


## Later reassessment on September 21

[[records/measurements/fused-attention-reassessment-2026-09-21]] and [[records/decisions/kernel-upgrade-fidelity-and-cache-equivalence]] correct the fused-attention interpretation above. The candidate still fails the original cross-kernel token-parity checks, but that does not establish inability to use it or lower answer quality. The ordinary rechunk control also changes a token; independent high-precision component comparisons favor the fused result; and the same fused backend passes the tested exact warm/cold continuation. The small semantic test contains the same arithmetic error under both backends. The original evidence remains preserved and the three other qualified paths remain adopted.
