---
type: run
id: 01m1qarx18nahfbk3tj8e13mhg
created: 2026-09-04T23:06:30.824110+00:00
updated: 2026-09-04T23:07:21.525771+00:00
summary: 'First-principles audit: native retained-state compaction and identical logits'
binary: native-audit built from b88fdb2 production sources; SHA-256 in body
captured_at: 2026-09-04
command: native-audit baseline 1024; native-audit compact 1024; native-audit baseline 2048; native-audit compact 2048
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'First-principles audit: native retained-state compaction and identical logits'
tool: Native Swift and MLX
---
# Native model retained-view experiment

**Discarded as latency-benchmark evidence.** The purpose was to test memory ownership and final-logit equality, not establish speed. Runs were sequential (baseline/compact at 1024, then baseline/compact at 2048), not interleaved controlled timing trials; VM counters record background activity. Allocation and byte-equality results are preserved as such. All four processes exited successfully. No production source was edited.

The helper compiles the current production Slotstream source in a separate executable using the release dependency objects and metallib. It loads the real checkpoint, fixes the pool at 640 slots and MLX cache at 512 MiB, uses deterministic synthetic IDs, and optionally compacts GDN and PLE windows after each layer. It does not load the optional MTP head or vision tower. The layer hook is already exposed by the production model. Final vocabulary logits are written as Float32 bytes for exact comparison; this does not constitute all-state equality or a task-quality suite.

Reclaimable memory and the process inventory were checked before model launch. The other task's server exited before these runs; it was not stopped by this audit. The model's normal per-user process lock remained active. Reproduction must repeat those safety checks and preserve one model process at a time. The helper itself bounds tokens at 2048 but does not implement a reclaimable-memory preflight.

Exact build command: `python3 /tmp/slotstream-audit-20260904/build_native.py`. Exact model commands, in order: `/tmp/slotstream-audit-20260904/native-audit baseline 1024`, `.../native-audit compact 1024`, `.../native-audit baseline 2048`, `.../native-audit compact 2048`. Each subprocess had a 240-second timeout. No timings from these commands support a product throughput claim.

Executable SHA-256: `a0f4157ff9982295fe6b2bd3041e297de89ef8dad50070c55b499486c7b9e9d6`.

## NativeAudit.swift

SHA-256: `69e8b2a2c7fcccca387ad10a016b361e9691b7da809c42f55480611141d72767`

```swift
import Foundation
import MLX

@main struct NativeAudit {
    static func main() throws {
        let args = CommandLine.arguments
        let mode = args.count > 1 ? args[1] : "baseline"
        let count = args.count > 2 ? Int(args[2])! : 1024
        precondition(count <= 2048)
        MLX.Memory.cacheLimit = 512 << 20
        let index = try CheckpointIndex(dir: ModelLocator.resolve(PinnedModel.name))
        let model = try Qwen4ExpModel(index: index, poolSlots: 640)
        let state = model.makeState()
        let ids = (0..<count).map { 1000 + (($0 * 7919) % 200_000) }
        MLX.Memory.peakMemory = 0
        let start = Date()
        var stages: [[String: Any]] = []
        let hidden = model.hiddenStates(ids, state: state) { layer, _ in
            let before = MLX.Memory.activeMemory
            if mode == "compact", let cache = state.linear[layer] {
                if let c = cache.convState { cache.convState = contiguous(c); eval(cache.convState!) }
                if let c = cache.pleConvState { cache.pleConvState = contiguous(c); eval(cache.pleConvState!) }
            }
            if layer % 4 == 3 {
                stages.append(["layer": layer, "active_before": before, "active_after": MLX.Memory.activeMemory])
            }
        }
        let logits = model.draftLogits(hidden[0..., (count-1)..., 0...])
        eval(logits)
        let seconds = -start.timeIntervalSinceNow
        let beforeCompact = MLX.Memory.activeMemory
        let peak = MLX.Memory.peakMemory
        // Inspect the actual retained caches after the pass, independently of
        // the per-layer intervention. No model arithmetic is changed here.
        for cache in state.linear.values {
            if let c = cache.convState { cache.convState = contiguous(c); eval(cache.convState!) }
            if let c = cache.pleConvState { cache.pleConvState = contiguous(c); eval(cache.pleConvState!) }
        }
        let afterCompact = MLX.Memory.activeMemory
        let floats = logits.asType(.float32).asArray(Float.self)
        let path = "/tmp/slotstream-audit-20260904/\(mode)-\(count)-logits.bin"
        try floats.withUnsafeBufferPointer { try Data(buffer: $0).write(to: URL(fileURLWithPath: path)) }
        let result: [String: Any] = [
            "mode": mode, "tokens": count, "pool_slots": 640,
            "seconds_diagnostic_only": seconds, "peak_active": peak,
            "active_before_final_compaction": beforeCompact,
            "active_after_final_compaction": afterCompact,
            "rss_peak": ProcessMemory.peakResidentGB,
            "expert_records": model.pool.recordsFetched, "expert_io_seconds": model.pool.ioSeconds,
            "stages": stages, "logits_path": path
        ]
        print(String(data: try JSONSerialization.data(withJSONObject: result, options: [.prettyPrinted, .sortedKeys]), encoding: .utf8)!)
    }
}
```

## build_native.py

SHA-256: `5a164308fd87e4015052c5f723a97976ee8ebe221a6c6a7c81050aa0d56d061f`

```python
import json, pathlib, subprocess
root = pathlib.Path('/Users/carlos/Projects/slotstream')
out = pathlib.Path('/tmp/slotstream-audit-20260904')
desc = json.loads((root/'.build/release/description.json').read_text())
v = next(v for v in desc['swiftCommands'].values() if v.get('moduleName') == 'Slotstream')
args = v['otherArguments'][:]
for flag in ['-num-threads','-emit-objc-header-path','-module-cache-path']:
    i=args.index(flag);del args[i:i+2]
for flag in ['-serialize-diagnostics','-emit-objc-header','-parseable-output','-g','-j18']:
    if flag in args:args.remove(flag)
args += ['-num-threads','4','-j4','-module-cache-path',str(out/'ModuleCache')]
objs = (root/'.build/release/slotstream.product/Objects.LinkFileList').read_text().splitlines()
objs = [s for s in objs if not any('/'+p+'.build/' in s for p in ['slotstream_cli','Slotstream','SlotstreamDiagnostics'])]
(out/'objects.list').write_text('\n'.join(objs)+'\n')
cmd = [v['executable'],*args,'-I',v['importPath'],'-module-name','SlotstreamAudit',*v['sources'],str(out/'NativeAudit.swift'),'@'+str(out/'objects.list'),'-lc++','-framework','Metal','-framework','Accelerate','-framework','Foundation','-o',str(out/'native-audit')]
(out/'build-command.json').write_text(json.dumps(cmd,indent=2))
subprocess.run(cmd,check=True)
p=out/'mlx.metallib'
if not p.exists():p.symlink_to((root/'.build/release/mlx.metallib').resolve())
```

## build-command.json

SHA-256: `b92872bb7a3e6ec1df67caa14dcbea55ef82a17fdbea9e7e140806b563ada318`

```json
[
  "/Library/Developer/CommandLineTools/usr/bin/swiftc",
  "-target",
  "arm64-apple-macosx14.0",
  "-whole-module-optimization",
  "-O",
  "-DSWIFT_PACKAGE",
  "-DSWIFT_MODULE_RESOURCE_BUNDLE_UNAVAILABLE",
  "-Xcc",
  "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap",
  "-Xcc",
  "-I",
  "-Xcc",
  "/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include",
  "-Xcc",
  "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap",
  "-Xcc",
  "-I",
  "-Xcc",
  "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include",
  "-Xcc",
  "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/yyjson.build/module.modulemap",
  "-Xcc",
  "-I",
  "-Xcc",
  "/Users/carlos/Projects/slotstream/.build/checkouts/yyjson/src",
  "-parse-as-library",
  "-swift-version",
  "5",
  "-I",
  "/Library/Developer/CommandLineTools/Library/Developer/Frameworks",
  "-L",
  "/Library/Developer/CommandLineTools/Library/Developer/Frameworks",
  "-plugin-path",
  "/Library/Developer/CommandLineTools/usr/lib/swift/host/plugins/testing",
  "-sdk",
  "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
  "-Xcc",
  "-isysroot",
  "-Xcc",
  "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
  "-Xcc",
  "-fPIC",
  "-Xcc",
  "-g",
  "-package-name",
  "slotstream",
  "-num-threads",
  "4",
  "-j4",
  "-module-cache-path",
  "/tmp/slotstream-audit-20260904/ModuleCache",
  "-I",
  "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules",
  "-module-name",
  "SlotstreamAudit",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Checkpoint.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Context.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Engine.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Errors.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/ExpertStore.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/GatewayDialect.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Generate.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Governor.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Layers.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/MTP.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Machine.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/MemTrace.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Model.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/NgramStore.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/PinnedModel.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Plan.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/PrefixCache.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/ProcessMemory.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/RouterTrace.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Server.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/ToolCallSplitter.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Vendored/GatedDelta.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Version.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Vision.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/VisionPrompt.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/WeightDownload.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/WeightStore.swift",
  "/Users/carlos/Projects/slotstream/Sources/Slotstream/Weights.swift",
  "/tmp/slotstream-audit-20260904/NativeAudit.swift",
  "@/tmp/slotstream-audit-20260904/objects.list",
  "-lc++",
  "-framework",
  "Metal",
  "-framework",
  "Accelerate",
  "-framework",
  "Foundation",
  "-o",
  "/tmp/slotstream-audit-20260904/native-audit"
]
```

## baseline-1024.json

SHA-256: `de61adfd6f4f3b4f19407e564ae73910049a646372ff3947f4779ab0beaa184c`

```json
{
  "active_after_final_compaction" : 4934830232,
  "active_before_final_compaction" : 5731682458,
  "expert_io_seconds" : 2.5213112831115723,
  "expert_records" : 11579,
  "logits_path" : "\/tmp\/slotstream-audit-20260904\/baseline-1024-logits.bin",
  "mode" : "baseline",
  "peak_active" : 6309296898,
  "pool_slots" : 640,
  "rss_peak" : 6.0400143760000002,
  "seconds_diagnostic_only" : 6.836806058883667,
  "stages" : [
    {
      "active_after" : 4847065240,
      "active_before" : 4868036760,
      "layer" : 3
    },
    {
      "active_after" : 4947925144,
      "active_before" : 4947925144,
      "layer" : 7
    },
    {
      "active_after" : 5027848836,
      "active_before" : 5027848836,
      "layer" : 11
    },
    {
      "active_after" : 5107786116,
      "active_before" : 5107786116,
      "layer" : 15
    },
    {
      "active_after" : 5187690624,
      "active_before" : 5187690624,
      "layer" : 19
    },
    {
      "active_after" : 5267576984,
      "active_before" : 5267576984,
      "layer" : 23
    },
    {
      "active_after" : 5347471516,
      "active_before" : 5347471516,
      "layer" : 27
    },
    {
      "active_after" : 5427359168,
      "active_before" : 5427359168,
      "layer" : 31
    },
    {
      "active_after" : 5507254476,
      "active_before" : 5507254476,
      "layer" : 35
    },
    {
      "active_after" : 5587136416,
      "active_before" : 5587136416,
      "layer" : 39
    },
    {
      "active_after" : 5667036840,
      "active_before" : 5667036840,
      "layer" : 43
    },
    {
      "active_after" : 5746931404,
      "active_before" : 5746931404,
      "layer" : 47
    }
  ],
  "tokens" : 1024
}
```

## baseline-1024-environment.json

SHA-256: `3382ce81ac556a60138a60c891ee556501e98b9abfc51218368dd8fbb5143f1b`

```json
{
  "vm_before": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    96591.\nPages active:                                 777125.\nPages inactive:                              1516537.\nPages speculative:                             55437.\nPages throttled:                                   0.\nPages wired down:                             212960.\nPages purgeable:                               12591.\n\"Translation faults\":                    13453161443.\nPages copy-on-write:                       612384983.\nPages zero filled:                       12975596960.\nPages reactivated:                        1929852706.\nPages purged:                               58925328.\nFile-backed pages:                           1795029.\nAnonymous pages:                              554070.\nPages stored in compressor:                  1511018.\nPages occupied by compressor:                 425595.\nDecompressions:                            920763259.\nCompressions:                             1210329980.\nPageins:                                  5468473514.\nPageouts:                                   10591822.\nSwapins:                                    41640278.\nSwapouts:                                   69884827.\nPages tagged:                                 162890.\nPages tagged resident:                        120294.\nPages tagged compressed:                       42596.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7286.\nPages tag-storage free:                         1150.\nPages tag-storage non-tag pageable:            89857.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    7042304.\nTagged compressions:                         8853617.\nTagged decompressions:                       8125759.\n",
  "started_at": "2026-09-04T17:52:48-0500",
  "exit_code": 0,
  "vm_after": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   331462.\nPages active:                                1047344.\nPages inactive:                               913658.\nPages speculative:                            133503.\nPages throttled:                                   0.\nPages wired down:                             228550.\nPages purgeable:                                2568.\n\"Translation faults\":                    13453464243.\nPages copy-on-write:                       612386794.\nPages zero filled:                       12978689966.\nPages reactivated:                        1930551660.\nPages purged:                               58932057.\nFile-backed pages:                           1594969.\nAnonymous pages:                              499536.\nPages stored in compressor:                  1537693.\nPages occupied by compressor:                 429572.\nDecompressions:                            920851220.\nCompressions:                             1210630592.\nPageins:                                  5469123622.\nPageouts:                                   10591902.\nSwapins:                                    41640282.\nSwapouts:                                   69884827.\nPages tagged:                                 161577.\nPages tagged resident:                        118698.\nPages tagged compressed:                       42879.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7279.\nPages tag-storage free:                         1372.\nPages tag-storage non-tag pageable:            89642.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    7092288.\nTagged compressions:                         8855283.\nTagged decompressions:                       8126399.\n",
  "finished_at": "2026-09-04T17:52:57-0500"
}
```

## compact-1024.json

SHA-256: `7b8357b30752994bb3f34fbda13ad6418c0e1eea03c134591ddb4700f09713e7`

```json
{
  "active_after_final_compaction" : 4913825944,
  "active_before_final_compaction" : 4955703450,
  "expert_io_seconds" : 2.0373914241790771,
  "expert_records" : 11579,
  "logits_path" : "\/tmp\/slotstream-audit-20260904\/compact-1024-logits.bin",
  "mode" : "compact",
  "peak_active" : 5909813716,
  "pool_slots" : 640,
  "rss_peak" : 6.0464369519999996,
  "seconds_diagnostic_only" : 4.1006540060043335,
  "stages" : [
    {
      "active_after" : 4763179160,
      "active_before" : 4784150680,
      "layer" : 3
    },
    {
      "active_after" : 4801124504,
      "active_before" : 4801124504,
      "layer" : 7
    },
    {
      "active_after" : 4818119516,
      "active_before" : 4818119516,
      "layer" : 11
    },
    {
      "active_after" : 4835121472,
      "active_before" : 4835121472,
      "layer" : 15
    },
    {
      "active_after" : 4852117048,
      "active_before" : 4852117048,
      "layer" : 19
    },
    {
      "active_after" : 4869085336,
      "active_before" : 4869085336,
      "layer" : 23
    },
    {
      "active_after" : 4886065308,
      "active_before" : 4886065308,
      "layer" : 27
    },
    {
      "active_after" : 4903035160,
      "active_before" : 4903035160,
      "layer" : 31
    },
    {
      "active_after" : 4920019148,
      "active_before" : 4920019148,
      "layer" : 35
    },
    {
      "active_after" : 4936983776,
      "active_before" : 4936983776,
      "layer" : 39
    },
    {
      "active_after" : 4953975228,
      "active_before" : 4953975228,
      "layer" : 43
    },
    {
      "active_after" : 4970952396,
      "active_before" : 4970952396,
      "layer" : 47
    }
  ],
  "tokens" : 1024
}
```

## compact-1024-environment.json

SHA-256: `d8b7fd7396c7588c7605d5ecbc7a3b26abcabcd21821837cc6f6d95617386e29`

```json
{
  "vm_before": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   323631.\nPages active:                                1049424.\nPages inactive:                               925391.\nPages speculative:                            134244.\nPages throttled:                                   0.\nPages wired down:                             227031.\nPages purgeable:                                1312.\n\"Translation faults\":                    13453662948.\nPages copy-on-write:                       612428207.\nPages zero filled:                       12978767635.\nPages reactivated:                        1930551812.\nPages purged:                               58932569.\nFile-backed pages:                           1596629.\nAnonymous pages:                              512430.\nPages stored in compressor:                  1524906.\nPages occupied by compressor:                 425280.\nDecompressions:                            920861593.\nCompressions:                             1210630592.\nPageins:                                  5469125020.\nPageouts:                                   10591902.\nSwapins:                                    41640282.\nSwapouts:                                   69884827.\nPages tagged:                                 161604.\nPages tagged resident:                        118807.\nPages tagged compressed:                       42797.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7279.\nPages tag-storage free:                          438.\nPages tag-storage non-tag pageable:            90576.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    7073024.\nTagged compressions:                         8855283.\nTagged decompressions:                       8126481.\n",
  "reclaimable_bytes": 31483035648,
  "started_at": "2026-09-04T17:53:28-0500",
  "exit_code": 0,
  "vm_after": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   399333.\nPages active:                                1025659.\nPages inactive:                               939559.\nPages speculative:                             85694.\nPages throttled:                                   0.\nPages wired down:                             212524.\nPages purgeable:                               10222.\n\"Translation faults\":                    13453884443.\nPages copy-on-write:                       612428808.\nPages zero filled:                       12981770949.\nPages reactivated:                        1930621832.\nPages purged:                               58933828.\nFile-backed pages:                           1530520.\nAnonymous pages:                              520392.\nPages stored in compressor:                  1522752.\nPages occupied by compressor:                 421630.\nDecompressions:                            920862174.\nCompressions:                             1210632921.\nPageins:                                  5469188084.\nPageouts:                                   10591960.\nSwapins:                                    41640282.\nSwapouts:                                   69884827.\nPages tagged:                                 161623.\nPages tagged resident:                        118823.\nPages tagged compressed:                       42800.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7279.\nPages tag-storage free:                         1186.\nPages tag-storage non-tag pageable:            89828.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    7073024.\nTagged compressions:                         8855300.\nTagged decompressions:                       8126495.\n",
  "finished_at": "2026-09-04T17:53:33-0500"
}
```

## baseline-2048.json

SHA-256: `c8f5eecf8d0d2468eafb0460931508f63f73133b8ecedada8e92b9e31e0199ef`

```json
{
  "active_after_final_compaction" : 5049026712,
  "active_before_final_compaction" : 6642796698,
  "expert_io_seconds" : 2.3590996265411377,
  "expert_records" : 12927,
  "logits_path" : "\/tmp\/slotstream-audit-20260904\/baseline-2048-logits.bin",
  "mode" : "baseline",
  "peak_active" : 7731816874,
  "pool_slots" : 640,
  "rss_peak" : 6.0515979120000001,
  "seconds_diagnostic_only" : 7.2163429260253906,
  "stages" : [
    {
      "active_after" : 4980254872,
      "active_before" : 5056280734,
      "layer" : 3
    },
    {
      "active_after" : 5206424170,
      "active_before" : 5206424170,
      "layer" : 7
    },
    {
      "active_after" : 5353945934,
      "active_before" : 5353945934,
      "layer" : 11
    },
    {
      "active_after" : 5504084122,
      "active_before" : 5504084122,
      "layer" : 15
    },
    {
      "active_after" : 5656854826,
      "active_before" : 5656854826,
      "layer" : 19
    },
    {
      "active_after" : 5806995822,
      "active_before" : 5806995824,
      "layer" : 23
    },
    {
      "active_after" : 5957138590,
      "active_before" : 5957138592,
      "layer" : 27
    },
    {
      "active_after" : 6104656026,
      "active_before" : 6104660454,
      "layer" : 31
    },
    {
      "active_after" : 6254803098,
      "active_before" : 6254803098,
      "layer" : 35
    },
    {
      "active_after" : 6407567598,
      "active_before" : 6407567598,
      "layer" : 39
    },
    {
      "active_after" : 6767425696,
      "active_before" : 6767425696,
      "layer" : 43
    },
    {
      "active_after" : 6707857526,
      "active_before" : 6707857526,
      "layer" : 47
    }
  ],
  "tokens" : 2048
}
```

## baseline-2048-environment.json

SHA-256: `df8bfdcd536ea388aa6a8b4b3c8cf4f218ad7ab1b71f7df72c222e998075215a`

```json
{
  "vm_before": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   386773.\nPages active:                                1024662.\nPages inactive:                               941092.\nPages speculative:                             87761.\nPages throttled:                                   0.\nPages wired down:                             226933.\nPages purgeable:                                1473.\n\"Translation faults\":                    13454040503.\nPages copy-on-write:                       612444273.\nPages zero filled:                       12981908957.\nPages reactivated:                        1930622133.\nPages purged:                               58934485.\nFile-backed pages:                           1535146.\nAnonymous pages:                              518369.\nPages stored in compressor:                  1513798.\nPages occupied by compressor:                 417727.\nDecompressions:                            920871017.\nCompressions:                             1210632921.\nPageins:                                  5469191366.\nPageouts:                                   10591960.\nSwapins:                                    41640286.\nSwapouts:                                   69884827.\nPages tagged:                                 161567.\nPages tagged resident:                        118823.\nPages tagged compressed:                       42744.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7279.\nPages tag-storage free:                          568.\nPages tag-storage non-tag pageable:            90446.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    7062144.\nTagged compressions:                         8855300.\nTagged decompressions:                       8126550.\n",
  "reclaimable_bytes": 31512854528,
  "started_at": "2026-09-04T17:54:34-0500",
  "exit_code": 0,
  "vm_after": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   395955.\nPages active:                                 967426.\nPages inactive:                               849659.\nPages speculative:                            117641.\nPages throttled:                                   0.\nPages wired down:                             226759.\nPages purgeable:                                  23.\n\"Translation faults\":                    13454272488.\nPages copy-on-write:                       612445526.\nPages zero filled:                       12987887856.\nPages reactivated:                        1930958508.\nPages purged:                               58935982.\nFile-backed pages:                           1638971.\nAnonymous pages:                              295755.\nPages stored in compressor:                  1731132.\nPages occupied by compressor:                 525726.\nDecompressions:                            921030762.\nCompressions:                             1211223434.\nPageins:                                  5469466346.\nPageouts:                                   10592101.\nSwapins:                                    41640286.\nSwapouts:                                   69884827.\nPages tagged:                                 161436.\nPages tagged resident:                        112358.\nPages tagged compressed:                       49078.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7193.\nPages tag-storage free:                         2422.\nPages tag-storage non-tag pageable:            88678.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8423296.\nTagged compressions:                         8862506.\nTagged decompressions:                       8126593.\n",
  "finished_at": "2026-09-04T17:54:42-0500"
}
```

## compact-2048.json

SHA-256: `1694295c8d6d53e275ab679b5f5b6d9c0d19e55c70c2f5aaa490de7f46e83636`

```json
{
  "active_after_final_compaction" : 5007018136,
  "active_before_final_compaction" : 5090904218,
  "expert_io_seconds" : 2.3177413940429688,
  "expert_records" : 12927,
  "logits_path" : "\/tmp\/slotstream-audit-20260904\/compact-2048-logits.bin",
  "mode" : "compact",
  "peak_active" : 6221867434,
  "pool_slots" : 640,
  "rss_peak" : 6.0853326880000003,
  "seconds_diagnostic_only" : 6.4353100061416626,
  "stages" : [
    {
      "active_after" : 4812482712,
      "active_before" : 4885887262,
      "layer" : 3
    },
    {
      "active_after" : 4910200994,
      "active_before" : 4912822434,
      "layer" : 7
    },
    {
      "active_after" : 4937137834,
      "active_before" : 4937137836,
      "layer" : 11
    },
    {
      "active_after" : 4958828706,
      "active_before" : 4961450150,
      "layer" : 15
    },
    {
      "active_after" : 4983144742,
      "active_before" : 4985766182,
      "layer" : 19
    },
    {
      "active_after" : 5007456410,
      "active_before" : 5007456410,
      "layer" : 23
    },
    {
      "active_after" : 5034394070,
      "active_before" : 5034394070,
      "layer" : 27
    },
    {
      "active_after" : 5058705566,
      "active_before" : 5058705568,
      "layer" : 31
    },
    {
      "active_after" : 5083019422,
      "active_before" : 5083019424,
      "layer" : 35
    },
    {
      "active_after" : 5107333358,
      "active_before" : 5107333360,
      "layer" : 39
    },
    {
      "active_after" : 5131647134,
      "active_before" : 5131647134,
      "layer" : 43
    },
    {
      "active_after" : 5155960990,
      "active_before" : 5155960992,
      "layer" : 47
    }
  ],
  "tokens" : 2048
}
```

## compact-2048-environment.json

SHA-256: `6bf55edef4d9d6970d30b4d113db0a88813f4f3c40c4279e9293158731a5f97f`

```json
{
  "vm_before": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   396093.\nPages active:                                 967612.\nPages inactive:                               849660.\nPages speculative:                            117641.\nPages throttled:                                   0.\nPages wired down:                             226759.\nPages purgeable:                                  23.\n\"Translation faults\":                    13454273262.\nPages copy-on-write:                       612445665.\nPages zero filled:                       12987887912.\nPages reactivated:                        1930958508.\nPages purged:                               58935982.\nFile-backed pages:                           1638972.\nAnonymous pages:                              295941.\nPages stored in compressor:                  1730951.\nPages occupied by compressor:                 525702.\nDecompressions:                            921030947.\nCompressions:                             1211223434.\nPageins:                                  5469466347.\nPageouts:                                   10592101.\nSwapins:                                    41640286.\nSwapouts:                                   69884827.\nPages tagged:                                 161436.\nPages tagged resident:                        112358.\nPages tagged compressed:                       49078.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7193.\nPages tag-storage free:                         2404.\nPages tag-storage non-tag pageable:            88696.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8423296.\nTagged compressions:                         8862506.\nTagged decompressions:                       8126593.\n",
  "reclaimable_bytes": 33342881792,
  "started_at": "2026-09-04T17:54:42-0500",
  "exit_code": 0,
  "vm_after": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   365291.\nPages active:                                 967093.\nPages inactive:                               813757.\nPages speculative:                            152633.\nPages throttled:                                   0.\nPages wired down:                             228262.\nPages purgeable:                                  19.\n\"Translation faults\":                    13454508480.\nPages copy-on-write:                       612447112.\nPages zero filled:                       12993876124.\nPages reactivated:                        1931084275.\nPages purged:                               58936018.\nFile-backed pages:                           1697027.\nAnonymous pages:                              236456.\nPages stored in compressor:                  1788675.\nPages occupied by compressor:                 556326.\nDecompressions:                            921074200.\nCompressions:                             1211372892.\nPageins:                                  5469639837.\nPageouts:                                   10592114.\nSwapins:                                    41640286.\nSwapouts:                                   69884827.\nPages tagged:                                 161492.\nPages tagged resident:                        110399.\nPages tagged compressed:                       51093.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7109.\nPages tag-storage free:                         2432.\nPages tag-storage non-tag pageable:            88752.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8810560.\nTagged compressions:                         8864625.\nTagged decompressions:                       8126694.\n",
  "finished_at": "2026-09-04T17:54:49-0500"
}
```

## native-comparison.json

SHA-256: `dd11d635b9664fd65cf04b6afda6ebeb85e56856e47c20d8cd0383576539ca74`

```json
[
  {
    "tokens": 1024,
    "logit_count": 248320,
    "byte_identical": true,
    "baseline_sha256": "0e93dc96e976d2bbe5b3e42c3acc2425e9fd9c2112d694dd666659e39cbce569",
    "compact_sha256": "0e93dc96e976d2bbe5b3e42c3acc2425e9fd9c2112d694dd666659e39cbce569"
  },
  {
    "tokens": 2048,
    "logit_count": 248320,
    "byte_identical": true,
    "baseline_sha256": "3e84fdcb7c3f52028b85717c7d049a298d68ae8e635fe35ebf7eaa4474fb5bcd",
    "compact_sha256": "3e84fdcb7c3f52028b85717c7d049a298d68ae8e635fe35ebf7eaa4474fb5bcd"
  }
]
```

