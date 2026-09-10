---
type: run
id: 01m1r1d9kqx27ezca52mgdqjzq
created: 2026-09-05T05:42:07.735593+00:00
updated: 2026-09-05T05:42:07.795496+00:00
summary: Scope lifecycle and MTP checks pass; first larger-read-scope latency pilot is slower and unqualified
binary: Frozen per-experiment identities in body
captured_at: 2026-09-05
command: Exact commands in embedded manifests
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Scope generation, MTP work and latency pilot evidence
tool: Native diagnostics and paired inference harness
---
# Generator read-scope, MTP work and first latency pilot

Partial implementation of the unified plan. All optimization defaults remain off. No fixed-total-memory comparison, production adoption, larger-context support or whole-plan completion is claimed.

The first scope lifecycle helper accidentally used maxTokens=0 as a no-output limit. The API intentionally sanitizes that to the maximum allowance. With EOS disabled, the diagnostic spent time generating from its seed before reaching the scope assertions. It was terminated; its frozen source and invalid-run record are retained. V2 builds the seed by a direct bounded model pass. A reusable native diagnostic runner now verifies frozen binary/metallib/source identities, records headroom and VM state, and terminates only its own process group on a bounded timeout.

V2 passed 593 scope lifecycle assertions, including cancellation after layers 0/1/3/47, exact restored state and resumed continuation, unchanged compute schedule and one committed read scope. It passed 240 synthetic image-row/MTP assertions, including an image span crossing the seed/scope and compute boundaries and cancellation before the second draft-head tile. Those rows isolate state/splice behavior; this does not replace the real tower/server image gate. MTP first-entry reuse and remaining-output tail controls passed 112 mechanics assertions across depth 1/3, output limits 1/2/5 and independent/combined controls, with aligned draft state and stable fixture output. Full MTP parity, real serving and per-feature performance gates remain open.

The frozen long-prompt read-scope pilot used the acceptance fixture (actual measured 7,961 tokens), matching 640-slot pools, MTP off, one output token, seed 7, maximum compute chunk 4,096 and optional 20 ms sampled physical footprint in both arms. Reference compute passes were [4096,2048,1817]; the scope preserved those compute passes while sharing reads across all 7,961 tokens. It reduced expert records from 45,018 to 18,753. The only complete non-swapping pair was round 2: request time 25.079824791 s reference versus 30.723241625 s candidate (22.5% slower), with sampled physical peaks 7,507,824,240 versus 8,031,260,344 bytes. Rounds 1 and 3 are excluded as pairs because their reference cells had swap activity. Three clean pairs were required by the pilot; it did not pass. Its 256-token tile is therefore not adopted. Lower SSD traffic did not produce a latency improvement.

This is a fixed-pool mechanism experiment with explicitly reported extra transient allowances, not a matched total-memory result. Workspace C currently reports zero existing sweep-wait/sort counters because it does not populate those legacy counters; zero is unavailable instrumentation here, not a claim of no GPU waiting or row sorting. Request time, record counts and sampled footprint are measured independently. The next hypothesis is a larger bounded routed-token tile to improve grouped-GEMM utilization and GPU weight reuse; it requires a newly frozen binary, exact tests and a separate pilot.

## .build/optimization/candidate-scope-generation-v1/build-identity.json

SHA-256: `ecb34c0ec0bb93b6388b91aece55f23503526ebe281c8ec6a024f8b9eb3b41d6`

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "9736b90459e66a5b9195f298896d3a3477f3fc14ef80c454866c23b64bad2d8f",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "4de5a1098bb54748071f88485ab7be2dfdd03d09423b86d8bb076b5db7194d3d",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "9d9ab14d21e07282154a4a8c6e3da8b01d17bf463a791609cfaa8bd9b4b9d968",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "c0bff42435a8ad5c7f08ec4a64db8655d187b203d84f50185305db42b5f7ba8b",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "6201dd40c146e0937e8b4f1a576bd22b9e329f2cf00701f42ba1382a4b12bb69",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
    "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b7f4d35bd764c72de82e806d10159c496fc3acb5ffc1cf745a917ce06dd2ca68",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "fb6584aa86524ad97fb78678f508d744c1c13b0956ab24a8a9a48a1ff67d4996",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "ab7b9631edcde150e412a85669b91eccbaff14fb4fb8e61f69d269a5c87ce994",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "2bd69f2880d57a5fe94d65a61caff42aa70cb457de74e25945c71d10bd33ce7a",
  "binary_sha256": "63a4f4b7b1090c3878771735392ae7ee58f7d1dbb528a90a5ca39d736e3bfaaf",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
```

## .build/optimization/scope-generation-lifecycle-v1-invalid.json

SHA-256: `2587c9e604e043596747c267c10e5e6ba7d83567fc9fa512ac70771bdfaa0304`

```json
{
  "valid": false,
  "classification": "diagnostic harness error",
  "reason": "The seed helper set maxTokens=0, whose existing sanitized API meaning is 32768, with EOS disabled. The run was terminated during seed decode before any scope assertions. It is not runtime correctness or performance evidence.",
  "terminated_pid": 78721,
  "binary": ".build/optimization/candidate-scope-generation-v1/slotstream",
  "stack_evidence": ".build/optimization/scope-lifecycle-live-stack.txt"
}
```

## .build/optimization/scope-lifecycle-live-stack.txt

SHA-256: `c2260eca7ec88d27e475932dd7064155895632491a215e24eb89192b56a7ae29`

```text
Analysis of sampling slotstream (pid 78721) every 1 millisecond
Process:         slotstream [78721]
Path:            /Users/USER/*/slotstream
Load Address:    0x104e70000
Identifier:      slotstream
Version:         0
Code Type:       ARM64
Platform:        macOS
Parent Process:  codex [31549]
Target Type:     live task

Date/Time:       2026-09-05 00:32:44.696 -0500
Launch Time:     2026-09-05 00:25:05.574 -0500
OS Version:      macOS 26.6.2 (25G83)
Report Version:  7
Analysis Tool:   /usr/bin/sample

Physical footprint:         5.0G
Physical footprint (peak):  6.4G
Idle exit:                  untracked
----

Call graph:
    14 Thread_35070053: Main Thread   DispatchQueue_<multiple>
    + 14 start  (in dyld) + 6992  [0x185f644e4]
    +   14 main  (in slotstream) + 96  [0x105d325ec]  main.swift:1341
    +     14 protocol witness for ParsableCommand.run() in conformance OptimizationStateCheck  (in slotstream) + 52  [0x105d78178]  /<compiler-generated>:0
    +       14 OptimizationStateCheck.run()  (in slotstream) + 1128  [0x105d77330]  OptimizationCommands.swift:19
    +         14 static Diagnostics.optimizationScopeLifecycle(modelDir:)  (in slotstream) + 916  [0x105cf3c5c]  Diagnostics+Optimization.swift:124
    +           14 Generator.generate(promptIds:params:eosIds:cache:vision:shouldContinue:onToken:)  (in slotstream) + 8304  [0x105c5fd00]  Generate.swift:549
    +             14 Qwen4ExpModel.lastLogits(_:state:vision:)  (in slotstream) + 60  [0x105c8891c]  Model.swift:408
    +               8 Qwen4ExpModel.runHiddenMulti(_:state:vision:perLayerHook:computeRanges:shouldContinue:)  (in slotstream) + 6156  [0x105c8d920]  Model.swift:295
    +               ! 5 MoELayer.callAsFunction(_:)  (in slotstream) + 1704  [0x105c73a04]  Layers.swift:728
    +               ! : 5 MoELayer.cached(_:expertIds:)  (in slotstream) + 552  [0x105c77e38]  Layers.swift:824
    +               ! :   5 SlotPool.ensure(_:)  (in slotstream) + 2136  [0x105c4b828]  ExpertStore.swift:389
    +               ! :     5 ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 832  [0x105c48518]  ExpertStore.swift:121
    +               ! :       5 static OS_dispatch_queue.concurrentPerform(iterations:execute:)  (in libswiftDispatch.dylib) + 196  [0x1a0689e18]
    +               ! :         5 _swift_dispatch_apply_current  (in libswiftDispatch.dylib) + 128  [0x1a0689f3c]
    +               ! :           5 dispatch_apply  (in libdispatch.dylib) + 96  [0x186187ac8]
    +               ! :             5 _dispatch_apply_with_attr_f  (in libdispatch.dylib) + 1312  [0x186187944]
    +               ! :               4 _dispatch_apply_invoke_and_wait  (in libdispatch.dylib) + 364  [0x186188844]
    +               ! :               | 4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +               ! :               |   4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +               ! :               |     4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +               ! :               |       4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +               ! :               |         4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +               ! :               |           4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +               ! :               |             4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +               ! :               |               4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    +               ! :               1 _dispatch_apply_invoke_and_wait  (in libdispatch.dylib) + 196  [0x18618879c]
    +               ! :                 1 _dispatch_once_wait  (in libdispatch.dylib) + 60  [0x186175824]
    +               ! :                   1 _dispatch_once_wait.cold.1  (in libdispatch.dylib) + 148  [0x1861a907c]
    +               ! :                     1 _dlock_wait  (in libdispatch.dylib) + 56  [0x1861758cc]
    +               ! :                       1 __ulock_wait  (in libsystem_kernel.dylib) + 8  [0x1862edaf8]
    +               ! 3 MoELayer.callAsFunction(_:)  (in slotstream) + 1368  [0x105c738b4]  Layers.swift:717
    +               !   3 MLXArray.asArray<A>(_:)  (in slotstream) + 148  [0x105b63914]  MLXArray+Bytes.swift:128
    +               !     3 mlx_array_eval  (in slotstream) + 24  [0x104f06878]  array.cpp:350
    +               !       3 mlx::core::array::eval()  (in slotstream) + 176  [0x104f554ac]  array.cpp:157
    +               !         3 mlx::core::eval(std::vector<mlx::core::array>)  (in slotstream) + 128  [0x1059107e0]  transforms.cpp:324
    +               !           3 mlx::core::array::wait()  (in slotstream) + 84  [0x104f5539c]  array.cpp:147
    +               !             3 mlx::core::Event::wait()  (in slotstream) + 44  [0x105755950]  event.cpp:25
    +               !               3 -[IOSurfaceSharedEvent waitUntilSignaledValue:timeoutMS:]  (in IOSurface) + 72  [0x192986184]
    +               !                 3 iokit_user_client_trap  (in IOKit) + 8  [0x18a6acae0]
    +               5 Qwen4ExpModel.runHiddenMulti(_:state:vision:perLayerHook:computeRanges:shouldContinue:)  (in slotstream) + 6548  [0x105c8daa8]  Model.swift:303
    +               ! 5 eval(_:)  (in slotstream) + 72  [0x105bad460]  Transforms+Eval.swift:17
    +               !   5 mlx_eval  (in slotstream) + 140  [0x104f48eb4]  transforms.cpp:71
    +               !     4 mlx::core::eval(std::vector<mlx::core::array>)  (in slotstream) + 128  [0x1059107e0]  transforms.cpp:324
    +               !     : 4 mlx::core::array::wait()  (in slotstream) + 84  [0x104f5539c]  array.cpp:147
    +               !     :   4 mlx::core::Event::wait()  (in slotstream) + 44  [0x105755950]  event.cpp:25
    +               !     :     4 -[IOSurfaceSharedEvent waitUntilSignaledValue:timeoutMS:]  (in IOSurface) + 72  [0x192986184]
    +               !     :       4 iokit_user_client_trap  (in IOKit) + 8  [0x18a6acae0]
    +               !     1 mlx::core::eval(std::vector<mlx::core::array>)  (in slotstream) + 120  [0x1059107d8]  transforms.cpp:324
    +               !       1 mlx::core::eval_impl(std::vector<mlx::core::array>, bool)  (in slotstream) + 4120  [0x10590fb7c]  transforms.cpp:237
    +               !         1 mlx::core::gpu::eval(mlx::core::array&)  (in slotstream) + 204  [0x105753f98]  eval.cpp:43
    +               !           1 mlx::core::GatherQMM::eval_gpu(std::vector<mlx::core::array> const&, mlx::core::array&)  (in slotstream) + 220  [0x1057b1b98]  quantized.cpp:1361
    +               !             1 mlx::core::(anonymous namespace)::ensure_row_contiguous_matrix(mlx::core::array const&, mlx::core::metal::Device&, mlx::core::Stream const&)  (in slotstream) + 196  [0x1057b1a18]  quantized.cpp:79
    +               !               1 mlx::core::contiguous_copy_gpu(mlx::core::array const&, mlx::core::Stream const&)  (in slotstream) + 560  [0x105719ad8]  copy.cpp:38
    +               !                 1 mlx::core::copy_gpu(mlx::core::array const&, mlx::core::array&, mlx::core::CopyType, mlx::core::Stream const&)  (in slotstream) + 196  [0x10572e354]  copy.cpp:23
    +               !                   1 mlx::core::copy_gpu_inplace(mlx::core::array const&, mlx::core::array&, mlx::core::CopyType, mlx::core::Stream const&)  (in slotstream) + 148  [0x105719830]  copy.cpp:20
    +               !                     1 mlx::core::copy_gpu_inplace(mlx::core::array const&, mlx::core::array&, mlx::core::SmallVector<int, 10ul> const&, mlx::core::SmallVector<long long, 10ul> const&, mlx::core::SmallVector<long long, 10ul> const&, long long, long long, mlx::core::CopyType, mlx::core::Stream const&, std::optional<mlx::core::array>, std::optional<mlx::core::array>)  (in slotstream) + 3132  [0x10572f00c]  copy.cpp:163
    +               !                       1 mlx::core::metal::CommandEncoder::dispatch_threads(MTL::Size, MTL::Size)  (in slotstream) + 104  [0x10574249c]  device.cpp:315
    +               !                         1 -[AGXG17XFamilyComputeContext dispatchThreads:threadsPerThreadgroup:]  (in AGXMetalG17X) + 304  [0x116e478e8]
    +               !                           1 AGX::ComputeContext<AGX::HAL300::Encoders, AGX::HAL300::Classes, AGX::HAL300::ObjClasses, AGX::HAL300::CommandEncoding, AGX::HAL300::EncoderComputeServiceClasses>::performEnqueueKernel(eAGXDataBufferPools, unsigned long long, unsigned int, unsigned long long*)  (in AGXMetalG17X) + 1100  [0x116e41204]
    +               !                             1 AGX::ComputeContext<AGX::HAL300::Encoders, AGX::HAL300::Classes, AGX::HAL300::ObjClasses, AGX::HAL300::CommandEncoding, AGX::HAL300::EncoderComputeServiceClasses>::bindBufferResourceToCommand(unsigned int, bool)  (in AGXMetalG17X) + 316  [0x116e42f34]
    +               !                               1 IOGPUResourceListAddResource  (in IOGPU) + 48  [0x1ab9ed988]
    +               1 Qwen4ExpModel.runHiddenMulti(_:state:vision:perLayerHook:computeRanges:shouldContinue:)  (in slotstream) + 4920  [0x105c8d44c]  Model.swift:276
    +                 1 GDNLayer.callAsFunction(_:cache:)  (in slotstream) + 3952  [0x105c72b44]  Layers.swift:660
    +                   1 gatedDeltaUpdate(q:k:v:a:b:aLog:dtBias:state:mask:)  (in slotstream) + 152  [0x105c538f8]  GatedDelta.swift:320
    +                     1 computeGatedDeltaG(_:_:_:)  (in slotstream) + 148  [0x105c54c68]  GatedDelta.swift:15
    +                       1 static MLXArray.+ infix(_:_:)  (in slotstream) + 224  [0x105b79a64]
    +                         1 mlx_add  (in slotstream) + 68  [0x104f29768]  ops.cpp:28
    +                           1 mlx::core::add(mlx::core::array const&, mlx::core::array const&, std::variant<std::monostate, mlx::core::Stream, mlx::core::Device>)  (in slotstream) + 348  [0x10586c818]  ops.cpp:2687
    +                             1 mlx::core::broadcast_arrays(std::vector<mlx::core::array> const&, std::variant<std::monostate, mlx::core::Stream, mlx::core::Device>)  (in slotstream) + 180  [0x10586ea58]  ops.cpp:1546
    +                               1 mlx::core::Broadcast::output_shape(std::vector<mlx::core::array> const&)  (in slotstream) + 440  [0x1058ccf94]  primitives.cpp:862
    +                                 1 mlx::core::broadcast_shapes(mlx::core::SmallVector<int, 10ul> const&, mlx::core::SmallVector<int, 10ul> const&)  (in slotstream) + 160  [0x10591e6cc]  utils.cpp:0
    14 Thread_35070135
    + 14 thread_start  (in libsystem_pthread.dylib) + 8  [0x18632ac1c]
    +   14 _pthread_start  (in libsystem_pthread.dylib) + 136  [0x18632fc58]
    +     14 std::__thread_proxy[abi:nqe210106]<std::tuple<std::unique_ptr<std::__thread_struct>, void (mlx::core::scheduler::StreamThread::*)(), mlx::core::scheduler::StreamThread*>>(void*)  (in slotstream) + 72  [0x10590e124]  thread.h:168
    +       14 mlx::core::scheduler::StreamThread::thread_fn()  (in slotstream) + 124  [0x10590de28]  scheduler.h:41
    +         14 std::condition_variable::wait(std::unique_lock<std::mutex>&)  (in libc++.1.dylib) + 32  [0x186245858]
    +           14 _pthread_cond_wait  (in libsystem_pthread.dylib) + 980  [0x186330128]
    +             14 __psynch_cvwait  (in libsystem_kernel.dylib) + 8  [0x1862ef50c]
    14 Thread_35070136
    + 14 thread_start  (in libsystem_pthread.dylib) + 8  [0x18632ac1c]
    +   14 _pthread_start  (in libsystem_pthread.dylib) + 136  [0x18632fc58]
    +     14 std::__thread_proxy[abi:nqe210106]<std::tuple<std::unique_ptr<std::__thread_struct>, ThreadPool::start_threads(unsigned long)::'lambda'()>>(void*)  (in slotstream) + 52  [0x10584d134]  thread.h:168
    +       14 ThreadPool::start_threads(unsigned long)::'lambda'()::operator()() const  (in slotstream) + 128  [0x10584d240]  threadpool.h:121
    +         14 std::condition_variable::wait(std::unique_lock<std::mutex>&)  (in libc++.1.dylib) + 32  [0x186245858]
    +           14 _pthread_cond_wait  (in libsystem_pthread.dylib) + 980  [0x186330128]
    +             14 __psynch_cvwait  (in libsystem_kernel.dylib) + 8  [0x1862ef50c]
    14 Thread_35070137
    + 14 thread_start  (in libsystem_pthread.dylib) + 8  [0x18632ac1c]
    +   14 _pthread_start  (in libsystem_pthread.dylib) + 136  [0x18632fc58]
    +     14 std::__thread_proxy[abi:nqe210106]<std::tuple<std::unique_ptr<std::__thread_struct>, ThreadPool::start_threads(unsigned long)::'lambda'()>>(void*)  (in slotstream) + 52  [0x10584d134]  thread.h:168
    +       14 ThreadPool::start_threads(unsigned long)::'lambda'()::operator()() const  (in slotstream) + 128  [0x10584d240]  threadpool.h:121
    +         14 std::condition_variable::wait(std::unique_lock<std::mutex>&)  (in libc++.1.dylib) + 32  [0x186245858]
    +           14 _pthread_cond_wait  (in libsystem_pthread.dylib) + 980  [0x186330128]
    +             14 __psynch_cvwait  (in libsystem_kernel.dylib) + 8  [0x1862ef50c]
    14 Thread_35070138
    + 14 thread_start  (in libsystem_pthread.dylib) + 8  [0x18632ac1c]
    +   14 _pthread_start  (in libsystem_pthread.dylib) + 136  [0x18632fc58]
    +     14 std::__thread_proxy[abi:nqe210106]<std::tuple<std::unique_ptr<std::__thread_struct>, ThreadPool::start_threads(unsigned long)::'lambda'()>>(void*)  (in slotstream) + 52  [0x10584d134]  thread.h:168
    +       14 ThreadPool::start_threads(unsigned long)::'lambda'()::operator()() const  (in slotstream) + 128  [0x10584d240]  threadpool.h:121
    +         14 std::condition_variable::wait(std::unique_lock<std::mutex>&)  (in libc++.1.dylib) + 32  [0x186245858]
    +           14 _pthread_cond_wait  (in libsystem_pthread.dylib) + 980  [0x186330128]
    +             14 __psynch_cvwait  (in libsystem_kernel.dylib) + 8  [0x1862ef50c]
    14 Thread_35070139
    + 14 thread_start  (in libsystem_pthread.dylib) + 8  [0x18632ac1c]
    +   14 _pthread_start  (in libsystem_pthread.dylib) + 136  [0x18632fc58]
    +     14 std::__thread_proxy[abi:nqe210106]<std::tuple<std::unique_ptr<std::__thread_struct>, ThreadPool::start_threads(unsigned long)::'lambda'()>>(void*)  (in slotstream) + 52  [0x10584d134]  thread.h:168
    +       14 ThreadPool::start_threads(unsigned long)::'lambda'()::operator()() const  (in slotstream) + 128  [0x10584d240]  threadpool.h:121
    +         14 std::condition_variable::wait(std::unique_lock<std::mutex>&)  (in libc++.1.dylib) + 32  [0x186245858]
    +           14 _pthread_cond_wait  (in libsystem_pthread.dylib) + 980  [0x186330128]
    +             14 __psynch_cvwait  (in libsystem_kernel.dylib) + 8  [0x1862ef50c]
    14 Thread_35070140
    + 14 thread_start  (in libsystem_pthread.dylib) + 8  [0x18632ac1c]
    +   14 _pthread_start  (in libsystem_pthread.dylib) + 136  [0x18632fc58]
    +     14 std::__thread_proxy[abi:nqe210106]<std::tuple<std::unique_ptr<std::__thread_struct>, ThreadPool::start_threads(unsigned long)::'lambda'()>>(void*)  (in slotstream) + 52  [0x10584d134]  thread.h:168
    +       14 ThreadPool::start_threads(unsigned long)::'lambda'()::operator()() const  (in slotstream) + 128  [0x10584d240]  threadpool.h:121
    +         14 std::condition_variable::wait(std::unique_lock<std::mutex>&)  (in libc++.1.dylib) + 32  [0x186245858]
    +           14 _pthread_cond_wait  (in libsystem_pthread.dylib) + 980  [0x186330128]
    +             14 __psynch_cvwait  (in libsystem_kernel.dylib) + 8  [0x1862ef50c]
    14 Thread_35070141
    + 14 thread_start  (in libsystem_pthread.dylib) + 8  [0x18632ac1c]
    +   14 _pthread_start  (in libsystem_pthread.dylib) + 136  [0x18632fc58]
    +     14 std::__thread_proxy[abi:nqe210106]<std::tuple<std::unique_ptr<std::__thread_struct>, ThreadPool::start_threads(unsigned long)::'lambda'()>>(void*)  (in slotstream) + 52  [0x10584d134]  thread.h:168
    +       14 ThreadPool::start_threads(unsigned long)::'lambda'()::operator()() const  (in slotstream) + 128  [0x10584d240]  threadpool.h:121
    +         14 std::condition_variable::wait(std::unique_lock<std::mutex>&)  (in libc++.1.dylib) + 32  [0x186245858]
    +           14 _pthread_cond_wait  (in libsystem_pthread.dylib) + 980  [0x186330128]
    +             14 __psynch_cvwait  (in libsystem_kernel.dylib) + 8  [0x1862ef50c]
    14 Thread_35070142
    + 14 thread_start  (in libsystem_pthread.dylib) + 8  [0x18632ac1c]
    +   14 _pthread_start  (in libsystem_pthread.dylib) + 136  [0x18632fc58]
    +     14 std::__thread_proxy[abi:nqe210106]<std::tuple<std::unique_ptr<std::__thread_struct>, ThreadPool::start_threads(unsigned long)::'lambda'()>>(void*)  (in slotstream) + 52  [0x10584d134]  thread.h:168
    +       14 ThreadPool::start_threads(unsigned long)::'lambda'()::operator()() const  (in slotstream) + 128  [0x10584d240]  threadpool.h:121
    +         14 std::condition_variable::wait(std::unique_lock<std::mutex>&)  (in libc++.1.dylib) + 32  [0x186245858]
    +           14 _pthread_cond_wait  (in libsystem_pthread.dylib) + 980  [0x186330128]
    +             14 __psynch_cvwait  (in libsystem_kernel.dylib) + 8  [0x1862ef50c]
    14 Thread_35070143
    + 14 thread_start  (in libsystem_pthread.dylib) + 8  [0x18632ac1c]
    +   14 _pthread_start  (in libsystem_pthread.dylib) + 136  [0x18632fc58]
    +     14 std::__thread_proxy[abi:nqe210106]<std::tuple<std::unique_ptr<std::__thread_struct>, ThreadPool::start_threads(unsigned long)::'lambda'()>>(void*)  (in slotstream) + 52  [0x10584d134]  thread.h:168
    +       14 ThreadPool::start_threads(unsigned long)::'lambda'()::operator()() const  (in slotstream) + 128  [0x10584d240]  threadpool.h:121
    +         14 std::condition_variable::wait(std::unique_lock<std::mutex>&)  (in libc++.1.dylib) + 32  [0x186245858]
    +           14 _pthread_cond_wait  (in libsystem_pthread.dylib) + 980  [0x186330128]
    +             14 __psynch_cvwait  (in libsystem_kernel.dylib) + 8  [0x1862ef50c]
    14 Thread_35070149
    + 14 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   14 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     14 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    14 Thread_35070165
    + 14 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   14 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     14 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070134
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070169
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070170
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070171
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070202
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070203
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070205
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070206
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070453
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070455
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35070514
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35073288
    + 10 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   10 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     10 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    10 Thread_35076110
    + 9 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    + ! 9 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    + !   9 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    + 1 start_wqthread  (in libsystem_pthread.dylib) + 0  [0x18632ac08]
    9 Thread_35070204
    + 9 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   9 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     9 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    9 Thread_35070454
    + 8 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    + ! 8 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    + !   8 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    + 1 start_wqthread  (in libsystem_pthread.dylib) + 0  [0x18632ac08]
    8 Thread_35070459   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 8 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   8 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     8 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       8 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         8 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           8 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             8 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               8 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 8 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   8 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     8 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       8 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         8 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           8 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             8 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    8 Thread_35075443
    + 7 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    + ! 7 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    + !   7 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    + 1 start_wqthread  (in libsystem_pthread.dylib) + 0  [0x18632ac08]
    6 Thread_35070459
    + 6 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   6 _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
    +     6 __workq_kernreturn  (in libsystem_kernel.dylib) + 8  [0x1862ed9f0]
    5 Thread_35070454   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 5 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   5 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     5 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       5 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         5 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           5 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             5 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               5 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 5 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   5 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     5 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       5 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         5 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           5 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             5 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    5 Thread_35075443   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 5 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   5 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     5 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       5 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         5 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           5 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             5 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               5 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 5 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   5 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     5 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       5 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         5 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           5 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             5 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070134   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           3 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                           ! 3 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    +                           1 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 420  [0x105c489fc]  ExpertStore.swift:128
    +                             1 CheckpointIndex.fd(for:)  (in slotstream) + 56  [0x105c27fe0]  Checkpoint.swift:480
    +                               1 objc_msgSend  (in libobjc.A.dylib) + 0  [0x185ec5800]
    4 Thread_35070169   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070170   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070171   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070202   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070203   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070204   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070205   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070206   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070453   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070455   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35070514   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35073288   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    4 Thread_35076110   DispatchQueue_19: com.apple.root.user-interactive-qos  (concurrent)
    + 4 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
    +   4 _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
    +     4 _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
    +       4 _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
    +         4 <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
    +           4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +             4 _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
    +               4 _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
    +                 4 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
    +                   4 _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
    +                     4 _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
    +                       4 thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
    +                         4 partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
    +                           4 closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
    +                             4 pread  (in libsystem_kernel.dylib) + 8  [0x1862ed650]
    2 Thread_<multiple>   DispatchQueue_73: com.Metal.CommandQueueDispatch  (serial)
      2 start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
        2 _pthread_wqthread  (in libsystem_pthread.dylib) + 292  [0x18632bec0]
          2 _dispatch_workloop_worker_thread  (in libdispatch.dylib) + 720  [0x186186734]
            2 _dispatch_root_queue_drain_deferred_wlh  (in libdispatch.dylib) + 284  [0x186186e34]
              2 _dispatch_lane_invoke  (in libdispatch.dylib) + 392  [0x18617cb2c]
                2 _dispatch_lane_serial_drain  (in libdispatch.dylib) + 332  [0x18617be98]
                  2 _dispatch_source_invoke  (in libdispatch.dylib) + 844  [0x186189e84]
                    2 _dispatch_source_latch_and_call  (in libdispatch.dylib) + 392  [0x18618b1b0]
                      2 _dispatch_continuation_pop  (in libdispatch.dylib) + 596  [0x1861781c8]
                        2 _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
                          2 -[_MTLCommandQueue _submitAvailableCommandBuffers]  (in Metal) + 512  [0x1929c2710]
                            2 -[IOGPUMetalCommandQueue submitCommandBuffers:count:]  (in IOGPU) + 72  [0x1ab9d39e8]
                              2 -[IOGPUMetalCommandQueue _submitCommandBuffers:count:]  (in IOGPU) + 360  [0x1ab9d3b7c]
                                2 IOGPUCommandQueueSubmitCommandBuffers  (in IOGPU) + 184  [0x1ab9eb148]
                                  2 iokit_user_client_trap  (in IOKit) + 8  [0x18a6acae0]

Total number in stack (recursive counted multiple, when >=5):
        37       start_wqthread  (in libsystem_pthread.dylib) + 8  [0x18632ac10]
        36       _dispatch_client_callout  (in libdispatch.dylib) + 16  [0x18618d4b0]
        19       __workq_kernreturn  (in libsystem_kernel.dylib) + 0  [0x1862ed9e8]
        19       _pthread_wqthread  (in libsystem_pthread.dylib) + 368  [0x18632bf0c]
        18       _dispatch_apply_invoke3  (in libdispatch.dylib) + 336  [0x1861881a4]
        18       _dispatch_client_callout2  (in libdispatch.dylib) + 16  [0x18618d4c8]
        18       _dispatch_once_callout  (in libdispatch.dylib) + 32  [0x186176630]
        18       closure #2 in ExpertStore.readBatch(_:queueDepth:)  (in slotstream) + 492  [0x105c48a44]  ExpertStore.swift:128
        18       partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 28  [0x1a0689e84]
        18       pread  (in libsystem_kernel.dylib) + 0  [0x1862ed648]
        18       thunk for @escaping @callee_guaranteed (@unowned Int) -> ()  (in libswiftDispatch.dylib) + 32  [0x1a0689eb0]
        17       <deduplicated_symbol>  (in libdispatch.dylib) + 28  [0x1861aad6c]
        17       _dispatch_apply_invoke  (in libdispatch.dylib) + 248  [0x1861872f4]
        17       _dispatch_root_queue_drain  (in libdispatch.dylib) + 708  [0x186185adc]
        17       _dispatch_worker_thread2  (in libdispatch.dylib) + 184  [0x186186120]
        17       _pthread_wqthread  (in libsystem_pthread.dylib) + 232  [0x18632be84]
        9       __psynch_cvwait  (in libsystem_kernel.dylib) + 0  [0x1862ef504]
        9       _pthread_cond_wait  (in libsystem_pthread.dylib) + 980  [0x186330128]
        9       _pthread_start  (in libsystem_pthread.dylib) + 136  [0x18632fc58]
        9       std::condition_variable::wait(std::unique_lock<std::mutex>&)  (in libc++.1.dylib) + 32  [0x186245858]
        9       thread_start  (in libsystem_pthread.dylib) + 8  [0x18632ac1c]
        8       ThreadPool::start_threads(unsigned long)::'lambda'()::operator()() const  (in slotstream) + 128  [0x10584d240]  threadpool.h:121
        8       std::__thread_proxy[abi:nqe210106]<std::tuple<std::unique_ptr<std::__thread_struct>, ThreadPool::start_threads(unsigned long)::'lambda'()>>(void*)  (in slotstream) + 52  [0x10584d134]  thread.h:168

Sort by top of stack, same collapsed (when >= 5):
        __workq_kernreturn  (in libsystem_kernel.dylib)        187
        __psynch_cvwait  (in libsystem_kernel.dylib)        126
        pread  (in libsystem_kernel.dylib)        77
        iokit_user_client_trap  (in IOKit)        9

Binary Images:
       0x104e70000 -        0x1060d3adf +slotstream (0) <EA3C8755-37FE-3810-A0C9-D2896CD59FD4> /Users/*/slotstream
       0x116b10000 -        0x1174c81bf  com.apple.AGXMetalG17X (353.14 - 353.14) <F9CF9EC0-D72B-3515-8F7E-A99ED2303CE1> /System/Library/Extensions/AGXMetalG17X.bundle/Contents/MacOS/AGXMetalG17X
       0x185ebc000 -        0x185f0eb4b  libobjc.A.dylib (951.7) <03BD9E32-CF0A-37B0-898A-3CE8DE06D842> /usr/lib/libobjc.A.dylib
       0x185f0f000 -        0x185f43d58  libdyld.dylib (1387) <957F93B3-8805-39C7-9C51-EDD1715F550E> /usr/lib/system/libdyld.dylib
       0x185f44000 -        0x185ff74ff  dyld (1.0.0 - 1387) <74E52480-C2BD-3C8D-812D-95FE2B74A096> /usr/lib/dyld
       0x185ff8000 -        0x185ffb228  libsystem_blocks.dylib (96) <E0AC1231-27AA-3A13-8FAC-41D5802B1F3C> /usr/lib/system/libsystem_blocks.dylib
       0x185ffc000 -        0x18605055f  libxpc.dylib (3102.160.5) <33E44C2D-D65E-37A6-B85F-1A4CF524A050> /usr/lib/system/libxpc.dylib
       0x186051000 -        0x1860719ff  libsystem_trace.dylib (1861.160.4) <93F1DD8C-6CD9-32B9-B222-D23DA5D161B4> /usr/lib/system/libsystem_trace.dylib
       0x186072000 -        0x1861205f7  libcorecrypto.dylib (1922.160.10) <0642DDAD-4771-3C82-805C-E7C6701C1461> /usr/lib/system/libcorecrypto.dylib
       0x186121000 -        0x186171257  libsystem_malloc.dylib (812.160.5) <D969A907-3E43-3951-9365-8C2DB3812E9D> /usr/lib/system/libsystem_malloc.dylib
       0x186172000 -        0x1861b923f  libdispatch.dylib (1542.160.2) <B2000CD5-F580-314A-A141-E036719D854E> /usr/lib/system/libdispatch.dylib
       0x1861ba000 -        0x1861bcffb  libsystem_featureflags.dylib (103) <FEE12F9C-344B-33B3-8EDD-283580EF1C67> /usr/lib/system/libsystem_featureflags.dylib
       0x1861bd000 -        0x18623e1e7  libsystem_c.dylib (1752.160.4) <D77CEB62-AFF6-3CEC-BA9B-4F057FBE2EB5> /usr/lib/system/libsystem_c.dylib
       0x18623f000 -        0x1862cfae7  libc++.1.dylib (2100.43) <F0FD393C-15BC-3C75-A19D-897F7B225C78> /usr/lib/libc++.1.dylib
       0x1862d0000 -        0x1862ea75f  libc++abi.dylib (2100.43) <F38A9C58-22AB-3798-BBAE-8DCD9CC0CE27> /usr/lib/libc++abi.dylib
       0x1862eb000 -        0x1863282e7  libsystem_kernel.dylib (12377.161.14) <C6A4A4CB-92E6-3BAF-AAE0-E8306259209A> /usr/lib/system/libsystem_kernel.dylib
       0x186329000 -        0x186335b3b  libsystem_pthread.dylib (539.100.4) <A373F0B0-9880-326A-88B4-DD8BE4E33072> /usr/lib/system/libsystem_pthread.dylib
       0x186336000 -        0x18633e963  libsystem_platform.dylib (375.120.2) <EDB83A19-EC17-32DE-9350-6145970A85D6> /usr/lib/system/libsystem_platform.dylib
       0x18633f000 -        0x18636e6eb  libsystem_info.dylib (600) <9B5FB84B-31AD-3EA7-8F89-8C700D369DC8> /usr/lib/system/libsystem_info.dylib
       0x18636f000 -        0x1868cd5bf  com.apple.CoreFoundation (6.9 - 5026.6.7) <9B672762-7B1F-30BC-96DE-F176B372D66D> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
       0x1868ce000 -        0x186be8fbf  com.apple.LaunchServices (1141.1 - 1141.1) <01579E0C-9D85-3521-8916-4DDC990CD064> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/LaunchServices
       0x186be9000 -        0x186dd195f  com.apple.gpusw.MetalTools (1.0 - 1) <9C416BB2-0882-315C-AF23-F476E34983BC> /System/Library/PrivateFrameworks/MetalTools.framework/Versions/A/MetalTools
       0x186dd2000 -        0x1875cc4bf  libBLAS.dylib (1551.160.2) <23402175-D2CF-3B08-88D0-AFBBCF775FEF> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
       0x1875cd000 -        0x1876dc35f  com.apple.Lexicon-framework (1.0 - 195.12) <946B1484-B180-3451-A452-B54BF5A6D392> /System/Library/PrivateFrameworks/Lexicon.framework/Versions/A/Lexicon
       0x1876dd000 -        0x18784c38f  libSparse.dylib (184.160.6) <EBF55041-4C12-323B-BD40-51A0E57C0AE1> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libSparse.dylib
       0x18784d000 -        0x1878e00ff  com.apple.SystemConfiguration (1.21 - 1.21) <1479C415-3678-3968-AC77-06373490860E> /System/Library/Frameworks/SystemConfiguration.framework/Versions/A/SystemConfiguration
       0x1878e1000 -        0x18791557b  libCRFSuite.dylib (55) <1CA9048E-57DD-30F4-A3E6-FE6E97D5BF82> /usr/lib/libCRFSuite.dylib
       0x187916000 -        0x187bdda1f  libmecabra.dylib (1121.5.1) <62AED6E3-43B6-3BE8-A317-489772981700> /usr/lib/libmecabra.dylib
       0x187bde000 -        0x188bc1a9f  com.apple.Foundation (6.9 - 5026.6.7) <91DACE39-FA28-3191-818D-1FCC6A0E615A> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
       0x188bc2000 -        0x188d7183f  com.apple.LanguageModeling (1.0 - 433.6) <327536E3-A27C-38C2-A67F-D6488D04CCEE> /System/Library/PrivateFrameworks/LanguageModeling.framework/Versions/A/LanguageModeling
       0x188d72000 -        0x188e92cbf  com.apple.CoreDisplay (291.4 - 291.4) <D8E7E31A-7D3E-3742-A3EE-469C6237FAF4> /System/Library/Frameworks/CoreDisplay.framework/Versions/A/CoreDisplay
       0x188e93000 -        0x189255fdf  com.apple.audio.AudioToolboxCore (1.0 - 1556.704) <8AF1606D-5C93-3B80-BC81-60C5688628E2> /System/Library/PrivateFrameworks/AudioToolboxCore.framework/Versions/A/AudioToolboxCore
       0x189256000 -        0x18947fd9f  com.apple.CoreText (877.6.0.2 - 877.6.0.2) <B00FAD17-3AB0-343A-8CD8-F188911D898A> /System/Library/Frameworks/CoreText.framework/Versions/A/CoreText
       0x189480000 -        0x189c15e1f  com.apple.audio.CoreAudio (5.0 - 5.0) <D13AB14D-2B45-34D0-86DE-38DF75BF48E5> /System/Library/Frameworks/CoreAudio.framework/Versions/A/CoreAudio
       0x189c16000 -        0x18a03521f  com.apple.security (7.0 - 61901.160.44) <9D0387FC-E8F6-3004-9C95-CA68EA715C8B> /System/Library/Frameworks/Security.framework/Versions/A/Security
       0x18a036000 -        0x18a30bd53  libicucore.A.dylib (76142.5.2.1) <53A3E31E-06A8-325E-B5A8-316B88AA3C92> /usr/lib/libicucore.A.dylib
       0x18a30c000 -        0x18a315e5f  libsystem_darwin.dylib (1752.160.4) <8E07D22E-CE5A-38A0-B091-5B0338C326F5> /usr/lib/system/libsystem_darwin.dylib
       0x18a316000 -        0x18a60dcbf  com.apple.CoreServices.CarbonCore (1333 - 1333) <D884AF5B-23F7-313A-97ED-DD54518BA922> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/CarbonCore
       0x18a60e000 -        0x18a64df17  com.apple.CoreServicesInternal (505 - 505) <7D56DA94-31EB-35F0-B886-4010C075E035> /System/Library/PrivateFrameworks/CoreServicesInternal.framework/Versions/A/CoreServicesInternal
       0x18a64e000 -        0x18a68d1bf  com.apple.CSStore (1141.1 - 1141.1) <12479A32-B72F-3A09-BB03-BA56C37853B5> /System/Library/PrivateFrameworks/CoreServicesStore.framework/Versions/A/CoreServicesStore
       0x18a68e000 -        0x18a77625f  com.apple.framework.IOKit (2.0.2 - 100231.120.3) <12372585-DF92-33EF-B632-714FAA13260A> /System/Library/Frameworks/IOKit.framework/Versions/A/IOKit
       0x18a777000 -        0x18a7891b6  libsystem_notify.dylib (348.160.3) <15799128-6CBD-30D6-A2BB-B9D02B4470C0> /usr/lib/system/libsystem_notify.dylib
       0x18a78a000 -        0x18a7e8173  libsandbox.1.dylib (2680.160.6) <CB15E3BE-AEA6-343F-A8ED-B251AFF556E7> /usr/lib/libsandbox.1.dylib
       0x18a7e9000 -        0x18bf0c49f  com.apple.AppKit (6.9 - 2685.70.101) <B6B4BDAD-6428-3E64-8747-275700109B46> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x18bf0d000 -        0x18c0c591f  com.apple.UIFoundation (1.0 - 1019.1) <659AFBBD-E22E-3474-BCFE-298DA57B1464> /System/Library/PrivateFrameworks/UIFoundation.framework/Versions/A/UIFoundation
       0x18c0c6000 -        0x18c0dc3ff  com.apple.UniformTypeIdentifiers (709 - 709) <B57F62F5-1581-3CE6-8782-6072B970FDF2> /System/Library/Frameworks/UniformTypeIdentifiers.framework/Versions/A/UniformTypeIdentifiers
       0x18c0dd000 -        0x18c33105f  com.apple.desktopservices (26.0 - 1827.5.3) <C5AF8E88-9770-3B2B-9F79-AA5B1082A2DB> /System/Library/PrivateFrameworks/DesktopServicesPriv.framework/Versions/A/DesktopServicesPriv
       0x18c388000 -        0x18c5b865f  com.apple.CoreDuet (1.0 - 1) <838F99F9-D3FA-335B-9767-B5D04A3FACA6> /System/Library/PrivateFrameworks/CoreDuet.framework/Versions/A/CoreDuet
       0x18c5b9000 -        0x18c69195f  libboringssl.dylib (532.120.8) <5BF55637-F306-3D79-B5A1-DB8A871DAD4B> /usr/lib/libboringssl.dylib
       0x18c692000 -        0x18ca471df  com.apple.CFNetwork (1.0 - 3860.700.1) <4A3B95C5-AA2E-338C-9398-56895AF82D97> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
       0x18ca48000 -        0x18ca62f7b  libsystem_networkextension.dylib (2226.161.1) <9C7B1EEB-47BE-3791-93A9-CFC693CB9417> /usr/lib/system/libsystem_networkextension.dylib
       0x18ca63000 -        0x18ca64067  libenergytrace.dylib (23) <8E04C57D-3651-386E-83D5-4728B732F214> /usr/lib/libenergytrace.dylib
       0x18ca65000 -        0x18cae4eff  libMobileGestalt.dylib (1484.120.3) <D614ADAF-EEDD-3492-AEEB-7D03558D419C> /usr/lib/libMobileGestalt.dylib
       0x18cae5000 -        0x18cafcfdf  libsystem_asl.dylib (406) <54439739-33EE-3273-839F-CBA67D7F5CB1> /usr/lib/system/libsystem_asl.dylib
       0x18cafd000 -        0x18cb20797  com.apple.TCC (1.0 - 1) <A160698F-BE34-323D-B5BE-56D7371B1230> /System/Library/PrivateFrameworks/TCC.framework/Versions/A/TCC
       0x18cb21000 -        0x18d0d7a1f  com.apple.SkyLight (1.600.0 - 922.13.1) <0C8F41C6-6D93-3DB3-B522-CA8CFF5C3B33> /System/Library/PrivateFrameworks/SkyLight.framework/Versions/A/SkyLight
       0x18d0d8000 -        0x18d82d5ff  com.apple.CoreGraphics (2.0 - 1965.6.3) <38C8FBEC-DE88-33FE-B742-A192F22CC754> /System/Library/Frameworks/CoreGraphics.framework/Versions/A/CoreGraphics
       0x18d82e000 -        0x18d9d5b8b  com.apple.ColorSync (4.13.0 - 3813.5.1) <873404F1-CC9D-30F9-AE06-8EA58D292005> /System/Library/Frameworks/ColorSync.framework/Versions/A/ColorSync
       0x18d9d6000 -        0x18da4139f  com.apple.HIServices (1.22 - 818) <CD16C3FB-D2A0-3F68-98DC-CE67FCBFDFF2> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/HIServices.framework/Versions/A/HIServices
       0x18db3f000 -        0x18dd3345f  com.apple.Montreal (1.0 - 178) <95BA357E-906A-3183-A402-A41D486B5AB3> /System/Library/PrivateFrameworks/Montreal.framework/Versions/A/Montreal
       0x18dd34000 -        0x18de293df  com.apple.NLP (1.0 - 233) <F532F0AF-4F7A-398C-87BF-2DC3A6909D3D> /System/Library/PrivateFrameworks/NLP.framework/Versions/A/NLP
       0x18de2a000 -        0x18e217f5f  com.apple.CoreData (120 - 1526) <712AD9C1-44D2-36F4-BA8E-15038521462B> /System/Library/Frameworks/CoreData.framework/Versions/A/CoreData
       0x18e218000 -        0x18e233ddf  com.apple.ProtocolBuffer (1 - 310.26.4.23.2) <C73EE6D7-FE28-30E3-BA6A-012DC32FA22F> /System/Library/PrivateFrameworks/ProtocolBuffer.framework/Versions/A/ProtocolBuffer
       0x18e234000 -        0x18e41ca2f  libsqlite3.dylib (382) <B67E4205-32B5-3FF3-9FB5-9186C0B32A90> /usr/lib/libsqlite3.dylib
       0x18e41d000 -        0x18e4a2fff  com.apple.Accounts (113 - 113) <5F6B668E-00B2-3BEC-959F-26BD6B50D42B> /System/Library/Frameworks/Accounts.framework/Versions/A/Accounts
       0x18e4a3000 -        0x18e4b9e7f  com.apple.commonutilities (8.0 - 900) <59FFD032-1427-39F6-BC16-A6877582A243> /System/Library/PrivateFrameworks/CommonUtilities.framework/Versions/A/CommonUtilities
       0x18e4ba000 -        0x18e5ab49f  com.apple.BaseBoard (732.1.1 - 732.1.1) <959C748F-8851-3A25-BFFA-5FEA80296965> /System/Library/PrivateFrameworks/BaseBoard.framework/Versions/A/BaseBoard
       0x18e5ac000 -        0x18e617d5f  com.apple.RunningBoardServices (1.0 - 1015.160.2.0.1) <F7CC7754-0B25-302A-BFD4-5D16E9F666AD> /System/Library/PrivateFrameworks/RunningBoardServices.framework/Versions/A/RunningBoardServices
       0x18e618000 -        0x18e68bc37  com.apple.AE (944 - 944) <435D6243-695B-3543-A722-10106F5696BD> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/AE.framework/Versions/A/AE
       0x18e68c000 -        0x18e69dd87  libdns_services.dylib (2881.160.4) <88925A0C-4960-3F6D-AF3A-B1983F7B3D18> /usr/lib/libdns_services.dylib
       0x18e69e000 -        0x18e6a6387  libsystem_symptoms.dylib (2169.160.3) <229122B9-B8B1-3F2F-870E-8650AE3C4FB5> /usr/lib/system/libsystem_symptoms.dylib
       0x18e6a7000 -        0x18fec429f  com.apple.Network (1.0 - 5812.160.9) <1C7E652B-6B94-3180-93A6-EF8DBA3A5448> /System/Library/Frameworks/Network.framework/Versions/A/Network
       0x18fec5000 -        0x18fef4ddf  com.apple.analyticsd (1.0 - 1) <FAE24228-7E19-3F30-9872-3B25749ADAF8> /System/Library/PrivateFrameworks/CoreAnalytics.framework/Versions/A/CoreAnalytics
       0x18fef5000 -        0x18fef68bb  libDiagnosticMessagesClient.dylib (113) <6CD959AA-4825-306A-864A-BD69EC5F2DC0> /usr/lib/libDiagnosticMessagesClient.dylib
       0x18fef7000 -        0x18ff6337f  com.apple.spotlight.metadata.utilities (1.0 - 2418.6.3.9.400) <29AA0F7F-26F4-35B3-96DF-8A67B00A58AB> /System/Library/PrivateFrameworks/MetadataUtilities.framework/Versions/A/MetadataUtilities
       0x18ff64000 -        0x18ffefb5f  com.apple.Metadata (26.6 - 2418.6.3.9.400) <DEFC137A-C15D-35CB-AF08-E4D06B6CF8B9> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/Metadata.framework/Versions/A/Metadata
       0x18fff0000 -        0x18fff91eb  com.apple.DiskArbitration (2.7 - 2.7) <332C4B80-5B3C-34E7-AD1F-F6131E607F95> /System/Library/Frameworks/DiskArbitration.framework/Versions/A/DiskArbitration
       0x18fffa000 -        0x19041e063  com.apple.vImage (8.1 - 632.120.2) <2B16DF37-A596-3D8A-AE47-33E580EB1354> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vImage.framework/Versions/A/vImage
       0x19041f000 -        0x190834e3f  com.apple.QuartzCore (1195.17 - 1195.17) <98CB7012-30E5-3BDD-8C84-CDBDA9DB3017> /System/Library/Frameworks/QuartzCore.framework/Versions/A/QuartzCore
       0x190835000 -        0x190885cdf  libFontRegistry.dylib (408.6.0.3) <49E7449E-1385-3B53-94CC-36EFC31E98FE> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATS.framework/Versions/A/Resources/libFontRegistry.dylib
       0x190886000 -        0x190a0c83f  com.apple.coreui (2.1 - 975) <D58368A9-E06A-3514-8E77-823FCAD3161B> /System/Library/PrivateFrameworks/CoreUI.framework/Versions/A/CoreUI
       0x190a0d000 -        0x190b416ff  com.apple.ViewBridge (833 - 833) <629F6765-51B0-3BB0-9C84-BE1A5166603A> /System/Library/PrivateFrameworks/ViewBridge.framework/Versions/A/ViewBridge
       0x190b42000 -        0x190b4be7f  com.apple.PerformanceAnalysis (1.427 - 427) <74C54353-A613-35A2-857A-737BB48906F9> /System/Library/PrivateFrameworks/PerformanceAnalysis.framework/Versions/A/PerformanceAnalysis
       0x190b4c000 -        0x190b59aff  com.apple.OpenDirectory (26.6 - 666.100.1) <F53E8087-7A50-37C7-811E-3D84A07325F6> /System/Library/Frameworks/OpenDirectory.framework/Versions/A/OpenDirectory
       0x190b5a000 -        0x190b8327f  com.apple.CFOpenDirectory (26.6 - 666.100.1) <3B7FD4C1-D1D4-3DA9-B2F8-3D4094679D76> /System/Library/Frameworks/OpenDirectory.framework/Versions/A/Frameworks/CFOpenDirectory.framework/Versions/A/CFOpenDirectory
       0x190b84000 -        0x190b9091b  com.apple.CoreServices.FSEvents (1413.160.2 - 1413.160.2) <F1A7246D-30C0-345F-8138-266094EC8315> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/FSEvents.framework/Versions/A/FSEvents
       0x190b91000 -        0x190bba0df  com.apple.coreservices.SharedFileList (225 - 225) <297AC970-E432-3BBD-986C-36782634062E> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/SharedFileList.framework/Versions/A/SharedFileList
       0x190bbb000 -        0x190bbe08f  libapp_launch_measurement.dylib (17) <E992D070-4D50-3292-855F-1B0055739F5E> /usr/lib/libapp_launch_measurement.dylib
       0x190bbf000 -        0x190c079bf  com.apple.CoreAutoLayout (1.0 - 34) <54AD73AF-852E-3CD6-8B7D-E73BE79857D3> /System/Library/PrivateFrameworks/CoreAutoLayout.framework/Versions/A/CoreAutoLayout
       0x190c08000 -        0x190cee3c3  libxml2.2.dylib (39.10.3) <1E8A4F9E-3954-3458-B3BB-BE97F961C105> /usr/lib/libxml2.2.dylib
       0x190cef000 -        0x190d6fbbf  com.apple.CoreVideo (1.8 - 0.0) <0616AF41-149E-3F4A-906E-56E2642457BE> /System/Library/Frameworks/CoreVideo.framework/Versions/A/CoreVideo
       0x190d70000 -        0x190d72f5f  com.apple.loginsupport (3.0 - 264.4.2) <87907862-52FF-3F24-AC29-7C1678BCD277> /System/Library/PrivateFrameworks/login.framework/Versions/A/Frameworks/loginsupport.framework/Versions/A/loginsupport
       0x190d73000 -        0x190db041f  com.apple.aps.framework (4.0 - 4.0) <27479D70-8BF6-3D3C-B528-1BB9B1B98391> /System/Library/PrivateFrameworks/ApplePushService.framework/Versions/A/ApplePushService
       0x190db1000 -        0x190ddd65f  com.apple.UserManagement (1.0 - 1) <4A78C569-FF0D-398B-9C25-33453F0CEC40> /System/Library/PrivateFrameworks/UserManagement.framework/Versions/A/UserManagement
       0x190dde000 -        0x19120601f  com.apple.cloudkit.CloudKit (2360.120.2 - 2360.120.2) <676D50CC-8455-3267-B8E8-CA31B8EF8F91> /System/Library/Frameworks/CloudKit.framework/Versions/A/CloudKit
       0x191207000 -        0x1912db6bf  com.apple.CloudDocs (1.0 - 4479.160.12) <60516B57-C7CC-3FCE-ACB5-9E79189D4DE2> /System/Library/PrivateFrameworks/CloudDocs.framework/Versions/A/CloudDocs
       0x1912dc000 -        0x191b157df  com.apple.CoreML (1.0 - 3520.5.1) <E5B29092-BC9F-39CD-8F75-F2992B1E1D7A> /System/Library/Frameworks/CoreML.framework/Versions/A/CoreML
       0x191b16000 -        0x1926c07ff  libwebrtc.dylib (624.5.1.11.3) <BCB03518-81D5-3FCF-A2E6-FE6BCE46C6C5> /System/Library/Frameworks/WebKit.framework/Versions/A/Frameworks/WebCore.framework/Versions/A/Frameworks/libwebrtc.dylib
       0x1926c1000 -        0x19294211f  com.apple.corelocation (3077.0.4 - 3077.0.4) <9805BB7B-12C9-39F5-9070-C5B8BFCAE2AF> /System/Library/Frameworks/CoreLocation.framework/Versions/A/CoreLocation
       0x192943000 -        0x19297b5b7  libsystem_containermanager.dylib (725.160.3) <14B2A47F-19C8-392F-8FDB-FE8AE375DD41> /usr/lib/system/libsystem_containermanager.dylib
       0x19297c000 -        0x19299825f  com.apple.IOSurface (393.5.8 - 393.5.8) <5556FD64-9D47-3547-961E-3A27681F3C51> /System/Library/Frameworks/IOSurface.framework/Versions/A/IOSurface
       0x192999000 -        0x1929a305f  com.apple.IOAccelerator (487.4.3 - 487.4.3) <A0C21253-9F8C-3E9A-B9D9-02517BDAE43B> /System/Library/PrivateFrameworks/IOAccelerator.framework/Versions/A/IOAccelerator
       0x1929a4000 -        0x192c7de1f  com.apple.Metal (373.7 - 373.7) <493E76D9-74D4-333B-A3B2-E5F9BC86429D> /System/Library/Frameworks/Metal.framework/Versions/A/Metal
       0x192c7e000 -        0x192ca707f  com.apple.audio.caulk (1.0 - 214.701) <AD0B0769-76D4-3613-BAE4-DBBBE05F7E3E> /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk
       0x192ca8000 -        0x192e493ff  com.apple.CoreMedia (1.0 - 3330.13.2) <DB8BA2C9-C144-310E-AD6B-EB623FB3C7FB> /System/Library/Frameworks/CoreMedia.framework/Versions/A/CoreMedia
       0x192e4a000 -        0x19311943f  libFontParser.dylib (435.6.0.2) <9E126CE0-FBB2-3B15-953F-CCDC758E34FB> /System/Library/PrivateFrameworks/FontServices.framework/libFontParser.dylib
       0x19311a000 -        0x19341511f  com.apple.HIToolbox (2.1.1 - 1250.1) <38408482-CE3B-359E-9465-7FEB4BB79B54> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
       0x193416000 -        0x19342a5ff  com.apple.framework.DFRFoundation (1.0 - 293.1.1) <A871FDA3-D5BA-31E0-BD8C-E4A83F5E2B62> /System/Library/PrivateFrameworks/DFRFoundation.framework/Versions/A/DFRFoundation
       0x19342b000 -        0x19343035f  com.apple.dt.XCTTargetBootstrap (26.6 - 24901) <E0CFA0C8-A13D-369D-91E9-4A675C5DB5FD> /System/Library/PrivateFrameworks/XCTTargetBootstrap.framework/Versions/A/XCTTargetBootstrap
       0x193431000 -        0x19346e19f  com.apple.CoreSVG (1.0 - 341) <986D57A7-BFF1-3DAA-8EB1-17CCAA76C731> /System/Library/PrivateFrameworks/CoreSVG.framework/Versions/A/CoreSVG
       0x19346f000 -        0x1937aff1f  com.apple.ImageIO (3.3.0 - 2784.6.4) <C9CF487D-E759-3F94-ABEB-7AE5EB39AF7D> /System/Library/Frameworks/ImageIO.framework/Versions/A/ImageIO
       0x1937b0000 -        0x193c9af9f  com.apple.CoreImage (19.0.0 - 1592.120.2) <0943679D-FF88-3F18-BE4B-D8B4827AB0B5> /System/Library/Frameworks/CoreImage.framework/Versions/A/CoreImage
       0x193c9b000 -        0x193d54ddf  com.apple.MetalPerformanceShaders.MPSCore (1.0 - 1) <DBB5F038-E085-39C8-A9BF-C3B3CB3F6FD5> /System/Library/Frameworks/MetalPerformanceShaders.framework/Versions/A/Frameworks/MPSCore.framework/Versions/A/MPSCore
       0x193d55000 -        0x193d595d7  libsystem_configuration.dylib (1405.160.3) <D8D6280B-783D-3550-BDBA-2861AE40604F> /usr/lib/system/libsystem_configuration.dylib
       0x193d5a000 -        0x193d6099f  libsystem_sandbox.dylib (2680.160.6) <54688162-B50D-3D31-A1E8-7B9766D3530D> /usr/lib/system/libsystem_sandbox.dylib
       0x193d61000 -        0x193d6217f  com.apple.AggregateDictionary (1.0 - 1) <91BDD1F8-831B-3B01-86BA-6BBCB43373C4> /System/Library/PrivateFrameworks/AggregateDictionary.framework/Versions/A/AggregateDictionary
       0x193d63000 -        0x193d674d3  com.apple.AppleSystemInfo (3.1.5 - 3.1.5) <4C6139EE-BF87-37A6-B226-830A6FDC36F8> /System/Library/PrivateFrameworks/AppleSystemInfo.framework/Versions/A/AppleSystemInfo
       0x193d68000 -        0x193d6946b  liblangid.dylib (140) <D201B12C-5258-3C03-89ED-B35FBFAEFA0C> /usr/lib/liblangid.dylib
       0x193d6a000 -        0x193e8945f  com.apple.CoreNLP (1.0 - 313) <B75F1F25-3C33-3983-B546-71588C610ED5> /System/Library/PrivateFrameworks/CoreNLP.framework/Versions/A/CoreNLP
       0x193e8a000 -        0x193e9091f  com.apple.LinguisticData (1.0 - 483.10) <FDD446CF-5D67-341F-8247-DAE855305379> /System/Library/PrivateFrameworks/LinguisticData.framework/Versions/A/LinguisticData
       0x193e91000 -        0x194f1941f  libBNNS.dylib (1961.160.8) <54A103BA-7D04-32DB-B204-179E2E0290CA> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBNNS.dylib
       0x194f1a000 -        0x19505746f  libvDSP.dylib (1126.160.2) <4C851329-A9F4-3E9E-9E48-07FF4120DCF9> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvDSP.dylib
       0x195058000 -        0x19508b63f  com.apple.CoreEmoji (1.0 - 261.4.6) <47AAECAD-C28C-352E-BB86-7F292E0BFBC6> /System/Library/PrivateFrameworks/CoreEmoji.framework/Versions/A/CoreEmoji
       0x19508c000 -        0x1950c5267  com.apple.IOMobileFramebuffer (343.0.0 - 343.0.0) <2BC48182-F354-3AB0-8F18-0C60CAAFE398> /System/Library/PrivateFrameworks/IOMobileFramebuffer.framework/Versions/A/IOMobileFramebuffer
       0x1950c6000 -        0x19514819f  com.apple.framework.CoreWLAN (16.0 - 1657) <EDA738B7-55E8-328B-AA44-B121D23BB318> /System/Library/Frameworks/CoreWLAN.framework/Versions/A/CoreWLAN
       0x195149000 -        0x1952bde5f  com.apple.CoreUtils (8.3 - 830.24) <C943FF30-2340-3412-9880-5AB6FE22A95C> /System/Library/PrivateFrameworks/CoreUtils.framework/Versions/A/CoreUtils
       0x1952be000 -        0x1952d56df  com.apple.MobileKeyBag (2.0 - 1.0) <D3DECDE5-FA90-35FB-861D-8148E963D8B1> /System/Library/PrivateFrameworks/MobileKeyBag.framework/Versions/A/MobileKeyBag
       0x1952d6000 -        0x1952e40ff  com.apple.AssertionServices (1.0 - 1015.160.2.0.1) <1946F8FE-0ABC-3F8F-9116-5451ECABD14C> /System/Library/PrivateFrameworks/AssertionServices.framework/Versions/A/AssertionServices
       0x1952e5000 -        0x195377a9f  com.apple.securityfoundation (6.0 - 55293) <9A86DB3F-CC62-3E89-B872-35D04CFFBE42> /System/Library/Frameworks/SecurityFoundation.framework/Versions/A/SecurityFoundation
       0x195378000 -        0x1953a92ff  com.apple.coreservices.BackgroundTaskManagement (1.0 - 104) <A2F5EE78-A281-35AF-8EA6-5BC6567F2ECC> /System/Library/PrivateFrameworks/BackgroundTaskManagement.framework/Versions/A/BackgroundTaskManagement
       0x1953aa000 -        0x1953b46ff  com.apple.xpc.ServiceManagement (1.0 - 1) <5F356BA6-47B5-382B-B54A-1550BB138A62> /System/Library/Frameworks/ServiceManagement.framework/Versions/A/ServiceManagement
       0x1953b5000 -        0x1953b81fb  libquarantine.dylib (196.160.2) <EEE5AADB-52E1-3C4C-881A-70405770B1F1> /usr/lib/system/libquarantine.dylib
       0x1953b9000 -        0x1953c42bf  libCheckFix.dylib (33) <6508C698-D587-3B5A-B95B-A3A3F78CE122> /usr/lib/libCheckFix.dylib
       0x1953c5000 -        0x1953dc7ab  libcoretls.dylib (187.100.3) <0EAB1F4A-9275-3FED-8EA6-E962ACDDEE5D> /usr/lib/libcoretls.dylib
       0x1953dd000 -        0x1953ee273  libbsm.0.dylib (90) <633BCB5F-F063-3D5A-B52A-F72AE236824B> /usr/lib/libbsm.0.dylib
       0x1953ef000 -        0x19544dc6b  libmecab.dylib (1121.5.1) <C02D85F6-947A-3B3E-8AE9-7BC8D0F35204> /usr/lib/libmecab.dylib
       0x19544e000 -        0x19545041b  libgermantok.dylib (31) <74E55DD6-720D-39E4-897E-EB4328E1946D> /usr/lib/libgermantok.dylib
       0x195451000 -        0x195464e3f  libLinearAlgebra.dylib (1551.160.2) <407BCF3E-A91F-3A7F-8B8C-DBB8E807990F> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libLinearAlgebra.dylib
       0x195465000 -        0x1956bb17f  com.apple.MetalPerformanceShaders.MPSNeuralNetwork (1.0 - 1) <199F6401-91D0-36E9-9EA9-D4B44ED1CE3A> /System/Library/Frameworks/MetalPerformanceShaders.framework/Versions/A/Frameworks/MPSNeuralNetwork.framework/Versions/A/MPSNeuralNetwork
       0x1956bc000 -        0x19571019f  com.apple.MetalPerformanceShaders.MPSRayIntersector (1.0 - 1) <2E7E2722-3821-3DBF-B25A-6EA45D1A8FD4> /System/Library/Frameworks/MetalPerformanceShaders.framework/Versions/A/Frameworks/MPSRayIntersector.framework/Versions/A/MPSRayIntersector
       0x195711000 -        0x1958a3edf  com.apple.MLCompute (1.0 - 1) <E118164B-A0A2-3001-9E0A-36B2BB5FE6F2> /System/Library/Frameworks/MLCompute.framework/Versions/A/MLCompute
       0x1958a4000 -        0x1958d557f  com.apple.MetalPerformanceShaders.MPSMatrix (1.0 - 1) <4D134FE3-50EE-39D5-9699-04B4B673DD35> /System/Library/Frameworks/MetalPerformanceShaders.framework/Versions/A/Frameworks/MPSMatrix.framework/Versions/A/MPSMatrix
       0x1958d6000 -        0x195aa5cdf  com.apple.MetalPerformanceShaders.MPSNDArray (1.0 - 1) <3E1FE9EA-34A2-3545-B639-48B1FE1FD3D4> /System/Library/Frameworks/MetalPerformanceShaders.framework/Versions/A/Frameworks/MPSNDArray.framework/Versions/A/MPSNDArray
       0x195aa6000 -        0x195b3a1df  com.apple.MetalPerformanceShaders.MPSImage (1.0 - 1) <A0BE8307-7ECF-3AB8-B382-3E4059C85778> /System/Library/Frameworks/MetalPerformanceShaders.framework/Versions/A/Frameworks/MPSImage.framework/Versions/A/MPSImage
       0x195b3b000 -        0x195b464c3  com.apple.AppleFSCompression (174.160.2 - 1.0) <DA611209-7AA6-37C4-B4EC-7B7A7020A607> /System/Library/PrivateFrameworks/AppleFSCompression.framework/Versions/A/AppleFSCompression
       0x195b47000 -        0x195b530a3  libbz2.1.0.dylib (49) <5FFE1FFA-6BD0-32AF-A815-7543731CA763> /usr/lib/libbz2.1.0.dylib
       0x195b54000 -        0x195b5ad03  libsystem_coreservices.dylib (191.5.1) <D4ACD2AC-5702-3C45-85A0-300B2C2D19E1> /usr/lib/system/libsystem_coreservices.dylib
       0x195b5b000 -        0x195b8cadf  com.apple.CoreServices.OSServices (1141.1 - 1141.1) <61677289-93B7-382F-86CA-B856361D293F> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/OSServices.framework/Versions/A/OSServices
       0x195b8d000 -        0x195f1753f  com.apple.AuthKit (1.0 - 1) <336E2CAC-84D2-34DC-8AE3-7FE688C609EA> /System/Library/PrivateFrameworks/AuthKit.framework/Versions/A/AuthKit
       0x195f18000 -        0x195f686ff  com.apple.UserNotifications (1.0 - 640.6.5) <7F1A25E4-ED0A-3502-AABA-26EDB4A0D2A7> /System/Library/Frameworks/UserNotifications.framework/Versions/A/UserNotifications
       0x195f69000 -        0x1960d36bf  com.apple.CoreSpotlight (1.0 - 2418.6.3.9.400) <BC9B6D58-21EC-3057-BAE7-7A1E65F7955F> /System/Library/Frameworks/CoreSpotlight.framework/Versions/A/CoreSpotlight
       0x1960d4000 -        0x1960e2d97  libz.1.dylib (100.120.1) <13EDE3A5-A7D9-3FB8-B0C2-2FB7F7272B34> /usr/lib/libz.1.dylib
       0x1960e3000 -        0x196120a77  libsystem_m.dylib (3312.100.1) <B54FBE99-DB0B-32C7-ABDD-C2206DF606A4> /usr/lib/system/libsystem_m.dylib
       0x196121000 -        0x196121c9b  libcharset.1.dylib (115.120.2) <1940124C-0D73-35D2-9D94-A75F116088A0> /usr/lib/libcharset.1.dylib
       0x196122000 -        0x196125527  libmacho.dylib (1387) <949131E5-BDA2-39BA-AA50-62651BB51802> /usr/lib/system/libmacho.dylib
       0x196126000 -        0x19613edc3  libkxld.dylib (12377.161.14) <A3E386E1-042A-33E3-9121-78457115AAD9> /usr/lib/system/libkxld.dylib
       0x19613f000 -        0x19614c3a7  libcommonCrypto.dylib (600035) <3B110564-5278-3CB0-85F1-2CE8431FF935> /usr/lib/system/libcommonCrypto.dylib
       0x19614d000 -        0x196156ca3  libunwind.dylib (2100.2) <05FD0014-55B1-3B8A-A6BA-6C7A389C4123> /usr/lib/system/libunwind.dylib
       0x196157000 -        0x19615e349  liboah.dylib (367.9) <0C7397C6-D747-31F2-8BC1-4096213BDE5C> /usr/lib/liboah.dylib
       0x19615f000 -        0x196169bef  libcopyfile.dylib (240.160.2.0.1) <D0009B8A-8ECC-3D56-9206-7E1839707F93> /usr/lib/system/libcopyfile.dylib
       0x19616a000 -        0x19616d987  libcompiler_rt.dylib (103.3) <6FB345CA-7F5C-3263-A23F-143F7539FD8A> /usr/lib/system/libcompiler_rt.dylib
       0x19616e000 -        0x19617278b  libsystem_collections.dylib (1752.160.4) <C8160BD2-5941-3DC0-BB40-F8C2B8156EC4> /usr/lib/system/libsystem_collections.dylib
       0x196173000 -        0x1961764cf  libsystem_secinit.dylib (168.100.7) <ECABC024-8F02-374A-BB7E-29437CEA2ABD> /usr/lib/system/libsystem_secinit.dylib
       0x196177000 -        0x196179bf7  libremovefile.dylib (85.100.6) <7460B5AE-469A-36A0-A7EC-6C7D69628E86> /usr/lib/system/libremovefile.dylib
       0x19617a000 -        0x19617af27  libkeymgr.dylib (31) <7E863FCA-F3FF-32C7-8A8C-F983E946AFC3> /usr/lib/system/libkeymgr.dylib
       0x19617b000 -        0x196183e37  libsystem_dnssd.dylib (2881.160.4) <305F4398-E688-3384-B351-02D865EC8A04> /usr/lib/system/libsystem_dnssd.dylib
       0x196184000 -        0x19618909b  libcache.dylib (95) <9CD7B1E1-3E47-339C-A193-2392E3E0ED23> /usr/lib/system/libcache.dylib
       0x19618a000 -        0x19618bce3  libSystem.B.dylib (1356) <4FED5EE2-5D3E-35B1-A170-9859C4B683BB> /usr/lib/libSystem.B.dylib
       0x19618c000 -        0x19618dfcf  libfakelink.dylib (5) <820D290D-51A0-3064-A1F2-4F0AAF7E6BF4> /usr/lib/libfakelink.dylib
       0x19618e000 -        0x19618ea33  com.apple.SoftLinking (1.0 - 71) <4109E8DD-0A81-310C-B1B3-23B87186D0D8> /System/Library/PrivateFrameworks/SoftLinking.framework/Versions/A/SoftLinking
       0x1961c4000 -        0x1961cb2bb  libiconv.2.dylib (115.120.2) <4646F780-1D5E-3EE7-B00A-64619293CC18> /usr/lib/libiconv.2.dylib
       0x1961cc000 -        0x1961de457  libcmph.dylib (9) <A9892C55-670F-3429-934B-DDE91E07976D> /usr/lib/libcmph.dylib
       0x1961df000 -        0x1962d6f3f  libarchive.2.dylib (167.160.4) <0048DB96-1737-3FC5-AF0C-AF784FA24A03> /usr/lib/libarchive.2.dylib
       0x1962d7000 -        0x19633c85b  com.apple.SearchKit (1.4.2 - 1.4.2) <B352D2B5-7115-3FF6-8805-7B49151BF5A2> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/SearchKit.framework/Versions/A/SearchKit
       0x19633d000 -        0x19634518f  libThaiTokenizer.dylib (28) <92FAD15C-EEA5-34E9-B309-75A1CD1B620B> /usr/lib/libThaiTokenizer.dylib
       0x196346000 -        0x196369f37  com.apple.applesauce (1.0 - 17.7) <B739BAFB-BA9A-3F08-A480-EA4D41808899> /System/Library/PrivateFrameworks/AppleSauce.framework/Versions/A/AppleSauce
       0x19636a000 -        0x1963824ab  libapple_nghttp2.dylib (37.120.3) <C3B4633A-F17D-3054-95C0-5A21B916A1B3> /usr/lib/libapple_nghttp2.dylib
       0x196383000 -        0x19642c38f  libSparseBLAS.dylib (184.160.6) <669ABE12-838F-3F14-8456-D60DE5DF8EB8> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libSparseBLAS.dylib
       0x19642d000 -        0x19642e63f  com.apple.MetalPerformanceShaders.MetalPerformanceShaders (1.0 - 1) <D5C759F9-A533-3E0B-8916-07CA63760A80> /System/Library/Frameworks/MetalPerformanceShaders.framework/Versions/A/MetalPerformanceShaders
       0x19642f000 -        0x196434ff7  libpam.2.dylib (35) <7E84FD3B-E90E-317E-AC19-17B70AC809E5> /usr/lib/libpam.2.dylib
       0x196435000 -        0x196509d97  libcompression.dylib (193.120.2) <BAEEB84F-03FE-3B78-8799-316258DF893E> /usr/lib/libcompression.dylib
       0x19650a000 -        0x19650e267  libQuadrature.dylib (8) <C99B83FD-C865-36F7-B4D2-34018D34AF5D> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libQuadrature.dylib
       0x19650f000 -        0x1976df94f  libLAPACK.dylib (1551.160.2) <5015CD96-C046-364D-AAE3-1F439044468B> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libLAPACK.dylib
       0x1976e0000 -        0x1977364ff  com.apple.DictionaryServices (1.2 - 382.0.1) <6A26D479-5926-330B-9FB8-9B7A6BE8E239> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/DictionaryServices.framework/Versions/A/DictionaryServices
       0x197737000 -        0x1977554f7  liblzma.5.dylib (21) <A758BC2B-EB48-3590-9B22-C2E0FAC3521E> /usr/lib/liblzma.5.dylib
       0x197756000 -        0x19775785f  libcoretls_cfhelpers.dylib (187.100.3) <6937D729-7EF4-3972-9E12-694C17C1C1AB> /usr/lib/libcoretls_cfhelpers.dylib
       0x197758000 -        0x1977cb85f  com.apple.APFS (2811.160.7 - 2811.160.7) <E7595D59-4FA7-3A8E-9E9A-D1B22225B571> /System/Library/PrivateFrameworks/APFS.framework/Versions/A/APFS
       0x1977cc000 -        0x1977da833  libxar.1.dylib (503.160.5) <B48CA8E1-C7EF-38BF-B8C0-91355EE685DC> /usr/lib/libxar.1.dylib
       0x1977db000 -        0x1977de79b  libutil.dylib (73) <D4EB86A9-2784-3D15-A72E-29832C211348> /usr/lib/libutil.dylib
       0x1977df000 -        0x197809cbf  libxslt.1.dylib (21.13.2) <6C426EA5-7F1E-333E-BB5D-74465EFED12B> /usr/lib/libxslt.1.dylib
       0x19780a000 -        0x197811127  libChineseTokenizer.dylib (44) <DA303C17-5763-3D5E-9194-454651C4D20A> /usr/lib/libChineseTokenizer.dylib
       0x197812000 -        0x19788b587  libvMisc.dylib (1126.160.2) <F6878ABB-05CB-3A50-964F-4D772670BAEB> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib
       0x19788c000 -        0x19791b45f  libate.dylib (3.0.9) <01AAD3B4-D6BA-36D9-BA6F-D494D2AC161D> /usr/lib/libate.dylib
       0x19791c000 -        0x197924923  libIOReport.dylib (107) <9E06CB59-0638-3C9F-B202-264E739433AC> /usr/lib/libIOReport.dylib
       0x197925000 -        0x1979381bf  com.apple.CrashReporterSupport (10.13 - 15140) <F963C33F-6026-336E-AE74-2ABA6F2322EF> /System/Library/PrivateFrameworks/CrashReporterSupport.framework/Versions/A/CrashReporterSupport
       0x197939000 -        0x197959b5f  com.apple.AppSSOCore (1.0 - 483.160.10) <5198BFE1-41D2-33D5-A9E0-C63F81A512D3> /System/Library/PrivateFrameworks/AppSSOCore.framework/Versions/A/AppSSOCore
       0x19795a000 -        0x197a5783f  com.apple.CVNLP (1.0 - 119) <A8951A2F-E828-3264-A133-B25B21C0ABE8> /System/Library/PrivateFrameworks/CVNLP.framework/Versions/A/CVNLP
       0x197a58000 -        0x197a7be3f  com.apple.SharedWebCredentials (1001 - 1036.2) <3E9C730E-B6A8-3FDD-9458-95760E1CB389> /System/Library/PrivateFrameworks/SharedWebCredentials.framework/Versions/A/SharedWebCredentials
       0x197a7c000 -        0x197abcf9f  com.apple.pluginkit.framework (1.0 - 1) <F362C1C4-8E0B-37E3-943D-D3D2C7A6DD63> /System/Library/PrivateFrameworks/PlugInKit.framework/Versions/A/PlugInKit
       0x197abd000 -        0x197ac44e3  libMatch.1.dylib (49.161.1) <2F2EF0D7-2FE4-3A5A-8E4C-E1571C8D0C10> /usr/lib/libMatch.1.dylib
       0x197ac5000 -        0x197b3299f  libCoreStorage.dylib (568) <650E155C-1FE3-36ED-8D84-157D380F7F95> /usr/lib/libCoreStorage.dylib
       0x197b33000 -        0x197b7b9ff  com.apple.AppleVAFramework (6.2.10 - 6.2.10) <7CF84496-675C-3241-B0EF-E83C95F188FA> /System/Library/PrivateFrameworks/AppleVA.framework/Versions/A/AppleVA
       0x197b7c000 -        0x197b96ccf  libexpat.1.dylib (47) <FA9B7355-899F-371F-9293-21A94BAE956F> /usr/lib/libexpat.1.dylib
       0x197b97000 -        0x197ba0bf3  libheimdal-asn1.dylib (710.160.4) <6A4A85F4-3D12-3C4C-85EC-D53D61379F28> /usr/lib/libheimdal-asn1.dylib
       0x197ba1000 -        0x197c0161f  com.apple.IconFoundation (494 - 494) <D9A3172C-CA6C-3CFB-BEA7-249650B5B009> /System/Library/PrivateFrameworks/IconFoundation.framework/Versions/A/IconFoundation
       0x197c02000 -        0x197cc0c1f  com.apple.IconServices (494 - 494) <10C63D59-07BC-3518-87A0-83CAC48D8A70> /System/Library/PrivateFrameworks/IconServices.framework/Versions/A/IconServices
       0x197cc1000 -        0x197d82edf  com.apple.MediaExperience (1.0 - 1) <52A7AD42-9DE0-393B-A6FB-A7CB6FF8F3A5> /System/Library/PrivateFrameworks/MediaExperience.framework/Versions/A/MediaExperience
       0x197d83000 -        0x197daf0bf  com.apple.persistentconnection (1.0 - 1.0) <E4DBF767-1630-3885-8C7B-C8F131BEDDDD> /System/Library/PrivateFrameworks/PersistentConnection.framework/Versions/A/PersistentConnection
       0x197db0000 -        0x197dbf7ff  com.apple.GraphVisualizer (1.0 - 307) <77D85BA0-FE1C-3B5A-92DB-70A30202C990> /System/Library/PrivateFrameworks/GraphVisualizer.framework/Versions/A/GraphVisualizer
       0x197dc0000 -        0x197dff51f  com.apple.OTSVG (1.0 - 877.6.0.2) <5D3E7FFF-AC8E-3D6F-8E99-B199E593D270> /System/Library/PrivateFrameworks/OTSVG.framework/Versions/A/OTSVG
       0x197e00000 -        0x197e0cc7f  com.apple.xpc.AppServerSupport (1.0 - 3102.160.5) <2B5FB7B0-844C-3D84-9EFD-020B285B0F8D> /System/Library/PrivateFrameworks/AppServerSupport.framework/Versions/A/AppServerSupport
       0x197e0d000 -        0x197e13abf  libspindump.dylib (419.11) <04DC06C1-2BFA-3FEE-9429-A33E41721A3E> /usr/lib/libspindump.dylib
       0x197e14000 -        0x197ed4e9f  com.apple.Heimdal (4.0 - 2.0) <B1BA9495-0199-3630-8C92-45D4E5EE944F> /System/Library/PrivateFrameworks/Heimdal.framework/Versions/A/Heimdal
       0x197ed5000 -        0x197ef879f  com.apple.login (3.0 - 3.0) <1A57F98C-8E7D-3F75-9CF1-748B00B949E5> /System/Library/PrivateFrameworks/login.framework/Versions/A/login
       0x197ef9000 -        0x198079cbf  com.apple.corebrightness (1.0 - 1) <1F873909-B3B8-3D55-9673-9AFA86BB085B> /System/Library/PrivateFrameworks/CoreBrightness.framework/Versions/A/CoreBrightness
       0x198126000 -        0x198127207  libodfde.dylib (26) <36868773-014E-3EC4-8B61-4B6132D3DCD9> /usr/lib/libodfde.dylib
       0x198128000 -        0x1981a2643  com.apple.bom (14.0 - 277) <63F598E2-AF8A-3F29-BE11-3F14DB377A5B> /System/Library/PrivateFrameworks/Bom.framework/Versions/A/Bom
       0x1981a3000 -        0x1981e76ef  com.apple.AppleJPEG (1.0 - 1) <7F00413A-4D40-3DBF-8FD5-859B23E6DC03> /System/Library/PrivateFrameworks/AppleJPEG.framework/Versions/A/AppleJPEG
       0x1981e8000 -        0x1983a892f  libJP2.dylib (2784.6.6) <7304F8B3-8E0F-3813-BFAF-9A565CEA0A11> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libJP2.dylib
       0x1983a9000 -        0x1983aae1f  com.apple.WatchdogClient.framework (1.0 - 333) <A062966A-1DD7-3BC4-83DB-42E820054727> /System/Library/PrivateFrameworks/WatchdogClient.framework/Versions/A/WatchdogClient
       0x1983ab000 -        0x1983f0d7f  com.apple.MultitouchSupport.framework (9460.1 - 9460.1) <57F7BB9C-649D-3360-AA86-A502815D77FA> /System/Library/PrivateFrameworks/MultitouchSupport.framework/Versions/A/MultitouchSupport
       0x1983f1000 -        0x19894737f  com.apple.VideoToolbox (1.0 - 3330.13.2) <C287CF1D-67F4-3798-99A3-221052B70A22> /System/Library/Frameworks/VideoToolbox.framework/Versions/A/VideoToolbox
       0x198948000 -        0x19896d20f  libAudioToolboxUtility.dylib (1556.704) <75F77FEC-BE14-3C97-93DA-403C3B529D3B> /usr/lib/libAudioToolboxUtility.dylib
       0x19896e000 -        0x19899801f  libPng.dylib (2784.6.6) <C880ABD1-01CC-39F9-9144-E5DE22D0595F> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libPng.dylib
       0x198999000 -        0x1989f9b63  libTIFF.dylib (2784.6.6) <CA3AB1CA-DC97-328C-83E8-7CD89BC7FFBE> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libTIFF.dylib
       0x1989fa000 -        0x198a19257  com.apple.IOPresentment (67 - 67) <BD01EBB2-341A-38E7-89D5-450025B67415> /System/Library/PrivateFrameworks/IOPresentment.framework/Versions/A/IOPresentment
       0x198a1a000 -        0x198a1e7d3  com.apple.GPUWrangler (8.1.12 - 8.1.12) <C1AB9351-81C2-3B9F-B237-D8560B16A134> /System/Library/PrivateFrameworks/GPUWrangler.framework/Versions/A/GPUWrangler
       0x198a1f000 -        0x198a21913  libRadiance.dylib (2784.6.6) <CA79D637-1D80-3C62-8820-EE4CE6961A5A> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libRadiance.dylib
       0x198a22000 -        0x198a272f3  com.apple.DSExternalDisplay (3.1 - 380) <CFE441E7-0BAC-3894-862D-9F914D9E6D40> /System/Library/PrivateFrameworks/DSExternalDisplay.framework/Versions/A/DSExternalDisplay
       0x198a28000 -        0x198a52baf  libJPEG.dylib (2784.6.6) <8EA6CA42-AA01-3C0F-9672-4917481BAAAE> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libJPEG.dylib
       0x198a53000 -        0x198a8057f  com.apple.ATSUI (1.0 - 1) <2186F196-EE17-3A59-B9DA-D6823BEDD35B> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATSUI.framework/Versions/A/ATSUI
       0x198a81000 -        0x198a869fb  libGIF.dylib (2784.6.6) <A4885DA3-9B44-3026-89DF-8161510F2F5C> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libGIF.dylib
       0x198a87000 -        0x198a9719f  com.apple.CMCaptureCore (1.0 - 665.140.6) <E35A60EE-A0A9-36CA-824C-0DC01FDD6658> /System/Library/PrivateFrameworks/CMCaptureCore.framework/Versions/A/CMCaptureCore
       0x198a98000 -        0x198b0a71f  com.apple.print.framework.PrintCore (19 - 601.3) <AABA23CA-86DB-312C-BAED-86C43B896705> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/PrintCore
       0x198b0b000 -        0x198ba191f  com.apple.TextureIO (3.10.12 - 3.10.12) <D4BD9DCA-1C71-353D-8DAC-13ED5065D77F> /System/Library/PrivateFrameworks/TextureIO.framework/Versions/A/TextureIO
       0x198ba2000 -        0x198eabf9f  com.apple.InternationalSupport (1.0 - 74) <5ACC6C0E-51E9-3B5A-B24F-89B22D070878> /System/Library/PrivateFrameworks/InternationalSupport.framework/Versions/A/InternationalSupport
       0x198eac000 -        0x198efdd1f  com.apple.datadetectorscore (8.0 - 821.7) <C540CDD1-CE60-3EC9-998B-20E0A21A52A6> /System/Library/PrivateFrameworks/DataDetectorsCore.framework/Versions/A/DataDetectorsCore
       0x198efe000 -        0x198f6e8df  com.apple.UserActivity (551 - 551) <0D6F3043-5372-3B15-96BC-6F45AD86F410> /System/Library/PrivateFrameworks/UserActivity.framework/Versions/A/UserActivity
       0x198f6f000 -        0x199a0fe7f  com.apple.MediaToolbox (1.0 - 3330.13.2) <B4C2E4EA-D4F8-3676-AD09-004A44391002> /System/Library/Frameworks/MediaToolbox.framework/Versions/A/MediaToolbox
       0x199a10000 -        0x199a7e86f  libusrtcp.dylib (5812.160.9) <D2F997AA-2E08-3035-9D11-B2DF5D1552E9> /usr/lib/libusrtcp.dylib
       0x199a7f000 -        0x19a0217ff  libswiftCore.dylib (6.3.2 - 6.3.2.1.11) <83794FB3-DE9B-3D23-AB5E-2C1D5D30F134> /usr/lib/swift/libswiftCore.dylib
       0x19a022000 -        0x19a09ac9f  com.apple.imfoundation (10.0 - 1000) <41E45E0C-2E88-3605-B213-F7CD760A9FF4> /System/Library/PrivateFrameworks/IMFoundation.framework/Versions/A/IMFoundation
       0x19a09b000 -        0x19a0d401f  com.apple.locationsupport (3077.0.4 - 3077.0.4) <AE40B558-7C76-3410-A632-84E1B02DF891> /System/Library/PrivateFrameworks/LocationSupport.framework/Versions/A/LocationSupport
       0x19a0d5000 -        0x19a12a31f  libSessionUtility.dylib (398.701) <1A63E9E1-2D64-3AF4-9CCD-6EF042397F84> /System/Library/PrivateFrameworks/AudioSession.framework/libSessionUtility.dylib
       0x19a12b000 -        0x19a30005f  com.apple.audio.toolbox.AudioToolbox (1.14 - 1.14) <E8618176-515C-39A6-9F9C-3887A723C463> /System/Library/Frameworks/AudioToolbox.framework/Versions/A/AudioToolbox
       0x19a301000 -        0x19a381b7f  com.apple.audio.AudioSession (1.0 - 398.701) <DC26AFB1-EFAD-3BB8-9446-0FB18DDFE476> /System/Library/PrivateFrameworks/AudioSession.framework/Versions/A/AudioSession
       0x19a382000 -        0x19a39b39f  libAudioStatistics.dylib (262.601) <3FF99846-E48C-3C9A-814C-35B45E5F60EC> /usr/lib/libAudioStatistics.dylib
       0x19a39c000 -        0x19a3c993f  com.apple.speech.synthesis.framework (9.2.22 - 9.2.22) <9CDA611B-254A-3779-9356-369485134C2D> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/SpeechSynthesis.framework/Versions/A/SpeechSynthesis
       0x19a3ca000 -        0x19a417e5f  com.apple.ApplicationServices.ATS (377 - 593.6.0.3) <BBC091EE-D42B-32AC-8B00-E7BDDF033D7B> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATS.framework/Versions/A/ATS
       0x19a418000 -        0x19a43419b  libresolv.9.dylib (96) <4AB71911-9300-30D4-88CF-D20EFD75ACE6> /usr/lib/libresolv.9.dylib
       0x19a435000 -        0x19a4477e7  libsasl2.2.dylib (215) <7CF2A32E-72DD-34F7-B179-A17ED3D7DD75> /usr/lib/libsasl2.2.dylib
       0x19a448000 -        0x19a45487f  com.apple.multiverse (1.0 - 117) <21723046-939E-302F-883C-9DB417452E3A> /System/Library/PrivateFrameworks/MultiverseSupport.framework/Versions/A/MultiverseSupport
       0x19a455000 -        0x19a4bc767  libParallelCompression.dylib (450.160.2) <BA8350F0-D484-3F47-8DB5-98AE258D91CB> /usr/lib/libParallelCompression.dylib
       0x19a4bd000 -        0x19a4f675f  com.apple.securityinterface (10.0 - 55210.100.6) <D6FDA45D-779E-3F62-BD90-534353A1359C> /System/Library/Frameworks/SecurityInterface.framework/Versions/A/SecurityInterface
       0x19a4f7000 -        0x19a52c9df  com.apple.CoreFollowUp-OSX (1.0 - 281.5.2) <2E3A1FC1-80A1-3ED3-A157-5626AD72A640> /System/Library/PrivateFrameworks/CoreFollowUp.framework/Versions/A/CoreFollowUp
       0x19a52d000 -        0x19a62f87f  com.apple.CoreMediaIO (1000.0 - 5617.100.5) <1035C1AB-5058-3AFA-8D77-514901516251> /System/Library/Frameworks/CoreMediaIO.framework/Versions/A/CoreMediaIO
       0x19a630000 -        0x19a710337  libSMC.dylib (38) <655F6374-6CE8-3D0E-994E-4D7C37F78E89> /usr/lib/libSMC.dylib
       0x19a711000 -        0x19a76fc9f  libcups.2.dylib (522.8) <6A5A8E21-A9E6-32A2-9BDB-8013F002AEF8> /usr/lib/libcups.2.dylib
       0x19a770000 -        0x19a77d257  com.apple.NetAuth (6.2 - 6.2) <024DBF34-DF66-3164-825E-F77F85462E66> /System/Library/PrivateFrameworks/NetAuth.framework/Versions/A/NetAuth
       0x19a77e000 -        0x19a782dcb  com.apple.ColorSyncLegacy (4.13.0 - 1) <B4FC52C5-BB0F-3604-B00E-16F24907EB8F> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ColorSyncLegacy.framework/Versions/A/ColorSyncLegacy
       0x19a783000 -        0x19a78bdef  com.apple.QD (4.0 - 451) <59BBF27B-1D89-3D35-9210-8386EFA15A8D> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/QD.framework/Versions/A/QD
       0x19a78c000 -        0x19a799b1f  com.apple.perfdata (1.0 - 130) <D3AAB65F-8C3C-399C-927F-20DC2DD769F2> /System/Library/PrivateFrameworks/perfdata.framework/Versions/A/perfdata
       0x19a79a000 -        0x19a7a7c9f  libperfcheck.dylib (46) <912BFF10-FB8F-3D52-9941-ACDCE1CAE36A> /usr/lib/libperfcheck.dylib
       0x19a7a8000 -        0x19a7b9187  com.apple.Kerberos (3.0 - 1) <D4CB91E4-2ACB-332D-8FA0-8154F7B48D20> /System/Library/Frameworks/Kerberos.framework/Versions/A/Kerberos
       0x19a7ba000 -        0x19a80baaf  com.apple.GSS (4.0 - 2.0) <277D18EF-39E4-3F72-99E8-8D3DF65ED1D0> /System/Library/Frameworks/GSS.framework/Versions/A/GSS
       0x19a80c000 -        0x19a81cd6f  com.apple.CommonAuth (4.0 - 2.0) <097F7235-CA53-3644-BB95-F6F912B4F2C7> /System/Library/PrivateFrameworks/CommonAuth.framework/Versions/A/CommonAuth
       0x19a81d000 -        0x19a90105f  com.apple.MobileAssets (1.0 - 1837.160.15) <91A461DE-C8E8-3868-B393-BA6E5A17DF2A> /System/Library/PrivateFrameworks/MobileAsset.framework/Versions/A/MobileAsset
       0x19a902000 -        0x19a950c1f  com.apple.CacheDelete (1.0 - 1) <F5519EDD-F080-3571-918D-A77115712256> /System/Library/PrivateFrameworks/CacheDelete.framework/Versions/A/CacheDelete
       0x19a951000 -        0x19a993eff  com.apple.security.KeychainCircle.KeychainCircle (1.0 - 1) <FFBABC1E-8B3E-394B-A95E-A330674158A2> /System/Library/PrivateFrameworks/KeychainCircle.framework/Versions/A/KeychainCircle
       0x19a994000 -        0x19a9a3160  com.apple.CorePhoneNumbers (1.0 - 1) <79000980-1797-3115-B74B-60FA1E9C3C73> /System/Library/PrivateFrameworks/CorePhoneNumbers.framework/Versions/A/CorePhoneNumbers
       0x19a9a4000 -        0x19aa2d45f  libTelephonyUtilDynamic.dylib (6392) <63A6BBA0-CD50-30F8-9CD2-81B59264EA13> /usr/lib/libTelephonyUtilDynamic.dylib
       0x19b357000 -        0x19b620a7f  com.apple.NetworkExtension (1.0 - 1) <9753F471-40DD-3B9E-9D64-8D07C1B06BC9> /System/Library/Frameworks/NetworkExtension.framework/Versions/A/NetworkExtension
       0x19b621000 -        0x19b84623f  com.apple.ids (10.0 - 1000) <F56AB66A-60FF-3241-9608-313B8522D517> /System/Library/PrivateFrameworks/IDS.framework/Versions/A/IDS
       0x19b847000 -        0x19bec2e5f  com.apple.idsfoundation (10.0 - 1000) <42F76533-D8DD-3A24-A08A-103C51428797> /System/Library/PrivateFrameworks/IDSFoundation.framework/Versions/A/IDSFoundation
       0x19bec3000 -        0x19c2cbb9f  com.apple.Sharing (2094.70.81 - 2094.70.81) <920D8AA6-CDCD-3E0F-AD66-F0673ACABD3F> /System/Library/PrivateFrameworks/Sharing.framework/Versions/A/Sharing
       0x19c2cc000 -        0x19c383fff  com.apple.Bluetooth (1.0 - 1) <1ABB6C50-A5DE-3744-8F07-8C3B5617B0B9> /System/Library/Frameworks/IOBluetooth.framework/Versions/A/IOBluetooth
       0x19c3a2000 -        0x19c43ae7f  com.apple.ProtectedCloudStorage (1.0 - 1) <1F8700BE-BD91-3B94-AC32-A5F10CEFEE35> /System/Library/PrivateFrameworks/ProtectedCloudStorage.framework/Versions/A/ProtectedCloudStorage
       0x19c43b000 -        0x19c4a12bf  com.apple.QuickLookFramework (5.0 - 1018.5.5) <3C44610F-9A64-3F5A-B66D-7C1BC5D2F020> /System/Library/Frameworks/QuickLook.framework/Versions/A/QuickLook
       0x19c4a2000 -        0x19c4c04bf  com.apple.MetalKit (173.7 - 173.7) <BF72FDE1-F15E-37D8-BC66-F9774C7921EF> /System/Library/Frameworks/MetalKit.framework/Versions/A/MetalKit
       0x19c4c1000 -        0x19c4c598f  libxcselect.dylib (2416) <E9C2202C-2D65-38A7-B151-704C70A088A1> /usr/lib/libxcselect.dylib
       0x19c579000 -        0x19c57f37f  libdscsym.dylib (427) <7E3E0CF7-905A-3244-A0C9-0ADCC2E16415> /usr/lib/libdscsym.dylib
       0x19c580000 -        0x19c673a36  com.apple.combine (1.0 - 3023) <F088ACC1-374F-3E9D-86DA-29310F8431B1> /System/Library/Frameworks/Combine.framework/Versions/A/Combine
       0x19c674000 -        0x19e4d3bdf  com.apple.GeoServices (1.0 - 2031.26.4.23.6) <1DAFDDDA-BB7B-320E-BCFC-B7C22886D486> /System/Library/PrivateFrameworks/GeoServices.framework/Versions/A/GeoServices
       0x19e4d4000 -        0x19e4df647  com.apple.DirectoryService.Framework (26.6 - 666.100.1) <5F9A96D7-767C-3FF5-B6C5-7D93FD76B0F0> /System/Library/Frameworks/DirectoryService.framework/Versions/A/DirectoryService
       0x19e4fc000 -        0x19e4ff967  com.apple.speech.recognition.framework (6.0.5 - 6.0.5) <B4C49C28-105D-3260-8229-916D9FB0A584> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/SpeechRecognition.framework/Versions/A/SpeechRecognition
       0x19e500000 -        0x19e511375  com.apple.AppleLDAP (26.6 - 63) <C6584A8B-46CC-3C4C-A401-25C78275D922> /System/Library/PrivateFrameworks/AppleLDAP.framework/Versions/A/AppleLDAP
       0x19e512000 -        0x19e7c681f  com.apple.MapKit (1.0 - 2511.26.4.23.2) <6B758126-8EF2-373D-9640-7712A3852DC5> /System/Library/Frameworks/MapKit.framework/Versions/A/MapKit
       0x19e7d4000 -        0x19e7da1d7  com.apple.IOPlatformPluginFamily (1.0 - 1) <294D21AC-0596-3B33-8AD2-AA818BD6CCF8> /System/Library/PrivateFrameworks/IOPlatformPluginFamily.framework/Versions/A/IOPlatformPluginFamily
       0x19e80e000 -        0x19e8363bf  com.apple.GLKit (129 - 129) <F3E6B01C-31C3-37D4-8C8B-3BF9BAFB870B> /System/Library/Frameworks/GLKit.framework/Versions/A/GLKit
       0x19e848000 -        0x19e88b19f  libnetworkextension.dylib (2226.161.1) <A4A0036B-6614-36AA-9751-F7519237C5B7> /usr/lib/libnetworkextension.dylib
       0x19e88c000 -        0x19e8aed9f  com.apple.Accessibility (1.0 - 1) <22008BA9-C61B-3FAD-A1A0-F6A1CD220343> /System/Library/Frameworks/Accessibility.framework/Versions/A/Accessibility
       0x19e8e7000 -        0x19e8e8a33  libCTGreenTeaLogger.dylib (13193) <2820F48C-919A-361E-9F16-3262EA66C59A> /usr/lib/libCTGreenTeaLogger.dylib
       0x19e8e9000 -        0x19e8e986f  com.apple.Accelerate.vecLib (3.11 - vecLib 3.11) <8203944D-B53E-3D7E-A481-3C676CAE1B6A> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/vecLib
       0x19e90e000 -        0x19e90e98f  com.apple.CoreServices (1226 - 1226) <56AE2857-29E0-34E9-B2C3-EE8E951EEFC5> /System/Library/Frameworks/CoreServices.framework/Versions/A/CoreServices
       0x19e90f000 -        0x19e97079f  com.apple.CoreAppleCVA (4.4.0 - 4.4.0) <556809E3-5041-375B-91B4-313A7D0218A0> /System/Library/PrivateFrameworks/CoreAppleCVA.framework/Versions/A/CoreAppleCVA
       0x19eb8d000 -        0x19eb8d417  com.apple.Accelerate (1.11 - Accelerate 1.11) <9171DD7D-3994-3963-9A28-BC163BF97DE6> /System/Library/Frameworks/Accelerate.framework/Versions/A/Accelerate
       0x19ebbc000 -        0x19ebdbfff  com.apple.AssetCacheServices (140.120.2 - 140.120.2) <89B0B17D-AE25-39FA-B9B7-D74C3341722D> /System/Library/PrivateFrameworks/AssetCacheServices.framework/Versions/A/AssetCacheServices
       0x19ebdc000 -        0x19ebee53f  com.apple.MediaAccessibility (1.0 - 153) <74D313A5-4D99-35D1-A4C9-B76AB6457EF0> /System/Library/Frameworks/MediaAccessibility.framework/Versions/A/MediaAccessibility
       0x19ebef000 -        0x19ebf4553  com.apple.AppleSRP (5.0 - 1) <60686D37-FC2A-3BF6-AF93-F74337D265C1> /System/Library/PrivateFrameworks/AppleSRP.framework/Versions/A/AppleSRP
       0x19ebf5000 -        0x19ec350bf  com.apple.framework.SystemAdministration (1.0 - 1.0) <463CC63E-1205-3FA3-A164-CD71FB0E0141> /System/Library/PrivateFrameworks/SystemAdministration.framework/Versions/A/SystemAdministration
       0x19ec36000 -        0x19f2cfebf  com.apple.VN (9.5.4 - 9.5.4) <10F83439-3A9F-316B-992E-451A72876715> /System/Library/Frameworks/Vision.framework/Versions/A/Vision
       0x19f2d0000 -        0x19f2d03ef  libswiftFoundation.dylib (2000) <14A11A94-6A52-3D24-9267-42EDAEEC5FDD> /usr/lib/swift/libswiftFoundation.dylib
       0x19f2d1000 -        0x19f3b3b5f  com.apple.AddressBook.ContactsFoundation (8.0 - 1397.700.21) <47527863-5326-3420-96AD-2C96B5C25504> /System/Library/PrivateFrameworks/ContactsFoundation.framework/Versions/A/ContactsFoundation
       0x19f3b4000 -        0x19f432d5f  com.apple.contacts.ContactsPersistence (1.0 - 3804.700.52) <D7050328-150E-3E59-8B70-4167E3062B17> /System/Library/PrivateFrameworks/ContactsPersistence.framework/Versions/A/ContactsPersistence
       0x19f433000 -        0x19f59c45f  com.apple.AddressBook.core (1.0 - 2732.700.1) <5BF2A22C-35BF-360F-8791-9373A8F784C4> /System/Library/PrivateFrameworks/AddressBookCore.framework/Versions/A/AddressBookCore
       0x19f59d000 -        0x19f84685f  com.apple.contacts (1.0 - 3804.700.52) <8FB53D0C-6447-3B78-9C48-18A26106A406> /System/Library/Frameworks/Contacts.framework/Versions/A/Contacts
       0x19f847000 -        0x19f85761f  com.apple.PersonaKit (1.0 - 1) <CB360694-27FF-3B96-9D55-CCC141BE781D> /System/Library/PrivateFrameworks/PersonaKit.framework/Versions/A/PersonaKit
       0x19f858000 -        0x19f85efdf  com.apple.communicationsfilter (10.0 - 1000) <3EA39366-5578-3B88-BD8A-7992791B5943> /System/Library/PrivateFrameworks/CommunicationsFilter.framework/Versions/A/CommunicationsFilter
       0x19f85f000 -        0x19f9884df  com.apple.FamilyCircle (1.0 - 2) <EFED3BEF-814C-3B73-ACDA-5537B30DFAF2> /System/Library/PrivateFrameworks/FamilyCircle.framework/Versions/A/FamilyCircle
       0x19f989000 -        0x19fa930ff  com.apple.CoreBluetooth (196.5) <515FDCCC-535A-398B-BBD3-3D35565F5423> /System/Library/Frameworks/CoreBluetooth.framework/Versions/A/CoreBluetooth
       0x19fa94000 -        0x19faa35df  com.apple.SymptomDiagnosticReporter (1.0 - 411.160.2) <737479F2-7B20-3DB6-B9F4-0DAA1B73E9D0> /System/Library/PrivateFrameworks/SymptomDiagnosticReporter.framework/Versions/A/SymptomDiagnosticReporter
       0x19faa4000 -        0x19fad225f  com.apple.PowerLog (1.0 - 1) <E86905A9-1519-3027-9182-C85F9EC8A6C0> /System/Library/PrivateFrameworks/PowerLog.framework/Versions/A/PowerLog
       0x19fad3000 -        0x19fadfeff  com.apple.AppleIDAuthSupport (1.0 - 1) <FB5CF019-692F-3DDB-9E1F-ABAA63F4B8D9> /System/Library/PrivateFrameworks/AppleIDAuthSupport.framework/Versions/A/AppleIDAuthSupport
       0x19fae0000 -        0x19fb916df  com.apple.DiscRecording (9.0.3 - 9030.4.5) <B38F9602-2DFD-33EB-9B69-867D46CF602A> /System/Library/Frameworks/DiscRecording.framework/Versions/A/DiscRecording
       0x19fb92000 -        0x19fbc3137  com.apple.MediaKit (16 - 938) <46DD93AF-BACD-309B-AD51-9CC47C78CA2C> /System/Library/PrivateFrameworks/MediaKit.framework/Versions/A/MediaKit
       0x19fbc4000 -        0x19fca6f3f  com.apple.DiskManagement (15.0 - 1037.160.3) <B478696F-3B77-3224-9945-5E2770F73578> /System/Library/PrivateFrameworks/DiskManagement.framework/Versions/A/DiskManagement
       0x19fca7000 -        0x19fcb323f  com.apple.CoreAUC (620.1 - 620.1) <9ACFCA55-82CB-33DB-AD00-443576099FDB> /System/Library/PrivateFrameworks/CoreAUC.framework/Versions/A/CoreAUC
       0x19fcb4000 -        0x19fcb777b  com.apple.Mangrove (1.0 - 25) <87F549F4-73CC-302B-ABDB-D3CCFADABFA9> /System/Library/PrivateFrameworks/Mangrove.framework/Versions/A/Mangrove
       0x19fcb8000 -        0x19fce5f87  com.apple.CoreAVCHD (6.0.0 - 6244.1) <CEC7BD9E-B5F2-3E7C-B04D-5DF1FC3A4553> /System/Library/PrivateFrameworks/CoreAVCHD.framework/Versions/A/CoreAVCHD
       0x19fce6000 -        0x19febc1df  com.apple.FileProvider (4018.160.6 - 4018.160.6) <5EA68C5E-69B0-3011-9D66-AEF49D82B29D> /System/Library/Frameworks/FileProvider.framework/Versions/A/FileProvider
       0x19febd000 -        0x19fee33ff  com.apple.GenerationalStorage (2.0 - 397.120.2) <A24BD91A-8190-352C-B5A2-D442DB5D6459> /System/Library/PrivateFrameworks/GenerationalStorage.framework/Versions/A/GenerationalStorage
       0x19fee4000 -        0x19ff1573f  com.apple.security.octagontrust (1.0 - 1) <B5964A5B-DEFA-3D07-97D0-A5B8249970C1> /System/Library/PrivateFrameworks/OctagonTrust.framework/Versions/A/OctagonTrust
       0x19ff16000 -        0x19ff3861f  com.apple.CPAnalytics (1.0 - 860.0.170) <C2A14E70-7549-3A0D-A83B-21A129F84776> /System/Library/PrivateFrameworks/CPAnalytics.framework/Versions/A/CPAnalytics
       0x1a0481000 -        0x1a0668abf  com.apple.CoreTelephony (113 - 13193) <5F090F48-E481-3737-8E75-362E5D274879> /System/Library/Frameworks/CoreTelephony.framework/Versions/A/CoreTelephony
       0x1a0685000 -        0x1a069b950  libswiftDispatch.dylib (1542.160.2) <F0B9A36E-CE82-3B73-B644-E9C05DF0AF71> /usr/lib/swift/libswiftDispatch.dylib
       0x1a069c000 -        0x1a090b1bf  com.apple.AVFCore (1.0 - 2430.13.1) <067E2603-4FEA-3CA5-8926-45F60681EDDB> /System/Library/PrivateFrameworks/AVFCore.framework/Versions/A/AVFCore
       0x1a090c000 -        0x1a09e53bf  com.apple.FrontBoardServices (1000.4.12 - 1000.4.12) <DD0CA5A1-7BD8-3895-9290-3580A783C069> /System/Library/PrivateFrameworks/FrontBoardServices.framework/Versions/A/FrontBoardServices
       0x1a09e6000 -        0x1a0a72c3f  com.apple.BoardServices (1.0 - 732.1.1) <BF23D7B4-4992-3663-BBEC-A55EE7D351DE> /System/Library/PrivateFrameworks/BoardServices.framework/Versions/A/BoardServices
       0x1a0a73000 -        0x1a0ab23ff  com.apple.contacts.vCard (1.0 - 3804.700.52) <A9DFEF8D-78C6-3BCF-9427-AFF2EE9868DB> /System/Library/PrivateFrameworks/vCard.framework/Versions/A/vCard
       0x1a0ab3000 -        0x1a0ac053f  com.apple.GraphicsServices (1.0 - 1.0) <757FEDFF-841C-3D62-B703-CDE79E929363> /System/Library/PrivateFrameworks/GraphicsServices.framework/Versions/A/GraphicsServices
       0x1a0ac5000 -        0x1a0b4617f  com.apple.CryptoTokenKit (1.0 - 1) <714063A8-D81E-3B22-9B36-88948A979E7F> /System/Library/Frameworks/CryptoTokenKit.framework/Versions/A/CryptoTokenKit
       0x1a0b47000 -        0x1a0bb361f  com.apple.LocalAuthentication (1.0 - 2005.160.7) <86858734-8B4D-38E6-AAA7-B7A046A7CB2A> /System/Library/Frameworks/LocalAuthentication.framework/Versions/A/LocalAuthentication
       0x1a0bb4000 -        0x1a0bc167f  com.apple.CoreAuthentication.SharedUtils (1.0 - 2005.160.7) <D853D903-DE37-3F27-B376-04084C11772A> /System/Library/Frameworks/LocalAuthentication.framework/Support/SharedUtils.framework/Versions/A/SharedUtils
       0x1a0bc2000 -        0x1a0c4a15f  com.apple.avfoundationcf (2.0 - 775.13.1) <D5596758-6E9F-3C32-A8B0-D5CAB3EF94B8> /System/Library/PrivateFrameworks/AVFoundationCF.framework/Versions/A/AVFoundationCF
       0x1a0d06000 -        0x1a0ddcb9f  com.apple.SAObjects (1.0 - 1) <086BB8AD-E317-3FC4-9E44-0D7C6036E8D7> /System/Library/PrivateFrameworks/SAObjects.framework/Versions/A/SAObjects
       0x1a0ddd000 -        0x1a0dfee9f  com.apple.DebugSymbols (216 - 217) <7C923545-F3BB-3215-9720-85196358D9F1> /System/Library/PrivateFrameworks/DebugSymbols.framework/Versions/A/DebugSymbols
       0x1a0dff000 -        0x1a0f5a49f  com.apple.CoreSymbolication (16.0 - 64575.55.1) <59136324-34E6-3367-92BB-659346907A04> /System/Library/PrivateFrameworks/CoreSymbolication.framework/Versions/A/CoreSymbolication
       0x1a0f5b000 -        0x1a0f6509f  com.apple.CoreTime (334.0.16.3 - 334.0.16.3) <A41A3592-8BDB-3BE5-BBF4-DC196D669C1D> /System/Library/PrivateFrameworks/CoreTime.framework/Versions/A/CoreTime
       0x1a0f66000 -        0x1a1059aff  com.apple.Rapport (7.1 - 715.2) <F6E572E4-F0AB-3F91-A003-E75A612F3F3D> /System/Library/PrivateFrameworks/Rapport.framework/Versions/A/Rapport
       0x1a105a000 -        0x1a1d1f5df  com.apple.private.EmbeddedAcousticRecognition (1.0 - 1) <BF29D851-F79D-3866-AA68-AF81EE9826A8> /System/Library/PrivateFrameworks/EmbeddedAcousticRecognition.framework/Versions/A/EmbeddedAcousticRecognition
       0x1a1d20000 -        0x1a1d7687f  com.apple.coreduetcontext (1.0 - 1) <90CFC86E-833E-3E9F-BAAC-2B61BD750DA6> /System/Library/PrivateFrameworks/CoreDuetContext.framework/Versions/A/CoreDuetContext
       0x1a1d77000 -        0x1a23f13ff  com.apple.Intents (1.0 - 1) <FA0B35BF-F3FE-3329-983D-B5118AAF4E07> /System/Library/Frameworks/Intents.framework/Versions/A/Intents
       0x1a23f2000 -        0x1a23f2f3f  com.apple.framework.Apple80211 (1.0 - 19155.3) <116D159B-163E-3F91-9591-30FF8B6EB537> /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Apple80211
       0x1a23f3000 -        0x1a28b483f  com.apple.CoreWiFi (1.0 - 1006.2) <7C50137B-2ABD-3819-B033-AE65B05A6085> /System/Library/PrivateFrameworks/CoreWiFi.framework/Versions/A/CoreWiFi
       0x1a28b5000 -        0x1a29277ff  com.apple.BackBoardServices (1.0 - 1.0) <E1DAB2C4-0470-35D4-914C-1F38DE3D9EBB> /System/Library/PrivateFrameworks/BackBoardServices.framework/Versions/A/BackBoardServices
       0x1a2928000 -        0x1a29634ef  com.apple.LDAPFramework (2.4.28 - 194.5) <8CABDD64-E6C6-3B77-B839-2E2B875CE0FE> /System/Library/Frameworks/LDAP.framework/Versions/A/LDAP
       0x1a2964000 -        0x1a29657b7  com.apple.TrustEvaluationAgent (2.0 - 38) <96C0BAAA-7FE6-3277-AFBC-31926F5935EE> /System/Library/PrivateFrameworks/TrustEvaluationAgent.framework/Versions/A/TrustEvaluationAgent
       0x1a2a93000 -        0x1a2b4c59f  com.apple.DiskImagesFramework (683.160.3 - 683.160.3) <E318744C-06A0-39A4-A55B-1245016B42CE> /System/Library/PrivateFrameworks/DiskImages.framework/Versions/A/DiskImages
       0x1a2b4d000 -        0x1a2b8ce7f  com.apple.SystemConfiguration.EAP8021X (14.0.0 - 14.0) <B5BDFB31-F401-36C9-B831-3B6143A3D864> /System/Library/PrivateFrameworks/EAP8021X.framework/Versions/A/EAP8021X
       0x1a2b8d000 -        0x1a2ba359f  com.apple.RemoteServiceDiscovery (1.0 - 219.160.4) <823F3D1A-65F1-3CC5-96B1-750263B8DB36> /System/Library/PrivateFrameworks/RemoteServiceDiscovery.framework/Versions/A/RemoteServiceDiscovery
       0x1a2ba4000 -        0x1a2bb9c3f  com.apple.xpc.RemoteXPC (1.0 - 3102.160.5) <885F9C72-1018-368B-AD36-E8A42E87FD91> /System/Library/PrivateFrameworks/RemoteXPC.framework/Versions/A/RemoteXPC
       0x1a2c39000 -        0x1a2c3c653  com.apple.help (1.3.8 - 81) <356A9A80-09DB-3A79-B2DF-4E8730D794CF> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/Help.framework/Versions/A/Help
       0x1a2c3d000 -        0x1a2c4139f  com.apple.EFILogin (2.0 - 2) <ED615852-CBF2-3349-81A5-27A7D089C1FB> /System/Library/PrivateFrameworks/EFILogin.framework/Versions/A/EFILogin
       0x1a2c42000 -        0x1a2c4da07  libcsfde.dylib (568) <80C3E2D4-B6B8-3C62-B257-27DEEBAD4935> /usr/lib/libcsfde.dylib
       0x1a2c4e000 -        0x1a2ccef4b  libcurl.4.dylib (168) <2E99AD96-DC1C-3643-9988-273AB6844EFC> /usr/lib/libcurl.4.dylib
       0x1a2ccf000 -        0x1a2cd459f  com.apple.LoginUICore (4.0 - 4.0) <126DE35B-0C23-3D27-992C-C8FB1F712AD4> /System/Library/PrivateFrameworks/LoginUIKit.framework/Versions/A/Frameworks/LoginUICore.framework/Versions/A/LoginUICore
       0x1a2cd5000 -        0x1a2d1825f  com.apple.AppSupport (1.0.0 - 29) <61B2B917-D14A-38AD-A439-16E1C635441A> /System/Library/PrivateFrameworks/AppSupport.framework/Versions/A/AppSupport
       0x1a2d19000 -        0x1a2d61cdf  com.apple.AppSSO (1.0 - 483.160.10) <B34F7E6B-DD1C-3FB5-95CA-D56D48907A5F> /System/Library/PrivateFrameworks/AppSSO.framework/Versions/A/AppSSO
       0x1a2fe8000 -        0x1a2fe8927  com.apple.ApplicationServices (48 - 66) <086CBEED-2F64-3E75-AB99-8C8C0E0A2F1C> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/ApplicationServices
       0x1a2fe9000 -        0x1a2febf3f  com.apple.InternationalTextSearch (1.0 - 1) <858910C5-1D4A-37B7-BF0E-EE02E24A2ACD> /System/Library/PrivateFrameworks/InternationalTextSearch.framework/Versions/A/InternationalTextSearch
       0x1a2fec000 -        0x1a30b33ff  com.apple.ClassKit (1.2 - 151.5) <54035623-2246-32BA-8403-E545EF89C75D> /System/Library/Frameworks/ClassKit.framework/Versions/A/ClassKit
       0x1a30b4000 -        0x1a33398ff  com.apple.AppleAccount (1.0 - 1.0) <768DFB9E-7FB3-3998-A3AF-BEF0C6C740A7> /System/Library/PrivateFrameworks/AppleAccount.framework/Versions/A/AppleAccount
       0x1a333a000 -        0x1a338a53f  com.apple.AppleIDSSOAuthentication (1.0 - 1) <9D724BE7-0B01-39F3-82BE-BCEDC6EBAC8A> /System/Library/PrivateFrameworks/AppleIDSSOAuthentication.framework/Versions/A/AppleIDSSOAuthentication
       0x1a338b000 -        0x1a33e0d7f  com.apple.CorePrediction (1.0 - 1) <5AF7D218-7032-34DB-B3B0-54C6EAE74087> /System/Library/PrivateFrameworks/CorePrediction.framework/Versions/A/CorePrediction
       0x1a33e1000 -        0x1a3534b5f  com.apple.AuthKitUI (1.0 - 1) <87568704-B631-3F6D-99A4-3BF20980C464> /System/Library/PrivateFrameworks/AuthKitUI.framework/Versions/A/AuthKitUI
       0x1a35b8000 -        0x1a35bbd3f  com.apple.security.CryptoKit-C-Bridging (1.0 - 1) <CFC2A741-A85D-3E7D-A961-91F5C1742FA2> /System/Library/PrivateFrameworks/CryptoKitCBridging.framework/Versions/A/CryptoKitCBridging
       0x1a35bc000 -        0x1a35bc3f7  libHeimdalProxy.dylib (88) <0CB2E7E3-E96F-343B-A4E7-545E74AF0255> /System/Library/Frameworks/Kerberos.framework/Versions/A/Libraries/libHeimdalProxy.dylib
       0x1a35bd000 -        0x1a35bd512  com.apple.audio.units.AudioUnit (1.14 - 1.14) <093EF25B-5305-3611-B068-E65071858F52> /System/Library/Frameworks/AudioUnit.framework/Versions/A/AudioUnit
       0x1a35cc000 -        0x1a35d1c73  com.apple.NetFSServer (2.0 - 1) <7A2A0296-0EA2-33B1-82BF-02B451DA29FF> /System/Library/PrivateFrameworks/NetFSServer.framework/Versions/A/NetFSServer
       0x1a35e7000 -        0x1a3605b9f  com.apple.StreamingZip (1.0 - 1) <1F2EDC7B-8F28-3721-8A60-F6E1BCFC29A3> /System/Library/PrivateFrameworks/StreamingZip.framework/Versions/A/StreamingZip
       0x1a3606000 -        0x1a365eadf  com.apple.DuetActivityScheduler (1.0 - 1) <D3291D8F-5606-3593-ABA7-00CE39429D6B> /System/Library/PrivateFrameworks/DuetActivityScheduler.framework/Versions/A/DuetActivityScheduler
       0x1a365f000 -        0x1a36626bf  libswiftObjectiveC.dylib (951.7) <4FD234EA-2C18-3C25-8BD0-B1F4805C6675> /usr/lib/swift/libswiftObjectiveC.dylib
       0x1a3663000 -        0x1a36806ff  libswiftos.dylib (1082) <C7A04322-C1B4-39A6-9E88-1C8CEDB97264> /usr/lib/swift/libswiftos.dylib
       0x1a3681000 -        0x1a369195f  com.apple.IntentsFoundation (1.0 - 1) <58AC6CAB-5B91-367F-932F-BD0939BBD125> /System/Library/PrivateFrameworks/IntentsFoundation.framework/Versions/A/IntentsFoundation
       0x1a3692000 -        0x1a369b4bf  com.apple.PushKit (1.0 - 1) <36607924-B1B2-39ED-B6D1-29683EFB67A0> /System/Library/Frameworks/PushKit.framework/Versions/A/PushKit
       0x1a369c000 -        0x1a36f88bf  com.apple.cloudkit.C2 (1.3 - 2300.120) <A0E3C8BF-139D-33BC-8F2E-7D2057EF30AA> /System/Library/PrivateFrameworks/C2.framework/Versions/A/C2
       0x1a36f9000 -        0x1a374601f  com.apple.QuickLookThumbnailing (1.0 - 208.6.1) <36F215D1-A2C0-32CA-ADD8-6D85AB48A772> /System/Library/Frameworks/QuickLookThumbnailing.framework/Versions/A/QuickLookThumbnailing
       0x1a3747000 -        0x1a459873f  com.apple.vision.EspressoFramework (1.0 - 3525.1.1) <8F2949A6-43A0-30A2-B5D2-945949C5AA01> /System/Library/PrivateFrameworks/Espresso.framework/Versions/A/Espresso
       0x1a4599000 -        0x1a45c999f  com.apple.ANEServices (9.512 - 9.512) <A6EB8ED9-D3A8-3BE9-A09C-A5194D3DFBD2> /System/Library/PrivateFrameworks/ANEServices.framework/Versions/A/ANEServices
       0x1a45ca000 -        0x1a465885f  com.apple.proactive.support.ProactiveSupport (1.0 - 418.1) <73EE1A0A-0D29-3104-98CB-BEFEDA53F7C0> /System/Library/PrivateFrameworks/ProactiveSupport.framework/Versions/A/ProactiveSupport
       0x1a4659000 -        0x1a466fe5f  com.apple.corerecents (1.0 - 1) <A8C7306A-13EF-3783-A165-131E958CB599> /System/Library/PrivateFrameworks/CoreRecents.framework/Versions/A/CoreRecents
       0x1a4670000 -        0x1a46b43df  com.apple.iCalendar (7.0 - 1169.4.3) <23978914-9386-3BBB-8E77-59775D9BD897> /System/Library/PrivateFrameworks/iCalendar.framework/Versions/A/iCalendar
       0x1a46b5000 -        0x1a4753e5f  com.apple.CalendarFoundation (8.0 - 1603.4.5) <9BC14581-8654-3E5D-BA23-AEFBB4DFDE6F> /System/Library/PrivateFrameworks/CalendarFoundation.framework/Versions/A/CalendarFoundation
       0x1a4754000 -        0x1a4754527  com.apple.CoreDuetDaemonProtocol (1.0 - 1) <B4C51ABF-9446-3B30-AB6D-3DD54126047E> /System/Library/PrivateFrameworks/CoreDuetDaemonProtocol.framework/Versions/A/CoreDuetDaemonProtocol
       0x1a4755000 -        0x1a477929f  com.apple.ASEProcessing (1.55.0 - 1.55.0) <4D8F39C6-B221-3AF1-BB40-CAEB0A174D61> /System/Library/PrivateFrameworks/ASEProcessing.framework/Versions/A/ASEProcessing
       0x1a477a000 -        0x1a4819e5f  com.apple.framework.ConfigurationProfiles (18.0 - 1800) <945A43E9-6B7D-30F9-A215-D117F224492F> /System/Library/PrivateFrameworks/ConfigurationProfiles.framework/Versions/A/ConfigurationProfiles
       0x1a4a9f000 -        0x1a4afca5f  com.apple.AOSAccounts (1.3.1 - 210.600.1) <6FE61795-B0C5-3981-820B-B66EB16B60D6> /System/Library/PrivateFrameworks/AOSAccounts.framework/Versions/A/AOSAccounts
       0x1a5081000 -        0x1a50ddb17  com.apple.ChunkingLibrary (2300.104 - 2300.104) <E1E32CF1-EFD0-3D47-9B70-455FBCD03191> /System/Library/PrivateFrameworks/ChunkingLibrary.framework/Versions/A/ChunkingLibrary
       0x1a5226000 -        0x1a52393df  com.apple.MediaLibrary (1.12.0 - 812) <2A18627A-1039-35B6-B1B7-E229361B5A2D> /System/Library/Frameworks/MediaLibrary.framework/Versions/A/MediaLibrary
       0x1a523a000 -        0x1a529c83f  com.apple.CalDAV (8.0 - 1155.4.3) <1FD26DE4-ADDD-3C18-86FC-8D331C6C89F4> /System/Library/PrivateFrameworks/CalDAV.framework/Versions/A/CalDAV
       0x1a529d000 -        0x1a536fe1f  com.apple.CoreSuggestions (1.0 - 1311.7) <53DD94CB-C1E1-3C0C-ADA0-D05CCAB69A15> /System/Library/PrivateFrameworks/CoreSuggestions.framework/Versions/A/CoreSuggestions
       0x1a5370000 -        0x1a557393f  com.apple.eventkit (3.0 - 1934.6.1) <3FB7D2C6-2271-3029-BE29-EE41AA6E95D6> /System/Library/Frameworks/EventKit.framework/Versions/A/EventKit
       0x1a5574000 -        0x1a55a433f  com.apple.RTCReporting (13.1.47 - 166.2) <7BEBC9F1-212D-37F4-B601-A7AAD12F7225> /System/Library/PrivateFrameworks/RTCReporting.framework/Versions/A/RTCReporting
       0x1a55a5000 -        0x1a57cdd7f  com.apple.WebKitLegacy (21624 - 21624.5.1.11.3) <7E1C5A28-D283-3168-B09C-6A3C54A52102> /System/Library/Frameworks/WebKit.framework/Versions/A/Frameworks/WebKitLegacy.framework/Versions/A/WebKitLegacy
       0x1a581d000 -        0x1a588b13f  com.apple.CoreML.AppleNeuralEngine (1.0 - 1) <FD36C9CF-78FF-3841-A7A0-261BE42F3FC0> /System/Library/PrivateFrameworks/AppleNeuralEngine.framework/Versions/A/AppleNeuralEngine
       0x1a59d9000 -        0x1a5aa7c1f  com.apple.audio.midi.CoreMIDI (2.0 - 88) <52BD9E26-B356-3EAA-9AD7-7FF700C61A91> /System/Library/Frameworks/CoreMIDI.framework/Versions/A/CoreMIDI
       0x1a5bcc000 -        0x1a5bcc467  com.apple.Cocoa (6.11 - 24) <AB9A4279-F590-352F-B202-7158F4C56076> /System/Library/Frameworks/Cocoa.framework/Versions/A/Cocoa
       0x1a5c0d000 -        0x1a5c2111f  com.apple.AskPermission (129.6.2 - 129.6.2) <4CB2EF58-17AD-362A-A960-597786A1571D> /System/Library/PrivateFrameworks/AskPermission.framework/Versions/A/AskPermission
       0x1a5c22000 -        0x1a66e9c9f  com.apple.AppleMediaServices (1.0 - 1) <7462577F-E47B-38D5-8FDD-163AAFAB7D5B> /System/Library/PrivateFrameworks/AppleMediaServices.framework/Versions/A/AppleMediaServices
       0x1a66ea000 -        0x1a66ee75f  com.apple.IOSurfaceAccelerator (1.0.0 - 1.0.0) <1E529C1A-B09C-3EB7-A286-CE00E292D561> /System/Library/PrivateFrameworks/IOSurfaceAccelerator.framework/Versions/A/IOSurfaceAccelerator
       0x1a66ef000 -        0x1a66f433f  libUAPreferences.dylib (736.20) <722D3DF7-1005-3107-AEC8-98F33A33BEA0> /System/Library/PrivateFrameworks/UniversalAccess.framework/Versions/A/Libraries/libUAPreferences.dylib
       0x1a66f5000 -        0x1a6716f3f  com.apple.framework.familycontrols (4.1 - 410) <AEC4567A-7713-3AF9-A19C-0C6987D9EC75> /System/Library/PrivateFrameworks/FamilyControls.framework/Versions/A/FamilyControls
       0x1a6717000 -        0x1a672333f  com.apple.CommerceCore (1.0 - 716.4.2) <46510379-D37A-3ADC-B645-5722269F1E0A> /System/Library/PrivateFrameworks/CommerceKit.framework/Versions/A/Frameworks/CommerceCore.framework/Versions/A/CommerceCore
       0x1a6724000 -        0x1a6b3d03f  com.apple.MediaRemote (1.0 - 1) <D3E0EAC7-7D37-316F-A361-F4C83335062D> /System/Library/PrivateFrameworks/MediaRemote.framework/Versions/A/MediaRemote
       0x1a6b3e000 -        0x1a6e030ff  com.apple.AssistantServices (1.0 - 1) <E9AA2BD2-D71E-38C4-8B07-184B13EAC55C> /System/Library/PrivateFrameworks/AssistantServices.framework/Versions/A/AssistantServices
       0x1a6e04000 -        0x1a6e1745f  com.apple.PhotoFoundation (1.0 - 860.0.170) <E1E61FBC-DD5E-301D-87C5-17222CDAC140> /System/Library/PrivateFrameworks/PhotoFoundation.framework/Versions/A/PhotoFoundation
       0x1a6e18000 -        0x1a7251fdf  com.apple.imsharedutilities (10.0 - 1000) <78BC8379-BDA8-349D-8050-386C44EBC955> /System/Library/PrivateFrameworks/IMSharedUtilities.framework/Versions/A/IMSharedUtilities
       0x1a725b000 -        0x1a725fb3f  com.apple.DisplayServicesFW (3.1 - 380) <0AE066F1-6087-3373-9CD4-8AED1AE7ECD4> /System/Library/PrivateFrameworks/DisplayServices.framework/Versions/A/DisplayServices
       0x1a7260000 -        0x1a734d83f  com.apple.LoginUIKit (4.0 - 4.0) <AB581527-AFBF-3B27-AD92-75913C63D958> /System/Library/PrivateFrameworks/LoginUIKit.framework/Versions/A/LoginUIKit
       0x1a734e000 -        0x1a736e23f  com.apple.icloud.FMCoreLite (1.0 - 1) <930F9F83-A947-3788-9FBA-49872FC3AF8D> /System/Library/PrivateFrameworks/FMCoreLite.framework/Versions/A/FMCoreLite
       0x1a736f000 -        0x1a7df7d7f  com.apple.PassKitCore (1.0 - 1) <9274CB4D-56C8-3B7F-923E-D88A932AE447> /System/Library/PrivateFrameworks/PassKitCore.framework/Versions/A/PassKitCore
       0x1a824f000 -        0x1a8282327  libtidy.A.dylib (20.1) <12066854-2BE4-35DF-BA9F-B38221C980FD> /usr/lib/libtidy.A.dylib
       0x1a8283000 -        0x1a82b0fbf  com.apple.MarkupUI (1.0 - 560.4.2) <0EBA1D75-0C59-3CAE-8D42-3D6573BC3F7C> /System/Library/PrivateFrameworks/MarkupUI.framework/Versions/A/MarkupUI
       0x1a82b1000 -        0x1a82c8edf  com.apple.Engram (1.0 - 1) <6C3E51F8-D809-3AA1-8695-B75714C2D39A> /System/Library/PrivateFrameworks/Engram.framework/Versions/A/Engram
       0x1a82c9000 -        0x1a82e5b9f  com.apple.openscripting (1.7 - 200) <4069FDAA-012A-3ECC-A2AB-E6AFC59FA00B> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/OpenScripting.framework/Versions/A/OpenScripting
       0x1a82e6000 -        0x1a82e8d27  com.apple.securityhi (9.0 - 55010) <928D1996-7CEE-308F-9CFE-6D7124B238DE> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/SecurityHI.framework/Versions/A/SecurityHI
       0x1a82e9000 -        0x1a82e9863  com.apple.ink.framework (10.15 - 227) <9091BBA2-500E-3368-9FCF-ABBDDB2B77EA> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/Ink.framework/Versions/A/Ink
       0x1a82ea000 -        0x1a82edba7  com.apple.CommonPanels (1.2.6 - 106.1) <93A48B56-BD06-3B86-97D5-836A13AA4330> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/CommonPanels.framework/Versions/A/CommonPanels
       0x1a82ee000 -        0x1a82f01fb  com.apple.ImageCapture (2020.2.2 - 2020.2.2) <CBE977D9-BB80-3BB9-A523-9B80CA02400B> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/ImageCapture.framework/Versions/A/ImageCapture
       0x1a82f1000 -        0x1aa1dcabf  com.apple.JavaScriptCore (21624 - 21624.5.1.11.3) <88E2F28E-D20F-329C-B177-E5FBDEE5839D> /System/Library/Frameworks/JavaScriptCore.framework/Versions/A/JavaScriptCore
       0x1aa1dd000 -        0x1aa1de65f  com.apple.PowerlogControl (1.0 - 1) <77B083EA-7C7F-3A7B-8F92-CF4402B1A5CD> /System/Library/PrivateFrameworks/PowerlogControl.framework/Versions/A/PowerlogControl
       0x1aa1df000 -        0x1aa1e5ddf  libUniversalAccess.dylib (736.20) <8639006D-0C7C-3483-82AA-6FA02BC2742D> /usr/lib/libUniversalAccess.dylib
       0x1aa245000 -        0x1aa2c463f  com.apple.CoreCDP-OSX (1.0 - 1) <D161872F-0933-35F3-B3BC-3F13E13369E8> /System/Library/PrivateFrameworks/CoreCDP.framework/Versions/A/CoreCDP
       0x1aa2c5000 -        0x1aa2d63bf  com.apple.SetupAssistantFramework (1.0 - 1) <F85EEBDC-95AE-3390-89D4-143AA5C9CB52> /System/Library/PrivateFrameworks/SetupAssistantFramework.framework/Versions/A/SetupAssistantFramework
       0x1aa2d7000 -        0x1aa5188ff  com.apple.AVFCapture (1.0 - 665.140.6) <CC5A573E-8A8C-399F-B3DB-370DBF3C9C76> /System/Library/PrivateFrameworks/AVFCapture.framework/Versions/A/AVFCapture
       0x1aa519000 -        0x1aa649d1f  com.apple.Quagga (186 - 186) <1772C40D-6EF4-3F81-BA00-6EE8B05039A6> /System/Library/PrivateFrameworks/Quagga.framework/Versions/A/Quagga
       0x1aa64a000 -        0x1aac856ff  com.apple.CMCapture (1.0 - 665.140.6) <57A10B70-C3C9-34C6-8D22-F5118B63E2F0> /System/Library/PrivateFrameworks/CMCapture.framework/Versions/A/CMCapture
       0x1aac86000 -        0x1aae0991f  com.apple.RenderBox (7.4.25 - 7.4.25) <92090A92-DFAF-3EBC-886C-655EC158A53F> /System/Library/PrivateFrameworks/RenderBox.framework/Versions/A/RenderBox
       0x1ab2a4000 -        0x1ab35f53f  com.apple.accounts.AccountsDaemon (113 - 113) <EEF98E7B-9F3A-3B4B-92C5-48248F278835> /System/Library/PrivateFrameworks/AccountsDaemon.framework/Versions/A/AccountsDaemon
       0x1ab360000 -        0x1ab36303f  com.apple.OAuth (25 - 25) <87039A60-9152-3DDB-9767-58D0B627ECB2> /System/Library/PrivateFrameworks/OAuth.framework/Versions/A/OAuth
       0x1ab96f000 -        0x1ab9b945f  com.apple.CloudServices (1.0 - 694.120.16) <81F4A8BA-C80F-3B53-82E7-57F6928609C5> /System/Library/PrivateFrameworks/CloudServices.framework/Versions/A/CloudServices
       0x1ab9ba000 -        0x1ab9cd9ff  com.apple.HID (1.0 - 1) <C61C2A64-EA55-3732-A51A-FD2F9740B76B> /System/Library/PrivateFrameworks/HID.framework/Versions/A/HID
       0x1ab9ce000 -        0x1aba1f3bf  com.apple.IOGPU (130.16.4 - 130.16.4) <9235E8EC-599D-386F-8A8A-6B6A92D33369> /System/Library/PrivateFrameworks/IOGPU.framework/Versions/A/IOGPU
       0x1aba40000 -        0x1abac4a9f  com.apple.coredav (1.0.1 - 1236.4.6) <3493238C-B512-350A-A1B4-269DEB38CA5A> /System/Library/PrivateFrameworks/CoreDAV.framework/Versions/A/CoreDAV
       0x1abb34000 -        0x1abbbe0ff  com.apple.MediaServices (1.0 - 4025.600.3) <1FB2BCFD-D9FC-385A-A0EA-E2B5052E27F5> /System/Library/PrivateFrameworks/MediaServices.framework/Versions/A/MediaServices
       0x1abbbf000 -        0x1abbe50bf  com.apple.IASUtilities (1.0 - 661.100.2) <6FA5FBF3-C6D9-3228-A352-0B5AB00CB987> /System/Library/PrivateFrameworks/IASUtilities.framework/Versions/A/IASUtilities
       0x1abc88000 -        0x1abcca09f  com.apple.VirtualGarage (1.0 - 1) <F72F13D8-5867-368A-A3CF-5A7A202622E7> /System/Library/PrivateFrameworks/VirtualGarage.framework/Versions/A/VirtualGarage
       0x1abcda000 -        0x1abcda847  com.apple.marco (10.0 - 1000) <40F60A3F-90A9-3F07-A99D-005E3158C6F6> /System/Library/PrivateFrameworks/Marco.framework/Versions/A/Marco
       0x1abcdb000 -        0x1abd2308b  com.apple.private.yara (1.0 - 1) <FE9FB07F-850A-3438-B2F3-BAA2E150C4DE> /System/Library/PrivateFrameworks/yara.framework/Versions/A/yara
       0x1abd24000 -        0x1abdaa0bf  com.apple.CoreRecognition (1.3 - 157) <3C1F6C88-498B-3ABE-8C9D-7DA88959AD36> /System/Library/PrivateFrameworks/CoreRecognition.framework/Versions/A/CoreRecognition
       0x1abdab000 -        0x1abdbd31f  com.apple.PersonaUI (1.0 - 1) <B1190AE8-6A1F-38F0-BF8B-4D237385EB7C> /System/Library/PrivateFrameworks/PersonaUI.framework/Versions/A/PersonaUI
       0x1abdbe000 -        0x1ac03efbf  com.apple.Contacts.ContactsUICore (1.0 - 3683.700.21) <5CFC3725-3A8D-3136-8B2B-D79312F86C05> /System/Library/PrivateFrameworks/ContactsUICore.framework/Versions/A/ContactsUICore
       0x1ac03f000 -        0x1ac1a683f  com.apple.ContactsUI (14.0 - 2732.700.1) <1C736CFA-B21F-3D3D-821D-58B2CF8B2A75> /System/Library/Frameworks/ContactsUI.framework/Versions/A/ContactsUI
       0x1ac1a7000 -        0x1ac22a93f  com.apple.contacts.ContactsAutocomplete (1.0 - 1356.700.21) <9672A3E2-D745-3E78-8342-A783A504DA20> /System/Library/PrivateFrameworks/ContactsAutocomplete.framework/Versions/A/ContactsAutocomplete
       0x1ac27e000 -        0x1ac2b87df  com.apple.proactive.support.ProactiveEventTracker (1.0 - 418.1) <C8A0CCAB-B7C8-380F-AD5D-C9DB887B0F9B> /System/Library/PrivateFrameworks/ProactiveEventTracker.framework/Versions/A/ProactiveEventTracker
       0x1ac3b9000 -        0x1ac5f547f  com.apple.framework.calculate (1.4 - 17) <3A9DB139-7495-314D-B6FC-D1EC14E3811B> /System/Library/PrivateFrameworks/Calculate.framework/Versions/A/Calculate
       0x1ac8be000 -        0x1ac8bf17f  com.apple.PhoneNumbers (1.0 - 1) <8D0ECDD1-24B6-3B8D-9CF9-CDC55FC64490> /System/Library/PrivateFrameworks/PhoneNumbers.framework/Versions/A/PhoneNumbers
       0x1ac8c0000 -        0x1ac8c96bf  com.apple.URLFormatting (296 - 296.12) <CB5152F9-1DCC-323D-AE27-5ECE07CB039C> /System/Library/PrivateFrameworks/URLFormatting.framework/Versions/A/URLFormatting
       0x1ac8ca000 -        0x1ac9d5a3f  com.apple.accessibility.AXCoreUtilities (1.0 - 1) <B0A62AD1-78DA-3A6F-A23A-BE1DC54C19F8> /System/Library/PrivateFrameworks/AXCoreUtilities.framework/Versions/A/AXCoreUtilities
       0x1ac9d6000 -        0x1aca0c7ff  libAccessibility.dylib (3191.39) <5240B3A0-D035-345E-A636-BC3A92C847C4> /usr/lib/libAccessibility.dylib
       0x1aca0d000 -        0x1b04e145f  com.apple.WebCore (21624 - 21624.5.1.11.3) <5FCF5DCC-D9BD-3A7E-9618-DBE0A758D89F> /System/Library/Frameworks/WebKit.framework/Versions/A/Frameworks/WebCore.framework/Versions/A/WebCore
       0x1b04e2000 -        0x1b05aefbf  com.apple.PackageKit (3.0 - 1491.160.2) <C2CCDEC6-E704-3E8F-B769-8B56D91E5C99> /System/Library/PrivateFrameworks/PackageKit.framework/Versions/A/PackageKit
       0x1b05af000 -        0x1b05be29f  com.apple.NetFS (6.0 - 4.0) <49121861-2603-3B0A-B664-BAD9E729BE5D> /System/Library/Frameworks/NetFS.framework/Versions/A/NetFS
       0x1b070e000 -        0x1b073dfbf  com.apple.quicklook.QuickLookSupport (1.0 - 208.6.1) <BAE8B5D6-5413-3DE7-B348-26992ACC141D> /System/Library/PrivateFrameworks/QuickLookSupport.framework/Versions/A/QuickLookSupport
       0x1b073e000 -        0x1b0857cbf  com.apple.siri.parsec.CoreParsec (1.0 - 3525.4.2) <F71B1618-C850-356D-B1C6-DB649A3F2F52> /System/Library/PrivateFrameworks/CoreParsec.framework/Versions/A/CoreParsec
       0x1b0858000 -        0x1b0aa8b5f  com.apple.TelephonyUtilities (1.0 - 1.0) <706DE359-04A5-3E90-8095-4D09668BE71B> /System/Library/PrivateFrameworks/TelephonyUtilities.framework/Versions/A/TelephonyUtilities
       0x1b0aa9000 -        0x1b0b094df  com.apple.DeviceManagement (1.0 - 249.100.1) <6D6B29AD-2C0B-360E-8404-89EEE7083052> /System/Library/PrivateFrameworks/DeviceManagement.framework/Versions/A/DeviceManagement
       0x1b0b0a000 -        0x1b0b0a357  libswiftCoreGraphics.dylib (17) <DD6D3B10-645E-312D-84E9-A24EEDFCFA42> /usr/lib/swift/libswiftCoreGraphics.dylib
       0x1b0b0b000 -        0x1b0b0d707  libswiftDarwin.dylib (377.160.5) <1DB56DA9-CF6B-3023-ABDF-5A37CB79223C> /usr/lib/swift/libswiftDarwin.dylib
       0x1b0c03000 -        0x1b22a9b3f  com.apple.WebKit (21624 - 21624.5.1.11.3) <844AF253-CAF6-3623-9DAD-A055C5274E62> /System/Library/Frameworks/WebKit.framework/Versions/A/WebKit
       0x1b26f6000 -        0x1b26f6517  com.apple.CorePDF (4.0 - 555) <27BB4B14-7431-35F6-B8D0-178DE1F0BE1F> /System/Library/PrivateFrameworks/CorePDF.framework/Versions/A/CorePDF
       0x1b26f7000 -        0x1b26f7817  com.apple.Carbon (160 - 170) <0BA2D774-3930-3CC1-8EEB-978659830298> /System/Library/Frameworks/Carbon.framework/Versions/A/Carbon
       0x1b26f8000 -        0x1b2a9229f  com.apple.coremotion (3077.0.4 - 3077.0.4) <2E109991-45C6-3783-8A36-B6A8070AAD67> /System/Library/Frameworks/CoreMotion.framework/Versions/A/CoreMotion
       0x1b2afa000 -        0x1b2afa5a7  com.apple.avfoundation (2.0 - 2430.13.1) <816EC446-7C41-3A2F-A582-7CB856797C09> /System/Library/Frameworks/AVFoundation.framework/Versions/A/AVFoundation
       0x1b2c2e000 -        0x1b2d174df  libquic.dylib (5812.160.9) <5E89267F-C684-348D-8356-F9DAD8B4CB13> /usr/lib/libquic.dylib
       0x1b2d1c000 -        0x1b2d224af  com.apple.EmbeddedOSSupportHost (1.0 - 1) <C4C50C4C-7870-3F5E-B92A-173555D4404F> /System/Library/PrivateFrameworks/EmbeddedOSSupportHost.framework/Versions/A/EmbeddedOSSupportHost
       0x1b2d23000 -        0x1b2d4bedf  com.apple.private.SystemPolicy (1.0 - 1) <6108A12D-286B-3CF2-B848-B0E7A0189DCC> /System/Library/PrivateFrameworks/SystemPolicy.framework/Versions/A/SystemPolicy
       0x1b2d4c000 -        0x1b2d7385f  com.apple.icloud.FindMyDevice (1.0 - 1) <627D64D5-2D3C-3EC6-B4AB-FEF4DEE40871> /System/Library/PrivateFrameworks/FindMyDevice.framework/Versions/A/FindMyDevice
       0x1b3129000 -        0x1b315195f  com.apple.sidecar-core (1.0 - 384.1) <564D70BF-F605-3B57-8FF3-C8F9AD02B0B4> /System/Library/PrivateFrameworks/SidecarCore.framework/Versions/A/SidecarCore
       0x1b3152000 -        0x1b3157edf  com.apple.QuickLookNonBaseSystem (1.0 - 1) <A9BE8DB8-3F96-3D0F-B1B2-E462FEBE135D> /System/Library/PrivateFrameworks/QuickLookNonBaseSystem.framework/Versions/A/QuickLookNonBaseSystem
       0x1b3158000 -        0x1b31945df  com.apple.datadetectors (5.0 - 469.2) <AA0418DE-949D-3B7C-98D4-FC4D28738595> /System/Library/PrivateFrameworks/DataDetectors.framework/Versions/A/DataDetectors
       0x1b3386000 -        0x1b341bfbf  com.apple.CoreRoutine (1.0 - 1075.0.3) <D7F83B22-71A9-33CC-A6A8-EBF82854369E> /System/Library/PrivateFrameworks/CoreRoutine.framework/Versions/A/CoreRoutine
       0x1b341c000 -        0x1b343f97f  com.apple.mediastream (1.0 - 860.0.170) <FBCDB87E-551C-3251-AB26-B76FF9F182DC> /System/Library/PrivateFrameworks/MediaStream.framework/Versions/A/MediaStream
       0x1b3777000 -        0x1b377bde3  com.apple.CoreOptimization (1.0 - 1) <29E08673-E431-3E9A-84F3-8AE7C3A12D94> /System/Library/PrivateFrameworks/CoreOptimization.framework/Versions/A/CoreOptimization
       0x1b377c000 -        0x1b378fe1f  com.apple.FeatureFlagsSupport (1.0 - 103) <8C10B437-C282-37F5-834F-E7179C700373> /System/Library/PrivateFrameworks/FeatureFlagsSupport.framework/Versions/A/FeatureFlagsSupport
       0x1b3790000 -        0x1b37959ff  com.apple.incomingcallfilter (10.0 - 1000) <120AE842-DC77-3DFB-8FB0-C4230667AFD6> /System/Library/PrivateFrameworks/IncomingCallFilter.framework/Versions/A/IncomingCallFilter
       0x1b3796000 -        0x1b37fe21f  com.apple.facetimeservices (10.0 - 1000) <0E78989C-854F-3664-AD92-6B7B6D04191C> /System/Library/PrivateFrameworks/FTServices.framework/Versions/A/FTServices
       0x1b37ff000 -        0x1b381453f  com.apple.CoreSDB (10.0 - 1000) <5B8C8B3E-BCAB-3D44-9925-BA316EAFD3D7> /System/Library/PrivateFrameworks/CoreSDB.framework/Versions/A/CoreSDB
       0x1b38ab000 -        0x1b38c7b1f  com.apple.contacts.donation (1.0 - 1123.700.1) <C8B69116-D74B-3802-8C21-940E640C3118> /System/Library/PrivateFrameworks/ContactsDonation.framework/Versions/A/ContactsDonation
       0x1b38c8000 -        0x1b394185f  com.apple.NaturalLanguage (1.0 - 114) <0C005C4D-CA12-389C-9CCE-C4ED05B187E8> /System/Library/Frameworks/NaturalLanguage.framework/Versions/A/NaturalLanguage
       0x1b3942000 -        0x1b396ae7f  com.apple.SafariServices.framework (21624 - 21624.5.1.11.3) <E7EB8682-FDD6-34D0-A821-024DB637CD68> /System/Library/Frameworks/SafariServices.framework/Versions/A/SafariServices
       0x1b3982000 -        0x1b3a10b3f  com.apple.Catalyst (1.0 - 18.100.1) <E4027B2A-537B-33B9-8FF1-3B50BA8DAACC> /System/Library/PrivateFrameworks/Catalyst.framework/Versions/A/Catalyst
       0x1b3a37000 -        0x1b3a7eddf  com.apple.LocalAuthentication.DaemonUtils (1.0 - 2005.160.7) <A0C4A93B-81E4-3195-97E7-6C598DC03735> /System/Library/Frameworks/LocalAuthentication.framework/Support/DaemonUtils.framework/Versions/A/DaemonUtils
       0x1b3a7f000 -        0x1b3ac56ff  com.apple.BiometricKit (1.0 - 545.100.10) <6F344FB8-438F-3C17-9FAB-F1CE425B3F9B> /System/Library/PrivateFrameworks/BiometricKit.framework/Versions/A/BiometricKit
       0x1b3c08000 -        0x1b3c96bff  com.apple.LoggingSupport (1.0 - 1861.160.4) <DAB7DFDC-BE61-3164-B741-A753F6CD2E7E> /System/Library/PrivateFrameworks/LoggingSupport.framework/Versions/A/LoggingSupport
       0x1b3c97000 -        0x1b3ca3acb  com.apple.MallocStackLogging (1.0 - 65000) <566F2D7D-0F3B-3290-A739-7A40A151F0BE> /System/Library/PrivateFrameworks/MallocStackLogging.framework/Versions/A/MallocStackLogging
       0x1b3ca7000 -        0x1b3cc8aff  com.apple.StorageManagement (1.0 - 1) <F782028C-52B1-3633-92CA-8FB4E093C403> /System/Library/PrivateFrameworks/StorageManagement.framework/Versions/A/StorageManagement
       0x1b3cc9000 -        0x1b3d23d9f  libmis.dylib (463.160.2) <173A632F-20F3-30C1-BC55-EFFE977BBB8E> /usr/lib/libmis.dylib
       0x1b3d24000 -        0x1b3d27c5f  com.apple.gpusw.GPURawCounter (34 - 34) <03470B3A-A004-39A0-B6A4-F2A4AFFFCDD3> /System/Library/PrivateFrameworks/GPURawCounter.framework/Versions/A/GPURawCounter
       0x1b3d28000 -        0x1b3d4787f  libswiftCoreAudio.dylib (411.701) <CAFCB013-F154-361D-8A8C-062C63BBA8FC> /usr/lib/swift/libswiftCoreAudio.dylib
       0x1b3d48000 -        0x1b3d4e327  libswiftCoreFoundation.dylib (2411) <4975D13C-2AC5-3473-85C0-98054A81D7C6> /usr/lib/swift/libswiftCoreFoundation.dylib
       0x1b3d4f000 -        0x1b3d5a4bf  libswiftIntents.dylib (12) <52E271D5-23AF-3AD9-9543-D4A1004F43EE> /usr/lib/swift/libswiftIntents.dylib
       0x1b3d5b000 -        0x1b3da7843  libswiftXPC.dylib (128.120.2) <24AEDAC1-C1EE-30F4-8818-72EBF8969D0C> /usr/lib/swift/libswiftXPC.dylib
       0x1b3da8000 -        0x1b3da87ff  libswiftCoreImage.dylib (2.2) <A543AEBB-52DB-3028-BAC0-650F22C04BC8> /usr/lib/swift/libswiftCoreImage.dylib
       0x1b3da9000 -        0x1b3da98a3  libswiftIOKit.dylib (1) <06A92787-4440-3757-AF32-F2B331C753A2> /usr/lib/swift/libswiftIOKit.dylib
       0x1b3daa000 -        0x1b420baff  com.apple.CoreHandwriting (161 - 1.2) <45B2A604-B7C0-3AEA-A016-F1FFEF75370B> /System/Library/PrivateFrameworks/CoreHandwriting.framework/Versions/A/CoreHandwriting
       0x1b420c000 -        0x1b443e8df  com.apple.imageKit (3.0 - 1236.5.2) <3BBE296E-0997-3D3B-B0BB-13B621FDB74C> /System/Library/Frameworks/Quartz.framework/Versions/A/Frameworks/ImageKit.framework/Versions/A/ImageKit
       0x1b443f000 -        0x1b460299f  com.apple.PencilKit (1.0 - 1) <7D57DA6B-1AC6-39F4-B779-03263DACCAC4> /System/Library/Frameworks/PencilKit.framework/Versions/A/PencilKit
       0x1b4603000 -        0x1b4617a7f  com.apple.sidecar-ui (1.0 - 384.1) <EA68B1F5-EBB7-3668-89CC-031BBA5C9479> /System/Library/PrivateFrameworks/SidecarUI.framework/Versions/A/SidecarUI
       0x1b4618000 -        0x1b462629f  com.apple.performance.SignpostCollection (1.174.8 - 174.8) <6B2EFD01-ACAC-394A-8225-4255D9708B88> /System/Library/PrivateFrameworks/SignpostCollection.framework/Versions/A/SignpostCollection
       0x1b4627000 -        0x1b46272c7  com.apple.WebInspectorUI (21624 - 21624.5.1.11.3) <9A5EFDC4-27BD-34F3-BE1A-F23847F786A0> /System/Library/PrivateFrameworks/WebInspectorUI.framework/Versions/A/WebInspectorUI
       0x1b4628000 -        0x1b46691ff  com.apple.OnBoardingKit (1.0 - 1) <AF26FA73-58E2-341D-9232-80152A83BE17> /System/Library/PrivateFrameworks/OnBoardingKit.framework/Versions/A/OnBoardingKit
       0x1b4708000 -        0x1b471717f  com.apple.CoreKDL (1.0 - 1) <3284EBCB-D070-39D4-9EB7-7669BF823BA0> /System/Library/PrivateFrameworks/CoreKDL.framework/Versions/A/CoreKDL
       0x1b4718000 -        0x1b4796b1f  com.apple.TrialProto (1.0 - 474.2.18.2) <AEC3C71D-DC18-3279-ADFF-76EE82504B5F> /System/Library/PrivateFrameworks/TrialProto.framework/Versions/A/TrialProto
       0x1b4797000 -        0x1b48406ff  com.apple.trial (1.0 - 474.2.18.2) <53B3126E-7B01-30DD-961A-510E9CFC3CF1> /System/Library/PrivateFrameworks/Trial.framework/Versions/A/Trial
       0x1b4841000 -        0x1b4d1b45f  com.apple.SearchFoundation (1.0 - 3525.4.2) <D89498B3-0995-322A-BB57-D8B43FD3BC58> /System/Library/PrivateFrameworks/SearchFoundation.framework/Versions/A/SearchFoundation
       0x1b4d1c000 -        0x1b510a45f  com.apple.Photos (1.0 - 860.0.170) <C0B70412-992F-389A-AB2F-9ED3994097B6> /System/Library/Frameworks/Photos.framework/Versions/A/Photos
       0x1b510b000 -        0x1b5186dbf  com.apple.ImageCaptureCore (2020.2.2 - 2020.2.2) <25E03224-575B-3EC1-9A13-90A8DC95641B> /System/Library/Frameworks/ImageCaptureCore.framework/Versions/A/ImageCaptureCore
       0x1b5187000 -        0x1b51af9bf  com.apple.quartzfilters (1.10.0 - 103) <B3527256-6287-31C3-BEFD-EB9D1BEEDF8D> /System/Library/Frameworks/Quartz.framework/Versions/A/Frameworks/QuartzFilters.framework/Versions/A/QuartzFilters
       0x1b51b0000 -        0x1b51f6d1f  com.apple.IntlPreferences (2.0 - 475.4.1) <55047D18-C5A0-36E5-B448-FDD64F33D9F9> /System/Library/PrivateFrameworks/IntlPreferences.framework/Versions/A/IntlPreferences
       0x1b51f7000 -        0x1b523229f  com.apple.ToneLibrary (1.0 - 1) <A03DD8A0-4F52-368C-8D91-11F37FA6EC22> /System/Library/PrivateFrameworks/ToneLibrary.framework/Versions/A/ToneLibrary
       0x1b5233000 -        0x1b523beff  com.apple.CoreFollowUpUI (1.0 - 281.5.2) <204C234A-2889-3E5A-ACEC-146D1B86904E> /System/Library/PrivateFrameworks/CoreFollowUpUI.framework/Versions/A/CoreFollowUpUI
       0x1b5303000 -        0x1b53aae7f  com.apple.CallKit (1.0 - 1) <5C406396-BCC8-3A4A-A100-82F5C6B77DC3> /System/Library/Frameworks/CallKit.framework/Versions/A/CallKit
       0x1b53ab000 -        0x1b54cfd1f  com.apple.ScreenTimeCore (3.0 - 605.6.5) <4717EEFF-406D-3FA1-9C76-49DFB48F91AB> /System/Library/PrivateFrameworks/ScreenTimeCore.framework/Versions/A/ScreenTimeCore
       0x1b54da000 -        0x1b54f3c7f  com.apple.contextkit.ContextKit (1.0 - 1) <9E1E728C-644B-3663-8AD0-3583C7DAD067> /System/Library/PrivateFrameworks/ContextKit.framework/Versions/A/ContextKit
       0x1b54f4000 -        0x1b56e485f  com.apple.Safari.Core (21624 - 21624.5.1.11.3) <C036D9FE-0DB5-3D68-B36D-85F7F93FF18F> /System/Library/PrivateFrameworks/SafariCore.framework/Versions/A/SafariCore
       0x1b59e4000 -        0x1b5dd495f  com.apple.iTunesCloud (1.0 - 4025.700.1) <A53FF70A-EA08-34FE-A5A6-09FFC49B16C2> /System/Library/PrivateFrameworks/iTunesCloud.framework/Versions/A/iTunesCloud
       0x1b5ddb000 -        0x1b5e142c7  libbootpolicy.dylib (289.160.2) <B5133C2D-C0A5-34C3-BF53-A59FBDDCEEDA> /usr/lib/libbootpolicy.dylib
       0x1b5e15000 -        0x1b5f60f1f  com.apple.AnnotationKit (1.0 - 560.4.2) <AFBA7D4B-F057-3C1E-9805-19E2B07D07C8> /System/Library/PrivateFrameworks/AnnotationKit.framework/Versions/A/AnnotationKit
       0x1b5f61000 -        0x1b64417bf  com.apple.QuartzComposer (5.1 - 387) <3C4FCC73-F576-361E-A488-E25CDDEF881A> /System/Library/Frameworks/Quartz.framework/Versions/A/Frameworks/QuartzComposer.framework/Versions/A/QuartzComposer
       0x1b6442000 -        0x1b656a61f  com.apple.PDFKit (1.0 - 1451.5.3) <E033639D-2114-3B09-9170-4E574FC168F8> /System/Library/Frameworks/PDFKit.framework/Versions/A/PDFKit
       0x1b656b000 -        0x1b6b9937f  com.apple.SceneKit (1.0 - 608.600) <87E8A500-E395-30C4-A81B-9E8FA480516F> /System/Library/Frameworks/SceneKit.framework/Versions/A/SceneKit
       0x1b6eb4000 -        0x1b6ebeb1f  com.apple.BridgeXPC (1.0 - 39) <D4DD0F6D-9490-35F3-ABA8-8A519F2FEB8F> /System/Library/PrivateFrameworks/BridgeXPC.framework/Versions/A/BridgeXPC
       0x1b6ebf000 -        0x1b6eed9df  com.apple.skp.FeedbackLogger (1.0 - 1) <D636CE5D-CC59-3EA5-9336-20DB0DAF6E85> /System/Library/PrivateFrameworks/FeedbackLogger.framework/Versions/A/FeedbackLogger
       0x1b6eee000 -        0x1b714dabf  com.apple.AppleMediaServicesUI (1.0 - 1) <76839F27-69FD-3BFB-ABD8-C295ED476C7D> /System/Library/PrivateFrameworks/AppleMediaServicesUI.framework/Versions/A/AppleMediaServicesUI
       0x1b714e000 -        0x1b71701ff  com.apple.DistributionKit (700 - 1000) <5B7E4258-2BC1-32C9-BE02-FA31AA8AD68F> /System/Library/PrivateFrameworks/Install.framework/Frameworks/DistributionKit.framework/Versions/A/DistributionKit
       0x1b7171000 -        0x1b71c679f  com.apple.OSPersonalization (1.0 - 149) <E9F4EE9E-FBD7-34C3-85CA-0FB8FD710998> /System/Library/PrivateFrameworks/OSPersonalization.framework/Versions/A/OSPersonalization
       0x1b76da000 -        0x1b7738c5f  com.apple.CommerceKit (1.2.0 - 716.4.2) <02E0A066-F2A8-39E7-967F-734DDF718941> /System/Library/PrivateFrameworks/CommerceKit.framework/Versions/A/CommerceKit
       0x1b7739000 -        0x1b773e95f  com.apple.ServerInformation (2.0 - 1) <5C3E2114-009C-3386-808E-E9D289200FD5> /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/ServerInformation
       0x1b773f000 -        0x1b776425f  com.apple.icloud.FMCore (1.0 - 1) <8C18B1AE-91F4-3BBA-81CA-22A2CB8A6B22> /System/Library/PrivateFrameworks/FMCore.framework/Versions/A/FMCore
       0x1b78a2000 -        0x1b78b988b  libswiftsimd.dylib (23) <CB6EF41A-C18E-3EDA-B68C-CCB0E36EE662> /usr/lib/swift/libswiftsimd.dylib
       0x1b78ba000 -        0x1b7af6edf  com.apple.CallHistory (1.0 - 106.700.62.1.1) <274B53D4-E4AA-3104-A58C-02BC43D1F22A> /System/Library/PrivateFrameworks/CallHistory.framework/Versions/A/CallHistory
       0x1b7af7000 -        0x1b7b21c9f  com.apple.MobileInstallation (2.0 - 1.0) <7857BDF9-1B1F-315E-9FB7-E15AC3088320> /System/Library/PrivateFrameworks/MobileInstallation.framework/Versions/A/MobileInstallation
       0x1b7b30000 -        0x1b7d070ff  com.apple.TextInput (1.0 - 1.0) <1D5DF9CA-41FC-3B7B-B19F-2C435F3A66F2> /System/Library/PrivateFrameworks/TextInput.framework/Versions/A/TextInput
       0x1b7ef8000 -        0x1b890497f  com.apple.PhotoLibraryServices (1.0 - 860.0.170) <C3B19293-8E6B-36F4-B76B-B4FF05A79520> /System/Library/PrivateFrameworks/PhotoLibraryServices.framework/Versions/A/PhotoLibraryServices
       0x1b893a000 -        0x1b8aa871f  com.apple.PeopleSuggester (1.0 - 1) <8C5D6EEF-C4EF-3F0E-9240-67323CFF1217> /System/Library/PrivateFrameworks/PeopleSuggester.framework/Versions/A/PeopleSuggester
       0x1b8ae9000 -        0x1b8af675f  com.apple.CaptiveNetworkSupport (13.0 - 1) <5B73C216-2ACE-3F8C-A2B3-7D35D5D0395A> /System/Library/PrivateFrameworks/CaptiveNetwork.framework/Versions/A/CaptiveNetwork
       0x1b8c68000 -        0x1b8cce35f  com.apple.StoreFoundation (1.0 - 716.4.2) <5A4CAF47-0E45-30D8-AA99-839ECE19180C> /System/Library/PrivateFrameworks/StoreFoundation.framework/Versions/A/StoreFoundation
       0x1b8f71000 -        0x1b8f8b37f  com.apple.LookupFramework (1.2 - 321.3) <3D9E646F-E021-3B38-9D2F-9B766D6AB2C1> /System/Library/PrivateFrameworks/Lookup.framework/Versions/A/Lookup
       0x1b8f8c000 -        0x1b8fc82af  libncurses.5.4.dylib (79) <9EB04E94-EE2D-38A5-A214-00AF73DBE4E9> /usr/lib/libncurses.5.4.dylib
       0x1b8fc9000 -        0x1b8fd237f  com.apple.IOAccelMemoryInfo (1.0 - 1) <E6505525-75F4-380E-A9D7-7C5721260925> /System/Library/PrivateFrameworks/IOAccelMemoryInfo.framework/Versions/A/IOAccelMemoryInfo
       0x1b905a000 -        0x1b905a677  com.apple.quartzframework (1.5 - 26) <A18F5092-B6FA-3337-92D7-FBED7E8A903F> /System/Library/Frameworks/Quartz.framework/Versions/A/Quartz
       0x1b90e6000 -        0x1b910557f  com.apple.IntentsCore (1.0 - 1) <ADAE4AC0-853A-3807-B494-55C451A6F464> /System/Library/PrivateFrameworks/IntentsCore.framework/Versions/A/IntentsCore
       0x1b9106000 -        0x1b91bc13f  com.apple.NearField (366.9.1 - 366.9.1) <DE84FDB5-F9B4-32E9-99EF-7BF95BF028D8> /System/Library/PrivateFrameworks/NearField.framework/Versions/A/NearField
       0x1b91bd000 -        0x1b91ce6b7  com.apple.GPUInfo (1.3.15 - 1.3.15) <3C2C7308-9405-3B42-895E-0616BAAF6E17> /System/Library/PrivateFrameworks/GPUInfo.framework/Versions/A/GPUInfo
       0x1b91cf000 -        0x1b91d7cbf  com.apple.BridgeOSSoftwareUpdate (1.0 - 1) <9D2C256C-11F0-38F0-9AD3-5A40552A898B> /System/Library/PrivateFrameworks/BridgeOSSoftwareUpdate.framework/Versions/A/BridgeOSSoftwareUpdate
       0x1b91d8000 -        0x1b91e7d3f  com.apple.InstallerDiagnostics (1.0 - 1) <2298BADF-CB2D-37F2-B68C-69534B4DE558> /System/Library/PrivateFrameworks/InstallerDiagnostics.framework/Versions/A/InstallerDiagnostics
       0x1b921b000 -        0x1b940b75f  com.apple.AOSKit (1.07 - 282) <44CD8313-2D5B-3A34-BACA-EF8800803B4A> /System/Library/PrivateFrameworks/AOSKit.framework/Versions/A/AOSKit
       0x1b9760000 -        0x1ba65b55f  com.apple.siri.SiriInstrumentation (1.0 - 1) <8A5E0FF6-3116-3082-A0AD-20DCD6C5E1B4> /System/Library/PrivateFrameworks/SiriInstrumentation.framework/Versions/A/SiriInstrumentation
       0x1ba677000 -        0x1ba6980ff  libswiftCoreLocation.dylib (53) <368BC882-02B9-38AB-89B4-F62430F2B8EB> /usr/lib/swift/libswiftCoreLocation.dylib
       0x1ba699000 -        0x1ba6a20be  libswiftCoreMIDI.dylib (6) <7AE04E20-83FD-3B1B-8846-E9869AD98DB5> /usr/lib/swift/libswiftCoreMIDI.dylib
       0x1ba6de000 -        0x1baa3fb1f  com.apple.IMDPersistence (10.0 - 1000) <CE8B89D9-9557-3E6A-BA24-A2AB5A3AB51B> /System/Library/PrivateFrameworks/IMDPersistence.framework/Versions/A/IMDPersistence
       0x1baa40000 -        0x1baa463bf  com.apple.idskvstore (10.0 - 1000) <06AC8371-3314-3CEA-A2B8-21D5FA79C42F> /System/Library/PrivateFrameworks/IDSKVStore.framework/Versions/A/IDSKVStore
       0x1baa47000 -        0x1baa75adf  com.apple.LocalAuthenticationUI (1.0 - 2005.160.7) <3B78349C-ACFD-3066-9FAC-8909D90DE6D8> /System/Library/PrivateFrameworks/LocalAuthenticationUI.framework/Versions/A/LocalAuthenticationUI
       0x1bab35000 -        0x1bacd127f  com.apple.AddressBook.framework (14.0 - 2732.700.1) <EB6F4A91-93CA-3073-94DE-25069879D4B9> /System/Library/Frameworks/AddressBook.framework/Versions/A/AddressBook
       0x1bacd2000 -        0x1bacf33df  com.apple.ToneKit (1.0 - 1) <E41CD591-8E57-3123-A80E-A62954B14063> /System/Library/PrivateFrameworks/ToneKit.framework/Versions/A/ToneKit
       0x1bacf4000 -        0x1bad9303f  com.apple.AppStoreDaemon (1.0 - 1) <374F88EF-3198-3954-A0EF-929A78DE6B1E> /System/Library/PrivateFrameworks/AppStoreDaemon.framework/Versions/A/AppStoreDaemon
       0x1bae8a000 -        0x1bae90bbf  com.apple.MSUDataAccessor (1.0 - 1) <FC49965D-D149-30F8-A403-EED6A2ED8C1D> /System/Library/PrivateFrameworks/MSUDataAccessor.framework/Versions/A/MSUDataAccessor
       0x1baf4f000 -        0x1baf7d53f  libnfshared.dylib (366.9.1) <2E4A5573-E542-3819-A0E8-10B1AF4A603C> /usr/lib/libnfshared.dylib
       0x1baf7e000 -        0x1bb17adbf  com.apple.Navigation (1.0 - 1) <69DE77F0-33BB-349D-8C57-E25F82F416BD> /System/Library/PrivateFrameworks/Navigation.framework/Versions/A/Navigation
       0x1bb17b000 -        0x1bb1950df  com.apple.ExternalAccessory (1.0.0 - 1.0) <E1ECB67F-B0F7-3CBC-97D7-A691DAD7A70D> /System/Library/Frameworks/ExternalAccessory.framework/ExternalAccessory
       0x1bb196000 -        0x1bb1b041f  com.apple.IAP (1.0 - 1.0.0) <75A56CF3-5436-3553-8399-2D90E94A2158> /System/Library/PrivateFrameworks/IAP.framework/Versions/A/IAP
       0x1bb2b3000 -        0x1bb315ddf  com.apple.SoftwareUpdateCoreSupport (1.0 - 1) <13271AA6-33EA-369B-B2D1-6EC528C820E7> /System/Library/PrivateFrameworks/SoftwareUpdateCoreSupport.framework/Versions/A/SoftwareUpdateCoreSupport
       0x1bb330000 -        0x1bb33365f  com.apple.ftclientservices (10.0 - 1000) <6FDBE419-3EDF-3BE6-9416-723083414B22> /System/Library/PrivateFrameworks/FTClientServices.framework/Versions/A/FTClientServices
       0x1bb3e4000 -        0x1bb53e6df  com.apple.chronoservices (1) <A4949FFB-1C73-391F-A1C4-A16FC60B85BF> /System/Library/PrivateFrameworks/ChronoServices.framework/Versions/A/ChronoServices
       0x1bb540000 -        0x1bb6ed0ff  com.apple.AOSUI (1.2 - 898.475.7) <34F1CFEF-9C6D-3208-AA10-A757C3E208AA> /System/Library/PrivateFrameworks/AOSUI.framework/Versions/A/AOSUI
       0x1bb6ee000 -        0x1bb6fbb1f  com.apple.icloud.FindMyDeviceUI (1.0 - 18) <204C80BE-7070-3EE5-83F4-BF7E4681CBC4> /System/Library/PrivateFrameworks/FindMyDeviceUI.framework/Versions/A/FindMyDeviceUI
       0x1bb741000 -        0x1bb775c7f  libtailspin.dylib (250.2) <DE7FBAB6-1A85-3819-8FEC-52363C2B8D07> /usr/lib/libtailspin.dylib
       0x1bb776000 -        0x1bcec505f  com.apple.SwiftUI (7.6.1 - 7.6.1) <53E79875-60E4-3B8D-BA48-02F6A4CBC429> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x1bcec6000 -        0x1bcf0b0ff  com.apple.AttributeGraph (7.0.80 - 7.0.80) <DDC826E2-4B0E-35CA-AAB1-82A1DC9EA6B4> /System/Library/PrivateFrameworks/AttributeGraph.framework/Versions/A/AttributeGraph
       0x1bcf0c000 -        0x1bcf9061f  com.apple.EmojiFoundation (1.0 - 1) <7D83C940-4672-316C-AFC6-8224586D3136> /System/Library/PrivateFrameworks/EmojiFoundation.framework/Versions/A/EmojiFoundation
       0x1bcf91000 -        0x1bd07c75f  com.apple.CoreCDPInternal (1.0 - 1) <3E4B5FD9-D71B-3388-96D7-145F32582190> /System/Library/PrivateFrameworks/CoreCDPInternal.framework/Versions/A/CoreCDPInternal
       0x1bd07d000 -        0x1bd92369f  libfaceCore.dylib (9.5.4) <B2639747-7640-3F66-8F79-88B1D5F2D73E> /System/Library/Frameworks/Vision.framework/libfaceCore.dylib
       0x1bd924000 -        0x1bdb9659f  com.apple.TextRecognition (1.0 - 157) <CFD587AE-FA26-3FFB-A13A-FE831357A6F8> /System/Library/PrivateFrameworks/TextRecognition.framework/Versions/A/TextRecognition
       0x1bdb97000 -        0x1bdbae25f  com.apple.Futhark (1.0 - 1) <EB12CF22-B952-3DB7-8A2E-7E702969D1F6> /System/Library/PrivateFrameworks/Futhark.framework/Versions/A/Futhark
       0x1bdbaf000 -        0x1bdc3f31f  com.apple.DifferentialPrivacy (1.0 - 1) <354B4195-65BF-3612-A19B-5AAA76BEFB18> /System/Library/PrivateFrameworks/DifferentialPrivacy.framework/Versions/A/DifferentialPrivacy
       0x1bdc40000 -        0x1bdc8619f  com.apple.SafariFoundation (21624 - 21624.5.1.11.3) <3AD61681-1888-3C37-88A4-B2106FBFD959> /System/Library/PrivateFrameworks/SafariFoundation.framework/Versions/A/SafariFoundation
       0x1be0ef000 -        0x1be128ba7  com.apple.MobileBluetooth (1.0 - 1.0) <DCA62E59-D3A2-30FF-802E-A4BC6AAF8C52> /System/Library/PrivateFrameworks/MobileBluetooth.framework/Versions/A/MobileBluetooth
       0x1be12f000 -        0x1be2aa1bf  com.apple.AuthenticationServices (12.0 - 21624.5.1.11.3) <3EA6D869-973E-39BC-B2DC-327B7C887704> /System/Library/Frameworks/AuthenticationServices.framework/Versions/A/AuthenticationServices
       0x1bede0000 -        0x1bee3725f  com.apple.biome.BiomeFoundation (1.0 - 209.21) <455A5553-E683-30B4-A906-1F14E75F6E61> /System/Library/PrivateFrameworks/BiomeFoundation.framework/Versions/A/BiomeFoundation
       0x1bee38000 -        0x1bee3ccff  com.apple.DAAPKit (1.0 - 4025.500.37) <0C05FB05-517C-3848-A803-A0FA6BB223BB> /System/Library/PrivateFrameworks/DAAPKit.framework/Versions/A/DAAPKit
       0x1beec3000 -        0x1bef875ff  com.apple.icloud.SPOwner (1.0 - 423.26.4.19.2) <025FD94D-4DD5-3C03-983B-F67144ECB5D3> /System/Library/PrivateFrameworks/SPOwner.framework/Versions/A/SPOwner
       0x1c1a39000 -        0x1c1ae497f  com.apple.cloudkit.MMCS (1.3 - 2300.120) <4EFB942C-3DCA-345F-9307-5492E0025F3E> /System/Library/PrivateFrameworks/MMCS.framework/Versions/A/MMCS
       0x1c1ae5000 -        0x1c1b5c3df  com.apple.acg.InertiaCam (1.0 - 1) <DB1FBDD7-AF19-31FC-BAB2-3BA5C4534436> /System/Library/PrivateFrameworks/InertiaCam.framework/Versions/A/InertiaCam
       0x1c1bcb000 -        0x1c1ce7a9f  com.apple.ConfigurationEngineModel (1.0 - 249.100.1) <8658C591-BA4D-3475-A6E2-5C01A0D619FC> /System/Library/PrivateFrameworks/ConfigurationEngineModel.framework/Versions/A/ConfigurationEngineModel
       0x1c1d1e000 -        0x1c1d2ba1f  libswiftMetal.dylib (373.7) <7235A6A9-49B2-3B94-9DD6-C987019CDBF2> /usr/lib/swift/libswiftMetal.dylib
       0x1c1d2c000 -        0x1c1d32e05  libswiftCompression.dylib (11) <856ACB2A-3334-3BA6-AAC8-8F344E7CDB83> /usr/lib/swift/libswiftCompression.dylib
       0x1c20ce000 -        0x1c20e00df  com.apple.SpotlightReceiver (1.0 - 2418.6.3.9.400) <E79B613F-82F8-36DF-8E39-D59D8CD6C96E> /System/Library/PrivateFrameworks/SpotlightReceiver.framework/Versions/A/SpotlightReceiver
       0x1c2353000 -        0x1c277775f  com.apple.imcore (10.0 - 1000) <7AE15235-831D-3DBB-86FD-C2DE0A54CD8F> /System/Library/PrivateFrameworks/IMCore.framework/Versions/A/IMCore
       0x1c2778000 -        0x1c27948bf  com.apple.ftawd (8.0 - 900) <2CA62C12-37B5-345A-BF79-5D05F43F6BFB> /System/Library/PrivateFrameworks/FTAWD.framework/Versions/A/FTAWD
       0x1c2c54000 -        0x1c2c5809f  com.apple.iChat.InstantMessage (8.0 - 5501) <680AF0AD-4FC8-37C1-A9F3-637A919089E2> /System/Library/Frameworks/InstantMessage.framework/Versions/A/InstantMessage
       0x1c2c65000 -        0x1c2d0fd7f  libFDR.dylib (1499.160.2) <BA9D87B5-421B-37B2-BEF3-F3E359C22B18> /usr/lib/libFDR.dylib
       0x1c2d10000 -        0x1c2d908ff  com.apple.TimeSync (1.0 - 1460.2) <EB86789A-20AD-3BF8-9101-B8C97A3BB9FC> /System/Library/PrivateFrameworks/TimeSync.framework/Versions/A/TimeSync
       0x1c2d91000 -        0x1c335c33f  com.apple.biome.BiomeStreams (1.0 - 209.21) <2110407D-EFB4-373E-B963-9C92E26594B2> /System/Library/PrivateFrameworks/BiomeStreams.framework/Versions/A/BiomeStreams
       0x1c335d000 -        0x1c336f4df  com.apple.framework.ctcategories (1.0 - 49.4.1) <4D8A492A-C5EB-3053-8C7D-EB13C61427EA> /System/Library/PrivateFrameworks/Categories.framework/Versions/A/Categories
       0x1c3830000 -        0x1c38448ff  com.apple.SoftwareUpdateCoreConnect (1.0 - 1) <2CA857AF-D999-34DC-94A1-3AC0E5B80416> /System/Library/PrivateFrameworks/SoftwareUpdateCoreConnect.framework/Versions/A/SoftwareUpdateCoreConnect
       0x1c385d000 -        0x1c38d65bf  com.apple.StorageKit (1.0 - 1037.160.3) <E69108D5-24F3-3629-AD1E-CF3557D36FC9> /System/Library/PrivateFrameworks/StorageKit.framework/Versions/A/StorageKit
       0x1c38d7000 -        0x1c391865f  com.apple.framework.corewlankit (16.0 - 1657) <D1F1EBD2-07D4-3D8C-A049-9A90BDAFF35B> /System/Library/PrivateFrameworks/CoreWLANKit.framework/Versions/A/CoreWLANKit
       0x1c49d4000 -        0x1c49ddb5f  com.apple.audio.IOKitten (300.1 - 300.1) <0BAB3589-8D81-3C60-9F05-9D207E89F4B6> /System/Library/PrivateFrameworks/IOKitten.framework/Versions/A/IOKitten
       0x1c4dd1000 -        0x1c4e0113f  com.apple.coreduet.KnowledgeMonitor (1.0 - 1) <EB05F313-C1FC-35FF-9D7D-F10BDE327C74> /System/Library/PrivateFrameworks/KnowledgeMonitor.framework/Versions/A/KnowledgeMonitor
       0x1c4e02000 -        0x1c4e47f5f  com.apple.UsageTracking (3.0 - 392.5.1) <CCF732A5-AAEF-35F8-84A2-4C7974439B60> /System/Library/PrivateFrameworks/UsageTracking.framework/Versions/A/UsageTracking
       0x1c4e48000 -        0x1c5c8727f  com.apple.VectorKit (1.0 - 2001.26.4.23.5) <868C6770-4AE0-3399-B3AA-072B3998EB32> /System/Library/PrivateFrameworks/VectorKit.framework/Versions/A/VectorKit
       0x1c5c88000 -        0x1c5cf2c1f  com.apple.osanalytics.OSAnalytics (1.0 - 1) <06728C4D-5750-308F-8290-EAF7BE91F4BB> /System/Library/PrivateFrameworks/OSAnalytics.framework/Versions/A/OSAnalytics
       0x1c5d1f000 -        0x1c5d9bb9f  com.apple.NetworkServiceProxyFramework (1.0 - 1) <2C93123F-99C8-3B8D-AAE6-3A817BE0A2BF> /System/Library/PrivateFrameworks/NetworkServiceProxy.framework/Versions/A/NetworkServiceProxy
       0x1c5dc8000 -        0x1c5dd365f  com.apple.CloudPhotoServicesConfiguration (11.0 - 860.0.170) <FC430FEA-4367-3CA9-BF32-EE42724B4D53> /System/Library/PrivateFrameworks/CloudPhotoServicesConfiguration.framework/Versions/A/CloudPhotoServicesConfiguration
       0x1c5df4000 -        0x1c604635f  com.apple.CloudPhotoLibrary (1.0 - 860.0.170) <C0D5EC01-1542-3859-8938-4CDD3FED39BA> /System/Library/PrivateFrameworks/CloudPhotoLibrary.framework/Versions/A/CloudPhotoLibrary
       0x1c606e000 -        0x1c63e4fa7  com.apple.SDAPI (1.0 - 1) <28614429-C9A4-390D-988D-FE6EFD5A9E72> /System/Library/PrivateFrameworks/SDAPI.framework/Versions/A/SDAPI
       0x1c70aa000 -        0x1c713d53f  com.apple.Transparency (1.0 - 1547.160.50) <907E5D64-C64D-3CAE-A2A6-3425B1CC9942> /System/Library/PrivateFrameworks/Transparency.framework/Versions/A/Transparency
       0x1c7144000 -        0x1c7145f9f  libswiftQuartzCore.dylib (5) <63444A8C-9E8C-3778-820D-1E0C88CA2DF7> /usr/lib/swift/libswiftQuartzCore.dylib
       0x1c7537000 -        0x1c753c8e7  com.apple.kperf (1.0 - 1) <F2E7C7C4-03B4-3341-91ED-DD5472BF3F3B> /System/Library/PrivateFrameworks/kperf.framework/Versions/A/kperf
       0x1c753d000 -        0x1c762e65f  com.apple.libktrace (1.0 - 683.100.8) <D338F7EC-A7ED-3B72-A809-73A873CF3AA7> /System/Library/PrivateFrameworks/ktrace.framework/Versions/A/ktrace
       0x1c762f000 -        0x1c763605f  com.apple.BezelServicesFW (374 - 374) <73CE9B34-0BA2-3E27-9EE5-D5C19C724A60> /System/Library/PrivateFrameworks/BezelServices.framework/Versions/A/BezelServices
       0x1c764e000 -        0x1c765363f  com.apple.MobileSystemServices (1.0 - 1) <4F3BEA3B-A363-3D04-B903-9B613C993CA1> /System/Library/PrivateFrameworks/MobileSystemServices.framework/Versions/A/MobileSystemServices
       0x1c76b6000 -        0x1c76e539f  com.apple.frameworks.preferencepanes (16.0 - 16.0) <65D22E75-EA20-3E2A-8FAA-F6C21F3634CD> /System/Library/Frameworks/PreferencePanes.framework/Versions/A/PreferencePanes
       0x1c76e6000 -        0x1c76eeb5f  com.apple.InAppMessagesCore (1.0 - 1) <F71508C4-8A64-3165-A092-B245CB586DCA> /System/Library/PrivateFrameworks/InAppMessagesCore.framework/Versions/A/InAppMessagesCore
       0x1c76ef000 -        0x1c77133ff  com.apple.InAppMessages (1.0 - 1) <35B9EE0B-959B-3D86-9D49-09E37EA8977B> /System/Library/PrivateFrameworks/InAppMessages.framework/Versions/A/InAppMessages
       0x1c7714000 -        0x1c77a075f  com.apple.EmailCore (11.0 - 3864.700.51.1.1) <6437B88E-9254-31B7-A56B-FDC60C0B8225> /System/Library/PrivateFrameworks/EmailCore.framework/Versions/A/EmailCore
       0x1c77e6000 -        0x1c77ebb3f  com.apple.FindMyMac (3.1 - 75.25.2.23.2) <3B0C503A-BF1C-3646-A2C1-7C1F9042ADFA> /System/Library/PrivateFrameworks/FindMyMac.framework/Versions/A/FindMyMac
       0x1c77ec000 -        0x1c77fba7f  com.apple.MobileActivation (1.0 - 1076.160.6) <090A5DA0-B676-35E9-9537-61DFA8DAAB68> /System/Library/PrivateFrameworks/MobileActivationMacOS.framework/Versions/A/MobileActivationMacOS
       0x1c7e42000 -        0x1c7e75b5f  com.apple.photo.MediaConversionService (11.0 - 860.0.170) <C28F0D1F-1E25-3D84-9FEE-E793A9401454> /System/Library/PrivateFrameworks/MediaConversionService.framework/Versions/A/MediaConversionService
       0x1c7e7d000 -        0x1c7f0a45f  com.apple.signpost.SignpostSupport (1.174.8 - 174.8) <EE821A99-A88C-3624-A5B5-12BA741F9D7B> /System/Library/PrivateFrameworks/SignpostSupport.framework/Versions/A/SignpostSupport
       0x1c7f0b000 -        0x1c8073b7f  com.apple.ModelIO (268.2.2 - 268.2.2) <2B833F70-9F61-3811-8991-91E9DD486579> /System/Library/Frameworks/ModelIO.framework/Versions/A/ModelIO
       0x1c8074000 -        0x1c80ab87f  com.apple.UIKitServices (1.0 - 9126.6.8) <C4A61DD1-1AEC-329E-A67E-388FB246CC34> /System/Library/PrivateFrameworks/UIKitServices.framework/Versions/A/UIKitServices
       0x1c80ac000 -        0x1c8256aff  com.apple.SampleAnalysis (1.0 - 427) <F8A24AA4-4298-398C-ABBB-9520DD956E5A> /System/Library/PrivateFrameworks/SampleAnalysis.framework/Versions/A/SampleAnalysis
       0x1c8330000 -        0x1c862beff  com.apple.photo.NeutrinoCore (1.0 - 860.0.170) <0E5D140D-D983-378C-B773-7E1A5B10E8B4> /System/Library/PrivateFrameworks/NeutrinoCore.framework/Versions/A/NeutrinoCore
       0x1c8809000 -        0x1c88b271f  com.apple.EmailFoundation (11.0 - 3864.700.51.1.1) <C2CAFE0C-6D56-3A42-A845-C1822E8AAF27> /System/Library/PrivateFrameworks/EmailFoundation.framework/Versions/A/EmailFoundation
       0x1c8b62000 -        0x1c8c3fc5f  libauthinstall.dylib (1104.160.1.0.1) <1FE27D78-2D1B-3EC7-B43F-86B8A675537A> /usr/lib/libauthinstall.dylib
       0x1c8c40000 -        0x1c8c6229f  libamsupport.dylib (434.160.4) <24D28E7F-A1AE-3031-8679-A0D6C6D68A86> /usr/lib/libamsupport.dylib
       0x1c8ce2000 -        0x1c8f59c7f  com.apple.Speech (1.0 - 1) <3E93C097-38C7-3C22-B12A-F04DA6425DB6> /System/Library/Frameworks/Speech.framework/Versions/A/Speech
       0x1c9037000 -        0x1c9039adf  com.apple.ScreenTimeServiceUI (3.0 - 605.6.5) <986109C8-990D-371C-AD79-8AC27334F6C0> /System/Library/PrivateFrameworks/ScreenTimeServiceUI.framework/Versions/A/ScreenTimeServiceUI
       0x1c903e000 -        0x1c909e0ff  com.apple.biome.BiomePubSub (1.0 - 209.21) <0F03104F-FC8B-3ADD-8850-4B7029E2B56E> /System/Library/PrivateFrameworks/BiomePubSub.framework/Versions/A/BiomePubSub
       0x1c909f000 -        0x1c90e219f  com.apple.biome.BiomeStorage (1.0 - 209.21) <D393CCA0-5E20-31D3-8E1A-70476551724B> /System/Library/PrivateFrameworks/BiomeStorage.framework/Versions/A/BiomeStorage
       0x1c921e000 -        0x1c921e7f1  libswiftCoreML.dylib (3520.5.1) <9CB9EADE-C520-3C6A-9EE2-690AE49EBF20> /usr/lib/swift/libswiftCoreML.dylib
       0x1c921f000 -        0x1c931aff7  libcrypto.42.dylib (109.100.2) <14EB2375-9E03-3A62-8B3A-D199B7AD27D4> /usr/lib/libcrypto.42.dylib
       0x1c93cd000 -        0x1c93e01ff  com.apple.private.XprotectFrameWork.XprotectFramework (1.0 - 1) <403E5E4C-EA7C-372C-AA75-81E6172B46B9> /System/Library/PrivateFrameworks/XprotectFramework.framework/Versions/A/XprotectFramework
       0x1c97dc000 -        0x1c9956cff  com.apple.LinkPresentation (296 - 296.12) <3334BA00-2399-3846-8788-C4D1A6202714> /System/Library/Frameworks/LinkPresentation.framework/Versions/A/LinkPresentation
       0x1c9bdd000 -        0x1c9d1c13f  com.apple.PhotosFormats (1.0 - 860.0.170) <1FCA1F6B-1343-3E5C-ABE9-6378C2459BAA> /System/Library/PrivateFrameworks/PhotosFormats.framework/Versions/A/PhotosFormats
       0x1ca7db000 -        0x1ca81065f  com.apple.DeviceIdentity (1.0 - 1) <962EA390-008E-3DDC-B2A5-7B2DAF6E8786> /System/Library/PrivateFrameworks/DeviceIdentity.framework/Versions/A/DeviceIdentity
       0x1cb939000 -        0x1cb944c1f  com.apple.EmailAddressing (11.0 - 3864.700.51.1.1) <D10ECC6E-E74B-3595-943A-8F0495F7CA4C> /System/Library/PrivateFrameworks/EmailAddressing.framework/Versions/A/EmailAddressing
       0x1cb945000 -        0x1cbaba51f  com.apple.Email (11.0 - 3864.700.51.1.1) <ACC9E84D-7A50-3D64-8591-F0F8BE2F3E7D> /System/Library/PrivateFrameworks/Email.framework/Versions/A/Email
       0x1cbabc000 -        0x1cbbdbfff  com.apple.CoreMediaStream (1.0 - 860.0.170) <7D80D948-D67E-3437-861E-F9D152CFEE08> /System/Library/PrivateFrameworks/CoreMediaStream.framework/Versions/A/CoreMediaStream
       0x1cbbdc000 -        0x1cbbeb13f  libswiftUniformTypeIdentifiers.dylib (877.5.1) <A83236CA-4417-3C27-B252-72923DB09F88> /usr/lib/swift/libswiftUniformTypeIdentifiers.dylib
       0x1cbbec000 -        0x1cbcb1a9b  libswiftAccelerate.dylib (77.100.2) <625F222D-6394-39B9-A1F2-12B9EA56DD85> /usr/lib/swift/libswiftAccelerate.dylib
       0x1cbe0a000 -        0x1cbe1b11f  libpartition2_dynamic.dylib (3476.160.2) <BA13DE06-6320-345A-A2E3-CC3C4EB06574> /usr/lib/libpartition2_dynamic.dylib
       0x1cc379000 -        0x1cc383fdf  com.apple.AFKUser (1.0 - 1) <E638FBE2-2BB6-3A8E-A1DF-D7B5AC9BE7B0> /System/Library/PrivateFrameworks/AFKUser.framework/Versions/A/AFKUser
       0x1cc8c7000 -        0x1cc8daaff  com.apple.dynamicdesktop (1.0 - 2427.6) <99F43E14-4756-381B-9CFC-6A909BF7ADFE> /System/Library/PrivateFrameworks/DynamicDesktop.framework/Versions/A/DynamicDesktop
       0x1ce3e1000 -        0x1ce65a5df  com.apple.photo.PhotoImaging (1.0 - 860.0.170) <9B16C55F-F2D4-3F1F-9209-EA30969FDB82> /System/Library/PrivateFrameworks/PhotoImaging.framework/Versions/A/PhotoImaging
       0x1ce831000 -        0x1ce83bb3f  com.apple.CPMS (1.0 - 1) <3E83115F-D04B-3C8D-8646-35204AA2DB84> /System/Library/PrivateFrameworks/CPMS.framework/Versions/A/CPMS
       0x1cf64d000 -        0x1cf68bf5f  com.apple.PhotosImagingFoundation (11.0 - 860.0.170) <49A95606-3391-316C-830E-C3F9093CC626> /System/Library/PrivateFrameworks/PhotosImagingFoundation.framework/Versions/A/PhotosImagingFoundation
       0x1cf68c000 -        0x1cf69a2df  com.apple.CloudPhotoServices (1.0 - 860.0.170) <E9F6937D-08D4-3E24-A41C-1E3C722AD5F5> /System/Library/PrivateFrameworks/CloudPhotoServices.framework/Versions/A/CloudPhotoServices
       0x1cf69b000 -        0x1cf6f4a9f  com.apple.acg.AutoLoop (1.0 - 1) <D8658CED-1DC7-3AA8-9AA6-54641851764C> /System/Library/PrivateFrameworks/AutoLoop.framework/Versions/A/AutoLoop
       0x1cf7ad000 -        0x1cfaa543f  com.apple.Osprey (1.0 - 1) <5FEA8C08-1577-3296-BC9C-7F3203E8EBFB> /System/Library/PrivateFrameworks/Osprey.framework/Versions/A/Osprey
       0x1cfd7d000 -        0x1cfdde75f  libswiftCoreMedia.dylib (3330.13.2) <BE970706-7E22-3C17-A8C1-BF3CDF685F21> /usr/lib/swift/libswiftCoreMedia.dylib
       0x1d1046000 -        0x1d104f38f  com.apple.kperfdata (1.0 - 1) <400B0E96-4869-37BE-9832-1A14C386148B> /System/Library/PrivateFrameworks/kperfdata.framework/Versions/A/kperfdata
       0x1d106c000 -        0x1d1077c9f  com.apple.Reveal (1.0 - 56) <F8F28F44-DC4D-3305-872F-5E86CF996F5C> /System/Library/PrivateFrameworks/Reveal.framework/Versions/A/Reveal
       0x1d1078000 -        0x1d107ef5f  com.apple.RevealCore (1.0 - 56) <120D21A6-07CB-3C7E-8BC5-019E0BD78195> /System/Library/PrivateFrameworks/RevealCore.framework/Versions/A/RevealCore
       0x1d151b000 -        0x1d152fcff  com.apple.BulkSymbolication (1.427 - 427) <6FBA9099-E428-3571-B940-0D210B6D0861> /System/Library/PrivateFrameworks/BulkSymbolication.framework/Versions/A/BulkSymbolication
       0x1d1530000 -        0x1d1531bbf  libswiftOSLog.dylib (10) <9670AE5C-271A-3DCB-9A0A-8E3A7CCC2726> /usr/lib/swift/libswiftOSLog.dylib
       0x1d17c9000 -        0x1d18115df  libswiftAVFoundation.dylib (2430.13.1) <CEBC9F85-34DA-3BAF-B8DE-75F99B8C8976> /usr/lib/swift/libswiftAVFoundation.dylib
       0x1d5646000 -        0x1d5752d5f  com.apple.Symbolication (16.0 - 64575.70.1) <724D42FC-F4FD-39C7-A1BF-D0AD086231F4> /System/Library/PrivateFrameworks/Symbolication.framework/Versions/A/Symbolication
       0x1d5753000 -        0x1d579491f  com.apple.ScreenTimeUI (3.0 - 605.6.5) <51B60AA5-FDF5-3E0C-87A2-0C456B28E3A1> /System/Library/PrivateFrameworks/ScreenTimeUI.framework/Versions/A/ScreenTimeUI
       0x1d5801000 -        0x1d581a19f  com.apple.performance.DiagnosticRequest (1.4 - 4) <16BEB0A9-9237-38A8-9AF7-5F0CA63F1E84> /System/Library/PrivateFrameworks/DiagnosticRequest.framework/Versions/A/DiagnosticRequest
       0x1d5e1d000 -        0x1d5e264d3  com.apple.framework.netrb (1.0 - 1) <B95CD77E-662A-3F10-89DB-114FBDC592C3> /System/Library/PrivateFrameworks/Netrb.framework/Versions/A/Netrb
       0x1d5e27000 -        0x1d5e5ad3f  com.apple.frameworks.preferencepanessupport (13.0 - 13.0) <F7699410-AA61-33D2-B6B0-05511F188508> /System/Library/PrivateFrameworks/PreferencePanesSupport.framework/Versions/A/PreferencePanesSupport
       0x1d5e5b000 -        0x1d5e7fc1f  com.apple.CoreMaterial (1.0 - 1) <C315F3B3-6DD7-3A29-8354-87027018A8DA> /System/Library/PrivateFrameworks/CoreMaterial.framework/Versions/A/CoreMaterial
       0x1d5fd5000 -        0x1d5fd73ff  com.apple.framework.machinesettings (11.0 - 11.0) <CBEBD4E9-C289-30D8-A5A1-E2E8BDA0F8CB> /System/Library/PrivateFrameworks/MachineSettings.framework/Versions/A/MachineSettings
       0x1d5fd8000 -        0x1d608435f  com.apple.CoreCDPUI (1.0 - 1) <78EA8F7B-C857-3BCD-822D-26516E548104> /System/Library/PrivateFrameworks/CoreCDPUI.framework/Versions/A/CoreCDPUI
       0x1d7c55000 -        0x1d7ce43df  com.apple.AppleCVA (1002.101.0 - 1002.101.0) <5DDE4D36-D04C-3CA9-9F9D-4FBB5BD50B03> /System/Library/PrivateFrameworks/AppleCVA.framework/Versions/A/AppleCVA
       0x1d9cda000 -        0x1d9cea3df  com.apple.OSLog (1.0 - 1861.160.4) <869F0693-0E82-38C1-8920-C782E71735CA> /System/Library/Frameworks/OSLog.framework/Versions/A/OSLog
       0x1d9fee000 -        0x1da0ff75f  com.apple.InternalSwiftProtobuf (1.0 - 1.26.0) <41F66F01-A342-3091-A832-0B2B645C922B> /System/Library/PrivateFrameworks/InternalSwiftProtobuf.framework/Versions/A/InternalSwiftProtobuf
       0x1da100000 -        0x1da10079f  com.apple.PassKit (1.0 - 1) <94414947-F03E-3F6F-8CA4-FC673AEF58FF> /System/Library/Frameworks/PassKit.framework/Versions/A/PassKit
       0x1da1c5000 -        0x1da1d00bf  com.apple.HIDDisplay (1.0 - 1) <0368EA7D-01B2-3AA9-A6D6-A2A0850AC800> /System/Library/PrivateFrameworks/HIDDisplay.framework/Versions/A/HIDDisplay
       0x1da1d1000 -        0x1da2256ff  com.apple.ReplayKit (1.0 - 1) <3F65FCB8-B060-3F78-8732-81C76E1FF5BF> /System/Library/Frameworks/ReplayKit.framework/Versions/A/ReplayKit
       0x1dc07c000 -        0x1dcb0197f  com.apple.BlastDoor (1.0 - 1) <9CB157B8-2EE1-32EC-B97B-6B8F75D7AD95> /System/Library/PrivateFrameworks/BlastDoor.framework/Versions/A/BlastDoor
       0x1dcdfb000 -        0x1dcea0cff  com.apple.security.CryptoKit (1.0 - 1) <C588CBA5-8055-3AA5-84F9-0C578349945E> /System/Library/Frameworks/CryptoKit.framework/Versions/A/CryptoKit
       0x1dd017000 -        0x1dd02e33f  com.apple.BluetoothManager (1.0 - 1) <52B3A722-F4B2-322E-872F-C3AF7F5B626F> /System/Library/PrivateFrameworks/BluetoothManager.framework/Versions/A/BluetoothManager
       0x1dd071000 -        0x1dd0a509f  com.apple.PassKitUIFoundation (1.0 - 1642.7.4) <0493F8C5-F69B-31E8-9688-C79159E5DC47> /System/Library/PrivateFrameworks/PassKitUIFoundation.framework/Versions/A/PassKitUIFoundation
       0x1de190000 -        0x1de1df23f  com.apple.RemoteConfiguration (3.0 - 401) <DF61454E-43B7-371F-B2A0-836452003E55> /System/Library/PrivateFrameworks/RemoteConfiguration.framework/Versions/A/RemoteConfiguration
       0x1e00b1000 -        0x1e00ced9f  libedit.3.dylib (65) <F04DD2EA-54F4-3A23-8A3B-7496E5B119F8> /usr/lib/libedit.3.dylib
       0x1e00e7000 -        0x1e01463ff  libswiftDemangle.dylib (6.3.2.1.11) <60AA3D31-3C31-3192-B3AD-4342F45D3E2B> /usr/lib/swift/libswiftDemangle.dylib
       0x1e01f0000 -        0x1e01f8d5f  com.apple.imtransferservices (10.0 - 1000) <19937DB8-81A3-3313-9269-FB9F38F1B115> /System/Library/PrivateFrameworks/IMTransferServices.framework/Versions/A/IMTransferServices
       0x1e13ea000 -        0x1e17509df  com.apple.newstransport (11.5 - 5890) <D55097FC-4BE3-39EF-8036-A3F2E9BB478B> /System/Library/PrivateFrameworks/NewsTransport.framework/Versions/A/NewsTransport
       0x1e17f6000 -        0x1e180599f  com.apple.newsfoundation (11.5 - 5890) <903F8E3F-6DA3-3D60-8DE2-4EEC046D8A73> /System/Library/PrivateFrameworks/NewsFoundation.framework/Versions/A/NewsFoundation
       0x1e1806000 -        0x1e1e41ddf  com.apple.newscore (11.5 - 5890) <89D53331-F916-3240-B58B-D44BAFA4743C> /System/Library/PrivateFrameworks/NewsCore.framework/Versions/A/NewsCore
       0x1e1ff7000 -        0x1e1ff86ff  com.apple.preferences.SystemDesktopAppearance (1.0 - 186.4.1) <5BD8B0CA-681C-3CE7-8C12-659782435FA3> /System/Library/PrivateFrameworks/SystemDesktopAppearance.framework/Versions/A/SystemDesktopAppearance
       0x1e21f9000 -        0x1e21f9af3  com.apple.FeatureFlags (1.0 - 103) <F8F78EEC-A28C-3AAF-A7F2-7EFD5B839EDB> /System/Library/PrivateFrameworks/FeatureFlags.framework/Versions/A/FeatureFlags
       0x1e2205000 -        0x1e220ccbf  libswiftNaturalLanguage.dylib (4.3) <5E36265A-7670-3D39-A2B8-71DA0AA131CF> /usr/lib/swift/libswiftNaturalLanguage.dylib
       0x1e227e000 -        0x1e22cfd3f  com.apple.WiFiPeerToPeer (861.4.0 - 861.4) <15EEE715-2670-3288-AFA8-504BAD951B4F> /System/Library/PrivateFrameworks/WiFiPeerToPeer.framework/Versions/A/WiFiPeerToPeer
       0x1ea760000 -        0x1ea846ddf  com.apple.JetUI (1.0 - 1) <E6252A0A-ACAF-3802-8CB3-31B279F38A44> /System/Library/PrivateFrameworks/JetUI.framework/Versions/A/JetUI
       0x1ea847000 -        0x1eadcf67f  com.apple.JetEngine (1.0 - 1) <F55DAF9D-A41F-3B09-A853-B9DA0E8295C0> /System/Library/PrivateFrameworks/JetEngine.framework/Versions/A/JetEngine
       0x1eb2ee000 -        0x1eb31024f  libswiftSwiftOnoneSupport.dylib (6.3.2 - 6.3.2.1.11) <76A7FE10-AD26-3505-A8CC-D37AC1C24D32> /usr/lib/swift/libswiftSwiftOnoneSupport.dylib
       0x1eb5e2000 -        0x1eb7b7b1f  com.apple.VoiceShortcutClient (1.0 - 4711) <BA3A2F25-4FE4-334F-A86F-D7C32801EB65> /System/Library/PrivateFrameworks/VoiceShortcutClient.framework/Versions/A/VoiceShortcutClient
       0x1eb94d000 -        0x1eb94f5bf  com.apple.ConfigProfileHelper (18.0 - 1800) <2D1B971F-6A7F-32D0-8B0F-F8FA3A13E8F1> /System/Library/PrivateFrameworks/ConfigProfileHelper.framework/Versions/A/ConfigProfileHelper
       0x1ebbb1000 -        0x1ebc12c7f  com.apple.ScreenReaderCore (10 - 993) <FA0D45C4-0660-36B2-83FB-3528E20F9452> /System/Library/PrivateFrameworks/ScreenReaderCore.framework/Versions/A/ScreenReaderCore
       0x1ebc8c000 -        0x1ebcfa8ff  com.apple.RemoteManagement (1.0 - 2.0) <40390113-C02A-3D35-82A1-5C79AFD2A4CC> /System/Library/PrivateFrameworks/RemoteManagement.framework/Versions/A/RemoteManagement
       0x1ebdf7000 -        0x1ebdfab1f  libswiftCallKit.dylib (4) <2EA6C07A-6DE0-3EBA-B487-93B3AC08A3FF> /usr/lib/swift/libswiftCallKit.dylib
       0x2293f8000 -        0x22aa71067  com.apple.ANECompiler (9.509.0 - 9.509.0) <465A74BC-F20D-3C05-9441-7E08EAA49FAF> /System/Library/PrivateFrameworks/ANECompiler.framework/Versions/A/ANECompiler
       0x22aa72000 -        0x22aa8445f  com.apple.DeviceCheck (1.0 - 1) <6F319B3D-2420-32BA-BF9E-9F56445060E3> /System/Library/Frameworks/DeviceCheck.framework/Versions/A/DeviceCheck
       0x22c06f000 -        0x22c0762c3  libCoreFSCache.dylib (352.2) <2C410B78-B9A5-30DC-8D83-FFEC1277F34C> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libCoreFSCache.dylib
       0x22c077000 -        0x22c07c947  libCoreVMClient.dylib (352.2) <07CB5D41-C2F3-3C33-951F-67B2C8B8B662> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libCoreVMClient.dylib
       0x22c07d000 -        0x22c08d2b7  com.apple.opengl (23.1.1 - 23.1.1) <B4B82439-1E7E-33FB-A08D-6B0C20608AE3> /System/Library/Frameworks/OpenGL.framework/Versions/A/OpenGL
       0x22c08e000 -        0x22c0907bf  libCVMSPluginSupport.dylib (23.1.1) <D02BDBB2-FBA6-3050-9076-08D94E904E3A> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libCVMSPluginSupport.dylib
       0x22c091000 -        0x22c0994ff  libGFXShared.dylib (23.1.1) <6CEF3932-AAC9-3F8E-905D-A826F2884C9A> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGFXShared.dylib
       0x22c09a000 -        0x22c0cd54b  libGLImage.dylib (23.1.1) <CD28CE41-30BB-3743-88BC-22FD9D24D908> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGLImage.dylib
       0x22c0ce000 -        0x22c1075bf  libGLU.dylib (23.1.1) <B48D9786-7BF0-308B-A82B-4590632E71D4> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGLU.dylib
       0x22c25e000 -        0x22c267bc7  libGL.dylib (23.1.1) <DED25257-919A-3D90-A2A1-9C61DC783FE8> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib
       0x22c3ea000 -        0x22c452d1d  com.apple.opencl (5.5 - 5.5) <6FC192B3-C9A8-312F-A5F7-8F3535FE45B5> /System/Library/Frameworks/OpenCL.framework/Versions/A/OpenCL
       0x22c5e9000 -        0x22c5e9adf  com.apple.ARKit (1.0 - 746.100.3) <78F80A87-1624-335C-9A8B-3938E6C3444F> /System/Library/Frameworks/ARKit.framework/Versions/A/ARKit
       0x22c5ea000 -        0x22c72c9ff  com.apple.audio.AVFAudio (1.0 - 743.508) <016C5057-625C-30B1-AD32-7BC9D082F05B> /System/Library/Frameworks/AVFAudio.framework/Versions/A/AVFAudio
       0x22c72e000 -        0x22c7a8ebf  com.apple.AVRouting (1.0 - 1) <DBDAA7C3-4F28-390B-B8D4-D59F58121AA2> /System/Library/Frameworks/AVRouting.framework/Versions/A/AVRouting
       0x22c89e000 -        0x22cdee95f  com.apple.AppIntents (1.0 - 300.6.3) <017AE141-7561-3552-A918-FD1B0F34669B> /System/Library/Frameworks/AppIntents.framework/Versions/A/AppIntents
       0x22d370000 -        0x22d37429f  com.apple.BrowserEngineCore (1.0 - 1) <C1B83F39-8F21-382D-A705-8609B9E41F7B> /System/Library/Frameworks/BrowserEngineCore.framework/Versions/A/BrowserEngineCore
       0x22da7e000 -        0x22dac6fdf  com.apple.CoreTransferable (1.0.1 - 1) <26865685-385E-3120-9886-2082EEC20B20> /System/Library/Frameworks/CoreTransferable.framework/Versions/A/CoreTransferable
       0x22df99000 -        0x22dfa6bff  com.apple.DataDetection (8.0 - 821.7) <73F6F860-69AF-3162-86E0-A683642287D6> /System/Library/Frameworks/DataDetection.framework/Versions/A/DataDetection
       0x22dfb0000 -        0x22dfc775f  com.apple.dt.DeveloperToolsSupport (23.40.26 - 23.40.26) <B1322FAC-9016-3646-890B-B51DF5E968A2> /System/Library/Frameworks/DeveloperToolsSupport.framework/Versions/A/DeveloperToolsSupport
       0x22dfc8000 -        0x22e070ebf  com.apple.DeviceActivity (3.0 - 392.5.1) <44527AE9-0A11-314D-8FC1-74D0953D8E69> /System/Library/Frameworks/DeviceActivity.framework/Versions/A/DeviceActivity
       0x22e0fa000 -        0x22e26df1f  com.apple.ExtensionFoundation (97 - 97) <3D533C35-3A2A-3672-92EF-5FEE9EE739AC> /System/Library/Frameworks/ExtensionFoundation.framework/Versions/A/ExtensionFoundation
       0x22e26e000 -        0x22e2b07df  com.apple.ExtensionKit (97 - 97) <43141163-B086-36F4-8D0C-E75F78447586> /System/Library/Frameworks/ExtensionKit.framework/Versions/A/ExtensionKit
       0x22e2b1000 -        0x22e31cd1f  com.apple.FSKit (1.0 - 1) <38897E05-F0CD-3390-A132-3C0AC8C9C3E7> /System/Library/Frameworks/FSKit.framework/Versions/A/FSKit
       0x22e37b000 -        0x22e664ddf  com.apple.FinanceKit (1.0 - 1) <F2A25154-24E6-30CF-8B6A-B246543D0D37> /System/Library/Frameworks/FinanceKit.framework/Versions/A/FinanceKit
       0x22e9ef000 -        0x22e9f733f  com.apple.GeoToolbox (1.0 - 1) <4CDC5D26-AF09-3487-82EC-C425152E110E> /System/Library/Frameworks/GeoToolbox.framework/Versions/A/GeoToolbox
       0x22f4e1000 -        0x22f523a1f  com.apple.LightweightCodeRequirements (1.0 - 1) <8EF56F82-8CCE-3811-AD16-6D0939187B45> /System/Library/Frameworks/LightweightCodeRequirements.framework/Versions/A/LightweightCodeRequirements
       0x22f524000 -        0x22f5679df  com.apple.LiveCommunicationKit (1.0 - 1) <31403ACE-C96E-32B9-8EB0-0CE924DC5B8B> /System/Library/Frameworks/LiveCommunicationKit.framework/Versions/A/LiveCommunicationKit
       0x22f568000 -        0x22f57f49f  com.apple.LocalAuthenticationEmbeddedUI (1.0 - 2005.160.7) <FDACB870-129B-3109-8E2D-25A5C3ACA66C> /System/Library/Frameworks/LocalAuthenticationEmbeddedUI.framework/Versions/A/LocalAuthenticationEmbeddedUI
       0x22f65b000 -        0x22f72831f  com.apple.ManagedSettings (267.160.4 - 267.160.4) <F33B79D2-20FE-36CF-83BF-A3138A81A855> /System/Library/Frameworks/ManagedSettings.framework/Versions/A/ManagedSettings
       0x2302d1000 -        0x2303451bf  com.apple.MetalFX (31.8 - 31.8) <77EEF9FE-EF9F-3BEC-9F2F-E76812B0A8A1> /System/Library/Frameworks/MetalFX.framework/Versions/A/MetalFX
       0x230347000 -        0x2303651ff  com.apple.MPSBenchmarkLoop (1.0 - 1) <CE33B5A6-25BA-3202-BDFE-0D59EFE2199A> /System/Library/Frameworks/MetalPerformanceShaders.framework/Versions/A/Frameworks/MPSBenchmarkLoop.framework/Versions/A/MPSBenchmarkLoop
       0x230366000 -        0x230379e7f  com.apple.MPSFunctions (1.0 - 1) <3103E210-FF5C-3677-BDD3-59FF17A6ACEC> /System/Library/Frameworks/MetalPerformanceShaders.framework/Versions/A/Frameworks/MPSFunctions.framework/Versions/A/MPSFunctions
       0x23037a000 -        0x23037f53f  com.apple.MPSHost (1.0 - 1) <31F90368-23A5-39BB-822B-C8470C4479AE> /System/Library/Frameworks/MetalPerformanceShaders.framework/Versions/A/Frameworks/MPSHost.framework/Versions/A/MPSHost
       0x230380000 -        0x2316b783f  com.apple.MetalPerformanceShadersGraph (6.5.1 - 6.5.1) <7401E849-7B2E-39A9-99D3-5CB0A6BBDFFE> /System/Library/Frameworks/MetalPerformanceShadersGraph.framework/Versions/A/MetalPerformanceShadersGraph
       0x231d69000 -        0x231dbf81f  com.apple.NearbyInteraction (1.0 - 524.0.7) <09FB0BAF-DE74-3490-B80A-A46091FEE312> /System/Library/Frameworks/NearbyInteraction.framework/Versions/A/NearbyInteraction
       0x23268a000 -        0x2327bef3f  com.apple.QuickLookUIFramework (5.0 - 1018.5.5) <778E863D-A09A-3E8B-B805-C0DBCBD923A5> /System/Library/Frameworks/QuickLookUI.framework/Versions/A/QuickLookUI
       0x232e66000 -        0x232e6eaff  com.apple.RelevanceKit (1.0 - 1) <9B1EA073-291F-3A6E-92AD-DC2F6CCCCDE0> /System/Library/Frameworks/RelevanceKit.framework/Versions/A/RelevanceKit
       0x2330b7000 -        0x23311555f  com.apple.ScreenCaptureKit (1) <14002C32-C93F-3D4F-98CD-43390D072946> /System/Library/Frameworks/ScreenCaptureKit.framework/Versions/A/ScreenCaptureKit
       0x23313e000 -        0x23324497f  com.apple.SensitiveContentAnalysis (1.0 - 1) <D185A202-2E0C-3C6C-9BDC-DC4D8A6CA3EA> /System/Library/Frameworks/SensitiveContentAnalysis.framework/Versions/A/SensitiveContentAnalysis
       0x2332f0000 -        0x23330dc3f  com.apple.SharedWithYouCore (1.0 - 1) <ECE4CCC0-8D35-346C-85C2-91E225504B26> /System/Library/Frameworks/SharedWithYouCore.framework/Versions/A/SharedWithYouCore
       0x23362a000 -        0x2337964bf  com.apple.SwiftData (1.0 - 135) <9F52706C-75BD-34AF-A29E-C26608124ACC> /System/Library/Frameworks/SwiftData.framework/Versions/A/SwiftData
       0x233797000 -        0x2346f391f  com.apple.SwiftUICore (7.6.1 - 7.6.1) <9EB0840F-B045-3529-9467-1470A3C6CA02> /System/Library/Frameworks/SwiftUICore.framework/Versions/A/SwiftUICore
       0x2346f4000 -        0x234707e3f  com.apple.Symbols (1.0 - 190.4.0.1) <028E944B-66C4-39E2-A436-FB93FB6CED4E> /System/Library/Frameworks/Symbols.framework/Versions/A/Symbols
       0x23470e000 -        0x23484cb5f  com.apple.DataFrame (1.0 - 52) <F12008DC-72EB-3AB3-BC2E-5BC47ED81BDB> /System/Library/Frameworks/TabularData.framework/Versions/A/TabularData
       0x234aab000 -        0x234b2bc7f  com.apple.TipKit (26.6 - 120.5.1) <6F7E7DD5-FBB7-35A1-A114-2325A268B4E8> /System/Library/Frameworks/TipKit.framework/Versions/A/TipKit
       0x234c14000 -        0x234ca1bbf  com.apple.Translation (1.0 - 365.14) <C05D5BDB-5A72-37EC-BFCF-586B86FB1BAE> /System/Library/Frameworks/Translation.framework/Versions/A/Translation
       0x235132000 -        0x23545eeff  libANGLE-shared.dylib (624.5.1.11.3) <5727F861-DB93-36D9-8C34-C74D3A71DAC2> /System/Library/Frameworks/WebKit.framework/Versions/A/Frameworks/WebCore.framework/Versions/A/Frameworks/libANGLE-shared.dylib
       0x235640000 -        0x23564b3bf  com.apple.-GeoToolbox-AppIntents (1.0 - 1) <6A61C664-25B4-32A1-811B-B18AEEDB2DE0> /System/Library/Frameworks/_GeoToolbox_AppIntents.framework/Versions/A/_GeoToolbox_AppIntents
       0x235688000 -        0x2356b2b5f  com.apple.CoreLocation.LocationEssentials (1.0 - 1) <EDFF8FB1-DFD9-32F1-B215-F8647276D90C> /System/Library/Frameworks/_LocationEssentials.framework/Versions/A/_LocationEssentials
       0x235fa8000 -        0x235fca19f  com.apple.AAAFoundation (1.0 - 1) <E423A66B-6198-377C-934C-2E4A7FE4C732> /System/Library/PrivateFrameworks/AAAFoundation.framework/Versions/A/AAAFoundation
       0x235fcb000 -        0x2360378df  com.apple.AAAFoundationSwift (1.0 - 1) <7A222E30-8DD4-3B1D-B820-4EA33B797525> /System/Library/PrivateFrameworks/AAAFoundationSwift.framework/Versions/A/AAAFoundationSwift
       0x23610a000 -        0x23611c47f  com.apple.siri.AIMLExperimentationAnalytics (1.0 - 1) <AE2B7E6C-FA2B-3BA9-842D-0F80C26185FD> /System/Library/PrivateFrameworks/AIMLExperimentationAnalytics.framework/Versions/A/AIMLExperimentationAnalytics
       0x2372df000 -        0x23733b43f  com.apple.ARKitCore (746.100.3 - 746.100.3) <4755D0B2-D658-38E5-8C6D-3E5C3BF1ED16> /System/Library/PrivateFrameworks/ARKitCore.framework/Versions/A/ARKitCore
       0x23736b000 -        0x23737347f  com.apple.ARKitFoundation (746.100.3 - 746.100.3) <893C37FF-6A82-3F88-AAFB-757DC6B29288> /System/Library/PrivateFrameworks/ARKitFoundation.framework/Versions/A/ARKitFoundation
       0x2385b6000 -        0x23863bd87  com.apple.AlgorithmsInternal (1.2 - 5026.6.1) <3A29BE1C-BDD6-320D-A002-612651FB47D2> /System/Library/PrivateFrameworks/AlgorithmsInternal.framework/Versions/A/AlgorithmsInternal
       0x238b14000 -        0x238bc537f  com.apple.AppIntentSchemas (1.0 - 3501.5.4) <D8DACBBA-9BE2-310B-B7F7-408598542957> /System/Library/PrivateFrameworks/AppIntentSchemas.framework/Versions/A/AppIntentSchemas
       0x238c96000 -        0x238f3075f  com.apple.AppIntentsServices (1.0 - 40.5.2) <07F207FC-F968-33AF-ACA2-5AB5A94B923C> /System/Library/PrivateFrameworks/AppIntentsServices.framework/Versions/A/AppIntentsServices
       0x238f31000 -        0x238f42a1f  com.apple.appintents.AppIntentsTypeSupport (1.0 - 300.6.3) <AC51A135-5215-34CF-A149-D132321142AA> /System/Library/PrivateFrameworks/AppIntentsTypeSupport.framework/Versions/A/AppIntentsTypeSupport
       0x23a051000 -        0x23a0a625f  com.apple.AppleAccountUI (1.0 - 1) <2B45FCC7-EED5-3447-A03A-124442624141> /System/Library/PrivateFrameworks/AppleAccountUI.framework/Versions/A/AppleAccountUI
       0x23a0ed000 -        0x23a269e9f  com.apple.AppleDepth (158.0 - 158.0) <47C92BD7-7B16-3997-8729-3BA2BDEA3BA2> /System/Library/PrivateFrameworks/AppleDepth.framework/Versions/A/AppleDepth
       0x23a26a000 -        0x23a2eea7f  com.apple.AppleDepthCore (157.0 - 157.0) <88D1D2BA-7E76-38B8-8469-D2A86546FCB4> /System/Library/PrivateFrameworks/AppleDepthCore.framework/Versions/A/AppleDepthCore
       0x23a2ef000 -        0x23a303abf  com.apple.AppleDeviceQuerySupport (1.0 - 408.120.3) <9594FBFB-D49D-3DF6-8820-564633EAEC2B> /System/Library/PrivateFrameworks/AppleDeviceQuerySupport.framework/Versions/A/AppleDeviceQuerySupport
       0x23a356000 -        0x23a37109f  com.apple.siri.flatbuffer.AppleFlatBuffers (1) <E936F50F-0833-3F01-95DC-D4A94F470727> /System/Library/PrivateFrameworks/AppleFlatBuffers.framework/Versions/A/AppleFlatBuffers
       0x23a72c000 -        0x23a7bb5df  com.apple.proactive.AppleIntelligenceReporting (1.0 - 1) <05EC9C98-7211-39C9-B376-796F37327801> /System/Library/PrivateFrameworks/AppleIntelligenceReporting.framework/Versions/A/AppleIntelligenceReporting
       0x23a8b2000 -        0x23aa80b67  com.apple.cmphoto.AppleJPEGXL (1.0 - 1) <71A0C0AD-67F3-36F9-BF73-6DD5D7424AF7> /System/Library/PrivateFrameworks/AppleJPEGXL.framework/Versions/A/AppleJPEGXL
       0x23aa81000 -        0x23aafcb46  com.apple.AppleKeyStore (1.0 - 1.0) <E444621A-C72D-36A2-AA52-9E9FAFA7B42D> /System/Library/PrivateFrameworks/AppleKeyStore.framework/Versions/A/AppleKeyStore
       0x23ab2c000 -        0x23b249f3f  com.apple.AppleMediaServicesKitInternal (1.6.1 - 1.6.1) <FA622C7B-4A62-368E-B2FD-EA729BF2451A> /System/Library/PrivateFrameworks/AppleMediaServicesKitInternal.framework/Versions/A/AppleMediaServicesKitInternal
       0x23b429000 -        0x23b4419df  com.apple.private.AppleMobileFileIntegrity-fmk (1.0 - 1) <FFB902E7-2984-3F17-B43D-2DDA2C5683F9> /System/Library/PrivateFrameworks/AppleMobileFileIntegrity.framework/Versions/A/AppleMobileFileIntegrity
       0x23b5d9000 -        0x23b654ea7  com.apple.ArgumentParserInternal (1.0 - 1.20.2) <841D5662-2CB9-3A27-ADA7-E33AC5E45199> /System/Library/PrivateFrameworks/ArgumentParserInternal.framework/Versions/A/ArgumentParserInternal
       0x23b66b000 -        0x23b6fc97f  com.apple.AskToCore (1.0 - 1) <104F9594-EFD3-333D-8518-129326AA6AF3> /System/Library/PrivateFrameworks/AskToCore.framework/Versions/A/AskToCore
       0x23b894000 -        0x23b93a564  com.apple.AsyncAlgorithmsInternal (1.0.0 - 5026.6.1) <ECAF5DEB-CD09-32BB-9267-1DD4C37C2F4A> /System/Library/PrivateFrameworks/AsyncAlgorithmsInternal.framework/Versions/A/AsyncAlgorithmsInternal
       0x23b93b000 -        0x23b94d799  com.apple.AtomicsInternal (1.1.0 - 5026.6.1) <1617DBB1-2BFF-3619-903C-2FBB31348FB6> /System/Library/PrivateFrameworks/AtomicsInternal.framework/Versions/A/AtomicsInternal
       0x23ba0a000 -        0x23ba2cdff  com.apple.imgaudio.AudioAnalytics (1.0 - 1) <C4EF9A70-A6B4-3F21-B3D8-A0C740406419> /System/Library/PrivateFrameworks/AudioAnalytics.framework/Versions/A/AudioAnalytics
       0x23bd96000 -        0x23be996df  com.apple.AuthenticationServicesCore (1.0 - 21624.5.1.11.3) <0707477E-CC4C-34A3-8487-2F7332721027> /System/Library/PrivateFrameworks/AuthenticationServicesCore.framework/Versions/A/AuthenticationServicesCore
       0x23bee9000 -        0x23beebfff  com.apple.AvailabilityKit (1.0 - 116.700.21) <6BC12AB5-5267-3C95-BB4C-0EB0024E9354> /System/Library/PrivateFrameworks/AvailabilityKit.framework/Versions/A/AvailabilityKit
       0x23beec000 -        0x23bfa9ebf  com.apple.avatarkit (1.0 - 356.500) <5A0C76EA-0894-3A52-AA2F-4987194C2844> /System/Library/PrivateFrameworks/AvatarKit.framework/Versions/A/AvatarKit
       0x23bfaa000 -        0x23bfaa367  com.apple.AvatarKitContent (1.0 - 356.500) <F49C002A-0BCA-3050-BA9B-219015EC7040> /System/Library/PrivateFrameworks/AvatarKitContent.framework/Versions/A/AvatarKitContent
       0x23bfab000 -        0x23bffa77f  com.apple.AvatarPersistence (1.0 - 395.500.1) <918CB20A-A6D5-30BF-9818-86E8E06FEB1C> /System/Library/PrivateFrameworks/AvatarPersistence.framework/Versions/A/AvatarPersistence
       0x23c070000 -        0x23c0b885f  com.apple.BackBoardHIDEventFoundation (1.0 - 1) <7F763DF9-EA7F-3938-B599-DCCF4605E610> /System/Library/PrivateFrameworks/BackBoardHIDEventFoundation.framework/Versions/A/BackBoardHIDEventFoundation
       0x23c0b9000 -        0x23c0db5ff  com.apple.BackgroundSystemTasks (1.0 - 1) <10A4E63B-A1EB-31CC-B3E1-DB4FE115FC84> /System/Library/PrivateFrameworks/BackgroundSystemTasks.framework/Versions/A/BackgroundSystemTasks
       0x23c151000 -        0x23c16a8df  com.apple.biome.BiomeDSL (1.0 - 209.21) <FE87FF48-AB89-3D65-ABC3-EFE50A81355F> /System/Library/PrivateFrameworks/BiomeDSL.framework/Versions/A/BiomeDSL
       0x23c16b000 -        0x23ca25f7f  com.apple.BiomeLibrary (274.60) <07CF779F-8F51-3764-B486-23D76868FF91> /System/Library/PrivateFrameworks/BiomeLibrary.framework/Versions/A/BiomeLibrary
       0x23ca26000 -        0x23ca2bb5f  com.apple.biome.BiomeSync (1.0 - 209.21) <2362E209-EC61-3FFC-9486-1244BB29BE82> /System/Library/PrivateFrameworks/BiomeSync.framework/Versions/A/BiomeSync
       0x23d0f3000 -        0x23d12969f  com.apple.CBORLibrary (1.0 - 1) <D5713F6A-D177-31B7-A33D-F36B31E7E079> /System/Library/PrivateFrameworks/CBORLibrary.framework/Versions/A/CBORLibrary
       0x23d47e000 -        0x23d48012f  com.apple.CMCaptureDevice (665.140.6) <CD0C6EA1-5AEF-3EB1-8935-45726B3AFACD> /System/Library/PrivateFrameworks/CMCaptureDevice.framework/Versions/A/CMCaptureDevice
       0x23d543000 -        0x23d74b49f  com.apple.CMImaging (1.0 - 665.140.6) <3B782AC2-00C4-3534-91D2-5C7242B32440> /System/Library/PrivateFrameworks/CMImaging.framework/Versions/A/CMImaging
       0x23d74c000 -        0x23d91667f  com.apple.CMPhoto (1.0 - 1) <214294AE-C7B7-3C9A-A4F8-201C989F9779> /System/Library/PrivateFrameworks/CMPhoto.framework/Versions/A/CMPhoto
       0x23d91b000 -        0x23d928cdf  com.apple.spotlight.CSExattrCrypto (1.0 - 2418.6.3.9.400) <F85877CC-C21A-3298-A9C7-0041E757B522> /System/Library/PrivateFrameworks/CSExattrCrypto.framework/Versions/A/CSExattrCrypto
       0x23dacd000 -        0x23db8b7ff  com.apple.CalendarDaemon (1.0 - 1224.4.13) <A685B10F-E626-366D-8C61-701B40F73B67> /System/Library/PrivateFrameworks/CalendarDaemon.framework/Versions/A/CalendarDaemon
       0x23db8c000 -        0x23dcbe5ff  com.apple.CalendarDatabase (1.0 - 1269.4.7) <23B7DC95-4C9E-39B6-97B1-320F8F6FD1B3> /System/Library/PrivateFrameworks/CalendarDatabase.framework/Versions/A/CalendarDatabase
       0x23dfc5000 -        0x23dfd2ebf  com.apple.CallsPersistence (1.0 - 1) <0B1D3C49-424C-33B3-8AF7-AA6C7EAC929F> /System/Library/PrivateFrameworks/CallsPersistence.framework/Versions/A/CallsPersistence
       0x23dfd3000 -        0x23dfde9bf  com.apple.CallsUtilities (1.0 - 1) <BFBADA86-5087-360A-B12F-19C6E598316D> /System/Library/PrivateFrameworks/CallsUtilities.framework/Versions/A/CallsUtilities
       0x23dfdf000 -        0x23dffea61  com.apple.CallsXPC (1.0 - 1) <16FD5AC2-EE84-3758-8A92-0E14EF5083F5> /System/Library/PrivateFrameworks/CallsXPC.framework/Versions/A/CallsXPC
       0x23e05c000 -        0x23e0f48bf  com.apple.biome.CascadeSets (1.0 - 209.21) <2091B02D-8D55-3DC4-8097-60C193D03C85> /System/Library/PrivateFrameworks/CascadeSets.framework/Versions/A/CascadeSets
       0x23e110000 -        0x23e115cff  com.apple.Centauri (1.0 - 1) <3854272C-7B14-3A3C-9BB1-F0FBA394708A> /System/Library/PrivateFrameworks/Centauri.framework/Versions/A/Centauri
       0x23e155000 -        0x23e171084  com.apple.cryptokit.Chirp (1.0 - 1) <3448B8A0-0DD6-3921-8A12-E3D27CF360AB> /System/Library/PrivateFrameworks/Chirp.framework/Versions/A/Chirp
       0x23e607000 -        0x23e63f59f  com.apple.CinematicFraming (1.0 - 665.140.6) <FCEDE250-22B0-35B9-A5F4-87AA67D568FF> /System/Library/PrivateFrameworks/CinematicFraming.framework/Versions/A/CinematicFraming
       0x23e8a3000 -        0x23e91351f  com.apple.cloudkit.CloudAsset (2360.120.2) <B17F92E7-6017-3EC8-8B15-5F38CDFF9323> /System/Library/PrivateFrameworks/CloudAsset.framework/Versions/A/CloudAsset
       0x23eb3d000 -        0x23ebb0a1f  com.apple.cloudkit.CloudCoreInternal (2360.120.2) <23871A43-55FD-3D0C-B29F-B143A64D1D8D> /System/Library/PrivateFrameworks/CloudCoreInternal.framework/Versions/A/CloudCoreInternal
       0x23ece2000 -        0x23ecefc9f  com.apple.CloudSettings (1.0 - 1) <C10D82BE-5111-31DF-88B6-31143114C761> /System/Library/PrivateFrameworks/CloudSettings.framework/Versions/A/CloudSettings
       0x23edac000 -        0x23eee8e3f  com.apple.CloudSubscriptionFeatures (1.0 - 1.9) <5FAA391F-E314-3FBD-BFA5-FCB76CAD1F88> /System/Library/PrivateFrameworks/CloudSubscriptionFeatures.framework/Versions/A/CloudSubscriptionFeatures
       0x23eee9000 -        0x23eefed3f  com.apple.CloudTelemetry (1.0 - 2350.100.2) <121798D0-5254-3547-8F96-0F2AF8D84250> /System/Library/PrivateFrameworks/CloudTelemetry.framework/Versions/A/CloudTelemetry
       0x23eeff000 -        0x23ef0d9df  CloudTelemetryShared.dylib (2350.100.2) <D4E833CF-2C73-39D9-BA75-8CAE484DF053> /System/Library/PrivateFrameworks/CloudTelemetryShared.dylib
       0x23ef0e000 -        0x23ef9c0ff  com.apple.CloudTelemetryTools (13.1.47 - 2350.100.2) <C1165EDC-58D6-329E-A873-E272A83B5FD3> /System/Library/PrivateFrameworks/CloudTelemetryTools.framework/Versions/A/CloudTelemetryTools
       0x23f48a000 -        0x23f4ae8ff  com.apple.CollectionViewCore (1.0 - 1) <4840B78C-D96B-35B9-85C7-E5889C44A7C4> /System/Library/PrivateFrameworks/CollectionViewCore.framework/Versions/A/CollectionViewCore
       0x23f4af000 -        0x23f5ed4ee  com.apple.CollectionsInternal (1.2.0 - 5026.6.1) <6098453F-4D7E-38B4-8ADC-02C9FF51E14A> /System/Library/PrivateFrameworks/CollectionsInternal.framework/Versions/A/CollectionsInternal
       0x23f607000 -        0x23f6ce7bf  com.apple.CommunicationTrust (1) <34919AAB-936B-3E7E-945A-4E8D0455E06F> /System/Library/PrivateFrameworks/CommunicationTrust.framework/Versions/A/CommunicationTrust
       0x23f71e000 -        0x23f74d63f  com.apple.wakeboard.CompositorNonUI (420.100.10) <8033E459-21BF-3B27-B56F-C2856ADFE195> /System/Library/PrivateFrameworks/CompositorNonUI.framework/Versions/A/CompositorNonUI
       0x23fa27000 -        0x23fa5adbf  com.apple.contacts.ContactsAccounts (1.0 - 1) <162073C2-0CCB-3EA6-A5B6-6EF074A39A4C> /System/Library/PrivateFrameworks/ContactsAccounts.framework/Versions/A/ContactsAccounts
       0x23fa5b000 -        0x23fa5eddf  com.apple.contacts.ContactsMetrics (1 - 21.700.11) <7D76A387-25C0-3B05-9B02-D39692237982> /System/Library/PrivateFrameworks/ContactsMetrics.framework/Versions/A/ContactsMetrics
       0x23fba5000 -        0x23fbaa03f  com.apple.contextkit.ContextKitCore (1.0 - 1) <561BD1F8-F841-3DBB-8914-355735557B83> /System/Library/PrivateFrameworks/ContextKitCore.framework/Versions/A/ContextKitCore
       0x2418aa000 -        0x241947fff  com.apple.audio.coreaudio.Stravinsky (1.0 - 1) <7CC0621B-3B88-3533-A3FB-52E6214486EE> /System/Library/PrivateFrameworks/CoreAudioOrchestration.framework/Versions/A/CoreAudioOrchestration
       0x2419f1000 -        0x241b13e3f  com.apple.CoreComposite (1.0 - 330.100.6) <61F1CC5B-6F86-3433-A776-170B3049555F> /System/Library/PrivateFrameworks/CoreComposite.framework/Versions/A/CoreComposite
       0x245754000 -        0x24585a25f  com.apple.CoreSceneUnderstanding (1.74.0 - 1.74.0) <C60B3FA0-2804-3339-B16D-E41B33FE25CC> /System/Library/PrivateFrameworks/CoreSceneUnderstanding.framework/Versions/A/CoreSceneUnderstanding
       0x245a50000 -        0x245ab5b43  com.apple.CoreTransparency (1.0 - 1) <E4F3D821-1834-3768-AB7F-39FC9EE103B6> /System/Library/PrivateFrameworks/CoreTransparency.framework/Versions/A/CoreTransparency
       0x245ab6000 -        0x245ade0bf  com.apple.CoreUtilsExtras (1.0 - 1) <3DD8C4CA-23E9-35CF-AD67-549DD72D3344> /System/Library/PrivateFrameworks/CoreUtilsExtras.framework/Versions/A/CoreUtilsExtras
       0x246027000 -        0x2460e3bdf  com.apple.security.CryptoKit-Private (1.0 - 1) <38DAF669-429F-384F-87D6-8550842EEB5E> /System/Library/PrivateFrameworks/CryptoKitPrivate.framework/Versions/A/CryptoKitPrivate
       0x2460f8000 -        0x2461027df  com.apple.devicemanagementclient.DEPClientLibrary (1.0 - 1) <41FACB19-E885-3607-8395-76BB053024DD> /System/Library/PrivateFrameworks/DEPClientLibrary.framework/Versions/A/DEPClientLibrary
       0x246125000 -        0x24616a0ff  com.apple.devicemanagementclient.DMCEnrollmentLibrary (1.0 - 1) <05804007-740F-3E5F-A94F-E46B6916C5D2> /System/Library/PrivateFrameworks/DMCEnrollmentLibrary.framework/Versions/A/DMCEnrollmentLibrary
       0x246197000 -        0x2461e59df  com.apple.devicemanagementclient.DMCUtilities (1.0 - 1) <65D2DF80-C7B7-3EBD-B79F-58EE538FFA1A> /System/Library/PrivateFrameworks/DMCUtilities.framework/Versions/A/DMCUtilities
       0x246262000 -        0x2462699bf  com.apple.darwinup-framework (1.0 - 302.160.2) <089C1A34-2F4E-3649-94AA-B28A7ECB008B> /System/Library/PrivateFrameworks/Darwinup.framework/Versions/A/Darwinup
       0x24639c000 -        0x2463dfc9f  com.apple.dataaccess.dataaccessexpress.framework (1.0 - 1.0) <8B386F88-8DA7-3A81-AB54-E9A62B46A1CB> /System/Library/PrivateFrameworks/DataAccessExpress.framework/Versions/A/DataAccessExpress
       0x246635000 -        0x2466a4e7f  com.apple.aiml.dendrite.Dendrite (1.0 - 1) <0A1C4D11-C108-35E9-A921-86ED86CF7446> /System/Library/PrivateFrameworks/Dendrite.framework/Versions/A/Dendrite
       0x2466a5000 -        0x246822aff  com.apple.DesignLibrary (7.5.2 - 7.5.2) <2BC041DF-695A-32EE-B164-1C35C2AFFC53> /System/Library/PrivateFrameworks/DesignLibrary.framework/Versions/A/DesignLibrary
       0x246bc5000 -        0x246bd849f  com.apple.DeviceRecovery (1.0 - 1) <2FA711C7-F764-363A-BF03-295E0DA88B79> /System/Library/PrivateFrameworks/DeviceRecovery.framework/Versions/A/DeviceRecovery
       0x246da3000 -        0x246ff1e1f  com.apple.DiskImages2 (524.160.11 - 524.160.11) <F4F5986E-41F0-387C-87EB-12D181F2F23A> /System/Library/PrivateFrameworks/DiskImages2.framework/Versions/A/DiskImages2
       0x246ffd000 -        0x24701367f  com.apple.DistributedSensing (1.0 - 1) <9B3D4CA3-7BCF-36C9-AA99-27BDFE7854CD> /System/Library/PrivateFrameworks/DistributedSensing.framework/Versions/A/DistributedSensing
       0x2470f9000 -        0x247167bbf  com.apple.DoNotDisturb (1.0 - 468.6.4) <88AFCA34-6854-3CBD-898A-363AB2B45C75> /System/Library/PrivateFrameworks/DoNotDisturb.framework/Versions/A/DoNotDisturb
       0x247f0c000 -        0x247f0d3bf  com.apple.private.FaceTimeNameUtility (1.0 - 1) <55FBCBE4-1032-3017-BA49-D734B82405DF> /System/Library/PrivateFrameworks/FaceTimeNameUtility.framework/Versions/A/FaceTimeNameUtility
       0x248382000 -        0x24843e33f  com.apple.FeedbackService (1.0 - 1) <576CE5FD-93F3-3C4C-A290-4EAFE522FCF7> /System/Library/PrivateFrameworks/FeedbackService.framework/Versions/A/FeedbackService
       0x2485ab000 -        0x24866d57f  com.apple.findmy.framework.FindMyBase (1.0 - 84.25.2.23.2) <6BFEFDE7-0409-34B1-9353-2194F8DDFF2F> /System/Library/PrivateFrameworks/FindMyBase.framework/Versions/A/FindMyBase
       0x2487d8000 -        0x2487f2a5f  com.apple.findmy.framework.FindMyCommon (1.0 - 84.25.2.23.2) <2279C7A8-D4AD-35D3-BC92-0D9B7BEF975D> /System/Library/PrivateFrameworks/FindMyCommon.framework/Versions/A/FindMyCommon
       0x248904000 -        0x248a58b9f  com.apple.findmy.framework.FindMyLocate (1.0 - 1.0) <99C69FD8-1533-302F-A3C7-063AABB56C22> /System/Library/PrivateFrameworks/FindMyLocate.framework/Versions/A/FindMyLocate
       0x248c9c000 -        0x248cef53f  com.apple.UIKit.FocusEngine (9126.6.8) <CACC89FE-B88C-3419-A1C3-42C61D0C3DF3> /System/Library/PrivateFrameworks/FocusEngine.framework/Versions/A/FocusEngine
       0x248e6a000 -        0x248e6d2ff  com.apple.FontServices (1.0 - 1) <A9851D45-161F-3722-BC68-5B3B3FBFC956> /System/Library/PrivateFrameworks/FontServices.framework/Versions/A/FontServices
       0x248e6e000 -        0x248f5de2f  libXTFontStaticRegistryData.dylib (335.4.0.6) <B3DBACFE-8DA6-3E2D-92F1-F82E010A2225> /System/Library/PrivateFrameworks/FontServices.framework/libXTFontStaticRegistryData.dylib
       0x248f5f000 -        0x248f6bc9f  com.apple.FramePacing (1.0 - 1) <1FDD3B19-C04A-3EE7-B7DF-E1F89954A696> /System/Library/PrivateFrameworks/FramePacing.framework/Versions/A/FramePacing
       0x248f6c000 -        0x24902d39f  com.apple.FrontBoard (1000.4.12 - 1000.4.12) <7CDC68D4-0845-3053-AB80-C5A1F354060F> /System/Library/PrivateFrameworks/FrontBoard.framework/Versions/A/FrontBoard
       0x24902e000 -        0x24907931f  com.apple.FusionTracker (1.0 - 1) <71098074-30C7-3C45-8F08-3E3036A6158C> /System/Library/PrivateFrameworks/FusionTracker.framework/Versions/A/FusionTracker
       0x24a08d000 -        0x24a092f07  libGPUCompilerUtils.dylib (32023.886.1) <F5DD2A61-CD1B-32B0-A8E6-7CB5B4BABFF1> /System/Library/PrivateFrameworks/GPUCompiler.framework/Versions/32023/Libraries/libGPUCompilerUtils.dylib
       0x24e500000 -        0x24e53f797  libllvm-flatbuffers.dylib (32023.886.1) <526C249F-FF2E-3DC4-A639-B41A032E8CCE> /System/Library/PrivateFrameworks/GPUCompiler.framework/Versions/32023/Libraries/libllvm-flatbuffers.dylib
       0x24ea9e000 -        0x24ec20d7f  com.apple.GRDB.GRDBInternal (1.0 - 15.0.0.1) <9EB8FE95-7E26-39FD-A9FA-ACB9EC1B6052> /System/Library/PrivateFrameworks/GRDBInternal.framework/Versions/A/GRDBInternal
       0x251c73000 -        0x251cc07a6  com.apple.GenerativeFunctions.GenerativeFunctions (1.0 - 222.46) <418985BB-52A3-34D4-8379-40DC4C63AA32> /System/Library/PrivateFrameworks/GenerativeFunctions.framework/Versions/A/GenerativeFunctions
       0x251cc1000 -        0x251d5687f  com.apple.GenerativeFunctions.GenerativeFunctionsFoundation (1.0 - 222.46) <63FD423F-836C-3034-BA48-100AE09A9140> /System/Library/PrivateFrameworks/GenerativeFunctionsFoundation.framework/Versions/A/GenerativeFunctionsFoundation
       0x251d57000 -        0x251dbc97f  com.apple.GenerativeFunctions.GenerativeFunctionsInstrumentation (1.0 - 222.46) <D8D56A51-034C-3D0D-9651-3BCF46DC82B7> /System/Library/PrivateFrameworks/GenerativeFunctionsInstrumentation.framework/Versions/A/GenerativeFunctionsInstrumentation
       0x251dbd000 -        0x251e9ef5f  com.apple.GenerativeFunctions.GenerativeModels (1.0 - 222.46) <0E502870-00F4-35D4-AF82-E7059244798E> /System/Library/PrivateFrameworks/GenerativeModels.framework/Versions/A/GenerativeModels
       0x251e9f000 -        0x251f14b9f  com.apple.GenerativeFunctions.GenerativeModelsFoundation (1.0 - 222.46) <B9593227-D796-3C21-B9B4-374C3D1CFC2F> /System/Library/PrivateFrameworks/GenerativeModelsFoundation.framework/Versions/A/GenerativeModelsFoundation
       0x251fe4000 -        0x2520b927f  com.apple.GeoAnalytics (1.0 - 2031.26.4.23.6) <15523A10-C296-3D1C-BB5B-4A1E4649482B> /System/Library/PrivateFrameworks/GeoAnalytics.framework/Versions/A/GeoAnalytics
       0x2520ba000 -        0x2520bf33f  com.apple.GeoServices (1.0 - 2031.26.4.23.6) <38EE3C42-06D6-3A46-A420-DF701A4EA911> /System/Library/PrivateFrameworks/GeoServicesCore.framework/Versions/A/GeoServicesCore
       0x252268000 -        0x25232be9f  com.apple.Gestures (9126.1.5 - 9126.1.5) <BD114F61-BB5F-3E43-AA0D-674DF9E0BA17> /System/Library/PrivateFrameworks/Gestures.framework/Versions/A/Gestures
       0x2552c6000 -        0x255315fff  com.apple.IASUtilitiesCore (1.0 - 1) <77E103E7-D90F-3DE4-B1B3-223050582C56> /System/Library/PrivateFrameworks/IASUtilitiesCore.framework/Versions/A/IASUtilitiesCore
       0x255391000 -        0x2553f231f  com.apple.IO80211 (1.0 - 1) <236517AD-8D16-3E62-8603-EBE7B65ACACA> /System/Library/PrivateFrameworks/IO80211.framework/Versions/A/IO80211
       0x2553fc000 -        0x25540683f  com.apple.IPConfiguration (1.21 - 1.21) <6661265C-7B78-3158-9011-4BFDFFEF7807> /System/Library/PrivateFrameworks/IPConfiguration.framework/Versions/A/IPConfiguration
       0x25543c000 -        0x2554adadf  com.apple.cocoa.IconRendering (1.0 - 92.3) <6A34A62A-16D4-34F0-B34B-2D96B53C20AD> /System/Library/PrivateFrameworks/IconRendering.framework/Versions/A/IconRendering
       0x2554b5000 -        0x2554e1e5f  com.apple.ImageCaptureDevices (2020.2.2 - 2020.2.2) <69785455-D99E-396F-827E-C36431DE5985> /System/Library/PrivateFrameworks/ImageCaptureDevices.framework/Versions/A/ImageCaptureDevices
       0x255c8f000 -        0x255cc943f  com.apple.InputAnalytics (1.0 - 111.5.1) <4495A900-9BB3-38D8-83D6-E3642CF1BDB9> /System/Library/PrivateFrameworks/InputAnalytics.framework/Versions/A/InputAnalytics
       0x255e83000 -        0x255f8c2bf  com.apple.InstalledContentLibrary (1.0 - 1.0) <1ACDAA8A-EB43-37C7-B661-39B1C0E05290> /System/Library/PrivateFrameworks/InstalledContentLibrary.framework/Versions/A/InstalledContentLibrary
       0x2588b0000 -        0x25907ed3f  com.apple.IntelligencePlatformLibrary (274.60) <D5DD1ABA-3697-3A32-A10F-FC7B7954CFB6> /System/Library/PrivateFrameworks/IntelligencePlatformLibrary.framework/Versions/A/IntelligencePlatformLibrary
       0x259221000 -        0x25922bfdf  com.apple.IsolatedContextLogging (1.0 - 1) <D67EF216-FCD7-3B06-9B9F-2716BE2ACD36> /System/Library/PrivateFrameworks/IsolatedContextLogging.framework/Versions/A/IsolatedContextLogging
       0x25922c000 -        0x259263b5f  com.apple.audio.CoreAudio.IsolatedCoreAudioClient (1.0 - 1) <BCF6954A-8EBA-3813-92D9-FE75B565FD8B> /System/Library/PrivateFrameworks/IsolatedCoreAudioClient.framework/Versions/A/IsolatedCoreAudioClient
       0x259580000 -        0x25959bb3f  com.apple.JetPack-Mac (1.0 - 1) <E89E2839-F4DB-3EB8-B187-34084E1D2FCE> /System/Library/PrivateFrameworks/JetPack.framework/Versions/A/JetPack
       0x259b5a000 -        0x259caf83f  com.apple.LiftUI (1.2 - 1) <A8AEFA39-1EFA-3BED-9A28-9EB301F00345> /System/Library/PrivateFrameworks/LiftUI.framework/Versions/A/LiftUI
       0x25a205000 -        0x25a387d5f  com.apple.LinkMetadata (1.0 - 300.6.3) <0DAC711D-EBC6-36AE-B8FC-A05CA64FCB18> /System/Library/PrivateFrameworks/LinkMetadata.framework/Versions/A/LinkMetadata
       0x25a388000 -        0x25a3b6f44  com.apple.LinkPresentation.StyleSheetParsing (296 - 296.12) <B8CA6886-8535-3D19-8508-DBC5A48FAF1A> /System/Library/PrivateFrameworks/LinkPresentationStyleSheetParsing.framework/Versions/A/LinkPresentationStyleSheetParsing
       0x25a3b7000 -        0x25a563f9f  com.apple.LinkServices (1.0 - 300.6.3) <5242E36A-1CF8-35C0-A56C-BCDBC9C404F2> /System/Library/PrivateFrameworks/LinkServices.framework/Versions/A/LinkServices
       0x25a5f5000 -        0x25a77b07f  com.apple.LocalAuthenticationCore (2005.160.7) <A85C476C-4B4D-3329-A88B-54C091C7EF34> /System/Library/PrivateFrameworks/LocalAuthenticationCore.framework/Versions/A/LocalAuthenticationCore
       0x25a77c000 -        0x25a7bc4df  com.apple.LocalAuthenticationCoreUI (2005.160.7) <4964BFE6-073B-36F3-AE71-6918214C4155> /System/Library/PrivateFrameworks/LocalAuthenticationCoreUI.framework/Versions/A/LocalAuthenticationCoreUI
       0x25a7bd000 -        0x25a7dc6df  com.apple.LocalAuthenticationCredentialServices (2005.160.7) <B33DAE62-0077-35EA-822C-EB5D21C34768> /System/Library/PrivateFrameworks/LocalAuthenticationCredentialServices.framework/Versions/A/LocalAuthenticationCredentialServices
       0x25a81a000 -        0x25a83df7f  com.apple.internal.LocalStatusKit (1.0 - 1) <846DDA3B-DF32-3C8F-8C8D-A19AB1B99D89> /System/Library/PrivateFrameworks/LocalStatusKit.framework/Versions/A/LocalStatusKit
       0x25a842000 -        0x25a8465df  com.apple.CoreLocation.LocationLogEncryption (3077.0.4) <8A2C8C17-E138-3B34-8643-ED4FB1C9049E> /System/Library/PrivateFrameworks/LocationLogEncryption.framework/Versions/A/LocationLogEncryption
       0x25a847000 -        0x25a84da9f  com.apple.LockdownMode (1.0 - 1) <C4B693AB-9D69-31E3-ADA3-CDAB500A6676> /System/Library/PrivateFrameworks/LockdownMode.framework/Versions/A/LockdownMode
       0x25a8d6000 -        0x25a90697f  com.apple.devicemanagementclient.MDMClientLibrary (1.0 - 1) <6124ABA5-1F26-351A-804F-10D64A181B22> /System/Library/PrivateFrameworks/MDMClientLibrary.framework/Versions/A/MDMClientLibrary
       0x25a960000 -        0x25aff6923  com.apple.MIL (3520.4 - 3520.4.1) <97C5C585-F5EE-323A-B949-69EAE9080871> /System/Library/PrivateFrameworks/MIL.framework/Versions/A/MIL
       0x25aff7000 -        0x25b07403f  com.apple.CoreML.MLAssetIO (1.0 - 3520.5.1) <6028DD46-8E5A-33F0-93B2-41FA480366CC> /System/Library/PrivateFrameworks/MLAssetIO.framework/Versions/A/MLAssetIO
       0x25b075000 -        0x25b0ceb0f  com.apple.mlcompiler.runtime (3404.3.1 - 3404.3.1) <22B4CD07-5C72-3CA4-9CD1-2C87686CDDE5> /System/Library/PrivateFrameworks/MLCompilerRuntime.framework/Versions/A/MLCompilerRuntime
       0x25b0cf000 -        0x25b0e8827  com.apple.mlcompiler.services (3404.3.1 - 3404.3.1) <A5FDE0C1-0910-3899-A737-E4632BA75E80> /System/Library/PrivateFrameworks/MLCompilerServices.framework/Versions/A/MLCompilerServices
       0x25dd5c000 -        0x25dd7331f  com.apple.ggml.ModelAsset (1.0 - 1) <A84CB10A-72FA-399B-B86D-9B5ED12CEB39> /System/Library/PrivateFrameworks/MLModelAsset.framework/Versions/A/MLModelAsset
       0x25e82b000 -        0x25e830d3f  com.apple.ManagedOrganizationContacts (1.2 - 151.5) <7EB4BA69-82EB-3FBE-8E3F-3522040843A0> /System/Library/PrivateFrameworks/ManagedOrganizationContacts.framework/Versions/A/ManagedOrganizationContacts
       0x25e831000 -        0x25e87523f  com.apple.ManagedSettingsObjC (267.160.4 - 267.160.4) <2B5B0FCC-B46C-34A7-9FFD-12009FDA64C6> /System/Library/PrivateFrameworks/ManagedSettingsObjC.framework/Versions/A/ManagedSettingsObjC
       0x25e876000 -        0x25e88081f  com.apple.ManagedSettingsSupport (267.160.4 - 267.160.4) <B091438A-38FD-3ADB-9A1F-7689EC9658BC> /System/Library/PrivateFrameworks/ManagedSettingsSupport.framework/Versions/A/ManagedSettingsSupport
       0x25f13b000 -        0x25f19cb1f  com.apple.MediaAnalysisServices (1.0 - 1) <7CAE43A1-52B3-36F0-BE67-230A7C75406B> /System/Library/PrivateFrameworks/MediaAnalysisServices.framework/Versions/A/MediaAnalysisServices
       0x25fbc1000 -        0x25fc22abf  com.apple.MessageSecurity (1.0 - 195.160.36) <A287A9A4-5DFD-331D-93A8-696DBE94592C> /System/Library/PrivateFrameworks/MessageSecurity.framework/Versions/A/MessageSecurity
       0x260b5a000 -        0x260df8b1f  com.apple.ModelCatalog.ModelCatalog (1.0 - 233.41) <EABC58EE-BC80-3886-A456-5028411AE472> /System/Library/PrivateFrameworks/ModelCatalog.framework/Versions/A/ModelCatalog
       0x260e99000 -        0x2610317df  com.apple.ModelManagerServices (1.0 - 1) <882BC08E-B1E1-3E52-AE8A-AC22A1BF2BE8> /System/Library/PrivateFrameworks/ModelManagerServices.framework/Versions/A/ModelManagerServices
       0x263b86000 -        0x263c0d9bf  com.apple.calls.NeighborhoodActivityConduit (1.0 - 1) <8D6A0307-5491-3103-B361-3FEDB564445C> /System/Library/PrivateFrameworks/NeighborhoodActivityConduit.framework/Versions/A/NeighborhoodActivityConduit
       0x26418e000 -        0x26419585f  com.apple.NewsURLBucket (1.0 - 1) <D3409E6C-D3E0-34D3-AD89-A580BEC5A403> /System/Library/PrivateFrameworks/NewsURLBucket.framework/Versions/A/NewsURLBucket
       0x2649b5000 -        0x264c2d3df  com.apple.mlpt.ODIE (1.0 - 1) <B3719F0A-4637-3943-A796-2ED6F5AC0C08> /System/Library/PrivateFrameworks/ODIE.framework/Versions/A/ODIE
       0x264c33000 -        0x264c5d1bf  com.apple.OSEligibility (319.160.17) <62740FDD-2B16-3319-B5C9-022D45C6B03A> /System/Library/PrivateFrameworks/OSEligibility.framework/Versions/A/OSEligibility
       0x2658c0000 -        0x2659d885f  com.apple.ParsingInternal (0.0.1 - 5026.6.1) <11E757EC-72FB-3C53-8ED7-641428AB6169> /System/Library/PrivateFrameworks/ParsingInternal.framework/Versions/A/ParsingInternal
       0x265fc4000 -        0x265fd3a1f  com.apple.PassKitMacHelperTemp (1.0 - 1642.7.4) <B6E0923A-1228-37F1-99A4-835F5C1452A6> /System/Library/PrivateFrameworks/PassKitMacHelperTemp.framework/Versions/A/PassKitMacHelperTemp
       0x2666aa000 -        0x267465c3f  com.apple.PegasusAPI (1.0 - 3525.4.2) <4C76BFD8-9DCE-32E6-9833-BC989659A067> /System/Library/PrivateFrameworks/PegasusAPI.framework/Versions/A/PegasusAPI
       0x267466000 -        0x2674c4bdf  com.apple.PegasusConfiguration (1.0 - 15000) <618F8025-DAFD-3DE7-A8D1-AB121D69BC89> /System/Library/PrivateFrameworks/PegasusConfiguration.framework/Versions/A/PegasusConfiguration
       0x267a95000 -        0x267bc997f  com.apple.PhotoLibraryServicesCore (1.0 - 860.0.170) <5FC4D42C-E147-3437-A2F1-B79653D08FF4> /System/Library/PrivateFrameworks/PhotoLibraryServicesCore.framework/Versions/A/PhotoLibraryServicesCore
       0x268640000 -        0x2686996bf  com.apple.PhotosIntelligenceCore (1.0 - 860.0.170) <F82016CB-5C21-3439-9B88-3A9315A44938> /System/Library/PrivateFrameworks/PhotosIntelligenceCore.framework/Versions/A/PhotosIntelligenceCore
       0x268d71000 -        0x268d92e1f  com.apple.accessibility.PhotosensitivityProcessing (1.0 - 1) <FBE7AAD0-E0FC-3573-9D62-EB6948FE95FF> /System/Library/PrivateFrameworks/PhotosensitivityProcessing.framework/Versions/A/PhotosensitivityProcessing
       0x268dd5000 -        0x268ec2b5f  com.apple.PlatformSSO (1.0 - 483.160.10) <30B8106C-CEB4-3C8C-8A8B-91AC28F9253B> /System/Library/PrivateFrameworks/PlatformSSO.framework/Versions/A/PlatformSSO
       0x268ec3000 -        0x268fd4c5f  com.apple.PlatformSSOCore (1.0 - 483.160.10) <FBE9002D-DFA8-3A74-BB91-65A6AC212783> /System/Library/PrivateFrameworks/PlatformSSOCore.framework/Versions/A/PlatformSSOCore
       0x269186000 -        0x2691c2a3c  com.apple.PoirotSQLite (1.0 - 1) <24779350-BC29-3465-AAB3-F7CD0DA5844A> /System/Library/PrivateFrameworks/PoirotSQLite.framework/Versions/A/PoirotSQLite
       0x2691c3000 -        0x26923025f  com.apple.PoirotSchematizer (1.0 - 1) <42CDC0E6-51BA-3804-BD3E-EDF87FC74034> /System/Library/PrivateFrameworks/PoirotSchematizer.framework/Versions/A/PoirotSchematizer
       0x269231000 -        0x269266bff  com.apple.PoirotUDFs (1.0 - 1) <D085FE4F-65AA-3A17-8F24-156DD9814882> /System/Library/PrivateFrameworks/PoirotUDFs.framework/Versions/A/PoirotUDFs
       0x269267000 -        0x269376a3f  com.apple.portrait.Portrait (1.0 - 18) <247EAF46-FC92-38AF-BDC3-D0264F54DA4E> /System/Library/PrivateFrameworks/Portrait.framework/Versions/A/Portrait
       0x269428000 -        0x26948fa9f  com.apple.PosterFoundation (1.0 - 1) <6F5A7AD7-80A3-3AC1-85CC-ECF5FED85ABB> /System/Library/PrivateFrameworks/PosterFoundation.framework/Versions/A/PosterFoundation
       0x269490000 -        0x2694b527f  com.apple.PosterFuturesKit (1.0 - 1) <4630911B-43EB-36D3-8B38-C27E3A9D6E97> /System/Library/PrivateFrameworks/PosterFuturesKit.framework/Versions/A/PosterFuturesKit
       0x2694b6000 -        0x2694c471f  com.apple.PosterModel (1.0 - 1) <0D20A94C-AB6A-3999-BE5D-D0C10CEB83C1> /System/Library/PrivateFrameworks/PosterModel.framework/Versions/A/PosterModel
       0x26a3ff000 -        0x26a53addf  com.apple.ProDisplayLibrary (10.6.1 - 10.6.1) <D495C457-EECC-3D57-B449-EC8F324214EC> /System/Library/PrivateFrameworks/ProDisplayLibrary.framework/Versions/A/ProDisplayLibrary
       0x26a59d000 -        0x26a5ca59f  com.apple.intelligenceflow.ProactiveDaemonSupport (1.0 - 3525.11.14) <12245228-2B9A-3B24-8C5E-10111D68BE65> /System/Library/PrivateFrameworks/ProactiveDaemonSupport.framework/Versions/A/ProactiveDaemonSupport
       0x26ab87000 -        0x26ad3695f  com.apple.GenerativeFunctions.PromptKit (1.0 - 222.46) <DC6D188E-6FF7-3111-984E-85C8FDBEEF9C> /System/Library/PrivateFrameworks/PromptKit.framework/Versions/A/PromptKit
       0x26b44d000 -        0x26b4690ff  com.apple.RecapPerformanceTesting (50 - 50.0) <02803CCF-F7B9-3FC3-AA8A-C55B14F60540> /System/Library/PrivateFrameworks/RecapPerformanceTesting.framework/Versions/A/RecapPerformanceTesting
       0x26b4f5000 -        0x26b4fd4df  com.apple.ReflectionInternal (1.0.0 - 5026.6.1) <9A1279D4-575A-3E48-A460-A631A3F82D18> /System/Library/PrivateFrameworks/ReflectionInternal.framework/Versions/A/ReflectionInternal
       0x26b4fe000 -        0x26b51899f  com.apple.RegulatoryDomainFramework (1.0 - 1) <1859954E-2C9A-306C-B98F-DF555F51337B> /System/Library/PrivateFrameworks/RegulatoryDomain.framework/Versions/A/RegulatoryDomain
       0x26b83c000 -        0x26b8c09df  com.apple.RemoteManagementModel (1.0 - 2.0) <07B5F2B2-1A81-3A55-BEB8-8D6D04C2BD0A> /System/Library/PrivateFrameworks/RemoteManagementModel.framework/Versions/A/RemoteManagementModel
       0x26b8c1000 -        0x26b8cc25f  com.apple.RemoteManagementProtocol (1.0 - 2.0) <EEA63C08-F05B-3A5A-A013-C7EB0E60CAEF> /System/Library/PrivateFrameworks/RemoteManagementProtocol.framework/Versions/A/RemoteManagementProtocol
       0x26b8cd000 -        0x26b92613f  com.apple.RemoteManagementStore (1.0 - 2.0) <C2D44609-7FCB-3FD9-9360-161A8662CD15> /System/Library/PrivateFrameworks/RemoteManagementStore.framework/Versions/A/RemoteManagementStore
       0x26b937000 -        0x26bc521ff  com.apple.RemoteUI (1.0 - 4) <C6D5918E-64EA-356C-8B88-AE15AF6F37D7> /System/Library/PrivateFrameworks/RemoteUI.framework/Versions/A/RemoteUI
       0x26bcf1000 -        0x26beabd1f  com.apple.private.ReplicatorEngine (1.0 - 1) <F08EA79A-45A8-3126-98F3-1DD86C144E30> /System/Library/PrivateFrameworks/ReplicatorEngine.framework/Versions/A/ReplicatorEngine
       0x26beac000 -        0x26c00731f  com.apple.private.ReplicatorServices (1.0 - 1) <4A6E1A2E-61DB-3657-ABDF-AB6525F3A9EA> /System/Library/PrivateFrameworks/ReplicatorServices.framework/Versions/A/ReplicatorServices
       0x26c449000 -        0x26c45c9d7  com.apple.RuntimeInternal (1.0.0 - 5026.6.1) <6D89CD71-A86D-3D78-A64B-96AB79550F79> /System/Library/PrivateFrameworks/RuntimeInternal.framework/Versions/A/RuntimeInternal
       0x26c481000 -        0x26c497e1f  com.apple.SESShared (1.0 - 1) <D0D20EE9-45F8-37F2-BAD7-E76B1260DA24> /System/Library/PrivateFrameworks/SESShared.framework/Versions/A/SESShared
       0x26c50a000 -        0x26c62dc9f  com.apple.seservice (1.0 - 1) <C748736F-4139-3616-B1FC-B9B95774337A> /System/Library/PrivateFrameworks/SEService.framework/Versions/A/SEService
       0x26c62e000 -        0x26c6b3a3f  com.apple.SFSymbolsFramework (1 - 190.4.0.1) <968B5A5F-9749-3527-AF2A-66B599785308> /System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/SFSymbols
       0x26c6b4000 -        0x26c721abf  com.apple.SILManager (53.19 - 53.19) <1B4C0154-843C-3CEE-9628-22978082DD2D> /System/Library/PrivateFrameworks/SILManager.framework/Versions/A/SILManager
       0x26c78c000 -        0x26c7a5dbf  com.apple.STSXPCHelperClient (1.0 - 1) <F2A6328A-AEBF-363C-AB76-41A1B7C5ECD2> /System/Library/PrivateFrameworks/STSXPCHelperClient.framework/Versions/A/STSXPCHelperClient
       0x26dd5e000 -        0x26de4b0bf  com.apple.SensitiveContentAnalysisML (1) <67C3B698-8279-30F1-9167-4730E6F41F5A> /System/Library/PrivateFrameworks/SensitiveContentAnalysisML.framework/Versions/A/SensitiveContentAnalysisML
       0x26e02e000 -        0x26e0c08ff  com.apple.SentencePieceInternal (57.3) <642E3357-AB6D-3039-A818-EDB5D6A189C2> /System/Library/PrivateFrameworks/SentencePieceInternal.framework/Versions/A/SentencePieceInternal
       0x26e36f000 -        0x26e42c5bf  com.apple.Settings (224.4.3 - 224.4.3) <8FE48BAC-7275-31E7-802E-E44DAC8AEB6F> /System/Library/PrivateFrameworks/Settings.framework/Versions/A/Settings
       0x26eb44000 -        0x26ec6113f  com.apple.siri.SiriAnalytics (1.0 - 1) <600E036E-9B18-35BE-B40B-E8D2D53AC90D> /System/Library/PrivateFrameworks/SiriAnalytics.framework/Versions/A/SiriAnalytics
       0x26f4ed000 -        0x26f54039f  com.apple.crossdevicearbitration (1.0 - 1) <71CAE70A-72AD-3F74-834D-3519B545C08D> /System/Library/PrivateFrameworks/SiriCrossDeviceArbitration.framework/Versions/A/SiriCrossDeviceArbitration
       0x26f541000 -        0x26f5b0a1f  com.apple.crossdevicearbitration.feedback (1.0 - 1) <B6CA0C8F-4310-3E4B-BA3B-9F968F3009F4> /System/Library/PrivateFrameworks/SiriCrossDeviceArbitrationFeedback.framework/Versions/A/SiriCrossDeviceArbitrationFeedback
       0x273034000 -        0x27303d3bf  com.apple.siri.SiriPowerInstrumentation (1 - 1.0) <68474F39-798D-325B-B52F-3DE214F279AE> /System/Library/PrivateFrameworks/SiriPowerInstrumentation.framework/Versions/A/SiriPowerInstrumentation
       0x274475000 -        0x274df44ff  com.apple.siri.tts.SiriTTS (1 - 1) <FA946108-D387-360D-8E87-7BB8FF2D3099> /System/Library/PrivateFrameworks/SiriTTS.framework/Versions/A/SiriTTS
       0x274df5000 -        0x274fec89f  com.apple.siri.SiriTTSService (1.0 - 1) <619E6770-766A-3629-9AF8-F32C009375E9> /System/Library/PrivateFrameworks/SiriTTSService.framework/Versions/A/SiriTTSService
       0x2766df000 -        0x2767cfebf  com.apple.SonicFoundation (1.0 - 25700.26.20.101) <6B0D099C-AC56-35DB-90F1-88A09E587FCB> /System/Library/PrivateFrameworks/SonicFoundation.framework/Versions/A/SonicFoundation
       0x2772b6000 -        0x2772edaff  com.apple.StatusKit (1.0 - 116.700.21) <A765DD00-50DC-3F94-B5F4-1FD6BEEDEC11> /System/Library/PrivateFrameworks/StatusKit.framework/Versions/A/StatusKit
       0x2775c8000 -        0x2778d11ff  com.apple.StocksCore (8.5 - 1969) <BEF22BE7-254A-3FA4-B94B-B3312630B6A4> /System/Library/PrivateFrameworks/StocksCore.framework/Versions/A/StocksCore
       0x2778d2000 -        0x27793f3bf  com.apple.StocksKit (1.0 - 1969) <9DAD333C-35B5-33F0-9BEA-EBE440B2369D> /System/Library/PrivateFrameworks/StocksKit.framework/Versions/A/StocksKit
       0x277940000 -        0x27794f269  com.apple.StorageContainersPrivate (1.0 - 1) <FC50C8E4-5071-3792-B263-AF47DAFD8D32> /System/Library/PrivateFrameworks/StorageContainersPrivate.framework/Versions/A/StorageContainersPrivate
       0x277bcf000 -        0x277bfb4a1  com.apple.security.SwiftASN1Internal (1.0 - 1) <EDCDD822-AA64-3EB9-B0C3-9CEF1A4E0B36> /System/Library/PrivateFrameworks/SwiftASN1Internal.framework/Versions/A/SwiftASN1Internal
       0x27856f000 -        0x27857c85f  com.apple.SymptomShared (2169.160.3) <C1706F3F-7AF7-3833-8762-75B6F6AC5F8B> /System/Library/PrivateFrameworks/SymptomShared.framework/Versions/A/SymptomShared
       0x27857f000 -        0x278592adf  com.apple.SymptomAnalytics (1.0 - 2169.160.3) <259877CE-4E2C-34A9-A07F-FEE2999D7B2F> /System/Library/PrivateFrameworks/Symptoms.framework/Versions/A/Frameworks/SymptomAnalytics.framework/Versions/A/SymptomAnalytics
       0x278835000 -        0x27885999f  com.apple.SymptomPresentationFeed (1.0 - 2169.160.3) <1B99192D-B1C9-3D85-BCD0-EB3CFC6A99C9> /System/Library/PrivateFrameworks/Symptoms.framework/Versions/A/Frameworks/SymptomPresentationFeed.framework/Versions/A/SymptomPresentationFeed
       0x27885e000 -        0x2788ba41f  com.apple.Synapse (1.0 - 1) <38BD8D2F-900A-3D8A-AF1A-8502ACFBAD4F> /System/Library/PrivateFrameworks/Synapse.framework/Versions/A/Synapse
       0x278a3d000 -        0x278a986df  com.apple.SystemStatus (1.0 - 1) <B3896AF4-2356-37C4-9273-FE994065C56B> /System/Library/PrivateFrameworks/SystemStatus.framework/Versions/A/SystemStatus
       0x278ab6000 -        0x278aca63f  com.apple.SystemWake (1.0 - 732.1.1) <97AC6077-A996-3088-9113-EE396B863CC6> /System/Library/PrivateFrameworks/SystemWake.framework/Versions/A/SystemWake
       0x278d67000 -        0x278d68d1f  com.apple.tailspin.TailspinSymbolication (1.0 - 250.2) <6794652C-86F0-37EB-838D-483177685E26> /System/Library/PrivateFrameworks/TailspinSymbolication.framework/Versions/A/TailspinSymbolication
       0x278d69000 -        0x278dcb2bf  com.apple.TeaDB (3.0 - 1428) <877F9FC8-C692-368B-A4BF-3C9800FDA9B6> /System/Library/PrivateFrameworks/TeaDB.framework/Versions/A/TeaDB
       0x278dcc000 -        0x278fb287f  com.apple.TeaFoundation (3.0 - 1428) <074CA6E5-5E73-3092-8C97-708CE0B64609> /System/Library/PrivateFrameworks/TeaFoundation.framework/Versions/A/TeaFoundation
       0x278fb3000 -        0x278fd131f  com.apple.TeaSettings (3.0 - 1428) <24E8D5F5-1C28-3A05-9F82-CD15CAA0AE45> /System/Library/PrivateFrameworks/TeaSettings.framework/Versions/A/TeaSettings
       0x2791f2000 -        0x27931597f  com.apple.TextAnimationSupport (7.2.1 - 7.2.1) <2191D369-5F2B-3522-9547-3425ECF45ECD> /System/Library/PrivateFrameworks/TextAnimationSupport.framework/Versions/A/TextAnimationSupport
       0x27b30d000 -        0x27b3491df  com.apple.tightbeam (1.0 - 483.100.88) <D817A379-80E9-3A4B-A361-DDEF1B7EFB28> /System/Library/PrivateFrameworks/Tightbeam.framework/Versions/A/Tightbeam
       0x27b47f000 -        0x27b565b7f  com.apple.TipKitCore (26.6 - 120.5.1) <19BEF9A1-BCB5-3E13-BC7C-CEB741FDA8A7> /System/Library/PrivateFrameworks/TipKitCore.framework/Versions/A/TipKitCore
       0x27b812000 -        0x27ba4917f  com.apple.TokenGeneration (1.0 - 1) <F3D31D3F-74F8-30A6-B49D-1DC743ED35C5> /System/Library/PrivateFrameworks/TokenGeneration.framework/Versions/A/TokenGeneration
       0x27ba4a000 -        0x27bc17f3f  com.apple.TokenGenerationCore (1.0 - 1) <3166486F-3F65-31DB-8018-779FFA32DC71> /System/Library/PrivateFrameworks/TokenGenerationCore.framework/Versions/A/TokenGenerationCore
       0x27be28000 -        0x27c364fbf  com.apple.ToolKit (4711) <68C8F9FF-3606-3E92-872C-59B4B3639DFA> /System/Library/PrivateFrameworks/ToolKit.framework/Versions/A/ToolKit
       0x27c72e000 -        0x27c73663f  com.apple.TranslationUIServices (1.0 - 365.14) <626F2403-1633-3B71-92AD-CB27157C1F3E> /System/Library/PrivateFrameworks/TranslationUIServices.framework/Versions/A/TranslationUIServices
       0x27d45b000 -        0x27d59151f  com.apple.UIIntelligenceSupport (1.0 - 1) <E4480FEE-65A7-39DF-ACA1-09E7AC6054E9> /System/Library/PrivateFrameworks/UIIntelligenceSupport.framework/Versions/A/UIIntelligenceSupport
       0x27d9fc000 -        0x27d9fc539  com.apple.USDLib_FormatLoaderProxy (1.0 - 23.5.2) <0C3D9888-5726-30A5-B58B-E884C52F552A> /System/Library/PrivateFrameworks/USDLib_FormatLoaderProxy.framework/Versions/A/USDLib_FormatLoaderProxy
       0x27db36000 -        0x27dbfb4bf  com.apple.UnifiedAssetFramework (1.0 - 1) <54A2CBB8-623D-3629-904A-D0399ED13547> /System/Library/PrivateFrameworks/UnifiedAssetFramework.framework/Versions/A/UnifiedAssetFramework
       0x27e3a8000 -        0x27e3aa1ff  com.apple.UpdateCycle (1 - 1) <365E81B9-B9BA-3F4F-83FD-86A35CFBC8AC> /System/Library/PrivateFrameworks/UpdateCycle.framework/Versions/A/UpdateCycle
       0x27e6ba000 -        0x27e6bdf1f  com.apple.UserSafety (1.0 - 1) <A128411C-776B-310D-AE62-F06B799A8999> /System/Library/PrivateFrameworks/UserSafety.framework/Versions/A/UserSafety
       0x27e6c4000 -        0x27e7bfbc7  com.apple.VDAF (1.0 - 34.2) <CEF65473-6BC8-364D-B2A4-41C1D7A0646C> /System/Library/PrivateFrameworks/VDAF.framework/Versions/A/VDAF
       0x27e7c0000 -        0x27f80de7f  com.apple.vfx (16.0 - 203.100.3) <BC483EE5-DF5D-3407-B29E-D012E96E4DC4> /System/Library/PrivateFrameworks/VFX.framework/Versions/A/VFX
       0x27f819000 -        0x27f8b0bff  com.apple.vectordb.VectorSearch (1.0 - 48.3) <127400C7-2565-3B79-A180-7D7FB1C4E4F6> /System/Library/PrivateFrameworks/VectorSearch.framework/Versions/A/VectorSearch
       0x27fa85000 -        0x27fa862cf  com.apple.VideoToolboxParavirtualizationSupport (64.4.7 - 64.4.7) <825E8416-E246-338E-A5CF-AA81A1B01DD9> /System/Library/PrivateFrameworks/VideoToolboxParavirtualizationSupport.framework/Versions/A/VideoToolboxParavirtualizationSupport
       0x28069b000 -        0x2806e709f  com.apple.VisionCore (9.5.4 - 9.5.4) <4E70B4ED-C8E0-3636-80E4-0939FE56BB63> /System/Library/PrivateFrameworks/VisionCore.framework/Versions/A/VisionCore
       0x2806e8000 -        0x2807e057f  com.apple.VisionKitCore (1.0 - 3) <EF8858AC-2759-3EAE-9A71-7976D17D57C7> /System/Library/PrivateFrameworks/VisionKitCore.framework/Versions/A/VisionKitCore
       0x281ba8000 -        0x281c50b9f  com.apple.wallpaper.framework (1.0 - 245.6) <1820DA03-3BC0-3529-83CE-FA817B111F9E> /System/Library/PrivateFrameworks/Wallpaper.framework/Versions/A/Wallpaper
       0x281d3b000 -        0x281d98c7f  com.apple.wallpaper.foundation.framework (1.0 - 245.6) <4AB813BB-BD7E-3662-8164-11F9515CCC96> /System/Library/PrivateFrameworks/WallpaperFoundation.framework/Versions/A/WallpaperFoundation
       0x281d9a000 -        0x281e1429f  com.apple.wallpaper.types.framework (1.0 - 245.6) <6C6F731C-8BEA-3594-B6AC-29228B08A3A3> /System/Library/PrivateFrameworks/WallpaperTypes.framework/Versions/A/WallpaperTypes
       0x282852000 -        0x282af987f  com.apple.WebGPU (21624 - 21624.5.1.11.3) <55539E91-9EA7-3CEB-8D64-4A1BA3D5F91E> /System/Library/PrivateFrameworks/WebGPU.framework/Versions/A/WebGPU
       0x282dfe000 -        0x282e1e1bf  com.apple.WindowManagement (1.0 - 341.6.1) <6ECD36F7-0A2E-3631-A57F-FD0152173454> /System/Library/PrivateFrameworks/WindowManagement.framework/Versions/A/WindowManagement
       0x284007000 -        0x28400b9ff  com.apple.WritingTools (1.0 - 1) <84FB5635-42EE-3BB5-B7CD-8A354AD7DB0A> /System/Library/PrivateFrameworks/WritingTools.framework/Versions/A/WritingTools
       0x28450e000 -        0x284589a7f  com.apple.internal.XPCDistributed (1.0 - 1) <E0EBF3B8-E8A7-3D19-A4F1-B59F59D01868> /System/Library/PrivateFrameworks/XPCDistributed.framework/Versions/A/XPCDistributed
       0x2845f3000 -        0x2845fa2ff  com.apple.-AppIntentsServices.-AppIntents (1.0 - 40.5.2) <ABA40CD7-4978-3252-BB46-4FF0710E1355> /System/Library/PrivateFrameworks/_AppIntentsServices_AppIntents.framework/Versions/A/_AppIntentsServices_AppIntents
       0x284633000 -        0x2846424df  com.apple.-IconServices-SwiftUI (1.0 - 743.5.2.401) <4E552726-98C4-3516-BDD6-FF430AF4BD7C> /System/Library/PrivateFrameworks/_IconServices_SwiftUI.framework/Versions/A/_IconServices_SwiftUI
       0x284643000 -        0x2847dd9bf  com.apple.-JetEngine-SwiftUI (1.0 - 1) <14F0DF69-E940-3392-B47F-93F6C8B084E1> /System/Library/PrivateFrameworks/_JetEngine_SwiftUI.framework/Versions/A/_JetEngine_SwiftUI
       0x28522d000 -        0x2852d703f  com.apple.iCloudQuota (1.0 - 1) <B22181C2-C259-390B-94BA-A85690177D90> /System/Library/PrivateFrameworks/iCloudQuota.framework/Versions/A/iCloudQuota
       0x2852db000 -        0x2853b7ebf  com.apple.iCloudQuotaUI (1.0 - 1) <84C87FF6-8CAB-3D1F-B36B-3304EF90C626> /System/Library/PrivateFrameworks/iCloudQuotaUI.framework/Versions/A/iCloudQuotaUI
       0x287702000 -        0x28774bfbf  com.apple.icloudMCCKit (1) <2B14F3B1-AB6A-3BBB-A8D8-A0ABB1712780> /System/Library/PrivateFrameworks/icloudMCCKit.framework/Versions/A/icloudMCCKit
       0x289bda000 -        0x289bdd89f  com.apple.UIUtilities (9126.6.8) <183FD4D6-D766-34FC-B8E1-7C4D17435AC3> /System/Library/SubFrameworks/UIUtilities.framework/Versions/A/UIUtilities
       0x289cbd000 -        0x289cbfd5f  libAXSafeCategoryBundle.dylib (3191.39) <AED06031-78CB-39A6-B50E-A229BB163B16> /usr/lib/libAXSafeCategoryBundle.dylib
       0x289cfa000 -        0x289d9471f  libAppleArchive.dylib (450.160.2) <9A8926C8-36A6-3DB4-A485-059C1F630984> /usr/lib/libAppleArchive.dylib
       0x289d95000 -        0x289da8f5f  libAppleSSE.dylib (320) <86A18D93-D443-3D0B-AB1D-8131E15E56FD> /usr/lib/libAppleSSE.dylib
       0x289e3a000 -        0x289e3ba3f  libBASupport.dylib (227.160.8) <F2CE4FE7-B3FB-386D-9430-EF683B30DC18> /usr/lib/libBASupport.dylib
       0x289e4f000 -        0x289e5945f  libCoreEntitlements.dylib (80.100.6) <A0DF7E4F-890F-320B-90BF-60CBAC3AFF8B> /usr/lib/libCoreEntitlements.dylib
       0x289e86000 -        0x289fa900f  libDisplayWarpSupport.dylib (191.100.4) <C7EE8998-9CD3-3B9E-909A-CED9EB9838B4> /usr/lib/libDisplayWarpSupport.dylib
       0x289faa000 -        0x289fb45bb  libEndpointSecuritySystem.dylib (589.160.2) <99AE877D-D7C7-3A2B-A2CB-B6C5A494CE5F> /usr/lib/libEndpointSecuritySystem.dylib
       0x28a02d000 -        0x28a02ed1f  libInterpreterSecurity.dylib (726.160.4) <9CC3D917-3D94-3F03-BBC1-EFA332316378> /usr/lib/libInterpreterSecurity.dylib
       0x28a145000 -        0x28a14c87f  libReverseProxyDevice.dylib (104.120.2) <29367004-5D60-38DB-831F-9E5EE9364B21> /usr/lib/libReverseProxyDevice.dylib
       0x28a14d000 -        0x28a154349  libRosetta.dylib (367.9) <0C7397C6-D747-31F2-8BC1-4096213BDE5C> /usr/lib/libRosetta.dylib
       0x28a1ba000 -        0x28a1ba35f  libSpatial.dylib (108) <68B7C15F-537C-3FEF-838B-DC548772A45F> /usr/lib/libSpatial.dylib
       0x28a1bd000 -        0x28a1c63ff  libTLE.dylib (80.100.6) <90E600A3-0A27-348A-AA57-D1DF4FB305E8> /usr/lib/libTLE.dylib
       0x28a867000 -        0x28a86bb00  libchannel.dylib (56.100.3) <AF29D5F2-255D-34E4-AC3C-A25B77759440> /usr/lib/libchannel.dylib
       0x28a9d3000 -        0x28aae4b17  libcrypto.46.dylib (109.100.2) <46D13DA8-E7BD-37DC-91DD-D5E6CE00C2B8> /usr/lib/libcrypto.46.dylib
       0x28ac1f000 -        0x28ac3b762  libhvf.dylib (11) <23C577A8-DB0B-3A0A-9058-1289483C262A> /usr/lib/libhvf.dylib
       0x28b06f000 -        0x28b07728a  libmrc.dylib (2881.160.4) <2B49C295-4EA2-3DE3-90B4-DC03A96F2657> /usr/lib/libmrc.dylib
       0x28b4c7000 -        0x28b4c8007  librealtime_safety.dylib (56.100.3) <7B48EF6C-6A9C-3B90-BF41-DEC1FC85A764> /usr/lib/librealtime_safety.dylib
       0x28b556000 -        0x28b58e527  libssl.48.dylib (109.100.2) <07D5F4C6-1A13-344C-882B-0B0A08048DE5> /usr/lib/libssl.48.dylib
       0x28b5c9000 -        0x28b5f736f  libswiftPrespecialized.dylib (0) <9E3C7597-446F-3C50-9930-2425D9252C0C> /usr/lib/libswiftPrespecialized.dylib
       0x28b86e000 -        0x28b88d219  libswiftAppleArchive.dylib (450.160.2) <4F93B2BF-0022-39A6-8540-D6C2B8CD6D94> /usr/lib/swift/libswiftAppleArchive.dylib
       0x28b88e000 -        0x28b891e7f  libswiftCoreMediaIO.dylib (5617.100.5) <1CC8AEF7-F92C-3B70-86D8-C7D6B36871B8> /usr/lib/swift/libswiftCoreMediaIO.dylib
       0x28b893000 -        0x28b8a5043  libswiftDistributed.dylib (6.3.2 - 6.3.2.1.11) <2EDB2E62-942F-3AB5-82AF-8E1328544E17> /usr/lib/swift/libswiftDistributed.dylib
       0x28b8a9000 -        0x28b8a9edb  libswiftGLKit.dylib (1.1) <E2550B90-D9BD-31DD-B1DC-89648B664334> /usr/lib/swift/libswiftGLKit.dylib
       0x28b8ad000 -        0x28b8b431f  libswiftMLCompute.dylib (84) <F0F78040-E52B-3D87-8DC0-10C14F153D31> /usr/lib/swift/libswiftMLCompute.dylib
       0x28b8b5000 -        0x28b8b62df  libswiftMetalKit.dylib (1.2) <B7211CA6-0E8B-3D9E-8227-A548414D6834> /usr/lib/swift/libswiftMetalKit.dylib
       0x28b8b7000 -        0x28b8ba45f  libswiftModelIO.dylib (1) <6E809A71-7C41-3477-8E4E-841F8C0A1F4D> /usr/lib/swift/libswiftModelIO.dylib
       0x28b8bc000 -        0x28b8cbebc  libswiftObservation.dylib (6.3.2 - 6.3.2.1.11) <CD141C3F-F1A3-3AD8-B190-0A78FB3BB4E5> /usr/lib/swift/libswiftObservation.dylib
       0x28b8cd000 -        0x28b8d56df  libswiftPassKit.dylib (1642.7.4) <C2556A71-91FC-3562-A175-9EA41DE6023A> /usr/lib/swift/libswiftPassKit.dylib
       0x28b8db000 -        0x28b8e7817  libswiftRegexBuilder.dylib (6.3.2 - 6.3.2.1.11) <82D79BDA-26A0-3A44-AAC8-911411801FDE> /usr/lib/swift/libswiftRegexBuilder.dylib
       0x28b97a000 -        0x28b97d13f  libswiftSceneKit.dylib (1.2) <222DC99B-8FB0-3AF1-819B-9414C3E388CA> /usr/lib/swift/libswiftSceneKit.dylib
       0x28b97e000 -        0x28b9f472f  libswiftSpatial.dylib (108) <713AEF7A-43B6-3735-8AB5-361F5EE06BBA> /usr/lib/swift/libswiftSpatial.dylib
       0x28b9f8000 -        0x28ba0b8ef  libswiftSynchronization.dylib (6.3.2 - 6.3.2.1.11) <FDFD191A-CA23-3D4A-9875-C7748238830A> /usr/lib/swift/libswiftSynchronization.dylib
       0x28ba0c000 -        0x28ba24e60  libswiftSystem.dylib (75) <7CD9BDE7-F36B-3471-9295-38E181D6D9E5> /usr/lib/swift/libswiftSystem.dylib
       0x28ba26000 -        0x28ba3c79f  libswiftVideoToolbox.dylib (3330.13.2) <9247A5B6-A883-3A07-BEE7-A223840317A4> /usr/lib/swift/libswiftVideoToolbox.dylib
       0x28ba3e000 -        0x28ba3e669  libswift_Builtin_float.dylib (6.3.2.1.11) <52F59382-A6A6-3F55-8A85-D9FB822D370F> /usr/lib/swift/libswift_Builtin_float.dylib
       0x28ba3f000 -        0x28baca095  libswift_Concurrency.dylib (6.3.2 - 6.3.2.1.11) <8E168857-47F4-349F-A718-A18DB144FCB0> /usr/lib/swift/libswift_Concurrency.dylib
       0x28bacb000 -        0x28bacdf83  libswift_DarwinFoundation1.dylib (377.160.5) <85246B9A-A757-3F67-B792-3A2F7BB2BB25> /usr/lib/swift/libswift_DarwinFoundation1.dylib
       0x28bace000 -        0x28baceeeb  libswift_DarwinFoundation2.dylib (377.160.5) <AF5AF4DC-D24A-3073-BD23-4CEAD8C3AEE4> /usr/lib/swift/libswift_DarwinFoundation2.dylib
       0x28bacf000 -        0x28bacf7a7  libswift_DarwinFoundation3.dylib (377.160.5) <8D2C31B5-FB10-3BF6-8566-F0DCD56C8582> /usr/lib/swift/libswift_DarwinFoundation3.dylib
       0x28bad0000 -        0x28bb6e49f  libswift_RegexParser.dylib (6.3.2 - 6.3.2.1.11) <7B63C2BF-8C7C-3ECA-ACD9-F1B75DBE018C> /usr/lib/swift/libswift_RegexParser.dylib
       0x28bb6f000 -        0x28bbfb0cd  libswift_StringProcessing.dylib (6.3.2 - 6.3.2.1.11) <8DF0116D-DFC9-3906-9DF6-F1DBC47E324B> /usr/lib/swift/libswift_StringProcessing.dylib
       0x28bbff000 -        0x28bbff3cb  libswift_errno.dylib (377.160.5) <5527F412-D0AB-3DD2-A3CC-F280ED578225> /usr/lib/swift/libswift_errno.dylib
       0x28bc04000 -        0x28bc043d3  libswiftsys_time.dylib (377.160.5) <4B5C0268-23EB-3E20-8F57-CDECFB6E3205> /usr/lib/swift/libswiftsys_time.dylib
       0x28bd60000 -        0x28bd63a4b  libsystem_darwindirectory.dylib (122) <971A4F65-493D-39F3-846D-0D33FA2769FD> /usr/lib/system/libsystem_darwindirectory.dylib
       0x28bd64000 -        0x28bd6e39b  libsystem_eligibility.dylib (319.160.17) <750CA446-92EA-3A56-9A7B-CC0841686C50> /usr/lib/system/libsystem_eligibility.dylib
       0x28bd6f000 -        0x28bd7688b  libsystem_sanitizers.dylib (26.1) <D88EC709-9AA8-3083-B22B-D3CB39678D71> /usr/lib/system/libsystem_sanitizers.dylib
       0x28bd77000 -        0x28bd77bb7  libsystem_trial.dylib (474.2.18.2) <7194FF5B-A6C5-3D67-B00A-90209F10D603> /usr/lib/system/libsystem_trial.dylib
       0x28bdab000 -        0x28bdff6df  libAppleTconUARPUpdater.dylib (1345.160.8.0.1) <5FFA6778-0A2F-3AC7-8AFB-81C0E748BA9F> /usr/lib/updaters/libAppleTconUARPUpdater.dylib
       0x28bf40000 -        0x28bf579e7  libT200Updater.dylib (1.0.0.7.66) <1F0C0C4C-EC16-302D-93B5-F45249FCE76B> /usr/lib/updaters/libT200Updater.dylib
       0x28bf58000 -        0x28dce3a5f  libusd_ms.dylib (23.5.3) <DFC11B09-A62B-3E98-9331-7312954A5E6A> /usr/lib/usd/libusd_ms.dylib
```

## .build/optimization/candidate-scope-mtp-v2/build-identity.json

SHA-256: `97d4082d424067b660e6d3b4bdcd85c0a9715d1cc1b19aa498d6cb368ab3f655`

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "73a2973e970d141882cf6d5045bc8d768526f50f584e3d44204415e9b44a16df",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "e39aca578ca19edb858d4a0f221993c2d4ee7008a62a4bb1afba50e84d8f21f0",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "a5c27a555cdf4d99567a5906a299f80883ba1f6d00c29593ac8c0e6077af945a",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
    "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "ef479d8e6486110bf826292102272e8ab6c8ce5b8d1873f7dd7419e9483a8e20",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "ec4554a1b76cb99919e9ac3700ddcc561bef6dba639c9efab3eccc2aad48dc17",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "2356bd52ca9688c1228a19ad971f6e3e388bc150401b4dabea5a9f66cac5cb06",
  "binary_sha256": "1032fe228a2750bd0a5197db2af21e309f0b18388c2a210cce423a16c5c70b6e",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
```

## .build/optimization/scope-mtp-t0-t1-v2.json

SHA-256: `04307406440e5f6f36ca72679d2cb4c972747098fa84388454de37e3602d2bab`

```json
{
  "checks" : [
    {
      "items" : [
        {
          "name" : "a pass never exceeds the measured query-by-key product",
          "passed" : true
        },
        {
          "name" : "a pass never falls below the measured floor",
          "passed" : true
        },
        {
          "name" : "the passes sum to the prompt",
          "passed" : true
        },
        {
          "name" : "reading more tokens never takes less time",
          "passed" : true
        },
        {
          "name" : "the pass shrinks as the context grows",
          "passed" : true
        },
        {
          "name" : "the shrunken pass is still at the floor or above",
          "passed" : true
        },
        {
          "name" : "an empty prompt runs no passes",
          "passed" : true
        },
        {
          "name" : "an empty prompt costs no time",
          "passed" : true
        },
        {
          "name" : "actual tail fits without a third pass",
          "passed" : true
        },
        {
          "name" : "reference tail is preserved as the control",
          "passed" : true
        },
        {
          "name" : "tail schedule covers reused offsets, boundaries and all supported context",
          "passed" : true
        },
        {
          "name" : "read scopes preserve every bounded compute pass",
          "passed" : true
        },
        {
          "name" : "zero remainder makes no pass",
          "passed" : true
        },
        {
          "name" : "huge diagnostic inputs do not overflow",
          "passed" : true
        },
        {
          "name" : "a fully cached prompt runs no passes",
          "passed" : true
        }
      ],
      "measurements" : {
        "chunk_at_0" : 4096,
        "chunk_at_31k" : 1024,
        "worst_query_key_product" : 32505856
      },
      "name" : "prefill-schedule",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "1 is accepted",
          "passed" : true
        },
        {
          "name" : "the ceiling is accepted",
          "passed" : true
        },
        {
          "name" : "0 is refused",
          "passed" : true
        },
        {
          "name" : "-1 is refused",
          "passed" : true
        },
        {
          "name" : "one past the ceiling is refused",
          "passed" : true
        },
        {
          "name" : "the refusal names the ceiling",
          "passed" : true
        },
        {
          "name" : "the refusal says the ceiling is measured, not a memory limit",
          "passed" : true
        },
        {
          "name" : "the refusal names the tool that moves it",
          "passed" : true
        }
      ],
      "measurements" : {
        "max_tokens" : 32768
      },
      "name" : "context-policy",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "process physical footprint is readable",
          "passed" : true
        },
        {
          "name" : "process RSS high-water is readable",
          "passed" : true
        },
        {
          "name" : "lifetime RSS is separately readable",
          "passed" : true
        },
        {
          "name" : "monotonic duration is nonnegative",
          "passed" : true
        },
        {
          "name" : "footprint sampler includes endpoints",
          "passed" : true
        },
        {
          "name" : "reference optimization defaults",
          "passed" : true
        },
        {
          "name" : "typed override enables compaction",
          "passed" : true
        },
        {
          "name" : "malformed override refused",
          "passed" : true
        },
        {
          "name" : "unknown optimization refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope -1 refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope 1 refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope 16384 refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope bad refused",
          "passed" : true
        },
        {
          "name" : "unbounded read scope refused",
          "passed" : true
        },
        {
          "name" : "terminal output needs no speculative draft",
          "passed" : true
        },
        {
          "name" : "draft count fits remaining output",
          "passed" : true
        },
        {
          "name" : "public depth cannot exceed recording cap",
          "passed" : true
        },
        {
          "name" : "negative remaining output cannot underflow",
          "passed" : true
        },
        {
          "name" : "prefix cache reaches its four-entry bound",
          "passed" : true
        },
        {
          "name" : "an identical history replaces instead of duplicating an entry",
          "passed" : true
        },
        {
          "name" : "a miss evicts before allocating a fifth state",
          "passed" : true
        },
        {
          "name" : "a smaller live token ceiling evicts immediately",
          "passed" : true
        },
        {
          "name" : "held GB includes fixed recurrent state",
          "passed" : true
        },
        {
          "name" : "growing hit still reuses its state",
          "passed" : true
        },
        {
          "name" : "growing hit reserves future state before allocation",
          "passed" : true
        },
        {
          "name" : "huge reservation safely misses",
          "passed" : true
        },
        {
          "name" : "huge reservation releases held state",
          "passed" : true
        },
        {
          "name" : "capacity reservation still hits",
          "passed" : true
        },
        {
          "name" : "capacity growth reserves bytes before reuse",
          "passed" : true
        },
        {
          "name" : "saturated byte reservation evicts safely",
          "passed" : true
        },
        {
          "name" : "identical bytes hash alike",
          "passed" : true
        },
        {
          "name" : "different bytes do not",
          "passed" : true
        },
        {
          "name" : "the same image at the same offset matches",
          "passed" : true
        },
        {
          "name" : "a swapped image does not",
          "passed" : true
        },
        {
          "name" : "an entry ending inside a run still matches that run",
          "passed" : true
        },
        {
          "name" : "a text-only entry rejects a prompt with an image inside its range",
          "passed" : true
        },
        {
          "name" : "an image beyond the entry's range is irrelevant to the match",
          "passed" : true
        },
        {
          "name" : "a vision conversation is held, not discarded",
          "passed" : true
        },
        {
          "name" : "the same ids with a different picture miss",
          "passed" : true
        },
        {
          "name" : "the text-only splice never sees a vision entry",
          "passed" : true
        },
        {
          "name" : "prefix splice chooses the longest retained extension",
          "passed" : true
        },
        {
          "name" : "prefix splice is strict, not an identical-history match",
          "passed" : true
        },
        {
          "name" : "prefix splice lookup does not consume the retained state",
          "passed" : true
        },
        {
          "name" : "a disabled prefix cache offers no splice",
          "passed" : true
        },
        {
          "name" : "shard listing works through a symlinked model dir",
          "passed" : true
        },
        {
          "name" : "8.1 GB plan stays inside its target",
          "passed" : true
        },
        {
          "name" : "10.0 GB plan stays inside its target",
          "passed" : true
        },
        {
          "name" : "16.0 GB plan stays inside its target",
          "passed" : true
        },
        {
          "name" : "30.0 GB plan stays inside its target",
          "passed" : true
        }
      ],
      "measurements" : {
        "peak_gb_at_10" : 8.99949696,
        "peak_gb_at_16" : 14.999033087999997,
        "peak_gb_at_30" : 28.998546688,
        "peak_gb_at_8" : 7.921999103999999
      },
      "name" : "runtime-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "quiet machine at target: hold",
          "passed" : true
        },
        {
          "name" : "availability collapses: shrinks",
          "passed" : true
        },
        {
          "name" : "  ...and says why",
          "passed" : true
        },
        {
          "name" : "  ...converges in one step (no ratcheting)",
          "passed" : true
        },
        {
          "name" : "target depends on (available + pool), not on either alone",
          "passed" : true
        },
        {
          "name" : "small drop inside the shrink dead-band: hold",
          "passed" : true
        },
        {
          "name" : "small gain inside the grow dead-band: hold",
          "passed" : true
        },
        {
          "name" : "grow blocked while a resize is recent",
          "passed" : true
        },
        {
          "name" : "grow blocked while pressure is recent",
          "passed" : true
        },
        {
          "name" : "grow allowed once calm and cooled",
          "passed" : true
        },
        {
          "name" : "grow restores the planner's prefill and prefix budgets",
          "passed" : true
        },
        {
          "name" : "  ...and says why",
          "passed" : true
        },
        {
          "name" : "warning pressure sheds >= max(2 GB, 15%)",
          "passed" : true
        },
        {
          "name" : "  ...ignores the resize cooldown",
          "passed" : true
        },
        {
          "name" : "critical pressure sheds >= max(4 GB, 50%)",
          "passed" : true
        },
        {
          "name" : "critical sheds strictly more than warning",
          "passed" : true
        },
        {
          "name" : "repeated critical pressure converges to the floor",
          "passed" : true
        },
        {
          "name" : "floor is never breached",
          "passed" : true
        },
        {
          "name" : "at the floor, more pressure is a no-op",
          "passed" : true
        },
        {
          "name" : "never asks for more slots than the model has",
          "passed" : true
        }
      ],
      "measurements" : {
        "critical_shed_gb" : 10.063872,
        "warning_shed_gb" : 3.0191616000000003
      },
      "name" : "governor-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "matching file is accepted",
          "passed" : true
        },
        {
          "name" : "same-size corruption is rejected",
          "passed" : true
        },
        {
          "name" : "exact Content-Range is accepted",
          "passed" : true
        },
        {
          "name" : "wrong range start is rejected",
          "passed" : true
        },
        {
          "name" : "wrong range total is rejected",
          "passed" : true
        },
        {
          "name" : "unknown range total is rejected",
          "passed" : true
        },
        {
          "name" : "every pinned file has a digest",
          "passed" : true
        },
        {
          "name" : "the draft head is pinned as the one optional file",
          "passed" : true
        },
        {
          "name" : "an absent optional file is not a repair; an absent required one is",
          "passed" : true
        },
        {
          "name" : "an empty directory reads as missing",
          "passed" : true
        },
        {
          "name" : "missing needs the whole manifest",
          "passed" : true
        },
        {
          "name" : "status carries free disk",
          "passed" : true
        },
        {
          "name" : "bytesToFetch agrees with the manifest",
          "passed" : true
        },
        {
          "name" : "a missing copy is not ready",
          "passed" : true
        }
      ],
      "measurements" : {
        "free_disk_bytes" : 461549002752,
        "manifest_files" : 25,
        "manifest_required_bytes" : 103793508077,
        "manifest_total_bytes" : 105264463248
      },
      "name" : "pull-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a simulated device is marked",
          "passed" : true
        },
        {
          "name" : "the working set defaults to 75% of RAM",
          "passed" : true
        },
        {
          "name" : "a simulated device produces a plan",
          "passed" : true
        },
        {
          "name" : "the plan carries the simulation",
          "passed" : true
        },
        {
          "name" : "the current machine is not simulated",
          "passed" : true
        },
        {
          "name" : "a real plan is not marked simulated",
          "passed" : true
        },
        {
          "name" : "the current machine reports RAM",
          "passed" : true
        },
        {
          "name" : "the working set is below RAM",
          "passed" : true
        },
        {
          "name" : "a simulated availability is bounded by the real reading",
          "passed" : true
        },
        {
          "name" : "--experts-per-layer wins over --memory-gb",
          "passed" : true
        },
        {
          "name" : "the losing knob is noted",
          "passed" : true
        },
        {
          "name" : "an empty request is auto",
          "passed" : true
        },
        {
          "name" : "any knob makes it not auto",
          "passed" : true
        },
        {
          "name" : "a plan request round-trips through JSON",
          "passed" : true
        },
        {
          "name" : "a device round-trips through JSON",
          "passed" : true
        }
      ],
      "measurements" : {
        "machine_ram_gb" : 51.539607552,
        "machine_working_set_gb" : 40.200896512
      },
      "name" : "machine-planning",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a normal request parses its method",
          "passed" : true
        },
        {
          "name" : "...and its path",
          "passed" : true
        },
        {
          "name" : "...and its content length",
          "passed" : true
        },
        {
          "name" : "...and lowercases header names",
          "passed" : true
        },
        {
          "name" : "a chunked body is 411, not an empty read",
          "passed" : true
        },
        {
          "name" : "...and the message says what to send instead",
          "passed" : true
        },
        {
          "name" : "an oversized body is 413",
          "passed" : true
        },
        {
          "name" : "a body exactly at the cap is accepted",
          "passed" : true
        },
        {
          "name" : "a malformed Content-Length is 400",
          "passed" : true
        },
        {
          "name" : "a negative Content-Length is 400",
          "passed" : true
        },
        {
          "name" : "no Content-Length means no body",
          "passed" : true
        }
      ],
      "measurements" : {
        "max_body_bytes" : 33554432
      },
      "name" : "http-framing",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a query string does not change the route",
          "passed" : true
        },
        {
          "name" : "a bare path is unchanged",
          "passed" : true
        },
        {
          "name" : "a trailing slash is the same route",
          "passed" : true
        },
        {
          "name" : "the root keeps its slash",
          "passed" : true
        },
        {
          "name" : "an absolute-form target routes on its path",
          "passed" : true
        },
        {
          "name" : "...including https",
          "passed" : true
        },
        {
          "name" : "...and an authority with no path is the root",
          "passed" : true
        },
        {
          "name" : "...with the query still stripped",
          "passed" : true
        },
        {
          "name" : "no Origin needs no CORS header",
          "passed" : true
        },
        {
          "name" : "an empty Origin needs no CORS header",
          "passed" : true
        },
        {
          "name" : "loopback origin http:\/\/localhost:3000 is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "loopback origin http:\/\/127.0.0.1:8080 is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "loopback origin https:\/\/localhost is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "loopback origin http:\/\/[::1]:5173 is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "foreign origin https:\/\/attacker.example is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin http:\/\/evil.localhost.attacker.com is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin file:\/\/\/etc\/passwd is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin http:\/\/192.168.1.10:3000 is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin not a url is refused",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "http-routing",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "846x859 -> 52x54 patches",
          "passed" : true
        },
        {
          "name" : "846x859 -> 702 tokens",
          "passed" : true
        },
        {
          "name" : "1206x1570 -> 1862 tokens",
          "passed" : true
        },
        {
          "name" : "1024x1024 -> 1024 tokens",
          "passed" : true
        },
        {
          "name" : "a 56x56 thumbnail is raised to the 64-token floor",
          "passed" : true
        },
        {
          "name" : "224x224 lands on the same floor",
          "passed" : true
        },
        {
          "name" : "a 4K screenshot is capped at 2304 tokens",
          "passed" : true
        },
        {
          "name" : "and lands on the cap's grid",
          "passed" : true
        },
        {
          "name" : "the cap is the binding bound, not the processor's",
          "passed" : true
        },
        {
          "name" : "round-half-even keeps 0.5 at 0",
          "passed" : true
        },
        {
          "name" : "and sends 1.5 to 2",
          "passed" : true
        },
        {
          "name" : "and 2.5 back to 2",
          "passed" : true
        },
        {
          "name" : "3.5 to 4",
          "passed" : true
        },
        {
          "name" : "a zero dimension is refused",
          "passed" : true
        },
        {
          "name" : "an extreme aspect ratio is refused",
          "passed" : true
        },
        {
          "name" : "199:1 is still accepted",
          "passed" : true
        },
        {
          "name" : "bare base64 loads",
          "passed" : true
        },
        {
          "name" : "a data: URL loads",
          "passed" : true
        },
        {
          "name" : "whitespace around it is tolerated",
          "passed" : true
        },
        {
          "name" : "http:\/\/ is refused",
          "passed" : true
        },
        {
          "name" : "https:\/\/ is refused",
          "passed" : true
        },
        {
          "name" : "file:\/\/ is refused",
          "passed" : true
        },
        {
          "name" : "a filesystem path never returns the file",
          "passed" : true
        },
        {
          "name" : "nor does a file:\/\/ URL",
          "passed" : true
        },
        {
          "name" : "a data: URL that is not base64 is refused",
          "passed" : true
        },
        {
          "name" : "an empty payload is refused",
          "passed" : true
        },
        {
          "name" : "a payload past the size cap is refused before decoding",
          "passed" : true
        },
        {
          "name" : "and says URLs are not fetched",
          "passed" : true
        },
        {
          "name" : "a scheme is recognised",
          "passed" : true
        },
        {
          "name" : "case-insensitively",
          "passed" : true
        },
        {
          "name" : "base64 has none",
          "passed" : true
        },
        {
          "name" : "nor does a windows-ish path",
          "passed" : true
        },
        {
          "name" : "the fixture decodes to an image",
          "passed" : true
        },
        {
          "name" : "half a PNG does not",
          "passed" : true
        },
        {
          "name" : "a transparent pixel composites onto white, not onto black",
          "passed" : true
        },
        {
          "name" : "a whole PNG has its IEND",
          "passed" : true
        },
        {
          "name" : "half a PNG does not",
          "passed" : true
        },
        {
          "name" : "and it is refused rather than decoded",
          "passed" : true
        },
        {
          "name" : "a JPEG missing its EOI is truncated",
          "passed" : true
        },
        {
          "name" : "one with EOI then trailing bytes is not",
          "passed" : true
        },
        {
          "name" : "a container with no known terminator is left to ImageIO",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 1 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 2 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 3 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 4 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 5 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 6 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 7 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 8 lands every corner",
          "passed" : true
        },
        {
          "name" : "an unknown orientation value is left alone",
          "passed" : true
        },
        {
          "name" : "pixel values are one row per patch",
          "passed" : true
        },
        {
          "name" : "patches are ordered by merge block, not by row",
          "passed" : true
        },
        {
          "name" : "a run inside the chunk is re-based whole",
          "passed" : true
        },
        {
          "name" : "a run the chunk starts inside drops its head",
          "passed" : true
        },
        {
          "name" : "a run the chunk ends inside drops its tail",
          "passed" : true
        },
        {
          "name" : "a chunk strictly inside a run keeps the middle",
          "passed" : true
        },
        {
          "name" : "a run before the chunk is skipped",
          "passed" : true
        },
        {
          "name" : "a run after it too",
          "passed" : true
        },
        {
          "name" : "an exactly-abutting run is not overlap",
          "passed" : true
        },
        {
          "name" : "images come out in template order across both shapes",
          "passed" : true
        },
        {
          "name" : "a text-only conversation has none",
          "passed" : true
        },
        {
          "name" : "an ollama images field becomes content parts",
          "passed" : true
        },
        {
          "name" : "the picture leads",
          "passed" : true
        },
        {
          "name" : "and the text survives",
          "passed" : true
        },
        {
          "name" : "the image part carries the bytes unchanged",
          "passed" : true
        },
        {
          "name" : "a text-only part array collapses to a string",
          "passed" : true
        },
        {
          "name" : "a typed turn with images renders as parts",
          "passed" : true
        },
        {
          "name" : "images first",
          "passed" : true
        },
        {
          "name" : "a typed turn without them is still a plain string",
          "passed" : true
        },
        {
          "name" : "auto turns vision on when the checkpoint has a tower",
          "passed" : true
        },
        {
          "name" : "--vision off turns it back off",
          "passed" : true
        },
        {
          "name" : "the tower does not move the announced peak",
          "passed" : true
        },
        {
          "name" : "and the banner says what it will cost when it loads",
          "passed" : true
        },
        {
          "name" : "a text-only checkpoint cannot be forced on",
          "passed" : true
        },
        {
          "name" : "the machine-shaped request carries the mode too",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "vision-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a seed reproduces exactly",
          "passed" : true
        },
        {
          "name" : "a different seed draws differently",
          "passed" : true
        },
        {
          "name" : "every draw is inside the vocabulary",
          "passed" : true
        },
        {
          "name" : "the requested number of draws come back",
          "passed" : true
        },
        {
          "name" : "greedy ignores the seed",
          "passed" : true
        },
        {
          "name" : "greedy repeats one token",
          "passed" : true
        },
        {
          "name" : "out-of-range knobs still draw",
          "passed" : true
        },
        {
          "name" : "out-of-range knobs do not collapse to token 0",
          "passed" : true
        },
        {
          "name" : "an empty draw count returns nothing",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k0 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k0 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k0 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k0 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k0 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k0 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k7 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k7 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k7 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k7 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k7 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k7 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k8 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k8 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k8 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k8 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k8 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k8 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k256 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k256 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k256 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k256 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k256 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k256 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k257 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k257 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k257 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k257 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k257 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k257 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248319 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248319 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248319 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248319 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248319 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248319 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248320 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248320 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248320 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248320 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248320 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248320 p1.0",
          "passed" : true
        }
      ],
      "measurements" : {
        "vocab" : 256
      },
      "name" : "sampler-behaviour",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "one run replaces exactly its own span",
          "passed" : true
        },
        {
          "name" : "and the shape survives",
          "passed" : true
        },
        {
          "name" : "two runs are placed in offset order, whatever order they arrive in",
          "passed" : true
        },
        {
          "name" : "a run covering the whole chunk leaves nothing of the embedding",
          "passed" : true
        },
        {
          "name" : "a run at the head",
          "passed" : true
        },
        {
          "name" : "a run at the tail",
          "passed" : true
        },
        {
          "name" : "leaves the right length",
          "passed" : true
        },
        {
          "name" : "a run entirely inside a chunk keeps every row",
          "passed" : true
        },
        {
          "name" : "a chunk starting inside a run keeps the tail",
          "passed" : true
        },
        {
          "name" : "re-based to the chunk",
          "passed" : true
        },
        {
          "name" : "and it is the run's last two rows, not its first",
          "passed" : true
        },
        {
          "name" : "a run outside the chunk is dropped",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "vision-splice",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "one call: event count",
          "passed" : true
        },
        {
          "name" : "one call: name",
          "passed" : true
        },
        {
          "name" : "one call: input",
          "passed" : true
        },
        {
          "name" : "one call: id",
          "passed" : true
        },
        {
          "name" : "prose: leading text",
          "passed" : true
        },
        {
          "name" : "prose: typed input",
          "passed" : true
        },
        {
          "name" : "two calls: count",
          "passed" : true
        },
        {
          "name" : "two calls: first",
          "passed" : true
        },
        {
          "name" : "two calls: second",
          "passed" : true
        },
        {
          "name" : "two calls: distinct ids",
          "passed" : true
        },
        {
          "name" : "trailing text",
          "passed" : true
        },
        {
          "name" : "unterminated: one malformed event",
          "passed" : true
        },
        {
          "name" : "unterminated: verbatim",
          "passed" : true
        },
        {
          "name" : "unterminated: no tool call emitted",
          "passed" : true
        },
        {
          "name" : "no parameters: input",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (read_file)",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (read_file)",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (read_file)",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (list_dir)",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "toolcall-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "one call: every split agrees (98 splits)",
          "passed" : true
        },
        {
          "name" : "one call: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "prose: every split agrees (152 splits)",
          "passed" : true
        },
        {
          "name" : "prose: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "two calls: every split agrees (216 splits)",
          "passed" : true
        },
        {
          "name" : "two calls: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "trailing: every split agrees (104 splits)",
          "passed" : true
        },
        {
          "name" : "trailing: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "one call: character-by-character agrees",
          "passed" : true
        },
        {
          "name" : "two calls: character-by-character agrees",
          "passed" : true
        },
        {
          "name" : "holdback: plain text",
          "passed" : true
        },
        {
          "name" : "holdback: partial tag",
          "passed" : true
        },
        {
          "name" : "holdback: bare <",
          "passed" : true
        },
        {
          "name" : "holdback: complete tag not held",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "toolcall-stream-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "string: framing newlines",
          "passed" : true
        },
        {
          "name" : "string: inner newline kept",
          "passed" : true
        },
        {
          "name" : "string: blank line kept",
          "passed" : true
        },
        {
          "name" : "string: numeric stays string",
          "passed" : true
        },
        {
          "name" : "integer",
          "passed" : true
        },
        {
          "name" : "integer: negative",
          "passed" : true
        },
        {
          "name" : "integer: not a number falls back",
          "passed" : true
        },
        {
          "name" : "number: integral prints as int",
          "passed" : true
        },
        {
          "name" : "number: fractional",
          "passed" : true
        },
        {
          "name" : "boolean true",
          "passed" : true
        },
        {
          "name" : "boolean false",
          "passed" : true
        },
        {
          "name" : "boolean: junk falls back",
          "passed" : true
        },
        {
          "name" : "array",
          "passed" : true
        },
        {
          "name" : "array: junk falls back",
          "passed" : true
        },
        {
          "name" : "object",
          "passed" : true
        },
        {
          "name" : "object: key order is sorted",
          "passed" : true
        },
        {
          "name" : "unknown: bare word",
          "passed" : true
        },
        {
          "name" : "unknown: integer",
          "passed" : true
        },
        {
          "name" : "unknown: boolean",
          "passed" : true
        },
        {
          "name" : "unknown: object",
          "passed" : true
        },
        {
          "name" : "undeclared parameter is kept",
          "passed" : true
        },
        {
          "name" : "missing required parameter passes through",
          "passed" : true
        },
        {
          "name" : "string: quotes and backslashes escaped",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "toolcall-coercion",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "matching headers pass",
          "passed" : true
        },
        {
          "name" : "wrong specification version",
          "passed" : true
        },
        {
          "name" : "wrong protocol version",
          "passed" : true
        },
        {
          "name" : "absent headers are tolerated",
          "passed" : true
        },
        {
          "name" : "unknown field is refused by name",
          "passed" : true
        },
        {
          "name" : "json responseFormat is refused",
          "passed" : true
        },
        {
          "name" : "text responseFormat is accepted",
          "passed" : true
        },
        {
          "name" : "non-zero frequencyPenalty is refused",
          "passed" : true
        },
        {
          "name" : "frequencyPenalty 0 is accepted",
          "passed" : true
        },
        {
          "name" : "providerOptions is ignored, not refused",
          "passed" : true
        },
        {
          "name" : "includeRawChunks is ignored",
          "passed" : true
        },
        {
          "name" : "provider tools are dropped",
          "passed" : true
        },
        {
          "name" : "function tool name",
          "passed" : true
        },
        {
          "name" : "schema: string parameter",
          "passed" : true
        },
        {
          "name" : "schema: integer parameter",
          "passed" : true
        },
        {
          "name" : "schema: a two-type anyOf stays unknown",
          "passed" : true
        },
        {
          "name" : "toolChoice auto",
          "passed" : true
        },
        {
          "name" : "toolChoice none",
          "passed" : true
        },
        {
          "name" : "toolChoice required",
          "passed" : true
        },
        {
          "name" : "toolChoice tool",
          "passed" : true
        },
        {
          "name" : "toolChoice tool without a name",
          "passed" : true
        },
        {
          "name" : "no reasoning field: thinking off",
          "passed" : true
        },
        {
          "name" : "none: thinking off",
          "passed" : true
        },
        {
          "name" : "minimal: thinking off",
          "passed" : true
        },
        {
          "name" : "low maps to low",
          "passed" : true
        },
        {
          "name" : "medium maps to medium",
          "passed" : true
        },
        {
          "name" : "high maps to xhigh",
          "passed" : true
        },
        {
          "name" : "max maps to xhigh",
          "passed" : true
        },
        {
          "name" : "unknown label: thinking on, template default",
          "passed" : true
        },
        {
          "name" : "unknown label carries no effort",
          "passed" : true
        },
        {
          "name" : "maxOutputTokens",
          "passed" : true
        },
        {
          "name" : "seed",
          "passed" : true
        },
        {
          "name" : "stopSequences",
          "passed" : true
        },
        {
          "name" : "topK",
          "passed" : true
        },
        {
          "name" : "agent temperature",
          "passed" : true
        },
        {
          "name" : "agent top-p",
          "passed" : true
        },
        {
          "name" : "agent presence penalty",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-request",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "six systems become one",
          "passed" : true
        },
        {
          "name" : "systems joined by a blank line",
          "passed" : true
        },
        {
          "name" : "system comes first",
          "passed" : true
        },
        {
          "name" : "system after user is refused",
          "passed" : true
        },
        {
          "name" : "an image file part becomes the turn's picture",
          "passed" : true
        },
        {
          "name" : "a non-image file part is refused",
          "passed" : true
        },
        {
          "name" : "an image file part without data is refused",
          "passed" : true
        },
        {
          "name" : "a tool result may still not carry media",
          "passed" : true
        },
        {
          "name" : "tool loop: message count",
          "passed" : true
        },
        {
          "name" : "tool loop: assistant text",
          "passed" : true
        },
        {
          "name" : "tool loop: one call",
          "passed" : true
        },
        {
          "name" : "tool loop: call name",
          "passed" : true
        },
        {
          "name" : "tool loop: object input accepted",
          "passed" : true
        },
        {
          "name" : "tool loop: result role",
          "passed" : true
        },
        {
          "name" : "tool loop: result text",
          "passed" : true
        },
        {
          "name" : "tool loop: result id kept",
          "passed" : true
        },
        {
          "name" : "tool-call input as a JSON string",
          "passed" : true
        },
        {
          "name" : "output text",
          "passed" : true
        },
        {
          "name" : "output error-text",
          "passed" : true
        },
        {
          "name" : "output json is compact JSON",
          "passed" : true
        },
        {
          "name" : "output execution-denied",
          "passed" : true
        },
        {
          "name" : "output content joins text items",
          "passed" : true
        },
        {
          "name" : "assistant-final prompt is refused",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-prompt",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "cap 512: four entries",
          "passed" : true
        },
        {
          "name" : "cap 1024: four entries",
          "passed" : true
        },
        {
          "name" : "cap 2048: four entries",
          "passed" : true
        },
        {
          "name" : "cap 4096: four entries",
          "passed" : true
        },
        {
          "name" : "cap 8192: four entries",
          "passed" : true
        },
        {
          "name" : "cap 8193: four entries",
          "passed" : true
        },
        {
          "name" : "cap 12288: four entries",
          "passed" : true
        },
        {
          "name" : "cap 16384: four entries",
          "passed" : true
        },
        {
          "name" : "cap 24576: four entries",
          "passed" : true
        },
        {
          "name" : "cap 32768: four entries",
          "passed" : true
        },
        {
          "name" : "max_tokens < context_window at every cap",
          "passed" : true
        },
        {
          "name" : "no alias window exceeds the live cap",
          "passed" : true
        },
        {
          "name" : "object is a list",
          "passed" : true
        },
        {
          "name" : "every entry is a language model",
          "passed" : true
        },
        {
          "name" : "every entry advertises tool-use",
          "passed" : true
        },
        {
          "name" : "a vision server advertises the vision tag",
          "passed" : true
        },
        {
          "name" : "a text-only server does not",
          "passed" : true
        },
        {
          "name" : "no web-search or caching tags either way",
          "passed" : true
        },
        {
          "name" : "served model sorts first",
          "passed" : true
        },
        {
          "name" : "served model rank",
          "passed" : true
        },
        {
          "name" : "aliases rank below it",
          "passed" : true
        },
        {
          "name" : "catalogue lists moonshotai\/kimi-k3",
          "passed" : true
        },
        {
          "name" : "catalogue lists openai\/gpt-5.6-luna",
          "passed" : true
        },
        {
          "name" : "catalogue lists google\/gemini-2.5-flash",
          "passed" : true
        },
        {
          "name" : "served model offers effort",
          "passed" : true
        },
        {
          "name" : "aliases offer no effort",
          "passed" : true
        },
        {
          "name" : "compactor window is bounded",
          "passed" : true
        },
        {
          "name" : "compactor reply budget is small",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-catalog",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "frame starts with `data: `",
          "passed" : true
        },
        {
          "name" : "frame ends with a blank line",
          "passed" : true
        },
        {
          "name" : "frame has no interior newline",
          "passed" : true
        },
        {
          "name" : "keepalive is a comment fx skips",
          "passed" : true
        },
        {
          "name" : "finishReason is an object",
          "passed" : true
        },
        {
          "name" : "finishReason.unified",
          "passed" : true
        },
        {
          "name" : "finishReason.raw",
          "passed" : true
        },
        {
          "name" : "usage.inputTokens is nested",
          "passed" : true
        },
        {
          "name" : "inputTokens.total",
          "passed" : true
        },
        {
          "name" : "inputTokens.cacheRead is the prefix hit",
          "passed" : true
        },
        {
          "name" : "inputTokens.noCache is what was prefilled",
          "passed" : true
        },
        {
          "name" : "outputTokens.total",
          "passed" : true
        },
        {
          "name" : "outputTokens.text",
          "passed" : true
        },
        {
          "name" : "outputTokens.reasoning",
          "passed" : true
        },
        {
          "name" : "cold prompt: noCache equals total",
          "passed" : true
        },
        {
          "name" : "a call makes the turn tool-calls",
          "passed" : true
        },
        {
          "name" : "the token limit is length",
          "passed" : true
        },
        {
          "name" : "end of sequence is stop",
          "passed" : true
        },
        {
          "name" : "every unified value is one fx accepts",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-events",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "the turn that produced it is accepted",
          "passed" : true
        },
        {
          "name" : "reasoning in the generated text is ignored",
          "passed" : true
        },
        {
          "name" : "different arguments are refused",
          "passed" : true
        },
        {
          "name" : "a different tool is refused",
          "passed" : true
        },
        {
          "name" : "different text is refused",
          "passed" : true
        },
        {
          "name" : "a missing call is refused",
          "passed" : true
        },
        {
          "name" : "an extra call is refused",
          "passed" : true
        },
        {
          "name" : "an unterminated block is refused",
          "passed" : true
        },
        {
          "name" : "trailing whitespace is tolerated",
          "passed" : true
        },
        {
          "name" : "a plain text turn matches",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "chat-splice",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a bare null does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "a null inside an object does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "a null inside an array does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "a deeply nested null does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "the null bridge value is not NSNull",
          "passed" : true
        },
        {
          "name" : "a null inside a tool schema survives parsing",
          "passed" : true
        },
        {
          "name" : "the rendered tool spec carries no NSNull",
          "passed" : true
        },
        {
          "name" : "a null tool-call argument renders without NSNull",
          "passed" : true
        },
        {
          "name" : "the null argument is kept, not dropped",
          "passed" : true
        },
        {
          "name" : "a json tool result renders null as text",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-null-bridge",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "action is a string",
          "passed" : true
        },
        {
          "name" : "timeout_ms is an integer",
          "passed" : true
        },
        {
          "name" : "an optional string resolves to string",
          "passed" : true
        },
        {
          "name" : "an optional working directory resolves to string",
          "passed" : true
        },
        {
          "name" : "an optional enum resolves to string",
          "passed" : true
        },
        {
          "name" : "an optional integer resolves to integer",
          "passed" : true
        },
        {
          "name" : "an optional boolean resolves to boolean",
          "passed" : true
        },
        {
          "name" : "a genuine two-type union stays unknown",
          "passed" : true
        },
        {
          "name" : "a numeric-looking command stays a string",
          "passed" : true
        },
        {
          "name" : "a numeric-looking cwd stays a string",
          "passed" : true
        },
        {
          "name" : "timeout_ms is still a number",
          "passed" : true
        },
        {
          "name" : "the emitted input is what fx expects",
          "passed" : true
        },
        {
          "name" : "a missing required field is not invented",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-anyof-types",
      "passed" : true
    }
  ],
  "failed" : 0,
  "passed" : 21,
  "skipped" : 0
}
```

## .build/optimization/read-scope-generation-protocol-v2.json

SHA-256: `6658533bb60f46d30ffee6e6c576a7a493cd5eee8d8c16cbbf98307dcb3b984e`

```json
{
  "label": "read-scope-generation-pilot-v2",
  "classification": "exploratory mechanism A/B; not fixed-total-memory adoption",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "73a2973e970d141882cf6d5045bc8d768526f50f584e3d44204415e9b44a16df",
      "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "e39aca578ca19edb858d4a0f221993c2d4ee7008a62a4bb1afba50e84d8f21f0",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "a5c27a555cdf4d99567a5906a299f80883ba1f6d00c29593ac8c0e6077af945a",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "ef479d8e6486110bf826292102272e8ab6c8ce5b8d1873f7dd7419e9483a8e20",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "ec4554a1b76cb99919e9ac3700ddcc561bef6dba639c9efab3eccc2aad48dc17",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "2356bd52ca9688c1228a19ad971f6e3e388bc150401b4dabea5a9f66cac5cb06",
    "binary_sha256": "1032fe228a2750bd0a5197db2af21e309f0b18388c2a210cce423a16c5c70b6e",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "prerequisites": [
    "scope lifecycle exact state/retry gate",
    "synthetic image-span/MTP scope recovery gate"
  ],
  "arms": {
    "reference": {
      "SLOTSTREAM_OPT_COMPACT_STATE": "1",
      "SLOTSTREAM_OPT_COMPACT_MTP": "1",
      "SLOTSTREAM_OPT_INDEXER_TILES": "1",
      "SLOTSTREAM_OPT_PLE_TILES": "1",
      "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
    },
    "scope": {
      "SLOTSTREAM_OPT_COMPACT_STATE": "1",
      "SLOTSTREAM_OPT_COMPACT_MTP": "1",
      "SLOTSTREAM_OPT_INDEXER_TILES": "1",
      "SLOTSTREAM_OPT_PLE_TILES": "1",
      "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
      "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1",
      "SLOTSTREAM_OPT_READ_SCOPE": "8192"
    }
  },
  "fixture": "Tools/fixtures/optimization/acceptance.txt",
  "fixture_sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
  "memory_gb": 8.1,
  "fixed_actual_pool_slots": 640,
  "max_compute_chunk": 4096,
  "candidate_scope_limit": 8192,
  "total_memory_matched": false,
  "extra_allowances": "forced compute chunk plus full expert workspace plus conservative scope frontier/checkpoint; reported by harness",
  "rounds": 3,
  "order": [
    "reference,scope",
    "scope,reference",
    "reference,scope"
  ],
  "mtp": "off",
  "max_tokens": 1,
  "seed": 7,
  "primary_metric": "paired requestSeconds reduction",
  "secondary": [
    "prefillSeconds",
    "expert records/bytes",
    "sampled physical footprint",
    "allocator peaks"
  ],
  "pilot_useful_benefit": 0.1,
  "required_clean_pairs": 3,
  "candidate_sampled_physical_ceiling_gb": 12,
  "invalid_pair_rules": [
    "either cell failed/incomplete",
    "either cell has any swap counter change",
    "prompt/pool/effective MTP mismatch"
  ],
  "numerical": "exact output IDs required; full scope state/logits/routing checked separately; no refreshed goldens",
  "claim_limit": "advance to fixed-total-memory confirmation only; no production adoption from this pilot; file cache uncontrolled; per-process expert/prefix caches cold"
}
```

## .build/optimization/scope-lifecycle-v2/manifest.json

SHA-256: `d61884201b2076e5100b40f28e9f1db8e36ac02396e027cbef85f0817258ccbc`

```json
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "73a2973e970d141882cf6d5045bc8d768526f50f584e3d44204415e9b44a16df",
      "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "e39aca578ca19edb858d4a0f221993c2d4ee7008a62a4bb1afba50e84d8f21f0",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "a5c27a555cdf4d99567a5906a299f80883ba1f6d00c29593ac8c0e6077af945a",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "ef479d8e6486110bf826292102272e8ab6c8ce5b8d1873f7dd7419e9483a8e20",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "ec4554a1b76cb99919e9ac3700ddcc561bef6dba639c9efab3eccc2aad48dc17",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "2356bd52ca9688c1228a19ad971f6e3e388bc150401b4dabea5a9f66cac5cb06",
    "binary_sha256": "1032fe228a2750bd0a5197db2af21e309f0b18388c2a210cce423a16c5c70b6e",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-lifecycle",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 26359300096,
    "swapins": 41653660,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   274297.\nPages active:                                1068952.\nPages inactive:                               864110.\nPages speculative:                            223683.\nPages throttled:                                   0.\nPages wired down:                             254507.\nPages purgeable:                               18445.\n\"Translation faults\":                    13646819895.\nPages copy-on-write:                       621098475.\nPages zero filled:                       13507550327.\nPages reactivated:                        2022528941.\nPages purged:                               59835466.\nFile-backed pages:                           1316102.\nAnonymous pages:                              840643.\nPages stored in compressor:                  1393305.\nPages occupied by compressor:                 398795.\nDecompressions:                            940685892.\nCompressions:                             1231880689.\nPageins:                                  5569032400.\nPageouts:                                   10600159.\nSwapins:                                    41653660.\nSwapouts:                                   69884827.\nPages tagged:                                 176968.\nPages tagged resident:                        133927.\nPages tagged compressed:                       43041.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6987.\nPages tag-storage free:                         1207.\nPages tag-storage non-tag pageable:            90102.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6925888.\nTagged compressions:                         9081186.\nTagged decompressions:                       8344852.\n"
  },
  "exit_code": 0,
  "assertions": 593,
  "duration_seconds": 54.690521833,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28171206656,
    "swapins": 41653668,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   462380.\nPages active:                                 958325.\nPages inactive:                               789618.\nPages speculative:                            168194.\nPages throttled:                                   0.\nPages wired down:                             249903.\nPages purgeable:                               14568.\n\"Translation faults\":                    13647343516.\nPages copy-on-write:                       621112641.\nPages zero filled:                       13553871366.\nPages reactivated:                        2023476931.\nPages purged:                               59858722.\nFile-backed pages:                           1242486.\nAnonymous pages:                              673651.\nPages stored in compressor:                  1525732.\nPages occupied by compressor:                 455433.\nDecompressions:                            940774952.\nCompressions:                             1232105845.\nPageins:                                  5569508019.\nPageouts:                                   10600435.\nSwapins:                                    41653668.\nSwapouts:                                   69884827.\nPages tagged:                                 175255.\nPages tagged resident:                        128985.\nPages tagged compressed:                       46270.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6987.\nPages tag-storage free:                         1737.\nPages tag-storage non-tag pageable:            89572.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7568832.\nTagged compressions:                         9085038.\nTagged decompressions:                       8345059.\n"
  }
}
```

## .build/optimization/scope-lifecycle-v2/stdout.txt

SHA-256: `d41d9814a6c9eaa7b34ffd9324d81879051c168532913bff601e9c5d3290b7b8`

```text
{
  "items" : [
    {
      "name" : "layer 0: cancel emits no token",
      "passed" : true
    },
    {
      "name" : "layer 0: abort counted",
      "passed" : true
    },
    {
      "name" : "layer 0: no partial commit",
      "passed" : true
    },
    {
      "name" : "layer 0: no completed passes",
      "passed" : true
    },
    {
      "name" : "layer 0: cache limit restored",
      "passed" : true
    },
    {
      "name" : "layer 0: admission restored",
      "passed" : true
    },
    {
      "name" : "layer 0: exact committed prefix",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: fields",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.0",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.1",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.10",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.12",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.13",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.14",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.16",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.17",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.18",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.2",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.20",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.21",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.22",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.24",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.25",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.26",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.28",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.29",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.30",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.32",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.33",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.34",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.36",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.37",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.38",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.4",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.40",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.41",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.42",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.44",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.45",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.46",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.5",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.6",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.8",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.9",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.11",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.15",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.19",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.23",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.27",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.3",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.31",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.35",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.39",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.43",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.47",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.7",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.11",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.15",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.19",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.23",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.27",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.3",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.31",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.35",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.39",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.43",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.47",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.7",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ngram",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ple.1",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.0",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.1",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.10",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.12",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.13",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.14",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.16",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.17",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.18",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.2",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.20",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.21",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.22",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.24",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.25",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.26",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.28",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.29",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.30",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.32",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.33",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.34",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.36",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.37",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.38",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.4",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.40",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.41",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.42",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.44",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.45",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.46",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.5",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.6",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.8",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.9",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: tokens",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.11",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.15",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.19",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.23",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.27",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.3",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.31",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.35",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.39",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.43",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.47",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.7",
      "passed" : true
    },
    {
      "name" : "layer 1: cancel emits no token",
      "passed" : true
    },
    {
      "name" : "layer 1: abort counted",
      "passed" : true
    },
    {
      "name" : "layer 1: no partial commit",
      "passed" : true
    },
    {
      "name" : "layer 1: no completed passes",
      "passed" : true
    },
    {
      "name" : "layer 1: cache limit restored",
      "passed" : true
    },
    {
      "name" : "layer 1: admission restored",
      "passed" : true
    },
    {
      "name" : "layer 1: exact committed prefix",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: fields",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.0",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.1",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.10",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.12",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.13",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.14",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.16",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.17",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.18",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.2",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.20",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.21",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.22",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.24",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.25",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.26",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.28",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.29",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.30",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.32",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.33",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.34",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.36",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.37",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.38",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.4",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.40",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.41",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.42",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.44",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.45",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.46",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.5",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.6",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.8",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.9",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.11",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.15",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.19",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.23",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.27",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.3",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.31",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.35",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.39",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.43",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.47",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.7",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.11",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.15",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.19",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.23",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.27",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.3",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.31",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.35",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.39",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.43",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.47",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.7",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ngram",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ple.1",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.0",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.1",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.10",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.12",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.13",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.14",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.16",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.17",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.18",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.2",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.20",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.21",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.22",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.24",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.25",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.26",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.28",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.29",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.30",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.32",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.33",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.34",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.36",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.37",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.38",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.4",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.40",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.41",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.42",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.44",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.45",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.46",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.5",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.6",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.8",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.9",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: tokens",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.11",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.15",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.19",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.23",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.27",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.3",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.31",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.35",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.39",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.43",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.47",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.7",
      "passed" : true
    },
    {
      "name" : "layer 3: cancel emits no token",
      "passed" : true
    },
    {
      "name" : "layer 3: abort counted",
      "passed" : true
    },
    {
      "name" : "layer 3: no partial commit",
      "passed" : true
    },
    {
      "name" : "layer 3: no completed passes",
      "passed" : true
    },
    {
      "name" : "layer 3: cache limit restored",
      "passed" : true
    },
    {
      "name" : "layer 3: admission restored",
      "passed" : true
    },
    {
      "name" : "layer 3: exact committed prefix",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: fields",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.0",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.1",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.10",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.12",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.13",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.14",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.16",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.17",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.18",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.2",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.20",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.21",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.22",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.24",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.25",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.26",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.28",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.29",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.30",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.32",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.33",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.34",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.36",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.37",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.38",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.4",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.40",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.41",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.42",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.44",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.45",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.46",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.5",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.6",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.8",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.9",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.11",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.15",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.19",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.23",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.27",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.3",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.31",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.35",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.39",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.43",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.47",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.7",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.11",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.15",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.19",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.23",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.27",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.3",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.31",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.35",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.39",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.43",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.47",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.7",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ngram",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ple.1",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.0",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.1",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.10",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.12",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.13",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.14",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.16",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.17",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.18",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.2",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.20",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.21",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.22",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.24",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.25",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.26",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.28",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.29",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.30",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.32",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.33",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.34",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.36",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.37",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.38",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.4",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.40",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.41",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.42",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.44",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.45",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.46",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.5",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.6",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.8",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.9",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: tokens",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.11",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.15",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.19",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.23",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.27",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.3",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.31",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.35",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.39",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.43",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.47",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.7",
      "passed" : true
    },
    {
      "name" : "layer 47: cancel emits no token",
      "passed" : true
    },
    {
      "name" : "layer 47: abort counted",
      "passed" : true
    },
    {
      "name" : "layer 47: no partial commit",
      "passed" : true
    },
    {
      "name" : "layer 47: no completed passes",
      "passed" : true
    },
    {
      "name" : "layer 47: cache limit restored",
      "passed" : true
    },
    {
      "name" : "layer 47: admission restored",
      "passed" : true
    },
    {
      "name" : "layer 47: exact committed prefix",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: fields",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.0",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.1",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.10",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.12",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.13",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.14",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.16",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.17",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.18",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.2",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.20",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.21",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.22",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.24",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.25",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.26",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.28",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.29",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.30",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.32",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.33",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.34",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.36",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.37",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.38",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.4",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.40",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.41",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.42",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.44",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.45",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.46",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.5",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.6",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.8",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.9",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.11",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.15",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.19",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.23",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.27",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.3",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.31",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.35",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.39",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.43",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.47",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.7",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.11",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.15",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.19",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.23",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.27",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.3",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.31",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.35",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.39",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.43",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.47",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.7",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ngram",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ple.1",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.0",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.1",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.10",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.12",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.13",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.14",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.16",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.17",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.18",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.2",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.20",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.21",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.22",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.24",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.25",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.26",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.28",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.29",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.30",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.32",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.33",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.34",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.36",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.37",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.38",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.4",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.40",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.41",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.42",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.44",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.45",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.46",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.5",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.6",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.8",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.9",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: tokens",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.11",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.15",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.19",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.23",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.27",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.3",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.31",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.35",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.39",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.43",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.47",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.7",
      "passed" : true
    },
    {
      "name" : "retry exact output",
      "passed" : true
    },
    {
      "name" : "reference compute schedule",
      "passed" : true
    },
    {
      "name" : "candidate preserves compute schedule",
      "passed" : true
    },
    {
      "name" : "candidate commits one read scope",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: fields",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.0",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.1",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.10",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.12",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.13",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.14",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.16",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.17",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.18",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.2",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.20",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.21",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.22",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.24",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.25",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.26",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.28",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.29",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.30",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.32",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.33",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.34",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.36",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.37",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.38",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.4",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.40",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.41",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.42",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.44",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.45",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.46",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.5",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.6",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.8",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.9",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.11",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.15",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.19",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.23",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.27",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.3",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.31",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.35",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.39",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.43",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.47",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.7",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.11",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.15",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.19",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.23",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.27",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.3",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.31",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.35",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.39",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.43",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.47",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.7",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ngram",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ple.1",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.0",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.1",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.10",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.12",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.13",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.14",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.16",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.17",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.18",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.2",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.20",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.21",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.22",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.24",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.25",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.26",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.28",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.29",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.30",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.32",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.33",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.34",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.36",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.37",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.38",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.4",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.40",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.41",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.42",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.44",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.45",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.46",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.5",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.6",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.8",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.9",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: tokens",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.11",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.15",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.19",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.23",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.27",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.3",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.31",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.35",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.39",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.43",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.47",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.7",
      "passed" : true
    },
    {
      "name" : "capacity remains charged after abort and growth",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-scope-lifecycle",
  "passed" : true
}
```

## .build/optimization/scope-lifecycle-v2/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/scope-mtp-vision-v2/manifest.json

SHA-256: `59e0dd0e2ec3a56bc534ff8c4c65f187509e4c74cc4b95ce2e9178d4af7cac68`

```json
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "73a2973e970d141882cf6d5045bc8d768526f50f584e3d44204415e9b44a16df",
      "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "e39aca578ca19edb858d4a0f221993c2d4ee7008a62a4bb1afba50e84d8f21f0",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "a5c27a555cdf4d99567a5906a299f80883ba1f6d00c29593ac8c0e6077af945a",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "ef479d8e6486110bf826292102272e8ab6c8ce5b8d1873f7dd7419e9483a8e20",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "ec4554a1b76cb99919e9ac3700ddcc561bef6dba639c9efab3eccc2aad48dc17",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "2356bd52ca9688c1228a19ad971f6e3e388bc150401b4dabea5a9f66cac5cb06",
    "binary_sha256": "1032fe228a2750bd0a5197db2af21e309f0b18388c2a210cce423a16c5c70b6e",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-mtp-vision",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28193275904,
    "swapins": 41653668,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   466123.\nPages active:                                 956296.\nPages inactive:                               788464.\nPages speculative:                            168336.\nPages throttled:                                   0.\nPages wired down:                             249903.\nPages purgeable:                               12008.\n\"Translation faults\":                    13647348379.\nPages copy-on-write:                       621113082.\nPages zero filled:                       13553873643.\nPages reactivated:                        2023476931.\nPages purged:                               59858722.\nFile-backed pages:                           1242650.\nAnonymous pages:                              670446.\nPages stored in compressor:                  1525335.\nPages occupied by compressor:                 455211.\nDecompressions:                            940775130.\nCompressions:                             1232105845.\nPageins:                                  5569508072.\nPageouts:                                   10600435.\nSwapins:                                    41653668.\nSwapouts:                                   69884827.\nPages tagged:                                 175250.\nPages tagged resident:                        128981.\nPages tagged compressed:                       46269.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6987.\nPages tag-storage free:                         1199.\nPages tag-storage non-tag pageable:            90110.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7568320.\nTagged compressions:                         9085038.\nTagged decompressions:                       8345060.\n"
  },
  "exit_code": 0,
  "assertions": 240,
  "duration_seconds": 42.141537667,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29780934656,
    "swapins": 41653668,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   501935.\nPages active:                                 890554.\nPages inactive:                               747512.\nPages speculative:                            141876.\nPages throttled:                                   0.\nPages wired down:                             262826.\nPages purgeable:                                  23.\n\"Translation faults\":                    13647893036.\nPages copy-on-write:                       621131568.\nPages zero filled:                       13593453004.\nPages reactivated:                        2023943516.\nPages purged:                               59872656.\nFile-backed pages:                           1315726.\nAnonymous pages:                              464216.\nPages stored in compressor:                  1701649.\nPages occupied by compressor:                 539155.\nDecompressions:                            940869831.\nCompressions:                             1232470880.\nPageins:                                  5569947916.\nPageouts:                                   10600596.\nSwapins:                                    41653668.\nSwapouts:                                   69884827.\nPages tagged:                                 174884.\nPages tagged resident:                        123037.\nPages tagged compressed:                       51847.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6984.\nPages tag-storage free:                         1914.\nPages tag-storage non-tag pageable:            89398.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8581824.\nTagged compressions:                         9091410.\nTagged decompressions:                       8345853.\n"
  }
}
```

## .build/optimization/scope-mtp-vision-v2/stdout.txt

SHA-256: `bdfbe7ac355563eeac17cb9def34537abeedbee5f647d6a3899073caf3242f35`

```text
{
  "items" : [
    {
      "name" : "cancel during second draft-head tile",
      "passed" : true
    },
    {
      "name" : "cancel returns no logits",
      "passed" : true
    },
    {
      "name" : "cancel restores valid draft prefix",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: fields",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.0",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.10",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.12",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.13",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.14",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.16",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.17",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.18",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.2",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.20",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.21",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.22",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.24",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.25",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.26",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.28",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.29",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.30",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.32",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.33",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.34",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.36",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.37",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.38",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.4",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.40",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.41",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.42",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.44",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.45",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.46",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.5",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.6",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.8",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.9",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.7",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.7",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: lastMulti",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: mtp.index",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: mtp.key",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: mtp.offset",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: mtp.value",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ngram",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ple.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.0",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.10",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.12",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.13",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.14",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.16",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.17",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.18",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.2",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.20",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.21",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.22",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.24",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.25",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.26",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.28",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.29",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.30",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.32",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.33",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.34",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.36",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.37",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.38",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.4",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.40",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.41",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.42",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.44",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.45",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.46",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.5",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.6",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.8",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.9",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: tokens",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.7",
      "passed" : true
    },
    {
      "name" : "retry commits scope",
      "passed" : true
    },
    {
      "name" : "retry draft aligned",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: fields",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.0",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.10",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.12",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.13",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.14",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.16",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.17",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.18",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.2",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.20",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.21",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.22",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.24",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.25",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.26",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.28",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.29",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.30",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.32",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.33",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.34",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.36",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.37",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.38",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.4",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.40",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.41",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.42",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.44",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.45",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.46",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.5",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.6",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.8",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.9",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.7",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.7",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: lastMulti",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: mtp.index",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: mtp.key",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: mtp.offset",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: mtp.value",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ngram",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ple.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.0",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.10",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.12",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.13",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.14",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.16",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.17",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.18",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.2",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.20",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.21",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.22",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.24",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.25",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.26",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.28",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.29",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.30",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.32",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.33",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.34",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.36",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.37",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.38",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.4",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.40",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.41",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.42",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.44",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.45",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.46",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.5",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.6",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.8",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.9",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: tokens",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.7",
      "passed" : true
    },
    {
      "name" : "next target logits exact",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-scope-mtp-vision",
  "passed" : true
}
```

## .build/optimization/scope-mtp-vision-v2/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/mtp-work-v2/manifest.json

SHA-256: `69acb2656d6f5662f40b576b98b59e1a35ad48960d65b8ca8bf7f4529fc65b63`

```json
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "73a2973e970d141882cf6d5045bc8d768526f50f584e3d44204415e9b44a16df",
      "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "e39aca578ca19edb858d4a0f221993c2d4ee7008a62a4bb1afba50e84d8f21f0",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "a5c27a555cdf4d99567a5906a299f80883ba1f6d00c29593ac8c0e6077af945a",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "ef479d8e6486110bf826292102272e8ab6c8ce5b8d1873f7dd7419e9483a8e20",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "ec4554a1b76cb99919e9ac3700ddcc561bef6dba639c9efab3eccc2aad48dc17",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "2356bd52ca9688c1228a19ad971f6e3e388bc150401b4dabea5a9f66cac5cb06",
    "binary_sha256": "1032fe228a2750bd0a5197db2af21e309f0b18388c2a210cce423a16c5c70b6e",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream",
    "optimization-state-check",
    "--variant",
    "mtp-work",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29783457792,
    "swapins": 41653668,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   501910.\nPages active:                                 890696.\nPages inactive:                               747116.\nPages speculative:                            142267.\nPages throttled:                                   0.\nPages wired down:                             262809.\nPages purgeable:                                  25.\n\"Translation faults\":                    13647897603.\nPages copy-on-write:                       621131958.\nPages zero filled:                       13593455258.\nPages reactivated:                        2023943516.\nPages purged:                               59872656.\nFile-backed pages:                           1315903.\nAnonymous pages:                              464176.\nPages stored in compressor:                  1701521.\nPages occupied by compressor:                 539109.\nDecompressions:                            940869882.\nCompressions:                             1232470880.\nPageins:                                  5569947985.\nPageouts:                                   10600596.\nSwapins:                                    41653668.\nSwapouts:                                   69884827.\nPages tagged:                                 174880.\nPages tagged resident:                        123033.\nPages tagged compressed:                       51847.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6984.\nPages tag-storage free:                         1640.\nPages tag-storage non-tag pageable:            89672.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8581824.\nTagged compressions:                         9091410.\nTagged decompressions:                       8345853.\n"
  },
  "exit_code": 0,
  "assertions": 112,
  "duration_seconds": 29.648828958,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29670834176,
    "swapins": 41653668,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   454302.\nPages active:                                 932994.\nPages inactive:                               864286.\nPages speculative:                             67577.\nPages throttled:                                   0.\nPages wired down:                             238875.\nPages purgeable:                               16808.\n\"Translation faults\":                    13648566920.\nPages copy-on-write:                       621161308.\nPages zero filled:                       13594604006.\nPages reactivated:                        2023952615.\nPages purged:                               59872747.\nFile-backed pages:                           1339854.\nAnonymous pages:                              525003.\nPages stored in compressor:                  1680778.\nPages occupied by compressor:                 525357.\nDecompressions:                            940890485.\nCompressions:                             1232470880.\nPageins:                                  5570044707.\nPageouts:                                   10600631.\nSwapins:                                    41653668.\nSwapouts:                                   69884827.\nPages tagged:                                 174618.\nPages tagged resident:                        122965.\nPages tagged compressed:                       51653.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6983.\nPages tag-storage free:                         2216.\nPages tag-storage non-tag pageable:            89097.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8538752.\nTagged compressions:                         9091410.\nTagged decompressions:                       8346047.\n"
  }
}
```

## .build/optimization/mtp-work-v2/stdout.txt

SHA-256: `a505d31e9ac24eae561bc4a21aa6622f24ebb0ab5b680b94d648f1debbc732dd`

```text
{
  "items" : [
    {
      "name" : "depth 1, limit 1, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, first: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, tail: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 1, both: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, tail: terminal output needs zero drafts",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, tail: one target position suffices",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, tail: final emission stays pending",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, both: terminal output needs zero drafts",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, both: one target position suffices",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 2, both: final emission stays pending",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, limit 5, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, first: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, tail: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 1, both: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, tail: terminal output needs zero drafts",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, tail: one target position suffices",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, tail: final emission stays pending",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, both: terminal output needs zero drafts",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, both: one target position suffices",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 2, both: final emission stays pending",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, limit 5, both: reconciliation covers committed positions",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-mtp-work",
  "passed" : true
}
```

## .build/optimization/mtp-work-v2/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/scope-generation-pilot-v2/manifest.json

SHA-256: `32e99efe446d8ca2a2335dff42a656a83a5c5e7ac43d28a538e7463bd325aeab`

```json
{
  "schema_version": 1,
  "head": "6e66a367f93e636c3729179e24007aa99c97b9a6",
  "worktree_source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "73a2973e970d141882cf6d5045bc8d768526f50f584e3d44204415e9b44a16df",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "e39aca578ca19edb858d4a0f221993c2d4ee7008a62a4bb1afba50e84d8f21f0",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "a5c27a555cdf4d99567a5906a299f80883ba1f6d00c29593ac8c0e6077af945a",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
    "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "ef479d8e6486110bf826292102272e8ab6c8ce5b8d1873f7dd7419e9483a8e20",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "ec4554a1b76cb99919e9ac3700ddcc561bef6dba639c9efab3eccc2aad48dc17",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3"
  },
  "build_identities": {
    "reference": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
        "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
        "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "73a2973e970d141882cf6d5045bc8d768526f50f584e3d44204415e9b44a16df",
        "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "e39aca578ca19edb858d4a0f221993c2d4ee7008a62a4bb1afba50e84d8f21f0",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "a5c27a555cdf4d99567a5906a299f80883ba1f6d00c29593ac8c0e6077af945a",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
        "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
        "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "ef479d8e6486110bf826292102272e8ab6c8ce5b8d1873f7dd7419e9483a8e20",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "ec4554a1b76cb99919e9ac3700ddcc561bef6dba639c9efab3eccc2aad48dc17",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "2356bd52ca9688c1228a19ad971f6e3e388bc150401b4dabea5a9f66cac5cb06",
      "binary_sha256": "1032fe228a2750bd0a5197db2af21e309f0b18388c2a210cce423a16c5c70b6e",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    },
    "scope": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
        "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
        "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "73a2973e970d141882cf6d5045bc8d768526f50f584e3d44204415e9b44a16df",
        "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "e39aca578ca19edb858d4a0f221993c2d4ee7008a62a4bb1afba50e84d8f21f0",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "a5c27a555cdf4d99567a5906a299f80883ba1f6d00c29593ac8c0e6077af945a",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
        "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
        "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "ef479d8e6486110bf826292102272e8ab6c8ce5b8d1873f7dd7419e9483a8e20",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "ec4554a1b76cb99919e9ac3700ddcc561bef6dba639c9efab3eccc2aad48dc17",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "2356bd52ca9688c1228a19ad971f6e3e388bc150401b4dabea5a9f66cac5cb06",
      "binary_sha256": "1032fe228a2750bd0a5197db2af21e309f0b18388c2a210cce423a16c5c70b6e",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "model": {
    "chat_template.jinja": {
      "bytes": 8952,
      "mtime_ns": 1788227262420608630,
      "sha256": "c3cf9e34abf4f9e36c2d72165aa9c132d3e2a725b6c2586aaa3a8af9d7a81041"
    },
    "config.json": {
      "bytes": 33408,
      "mtime_ns": 1788227262365742673,
      "sha256": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5"
    },
    "generation_config.json": {
      "bytes": 202,
      "mtime_ns": 1788227262233341994,
      "sha256": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e"
    },
    "model-00001.safetensors": {
      "bytes": 10039592993,
      "mtime_ns": 1788228748798695327,
      "header_sha256": "475ce8af9dea80570da09375a5e1039090610ae77373bffcb8d95bb0be3a9ddc"
    },
    "model-00002.safetensors": {
      "bytes": 10000066971,
      "mtime_ns": 1788229557877052892,
      "header_sha256": "430d68993347bf804c7ccc0a09b4811d503377fc9af4f524b0db0884790a12bf"
    },
    "model-00003.safetensors": {
      "bytes": 10000066984,
      "mtime_ns": 1788229795251654179,
      "header_sha256": "28b4f8f5a8606a84f5dd5de3c061130a6a65e767edb86355ae35859a525426d6"
    },
    "model-00004.safetensors": {
      "bytes": 10170248438,
      "mtime_ns": 1788230029083645564,
      "header_sha256": "c9df41567d842f9fbdf9ff53a3584ffacb1b220b43e9c9b49c0be96be6f2156d"
    },
    "model-00005.safetensors": {
      "bytes": 10194989755,
      "mtime_ns": 1788230267432612830,
      "header_sha256": "c189a7de6a617e0a0f7d3e60576b363ae0d8c240e277d8726a4ab467b30e596c"
    },
    "model-00006.safetensors": {
      "bytes": 10262727991,
      "mtime_ns": 1788230565482789975,
      "header_sha256": "b51ae1ca1c4c754dae0426f85c0f3e6c1539240bce1ae77fba8102cb08ebb977"
    },
    "model-00007.safetensors": {
      "bytes": 10190937668,
      "mtime_ns": 1788230945388951904,
      "header_sha256": "b64d4e3ba45e61f2463c6357bdca894926f19db595d4e9dd189b04822a9c611d"
    },
    "model-00008.safetensors": {
      "bytes": 10231122683,
      "mtime_ns": 1788231233782376452,
      "header_sha256": "ab49328405f98104ffab180748eba510fc6f31ba2bfa263a1d23e8b59ce261c9"
    },
    "model-00009.safetensors": {
      "bytes": 10250305804,
      "mtime_ns": 1788231584813847653,
      "header_sha256": "326333ed9d0b8df41fb3ecca875d5b7eecb29f36d674f5edf8c969bb3e71e75d"
    },
    "model-00010.safetensors": {
      "bytes": 10237786674,
      "mtime_ns": 1788231912822219158,
      "header_sha256": "962f992ebc7098380e89df4e6abd0dd5921a1702dc612eebee9d70bcc3035f37"
    },
    "model-00011.safetensors": {
      "bytes": 2192353120,
      "mtime_ns": 1788231963854477586,
      "header_sha256": "db46770964a73082aeb4e714c0b6b4da30646146f3330a5b40d26cfd4f12a608"
    },
    "model.safetensors.index.json": {
      "bytes": 317973,
      "mtime_ns": 1788231961214440193,
      "sha256": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d"
    },
    "mtp.provenance.json": {
      "bytes": 4514,
      "mtime_ns": 1788285565619137302,
      "sha256": "6e574308bd68dcf6611e84c312ba388f7eb205e0e09dff086e14f6df86262db6"
    },
    "mtp.safetensors": {
      "bytes": 1470955171,
      "mtime_ns": 1788285565030586634,
      "header_sha256": "836ae4156c99452e932c7a81322bcca959ac6f7ed86d6270cfd56ff94c62f4b9"
    },
    "preprocessor_config.json": {
      "bytes": 390,
      "mtime_ns": 1788231961438795679,
      "sha256": "27225450ac9c6529872ee1924fcb0962ff5634834f817040f444118116f4e516"
    },
    "tokenizer.json": {
      "bytes": 12809320,
      "mtime_ns": 1788231963144872066,
      "sha256": "0997f410c57a1f4e53b09e4be8f4a172d90edd9564368fb0847030937229b9f3"
    },
    "tokenizer_config.json": {
      "bytes": 17928,
      "mtime_ns": 1788231962481057833,
      "sha256": "b11349aafa7cdc6a320767cf7ceb29ed82f7eda5d65e8e0819e76f0ce947bf27"
    },
    "video_preprocessor_config.json": {
      "bytes": 385,
      "mtime_ns": 1788231962565955466,
      "sha256": "7768af27c1fafa9cc9011c1dc20067e03f8915e03b63504550e11d5066986d13"
    },
    "vocab.json": {
      "bytes": 6722759,
      "mtime_ns": 1788231962924355528,
      "sha256": "ce99b4cb2983d118806ce0a8b777a35b093e2000a503ebde25853284c9dfa003"
    }
  },
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream",
      "sha256": "1032fe228a2750bd0a5197db2af21e309f0b18388c2a210cce423a16c5c70b6e",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
      }
    },
    "scope": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream",
      "sha256": "1032fe228a2750bd0a5197db2af21e309f0b18388c2a210cce423a16c5c70b6e",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1",
        "SLOTSTREAM_OPT_READ_SCOPE": "8192"
      }
    }
  },
  "fixtures": {
    "acceptance": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/fixtures/acceptance.txt",
      "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78"
    }
  },
  "conditions": {
    "filesystem_cache": "uncontrolled; no purge",
    "expert_cache": "empty per process",
    "prefix_cache": "empty per process",
    "mtp": false
  },
  "arguments": {
    "arm": [
      "reference=/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream",
      "scope=/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream"
    ],
    "arm_env": [
      "reference={\"SLOTSTREAM_OPT_COMPACT_STATE\": \"1\", \"SLOTSTREAM_OPT_COMPACT_MTP\": \"1\", \"SLOTSTREAM_OPT_INDEXER_TILES\": \"1\", \"SLOTSTREAM_OPT_PLE_TILES\": \"1\", \"SLOTSTREAM_OPT_FINAL_FORWARD\": \"1\"}",
      "scope={\"SLOTSTREAM_OPT_COMPACT_STATE\": \"1\", \"SLOTSTREAM_OPT_COMPACT_MTP\": \"1\", \"SLOTSTREAM_OPT_INDEXER_TILES\": \"1\", \"SLOTSTREAM_OPT_PLE_TILES\": \"1\", \"SLOTSTREAM_OPT_FINAL_FORWARD\": \"1\", \"SLOTSTREAM_OPT_LAYER_WORKSPACE\": \"1\", \"SLOTSTREAM_OPT_READ_SCOPE\": \"8192\"}"
    ],
    "label": "baseline",
    "mtp": "off",
    "rounds": 3,
    "chunks": "4096",
    "prompts": "acceptance",
    "memory_gb": 8.1,
    "max_tokens": 1,
    "seed": 7,
    "sampled": false,
    "sample_footprint": true,
    "observe_arm": [],
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "out": "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2",
    "timeout": 600,
    "prepare_only": false
  }
}
```

## .build/optimization/scope-generation-pilot-v2/results.jsonl

SHA-256: `6cb2023a6dd91a2cb1e2d47405765770365a32b17b50608ce270f64fed2cc366`

```json
{"round": 1, "prompt": "acceptance", "chunk": 4096, "arm": "reference", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/1-acceptance-4096-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 4.992, "before": {"page_bytes": 16384, "reclaimable_bytes": 29217062912, "swapins": 41653668, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   440667.\nPages active:                                 933837.\nPages inactive:                               853808.\nPages speculative:                             79551.\nPages throttled:                                   0.\nPages wired down:                             262696.\nPages purgeable:                                 485.\n\"Translation faults\":                    13648692720.\nPages copy-on-write:                       621175001.\nPages zero filled:                       13594676137.\nPages reactivated:                        2023952785.\nPages purged:                               59873131.\nFile-backed pages:                           1342116.\nAnonymous pages:                              525080.\nPages stored in compressor:                  1655445.\nPages occupied by compressor:                 514212.\nDecompressions:                            940915651.\nCompressions:                             1232470880.\nPageins:                                  5570046307.\nPageouts:                                   10600631.\nSwapins:                                    41653668.\nSwapouts:                                   69884827.\nPages tagged:                                 174643.\nPages tagged resident:                        123806.\nPages tagged compressed:                       50837.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6983.\nPages tag-storage free:                          740.\nPages tag-storage non-tag pageable:            90573.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8358016.\nTagged compressions:                         9091410.\nTagged decompressions:                       8346863.\n"}, "exit_code": 0, "wall_seconds": 25.352517917, "after": {"page_bytes": 16384, "reclaimable_bytes": 30545838080, "swapins": 41653672, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   418616.\nPages active:                                 883868.\nPages inactive:                               700460.\nPages speculative:                            182059.\nPages throttled:                                   0.\nPages wired down:                             264935.\nPages purgeable:                                4037.\n\"Translation faults\":                    13649083750.\nPages copy-on-write:                       621184275.\nPages zero filled:                       13617128816.\nPages reactivated:                        2026937406.\nPages purged:                               59886517.\nFile-backed pages:                           1441717.\nAnonymous pages:                              324670.\nPages stored in compressor:                  1856121.\nPages occupied by compressor:                 634450.\nDecompressions:                            941212935.\nCompressions:                             1232975451.\nPageins:                                  5572839255.\nPageouts:                                   10600795.\nSwapins:                                    41653672.\nSwapouts:                                   69884827.\nPages tagged:                                 173745.\nPages tagged resident:                        118943.\nPages tagged compressed:                       54802.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6979.\nPages tag-storage free:                         1226.\nPages tag-storage non-tag pageable:            90091.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9142656.\nTagged compressions:                         9096790.\nTagged decompressions:                       8347601.\n"}, "metrics": {"effective_expected_peak_gb": 12.913999103999998, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.028131375, "experimental_memory_family": false, "extra_expert_workspace_gb": 0, "extra_read_scope_allowance_gb": 0, "launch_seconds": 25.223645042, "load_seconds": 0.736760125, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 30.5, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001038916, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 4.1e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3489955840, "mlxActiveEndBytes": 5046896792, "mlxCacheEndBytes": 611651596, "mlxPeakMemoryGB": 6.653669132, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.360682336, "physicalFootprintEndBytes": 6360682336, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 0.741630622, "prefillIOSeconds": 9.402255773544312, "prefillMLXActiveBytes": 5046896792, "prefillMLXCacheBytes": 610652172, "prefillPasses": [4096, 2048, 1817], "prefillPhysicalFootprintBytes": 6368989024, "prefillReadBytes": 124465766400, "prefillRecords": 45018, "prefillRowSortSeconds": 0.014362335205078125, "prefillScatterSeconds": 0.18165528774261475, "prefillSeconds": 24.457123125, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 2.5e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 24.458471958, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 7522717488, "samples": 1224}, "sampleSeconds": 0.001031209, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 1, "prompt": "acceptance", "chunk": 4096, "arm": "scope", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/1-acceptance-4096-scope/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1", "SLOTSTREAM_OPT_READ_SCOPE": "8192", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 12.4368, "before": {"page_bytes": 16384, "reclaimable_bytes": 30546509824, "swapins": 41653672, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   418648.\nPages active:                                 883977.\nPages inactive:                               700515.\nPages speculative:                            182119.\nPages throttled:                                   0.\nPages wired down:                             264940.\nPages purgeable:                                4035.\n\"Translation faults\":                    13649084590.\nPages copy-on-write:                       621184415.\nPages zero filled:                       13617128959.\nPages reactivated:                        2026937406.\nPages purged:                               59886517.\nFile-backed pages:                           1441728.\nAnonymous pages:                              324883.\nPages stored in compressor:                  1855976.\nPages occupied by compressor:                 634380.\nDecompressions:                            941213088.\nCompressions:                             1232975451.\nPageins:                                  5572839256.\nPageouts:                                   10600795.\nSwapins:                                    41653672.\nSwapouts:                                   69884827.\nPages tagged:                                 173745.\nPages tagged resident:                        118943.\nPages tagged compressed:                       54802.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6979.\nPages tag-storage free:                         1077.\nPages tag-storage non-tag pageable:            90240.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9142656.\nTagged compressions:                         9096790.\nTagged decompressions:                       8347601.\n"}, "exit_code": 0, "wall_seconds": 30.581727124999997, "after": {"page_bytes": 16384, "reclaimable_bytes": 30998446080, "swapins": 41653672, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   493317.\nPages active:                                 846415.\nPages inactive:                               636501.\nPages speculative:                            207966.\nPages throttled:                                   0.\nPages wired down:                             250018.\nPages purgeable:                                3433.\n\"Translation faults\":                    13649475167.\nPages copy-on-write:                       621199609.\nPages zero filled:                       13635905337.\nPages reactivated:                        2028782475.\nPages purged:                               59887957.\nFile-backed pages:                           1395245.\nAnonymous pages:                              295637.\nPages stored in compressor:                  1885956.\nPages occupied by compressor:                 649555.\nDecompressions:                            941246918.\nCompressions:                             1233040791.\nPageins:                                  5574719082.\nPageouts:                                   10600944.\nSwapins:                                    41653672.\nSwapouts:                                   69884827.\nPages tagged:                                 172123.\nPages tagged resident:                        116644.\nPages tagged compressed:                       55479.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6968.\nPages tag-storage free:                         1409.\nPages tag-storage non-tag pageable:            89919.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9320704.\nTagged compressions:                         9098252.\nTagged decompressions:                       8348375.\n"}, "metrics": {"effective_expected_peak_gb": 19.767622912, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.0278675, "experimental_memory_family": true, "extra_expert_workspace_gb": 1.4155776, "extra_read_scope_allowance_gb": 5.438046207999999, "launch_seconds": 30.477104292, "load_seconds": 0.755432083, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": true, "readScopeTokens": 8192, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 33.5, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001010208, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3307651072, "mlxActiveEndBytes": 5046847640, "mlxCacheEndBytes": 548067140, "mlxPeakMemoryGB": 7.09873166, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.162271952, "physicalFootprintEndBytes": 6162271952, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 4.253538131713867, "prefillMLXActiveBytes": 5046847640, "prefillMLXCacheBytes": 547067712, "prefillPasses": [7961], "prefillPhysicalFootprintBytes": 6211325648, "prefillReadBytes": 51848294400, "prefillRecords": 18753, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 1.3332504801210934, "prefillSeconds": 29.692303958, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 3.33e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 29.6935615, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 7996706512, "samples": 1486}, "sampleSeconds": 0.001008625, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}}
{"round": 2, "prompt": "acceptance", "chunk": 4096, "arm": "scope", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/2-acceptance-4096-scope/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1", "SLOTSTREAM_OPT_READ_SCOPE": "8192", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 12.4368, "before": {"page_bytes": 16384, "reclaimable_bytes": 31000231936, "swapins": 41653672, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   493417.\nPages active:                                 846435.\nPages inactive:                               636461.\nPages speculative:                            208006.\nPages throttled:                                   0.\nPages wired down:                             250020.\nPages purgeable:                                3431.\n\"Translation faults\":                    13649475862.\nPages copy-on-write:                       621199748.\nPages zero filled:                       13635905420.\nPages reactivated:                        2028782475.\nPages purged:                               59887957.\nFile-backed pages:                           1395256.\nAnonymous pages:                              295646.\nPages stored in compressor:                  1885943.\nPages occupied by compressor:                 649548.\nDecompressions:                            941246937.\nCompressions:                             1233040791.\nPageins:                                  5574719083.\nPageouts:                                   10600944.\nSwapins:                                    41653672.\nSwapouts:                                   69884827.\nPages tagged:                                 172123.\nPages tagged resident:                        116644.\nPages tagged compressed:                       55479.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6968.\nPages tag-storage free:                         1483.\nPages tag-storage non-tag pageable:            89845.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9320704.\nTagged compressions:                         9098252.\nTagged decompressions:                       8348375.\n"}, "exit_code": 0, "wall_seconds": 31.692475834000007, "after": {"page_bytes": 16384, "reclaimable_bytes": 30773133312, "swapins": 41653672, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   496657.\nPages active:                                 848906.\nPages inactive:                               650903.\nPages speculative:                            196018.\nPages throttled:                                   0.\nPages wired down:                             247829.\nPages purgeable:                                6215.\n\"Translation faults\":                    13649846100.\nPages copy-on-write:                       621209256.\nPages zero filled:                       13654787767.\nPages reactivated:                        2030823934.\nPages purged:                               59889106.\nFile-backed pages:                           1375371.\nAnonymous pages:                              320456.\nPages stored in compressor:                  1867523.\nPages occupied by compressor:                 643935.\nDecompressions:                            941285839.\nCompressions:                             1233061967.\nPageins:                                  5576831322.\nPageouts:                                   10601114.\nSwapins:                                    41653672.\nSwapouts:                                   69884827.\nPages tagged:                                 168799.\nPages tagged resident:                        115677.\nPages tagged compressed:                       53122.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6931.\nPages tag-storage free:                         1413.\nPages tag-storage non-tag pageable:            89952.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8780736.\nTagged compressions:                         9098470.\nTagged decompressions:                       8350942.\n"}, "metrics": {"effective_expected_peak_gb": 19.767622912, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.0285805, "experimental_memory_family": true, "extra_expert_workspace_gb": 1.4155776, "extra_read_scope_allowance_gb": 5.438046207999999, "launch_seconds": 31.581605583, "load_seconds": 0.829531833, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": true, "readScopeTokens": 8192, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 34.4, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001002083, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 4.1e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3307831296, "mlxActiveEndBytes": 5046847640, "mlxCacheEndBytes": 556757944, "mlxPeakMemoryGB": 7.09873166, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.212030136, "physicalFootprintEndBytes": 6212030136, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 4.4155192375183105, "prefillMLXActiveBytes": 5046847640, "prefillMLXCacheBytes": 555758516, "prefillPasses": [7961], "prefillPhysicalFootprintBytes": 6230806200, "prefillReadBytes": 51848294400, "prefillRecords": 18753, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 1.3537784058020628, "prefillSeconds": 30.721984625, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 3.75e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 30.723241625, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8031260344, "samples": 1537}, "sampleSeconds": 0.000998791, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}}
{"round": 2, "prompt": "acceptance", "chunk": 4096, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/2-acceptance-4096-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 4.992, "before": {"page_bytes": 16384, "reclaimable_bytes": 30774657024, "swapins": 41653672, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   496738.\nPages active:                                 848874.\nPages inactive:                               650950.\nPages speculative:                            196044.\nPages throttled:                                   0.\nPages wired down:                             247829.\nPages purgeable:                                6215.\n\"Translation faults\":                    13649846807.\nPages copy-on-write:                       621209398.\nPages zero filled:                       13654787878.\nPages reactivated:                        2030823934.\nPages purged:                               59889106.\nFile-backed pages:                           1375383.\nAnonymous pages:                              320485.\nPages stored in compressor:                  1867518.\nPages occupied by compressor:                 643930.\nDecompressions:                            941285850.\nCompressions:                             1233061967.\nPageins:                                  5576831323.\nPageouts:                                   10601114.\nSwapins:                                    41653672.\nSwapouts:                                   69884827.\nPages tagged:                                 168799.\nPages tagged resident:                        115677.\nPages tagged compressed:                       53122.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6931.\nPages tag-storage free:                         1383.\nPages tag-storage non-tag pageable:            89982.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8780736.\nTagged compressions:                         9098470.\nTagged decompressions:                       8350942.\n"}, "exit_code": 0, "wall_seconds": 26.082600959000004, "after": {"page_bytes": 16384, "reclaimable_bytes": 31139135488, "swapins": 41653672, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   411616.\nPages active:                                 868932.\nPages inactive:                               669653.\nPages speculative:                            197407.\nPages throttled:                                   0.\nPages wired down:                             254489.\nPages purgeable:                                 527.\n\"Translation faults\":                    13650193117.\nPages copy-on-write:                       621212247.\nPages zero filled:                       13677125341.\nPages reactivated:                        2033935353.\nPages purged:                               59902602.\nFile-backed pages:                           1488439.\nAnonymous pages:                              247553.\nPages stored in compressor:                  1931191.\nPages occupied by compressor:                 681742.\nDecompressions:                            941392087.\nCompressions:                             1233234986.\nPageins:                                  5579897555.\nPageouts:                                   10601254.\nSwapins:                                    41653672.\nSwapouts:                                   69884827.\nPages tagged:                                 168111.\nPages tagged resident:                        114271.\nPages tagged compressed:                       53840.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6918.\nPages tag-storage free:                         1626.\nPages tag-storage non-tag pageable:            89752.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8921152.\nTagged compressions:                         9100224.\nTagged decompressions:                       8351977.\n"}, "metrics": {"effective_expected_peak_gb": 12.913999103999998, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.028213583, "experimental_memory_family": false, "extra_expert_workspace_gb": 0, "extra_read_scope_allowance_gb": 0, "launch_seconds": 25.944308125, "load_seconds": 0.835857958, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 34, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001169333, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 4.1e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3466182656, "mlxActiveEndBytes": 5046896792, "mlxCacheEndBytes": 603803768, "mlxPeakMemoryGB": 6.657027928, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.331633312, "physicalFootprintEndBytes": 6331633312, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 0.8794590100000014, "prefillIOSeconds": 9.9884272813797, "prefillMLXActiveBytes": 5046896792, "prefillMLXCacheBytes": 602804344, "prefillPasses": [4096, 2048, 1817], "prefillPhysicalFootprintBytes": 6339940000, "prefillReadBytes": 124465766400, "prefillRecords": 45018, "prefillRowSortSeconds": 0.018732547760009766, "prefillScatterSeconds": 0.18506348133087158, "prefillSeconds": 25.078235334, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 5.83e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 25.079824791, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 7507824240, "samples": 1255}, "sampleSeconds": 0.00116575, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}}
{"round": 3, "prompt": "acceptance", "chunk": 4096, "arm": "reference", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/3-acceptance-4096-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 4.992, "before": {"page_bytes": 16384, "reclaimable_bytes": 31139758080, "swapins": 41653672, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   411643.\nPages active:                                 868951.\nPages inactive:                               669622.\nPages speculative:                            197456.\nPages throttled:                                   0.\nPages wired down:                             254489.\nPages purgeable:                                 527.\n\"Translation faults\":                    13650193818.\nPages copy-on-write:                       621212388.\nPages zero filled:                       13677125441.\nPages reactivated:                        2033935353.\nPages purged:                               59902602.\nFile-backed pages:                           1488450.\nAnonymous pages:                              247579.\nPages stored in compressor:                  1931173.\nPages occupied by compressor:                 681731.\nDecompressions:                            941392112.\nCompressions:                             1233234986.\nPageins:                                  5579897556.\nPageouts:                                   10601254.\nSwapins:                                    41653672.\nSwapouts:                                   69884827.\nPages tagged:                                 168111.\nPages tagged resident:                        114271.\nPages tagged compressed:                       53840.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6918.\nPages tag-storage free:                         1654.\nPages tag-storage non-tag pageable:            89724.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8921152.\nTagged compressions:                         9100224.\nTagged decompressions:                       8351977.\n"}, "exit_code": 0, "wall_seconds": 27.789174833000004, "after": {"page_bytes": 16384, "reclaimable_bytes": 30748426240, "swapins": 41653676, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   410366.\nPages active:                                 878553.\nPages inactive:                               681489.\nPages speculative:                            195612.\nPages throttled:                                   0.\nPages wired down:                             255770.\nPages purgeable:                               15861.\n\"Translation faults\":                    13650720105.\nPages copy-on-write:                       621222167.\nPages zero filled:                       13699532157.\nPages reactivated:                        2037688270.\nPages purged:                               59920947.\nFile-backed pages:                           1450508.\nAnonymous pages:                              305146.\nPages stored in compressor:                  1890068.\nPages occupied by compressor:                 661935.\nDecompressions:                            941561573.\nCompressions:                             1233368903.\nPageins:                                  5583257573.\nPageouts:                                   10601384.\nSwapins:                                    41653676.\nSwapouts:                                   69884827.\nPages tagged:                                 167941.\nPages tagged resident:                        112690.\nPages tagged compressed:                       55251.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6915.\nPages tag-storage free:                         2044.\nPages tag-storage non-tag pageable:            89337.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9242880.\nTagged compressions:                         9103043.\nTagged decompressions:                       8353373.\n"}, "metrics": {"effective_expected_peak_gb": 12.913999103999998, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.028285458, "experimental_memory_family": false, "extra_expert_workspace_gb": 0, "extra_read_scope_allowance_gb": 0, "launch_seconds": 27.631694208, "load_seconds": 0.852745125, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 34.4, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001301917, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 4.1e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3473883136, "mlxActiveEndBytes": 5046880408, "mlxCacheEndBytes": 572807712, "mlxPeakMemoryGB": 6.653655932, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.301683408, "physicalFootprintEndBytes": 6301683408, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 0.8734292109999989, "prefillIOSeconds": 10.498804807662964, "prefillMLXActiveBytes": 5046880408, "prefillMLXCacheBytes": 571808288, "prefillPasses": [4096, 2048, 1817], "prefillPhysicalFootprintBytes": 6309990096, "prefillReadBytes": 124465766400, "prefillRecords": 45018, "prefillRowSortSeconds": 0.021233797073364258, "prefillScatterSeconds": 0.20650577545166016, "prefillSeconds": 26.748438792, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 4.17e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 26.750235125, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 7504858808, "samples": 1339}, "sampleSeconds": 0.00129425, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 3, "prompt": "acceptance", "chunk": 4096, "arm": "scope", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-mtp-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v2/3-acceptance-4096-scope/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1", "SLOTSTREAM_OPT_READ_SCOPE": "8192", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 12.4368, "before": {"page_bytes": 16384, "reclaimable_bytes": 30748409856, "swapins": 41653676, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   410353.\nPages active:                                 878619.\nPages inactive:                               681476.\nPages speculative:                            195621.\nPages throttled:                                   0.\nPages wired down:                             255770.\nPages purgeable:                               15861.\n\"Translation faults\":                    13650720824.\nPages copy-on-write:                       621222308.\nPages zero filled:                       13699532260.\nPages reactivated:                        2037688270.\nPages purged:                               59920947.\nFile-backed pages:                           1450520.\nAnonymous pages:                              305196.\nPages stored in compressor:                  1890043.\nPages occupied by compressor:                 661925.\nDecompressions:                            941561604.\nCompressions:                             1233368903.\nPageins:                                  5583257574.\nPageouts:                                   10601384.\nSwapins:                                    41653676.\nSwapouts:                                   69884827.\nPages tagged:                                 167941.\nPages tagged resident:                        112690.\nPages tagged compressed:                       55251.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6915.\nPages tag-storage free:                         1971.\nPages tag-storage non-tag pageable:            89410.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9242880.\nTagged compressions:                         9103043.\nTagged decompressions:                       8353373.\n"}, "exit_code": 0, "wall_seconds": 40.750925792000004, "after": {"page_bytes": 16384, "reclaimable_bytes": 29566025728, "swapins": 41653676, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   491824.\nPages active:                                 883246.\nPages inactive:                               689228.\nPages speculative:                            192935.\nPages throttled:                                   0.\nPages wired down:                             223987.\nPages purgeable:                               20228.\n\"Translation faults\":                    13652720215.\nPages copy-on-write:                       621370183.\nPages zero filled:                       13718793788.\nPages reactivated:                        2039817000.\nPages purged:                               59929057.\nFile-backed pages:                           1292515.\nAnonymous pages:                              472894.\nPages stored in compressor:                  1788649.\nPages occupied by compressor:                 603122.\nDecompressions:                            941729941.\nCompressions:                             1233440053.\nPageins:                                  5585337735.\nPageouts:                                   10601894.\nSwapins:                                    41653676.\nSwapouts:                                   69884827.\nPages tagged:                                 168283.\nPages tagged resident:                        112967.\nPages tagged compressed:                       55316.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6914.\nPages tag-storage free:                         1257.\nPages tag-storage non-tag pageable:            90125.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9292288.\nTagged compressions:                         9104873.\nTagged decompressions:                       8355113.\n"}, "metrics": {"effective_expected_peak_gb": 19.767622912, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.034325417, "experimental_memory_family": true, "extra_expert_workspace_gb": 1.4155776, "extra_read_scope_allowance_gb": 5.438046207999999, "launch_seconds": 40.584796625, "load_seconds": 1.143855667, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": true, "readScopeTokens": 8192, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 33.9, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.000468542, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 0, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3338993664, "mlxActiveEndBytes": 5046847640, "mlxCacheEndBytes": 656867332, "mlxPeakMemoryGB": 7.09873166, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.139367168, "physicalFootprintEndBytes": 6139367168, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 5.177455544471741, "prefillMLXActiveBytes": 5046847640, "prefillMLXCacheBytes": 655867904, "prefillPasses": [7961], "prefillPhysicalFootprintBytes": 6138334976, "prefillReadBytes": 51848294400, "prefillRecords": 18753, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 2.3787482831256703, "prefillSeconds": 39.405494958, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 4.17e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 39.406274834, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8030998272, "samples": 1972}, "sampleSeconds": 0.00046675, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}}
```

## .build/optimization/scope-generation-pilot-v2/summary.json

SHA-256: `6ceb862ac8e66c9360ffb69058139493907f04210bf523479ae454ea8eef55d0`

```json
[
  {
    "prompt": "acceptance",
    "chunk": 4096,
    "arm": "reference",
    "valid_rounds": 1,
    "median_prefill_seconds": 25.078235334,
    "median_request_seconds": 25.079824791,
    "prefill_records": [
      45018
    ]
  },
  {
    "prompt": "acceptance",
    "chunk": 4096,
    "arm": "scope",
    "valid_rounds": 3,
    "median_prefill_seconds": 30.721984625,
    "median_request_seconds": 30.723241625,
    "prefill_records": [
      18753,
      18753,
      18753
    ]
  }
]
```

