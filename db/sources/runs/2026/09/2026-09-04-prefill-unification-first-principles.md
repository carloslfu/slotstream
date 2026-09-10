---
type: run
id: 01m1qpcj8yz6zcjfmr0j2hargg
created: 2026-09-05T02:29:29.502973+00:00
updated: 2026-09-05T02:29:36.001564+00:00
summary: 'Prefill unification: pinned full-sort dispatch, 510 block-mask checks, 60 total-order selection checks, 156 checkpoint cases and explicit workspace arithmetic; no model benchmark'
binary: Python standard library; no model binary or MLX runtime
captured_at: 2026-09-04
command: python3 check.py "$MODEL_DIR" from the Slotstream repository; complete script and output in body
date: 2026-09-04
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Prefill unification: source and bounded first-principles checks'
tool: Python CPU and static Swift/Metal source inspection
---
# Prefill plan unification: implementation and bounded CPU checks

This source captures static inspection plus independent CPU combinatorial checks. It loads only the model configuration JSON, no tensor payload, model process or MLX runtime. It contains no throughput, GPU-parity or physical-footprint measurement. The source hash manifest identifies the current inference tree and pinned sorting implementation. The model configuration confirms the final layer is full attention.

Run from the Slotstream repository with `python3 check.py "$MODEL_DIR"`, where MODEL_DIR is the already verified local checkpoint directory. The complete script and exact JSON output follow. Python version: 3.9.6. Temporary script location during the captured run: `/tmp/slotstream-prefill-unification-20260904/check.py`.

The 510 mask checks transcribe finite nonnegative indexer scores, completed-block visibility and own-tail union; they do not call production QSA. The total-order top-K merge check is a mathematical control, not an assertion that NumPy/Python tie behavior equals MLX. The 156 cache cases use scalar means and whole-checkpoint restore; BF16/normalization/RoPE, speculative interior trim and asynchronous lifetimes remain production gates. All byte figures are logical payload arithmetic, not simultaneously live allocation or memory measurements. State/attention demand analysis is source reasoning, not a tested production patch.

## Pinned backend excerpt

`Source/Cmlx/mlx/mlx/backend/metal/sort.cpp`, lines 342–353:

```cpp
void ArgPartition::eval_gpu(const std::vector<array>& inputs, array& out) {
  // We direct arg partition to sort for now
  assert(inputs.size() == 1);

  out.set_data(allocator::malloc(out.nbytes()));

  auto& s = stream();
  auto& d = metal::device(s.device);
  auto& in = inputs[0];

  gpu_merge_sort(s, d, in, out, axis_, true);
}
```

## Reproducer

```python
import hashlib, json, math, pathlib, random, struct, subprocess, sys
root = pathlib.Path.cwd()
rng = random.Random(60904)
ratio, budget = 4, 512
# Independent transcription of the finite-score selection/own-tail logic.
cases = []
for context in [1,3,4,2047,2048,2049,2050,2051,2052,2053,4096,8193,32768]:
    qs = {0, context-1} | {p for p in [3,4,2046,2047,2048,2049,2050,2051,2052] if p < context}
    qs |= {rng.randrange(context) for _ in range(8)}
    for q in sorted(qs):
        for mode in ['zero_ties', 'unique', 'many_ties']:
            nblocks = context // ratio
            scores = [0.0 if mode == 'zero_ties' else (rng.random() if mode == 'unique' else float(rng.randrange(4))) for _ in range(nblocks)]
            visible = [4*j+3 <= q for j in range(nblocks)]
            # A stable total-order surrogate; dense-prefix theorem is independent of tie order.
            top = sorted(range(nblocks), key=lambda j: (-(scores[j] if visible[j] else -math.inf),j))[:min(budget,nblocks)]
            selected = {j for j in top if visible[j]}
            own_start = ((q+1)//4)*4
            keep = {p for p in range(q+1) if p//4 in selected or p >= own_start}
            dense = len(keep) == q+1
            assert dense == ((q+1)//4 <= budget)
            assert len(keep) == 4*min((q+1)//4,budget)+(q+1)%4
            cases.append((context,q,mode))
# Associative top-K merge for an explicitly fixed finite total order.
merges = 0
for length,k in [(512,10),(513,512),(2048,512),(2049,512),(8192,512)]:
    for mode in ['unique','ties','zeros']:
        vals = [rng.random() if mode=='unique' else (rng.randrange(8) if mode=='ties' else 0) for _ in range(length)]
        key = lambda j: (-vals[j],j)
        ref = sorted(range(length),key=key)[:k]
        for tile in [31,128,257,1024]:
            cur=[]
            for lo in range(0,length,tile):
                local=sorted(range(lo,min(length,lo+tile)),key=key)[:k]
                cur=sorted(cur+local,key=key)[:k]
            assert cur == ref
            merges += 1
# Compression state machine: completed blocks + raw tail, committed checkpoint restored across append.
checks=0
for base in range(13):
    for extension in range(1,13):
        raw=[rng.uniform(-1,1) for _ in range(base+extension)]
        def packed(xs):
            end=(len(xs)//4)*4
            return ([sum(xs[i:i+4])/4 for i in range(0,end,4)],xs[end:])
        blocks,tail=packed(raw[:base])
        saved=(blocks.copy(),tail.copy())
        for value in raw[base:]:
            tail.append(value)
            if len(tail)==4:
                blocks.append(sum(tail)/4);tail=[]
        assert (blocks,tail)==packed(raw)
        blocks,tail=saved
        assert (blocks,tail)==packed(raw[:base])
        checks+=1
record=2764800
ledger=[]
for n in [4096,8192,16384,32768]:
    ledger.append(dict(scope=n,hyper_bf16=n*10240*2,router_output_bf16=n*10*2560*2,
                       weighted_output_f32=n*10*2560*4,accumulator_f32=n*2560*4,
                       routing_ids_weights=n*10*8,example_base_frontier=n*56320))
backend = root/'.build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal'
files = [str(p.relative_to(root)) for p in sorted((root/'Sources').rglob('*.swift'))]
files += ['Package.swift','Package.resolved']
files += [str((backend/p).relative_to(root)) for p in ['sort.cpp','kernels/sort.h']]
source_hashes={f:hashlib.sha256((root/f).read_bytes()).hexdigest() for f in files}
config=json.loads((pathlib.Path(sys.argv[1])/'config.json').read_text())['text_config']
result=dict(kind='source inspection and CPU combinatorial/algebraic checks; no model or timing benchmark',
            git_head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),
            seed=60904, mask_cases=len(cases), mask_failures=0,
            dense_through_absolute_query=2050, first_sparse_query=2051,
            max_selected_keys=2051,topk_merge_cases=merges,topk_merge_failures=0,
            topk_limit='Explicit score-descending/index-ascending finite total order; no claim of pinned GPU tie/NaN parity or speed.',
            block_checkpoint_cases=checks,block_checkpoint_failures=0,
            block_limit='CPU scalar mean packing and whole-checkpoint restore only; no normalization/RoPE/BF16/Metal or arbitrary trim proof.',
            final_model_layer_type=config['layer_types'][-1],
            memory_ledger_bytes=ledger,full_layer_workspace_bytes=512*record,
            full_layer_vs_raw_expert_output_crossover_tokens=512*record/(10*2560*2),
            main_indexer_raw_bytes_32k=12*32768*128*2,
            main_indexer_completed_bytes_32k=12*(32768//4)*128*2,
            main_indexer_payload_difference_bytes_32k=12*32768*128*2-12*(32768//4)*128*2,
            source_sha256=source_hashes)
print(json.dumps(result,indent=2))

```

## Exact output

```json
{
  "kind": "source inspection and CPU combinatorial/algebraic checks; no model or timing benchmark",
  "git_head": "6e66a367f93e636c3729179e24007aa99c97b9a6",
  "seed": 60904,
  "mask_cases": 510,
  "mask_failures": 0,
  "dense_through_absolute_query": 2050,
  "first_sparse_query": 2051,
  "max_selected_keys": 2051,
  "topk_merge_cases": 60,
  "topk_merge_failures": 0,
  "topk_limit": "Explicit score-descending/index-ascending finite total order; no claim of pinned GPU tie/NaN parity or speed.",
  "block_checkpoint_cases": 156,
  "block_checkpoint_failures": 0,
  "block_limit": "CPU scalar mean packing and whole-checkpoint restore only; no normalization/RoPE/BF16/Metal or arbitrary trim proof.",
  "final_model_layer_type": "full_attention",
  "memory_ledger_bytes": [
    {
      "scope": 4096,
      "hyper_bf16": 83886080,
      "router_output_bf16": 209715200,
      "weighted_output_f32": 419430400,
      "accumulator_f32": 41943040,
      "routing_ids_weights": 327680,
      "example_base_frontier": 230686720
    },
    {
      "scope": 8192,
      "hyper_bf16": 167772160,
      "router_output_bf16": 419430400,
      "weighted_output_f32": 838860800,
      "accumulator_f32": 83886080,
      "routing_ids_weights": 655360,
      "example_base_frontier": 461373440
    },
    {
      "scope": 16384,
      "hyper_bf16": 335544320,
      "router_output_bf16": 838860800,
      "weighted_output_f32": 1677721600,
      "accumulator_f32": 167772160,
      "routing_ids_weights": 1310720,
      "example_base_frontier": 922746880
    },
    {
      "scope": 32768,
      "hyper_bf16": 671088640,
      "router_output_bf16": 1677721600,
      "weighted_output_f32": 3355443200,
      "accumulator_f32": 335544320,
      "routing_ids_weights": 2621440,
      "example_base_frontier": 1845493760
    }
  ],
  "full_layer_workspace_bytes": 1415577600,
  "full_layer_vs_raw_expert_output_crossover_tokens": 27648.0,
  "main_indexer_raw_bytes_32k": 100663296,
  "main_indexer_completed_bytes_32k": 25165824,
  "main_indexer_payload_difference_bytes_32k": 75497472,
  "source_sha256": {
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "decf33b911899aacc55a67ec7bc64b1a84a295184570fec3498a0cfcb4974ac3",
    "Sources/Slotstream/Engine.swift": "719f05a0bb4d09ed5e4d8c0b3fad28a305ec74641ab4e75cee41023fecc03197",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "d52f5915a40f71114f5c286848d917d17d8bb4c724061d41d5ef32f5e3f0cebf",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "633c019f7f80a8ba276836c551b150911f607e0e2780613073bb4f73547834fe",
    "Sources/Slotstream/MTP.swift": "17a7fbfd4e5e278c807d5f9b5009d6e35858756a77309cb19c3783eecba8ea2a",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "37066e1d04b1c0b175f410fc3927f1bd82c961acb5ef70db51c53123e2a8ac3e",
    "Sources/Slotstream/NgramStore.swift": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "3f6a4d7d2f9dbe4c9ff716d9def7e67fd9e11b9a5fc5653771b34ee1ddd5ab7e",
    "Sources/Slotstream/ProcessMemory.swift": "5e3151b8bfeee220aad3bab1deb5ae68aec05d68c33bc28e2ac2f098ce69af1c",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "64251c8f7ce41a41a69b7c8c777fc9a361a9437f70c0109bd8108c721f9f6580",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
    "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b0df13846ecb994c22dc284e9b4093af878308d3f4caf51bbccfd336ab7bb36f",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "01fb528236281fc27ea37e020be15a51bc14d580bd2524f610c057739ad8a972",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "47bda1d891a5aaf7d390fbdd935fb073332e2ba613c689d854981c983535b144",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "f1c3dce4e4f1def94c580719a7a383a9dfb1e1b35adc6c26af79d514e1784d46",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    ".build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/sort.cpp": "b680217dd5276612a880475f6c146947da42de920defbb19e06544eb1f71c22a",
    ".build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/kernels/sort.h": "97985c45c182ae5605d14d6092a3e49ec3547199eaf329724abc5e987478c968"
  }
}

```
