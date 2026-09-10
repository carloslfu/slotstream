---
type: plan
meta-type: operational
id: 01m1nadbgqp7rx4mt7cv8skww2
created: 2026-09-04T04:21:43.575206+00:00
updated: 2026-09-05T03:40:54.147149+00:00
summary: Standalone N6 execution superseded; retained as the unified optimization program’s detailed prefill chapter, with every mechanism mapped to an OPT owner
date: 2026-09-03
doc: plan
kind: queue-item
level: '3'
order: '335'
title: 'N6 — Prefill: bound the pass, then read each expert once'
---
**Standalone plan superseded: execute through [[records/plan/whole-engine-optimization-2026-09-04]].** N6 remains its detailed prefill chapter; its optimization work is preserved and mapped to the OPT register below. Do not start a separate N6 queue, baseline or implementation. Implementation is now in progress through the OPT register; this chapter does not keep a second completion ledger.

 The September 4 review traced
prefill through `Generate.swift`, `Model.swift`, `Layers.swift`,
`ExpertStore.swift`, `NgramStore.swift`, the planner, prefix cache, MTP, serving,
and the pinned MLX kernels. It corrected the experimental contract as well as
the implementation sequence. The subsequent first-principles pass checks causal
dependencies, existing concurrency, backend submission locking and chunkwise GDN
algebra. No new controlled end-to-end speed A/B ran in these reviews. A separate native audit
confirmed retained-allocation savings with identical final logits at 1024/2048
tokens; its timings were discarded. See
[[records/analyses/2026-09-04-first-principles-inference-audit]],
[[sources/runs/2026/09/2026-09-04-first-principles-native-retention]],
[[sources/runs/2026/09/2026-09-04-prefill-parallelism-algebra]], and the earlier
code/tensor evidence [[sources/runs/2026/09/2026-09-04-n6-code-and-tensor-audit]]. Historical
shape probes and storage timings remain in
[[sources/runs/2026/09/2026-09-03-prefill-transient-probes]] and
[[sources/runs/2026/09/2026-09-03-expert-record-read-layout-ab]]; their original
bytes are preserved, including interpretations corrected below.

The central opportunity survives review: amortise each expert read over more
prompt tokens. First establish trustworthy instruments, remove unnecessary
retained allocations, and bound local work. Then enlarge the read scope without
enlarging every intermediate. Explore the compute alternatives below early in
small probes; their adoption is gated independently, not promised by this plan.

### Cost model and limits

Use **read scope** N for the new tokens sharing an expert sweep; **token tile** C
for attention, recurrence, PLE and resident projections; **expert group** G for
staged weights; and **routed-row tile** R for the expert GEMMs. These are four
separate quantities. Initially G remains 32. Today N and C are effectively the
same outer pass and R is unbounded inside a group.

```
expertBytes = recordBytes × sum over scopes and layers of fetched experts
recordBytes = 2,764,800
one full layer = 512 records = 1,415,577,600 bytes
48 full layers = 24,576 records = 67,947,724,800 bytes

wall time = host preparation + critical path through reads and GPU work
            + non-overlapped tails + request setup and output handling
```

When every layer's routed union is read at most once in **one scope**, main-model
expert reads are at most 67.95 GB, less where resident experts are reused. For
J scopes the bound is J × 67.95 GB. It excludes resident trunk loading, n-gram
rows, MTP/vision weights, decode, and any optional activation spill or deliberate
read amplification. It is **not a permanent 68 GB bound for arbitrary prompts**:
whole-prompt activations must fit, the context cap still applies, and a smaller
scope may be preferable for latency or memory.

The prior plan cited 826 GB at the floor and 273 GB at 16 GB. Keep these as
historical anchors to reconcile, not a frozen matched baseline. In particular,
`256 ×31 + 137 = 8,073`, not 7,960; 7,960 ends in a 24-token tail. The raw/chat
rendering, tokenizer revision and exact token IDs must travel with every number.
Reported ~208/~311 routed experts are not sufficient to infer the joint union,
cache misses or density at another shape. Measure them separately. Neither
uniform routing nor a decode-only union is a substitute for a prefill trace.

A larger scope usually reduces repeated reads, but changing arithmetic and
batch shape can change later routing. Calculate the bound from the actual
schedule and trace, including resident copies, tails and admission. Do not
assert a universal ratio. For 32,768 tokens, the current 4096-cap schedule is
25 passes; a constant 4096 schedule would be 8. A 256-cap schedule already has
128 constant passes, so removing context-driven halving offers it no such gain.

The old predictions of ≥222 tok/s at the floor and ~300 at 16 GB are withdrawn
as bounds. `ioSeconds` includes host read/staging calls that can overlap GPU
execution; `prefillSeconds - ioSeconds - scatterSeconds` is a residual, **not
measured GPU compute time**. Holding that residual fixed after reordering the
pipeline does not produce a lower bound. Likewise, 2.4–3.7 ms/token is not an
established compute ceiling, and a 2.5× reduction in records is not a 2.5× speedup.

The layout probe makes repeated reads a stronger target than more read lanes on
this Mac. It does not prove there is no remaining bandwidth on any device.
Existing queue-depth and buffer-recycling nulls stand for their tested regimes;
revisit only with a changed regime and a specific trace-based hypothesis.

### Unified program: ownership and implementation order

N6 is now the detailed prefill chapter of
[[records/plan/whole-engine-optimization-2026-09-04]], not a competing backlog.
That record owns the single OPT status register and program-wide experiment
lifecycle. This chapter owns prefill algorithms, substeps and acceptance detail;
phase exits link the corresponding OPT result rather than maintaining a second
completion or numerical ledger. The combined program has 37 items, including
OPT35 for demanded prefill outputs and OPT36 for specialized selection. All
production implementation status is now tracked in the unified program. The following review describes the pre-implementation evidence.

| N6 detail | Single execution owner |
|---|---|
| Phase 0 harness, baseline, trace and timing repair | OPT00/01 |
| 1.0 GDN/PLE compact carry; MTP last row | OPT02/03 |
| 1.1 PLE/resident tiling and n-gram assembly | OPT07/14; compatible projection fusions OPT18 |
| 1.2 completed indexer blocks, bounded selection, attention | OPT09/10/15; shared positions OPT11; selection kernel OPT36 |
| 1.3 deterministic MoE placement/fold and bounded rows | OPT12/13 |
| 1.4 capacity, growing prefix hits, feature and rollback reservations | OPT08; checkpoint extensions OPT29 |
| 2.0 remaining-aware scheduling | OPT04 |
| Remaining Phase 2 workspace bounds and estimator family | OPT08/10/14/16 |
| 3.1 short-tail scan resistance and decode admission | OPT04 for schedule; OPT21 for admission policy |
| 3.2 canceled prefill and committed-prefix recovery | OPT30; scope implementation OPT16; reusable checkpoint extension OPT29 |
| 3.3/3.4 truthful progress, effective knobs and overflow bounds | OPT01/04/08 |
| Phase 4 read scope and explicit workspace alternatives | OPT16, consuming OPT12/13/14 bounds |
| P1 shared work and P2 resident/missing/read-group overlap | OPT19; optional reusable-arena work OPT20 |
| P3 exact n-gram lookahead and aggregate read budget | OPT14/21 |
| P4 selected-block text attention; P5 chunkwise GDN | OPT15/26 |
| Unused final mixing and terminal-layer query/MoE pruning | OPT35 |
| Phase 5 expert/row layout and gap-aware read runs | OPT22; scheduling/bookkeeping OPT21 |
| Request-specific scope/pool trade and temporary headroom | OPT08/16, with explicit-pool semantics preserved |
| Prefix checkpoints; cross-request batching; activation spill and quality changes | OPT29; OPT31; OPT34 respectively |
| Combined acceptance, planner/claims/projections and delivery readiness | OPT32/33 |

Use one baseline manifest and repair the existing harness once. The execution
order is: instruments and compact ownership; tail correction and independent
waste removal; bounded indexer/PLE/row work; select a read-scope workspace;
combined qualification. P1/P2 overlap, P4 attention, P5 GDN and OPT36 selection
probes may start from fixed inputs before the broad scope implementation.
Integration requires their actual state/memory gates. In particular, OPT26 does
**not** require OPT16: it may first improve the current token-tiled path. A small
P1 schedule-only experiment does not require a new MoE reduction either.

### Additional first-principles findings from joining both plans

The latest implementation check uses source HEAD
`6e66a367f93e636c3729179e24007aa99c97b9a6`; inference sources and package pins
are unchanged from the initial audit. Raw source identities, derivations and
CPU checks are in
[[sources/runs/2026/09/2026-09-04-prefill-unification-first-principles]].
No model benchmark ran in this pass.

**U1 — distinguish bounded row computation from bounded reduction storage
(OPT12/13/16).** The existing output axis is router rank, not expert ID:
`experts[B,S,K,H] * weights[B,S,K,1]`, then the pinned reduction over K.
Preallocating disjoint output positions removes concatenate/inverse-gather
copies but still owns `N × K × H` values. At N=32768, K=10, H=2560, that buffer
alone is 1,677,721,600 BF16 bytes. An unfused weighted FP32 tensor is another
3,355,443,200 bytes if simultaneously live. Neither is a bounded R-tile buffer.
The current 56,320-bytes/token frontier example includes an FP32 accumulator;
it is only sufficient for that part of a design which actually implements a
compact fold. Add the full output axis when the selected algorithm keeps it.

There is a real scheduling tradeoff, not a missing `scatter` call. Expert-major
visitation produces contributions for many tokens out of router-rank order.
Without an additional storage/liveness proof, a bounded per-token K tile cannot
preserve the existing sum while arbitrary earlier/later expert groups remain
unvisited. Choose and measure one of these explicit arms:

| Arm | Storage/read trade | Numerical contract |
|---|---|---|
| A: canonical output placement | Keep scope-wide BF16 N×K×H, fuse or tile weighting/reduction to avoid a full FP32 product; select a smaller fitting N | Preserve existing contribution values and reduction tree for the exact arm; changed GEMM row tiling still has its own gate |
| B: deterministic expert-order fold | FP32 N×H accumulator plus bounded R scratch; execute fixed expert-ID order, reduce duplicate token destinations deterministically within each group | A new summation algorithm, even when repeatable and pool-invariant. Must pass frozen logit/state/routing/quality bands; no claim of exact reference summation |
| C: one-layer routed-weight workspace | Up to 1,415,577,600 weight bytes, then chronological token tiles with bounded C×K×H combine | Retains more existing tile arithmetic; projections/GEMM shapes and continuation still require checks |

An alternative which stores partial reduction-tree nodes must publish its
worst-case live-node bound on adversarial routing, not only a typical trace.
At 27,648 tokens the full 512-expert weight payload equals the single BF16
N×K×H output payload. This is payload arithmetic, not a runtime crossover:
resident copies, actual routed union, staging, scratch and decode-pool displacement
still decide. Benchmark A/B/C at fitting budgets; do not force B if its numerical
or scatter cost loses. Preserve G outside R to avoid rereads in B, and retain
loaded layer weights across C in C. Admission must neither change the arithmetic
order nor secretly reload an expert after its workspace was freed.

**U2 — partial selection is currently a full sort (OPT36 with OPT10/17/06).**
Pinned `backend/metal/sort.cpp:342` routes `ArgPartition::eval_gpu` to
`gpu_merge_sort`, as does `Partition`. `Layers.swift:230/565` and `MTP.swift:94`
therefore sort the entire selection axis despite retaining only 512 indexer
blocks or ten router experts. The router has 512 candidates; the indexer has
up to 8192 completed blocks at the current cap. Multi-block sorting also owns
values/indices scratch. Merely changing the Swift spelling to another wrapper
of the same primitive is not an optimization.

Prototype top-10/512 router selection and bounded block-top-512 separately.
A blockwise local-top-K plus merge can discard candidates that cannot enter the
final top-K under one fixed total order. The CPU check establishes this identity
in 60 finite synthetic cases, including ties, not pinned GPU parity. Derive and
verify the actual comparator, tie order, masked infinities, signed zero and
exceptional-value behavior across single/multi-block backend boundaries. Router
acceptance requires the same **ordered** IDs and logits: changing order can
change softmax and the later weighted sum even with the same expert set.
Keep routing weights/normalization separate initially. A changed tie policy is
not an exact optimization. Reuse a proved primitive in the sampler only under
its different threshold-tie/CDF contract.

For the indexer, initially keep the existing score arithmetic and substitute
selection only. Separately prototype a tiled score kernel that combines the
four `max(q_h dot k, 0)` terms without materializing all four head-score planes.
Do not move the positive-part operation after summation or sum queries first:
`max(1,0)+max(-1,0)=1`, whereas `max(1-1,0)=0`. Changed dot/sum grouping is a
numerical candidate. Compact selection eliminates dense mask expansion only
when attention consumes it directly; it does not eliminate scoring all visible
completed blocks. Preserve a query-tiled full-score/old-selector fallback so
fused attention need not wait for a new selector to win.

**U3 — visibility-based dense shortcut and compact persistent indexer
(OPT09/10/15).** Let absolute query position be t, compression ratio r=4,
and block budget k=512. The number of fully visible blocks is
`floor((t+1)/r)` and the own partial tail has `(t+1) mod r` keys. All causal keys
are retained whenever that block count is <=k, even if later keys in the same
scope make total context exceed 2048. For finite scores, positions through
2050 inclusive need no indexer scoring/selection; 2051 is the first position
with 513 complete visible blocks. Preserve raw K projections/cache updates for
future selection and split query tiles at the actual visibility boundary.
The independent 510-case mask transcription covered ties, reused absolute
positions and partial blocks; production mask/output equivalence is still required.
If only K projection rows are used, a smaller quantized projection is a separate
shape/numerical experiment, not an assumed benefit from lazy slicing.

Completed raw indexer blocks have no future consumer once the exact FP32 mean
→ BF16 → normalization → RoPE result is cached. Consider replacing old raw
storage with completed pooled keys plus a raw tail, rather than keeping both
forever. Across the main model's 12 indexers at 32k, raw payload is 100,663,296
bytes and completed payload is 25,165,824: a derived 75,497,472-byte difference
before alignment, growth, rollback and MTP. This is a smaller capacity opportunity
than expert reuse, not a measured footprint saving.

The new cache cannot implement arbitrary trim using offsets alone. A checkpoint
must retain its partial raw block and completed-block count; speculative verify
must retain enough accepted/rejected raw positions to rebuild a cut block.
Provide bounded undo/tail state for maximum draft length, or keep the old raw
storage until that proof passes. The CPU append/whole-checkpoint experiment
covers 156 cases and does not prove BF16, normalization, RoPE or arbitrary trim.
Test every four-token remainder through prefix restore, cancellation, KV growth
and speculative rejection; immutable completed blocks may be shared only with
correct ownership/capacity accounting.

**U4 — ask prefill for only the outputs its caller consumes (OPT35).**
`Model.hiddenStates` returns every mixed row, and nonfinal prefill calls explicitly
`eval` that result. Its final `eval(h)` also forces all final-layer MoE/residual
rows before a last-row slice can prune them. Introduce an internal demand
contract—state only, last logits, or full multis/diagnostics—while leaving public
full-output methods compatible. First skip the unused final mixer on nonfinal
scopes and mix only the demanded last row on the final scope.

The pinned model ends in QSA. With MTP disabled and no full-output hook, final-layer
state depends on K/V and raw indexer K for **all** new positions. It does not
depend on the final layer's earlier query outputs or token-local MoE/residuals.
After all earlier layers and final-layer input/required caches are complete,
a state-only scope can omit those queries and terminal MoE entirely; a last-logit
scope needs only its final query, attention residual, MLP HC, MoE and mixer.
Q projection is stateless, while K/V/indexer updates are not. This is stronger
than skipping only the final mixer, and only affects the terminal layer. Keep
all earlier layers intact. A diagnostic truncated stack that ends in GDN still
needs every chronological recurrent update; query-only QSA pruning cannot apply.

MTP needs full final multis to build its cache and therefore disables the terminal
MoE pruning arm. `MTPHead.consume` already materializes only its state dependencies;
do not count its discarded lazy MoE/mixer graph as executed work being removed.
Provide explicit full-output fallback for diagnostics/parity/hooks and compare
continued state, fixed inputs, pool warmth and generated quality. One-row expert
work must not silently switch to a cache-content-dependent kernel: preserve the
chosen sweep/grouped arithmetic where feasible, or classify the shape change
under numerical gates. Materialize every required cache/state write explicitly when omitting `eval(h)`; preserve the release barrier before pool mutation and do not let lazy pruning discard necessary state. Choose admission explicitly; removing terminal routes
changes warming/counters, not model mathematics. Report its limited one-layer
scope rather than promising a stack-wide multiplier.

**U5 — select a measured schedule, not the largest possible N (OPT08/16/21).**
The saved reads from merging adjacent scopes are governed by their actual routed
set intersection and resident misses. Compute the union benefit from fixed
traces as a mechanism model, then remeasure live routes after numerical changes.
Beyond near-saturation, larger N can continue saving repeat scans but also expand
frontiers, prolong cancellation/retry work and displace decode cache. Select
among fitted A/B/C schedules after the reused prefix and remaining prompt are
known. Do not assume future-layer routes are available at planning time.

Keep N, C, G and R distinct. Inside C, attention query/key tiles and the GDN
recurrence block length may differ from resident-projection and PLE tile sizes;
forcing all kernels to use one shape can discard the best compute regime.
Use a small measured candidate set rather than an uncontrolled Cartesian tuning
grid. Freeze weights for TTFT, full-request latency and cancellation requirements;
include fixed decode suffix cost and cold/warm MTP/image startup. Choose a policy
on development traces, confirm on held-out requests, and charge all persistent
and overlapping buffers. Progress remains work progress until a whole-stack
scope commits.

The review also resolves an acceptance mismatch: a verified ownership/capacity
improvement may ship with measured latency **nonregression** and an explicit memory
benefit; it need not await a speculative larger-scope speedup. A change advertised
as a speed improvement still needs a full-request timing win. Correctness,
truthful reporting and missing budget enforcement are fixes regardless of whether
a custom kernel wins. No evidence here certifies the fastest possible runtime;
the program identifies and tests the remaining alternatives against one baseline.

### First-principles parallel execution — the dependency and resource contract

Prefill knows all input token IDs; it does not know every layer's activations or
expert routes. Consequently it has much more token parallelism than decode,
but the 48-layer dependency chain remains. The objective is minimum exposed
critical-path time at a bounded total footprint, not the largest thread count.
For fixed work, necessary lower bounds include storage bytes/effective storage
bandwidth, GPU work/effective compute throughput, memory traffic/effective memory
bandwidth, and the causal critical path. Use the maximum of resource bounds,
not their sum, where resources overlap; release times and contention can make
actual elapsed time larger. CPU, SSD buffers and GPU share unified-memory
capacity and bandwidth. More streams cannot multiply those resources.

For one layer, the relevant dependencies are:

```
prior-layer hidden -> optional PLE -> attention HC -> GDN or QSA -> residual
  -> MLP HC -> x2
       x2 -> router/top-K -> CPU IDs -> sort/lookup -> weight reads -> experts
       x2 -> shared gate and shared expert ------------------------------+
       router weights + routed outputs -> ordered weighted reduction ----+
                                                                  combine
                                                                     |
                                                              next layer
prompt IDs + preceding IDs -> exact n-gram rows -> PLE when reached
```

**Existing parallelism must remain in the control.** Expert `readRuns` already
uses dynamically assigned concurrent read lanes (12 by default); n-gram prefetch
already uses 32 lanes. Sorted grouped expert GEMMs parallelise rows and output
dimensions, and `asyncEval(d)` overlaps a group with the following CPU read.
Replacing these with generic async functions does not create a new mechanism.
For an ideal two-stage pipeline of m identical groups with read time r and GPU
time c, elapsed time is `r + c + (m - 1) × max(r,c)`, rather than `m × (r+c)`.
The current path already captures some of this saving. Remaining bubbles and
resource contention, not the serial formula, define further overlap headroom.

**P1: launch shared work while exact routed weights are arriving.** In
`MoELayer.callAsFunction`, the shared branch is currently constructed after
`sweep` returns. It depends on x2, not on expert IDs or routed output. First
prototype submitting the unchanged shared branch with `asyncEval` immediately
after router ID readback, before CPU sorting and the first staged read. Keep
router readiness first: launching a large shared projection ahead of the router
can delay every required disk request. A more advanced ordering can submit the
router to its own completion event, then shared work, and wait only for the
router event; verify that ordering on the pinned backend before using it.

Use the existing GPU stream initially. This overlaps GPU computation with host
sorting/SSD work without requiring simultaneous GPU kernels. Charge the shared
output and its live intermediates; in a large scope submit bounded tiles with
admission limits instead of an entire extra scope graph. Moving the graph earlier
can itself change peak/donation behavior. Preserve shared gating, intermediate
rounding and the original routed combine. Measure time until the next layer can
start, including any expert GEMMs delayed by shared work. No win is promised on
a warm, GPU-saturated layer.

**P2: overlap the first missing read with resident computation, and preserve
read-ahead across routed-row tiles.** The current sweep handles all resident
groups first, using blocking `gatherResident`, before it starts missing reads.
Once CPU IDs and residency are known, a bounded raw-I/O producer can start the
first required missing group while the GPU copies/computes resident groups.
Compute/reduce in the same canonical order; early read completion must not
change group membership, dispatch or arithmetic. In Phase 4 the producer can
read group G+1 while all bounded R tiles reuse group G, rather than waiting for
the final row tile before beginning that read. Retain at most the current and
one next weight group unless a separately budgeted experiment earns more.
At 32 experts per group those two weight sets alone occupy 176,947,200 bytes,
before row buffers and admission copies. An all-resident layer has no missing
read to hide; report cold/mixed/warm cases separately.

This needs an ownership boundary, not background calls to the current
`pool.readStaged`: that method also wraps/evaluates arrays and mutates stats.
Workers should own raw aligned buffers and immutable read tickets; a single
generation owner wraps completed buffers, submits MLX work, updates pool/cache
metadata and publishes counters. Pinned `Transforms+Eval.swift` and
`MLXArray.eval()` serialize evaluation calls with the same `NSRecursiveLock`,
including blocking evaluations. Worker `eval` calls therefore need not provide
parallel submission and can prevent the owner from progressing. This is a host
API constraint, not proof the GPU cannot overlap commands. The C++ backend has
per-evaluation events and inter-stream fences, so do not call every `eval` a
device-wide synchronization either; already-available raw arrays need no GPU
wait. Inspect actual event waits and command order.

A stage slot moves through `free -> reading -> ready -> GPU in use -> free`.
Its completion must include every row consumer and any admission copy, not
merely the first GEMM. Enforce bounded ready queues, generation/scope identity,
read-failure propagation, cancellation joins and exactly-once ownership
transfer. Keep pool writes and resizing behind the existing release guarantee
until a narrower fence proves the same lifetime. A CPU worker returning from
`pread` is not permission to overwrite a buffer the GPU is still reading.

**P3: start exact n-gram lookahead before layer 1 needs it.** Hashing and row
reads depend only on prompt/history IDs, so bounded prefetch can overlap layer
0 and, for image requests, independent vision work once IDs/history are fixed.
Merge completed rows on the owner; retain the cache/EOS semantics and avoid
prefetch-then-evict-then-reread. Share an aggregate I/O budget with expert reads,
prioritising data that is blocking the next operation. Independently enabling
12 expert lanes plus 32 n-gram lanes does not establish useful extra bandwidth.
Measure nonrepeating prose, warm rows and concurrent vision separately.

**P4: turn attention's token independence into an appropriate GPU kernel.**
Given projected Q/K/V, each query row and query head can be evaluated
independently against its exact causal selected keys. For this model, ordinary
prefill falls outside the pinned fused SDPA dispatch at head dimension 256.
The main opportunity is bounded query/head/key tiling, online softmax and direct
selected-block traversal. A dense boolean mask does not skip the dense fallback
GEMMs. Preserve selection and process one query tile's indexer output directly;
consider sharing K/V loads across the 12 query heads using each KV head, without
assuming that the largest head tile wins on register pressure. Each query may
select different blocks, so cross-query K/V reuse is a measured tradeoff.
Fusing compatible Q/K/V or GDN projections and pointwise epilogues can reduce
launches and memory traffic; separate Swift tasks for each projection usually
add no compute resource to the same GPU. Kernel reassociation has its own
numerical gate. The existing <=2-query vector path is a diagnostic control,
not a proposed long-prefill strategy with thousands of small launches.

**P5: parallelise within GDN chunks without deleting recurrent context.** The
current kernel already launches `48 × (128/4) = 1,536` threadgroups for B=1,
parallel across value heads/value rows with 32 lanes reducing key dimensions.
It keeps FP32 state in registers and loops serially over T. It is therefore
not a one-thread or necessarily underoccupied kernel. A faster formulation must
earn its extra work/temporary traffic by using matrix operations more efficiently.

For one value head, with value-by-key state, the implemented update is
`S_i = g_i S_(i-1) + delta_i k_i^T`, where
`delta_i = beta_i (v_i - g_i S_(i-1) k_i)` and `y_i = S_i q_i`.
Within a block define `d_ij = product(g_(j+1)..g_i)` for i>=j, `d_ii=1`,
`d_ij=0` for i<j, `gamma_i = product(g_1..g_i)`, and unit-lower-triangular A with
`A_ij = beta_i d_ij (k_i dot k_j)` for i>j. Stack token vectors as rows:

```
U = solve(A, diag(beta) V)
W = solve(A, diag(beta * gamma) K)
Delta = U - W S_in^T
Y = diag(gamma) Q S_in^T + (d * (Q K^T)) Delta
S_out = gamma_last S_in + Delta^T diag(d_last,:) K
```

Here `*` inside the parentheses is elementwise multiplication.
U/W and local coefficients depend only on block inputs: their preparation can
be parallel over blocks/heads. Incoming/outgoing states still connect blocks;
the first implementation should retain chronological boundary-state propagation
and use matrix operations within blocks. Use a structured triangular/WY
algorithm, not a generic explicit inverse or a dense 128x128 transition-matrix
scan. Start with bounded block sizes such as 32/64/128 and compare full layer
time including preparation, state transfer and projection—not only the inner
recurrence. Do not materialise coefficient matrices for the entire scope without
a memory budget; bound precomputation lookahead independently of N.

The CPU FP64 derivation check in
[[sources/runs/2026/09/2026-09-04-prefill-parallelism-algebra]] passed 56 cases,
including nonzero S_in, partial blocks, masks, collinear keys, extreme gates and
128-dimensional state. Maximum output/state absolute discrepancies were about
1.95e-15/6.56e-15. This validates the synthetic algebra, not FP32/Kahan parity,
Metal performance or model quality. GDN's decay can underflow to zero, so a
production implementation must avoid dividing cumulative products or forming
undefined log differences across zero decays. Preserve BF16 q/k/v and outputs,
FP32 state/gates, the three value heads per key head, convolution carry and all
positions. Test long continuation/state drift and routing under frozen numerical
bands. Retain the current decode and MTP recording paths during the first prefill
experiment. The [Gated Delta Networks paper](https://arxiv.org/abs/2412.06464)
provides the chunkwise algorithmic precedent; it supplies no Metal speed estimate.

**Parallelism that does not follow from the dependency graph.** Independent
halves of a prompt lack the correct KV and recurrent starting states. Later
layers cannot obtain exact routes before the preceding computation produces
their inputs. A causal wavefront across token tiles and layers is possible, but
it competes with this plan's broad expert reuse, can hold several layer working
sets and uses the same GPU. Consider it only against a demonstrated exposed
bubble, charging rereads, buffers and the much harder partial-state cancellation
contract. Speculative next-layer reads need a measured predictor/waste budget.
CPU offload is likewise an experiment: shared RAM does not make CPU numerical
execution, GPU migration or DRAM contention free. More devices, a CPU rewrite
or concurrent requests are not prerequisites for these single-Mac opportunities.

**Experiment selection.** Run small attention/GDN kernel probes early while
ownership and instrument fixes proceed; their adoption need not wait until all
storage work is complete. Use the following measured decision rule rather than
a blanket priority based on layer count:

| Exposed critical-path observation | First experiment | Mechanism required before full-request acceptance |
|---|---|---|
| Repeated expert bytes dominate | Phase 1 ownership, tail-aware schedule, Phase 4 read reuse | Fewer actual repeated reads, no hidden amplification |
| GPU idle during sort/first read | P1 shared work; P2 resident/missing overlap | Independent useful GPU work fills the wait, next-layer readiness improves |
| Gaps between row tiles/groups | P2 bounded producer | Next group ready sooner without unbounded queues or altered combine |
| PLE waiting for rows | P3 exact lookahead | Fewer exposed row waits without slowing critical expert reads |
| Dense attention fallback dominates | P4 fused selected-block attention | Correct selections, less score traffic/work and bounded indexer memory |
| GDN recurrence dominates | P5 chunkwise recurrence | Faster complete GDN phase after setup, correct persistent state/quality |
| GPU stays busy on expert GEMMs | Larger weight reuse and shape-specific kernel/epilogue tuning | More useful rows per weight load or less memory/launch work; more read lanes alone has no mechanism |

Capture router-ready, first-read start/completion, resident-copy and GPU group
start/completion, shared completion, row-tile waits, next-layer readiness, queue
occupancy and live stage bytes in a separate trace. Test cold/mixed/all-hit
layers, skewed/low-occupancy routes and short/long scopes. Schedule-only arms
preserve shapes and require exact output/state/routing; numerical kernel arms
use the frozen numerical contract. Then perform untraced paired whole-request
A/B at matched memory. Combining individually winning candidates needs a further
combined A/B: two optimisations can remove the same wait or compete for the same
bandwidth. There is no supported universal speed multiplier yet.


### Validation contract

**Separate mechanism, correctness, memory and user latency.** Correctness, bounded memory and latency nonregression must pass before adoption. A memory/capacity optimization also needs a demonstrated resource benefit; a speed optimization needs an actual latency win. A byte reduction with unchanged latency is a mechanism result, not a user speedup. It may be retained for a declared memory/traffic benefit only after its costs pass; attribute the remaining critical path and record that limited outcome. Do not claim the byte model itself was
falsified merely because overlap or compute absorbed the gain.

* **Mechanism:** actual expert records and bytes, distinct IDs per layer/scope,
  duplicate fetches, resident copies, admission/churn, routed rows and actual
  scheduling dimensions. Exact repeatability applies to a pinned path and
  initial state; it is not guaranteed across numerical changes. Keep a
  routing-replay microbenchmark to isolate I/O from changes in the model's
  own routing. Never use replayed routing as a model-quality test.
* **Correctness:** distinguish byte-preserving changes from reassociation.
  Exact-preserving arms compare full outputs, state and routing; numerically
  different arms use frozen, same-shape reference/control logits and state
  tolerances plus task checks. Do not require identical expert records after a
  changed sum has perturbed later routers. Preserve exact independence from
  pool contents for a fixed computation path; memory residency is not a licence
  to change reduction order.
* **Memory:** untraced process lifetime peak plus current physical footprint,
  MLX active/cache diagnostics, retained-state capacities and allocation
  lifetimes. `ProcessMemory.peakResidentGB` combines lifetime `ru_maxrss` with
  current `phys_footprint`; it is not a resettable per-prefill peak. A decode or
  startup high-water can hide a prefill improvement. Fresh processes and
  phase attribution are both needed. `MemTrace` adds evals and resets MLX peaks;
  its results cannot stand in for the untraced memory or timing gate.
* **Latency:** request arrival → generation-lock acquisition → first token
  ready → first visible answer delta → completion. Also record prefill wall
  time, actual decode count/time and cancellation latency. Vision encoding is
  currently before the generator's prefill timer, and reasoning/special tokens
  need not produce a visible delta, so tok/s alone misses both costs.

The existing `sweep-check` requires exact repeatability and cold/warm pool
identity. Its logit threshold is `max(3 × measured control, 0.01)`, not the
historical 3.32% observation or 5.09% control. Freeze the unmodified control and
report observation, control and bound separately; do not let a modified control
widen its own allowance. Test full depth, more than one token position, early
and late QSA layers, and continuation state. The current short
`quality_probe.sh` prompts do not reliably execute the sweep; retain those
smoke checks and add frozen long prose/code/tool/retrieval cases that do.
A generated-text hash detects differences but cannot certify logits or state.

**A/B protocol.** One model process; explicit small memory sizes; current
reclaimable memory with several GB spare before each launch. Interleave at least
three paired A/B rounds with balanced order, not all A then all B. Two A/A
rounds are the minimum initial sanity check, not a reliable variance estimate;
repeat ambiguous cells rather than declaring a small difference real. Record
per-cell load and swap/pageout changes before and after, preserve invalid runs
with their reason, and report paired medians and spread. Trace runs are separate.

**Flag lifecycle.** The unified program's execution rules own this policy: typed, validated performance controls start default off, effective values enter every receipt, the verified control survives qualification and one release after adoption, and redundant experimental switches then disappear unless measured dispatch requires them. Correctness/reporting fixes do not retain a mode restoring the bug.

### Phase 0 — repair the instruments, then freeze the baseline

**0.1 Repair `Tools/prefill_bench.sh` before using it to accept anything.** Its
parser has been exercised, but its present implementation does not implement the
experiment promised here:

* Prose is `head -c 34000 PLAN.md`, which changes as this very plan is edited.
  Freeze a UTF-8 fixture and exact IDs; preserve the acceptance fixture too.
  Record raw/chat mode, template/thinking, tokenizer/checkpoint hashes, prompt
  hash, actual token count and ID hash. Do not rename a new fixture "10,490
  tokens" or "7,960 tokens" without checking. Command substitution strips final
  newlines; hash the exact bytes and IDs that reach the engine.
* Defaults omit 512 and 2048; the prose/acceptance × pool × chunk grid alone is
  not an A/B driver. The harness has one hardcoded binary and one global flag
  set, no arm manifest or within-cell A/B interleaving, no server cell, and no
  record-repeatability assertion. Implement these explicitly. Capture binary,
  source/dirty-tree, metallib and package hashes, effective flags, pool slots,
  cache limits, schedule, read scope, tile sizes, MTP and vision modes.
* Its availability formula sums inactive/speculative/purgeable pages and
  hardcodes 16 KiB; it differs from `Planner.deviceAvailableGB()` (free +
  purgeable + file-backed pages using the real page size). Use the canonical
  reading. Its `pool × 0.133 + 5.3 + 2` need estimate omits the forced chunk,
  prefix reservation and feature costs. `--experts-per-layer 13` is actually
  floored to 640 slots; explicit pools are not total-memory caps. Pin effective
  cache limits, charge overrides and check each arm, not just the nominal pool.
* A prefill-chunk environment override bypasses the plan's chunk while the
  printed expected peak and cache-cap selection still use the plan. Record both
  and price the effective arm. First use matched pools for causal attribution;
  then use matched total targets for the user-facing decision. Pool 20 does not
  represent a 16 GB target, so the proposed matrix cannot prove a 16 GB claim.
* Missing metrics become null and a failing child can be followed by a successful
  final script exit. Fail the run on missing required fields, nonzero status,
  token truncation or the wrong effective configuration. Preserve stdout/stderr
  and full output/token hashes; the current temporary directory is deleted.
  Serialize labels/paths as data rather than interpolating them into Python or
  handwritten JSON. Validate arguments and stop/clean up owned children on
  interruption. `pgrep` is advisory; the engine lock is the allocation guard.
* The CLI prints peak to 0.1 GB and timing splits to hundredths. Prefer structured
  unrounded stats, including request/phase labels. The current `compute_s`
  field must be renamed as residual until actual GPU timing exists. N-gram
  counters are reset at the prefill/decode boundary; expose both phases.
  A 48-token limit need not produce 48 tokens: record EOS and actual counts.
  Use a frozen teacher-forced decode suffix as an additional identical-work
  performance control, alongside free generation for quality.

**0.2 Instrument validation.** Repeat a small fresh-process cell with identical
IDs, effective settings and cold expert/prefix state. Verify repeatable routing
and fetch counts. Validate counters against the trace and record-byte arithmetic.
If they vary, inspect the counter, kernels and initial state; do not simply
replace them with noisy timing. Unit-test fixture identity, failure propagation,
parsing and the arm scheduler without loading the model. Attach phase, absolute
position and scope/tile IDs to router traces before changing loop order; the
current format infers passes from layer visitation and has no explicit phase.
Bound trace buffering and capture it separately from performance runs.

**0.3 Baseline matrix.** Freeze acceptance and ordinary prose first. Use matched
640-slot and 960-slot pools, chunks 256/512/1024/2048/4096 only where the arm
actually fits, MTP off and a fixed allocator/prefix policy. Begin with a small
screening subset; expand only candidates that survive it. Add true total-memory
8.1/10 GB and, on a sufficiently quiet machine, 16 GB acceptance cells. Include
one fresh `serve` cell and one controlled warm/prefix-hit cell. Extend the server
harness: `api_test.sh` alone is not the required metrics/cancellation experiment.
Do not compare a warm server with a cold CLI and call the difference an arm.

Record several lengths including 255/256/257, chunk−1/chunk/chunk+1, indexer
budget 2048±1, partial compression blocks, the 8,016 product boundary, and a
nonzero reused prefix. Cheap shape/state tests cover boundary combinatorics;
real model runs cover representative long cells. Test 8,192 then 16,384 then
32,768 progressively for any claimed long-context schedule. At the exact cap,
`Engine.generate` returns without prefill when no completion room remains:
measure full-cap prefill through `context-check`, and serving with prompt + reply
inside the cap. Never mistake an immediate cap response for a fast prefill.

**0.4 Shape probes and attribution.** Correct `PrefillProbe` before relying on
its numerical conclusions. Production router logits and softmax weights are
float32; bf16 expert output × float32 weights and the reduction are float32.
The old probe A explicitly converted weights to bf16, whereas B used the original
float weights, and its reported reference comparison did not apply the same
final cast to both outputs. Its 0.49–0.56% is synthetic expert-output spread,
not full-model logit spread. Thus "4× more accurate than shipped" and "shipped
sum is wrong" are unsupported. Memory results remain measurements of those
synthetic graphs, not a production saving. Probe PLE uses ordinary synthetic
matmuls rather than the production quantized projections; full PLE parity and
carry state remain gates. Its per-shape retained references and allocator state
also differ across arms; do not treat the printed peak difference as matched
process RSS. Record seeds correctly: constructing a random key
without installing or passing it does not seed the following draw.

Use identical tensors, production dtypes and final casts, fixed seeds and warmup,
separate memory/timing runs, equal retained references and clean allocator state.
Validate repeatability against fresh processes. Measure actual phase outputs and
carried state, and verify that a profiler/eval has not removed the allocation it
claims to attribute. Inspect the allocation plateau before presuming one of the
old synthetic savings will lower it.

**0.5 Storage and routing.** On a quiet machine capture the 51,200 / 819,200 /
2,764,800 / 26,214,400-byte read curve, QD and read-run distribution, and whether
`F_NOCACHE` actually succeeded. The present code ignores that fcntl return.
Re-anchor the 17.3 GB/s public claim only with comparable evidence and update
all of its surfaces. Trace actual prefill routing at 1024 and 4096, per-layer
unions, resident intersections, frequency and suffix frequency. Measure bytes,
read-call wall time, GPU time and overlap separately. These are baseline tasks,
not requirements to redo already closed cache-policy experiments.

### Phase 1 — bound retained state and local working memory

**1.0 Implement compact ownership before changing arithmetic.** `GDNLayer`
saves `convInput` tail slices, `PLELayer` saves `full` tail slices, and
`MTPHead.consume` returns a slice of `chunkMulti` after `eval(last)`.
Evaluation is not detachment. The later native intervention used the pinned
backend's `contiguous` copy behavior on retained GDN/PLE views and reduced
end-of-prefill MLX active allocation by 775,979,008 bytes at 1024 tokens and
1,551,892,480 bytes at 2048, with all final vocabulary logits byte-identical.
See [[sources/runs/2026/09/2026-09-04-first-principles-native-retention]].
This was a deterministic synthetic-ID prompt with a 640-slot pool and 512 MiB
MLX cache. It establishes allocation ownership and those final logits, not
all-state equality, MTP/vision coverage, a process-RSS saving or a speedup.

The pinned backend explicitly copies a contiguous view with an oversized
backing allocation; verify the primitive's ownership behavior rather than
assuming that either `eval` or a contiguity name detaches storage on every
backend. Put compact copies at the production lifetime boundary where the
parent's last necessary consumer has finished. Check GDN ssm outputs and sibling
graph lifetimes, PLE carry, MTP lastMulti and recording arrays after normal
prefill and rollback. Audit KV/indexer allocated capacity, not just offsets.
Measure retained bytes at layer end, request end and after prefix retention;
compare full outputs, state and routing before accepting the production patch.

At S=4096 the derived GDN parent term is about 3.02 GB across 36 layers, plus
PLE; that larger-shape total remains unmeasured. Confirm the real footprint and
feature combinations before repricing the planner. Increasing N without resolving
retention could multiply a small logical carry by sequence length and layer
count. Ownership fixes can recover capacity without changing the MoE reduction,
so they still go before the fold.

**1.1 Bound PLE and resident projections.** Tile PLE with its nine-row dilated
conv carry; slice n-gram history from the original scope with its preceding two
IDs, respecting EOS boundaries, and update the global history once. Do not
compute every tile from the final scope suffix. Quantized projection, norm,
gate and carry outputs must pass the production-shaped parity checks. Evaluate
bounded outputs before advancing and avoid collecting tile intermediates into
an ever-growing lazy graph. If production quantized dispatch changes rounding
when tiled, classify that arm as numerical and run the corresponding gates;
per-token mathematical independence does not prove bit identity. Include
hyper-connection norms/projections, GDN projections, shared experts and final mixer in the liveness inventory: bounding
only the three originally named transients is not a whole-layer memory proof.

**1.2 Stream indexer masks directly into attention.** Split projection/cache
update from mask calculation. Cache each new raw key once; pool and normalise
completed compression blocks once per layer/scope, preserving the partial tail.
For each query tile compute its causal block selection and immediately consume
it in SDPA, then release the mask. Concatenating bounded masks back into a full
`N × context` mask restores the original problem. Slice keys to the tile's
absolute causal end and preserve the own-block tail, ties and partial blocks.
Test cached offsets and the <=2048 dense path explicitly. Mask equivalence with
fixed q/k is a separate gate from projection and full-layer equivalence.

**1.3 Bound expert output with deterministic reduction.** The existing sweep
retains every group's output in `outs`, concatenates, gathers by `invOrder`,
then weights and reduces. Remove those whole-scope `N × K × H` lifetimes without
silently changing the computation according to cache contents.

The proposed scatter-add is a candidate, not the committed implementation:
duplicate token destinations use atomic addition in pinned MLX; float addition
order is not fixed by atomicity. Moreover the current sweep schedules resident
experts first. Accumulating in that visitation order makes arithmetic depend on
residency, even if every individual GEMM is identical. Test a deterministic
segmented reduction with a canonical per-token expert order and bounded workspace;
if necessary retain a bounded tile's K axis. Route I/O by residency but preserve
canonical compute/reduction order with bounded buffering. Prove buffer donation
or charge an old and new accumulator per update; `at.add` does not itself prove
an in-place operation. Maintain bounded double buffering rather than replacing
every overlap with a synchronous eval.

U1 above makes the reduction choice explicit: router-rank placement still owns the full K axis, and deterministic expert-order folding is a numerical alternative rather than the reference sum. Require production-dtype micro parity for exact arms, exact repeatability across runs and
cold/warm/admitted pools, and full-model logit/state checks. A changed but
accepted numerical algorithm can perturb later routing; measure that separately.
If the compact fold cannot satisfy the invariants, keep the canonical combine
and evaluate the full-layer weight workspace alternative in Phase 4. Do not
weaken exact residency independence to force the desired memory result.

**1.4 Capacity and reuse accounting.** Prefix retention must evict other entries
before a hit grows, not only before a miss: `PrefixCache.take` currently returns
a hit without applying `reserveTokens` to the remaining entries. Charge actual
KV/indexer capacity rounding, compact carry buffers, MTP state (currently not
fully included in bytesPerToken), and simultaneously retained conversations.
Exercise four conversations with auxiliary title/tool requests and a long growing
hit. Avoid double-charging the active context already in the fixed footprint.
Memory released by ownership fixes must be remeasured before enlarging any budget.

*Exit:* exact-preserving substeps have identical routing, state and outputs.
Numerical substeps meet the separately frozen bands and exact residency and
repeatability gates. At the matched 4096 cell, seek at least 0.5 GB less untraced
process peak or demonstrate a bounded transient beyond the old envelope without
claiming a peak reduction. A winning memory arm must pass the predeclared latency-nonregression limit and demonstrate its resource benefit; it need not wait for a later larger-scope speedup. The old scatter probe was slower in isolation and needs its own decision. The 0.5 GB figure is a proposed 4096-cell target, not a requirement imposed on smaller ownership-fix cells.

### Phase 2 — let a measured pass stay large

**2.0 Test the actual remaining tail before reducing its candidate size.** The
current `chunk(at:maxChunk:)` tests the full candidate against the query-key
limit; `Generate` only then clips it to remaining IDs. With maxChunk=4096 and
7960 new tokens, current passes are `[4096,2048,1816]`, although the actual
remaining 3864 fits: `3864 × 7960 = 30,757,440`, below `4096 × 8016`.
Tail-aware sizing permits `[4096,3864]` without raising that product bound.
This is a smaller independent experiment than a larger scope; preserve the
per-token/capacity budgets and the numerical rechunking contract. Implement one
shared remaining-aware schedule for generation, reporting and estimation, with
boundary, reused-prefix, sub-256 final-tail and no-completion-room cases. Do not
promise one-third less elapsed time merely because there are two rather than
three passes. The derivation is also recorded in
[[records/analyses/2026-09-04-first-principles-inference-audit]].

After Phase 1's liveness and memory gates, decouple the **outer scheduling cap**
from the **inner attention/indexer workspace budgets**. Today
`AttentionTuning.queryKeyBudget` aliases
`PrefillSchedule.measuredQueryKeyProduct`; raising that shared value raises
both limits and can leave blocking a no-op. Give the inner bounds independent,
measured values and assert they are actually engaged where the outer pass grows.

Re-anchor `prefillCostGB`, context-dependent workspace, prefix costs and
`estPrefillTokS` together from effective configurations. Re-evaluate the current
quarter-budget filter using measured request latency; do not blindly remove it.
The old flat/falling process peaks versus a linear activation model are a
question of liveness, allocator/cache policy and phase high-water, not proof
that either old measurement must be false.

Gate 25 → 8 passes only on a proven constant-4096 configuration at 32,768.
Other tiers get their own predicted schedules and observed record changes.
Measure the longest context whose behaviour is being changed, not merely 8k and
16k while claiming 32k. Preserve context ceilings until their own gates pass.
Keep matched-pool diagnostics separate from matched-total-memory release results.

Regenerate the entire estimator family: `MemoryPlan.expectedPeakGB`, planner
objective, CLI banner, `doctor` and its tier table, API plan JSON, context errors,
`prefill-schedule`, progress ETA, governor controls, measurements and claims.
Tests include tier monotonicity, effective overrides and shrinking/growing state.
The current objective assumes 2000 prompt + 400 reply tokens; test a long first
turn and short cached follow-ups as well. A faster prefill must not make the
common complete request slower by shrinking the decode pool too far.

### Phase 3 — independent request-behaviour fixes

**3.1 Tail scan resistance and decode admission.** A final pass shorter than
256 currently takes `cached/ensure`, ignores `admitOnSweep` and loads many
experts through the decode pool. Moving admission to the preceding sweep does
not solve that churn: the tail can evict what was just admitted. A nonzero
admission count is therefore an inadequate exit.

Compare (a) rebalancing the final two passes so both take the sweep where the
measured envelope allows, and (b) an explicit prefill-tail sweep mode with bounded
expert-row padding. Never pad actual model tokens to reach 256. Preserve the
cheap pool path for genuinely short requests and follow-ups; sweep selection
uses request/scope semantics, never residency. Both changes need numerical gates
because pool and sweep kernels differ. Measure post-prompt pool overlap with the
first fixed decode suffix, admissions, evictions, extra reads, first-token and
48-token decode time. Whole-prompt frequency is not necessarily a better predictor
than suffix frequency: compare current final-pass, suffix and scope-wide admission
from the same trace. Retain the fair quota and avoid eviction of unread residents.
Do not publish the old 24.7%/11.5% affected-length rates without an explicit
prompt-length distribution and actual schedule enumeration.

**3.2 Cancellation retains only a valid completed prefix.** Today early return
loses the state removed by `take`. At an existing full-stack pass boundary,
store exactly `promptIds.prefix(i)` with `state.tokenCount == i`, coherent
GDN/conv/PLE/KV/indexer/MTP offsets, and image segments whose starts precede i.
Retain the full digest metadata for a partly consumed image. Exclude future
images; otherwise `imagesAgree` can reject an otherwise valid shorter retry.
Always restore the allocator cap, `admitOnSweep`, pending I/O/admission state and
stats on every exit, including cancellation, via scoped cleanup.

The state must fit the existing retention budget: a 90%-complete long prompt
can exceed the floor tier's prefix limit, in which case dropping it is correct.
Do not invent rewind to trim GDN. Test cancellation before any work, between
passes, across an image run, with MTP and immediately before first generation.
An exactly full-prompt cache entry cannot hit the current strict-extend API;
retaining final logits or an earlier complete snapshot is a separate explicitly
budgeted extension, not something `store` alone fixes. Repeatability compares
identical resumed schedules first; if cancellation causes new batching, apply
the established rechunk band plus task quality, not universal text equality.

Phase 4 changes the safe boundary: after layer 10 of a scope, only ten layers
have consumed the new IDs. That state is **not a reusable token prefix**.
Checkpoint the previous committed whole-stack boundary, restore on mid-scope
cancel, and discard the unfinished activations; preserve the old boundary at
most, not the percentage printed by work progress. `StateCheckpoint` supplies
the starting machinery but its shared arrays, KV growth and lifetime cost need
validation. Do not allocate per-token GDN snapshots to save partially completed
layer-major work. Poll cancellation between bounded I/O groups/compute tiles;
wait for owned in-flight jobs before releasing buffers or the generation lock.

**3.3 Truthful progress and ETA.** Pass the absolute reused base position to
the estimator. Price a short pass with a measured fixed-overhead plus routed-set
curve, not `tail/full-pass-tok-s`; a tail neither pays zero overhead nor always
reads a full pass's experts. Under layer-major execution distinguish work
completed from tokens committed across all layers. Preserve existing progress
callback semantics and add a compatible stage/work event if needed. Include
startup/queue/vision in user wait reporting without relabelling them as prefill.

**3.4 Effective knob validation.** Refuse or clearly report sub-256 outer chunks
and mismatches across CLI/env/library paths. The schedule command accepts up to
65536 while `PrefillTuning` clamps the environment to 4096; distinguish a
hypothetical schedule from a measured supported runtime shape. Validate inner
query blocks separately, use overflow-safe arithmetic for tokens × context,
and never advertise an ignored override. No performance experiment is needed
to prove these validation/reporting fixes.

### Phase 4 — amortise expert reads across bounded computation

**Dependency:** instrument repair, ownership/capacity checks, and production
workspace/parity gates. Phase 2's new default is not a prerequisite: Phase 4 may
win directly with its own measured budgets. Pure Phase 3 fixes can land first;
compute probes in the alternatives section can run before the structural work.

`Model.hiddenStates` already visits layers in order within a call. Prefer an
internal scope-aware prefill entry point reusing those layer implementations,
not a second model implementation. Keep public `hiddenStates`, diagnostic hooks,
serving APIs and the independently usable CLI/library compatible.

```
for each new-token scope N, from the current committed prefix:
    save a bounded checkpoint; embed/splice this scope
    for layer L:
        run PLE/attention/recurrence/HC in chronological token tiles C
        materialise the scope's MoE input and required residual/injection data
        route those inputs, in bounded projection tiles if needed
        build the layer's canonical expert-row index over the whole scope
        for staged expert group G:
            obtain this group's once-read weights; optionally prefetch G+1
            for bounded routed-row tile R belonging to this group:
                compute grouped gate/up/down; reduce by the canonical policy
            release weights only after all their rows finish
        join bounded shared work submitted during I/O where useful
        finish residual work; materialise next-layer state (terminal demand per OPT35)
    consume final-layer multis through MTP in chronological tiles, if enabled
    commit the scope only when all main and MTP state is coherent
```

P1/P2 above define how bounded shared computation and next-group raw reads can
overlap this schedule without expanding the two-group weight budget. Their
timing benefit is independently gated; a synchronous control remains necessary.

The nesting of G **outside** R is essential: `for token tile { read experts }`
reintroduces rereads. All routes for layer L depend on its attention/HC output,
not directly on input IDs; they cannot be precomputed for later layers before
those outputs exist. The current router already runs once per pass: a scope-wide
router replaces those calls, not an inherently extra matmul. Bound its
`N × 512` f32 logits and retain only needed top-K IDs/weights once feasible.
Preserve the reference's full-precision routing and stable tie semantics.

**Rows, not just experts, must be bounded.** A group of 32 hot experts may own
most of `N × 10` assignments. Retaining all its x/g/u/down rows makes memory
scale with N despite bounded weight staging. Cap R independently, including
padding, output and combine workspace. Keep sorted indices and the pinned
MLX grouped-kernel conditions (at least 16 rows, four per staged expert).
Preserve a canonical computation independent of resident/missing groups. A row
cap changes dispatch/padding and cannot borrow the old parity result untested.

One concrete deterministic option is fixed ascending expert-ID groups containing
both resident and missing experts, assembled into canonical weight-row positions,
with segmented per-token sums in fixed expert-ID order. This is U1 arm B: deterministic and residency-independent, but not the current router-rank reduction and therefore separately numerical. The I/O assembly may
fetch/copy in a different order, but may not reorder reduction. Defer admission
until all resident weights that could be evicted have been consumed, or protect
those slots; if hot candidates must be retained for later admission, charge that
bounded weight buffer. Do not add a hidden reread at admission and still claim
the per-scope once-only bound. Compare the extra copy/segmentation cost with the
full-layer workspace before choosing this option.

**Memory ledger.** One bf16 hyper tensor is 20,480 bytes/token: 167.8 MB at
8192 or 671.1 MB at 32768. That is not the entire new footprint. A straightforward
schedule with two hyper buffers, bf16 x2 and an f32 accumulator already represents
56,320 bytes/token: 461.4 MB at 8192 and 1.845 GB at 32768, before routes,
injection weights, live tile temporaries, shared/GDN projections, masks, staging,
allocator cache, saved rollback state, KV growth, n-gram data and MTP/vision.
U1 requires adding the full N×K×H output axis if arm A retains it; the FP32 accumulator example is not proof that arm B preserves the reference sum. These are explicit-buffer arithmetic examples, not a required minimum or measured
peak; aliasing/reuse can change the ledger only when verified.

Document each buffer's dtype, size, owner, live interval, evaluation and copy
behaviour. Preallocate bounded outputs and prove writes do not copy an entire
scope/pool while an alias remains. Do not collect tile/group outputs and then
concatenate them into another full copy. Reserve rollback and prefix coexistence
before N is chosen. Explicitly budget indexer-cache and KV growth copies;
reserve capacity when the known scope size makes that cheaper and safe, and
never treat a large unused capacity as free. Select N from both target memory and live availability;
use smaller super-chunks when needed, account for their repeated expert scans,
and describe the actual bound. An N=old-pass fallback restores the old execution
path explicitly; merely using equal dimensions in a different algorithm does
not prove bit identity.

**State and feature coupling.** Step each GDN/conv/PLE tile in token order with
absolute offsets; update n-gram history exactly once per committed scope. Feed
MTP tiles only after final-layer multis exist, with previous multi shifted by one,
`mtp.offset == tokenCount - 1`, and aligned image splices. Budget its extra work
and retained multis. Vision runs remain absolute until each consuming tile clips
them; do not infer identity from placeholder IDs. Preserve tower/prefix reuse,
changed-image misses and multi-image tails. Keep speculative recording off during
ordinary prefill. Verify checkpoint/restore after failures in every layer family,
not only after a completed scope. Defer pool resizing to safe request boundaries;
under pressure, abort a bounded scope and recover a coherent state rather than
letting a waiting governor imply protection it cannot provide mid-request.

**Alternative workspace to compare before committing to a global fold.** Once
layer-major activations exist, a temporary workspace holding all *routed* weights
for one layer (at most 1.416 GB) allows chronological token tiles and the canonical
per-tile MoE combine. It can preserve more of the existing arithmetic while
reading each expert once. Fill it in bounded batches, without also keeping an
unbounded staging copy; charge it alongside the decode pool and activations.
It may be unsuitable at the floor but worthwhile at a larger tier. It does not
avoid the cross-layer activation frontier or permit a naive token-major loop to
reuse every layer's weights. Compare this against the small-G, expert-major
row-tiling approach on both latency and total peak before choosing per tier.

*Exit:* for a no-retry main-model sweep, no expert is fetched twice within a
layer/scope, and fetched records are at most scopes × 24,576, excluding explicitly
separated pool-tail/decode work. Freeze stronger fixture-specific ceilings from
real measurements, not arbitrary margins or promised 4×/2.5× ratios. Compare
Phase 4 against the accepted Phase 1/2 path as well as the original baseline so
earlier gains are not counted twice. Require a user-visible latency win past the
A/A spread, bounded peak at the true target, no material fixed-suffix decode
regression, all numerical/ownership/state gates, cold and warm server cells,
MTP/vision integration, cancellation recovery, and full acceptance. A conditional
win stays scoped to the configurations that passed.

### Other angles — ordered experiments, not unmeasured promises

This queue complements fewer reads. A small shape probe and a profile can change
its order; a faster isolated kernel still needs a full-request A/B before shipping.

| Candidate | Why the current code leaves room | Discriminating check / limitation |
|---|---|---|
| Compact carry ownership | Native 1024/2048-token intervention confirms oversized retained buffers | Phase 1.0; allocation savings and final-logit equality established, production state/features, process footprint and latency still to gate |
| Fused SDPA at head dimension 256 | Pinned MLX full-prefill fusion supports 64/80/128; this model uses 256 and materialises dense score intermediates | Prototype an exact-mask tiled online-softmax Metal kernel or a separately pinned upstream candidate; preserve 24-query/2-KV GQA, bf16 I/O, scale, RoPE and causal offsets; long-context parity/state and timing |
| Sparse execution of the existing QSA selection | Indexer retains about a 2048-key budget but downstream boolean-masked SDPA still attends over dense storage | Consume selected block IDs plus own-block tail directly, without a global boolean mask; canonical order, no duplicate keys, correct empty/partial causal sets; do not confuse computational sparsity with a new approximate attention policy |
| Chunk-parallel GDN prefill | Already parallel over heads/value rows, but sequential over T inside each workgroup | P5 derives and algebra-checks the block formulation; benchmark setup plus full GDN layer, fp32 state, long continuation, zero decay and Kahan-sensitive cases; retain decode/MTP paths initially |
| Bound/query-tile fusion before a new kernel | Indexer mask, SDPA, gate and projection are separate full-pass lifetimes | Stream mask → attention → output tile, hoist pooled keys once; prove the working set falls without additional rereads or enough launches to erase the saving |
| Persistent pooled indexer keys | `QSAIndexer` re-pools/norms/rotates all complete raw-key blocks on each invocation | Append only newly completed blocks; retain the incomplete tail; checkpoint/trim invalidates the right blocks; byte parity first, bounded additional cache second |
| GDN/resident projection fusion | inQKV/inZ/inA/inB and shared gate/up issue separate quantized projections over the same input | Test compatible concatenated projections or fused epilogues on the pinned kernels; charge extra/packed weights and do not silently change quantization groups |
| MoE gate/up fusion and row-index overhead | Each group gathers rows and runs gate/up separately, with CPU counting-sort and index uploads | Profile first; preserve `sortedIndices`, canonical ties and bounded R; a custom gather/SiLU/weighting epilogue may remove intermediates without changing expert bytes |
| Specialized bounded selection | Pinned Metal `argPartition` performs a full merge sort for router and indexer | OPT36 / U2; ordered router IDs and backend tie/exception semantics before memory or latency claims |
| Avoid unused final mixing | Intermediate `hiddenStates` calls evaluate the final mixer even when only cache state is needed; MTP needs multis but not every mixed row | Internal prefill API omits unused mixer work while preserving public return semantics; confirm MLX was actually evaluating the work before claiming a saving |
| Prune final-layer token-local work when MTP is off | The final QSA layer needs all K/V/indexer cache writes but only demanded queries and token-local MoE/residual/mixer outputs | OPT35 / U4; earlier layers and all terminal state updates remain complete, MTP/full-output hooks disable pruning, and removed terminal routes need explicit admission/decode checks; one-layer work, no universal multiplier |
| N-gram storage and assembly | CPU f32 row cache uses ~640 payload bytes per row for 160 bf16-rounded values; embedding reassembles a large Swift array | Packed bf16 cache/staging can halve payload, not necessarily total heap; exact dequant/EOS hashing and timing; separate prefetch I/O from CPU assembly |
| N-gram prefetch window | The 400,000-row cache cannot guarantee every row of a whole 32k scope remains resident after bulk prefetch | Keep a bounded window or request-local row arena, avoid evict-then-refetch; flatten/deduplicate in bounded storage; a fully unique 32k prompt can ask for >400k rows |
| Earlier exact n-gram reads | N-gram row IDs depend only on known prompt IDs and history, unlike future expert routes | Bounded prefetch before the PLE layer can overlap earlier compute; no concurrent unsynchronised dictionary writes; measure contention with expert I/O, not merely nominal overlap |
| Request-aware scope/pool trade | Planner assumes 2000 new prompt + 400 reply tokens even on a large prefix hit | Choose read scope after reuse is known while preserving the generation budget; compare TTFT and total request time across long-first-turn and short-tool-loop workloads |
| Temporary use of decode-pool headroom | Prefill and decode need different working sets | Only when measured beneficial: explicitly budget resize transients, avoid double allocation and charge later warmup; do not silently resize an explicit user pool |
| Exact prefix checkpoints | A later edit/retry can reuse only a saved whole-state prefix, not rewind GDN | A separately budgeted immutable checkpoint cache can save more work on branching prompts; exact token/image/model identity, copy-on-write cost and four-conversation retention; not required for N6 |
| Shared computation and bounded read-ahead | Shared work starts late; missing reads start after resident groups; future R tiling can expose new read bubbles | P1/P2 define one MLX owner plus raw-read workers, narrow completion events and bounded lifetime; exact schedule-only parity and next-layer readiness are gates |
| Adaptive I/O run formation | Excluding residents fragments runs; reading small gaps can trade a few extra bytes for fewer calls | Replay the actual scope trace on the target disk, record useful/read-amplified bytes and total latency; speculative extra reads are outside the 68 GB bound |

Three broader alternatives were considered too. **Activation spilling** can
trade bounded RAM for temporary I/O when a larger read scope cannot fit; it adds
reads and writes for every layer frontier and changes the storage bound. At a
32k bf16 hyper frontier, merely writing and rereading one 671 MB tensor over
48 layers is about 64.4 GB of extra traffic, before other intermediates. Compare
that concrete cost with smaller in-memory scopes first, and define cancellation,
cleanup and prompt-data handling before any implementation. **Cross-request
prefill batching** can share expert reads but replaces single-flight scheduling
with several independent state machines, queue fairness and memory reservations;
it is a separate serving proposal, not a free extension of N6. **Lower precision,
expert dropping, approximate routing or prompt compression** change the model
computation/content and need separate quality evidence; none may be hidden in an
exact execution optimisation. Changing the model/backend is outside this plan.

The fused-attention direction is informed by
[FlashAttention](https://arxiv.org/abs/2205.14135); the GDN direction by
[Gated Delta Networks](https://arxiv.org/abs/2412.06464). These papers establish
algorithmic alternatives, not Slotstream/Metal speedups. Do not replace the model
with DeltaNet-2 or another recurrence. Do not simply split 256 head dimensions
into independent 128-dimensional attentions: that changes softmax. The pinned
vector SDPA path supports dimension 256 only with additional sequence/GQA limits;
with a 12× GQA factor its `query_length × factor <= 32` condition permits at most
two queries. This is a small diagnostic alternative, not evidence that an
8-query block reaches fusion or is fast enough for prefill.

A faster storage path or a faster GEMM is no longer the only plausible next
step. The compute queue may dominate after read amortisation, and on a fast SSD
may be worthwhile before it. Use actual GDN/QSA/MoE timing to decide; do not
label the entire engine compute-bound by subtracting overlapping host counters.

### Phase 5 — optional record layout work, primarily decode

The nine-piece layout is three 819,200-byte weights and six 51,200-byte
scale/bias pieces, not nine equal ~307 KB reads. The historical run-length-1
ratio of ×1.94 is a read-path result; it is not a decode speedup. Using the old
44% read-time share as a non-overlapped Amdahl illustration gives about
`1 / (0.56 + 0.44/1.94) = 1.27×`, and even that is not a current prediction.
After Phase 4 changes run density, remeasure before deciding a repack is worth
its roughly 68 GB extra copy, conversion cost and persistent-format maintenance.

If pursued, derive the packed file from the pinned checkpoint with a manifest,
exact hashes, interruption-safe creation and a compatible original-layout
fallback. Keep expert values, routing and decode records/token unchanged. Seek
at least a 1.2× paired decode gain at the target configuration without a prefill
or peak regression; otherwise leave the existing format as default. Preserve
original checkpoint verification and downloads. An n-gram row repack is a
separate storage/custody cost; the tiny-read and packed-cache alternatives above
must be timed before declaring its remaining cost negligible.

### Acceptance and shipping checklist

| Stage | Must establish | Do not accept |
|---|---|---|
| 0 | Frozen fixtures/IDs and code, fail-closed harness, repeatable mechanism counters, genuine A/A and paired A/B, correct memory guard | Null fields, mutable prose, unloaded/cap-short-circuited serving results, mislabeled pools/targets or residual GPU time |
| 1.0/1.1 | Compact owned carry and bounded production PLE/resident work, exact state/output/routing for exact arms | An evaluated view counted as a compact allocation, synthetic-only parity or a traced peak used as an untraced one |
| 1.2/1.3 | Bounded mask-to-attention flow and expert-row/reduction workspace, preserved numerical and residency contracts | Full-mask concatenation, unbounded hot-group rows, atomic-order or resident-order dependence, historical synthetic spread called logit error |
| 1.4 | Active-plus-retained budgets hold on both cache hits and misses, including growth and enabled features | Charging token offsets as allocation capacities or relying on an old margin after expanding N |
| 2 | Remaining-aware schedule tested against the unchanged bound; measured effective schedule at each claimed tier/context, independent workspace bounds, consistent estimator family | Two-pass tail arithmetic called a speedup, 25→8 demanded at the floor, a shared threshold raised on both sides, or 16k evidence presented as a 32k gate |
| 3.1 | Tail no longer destroys useful decode warmth; fixed-suffix and full-request nonregression | Merely observing admission before the tail flushes the pool |
| 3.2 | Exact committed state retained when eligible, cleanup on every exit, bounded cancellation latency, repeated continuation valid | Partially advanced layer state cached as a token prefix, retention outside its budget or unconditional resumed text identity after rebatching |
| 3.3/3.4 | Base-aware honest progress, effective validated knobs, overflow-safe scheduling | Work-through-layers reported as fully committed tokens or unsupported settings shown as real configurations |
| 4 | Per-scope fetch uniqueness/bound, incremental and total latency gain, peak at matched total memory, complete request/feature gates | Bytes alone called speed; predecessor gains counted twice; unmeasured whole-prompt footprint |
| P1/P2/P3 overlap | Exact same-shape output/state/routing, ownership and cancellation closure, bounded total I/O/queues, earlier next-layer readiness and matched-memory full-request A/B | More threads or nominal overlap called a win, a worker blocked in global MLX eval, resident eviction changing arithmetic, or a GPU-in-use buffer recycled early |
| U1 reduction/workspace choice | Explicit A/B/C ledger, adversarial routing liveness, reference-order or declared numerical gate, matched-budget scope comparison | N×K×H placement called R-bounded, fixed expert order called the existing sum, or payload crossover called measured performance |
| OPT35/36 added work removal | Required state materialization, terminal MTP/diagnostic dispatch, exact ordered selection/ties and full-request checks | Lazy graph nodes counted as removed execution, unchanged set called unchanged router arithmetic, or CPU identity called GPU parity |
| P4/P5 compute alternatives | Complete-phase mechanism proof including preparation, long-context state/quality and full-request A/B | Synthetic FP64 algebra called production parity, ignored zero decay or a paper's CUDA/training result called a Metal inference improvement |
| 5 | Byte-preserving format, verified recovery/fallback, decode gain beyond noise and paid disk/memory cost | Read-layout microbenchmark ratio called an end-to-end gain |

Install a deterministic fixture-specific expert-read ceiling in `verify.sh`
after Phase 4 is measured, plus a structural per-layer/scope duplicate-fetch
assertion. Keep performance regressions in the controlled benchmark lane rather
than a noisy universal CI tok/s cutoff. Validate rejected controls, prefix reuse,
MTP, vision, HTTP disconnects and metadata responsiveness as well as numerical
checks. One `Tools/verify.sh` run at its small standard sizes is the final engine
acceptance; broader cases are justified by the specific changed paths above.

Update the canonical records and regenerate `PLAN.md`/`MEASUREMENTS.md` with
`Tools/projections.py`. Any earned public number moves its claim and all surfaces
in the same change; update `llms-full.txt` only when its source docs change.
Correct misleading code comments when their implementation phase lands, including
the old bf16-sum claim in derived prose, chunk equality, the supposedly detached
MTP slice, uniform expert coverage, equal-size record pieces, old sampler/rebuild
comments encountered in touched paths, and partial-pass ETA. Preserve immutable
source evidence and historical nulls; link corrections instead of rewriting runs.

The September 4 reviews leave **Phase 0 instrument repair, production integration
of the demonstrated Phase 1.0 ownership fix, and the remaining-aware tail schedule**
as the first implementation steps. Small P1/P2 overlap and P4/P5 attention/GDN
probes can proceed independently; measured exposed stalls determine which to
integrate next. The broad scope design remains the main read-reuse experiment.
The reviews do not mark an engine feature or speed claim delivered. Repeated
passes covered causal dependencies, resource contention, buffer ownership,
numerical contracts, zero-decay/partial-block cases, budget arithmetic and whether
each proposed gate can distinguish useful overlap from merely more concurrency.
