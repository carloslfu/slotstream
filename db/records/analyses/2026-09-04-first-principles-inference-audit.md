---
type: performance-audit
meta-type: conclusion
id: 01m1qatepfcn7pe18z62c6qtan
created: 2026-09-04T23:07:21.679795+00:00
updated: 2026-09-04T23:07:21.679795+00:00
summary: 'First-principles inference audit: confirmed state retention, attention dispatch gaps, and a prioritized optimization program'
date: 2026-09-04
git_head: b88fdb2cf1f4070c838bccac59911ad2625d25bb
title: First-principles inference audit
status: analysis
---
# First-principles inference audit — 2026-09-04

Slotstream has substantial optimization headroom. The first changes should address retained prefill buffers, unnecessary expert passes, and repeated history transformations. The largest architectural opportunity is to reuse each expert across more prompt tokens before evicting it. The largest kernel opportunity is attention specialized for the model's actual head dimensions and selected blocks. Decode needs a separate program focused on the CPU/GPU/I/O critical path; faster SSD reads alone will not remove its remaining serial work.

This is an implementation audit, not a summary of the project's design or measurement documents. It uses the Swift implementation, vendored Metal/C++ backend, checkpoint configuration and tensor headers, reference **code**, and fresh diagnostic experiments. Existing performance claims were not used as evidence. No production inference source was changed.

## Scope, versions, and evidence

Audited source: commit `b88fdb2cf1f4070c838bccac59911ad2625d25bb`. All 49 Swift source hashes stayed unchanged during the audit. The workspace already contained unrelated pending work; it was preserved. Swift uses the checked-out mlx-swift 0.31.6 tree at `0bb916c67f4b9e5c682cbe02a42c701c93ab5021`; small Python probes used MLX 0.31.1. Python results are diagnostic support, not proof that every Swift dispatch has identical performance. Native allocation probes compiled the actual production Swift sources against the existing release dependencies into a separate executable.

Four passes were made: execution/dataflow; byte and operation arithmetic; actual backend dispatch and ownership; and adversarial checks against proposed optimizations. Coverage includes model construction, weights, expert reads/cache/sweep, hyper-connections, GDN, sparse attention/indexer/RoPE, n-grams/PLE, MTP, sampling, generation, prefix state, memory planning/governor, vision, and serving. Download/startup and diagnostics received targeted inspection. This is not an exhaustive proof of all server behavior or all numerical edge cases, and it is not a full hardware profiler capture.

Raw evidence and reproducer source:

- [[sources/runs/2026/09/2026-09-04-first-principles-static-audit]] — source identities, checkpoint headers, byte/FLOP arithmetic, schedules, limited compression sample.
- [[sources/runs/2026/09/2026-09-04-first-principles-primitive-diagnostics]] — allocation semantics, attention variants, router promotion. Timing comparisons discarded because another model process was present.
- [[sources/runs/2026/09/2026-09-04-first-principles-native-retention]] — real-model allocation intervention at 1,024 and 2,048 tokens, with identical final logits. Wall times are not controlled benchmark results.

The machine was an M5 Pro with 48 GiB unified memory. Full-model probes waited until the other model process had exited, checked reclaimable memory, used a fixed 640-slot pool and a 512 MiB MLX cache, and ran one process at a time. No large-pool stress test, context-limit increase, production rewrite, or release was performed.

## 1. The actual computation and its lower bounds

The checkpoint and implementation agree on width 2,560, 48 layers, 512 routed experts per layer, top-10 routing, and expert intermediate width 640. Each layer acts on four residual streams through learned hyper-connections. Thirty-six layers use gated DeltaNet recurrence; twelve use sparse attention with 24 query heads, two KV heads, and head width 256. One PLE insertion obtains hashed n-gram embeddings from disk. The image tower and MTP draft head are additional paths.

The key execution order is:

```text
prompt chunk
  embedding / optional image feature splice
  for each of 48 layers
    optional PLE
    hyper-connection -> GDN or QSA -> residual injection
    hyper-connection -> router -> CPU expert IDs
      cache lookup / SSD read / staging
      expert gate-up-down + shared expert -> weighted residual injection
    eval(hidden), releasing pool references
  final mixer -> final-position vocabulary logits
next prompt chunk, or sampled-token decode
```

### Checkpoint bytes are not bytes read per token

Header-derived tensor payloads, decimal GB:

| Component | Exact bytes | Operational role |
|---|---:|---|
| Routed expert bank | 67,947,724,800 | Streamed/cached |
| N-gram tables | 32,000,153,600 | Tiny indexed rows, not a full scan |
| Resident text tensors | 2,924,005,400 | Embedding, projections, routers, norms, final head |
| Vision tower | 897,862,112 | Image requests |
| Total of these shard payloads | 103,769,745,912 | Excludes headers and separate optional MTP file |

One expert consists of three matrices with 4-bit weights and, per group of 64 parameters, a BF16 scale and BF16 affine bias:

`R = 3 × 2560 × 640 × (0.5 + 4/64) = 2,764,800 bytes`.

Thus the effective representation costs **4.5 bits per parameter**, not exactly four. It is nine pieces: three 819,200-byte packed matrices and six 51,200-byte metadata arrays. A token uses 480 expert records across 48 layers:

`active expert bytes = 48 × 10 × R = 1,327,104,000 bytes`.

That is the routed weight volume the token uses; only misses require storage reads. It is emphatically not a 104 GB read per token. If `h` is the request's routed-record hit fraction and `Bssd` is effective storage throughput in GB/s, a necessary bandwidth bound is:

`tSSD ≥ 1.327104 × (1 − h) / Bssd seconds/token`.

This excludes small-read latency, repeated layer synchronization, n-grams, resident projections, recurrence, attention, sampling, and staging. Real elapsed time is bounded by resource bandwidths **and the causal critical path**. Adding all independently timed phases double-counts overlap; using the SSD bound alone overstates possible tokens/s. Effective throughput must be measured under the actual record sizes and queueing pattern, not borrowed from an advertised SSD number.

The active linear algebra totals about **13.337 GFLOP per decoded token**, including routed experts, shared experts, text projections, hyper-connections, routers, and vocabulary projection. This counts multiply-add as two operations and excludes recurrence, attention, normalization, nonlinearities, and dequantization. It does not count the entire embedding table as a matrix multiplication: embedding is a lookup. Routed expert linear work is 4.719 GFLOP; the remaining linear work is substantial. That rules out treating the runtime as only an expert-streaming problem.

For single-token expert matvecs, arithmetic intensity is approximately `2 / 0.5625 = 3.56 FLOP/byte` before activation and dequantization overhead. Prefill can improve this dramatically by reusing weights over many routed rows. This is why decode and prefill require different optimization strategies.

Other useful scales:

- GDN persistent FP32 state: `36 × 48 × 128 × 128 × 4 = 113,246,208 bytes` per conversation.
- Text KV plus raw indexer storage: `27,648 bytes/token`, before allocation rounding and MTP.
- A full 32,768-token four-stream BF16 hidden buffer: `32768 × 4 × 2560 × 2 = 671,088,640 bytes`.
- Router BF16 tensors: 125,829,120 bytes total. The n-gram table is enormous on disk but requests only 1,600 useful packed bytes per new token.

## 2. Confirmed prefill memory waste: state views retain whole chunks

**Priority: first implementation experiment. Confidence: source, backend, synthetic, and actual-model evidence.**

[Layers.swift](../../../Sources/Slotstream/Layers.swift) at lines 483–485 concatenates previous convolution state with the whole new chunk, then retains its last three rows as `convState`. A slice is a view of the original MLX allocation. Evaluating that slice does not make it own only those rows. The same pattern appears in PLE at lines 840–842. `MTP.consume` also retains the last multi-stream row via a slice; its comment that `eval(last)` detaches it is not supported by the backend.

The backend's `backend/common/slicing.cpp` shares the parent allocation. Its `backend/gpu/primitives.cpp` implementation of `contiguous` explicitly copies an otherwise contiguous view when its backing allocation is appreciably larger than its logical size. The distinction is ownership, not just strides.

Across the 36 GDN layers, extra retained backing storage scales as:

`36 × chunkTokens × 10240 × 2 = 737,280 × chunkTokens bytes`.

PLE adds another `20,480 × chunkTokens` bytes. Combined theoretical excess is about 0.776 GB at 1,024 tokens, 1.552 GB at 2,048, and 3.104 GB at 4,096. The 4,096 figure is a shape derivation, not a full-model measurement. The logical GDN convolution windows together need only 2,211,840 bytes.

A synthetic 36-layer allocation probe held 757,334,016 active bytes for ordinary slices, versus 2,359,296 after compact copies, with the same logical 2,211,840 bytes. `eval(slice)` alone did not fix it.

The native intervention compacted convolution and PLE state after each production layer finished evaluating. All final 248,320 logits were byte-identical between baseline and intervention for both tested prompts:

| Prompt | Baseline retained active bytes | Compacted retained active bytes | Difference | Baseline / compact MLX peak |
|---|---:|---:|---:|---:|
| 1,024 tokens | 5,731,682,458 | 4,955,703,450 | 775,979,008 | 6.309 / 5.910 GB |
| 2,048 tokens | 6,642,796,698 | 5,090,904,218 | 1,551,892,480 | 7.732 / 6.222 GB |

These are MLX allocator observations. The existing reported process peak remained around 6.0–6.1 GB, so do not advertise the allocation delta as measured process-RSS savings. `ProcessMemory.peakResidentBytes()` combines `ru_maxrss` with **current** physical footprint; it does not independently track the maximum physical footprint throughout a request. A follow-up should sample footprint over time as well as allocator state. Native runs were sequential, not interleaved paired performance trials, and contained background VM activity. Their wall-time differences are not a speedup claim.

The buffers normally stop being retained when a later forward replaces the corresponding states. This is chiefly a prefill peak/lifetime problem, not proof of permanently growing decode memory.

Implementation should compact at the point the parent is no longer needed, preserve exact state values, cover both ordinary and speculative state lifetimes, and explicitly materialize MTP's retained final row. Then measure real footprint and safely trade the recovered capacity for a larger prompt pass or more expert slots. Do not reduce the planner's 1.30 MB/chunk-token allowance by arithmetic alone; other transients remain.

## 3. One avoidable expert sweep near an 8k prompt

**Priority: early. Confidence: exact scheduler arithmetic; latency unmeasured.**

[Context.swift](../../../Sources/Slotstream/Context.swift) lines 54–58 tests a candidate pass against `c × (position + c) ≤ 4096 × 8016`. [Generate.swift](../../../Sources/Slotstream/Generate.swift) line 351 truncates that candidate to the remaining prompt **after** the test.

With a 4,096 maximum and 7,960 tokens remaining from an empty state, current passes are `[4096, 2048, 1816]`. Testing the actual final remainder permits `[4096, 3864]`: `3864 × 7960 = 30,757,440`, below the existing 32,833,536 limit. At 8,016 tokens, `[4096, 3920]` also fits instead of three passes.

This removes one of three model passes without increasing that query-key product limit. It does **not** prove a one-third latency reduction: expert overlap, routing, and compute depend on the pass shape. Implement one shared scheduling function for generation, reporting, and estimation. Test partial tails, nonzero reused prefixes, and the context boundary. Preserve memory bounds and numerical rechunking tolerance; a different batching shape can change floating-point reductions.

## 4. The larger prefill redesign: reuse expert weights across the prompt

**Priority: highest architectural potential; prototype after the preceding memory fixes.**

Currently the outer loop is prompt chunks, and every chunk traverses all layers. Long chunks route many experts, so every extra pass rereads a large subset of the same bank. The current 32,768-token/4,096-cap schedule contains 25 passes. If every pass needed every expert from disk, that would be about 1.699 TB of routed tensor reads. This is a deliberately loose upper scenario, not a measured traffic number.

For intuition only, independent uniform top-10 routing would visit `512 × [1 − (1 − 10/512)^S]` distinct experts per layer after S tokens, nearly all by 256. Actual routing is far from necessarily uniform. The fresh deterministic-ID native probes fetched 11,579 records at 1,024 tokens and 12,927 at 2,048, only about 47% and 53% of the 24,576-record bank. Any useful model of savings must use captured routing, not assume saturation.

The proposed execution order is layer-major prefill over a whole prompt or large superchunk:

```text
for each layer
  compute attention/GDN over bounded causal microblocks
  retain the resulting layer input stream for the prompt/superchunk
  route its rows and group by expert
  stage each needed expert once and process all its assigned rows
  write the next hidden stream
```

Causality permits this: all positions at layer L depend on the previous layer and on their causal state within L, not on higher layers. Two 32k four-stream hidden buffers would cost about 1.342 GB. That makes exchanging repeated tens-of-GB expert scans for extra hidden buffers a serious opportunity.

It is **not** equivalent to increasing the existing chunk to 32k. The redesign must keep attention, indexer, GDN, expert outputs, and routing work bounded independently. Use tiled attention, compact recurrent windows, streaming expert output placement, and a memory plan that includes both hidden buffers, context states, and staging. Process GDN sequentially in small blocks initially; do not combine two large rewrites in the first proof.

A decisive prototype compares measured record bytes and time at fixed total footprint on 8k and 32k prompts. Keep identical routing where arithmetic is unchanged; where batching changes reductions, apply the established numerical and task-quality gates. If I/O falls but elapsed time does not, inspect GDN and attention before expanding the rewrite. The scan-count ratio is not a promised speed multiplier.

## 5. Sparse attention is not uniformly on a fast sparse kernel

**Priority: highest custom-kernel candidate. Confidence: actual backend dispatch.**

The pinned Metal backend supports vector attention at head widths 64/96/128/256 only when query length is at most eight **and** `queryLength × GQA-factor ≤ 32`. Full fused prefill supports widths 64/80/128 and query length above eight. See `backend/metal/scaled_dot_product_attention.cpp`, lines 588–634.

For this model, GQA-factor is `24/2 = 12` and head width is 256:

| Query positions | Actual dispatch eligibility |
|---|---|
| 1 or 2 | Fused vector path |
| 3–8 | Fails the GQA product condition |
| Above 8 | Fails the full-kernel head-width condition |

Therefore ordinary prefill and a depth-two MTP verification batch of three positions use the fallback. The fallback in `fast.cpp` computes QK, applies the mask, softmaxes, then multiplies V. Sparse masks constrain the answer but do not avoid the dense prefill score computation. Query blocking bounds memory; it does not change that fact.

At 4,096 queries against 8,016 keys, one BF16 score matrix across 24 heads is about 1.576 GB. At 32,768 keys it would be 6.442 GB before other transients, which explains why simply lifting the scheduling bound is unsafe.

The useful kernel consumes **selected block IDs** directly, tiles over those keys, and maintains an online softmax. The indexer selects up to 512 complete four-token blocks plus the current incomplete tail, rather than arbitrary dense attention over the whole history. Preserve causal visibility, early contexts with fewer eligible blocks, empty/invalid selections, GQA mapping, partial RoPE, scaling, and the output gate. Online softmax changes reduction order; mathematical equality is not byte equality.

The indexer should generate selections per query tile and avoid constructing a full `[S,T]` boolean mask. Fixing only the final attention primitive leaves indexer score/mask allocation growing with the pass-context product.

### A rejected shortcut: decode is not secretly doing all dense key arithmetic

The vector kernel in `backend/metal/kernels/sdpa_vector.h` checks `use_key` before loading K/V and doing dot products. Single-token sparse decode still scans the mask/history index domain, but already skips masked key arithmetic. Gathering selected K/V into a temporary is consequently not an automatic large speedup; it adds copies and changes reduction topology. Synthetic gathering did not provide a sound basis for prioritizing it. A direct selected-block vector kernel can remove scans and mask construction, but its remaining opportunity must be measured honestly.

For MTP, splitting three or more query rows into chunks of two restores vector eligibility without changing selected keys. Synthetic outputs differed by roughly 0.8–1% relative to the reference output's maximum magnitude. Extra temporary storage and launches remain. This is an experiment, not a ready-to-ship equivalence claim.

## 6. Stop rebuilding immutable indexer history

**Priority: early, especially for long-context decode.**

[Layers.swift](../../../Sources/Slotstream/Layers.swift) lines 207–213 re-pools every completed four-token raw-key block, normalizes it, constructs all block positions, and applies RoPE on every forward. Completed blocks never change unless state is rolled back.

Cache the completed pooled/normalized/rotated block keys and append one block for each four newly completed tokens. Keep a raw partial tail. Preserve the exact FP32 mean, BF16 cast, normalization, and positional rounding sequence. Scoring against all completed blocks remains linear in context; this removes repeated preprocessing, not the indexer's entire asymptotic cost.

Rollback, partial prefill chunks, prefix snapshots, and MTP need explicit cache offsets. A trim crossing a block boundary must restore the corresponding raw tail. Do not reuse one layer's normalized keys in another layer; their parameters differ. Position/angle tables can be shared where parameters match.

Below the 2,048-token indexer budget, the combined query/key projection still builds the query portion although selection is unnecessary. A K-only path can build future history more cheaply, but splitting a quantized projection needs parity checks. Shared RoPE tables and fused partial rotations are additional small opportunities; preserve the current BF16 rounding points.

## 7. Decode's serial critical path and repeated promotion

**Priority: profile next; several high-confidence sources of repeated work.**

Every layer copies router IDs to the CPU with `asArray` at [Layers.swift](../../../Sources/Slotstream/Layers.swift):569. Cache misses are then resolved before routed GEMMs are launched. [Model.swift](../../../Sources/Slotstream/Model.swift):205 evaluates the layer to release pool references before the next layer's slot writes. These barriers serve real ownership constraints, but even an all-hit decode still pays CPU routing handoffs.

Concrete directions:

1. Launch the independent shared expert while missing routed experts are read. Currently its graph is constructed after the routed path returns, at lines 579–580.
2. Launch work for resident experts while reading misses, then restore the original routed order before reduction. Do not change kernels depending on cache contents.
3. Keep a device-visible expert-to-slot mapping, compact only genuine miss requests, and reuse fixed decode buffers/graphs. Replace broad layer barriers only with explicit lifetime/event guarantees. MLX donation and in-place pool writes make removing `eval(h)` blindly unsafe.
4. Compile or fuse pure compute regions separated from dynamic I/O: projection groups, normalization, gates, residual injection, partial RoPE, and sampling. There is no model-wide `compile` call in the production source. A giant compiled function cannot by itself absorb synchronous Swift routing and disk reads.

### The router casts are materialized

The comment beside `matmul(x.asType(.float32), gateWeight.transposed())` says no materialized cast. The actual MLX `ops.cpp` implementation promotes both inputs to the result type, including an `astype` of the BF16 weight to FP32. This creates about 5.243 MB per layer, or 251.658 MB of FP32 router writes per token across 48 layers, in addition to the BF16 reads.

A synthetic cached-FP32 variant produced identical results and reduced extra active allocation for that operation from 5,244,928 to 2,048 bytes. But storing all FP32 routers adds 251.658 MB if the original BF16 tensors remain referenced by `ResidentWeights`; the net increase is only 125.829 MB if those originals can actually be released. Benchmark at matched total memory, including the expert slots displaced. A mixed-input kernel that converts BF16 values while accumulating in FP32 avoids the persistent-cache trade.

### Projection and expert kernels

Gate and up projections share input and can be combined into one projection launch, followed by fused SiLU/product. GDN QKV, z, a, and b projections offer similar grouping where quantization layouts match. Preserve intermediate rounding; merging arithmetic can perturb routing downstream.

The backend already contains NAX quantized matrix kernels and grouped expert kernels. Do not assume Swift misses hardware acceleration merely because the frontend is Swift. Tune for the actual shapes, routed rows per expert, register pressure, and tile occupancy. Some NAX paths use 64-row tiles; small expert groups can waste substantial tile capacity. This merits a kernel profile, not an unmeasured claim that handwritten Metal must be faster.

## 8. Expert sweep, storage layout, and admission

The current prefill sweep already sorts rows by expert, uses `sortedIndices: true`, bounds staging groups, overlaps reads within a layer, pads groups to preserve backend dispatch, and avoids admitting every intermediate prompt sweep. Staging arrays already wrap aligned managed memory without a second Swift-to-MLX copy. These are existing strengths, not missing optimizations.

Three remaining groups of work matter:

**Reduce output lifetimes.** `sweep` keeps every group's output, concatenates them, and gathers back to token/router order. A 4,096-token `[S,10,2560]` BF16 expert-output array is 209.715 MB; multiplying by FP32 routing weights can create a 419.430 MB intermediate. Write groups into disjoint positions of one routing-order output buffer, then keep the existing reduction order. A stronger fused weighted reduction can remove the top-K dimension, but naive float atomics are nondeterministic. Use deterministic accumulation and explicit numerical gates.

**Reduce read fragmentation.** One miss currently consists of nine pieces. Packing an expert into one contiguous 2,764,800-byte record could reduce syscall and queueing overhead. However, expert-major layout favors random decode while the existing projection-major layout favors contiguous prefill runs. Test actual checkpoint offsets and mixed hit/miss patterns, not nine artificial adjacent reads. A derived local layout must verify tensor-byte equivalence and account for extra disk space if the original bank is retained. CPU unpacking, storage traffic, and GPU scatter do not disappear.

**Improve cache utility per byte.** The pool uses CLOCK-style recency, not frequency-aware admission. Test scan resistance plus decayed frequency/reuse distance across prose, code, tools, and changing conversations. Recent prompt tails may predict imminent decode better than whole-prompt frequency. Optimize per-layer stall distributions and all-hit-layer frequency, not just aggregate hit rate. Track pinned slot IDs instead of clearing every slot each layer; consider a flat 24,576-entry lookup structure instead of repeated hash lookups. These bookkeeping changes are modest compared with eliminating a disk miss.

Dynamic read jobs may balance the large packed matrices and smaller metadata reads better than fixed strided lanes. Hoist repeated FD lookup/locking where safe and reuse bounded aligned buffers. Direct CPU reads into a permanent GPU-visible arena could eliminate scatter, but require fence-controlled mutation and stable ownership. It is not a safe one-line replacement for the current pool.

Cross-layer prefetch is possible only speculatively or with a broader layer schedule: the next layer's exact routing depends on the present layer's result. Blindly reading an entire next layer costs about 1.416 GB of staging and may compete with useful reads. A background thread alone is not evidence of useful overlap.

## 9. GDN: preserve the recurrence, change its execution carefully

With state arranged as value-by-key, the implementation computes:

`S_t = g_t S_(t−1) (I − β_t k_t k_tᵀ) + β_t v_t k_tᵀ`,

followed by `y_t = S_t q_t`, with normalized q/k, q scaling, learned decay, and sigmoid update gate. The state is FP32, and the Metal kernel preserves compensated summation for the state/key dot product. Those details are part of the numerical behavior.

The existing kernel keeps state in registers and loops over time. That is excellent state reuse, but its temporal loop is serial and cannot exploit all prompt parallelism. A chunkwise triangular/WY-style formulation is a serious compute-side prefill experiment after repeated I/O and buffer retention are fixed. A naive associative scan of dense 128×128 transition matrices can add cubic work and is not automatically an improvement.

For speculative verification, recording mode instead launches one GDN step per token and retains intermediate states. A recording kernel that executes the small sequence once and writes each required state could remove launch and state reread/write overhead while keeping exact rollback. Test every acceptance length. Do not revert to rerunning accepted tokens.

BF16 recurrent state, relaxed compensated sums, or unrestricted fast-math changes are quality-affecting numerical experiments. Long-sequence state drift matters even when short greedy outputs match.

## 10. N-grams and PLE: optimize latency and object overhead

Sixteen 160-dimensional hashed rows are used per token. In the current 4-bit affine representation each row needs 80 packed weight bytes, ten scale bytes, and ten bias bytes: 100 useful bytes, or 1,600 total. A fully missing token can issue 48 tiny reads. This is latency/IOPS-sensitive, not a 32 GB sequential bandwidth problem.

`NgramStore.prefetch` already deduplicates and reads prompt rows on parallel lanes. Further opportunities are:

- Start bounded lookahead as soon as prompt IDs are known, overlapping embedding/earlier layers instead of waiting until PLE executes. Account for eviction if lookahead exceeds cache capacity.
- Interleave the three pieces of each row, or cache the corresponding pages, to reduce read count. Measure page read amplification and latency.
- Store cached BF16-rounded values as UInt16 rather than Float. At 400,000 rows the payload becomes 128 MB instead of 256 MB, without changing represented values. A quantized-row cache could use 40 MB of payload but trades CPU dequantization and different hot-path work.
- Replace per-row Swift object overhead and periodic array-prefix removal with a pooled slab and ring/compact index where profiling justifies it.

Do not change the hash, n-gram context at EOS, or BF16 conversion rules. These are model semantics, not cache-policy details.

## 11. MTP: optimize measured marginal cost, not draft count

The implementation greedily drafts, then samples from the target distribution and accepts a draft only when it matches that target sample. It does not use the general proposal-distribution rejection sampler. Larger draft depth is not free extra throughput.

For depth one, a useful local break-even condition is:

`(draft time + verify-two time + reconcile time) / (1 + acceptance) < plain-token time`.

Include the resident draft head's opportunity cost in expert cache capacity. Depth two verifies three rows and hits the attention fallback described above. It also increases expert unions, recurrence recording, and transient state. Adapt depth or disable drafting based on observed acceptance, verification time, miss rate, and remaining output budget, rather than only nominal pool size.

One narrower optimization: the first provisional draft-cache entry uses the true previous main-model multi-stream state and is reusable. Reconciliation currently trims all provisional entries and consumes the kept sequence again. Retain that first valid entry and rebuild only later entries needing verified main-model states. Deeper draft hidden states are approximate and cannot all be kept blindly.

Do not overstate the current reconciliation cost: `head.consume` builds a lazy graph, but materializing its cache prunes unused attention output, MoE, and final mixer work. It does not execute a whole extra head forward merely because the Swift function is called.

Cap work near the output-length limit. A full draft chain can currently be created even when only a small number of output positions remain.

## 12. Generation, sampling, prefix reuse, and serving

**Avoid an unused final forward.** The plain loop at [Generate.swift](../../../Sources/Slotstream/Generate.swift):414–425 computes the next logits even after emitting the last allowed token. A one-token answer therefore pays for a forward that contributes no token to that response. End with that token explicitly pending/unconsumed and let any future prefix continuation process it. Keep cache token accounting exact. The optimization primarily helps short or length-capped requests.

**Sample compact candidates.** `Sampler.next` is in Generate.swift, lines 151–200. With default top-K 20, it still forms a full-vocabulary probability array and, when top-P is enabled, sorts 248,320 entries. It then builds a full CDF and performs separate CPU reads for the total and selected index. Operate on compact candidates where possible and keep the total/draw comparison on device. Preserve threshold ties, top-P's exclusive cumulative rule, min-P, presence penalty, RNG draws, and token-ID order in the final CDF. A top-K threshold can retain more than K tied entries; do not silently change that distribution. Use the actual sampler oracle, not greedy text alone.

**Reuse prefix state at valid boundaries.** Existing prefix reuse avoids expensive repeated prefills, but recurrent state cannot be rewound from an arbitrary post-reply state. For edited prompts or common system prefixes, retain checkpoints at intentional boundaries with explicit GDN state and paged/COW KV storage. A longest-common-prefix string match is insufficient. Preserve multiple conversation entries and canonical token/image identity. Evaluate memory cost against expert hits.

**Account allocated storage.** Prefix costing uses per-token and fixed-state constants. Actual KV allocation rounds capacity, and MTP/indexer/retained-parent storage can differ from logical token counts. Charge actual owned capacities where possible. Shared buffer ownership complicates counting; summing logical `nbytes` can undercount retained parents or double-count shared allocations.

**Remove socket latency from the generation lock.** `Engine.generate` serializes the model and calls the output path synchronously. Socket writes with long timeouts can hold inference behind a slow reader. Use a bounded output queue with a separate writer and well-defined backpressure/cancellation. Do not allow an unbounded generated-text queue. Make governor pressure responses possible at safe generation boundaries rather than waiting for an entire long request to release the lock.

**Continuous batching is a different objective.** Interleaving multiple client states could amortize resident/expert reads and raise aggregate throughput. It needs explicit per-client recurrent state, routing, pool pinning, and fair scheduling; the code's B-shaped tensors do not make the present single-sequence control flow a batch server. It can worsen per-user latency. Measure separately from single-user decode.

Incremental detokenization is already bounded; restoring full-prefix decoding would be a regression. Likewise, a CPU rewrite of the frontend is not a high-priority inference optimization without evidence that tokenization dominates time to first token.

## 13. Vision has its own attention dispatch mismatch

The tower has hidden width 1,152 and 16 heads: head width **72**. Its SDPA call at [Vision.swift](../../../Sources/Slotstream/Vision.swift):696 therefore fails both of the pinned backend's supported-width lists. The nearby comment describing fused attention is not evidence that dispatch is fused.

A dense BF16 score matrix uses `16 × patches² × 2` bytes: about 2.718 GB at 9,216 patches before other allocations. A fused 72-wide kernel, or a carefully validated padded implementation, can remove that quadratic intermediate. It cannot remove the tower's inherent dense attention arithmetic without changing the model.

Zero-padding Q/K/V from 72 to 80 and retaining scale `1/sqrt(72)` is algebraically sound. Synthetic tests reduced extra allocation substantially: at 2,048 patches, about 143.65 MB became 20.97 MB. But outputs differed by about 1.36–2.24% relative to maximum reference magnitude across tested shapes, and there was no usable clean timing result demonstrating a speed win. Padding is a prototype candidate, not a production recommendation. Test the real image tower, image understanding outputs, and larger shapes before selecting a kernel.

Other image opportunities: cache image features by content plus processor/model identity across conversations; fuse image layout/normalization passes; avoid duplicate temporary temporal frames where the patch operator allows it; and examine repeated tower loading versus its resident-memory cost. Prefix reuse already avoids rerunning an image that is entirely inside a reused prefix. Do not present that as missing functionality. Lower image resolution changes the input and requires a quality policy rather than being a free speedup.

## 14. Whole-approach alternatives and their costs

| Alternative | Assessment |
|---|---|
| More expert cache | Helps misses until another bottleneck dominates; choose by live routing and total memory, not a monotonic speed extrapolation. |
| Lossless weight compression | A bounded zlib sample of packed expert weights saved about 6.0%. Metadata/codecs/distributions differ; no end-to-end win shown. Low priority against fewer reads and launches. |
| Three-bit experts | At the same group metadata cost, record size becomes 7/9 of the current size: 22.2% less, 28.6% more records per byte. Requires requantization and quality evaluation. |
| Two-bit experts / reduced top-K / expert pruning | Potentially larger savings, but changes model behavior. Top-10 to top-8 alone removes 20% of routed work by deleting contributions. Separate model-quality branch. |
| Quantized KV or recurrent state | KV savings are modest relative to the expert bank on this hybrid model. Recurrent FP32 precision is particularly sensitive. Profile before paying quality risk. |
| Stream more resident trunk | Most dense tensors are used every token, so streaming them can replace cache capacity with predictable new I/O. The lookup-only embedding table is a narrower exception worth testing on small-memory targets. |
| Always dequantize hot experts to BF16 | Roughly 3.56× their current weight storage; sharply reduces cache capacity. Could help reuse-heavy prefill, but is not an obvious decode win. |
| mmap everything | Mapping is not residency control. Page faults, filesystem cache competition, and GPU ownership still matter. It does not solve the working-set problem. |
| Speculatively fetch predicted next-layer experts | Requires a measured predictor and bounds on wasted I/O; exact routing is causally unavailable early. |
| Alternate smaller draft model / speculative tree | Possible new system, with its own memory, acceptance, batching, and quality costs. First optimize and measure the existing MTP path. |
| Replace Swift with C++/Rust | Useful only where it changes hot-path allocation, scheduling, or kernels. The numerical backend is already native; a language rewrite alone does not reduce tensor bytes. |
| Faster SSD / multi-drive striping | Raises one bandwidth/latency ceiling, not resident computation, barriers, or recurrence throughput. Avoid platform complexity until the measured critical path warrants it. |
| Smaller/different base model | Can be the fastest way to satisfy a particular task, but is a different model-quality comparison. It does not establish optimality of this implementation. |

There is no single maximum-speed configuration independent of memory, task quality, prompt length, number of clients, and acceptable startup time. Optimize the Pareto frontier of time to first token, decode latency, memory, and quality. Energy per token is another useful objective, but no energy measurement was performed here.

## 15. What to build and measure, in order

| Order | Experiment | Success criterion | Main risk |
|---|---|---|---|
| 1 | Compact GDN/PLE/MTP retained views | Exact state/logits for ownership-only changes; lower measured footprint or safe larger pass | Copy inserted too early/late; speculative lifetime |
| 2 | Tail-aware bounded schedule | Fewer actual expert passes at unchanged bound; faster paired TTFT | Rechunking numerics, final admission |
| 3 | Cache completed indexer blocks | Eliminate repeated old-block transforms; improve long-context decode | Rollback and partial-block correctness |
| 4 | Avoid final forward; compact sampler | Lower short-response latency; oracle distribution/RNG parity | Cache accounting, ties, CDF ordering |
| 5 | Router promotion and shared-expert overlap | Lower per-layer critical-path time at matched total memory | Displaced cache, mutation/fence hazards |
| 6 | Fused selected-block 256-wide attention | Lower prefill work/peak, bounded indexer too, quality gate passes | Reduction order and causal/tail correctness |
| 7 | Layer-major/superchunk prefill | Fewer measured expert bytes at fixed total footprint; TTFT reduction | Hidden-buffer lifetime, compute bottleneck shift |
| 8 | Deterministic sweep output placement | Lower pass peak/copies with invariant cache semantics | Changing accumulation order |
| 9 | Expert layout and cache admission A/B | Lower actual miss stall time on varied routing traces | Prefill/decode tradeoff, storage duplication |
| 10 | MTP fused recording/reconciliation/adaptation | Lower time per accepted target token | State alignment, dispatch cliffs |
| 11 | Fused vision attention and feature reuse | Lower image TTFT/peak with vision-quality checks | Numerical/resolution behavior |
| 12 | Chunk-parallel GDN and deeper graph/arena work | Improve the bottleneck remaining after I/O fixes | Large engineering and numerical surface |

This order is a proposed optimization sequence, not a claim that every later item will win. Run independent candidates separately before stacking them. An optimization that saves memory should be evaluated both at fixed pool size, to explain the mechanism, and at fixed **total** memory, to assess its product benefit.

Instrumentation must distinguish queue time, tokenization, image preprocessing/tower, text prefill, first emitted byte, steady decode, reconciliation, and socket backpressure. `vision.runs` executes before the current text-prefill timer starts, so text prefill time is not image-request time to first token. Expert I/O timing includes host work and can overlap GPU execution; `wall − io − scatter` is not a reliable GPU-compute measurement. Record transfer bytes, syscall counts, GPU command durations, wait intervals, active/cache allocator bytes, sampled physical footprint, and VM deltas.

Use one model process, stable reclaimable memory, bounded sizes, warmup separate from measurement, and interleaved A/B rounds. Report medians and tail latency, not best runs. Keep cold filesystem, warm filesystem, cold expert pool, warm expert pool, and retained-prefix cases distinct. Discard runs with competing model work or relevant swap activity. Test ordinary prose, code, tool calls, nonrepeating prompts, short responses, long contexts, and images; the synthetic-ID probes here are not that workload suite.

For ownership/layout/cache optimizations, require identical bytes and routing where the arithmetic is unchanged. For kernel or batching changes, compare logits, recurrent state, routing stability, long-sequence drift, task outcomes, and the existing accepted rechunking envelope. Test all speculative acceptance lengths and cancellation boundaries. A matching greedy answer on one prompt is weak evidence.

The concrete conclusion is that Slotstream should first stop retaining and recomputing information it no longer needs, then reuse streamed weights over a broader bounded prefill schedule, and finally specialize kernels around the model's actual shapes. The audit establishes specific opportunities and one real-model memory intervention; it does not establish an achieved end-to-end speed multiplier or a finished optimal runtime.
