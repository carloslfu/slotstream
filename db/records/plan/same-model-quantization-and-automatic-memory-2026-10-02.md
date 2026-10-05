---
type: plan
meta-type: operational
id: 01m3yz0p8fprhjdshs3m6f82gy
created: 2026-10-02T18:46:22.223253+00:00
updated: 2026-10-05T00:00:41.837046+00:00
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

Status on October 4, 2026: implementation in progress. Baseline Auto and the independent saved memory/live-allocation controls are implemented. Experimental candidates have bounded native generation, independent original drafts and staged context/recovery. The same-parent affine control runs through Engine and HTTP with owned metadata, pack-specific planning, live governance and compatible memory/disk reuse. The Mac original-pack owner now has durable activation, bounded health checks, sequential rollback, explicit retry and failed-selection queue gates, tested with real weights. This does not confer candidate quality, speed or Auto qualification. Owned candidate vision and native multi-step tool instruments now pass their bounded functional gates. Image-answer quality and capacity, complete-configuration performance, held-out noninferiority, standalone multi-pack distribution and integrated product release remain required. No twenty-token promise is established. Evidence and failed attempts remain in [[records/measurements/quantization-screen-2026-10-02]].

### Current implementation checkpoint, October 4

This table supersedes the progress summary below without changing its historical evidence or the exit gates.

| Work | Current result | Remaining exit gate |
| --- | --- | --- |
| Original behavior and controls | Default Auto, independent saved ceiling and live adjustment, persistence, deferred application and response-generation binding pass | Repeat affected original and app acceptance on the final integrated build |
| Candidate execution and resources | The same-parent grouped affine-three-bit control passes Engine/HTTP, separate streamed drafts, staged 32K context, memory/disk prefix reuse, live governor, cancellation and owned vision functional checks | Complete candidate app workflows and the prospectively frozen image and long-conversation outcome campaigns |
| Quality selection | The unconstrained affine refit lost its complete proxy screen; minmax remains the sole admitted affine research candidate | The separately frozen unanswered-only continuation is running after the unloaded startup refusal; its first incomplete job is now complete, with no noninferiority verdict yet |
| Complete performance | Actual-plan pilots preserve timing exclusions; standalone and Desktop-aware V2 performance instruments are prepared | Native V2 acceptance, actual standalone startup, an eligible paired pilot/final and safe lower-budget matrix; qualify profiles against the stated speed and latency gates |
| Resource loading | Bounded parallel file authentication passes corrected optimized and instrumented catalogues, complete static/transport CI, external-library and Mac runtime/Xcode checks | Actual startup/resource measurements and cancellation during a long read |
| Distribution and recovery | Original-pack durable activation, bounded health check, serial rollback/retry and failed-selection queue gates pass; lossless three-bit transport planning passes full CI | Authenticate and retire only the planned reproducible copies, produce the standalone artifact, prove native identity/parity, complete independent public pull and integrated multiple-pack transactions |
| Promotion and release | Original pack is the only supported registry entry; no alternate Auto profile is enabled | Candidate qualification, deterministic measured/estimated selection, final local integrated acceptance, documentation and release |

Other physical Macs are not required. Safe lower budgets test this Mac, and other hardware receives conservative labeled estimates. The current evidence does not establish the twenty-token target. The campaign uses frozen binaries and helpers, independent of subsequent source-only repairs.

### Historical implementation checkpoint, October 3

| Work | Implemented and checked | Still required |
| --- | --- | --- |
| Baseline and inventory | Frozen bounded screen, installed-pack pilot, complete pinned shard-header/config inventories for VQ 2.1, 3.2 and 4.4 | Completed disjoint task-sizing pilot; final powered held-out protocol remains. All three VQ payloads and corrected reference traversal proofs are verified |
| Candidate screening | Checked affine/VQ geometry, native Metal selected-row decoder, scalar row oracles, fused binding and complete-record composition parity, cost pilots, both projection shapes and affine width timings | Production generation and complete-task quality; all three native packs pass complete-stack continuation, 16-step greedy and sparse-selection checks with fixed mixed-class caches and resident text; larger packs additionally retain their frozen 512-token fixture |
| Existing adapter | Explicit affine descriptors and rejection of malformed or inconsistent per-module overrides; pinned arithmetic unchanged | Full candidate family descriptors; the foundation binary passed the complete existing-engine battery |
| Current Mac memory controls | Separate saved quantization, ceiling and live adjustment; migrate old preferences; preserve unavailable overrides; defer busy changes; bind applied load generations to responses; fixed-capacity pressure/recovery and real reload checks pass | Candidate-specific cost ranges and full candidate prepared-resource ownership |
| Quality instrument | Bounded full-vocabulary KL/top-1 scorer and native completed-task instrument with frozen tokens, executed local tools, tested coding fixes and deterministic grader checks | Final noninferiority/latency rules, held-out tasks and confidence analysis. The completed disjoint affine pilot is not noninferiority; a stored-parameter refit passes its component screen only |
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

### Candidate state recording and recovery, October 3

[[sources/runs/2026/10/2026-10-03-candidate-state-recording-and-recovery]] closes the bounded target-state foundation for speculation. The candidate reuses the production checkpoint ownership and lifetime machinery, records every recurrent position without replaying accepted tokens, refuses foreign or discarded snapshots, and requires explicit restoration after partial failure. Full VQ 3.2 and the original-dense composite pass short and sparse-boundary recovery, every accepted prefix, continued generation, observer failures and actual cancellation at several layer/commit boundaries.

The first full-model recording attempt failed exact prefix comparisons because one- and two-row projection dispatch differed from the five-row pass. The preserved correction introduces an explicit verification arithmetic mode using existing row-invariant projections and exact per-query attention. Ordinary reference arithmetic remains the default and its frozen greedy and sparse fixtures still pass. No tolerance or golden was changed. The native catalogue includes exact recording-kernel comparisons against the ordinary candidate recurrence for zero and nonzero initial states.

The new `quantization-state-check` command is a bounded qualification instrument, including `--sparse-boundary`; it cannot activate a candidate. This checkpoint does not claim completed draft generation, a new public Engine, arbitrary context, dynamic allocation, quality qualification or a speed result. Those remain required by the active plan. The separately authenticated original draft can now be attached to this recovery foundation without inventing a second checkpoint mechanism.

### Bounded target-verified candidate generation, October 3

[[sources/runs/2026/10/2026-10-03-candidate-target-verified-speculation]] records the next implemented layer: the original four-bit draft attached to the original-dense/VQ composite, with target verification, exact recorded rollback, the production sampler, EOS and callback handling, and interrupted-state recovery. Embedding lookup is now an additive internal input to the existing draft consumption method; its public affine overload and vision rebasing remain intact.

The initial complete generation campaign produced identical target tokens, target state and sampler state but failed exact head-cache comparisons. Three or more accepted tokens flattened four hidden branches beyond the row-invariant projection bound. A candidate-only token-wise fusion projection resolves that failure without changing public draft defaults. The passing campaign exercises real accepted drafts, greedy depths one/two/four, sampled depths two/four, EOS, callback stops, partial-draft cancellation and failed target verification. The ordinary greedy stream also equals the frozen independent composite reference. Original-model combined draft/vision and streamed-draft regressions pass.

This completes bounded candidate speculative generation, not production serving or promotion. `quantization-generation-check` is an explicit qualification command; `VQGenerationProbe` remains limited to the existing finite rotary horizon and bounded output length. Larger contexts, production ownership and memory governance, candidate vision, distribution transactions, held-out quality and complete-configuration performance remain required. The next context work must preserve the entire existing rotary prefix and qualify native execution separately from coefficient generation.


### Extended coefficients and staged native contexts, October 3

[[sources/runs/2026/10/2026-10-03-candidate-extended-rotary-and-context]] separates coefficient coverage from native context execution. The independent pinned Python component covers every model position while preserving all earlier embedded bits. The native reader authenticates the complete coefficient file through an owned descriptor, rejects invalid file kinds/extents/digests, drains cancelled reads, and retains its own values. All coefficient and refusal checks pass.

The composite with the original draft head passes explicit 4,096-, 8,192- and 32,768-token context checks under the unchanged ten-GB process envelope. Each consumes the complete window, compares recorded-prefix rollback and subsequent target/head state exactly, and refuses an extra token without changing committed state. The largest observed physical peak is 9,389,527,888 bytes. Default research construction still uses the original finite table unless the bounded extended window is requested explicitly. This is functional context and recovery evidence, not long-context task quality, vision, another hardware profile or a speed claim. Native coverage does not extend to the full coefficient range.

The next frozen task instrument uses completed instruction, tool, coding, multilingual and retrieval cases with identical prepared token contexts across arms. Its calibration examples remain separate from the required held-out protocol. Length-limited answers fail completion; actual parsed tool arguments must execute against a deterministic local fixture; coding answers must pass bounded pure-function tests without input mutation. No task result, noninferiority verdict or product admission is implied by preparing the instrument. Production ownership, candidate memory governance, distribution transactions and full qualification remain active work.


### Completed-task calibration and memory failure, October 3

[[sources/runs/2026/10/2026-10-03-candidate-completed-task-calibration]] preserves the frozen sixteen-case task pilot, exact prepared token contexts, executable and grader identities, resource ledger, complete outputs and the failed full-pack arm. The original four-bit model and the original-dense/VQ3.2 composite with two original-head drafts both complete the suite and score fifteen of sixteen. Both miss the same requested names-only JSON format. All local tool fixtures and bounded coding tests pass for both complete arms. These few owned examples are calibration, not held-out noninferiority or a product-quality certificate.

The full VQ3.2 arm completes fourteen tasks before the first retrieval request exceeds its ten-GB physical-process envelope. The supervisor stops that process; its partial receipt cannot certify completion or recover the missing tasks. The remaining composite arm is run once as the already planned third arm, with unchanged inputs and limits. The failed arm is neither retried nor replaced. No performance inference is drawn from these functional timings.

Twenty-one native malformed-input refusals pass before output publication or model allocation. The native catalogue, unchanged target-verified generation control, bounded coding/grader tests and full static suite also pass. Remote CI for the preceding speculation commit is complete and green.

Next, remove the discarded full-vocabulary readouts from intermediate prefill passes under an explicit exact-state/continuation check. Preserve the full observed-readout path and all frozen numerical references. Any subsequent task rerun needs a separately versioned producer and resource hypothesis; it remains calibration and does not erase this failure. Complete-configuration paired performance, held-out quality, production serving and candidate memory/activation integration remain required.

### Intermediate prefill readout repair, October 3

[[sources/runs/2026/10/2026-10-03-candidate-prefill-readout-memory-repair]] records the separately budgeted repair and calibration rerun. Intermediate prompt passes now consume the complete target and original-draft state without materializing vocabulary logits that would be discarded. Final prompt readouts, target verification and the independent full-forward fixtures retain their original arithmetic. The native control passes 2071 assertions, including exact complete target/head state and subsequent-logit comparisons after 17 and 512 consumed tokens, cancellation and recorded-pass refusal.

Both candidates now complete all sixteen unchanged pilot cases inside the original ten-GB process bound. Every output and speculative detail from the previously completed fourteen full-VQ cases and sixteen composite cases is identical. Full VQ scores thirteen of sixteen; the composite retains fifteen of sixteen, matching the reused original baseline. The earlier failed full-VQ process remains evidence. These calibration scores do not qualify a pack or establish arbitrary-context memory capacity.

Continue performance work on the composite, whose observed task outcomes match the baseline pilot. Large prompt passes still use serial expert staging; the next explicit hypothesis is bounded parallel prefill reads with unchanged record ordering, numerical kernels and complete-record ownership. Qualify that component and its end-to-end behavior before using it in a timing comparison. Candidate serving, resource planning and dynamic governance, transactional installation and the held-out/performance release gates remain open.


### Parallel prefill validation and timing exclusions, October 3

[[sources/runs/2026/10/2026-10-03-candidate-parallel-prefill-read-validation]] records an explicit parallel prefill path after exact component and whole-model gates. Complete records are privately assembled through the existing twelve joined read lanes, sharing authenticated codebooks with decode. The full temporary ledger includes read results, scratch, final MLX arrays and the largest join copy. Prefill does not change bank membership, pins or CLOCK history. All three packs and the original-dense composite preserve their independent sparse-context tensor hashes inside the unchanged ten-GB envelope. The generation control remains exact.

The complete-task run preserves all sixteen prior composite outputs, parsed answers, terminal reasons and draft decisions. All six subsequent timing cells also complete identically, but four fail the predeclared competing-CPU condition. The final eligible pair cannot replace those excluded rounds or establish a clean paired gain. Preserve the full study as inconclusive and keep parallel prefill explicit. Eleven invalid-option refusals and the complete static suite pass; preceding source commits have successful remote CI. The first two functional drivers' fixture-path and JSON-reading mistakes are retained, with completed native checks reused rather than rerun.

Continue the plan's separately identified affine-three-bit control before committing further product architecture to VQ. The initial control is an expert-only transcode from the original affine-four-bit parent, with dense, PLE, draft and vision values retained; it must never be described as a BF16-source conversion. Freeze its resource and quality protocols before producing outputs. Its local converter draft and storage tests are preparation only, with no converted artifact or inference result at this checkpoint. Production candidate ownership, pack-specific allocation and live governance, activation/recovery and final quality/performance qualification remain required.


### Controlled affine-three-bit expert screen, October 3

[[sources/runs/2026/10/2026-10-03-affine-three-bit-expert-control]] records the previously missing affine control. Only the original routed experts are converted from the pinned four-bit values to three-bit/group-64; every other original family stays in its parent. This is not a conversion from BF16. All layers are authenticated and written under a prospective complete-output reservation, with independent tensor/file re-reads and an inert-until-complete manifest. It is still a research overlay, not a downloadable product pack.

The two full expert shapes pass an independent packed-code oracle, exact batch-size invariance and serialization checks. Every original PLE table passes bounded streamed-versus-mapped row equality. Four layers spanning a prompt chunk boundary pass exact direct-versus-layer-streamed execution, inside the normal ten-GB reference envelope. The six fixed pilot contexts then produce no new stored raw logits. Compared with the corrected VQ4.4 proxy, average KL and top-choice agreement are slightly better than the previously measured native original baseline, but five contexts worsen KL and tool-result/multilingual top-choice agreement regress. Runtime differences are explicit; this does not isolate all error to quantization or establish native parity.

Continue a bounded native adaptation of the existing affine engine before choosing the product candidate. Derive pool shapes from verified record descriptors, keep dense/PLE/draft/vision independent, and preserve all public four-bit entry points and golden checks. Freeze the new representation's arithmetic contract before inspecting native errors. Complete-task quality, equal-budget and complete-configuration performance, per-pack allocation/governance and transactional product integration remain open. No pack is promoted by this calibration. The setup's system-Python refusal and static fixture-registration failure remain recorded; the corrected full static suite passes without repeating the model campaign.


### Native affine control, draft and context, October 4

[[sources/runs/2026/10/2026-10-04-native-affine-reference-generation-and-context]] records authenticated descriptor ownership, an explicit native PR1788 arithmetic profile and exact independent six-token and self-fed generation references. Expert, dense and PLE reads remain bound to the files that passed authentication. Cache cold/reuse/growth/shrink histories preserve identical native output. The original four-bit packing and arithmetic retain their previous defaults. A longer-prompt mismatch was localized to forced attention dispatch; sorting alone did not fix it. No reference bound or golden was widened.

The existing Generator now runs the three-bit target with its independently authenticated original four-bit draft. Greedy and seeded output, accepted drafts, every retained target/head state, callbacks, EOS and cancellation recovery pass against token-at-a-time consumption. The same target/head path passes explicit 4K, 8K and 32K windows, recorded-prefix rollback, exact continuation and over-limit refusal. Generator admission and speculative tails also honor the candidate's admitted window without requiring an external request controller.

The original baseline repeats all sixteen prior calibration streams exactly. The affine control scores fifteen of sixteen both with and without two drafts, failing the same names-only formatting case as the original. Both affine runs emit identical token streams across all sixteen tasks. Resource envelopes remain unchanged, and the final static suite passes. This does not replace held-out evaluation or paired timing. The research overlay still needs its parent and cannot be installed or selected as a product pack.

Next compare complete configurations and freeze the held-out quality protocol before choosing the production candidate. Continue the existing Engine and owned-component integration, per-pack costs and live allocation, safe download/activation/recovery and the integrated Mac acceptance gates. Other physical Macs remain outside the required program; conservative estimates never become measured speed claims. The end-to-end goal stays active.


### Affine Engine and pack-memory checkpoint, October 4

[[sources/runs/2026/10/2026-10-04-affine-engine-memory-and-governor]] records the package-only candidate Engine adapter and immutable resource profile. The adapter binds authenticated expert, parent, rotary and tokenizer identities, retains the original public loader, and uses the existing request, prefix, governor and serving paths. Memory plans price actual expert bytes, extra resident components, layer workspace and pool replacement during admission. Unknown throughput stays unknown, and unadmitted images, read-ahead and streamed draft placement are refused. The separate original draft cannot be loaded using the candidate's target recipe.

The live governor bounds restart credit by observed process ownership and keeps the saved ceiling and active artifact. Original shrink/recovery and real serving checks pass. A real first-image recovery bug exposed by the stricter credit is fixed: image replanning uses current availability with bounded owned credit instead of retaining a stale zero-headroom snapshot. The allocation safety checks and donated cache remain intact.

Both candidate modes pass actual Engine generation, complete-prompt reuse, aligned memory/disk continuation, cancellation and retry, pressure donation/floor refusal/recovery, warm resize and real HTTP requests. HTTP metadata identifies the loaded quantization and rejects an explicit name for a different artifact. Existing original numerical gates and final static acceptance pass. The source preserves every failed build and fixture, including the under-reserved complete-prompt test rather than relaxing retention accounting.

Next compare each complete draft configuration, freeze a defensible held-out protocol, then finish the qualifying candidate's vision and standalone artifact ownership, distribution/activation/recovery and product integration. The supported registry remains original-only. Other physical Macs are not required, and no performance result is inferred from these functional checks.


### Complete draft pilot and context CI correction, October 4

[[sources/runs/2026/10/2026-10-04-complete-pair-exclusions-and-context-ci]] preserves the frozen paired pilot with drafting enabled in both complete configurations. Four runs completed before the next thermal/power preflight refused launch. Both artifacts repeated their own frozen token sequences and task outcomes. Competing CPU activity excludes both candidate timing runs; the second original run also has a thermal/power exclusion. The prescribed campaign was not completed or replaced, so it supplies no valid comparative speed result and cannot promote a profile.

The separate context-proxies CI exposed a missing source dependency after pack-specific planning landed. Its isolated compiler did not include PackMemoryProfile. The proxy now compiles and fingerprints that production file, and the bounded local source-contract check passes. Numerical fixtures and timing criteria are unchanged. Activation/recovery implementation continues independently; candidate vision, standalone distribution, held-out quality and local performance qualification remain open.


### Original-pack activation and recovery foundation, October 4

[[sources/runs/2026/10/2026-10-04-durable-model-activation-and-recovery]] records durable device-local requested, verified, loading, checking, committed and failed states. Each selection binds saved preferences to the compiled pack and manifest. The inference owner holds an exclusive journal lease across idle unload. Bounded, owner-checked state and synced atomic writes preserve the previous receipt; malformed or unsupported history is retained and refused.

Original-pack activation revalidates actual files, observes headroom after release, loads the requested plan and completes a fixed text liveness probe before committing and publishing its identity. The probe uses at most four output tokens and a thirty-second deadline under the normal memory, pressure and cancellation guards. It has no tools or persistent prompt cache and is not a quality test. A failed change releases partial resources before reloading the previous healthy settings if they still fit. Requested settings remain saved and other queued work waits for explicit retry or a corrected choice. Neither rollback nor restart replays an application action.

The full Mac suite passes, including journal-phase recovery, failed writes, exclusive ownership, stale attempts, corrupt/symlink history, queue gating and rendered failure controls. Real original-weight tests pass health/commit, post-allocation failure, sequential rollback, failed-selection refusal, explicit retry, new-owner reload and cancellation during the final commit. A review fixed initial journal failures that occurred before the queue gate and added the last cancellation check before publication. The failed compiler assertion and all earlier attempts remain captured.

This closes the original-pack activation foundation, not the multi-pack distribution gate. Candidate standalone ownership, compatible loader/vision/draft paths, qualification, verified publication and the integrated release are still required. The public registry and installed artifacts remain unchanged.


### Authenticated streamed original head, October 4

[[sources/runs/2026/10/2026-10-04-authenticated-streamed-original-draft]] closes independent streamed placement for the affine target. The original head owns its fully authenticated sidecar and exact tensor ranges; parallel reads cannot publish partial cache records after a read or integrity failure. Its cache and scratch retain original four-bit accounting, independently of the target recipe.

All prior resident-head token and committed-state observations match exactly. Candidate speculation, Engine/prefix/governor/HTTP, original draft regressions and staged 32K recovery pass within their unchanged bounded protocols. The final static suite passes. Failed diagnostic compilation is retained, and no reference, tolerance or golden changes.

Explicit streamed placement is available to the research Engine. Candidate Auto still cannot inherit the baseline's measured placement threshold. Next compare complete configurations through the actual planner at equal saved ceilings, then qualify quality and the remaining production features before publishing or selecting another pack. Vision, standalone distribution, held-out noninferiority and integrated release remain open.


### Actual planner calibration, October 4

[[sources/runs/2026/10/2026-10-04-actual-planner-calibration-with-timing-exclusions]] records the complete-task evaluator using the actual Engine planner at an equal saved ceiling. Each pack independently prices its expert pool, prefill chunk and original streamed draft. Protocol and grader checks bind the requested budget and feature set to the loaded plan. The earlier fixed-pool instrument keeps its existing behavior.

All six frozen calibration runs complete and preserve their own prior outcomes. The first pair is timing-ineligible because of external CPU activity and, for the original, paging. Later runs meet the recorded conditions, but the frozen all-runs rule prevents an aggregate or speed qualification. No replacement rounds are substituted.

The candidate's conservative workspace reservation prices a full decode-pool replacement during prefill admission. Reducing that charge requires a different owned-copy lifetime and physical verification; observed unused headroom alone does not justify changing it. The supported registry remains original-only. The next allocation experiment is separately identified and cannot repair the excluded timing campaign retroactively.


### Explicit sequential expert copies, October 4

[[sources/runs/2026/10/2026-10-04-sequential-affine-cache-allocation]] records the distinct `affine3-piecewise-memory-v1` research profile. Each workspace or admission destination is evaluated before the next tensor piece is constructed. The ledger still retains full source storage, staged hot records and the largest destination replacement. Existing original and conservative candidate profiles keep their prior accounting.

Exact frozen speculative tokens and complete committed states, real Engine byte/CLOCK/resize checks, reuse/governor/HTTP behavior and the entire staged 32K window pass within the existing physical guards. Actual-plan evaluation rejects a copy mode that does not match its frozen protocol and resource identity. Static acceptance and prior-commit CI pass.

This completes the owned-copy and physical-memory checks for the explicit mode. It does not establish faster complete configurations or lower the original profile's allowance. The changed allocation receives a separately frozen equal-ceiling performance comparison. Candidate vision, held-out quality, standalone distribution, transactional multiple-pack integration and final product acceptance remain open; the whole-plan goal is active.


### Sequential-copy calibration result, October 4

[[sources/runs/2026/10/2026-10-04-sequential-affine-calibration-with-timing-exclusion]] completes the separately frozen actual-plan comparison. All six runs finish at the same saved fourteen-GB ceiling and preserve every prior same-artifact task outcome. Each scores fifteen of sixteen calibration tasks. The explicit sequential candidate admits 1,817 expert slots, compared with 1,175 in the earlier conservative candidate; the original remains at 2,162 slots. These are planner choices, not interchangeable record counts.

The first candidate run exceeds the frozen competing-CPU condition. Five other runs are eligible, but the predefined all-six rule prevents an aggregate. Preserve all evidence and do not replace the excluded round. No speed target or held-out quality claim follows.

The next bounded hypothesis removes complete-layer expert workspace through fixed-domain groups while preserving the reference kernel family, route order and exact BF16 results. It must pass a component matrix across dispatch boundaries and cache states before native model integration, memory-policy changes or a new performance comparison. Product qualification and the whole-plan goal remain open.

### Bounded grouped affine expert checkpoint, October 4

The explicit grouped operator now computes the same affine target with a fixed thirty-two-expert RHS and bounded route tiles. It preserves the full-domain reference dispatch family, restores original router order and copies hot records into independent allocations before admitting them once in the existing global hot order. It changes neither original arithmetic nor default selection. Its resource profile deliberately retains the earlier conservative sequential-copy reservation pending separate allocation qualification.

The frozen integration binary passes 264 exact component comparisons, sixteen admission trajectories, 2,693 speculative assertions, the prior twenty-three emitted-token/committed-state observations, Engine/HTTP and memory/disk/cold continuation and recovery comparisons, and all sixty-four staged context observations through 32,768 tokens. Component, speculation, Engine and context process peaks remain inside the prospective ten-GB ceilings. The complete source-bound runs, two corrected compile failures and prior-main CI identities are captured in [[sources/runs/2026/10/2026-10-04-bounded-grouped-affine-experts]]. This is correctness and bounded-memory evidence, not speed or held-out quality qualification.

Next derive the grouped allocation's phase-by-phase bound, validate it independently and compare complete Engine plans under a new prospective protocol. Default Auto, supported packs and installed artifacts remain unchanged. Vision, held-out noninferiority, standalone distribution and full product qualification remain required.

### Explicit damaged-setup repair, October 4

A corrupt activation record now has an explicit recovery action. Under the existing owner lease, repair preserves an owned regular single-link record at an exclusive archive name, keeps the saved preferences and requires a new complete verification and health check. It refuses valid, replaced, symlinked or shared records and cannot run against an active or loaded owner. Ordinary retry still preserves the record in place. Queue resumption uses normal request admission and does not replay failed work or completed tools.

The complete Mac suite passes the scripted failure/recovery cases and native Light, Dark and System screens. The frozen real-model sequence also passes corrupt-record refusal, explicit archive, reauthentication, new healthy generation and a completed response while retaining the exact damaged bytes. Its process peak is 5,776,773,872 bytes under the prospective ten-GB watchdog; the development suite peaks at 1,843,318,624 bytes under its six-GB tree limit. Source identities, raw outputs and screenshot digests are in [[sources/runs/2026/10/2026-10-04-explicit-model-setup-repair]]. This closes damaged-history recovery for the original supported pack, without qualifying an alternate pack or a public release.

### Phase-bounded grouped memory, October 4

The explicit grouped profile now prices its owned allocation phases instead of retaining a complete-layer workspace. It includes raw and padded groups, retained output backing, route restoration, two selected-hot-record sets and the largest destination-piece copy. Complete residency can cost more than the old profile; the solver continues to charge it. The first catalogue stopped on an overbroad reduction assertion, which was corrected without relaxing the byte formula.

The corrected catalogue, nineteen protocol/input cases, exact speculative state, Engine/recovery behavior and all sixty-four staged context checkpoints through 32K pass. All model processes remain inside their existing ten-GB physical envelope. The hypothesis, ownership evidence, both builds, failed catalogue and final raw checks are in [[sources/runs/2026/10/2026-10-04-phase-bounded-affine-memory]]. The new `affine3-grouped-memory-v1` profile is explicit research only. A separately frozen actual-plan comparison follows static acceptance; held-out quality, vision, standalone delivery, product integration and the speed target remain open.

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

### Executed multi-step tool instruments, October 4

[[sources/runs/2026/10/2026-10-04-executed-tool-conversation-instruments]] records the bounded native conversation command and an isolated offline tool-outcome adapter. The command enters the actual Engine HTTP handler, binds its resource and generation protocol, journals requests and responses, distinguishes EOF from explicit finish and keeps tools outside the inference process. Source review fixes a stale final-reset counter; the original plan-only harness error and both builds remain captured.

Original and grouped affine sessions each complete a real calculator call, consume its actual result, finish the answer, reuse a prefix, reset and reproduce the same answer cold, then finish after another reset. Model-free framing and protocol refusal checks pass. Both actual processes remain inside the unchanged ten-GB envelope. This is conversation-instrument acceptance, without a speed or held-out quality inference.

The offline BFCL base adapter retains the upstream state and response comparisons while replacing its eval executor with documented direct method calls and bounded literal arguments. Private source copies and the native sandbox deny unrelated file contents, writes, network and process creation. Every reference case succeeds with no tool error; empty traces and a deliberately wrong resulting state fail. The final adapter records physical peaks and retains CPU, wall, argument and I/O bounds. Both local Python runtimes and static registration checks pass. No model has answered a final benchmark task. Final sampling, family weights, margins, held-out evaluation, complete performance, standalone distribution and integrated promotion remain open.


The complete native model-free catalogue and static suite then pass against the same conversation binary, with matching before/after build inputs. [[sources/runs/2026/10/2026-10-04-executed-tool-static-acceptance]] preserves all raw checks and physical observations. This covers the tracked instrument implementation; the subsequent disjoint quality-pilot drafts remain separate from this acceptance.

### Disjoint task pilot and recipe refinement, October 4

[[sources/runs/2026/10/2026-10-04-disjoint-completed-task-quality-pilot]] records a completed disjoint sizing pilot with five tasks per family. The original passes seventeen of twenty-five; the grouped affine control passes fifteen. Facts and coding agree. Multilingual and instruction following each lose one candidate outcome; tools exchange a pass and a failure. All ten native sessions complete inside their prospective resource limits. The first driver's prelaunch helper-directory error remains captured. Every underlying pilot ID, including translations, stays excluded from final evaluation.

This small pilot does not qualify quality or comparative speed. Its response and tool-step caps are smaller than the app's operating limits. Final protocol design must reserve app-relevant output space inside context and retain the tool checker's exact response/state semantics, with no retrospective rescoring or replacement. Freeze the final recipe, independent task sample, family weights, noninferiority margins, multiplicity, request limits and total resource cost before held-out answers. Ordinary app jobs, long-context outcomes and image quality remain separate requirements.

Before committing to another full artifact, [[sources/runs/2026/10/2026-10-04-affine-three-bit-refit-component]] tests a new same-format recipe. Two deterministic starts and bounded alternating least-squares fitting optimize stored BF16 scales/biases against the already quantized parent, with the unchanged three-bit group as a fallback. Both synthetic projection shapes pass batching, packed-code and serialization checks. Eighteen prospectively selected real projections reduce average squared reconstruction error by about half without any group-level regression. Twelve increase their largest individual error, so this is not task-quality evidence or BF16 recovery.

The next full conversion needs its own total staging reservation and artifact identity. It must retain the original control and all prior failures, then pass complete reference, task, memory and performance gates. No new representation is added to Auto, downloads or the supported registry on the basis of this component result.

### Full refit screen and outcome acceptance, October 4

[[sources/runs/2026/10/2026-10-04-affine-refit-full-screen]] completes the separately budgeted refit conversion and seven-run source-bound reference campaign. Lower stored weight error does not carry through to the full model: refit loses both aggregate proxy metrics. [[records/decisions/hold-unconstrained-affine-refit]] holds that recipe and preserves all evidence. Continue minmax, which remains the only admitted affine research artifact. No new raw logits or product artifact are introduced.

[[sources/runs/2026/10/2026-10-04-complete-outcome-and-session-acceptance]] verifies complete-answer grading, every offline BFCL base reference conversation, the prospective paired MOVER analysis option and the native V2 reply reservation. Both actual model sessions refuse an overlong request before generation, then complete actual tool use, prefix reuse and exact cold recovery. A task-budget refusal remains an outcome with its executed history retained; a crash, memory failure, timeout or corrupted journal invalidates execution instead of becoming a model score.

Authenticated recipe identity now travels through owned checkpoint tensors, Engine configuration and derived-state keys. The losing refit is rejected before load, and the original minmax identity remains compatible. The native build, complete model-free catalogue and full static suite pass against the same frozen inputs. The supported registry, installed model and release remain unchanged.

Next freeze the final disjoint task selection, app-relevant reply and tool limits, fixed family weights, paired uncertainty method and total cost before collecting held-out answers. Ordinary app jobs, long-context outcomes and image-answer quality remain separate checks. Complete-configuration speed and standalone/transport qualification still precede promotion; unavailable other Macs do not.

### Frozen final task campaign, October 4

[[sources/runs/2026/10/2026-10-04-serial-outcome-campaign-acceptance]] closes the serial runner and grader acceptance. A previously excluded pilot tool case completes for both actual artifacts. The input-budget correction then preserves every recorded response, request history, executed step and final outcome in a zero-model replay. Full static acceptance passes after the correction. Crashes, EOF, worker failures, memory or pressure failures remain execution failures; a verified task-budget refusal remains a retained task outcome. No launched job can be overwritten or automatically retried.

[[records/decisions/final-paired-task-quality-protocol]] adopts the existing proposed engineering margins prospectively for this comparison. [[sources/runs/2026/10/2026-10-04-prospective-heldout-outcome-protocol]] freezes 536 instruction tasks, 243 restricted coding repairs, 1,000 factual tasks, 245 underlying multilingual problems and 195 complete tool conversations. Pilot groups and exact duplicates are excluded before any final answer. The source audit preserves the limits of exact deduplication and public-benchmark novelty. Each family has one fifth of the overall weight, with simultaneous paired score-based bounds and fixed overall/family limits of two/five percentage points.

Both artifacts use the same fourteen-GB ceiling, 32K context, full 4,096-token reply reservation and two streamed drafts. Tool conversations retain twelve model steps per turn, eight calls per step and ninety-six per case. The 138 ordered paired jobs alternate arm order and may reload only between completed independent tasks under the fixed session cutoff. The prospective total allows seventy-two active job hours and six GB of receipts within the existing 430 GB staging bound, with no new weights, raw logits or paid services. The complete protocol hash is ee91815afe069b316bf095abc7bdcaadb46eabcd3a2f3fff898fda712789af5a.

The final campaign has not produced an answer at this checkpoint. Its finite task populations and uncertain pilot discordance may yield inconclusive evidence; that does not qualify a pack or permit sampling until it passes. Ordinary app jobs, long-context and image outcomes, complete speed, standalone delivery and integrated release acceptance remain separate required work.

### Lossless smaller-pack transport preparation, October 4

[[sources/runs/2026/10/2026-10-04-three-bit-lossless-transport-planning]] closes the transport planner's unsupported byte-ratio assertion. Three-bit expert tensors use existing independent raw-weight and BF16 metadata objects instead of the combined four-bit transform. Byte-exact synthetic mixed main/draft reconstruction, chunk tails and coverage refusals pass on both Python runtimes. The original full object plan remains byte-identical. Header-only planning covers every byte of the control artifact without scanning payloads or loading a second model during the ongoing held-out campaign.

This preparatory change does not enable an alternate download or model. Complete transport acceptance, standalone conversion, independent public pull and candidate qualification remain required before integration and promotion.

### Watchdog cleanup correction, October 4

[[sources/runs/2026/10/2026-10-04-outcome-watchdog-cleanup-ownership]] preserves a later CI failure that the earlier local static suites did not expose. The watchdog and caller could both terminate the same child group. A controlled old-runner fixture reproduces that duplicate ownership. The corrected runner serializes termination, retains cleanup errors, independently closes its files and saves an incomplete receipt if draining fails. All ten local unit groups pass on both Python runtimes; full CI acceptance remains pending.

The final task campaign continues with its exact frozen helpers. The correction does not change its sample, outputs, grades, margins or completed jobs, and no failed execution can be converted into a quality result. The separately prepared bounded parallel native authentication path still requires its own complete acceptance and actual-load evidence; it does not change the running binary.

### Transport CI and authentication fixture lifetime, October 4

[[sources/runs/2026/10/2026-10-04-transport-ci-and-authentication-fixture-lifetime]] records full CI acceptance of the lossless three-bit transport fallback. The later bounded parallel authentication change passes coverage and Mac runtime/Xcode checks, but its optimized native catalogue exposes a fixture-lifetime defect. ARC may release the serial owners after their last direct access and before the borrowed-descriptor scans. A deferred explicit lifetime now covers every such scan; the production helper is unchanged. Corrected optimized acceptance and actual-load qualification remain pending. Neither transport acceptance nor the loading helper registers or promotes an alternative pack.

### Retained tensor export primitive, October 4

[[sources/runs/2026/10/2026-10-04-retained-tensor-subset-primitive]] records a bounded, lossless retained-tensor copier and its independent reconstruction checks. It keeps dtype, shapes, names, empty tensors and metadata intact, refuses corrupt or changed sources, and leaves interrupted copies inert without replacing prior output. Tiny-fixture acceptance passes on both Python runtimes; the full local suite waits for the single model campaign to finish.

Header-only planning identifies every retained tensor and excludes the original expert ranges. This prepares a standalone same-checkpoint artifact without changing inference values or source inodes. It does not create that artifact. Complete standalone config/index/provenance, a separate whole-output resource budget, actual export and native parity are still required, followed by quality, performance and distribution acceptance before product admission.

### Pack-owned download progress preparation, October 4

The compressed downloader now has an explicit manifest-bound progress reader. The legacy original-pack entry point delegates with its unchanged compiled transport identity. New fixture cases distinguish two manifests whose filenames and sizes agree, refuse foreign resume bits and malformed coverage, and retain the distinction between progress estimates and final file verification. These fixtures await native/full transport CI; no acceptance result is claimed yet.

This prepares independent resumption for multiple maintained packs without adding a registry entry or accepting downloaded metadata as product authority. Standalone export, candidate qualification, independent public pull and complete integration remain required before an alternative can be offered.

### Selected-pack store preparation

The store now carries an immutable compiled deployment through byte requirements, resumable progress, complete and cancellable verification, compressed transfer, raw transfer, mirror fallback and repair. A supported `ModelPack` supplies that deployment to the new additive `WeightStore(modelDirectory:pack:)` initializer. Legacy initializers, static entry points and function-reference signatures retain the original deployment. Mac setup accepts the same compiled selection and reports its required bytes. Downloaded metadata cannot construct a product pack or register itself.

The internal deployment constructor validates complete digests, positive extents, required files, total-byte overflow and collisions between final filenames and downloader-owned state, including case and canonical Unicode aliases. Compressed transport is authenticated against both its exact manifest hash and the selected complete file list. Environment source overrides continue to change transport locations without changing file pins. The supported registry still contains only the original pack.

New native fixtures exercise independent readiness for equal-name/equal-size files with different hashes, optional-file corruption, cancellation, selected sizes, incompatible transport metadata and unsafe deployment geometry. The real HTTP fixture now includes public-store compressed download, raw download, raw fallback, repair and cancellation, while the independent consumer fixture preserves legacy function types. These source changes await native, transport and Mac CI; no local compilation or model-weight scan is run alongside the frozen held-out campaign. This is distribution preparation, not candidate admission, standalone publication or a completed multi-pack activation gate.


### Corrected authentication acceptance

[[sources/runs/2026/10/2026-10-04-corrected-authentication-fixture-ci]] preserves complete successful CI for commit `7c5d8f0b8b49ac466022fee0998904b7b891597e`. The optimized and instrumented catalogues both pass all checks, including the authentication descriptor-lifetime fixture; complete transport, static, external-consumer and Mac runtime/Xcode gates pass. The watchdog cleanup fix is included in this tested ancestry. Actual model startup and long-read cancellation still require serial local execution after the held-out campaign. Later distribution preparations require their own CI and do not inherit this pass.

### Long-conversation outcome preparation

[[sources/runs/2026/10/2026-10-04-long-conversation-outcome-preparation]] preserves a deterministic synthetic conversation instrument and native tokenizer-only sizing. The cases test initial retrieval, explicit corrections, retained fields and unrelated updates at early, middle and late positions in the supplied records. Actual assistant messages remain in history and every turn contributes to the outcome. Wrong answers, duplicate keys, incomplete generation and trusted admission refusals cannot pass; execution failures remain distinct.

Both local Python test runs and the static-entry harness pass. First-turn prompts span approximately two thousand, eight thousand and twenty-nine thousand tokens, with exact token IDs preserved from the pinned native template. The last group targets conversations inside the existing 32K window with separately reserved continuation and reply space. Only tokenizer metadata was loaded, under a bounded small process; no additional model ran alongside the ongoing final campaign. No model outcomes are available. Freeze the complete execution/resource and acceptance protocol before inference, then preserve every paired conversation and actual native token admission. These focused product fixtures cannot establish statistical long-context noninferiority or replace the general-task, application, vision or performance gates.

### Selected-pack transport acceptance and app proof binding

[[sources/runs/2026/10/2026-10-04-selected-pack-store-ci]] records complete engine, transport, static, instrumented, public-library and Mac runtime/Xcode acceptance for the selected-pack store at commit `be0bfb4545c869dd3c716af0fb0993619f52c295`. The retained-tensor primitive and manifest-specific resume changes are included. Actual standalone production, public transfer and integrated alternative activation remain separate requirements.

The app's in-session verification proof now includes the selected compiled manifest digest as well as APFS file identity. A different pack cannot reuse the proof merely because the same filenames, sizes and timestamps are unchanged. Failed verification clears prior proof; returning to either selection must establish that selection's proof. Foreground load and background preparation use the same selected store and manifest. Unsupported saved choices do not trigger baseline preparation. New cross-manifest checks await Mac CI; no local build is run alongside the ongoing final model campaign.

### Standalone config and index preparation

[[sources/runs/2026/10/2026-10-04-standalone-affine-metadata-preparation]] records coherent configuration and complete tensor-index construction, seven passing unit groups on both local Python runtimes, and static entry-point acceptance. The actual-header preparation changes only the routed expert recipes, preserves both config aliases and covers every parent tensor exactly once across retained and converted files. The old index byte total is recomputed from the output payload geometry. Parent config, index and model-card copies remain separately identified as provenance.

No tensor payload is copied or authenticated by this metadata pass. Whole-output resource pricing, explanatory standalone metadata, verified export, completion identity and native parity remain open. Full CI for the new helper also remains pending. This prepares independent deployment without adding a supported pack or modifying the frozen quality campaign.

### Complete image outcome instrument preparation

[[sources/runs/2026/10/2026-10-04-image-outcome-session-preparation]] records a separately scoped native image-session implementation, its complete-answer Python grader and eight prepared product conversations. The source retains the photograph profile's physical ceiling and preflight reserve, owns candidate vision, counts image tokens before reply admission and records the actual applied allocation plan. Existing text protocols and the running frozen general-task campaign remain unchanged. The driver rejects oversized native input frames before sending.

Driver and grader fixtures pass on both Python runtimes, as does static entry-point acceptance. Native compilation, protocol checks, actual image execution and capacity qualification remain pending. The prepared questions cover known photographs and deterministic color/bar images; they cannot establish broad or statistical image noninferiority. Freeze complete paired execution and acceptance before collecting answers, and preserve the distinction between wrong/incomplete answers and execution failures.

### Standalone whole-pack assembly preparation

[[sources/runs/2026/10/2026-10-04-standalone-bundle-assembly]] records the bounded assembly primitive and the complete model-specific file plan. The actual header and metadata preparation accounts for every retained shard, converted expert file, generated config/index, original parent metadata/card, tokenizer/template/vision/draft/license companion, rotary table and final manifest. The output reservation is 90,236,537,746 bytes for 78 files plus the bounded completion manifest. It is separate from the still-unfrozen whole-workspace reservation and does not enlarge the current staging cap.

The exporter preserves original inodes, authenticates copied inputs, independently reconstructs retained tensors, and rehashes every finished output before publishing a completion manifest. Cancellation, disk exhaustion, corruption, source/directory mutation, manifest overflow and final sync failure leave no accepted completion. Eleven storage groups and five preparation groups pass on both Python runtimes; thirty-two static entry checks pass. Full CI and the actual export remain pending. Completion is always unqualified: standalone native identity/parity, outcomes, performance, redistribution review and independent public transfer remain separate gates.

### Preparation CI and image workspace identity

[[sources/runs/2026/10/2026-10-04-prepared-instruments-ci-and-image-workspace]] closes the selected-manifest app proof checks and Xcode build at ab30587acb0f0eecc2dc872aff57ba1cf04814fc. Full engine CI, coverage and external-library jobs also pass the long-conversation preparation at ad16c67974571b4b4cec51d6b3c8e139777c2540 and standalone config/index at c908c961134ac2e26092f9d5bdd80db7640faa8e. These are remote checks without model weights, not outcome qualification.

The actual deployed image attention uses bounded query tiles, so its workspace is independent of the smaller candidate language-prefill cap. Image sessions now require and report that arithmetic. Later source adds deterministic complete-plan geometry checks for both packs across the photographs and maximum grid; native compilation/execution is pending. The twelve Python driver groups pass on both runtimes, including image arithmetic identity refusals. Actual image memory and answer outcomes remain required, and the ongoing final text/tool campaign keeps its frozen implementation.

### Complete product campaign driver, October 4

[[sources/runs/2026/10/2026-10-04-complete-product-campaign-driver]] records the bounded paired runner for the separately prepared image and synthetic long-conversation fixtures. It binds the driver and helper closure, exact original/minmax artifacts, complete native configuration, inputs, cumulative time and output/staging budget. Every conversation runs both arms in alternating pair order through separate sequential native sessions. A launched directory cannot be retried, and an execution or cleanup failure prevents complete analysis. Stored responses are regraded with the original typed gold; complete native request counters must agree. All candidate turns must be correct for this focused product check, which carries no statistical noninferiority, speed or pack-qualification verdict.

Eight orchestration test groups pass on both Python runtimes and thirty-two static registration checks pass. Those checks use an explicit native-session mock and the real graders, complementing the separately tested production process owner. Full engine and Mac CI now accept the earlier complete native image-session implementation at `55fc67379175c56dc467df4574be354052630411`; the later vision-workspace assertions and this product runner still await their respective full CI results. Actual full image/long-conversation outcomes and capacity remain pending. The frozen held-out task campaign is unchanged, and its partial outcomes remain unopened.

### Native standalone loading preparation, October 4

[[sources/runs/2026/10/2026-10-04-native-standalone-loader-preparation]] captures the complete native standalone path and the completed earlier storage/preparation CI. The loader checks the exact standalone file namespace, component identities and byte ledger, then authenticates every main tensor file with the existing bounded parallel owner before constructing the checkpoint. The preserved parent configuration remains authoritative for the unchanged tokenizer, vision and separate draft; public checkpoint admission stays unchanged. Cache identity additionally binds the complete standalone digest.

Inspection cannot authorize a model. The compiled standalone research allowlist remains empty until the actual export and independent audit produce its exact digest. The existing Engine checks and bounded conversation instrument can then exercise the standalone path without making it a supported pack. New weights-free metadata/rejection checks are registered but compilation and execution await CI; actual export, native arithmetic and resource proof, and complete product outcomes remain open. No local build overlaps the held-out campaign.

The earlier standalone assembly commit passes full engine CI. The image-workspace commit passes full Mac CI and engine coverage/library jobs, but its full engine run failed the missing-machines brain field already corrected by the following commit. That failed workflow remains preserved and is not a successful whole-engine result. The product-driver successor is rerunning the corrected store and affected engine gates.

### Complete standalone export driver, October 4

[[sources/runs/2026/10/2026-10-04-bounded-standalone-export-driver]] records the bounded execution owner around the complete export primitive. A frozen source/component plan and whole-output staging reservation precede the copy. The driver holds the existing model lock through copying and independent audit, enforces process/headroom/pressure/time/disk bounds, and preserves incomplete attempts without retry or installation. Review corrected the preflight/lifetime-lock handoff; a real private-file-lock fixture now covers that boundary. Eight groups pass on both local Python runtimes and thirty-two static entry checks pass. Actual cleanup, protocol freeze, complete export, native proof and product admission remain open.

The same source preserves successful complete engine CI for the earlier paired product driver at `afa6ae5c0858394ffbe3833c5070ccc9d89f5c52`. Its ancestry includes the corrected image-workspace and brain attribution checks. The new standalone loader and export owner still await their own CI. No new model process, payload export or partial held-out analysis accompanies this preparation.

### Frozen activation selection and optional components, October 4

[[sources/runs/2026/10/2026-10-04-frozen-activation-pack-selection]] records loading and rollback bound to the exact resolved pack and manifest. Persisted selections validate the explicit supported entry without rerunning Auto. Pending activation retains that selection across independent readiness changes while rejecting changed effective settings. Optional forecast downloads and missing-component notices now use the selected compiled pack's explicit capability list. The original weight manifest and supported registry stay unchanged.

New identity, persistence and pending-readiness checks await CI and later real-model acceptance. The earlier standalone loader passes complete Mac runtime/Xcode CI; its complete engine workflow is still pending at this checkpoint. These preparations do not qualify a candidate or enable alternative automatic profiles. The final paired campaign retains its frozen code and protocol.

### Held-out startup refusal and release boundary, October 4

[[sources/runs/2026/10/2026-10-04-heldout-native-startup-refusal]] preserves the interrupted frozen campaign and a hash inventory of its complete local evidence. Eighteen paired jobs completed. The next job completed the original arm and forty-five candidate tasks before the candidate process for the remaining tasks refused its memory preflight. That process loaded no model, reset no case and received no request. No answer or partial quality statistic has been selected or interpreted, and the frozen campaign remains incomplete.

The parent recorded sufficient reclaimable memory, but the earlier native refusal omitted its own observation and could also represent an unavailable host-statistics read. A cached observation following release is plausible, not established. The session owner now waits past the existing one-second host-statistics boundary after its child exits, before sampling memory for another launch. It does not enlarge a ceiling, retry a process or accept an unsafe allocation. Repeated cleanup does not repeat the wait, and a live child cannot count as released. Both Python runtimes pass the actual-process cleanup and deadline checks. Native startup now records its preflight observation, including an unavailable value, into an incomplete receipt before refusing.

A continuation requires a separately frozen causal instrument correction under [[records/decisions/final-paired-task-quality-protocol]]. It must bind all completed evidence, preserve the failed attempt, execute only unanswered cells, retain the original sample, graders, margins and native arithmetic, and count prior time, sessions and receipts against the original total resource limits. No continuation or quality verdict is established by this correction. Candidate promotion remains closed.

### Unanswered-only continuation and complete foundation checks, October 4

[[records/decisions/heldout-unanswered-startup-continuation]] authorizes the explicit prospective instrument correction recorded in [[sources/runs/2026/10/2026-10-04-prospective-unanswered-continuation]]. It preserves the original incomplete study and every answer, imports completed jobs without model launches, and runs only unanswered cells. The original executable, model artifacts, settings, task selection/order, graders and analysis rules remain unchanged. All prior active time, attempted sessions and receipt storage remain charged to the original totals. The exact preflight discrepancy is unresolved; post-exit settling does not relax a guard or permit a retry.

The continuation authenticates completed native transcripts, independent resets, answers, counters, artifact/plan identities and physical bounds. It refuses changed or incomplete evidence. Final analysis first requires the entire study, then replays the original graders against the recorded requests and answers before applying the preselected method. The new orchestration and existing native-owner/product-driver suites pass on both Python runtimes; static entry-point registration passes. The source is captured before any continued answer. This preparation is not a quality verdict or candidate promotion.

The new native startup-observation build preserves exact before/after source inputs and passes the full weights-free catalogue. It remains separate from the original study executable. Pack-bound activation now passes complete engine and Mac CI, and the standalone export driver passes complete engine CI. Actual whole export, public pull, product answers, complete performance, alternate-pack integration and release remain open.


### Product protocols and standalone storage preparation, October 4

[[sources/runs/2026/10/2026-10-04-product-protocols-and-standalone-space]] records the prospective complete-conversation protocols, storage preparation and first successful unanswered-only continuation. The interrupted job completed only its five previously unanswered candidate cells. All ninety-five prior answers, native session counters and the original unloaded startup failure remain preserved. The original campaign is still incomplete; only completion metadata has been inspected, with no partial quality analysis. The continuation has advanced to subsequent jobs.

Before any product answers, separate image and long-conversation protocols bind original and candidate packs, frozen native and helper bytes, every input and expected answer, alternating arm order, complete reply reservations and fixed acceptance. They retain the bounded physical ceilings and preflights of the already checked instruments. The image suite has eight conversations; the long-conversation suite has nine at short, medium and near-window occupancy. Each family reserves six hours and 128 MB of receipts, and requires every candidate turn to pass. These focused outcomes cannot establish general image noninferiority or speed. Both protocols pass read-only validation from a clean process. The first copied-runtime import failure is preserved; the second freeze preserves package paths without changing cases, grades or resource limits. Neither family has run.

The metadata-only retirement plan names ninety-six regular generated payloads, comprising the losing affine refit and redundant VQ 3.2 contiguous repack. It preserves original checkpoints, the selected minmax candidate, all manifests and source/build evidence, and exact producer bytes. The earlier producer-hash refusal is preserved, with the original transport writer recovered by digest from Git into the archive alone. Planned retirement makes room under the unchanged staging ceiling for the complete standalone export and remaining study receipts. No payload has been deleted, fully rescanned or exported alongside the active model study. Execution still requires exclusive ownership, full hashes and unchanged identities of precisely the listed files.

The source also preserves the official checkpoint license and its byte identity with the pinned license. Commercial product-use clearance under its stated business restrictions remains a release input; this review establishes neither applicability nor permission. Engineering and local evaluation continue. No public weights or application release has been published.


### Authenticated research-payload retirement driver, October 4

[[sources/runs/2026/10/2026-10-04-authenticated-research-retirement-driver]] records the restricted execution owner for the already prepared two-artifact retirement plan. It verifies complete payload hashes before any deletion, preserves exact reconstruction custody, binds immutable file identities, holds the native exclusion lock and records durable per-file intent and outcome. Headroom, pressure, process, time and staging checks remain active; partial deletion is preserved and cannot be retried silently. Only the explicit generated files can be retired.

Seven real-filesystem fixture groups pass on both Python runtimes, including late authentication failure, replacement/symlink refusal, mutation after hashing, interruption, live resource loss and scope/custody rejection. The initial canonical-path test failure is retained and corrected. All thirty-two static entry-point checks pass, and the real prospective plan passes metadata-only validation. Actual retirement and full standalone production still await exclusive ownership after the active study; no model payload was scanned or deleted for these instrument checks.


### Explicit affine lookahead preparation, October 4

[[sources/runs/2026/10/2026-10-04-affine-lookahead-preparation]] records a prospective text-only grouped-affine lookahead mode. Its separate resource identity requires the exact complete uncorrected scheduler/router reservation, keeps candidate byte geometry and disables inherited activation and speed claims. Earlier candidate modes remain unchanged. The original learned correction is not loaded; public pack admission and Auto profiles stay closed.

The native catalogue and existing bounded Engine diagnostic now include explicit reserve/refusal checks and prepared demanded-versus-forecast output, allocation-owner, cancellation, prefix and governor checks. These additions await compilation, CI and physical parity/resource execution. Source inspection is not optimization qualification. Only after those gates may a separately frozen complete-configuration comparison measure whether this mode helps; the running quality study and frozen product protocols remain unchanged.


### Complete-configuration performance instrument preparation, October 4

[[sources/runs/2026/10/2026-10-04-complete-configuration-performance-preparation]] records a native instrument for separately frozen complete Engine profiles, with explicit ceiling/target, draft, admitted lookahead, prefix, live governor and keep-alive settings. Fixed-work diagnostic output and ordinary natural completion remain separate. Raw receipts include committed-token intervals, decoded-text callbacks, startup, plan boundaries, memory, paging and operating conditions. The physical/pressure guards run before loading and continue throughout execution. A present invalid correction cannot be mistaken for an absent component.

The conservative throughput helper removes the prefill-produced first token from its numerator while retaining the complete decode timer. It keeps active emission, visible text, short-response latency and tail stalls separate. A simultaneous one-sided median bound uses exact binomial rank tails under the stated independent run-level sampling assumption. Too few repetitions or a missing scenario cannot pass the speed gate, and the helper never grants model qualification. Eight groups pass on both Python runtimes, including independent exhaustive rank witnesses; all thirty-two static registration checks pass. Native compilation, physical instrument acceptance, paired execution and a prospective final scenario/sample-count freeze remain pending. No speed observation is produced by this preparation.

The same source closes complete engine CI for the unanswered-only continuation at 54811942cd622d982291c0693b593039a2a7eaf0 and complete engine/Mac CI for explicit startup observation at 454209c6d377ebeefd2290e2866a48fbd3d72d88. These are source and integration gates, not completion of the still-running quality study.


### Complete paired performance owner, October 4

[[sources/runs/2026/10/2026-10-04-complete-performance-campaign-preparation]] records a source-bound sequential owner for the complete native configuration instrument. It binds binary, library, source archive, artifacts, prompts, reply reservations, context and memory controls before execution. Alternating adjacent pairs retain all attempted evidence. Final analysis requires complete coverage and recomputes work, memory and eligibility from authenticated raw receipts. A final speed study additionally requires a complete eligible pilot, an explicit prospective sampling rationale and enough run-level observations for the entire comparison family. The pilot cannot qualify an artifact.

Native child supervision enforces physical and parent ceilings, real headroom, OS pressure, deadlines and complete storage reservation. Timing exclusions preserve functional evidence without selecting replacement runs or a favorable subset. Startup remains separated by profile; individual timing observations, single-token latency and worst observed stalls remain available. Nine fixture groups pass on both Python runtimes, including real tiny child cleanup after an injected physical violation and a post-exit observation failure. Thirty-two static entry checks pass. The initial broad test stub broke process-table enumeration and is preserved with its narrow fixture correction. No model or performance campaign ran during this work.

The same source closes full engine and Mac CI for the explicit lookahead preparation at 0435d4871743c1d9a215fd8e3c500c2272eb7c0d. Physical lookahead parity, complete-configuration pilot/final execution, lower-budget performance profiles and promotion remain open. The held-out quality continuation keeps its existing frozen executable and protocol.


### Complete-performance latency acceptance, October 4

[[sources/runs/2026/10/2026-10-04-complete-performance-latency-acceptance]] adds explicit final margins for paired natural-request latency, first decoded text and native load time. Every final profile requires natural tasks; truncated or undelivered answers preserve execution evidence but cannot pass complete performance. The final sample-count decision must also come from a pilot with complete natural delivery. No latency tolerance or sample count has yet been chosen from measured results.

The exact upper median rank bound shares one simultaneous comparison family with all decode lower bounds. A successful decode gate cannot compensate for failing response or startup latency. Nine statistical groups and eleven campaign groups pass on both Python runtimes, including independently enumerated upper-tail errors and separate slow-response, slow-first-text, slow-startup and truncated-answer regressions. No model or benchmark ran. Actual final margins, physical instrument acceptance and pilot/final performance collection remain open.

### Deterministic Auto profile matching preparation, October 4

The engine now has a context-aware, pure profile matcher. Compiled profiles bind a supported manifest, completed-task quality reference, exact execution policy, requested context/features and a feasible proposed resource plan. Installed eligibility is an explicit accepted-manifest set; selection cannot download, authenticate or allocate a model. Explicit overrides retain their independent behavior, and unmatched Auto preserves an accepted supported incumbent before falling back to the original pack. The live governor never calls this policy.

A measured result additionally requires the exact chip, model, physical RAM, OS, local storage volume and configuration fingerprint. Simulated machines or plans cannot acquire measured evidence. Estimates require explicit hardware, RAM and target ranges, a rationale and matching measured anchors; they carry no measured speed bound. The selector first prefers profiles meeting the target, then measured evidence, quality rank, measured conservative speed, an equivalent incumbent and a stable identity tie-break. Missing, malformed or mismatched evidence cannot qualify itself. All byte feasibility checks retain the saved ceiling and current availability separately.

The proposed plan fingerprint includes the registered pack's own resource contract, complete allocation geometry, context/features, lookahead and runtime allocation choices. A different pack's resource arithmetic is refused. CLI inspection exposes the evidence category and optional exact profile/configuration without certifying a speed target. Pure catalogue fixtures cover hardware and evidence mismatches, memory boundaries, quality/speed ordering, deterministic ties, retained overrides, invalid estimates and public compatibility. Compilation and execution of these new fixtures remain pending CI. The production profile list remains empty, and candidate-aware app selection/activation remains open until a real artifact qualifies.

[[sources/runs/2026/10/2026-10-04-complete-performance-native-ci]] preserves complete successful engine and Mac CI for the native complete-performance instrument. This verifies compilation and integration only. Physical lookahead and complete-performance campaigns still wait behind the unchanged held-out quality continuation; no pack or speed promise is promoted.

### Pack-owned memory range and activation planning, October 4

The public supported-pack planner now dispatches through its own immutable resource profile, preserving the original public planner's behavior. A control-range inquiry accepts context and component choices, prices the full ledger at discrete control values on explicitly simulated hardware, and keeps real availability out of the displayed range. Required images include tower residency. The upper endpoint retains the existing stable hardware policy; every actual load separately enforces current headroom and the saved ceiling. Exact integer byte comparisons bound the returned control endpoints.

Desktop custom validation uses this pack/context range. Its first-use control takes the current pack's minimum, while an existing saved value stays visible even below a newly required floor. Telemetry caches ranges by pack and physical hardware so memory polling does not repeat the search or rerun Auto. The controls consume the displayed minimum and explicitly disable unavailable ranges. A new light/dark/system fixture preserves and renders a saved value below a higher component floor. Activation planning receives the already frozen pack rather than resolving Auto again, so a future selected pack cannot inherit original resource arithmetic.

Pure catalogue checks cover stable ranges under busy snapshots, exact endpoints and the preceding grid value, required draft/image and long-context costs, invalid hardware/controls, actual-headroom refusal and unchanged original-plan JSON. App fixtures bind the visible endpoints to the ledger and preserve both old budget-selector function behavior and saved values. Compilation, fixture execution and physical UI rendering of this range change are still pending; no alternative artifact is registered or loaded.

[[sources/runs/2026/10/2026-10-04-auto-policy-ci-access-correction]] preserves the failed first Auto-policy CI. Swift synthesized the fixture profile initializer as module-private, so the separate diagnostics module could not construct its synthetic profiles. The explicit package-scoped initializer corrects that source error and remains unavailable to external applications or downloaded metadata. The earlier production Mac Xcode build passed; full corrected engine and app acceptance remains pending. The held-out quality continuation has completed another job and remains frozen and unanalyzed.

### Measured operating-condition binding and remaining performance integration, October 4

Auto profile matching now includes current OS thermal state and Low Power Mode. Only the nominal, non-conserving state admitted by the complete-performance protocol can match a measured point or serve as its estimate anchor. Missing, different or unsupported conditions cannot self-qualify. The original hardware initializer remains available and represents missing conditions explicitly. New pure fixtures change each hardware and operating-state dimension independently; execution is pending CI. User-facing wording describes a matching historical test, not a promised instantaneous rate. No runtime pressure event invokes selection or replaces the loaded pack.

The complete-performance producer still needs two concrete integrations before final use: its candidate path currently measures the composite original-plus-control research source, while the finished product will load the standalone artifact; and its stock Engine setup does not yet apply Desktop's short-prompt policy. The next prospective producer revision must support authenticated standalone loading and explicitly frozen short-prompt settings, preserve the existing producer contract and resource bounds, and update paired validation/receipts. No actual complete-performance pilot or final protocol has been frozen or executed, so these changes do not replace or reinterpret observations.

The pure selector currently matches caller-provided proposed plans. Full candidate Auto integration still needs the qualified recipe's own initial plan and automatic ceiling, supported custom-ceiling behavior, accepted installed-content ownership and frozen activation/recovery. Do not treat the prepared matcher or an empty compiled profile list as that completed product behavior. Candidate qualification, artifact production and complete local integrated acceptance remain open.

The first corrected engine run exposed a second fixture compilation error, preserved in [[sources/runs/2026/10/2026-10-04-pack-range-stride-correction]]. The interior-control sweep passed an Int64 byte increment to Swift's Int stride parameter. An explicit conversion of that bounded increment fixes the fixture without changing its boundaries or planner expectations. No policy/range execution is claimed from that failed run; full corrected acceptance remains pending.


### Standalone and Desktop complete-performance V2, October 4

[[sources/runs/2026/10/2026-10-04-standalone-desktop-performance-v2]] records the prospective native and paired V2 instruments. Physical deployment and the complete standalone manifest are distinct from the unchanged minmax numerical provenance. The standalone loader owns its table and still requires compiled research admission. V1 keeps its composite/stock-Engine behavior. V2 freezes a shared Desktop or stock prefill policy and checks the actual per-request maximum captured inside generation, including the short-prompt boundary. Older saved statistics remain decodable.

Fourteen campaign fixture groups pass on both Python runtimes and all thirty-two static entry checks pass. The V2 owner preserves paired coverage, resource supervision, statistical and latency gates, and refuses a final sampling basis from another deployment. No actual complete-performance campaign or native V2 run has occurred; compiled standalone admission remains closed pending the complete export and byte audit. The existing held-out quality campaign remains unchanged.

The same source preserves the latest range-fixture failure: its strict claim that a required streamed draft must raise the rounded control minimum was false. The correction checks the required head, its exact byte charge and full allocation within the returned minimum; full resident placement has a separate higher-floor check. The planner and resource policy are unchanged. Auto matching passed the instrumented catalogue, but corrected full range and V2 acceptance remain pending. The older Mac build at 1ba2dc02ef1db40068f2c12e5dee2336eca2b6b2 now has complete successful runtime and Xcode results.

### Pack-owned product startup recipes, October 4

[[sources/runs/2026/10/2026-10-04-pack-startup-defaults-preparation]] records a compiled startup recipe required by each supported pack. It owns the automatic ceiling and complete product execution choices instead of inheriting the original cap or hidden ambient draft/power tuning. The original Desktop values and independent CLI defaults are preserved. Pack-owned startup planning keeps the hardware ceiling separate from current headroom, permits a larger valid custom limit and retains exact saved values. Hardware controls price required components; actual load checks availability separately.

Desktop now consumes the frozen pack's recipe for planning, ranges, selected-ceiling display and explicit startup configuration. Applied identity binds the recipe's non-planner choices alongside the actual model arithmetic, correction, complete plan and executable. Durable activation stores the recipe identity and refuses a changed policy during load or rollback. Legacy original records retain their historical interpretation and semantic equality, so the new identity field cannot silently unlock retries of earlier failures.

Pure native fixtures, application identity/planning fixtures, the external-consumer API probe and the real activation check are extended. Only the thirty-two static entry checks and shell/diff checks have run locally on this stage; native compilation, the new fixtures and real updated activation remain pending. The previous performance V2 source has passed its instrumented Auto, memory-range and protocol catalogue; complete engine and Mac checks remain in progress in the preserved snapshot.

This is startup recipe ownership, not completed alternative Auto activation. Qualified proposal generation/matching, accepted installed-content state, multiple-pack setup, actual candidate app loading, full quality/performance, standalone public transfer and integrated acceptance still remain. No alternate pack or profile is enabled, and the running quality continuation remains unchanged.
