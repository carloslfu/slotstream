# Candidate screening

`screen-v1.json` freezes the bounded feasibility protocol. It is not a release
qualification protocol. Run only one model or native kernel process at a time,
with the real memory preflight required by `AGENTS.md`. Do not run a build,
download or storage study during timings.

The baseline tool saves its executable and metallib hashes, model metadata,
exact commands, raw outputs, sampled footprint and generation conditions. Its
host contention observations are endpoint snapshots, not continuous isolation.
The first implementation run predates removal of ambient developer overrides;
its original receipts remain unchanged and must not be promoted into a release
benchmark. The baseline's fixed `--memory-gb` is a compatibility control, not
the adaptive-ceiling Auto policy.

The inventory requires an exact Hugging Face revision and validates every
safetensors header and range response. It does not verify full weight payloads.
The fixture extractor checks header/config identity and fetches representative
expert/PLE rows for a separate scalar decoding oracle. These rows establish
storage decoding, not model-logit or fused-dot parity.

The native kernel screen includes both expert projection shapes, ten routed
experts, and one, four and thirty-two input rows. Affine arms share a synthetic
dense source and rotate order. VQ arms use spread synthetic codebook accesses
and materialize bounded decoded weights before a gathered matrix multiply.
Those VQ arms are cost probes, not equivalent quantizations of the affine
source. They do not establish the performance of an optimized fused VQ kernel.

## Full-vocabulary pilot scorer

Generate each artifact's logits sequentially using its separately verified
runtime, then run:

```sh
python3 Tools/quantization_quality.py \
  --reference /path/to/vq-reference/manifest.json \
  --baseline /path/to/current/manifest.json \
  --candidate /path/to/candidate/manifest.json \
  --out /path/to/new-result.json
```

Each directory contains a manifest and raw row-major little-endian float32
logits. A row is the next-token distribution **after**
`tokens[:positions[row] + 1]`. All vocabulary entries must be present; top-k
files cannot be relabeled. The format is:

```json
{
  "schema": 1,
  "vocabulary": 248320,
  "format": "f32le",
  "scope": "pilot",
  "artifact": {
    "checkpoint": "Qwen/Qwen3.8-Flash-Next",
    "checkpoint_revision": "EXACT_ORIGINAL_40_HEX_REVISION",
    "tokenizer_sha256": "64_HEX_DIGEST",
    "template_sha256": "64_HEX_DIGEST",
    "pack_sha256": "64_HEX_VERIFIED_PACK_MANIFEST_DIGEST",
    "runtime_sha256": "64_HEX_RUNTIME_IDENTITY_DIGEST",
    "arithmetic": "exact pinned arithmetic mode and preprocessing"
  },
  "cases": [{
    "id": "tool-pilot-a",
    "family": "tools",
    "tokens": [9707, 11],
    "positions": [1],
    "file": "tool-pilot-a.f32",
    "sha256": "64_HEX_FILE_DIGEST"
  }]
}
```

Replace placeholders with verified identities. Equal identity fields are a
consistency check, not proof of their truth. Producers must preserve their
source, pack provenance, prompts, arithmetic settings and raw generation
receipts. The scorer checks raw sizes, hashes, token bounds, exact contexts and
concurrent changes, uses stable full-vocabulary KL(reference || other), and
preserves each evaluated position. Its storage ceiling is the frozen protocol's
reference-logit budget, enforced independently for each artifact. It reads one
logit row at a time and has no model dependency.

Matching top predictions do not establish equal distributions. KL and top-1
agreement do not establish completed-task quality. No synthetic scorer fixture
is model-quality evidence. The selected reference must be the pinned VQ
reference required by the project decision, and remains a quantized proxy.

The scorer deliberately emits no pass/fail quality decision. Pilot estimates
must precede frozen held-out examples, sample counts, paired confidence methods,
noninferiority and latency margins. Complete app tasks, tool traces, exact
native reference parity, memory/governor checks and actual hardware qualification
remain independent gates in the canonical plan.
## Paired task-outcome analysis

`Tools/quantization_paired.py` provides prospective paired binary-outcome
analysis for a separately frozen held-out protocol. It uses the
[Tango score interval](https://www.site.uottawa.ca/~nat/Courses/csi5388/Tango.paired.pdf)
with a constrained discordance fit. For fixed task-family strata, simultaneous
Bonferroni family bounds are combined using the declared family weights.
The coverage is asymptotic, not an exact finite-sample guarantee. The method
does not pool different task families as identically distributed trials.

A task pair, including its whole tool trajectory or translated problem, is
one observation. Repeated tokens, repeated generations and translations of
the same problem cannot enlarge the independent sample. Corpus selection,
grader behavior, missing outcomes, sample counts, margins, family weights and
candidate multiplicity must be frozen before the final model outputs.
Structural safety and successful execution remain separate gates. The helper
always returns `qualification: false`; statistical results alone cannot admit
a pack. The tests include published interval witnesses and an independent
constrained-likelihood optimization.

## Fused expert pilot

`fused-v1.json` freezes the first fused projection pilot. `fused-v2.json`
keeps its arithmetic and shapes while preparing checked CPU routing before
timing, removing a redundant GPU bounds-reduction synchronization. The CLI
currently runs the second pilot; the first receipts stay unchanged. Extract only the
reviewed Metal strings from the exact pinned runtime with
`Tools/vq_kernel_sources.py`. The tool parses string expressions; it never
imports or executes upstream Python. The checked-in source and Apache license
are digest-checked by its test.

After the usual single-process/headroom preflight, generate binding fixtures:

```sh
.venv/bin/python Tools/vq_fused_reference.py --runtime <pinned-model.py> \
  --fixtures <row-fixtures> --out <new-fused-fixtures>
.build/release/slotstream quantization-check --kernels \
  --fused-fixture-directory <new-fused-fixtures>
.build/release/slotstream quantization-bench \
  --fused-fixture-directory <new-fused-fixtures>
```

Repeat `--fixtures` for the inspected row collections to cover every family.
The Python oracle and native wrapper use the same reviewed Metal source.
Bit equality checks input conversion, packing, routing, dispatch and binding;
it does not independently establish the kernel arithmetic or full-model
parity. PLE, full checkpoints, mixed caches and quality are separate gates.

The pinned D8 profile switches reductions at the routed-pair boundary. A draft
verification batch can therefore use different arithmetic from single-token
decode. Matching this reference binding does not prove speculative row parity;
the full draft/state gates must qualify that interaction independently.

## Bounded PLE and full-reference instrument

`Tools/vq_ple_stream.py` gathers only requested packed PLE rows. It validates
the pinned file headers, dtype/shape/extents, each row ID and file stability;
the model sees a small codebook and per-call arrays. Duplicate row requests
retain their original ordering. Full-payload provenance remains a separate
gate. The reader's limit covers a complete prompt chunk even when every
n-gram head hits the same shard. It does not retain a persistent row cache.

`Tools/vq_ple_reference_check.py` compares the disk-backed module with the
resident upstream PLE class and the scalar half-product oracle. It executes
only that hash-verified class, including its exact half-product and BF16
conversion. The rest of `model.py` is not imported by this component check.

```sh
.venv/bin/python Tools/vq_ple_reference_check.py --runtime <pinned-model.py> \
  --fixtures <row-fixtures> --out <new-ple-check>
```

`Tools/vq_model_reference.py` is an experimental text reference, separate from
the production loader. It pins the architecture source from MLX-LM PR 1788
at `2097324ed04ff76078366c77148b88b9db612ba2`, MLX 0.32.2, mlx-lm 0.31.3,
and the inspected VQ runtime. It executes the reviewed VQ operations before
the upstream model-file shim, so its architecture resolver does not run.
Each artifact's complete tensor files must match the pinned full-file digest
map before model construction. Strict weight loading refuses a missing or
misnamed module. All PLE shards use bounded reads before parameter evaluation.

The runner materializes one transformer layer at a time, with separate cache
state for that layer and prompt chunks of 512. It re-reads each indexer cache
at each chunk. It evaluates the head at the original chunk shape before
selecting output rows; selecting hidden rows first could change GEMM reduction
order. Its initial pilot is bounded to 2048 input tokens and sixteen complete
vocabulary rows. These limits are experiment scope, not product context limits.
Kernel knobs must be absent from the ambient environment. The reference fixes
the decoded-expert chunk to 32 for the fallback path. The admitted large-prefill
geometries use the pinned default fused segmented GEMM. Its executed flags and
kernel names are captured by the prefill component producer below.

The complete-file verification receipt (`verified.json`) binds the exact
revision, pinned Hub metadata and every tensor file's original size/hash.
The runner rehashes these bytes itself. `hub-files.json`, config and the weight
index sit next to the frozen inventory. These inputs are explicit research
artifacts; they do not add a user-facing downloader or model catalog.

Stage that artifact with the inspected Hub downloader and a separate full-file
hash pass. The command operates only on the allowlisted research revisions,
uses one file at a time and requires disk for a complete artifact plus reserve:

```sh
.venv/bin/python Tools/vq_model_fetch.py --inventory <inventory.json> \
  --out <research-candidate-directory>
```

Before a full run, a new directory must record the exact first-four-layer
comparison between ordinary chunk-major execution and layer streaming. The
input crosses a prompt-chunk boundary and includes EOS boundaries. This is a
storage/traversal check, not native model parity. The full run requires that
receipt for the same candidate and reference configuration:

```sh
.venv/bin/python Tools/vq_model_reference.py --model <verified-candidate> \
  --inventory <inventory.json> --architecture <pinned-qwen4_exp.py> \
  --tokens <frozen-boundary-tokens.json> --layers 4 --prove-order \
  --out <new-order-proof>
.venv/bin/python Tools/vq_model_reference.py --model <verified-candidate> \
  --inventory <inventory.json> --architecture <pinned-qwen4_exp.py> \
  --tokens <frozen-pilot-tokens.json> --order-proof <new-order-proof/receipt.json> \
  --out <new-full-reference>
```

The process holds the shared model lock, requires actual reclaimable headroom,
caps its MLX allocations and physical footprint, monitors OS pressure, and
stops on nonfinite results or changed files. It produces raw receipts, never
a qualification flag. Synthetic boundary inputs and a short complete forward
establish instrument feasibility only. Full native logits/generation/cache
parity, held-out quality, app jobs and real-hardware speed remain later gates.

The matching native baseline producer is `quantization-logits`. It accepts the
same frozen token-list file, preserves the complete head batch before selecting
rows, and writes the selected full-vocabulary F32 rows plus its receipt. It
uses the existing 4-bit checkpoint, a bounded expert pool, deployed defaults,
and no draft or vision component. Developer overrides are refused. Run under
the ordinary single-process rule with a real headroom check; process-memory
supervision and a separate `pull --verify` provide the complete run evidence.

```sh
.build/release/slotstream quantization-logits --model <pinned-4bit-directory> \
  --tokens <frozen-pilot-tokens.json> --output <new-native-baseline>
```

Bind the baseline receipt to the tested binary, metallib and source archive.
These raw producer receipts are not quality manifests: original checkpoint,
tokenizer/template provenance, evaluation split and task-family identities must
still be established before the scorer can compare artifacts. Numerical pilot
inputs do not become a held-out task suite by assigning them a family label.

`VQPLERows` also implements the bounded lookup in native Swift. It accepts
owner-retaining checked read closures, keeps codebooks rather than complete
tables, and returns the exact BF16 row bits. The native fixture gate reads
the private verified fixture file positionally and compares the resulting
bits to the scalar oracle. Checkpoint admission, persistent caching and the
configuration-generation fence remain responsibilities of its future owner.

## Matched full-model distribution pilot

The supplied VQ tokenizer files differ from the original pre-tokenizer and
decoder configuration. The vocabulary and ordered merge mapping match, but
direct Hindi tokenization differs. The pilot therefore explicitly selects the
original tokenizer and freezes one set of token IDs for all arms. Downloaded
candidate files are preserved. This preprocessing choice must also be part of
any eventual supported pack and its qualification.

`logit-pilot-v1.json` freezes owned continuations before model results, with
an explicit resource budget and no promotion verdict. The original repository's
visible history has unchanged non-README payloads; its immutable checkpoint
identity is supported by that history and the derivative model declarations,
not by independently replaying the quantizer.

```sh
.venv/bin/python Tools/quantization_logit_pilot.py \
  --protocol bench/quantization/logit-pilot-v1.json \
  --tokenizer <original-tokenizer.json> --out <new-input-directory>
.venv/bin/python Tools/quantization_logit_run.py --arm native \
  --inputs <inputs.json> --model <verified-original-pack> \
  --binary <frozen-build/slotstream> --out <new-native-run>
.venv/bin/python Tools/quantization_logit_run.py --arm vq \
  --inputs <inputs.json> --model <verified-vq-pack> \
  --inventory <inventory.json> --architecture <pinned-qwen4_exp.py> \
  --order-proof <same-pack-traversal/receipt.json> --out <new-vq-run>
```

Run producers sequentially. Each case has its own process, actual headroom
preflight, footprint/OS-pressure supervision, source identity, raw output and
receipt. A failure stops the arm and remains inspectable. Run the VQ producer
separately for the candidate and reference, with each one's own traversal proof.
Verify baseline payloads independently using the frozen binary's `pull --verify`.

After all arms complete, bind the producer receipts to the existing scorer:

```sh
.venv/bin/python Tools/quantization_logit_compare.py --inputs <inputs.json> \
  --reference <vq-4.4-run> --reference-inventory <vq-4.4-inventory.json> \
  --baseline <native-run> \
  --candidate <vq-3.2-run> --candidate-inventory <vq-3.2-inventory.json> \
  --out <new-comparison-directory>
```

The adapter requires the designated reference, complete matching contexts,
successful bounded producer runs, exact inventories and unchanged logit bytes.
It preserves full-vocabulary KL and top-1 results per case and reports
`qualification: unproven`. These correlated teacher-forced rows do not measure
generation quality, successful tool execution, held-out noninferiority,
speculation, image support or throughput. The ordinary same-artifact equality
benchmark is unchanged.

The inspected VQ packs also store raw zero-centered non-gated norms under
converted tensor names. The pinned architecture's sanitizer does not fold
those names. `vq_model_reference.py` therefore applies one explicit BF16
`1 + weight` conversion to the complete checked normalization family. Gated
delta-net norms stay untouched. Receipts identify this convention and old
receipts without it are refused. The first matched pilot omitted this fold;
its scores and diagnosis are preserved and cannot support a quality claim.
Traversal equality alone cannot catch an error shared by both traversals.

## Complete expert record composition

`Tools/vq_record_reference.py` gathers whole gate/up/down matrices for fixed
expert IDs from each pinned pack, using checked positional reads. It executes
the installed, identity-bound MLX-LM routed SwiGLU with the reviewed VQ runtime.
Fixtures cover duplicate routes and batches of 10, 20 and 30 routed pairs.
These real 3.2/4.4 records do not contain D8; the separate fused projection
fixtures exercise the D8 dispatch boundary. Run it
sequentially under `quantization_logit_run.supervise` so process memory, pressure
and timeout checks cover the whole process:

```sh
.venv/bin/python Tools/vq_record_reference.py --model <verified-vq-pack> \
  --inventory <inventory.json> --architecture <pinned-qwen4_exp.py> \
  --out <new-record-fixtures>
.build/release/slotstream quantization-check \
  --record-fixture-directory <new-record-fixtures>
```

The native `VQRecordLayout` defines allocation classes by every projection's
layout, not merely equal byte size. It counts shared codebooks separately.
`VQRecordBatch` owns immutable complete records, rejects missing/duplicate
expert identities and preserves the full route batch's kernel dispatch.
These component checks do not establish mutable-bank pinning, resize safety,
full-model parity or a supported pack.

## Dense-block arithmetic and continuation

`Tools/vq_trunk_reference.py` verifies the complete pinned artifact, then
exports the first linear-attention block and its hyper-connection with the
corrected normalization convention. It records ordinary forwards and a
subsequent continuation, including convolution and FP32 recurrence state.
Run the producer sequentially under `quantization_logit_run.supervise`, as
with the complete expert-record producer above:

```sh
.venv/bin/python Tools/vq_trunk_reference.py --model <verified-vq-pack> \
  --inventory <inventory.json> --architecture <pinned-qwen4_exp.py> \
  --out <new-trunk-fixtures>
.build/release/slotstream quantization-check \
  --trunk-fixture-directory <new-trunk-fixtures>
```

The internal candidate profile uses the pinned reference's grouped RMS,
query/key normalization, quantized injection, compiled decay and ordinary
recurrence reduction. The deployed arithmetic remains the default. Native
checks require exact output and state bits; a small drift is a failure.
Candidate speculative recording is not implemented by this probe. Passing
these fixtures does not establish full-model parity, PLE/QSA integration,
mixed cache ownership, task quality or speed.

## Owned checkpoint reads

`VQTensorFile` is the experimental direct-read primitive. Its caller must
authenticate its complete-file and header identities against a pinned pack
manifest. It verifies the complete payload through an owned descriptor and
uses that descriptor for subsequent bounded tensor reads, refusing changed
files or incomplete operations. It is not a pack registry or a mutable cache.

The synthetic storage gate runs without model weights or GPU allocations:

```sh
.build/release/slotstream-checks --tier t0 --filter quantization-tensor-file
```

This gate checks corruption, cancellation, truncation, descriptor retention,
path replacement and malformed files. Passing it does not prove that a real
candidate has been bound to the reader or loaded by the engine.

## Authenticated artifact and complete-stack probes

`VQCheckpoint` binds that reader to the two pinned research artifacts. It
authenticates the inventory, configuration, index and full-file hash map, then
independently verifies each demanded tensor file through its retained descriptor.
It gathers complete expert records, bounded PLE rows, one dense layer and the
final head without admitting the candidate to `Engine.load`. The independent
draft sidecar is excluded from this main-model path.

```sh
.build/release/slotstream quantization-check \
  --source-directory <verified-vq-pack> --source-inventory <inventory.json> \
  --record-fixture-directory <same-pack-record-fixtures> \
  --fixture-directory <same-pack-row-fixtures>
python3 Tools/vq_checkpoint_gate.py --binary <frozen-build/slotstream> \
  --source <verified-vq-pack> --inventory <inventory.json> \
  --records <same-pack-record-fixtures> --out <new-metadata-check>
```

The second command changes only copied metadata and requires rejection at the
authentication boundary before any absent tensor payload is opened.

`Tools/vq_model_smoke_reference.py` records every layer's hidden and continuation
state, final mixer and full-vocabulary logits for three fixed tokens including
an EOS boundary, followed by one continuation token. It calls the unmodified
pinned decoder blocks with those exact pass shapes. Run it sequentially under
`quantization_logit_run.supervise` for process, pressure and wall-time bounds:

```sh
.venv/bin/python Tools/vq_model_smoke_reference.py --model <verified-vq-pack> \
  --inventory <inventory.json> --architecture <pinned-qwen4_exp.py> \
  --out <new-model-fixtures>
.build/release/slotstream quantization-model-check \
  --source-directory <verified-vq-pack> --source-inventory <inventory.json> \
  --fixture-directory <same-pack-model-fixtures> --output <new-native-result>
```

Both producers require actual reclaimable headroom and own the shared model
lock. Each comparison is exact; a first mismatch poisons the probe state and
preserves the boundary and trace instead of continuing with corrupted state.
This short probe does not exercise ordinary prefill, sparse indexer activation,
generation, mutable caches, draft, images, quality or throughput qualification.

Add `--batched` to the reference command to freeze an eight-token prompt pass
and three-token continuation. The same native command recognizes that exact
fixture profile and requires evidence of multiple complete-record partitions.
`VQRouteStream` gathers bounded sets of complete experts, preserves the original
routed-pair count for kernel selection, finishes GPU uses before releasing each
immutable batch, and restores the original pair order. Component checks compare
different staging capacities and exercise the D8 reduction boundary. This is
not a mutable cache or the upstream large-prefill GEMM path.

The candidate arithmetic uses a separate BF16 sigmoid with precise exponential
and explicit intermediate rounding. `Tools/vq_sigmoid_reference.py --out <new-dir>`
freezes the pinned Python GPU outputs for every finite BF16 input. The native
`quantization-check --kernels` gate checks the same complete output digest and
the rounding-boundary scalar. The deployed sigmoid remains unchanged. Preserve
the exact runtime identity: sharing a formula or metallib does not establish
identical intermediate rounding across host bindings.

## Large-prefill expert component

`Tools/vq_prefill_reference.py` freezes the actual upstream fused segmented
dispatch for 410 and 512 prompt rows, using sixty-four real experts and skewed
routing. This covers partial tiles, the transition beyond fused decode and
multiple bounded native staging batches. The producer validates the pinned
flags and records the kernel variants it actually executed. Run it under the
same sequential `quantization_logit_run.supervise` resource bounds:

```sh
.venv/bin/python Tools/vq_prefill_reference.py --model <verified-vq-pack> \
  --inventory <inventory.json> --architecture <pinned-qwen4_exp.py> \
  --out <new-prefill-fixtures>
.build/release/slotstream quantization-check \
  --prefill-fixture-directory <same-pack-prefill-fixtures>
```

The native binding uses the reviewed kernel's exact preprocessing macros and
F16 I/O contract. `VQPrefillStream` stages complete expert segments without
splitting their token tiles, then restores the original pair order. Passing
this expert-composition check does not establish full-model prefill parity,
persistent caching, task quality or speed.

## Complete prefill and rotary reference

The fixed `prefill512-decode1-v1` profile checks one 512-token prompt pass and
one retained-state continuation through every layer and the complete vocabulary
head. Hashes cover every logical tensor byte. They preserve the head's original
batch shape and cannot be substituted with sampled rows or tolerances.

```sh
.venv/bin/python Tools/vq_model_prefill_reference.py --model <verified-vq-pack> \
  --inventory <inventory.json> --architecture <pinned-qwen4_exp.py> \
  --out <new-prefill-model-reference>
.build/release/slotstream quantization-model-check --prefill \
  --source-directory <verified-vq-pack> --source-inventory <inventory.json> \
  --fixture-directory <same-pack-prefill-model-reference> --output <new-result>
```

Run these sequentially under `quantization_logit_run.supervise`. The actual
13 GB reclaimable preflight, shared model lock, process ceiling and pressure
cancellation remain required. Native staging retains one dense block and at
most 32 expert records per batch. Its process peak is not a production pack's
resident-memory floor. The probe stops at the first mismatch and preserves its
trace. `--save-layer 2` on a fresh reference run supplies the authenticated input
for `Tools/vq_prefill_attention_reference.py`; that microscope independently
checks its expanded attention against the pinned whole call.

The candidate rotary constructor uses the exact FP32 coefficient words from
the pinned reference for its fixed dimension and base. Precise Metal power
matched the development Mac but produced different bits on CI. Pinning inverse
frequencies exposed separate CI sine/cosine differences. The research path now
embeds the exact finite FP32 table for its admitted positions. It reconstructs
the repeated rotary half without rounding and refuses positions outside the
authenticated table. Host-double trigonometry was rejected after a BF16
boundary mismatch. The public constructor keeps its deployed arithmetic.
The original power microscope and unchanged exact frequency/angle digests can
be reproduced with:

```sh
.venv/bin/python Tools/vq_rope_reference.py --architecture <pinned-qwen4_exp.py> \
  --runtime <pinned-model.py> --out <new-rotary-reference>
.build/release/slotstream quantization-check --kernels
python3 Tools/vq_prefill_manifest_gate.py --binary <source-bound-slotstream> \
  --source <verified-vq-pack> --inventory <inventory.json> \
  --fixture <same-pack-prefill-model-reference> --out <new-fault-results>
```

The complete prefill profile passes for both inspected packs. Production generation,
sparse selection at longer context, persistent residency, draft, vision and
complete-task speed/quality remain independent gates. These checks do not make
an alternative pack eligible for production loading or automatic selection.

## Greedy feedback reference

The frozen `greedy-v1.json` profile contains an owned literal chat prompt and
the original tokenizer identity. Each implementation samples its own argmax
and feeds that actual token into the next step. The last sampled token remains
unconsumed. Every complete state/output boundary is compared at each step.

```sh
.venv/bin/python Tools/vq_generated_reference.py --model <verified-vq-pack> \
  --inventory <inventory.json> --architecture <pinned-qwen4_exp.py> \
  --profile bench/quantization/greedy-v1.json \
  --out <new-greedy-reference>
.build/release/slotstream quantization-model-check --greedy \
  --generation-profile bench/quantization/greedy-v1.json \
  --source-directory <verified-vq-pack> --source-inventory <inventory.json> \
  --fixture-directory <same-pack-greedy-reference> --output <new-result>
python3 Tools/vq_generation_manifest_gate.py --binary <source-bound-slotstream> \
  --source <verified-vq-pack> --inventory <inventory.json> \
  --fixture <same-pack-greedy-reference> --profile bench/quantization/greedy-v1.json \
  --out <new-fault-results>
```

Run each model process sequentially under `quantization_logit_run.supervise`,
with the profile's preflight, memory and time bounds. Both packs match their
references for all sixteen tokens and all 2,560 boundaries. Both stop at the
length cap, so this fixture does not exercise a real sampled EOS termination.
Malformed profile, predecessor, stop and boundary metadata are separate refusal
gates. This diagnostic is not a production service, task-quality evaluation or
throughput qualification. Persistent residency, draft and vision remain open.

## Sparse-selection threshold

Use `--sparse` on both the complete-prefill producer and native diagnostic to
run the fixed `sparse2053-decode1-v1` profile. It reads four 512-token passes,
then five tokens, then one continuation token. The mask returned by each actual
sparse indexer call becomes an additional complete Boolean boundary.

```sh
.venv/bin/python Tools/vq_model_prefill_reference.py --sparse \
  --model <verified-vq-pack> --inventory <inventory.json> \
  --architecture <pinned-qwen4_exp.py> --out <new-sparse-reference>
.build/release/slotstream quantization-model-check --sparse \
  --source-directory <verified-vq-pack> --source-inventory <inventory.json> \
  --fixture-directory <same-pack-sparse-reference> --output <new-result>
python3 Tools/vq_prefill_manifest_gate.py --sparse --binary <source-bound-slotstream> \
  --source <verified-vq-pack> --inventory <inventory.json> \
  --fixture <same-pack-sparse-reference> --out <new-fault-results>
```

Keep the same sequential supervision and resource bounds. Both packs pass all
984 boundaries, including twenty-four sparse masks. This covers the threshold,
partial block and continued state, not the full context range. Public loading
and automatic selection still refuse these unqualified research packs.

## Synchronous resident-bank component

The existing `quantization-check --record-fixture-directory` command now also
checks owned resident-bank storage using the real expert fixtures. Each bank
holds complete records of one validated geometry, with separate codebooks.
It validates direct backing strides and non-overlapping extents, pins all
demanded hits before CLOCK eviction, publishes only complete records, and
finishes GPU uses before releasing pins.

Cold/hot and eviction outputs must match the independent reference bits.
Hot reads fail if the payload reader is called. Partial, duplicate, oversized,
wrong-index, cancelled and failed reads cannot publish a record. The tests
cover retry, reentrant-clear refusal and retained output across destructive
bank reuse. These are bounded synchronous component checks. Use `--allocation-classes` when generating new complete-record or segmented-
prefill fixtures. That mode binds actual descriptor-class representatives to
the inspected artifact. Historical VQ 4.4 fixtures used two layers from one
class; their old per-layer results do not cover both classes.

The complete-model probe supports `--resident-records` with `--greedy` or
`--sparse`. It allocates a fixed 96-row bank per descriptor class and keeps
layer codebooks once. Large prefill retains separate immutable staging. The
receipts include exact bank/book bytes, hit/load/eviction counts and pins.
Both packs preserve their complete reference boundaries with real cache hits
and CLOCK replacement. This remains a small synchronous research cache.
The sections below cover the larger-bank and resident-text experiments.
Asynchronous reads, resize, production byte budgeting and governor integration
remain open.


The finite table is independently reproduced and embedded with:

```sh
.venv/bin/python Tools/vq_rotary_table_reference.py \
  --architecture <pinned-qwen4_exp.py> --runtime <pinned-model.py> \
  --out <new-rotary-table-reference>
python3 Tools/vq_rotary_table_source.py \
  --table <new-rotary-table-reference>/angles-f32le.bin \
  --output <comparison-source.swift>
```

Compare the generated source against `Sources/Slotstream/VQRotaryTable.swift`.
The generator admits only the frozen complete payload hash. The table is a
bounded research coefficient artifact, not a qualification of longer contexts
or a production resource policy. Full-model parity and remote checks remain
independent of this generation step.


## Complete resident text probe

Add `--resident-text` to the greedy or sparse model check to retain all dense
text layers, the final head/mixer and token embedding. Combine it with
`--resident-records` to exercise the fixed expert banks too. The research
process bound is 10 GB, with the existing 13 GB real-headroom preflight.
Loading admits the exact text payload plus a bounded single-tensor copy,
checks incremental headroom and never publishes a partial resident owner.

Receipts expose text payload bytes, family counts and repeated-access counters
separately from expert banks, workspace and process footprint. Both inspected
packs preserve complete reference bits in this layout. This is a numerical
and memory probe, not an optimized production serving path or a speed result.
The default remains the earlier streamed-text probe and its smaller bound.


For the fixed larger-cache experiment, add `--wide-records` with both residency
flags. It gives the class used by most layers 512 rows and the other class 96.
The same process ceiling applies, so this mode does not authorize extra memory.
Per-family kernel admission and component tests cover the enlarged physical
row offsets. Compare receipt counters and measured peaks; this experiment does
not choose cache sizes automatically or establish generation throughput.

## Bounded generation timing pilot

Freeze a source-bound binary directory before using the timing harness:

```sh
.venv/bin/python Tools/vq_performance_pilot.py \
  --binary <frozen-build>/slotstream \
  --research-root <research-directory> --out <new-pilot-directory>
```

`performance-pilot-v1.json` fixes one literal original-tokenizer prompt, 128
greedy samples, two independent validation runs and three paired rounds in
alternating order. This profile uses complete resident text, fixed 512/96
expert banks and a 10 GB process bound. It is a cost pilot, with no draft,
vision, completed-task or broader-context qualification.

Validation disables intermediate state observers and compares sixteen complete
vocabulary arrays plus the autoregressive tokens with the independent frozen
reference. Measurement requires that receipt from the exact binary, Metal
library, profile and inventory. The measured path omits logit hashing too;
finite-value and resource guards still run. Ordinary full-state parity probes
retain their observers by default.

Each process authenticates all main-model files, loads text weights, and starts
the request with empty expert banks. Authentication and loading are reported
separately. This reads the files before timing, so it does not claim a cold SSD
cache. TTFT ends at the first committed sample. Decode rate uses only the
subsequent committed tokens and the matching inter-emission interval; EOS is
excluded from its numerator. Full request time and every interval are retained.

Nominal observed thermal state, disabled low-power mode, no request paging and
enough completed samples determine timing eligibility. Independent supervision
enforces process memory, OS pressure and time bounds. Review competing activity
before running and do not build, run another model or conduct a storage study
at the same time. Ineligible runs remain evidence and are never replaced with
better runs. The harness reports every run and paired medians only when all
measurement observations are eligible; it never promotes a pack or a speed
claim.

After a successful validation, exercise metadata and mode refusals with
`Tools/vq_performance_refusals.py --binary <frozen-build>/slotstream
--research-root <research-directory> --validation-receipt
<pilot>/validation-3.2/receipt.json --out <new-refusal-directory>`.
These cases require complete real metadata arguments and verify the expected
error before any model-output directory is created.

## Bounded parallel demanded reads

Add `--parallel-records` to `quantization-model-check` together with
`--resident-records --resident-text`, and optionally `--wide-records`.
This experimental option prepares immutable authenticated file plans on the
owner thread, then reads at most 32 demanded records on up to 12 CPU lanes.
Workers hold private data only. All workers drain before ordered publication;
no cache address or MLX object crosses into a worker. The reservation covers
retained records and one bounded read buffer per lane, capped at 128 MB.
The ordinary diagnostic remains serial. This does not add service cancellation,
prefetch, resizing or automatic memory selection.

Use the frozen comparison harness to measure the concurrency change alone:

```sh
.venv/bin/python Tools/vq_read_pair_pilot.py \
  --binary <frozen-build>/slotstream \
  --research-root <research-directory> --out <new-comparison-directory>
```

`read-pair-v1.json` binds the serial and parallel native profiles to the same
VQ 3.2 artifact and binary. Each mode must pass its own complete-logit prefix
validation. Three interleaved measurement pairs then require identical entire
generated sequences, preserve every receipt and use the same eligibility rules
as the generation pilot. The reader's lane count is one tested hypothesis,
not an automatic hardware policy. Current results and limits are recorded in
[the canonical measurement](../../db/records/measurements/quantization-screen-2026-10-02.md#bounded-parallel-demanded-reads-october-3).

## Code-object reuse comparison

The VQ projection implementation shares a bounded set of identical Metal code
objects. It keeps tensors, array contexts, routing and bank leases independent.
The adoption experiment uses two source-bound executables and one native profile:

```sh
.venv/bin/python Tools/vq_kernel_pair_pilot.py \
  --before <frozen-parallel-read-build>/slotstream \
  --after <frozen-kernel-cache-build>/slotstream \
  --research-root <research-directory> --out <new-comparison-directory>
```

`kernel-pair-v1.json` permits only the three source changes belonging to this
hypothesis, requires identical Metal-library bytes and binds every validation
receipt to its actual producer. The entire generated sequence must match in
all three interleaved pairs. Its engineering adoption threshold does not
qualify a product pack, task quality or the target speed. See the canonical
measurement for the result and its limits.

## Smaller-pack research profile

The VQ 2.1 bundle contains a different upstream runtime. Preserve that file.
Reference tools require an explicit `--runtime` pointing to the already
reviewed 3.2/4.4 source bytes; arbitrary execution source is refused. Receipts
bind both the bundled hash and the executed hash. The same identities are
rechecked before completion and validated by the native diagnostic readers.
Historical larger-pack goldens remain usable unchanged.

The complete-record and segmented-prefill reference producers require
`--allocation-classes` for VQ 2.1. This covers representative layers 0, 2 and
27. Compact native banks retain 96 records per class. The fixed wide experiment
uses 512 records for the most common inspected class and 96 for the others,
with the same 1.8 GB bank-plus-book reservation bound. This is a research
configuration, not a production memory range or automatic policy.

The research downloader authenticates immutable original files before the
reference can load them. The canonical measurement separately tracks payload,
normalization, traversal, full-model parity and measured memory. Downloaded
bytes, accepted metadata or a passing component do not qualify task quality,
throughput, production loading or Auto selection.

Exercise the actual native execution-profile refusals using existing larger-pack
fixtures (only metadata is copied):

```sh
.venv/bin/python Tools/vq_execution_refusals.py \
  --binary <frozen-build>/slotstream \
  --records <three-point-two-allocation-class-fixtures> \
  --greedy <three-point-two-greedy-fixtures> \
  --sparse <three-point-two-sparse-fixtures> \
  --model <three-point-two-short-model-fixtures> \
  --profile bench/quantization/greedy-v1.json --out <new-refusal-directory>
```

Each case must fail at its execution or coverage boundary before a weight path
can be opened or a result directory created. These intentionally malformed
metadata fixtures are never usable numerical references.

## Bounded allocator reuse comparison

`Tools/vq_allocator_pair_pilot.py` uses the same two-binary arguments as the
code-object comparison above. Its own frozen `allocator-pair-v1.json` permits
only `VQModelProbe.swift` to differ and bounds total campaign time. It checks
independent complete-logit validation before the alternating measurements.
The resident research path retains only already bounded unused allocator
storage across layers. Its adoption gate is separate from product qualification.

## Independent draft inventory

Inspect the pinned draft without loading model tensors:

```sh
python3 Tools/vq_draft_inventory.py --help
```

The inventory validates the sidecar's own recipe and tensor ledger. Use its
explicit payload-verification option when full-file authentication is required;
header-only output declares that the payload remains unverified. Neither mode
establishes compatibility with the native MTP adapter or qualifies execution.

## Dense four-bit composite pilot

`Tools/vq_dense_overlay_reference.py` defines a separate research candidate:
the pinned VQ 3.2 experts and PLE tables with selected dense tensor triples
from the installed same-checkpoint affine pack. Its composite digest binds
both parent identities, the exact replacement map and every header geometry.
Each source shard used is fully authenticated before loading. Unmatched
tensors and the explicit VQ norm adapter remain unchanged.

The producer first requires a direct-versus-streamed four-layer proof over
exactly 513 tokens. Full-model pilot forwards then require that exact proof,
instrument and composite. Original VQ fixtures cannot serve as composite
parity evidence. The separate comparator verifies preserved controls against
their original producer receipts and frozen hashes, while checking its own
output-copy storage budget. It does not weaken the ordinary pack comparator.

Use each tool's `--help` for required paths. Run these tools only under a
written local resource ledger and the process supervisor; they provide no
download activation, automatic selection or quality verdict.


### Native composite checks

`vq_dense_overlay_generated_reference.py` produces the independent greedy
fixture. `vq_dense_overlay_prefill_reference.py` produces either ordinary
prefill or, with `--sparse`, sparse selection and continuation. Both require
the verified parent, installed affine baseline and successful composite
traversal proof. Their `vq_parent` field deliberately differs from ordinary
VQ manifests so an old reader cannot mistake this artifact for its parent.

Write the reference receipt's `composite` object with Python
`json.dumps(value, indent=2) + "\n"` to a new manifest file. The native
adapter requires its frozen raw SHA-256
`4cdae0e9c26b9a0dd07659cd9d71dd025ed110b49161c152df09d5a7f75ac28b`
and canonical composite identity. It then independently authenticates the
source files; matching metadata alone is insufficient.

Add both `--dense-overlay-baseline <installed-affine-directory>` and
`--dense-overlay-manifest <composite.json>` to `quantization-model-check`
with `--greedy`, `--prefill` or `--sparse`, using the corresponding composite
fixture. Greedy still requires `--generation-profile`. Resident-text and
record flags remain explicit research controls. Ordinary VQ commands refuse
composite fixtures, and composite commands refuse ordinary parent fixtures.

`vq_dense_overlay_cost_pilot.py` freezes one cross-artifact comparison through
`dense-overlay-cost-v1.json`. Each arm must reproduce its own independent
full-logit reference before timing and its own complete sequence across
repetitions. It keeps the same bank allocation in both arms and does not
spend the recovered memory on extra cache records. Generated routing traces
may differ, so the result measures the candidate as a whole. Different
quantizations are not required to produce identical answers. The
ordinary same-artifact comparison retains its equality gate. None of these
commands admits the composite to Engine.load, serving or Auto.

### Dense savings and fixed expert capacity

The explicit research flag `--reinvest-dense-savings` requires the authenticated
composite, both residency flags, `--wide-records`, `--parallel-records`, and a
greedy or sparse fixture. It admits 1536 main-class and 288 secondary records
inside the same 10 GB process bound. Ordinary limits stay unchanged. Greedy
parity proves the full physical row range; sparse parity tests the larger state
footprint without pretending that its route set fills every slot.

`dense-reinvestment-cost-v1.json` and `Tools/vq_dense_reinvestment_pilot.py`
compare this profile against the composite's existing 512/96 profile on the
same frozen binary. The driver requires completed greedy/sparse receipts from
that producer, separate full-logit validations and identical complete generated
sequences across both arms. The three-pair result was slower with the larger
cache despite fewer record loads. This is a numerical research mode, not a new
cache default. See the canonical quantization measurement for raw evidence and
scope; it does not qualify automatic resizing or the 20-token target.

### Expert-containing shard read policy

`quantization-model-check --uncached-expert-reads` is a research option for
`--reinvest-dense-savings` on the exact dense-four-bit composite. It applies
checked `F_NOCACHE=1` and `F_RDAHEAD=0` calls after complete-file authentication
and before publishing each of the nine owned descriptors that contains routed
experts. Those shards also contain dense tensors, so the policy covers whole
shards. Ordinary readers remain buffered. There is no OS cache purge or claim
that a request starts from cold SSD.

`uncached-expert-cost-v1.json` freezes the policy arm at the same 1536/288 bank
capacities and ten-GB process ceiling as `dense-reinvestment-cost-v1.json`.
`Tools/vq_uncached_expert_pilot.py` requires greedy and sparse numerical gates
from the timed producer, validates full logits for both arms, and compares
three alternating pairs with exactly matching complete generated sequences.
The receipt records the policy and descriptor count. All attempts are retained;
no retry or qualification follows automatically. A winner here would still
need complete-task, context, feature and hardware qualification.

The first read-policy cost attempt stopped before measurement, with both
validations thermally ineligible. The separately frozen stable-admission run
completed all six eligible timings with matching complete sequences. Buffered
reads had better committed decode and total request time; retain that default.
The raw attempts and exact metrics are in the canonical quantization measurement
record. This conclusion applies to the fixed composite and larger cache profile.

Build a source-bound native conditions observer with
`python3 Tools/vq_pilot_admission.py --out <new-observer-directory>` and pass
that directory as `--admission-observer` to the read-policy pilot. Before each
cell it requires thirty seconds of sampled nominal thermal state, low-power
mode off and both VM observers above the existing admission floor. Each idle
wait is bounded to ten minutes. Any bad observation resets stability; an expired
wait fails the campaign. Native guards and in-request timing exclusions still
apply. The observer's engine source must match the timed binary's source receipt.

### Lossless contiguous expert records

`Tools/vq_record_repack.py` creates a new research directory containing one
aligned expert-record file per layer. It preserves the six original codes and
scales pieces, verifies every reconstructed source-tensor hash and zero-padding
region, and publishes the completion manifest only after verification and synced
writes. Original codebooks, dense weights, PLE and draft data remain in their
pinned parent files. This is a bounded conversion experiment, not an installer.

`quantization-model-check --packed-record-directory <directory>` admits only
the exact verified export manifest and every pinned payload hash. It requires
the dense composite, reinvested banks, parallel records and buffered reads.
The owned reader prices one aligned record buffer per active read lane in
addition to the complete returned pieces. Ordinary tensor reads keep their
existing limit. Workers drain before bank publication and retain cancellation,
exact-range and file-mutation checks. Large immutable prefill still uses the
original sweep storage.

`contiguous-record-cost-v1.json` and `Tools/vq_contiguous_expert_pilot.py`
compare split ranges against contiguous records with the same model values,
1536/288 banks and process ceiling. Supply the frozen binary, parent research
directory, baseline, composite manifest, packed-record directory, completed
four-cell greedy/sparse gate directory and source-bound admission observer.
Use the tool's `--help` for the required paths. Both full-logit validations
must pass before the three alternating timing pairs; all complete generated
sequences must match. The additional derived-file authentication is included
in loading time. No request is described as starting from cold SSD, and this
storage comparison cannot qualify a new model, Auto policy or download pack.

Authentication order also conditions the uncontrolled OS file cache. The
contiguous research arm reads its derived files after both parent filesets;
the control has no final derived-file pass. A timing difference therefore
measures these complete research load/request paths and cannot establish a
syscall-only speedup or predict the startup and cache behavior of a future
standalone pack. Any deployment claim requires that pack's own measurements.

The first complete paired layout campaign passes both numerical validations
and every timing eligibility gate, with identical complete sequences. It
improves committed generation and total request time in this research profile,
while increasing load time. Exact results and the cache-conditioning limit
are recorded in the canonical quantization measurement. Continue controlled
research with this representation; it remains below the performance target
and does not change product defaults or qualify a distributable pack.

### Original four-bit draft on composite inputs

`Tools/vq_composite_draft_reference.py` authenticates a complete main-model
prefill and requires every previously frozen boundary to match before using
its real embeddings and hidden states as independent draft inputs. It releases
the main model before loading the original four-bit head with separate metadata.
It preserves existing golden files and writes a new bounded BF16 fixture.

`slotstream quantization-draft-check --baseline <original-model-directory>
--fixture <comparison.safetensors> --output <new-directory>
--reference-arithmetic` compares that fixed fixture through the authenticated
research loader. The explicit arithmetic profile uses the already checked
Python-compatible grouped normalization, unary operations and finite rotary
table. Original public draft construction keeps its deployed arithmetic.
The loader verifies the entire sidecar through owned descriptors, prices its
payload and current load copy separately, checks real headroom and honors the
shared model-process lock. It never inherits the VQ trunk's quantization recipe.

The initial deployed-arithmetic prefill failed the unchanged parity tolerance;
that failure and the later exact component comparison are both retained in
the canonical measurement. Matching the head does not qualify speculation:
main-state snapshots, batched verification, rejection rollback, EOS/cancellation,
complete committed sequences and paired cost remain independent requirements.
The command enables no serving, Auto selection or installed-pack replacement.

`Tools/mtp_process_guard_gate.py` is a weights-free static regression that holds
the real exclusion lock and requires both standalone and research draft
entrypoints to refuse before loading. `Tools/vq_draft_admission_gate.py` adds
actual pinned-fixture/configuration/sidecar refusal checks for a research build;
it requires explicit binary, baseline, fixture and new output paths.

## Affine candidate Engine and memory checks

`slotstream affine-engine-check` exercises the authenticated expert control
through the ordinary Engine, request controller, governor and loopback HTTP
handler. It requires existing pinned artifacts and a new output directory:

```sh
slotstream affine-engine-check \
  --baseline "$BASELINE" --control "$CONTROL" --table "$ROTARY" \
  --generation-profile bench/quantization/greedy-v1.json \
  --output "$NEW_OUTPUT"
```

Repeat with `--draft` and a different output directory to exercise the
independently authenticated original head. The command enforces its physical
memory and headroom bounds. Its conservative planning allowance is separate
from the smaller physical watchdog; the receipt preserves both. The
weights-free `pack-memory` catalogue check covers profile geometry, capacity
solving, context/feature refusals and unknown throughput estimates.

The adapter keeps tokenizer and prefix identities bound to the authenticated
artifact. It checks actual memory/disk reuse, cancellation, live donation and
recovery, resizing, HTTP generation and wrong-artifact refusal. Candidate
images and streamed draft experts remain unsupported. This package-only path
does not add a pack to the supported registry or alter installed weights.

`quantization-task-run --draft-depth` can also select the original baseline's
draft configuration. Its receipt records the resolved plan and expert
placement. Complete-configuration comparisons must retain this baseline
optimization and distinguish a shared physical watchdog from equal user
memory ceilings. Calibration receipts never qualify Auto selection or a
speed promise. See the [current plan and evidence](../../db/records/plan/same-model-quantization-and-automatic-memory-2026-10-02.md).
