---
type: design
meta-type: conclusion
id: 01m1hhwnyd08gxkch7n80ny5jv
created: 2026-09-02T17:15:28.077770+00:00
updated: 2026-09-02T17:15:28.077770+00:00
summary: 'M9 design note — MTP self-speculative decode: when it pays, and when experts win'
date: 2026-08-29
doc: plan
level: '3'
order: '350'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 'M9 design note — MTP self-speculative decode: when it pays, and when experts win'
---

Not built in v0, and the pinned community conversion drops the MTP tensors
(`sanitize` removes them; the measured 103.8 GB inventory has none), so the block
must first be converted and quantized from Qwen's official release. This note
records the first-principles analysis of *whether* to spend memory on it, because
the answer is strongly tier-dependent and the earlier plan text had it backwards.

**Two walls, and memory decides which one you are against.**

- **Small cache → fetch-bound.** Most tokens miss; decode waits on SSD reads
  layer by layer. Compute idles.
- **Large cache → launch-bound.** Nearly everything hits; decode is limited by
  kernel-launch count, not bytes (MEASUREMENTS §M0.6: batch-1 4-bit matmul reaches 20% of
  memory bandwidth; measured decode is flat above ~181 experts/layer).

Extra experts attack the fetch wall. MTP attacks the launch wall: verifying k
drafted tokens costs roughly the launches of one. So MTP's ~1.4–1.6× is a
*constant multiplier that only applies in the launch-bound regime*, while the
value of the ~17 experts/layer its 2.25 GB displaces follows the measured
decode curve (≈ experts^0.7 between the 30/layer = 5.6 and 181/layer = 20.0
anchors, flat above).

*[Measured 2026-09-02, and false as stated: with every expert resident a
five-token verify pass costs 1.65 single passes, not one (`mtp-passcost`), so
the fetch-free ceiling is ×1.4 at depth 4 and ×1.5 at depth 2 rather than a
multiplier on top of a free verify. The M9 addendum below has the ladder.]*

**Why tight memory keeps the experts** — three compounding reasons, not one:

1. **It sells cache at its highest price.** Those 17 experts/layer are worth
   ≈ +40% near the floor, ≈ +12% at 100/layer, and 0% past the plateau.
2. **It spends the scarce resource on discarded work.** Every rejected draft
   (30–40% at plausible accept rates) still fetched that token's experts from
   SSD. Wasted verification is nearly free when compute-bound and maximally
   expensive when fetch-bound.
3. **Its one genuine small-tier upside is already harvested.** Batching two
   tokens' expert fetches works because consecutive tokens reuse experts — which
   is exactly the locality the cache already exploits, and which the MTP tax
   shrinks the cache's ability to hold.

Real small Macs also have slower SSDs than this dev machine, which deepens the
fetch wall and widens the verdict.

**Enable policy (to be confirmed by measurement, not shipped on this reasoning
alone):** auto turns MTP on only when the target still affords ~120+ experts per
layer *after* paying its 2.25 GB — roughly targets above ~22 GB, so 32 GB
machines always, 24 GB when quiet, 48 GB unconditionally (there the displaced
experts are past the plateau and worth nothing, making MTP close to free). At
16 GB and at the floor, MTP stays off. **Governor ordering: shed MTP before
shrinking the pool** — dropping a constant-multiplier feature always beats
starving the cache below its knee.

**Correctness:** with exact-match acceptance under greedy sampling, speculative
decode is byte-identical to plain greedy, so MTP on/off (including a live
governor toggle) falls under the existing golden-equivalence invariant (§6.1)
and `elastic-check`-style gating rather than needing a new correctness story.

**Measure before freezing any threshold:** (a) this model's real accept rate on
representative text — nobody has published one; (b) whether draft-batched expert
fetches actually raise queue depth enough to matter on fetch-bound tiers; (c)
the true resident cost of the converted 4-bit MTP block (2.25 GB is an estimate).
