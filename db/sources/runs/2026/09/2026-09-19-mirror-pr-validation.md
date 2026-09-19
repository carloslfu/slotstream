---
type: run
id: 01m2x544mnjvqffjzrgz5kk3dm
created: 2026-09-19T15:38:56.021915046+00:00
updated: 2026-09-19T15:39:24.727012654+00:00
summary: Rebased mirror PR native gates and output parity
binary: slotstream 0dec469 SHA-256 608c0676ab0eb16103bd2048a4bf4142bd32dcda5de45abaab654815207dd0bc; full static gates at fb9fe26
captured_at: 2026-09-19
command: make build; slotstream-checks --tier t0 --tier t1; static, brain and sampler gates; single/mirror smoke script recorded in body
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Rebased mirror PR native gates and output parity
tool: make, slotstream-checks, repository gates, slotstream run
---
# Rebased mirror-read validation

Correctness smoke and repository gates, not a paired performance study. Machine: the recorded Mac mini M4 32 GB with the original two checkpoint copies. Upstream base: `2872820a3e96ce2dfdf65c49405e1e75fc640dc2`.

The full native static gates passed at `fb9fe2631f1c98a02810a0c244518096682ca299`, including 319 memory-override cases and installer gates. The final code commit `0dec46927544b6ce57f0510e3b9f170573deadc7` adds the packed-layout/mirror rejection and documentation clarifications. It was rebuilt and passed T0/T1 (70 checks, 31,275 assertions), brain gates, sampler/governor (17 checks), and the model smoke below. Full static gates were not repeated after that small follow-up.

Final executable SHA-256: `608c0676ab0eb16103bd2048a4bf4142bd32dcda5de45abaab654815207dd0bc`.

The smoke uses one prompt, 24 greedy tokens, MTP off, a 10 GB budget, and sequential single/mirror runs. Text and token IDs matched; both replica byte counters were positive. Timing in the raw artifacts is incidental, not evidence of a reproducible speedup. This does not qualify MTP, long-context behavior, serving, more than two disks, full model acceptance, coverage, or the separate public-consumer build.

Setup issues resolved before the successful smoke: an inherited build cache had absolute-path PCH references and required a clean architecture build; detached remote execution lost external-volume access, so validation used a live SSH session; the sampler needed an existing NumPy environment; macOS Bash 3 rejects an empty array under `set -u`, so the temporary smoke script uses `set -eo pipefail`. None of these failures was counted as a pass. The original experimental worktree stayed clean at `ac84d7508f9a060f0bdcbb81df911701f3b3b9c2`.

## Commands

```bash
make build SLOTSTREAM_BUILD_JOBS=4
.build/release/slotstream-checks --tier t0 --tier t1
Tools/static_gates.sh # fb9fe26, with dbmd 0.13.4 on PATH
Tools/brain_gates.sh # final code
PYTHON=/Users/qian/mlx-emb-venv/bin/python Tools/sampler_gates.sh
```

## Smoke script

```bash
#!/bin/bash
set -eo pipefail
cd /Volumes/llm/src/slotstream-mirror-pr
BIN=.build/release/slotstream
EXT=/Volumes/llm/models/qwen38-flash-next-mlx-4bit
INT=/Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit
OUT=$(mktemp -d /tmp/slotstream-mirror-smoke.XXXXXX)
printf '%s\n' "$OUT" > /tmp/slotstream-mirror-smoke-path
if pgrep -x slotstream >/dev/null; then echo 'Refusing to overlap an existing model process'; exit 1; fi
vm_stat
"$BIN" doctor --memory-gb 10 --mtp off --vision off --max-context 1024
# Refuse malformed mirrors at metadata validation, before any model loads.
if "$BIN" run --model "$EXT" --mirror "$OUT/no-mirror" --memory-gb 10 --mtp off --vision off --max-context 1024 --max-tokens 1 --prompt hi > "$OUT/reject.txt" 2> "$OUT/reject.log"; then
 echo 'FAIL missing mirror was accepted'; exit 1
fi
grep -q 'mirror .* cannot serve' "$OUT/reject.log"
echo 'PASS missing mirror refused before model loading'
if SLOTSTREAM_EXPERT_LAYOUT="$OUT/no-packed" "$BIN" run --model "$EXT" --mirror "$INT" --memory-gb 10 --mtp off --vision off --max-context 1024 --max-tokens 1 --prompt hi > "$OUT/packed.txt" 2> "$OUT/packed.log"; then
 echo 'FAIL packed layout accepted mirrors'; exit 1
fi
grep -q 'packed expert layouts cannot be combined with checkpoint mirrors' "$OUT/packed.log"
echo 'PASS packed layout with mirrors refused before model loading'
for arm in single mirror; do
 extra=()
 if [ "$arm" = mirror ]; then extra=(--mirror "$INT"); fi
 "$BIN" run --model "$EXT" "${extra[@]}" --memory-gb 10 --mtp off --vision off --max-context 1024 --max-tokens 24 --greedy --seed 1 --prompt 'Explain why the sky is blue in two sentences.' --stats-json "$OUT/$arm.json" > "$OUT/$arm.txt" 2> "$OUT/$arm.log"
done
cmp "$OUT/single.txt" "$OUT/mirror.txt"
python3 - "$OUT" <<'PY'
import json,sys,pathlib
p=pathlib.Path(sys.argv[1])
a=json.loads((p/'single.json').read_text());b=json.loads((p/'mirror.json').read_text())
assert a['output_ids']==b['output_ids']
print('PASS single/mirror output token IDs and text are identical')
s=b['stats']
assert len(s['mirrorBytes'])==2 and all(x>0 for x in s['mirrorBytes'])
print('PASS both replica counters positive:',s['mirrorBytes'])
PY
shasum -a 256 "$BIN"
git rev-parse HEAD
echo MIRROR_SMOKE_PASS
```

## Gate output excerpts

```text
From slotstream-pr-native.log:
Build complete! (277.73s)
70 passed, 0 failed, 0 skipped (31275 assertions)
BRAIN GATES PASS
planner: passed 90, failed 0
  "cases": 319,
INSTALLER GATES PASS
STATIC GATES PASS
From slotstream-pr-final.log:
Build complete! (79.83s)
70 passed, 0 failed, 0 skipped (31275 assertions)
BRAIN GATES PASS
sampler + governor: passed 17, failed 0
```

## Successful smoke output

```text
Mach Virtual Memory Statistics: (page size of 16384 bytes)
Pages free:                              670568.
Pages active:                            549244.
Pages inactive:                          435542.
Pages speculative:                       236983.
Pages throttled:                              0.
Pages wired down:                        128556.
Pages purgeable:                          15371.
"Translation faults":                 316284075.
Pages copy-on-write:                   16815519.
Pages zero filled:                    984246115.
Pages reactivated:                     75958017.
Pages purged:                           1234863.
File-backed pages:                       995044.
Anonymous pages:                         226725.
Pages stored in compressor:              148384.
Pages occupied by compressor:             41579.
Decompressions:                        29646417.
Compressions:                          40647999.
Pageins:                              614952784.
Pageouts:                                 64859.
Swapins:                                 163556.
Swapouts:                                518716.
device: applegpu_g16g  |  34 GB RAM (31.4 GB reclaimable now), 30.1 GB Metal working set
model:  48 layers x 512 experts x 2.76 MB (24576 records = 67.9 GB streamed from SSD)
weights: present by size, 105.3 GB at /Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit (run pull --verify for hashes)

slotstream memory plan (--memory-gb)
  device: 34 GB RAM (31.4 GB reclaimable now), 30.1 GB Metal working set
  target: 10.0 GB total process budget, not a RAM usage goal
  cache:  ~23 of 512 experts per layer  (1084 global slots = 3.0 GB pool)
  plan:   ~9.0 GB full-workload envelope, ~5 tok/s warm decode (est. from M5 Pro anchors)
  memory: 3.0 GB expert cache at load; 6.0 GB allowed for runtime, context and workspace; 1.0 GB budget headroom. Short requests can use less.
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 1024 tokens per request (prompt + reply); a full-length prompt takes ~12 s before its first token here, follow-up turns read only what is new
  reuse:  up to 1024 tokens across 4 conversations (~0.4 GB), so a follow-up turn re-prefills only what is new
memory-feasible window: 70656 tokens; separate from the 30.0-minute request-to-first-token policy

knobs (first one given wins; with none, auto is the default):
  --memory-gb G           easiest: total memory the process may use
  --experts-per-layer N   precise: cache N of 512 per layer (pool = N x 0.133 GB)
  --pool-gb G             raw pool size (1 GB = 7.5 experts/layer)
min ~13/layer = 8.1 GB total. The pool is one global cache shared across
all layers -- per-layer is the unit of intuition (a token activates 10
of its 512 per layer), not a quota: hot layers borrow slots from cold.

what a memory target buys (conservative warm-decode estimate from
measured M5 Pro anchors: 30/layer = 6.0, 150/layer = 11.6; the last
column is the wait before the first token of a prompt filling the
whole context, follow-up turns read only what is new):
  target     experts/layer  est. warm decode   pass    full 1024-token prompt
     8.1 GB         13/512      ~ 3 tok/s     256   ~12 s
    10.0 GB         23/512      ~ 5 tok/s     256   ~12 s
    12.0 GB         35/512      ~ 6 tok/s     512   ~8 s
    16.0 GB         60/512      ~ 8 tok/s    1024   ~6 s
    24.0 GB        111/512      ~10 tok/s    2048   ~5 s
    28.0 GB        141/512      ~11 tok/s    2048   ~5 s
    36.0 GB        181/512      ~12 tok/s    4096   ~5 s
    48.0 GB        271/512      ~12 tok/s    4096   ~5 s
    73.0 GB        460/512      ~12 tok/s    4096   ~5 s

time to first token at this plan, by prompt length (the pass shrinks past ~4k
tokens so its transient memory stays inside what was measured):
  1k ~12 s (the cap)
  context state is ~27 KiB per token, up to the model's 262144-token limit.
  `slotstream context-check --tokens N` reads an N-token synthetic prompt on this Mac and
  stops early if reclaimable memory falls below its floor or its time limit passes.
PASS missing mirror refused before model loading
PASS packed layout with mirrors refused before model loading
PASS single/mirror output token IDs and text are identical
PASS both replica counters positive: [18355054140, 9165891940]
608c0676ab0eb16103bd2048a4bf4142bd32dcda5de45abaab654815207dd0bc  .build/release/slotstream
0dec46927544b6ce57f0510e3b9f170573deadc7
MIRROR_SMOKE_PASS
```

## reject.log

```text
slotstream memory plan (--memory-gb)
  device: 34 GB RAM (31.4 GB reclaimable now), 30.1 GB Metal working set
  target: 10.0 GB total process budget, not a RAM usage goal
  cache:  ~23 of 512 experts per layer  (1084 global slots = 3.0 GB pool)
  plan:   ~9.0 GB full-workload envelope, ~5 tok/s warm decode (est. from M5 Pro anchors)
  memory: 3.0 GB expert cache at load; 6.0 GB allowed for runtime, context and workspace; 1.0 GB budget headroom. Short requests can use less.
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 1024 tokens per request (prompt + reply); a full-length prompt takes ~12 s before its first token here, follow-up turns read only what is new
  reuse:  up to 1024 tokens across 4 conversations (~0.4 GB), so a follow-up turn re-prefills only what is new
Error: mirror /tmp/slotstream-mirror-smoke.6yvpJh/no-mirror cannot serve model-00001.safetensors: Error Domain=NSCocoaErrorDomain Code=4 "The file “model-00001.safetensors” doesn’t exist." UserInfo={NSFilePath=/tmp/slotstream-mirror-smoke.6yvpJh/no-mirror/model-00001.safetensors, NSUnderlyingError=0x60000149d9b0 {Error Domain=NSPOSIXErrorDomain Code=2 "No such file or directory"}} — a mirror must hold the same shards as --model

```

## packed.log

```text
slotstream memory plan (--memory-gb)
  device: 34 GB RAM (31.4 GB reclaimable now), 30.1 GB Metal working set
  target: 10.0 GB total process budget, not a RAM usage goal
  cache:  ~23 of 512 experts per layer  (1084 global slots = 3.0 GB pool)
  plan:   ~9.0 GB full-workload envelope, ~5 tok/s warm decode (est. from M5 Pro anchors)
  memory: 3.0 GB expert cache at load; 6.0 GB allowed for runtime, context and workspace; 1.0 GB budget headroom. Short requests can use less.
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 1024 tokens per request (prompt + reply); a full-length prompt takes ~12 s before its first token here, follow-up turns read only what is new
  reuse:  up to 1024 tokens across 4 conversations (~0.4 GB), so a follow-up turn re-prefills only what is new
Error: packed expert layouts cannot be combined with checkpoint mirrors

```

## single.log

```text
slotstream memory plan (--memory-gb)
  device: 34 GB RAM (31.4 GB reclaimable now), 30.1 GB Metal working set
  target: 10.0 GB total process budget, not a RAM usage goal
  cache:  ~23 of 512 experts per layer  (1084 global slots = 3.0 GB pool)
  plan:   ~9.0 GB full-workload envelope, ~5 tok/s warm decode (est. from M5 Pro anchors)
  memory: 3.0 GB expert cache at load; 6.0 GB allowed for runtime, context and workspace; 1.0 GB budget headroom. Short requests can use less.
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 1024 tokens per request (prompt + reply); a full-length prompt takes ~12 s before its first token here, follow-up turns read only what is new
  reuse:  up to 1024 tokens across 4 conversations (~0.4 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~23/512 per layer (1084 global slots = 3.0 GB), eos [248044, 248046]
prompt tokens: 23 (~0 s to the first token at this plan)

-- prefill 23 tok in 5.55s (4.1 tok/s)
-- prefill split: io 3.64s + scatter 0.00s | 4231 records (11.7 GB, 3.2 GB/s)
-- decode 24 tok in 9.00s (2.67 tok/s)
-- decode split: io 5.18s + scatter 0.02s | 5723 records
-- expert cache ~23/512 experts per layer, hit rate 0.482 | ngram rows 0h/368m | lifetime footprint peak 6.184 GB, current footprint 5.898 GB | total 14.6s

```

## mirror.log

```text
slotstream memory plan (--memory-gb)
  device: 34 GB RAM (31.4 GB reclaimable now), 30.1 GB Metal working set
  target: 10.0 GB total process budget, not a RAM usage goal
  cache:  ~23 of 512 experts per layer  (1084 global slots = 3.0 GB pool)
  plan:   ~9.0 GB full-workload envelope, ~5 tok/s warm decode (est. from M5 Pro anchors)
  memory: 3.0 GB expert cache at load; 6.0 GB allowed for runtime, context and workspace; 1.0 GB budget headroom. Short requests can use less.
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 1024 tokens per request (prompt + reply); a full-length prompt takes ~12 s before its first token here, follow-up turns read only what is new
  reuse:  up to 1024 tokens across 4 conversations (~0.4 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~23/512 per layer (1084 global slots = 3.0 GB), eos [248044, 248046]
prompt tokens: 23 (~0 s to the first token at this plan)

-- prefill 23 tok in 3.57s (6.4 tok/s)
-- prefill split: io 2.47s + scatter 0.00s | 4231 records (11.7 GB, 4.7 GB/s)
-- decode 24 tok in 7.26s (3.31 tok/s)
-- decode split: io 3.75s + scatter 0.02s | 5723 records
-- mirror split: --model 18.36 GB (66.7%), --mirror #1 9.17 GB (33.3%) over the whole run
-- expert cache ~23/512 experts per layer, hit rate 0.482 | ngram rows 0h/368m | lifetime footprint peak 6.191 GB, current footprint 5.907 GB | total 10.8s

```

## single.txt

```text
The sky appears blue because of a phenomenon called Rayleigh scattering, where gas molecules in the atmosphere scatter shorter wavelengths of sunlight

```

## mirror.txt

```text
The sky appears blue because of a phenomenon called Rayleigh scattering, where gas molecules in the atmosphere scatter shorter wavelengths of sunlight

```

## single.json

```json
{"effective_expected_peak_gb":8.9978933760000004,"effective_mtp":false,"effective_pool_slots":1084,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.010711958000000001,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":15.371900667,"load_seconds":0.80452337500000004,"optimizations":{"adaptiveSpeculation":false,"alignedPrefixResume":true,"automaticReadScope":true,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":true,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":false,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"verifySplitAttention":true,"visionAttentionPadding":0,"visionQueryTile":256,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[760,12515,7701,6105,1521,314,264,24057,2512,12870,60845,69377,11,1332,6605,33470,303,279,16078,43000,22602,89661,314,37728],"plan":{"availability_clamped":false,"context_qualification":false,"decode_estimate_cache_in_measured_range":true,"decode_lookahead":false,"device_available_gb":31.399999999999999,"device_ram_gb":34.399999999999999,"device_working_set_gb":30.100000000000001,"est_prefill_s_at_max_context":12.047058823529412,"est_prefill_tok_s":85,"est_warm_tok_s":4.5166666666666666,"expected_peak_gb":9,"expected_peak_semantics":"planned_full_workload_envelope_not_measured_usage","experts_per_layer_cached":23,"fully_resident":false,"implementation_context_limit":262144,"lookahead_reserve_bytes":0,"max_context_tokens":1024,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":28311552,"additional_active_bytes":0,"expected_peak_bytes":8997893376,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"lookahead_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2997043200,"prefill_bytes":332800000,"retained_capacity_bytes":28311552,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"memory_target_semantics":"process_budget_not_allocation_goal","model_context_limit":262144,"mtp":false,"mtp_context_limit":262144,"non_cache_allowance_bytes":6000850176,"planned_headroom_gb":1,"pool_gb":3,"pool_slots":1084,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":1024,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":false,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,814,20139,3069,279,12515,369,6105,303,1330,22157,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"24","seed":"1"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"alignedResumeRefusals":0,"allocatedSequenceBytes":28311552,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":23,"decodeIOSeconds":5.1845832220000032,"decodeLocalVictims":0,"decodeModelTokens":23,"decodeReadBytes":15822950400,"decodeRecords":5723,"decodeScatterSeconds":0.017307820000000005,"decodeSeconds":9.0045889999999993,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":1084,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":24,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":53280,"embeddingCachedRows":37,"embeddingRowHits":5,"embeddingRowMisses":37,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.4816123188405797,"finishReason":"length","firstTextSeconds":5.5524797909999997,"firstTokenSeconds":5.5523137079999998,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":0,"imageEncodeSeconds":8.3000000000000002e-08,"interTokenSeconds":[0.63314058299999998,0.50027329200000004,0.41004233400000001,0.33514312499999999,0.40083954100000002,0.320962792,0.34255566700000001,0.356486833,0.32926570799999999,0.49337825000000002,0.41035358300000002,0.32948191700000001,0.51988412500000003,0.41942933300000002,0.41925499999999999,0.28393741700000003,0.365380125,0.37159249999999999,0.32113658299999998,0.36010708400000002,0.37159204200000001,0.30259883300000001,0.40695579199999998],"lifetimePhysicalFootprintPeakBytes":6184078360,"lifetimeRSSPeakBytes":3342614528,"memoryPressureCancelled":false,"mirrorBytes":[],"mlxActiveEndBytes":5719171872,"mlxCacheEndBytes":37302908,"mlxPeakMemoryGB":6.0633500199999997,"ngramCachedRows":736,"ngramCachePayloadBytes":235520,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.020946711000000003,"ngramRowHits":0,"ngramRowMisses":368,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":6.18407836,"physicalFootprintEndBytes":5897751744,"prefillComputeKeyExtents":[23],"prefillComputePasses":[23],"prefillComputeQueryRows":[23],"prefillGPUWaitSeconds":0,"prefillIOSeconds":3.6400297520000002,"prefillLocalVictims":0,"prefillMLXActiveBytes":5717309104,"prefillMLXCacheBytes":33605020,"prefillPasses":[23],"prefillPhysicalFootprintBytes":5889231992,"prefillReadBytes":11697868800,"prefillRecords":4231,"prefillRowSortSeconds":0,"prefillScatterSeconds":0.003547502000000001,"prefillSeconds":5.5514279589999997,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":23,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":0.010731124999999999,"promptTokens":23,"queueSeconds":3.8750000000000002e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":14.567000709,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":24,"ropeTableHits":264,"sampleSeconds":0.009039998999999998,"sharedExpertPrelaunches":0,"sharedPrefixBoundaries":[],"sharedPrefixCommon":0,"sharedPrefixErrors":0,"sharedPrefixRefusals":0,"sharedPrefixStores":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.0011197880000000003,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"The sky appears blue because of a phenomenon called Rayleigh scattering, where gas molecules in the atmosphere scatter shorter wavelengths of sunlight"}
```

## mirror.json

```json
{"effective_expected_peak_gb":8.9978933760000004,"effective_mtp":false,"effective_pool_slots":1084,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.010793957999999999,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":11.667230167,"load_seconds":0.82670712499999999,"optimizations":{"adaptiveSpeculation":false,"alignedPrefixResume":true,"automaticReadScope":true,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":true,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":false,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"verifySplitAttention":true,"visionAttentionPadding":0,"visionQueryTile":256,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[760,12515,7701,6105,1521,314,264,24057,2512,12870,60845,69377,11,1332,6605,33470,303,279,16078,43000,22602,89661,314,37728],"plan":{"availability_clamped":false,"context_qualification":false,"decode_estimate_cache_in_measured_range":true,"decode_lookahead":false,"device_available_gb":31.399999999999999,"device_ram_gb":34.399999999999999,"device_working_set_gb":30.100000000000001,"est_prefill_s_at_max_context":12.047058823529412,"est_prefill_tok_s":85,"est_warm_tok_s":4.5166666666666666,"expected_peak_gb":9,"expected_peak_semantics":"planned_full_workload_envelope_not_measured_usage","experts_per_layer_cached":23,"fully_resident":false,"implementation_context_limit":262144,"lookahead_reserve_bytes":0,"max_context_tokens":1024,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":28311552,"additional_active_bytes":0,"expected_peak_bytes":8997893376,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"lookahead_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2997043200,"prefill_bytes":332800000,"retained_capacity_bytes":28311552,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"memory_target_semantics":"process_budget_not_allocation_goal","model_context_limit":262144,"mtp":false,"mtp_context_limit":262144,"non_cache_allowance_bytes":6000850176,"planned_headroom_gb":1,"pool_gb":3,"pool_slots":1084,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":1024,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":false,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,814,20139,3069,279,12515,369,6105,303,1330,22157,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"24","seed":"1"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"alignedResumeRefusals":0,"allocatedSequenceBytes":28311552,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":23,"decodeIOSeconds":3.7450621010000029,"decodeLocalVictims":0,"decodeModelTokens":23,"decodeReadBytes":15822950400,"decodeRecords":5723,"decodeScatterSeconds":0.018272168999999994,"decodeSeconds":7.2592975830000004,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":1084,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":24,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":53280,"embeddingCachedRows":37,"embeddingRowHits":5,"embeddingRowMisses":37,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.4816123188405797,"finishReason":"length","firstTextSeconds":3.5705084170000001,"firstTokenSeconds":3.5704180000000001,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":0,"imageEncodeSeconds":1.2499999999999999e-07,"interTokenSeconds":[0.43803579199999998,0.38950695899999999,0.32680291700000003,0.27751070900000002,0.32334745799999998,0.26830508400000003,0.27836787499999999,0.29363499999999998,0.272287,0.39105237500000001,0.33136666599999998,0.27508474999999999,0.41073591700000001,0.33790570800000003,0.33334112500000002,0.24468379100000001,0.30286774999999999,0.302147416,0.26960029200000002,0.296016167,0.30984420800000001,0.25924724999999998,0.327098208],"lifetimePhysicalFootprintPeakBytes":6190730312,"lifetimeRSSPeakBytes":3342401536,"memoryPressureCancelled":false,"mirrorBytes":[18355054140,9165891940],"mlxActiveEndBytes":5719172096,"mlxCacheEndBytes":44427380,"mlxPeakMemoryGB":6.0633500199999997,"ngramCachedRows":736,"ngramCachePayloadBytes":235520,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.024489625000000001,"ngramRowHits":0,"ngramRowMisses":368,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":6.1907303120000003,"physicalFootprintEndBytes":5907139872,"prefillComputeKeyExtents":[23],"prefillComputePasses":[23],"prefillComputeQueryRows":[23],"prefillGPUWaitSeconds":0,"prefillIOSeconds":2.4744915840000008,"prefillLocalVictims":0,"prefillMLXActiveBytes":5717309104,"prefillMLXCacheBytes":40730228,"prefillPasses":[23],"prefillPhysicalFootprintBytes":5900422360,"prefillReadBytes":11697868800,"prefillRecords":4231,"prefillRowSortSeconds":0,"prefillScatterSeconds":0.003762995000000002,"prefillSeconds":3.569868708,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":23,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":0.01081325,"promptTokens":23,"queueSeconds":4.4580000000000003e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":10.84018575,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":24,"ropeTableHits":264,"sampleSeconds":0.0094308740000000005,"sharedExpertPrelaunches":0,"sharedPrefixBoundaries":[],"sharedPrefixCommon":0,"sharedPrefixErrors":0,"sharedPrefixRefusals":0,"sharedPrefixStores":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.0011181280000000001,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"The sky appears blue because of a phenomenon called Rayleigh scattering, where gas molecules in the atmosphere scatter shorter wavelengths of sunlight"}
```
