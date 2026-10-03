---
type: plan
meta-type: operational
id: 01m3yz0p8fprhjdshs3m6f82gy
created: 2026-10-02T18:46:22.223253+00:00
updated: 2026-10-03T19:25:49.022459+00:00
summary: Same Flash Next checkpoint, automatic selection with independent overrides, local validation on the available 48 GB Mac and conservative estimates for other configurations.
date: 2026-10-02
doc: plan
kind: milestone
level: '2'
order: '6'
title: Flash Next quantization and automatic memory implementation
---
Keep Qwen3.8 Flash Next as the same underlying model across the 16 to 64 GB Mac target range. Qualify a small set of weight representations, select one automatically for the Mac and its usable memory, and let the user override that selection and the memory ceiling independently. A separate runtime governor adapts allocations as system conditions change.

The engineering target is at least 20 committed generation tokens per second in each supported automatic profile. This is a target, not an achieved result or a guarantee for arbitrary manual settings, prompts, context lengths, SSDs, temperatures or competing applications. If a profile fails, keep that failure visible and continue the optimization work. Do not quietly lower quality, substitute another model or declare the hardware qualified.

Status on October 3, 2026: implementation in progress. The owner requested the full program after the three document review passes below. The initial bounded screen and existing-path memory fixes are implemented; bounded native complete-stack, 512-token prefill and greedy-sequence parity now pass; fixed mixed-class expert residency and complete resident text pass; the first generation-cost pilot remains below target, and bounded parallel demanded reads, code-object reuse and bounded allocator reuse now improve matched throughput while preserving parity. Candidate serving and qualification are not complete. Candidate winners, performance, quality margins and new operating thresholds remain experimental. The original document review loaded no model; subsequent implementation measurements are recorded separately in [[records/measurements/quantization-screen-2026-10-02]].

### Implementation checkpoint, October 3

| Work | Implemented and checked | Still required |
| --- | --- | --- |
| Baseline and inventory | Frozen bounded screen, installed-pack pilot, complete pinned shard-header/config inventories for VQ 2.1, 3.2 and 4.4 | Representative workload/power pilot and held-out protocol; all three VQ payloads and corrected reference traversal proofs are now verified |
| Candidate screening | Checked affine/VQ geometry, native Metal selected-row decoder, scalar row oracles, fused binding and complete-record composition parity, cost pilots, both projection shapes and affine width timings | Production generation and complete-task quality; all three native packs pass complete-stack continuation, 16-step greedy and sparse-selection checks with fixed mixed-class caches and resident text; larger packs additionally retain their frozen 512-token fixture |
| Existing adapter | Explicit affine descriptors and rejection of malformed or inconsistent per-module overrides; pinned arithmetic unchanged | Full candidate family descriptors; the foundation binary passed the complete existing-engine battery |
| Current Mac memory controls | Separate saved quantization, ceiling and live adjustment; migrate old preferences; preserve unavailable overrides; defer busy changes; bind applied load generations to responses; fixed-capacity pressure/recovery and real reload checks pass | Candidate-specific cost ranges and full candidate prepared-resource ownership |
| Quality instrument | Separate bounded full-vocabulary KL/top-1 scorer with hash/context validation and deterministic tests | Frozen noninferiority/latency rules, held-out tasks and confidence analysis; corrected matched outputs now favor continued VQ 3.2 engineering, without qualification |
| Product integration and promotion | Compiled baseline-only pack registry, default product Auto with explicit override, CLI opt-in/inspection and native settings; only the original pack is supported and new performance qualifications remain empty | Production VQ serving/speculation, dynamic candidate allocation, multi-pack transactional distribution/rollback and local qualification with conservative estimated profiles |

The materialize-then-multiply VQ prototype is a decoding and cost instrument. The recorded one-token kernel screen is much slower than the affine controls; it must not become the production decode path. This does not reject fused VQ. The follow-up fused binding passed selected-row bit equality against Python MLX and reached costs near the affine controls after removing redundant route synchronization. This is a component result. A bounded full-reference runner with quantized PLE row streaming now completes VQ 3.2 forwards. The corrected matched pilot now supports continuing VQ 3.2 engineering. Complete real expert composition and private array-context ownership now pass for both research packs. The first native dense block now passes the pinned candidate arithmetic and continuation checks. Direct native candidate checkpoint loading and a fixed short complete-stack/continuation comparison now pass for both packs. Complete 512-token prefill and its continuation now pass. A frozen 16-step greedy sequence also passes for both packs. Sparse selection through 2054 consumed tokens also passes. A synchronous complete-record bank also passes its real-fixture ownership checks. Model-wide mixed-class residency and complete resident text now pass. The matched parallel-demanded-read pilot improves committed throughput by approximately 39.49% with identical generated tokens. Code-object reuse then improves another matched comparison by approximately 19.13%. This narrow, below-target performance and unqualified task quality cannot justify moving product defaults early.

Reduced targets on the development Mac remain budget tests of that Mac. The October 3 owner correction below removes testing on other physical Macs as a completion dependency. Local quality, memory and performance work remains open; do not label this implementation checkpoint as completion of the whole plan.

### Available-hardware scope correction, October 3

The owner explicitly limited this program to the available 48 GB Mac and removed validation on real Macs with other memory capacities from the completion requirements. [[records/decisions/single-mac-quantization-validation]] controls this scope. Finish the implementation, local quality and correctness gates, paired performance evaluation, memory-target matrix and conservative estimates with the hardware available. Do not wait for, request or treat access to other Macs as a prerequisite.

Reduced ceilings measure allocation and performance on this Mac. Planner-only hardware profiles may exercise the 16 to 64 GB policy range without allocating fictitious memory. Other-chip and above-local-capacity results remain estimates; neither budget reduction nor extrapolation creates measured cross-Mac speed evidence. Keep the 20-token target visible and report each local result or estimated result with its evidence type. This supersedes earlier checkpoint statements and original rollout requirements that left real other-hardware qualification open. It does not relax pack quality, resource safety or local performance gates.

### Baseline Auto and runtime controls, October 3

The owner called out that research checkpoints had been treated as stopping points even though the requested program was end-to-end implementation. Baseline product ownership and controls now proceed independently; candidate admission and promotion still require the original quality, resource and performance gates. This does not declare steps 6 through 8 complete for an alternative pack.

[[sources/runs/2026/10/2026-10-03-baseline-auto-selection-and-live-memory]] records the implementation and checks. `ModelPackRegistry` binds the original checkpoint conversion, layout and full pinned file manifest, including preprocessing and the optional draft. Auto and an explicit original-pack override share this supported deployment. The registry contains no VQ candidate and no newly qualified automatic hardware profile. `slotstream model-packs` exposes these identities; an explicit `--quantization` opts CLI callers into the selector while omission preserves legacy custom-model behavior. A mismatched custom directory is refused without repair or replacement.

Mac preferences keep quantization, memory ceiling and live adjustment independent, with automatic defaults and backward-compatible restoration. Unsupported explicit pack IDs remain saved and block activation. Fixed live capacity keeps the startup cache while retaining pressure cancellation, feasibility checks and optional-cache cleanup. It cannot use a smaller proposed allocation as evidence that the held larger allocation still fits. The native views distinguish requested settings from the loaded configuration.

Applied configuration generations bind the registered manifest, actual engine arithmetic identity, context/features and complete load plan. The app publishes the engine only after initialization and identity construction succeed, guards admission across asynchronous release/configuration drains, and records each contributing generation in response metrics. The background verification proof is synchronized. The existing queue and tool-turn ownership remain in charge; no pressure path replays a turn or tool.

The complete static and Mac runtime suites, native catalogue and Light/Dark/System settings renders pass. Real-model checks pass fixed-capacity cancellation and exact recovery both with and without draft decoding, and a complete app cold/warm/deferred-change/reload/idle-release workflow. The latter proves that a running response retains its prior generation while the next load receives the new ceiling and live mode. The successor native build also passes the previously pending draft reference, streamed/resident, vision and row regressions. A production-only environment flag initially caused the research head to refuse before loading; a clean-environment continuation passes the unchanged fixture. The failed attempt and a repaired compiler-observation attempt are preserved in the same evidence source.

Remaining work is still substantive: production VQ serving and speculation, candidate byte costs and dynamic allocation, multiple-pack download/activation/rollback, held-out quality, complete-configuration paired performance on this Mac and conservative estimated profiles for other Macs. Neither the baseline controls nor component parity establish the generation-speed target. No alternate pack, installed application, public release or default artifact is promoted by this checkpoint.

The later CI result exposed an unloaded-settings regression despite the passing local suite: clearing an unused MLX allocator required a Metal library on a clean runner. [[sources/runs/2026/10/2026-10-03-unloaded-settings-without-metal]] preserves the failed CI and a local reproduction using a copied executable with no adjacent metallib. The release path now touches the allocator only if an engine was loaded. Both that isolated regression and the complete scripted Mac suite pass after the fix; the isolated case is now part of Mac CI. This correction does not change candidate qualification or waive CI acceptance.

### Three-class VQ 2.1 checkpoint, October 3

[[sources/runs/2026/10/2026-10-03-vq-2.1-payload-and-normalization]] records full verification of every tensor file and exact normalization agreement with the installed baseline. [[sources/runs/2026/10/2026-10-03-native-vq-2.1-three-class-parity]] records research-only native support for its three allocation classes. The earlier preparation checkpoint below remains historical evidence, not the current admission state.

The smaller pack now passes batched complete-stack continuation, sixteen self-fed greedy steps under compact and wide resident caches, and sparse attention through 2054 consumed tokens. Wide sparse process footprint remains below the fixed 10 GB envelope. Reference producers explicitly select the reviewed newer runtime while preserving and binding the older bundled source. Native metadata readers refuse absent or inconsistent execution identities and incomplete class coverage. Existing larger-pack fixtures still pass. No tolerance or golden changes were needed.

These gates establish numerical implementation within the bounded research path. They do not enable public Engine loading, production generation, arbitrary contexts, MTP, vision, dynamic bank resizing, Auto selection or artifact activation. The subsequent six-context quality screen below holds VQ 2.1 promotion and defers its throughput pilot. Product integration still depends on the task-quality and complete-configuration gates.

### Reference and tokenizer checkpoint

The bounded VQ 3.2 reference, corrected traversal proof, native baseline logit exporter and native CPU PLE row checks are recorded in [[sources/runs/2026/10/2026-10-02-bounded-vq-reference-and-ple]]. Full-reference feasibility does not finish step 4: ordinary native prefill/generation, mixed allocation ownership and independent draft metadata remain open. The VQ 4.4 artifact has also been fully staged and verified through the pinned research downloader, without product activation.

The bundle tokenizer is an explicit configuration choice, not an incidental file. [[sources/references/2026/10/2026-10-02-vq-tokenizer-compatibility]] proves that the inspected VQ files tokenize a Hindi example differently from the original, despite matching vocabulary IDs and normalized merge order. The owned six-case logit pilot uses the original tokenizer and identical frozen tokens for all arms. Any supported pack must bind those chosen preprocessing bytes and qualify them; do not silently install the upstream bundle's different behavior. Source lineage, full-payload identity, numerical parity and task quality remain separate evidence.

The first complete matched pilot exposed a normalization convention mismatch in both VQ reference arms. [[sources/runs/2026/10/2026-10-02-vq-pilot-normalization-diagnosis]] preserves the invalid scores and the independent all-norm tensor audit. The raw VQ norms require one explicit BF16 +1 fold for the pinned architecture; the baseline already stores the folded values. Old VQ feasibility/proof results are not semantic model-correctness evidence. Fresh proofs and pilot runs bind the corrected normalization adapter, and the scorer refuses the old producer receipts. This is an instrument repair, not a relaxed quality or parity threshold. The corrected matched pilot is now complete in [[sources/runs/2026/10/2026-10-02-corrected-vq-distribution-pilot]]: VQ 3.2 has lower full-vocabulary KL in all six contexts and higher average top-1 agreement, with a multilingual top-1 regression. This is favorable screening evidence only. It does not complete the held-out/task or product-integration gate.

### Scope and relationship to existing work

This work implements [[records/decisions/same-model-automatic-quantization-with-overrides]] within [[records/design/sevra-maintained-model-integration]]. It narrows this optimization program to one checkpoint family; it does not reverse the wider product's ability to maintain different qualified models in the future. Compatibility support below 16 GB and optimization above 64 GB remain separate work.

Reuse the approved VQ direction in [[records/decisions/vq-weights-behind-qualification-gates]], including its September 30 correction. Preserve the completed work in [[records/plan/whole-engine-optimization-2026-09-04]], the prefill plan [[records/plan/n6-prefill-bound-the-pass-then-read-each-expert-once]] and the separate lookahead experiment [[records/plan/expert-lookahead-local-experiment-2026-09-10]]. Do not implement the same mechanism twice or reopen failed experiments without a new falsifiable hypothesis.

The simplest initial release is the existing 4-bit pack plus one demonstrably useful alternative, using the existing verified download pipeline. More packs are justified only when they win for a measured memory-budget or quality preference on this Mac; application to other hardware is an explicitly estimated policy. There is no requirement to ship one pack per RAM tier, a generic model catalog, a GGUF backend or a new external runner.

### Current implementation and changes required

The code inspection baseline is repository commit `3fb9c3b`. Paths below are relative to the Slotstream repository; unprefixed engine filenames are under `Sources/Slotstream/`. Recheck these interfaces at implementation time because the plan is not a frozen fork of the code.

| Area | Existing behavior | Required change |
| --- | --- | --- |
| `Sources/Slotstream/Checkpoint.swift` | Global affine quantization fields and validation for the supported checkpoint, with n-gram grouping handled specially | Explicit, validated descriptors for each weight family and supported packing layout |
| `ExpertStore.swift`, `Plan.swift`, `SlotWritePlan.swift` | A fixed affine expert record, slot accounting, reservations and a shared CLOCK pool | Format-aware byte geometry, VQ-compatible allocation classes and exact reserve/pin/reclaim accounting |
| `Weights.swift`, `EmbeddingRows.swift`, `Layers.swift`, `NgramStore.swift` | Several independent assumptions about packed affine rows, scales and grouping | Audit every consumer; implement only qualified layouts, including bounded n-gram row decoding |
| `MTP.swift`, `MTPExpertStream.swift` | Draft loading and execution coupled to current model configuration | Independent draft metadata, compatibility identity and complete cost accounting |
| `PlannerCostModel.swift` | Costs and an empirical envelope for the existing pack and reference hardware | Per-pack costs, hardware-qualified evidence and explicit unknown estimates |
| `Governor.swift` | Live shrink/grow behavior, deadbands, pressure cancellation and safe mutation boundaries already exist | Retain these mechanisms; use the new byte ledger and test every supported allocation layout |
| `PinnedModel.swift`, `WeightStore.swift`, `SlotpackDownload.swift` | One pinned model and a verified, resumable download pipeline | A small allowlisted registry of immutable qualified packs and transactional activation |
| `apps/macos/Runtime/Performance.swift` and runtime integration | Automatic/custom memory controls already exist | Separate quant selection from saved ceiling, show actual applied configuration and schedule changes at safe boundaries |
| `Tools/serve_bench.py`, diagnostics and real app checks | Paired benchmark equality assumes the same artifact | Keep that gate and add a separate explicit cross-artifact quality/performance protocol |

CLI compatibility matters: `--memory-limit-gb` is the adaptive ceiling; `--memory-gb` selects the existing fixed-cache behavior. Do not silently reinterpret the latter or confuse these with the internal governor drill's `--max-memory-gb`. Keep existing library entry points, engine defaults and pinned clients working. Product Auto selection must be an explicit integration above the legacy pinned engine behavior.

### Candidate register and research limits

The first decision is which representations merit implementation, not which advertised bit count looks smallest. Compare full deployed packs, including the n-gram table, dense weights, metadata, codebooks, vision and optional draft weights. Download size, resident bytes and bytes read per generated token are different quantities.

| Candidate | Role in this program | Main uncertainty |
| --- | --- | --- |
| Current pinned affine 4-bit | Production baseline, compatibility path and rollback | Current costs and throughput need a fresh baseline for the tested binary and workload |
| Controlled affine 3-bit and 2-bit conversions of the same checkpoint | Cheap geometry and kernel screening; preserve sensitive families initially to isolate effects | Kernel support, group size, rounding and calibration may erase the byte advantage or damage quality |
| Flash Next VQ 2.1 and 3.2 builds | First-class candidates under the already approved VQ plan | Additional decode work, exact native support, mixed record sizes and whole-task quality |
| VQ 4.4 | Local quality reference required by the existing decision; a shipping candidate only if it independently earns a place | It is a quantized proxy for BF16, not BF16 ground truth |
| GSQ/RCO conversions of full Flash Next | Research comparator and potential later native export | Published GGUF layouts and conversion reproducibility do not imply native MLX compatibility |
| Swift variants | Separate fine-tuned checkpoint experiment, outside this same-checkpoint comparison | Changed training, behavior, licensing and deployment identity |
| Bonsai and pruned variants | Outside the primary path | Different model or capacity, so success would not establish this same-model promise |

The pinned VQ model card is preserved in [[sources/references/2026/09/2026-09-28-qwen-flash-next-vq-model-card]]. Its publisher reports VQ 2.1 close to their affine 4-bit conversion on a short prose evaluation, and VQ 3.2 closer to BF16. Those results are a reason to test, not proof of parity with Slotstream's deployed checkpoint or of reliable tool use. The advertised sizes include vision but exclude a separately distributed draft sidecar. Preserve those distinctions when comparing storage.

The verified VQ 2.1 headers in [[sources/references/2026/09/2026-09-30-qwen-flash-next-vq-expert-record-sizes]] establish three expert record sizes: 1,280,000 bytes in 37 layers, 1,382,400 bytes in nine layers and 2,611,200 bytes in the first two layers. Shared codebooks are additional allocations counted once per owner. Do not reuse these sizes for VQ 3.2 or 4.4 without inspecting their own pinned headers.

The [GSQ/RCO model card](https://huggingface.co/ISTA-DASLab/Qwen3.8-Flash-Next-GSQ-RCO-GGUF) supplies narrow published quality results, not native Slotstream measurements. Affine-compatible values still need a proof of exact conversion into supported packing; IQ/codebook layouts cannot simply be relabeled as affine. [GSQ tooling](https://github.com/IST-DASLab/GSQ) must have a reproducible path for this exact checkpoint before becoming a shipping dependency.

[Swift 1.5](https://huggingface.co/ukisai/Swift1.5-Qwen3.8-Flash-Next) and [Ternary Bonsai 2](https://huggingface.co/prism-ml/Ternary-Bonsai-2-27B-mlx-2bit) do not resolve the same-checkpoint quantization question. Keep them in a separate comparison if later requested. Similarly, a TensorFold or OptiQ bit label is insufficient: inspect every tensor family's effective bits, group size, retained high-precision layers, n-gram treatment and draft support before admitting any artifact. A third-party conversion of the same checkpoint can enter the register after that inspection; a fine-tuned, pruned or different-model artifact cannot enter this same-checkpoint path merely because its name includes Flash Next.

Pin original checkpoint, conversion code, calibration data provenance, tokenizer, template, architecture reference and every file digest. A controlled affine candidate that keeps the current n-gram/trunk is a new artifact with its own evaluation. A VQ-experts-only hybrid is likewise a new artifact: it cannot inherit the full VQ pack's published quality or reference parity. Reproducing the full VQ pack includes its n-gram representation.

The VQ 2.1 evidence pins upstream revision `8684640a3956b01c47f5d47f9b999e2ab8b985f1`. Pin and review the applicable architecture code as data before implementing it; do not execute newly downloaded remote model code in the app. Resolve redistribution and product-use permissions for each exact checkpoint, sidecar and conversion dependency before publishing packs. Retain required notices and license hashes in the manifest. A model card label alone is not that review.

### Success contracts

Four independent contracts apply. Passing one cannot compensate for failing another.

1. **Numerical correctness:** the current affine path retains its existing exact gates. Each new representation matches its own pinned reference under a specified arithmetic contract, with deterministic goldens and bounded kernel checks. Cross-quantization token identity is not required and must not be mistaken for the reference-parity gate.
2. **Task quality:** candidates pass the strengthened VQ quality gate where applicable, real app basics and a held-out task suite against current 4-bit. Similar quality must include structured tool calls, long conversations and completed tasks, not prose perplexity alone.
3. **Memory correctness:** observed process footprint, transient peaks, reservations and pressure handling stay within the tested safety contract. Accounting includes GPU allocations and allocations during load, resize, prefill, vision and draft operation.
4. **Performance:** locally tested automatic profiles are evaluated against their declared context/workload and sustained speed gate, with TTFT and complete-task latency reported as well as committed generation throughput. Other-Mac profiles use conservative estimates and explicit unknowns under the available-hardware scope correction; they cannot inherit a measured result or require unavailable physical testing to complete the plan.

Define committed generation throughput as accepted target-model output tokens, including generated reasoning tokens, divided by the corresponding generation interval. Exclude rejected speculative tokens from the numerator; include draft and verification work in elapsed time. Report visible-answer throughput and end-to-end request latency separately. Counting only visible tokens, only accepted fast intervals or raw draft proposals would change the promise.

Before collecting qualification data, freeze the tested prompt/context classes, generation length rules, cache state, reasoning/sampling settings, repetitions, thermal/power conditions, metric aggregation and uncertainty method. Use two complementary protocols: fixed-work diagnostic decoding for comparisons, and natural complete tasks for real latency and quality. Artificially forcing long outputs is diagnostic evidence, not a better task result.

Proposed local speed gate: every required scenario in a declared measured profile must have a conservative lower confidence bound on its predeclared typical committed decode rate of at least 20 tokens/s. Also publish tail stalls and short-answer latency. Select the estimator and sample count from pilot variance before the held-out run. Treat repeated runs and task instances as the sampling units, not correlated tokens as independent observations; account for the required scenario comparisons. Freeze exact timer boundaries, including treatment of the first token produced during prefill, so numerator and elapsed interval describe the same work. This gate supports the stated tested envelope; it does not establish an instantaneous minimum for every token or every possible workload. If the intended public promise is literally every configuration and every instant, the present evidence cannot support it.

### Two independent automatic controls

**Selection control** chooses a qualified pack and initial resource plan at setup or an idle load boundary. Inputs include chip generation and class, RAM capacity, a current headroom snapshot, storage capability, requested context/features, installed eligible packs, saved user choices and measured profile evidence or explicitly conservative estimated policy. Physical RAM alone never determines the answer.

**Runtime control** adjusts allocations within the active pack and saved ceiling as memory conditions change. It preserves checkpoint identity, request settings and user choices. A pressure event must not trigger a download, model switch, hidden context truncation or a permanent reduction of the saved ceiling.

| Weight choice | Memory ceiling choice | Selection behavior | Live behavior |
| --- | --- | --- | --- |
| Auto | Auto | Choose the highest-quality qualified configuration meeting the declared speed and memory envelope; derive a conservative ceiling | Shrink and regrow within that ceiling and current safety bounds |
| Pinned supported pack | Auto | Keep the chosen pack; derive a feasible ceiling | Same governor, no pack substitution |
| Auto | Custom | Select among packs that fit the user's ceiling and requested features | Adapt below the saved ceiling; do not overwrite it |
| Pinned supported pack | Custom | Honor both if feasible; explain conflicts before allocation | Adapt within the ceiling; reject or stop safely if no safe plan remains |

Manual overrides expose the maintained supported packs, not arbitrary remote checkpoints. An override can waive a performance recommendation, not tensor validation or allocation safety. Label a valid but unqualified performance combination honestly. A new installation defaults to Auto. Migrate existing installs by preserving their installed pack and behavior until the user accepts the offered selection change; the older promise of no silent replacement remains intact.

Keep the existing distinction between an automatic ceiling derived from the supported hardware/pack policy and the smaller initial target permitted by current headroom. Busy startup must not permanently lower the automatic ceiling. A custom ceiling persists across restarts and temporary shortages. Quant selection, ceiling preference and live adaptivity need separate state fields; the current planner source enum alone cannot encode all three. Tuned automatic caps and hard allocation limits must be separately named, so an empirical default is not presented as a physical limit. Change current supported override ranges only with their own memory validation. Preserve [[records/decisions/adaptive-memory-limits]]: a custom ceiling can exceed the automatic default within the supported hardware bounds; fixed-cache knobs and `--no-elastic` retain their independent semantics. Do not add a live speed tuner that keeps consuming more RAM merely because it is free.

Keep four separately observable values: physical capacity, saved memory ceiling, current planned target and observed process footprint. Also show the active pack, requested/applied context, effective features and the reason for an automatic choice. A user-facing target is a planning budget. Charge controlled transient allocations inside its total envelope, including resize overlap. Separately account for bounded OS/runtime uncertainty through the existing safety margin and the measured footprint gate; do not create an unpriced permission to exceed a custom ceiling.

Derive the displayed minimum and maximum from the same pack/context/feature ledger used by admission. Keep the hardware maximum stable as other apps open; report current availability separately. If a pack or context change makes a saved custom value invalid, retain it visibly and require a valid selection before loading, rather than silently clamp the preference. Test boundaries immediately below/at/above the minimum, feature activation thresholds, the automatic ceiling and supported hardware maximum. Reuse the current first-use and saved-value migration behavior.

Do not select a smaller pack because of one noisy sample or select a larger pack after every memory recovery. Use a conservative load-time snapshot and retained profile selection; existing governor hysteresis handles transient pressure. Reconsider Auto at the next explicit load, relevant setting change or accepted qualified update. If the incumbent no longer fits at load time, propose or choose an already installed eligible pack under the user's Auto policy and show the applied choice. An additional large download requires the existing explicit offer/accept flow.

### Byte accounting and pool design

Replace arithmetic derived from a single `recordBytes` with an immutable validated layout descriptor. It names tensor shapes and dtypes, bit layout and padding, group sizes and axes, scales/biases, codebook ownership, row/record lengths, required alignment, tensor and expert file ranges and kernel compatibility. Preserve exact validated range coverage through Slotpack decompression, tensor indexing and asynchronous expert reads; reject path escapes and conflicting ranges using the existing bounded decoder rules. Checked arithmetic must reject overflow, overlaps, out-of-file ranges and unsupported mixtures before allocation or GPU dispatch. Test short files and corrupt metadata.

Build one ledger with these ownership categories: resident trunk and embeddings; n-gram cache and read staging; expert banks; shared VQ codebooks; KV and recurrent state; prefix cache; draft weights/cache; vision buffers; prefill workspace; read queues; allocator cache and bounded transient resize/load workspace. Count aliased unified-memory storage once. Measure physical-footprint consequences instead of adding RSS and Metal memory as though they were disjoint. A live replanning snapshot may credit this process with memory it would release, exactly once, while protecting non-reclaimable active state. Keep this credit distinct from the admission check for new incremental allocation, and never credit another process or file cache twice.

Admission uses the minimum of the user's ceiling, the validated resource policy and real current headroom, with explicit reserves. Metal's recommended working set is a bound or signal, not a measurement of free RAM. All internal byte math uses integer bytes; convert explicitly at GB/GiB display boundaries. An estimate above measured hardware or context evidence must be marked unknown or bounded, not emitted as a fabricated throughput curve.

For VQ, use compatible allocation classes or pages from the first useful prototype. Allocating every record at the largest early-layer size gives back most of the cache advantage. The initial 1,382,400-byte-unit hypothesis is superseded for the inspected packs by the artifact-bound allocation-class audit below. Actual record classes are 1,843,200 and 2,611,200 bytes in VQ 3.2, and 2,611,200 and 3,225,600 bytes in VQ 4.4. The validated descriptor triple defines class membership; layer position or a nominal bit label does not. The fixed-bank prototype validates contiguous MLX backing separately for each class. Larger production banks and their allocation/transient bounds still require qualification.

Keep CLOCK as the initial eviction policy under [[records/decisions/clock-stays-the-eviction-policy]]; variable allocation geometry alone does not justify an unmeasured replacement policy. Separate class-capacity and fragmentation effects from policy effects in native replay.

An expert's complete record is the atomic cache item. Maintain logical expert-to-bank/offset mappings; reserve every required segment atomically; do not expose partly filled records. Pins cover the entire record until all GPU uses complete. Eviction, cancellation and shrink release all associated units exactly once. Shared codebooks outlive every dependent command. Neither speculative reservations nor optional prefetch may starve the minimum working set required by demanded experts.

Prove the minimum feasible pool from the maximum simultaneously pinned expert set of each admitted operation, including overlapping read/GPU work and draft execution. Reserve prefill sweep workspace separately. Reserve KV/recurrent growth through the admitted context limit, or use an explicitly bounded incremental reservation protocol before each growth operation. Pressure may reduce optional cache capacity, not the promised context of an admitted request. Record capacity stranded in size classes and fragmentation; a nominal total byte budget is insufficient if one required class is exhausted. Regrouping experts for kernels must restore routing/output order and the reference's numerical contract. Do not treat cache hits as permission to change arithmetic.

Preserve safe resize boundaries, generation fences and cancellation already present. Tag asynchronous reads, governor actions and pool mappings with the active configuration/pool generation. Ignore stale completions after resize or unload, drain GPU uses before reuse and verify cancellation cannot publish a record into a new pool. Shrink first reclaims optional caches, speculative reads and unused experts within the existing policy. If the committed working set cannot fit, cancel or defer new work safely and explain it. Never free pinned buffers to obey an impossible target. Growth waits for sustained headroom and fits peak old/new allocation overlap; otherwise grow incrementally or stay smaller. Preserve current thresholds until new measurements justify changes under [[records/design/measured-operating-policies]].

### Weight formats and execution

Start with exact-layout fixtures and representative layer microbenchmarks, then an end-to-end native path. Lower bit width is not automatically faster: padding, unpacking, scale loads, gather patterns, GPU occupancy, read amplification and changed cache hit rates all matter. The existing decode profile's read and GPU sample proportions are not a serial timing decomposition from which to promise an Amdahl speedup.

For affine trials, derive real payload sizes from the exact shapes and group sizes, including scales and biases. Check the pinned MLX runtime's support for each operation, not just whether a conversion utility accepts a bit count. Keep sensitive families unchanged for the first controlled trial, then evaluate any further family changes independently. Do not assume a 3-bit group-32 pack is cheaper than every 4-bit alternative after overheads.

For VQ, implement bounded expert decode/gather and n-gram lookup, retaining shared codebooks. Compare fused lookup/matmul with bounded unpack-then-matmul where both satisfy the reference contract; never materialize the full model or n-gram table. Match all supported packed integer encodings and padded dimensions explicitly. A header parser that accepts the pack is not an inference implementation.

MTP has its own pack identity, layout and measured memory cost. Do not decode draft weights with the target model's global bit setting. Test MTP off/on against the same target artifact, then compare each candidate's best qualified complete configuration to the deployed baseline including its existing MTP. Rejected drafts, extra verification reads and lost expert residency can make a smaller candidate slower overall. Preserve exact-mode contracts and distinguish them from sampled-distribution or batched-rounding tests.

Treat lookahead, prefix reuse, prefill sweep, n-gram cache sizing and allocator policy as interacting optimizations. Measure net task latency after their combined memory cost. Keep existing successful optimizations; do not credit their speed twice. Test a newer MLX runtime as a separate controlled variable before combining it with quantization, following [[records/decisions/kernel-upgrade-fidelity-and-cache-equivalence]]. The current runtime already includes optimized dispatch, so a version bump alone is not a speed argument. KV quantization and lower-precision activations are later, independent candidates because they alter cached state or arithmetic; neither inherits the weight pack's quality result. Reject unmeasured expert dropping, speculative token acceptance shortcuts and hidden context reduction as ways to reach the target.

### Evaluation design

Use sequential gates to avoid building a large product path for a losing candidate.

**Feasibility screening:** inspect pinned headers, compute actual storage/resident/record geometry, test pack decoding and representative kernels, and sample read amplification and cache behavior at safe budgets. Reject formats that cannot fit the minimum operating floor or cannot plausibly improve the measured bottleneck. Screen the approved VQ 2.1/3.2 layouts and an affine 3-bit control first; retain affine 2-bit as a lower-memory hypothesis only if its early quality evidence warrants more work. Do not commit to the engineering cost of every format before this screen. A kernel win or smaller file is not qualification.

Before full conversion or reference generation, write a local resource budget covering total download/staging/rollback disk, conversion RAM, reference-logit storage, compute time and expected run count. Prove that the VQ 4.4 reference can produce the required outputs within available memory using a pinned bounded execution path, sequentially with the candidate. If it cannot, obtain an exact reproducible reference artifact or measured hardware access; do not silently replace the mandatory reference with publisher summary scores. No paid compute is authorized by this plan.

**Reference parity:** keep existing affine goldens unchanged. For each candidate, freeze exact reference code, runtime, preprocessing and arithmetic mode. Verify representative tensors, every packing edge, layer outputs, model logits, greedy generation and relevant continuation/cache paths. Any permissible tolerance must be specified with rationale before observing candidate errors; do not relax the existing VQ exact-parity decision silently. If exact parity needs a policy revision, record that decision before qualification proceeds.

**Quality comparison:** measure current 4-bit and each candidate against the VQ 4.4 reference on identical frozen token contexts, including realistic tool and continuation states. Preserve the decision's KL/top-1 gate. VQ 4.4 remains a proxy; results against it are not a proof of BF16 equivalence. Full-vocabulary KL and a top-k approximation are different metrics. If reference storage is bounded with top-k logits, define residual mass handling and call the result an approximation; do not compare it numerically with an incompatible publisher scorer.

Add held-out complete-task evaluation: instruction following, tool schema validity and successful execution, coding fixes with tests, factual tasks, multilingual use, long-context retrieval/continuation and the product's ordinary workflows. Freeze prompts, environment, seeds/settings, graders and task-family weights. Keep calibration, pilot and final evaluation examples disjoint. Grade final outcomes and tool traces, not just the assistant's claims of success. Run `sevra-mac-checks --real-basics`; qualify vision separately before a profile can advertise images.

Proposed noninferiority margins for discussion are no more than two percentage points loss overall and five within a task family, with a predeclared one-sided paired confidence method. They are engineering proposals, not accepted evidence or universal definitions of similar quality. Choose margins that reflect product harm, estimate sample requirements from the pilot, then freeze the protocol before the held-out run. Structural safety and deterministic schema checks remain hard gates regardless of average score. Cap evaluation cost and handle multiple candidates/categories explicitly; inconclusive results do not qualify a pack. Do not keep sampling until a preferred candidate passes.

Use a first workload matrix of short first turns, multi-turn tool use, and total admitted contexts around 2K, 8K and the current Mac app's 32K default, with output space reserved inside the context limit. Test higher context limits only for profiles that expose them. Exact tokenized fixtures and generation lengths are frozen in step 1. Freeze maximum acceptable TTFT and complete-task regressions before candidate results, alongside the absolute decode target; a speed win cannot excuse an unbounded startup or prefill regression.

**Performance comparison:** interleave paired runs on the same actual Mac, binary, requested context, memory ceiling and workload. Preserve raw outputs and failures. Separate cold-load/first-use, warm operation, fresh prompts, prefix hits/misses, short/long prefill and sustained generation. Report TTFT, committed decode, task completion time, tail stalls, bytes read, cache hit/miss and read amplification, peak process footprint, pressure events, draft acceptance and power/thermal state. Report both equal-budget comparisons and Auto's actual recommended configuration so the result cannot be won by quietly granting extra memory or shrinking context.

`Tools/serve_bench.py` must keep its same-artifact output-equality check. Add a separate cross-artifact mode or harness whose result schema records both artifact identities and quality outcomes. It must not silently disable equality for ordinary regression runs. A changed completion length or routing trace is part of a quantization result, not a reason to discard a slow candidate. Fixed-work diagnostic results can isolate implementation cost but cannot replace natural completion results.

Clean timing eligibility and functional acceptance remain separate under [[records/decisions/global-paging-is-diagnostic]]. Record system paging, competing load and discarded timing reasons; do not fail a correct memory/governor run solely because global swap counters increased. Use one model process at a time, real reclaimable-memory preflight and the existing small explicit budgets for routine gates. Do not use memory-hog stress tests or simulated availability above actual headroom. Exceptional existing drills retain their exact documented preflights and sizes.

### Available-Mac validation and conservative estimates

The [[records/machines/macbook-pro-m5-pro-48gb|development Mac]] is the only required physical test machine: an M5 Pro with 48 GB of unified memory. The owner correction in [[records/decisions/single-mac-quantization-validation]] replaces the original multi-machine qualification requirement. Other-Mac access is neither expected nor a completion or release dependency.

Use explicit lower memory ceilings to test planner choices, allocations, cache residency, resize behavior and performance on this chip and SSD across safely feasible budgets. Keep one model process, real headroom and the existing bounded test protocols. Smaller budgets do not reproduce another chip's bandwidth, GPU resources, storage, thermals or OS pressure. Exercise chip/RAM policy boundaries with deterministic planner-only fixtures; a simulated capacity never authorizes a real allocation above current headroom.

For configurations beyond local capacity, including 48 to 64 GB planning, retain conservative defaults and use bounded geometry estimates. Additional RAM may be spent on context rather than expert residency, and bandwidth may differ. Do not extrapolate a throughput curve beyond its measured range as if it were a tested result. Where a defensible speed estimate is unavailable, report it as unknown and use the existing safe supported policy. Default Auto and supported overrides still operate; missing external hardware does not disable them.

The profile registry separates measured local-budget results, estimated other-hardware behavior and unknown evidence. Each local row binds chip, RAM, storage, OS/runtime/binary, pack and sidecar hashes, context/features, ceiling, cache policy, power/thermal state and raw evidence. Each estimate names its measured anchors, byte geometry, assumptions, limits and conservative fallback. Never assign a measured 20 tokens/s badge to an estimated profile. Version both with the deployed engine, kernels, pack and policy; material changes trigger the affected local checks and recalculation of estimates.

Record format support, quality qualification, memory behavior and speed evidence separately. The existing baseline may remain a supported fallback without satisfying the new speed target. Unknown or failed evidence never becomes a positive qualification flag. Physical other-Mac runs are optional future evidence, not unfinished work in this plan.

Select among locally qualified packs using the user's required features, validated resource feasibility and the best supported speed/quality evidence, with deterministic tie-breaking. Apply conservative estimated policy to other Macs and preserve explicit overrides. If no candidate meets 20 in a measured local profile, retain a safe supported configuration and record the unmet target. Do not change model identity, lower the quality gate or relabel estimates as measurements to manufacture success.

### Downloads and configuration transactions

Extend the pinned manifest registry and existing Slotpack verification rather than introduce a service that requantizes models per user. Publish reproducible prebuilt packs through the existing mirror, at immutable revisions with digest and decoder bounds. The app accepts only supported manifest versions and its trusted allowlist; a mutable upstream model card cannot redefine an installed artifact.

Registry entries contain model/checkpoint identity, quantization and layout version, component hashes, tokenizer/template identity, engine/runtime compatibility, optional features, on-disk sizes, load/transient resource requirements and qualification references. Draft and vision components are separate capabilities. An absent or corrupt optional component must not be reported as installed or silently change a pinned feature setting.

Use resumable range downloads, hash validation, atomic completion and an activation pointer. Preflight space for the installed pack, compressed/download staging, decoded output, temporary duplication and chosen rollback retention. Reflinks, hardlinks or cross-pack deduplication are optional later optimizations and may share only byte-identical immutable content. Do not make a content-addressed rewrite a first-release dependency. Never delete a pack still used by a request or another process.

A switch transaction is: resolve settings and candidate; validate compatibility/headroom/disk; obtain any required download acceptance; stage and verify; wait for an idle boundary; stop admission; release old runtime resources; load the new pack; perform a bounded health check; atomically commit the active identity/settings; resume admission. Keep only one model process/runtime allocation at a time. Recheck real headroom immediately before each large allocation, including after the old runtime is released and memory readings settle. If loading fails, release partial resources and restore the last known good applied configuration if it fits; otherwise remain unloaded with a clear recovery action. Mark the requested change failed without overwriting the saved preference. Work submitted for that failed requested configuration stays deferred or returns a clear error; it must not silently run against the rollback pack. Do not retain both models in RAM for rollback.

Persist enough transaction state to recover after interruption at every stage. Incomplete downloads cannot appear installed; a staged pack cannot appear active; an active pointer cannot assert a successful health check that did not finish. Rolling back weights invalidates incompatible derived caches but preserves conversations, files, memory, permissions and user preferences. User-selected old packs remain usable while supported; disk cleanup is explicit and never deletes user data.

Bind each admitted request to a configuration generation containing pack identity, tokenizer/template, arithmetic/runtime mode, context, features and resource reservations. Settings can be saved while busy, but applied settings change only at the boundary and the UI distinguishes them. Each in-flight request retains its previous ceiling until completion or explicit cancellation; the OS-pressure path can still force safe cancellation. Serial ownership covers request admission, settings activation and model lifetime so a newer preference cannot race an older load into becoming active. Revalidate queued work before admission; release or rebuild already prepared token/image resources if its configuration changed. Do not silently reinterpret a prepared request with another template.

Prefix/cache keys include all state that affects compatible computation. Preserve aligned continuation requirements and current same-artifact hit/miss goldens; different chunking is not assumed byte-identical. On cancellation due to pressure, tools already executed remain recorded. The runtime must not automatically replay an application turn or tool action as a side effect of reloading or shrinking memory.

### Implementation sequence and exit gates

| Step | Deliverable and dependency | Exit gate or failure action |
| --- | --- | --- |
| 1 | Freeze baseline, artifact inventory and experiment protocol | Reproducible existing-pack results and a resource ledger; no UI expansion yet |
| 2 | Cheap affine/VQ geometry, kernel and quality pilot | Rank plausible candidates using measured cost and quality; stop unsupported/losing formats early |
| 3 | Quant descriptors and compatibility API with existing 4-bit adapter | Existing acceptance battery and fixed clients unchanged; corrupt layouts refused before allocation |
| 4 | Native candidate pack path, mixed VQ allocation classes where needed, bounded n-gram support and separate draft metadata | Reference parity, record ownership/pin invariants, exact pack conversion checks and minimum-memory proof |
| 5 | Held-out quality plus paired complete-configuration performance on the available development Mac | A candidate wins at a safely tested memory budget without failing quality, memory or latency gates; record the limits of applying that result to other chips and storage |
| 6 | Per-pack cost model and governor integration | Shrink/regrow, floor refusal, cancellation, prefix and feature interactions pass with unchanged saved choices |
| 7 | Deterministic Auto policy and independent overrides in engine integration, CLI diagnostics and Mac settings | Selection truth table, persistence, request-generation binding and legacy behavior pass |
| 8 | Transactional distribution, migration and recovery | Fault injection across download/verify/load/activate/rollback preserves one runtime and all user data |
| 9 | Local qualification of the integrated release, measured and estimated profile registry, and staged opt-in upgrade | Rerun affected gates after steps 6 to 8 on this 48 GB Mac across safe lower targets; other-Mac profiles carry conservative estimates, assumptions and fallback behavior rather than required physical-hardware runs |
| 10 | Default promotion, docs and release | Claims match qualified scope, old pack remains recoverable, monitoring is local and voluntary reports are user-reviewed |

Steps 3 and 4 may use a minimal experimental harness before product integration. The VQ reference and quality harness can be prepared during screening; neither requires shipping the pack. Steps 6 through 8 depend on a candidate earning product integration, although general existing-path memory defects found earlier should be fixed independently. Testing on other physical Macs is outside the required program. Optional future reports may refine estimates, but their absence cannot block implementation, local acceptance or release.

For each step, record code commit, exact artifacts, commands, machine, raw run paths, verdict, limitations and rollback. Capture raw measurement output under `db/sources/runs/` before interpreting it. Update canonical measurement/claim records and generated projections with behavior changes. There are no day estimates until pilot data reveals the kernel, conversion and hardware-access costs.

### Required failure scenarios

The following are release criteria, not optional exploratory tests:

- A custom ceiling below the pack's minimum yields a clear refusal before large allocation; a pinned pack is not silently replaced.
- Auto selects only installed/accepted qualified content and remains deterministic when telemetry is missing; an offline install stays usable.
- Memory falls during prefill, decode, vision preparation or draft verification; pins, resources and terminal request status remain correct.
- Memory recovers after shrink; the governor regrows only within the original saved ceiling, without a quantization change.
- One VQ size class is exhausted despite spare bytes elsewhere; required experts cannot deadlock behind optional prefetch.
- A resize would temporarily need both old and new banks; admission accounts for the overlap and retains a safe fallback.
- An old read or governor callback completes after resize/unload; it cannot mutate a new pool or resurrect released resources.
- The user changes pack, ceiling or context during a request; the active request keeps its bound settings and queued work is revalidated.
- A pack download is interrupted, disk fills, a range/hash is wrong or a component is missing; the current installation remains valid.
- The app quits between verification, unload, load, health check and activation; recovery never exposes a half-installed pack.
- A requested pack fails its health check; rollback is visible and work requiring the failed configuration does not run on the old pack.
- A new pack or runtime invalidates a prefix cache; durable conversation state survives and incompatible cache state cannot be reused.
- A pressure cancellation follows a completed tool action; recovery does not execute that action again automatically.
- A candidate passes prose quality but fails agent tasks, or reaches 20 only by disabling a required feature; it does not qualify that profile.

Use deterministic metadata/unit fixtures and bounded fault injection for lifecycle failures. Extend the existing `Tools/context_proxy.swift`, `Tools/memory_override_gate.py`, native performance checks and `Tools/check_sevra_memory_ui.sh` instead of building parallel memory-control suites. Check Mac Light, Dark and System appearances and clear pending/error states; preserve readiness preferences independently of pack and ceiling choices. Run the existing engine acceptance battery and real application checks for behavior that depends on the native runtime. Do not substitute tests that merely restate the implementation for end-to-end ownership and recovery checks.

### Review record and unresolved evidence

Pass 1, implementation and source contracts: checked the draft against checkpoint validation, embedding and n-gram consumers, draft configuration, geometry, governor growth checks, Mac performance preferences, planner costs, benchmark equality and the existing VQ decision. Added the independent automatic ceiling/current target state, retained custom-ceiling persistence, incremental allocation versus reclaim credit, bounded reference-generation feasibility and explicit resource budgets. The candidate register includes the previously omitted approved VQ path, mixed-size storage and n-gram requirements.

Pass 2, failure and state transitions: walked through all four preference combinations, pressure during active work, mixed-class exhaustion, late read callbacks, setting changes during load, failed activation, restart and rollback. Added generation-tagged read/governor actions, bounded context growth, a fresh headroom check at allocation, serial settings/admission ownership and explicit treatment of work queued for a failed pack. Rollback cannot silently defeat a manual override or replay a tool action.

Pass 3, whole-program and evaluation review: checked phase dependencies, the rollout path, cost, source limits and the meaning of the performance promise. Prioritized VQ screening alongside an affine control, separated runnable/quality/memory/speed evidence, removed a development-Mac-only win as the condition for a low-memory candidate, required final requalification after integration, and added a concrete context matrix plus frozen latency/statistical protocols. Kept one useful alternative as the initial shipping scope and preserved unresolved hardware/quality results as explicit gates. Document review establishes plan consistency, not model quality or performance.

Remaining experimental questions are explicit: which affine/VQ configuration wins; whether native VQ kernel overhead is acceptable; how n-gram and draft choices affect quality and memory; which same-model profiles can reach 20 on slower chips; and what quality sample size is affordable and decisive. Each has a gate above. If no same-model configuration meets the low-end target, report that conflict to the owner with the measured alternatives. Choosing a different model or changing the promise is a separate decision, not a hidden fallback.


### Native record checkpoint

[[sources/runs/2026/10/2026-10-02-native-vq-complete-records]] records exact complete expert composition for both packs and caller-context replacement regression checks. Experimental VQRecordBatch owns complete bounded records, and VQRecordLayout distinguishes geometry even when byte counts match. This is still immutable staging. Mutable banks, pins, required-read priority, cancellation/generation fences and resize overlap accounting remain open. Native dense-block arithmetic must explicitly match the pinned reference before full-model parity can be claimed; the deployed adapter's arithmetic remains the compatibility baseline.


### Native arithmetic checkpoint

[[sources/runs/2026/10/2026-10-02-native-vq-trunk-profile]] records exact first-block output/state parity for the byte-identical fixtures from both verified packs, and unchanged full-model baseline logits on one frozen pilot case. Candidate grouped normalization, query/key normalization, quantized injection and recurrence are explicit internal arithmetic choices. The deployed profile remains the default. This is an experimental block harness, not full candidate loading; QSA, PLE, draft/rollback, mixed pool ownership, held-out tasks and performance remain required before product integration.


### Direct-read foundation

[[sources/runs/2026/10/2026-10-02-native-vq-owned-file-reader]] establishes the native owned-descriptor primitive on bounded synthetic files. Complete payload verification, extent checks and cancellation precede publication of bytes. Authentication against the pinned pack inventory and wiring real routed expert/PLE reads are the next dependencies; the primitive alone does not complete native checkpoint loading or pool-generation fences.

### Authenticated short-stack checkpoint

[[sources/runs/2026/10/2026-10-02-native-vq-authenticated-checkpoint]] binds the owned file reader to both exact research artifacts and compares actual expert/PLE payloads with their fixtures. [[sources/runs/2026/10/2026-10-02-native-vq-complete-stack-smoke]] records exact hidden/state/logit equality through every layer for fixed passes of three tokens followed by one continuation. Both packs pass all 320 observed boundaries, including the complete vocabulary head. This is a bounded text arithmetic check, not ordinary prefill, generated output, sparse indexer activation, mutable caching or a throughput measurement.

[[sources/runs/2026/10/2026-10-02-vq-bf16-sigmoid-arithmetic]] preserves the first QSA-layer failures and their localization to BF16 sigmoid rounding. A candidate-only precise exponential with explicit BF16 intermediates matches the pinned Python finite-domain reference. The deployed arithmetic remains unchanged. Failed diagnostic attempts are preserved with the eventual FP64 test-input diagnosis. No public pack admission or selection changes follow from these component results.

[[sources/runs/2026/10/2026-10-02-native-vq-complete-stack-validation]] records the repaired exhaustive sigmoid gate, all 95 native T0/T1 checks passing with no skips, unchanged deployed full-model logit bits on the fixed memory-prose case, fresh baseline payload verification and six metadata rejection cases. The v7 inference sources are identical to the independently passing v4 complete-stack sources; only the diagnostic input/readback file differs. These checks do not replace the complete heavyweight app, governor and hardware qualification gates.

The frozen v7 complete static suite also passes in [[sources/runs/2026/10/2026-10-02-native-vq-complete-stack-static]], including planner, memory-override, transport and installer gates. The first attempt stopped on a source-wrapper token list interpreted as a wiki-link; the authored wrapper was corrected without changing its raw transcripts. This result applies to the authenticated short-stack checkpoint, before subsequent batched-route changes.

### Partitioned fused-route checkpoint

[[sources/runs/2026/10/2026-10-02-native-vq-partitioned-route-parity]] records bounded complete-record partitions with explicit original-batch arithmetic dispatch. Small local partitions cannot accidentally change the D8 reduction method. The component gates compare exact projection bits across the dispatch boundary, then exact complete SwiGLU at capacities of one, two, three and thirty-two experts, including duplicate routes and restored pair order.

Both pinned packs retain exact original short-stack outputs and pass a new eight-token pass plus three-token continuation through all 320 observed hidden/state/logit boundaries. Each larger run exercises two staging partitions and at most 32 live expert records per batch. All 95 native catalogue checks pass without skips. The source, artifact and reference identities are frozen. Compilation and these numerical/ownership checks cover this increment; the preceding full static suite is not claimed as freshly rerun.

This is synchronous immutable staging. It does not supply persistent residency, mutable cache pins, asynchronous generation fences, resize accounting or a production memory governor. The larger-batch upstream prefill path beyond 4,096 routed pairs remains a separate implementation/parity gate. Eleven functional tokens do not establish task quality, latency or committed generation speed.

### Segmented prefill component checkpoint

[[sources/runs/2026/10/2026-10-02-native-vq-segmented-prefill]] records the pinned large-prefill dispatch audit and exact native expert composition for both packs at 410 and 512 prompt rows. The actual default is fused segmented GEMM, with recorded kernel flags and executed variant names. The reference's fixed decoded-expert chunk of 32 affects only its fallback; it is not evidence that the admitted large-prefill path materializes decoded matrices. No prior measured outputs are retracted by this dispatch clarification.

The native wrapper uses the exact reviewed segmented kernel and its preprocessor specialization, preserves complete expert token segments across storage partitions, and restores routing order. Sixty-four real experts with skewed routes exercise two staging batches, partial tiles and both codebook placements. Complete SwiGLU outputs match exactly in both inspected layer families and both packs. All 95 native catalogue checks and the reference/source unit checks pass. These are component results with bounded process-memory supervision, not full-model prefill or timing qualification. Full-model attention, PLE and recurrent state at these batch sizes are the next parity gate; mutable residency, native generation, quality and speed remain open.

### Complete prefill checkpoint

[[sources/runs/2026/10/2026-10-02-native-vq-complete-prefill]] records exact complete-model prefill and one-token continuation for both research packs. All 320 full logical tensor boundaries match the pinned reference, including hidden output, recurrent/convolution state, PLE, QSA caches, indexer keys, final mixer and every vocabulary logit. The original 512-row head shape is retained. All 48 layers use bounded segmented expert staging, with at most 32 expert records live per batch. This remains a synchronous diagnostic with one dense block live at a time; its low process peak does not establish the production resident-memory floor.

[[sources/runs/2026/10/2026-10-02-vq-prefill-rotary-arithmetic]] preserves the initial QSA mismatch and the full investigation. Projection/normalization bits agree; differences start after rotation. Native inverse frequencies match fast Metal power, while explicit precise power matches the pinned Python frequencies. The candidate-only constructor now uses precise power; the public constructor retains deployed arithmetic. Dedicated native checks compare every inverse-frequency value and the first 512 FP32 angle rows. The earlier short tests remain valid for their original limited positions.

All 95 native catalogue checks pass without skips. Generated sequences, sparse indexer activation, persistent mixed-record ownership, draft, vision, quality and complete-configuration performance still gate subsequent integration. No candidate is admitted to production or Auto by this checkpoint.

[[sources/runs/2026/10/2026-10-03-native-vq-prefill-validation]] records the complete static suite passing on this frozen corrected prefill binary, including 420 memory-override cases, planner, transport and installer checks. Eight malformed full-prefill manifests are rejected before execution. Fresh original-pack verification succeeds, and its frozen complete-vocabulary memory-prose logit bits remain unchanged. This is scoped regression evidence, not candidate app/governor, quality or speed qualification.

### Greedy numerical checkpoint, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-greedy-parity]] records both packs passing the frozen 16-step greedy feedback profile. Each implementation samples its own next token, then feeds that actual token into the next forward. Every sampled token and all 2,560 complete state/output boundaries per pack agree with its pinned reference. The 44-token literal prompt uses the original tokenizer. The final sampled token remains unconsumed, leaving 59 consumed tokens. Both runs reach the length cap; a real sampled EOS stop is outside this fixture.

Twelve broken fixture/profile/stop/CLI cases are refused before execution, and all 95 native checks pass without skips. Engine sources match the preceding fully validated prefill binary; this increment adds only the experimental diagnostic and CLI dispatch. The earlier full static result is not described as newly rerun. This establishes bounded autoregressive arithmetic, not a product generation service, persistent residency, draft, sparse long-context selection, completed-task quality or speed.


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


### Generation-cost pilot and next optimization, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-generation-cost-pilot]] records a separate lean-observer full-logit validation for each pack and six paired 128-token measurements on the development Mac. The fixed 512/96 expert banks and resident text stay inside the unchanged 10 GB process envelope. Median committed generation is 3.0466 tokens/s for VQ 3.2 and 2.5241 for VQ 4.4, with median TTFT of 9.2645 and 10.5174 seconds. Authentication/loading is timed separately. All six runs meet the frozen observed eligibility conditions. These short-context, non-speculative pilot results fall below the target and do not earn product integration. They are not a paired comparison with the older installed-pack pilot.

Sixteen malformed profile/validation/CLI cases refuse at their intended gate. The original observer mode still preserves all 2,560 greedy boundaries on the 3.2 regression, and all 95 native catalogue checks pass. The previously pending e56f8fc complete remote CI has also passed, including coverage; that result belongs to the earlier finite-rotary checkpoint.

[[sources/runs/2026/10/2026-10-03-native-vq-generation-cpu-profile]] separately identifies expert pread waits as the largest observed main-thread subtree, alongside substantial GPU waiting. All timing from that sampled process is discarded. Next, test bounded parallel demanded reads: prevalidate immutable descriptor/range plans on the owner, bound retained result bytes, let workers produce private CPU data only, drain every worker on failure/cancellation, and publish complete records in order under the bank's existing pins and generation guard. Cache pointers and MLX objects must not cross into read workers. Preserve original output order and arithmetic dispatch, then rerun failure ownership, complete-model parity, process footprint and paired timing before adopting the change. This is not yet asynchronous prefetch, resizing or a production governor.


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

### Dense composite native ownership and greedy parity, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-dense-four-bit-greedy-parity]] records the separately authenticated native composite adapter. Its immutable map binds 498 dense affine replacements to the installed baseline; unmatched VQ tensors, experts, PLE and raw norms retain their own identities. The internal TensorSource dispatch honors validated module recipes and preserves explicit caller arguments. Public checkpoint loading still refuses every VQ candidate.

The independent generated reference and native streamed/resident paths agree at every boundary for sixteen self-fed steps. All three ordinary VQ profiles retain their greedy and sparse-state goldens. Six refusal cases prevent incomplete controls, wrong parents, linked or modified maps and cross-artifact fixture reuse. The composite's resident payload is 2,893,477,400 bytes; its observed fixed-resident greedy process peak is 5,136,863,552 bytes. This does not establish a general minimum or transfer a memory envelope to longer contexts.

Next: independently bind the composite's ordinary-prefill and sparse-continuation references, validate the lean timing path, measure its own cross-artifact cost pilot and rerun the existing affine acceptance battery because shared dispatch changed. Task quality, larger contexts, draft/vision, dynamic banks and product Auto remain unqualified.

### Dense composite sparse context and cost, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-dense-composite-prefill-and-cost]] completes the composite's own ordinary-prefill and sparse-continuation numerical checks. Streamed and fixed-resident sparse paths agree with all 984 reference boundaries, including 24 sparse masks. The resident sparse process peak is 6,973,444,416 bytes within the same 10 GB research envelope. No context beyond 2054 consumed tokens is admitted by this evidence.

The matched fixed-cache pilot validates each arm against its own independent complete logits, then measures three alternating pairs. All six timing runs are eligible; each artifact repeats its own 128-token sequence. Median paired ratios are 1.0800631462 for committed decode, 0.8191828162 for TTFT and 0.9132518003 for request duration. Median decode rates are 5.5206020465 for full VQ and 5.9470904340 for the composite. Cross-artifact sequences and routing counts differ, so this is a whole-candidate fixed-work comparison, not proof that a single kernel caused the difference. Neither arm reaches 20.

Both arms retain exactly the same 608-record cache. The candidate's recovered payload is therefore a reason to test a larger fixed cache under the unchanged process ceiling, not permission for unmeasured automatic growth. That follow-up must preserve the old admission bounds by default, explicitly admit only the inspected candidate/layout, exercise the newly addressable physical rows and pass full greedy/sparse parity and footprint gates before timing. Dynamic resizing and governor integration remain later work.

The current research composite authenticates both parent filesets, doubling median load time from about 29.5 to 59.3 seconds. Publishing it would require its own reproducible verified pack; this adapter is not that distribution transaction. Complete-task quality, longer contexts, draft/vision and complete-configuration performance still gate product integration. The full original affine acceptance run follows the passed static suite; no Auto default or installed pack changes.

### Existing affine compatibility closed, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-dense-composite-affine-compatibility]] closes the compatibility gate for the shared dense dispatch. The frozen executable passes the full static suite and all existing affine acceptance categories, including real governor recovery, memory-target equality, MTP state/reference parity, serving, persistent prefixes, behavioral sanity and vision. The first full battery reported 31 passes and four failures because the temporary launcher resolved the virtual-environment Python symlink; the two reference producers could not import MLX and their dependent native checks lacked fixtures. The unchanged binary then passes those exact four checks with the correct interpreter. Both the failed campaign and corrective evidence are preserved; no golden or tolerance changed.

The next bounded experiment is the already declared fixed-cache reinvestment hypothesis. It does not advance steps 6 through 8, turn on a candidate, or establish the 20-token target. All quality, complete-configuration and hardware gates remain in force.

### Fixed-cache reinvestment result, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-dense-savings-reinvested]] implements and tests the larger fixed-cache hypothesis without changing ordinary admission bounds. The exact composite may explicitly use 1536/288 records, 3,583,180,800 bank bytes, within the same 10 GB process ceiling. Both cache sizes preserve all greedy and sparse-state reference bytes. The larger greedy run reaches the highest physical slots; the sparse run peaks at 9,328,595,360 bytes. No production budget or maximum context follows from that finite check.

The same-artifact paired pilot rejects the expected speed benefit for its frozen workload. All six timed runs are eligible and produce the same 128-token sequence. Median paired decode ratio is 0.9462645070, TTFT ratio 1.1265224763 and request-duration ratio 1.0661911433. Median decode is 6.0164231060 tokens/s for 608 records and 5.6931276441 for 1824. Loads fall from 49,865 to 34,782 per request but generation gets slower. Retain the smaller cache as the cost control; the larger geometry remains a numerical research profile. Profile the implementation before another capacity or policy change. This result neither disqualifies all larger budgets nor earns Auto integration.

[[sources/references/2026/10/2026-10-03-vllm-draft-full-width-normalization]] pins architecture evidence supporting the existing full-width draft input normalization. Independent q6 sidecar arithmetic, acceptance and memory qualification remain open.

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

### Lossless expert-record export, October 3

[[sources/runs/2026/10/2026-10-03-vq-contiguous-record-lossless-export]] closes the storage transformation prerequisite for a contiguous-read hypothesis. The bounded converter preserves all six codes/scales pieces per expert, matches all 288 reconstructed original tensor hashes and verifies every padding region. Forty-eight aligned output files occupy 47,866,183,680 bytes. Codebooks, dense weights, PLE and draft data remain unchanged in their parent artifacts. A pinned completion manifest appears only after verification and synced writes.

This is a research export, not a distributable model installation. Its native reader must authenticate the exact manifest and complete derived payloads, price a complete aligned scratch record per active lane, and retain descriptor ownership, exact ranges, cancellation and joined publication. Keep model values, buffered read policy, 1536/288 banks and the process ceiling fixed for greedy/sparse parity and subsequent cost measurement. Extra authentication changes OS cache conditioning, so any measured gain belongs to the complete research load/request path and cannot establish a syscall-only improvement or predict a standalone pack. Product integration remains gated.

### Contiguous native record parity, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-contiguous-record-parity]] records the pinned native reader and its four completed full-model comparisons. Split and contiguous storage both match all 2560 greedy and 984 sparse-context boundaries. Greedy exercises every newly admitted physical slot; sparse state remains inside the original ten-GB process ceiling. The packed reader authenticates all 48 derived files and separately prices each active lane's aligned read buffer. Ordinary tensor read bounds and buffered defaults remain intact.

All 96 native catalogue groups pass, and actual CLI checks reject a missing bank prerequisite, corrupt manifest and symlink manifest before model allocation or output publication. This closes the native parity prerequisite for the separately frozen paired cost comparison, not complete-configuration qualification. Original immutable prefill sweep storage remains in use. Production generation, larger contexts, draft/vision, held-out task quality, dynamic memory integration, Auto, distribution and other-hardware qualification remain open.

### Contiguous read cost and acceptance, October 3

[[sources/runs/2026/10/2026-10-03-native-vq-contiguous-record-paired-cost]] closes the bounded layout experiment. Both complete-vocabulary validations pass, and all six alternating timing cells are eligible with identical 128-token outputs. Split/contiguous median committed generation is 5.7761639480 versus 6.8723808966 tokens/s; median paired decode ratio is 1.1897828660 and request-duration ratio 0.8576591458. Loading rises from a median 59.3513 to 77.1266 seconds. The prospective OS-cache/load-order caveat remains part of the result. Use the contiguous representation for continued controlled research, not as a product-default or universal speed claim.

[[sources/runs/2026/10/2026-10-03-native-vq-contiguous-record-static-acceptance]] records the complete static suite passing on the same frozen binary. The converter and cost-receipt tests are registered in both static entrypoints; prior source commit `86a703b88cb9d92bea929ac55fd311a1609ea99a` also has successful docs, context, Mac and core CI. The full affine model-loaded battery remains the previously recorded composite checkpoint, not a newly claimed run.

The new non-speculative pilot still misses twenty tokens/s. Neither a layout improvement nor exact parity qualifies held-out task quality, complete feature configurations or another Mac. Continue the separate draft-head admission and state/verification work under bounded protocols. No main-model or draft quantization may inherit the other's metadata, and no draft proposal may become committed output without the required main-model verification. Auto, dynamic candidate memory management and activation remain gated.

### Original four-bit draft component, October 3

[[sources/runs/2026/10/2026-10-03-vq-composite-draft-initial-parity-failure]] preserves the independent composite-input reference and the original head's failed prefill comparison. Main-model prefill matches all 160 existing boundaries before supplying real hidden states and embeddings to the separate four-bit draft. The original native prefill exceeds the unchanged tolerance, while its cached step is exact. The same run reproduces missing process-lock acquisition in standalone MTP loading; the loader now acquires the idempotent reservation before allocation.

[[sources/runs/2026/10/2026-10-03-native-vq-owned-draft-component]] records the authenticated separate head loader and one prospective explicit arithmetic-profile test. All four reference outputs match byte for byte, with finite outputs, aligned 43/44 state offsets and a 2,064,894,112-byte native peak. The config and full sidecar are independently pinned; weights remain four-bit group-64, and their centered norms are already folded. Current host-copy memory is charged independently from retained payload. The combined arithmetic result does not isolate one operation as the cause of the earlier mismatch. Public head arithmetic and original expected fixtures remain unchanged.

This closes fixed-input head component parity, not draft integration. Next implement bounded main-state checkpoints, exact batched verification and rejection rollback, then EOS, cancellation and committed-sequence checks before testing acceptance and speed. Retaining a resident head must be priced with the selected expert banks and load phase; it cannot simply be added to the near-ten-GB larger-bank sparse profile. Production candidate loading, held-out quality, contexts beyond the finite table, vision, dynamic memory, Auto, distribution and real-hardware qualification remain open.

### Final draft build admission status, October 3

[[sources/runs/2026/10/2026-10-03-vq-draft-final-build-admission-pending]] records a successful final native build and the broader local acceptance remaining unlaunched. The head and owned-loader source hashes are unchanged from the exact component producer; the final diagnostic adds an existing-output refusal and metadata/budget checks. One admission attempt refuses insufficient real memory. A separate bounded stable-admission campaign also launches no model and is interrupted after a separate llama-server workload is identified. The unrelated process is untouched.

The quiet preflight now rejects known llama.cpp inference entrypoints before launch as well as Slotstream/build contention. Twelve context-qualification tests and thirty-two static-entrypoint tests pass; a read-only invocation reproduces the external-model refusal. Final local static/catalogue, baseline draft, streamed draft, image interaction and verification-row checks remain pending until exclusive model execution and their original real-memory bounds are available. Exact component parity is not substituted for those regressions. New independent reference campaigns must bind the changed safety-helper identity and satisfy their source-bound traversal requirements again.

The full implementation remains in progress. No alternate pack has earned Auto integration or promotion, no new supported hardware profile reaches the target, and no release is implied by this checkpoint.
