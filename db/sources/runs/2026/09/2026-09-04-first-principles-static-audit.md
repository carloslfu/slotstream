---
type: run
id: 01m1qarwz9aa66mah0c0b9ga4b
created: 2026-09-04T23:06:30.761322+00:00
updated: 2026-09-04T23:07:03.058677+00:00
summary: 'First-principles audit: code identities, tensor geometry and schedule arithmetic'
binary: python3
captured_at: 2026-09-04
command: python3 /tmp/slotstream-audit-20260904/static_probe.py; python3 /tmp/slotstream-audit-20260904/compression_probe.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'First-principles audit: code identities, tensor geometry and schedule arithmetic'
tool: Python standard library
---
# Static implementation and checkpoint evidence

Read-only code/header inspection and arithmetic. No model loaded. Technical conclusions were not taken from design or measurement documentation. The scripts below preserve exact commands and data; the static output contains source and backend identities and per-shard header hashes, not full weight hashes.

Commands: `python3 /tmp/slotstream-audit-20260904/static_probe.py` and `python3 /tmp/slotstream-audit-20260904/compression_probe.py`. The model locator paths are local runtime inputs, not model contents copied into the store. Compression is a bounded sample of 15 packed expert matrices, not a general corpus or timing benchmark.

## static_probe.py

SHA-256: `ac85d28bf1811cee1d5e879511a3a2daaf27cc77db17e17f5d473e6b8f22dc62`

```python
"""Read checkpoint headers and source identities; never load tensor payloads."""
import hashlib, json, pathlib, re, struct, subprocess

root = pathlib.Path('/Users/carlos/Projects/slotstream')
model = pathlib.Path('/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit')
cfg = json.loads((model/'config.json').read_text())
t = cfg['text_config']
groups = dict(resident=0, experts=0, ngram=0, vision=0)
headers = {}
resident_linear_flops = 0
for path in sorted(model.glob('model-*.safetensors')):
    with path.open('rb') as f:
        n = struct.unpack('<Q', f.read(8))[0]
        raw = f.read(n)
    headers[path.name] = dict(header_sha256=hashlib.sha256(raw).hexdigest(), file_bytes=path.stat().st_size)
    for name, item in json.loads(raw).items():
        if name == '__metadata__': continue
        size = item['data_offsets'][1] - item['data_offsets'][0]
        if 'ngram_embedding' in name: group = 'ngram'
        elif '.switch_mlp.' in name: group = 'experts'
        elif name.startswith('vision_tower.'): group = 'vision'
        else: group = 'resident'
        groups[group] += size
        if group == 'resident' and name.endswith('.weight') and len(item['shape']) == 2 and 'embed_tokens' not in name:
            parameters = item['shape'][0] * item['shape'][1]
            if item['dtype'] == 'U32': parameters *= 8
            resident_linear_flops += 2 * parameters

H, I, L, E, K = (t[k] for k in ['hidden_size','moe_intermediate_size','num_hidden_layers','num_experts','num_experts_per_tok'])
record = 3 * H * I * (4/8 + 4/64)
bound = 4096 * 8016
def schedule(n, cap, tail_aware):
    position = 0; result = []
    while position < n:
        c = min(cap, n-position) if tail_aware else cap
        while c > 256 and c * (position+c) > bound: c = max(256, c//2)
        c = min(c, n-position)
        result.append(c); position += c
    return result

source_hashes = {str(p.relative_to(root)): hashlib.sha256(p.read_bytes()).hexdigest()
                 for p in sorted((root/'Sources').rglob('*.swift'))}
backend_root = root/'.build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx'
backend_files = ['ops.cpp','fast.cpp','backend/common/slicing.cpp',
                 'backend/gpu/primitives.cpp','backend/metal/scaled_dot_product_attention.cpp',
                 'backend/metal/kernels/sdpa_vector.h','backend/metal/quantized.cpp']
out = dict(git_head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),
           source_sha256=source_hashes,
           backend_sha256={s:hashlib.sha256((backend_root/s).read_bytes()).hexdigest() for s in backend_files},
           config_sha256=hashlib.sha256((model/'config.json').read_bytes()).hexdigest(),
           tensor_groups_bytes=groups, checkpoint_headers=headers,
           dimensions=dict(hidden=H, intermediate=I, layers=L, experts=E, top_k=K),
           expert_record_bytes=record, active_expert_bytes_per_token=L*K*record,
           expert_bank_bytes=L*E*record, routed_linear_flops=2*3*H*I*L*K,
           resident_linear_flops_excluding_embedding=resident_linear_flops,
           total_active_linear_flops_excluding_embedding=resident_linear_flops+2*3*H*I*L*K,
           conv_retention_bytes_per_token=36*10240*2,
           ple_retention_bytes_per_token=10240*2,
           gdn_state_bytes=36*48*128*128*4,
           kv_and_raw_indexer_bytes_per_token=12*(2*2*256*2+128*2),
           schedule=[dict(tokens=n, current=schedule(n,4096,False),tail_aware=schedule(n,4096,True))
                     for n in [7960,8016,16384,32768]])
print(json.dumps(out,indent=2))
```

## static-probe.json

SHA-256: `884efdae163778d03a588e91ec9316a6d49495e9762702e68ba5781ef4ce09af`

```json
{
  "git_head": "6e66a367f93e636c3729179e24007aa99c97b9a6",
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
    "Sources/slotstream-cli/main.swift": "f1c3dce4e4f1def94c580719a7a383a9dfb1e1b35adc6c26af79d514e1784d46"
  },
  "backend_sha256": {
    "ops.cpp": "3952048eb504d51f5028f261aecf47cfcb50cf18a4958fb7946c1eba1b03afc2",
    "fast.cpp": "fa9c12db58e5aee9cff7ed02c155413be22701bdb3987e25a664f2607ffe318e",
    "backend/common/slicing.cpp": "ac82dd8972605a46dd4eab0c04303ed6758b273065bd9bde696d4591f914b1a2",
    "backend/gpu/primitives.cpp": "ba131a55078dcbea487ee30e4919e88ed08505817034fa1e1e129d6855d00df8",
    "backend/metal/scaled_dot_product_attention.cpp": "4d36489d2f2eadabed1ba275f392f40ed49256b8a7f951c779bbaf8bdd7f125f",
    "backend/metal/kernels/sdpa_vector.h": "4a9d6b1619fdeaf60abeb36a72d69d9d28b2b035e75d8204a600f5a369f9a250",
    "backend/metal/quantized.cpp": "2c33ba7baffcc891a7e1171f88b511cd423dd8cfa20b79bbd0b252e857a13281"
  },
  "config_sha256": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
  "tensor_groups_bytes": {
    "resident": 2924005400,
    "experts": 67947724800,
    "ngram": 32000153600,
    "vision": 897862112
  },
  "checkpoint_headers": {
    "model-00001.safetensors": {
      "header_sha256": "475ce8af9dea80570da09375a5e1039090610ae77373bffcb8d95bb0be3a9ddc",
      "file_bytes": 10039592993
    },
    "model-00002.safetensors": {
      "header_sha256": "430d68993347bf804c7ccc0a09b4811d503377fc9af4f524b0db0884790a12bf",
      "file_bytes": 10000066971
    },
    "model-00003.safetensors": {
      "header_sha256": "28b4f8f5a8606a84f5dd5de3c061130a6a65e767edb86355ae35859a525426d6",
      "file_bytes": 10000066984
    },
    "model-00004.safetensors": {
      "header_sha256": "c9df41567d842f9fbdf9ff53a3584ffacb1b220b43e9c9b49c0be96be6f2156d",
      "file_bytes": 10170248438
    },
    "model-00005.safetensors": {
      "header_sha256": "c189a7de6a617e0a0f7d3e60576b363ae0d8c240e277d8726a4ab467b30e596c",
      "file_bytes": 10194989755
    },
    "model-00006.safetensors": {
      "header_sha256": "b51ae1ca1c4c754dae0426f85c0f3e6c1539240bce1ae77fba8102cb08ebb977",
      "file_bytes": 10262727991
    },
    "model-00007.safetensors": {
      "header_sha256": "b64d4e3ba45e61f2463c6357bdca894926f19db595d4e9dd189b04822a9c611d",
      "file_bytes": 10190937668
    },
    "model-00008.safetensors": {
      "header_sha256": "ab49328405f98104ffab180748eba510fc6f31ba2bfa263a1d23e8b59ce261c9",
      "file_bytes": 10231122683
    },
    "model-00009.safetensors": {
      "header_sha256": "326333ed9d0b8df41fb3ecca875d5b7eecb29f36d674f5edf8c969bb3e71e75d",
      "file_bytes": 10250305804
    },
    "model-00010.safetensors": {
      "header_sha256": "962f992ebc7098380e89df4e6abd0dd5921a1702dc612eebee9d70bcc3035f37",
      "file_bytes": 10237786674
    },
    "model-00011.safetensors": {
      "header_sha256": "db46770964a73082aeb4e714c0b6b4da30646146f3330a5b40d26cfd4f12a608",
      "file_bytes": 2192353120
    }
  },
  "dimensions": {
    "hidden": 2560,
    "intermediate": 640,
    "layers": 48,
    "experts": 512,
    "top_k": 10
  },
  "expert_record_bytes": 2764800.0,
  "active_expert_bytes_per_token": 1327104000.0,
  "expert_bank_bytes": 67947724800.0,
  "routed_linear_flops": 4718592000,
  "resident_linear_flops_excluding_embedding": 8618885120,
  "total_active_linear_flops_excluding_embedding": 13337477120,
  "conv_retention_bytes_per_token": 737280,
  "ple_retention_bytes_per_token": 20480,
  "gdn_state_bytes": 113246208,
  "kv_and_raw_indexer_bytes_per_token": 27648,
  "schedule": [
    {
      "tokens": 7960,
      "current": [
        4096,
        2048,
        1816
      ],
      "tail_aware": [
        4096,
        3864
      ]
    },
    {
      "tokens": 8016,
      "current": [
        4096,
        2048,
        1872
      ],
      "tail_aware": [
        4096,
        3920
      ]
    },
    {
      "tokens": 16384,
      "current": [
        4096,
        2048,
        2048,
        2048,
        2048,
        2048,
        1024,
        1024
      ],
      "tail_aware": [
        4096,
        2048,
        2048,
        2048,
        2048,
        2048,
        1024,
        1024
      ]
    },
    {
      "tokens": 32768,
      "current": [
        4096,
        2048,
        2048,
        2048,
        2048,
        2048,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        512,
        512
      ],
      "tail_aware": [
        4096,
        2048,
        2048,
        2048,
        2048,
        2048,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        1024,
        768,
        576,
        864,
        864
      ]
    }
  ]
}
```

## compression_probe.py

SHA-256: `4c66faa941a2c5fe20d41a83b0fc3e3e888796fd69893b110aea514da95e0553`

```python
"""Bounded packed-weight compressibility sample; not a codec speed benchmark."""
import hashlib, json, pathlib, struct, zlib
root=pathlib.Path('/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit')
locations={}
for path in sorted(root.glob('model-*.safetensors')):
    with path.open('rb') as f:
        n=struct.unpack('<Q',f.read(8))[0];h=json.loads(f.read(n))
    for name,v in h.items():
        if name!='__metadata__':locations[name]=(path,8+n,v)
out=[]
for layer in [0,12,24,36,47]:
    for proj in ['gate_proj','up_proj','down_proj']:
        name=f'language_model.model.layers.{layer}.mlp.switch_mlp.{proj}.weight'
        path,base,v=locations[name];lo,hi=v['data_offsets'];width=(hi-lo)//v['shape'][0]
        with path.open('rb') as f:f.seek(base+lo+123*width);raw=f.read(width)
        assert len(raw)==819200
        out.append(dict(tensor=name,expert=123,raw_bytes=len(raw),zlib1_bytes=len(zlib.compress(raw,1)),sha256=hashlib.sha256(raw).hexdigest()))
print(json.dumps(dict(samples=out,raw_bytes=sum(x['raw_bytes'] for x in out),compressed_bytes=sum(x['zlib1_bytes'] for x in out),ratio=sum(x['zlib1_bytes'] for x in out)/sum(x['raw_bytes'] for x in out)),indent=2))
```

## compression-reproduced.json

SHA-256: `77474fa3c36660de2b9665e5550018be206743fa43592bcf44ef4bd2d6c04b4f`

```json
{
  "samples": [
    {
      "tensor": "language_model.model.layers.0.mlp.switch_mlp.gate_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 763518,
      "sha256": "dc67549f959d00ef616d2749f07dfe44e1924700e32f4657ce5d03901b94f43f"
    },
    {
      "tensor": "language_model.model.layers.0.mlp.switch_mlp.up_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 767194,
      "sha256": "a785dd7bc8ca1a483f2186bb4592749272ababd0ea5941590b7b1106f76fd5d4"
    },
    {
      "tensor": "language_model.model.layers.0.mlp.switch_mlp.down_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 769023,
      "sha256": "c4ab3e9e84d09b43aeb888f243b2b9efdca9a239d44efa302700d66356eb8038"
    },
    {
      "tensor": "language_model.model.layers.12.mlp.switch_mlp.gate_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 770479,
      "sha256": "961e877fb6956f1428d6be84d1f55cfd325e62fd0fb8372c3089723cabb81e5a"
    },
    {
      "tensor": "language_model.model.layers.12.mlp.switch_mlp.up_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 770889,
      "sha256": "78afaf54b9a87e3b0dd48ddac85f1c3a870e426de6bb87535ad6d77935c73f46"
    },
    {
      "tensor": "language_model.model.layers.12.mlp.switch_mlp.down_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 771373,
      "sha256": "5b76fb1dc4888a82035dc77fef30e111cb128889f32d64c7347f8a52011f0f3f"
    },
    {
      "tensor": "language_model.model.layers.24.mlp.switch_mlp.gate_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 769810,
      "sha256": "b3bc65c2948512256cdf9e112531038dcef5518e855719b260810ba87f24ebe6"
    },
    {
      "tensor": "language_model.model.layers.24.mlp.switch_mlp.up_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 770053,
      "sha256": "68a4cae24f287b8f9e03d4c141bb3513386e50676d48f5b6909f48f0e92a8ecc"
    },
    {
      "tensor": "language_model.model.layers.24.mlp.switch_mlp.down_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 771220,
      "sha256": "9bcc4dcb81bf4e3a6694c80e85c0ede00c700fcd5fe94bdca78e6aa10a5958cc"
    },
    {
      "tensor": "language_model.model.layers.36.mlp.switch_mlp.gate_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 768925,
      "sha256": "25cdf1a9954c337238c485d3390015bab7712dadb3fb451ceadda2cb707ea021"
    },
    {
      "tensor": "language_model.model.layers.36.mlp.switch_mlp.up_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 769794,
      "sha256": "1c95c93a7056c578e5da339f9f90c4a1c1e2317723222f1dd8367a0a9d61bbeb"
    },
    {
      "tensor": "language_model.model.layers.36.mlp.switch_mlp.down_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 770386,
      "sha256": "69100198e295bf4decc44a9ce4c8b8d0398f22740b4a16d657d30df3adebbeb3"
    },
    {
      "tensor": "language_model.model.layers.47.mlp.switch_mlp.gate_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 770290,
      "sha256": "c2f99b76f900a702ff77aa7d3ce0c85d7541c1a39077b42d1a34e6f98226cfe3"
    },
    {
      "tensor": "language_model.model.layers.47.mlp.switch_mlp.up_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 771093,
      "sha256": "97a30532f53feda0f1bd19afcffd983da7902d026ed16b8e6d9cde479c765816"
    },
    {
      "tensor": "language_model.model.layers.47.mlp.switch_mlp.down_proj.weight",
      "expert": 123,
      "raw_bytes": 819200,
      "zlib1_bytes": 771682,
      "sha256": "a9218339cc81f21aabcbf07d1c0c1781c62cd22e9d234d482b431d7faf77c31f"
    }
  ],
  "raw_bytes": 12288000,
  "compressed_bytes": 11545729,
  "ratio": 0.9395938313802084
}
```

## geometry.json

SHA-256: `ec7ed7b8955b9fe8cf7ad1e81d4a1d61373e6023bee13c70717b58c2e6d0425d`

```json
{
  "groups_bytes": {
    "resident": 2924005400,
    "experts": 67947724800,
    "ngram": 32000153600,
    "vision": 897862112
  },
  "config": {
    "hidden_size": 2560,
    "num_hidden_layers": 48,
    "num_attention_heads": 24,
    "num_key_value_heads": 2,
    "head_dim": 256,
    "num_experts": 512,
    "num_experts_per_tok": 10,
    "moe_intermediate_size": 640
  },
  "vision_config": {
    "deepstack_visual_indexes": [],
    "depth": 27,
    "hidden_act": "gelu_pytorch_tanh",
    "hidden_size": 1152,
    "in_channels": 3,
    "initializer_range": 0.02,
    "intermediate_size": 4304,
    "model_type": "qwen4_exp",
    "num_heads": 16,
    "num_position_embeddings": 2304,
    "out_hidden_size": 2560,
    "patch_size": 16,
    "spatial_merge_size": 2,
    "temporal_patch_size": 2
  },
  "expert_record_bytes": 2764800.0,
  "active_expert_bytes_per_token": 1327104000.0,
  "expert_linear_flops_per_token": 4718592000,
  "shared_linear_flops_per_token": 471859200,
  "gdn_state_bytes": 113246208,
  "conv_retained_parent_excess_bytes_per_chunk_token": 737280,
  "sweep": [
    {
      "tokens": 256,
      "uniform_expected_unique_per_layer": 508.71669263939754,
      "full_routed_bf16_bytes": 13107200,
      "hyper_bf16_bytes": 5242880,
      "conv_retained_excess_bytes": 188743680
    },
    {
      "tokens": 512,
      "uniform_expected_unique_per_layer": 511.97894510307776,
      "full_routed_bf16_bytes": 26214400,
      "hyper_bf16_bytes": 10485760,
      "conv_retained_excess_bytes": 377487360
    },
    {
      "tokens": 1024,
      "uniform_expected_unique_per_layer": 511.99999913416275,
      "full_routed_bf16_bytes": 52428800,
      "hyper_bf16_bytes": 20971520,
      "conv_retained_excess_bytes": 754974720
    },
    {
      "tokens": 2048,
      "uniform_expected_unique_per_layer": 512.0,
      "full_routed_bf16_bytes": 104857600,
      "hyper_bf16_bytes": 41943040,
      "conv_retained_excess_bytes": 1509949440
    },
    {
      "tokens": 4096,
      "uniform_expected_unique_per_layer": 512.0,
      "full_routed_bf16_bytes": 209715200,
      "hyper_bf16_bytes": 83886080,
      "conv_retained_excess_bytes": 3019898880
    },
    {
      "tokens": 32768,
      "uniform_expected_unique_per_layer": 512.0,
      "full_routed_bf16_bytes": 1677721600,
      "hyper_bf16_bytes": 671088640,
      "conv_retained_excess_bytes": 24159191040
    }
  ],
  "selected_tensors": {
    "model.layers.0.attn_hyper_connection.block_inject_weight.weight": {
      "shape": [
        4,
        10240
      ],
      "dtype": "BF16",
      "bytes": 81920
    },
    "model.layers.0.attn_hyper_connection.hc_norm.weight": {
      "shape": [
        10240
      ],
      "dtype": "BF16",
      "bytes": 20480
    },
    "model.layers.0.attn_hyper_connection.input_mix_weight_down.biases": {
      "shape": [
        320,
        160
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.0.attn_hyper_connection.input_mix_weight_down.scales": {
      "shape": [
        320,
        160
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.0.attn_hyper_connection.input_mix_weight_down.weight": {
      "shape": [
        320,
        1280
      ],
      "dtype": "U32",
      "bytes": 1638400
    },
    "model.layers.0.attn_hyper_connection.input_mix_weight_up.biases": {
      "shape": [
        10240,
        5
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.0.attn_hyper_connection.input_mix_weight_up.scales": {
      "shape": [
        10240,
        5
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.0.attn_hyper_connection.input_mix_weight_up.weight": {
      "shape": [
        10240,
        40
      ],
      "dtype": "U32",
      "bytes": 1638400
    },
    "model.layers.0.linear_attn.A_log": {
      "shape": [
        48
      ],
      "dtype": "BF16",
      "bytes": 96
    },
    "model.layers.0.linear_attn.conv1d.weight": {
      "shape": [
        10240,
        4,
        1
      ],
      "dtype": "BF16",
      "bytes": 81920
    },
    "model.layers.0.linear_attn.dt_bias": {
      "shape": [
        48
      ],
      "dtype": "BF16",
      "bytes": 96
    },
    "model.layers.0.linear_attn.in_proj_a.weight": {
      "shape": [
        48,
        2560
      ],
      "dtype": "BF16",
      "bytes": 245760
    },
    "model.layers.0.linear_attn.in_proj_b.weight": {
      "shape": [
        48,
        2560
      ],
      "dtype": "BF16",
      "bytes": 245760
    },
    "model.layers.0.linear_attn.in_proj_qkv.biases": {
      "shape": [
        10240,
        40
      ],
      "dtype": "BF16",
      "bytes": 819200
    },
    "model.layers.0.linear_attn.in_proj_qkv.scales": {
      "shape": [
        10240,
        40
      ],
      "dtype": "BF16",
      "bytes": 819200
    },
    "model.layers.0.linear_attn.in_proj_qkv.weight": {
      "shape": [
        10240,
        320
      ],
      "dtype": "U32",
      "bytes": 13107200
    },
    "model.layers.0.linear_attn.in_proj_z.biases": {
      "shape": [
        6144,
        40
      ],
      "dtype": "BF16",
      "bytes": 491520
    },
    "model.layers.0.linear_attn.in_proj_z.scales": {
      "shape": [
        6144,
        40
      ],
      "dtype": "BF16",
      "bytes": 491520
    },
    "model.layers.0.linear_attn.in_proj_z.weight": {
      "shape": [
        6144,
        320
      ],
      "dtype": "U32",
      "bytes": 7864320
    },
    "model.layers.0.linear_attn.norm.weight": {
      "shape": [
        128
      ],
      "dtype": "BF16",
      "bytes": 256
    },
    "model.layers.0.linear_attn.out_proj.biases": {
      "shape": [
        2560,
        96
      ],
      "dtype": "BF16",
      "bytes": 491520
    },
    "model.layers.0.linear_attn.out_proj.scales": {
      "shape": [
        2560,
        96
      ],
      "dtype": "BF16",
      "bytes": 491520
    },
    "model.layers.0.linear_attn.out_proj.weight": {
      "shape": [
        2560,
        768
      ],
      "dtype": "U32",
      "bytes": 7864320
    },
    "model.layers.0.mlp.gate.weight": {
      "shape": [
        512,
        2560
      ],
      "dtype": "BF16",
      "bytes": 2621440
    },
    "model.layers.0.mlp.shared_expert.down_proj.biases": {
      "shape": [
        2560,
        10
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.0.mlp.shared_expert.down_proj.scales": {
      "shape": [
        2560,
        10
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.0.mlp.shared_expert.down_proj.weight": {
      "shape": [
        2560,
        80
      ],
      "dtype": "U32",
      "bytes": 819200
    },
    "model.layers.0.mlp.shared_expert.gate_proj.biases": {
      "shape": [
        640,
        40
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.0.mlp.shared_expert.gate_proj.scales": {
      "shape": [
        640,
        40
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.0.mlp.shared_expert.gate_proj.weight": {
      "shape": [
        640,
        320
      ],
      "dtype": "U32",
      "bytes": 819200
    },
    "model.layers.0.mlp.shared_expert.up_proj.biases": {
      "shape": [
        640,
        40
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.0.mlp.shared_expert.up_proj.scales": {
      "shape": [
        640,
        40
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.0.mlp.shared_expert.up_proj.weight": {
      "shape": [
        640,
        320
      ],
      "dtype": "U32",
      "bytes": 819200
    },
    "model.layers.0.mlp.shared_expert_gate.weight": {
      "shape": [
        1,
        2560
      ],
      "dtype": "BF16",
      "bytes": 5120
    },
    "model.layers.0.mlp_hyper_connection.block_inject_weight.weight": {
      "shape": [
        4,
        10240
      ],
      "dtype": "BF16",
      "bytes": 81920
    },
    "model.layers.0.mlp_hyper_connection.hc_norm.weight": {
      "shape": [
        10240
      ],
      "dtype": "BF16",
      "bytes": 20480
    },
    "model.layers.0.mlp_hyper_connection.input_mix_weight_down.biases": {
      "shape": [
        320,
        160
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.0.mlp_hyper_connection.input_mix_weight_down.scales": {
      "shape": [
        320,
        160
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.0.mlp_hyper_connection.input_mix_weight_down.weight": {
      "shape": [
        320,
        1280
      ],
      "dtype": "U32",
      "bytes": 1638400
    },
    "model.layers.0.mlp_hyper_connection.input_mix_weight_up.biases": {
      "shape": [
        10240,
        5
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.0.mlp_hyper_connection.input_mix_weight_up.scales": {
      "shape": [
        10240,
        5
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.0.mlp_hyper_connection.input_mix_weight_up.weight": {
      "shape": [
        10240,
        40
      ],
      "dtype": "U32",
      "bytes": 1638400
    },
    "model.layers.3.attn_hyper_connection.block_inject_weight.weight": {
      "shape": [
        4,
        10240
      ],
      "dtype": "BF16",
      "bytes": 81920
    },
    "model.layers.3.attn_hyper_connection.hc_norm.weight": {
      "shape": [
        10240
      ],
      "dtype": "BF16",
      "bytes": 20480
    },
    "model.layers.3.attn_hyper_connection.input_mix_weight_down.biases": {
      "shape": [
        320,
        160
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.3.attn_hyper_connection.input_mix_weight_down.scales": {
      "shape": [
        320,
        160
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.3.attn_hyper_connection.input_mix_weight_down.weight": {
      "shape": [
        320,
        1280
      ],
      "dtype": "U32",
      "bytes": 1638400
    },
    "model.layers.3.attn_hyper_connection.input_mix_weight_up.biases": {
      "shape": [
        10240,
        5
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.3.attn_hyper_connection.input_mix_weight_up.scales": {
      "shape": [
        10240,
        5
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.3.attn_hyper_connection.input_mix_weight_up.weight": {
      "shape": [
        10240,
        40
      ],
      "dtype": "U32",
      "bytes": 1638400
    },
    "model.layers.3.mlp.gate.weight": {
      "shape": [
        512,
        2560
      ],
      "dtype": "BF16",
      "bytes": 2621440
    },
    "model.layers.3.mlp.shared_expert.down_proj.biases": {
      "shape": [
        2560,
        10
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.3.mlp.shared_expert.down_proj.scales": {
      "shape": [
        2560,
        10
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.3.mlp.shared_expert.down_proj.weight": {
      "shape": [
        2560,
        80
      ],
      "dtype": "U32",
      "bytes": 819200
    },
    "model.layers.3.mlp.shared_expert.gate_proj.biases": {
      "shape": [
        640,
        40
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.3.mlp.shared_expert.gate_proj.scales": {
      "shape": [
        640,
        40
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.3.mlp.shared_expert.gate_proj.weight": {
      "shape": [
        640,
        320
      ],
      "dtype": "U32",
      "bytes": 819200
    },
    "model.layers.3.mlp.shared_expert.up_proj.biases": {
      "shape": [
        640,
        40
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.3.mlp.shared_expert.up_proj.scales": {
      "shape": [
        640,
        40
      ],
      "dtype": "BF16",
      "bytes": 51200
    },
    "model.layers.3.mlp.shared_expert.up_proj.weight": {
      "shape": [
        640,
        320
      ],
      "dtype": "U32",
      "bytes": 819200
    },
    "model.layers.3.mlp.shared_expert_gate.weight": {
      "shape": [
        1,
        2560
      ],
      "dtype": "BF16",
      "bytes": 5120
    },
    "model.layers.3.mlp_hyper_connection.block_inject_weight.weight": {
      "shape": [
        4,
        10240
      ],
      "dtype": "BF16",
      "bytes": 81920
    },
    "model.layers.3.mlp_hyper_connection.hc_norm.weight": {
      "shape": [
        10240
      ],
      "dtype": "BF16",
      "bytes": 20480
    },
    "model.layers.3.mlp_hyper_connection.input_mix_weight_down.biases": {
      "shape": [
        320,
        160
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.3.mlp_hyper_connection.input_mix_weight_down.scales": {
      "shape": [
        320,
        160
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.3.mlp_hyper_connection.input_mix_weight_down.weight": {
      "shape": [
        320,
        1280
      ],
      "dtype": "U32",
      "bytes": 1638400
    },
    "model.layers.3.mlp_hyper_connection.input_mix_weight_up.biases": {
      "shape": [
        10240,
        5
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.3.mlp_hyper_connection.input_mix_weight_up.scales": {
      "shape": [
        10240,
        5
      ],
      "dtype": "BF16",
      "bytes": 102400
    },
    "model.layers.3.mlp_hyper_connection.input_mix_weight_up.weight": {
      "shape": [
        10240,
        40
      ],
      "dtype": "U32",
      "bytes": 1638400
    },
    "model.layers.3.self_attn.indexer.index_qk_proj.weight": {
      "shape": [
        640,
        2560
      ],
      "dtype": "BF16",
      "bytes": 3276800
    },
    "model.layers.3.self_attn.indexer.k_layernorm.weight": {
      "shape": [
        128
      ],
      "dtype": "BF16",
      "bytes": 256
    },
    "model.layers.3.self_attn.indexer.q_layernorm.weight": {
      "shape": [
        128
      ],
      "dtype": "BF16",
      "bytes": 256
    },
    "model.layers.3.self_attn.k_norm.weight": {
      "shape": [
        256
      ],
      "dtype": "BF16",
      "bytes": 512
    },
    "model.layers.3.self_attn.k_proj.biases": {
      "shape": [
        512,
        40
      ],
      "dtype": "BF16",
      "bytes": 40960
    },
    "model.layers.3.self_attn.k_proj.scales": {
      "shape": [
        512,
        40
      ],
      "dtype": "BF16",
      "bytes": 40960
    },
    "model.layers.3.self_attn.k_proj.weight": {
      "shape": [
        512,
        320
      ],
      "dtype": "U32",
      "bytes": 655360
    },
    "model.layers.3.self_attn.o_proj.biases": {
      "shape": [
        2560,
        96
      ],
      "dtype": "BF16",
      "bytes": 491520
    },
    "model.layers.3.self_attn.o_proj.scales": {
      "shape": [
        2560,
        96
      ],
      "dtype": "BF16",
      "bytes": 491520
    },
    "model.layers.3.self_attn.o_proj.weight": {
      "shape": [
        2560,
        768
      ],
      "dtype": "U32",
      "bytes": 7864320
    },
    "model.layers.3.self_attn.q_norm.weight": {
      "shape": [
        256
      ],
      "dtype": "BF16",
      "bytes": 512
    },
    "model.layers.3.self_attn.q_proj.biases": {
      "shape": [
        12288,
        40
      ],
      "dtype": "BF16",
      "bytes": 983040
    },
    "model.layers.3.self_attn.q_proj.scales": {
      "shape": [
        12288,
        40
      ],
      "dtype": "BF16",
      "bytes": 983040
    },
    "model.layers.3.self_attn.q_proj.weight": {
      "shape": [
        12288,
        320
      ],
      "dtype": "U32",
      "bytes": 15728640
    },
    "model.layers.3.self_attn.v_proj.biases": {
      "shape": [
        512,
        40
      ],
      "dtype": "BF16",
      "bytes": 40960
    },
    "model.layers.3.self_attn.v_proj.scales": {
      "shape": [
        512,
        40
      ],
      "dtype": "BF16",
      "bytes": 40960
    },
    "model.layers.3.self_attn.v_proj.weight": {
      "shape": [
        512,
        320
      ],
      "dtype": "U32",
      "bytes": 655360
    },
    "lm_head.biases": {
      "shape": [
        248320,
        40
      ],
      "dtype": "BF16",
      "bytes": 19865600
    },
    "lm_head.scales": {
      "shape": [
        248320,
        40
      ],
      "dtype": "BF16",
      "bytes": 19865600
    },
    "lm_head.weight": {
      "shape": [
        248320,
        320
      ],
      "dtype": "U32",
      "bytes": 317849600
    },
    "model.embed_tokens.biases": {
      "shape": [
        248320,
        40
      ],
      "dtype": "BF16",
      "bytes": 19865600
    },
    "model.embed_tokens.scales": {
      "shape": [
        248320,
        40
      ],
      "dtype": "BF16",
      "bytes": 19865600
    },
    "model.embed_tokens.weight": {
      "shape": [
        248320,
        320
      ],
      "dtype": "U32",
      "bytes": 317849600
    }
  }
}
```

## flops.json

SHA-256: `424ab6c003ec2beb081f296c55af66195759c4f6109606eff93c8a976dcf8d19`

```json
{
  "resident_weight_bytes": {
    "router": 125829120,
    "shared": 132956160,
    "hyper": 367431680,
    "qsa": 375539712,
    "gdn": 1188511488,
    "ple": 18575640,
    "lm_head": 357580800,
    "embed": 357580800
  },
  "linear_flops_per_token_by_group_including_embedding_table": {
    "router": 125829120,
    "shared": 472104960,
    "hyper": 1279262720,
    "qsa": 1234698240,
    "gdn": 4170055680,
    "ple": 65536000,
    "lm_head": 1271398400,
    "embed": 1271398400
  },
  "active_linear_flops_excluding_embedding": 13337477120
}
```

## schedule.json

SHA-256: `1f31949777193954ad0b174854983427b3cd6cfd359ac30aac725845a9b2d815`

```json
[
  {
    "tokens": 4096,
    "max_chunk": 1024,
    "current": [
      1024,
      1024,
      1024,
      1024
    ],
    "tail_aware": [
      1024,
      1024,
      1024,
      1024
    ]
  },
  {
    "tokens": 4096,
    "max_chunk": 2048,
    "current": [
      2048,
      2048
    ],
    "tail_aware": [
      2048,
      2048
    ]
  },
  {
    "tokens": 4096,
    "max_chunk": 4096,
    "current": [
      4096
    ],
    "tail_aware": [
      4096
    ]
  },
  {
    "tokens": 6144,
    "max_chunk": 1024,
    "current": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024
    ],
    "tail_aware": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024
    ]
  },
  {
    "tokens": 6144,
    "max_chunk": 2048,
    "current": [
      2048,
      2048,
      2048
    ],
    "tail_aware": [
      2048,
      2048,
      2048
    ]
  },
  {
    "tokens": 6144,
    "max_chunk": 4096,
    "current": [
      4096,
      2048
    ],
    "tail_aware": [
      4096,
      2048
    ]
  },
  {
    "tokens": 7960,
    "max_chunk": 1024,
    "current": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      792
    ],
    "tail_aware": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      792
    ]
  },
  {
    "tokens": 7960,
    "max_chunk": 2048,
    "current": [
      2048,
      2048,
      2048,
      1816
    ],
    "tail_aware": [
      2048,
      2048,
      2048,
      1816
    ]
  },
  {
    "tokens": 7960,
    "max_chunk": 4096,
    "current": [
      4096,
      2048,
      1816
    ],
    "tail_aware": [
      4096,
      3864
    ]
  },
  {
    "tokens": 8016,
    "max_chunk": 1024,
    "current": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      848
    ],
    "tail_aware": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      848
    ]
  },
  {
    "tokens": 8016,
    "max_chunk": 2048,
    "current": [
      2048,
      2048,
      2048,
      1872
    ],
    "tail_aware": [
      2048,
      2048,
      2048,
      1872
    ]
  },
  {
    "tokens": 8016,
    "max_chunk": 4096,
    "current": [
      4096,
      2048,
      1872
    ],
    "tail_aware": [
      4096,
      3920
    ]
  },
  {
    "tokens": 8192,
    "max_chunk": 1024,
    "current": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024
    ],
    "tail_aware": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024
    ]
  },
  {
    "tokens": 8192,
    "max_chunk": 2048,
    "current": [
      2048,
      2048,
      2048,
      2048
    ],
    "tail_aware": [
      2048,
      2048,
      2048,
      2048
    ]
  },
  {
    "tokens": 8192,
    "max_chunk": 4096,
    "current": [
      4096,
      2048,
      2048
    ],
    "tail_aware": [
      4096,
      2048,
      2048
    ]
  },
  {
    "tokens": 16384,
    "max_chunk": 1024,
    "current": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024
    ],
    "tail_aware": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024
    ]
  },
  {
    "tokens": 16384,
    "max_chunk": 2048,
    "current": [
      2048,
      2048,
      2048,
      2048,
      2048,
      2048,
      2048,
      1024,
      1024
    ],
    "tail_aware": [
      2048,
      2048,
      2048,
      2048,
      2048,
      2048,
      2048,
      1024,
      1024
    ]
  },
  {
    "tokens": 16384,
    "max_chunk": 4096,
    "current": [
      4096,
      2048,
      2048,
      2048,
      2048,
      2048,
      1024,
      1024
    ],
    "tail_aware": [
      4096,
      2048,
      2048,
      2048,
      2048,
      2048,
      1024,
      1024
    ]
  },
  {
    "tokens": 32768,
    "max_chunk": 1024,
    "current": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      512,
      512
    ],
    "tail_aware": [
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      512,
      512
    ]
  },
  {
    "tokens": 32768,
    "max_chunk": 2048,
    "current": [
      2048,
      2048,
      2048,
      2048,
      2048,
      2048,
      2048,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      512,
      512
    ],
    "tail_aware": [
      2048,
      2048,
      2048,
      2048,
      2048,
      2048,
      2048,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      512,
      512
    ]
  },
  {
    "tokens": 32768,
    "max_chunk": 4096,
    "current": [
      4096,
      2048,
      2048,
      2048,
      2048,
      2048,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      512,
      512
    ],
    "tail_aware": [
      4096,
      2048,
      2048,
      2048,
      2048,
      2048,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      1024,
      768,
      576,
      864,
      864
    ]
  }
]
```

