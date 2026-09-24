---
type: decision
id: 01m32ezrxzf9ttms168ntyvqx8
created: 2026-09-21T17:07:30.879963+00:00
updated: 2026-09-21T18:44:54.822426+00:00
summary: Promote qualified prompt reuse and read scopes; hold the fused-attention upgrade
decided_on: 2026-09-21
evidence: '[[records/measurements/prompt-speed-qualification-2026-09-21]]'
note: The later fused-attention reassessment corrects the interpretation of the cross-kernel token gate; the original run and the three other qualified paths are preserved.
reversible_if: A supported-profile regression, failed memory/correctness gate, or newly qualified attention/pass geometry changes the evidence.
title: Promote qualified prompt reuse and read scopes; hold the fused-attention upgrade
status: standing
---
Adopt the three locally qualified paths in [[records/measurements/prompt-speed-qualification-2026-09-21]]. Keep the existing MLX dependency until the proposed upgrade clears the full continuation gate.

The automatic read-scope cap is an operating bound in tokens, not a new context limit or a prediction of available memory. It rises to 8192 only for scheduled 256-row passes, where unchanged arithmetic and a clean paired timing gain were measured. Other eligible pass sizes retain 4096. At least four full passes are still required; checkpoints and odd tails keep their existing arithmetic. Larger scopes retain more temporary frontier/workspace state, so process-footprint estimates, live headroom and smaller candidate scopes remain mandatory. Explicit read-scope controls keep priority; `SLOTSTREAM_OPT_AUTO_READ_SCOPE=0` disables automatic grouping. Requalify the bound if a supported hardware profile regresses, memory estimates fail, or another pass geometry has its own numerical and paired timing proof. Do not infer universal speed from the current M5 Pro result.

A phase continuation is private live-state ownership inside one engine request sequence. It does not relax [[records/decisions/a-continued-conversation-computes-what-a-cold-one-computes]]. A later conversation must still match producing arithmetic and a fresh-equivalent boundary. Disk heads lacking pass-size provenance cannot satisfy this contract. The optional app tier uses the existing engine quota and expiry controls and is disposable; it is not canonical Home content. Thinking and incognito remain off disk, and transitions clear memory before any persistable encoding can consult private ids.

The fused candidate changes three final greedy tokens while passing its numerical spread bands. Do not relabel that as a numerical pass or as evidence of lower answer quality. Revisit when an exact candidate passes the existing gates, or when a separately approved quality/equivalence policy and its evaluation justify changing those gates. The upstream kernel and dispatch authors retain their attribution in the raw experiment record. These changes remain local and unreleased.


## Later reassessment on September 21

[[records/measurements/fused-attention-reassessment-2026-09-21]] and [[records/decisions/kernel-upgrade-fidelity-and-cache-equivalence]] correct the fused-attention interpretation above. The candidate still fails the original cross-kernel token-parity checks, but that does not establish inability to use it or lower answer quality. The ordinary rechunk control also changes a token; independent high-precision component comparisons favor the fused result; and the same fused backend passes the tested exact warm/cold continuation. The small semantic test contains the same arithmetic error under both backends. The original evidence remains preserved and the three other qualified paths remain adopted.
