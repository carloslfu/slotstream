---
type: run
id: 01m1q7nme28hejntn69y5nybhs
created: 2026-09-04T22:12:17.986851+00:00
updated: 2026-09-04T22:12:30.637525+00:00
summary: 'N6 audit: production MoE dtypes, slice storage retention, scheduling arithmetic, and hashed code closure; no model benchmark'
binary: Python with MLX 0.31.1; inspected mlx-swift 0.31.6
captured_at: 2026-09-04
command: .venv31/bin/python check.py (script embedded in body)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: N6 code and tiny-tensor audit
tool: python
---
# N6 audit: reproducible code checks and tiny tensors

Captured before updating N6. No model weights were loaded, no server was launched,
and no throughput or production RSS improvement was measured. The dtype and slice
checks use the pinned Python MLX 0.31.1 runtime; production uses mlx-swift 0.31.6.
The file hashes identify the inspected working tree, including uncommitted probe
and harness files. Run from the repository root with `.venv31/bin/python check.py`.
The script is embedded here so this evidence does not depend on a temporary file.

## Script

```python
from pathlib import Path
import hashlib,json,subprocess,importlib.metadata,gc
import mlx.core as mx
root=Path.cwd()
files=['Sources/Slotstream/'+n+'.swift' for n in ['Generate','Model','Layers','ExpertStore','NgramStore','Plan','Context','Engine','PrefixCache','MTP','ProcessMemory','MemTrace','RouterTrace']]
files+=['Sources/Slotstream/Vendored/GatedDelta.swift','Sources/slotstream-cli/SweepCommands.swift','Sources/slotstream-cli/ContextCommands.swift','Tools/prefill_bench.sh','swift-probe/Sources/PrefillProbe/main.swift','Package.resolved']
files += ['.build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/'+p for p in ['common/slicing.cpp','metal/scaled_dot_product_attention.cpp','metal/quantized.cpp','metal/kernels/indexing/scatter.h','metal/kernels/reduction/ops.h']]
checks={}
x=mx.array([[[.1,.2,.3]]],dtype=mx.bfloat16)
g=mx.array([[.2,.1,.4]],dtype=mx.bfloat16)
logits=mx.matmul(x.astype(mx.float32),mx.transpose(g))
w=mx.softmax(logits,axis=-1,precise=True)
e=mx.ones((1,1,1,3),dtype=mx.bfloat16)
p=e*w[...,None]
s=p.sum(axis=-2)
mx.eval(s)
checks['production_dtypes']={k:str(v.dtype) for k,v in {'logits':logits,'weights':w,'product':p,'sum':s}.items()}
assert all(v==str(mx.float32) for v in checks['production_dtypes'].values())
checks['probe_uses_bf16_weights']='MLXArray(w, [1, S, K]).asType(.bfloat16)' in Path('swift-probe/Sources/PrefillProbe/main.swift').read_text()
assert checks['probe_uses_bf16_weights']
def schedule(n,c,base=0):
 out=[]
 while n:
  q=max(256,c)
  while q>256 and q*(base+q)>4096*8016:q=max(256,q//2)
  q=min(q,n);out.append(q);base+=q;n-=q
 return out
checks['schedules']={str(n)+'/'+str(c):schedule(n,c) for n,c in [(7960,256),(8073,256),(32768,4096),(32768,256),(32768,1024)]}
assert sum(checks['schedules']['7960/256'])==7960
checks['full_expert_bytes']=48*512*2764800
checks['one_layer_expert_bytes']=512*2764800
checks['activation_lower_inventory']={str(n):{'one_hyper_bf16_bytes':n*4*2560*2,'two_hyper_plus_x2_plus_fp32_accumulator_bytes':n*(2*4*2560*2+2560*2+2560*4)} for n in [8192,32768]}
mx.clear_cache();gc.collect();before=mx.get_active_memory()
a=mx.ones((1024,1024),dtype=mx.bfloat16);mx.eval(a)
v=a[:1];mx.eval(v);del a;gc.collect();mx.clear_cache()
checks['evaluated_slice_retention']={'logical_slice_bytes':v.nbytes,'active_bytes_above_before':mx.get_active_memory()-before}
assert checks['evaluated_slice_retention']['active_bytes_above_before']>=1024*1024*2
del v;gc.collect();mx.clear_cache()
layers=Path('Sources/Slotstream/Layers.swift').read_text()
checks['attention_budget_alias']='queryKeyBudget: Int { PrefillSchedule.measuredQueryKeyProduct }' in layers
checks['prose_from_mutable_plan']='head -c 34000 PLAN.md' in Path('Tools/prefill_bench.sh').read_text()
assert checks['attention_budget_alias'] and checks['prose_from_mutable_plan']
report={'kind':'provider-free code and tiny tensor audit; no model weights, no throughput benchmark','head':subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip(),'mlx':importlib.metadata.version('mlx'),'files_sha256':{p:hashlib.sha256(Path(p).read_bytes()).hexdigest() for p in files},'checks':checks}
print(json.dumps(report,indent=2))
```

## Raw stdout

```json
{
  "kind": "provider-free code and tiny tensor audit; no model weights, no throughput benchmark",
  "head": "b88fdb2cf1f4070c838bccac59911ad2625d25bb",
  "mlx": "0.31.1",
  "files_sha256": {
    "Sources/Slotstream/Generate.swift": "d52f5915a40f71114f5c286848d917d17d8bb4c724061d41d5ef32f5e3f0cebf",
    "Sources/Slotstream/Model.swift": "37066e1d04b1c0b175f410fc3927f1bd82c961acb5ef70db51c53123e2a8ac3e",
    "Sources/Slotstream/Layers.swift": "633c019f7f80a8ba276836c551b150911f607e0e2780613073bb4f73547834fe",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/NgramStore.swift": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/Context.swift": "decf33b911899aacc55a67ec7bc64b1a84a295184570fec3498a0cfcb4974ac3",
    "Sources/Slotstream/Engine.swift": "719f05a0bb4d09ed5e4d8c0b3fad28a305ec74641ab4e75cee41023fecc03197",
    "Sources/Slotstream/PrefixCache.swift": "3f6a4d7d2f9dbe4c9ff716d9def7e67fd9e11b9a5fc5653771b34ee1ddd5ab7e",
    "Sources/Slotstream/MTP.swift": "17a7fbfd4e5e278c807d5f9b5009d6e35858756a77309cb19c3783eecba8ea2a",
    "Sources/Slotstream/ProcessMemory.swift": "5e3151b8bfeee220aad3bab1deb5ae68aec05d68c33bc28e2ac2f098ce69af1c",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "64251c8f7ce41a41a69b7c8c777fc9a361a9437f70c0109bd8108c721f9f6580",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
    "Tools/prefill_bench.sh": "cf8e47b5fe0a00d059229b27c0320fcdd19ef0cb5f731a65b27a85c84a4c92eb",
    "swift-probe/Sources/PrefillProbe/main.swift": "c216e9d56c70ffdb30cea1521f2ae8845ac83b7a45ce172c64841115e1869fc7",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    ".build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/common/slicing.cpp": "ac82dd8972605a46dd4eab0c04303ed6758b273065bd9bde696d4591f914b1a2",
    ".build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp": "4d36489d2f2eadabed1ba275f392f40ed49256b8a7f951c779bbaf8bdd7f125f",
    ".build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/quantized.cpp": "2c33ba7baffcc891a7e1171f88b511cd423dd8cfa20b79bbd0b252e857a13281",
    ".build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/kernels/indexing/scatter.h": "6d6d81912ce7d6b896eb0225d1ac6885d30cd30213b67d996d3efc03f4a3c292",
    ".build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/kernels/reduction/ops.h": "f131776a2c8d61865b511639aa549fe116ed8775a9772cede3e769134d454795"
  },
  "checks": {
    "production_dtypes": {
      "logits": "mlx.core.float32",
      "weights": "mlx.core.float32",
      "product": "mlx.core.float32",
      "sum": "mlx.core.float32"
    },
    "probe_uses_bf16_weights": true,
    "schedules": {
      "7960/256": [
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        24
      ],
      "8073/256": [
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        137
      ],
      "32768/4096": [
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
      "32768/256": [
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256,
        256
      ],
      "32768/1024": [
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
    "full_expert_bytes": 67947724800,
    "one_layer_expert_bytes": 1415577600,
    "activation_lower_inventory": {
      "8192": {
        "one_hyper_bf16_bytes": 167772160,
        "two_hyper_plus_x2_plus_fp32_accumulator_bytes": 461373440
      },
      "32768": {
        "one_hyper_bf16_bytes": 671088640,
        "two_hyper_plus_x2_plus_fp32_accumulator_bytes": 1845493760
      }
    },
    "evaluated_slice_retention": {
      "logical_slice_bytes": 2048,
      "active_bytes_above_before": 2097152
    },
    "attention_budget_alias": true,
    "prose_from_mutable_plan": true
  }
}
```
