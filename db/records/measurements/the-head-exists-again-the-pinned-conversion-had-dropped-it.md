---
type: measurement
id: 01m1hhwm5ja2q9xxnp22y4zpk1
created: 2026-09-02T17:15:26.258111+00:00
updated: 2026-09-02T17:15:26.258111+00:00
summary: The head exists again (the pinned conversion had dropped it)
date: 2026-09-01
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M9
order: '430'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: The head exists again (the pinned conversion had dropped it)
status: measured
---

The pinned community conversion strips all `mtp.*` tensors (`sanitize` drops
them), so the draft head was rebuilt from the official release without
downloading it: the 31 MTP tensors live in 28 of the official repo's 131
shards, and safetensors headers give exact byte ranges, so `Tools/mtp_convert.py`
range-requests precisely those tensors — **4.9 GB in 92 s** instead of ~250 GB —
then applies the same transforms the community conversion applied to the main
model and quantizes to the same recipe (4-bit, group 64, affine; router,
gates, `index_qk_proj`, and norms stay bf16). Output: `mtp.safetensors`,
**1.471 GB** (the design note estimated 2.25), sha256 in `mtp.provenance.json`.

Two conversion facts were verified rather than assumed:

- **The +1 norm centering is real and uniform.** For four main-model norms the
  official raw tensors were fetched and compared against the pinned converted
  ones: mixer hc_norm +2.7497 → +3.7498, attn hc_norm −0.2638 → +0.7362,
  indexer q_layernorm −0.0372 → +0.9628, q_norm +0.2833 → +1.2833 — exactly
  +1.0 each. The MTP-only `pre_fc_norm_*` weights (no main-model analog, not
  in the reference's CENTERED list) follow the same convention: vLLM builds
  them as GemmaRMSNorm (the 1+w form), and the raw embedding norm sits in a
  tight band around −0.764 — sensible as 1+w ≈ +0.24, pathological as a bare
  negative scale.
- **The forward semantics come from the only public implementation.** vLLM's
  `Qwen4ExpMultiTokenPredictor` ("scheme A"): fc_embedding on the normed token
  embedding, a SHARED fc_hidden on each of the four normed hyper-connection
  branches of the PRE-final-mixer multi stream, embedding added to every
  branch, one full-attention decoder layer, the head's own mixer for the
  lm_head path — and the pre-mixer stream, not the collapsed one, feeds the
  next chained draft step.
