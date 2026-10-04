---
type: measurement
id: 01m3z6rmfcxgpkn96hyh2n903j
created: 2026-10-02T21:01:46.859947+00:00
updated: 2026-10-04T15:14:23.744580+00:00
summary: Pinned VQ inventories, authenticated native artifact reads and exact bounded complete-stack parity; no alternative pack or speed profile is qualified.
date: 2026-10-02
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1710'
runs: '[[sources/runs/2026/10/2026-10-02-quantization-native-screen]]'
title: Initial quantization screen and bounded native decoding
status: measured
---
The first implementation screen for [[records/plan/same-model-quantization-and-automatic-memory-2026-10-02]] establishes metadata geometry, bounded native row decoding and an existing-pack baseline. It does not qualify another pack, establish similar task quality, or achieve the proposed hardware-wide speed target.

### Evidence and method

- [[sources/runs/2026/10/2026-10-02-quantization-baseline-v1]] preserves three fresh-process runs of the installed v0.2.27 binary at a fixed 10 GB target, with a frozen short prompt, 128 greedy output tokens, 32,768-token context, automatic draft policy and vision disabled. The small plan did not enable MTP. The primary rate is `(N - 1) / sum(interTokenSeconds)`, preserving draft/verification work between committed emissions. Legacy `N / decodeSeconds` remains separately named.
- [[sources/references/2026/10/2026-10-02-vq-implementation-inventories]] preserves each candidate's own pinned config, source-runtime digest and complete shard-header inventory. Full weight payloads have not been downloaded or verified.
- [[sources/runs/2026/10/2026-10-02-quantization-native-screen]] preserves the bounded native checks, exact fetched row ranges, fixture hashes, final build identity and every kernel sample. VQ row bits match the separate scalar oracle. This does not establish fused-dot or full-model parity.

### Observations

The installed baseline's three primary committed rates were 8.50285, 8.45660 and 8.62913 tokens/s. Median: 8.50285. These are pilot observations for one short fixed-budget workload on the M5 Pro development Mac, not a replacement for the existing Auto-profile measurements. Process peak stayed below the declared target and generation endpoints were nominal. The original runner did not scrub or record ambient developer overrides; later validation confirms the preserved footprint and generator observations, but does not recover missing environment evidence. Host contention checks were endpoint snapshots. Do not promote these runs into a release qualification result.

The kernel screen executed both projection shapes, ten routed experts and one/four/thirty-two input-token rows. The affine arms used the same synthetic dense source; VQ arms used independent spread synthetic codes. All 48 cost cells completed within a 0.579 GB process-lifetime peak. There was no observed global paging or non-nominal sampled thermal/power state. Synchronization, host dispatch and evaluation are included; this is not isolated GPU kernel time.

At one input token, affine 4/3/2-bit medians were approximately 0.198/0.194/0.187 ms for the 640-by-2560 projection and 0.229/0.228/0.262 ms for the 2560-by-640 projection. Lower storage bits do not guarantee a faster operation. These small synthetic differences do not establish full-model gains or an optimal width.

The materialized VQ paths took approximately 0.790 to 0.989 ms in those one-token cells. They first expand selected weights, round to half, convert to BF16 and run a gathered matrix multiplication. That is a substantially more expensive bounded fallback than the affine operations in this screen. It is also a different arithmetic contract from the pinned upstream fused kernels. Do not adopt this materialized path for production decode or use its result to reject optimized fused VQ as a whole. Prefill needs a separate representative routing study.

### Implementation implications and remaining gates

`AffineQuantization` and `VQLayout` validate row sizes, packing, codebooks and checked byte arithmetic. The existing adapter now rejects inconsistent per-module descriptors before allocation; the production loader still admits only its existing affine layout. Mixed VQ record sizes and codebooks are recorded independently for each pinned pack, not inferred from advertised bits per weight.

The full-vocabulary pilot scorer verifies manifests, file hashes, context identity and complete vocabulary coverage, then reports KL(reference || other), top-1 agreement and paired case deltas. It has only deterministic instrument tests so far. No real candidate logits, task-quality scores, confidence intervals or quality qualification exist yet.

The next candidate integration must preserve the pinned fused-dot arithmetic, support mixed byte classes and bounded PLE decoding, and establish a memory-bounded reference execution path. Full model/logit parity and task evaluation precede any alternative pack selection, download activation or default promotion. Actual low-memory and 64 GB hardware still need their own runs. Reduced budgets on this Mac do not qualify other chips.
### Existing-path verification

[[sources/runs/2026/10/2026-10-02-quantization-foundation-verification]] preserves the full T0/T1 catalogue (92 passed, no failures or skips), historical first-two-layer parity, static suite and complete Mac app checks. Native memory UI checks passed in Light, Dark and System appearances. This is scoped acceptance of the implementation above, not the full release battery.

A separate real-model Mac app check passed lazy load, warm follow-up, a deferred 10-to-9 GB ceiling change, drained reload, an invalid saved 7 GB setting, automatic idle release despite that failed setting, and preservation of the draft and requested preference. The sampled process peak was 6.621959136 GB; released footprint was 0.636340312 GB; the slowest sampled metadata call took 0.0022507083194795996 seconds. Global swap-in/out counters stayed zero. These functional observations do not establish throughput eligibility. No new candidate was loaded.
### Full existing-engine acceptance and fused follow-up

[[sources/runs/2026/10/2026-10-02-full-engine-quantization-foundation]] records the complete existing-engine battery on the foundation build: 35 passed, zero failed. It includes current layer and draft references, byte equality through resizing and prefix/sweep paths, both governor drills, process-memory limits, context recall, streaming/tool/restart behavior and full vision serving. This supersedes the earlier statement that this battery had not yet run, only for that recorded foundation binary. The later experimental fused path has its own component checks and is not a qualified full-model path.

[[sources/runs/2026/10/2026-10-02-fused-vq-component-pilots]] records the native fused projection, the exact reviewed upstream Metal strings, source-bound builds and two cost pilots. All 78 selected-row cases match the Python MLX 0.32.2 binding bit for bit, across broadcast and per-expert inputs and both sides of the routed-pair dispatch boundary. They share the reviewed Metal implementation, so this checks bindings, packing, casts and dispatch rather than independently proving arithmetic. Constant-dot and invalid-index controls also pass. The final native catalogue reports 92 passed, zero failures or skips.

The first fused pilot included a redundant GPU bounds reduction in each call. The second prepares validated CPU routes and private index arrays before timing, which matches inference's requirement to know expert IDs before SSD reads. It still times casts, dispatch, evaluation and synchronization. The frozen pilots remain separate; this is not an interleaved before/after speedup study.

| One input token, ten routed experts | Affine 4-bit | Fused D8/K16384 | Fused D4/K2048 | Fused D4/K256 | Fused D2/K1024 | Fused D2/K256 |
| --- | --- | --- | --- | --- | --- | --- |
| Output 640, input 2560, milliseconds | 0.1995 | 0.2354 | 0.2271 | 0.2143 | 0.2602 | 0.2350 |
| Output 2560, input 640, milliseconds | 0.2078 | 0.2419 | 0.2115 | 0.2007 | 0.2198 | 0.2290 |

These second-pilot medians are much closer to the affine controls than the original materialization instrument. The process peak was 552,436,816 bytes and the internal thermal/power/paging eligibility checks passed. This keeps fused VQ worth testing with complete artifacts; it does not establish model quality, SSD savings, end-to-end throughput or a 20-token profile. No candidate weights were activated, and no full candidate artifact has been downloaded.

The pinned D8 runtime changes reduction at its routed-pair boundary, so full draft verification must not assume one-row arithmetic is preserved. Native cache residency must also not alter dispatch. The next substantive dependency is a bounded full-model reference, including quantized PLE rows: the inspected upstream `ple_stream` helper only streams F16/BF16 `.weight` shards and explicitly leaves VQ `.codes` shards resident. Full reference parity, mixed allocation ownership, held-out quality and actual hardware evidence remain open.

### Bounded full reference and native PLE follow-up

[[sources/runs/2026/10/2026-10-02-bounded-vq-reference-and-ple]] supersedes the absence statements above for the VQ 3.2 payload and bounded reference execution. All 139 tensor files, 76,976,259,433 bytes, were staged and checked against the pinned complete-file map. Every reference run rehashed them independently. This is an experimental local artifact, not a supported installation.

The corrected first-four-layer traversal proof compares ordinary chunk-major execution and one-layer-at-a-time execution on 513 token IDs, including EOS boundaries and both recurrent and attention layers. Mixer output bits match exactly. The proof explicitly fixes the reference decoded-expert chunk to 32 and binds the architecture, runtime, local instrument and installed library bytes. Earlier failed or incompletely pinned attempts remain in the source.

Two complete 48-layer VQ 3.2 forwards then succeeded. The six-token input produced six full-vocabulary rows with a 3,033,779,056-byte process lifetime peak. The 513-token input produced the final sixteen full-vocabulary rows with a 3,231,369,376-byte process lifetime peak. These are instrument feasibility and memory results, not native full-model parity, complete-task quality or generation speed. The reference materializes one layer at a time and streams quantized PLE rows; it is not the product expert cache.

The Python PLE storage check passed all twelve real-fixture cases bit for bit against both the resident upstream PLE class and the independent scalar product oracle, with a 27,616,240-byte MLX peak. The native CPU PLE reader separately passes 49 storage/failure assertions and twelve real row-request comparisons across the three inspected layouts. It preserves duplicate order, checks requests before reading, discards incomplete results, and reproduces F16 multiplication followed by BF16 conversion. Its codebook representation and bounded call workspace still need to enter the eventual pack resource ledger; it is not wired into the product NgramStore.

The native baseline logit exporter preserves full head batches before selecting rows. The six-token and 513-token functional runs completed under external memory/pressure supervision, with native lifetime peaks of 4,643,262,304 and 6,183,357,608 bytes respectively. These outputs are numerical fixtures, not held-out quality examples. The baseline exporter and reference produce raw receipts; the full-vocabulary scorer still requires explicit compatible artifact and preprocessing identities.

[[sources/references/2026/10/2026-10-02-vq-tokenizer-compatibility]] records a material integration constraint: the pinned VQ bundles have a different tokenizer pre-tokenizer/decoder configuration. Their vocabulary, added-token mapping and normalized ordered merges match the original, but a direct Hindi example yields different token IDs. The original tokenizer and chat template match the deployed baseline. Controlled comparisons therefore explicitly freeze the original tokenizer and identical token contexts across arms. Do not replace candidate files silently or describe their supplied tokenizers as identical.

The original model's complete visible history has one unchanged non-README payload map across three revisions. Both derivative cards declare that original model. Using its immutable current revision as the comparison's original-checkpoint identity is a documented lineage inference, not an independently replayed quantization conversion. Product qualification must name the exact chosen tokenizer/template and retain multilingual checks.

The six-case owned raw-continuation protocol is frozen in `bench/quantization/logit-pilot-v1.json`. It includes prose, code, tool-result context, multilingual text, continuation and record retrieval; it is a distribution pilot, not a held-out agent benchmark. Native and VQ producers run sequentially with bounded memory and complete logit rows. Current performance claims, supported weight selection and defaults are unchanged. Full native VQ model parity, mixed allocation ownership, draft integration, held-out tasks, paired speed measurements and actual hardware qualification remain open.
The bounded reference/PLE implementation additionally passed the complete static gates and all 93 native t0/t1 catalogue checks, with zero failures or skips. The first static attempt was invalidated by an in-flight edit to its test driver; the unchanged-driver rerun passed. Both attempts and the source-bound catalogue summary are retained in [[sources/runs/2026/10/2026-10-02-bounded-reference-verification]].

### Reference normalization correction

[[sources/runs/2026/10/2026-10-02-vq-pilot-normalization-diagnosis]] records the completed first matched pilot and its invalidation. Both VQ arms omitted the raw-norm +1 conversion required by the pinned architecture. Strict loading, finite outputs and direct-versus-streamed equality did not detect this shared semantic error. The old VQ feasibility runs and traversal proofs above establish resource feasibility only; they do not establish correctly normalized model outputs. The native affine outputs and isolated PLE/fused kernel checks are unaffected.

The complete 4.4 artifact is now verified: 139 tensor files, 103,689,541,903 bytes. An independent bounded read of all 148 affected norm tensors in each VQ pack found that BF16 rounding of 1 + raw value reproduces every corresponding baseline tensor exactly. Gated delta-net normalization stays unchanged. The reference loader now makes this pinned artifact conversion explicit and records its normalization identity; the comparison adapter rejects old producer receipts. Fresh traversal proofs and VQ pilot outputs are required. None of the first pilot's apparent KL advantage is valid quality evidence.

### Corrected matched distribution pilot

[[sources/runs/2026/10/2026-10-02-corrected-vq-distribution-pilot]] records fresh exact traversal proofs and both repeated VQ arms. All six contexts completed in each arm with the explicit raw-norm adapter; the unchanged native baseline outputs were reused. The normalization repair changes reference meaning, so these results replace the invalid comparison rather than combine with it.

| Owned pilot context | Native affine KL to VQ 4.4, nats | VQ 3.2 KL to VQ 4.4, nats | Native top-1 agreement | VQ 3.2 top-1 agreement |
| --- | --- | --- | --- | --- |
| memory-prose | 0.224397 | 0.047676 | 0.8125 | 0.8125 |
| python-interval | 0.366843 | 0.172623 | 0.7500 | 0.8125 |
| tool-result | 0.764051 | 0.440440 | 0.7500 | 0.8750 |
| multilingual | 0.343711 | 0.171254 | 0.8750 | 0.8125 |
| continuation | 0.715288 | 0.036532 | 0.8125 | 1.0000 |
| record-retrieval | 0.249774 | 0.113896 | 0.7500 | 0.7500 |

Equal-case mean full-vocabulary KL is 0.44401073962586735 for the deployed native baseline and 0.16373688672074593 for VQ 3.2. Mean top-1 agreement is 0.7916666666666666 and 0.84375 respectively. The candidate has lower KL in every context, better top-1 agreement in three, equal agreement in two and worse agreement in the multilingual context. This supports continuing candidate engineering, not declaring similar task quality.

Each context contributes its last sixteen teacher-forced positions; these are correlated owned pilot examples. There is no held-out confidence interval, real tool execution, long-context qualification, vision or draft evaluation. The VQ 4.4 arm is a quantized proxy, and the baseline and VQ arms also differ in their complete native/reference implementations, so this does not isolate weight quantization alone. Native full-model parity and complete-task evaluation remain mandatory. No speed was measured or pack promoted.


### Complete native expert records and ownership

[[sources/runs/2026/10/2026-10-02-native-vq-complete-records]] extends selected-row kernel checks to complete real gate/up/down matrices and the pinned compiled SwiGLU composition. Both packs pass exact output-bit comparisons for layers 0 and 2, expert IDs 0, 1, 7 and 511, and one, two and three token rows with ten routes each. Duplicate routes preserve their order. These real layouts do not contain D8; its dispatch boundary remains covered by the separate fused fixtures. The fixed routes do not test the model router, shared expert or full-model behavior.

The immutable staging batch admits only complete unique expert records. Its allocation-class key includes all three projection layouts; equal byte counts alone cannot make two banks interchangeable. Shared codebooks are counted separately. Review found that retaining mutable MLXArray objects did not protect admitted weights from caller-side context replacement. The v2 implementation keeps private array contexts, and independent mutation of each caller-owned codes, books and scales group preserves the expected outputs. This establishes value retention, not leases or pins for externally reused mutable cache memory.

Both final native record checks pass 34 assertions, alongside the geometry, metadata and PLE storage checks. The final source-bound catalogue passes 93 checks with zero failures or skips, and the static suite passes. The recorded binaries and full outputs remain in the raw source. No full native candidate model, mixed mutable cache, draft integration, task-quality result or throughput profile is qualified by this checkpoint.


### Native dense-block candidate profile

[[sources/runs/2026/10/2026-10-02-native-vq-trunk-profile]] establishes exact first-block parity under an explicit candidate arithmetic profile. The reference exports the real first linear-attention block and hyper-connection, with corrected folded norms, from both completely verified artifacts. Their complete fixtures are byte-identical. Native checks cover one, three and seventeen BF16 token rows, a subsequent continuation, retained convolution windows, FP32 recurrent state and non-mutating readout. All 75 trunk assertions pass. This does not cover the full candidate layer stack, QSA/PLE integration or speculative state recording.

The first native attempt matched the hyper-connection outputs but failed recurrence-state bits and longer outputs. The final candidate profile matches the pinned reference's ordinary reduction, compiled decay and BF16 beta; the deployed kernel retains its compensated reduction and existing arithmetic. Grouped RMS and recurrent query/key normalization also follow the explicit candidate profile, and the candidate hyper-connection supports its quantized injection projection. The Swift binding's documented mlxNone context maps to the exact absent RMS weight in the C API. The failed attempts remain in the source, including a pre-allocation concurrency refusal and a repaired reference tuple-unpacking error.

The final native binary is `4d07c1c6c8e629365b7415225dc45dc6ec83f7c1ac1e216fe177be90b5f8cd59`. A complete 48-layer forward on the unchanged memory-prose pilot IDs reproduces the previous deployed native logit SHA exactly: `7c2b5b7b78e507d28d3ca85b2e10a32519f0ebd7d67adb20b489bf6479e92f32`. This checks compatibility on that one case; it does not replace the complete existing-engine release battery or establish candidate quality. The catalogue passes 93 checks, with zero failures or skips, and the static suite passes. Candidate full-model checkpoint loading, mixed mutable caching, PLE/draft integration and all release qualification gates remain open.


### Native owned tensor-file primitive

[[sources/runs/2026/10/2026-10-02-native-vq-owned-file-reader]] records the bounded native file reader needed by direct candidate loading. Its constructor verifies the complete payload through the descriptor it retains for later reads; its caller must separately authenticate the supplied file/header identities against a pinned pack manifest. Reads check tensor extents, cancellation and unchanged file metadata, with bounded allocations and syscalls. The tests preserve the distinction between owning a verified descriptor and following a replaceable filesystem path.

All 34 storage assertions pass, covering cancellation, complete-file corruption, truncation, path reuse, lifetime retention, malformed extents, non-regular files and tensor coverage. The final catalogue passes 94 checks with zero failures or skips. This is a synthetic storage gate, not actual VQ artifact integration, model parity, asynchronous pool ownership or performance. The preceding trunk-profile static result is not presented as a fresh static run for this storage addition.

### Authenticated artifact reads and short complete-stack parity

[[sources/runs/2026/10/2026-10-02-native-vq-authenticated-checkpoint]] records direct native loading from both pinned artifact inventories. Config/index bytes and the complete-file digest map are authenticated before data access. Demanded files are independently verified through retained descriptors; bounded selected expert and PLE reads match their existing fixtures. Counters describe demanded files, not a native read of every unused payload. Draft metadata remains independent and its tensors are excluded from this main-model probe.

[[sources/runs/2026/10/2026-10-02-native-vq-complete-stack-smoke]] records a fixed three-token pass containing EOS and a subsequent one-token continuation. Both VQ 3.2 and 4.4 match all 320 observed boundaries exactly: hidden states through 48 layers, convolution/recurrent state, PLE convolution, QSA keys/values and raw indexer state, final mixer and complete vocabulary logits. Sampled native physical peaks were 1,926,531,184 and 2,003,257,576 bytes respectively; the functional harness enforced its separate process and actual-headroom bounds. Wall times include authentication and reads and are not committed-token throughput evidence. Global paging counters are retained as diagnostics.

The first three native attempts failed at the first QSA layer. [[sources/runs/2026/10/2026-10-02-vq-bf16-sigmoid-arithmetic]] shows identical preceding hyper-connection intermediates and a BF16 sigmoid difference at input -6.84375. Explicit precise exponential and BF16 intermediate rounding match all 65,280 finite BF16 input patterns against the pinned Python GPU output. This is an observed arithmetic contract; an exact compiler-level root cause is not established. Only the candidate profile uses this operation. FP32 sigmoid and deployed model arithmetic remain unchanged.

The native exhaustive diagnostic initially failed because a scalar test literal inferred FP64, which the GPU does not support. The first crash's accessor hypothesis was incorrect; subsequent explicit evaluation exposed the actual error. Those failures stay attached and separate from the passing v4 complete-stack engine. The final test uses an explicit Float literal.

This advances step 4 without completing it. Ordinary prefill batch sizes, sparse indexer activation, native generated sequences, mutable cache pins and resize/late-I/O ownership, draft/rollback, vision, held-out task quality and speed remain unqualified. The observed four tokens cannot justify a production pack or a 20-token claim.

[[sources/runs/2026/10/2026-10-02-native-vq-complete-stack-validation]] records the repaired exhaustive sigmoid gate, all 95 native T0/T1 checks passing with no skips, unchanged deployed full-model logit bits on the fixed memory-prose case, fresh baseline payload verification and six metadata rejection cases. The v7 inference sources are identical to the independently passing v4 complete-stack sources; only the diagnostic input/readback file differs. These checks do not replace the complete heavyweight app, governor and hardware qualification gates.

The frozen v7 complete static suite also passes in [[sources/runs/2026/10/2026-10-02-native-vq-complete-stack-static]], including planner, memory-override, transport and installer gates. The first attempt stopped on a source-wrapper token list interpreted as a wiki-link; the authored wrapper was corrected without changing its raw transcripts. This result applies to the authenticated short-stack checkpoint, before subsequent batched-route changes.

### Partitioned fused-route checkpoint

[[sources/runs/2026/10/2026-10-02-native-vq-partitioned-route-parity]] records bounded complete-record partitions with explicit original-batch arithmetic dispatch. Small local partitions cannot accidentally change the D8 reduction method. The component gates compare exact projection bits across the dispatch boundary, then exact complete SwiGLU at capacities of one, two, three and thirty-two experts, including duplicate routes and restored pair order.

Both pinned packs retain exact original short-stack outputs and pass a new eight-token pass plus three-token continuation through all 320 observed hidden/state/logit boundaries. Each larger run exercises two staging partitions and at most 32 live expert records per batch. All 95 native catalogue checks pass without skips. The source, artifact and reference identities are frozen. Compilation and these numerical/ownership checks cover this increment; the preceding full static suite is not claimed as freshly rerun.

This is synchronous immutable staging. It does not supply persistent residency, mutable cache pins, asynchronous generation fences, resize accounting or a production memory governor. The larger-batch upstream prefill path beyond 4,096 routed pairs remains a separate implementation/parity gate. Eleven functional tokens do not establish task quality, latency or committed generation speed.

### Segmented prefill component checkpoint

[[sources/runs/2026/10/2026-10-02-native-vq-segmented-prefill]] records the pinned large-prefill dispatch audit and exact native expert composition for both packs at 410 and 512 prompt rows. The actual default is fused segmented GEMM, with recorded kernel flags and executed variant names. The reference's fixed decoded-expert chunk of 32 affects only its fallback; it is not evidence that the admitted large-prefill path materializes decoded matrices. No prior measured outputs are retracted by this dispatch clarification.

The native wrapper uses the exact reviewed segmented kernel and its preprocessor specialization, preserves complete expert token segments across storage partitions, and restores routing order. Sixty-four real experts with skewed routes exercise two staging batches, partial tiles and both codebook placements. Complete SwiGLU outputs match exactly in both inspected layer families and both packs. All 95 native catalogue checks and the reference/source unit checks pass. These are component results with bounded process-memory supervision, not full-model prefill or timing qualification. Full-model attention, PLE and recurrent state at these batch sizes are the next parity gate; mutable residency, native generation, quality and speed remain open.

### Complete native prefill and rotary follow-up

[[sources/runs/2026/10/2026-10-02-native-vq-complete-prefill]] records both packs passing the fixed prefill512-decode1-v1 profile. Each performs a 512-token pass and one continuation using retained state. All 320 boundaries match exact complete logical bytes, including full-vocabulary logits computed at the original pass shape. Every layer executes segmented prefill. Both runs reach eleven record-staging batches within a layer while retaining at most 32 expert records per batch. Native process peaks are 3,069,757,840 bytes for VQ 3.2 and 3,082,111,328 bytes for VQ 4.4, within the frozen 4 GB diagnostic bound. Global swap counters remain diagnostic; this is not a clean-timing result.

The native readers independently verify 137 demanded files, totaling 73,780,799,521 and 100,494,081,991 bytes respectively. This is not a claim that unused optional files were opened. The reference producer independently verifies the complete artifact map. The low diagnostic footprint comes from releasing dense blocks and expert staging; it is not a production memory minimum. All 95 native T0/T1 checks pass with no skips.

[[sources/runs/2026/10/2026-10-02-vq-prefill-rotary-arithmetic]] retains the failed native attempts. The first mismatch occurs at QSA layer three after three exact layers. Its preceding projection and normalization intermediates agree. The native inverse-frequency vector differs at 23 of 32 FP32 entries and matches a fast Metal power probe exactly. Precise power matches the pinned Python vector, and the repaired candidate's frequency vector plus all first-512-position FP32 sine/cosine bits pass their dedicated checks. A preliminary microscope script failed on an unsupported array.repeat method before its GPU experiment; its corrected successor and the failed transcript are retained. The deployed rotary path remains unchanged.

This completes the bounded ordinary-prefill numerical checkpoint. It does not establish generated sequences, longer-context sparse selection, mutable expert residency, live governance, draft or vision behavior, held-out quality or committed generation speed. Those gates remain open.

[[sources/runs/2026/10/2026-10-03-native-vq-prefill-validation]] records the complete static suite passing on this frozen corrected prefill binary, including 420 memory-override cases, planner, transport and installer checks. Eight malformed full-prefill manifests are rejected before execution. Fresh original-pack verification succeeds, and its frozen complete-vocabulary memory-prose logit bits remain unchanged. This is scoped regression evidence, not candidate app/governor, quality or speed qualification.

### Native autoregressive numerical follow-up

[[sources/runs/2026/10/2026-10-03-native-vq-greedy-parity]] records the frozen greedy16-memory-explanation-v1 profile for both pinned packs. A 44-token owned literal continuation is encoded with the original tokenizer. Each reference and native implementation independently selects and feeds back sixteen argmax tokens, with the final sampled token left unconsumed. The native sequences and all 2,560 complete tensor boundaries per pack match exactly, including retained state and complete-vocabulary logits. Both finish at the length cap with 59 consumed tokens. Real sampled EOS termination is not exercised.

Native process peaks are 1,881,000,024 bytes for VQ 3.2 and 1,849,722,944 bytes for VQ 4.4. Each uses up to seven staging batches in a layer and at most 32 live immutable expert records per batch. These are streamed diagnostic peaks, not production resident-memory floors or speed measurements. The corresponding Python process peaks are 2,783,791,960 and 2,943,159,272 bytes. Every run remains within its declared 4 GB bound.

Twelve metadata/chain/stop/CLI rejection cases and all 95 native T0/T1 checks pass without skips. The build comparison binds unchanged engine inference sources to the prior fully validated prefill build; only the diagnostic and CLI dispatch change. Compilation, exact generation, refusal checks and the native catalogue cover this increment. No new full static, app, governor, vision or hardware qualification is claimed. Persistent caches, sparse long-context selection, draft, held-out quality and complete-configuration performance remain required.


### Sparse-selection checkpoint, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-sparse-selection]] records both packs passing the fixed 2053-token prefill plus one-token continuation. All 984 complete output/state boundaries agree with the independent reference, including the 24 actual Boolean sparse masks. Four large passes exercise segmented expert staging, and the final short pass and decode cross the selection threshold and partial block. This does not qualify the entire supported context range.

The native peaks are 3,136,752,112 bytes for VQ 3.2 and 3,130,771,904 bytes for VQ 4.4, within the 4 GB diagnostic process bound. All eight malformed-fixture cases and 95 native checks pass, alongside the five reference unit tests. Global swap counters are retained as diagnostics, with no clean timing claim. These bounds describe the one-layer-at-a-time probe, not a production resident-memory floor. Mutable caching, production generation, draft, vision, held-out task quality and complete-configuration speed remain required.


### Resident-bank component checkpoint, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-resident-bank-component]] records synchronous mutable bank ownership for one complete-record allocation class. Separate contiguous backing allocations are validated before direct writes. Complete demanded sets are pinned before CLOCK replacement, publication follows all six checked pieces, and GPU completion precedes pin release. The inspected layers match the independent expert-output fixtures across cold/hot access and eviction. Coverage correction: the old 4.4 fixtures selected two layers from the same allocation class; see the audit below. Partial reads, cancellation, malformed pieces and reentrant clearing are refused, with retries and retained-output independence checked.

Both packs pass all 244 complete-record checks, including the earlier composition/partition cases. Both segmented-prefill component fixtures and both full-model 16-step greedy regressions pass after sharing the projection composition. Those model runs still use immutable staging: this is not model-wide cache qualification. The bounded bank admits one to thirty-two records and has no asynchronous prefetch, resize or governor integration. Twelve malformed greedy manifests and all 95 native catalogue checks pass. Larger mixed-class residency, byte budgeting, complete-model cache wiring, draft, vision, quality and speed remain open.


### Rotary coefficient portability correction, October 3

[[sources/runs/2026/10/2026-10-03-vq-rotary-coefficients-and-ci-portability]] records main CI run 37098784524 failing the rotary digest checks in ordinary and instrumented catalogues. The M5 Pro measurements remain valid on their recorded machine; Metal precise power did not reproduce their inverse-frequency bits on the CI runner. The other 94 catalogue checks and public-library job passed. This is a reproduced portability failure, not a waived check.

The candidate now stores the 32 FP32 inverse-frequency words extracted byte-for-byte from the verified independent Python fixture. The table is restricted to the pinned dimension 64 and base 10,000,000. The deployed public rotary constructor is unchanged. All expected hashes remain unchanged: this removes GPU power from coefficient construction without relaxing comparison or claiming correctly rounded mathematical power.

On the corrected local binary, the frequency/angle digests, both 984-boundary sparse model profiles, all 95 native catalogue checks and the complete static suite pass. Static validation includes 420 memory-override cases, 97 planner checks, transport and installer gates. Bank/projection sources are unchanged from the preceding component and greedy validation binary. Remote requalification is pending at this capture; local success does not establish universal GPU arithmetic or declare the original CI failure remotely resolved.


### Component coverage correction, October 3

[[sources/runs/2026/10/2026-10-03-vq-allocation-class-coverage-correction]] withdraws the claim that the earlier real expert components exercised both allocation classes in each pack. Layers 0 and 2 span both VQ 3.2 classes, but share one VQ 4.4 class. VQ 4.4 requires layer 3 as the second representative. The earlier complete-record, segmented-prefill and resident-bank component results remain valid for their actual recorded layers. Full-model runs independently covered all 48 layers and remain valid.

The artifact-bound geometry audit records the layer assignments and complete record sizes. The new allocation-classes-v1 fixture mode selects one real representative of each descriptor triple and requires the native checker to confirm two distinct classes. New fixture outcomes are separate evidence; the audit itself is not new numerical or performance qualification.

### Fixed mixed-class cache checkpoint, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-fixed-record-cache]] records both packs passing complete-model numerical checks with synchronous resident expert banks. Each validated allocation class has 96 physical rows and layer codebooks are retained once. Both 16-step greedy profiles match all 2,560 boundaries; both sparse profiles match all 984 boundaries. Hits and CLOCK evictions occur, and every pin is released. All runs remain within the 4 GB diagnostic process bound. The dense trunk remains streamed one layer at a time and large prefill uses separate immutable sweep staging, so these peaks are not production resident floors.

New artifact-bound component fixtures cover both actual descriptor classes in each pack, including the corrected VQ 4.4 representative layer 3. Real-output checks exercise every physical bank row, with hot boundary-slot reads forbidden. Nine malformed coverage/identity/layer or cache-mode cases are refused, and all 95 local native catalogue checks pass. This does not resolve the separately observed remote rotary arithmetic issue. Larger effective caches, asynchronous ownership, resident trunk, draft, vision, held-out quality and complete-configuration speed remain open. No candidate is admitted to production or Auto.

### Exact finite rotary table checkpoint, October 3

[[sources/runs/2026/10/2026-10-03-vq-finite-rotary-table-portability]] records a second remote arithmetic failure: CI run 37101921994 agrees on the pinned inverse frequencies but differs on sine/cosine FP32 values. Host-double trigonometry was investigated and rejected because one unique admitted sine coefficient crosses a BF16 rounding boundary. Neither numerical tolerance nor existing golden changed.

The candidate now embeds the complete 525,824-byte FP32 angle table from the pinned independent reference for positions 0 through 2053. Duplicate halves are reconstructed exactly. Both the generator and native reader bind its frozen digest, and requests outside that bounded research horizon are refused. This is a finite coefficient artifact, not a production context policy or universal transcendental function. The public rotary path is unchanged.

All original inverse-frequency and 512-row FP32 digests pass, along with new whole-horizon and final-stride checks. Both packs preserve all 16 greedy tokens and 2,560 boundaries and all 984 sparse boundaries with resident expert caching. All 95 local native catalogue checks pass. The complete static suite passes after correcting its synthetic tool registry to include the new table-source suite; the initial harness failure is preserved. Remote requalification remains pending at this capture. The table does not establish full-model portability on other GPUs or admit a candidate to production, Auto, quality or speed qualification.

### Resident text checkpoint, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-resident-text]] records both packs retaining all 50 text-weight families, a 5,318,309,400-byte payload, alongside the fixed expert banks. Loading separately prices the largest 635,699,200-byte copy, checks real incremental headroom and refuses an undersized budget before payload reads. No partial owner is published.

Both packs match all 16 greedy tokens and 2,560 full boundaries, and all 984 sparse boundaries. Physical peaks are 6,922,458,728 and 8,193,513,112 bytes for the VQ 3.2 greedy and sparse profiles, and 7,055,021,720 and 8,347,375,328 bytes for VQ 4.4. All fit the explicit 10 GB diagnostic process bound. These are measured configurations with small fixed banks, not an automatic production ceiling or speed qualification. The default streamed-text regression remains exact within its original bound, and all 95 native catalogue checks pass.

The new eight-case CLI test supplies every required argument and matches the actual mode-validation error. It corrects a coverage gap in the earlier cache test: three cases omitted required arguments and therefore did not reach the intended mode guard. The old six coverage/identity/layer metadata refusals remain valid. Twelve malformed greedy manifests also pass their refusal checks. The preceding full static run is preserved as prior evidence, not claimed as newly rerun for this increment.

Useful larger expert-cache capacity, asynchronous ownership, PLE caching/read parallelism, production generation and governor integration, draft, vision, held-out quality and speed remain open. No candidate is activated or admitted to Auto.

### Larger fixed-cache checkpoint, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-wide-record-cache]] records a second fixed research layout: 512 rows for the class used by forty-one/forty-two layers and 96 for the smaller class. The whole cache/book reservation is bounded by 1.8 GB before allocation. Only inspected U8/D2 and packed D4/K2048 families admit the enlarged banks; other families retain their earlier limit. This is not an automatic allocation policy.

Real components match the reference through every admitted physical row and hot boundaries up to slot 511, within the existing 2 GB component bound. Both fully resident text configurations preserve all 16 generated tokens and 2,560 boundaries and all 984 sparse boundaries. Their highest process footprint is 9,433,913,080 bytes, within the existing 10 GB research bound. All pins are released, three fully specified wide-mode conflicts are refused, and all 95 native catalogue checks pass.

On the same greedy fixture, VQ 3.2 cache hits rise from 311 to 2,379 and loads fall from 13,952 to 11,884. These aggregate counters include prefill and continuation; they are not a decode-only speed measurement. Hash observers and setup work remain inside the diagnostic process. Production serving, asynchronous read ownership, runtime resizing, task quality and complete-configuration throughput remain separate gates. No candidate is admitted to Auto.


### First complete-model generation-cost pilot, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-generation-cost-pilot]] binds a new frozen 44-token prompt / 128-token generation pilot, the exact binary and both artifacts. Separate validation first proves all sixteen complete vocabulary arrays and sampled tokens against the independent greedy reference while intermediate state observation is disabled. Measurement also omits final-logit hashing. Full finite-value and resource checks remain active, and all 138 main payloads are authenticated before the request interval. The process begins with empty expert banks but an uncontrolled OS page cache after authentication; this is not cold-SSD latency.

| Pack | Three committed generation rates, tokens/s | Median rate | Median TTFT, seconds | Median authentication/resident setup, seconds |
| --- | --- | --- | --- | --- |
| VQ 3.2 | 3.07638 / 2.98809 / 3.04660 | 3.04660 | 9.26446 | 29.18210 |
| VQ 4.4 | 2.54737 / 2.52407 / 2.52353 | 2.52407 | 10.51741 | 39.10702 |

All six measurements complete 128 non-EOS tokens and meet the predeclared observed timing criteria. Three alternating paired rounds are preserved; there are no replacement runs. The rate is 127 divided by elapsed time from first to last committed emission. Full request time, every interval, startup observations, per-token thermal/power observations, global paging and separate prefill/decode cache counts remain in the receipts. Decode hit fractions are approximately 30.82% and 30.76% in this fixed small-cache experiment. The final capped output is a reasoning continuation, not a completed-task quality evaluation. EOS termination remains unexercised.

The fastest representation here remains far below the proposed target. The older installed-pack pilot uses a different instrument and context policy and lacks complete ambient-override evidence, so no baseline speedup/slowdown is inferred from their numerical difference. This result does not qualify optimized VQ, larger contexts, MTP, vision, Auto or another Mac. Sixteen actual CLI/input refusal cases, the ordinary 3.2 full-state generation regression and all 95 native catalogue checks pass on this pilot binary. The complete e56f8fc remote CI separately confirms the prior finite-rotary checkpoint; the full static suite has not been claimed as freshly rerun here.

### CPU attribution follow-up, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-generation-cpu-profile]] preserves one separately budgeted sampled run. Its timing is discarded because sampling perturbs execution. Of 2,083 main-thread samples, 893 sit in the expert-piece pread subtree; GPU waits are also substantial. Process-wide leaf totals include other threads and cannot use the main-thread denominator. The profile supports testing bounded parallel demanded reads first; it does not establish a precise wall-time breakdown or a measured optimization gain.


### Bounded parallel demanded reads, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-bounded-parallel-record-reads]] records immutable authenticated read plans and bounded CPU workers. Each batch reserves all retained records plus per-lane syscall storage before it starts. Workers receive no MLX objects, mutable checkpoint map or bank addresses. All workers join before ordered owner-thread publication, including failure and cancellation. The entire demanded set stays pinned through evaluation and GPU completion. The initial twelve-lane choice is a measured comparison point, not a universal optimum.

Both packs retain exact greedy and sparse reference results, within the unchanged 10 GB process bound. Maximum whole-model footprint is 9,435,043,552 bytes; reserved staging reaches 95,558,400 bytes for VQ 3.2 and 115,219,200 for VQ 4.4, under its 128,000,000-byte admission limit. Actual parallel overlap, malformed requests, cancellation with active siblings, drain-before-return, failed publication, retries, destructive reuse and pin release are exercised. The first build owns these full-model results. The second build changes only one Sendable annotation, refusal messages and diagnostic assertions; both pass all 96 native checks. The second also passes six actual mode conflicts and the complete static suite, including 420 memory-override cases and 97 planner checks. Source identities bind the distinction.

[[sources/runs/2026/10/2026-10-03-native-vq-parallel-read-paired-pilot]] compares serial and parallel demanded reads for VQ 3.2 using that same final binary, prompt, resident text, 512/96 banks and 128-token workload. Both modes pass separate complete-logit prefix validation. Every measured 128-token sequence is identical. All three paired rounds meet the frozen observed timing conditions; no replacement runs occur.

| Mode | Three committed generation rates, tokens/s | Median rate | Median TTFT, seconds | Median full request, seconds |
| --- | --- | --- | --- | --- |
| Serial | 2.99876 / 3.06689 / 3.08361 | 3.06689 | 9.25776 | 50.66785 |
| Parallel | 4.27871 / 4.27802 / 4.28506 | 4.27871 | 3.41699 | 33.10364 |

The median of paired throughput ratios is 1.3949069410128767, approximately 39.49% improvement. This remains below the target. Setup authenticates all main payloads before timing, so no cold-SSD claim is made. This short, capped reasoning continuation is not held-out completed-task quality. Sixteen input/validation refusals and both serial/parallel receipt-cross-binding refusals pass before output allocation. No default changes or hardware promotion follow from this pilot.

Demanded-read workers now have bounded ownership. Predictive prefetch, service cancellation integration, dynamic byte budgeting/resizing, persistent PLE rows, production generation, longer contexts, draft, vision, held-out task quality and qualified Auto selection remain separate work. The experimental default remains serial and public model loading still rejects VQ.


### Parallel-path attribution, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-parallel-generation-cpu-profile]] preserves a separately budgeted five-second CPU sample whose timing is discarded. The main-thread tree has 2,088 samples: 471 in demanded-read work/join, 453 in bank output evaluation and 240 across the three repeated expert constructors. PLE row work appears in a smaller 28-sample block. The next test is a bounded code-only cache of identical kernel closures, preserving fresh array contexts and every bank lifetime rule, followed by exact reference checks and a new matched comparison. Attribution is not a measured gain. The same source separately records complete CI success for the earlier 9d5639a checkpoint.


### Kernel-object reuse checkpoint, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-kernel-object-reuse]] records a bounded cache of five exact Metal source/header specializations. It retains code only. Model tensors, array contexts, routing metadata, templates and bank leases remain independently owned. All five families execute at both input widths; both packs preserve every greedy and sparse reference boundary and pass the real bank ownership components. All 96 native checks pass, with maximum whole-model footprint 9,448,642,320 bytes inside the 10 GB bound.

The frozen two-binary pilot permits exactly the kernel implementation, its extracted cache and diagnostic changes, with identical Metal-library bytes and one native profile. Both executables pass separate complete-logit validation. All six observed timing runs are eligible and every 128-token sequence is identical. Median committed generation rises from 4.27597 to 5.10865 tokens/s. The median paired ratio is 1.1913453519006945, about 19.13% improvement; median TTFT falls from 3.56642 to 3.20329 seconds. The predeclared engineering adoption rule passes, so code reuse is retained. This does not qualify task quality, the speed target, another hardware class or an alternative production pack.

The build's intended preflight failed because its wrapper imported the helper from the wrong module, and the shell incorrectly continued to make. The source preserves the correction and the immediate during-build observation of over 22 GB reclaimable with normal pressure. That observation is not called a pre-build pass. Subsequent launches use a failing-command guard and the correct helper. All model runs separately pass their headroom checks. This increment repeats native numerical and ownership gates, not the complete static or app suites.

Large transcripts in this new source are losslessly compressed as base64 text, with original/normalized byte counts and hashes and a round-trip decoder check. Older source captures remain byte-for-byte unchanged.

### Smaller-pack preparation, October 3

[[sources/runs/2026/10/2026-10-03-vq-2.1-artifact-preparation]] binds the VQ 2.1 research download to its exact revision, config and complete file map. The 139 tensor files total 51,426,593,465 bytes. Payload verification is in progress at this checkpoint. Staging admission is separate from numerical and product admission; reference and native allowlists still refuse this pack.

Its three complete-record classes use 1,280,000, 1,382,400 and 2,611,200 bytes, with representative layers 2, 27 and 0 respectively. Compact 96-row banks total 506,265,600 bytes; shared books add 19,535,872 bytes. These are inspected storage geometries, not measured process floors or speed estimates. The bundled runtime differs from the reviewed newer runtime. An AST-only audit preserves the changed decoding and segmented-prefill expressions without executing the downloaded code. Qualification must explicitly bind a reviewed execution source and independently establish normalization, traversal and numerical agreement.

As additional regression coverage of the committed kernel-object cache, all 78 real selected-row fused fixtures pass, including D8 and D4/K256 families absent from the complete larger-pack runs. The separate research download was active, so this is functional evidence only. Complete 2.1 parity, quality, memory ranges and throughput remain open. No alternative pack is offered or selected automatically.

### Complete smaller-pack parity, October 3

[[sources/runs/2026/10/2026-10-03-vq-2.1-payload-and-normalization]] supersedes the preceding in-progress staging state: all 139 tensor files passed full hashes. An independent CPU tensor audit found exact agreement for 148 RMS norms after one BF16 +1 fold and 36 unchanged gated norms. This authenticates storage and normalization; draft and vision execution remain unqualified.

[[sources/runs/2026/10/2026-10-03-native-vq-2.1-three-class-parity]] captures the source-bound native implementation and all twelve sequential functional runs. All three expert record classes and physical research bank rows pass independent parity. Complete batched continuation checks 320 boundaries; compact and wide greedy each check 2560 boundaries over sixteen self-fed steps; sparse attention through 2054 consumed tokens checks 984 boundaries. Every check matches exactly. Compact greedy peaks at 7,018,174,080 process bytes, wide greedy at 7,694,063,712 and wide sparse at 8,814,728,856. These are bounded probe observations on the development Mac, not production memory floors or speed results.

The wide banks hold 512 records in the dominant class and 96 in each other class, costing 1,038,745,600 bytes plus 19,535,872 shared-book bytes. Explicit profile metadata binds all three classes and their layer counts; no heuristic infers the dominant class. Reference execution explicitly binds the reviewed newer runtime and separately identifies the distinct older bundle. Missing or inconsistent identities and missing class coverage fail before model allocation.

Both larger packs retain exact real-record, greedy and sparse parity. All 96 native catalogue checks, 22 native metadata refusals and six Python producer source refusals pass. Full static checks passed for the frozen native binary, including 97 planner and 420 memory-control checks. Final Python traversal/fetch admission changes followed that run's Python portion; nineteen focused tests cover those final sources. No timing is inferred from these functional runs. Public VQ loading, complete-task quality, feature qualification, Auto integration and the 20-token target remain open.

### Smaller-pack quality screen, October 3

[[sources/runs/2026/10/2026-10-03-vq-2.1-distribution-screen]] records all six new VQ 2.1 forwards against the identical original-tokenizer contexts and hash-verified corrected controls. Against the VQ 4.4 quantized proxy, mean case KL is 0.46529280439934456 versus 0.44401073962586735 for the installed baseline. Mean top-1 agreement is 0.6770833333333334 versus 0.7916666666666666. Coding and tool-result KL worsen; top-1 agreement worsens in five contexts and ties in one. The smaller representation therefore has an observed quality risk, despite exact native implementation parity and lower storage cost.

VQ 2.1 stays out of promotion and the next speed-optimization work remains on VQ 3.2. The single-context VQ 2.1 throughput pilot is not started: screening a faster version of a candidate with this unresolved quality loss would not earn product integration. The payload, implementation and all negative evidence are preserved. Reconsider with a separately frozen held-out noninferiority result or a new, independently qualified same-checkpoint representation; do not tune these six cases into a final test. No pack is qualified by this pilot, and VQ 3.2 still requires complete-task and full-configuration gates. See [[records/decisions/vq-2.1-held-after-distribution-screen]].

### Bounded allocator reuse, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-bounded-allocator-reuse]] records one native source change: resident research paths preserve an already bounded allocator cache across layers. The bound remains 128,000,000 bytes. Streamed text or a larger cache still clears every layer. Every arithmetic operation, finite check, real-headroom check, GPU drain and expert-bank lease remains intact.

All three packs preserve every greedy and sparse reference boundary. All 96 native catalogue checks pass. The largest whole-model process peak is 9,499,711,224 bytes, below the unchanged 10 GB bound. The full static suite passes. Both exact performance binaries independently match the sixteen-step complete-logit reference before measurement.

All three alternating pairs are eligible and preserve the same 128 generated token IDs. Median committed generation rises from 5.073901973129132 to 5.516094047564276 tokens/s; the median paired ratio is 1.0922703436950998. The median paired TTFT ratio is 0.9437188142389586. The frozen engineering adoption rule passes, so bounded reuse is retained. Separate experiments' gains must not be multiplied into a new measured result. This short-context, non-speculative, page-cache-warmed pilot remains below target and establishes neither completed-task quality nor another hardware profile.

### Independent draft metadata, October 3

[[sources/runs/2026/10/2026-10-03-vq-independent-draft-metadata]] authenticates the shared draft sidecar independently of all three main packs. Its own recipe is affine six-bit with group 32, covering 71 tensors and 20 quantized modules. Payload storage is 2,297,552,576 bytes, including 2,202,009,600 routed-expert bytes. This is storage geometry, not a process-memory floor or measured runtime reservation.

The new CPU inventory tool binds the exact header and complete tensor extents, rejects inherited main-pack recipes and unknown overrides, and distinguishes header authentication from optional full-payload verification. Four focused tests and the static harness checks pass. The read-only source review identifies fused projection, per-stream hidden normalization and zero-centered norm conventions that differ from the existing native MTP adapter. No downloaded source was executed. A compatible independently validated draft adapter is still required; no draft acceptance, speed or product feature is qualified.

### Next candidate hypothesis, October 3

[[sources/runs/2026/10/2026-10-03-vq-allocator-profile-and-dense-overlay-feasibility]] preserves a separately sampled generation run. Its timings are excluded. Demanded reads, expert GPU evaluation and route evaluation remain substantial. A header-only audit identifies 498 compatible dense quantized modules whose existing same-checkpoint four-bit arrays could recover 2,424,832,000 stored bytes while retaining the VQ experts, n-gram tables, norms and unmatched tensors. The first audit's missing namespace prefix and corrected mapping are both preserved.

This motivates an independently identified composite candidate, not a memory or speed claim. Authenticate every source payload used, bind the exact replacement map, prove direct-versus-streamed traversal and rerun the six-context screen before native integration. The original VQ pack's quality or parity cannot be inherited. No artifact is activated by this preparation.

### Dense four-bit composite screen, October 3

[[sources/runs/2026/10/2026-10-03-vq-dense-four-bit-overlay-screen]] identifies a separate same-checkpoint composite. It replaces 498 dense tensor triples with the installed affine four-bit arrays while preserving VQ 3.2 experts, PLE, norms and unmatched tensors. Both parent payload sets are freshly authenticated on every run. The complete replacement map and geometry have their own immutable digest; ordinary VQ parity and quality do not transfer.

All seven frozen runs complete without retries. The four-layer traversal proof matches exactly across the 512-token boundary with 513 tokens, at a 5,927,277,560-byte process peak. The six complete forwards peak at 2,628,520,312 bytes. These are streamed reference observations, not native resident floors. Header-derived dense payload falls by 2,424,832,000 bytes; no speed or cache benefit has yet been measured.

Against the VQ 4.4 proxy, mean case KL is 0.3936587962920319 versus 0.44401073962586735 for the installed baseline. Mean top-1 agreement is 0.8229166666666666 versus 0.7916666666666666. Top-1 improves in three cases and ties in three. KL improves in three and worsens in three, particularly retrieval; continuation dominates the favorable mean. Full VQ 3.2 retains the stronger prior distribution result. Keep this as a low-memory hypothesis for bounded native feasibility, not an established quality improvement or product candidate ready for promotion. Completed-task and held-out gates remain open.

The comparator reuses control logits only after binding their manifests to original receipts and pre-candidate hashes. Changed artifact and unfrozen-source refusals pass. Copy admission keeps total raw logits below the frozen 2 GB cap. Four CPU tests, thirty static-harness tests and the full static suite pass on the unchanged allocator binary. No native composite execution, MTP, vision, dynamic memory range, Auto behavior or hardware speed profile is qualified.

### Draft normalization storage resolved, October 3

[[sources/runs/2026/10/2026-10-03-vq-draft-raw-normalization-audit]] authenticates both complete draft files and compares all nine normalization tensors using bounded CPU reads. All raw sidecar values, including those stored as F32, are exactly BF16-representable. None matches the installed folded tensors directly; adding one and rounding to BF16 matches every tensor exactly. This establishes the storage convention. Multiplication dtype, per-stream versus full-width normalization, fused projections and speculative acceptance still need explicit numerical qualification. Existing draft execution remains unchanged.

### Native dense-four-bit composite, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-dense-four-bit-greedy-parity]] preserves the independent reference, source-bound executable, compiler repairs, six refusal cases and all native outputs. Both the streamed and fixed-resident composite match all 2,560 complete logical boundaries across sixteen autoregressive steps. The fixed banks, codebooks, parallel demanded reads and allocator policy are unchanged from the parent profile. Streamed process peak is 1,181,058,704 bytes; resident peak is 5,136,863,552. The resident ledger observes all fifty families and exactly 2,893,477,400 payload bytes with a 317,849,600-byte largest load copy. These are this fixture's observations, not general admission floors.

The same binary passes original 3.2, 4.4 and 2.1 greedy and sparse-continuation goldens. Their resident greedy/sparse process peaks respectively are 7,901,403,424 / 9,054,377,744; 8,410,127,008 / 9,534,019,368; and 7,768,873,128 / 8,884,131,600 bytes. All are below the declared 10 GB research envelope. The native T0/T1 catalogue also passes. No original golden or arithmetic tolerance changed.

The map is a separate artifact, not a relabeling of full VQ 3.2. Its nine source shards are authenticated as whole pinned files, accounting for 83,770,065,126 bytes read for authentication rather than resident memory. Cross-artifact, partial-option, changed-map, wrong-parent and linked-manifest calls fail before result publication. Full affine acceptance, composite sparse continuation and timing are still pending at this checkpoint; no alternate pack is installed or offered by Auto.

### Dense composite prefill and fixed-cache cost, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-dense-composite-prefill-and-cost]] records new independent composite prefill and sparse references. The native ordinary-prefill check matches 320 boundaries with a 2,866,039,472-byte process peak. Both sparse paths match all 984 boundaries through 2054 consumed tokens; streamed peak is 3,123,775,912 bytes and fixed-resident peak is 6,973,444,416. This is finite-horizon correctness and measured process ownership, not a general minimum or longer-context qualification.

After separate full-logit validation, the same executable completes three alternating full-VQ/composite timing pairs. All six requests satisfy the frozen thermal, power and paging eligibility checks, and each artifact reproduces its own full 128-token sequence. Cross-artifact output equality is not required. Median committed rates are 5.520602046506764 and 5.947090433995678 tokens/s; the median paired ratio is 1.0800631461693295. Median TTFT values are 3.1590660829970147 and 2.5441643340163864 seconds, with paired ratio 0.81918281617562. Median request durations are 26.25571970801684 and 23.914144957991084 seconds, with paired ratio 0.9132518003180788. These engineering observations do not qualify the 20-token target or provide a confidence bound.

Both arms own the same 1,194,393,600-byte, 608-record bank allocation, 2,082,816 shared-book bytes and 95,558,400 maximum read staging bytes. Full VQ records 49,233 loads and 18,790 hits; the composite's different generated route sequence records 49,865 loads and 18,105 hits. The recovered dense memory was not used for larger banks. Every request's global paging counters stay at 20 swap-ins and 2908 swap-outs. Complete raw observations, including earlier paging, are retained.

Authenticated load medians are 29.497434666001936 and 59.31279829199775 seconds. The research overlay additionally authenticates nine full baseline shards, totaling 83,770,065,126 bytes; this is startup I/O, not resident memory. A published composite pack and its load path have not been built. OS page cache is uncontrolled, and these are neither cold-SSD results nor complete-task latency or quality evidence.

### Shared dense dispatch affine acceptance, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-dense-composite-affine-compatibility]] preserves the full static suite and existing affine battery on frozen-dense-overlay-v2. The full battery reports 31 passes and four reference-related failures caused by the temporary driver resolving the venv interpreter symlink. The targeted repair uses the unchanged executable and the intact MLX 0.32.2 virtual environment: both independent reference producers and both native comparisons pass. This closes the existing affine compatibility requirement without changing the reference bytes, arithmetic or tolerances. The behavioral probe passes all 15 items and vision serving passes all 25 checks. These existing-pack results do not qualify composite task quality, features or throughput.

### Dense savings reinvested into fixed expert banks, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-dense-savings-reinvested]] compares the same composite and frozen binary with 512/96 versus 1536/288 record banks. The additional 2,388,787,200 bank bytes fit within the established dense payload saving; the process bound stays 10 GB. Both profiles match every greedy and sparse reference boundary. The larger greedy process peaks at 7,521,441,744 bytes and sparse at 9,328,595,360 bytes. Physical slots 1535 and 287 are actually executed in greedy generation. Sparse occupies only 1370 records and has no eviction, so its proof is kept distinct from the full-range greedy check.

All three alternating timing pairs qualify, with exactly the same complete 128-token output across both arms. Control/enlarged arm medians are 6.0164231060/5.6931276441 committed tokens/s, 2.5375323750/2.8505367500 seconds TTFT and 23.6464410420/25.2083016250 seconds total request. Median paired ratios are 0.9462645070, 1.1265224763 and 1.0661911433 respectively. Each control request loads 49,865 records and hits 18,105; each enlarged request loads 34,782 and hits 33,188. Reduced reads did not create a speed win. This is one fixed-work non-speculative context with uncontrolled OS file cache, not a conclusion about cold SSD, larger budgets or the complete production stack. No automatic cache growth or candidate promotion is justified by it.

### Larger-cache CPU diagnosis, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-larger-cache-cpu-diagnosis]] records a separate ten-second CPU sample whose timings are discarded. Demanded reads and MLX evaluation dominate the observed main-thread stacks; the victim search barely appears. This is diagnostic evidence, not an isolated GPU cost model. The next bounded hypothesis is to compare the VQ reader's current buffered mode with the existing affine reader's uncached/random policy, retaining exact bytes, descriptor ownership and the same process envelope. It is not yet implemented or measured.


### Fixed-cache acceptance checkpoint

[[sources/runs/2026/10/2026-10-03-native-vq-reinvestment-static-acceptance]] preserves the first static harness failure and its repaired full pass against the unchanged frozen reinvestment binary. The new test script required registration in the mocked suite inventory. No native numerical gate, reference or tolerance was relaxed. All four CI workflows for the preceding dense-composite commit passed. The larger cache remains an explicit research option and a losing cost result on the fixed workload; product Auto and the 20-token target remain open.


### Expert-containing shard read policy, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-expert-shard-read-policy-parity]] records an explicit research comparison of buffered descriptors versus checked uncached random-read hints on the nine authenticated shards containing experts. The same fixed dense composite and 1536/288 banks pass all 2560 greedy and 984 sparse boundaries under each policy, including exact generated tokens and cache state. The larger sparse peak is 9,388,167,512 bytes, within the unchanged ten-GB process bound. Ordinary readers remain buffered, and the policy covers entire shards, including their dense members. Integrity, descriptor ownership, cancellation and range guards are retained.

[[sources/runs/2026/10/2026-10-03-native-vq-shard-policy-timing-admission-stopped]] preserves the separate failed timing campaign. Both lean validation runs pass, but their thermal state is fair and their timings are discarded. The first measured process fails its native initial headroom observation before model allocation; external snapshots do not identify the exact cause. There is no paired speed result or automatic retry. A later comparison needs a separately frozen stable-admission protocol without relaxing memory or timing requirements. Full production generation, larger contexts, task-quality, MTP/vision, dynamic allocation, Auto and real-hardware qualification remain open.


### Stable-admission shard-policy result, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-shard-policy-stable-paired-cost]] records the separately frozen follow-up after the failed campaign. Every cell first passes thirty seconds of sampled nominal thermal state, low-power mode off, and the unchanged thirteen-GB floor in native and external VM observations. The bounded waiting step neither retries a failed cell nor relaxes native guards. The observer uses the timed binary's exact memory-observation source.

Both full-logit validations and all six timing cells pass, with the same complete 128-token sequence. Buffered/uncached median committed decode is 5.8081/5.3094 tokens/s and request time is 24.9272/26.7625 seconds. The median paired ratios are 0.91614 for decode, 0.95239 for first-token latency and 1.07729 for request duration. Keep buffered reads as the default for this layout. The result does not establish a universal policy, a qualified new pack or the twenty-token target. The next declared storage hypothesis packs unchanged expert bytes into contiguous aligned records; no conversion or native packed-reader result is implied here.

### Lossless contiguous expert export

[[sources/runs/2026/10/2026-10-03-vq-contiguous-record-lossless-export]] records one bounded CPU-only export from the fully authenticated VQ 3.2 parent. All 288 reconstructed source-tensor hashes match, including the six codes/scales pieces in every layer. Per-record padding is zero. Each payload begins at byte 16,384; aligned strides are 1,851,392 or 2,621,440 bytes. The 48 files occupy 47,866,183,680 bytes, within the frozen 48-GB output and 350-GB research-staging bounds. Staging before export was 254,809,699,818 bytes.

Final observations are 246,923,960 current process bytes, 258,998,968 lifetime physical-peak bytes and 272,646,144 lifetime RSS-peak bytes, all within the one-GB conversion cap. The manifest SHA-256 is `230c53d8bea76e245c8c47863db3fc0f93c549865e7393b5a493c07b0f52b834`. Source/output stamps, independent tensor reconstruction, complete output file hashes and synced atomic manifest publication bind the artifact. Synthetic source-order, padding, corruption, truncation, extent and incomplete-write checks pass. This does not establish native reader parity, a speed gain, quality qualification or deployment readiness.

### Native contiguous record parity

[[sources/runs/2026/10/2026-10-03-native-vq-contiguous-record-parity]] binds native producer `0c435ae491263b4bae35aaec29845d0e7f6507170ce411f3c1a811b3c1f52fff` to the frozen aligned export. All 96 catalogue groups pass. Both storage paths match every one of 2560 greedy and 984 sparse-context state/output boundaries without tolerance changes. Sparse coverage reaches 2054 consumed tokens. The contiguous reader verifies all 48 derived payloads totaling 47,866,183,680 bytes.

Greedy split/contiguous lifetime peaks are 7,518,705,640 and 7,535,450,112 bytes. Sparse peaks are 9,373,421,864 and 9,383,448,896 bytes. The process ceiling remains 10,000,000,000 bytes. Maximum staging is 95,558,400 for split reads and 115,015,680 bytes for complete aligned reads, both below 128,000,000. The 1824-record greedy cache reaches physical addresses 1535 and 287; both arms report 10,308 loads, 3902 hits and 8484 evictions. Sparse does not claim full physical-slot occupancy.

Three CLI refusal cases leave no output directory or model allocation. Buffered read policy, model values and bank capacities stay fixed. These functional runs are not throughput measurements. Authentication reads the parent, dense overlay and then candidate-only derived files; OS file-cache history remains uncontrolled and must qualify any later interpretation. Full original affine acceptance from the earlier composite checkpoint is not reported as rerun by these research-only changes.

### Paired contiguous-record generation cost

[[sources/runs/2026/10/2026-10-03-native-vq-contiguous-record-paired-cost]] preserves both independent lean-path full-logit validations and all six interleaved measurements. All six timing cells pass the frozen observed eligibility rules and emit the same complete 128-token sequence. Both arms use the same composite, buffered policy, 1536/288 banks, original prefill sweep and ten-GB process ceiling. No run is retried or replaced.

| Metric | Split ranges median | Contiguous records median | Median paired contiguous/split ratio |
| --- | ---: | ---: | ---: |
| Committed decode tokens/s | 5.776163947978307 | 6.872380896608456 | 1.1897828660167846 |
| TTFT seconds | 3.0060759580228478 | 3.007833749987185 | 0.98991835190062 |
| Request seconds | 24.993009916011943 | 21.581774708989542 | 0.8576591458049302 |

Loading medians are 59.3513325420 and 77.1266143330 seconds. Maximum timed process peaks are 7,750,785,096 and 7,782,275,240 bytes. Every measured request has 34,782 record loads and 33,188 hits in both arms, so the improvement does not come from a larger cache or different generated route sequence. Median paired ratios and ratios of arm medians are different statistics.

The complete research path improves generation while increasing authentication/load time. Candidate-only record files are read after both parent filesets, changing uncontrolled OS cache conditioning; this limitation was recorded before timing. The result cannot isolate positional-call count as its cause, claim cold-SSD speed, project standalone-pack startup, qualify another budget/Mac, or meet the twenty-token target. Main-model values are unchanged, but the underlying composite's held-out task qualification remains open.

[[sources/runs/2026/10/2026-10-03-native-vq-contiguous-record-static-acceptance]] records complete static acceptance on this same frozen producer. No public loader, Auto choice, installed pack or download activation changes. The earlier complete affine model-loaded battery is preserved as earlier evidence and is not represented as rerun here.

### Separate original draft on real composite inputs

[[sources/runs/2026/10/2026-10-03-vq-composite-draft-initial-parity-failure]] binds the CPU inventory, independent reference and preserved failed native comparison. The original head contains 68 tensors and 18 affine modules, with a 1,470,955,171-byte file, 1,470,946,816-byte payload and 419,430,400-byte largest tensor. Its own recipe is four-bit group-64. The complete-file and header hashes plus original-checkpoint conversion provenance are captured separately from the VQ trunk.

The reference main prefill matches all 160 frozen boundaries and next token 760. The process releases the main stack before head computation, peaks at 2,424,162,872 bytes, and writes a 2,253,521-byte BF16 fixture from 43 composite-input head entries plus one cached step. The first native orchestration stops before launch because it repeats a lock preflight inside its own reservation. A separately recorded native-only correction executes under a parent-held lock and fails unchanged prefill parity at relative maxima 0.02927 and 0.02970; its cached outputs are exact. This also reproduces the standalone head loader's absent exclusion check without running a second model.

[[sources/runs/2026/10/2026-10-03-native-vq-owned-draft-component]] adds owned full-file authentication, separate metadata and explicit retained-payload/load-copy checks. Its research-only arithmetic profile uses the reference's fast grouped normalization, the existing qualified BF16 sigmoid and finite rotary coefficients. All four unchanged fixture outputs then match exactly; offsets are 43 and 44, all outputs are finite, native peak is 2,064,894,112 bytes and bounded BF16 traces occupy 5,811,200 bytes. The public arithmetic remains deployed. This is a combined-profile comparison, not attribution to any single arithmetic operation.

Twelve actual CLI refusal checks pass for process-lock contention, ambient overrides and corrupt, symlinked, truncated or FIFO inputs at the relevant fixture/configuration/sidecar boundaries. The process-lock fix applies to ordinary standalone MTP loading as well. This component result provides no speculative acceptance, committed-generation speed, long-context, vision or held-out quality evidence. No candidate is installed, served, selected by Auto or promoted.

### Final draft build admission status, October 3

[[sources/runs/2026/10/2026-10-03-vq-draft-final-build-admission-pending]] records a successful final native build and the broader local acceptance remaining unlaunched. The head and owned-loader source hashes are unchanged from the exact component producer; the final diagnostic adds an existing-output refusal and metadata/budget checks. One admission attempt refuses insufficient real memory. A separate bounded stable-admission campaign also launches no model and is interrupted after a separate llama-server workload is identified. The unrelated process is untouched.

The quiet preflight now rejects known llama.cpp inference entrypoints before launch as well as Slotstream/build contention. Twelve context-qualification tests and thirty-two static-entrypoint tests pass; a read-only invocation reproduces the external-model refusal. Final local static/catalogue, baseline draft, streamed draft, image interaction and verification-row checks remain pending until exclusive model execution and their original real-memory bounds are available. Exact component parity is not substituted for those regressions. New independent reference campaigns must bind the changed safety-helper identity and satisfy their source-bound traversal requirements again.

The full implementation remains in progress. No alternate pack has earned Auto integration or promotion, no new supported hardware profile reaches the target, and no release is implied by this checkpoint.

### Baseline product controls and completed local regressions

[[sources/runs/2026/10/2026-10-03-baseline-auto-selection-and-live-memory]] records the baseline-only product selector, immutable manifest identity, independent quantization/ceiling/live-memory controls, configuration generations, deferred ownership and fixed-capacity pressure behavior. The native catalogue, full static suite, complete Mac runtime suite and all native settings appearances pass. Eight bounded model cells pass across the two preserved campaigns: ordinary/draft fixed-capacity pressure recovery, actual app deferred reload, research/public draft references, streamed draft equivalence, draft/vision interaction and draft row equivalence. Exact process peaks, real headroom, paging and elapsed times remain in the raw receipts; these functional observations are not throughput qualification.

Two instrument failures are preserved. The first compiler observer missed independently grouped descendants and was stopped; the replacement enumerates parent links and completes under an explicit compiler-only envelope. The research draft initially rejects an inherited production diagnostic flag before loading; a fresh clean-environment continuation passes without tolerance or fixture changes. Neither failure is presented as a model numerical regression.

The original deployment remains the only selectable pack and the registry's new hardware qualification list stays empty. The native VQ research path still lacks production service/speculation and dynamic memory integration. No alternative-quality, multi-pack activation or twenty-token claim follows from these checks.

### Candidate recording, exact verification and interrupted-state recovery

[[sources/runs/2026/10/2026-10-03-candidate-state-recording-and-recovery]] preserves three source-bound builds and their bounded sequential campaigns. The first whole-model test fails 422 of 3,580 assertions, isolated to kept prefixes of one or two tokens and their continuations. Full-pass recording, the separate recurrence kernel and checkpoint restoration pass. The corrected explicit row-invariant verification mode passes all 3,580 short-context assertions on full VQ 3.2 and the original-dense composite.

The expanded sparse-boundary campaign passes 4,952 assertions on each layout, including actual cancellation and recovery at layers 0, 17, 47 and the final output. Verification starts after 2,048 prompt tokens and stays within the existing finite rotary bound. Sampled process peaks are 9,170,212,240 and 6,384,979,400 bytes respectively. Every run retains the ten-GB process envelope, thirteen-GB real-memory preflight and three-GB headroom checks. Global paging is retained separately; elapsed times are functional diagnostics, not qualified throughput.

The final executable also passes the native catalogue and the unchanged full/composite greedy and sparse references. These run in ordinary reference arithmetic, separate from the explicit verification profile. Each greedy check passes 7,717 assertions and each sparse check 2,974. Frozen tensors, tolerances and output IDs remain unchanged. The raw source preserves producer manifests, binary/Metal hashes, failed and successful reports and an archived final compiler input set. No target tokens are re-evaluated to repair a recorded speculative rejection. Draft acceptance, sustained speed, larger contexts, vision, production memory integration and pack qualification remain open.

### Target-verified composite speculation and shared-path regressions

[[sources/runs/2026/10/2026-10-03-candidate-target-verified-speculation]] preserves the initial diagnostic build failure, the complete failing generation run and its corrected successor. The first runnable campaign fails 18 of 1,361 assertions, all in the draft key, value and indexer cache. Emitted tokens, target tensors, consumed boundaries and sampler state already match. The failure starts when token/hidden-branch flattening changes the draft fusion projection dispatch; it is not a target acceptance or sampler error.

After candidate-only token-wise fusion, all 1,361 assertions pass, exercising 48 accepted drafts across the bounded cases. Greedy and sampled generation, EOS and callback stops preserve exact complete target/head logical state and RNG state. The sixteen-token greedy output equals the unchanged independent composite reference. Candidate process peak is 7,610,947,248 bytes within its ten-GB envelope. Sparse-boundary recovery without a draft passes all 4,952 checks on the same binary.

The public overload now delegates embedding lookup into the same alignment/vision logic. Its existing full draft/image diagnostic passes with a 9,820,739,344-byte peak, and streamed-head checks pass with a 7,876,302,872-byte peak, within their unchanged twelve-GB target and fifteen-GB preflight. Every campaign cell preserves real headroom, pressure observation and the single-process rule. Runtime durations are functional observations only. No sustained speed, task-quality, arbitrary-context, candidate-image, production serving or Auto-promotion claim follows from these results.


### Authenticated extended rotary and native contexts

[[sources/runs/2026/10/2026-10-03-candidate-extended-rotary-and-context]] preserves the independent coefficient producer, exact build identity, bounded native campaign and all raw results. The 67,108,864-byte F32 component covers 262,144 positions and matches the complete embedded 2,054-position prefix. All 21 native component assertions pass, including complete duplicated sine/cosine hashes, noncontiguous batch indexing, wrong kinds/extents/digests and early/mid-read cancellation. The native coefficient diagnostic peaks at 405,865,432 bytes; the separately supervised Python producer stays within its two-GB bound. Coefficient coverage is not an admitted native context.

| Explicit composite context with original draft | Assertions | Failures | Observed process peak, bytes |
| --- | --- | --- | --- |
| 4,096 | 493 | 0 | 8,437,568,408 |
| 8,192 | 509 | 0 | 8,498,680,704 |
| 32,768 | 605 | 0 | 9,389,527,888 |

Every model case uses 512-token prefill passes, the same small mixed-class banks and exact-verification arithmetic. Tests compare long-context draft discard, reproduced proposals, target logits, recorded target/head rollback and subsequent continuation, then consume the complete configured window and refuse the next token without state mutation. No target prefix is recomputed to accept a speculative result. All expert pins are released, and every case leaves a committed target/head boundary. The native catalogue also passes.

These runs retain the ten-GB process ceiling, thirteen-GB real reclaimable preflight, three-GB remaining headroom and one-process rule. Global paging is preserved as diagnostic data. Elapsed functional-run times are not clean throughput evidence. The embedded finite path remains the default, and this experiment does not qualify full model-range execution, image input, held-out tasks, a public candidate Engine, Auto promotion or twenty tokens/s. The same source records successful remote core, Mac, context and docs CI for the earlier state-recovery commit.


### Frozen completed-task calibration

[[sources/runs/2026/10/2026-10-03-candidate-completed-task-calibration]] binds a sixteen-case owned protocol covering instruction following, tool execution, tested coding fixes, multilingual structured answers and retrieval. The native producer authenticates the original tokenizer/template and freezes every input token once, avoiding tool-schema key-order differences across processes. Every arm uses that identical prepared protocol. Sampling is greedy, the admitted context is 8192 tokens, output is capped at 512 tokens and the process bound remains 10 GB with a 13 GB preflight and 3 GB actual headroom.

| Arm | Completed tasks | Graded outcome | Observed process peak, bytes |
| --- | --- | --- | --- |
| Original affine four-bit, no draft | 16 of 16 | 15 of 16 pass | 7,994,971,224 |
| Full VQ3.2, no draft | 14 of 16 | Ineligible incomplete arm; 11 observed cases pass | 10,020,674,016 at supervisor termination |
| Original dense four-bit with VQ3.2 experts/PLE and two original-head drafts | 16 of 16 | 15 of 16 pass | 9,201,686,360 |

The full VQ arm exceeds its process envelope during the first retrieval case and is terminated by its supervisor. Its last native receipt has only the earlier, lower peak; it does not contradict the external lifetime-peak observation. The composite runs once afterward as the originally frozen third arm. No preceding case, failed process or prompt is retried or replaced.

Both complete arms return correctly sorted objects instead of the requested array of names in the same instruction case. All their tool calls execute successfully against deterministic local fixtures. Every coding fix passes its frozen pure-function tests without input mutation. The grader rejects incomplete answers, malformed or mismatched tool calls and unsupported coding authority; coding workers have bounded source, operations, memory observations and CPU/wall deadlines. The source includes the exact grader and eight passing instrument tests, twenty-one native refusal cases, the unchanged 1361-assertion generation control, the native catalogue and the full static pass.

These are disjoint calibration examples, not held-out task estimates. The full VQ partial successes cannot be treated as a passing overall result. Functional request times are preserved but have no clean paired timing eligibility or confidence interval. No alternative pack, hardware speed profile, image support or production serving is qualified. The recorded next hypothesis is to omit unused vocabulary readouts on intermediate prompt passes, with exact state and continuation checks before any newly versioned measurement.

### Intermediate prefill readouts and task-memory repair

[[sources/runs/2026/10/2026-10-03-candidate-prefill-readout-memory-repair]] preserves the next source-bound binary and prospective resource budget. The candidate's intermediate 512-token prompt chunks no longer compute full-vocabulary readouts that generation discards. They still consume every target and original-draft position. The final prompt chunk and recorded verification keep the existing full readout; ordinary forward observers and frozen numerical fixtures remain available unchanged.

The native control passes all 2071 assertions, including every preceding speculative-generation check and new exact target/head state and continuation-logit comparisons after 17 and 512 tokens. Its observed physical-process peak is 8,488,327,024 bytes. Early cancellation and attempted readout omission during a recorded pass are refused without losing the preceding checkpoint.

Both candidate arms are then repeated once under the unchanged sixteen-case protocol and ten-GB limit. Full VQ3.2 completes with a 9,365,920,248-byte peak and thirteen passing tasks. The original-dense composite with two drafts completes with an 8,492,242,872-byte peak and fifteen passing tasks. All fourteen previously completed full-VQ cases and all sixteen prior composite cases retain identical output tokens, finish reasons, parsed answers and speculative details. The original baseline is reused and remains fifteen of sixteen; it is not presented as rerun on this binary.

The full VQ arm's prior 10,020,674,016-byte failure is retained. The change resolves that observed workload's memory failure without enlarging its envelope or changing its inputs. It does not qualify every possible 8192-token prompt, larger full-VQ contexts, held-out task quality or the twenty-token target. These sequential functional durations are not paired performance evidence. The native catalogue passes; the preceding complete static pass is scoped to its earlier binary, and the attached previous-commit CI snapshot still has engine and Mac jobs running.


### Parallel prefill records and completed tasks, October 3

[[sources/runs/2026/10/2026-10-03-candidate-parallel-prefill-read-validation]] preserves the complete staging ledger, source-bound build, native controls, task protocol, raw results, exclusions and acceptance. Twelve joined read lanes fill private complete records; immutable codebooks and plans are shared with decode. The reservation charges read results, per-lane scratch, retained MLX arrays and the largest join buffer, capped at 300,000,000 bytes. Every prefill scan preserves decode-bank hits, loads, evictions, occupancy, pins and capacity.

Independent 410/512-row component fixtures pass for all allocation classes in VQ 3.2, 4.4 and 2.1. Sparse whole-model comparisons preserve every frozen boundary for those packs and the dense composite. Their observed process peaks are 9,183,156,008, 9,721,304,848, 9,088,718,704 and 7,105,663,392 bytes, respectively. The unchanged generation control passes with an 8,555,501,352-byte peak. No golden or tolerance changes. One prelaunch driver used a wrong fixture path; the next misread a successful JSON component report as a missing text label. Both failures and the successful native output are retained. The continuation runs only previously unexecuted checks.

The complete sixteen-case composite calibration preserves all output tokens, parsed answers, finish reasons and speculative details, with an 8,510,592,976-byte process peak. The following three alternating serial/parallel pairs use identical prepared tokens, one fixed warm-up case, a short tool case and two retrieval cases, preserving all outputs and staying inside ten GB. Four timing cells fail the prospectively fixed competing-CPU condition. Only the final pair is eligible, so the complete study emits no clean median or promotion verdict. Raw timings remain available as excluded observations. This is not a sustained speed or twenty-token result.

All eleven new actual CLI refusals and the complete static acceptance suite pass. All four remote workflows for both preceding source commits are successful. Parallel prefill remains an explicit research option; the installed model, public loading and Auto registry are unchanged.


### Controlled three-bit experts and independent calibration, October 3

[[sources/runs/2026/10/2026-10-03-affine-three-bit-expert-control]] captures a complete expert-only affine-three-bit transcode of the original four-bit checkpoint. Dense, PLE, draft and vision values remain original. The result contains 48 files and 52,848,290,992 bytes including headers, with 2,150,400 bytes per complete expert record. It still requires its original parent and is not an installable or reduced-download-size claim. The phase prospectively raises total research staging from 350 GB to 365 GB to price these additional outputs; historical protocols remain unchanged.

The source-bound quantizer verifies every original source and complete output through owned descriptors. Numerical checks cover both expert shapes, all packed codes, byte-identical batch-eight versus individual conversion, tensor serialization and restored reconstruction. The component's internal physical lifetime peak is 577,864,664 bytes; conversion peaks at 257,082,112 bytes. The separate strict reference verifies every original PLE table against mapped gathers and preserves exact direct/streamed output over four layers and 513 tokens, peaking at 5,559,915,152 bytes. Each subsequent full-model pilot stays below ten GB; the largest observed peak is 2,291,976,352 bytes.

All six contexts reuse the frozen original token sequences and corrected VQ4.4 reference. Candidate full-vocabulary logits are scored in memory and hashed, adding zero stored raw-logit bytes. The comparison uses the previously captured native original baseline and this explicitly identified Python control. It is not a causal proof that bit width alone explains every difference.

| Context | Original baseline KL | Control KL | Original top-choice agreement | Control top-choice agreement |
| --- | --- | --- | --- | --- |
| Prose | 0.224397 | 0.284638 | 13/16 | 13/16 |
| Coding | 0.366843 | 0.475493 | 12/16 | 14/16 |
| Tool result | 0.764051 | 0.918598 | 12/16 | 10/16 |
| Multilingual | 0.343711 | 0.379610 | 14/16 | 11/16 |
| Continuation | 0.715288 | 0.192943 | 13/16 | 15/16 |
| Retrieval | 0.249774 | 0.344421 | 12/16 | 14/16 |

Macro KL is 0.444011 for the baseline and 0.432617 for the control; top-choice agreement is 76/96 and 77/96. Five contexts worsen KL, while the continuation improvement reverses the aggregate. This small calibration supports further native measurement but cannot qualify similar task quality, speed or product use. No output was discarded or sampled again to improve the outcome.

The initial protocol setup used system Python without MLX metadata and stopped before model launch. The first static attempt then found that the new suites were absent from the static-entry-point fixture registry. Both failures are preserved. The corrected fixture registration and complete static suite pass; no model measurements were rerun for that repair. Public Engine loading, installed artifacts, the supported registry and Auto remain unchanged.


### Native affine reference, generation and completed-task calibration, October 4

[[sources/runs/2026/10/2026-10-04-native-affine-reference-generation-and-context]] captures the authenticated native adaptation of the already pinned affine-three-bit expert control. The expert recipe is three-bit/group-64, while dense, PLE and the separately loaded draft remain original. Pool/staging shapes use verified descriptors. Resident arrays and streamed rows retain the authenticated file owners; the public original loader and planner geometry keep their previous defaults. The research resident loader eagerly materializes the embedding tensor too, so these memory observations do not claim all potential row-cache savings.

The six-token independent PR1788 reference and the sixteen-step self-fed reference both retain the predeclared 0.02 affine maximum-relative bound. Final native execution matches every observed hidden and vocabulary byte exactly at 640 cold, 640 reused, 800 grown and 640 shrunk slots; the deployed Generator emits the same sequence. The six-token process peak is 5,983,194,976 bytes and the longer-generation peak is 6,712,610,320 bytes. The first retained-pin diagnostic, deployed-arithmetic mismatch and longer-prefill attention mismatch remain in the source. The sorted expert branch leaves the latter failed logits unchanged; disabling forced fused prefill only in the explicit reference profile resolves it. A build containing a floating row-index division was stopped before model execution and corrected to integer division.

The charged reference-storage ledger includes the previously omitted 525,824-byte short rotary table. Its corrected prior total is 1,970,759,168 bytes. The new hidden/readout fixture adds 12,789,760 bytes, and sixteen vocabulary rows add 15,892,480 bytes, yielding 1,999,441,408 charged bytes. The full census also lists separately budgeted original-draft and vision compatibility artifacts outside this reference-logit allowance. Everything remains inside the prospectively bounded research-staging account. Native checks save hashes and receipts rather than new raw logits.

The original independent four-bit draft runs through the existing Generator, with explicit row-invariant verification and token-wise fusion. The initial diagnostic trapped because its independent canonical state had no draft cache; the source preserves that failure and faulting frames. After initializing that state as the Generator does, all 2,540 assertions pass, including actual accepted drafts, greedy depths one/two/four, sampled depths two/four, callbacks, EOS, verification cancellation and exact subsequent recovery. The process peak is 8,606,963,448 bytes. The later context-admission correction repeats those checks and adds requests at the finite window and beyond the reserved output limit; its final report contains 2550 passing assertions with a 8,473,138,480-byte peak.

| Admitted native window | Passing assertions | Physical process peak, bytes |
| --- | --- | --- |
| 4,096 | 1,330 | 8,929,629,248 |
| 8,192 | 1,346 | 8,878,134,312 |
| 32,768 | 1,442 | 9,598,293,104 |

Each context keeps the original draft live, consumes the entire window, checks every recorded-prefix target/head state and continuation exactly, then refuses an extra token without mutation. These deterministic contexts establish bounded execution and recovery, not long-context task quality or throughput. The final Generator also checks its actual admitted model window before state reservation and bounds provisional verification inside it; the baseline retains its full model limit.

The same sixteen prepared calibration tasks and unchanged grader produce fifteen passes for the freshly repeated original baseline, draft-free affine control and two-draft affine control. All fail the same instruction requiring a names-only array, returning sorted records instead. All tool fixtures and pure-function coding tests pass. The repeated baseline has exactly its prior token streams and parsed answers; the two affine configurations also have identical streams across all sixteen cases. Their observed process peaks are 8,117,130,496, 6,765,843,064 and 9,120,127,000 bytes, respectively. Different cache capacities and arithmetic identities are explicit. The raw functional durations are not a clean paired timing comparison, and this small calibration cannot establish noninferiority.

Existing historical/current layer parity, the cache-sweep gate and weights-free catalogue pass on the recorded frozen binary. The final static suite passes on its later source-bound binary. Builds retain exact before/after input manifests and original failed compiler diagnostics. No installed artifact, supported-pack registry, user preference, quality qualification or twenty-token speed profile is promoted. Candidate production/vision ownership, allocation/governance, transactional distribution, held-out quality and paired complete-configuration performance remain required.


### Pack-specific planning, Engine serving and observed-memory recovery, October 4

[[sources/runs/2026/10/2026-10-04-affine-engine-memory-and-governor]] preserves the new candidate integration and all predecessor failures. The immutable resource contract charges the admitted expert record, eager embedding and authenticated rotary table independently. Its workspace bound includes a complete reference layer, bounded assembly/staging and replacement pool backing during prefill admission. Capacity solving charges that extra scratch along with each additional slot; it cannot reinvest every byte saved by expert quantization while omitting workspace growth. Original planning keeps its existing costs and speed evidence; candidate estimates serialize as unknown and keep the wall-clock prefill guard active.

The governor's live restart credit is capped by actual observed process ownership. The existing pure fixture seam retains its historical behavior when no observation is supplied, but every live path supplies one. A failed physical observation cannot create credit. Earlier full/small live drills shrink, honor cooldown and regrow with identical output. Subsequent actual pressure-with-draft, runtime-budget/first-image recovery and output-serving checks pass. Their predecessor failures are kept: bounded credit exposed a test recovery point with no allocator-release margin and a real first-image planner that reused stale zero availability after recovery. The fixture now reserves a small observed-credit margin, and the product planner takes a fresh bounded ownership snapshot.

The final candidate Engine fixtures use fixed small arenas and a ten-GB physical watchdog. Their deliberately larger conservative planning envelopes are recorded separately; this is not evidence that a user can run those declared plans at a ten-GB ceiling. Complete-prompt retention is explicitly priced for both active and retained stepped capacity. A smaller fixture correctly refused retention, and that failed expectation remains evidence. All numerical expectations stay unchanged.

| Final candidate mode | Passing assertions | Physical process peak, bytes |
| --- | --- | --- |
| Without draft | 57 | 6,873,813,888 |
| Independent original draft | 57 | 8,375,162,784 |

These checks execute the actual Engine and loopback HTTP handler. They verify owned Unicode tokenizer parsing after removal of the fixture's source copies, exact greedy output, full-prompt and aligned prefix reuse, disk identity/restoration, cancellation with no silent replay, pressure floor refusal, recovery, warm resize, and HTTP artifact identity. The original-loader/candidate-plan mismatch, oversized forward, unsupported image toggle, legacy draft loader and explicit different-quantization request all refuse before the incompatible operation. The final catalogue, historical/current original layer checks, sweep equality and static suite pass on the preserved source-bound binaries. Prior committed-checkpoint CI is also captured as completed successfully.

This adapter is experimental and package-only. It still depends on the original parent plus controlled expert overlay and finite rotary artifact. It does not enable candidate images or streamed drafts, publish a standalone pack, qualify task noninferiority or establish a speed profile. The task evaluator's original-baseline branch now admits explicit drafting so the next comparison need not disable an existing baseline optimization. Those new comparative results are not part of this source.


### Complete draft pilot stopped by frozen timing conditions, October 4

[[sources/runs/2026/10/2026-10-04-complete-pair-exclusions-and-context-ci]] contains all raw task outputs, hashes, timing exclusions and host observations, plus the failed context CI and its local repair. Four completed runs used the original Engine with streamed original draft experts or the authenticated affine-three-bit control with a resident independent original head. Both requested two drafts. The equal physical watchdog did not make their allocation recipes or saved planning ceilings equivalent; this is a calibration comparison, not integrated Auto qualification.

Each completed run passed 15 of the 16 frozen calibration tasks and retained the same sorting-format failure. Repeated runs of each artifact have identical prompt/output token IDs and terminal outcomes. This is repeatability on known tasks, not held-out noninferiority.

The first original run met its timing conditions. Both candidate runs exceeded the frozen competing-CPU criterion. The second original run has a thermal/power exclusion, and the next preflight refused launch. No replacement rounds were run. Preserve the measurements as excluded timing evidence; there is no paired speed aggregate or evidence for the twenty-token target. All completed cases remained under the existing physical-process watchdog.

Separately, context-proxies CI failed to compile because its standalone Swift source set omitted PackMemoryProfile. Adding the actual file to compilation and provenance fixes the observed error, and the isolated source proxy passes locally without an Engine or model. This correction does not widen a memory bound, edit a numeric golden or relax an experimental protocol.


### Durable original-pack activation and recovery, October 4

[[sources/runs/2026/10/2026-10-04-durable-model-activation-and-recovery]] preserves source-bound development builds, all scripted attempts, the full Mac suite, bounded resource protocols and actual model logs. The journal has a bounded state file, exclusive owner lease and synced atomic transitions. It stores fixed diagnostic codes and pack/settings receipts, never prompts, arbitrary error text or model bytes. Existing independent embedding APIs can leave the journal disabled; the Mac app enables it explicitly.

The initial real campaign passes actual activation, partial-load failure, sequential rollback, explicit retry and restart at a sampled peak of 5,774,824,080 bytes. The unchanged legacy memory-control workflow passes at 6,621,500,336 bytes. Both use separate sequential processes under the existing ten-GB physical ceiling. A subsequent review fixed initial journal-open/write failures so they stop queue admission, and a cancellation check now follows durable commit but precedes publication. The new async test initially failed to compile; that diagnostic is preserved rather than presented as a product failure.

The corrected full Mac suite passes, with an observed process-tree peak of 1,664,470,496 bytes. It includes all existing scripted suites and UI checks, plus an isolated settings executable launched without an adjacent Metal library from an empty directory. The final real activation campaign passes seven sequential load attempts in one process, including cancellation during commit and a later successful request; peak is 5,775,741,584 bytes. These are functional/resource observations, not clean speed measurements. The prior real legacy run is not relabeled as a run on the final binary.

Failed requested settings remain visible. The previous runtime can be restored under its own applied ceiling, while saved requested preferences remain unchanged and other queued work waits. A retry revalidates files and current headroom; unreadable journal bytes are preserved. The scripted Light, Dark and System failure screens pass, and the final Light screen was visually inspected. Optional persistent caches attach only after health and commit. A cancelled activation does not load another model for rollback.

The static monitor's inherited engine-binary field is not the Mac executable identity; the frozen build records bind the actual check binaries and sources. No installed executable, user Home or quantization default changed. No alternate pack, held-out noninferiority verdict, sustained speed profile or public release is qualified by these tests.


### Independent streamed draft and 32K recovery, October 4

[[sources/runs/2026/10/2026-10-04-authenticated-streamed-original-draft]] records the original four-bit head's separately authenticated streamed placement. Its non-expert tensors remain resident, and its bounded cache and scratch use the original head's record size. Full-file authentication, tensor range validation and descriptor ownership precede allocation. Parallel reads publish only after the entire batch and integrity checks succeed. The target's three-bit descriptor never configures the draft.

The frozen streamed candidate matches all 22 previous resident-head observations exactly, including emitted tokens, consumed length and committed target/head state digests. The speculation report passes 2,689 assertions, including joined-read failure without partial cache publication, retry and mutation detection on an owned disposable sidecar copy. The real Engine report passes 58 checks covering memory/disk reuse, live governance, cancellation and HTTP. Their process peaks are 7,546,573,384 and 7,678,072,112 bytes.

The original public streamed/resident draft and plain-lookahead regression passes at 7,875,680,232 bytes under its unchanged separate resource allowance. The candidate's 32,768-token context and exact recovery report passes 1,443 assertions at 8,097,697,704 bytes, inside the ordinary ten-GB process bound. These fixture peaks are neither the complete planner envelope nor speed evidence.

All final static gates pass, with matching before/after source inputs. The final executable SHA-256 is `fc6faecc34177cada3820c23117e48ba20153ff41d377c6c73b4ebd88216491f`. An intermediate diagnostic compile failure remains preserved. Complete CI for `de75f797eec33b0429c92c9081146ad865ee6890` passes.

Candidate planning now supports explicit streamed placement without inheriting the original pack's measured automatic placement threshold. No alternative becomes supported, installed, Auto-selected or quality/speed qualified. Candidate vision, held-out quality, complete-configuration performance and standalone distribution remain required.


### Equal-ceiling actual Engine calibration with timing exclusions, October 4

[[sources/runs/2026/10/2026-10-04-actual-planner-calibration-with-timing-exclusions]] preserves both build attempts, bounded input refusals and Engine regression, frozen task protocol, all six runs, original grader and complete host observations. Both arms request a 14 GB saved ceiling and physical watchdog, with a 17 GB real-memory preflight and 3 GB minimum headroom. They use two drafts and explicit original streamed experts, with vision, prefix retention and decode lookahead disabled. This larger allocation is the measurement itself; ordinary correctness fixtures remain under their prior bounds.

The actual original planner chooses 2,162 slots and a 1,024-token prefill chunk; the conservative affine plan chooses 1,175 slots and a 512-token chunk. The smaller expert records alone therefore do not imply a larger cache: full replacement backing is still charged during admission.

Every run passes 15 of the 16 unchanged calibration tasks, failing the same names-only sorting instruction. Repeated runs preserve prompt/output token IDs and terminal outcomes. Original physical peaks are 12,593,258,512, 12,537,176,056 and 12,528,508,824 bytes. Candidate peaks are 8,027,034,952, 8,034,866,504 and 8,023,676,208 bytes. These physical observations do not authorize lowering the planner's reserve without an ownership change.

The first original run has CPU and process/request-paging exclusions; the first candidate run has a CPU exclusion. The later four runs meet their recorded timing conditions. The protocol requires all six eligible runs for its comparison, so no timing aggregate is published and no replacement runs are taken. The source is discarded for timing while retaining completed-task and memory evidence. This known calibration is not held-out noninferiority, sustained-rate certification, Auto qualification or a public release.


### Sequential expert replacement lifetime and unchanged state, October 4

[[sources/runs/2026/10/2026-10-04-sequential-affine-cache-allocation]] preserves the source-bound build, fourteen input refusals/accepted-header checks, complete native catalogue, real-model fixtures and final static suite. The copy contract is explicit and independent of the original profile. Each destination tensor finishes before the next replacement is issued. CLOCK decisions, staging bytes, canonical expert IDs, matrix geometry and reader lifetimes remain unchanged.

For this authenticated record, the largest packed piece is 614,400 bytes per expert. All three packed pieces and all six BF16 scale/bias pieces remain resident where required. The conservative floor workspace at 640 slots and 512 query rows remains 2,517,897,216 bytes; the distinct sequential profile reserves 1,566,031,872 bytes. These are derived allocation bounds, not measured process savings. Larger caches still pay for their own largest destination replacement and gathered admissions. Invalid replacement bounds and mismatched resource identities refuse.

| Check | Passing assertions | Physical process peak, bytes |
| --- | --- | --- |
| Speculation | 2,692 | 7,035,982,456 |
| Engine | 78 | 7,360,418,904 |
| Context | 1,444 | 8,083,443,528 |

All 22 frozen prior resident-head observations match exactly for emitted IDs, consumed boundaries and committed target/head state digests. The additional speculation assertions prove the sequential path ran and its actual intrinsic reservation agrees with the profile. The Engine checks also compare complete tensor bytes and CLOCK keys/reference bits/hand across ordinary and sequential admissions, repeated resident hits and warm resize. The staged context consumes the full admitted window and preserves exact rollback and refusal behavior. Each model process retains the ordinary ten-GB watchdog and three-GB real headroom; the Engine integration fixture's separate conservative planning envelope is recorded in its receipt.

The final static suite passes with identical before/after source manifests. Its sampled process-tree peak is 1,087,801,456 bytes. The frozen executable SHA-256 is `f8db9414ca20dc2f7bd706b0f9f63763396f514d414ae9c21f1605d0be6aa363`. All CI for the earlier streamed-draft commit `3608a4e10a94f240c89f4d59df5a224195a55f51` is successful. These checks do not qualify speed, held-out quality, vision, standalone distribution or another supported/automatic pack. A later performance experiment is a separate changed-candidate campaign.


### Sequential-copy actual-plan calibration with one timing exclusion, October 4

[[sources/runs/2026/10/2026-10-04-sequential-affine-calibration-with-timing-exclusion]] retains the complete prospective protocol, unchanged frozen tasks, source-bound executable, six run receipts, exact grader and host observations. The explicit allocation change is a new hypothesis; this campaign is not replacement timing for the earlier conservative profile. Both arms use the same 14 GB saved/physical ceiling, two streamed drafts and 8K requested context, with vision, prefixes and decode lookahead off. The preflight and headroom are unchanged at 17 GB and 3 GB.

The actual original plan uses 2,162 slots and a 1,024-token prefill chunk. The sequential candidate uses 1,817 slots and a 512-token chunk, while retaining its separately charged replacement workspace. Each of the six runs passes 15 of 16 tasks with the same names-only sorting failure. Within-artifact outputs are exactly repeatable and match all prior allocation outcomes. Original process peaks are 12,529,786,776, 12,615,819,112 and 12,551,331,664 bytes; candidate peaks are 9,346,701,528, 9,338,886,432 and 9,361,578,272 bytes.

Only the first candidate arm is excluded by sampled competing CPU load. The remaining five satisfy the recorded conditions, but the frozen all-six rule prohibits an aggregate. No replacement round or selected-round comparison is used. The source is discarded for timing while preserving functional and memory acceptance. Calibration, smaller observed memory and an unchanged task score do not establish held-out quality, sustained 20-token generation or Auto qualification.

### Bounded grouped affine expert checkpoint, October 4

The explicit grouped operator now computes the same affine target with a fixed thirty-two-expert RHS and bounded route tiles. It preserves the full-domain reference dispatch family, restores original router order and copies hot records into independent allocations before admitting them once in the existing global hot order. It changes neither original arithmetic nor default selection. Its resource profile deliberately retains the earlier conservative sequential-copy reservation pending separate allocation qualification.

The frozen integration binary passes 264 exact component comparisons, sixteen admission trajectories, 2,693 speculative assertions, the prior twenty-three emitted-token/committed-state observations, Engine/HTTP and memory/disk/cold continuation and recovery comparisons, and all sixty-four staged context observations through 32,768 tokens. Component, speculation, Engine and context process peaks remain inside the prospective ten-GB ceilings. The complete source-bound runs, two corrected compile failures and prior-main CI identities are captured in [[sources/runs/2026/10/2026-10-04-bounded-grouped-affine-experts]]. This is correctness and bounded-memory evidence, not speed or held-out quality qualification.

Next derive the grouped allocation's phase-by-phase bound, validate it independently and compare complete Engine plans under a new prospective protocol. Default Auto, supported packs and installed artifacts remain unchanged. Vision, held-out noninferiority, standalone distribution and full product qualification remain required.

### Explicit damaged-setup repair, October 4

A corrupt activation record now has an explicit recovery action. Under the existing owner lease, repair preserves an owned regular single-link record at an exclusive archive name, keeps the saved preferences and requires a new complete verification and health check. It refuses valid, replaced, symlinked or shared records and cannot run against an active or loaded owner. Ordinary retry still preserves the record in place. Queue resumption uses normal request admission and does not replay failed work or completed tools.

The complete Mac suite passes the scripted failure/recovery cases and native Light, Dark and System screens. The frozen real-model sequence also passes corrupt-record refusal, explicit archive, reauthentication, new healthy generation and a completed response while retaining the exact damaged bytes. Its process peak is 5,776,773,872 bytes under the prospective ten-GB watchdog; the development suite peaks at 1,843,318,624 bytes under its six-GB tree limit. Source identities, raw outputs and screenshot digests are in [[sources/runs/2026/10/2026-10-04-explicit-model-setup-repair]]. This closes damaged-history recovery for the original supported pack, without qualifying an alternate pack or a public release.

### Grouped allocation phase bound, October 4

[[sources/runs/2026/10/2026-10-04-phase-bounded-affine-memory]] captures the independent grouped allocation hypothesis and corrected functional qualification. At the declared maximum 512-token pass the workspace formula charges 623,597,568 bytes at 640 slots, 874,887,168 at 1,000 and 1,579,603,968 at 2,000. These are conservative policy bounds, not measured allocation peaks. They include the complete largest destination-piece copy and hot-record coexistence. The same formula can exceed the previous reservation at full model residency; a test incorrectly asserting universal reduction was caught before model work and repaired.

The corrected catalogue, nineteen input/protocol cases, speculation, Engine and staged 32K checks all pass. Catalogue, speculation, Engine and context peak at 1,439,450,384, 6,217,847,392, 6,617,650,168 and 7,833,505,584 physical bytes respectively. All twenty-three prior speculative output/state observations remain exact, the Engine retains the prior continuation/recovery observations, and context completes all sixty-four checkpoints. The unchanged 264-component/sixteen-admission gate remains the earlier run, not new evidence here. No performance or held-out quality inference follows. Original accounting and installed artifacts are unchanged.

### Grouped static acceptance checkpoint, October 4

The complete static suite passes against the same frozen grouped-memory binary, with matching before/after build inputs. This includes existing transport, installer, planner and public memory-override contracts. The guarded tree peaks at 1,089,783,992 physical bytes inside its six-GB ceiling, without loading a model. [[sources/runs/2026/10/2026-10-04-grouped-affine-static-acceptance]] preserves the complete raw gate and resource receipt. The new actual-plan timing pilot and remaining quality, vision, standalone distribution and integrated release gates are separate work.

### Grouped complete-plan calibration, October 4

[[sources/runs/2026/10/2026-10-04-grouped-affine-calibration-with-timing-exclusion]] records all six completed actual-plan runs. Both artifacts retain every prior same-artifact output and score fifteen of sixteen calibration tasks. At the same fourteen-GB ceiling the grouped candidate receives 2,116 slots, versus the preceding candidate's 1,817; the original receives 2,162 records of a different byte size. Candidate process peaks remain between 9,087,883,984 and 9,089,080,064 bytes, while original peaks range from 12,551,036,800 to 12,590,948,296. These are physical observations of the declared complete configurations, not permission to remove ledger reservations.

The first five timing cells are eligible. Background indexing and media/photo analysis disqualify the final candidate cell under the frozen competing-CPU rule. Preserve the campaign without a comparative aggregate or replacement rounds. No local speed or twenty-token qualification follows. Continue independent owned-vision, held-out quality and standalone artifact work; leave background services and the supported original pack unchanged.

### Owned candidate vision and prospective outcome analysis, October 4

[[sources/runs/2026/10/2026-10-04-owned-affine-vision-integration]] records an explicit image-capable grouped affine path. It captures the exact original configuration and preprocessing values, retains authenticated tower tensor owners, and propagates cancellation through bounded tensor reads. The separate image resource identity retains the tested text profile and its arithmetic, with vision residency and workspace charged independently. Metadata geometry does not reopen the original paths after capture.

The repaired frozen binary passes the native catalogue, all forty-nine image integration assertions and the unchanged original MTP/image diagnostic. Owned image features match the original component exactly. Two real tiny images exercise main-only versus drafted outputs, actual prefix reuse, HTTP equivalence, malformed-input refusal and text recovery, within the prospective physical ceilings. The first compiler failure is preserved; its missing diagnostic initializer argument was repaired before any model ran. This gate proves ownership and functional image integration, not image-answer quality or all advertised image capacities. No candidate enters Auto or distribution.

[[sources/runs/2026/10/2026-10-04-paired-outcome-score-instrument]] records a tested prospective paired binary-outcome analysis helper. Its constrained-discordance score bounds follow Tango's method, with simultaneous family bounds for a fixed-stratum design. Published witnesses and independent likelihood optimization agree. It does not pool heterogeneous strata, does not claim exact finite-sample coverage and never emits model qualification. Corpus provenance, independent task units, complete grading, sample counts, margins, family weights, multiplicity, safety and the actual held-out run remain separate gates. No final task has been evaluated and no noninferiority result is claimed.

The full static suite subsequently passes against that same frozen owned-vision binary with unchanged before/after native source inputs. [[sources/runs/2026/10/2026-10-04-owned-vision-static-acceptance]] retains the raw suite, planner/override/transport/installer checks and resource observations. This is implementation acceptance with no model loaded; it does not close the remaining held-out quality, image-capacity, standalone delivery, measured profile or promotion gates.

### Held-out grader and source preparation, October 4

[[sources/runs/2026/10/2026-10-04-heldout-grader-and-source-preparation]] records a Mac sandbox wrapper for the existing bounded coding executor. It preserves tuple/set fixtures, verifies copied source bytes, denies unrelated filesystem access, writes, network and forks, and treats failed worker startup as evaluation failure rather than model failure. The initial dyld/framework-launcher and test-registration failures are retained. Corrected helper tests pass on both local Python runtimes; the static-suite registration checks pass. These are changed-path checks after the separately recorded complete vision/static suite.

The pinned MBPP test population yields 249 verified restricted repair fixtures after prospective grammar, literal, reference-success and input-preservation checks. Every original passes and a deterministic broken variant fails; every excluded source case remains recorded. The draft and corrected actual-source graders agree on all 320 syntax-eligible cases. This defines a restricted coding population before model answers; it does not establish arbitrary-program quality or a final sample.

Exact public IFEval, MBPP, MGSM, BFCL and MMLU source versions and licenses are recorded. An isolated grader runtime is verified after a transient installer-observer failure, preserving the original failure. Correctly discovered, unchanged upstream IFEval tests all pass with fixed seeds and pinned tokenizer data. No final model answer, quality score or statistical qualification is produced. Multi-step executed tool evaluation, final independent task units and samples, margins/weights, runtime budgets and the held-out comparison remain open. Model, pack, public support and installed artifacts are unchanged by this instrumentation.

### Native conversation and offline tool-grader acceptance

[[sources/runs/2026/10/2026-10-04-executed-tool-conversation-instruments]] binds final native binary `e08f824fb793477dce1ed60263950efb3dec791844601ce04c04a00b216c3d88` to its build sources and unchanged resource protocol. The model-free framing catalogue and protocol negatives pass. Both original and grouped candidate execute three real HTTP requests and two resets, including cached tool-result continuation and exact cold recovery. Original peak physical footprint is 7,587,501,360 bytes; candidate is 6,011,752,888 bytes, inside the prospective ten-GB watchdog. These tiny instrument fixtures do not establish comparative timing or task quality. Original/candidate actual plans retain their distinct byte ledgers and slot counts.

The pinned BFCL base population has two hundred cases. Every unchanged gold trace passes the retained upstream state/response checker through the safe direct-call adapter, every empty trace fails, and a deliberately wrong filesystem fixture state fails. No reference call returns an execution or fixture error. The final adapter's largest observed worker footprint is 40,255,992 bytes under its prospective 256,000,000-byte ceiling. Six helper test groups pass on both Python runtimes, including real native denials and source-copy isolation; thirty-two static registration checks pass. These contain no candidate outputs and do not increase the number of independently evaluated model tasks. The original prototype and final guard/observation revision are both preserved.
The same frozen native binary subsequently passes the complete model-free catalogue and static suite, with matching before/after build inputs. Physical tree peaks are 223,249,296 bytes for the catalogue and 1,115,949,264 bytes for static acceptance, inside the six-GB watchdog. [[sources/runs/2026/10/2026-10-04-executed-tool-static-acceptance]] preserves the full outputs and resource receipt. No model quality or timing inference follows.

### Disjoint quality protocol pilot

[[sources/runs/2026/10/2026-10-04-disjoint-completed-task-quality-pilot]] preserves the fixed tasks, protocols, source/runtime identities, complete native transcripts, exact offline tool traces and both driver attempts. The first attempt fails before any model launch on a helper-directory hash. The corrected attempt finishes ten sessions in 2,729.316262 seconds. Original outcomes are facts 4/5, multilingual 5/5, coding repair 3/5, strict instruction following 4/5 and tools 1/5. The grouped affine control records 4/5, 4/5, 3/5, 3/5 and 1/5 respectively. There are three discordant pairs against the candidate and one in its favor, for totals of 17/25 and 15/25.

All responses come from actual fourteen-GB, 32K native plans with streamed original drafts and prefix retention. The process watchdog, actual preflight/headroom, request/session/campaign limits and before/after grader identities pass. These are sizing and instrument observations, not eligible speed measurements or held-out noninferiority. The smaller pilot reply/step limits, output truncation, step exhaustion and strict BFCL reference-response requirement remain explicit. No failed case is replaced. All underlying task IDs remain excluded from every final sample.

### Stored affine-three-bit reconstruction refit

[[sources/runs/2026/10/2026-10-04-affine-three-bit-refit-component]] records a prospectively bounded component screen of least-squares scale/bias fitting against the original four-bit parent. It uses the same three-bit/group-64 representation and actual BF16 dequantization error, with the unchanged control retained per group unless a trial improves it. The implementation is distinct from HQQ's robust proximal objective and uses no held-out activations or task answers.

Twenty component cases pass, including two synthetic shape/batching cases and eighteen real expert projections containing 29,491,200 values. Independent packed-code decoding, stored serialization and group-error reductions agree. The real component squared-error reductions range from 49.1930% to 49.4405%, with zero group-level regressions; maximum individual absolute error grows in twelve of the eighteen. The process peaks at 434,455,344 physical bytes and finishes in 14.261859 seconds inside its frozen four-GB/13-GB-preflight/three-GB-headroom and twenty-minute envelope. No complete model runs or new model weights are produced. This supports pricing a separate full conversion, without establishing quality, performance, original BF16 equivalence or promotion eligibility.

### Complete affine refit and outcome-instrument acceptance

[[sources/runs/2026/10/2026-10-04-affine-refit-full-screen]] records forty-eight refitted expert files totaling 52,848,290,992 bytes, produced in 3,355.410512125003 seconds with 966,214,376 peak physical bytes. Conversion stays within its separately frozen four-GB process and 430-GB staging reservations. Stored group squared error decreases by 49.28334082871262 percent.

The unchanged six-context model screen reverses that local weight-error result. Refit's macro KL is 0.5175330957912493 and top-one agreement is 0.7708333333333334. Minmax remains at 0.4326172687996428 and 0.8020833333333334; the original is 0.44401073962586735 and 0.7916666666666666. Matching reference/baseline hashes and unchanged baseline scores are checked explicitly. [[records/decisions/hold-unconstrained-affine-refit]] therefore holds this recipe. The screen adds no raw logits and supports no held-out quality, speed or BF16-equivalence claim.

[[sources/runs/2026/10/2026-10-04-complete-outcome-and-session-acceptance]] preserves the two hundred offline BFCL reference conversations through the completed outcome wrapper, full long-answer grader fixtures and seven prospective MOVER numerical diagnostics. These are zero-model instrument checks. The paired analysis remains asymptotic and uses independent task units, not tokens; the final method and sample must be selected before final answers.

The same source then compiles and passes native V2 sessions for the original and admitted minmax artifact. Each refuses the explicit oversized reservation, performs actual calculator use and consumes its result, reuses a prefix and reproduces the same answer cold. Physical peaks are 7,540,446,440 and 5,952,065,976 bytes, inside the ten-GB envelope. All negative protocols, the complete native catalogue and full static suite pass with before/after build identity equality. These checks qualify instrumentation and identity ownership only. Held-out task outcomes, image quality, complete performance, standalone delivery and promotion remain open.

### Serial campaign acceptance and prospective final selection, October 4

[[sources/runs/2026/10/2026-10-04-serial-outcome-campaign-acceptance]] retains the exact code, failed and corrected unit checks, real instrument sessions, recorded-response replay, full static receipts and successful prior-main CI. On the previously excluded pilot tool case, the original completes with seventeen executed calls and thirteen model responses; the candidate completes with sixteen calls and nineteen responses. Both final outcomes pass. The paired instrument finishes in 384.7173854589928 seconds. This larger prospective request envelope does not replace the earlier smaller-envelope pilot outcome.

After the input-envelope correction, a zero-model replay verifies all request histories and preserves those executed calls and outcomes. It also checks the historical native V2 success and context-refusal frames. Replay completes in 3.5612789160222746 seconds at a parent peak of 23,527,904 physical bytes. The complete subsequent static suite succeeds with a maximum sampled process-tree footprint of 1,076,316,296 bytes under its six-GB ceiling. These are instrument and process-bound observations, not speed or quality qualification.

[[sources/runs/2026/10/2026-10-04-prospective-heldout-outcome-protocol]] captures the final protocol and exact task data before generation. There are 2,219 independent exact prompt groups across five families and 138 paired jobs. The coding deduplication removes one additional eligible duplicate, leaving 243 repairs. MMLU has 105 exact duplicate pairs before pilot-group exclusion and fixed hash selection. Multilingual translations share one underlying unit. Public-source training overlap and semantic dependencies beyond exact grouping are not ruled out. [[records/decisions/final-paired-task-quality-protocol]] states the prospective method, margins and inconclusive-result policy. No final model score, twenty-token result or promoted alternate exists at this checkpoint.

### Three-bit transport fallback checks, October 4

[[sources/runs/2026/10/2026-10-04-three-bit-lossless-transport-planning]] preserves the previous builder, its complete original plan, the changed source, production codec identity and both raw test logs. All four synthetic test groups pass on both Python runtimes, with byte-exact codec reconstruction and whole-file hashes. The original twenty-five-file, 4,155-object plan retains digest b2119ac3fb9a3a0eb534d87075ceb9b893fc3bcaad5aeee3622337d88be9dac0. Header-only planning covers the control's forty-eight files and 52,848,290,992 bytes in 1,776 independent objects; no model or full payload read occurs. No compression-size, complete transport, public-pull, performance or model-quality claim follows.

### Outcome cleanup failure and correction, October 4

Main CI for e1777ff10373d86d4fc49f2ed6c2f6c1cf899b07 fails in the campaign's deadline test with a process-group PermissionError and unclosed stream warnings, despite the earlier completed local static suites. [[sources/runs/2026/10/2026-10-04-outcome-watchdog-cleanup-ownership]] retains that log. A deterministic barrier fixture using the frozen runner observes two termination owners, then drains its own tiny child once. The corrected runner's ten unit groups pass under both local Python runtimes with ResourceWarning elevated to an error. This is child-process cleanup evidence with no model loaded, not a repeated task evaluation, final quality result or speed qualification. Full corrected CI and all remaining product gates stay open.
