---
type: plan
meta-type: operational
id: 01m1hhwp20syxam7npjae9vznw
created: 2026-09-02T17:15:28.192468+00:00
updated: 2026-09-02T17:15:28.192468+00:00
summary: 11. Definition of Done — v0.1 (updated with 2026-08-28 results)
date: 2026-08-28
doc: plan
kind: done-criteria
level: '2'
order: '400'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 11. Definition of Done — v0.1 (updated with 2026-08-28 results)
---

- [x] Golden: tiny-cache ≡ big-cache greedy outputs, exact — **passed on the full
      model** (30 vs 181 experts/layer cached, identical text).
- [x] Parity vs Python reference: layers 0–1 (GDN, MoE-over-pool, PLE,
      hyper-connections, embeddings) **bit-exact**; QSA layer ≤2.4% RMS with the
      few-ulp vendored-kernel origin documented in MEASUREMENTS.md.
- [ ] This Mac: decode ≥ 20 tok/s warm chat — **was marked ✅ (20.01) and is now
      unconfirmed**: re-measured on 0.1.6 the curve reads 6.0 / 8.2 / 11.2 / 11.6
      tok/s at 30 / 60 / 120 / 150 experts per layer and is already flat by 120.
      Not a regression (0.1.5 and 0.1.6 A/B identical) and not under-warming
      (flat over 14 consecutive generations). The 181/layer config that produced
      20.01 peaks at 27.4 GB and has not fit in reclaimable memory since.
      · cold→first-token ≤ 15 s ✅
      (~12 s) · prefill ≥ 150 tok/s @8k **not yet** (needs the dense sweep; chunked
      prefill sized from the memory plan measures 92 tok/s, up from 40) · 30-min
      soak not yet run.
- [ ] `lite16` on a **real** 16 GB Mac (emulated already: 5.6 tok/s in 7.3 GB peak)
      — **deliberately deferred**, see §8.1.
- [ ] bench matrix ≥ 4 tiers; presets frozen — **deliberately deferred**, see §8.1.
- [~] Ollama surface: full curl-level battery passes (`Tools/api_test.sh`:
      version/tags/chat±stream/generate/v1±SSE/embed-reject); real GUI clients
      not yet exercised (sandbox intercepts local HTTP clients; nc transport used).
- [~] Clean-machine install: one-line curl installer + v0.1.0 release binary +
      consent-gated auto-pull shipped and tested end to end here; LaunchAgent
      not built, and no clean *machine* has run it yet.
- [x] Docs from measured numbers only (README/MEASUREMENTS).
