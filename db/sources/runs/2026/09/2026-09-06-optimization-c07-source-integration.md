---
type: run
id: 01m1w55v7a85tjd7b331f033m9
created: 2026-09-06T20:04:55.658584+00:00
updated: 2026-09-06T20:05:22.806511+00:00
summary: Bounded prefill integration and prompt-cache epoch correction — V183–184
binary: Shared source unbuilt; separate context numerical evidence only
captured_at: 2026-09-06
command: python3 -m unittest discover -s Tools -p context_qualification_checks.py -v
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Bounded prefill integration and prompt-cache epoch correction — V183–184
tool: Source integration and pure capacity-evidence tests
---
V183 integrates the bounded C07 source family by a hash-verified fourteen-file merge, preserving the current MTP, n-gram, pressure, and CLI work. Sub-256 scheduling activates only beyond the original query-by-key budget, and full late passes use the qualified 64/128 family with logical tails preserved. Projection padding is cropped before recurrent/cache state updates, attention pads only masked future columns and duplicates cropped query rows, and the next-dispatch reservation includes the actual padded product. The published 65,536 implementation cap and default 32,768 window are unchanged. Ten short C07 numerical witnesses on the separate context build16 had passed 1,605 assertions each; that is supporting numerical evidence, not a completed late-context capacity run or evidence for this newly merged binary.

Review found a concrete prompt-logit ownership regression in the proposal before a shared build: Generate requested arithmetic epoch1 while the package key initializer and ownership diagnostics defaulted to0. V183 centralizes currentContextArithmetic=1, removes the duplicated Generate literal, adds two pure identity assertions and adds explicit epoch0 rejection to the real complete-prompt tests. The direct generator and Engine request now construct the same current key. Seven pure capacity-evidence tests pass; new Swift checks are unbuilt.

V184 integrates the context task's supported-strides and CLI-help correction. The exact GDN shared-backing stride assertion remains, using the pinned MLX asData(access:.noCopy) evaluated metadata rather than a deprecated strides property. Source inspection confirms it neither requests a contiguous copy nor relinquishes the live array owners. The CLI help describes memory feasibility and the separate prefill wait policy rather than asserting long context is only a time cost. These two native changes are unbuilt.

The original public transport/version files remain outside this shared merge. No model, GPU, native build, performance, capacity, version change, release, or default activation ran here. Transport retains the machine through its installed-release acceptance and context owns its bounded correctness interval. Combined native, exact-source complete-prompt, paired final matrix, N6 scope, remaining components, image capacity and soak/full acceptance gates remain open. No new speedup is claimed.

Artifact `/tmp/slotstream-context-implementation-20260906/c07-proposal-v1/manifest.json` — 5384 bytes, SHA-256 `dc5bcd9bd48d1b30f5f473e6f5db7ad291513f79bd9166dd1d0c32ae8ddf60ff`.

````text
{
  "base": "V176 plus already-applied MTP exclusivity and governor-recovery-v1 deltas",
  "candidate": "frozen build18; Tools explicitly separately hashed",
  "excluded_public_transport_source": [
    "Sources/Slotstream/DownloadHTTP.swift",
    "Sources/Slotstream/PinnedTransport.swift",
    "Sources/Slotstream/Version.swift"
  ],
  "files": [
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "before_sha256": "31476e08e98d7324d7e6b739907d03a7b83d0a0f01a55415385f899b72c84f81",
      "after_sha256": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "shared_sha256": "31476e08e98d7324d7e6b739907d03a7b83d0a0f01a55415385f899b72c84f81",
      "dry_run_conflicts": 0
    },
    {
      "path": "Sources/Slotstream/Generate.swift",
      "before_sha256": "b53ec44b0d172126aeafed9b9a72a26201fd5f0908b07dc9054347ab50856b9b",
      "after_sha256": "5d43a1c419baa3b373aa491fb15b413a9692334f2774153082de8af0807adeaf",
      "shared_sha256": "b53ec44b0d172126aeafed9b9a72a26201fd5f0908b07dc9054347ab50856b9b",
      "dry_run_conflicts": 0
    },
    {
      "path": "Sources/Slotstream/Layers.swift",
      "before_sha256": "dafd97a45f42ffab751cad4568155f774fa10e874fd28e7326d3673f40c245a1",
      "after_sha256": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
      "shared_sha256": "dafd97a45f42ffab751cad4568155f774fa10e874fd28e7326d3673f40c245a1",
      "dry_run_conflicts": 0
    },
    {
      "path": "Sources/Slotstream/Model.swift",
      "before_sha256": "6bee81d286e0f1412645f8f701e28cad01d9ba0eee182b94ed97ed5b8c278b38",
      "after_sha256": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
      "shared_sha256": "6bee81d286e0f1412645f8f701e28cad01d9ba0eee182b94ed97ed5b8c278b38",
      "dry_run_conflicts": 0
    },
    {
      "path": "Sources/Slotstream/RouterProjection.swift",
      "before_sha256": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "after_sha256": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
      "shared_sha256": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "dry_run_conflicts": 0
    },
    {
      "path": "Sources/Slotstream/Weights.swift",
      "before_sha256": "b9b9b271d4affe29cd9714768433a31e01e487f8b964e646023b3b3e8dc3cc9b",
      "after_sha256": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "shared_sha256": "b9b9b271d4affe29cd9714768433a31e01e487f8b964e646023b3b3e8dc3cc9b",
      "dry_run_conflicts": 0
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "before_sha256": "6173baf54d89e7c133233d2de7f828486b9e1c51f9608dd729b878ac6e45787e",
      "after_sha256": "86cb6127bd84f33a036a92a0ef561925d141ae1b257aac46c8a55c10d30406a2",
      "shared_sha256": "6173baf54d89e7c133233d2de7f828486b9e1c51f9608dd729b878ac6e45787e",
      "dry_run_conflicts": 0
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift",
      "before_sha256": null,
      "after_sha256": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "shared_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "dry_run_conflicts": 0
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift",
      "before_sha256": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "after_sha256": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
      "shared_sha256": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "dry_run_conflicts": 0
    },
    {
      "path": "Sources/slotstream-cli/ContextCommands.swift",
      "before_sha256": "11dbce09610ef5b9af782c736b1ece328b1e3b8bd4d9b2d60cb93cbfe0392405",
      "after_sha256": "ac3bdf70521f77c42fada851e132a1561c4ee06e5057302cb3f50d8f3cc597d3",
      "shared_sha256": "11dbce09610ef5b9af782c736b1ece328b1e3b8bd4d9b2d60cb93cbfe0392405",
      "dry_run_conflicts": 0
    },
    {
      "path": "Sources/slotstream-cli/OptimizationCommands.swift",
      "before_sha256": "f0d3057a1668280dc770d019c386c6c8470236fef18484b1601aff6a35dc2e59",
      "after_sha256": "534f2c4273d9401478c1012026d23f3376e45979108fffed5d227f32ac3f9af8",
      "shared_sha256": "e1dcee57b5ec1f7957305bc32954807a356de50ec2b8c5785e024ec6dc69aad7",
      "dry_run_conflicts": 0
    },
    {
      "path": "Tools/context_gates.py",
      "before_sha256": "27461549d21c8e1815a8eea59bb1d3a021973c7dd4e02c63929cbfab8048d09a",
      "after_sha256": "60767a837601e3b41b17a0f1b0bb04551852ef08735d667513d1cb333e713e41",
      "shared_sha256": "27461549d21c8e1815a8eea59bb1d3a021973c7dd4e02c63929cbfab8048d09a",
      "dry_run_conflicts": 0
    },
    {
      "path": "Tools/context_qualification.py",
      "before_sha256": null,
      "after_sha256": "e9f9cf2f82b89fb64418f918966ca5c62ca303212723bf32457b9d65729e4807",
      "shared_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "dry_run_conflicts": 0
    },
    {
      "path": "Tools/context_qualification_checks.py",
      "before_sha256": null,
      "after_sha256": "398c4d8bf9d98d77c0cb76873cd1a6c62e26f53839a1edde83080f1bc789d3b4",
      "shared_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "dry_run_conflicts": 0
    }
  ]
}

````

Artifact `/tmp/slotstream-optimization-execution/c07-merge-v183/receipt.json` — 4577 bytes, SHA-256 `4e45a11133d3a2c674b5c911ca8d88dd4baa73cae083666ac44f887669f3d182`.

````text
{
  "proposal_sha256": "dc5bcd9bd48d1b30f5f473e6f5db7ad291513f79bd9166dd1d0c32ae8ddf60ff",
  "files": [
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "before_sha256": "31476e08e98d7324d7e6b739907d03a7b83d0a0f01a55415385f899b72c84f81",
      "after_sha256": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "three_way": false
    },
    {
      "path": "Sources/Slotstream/Generate.swift",
      "before_sha256": "b53ec44b0d172126aeafed9b9a72a26201fd5f0908b07dc9054347ab50856b9b",
      "after_sha256": "5d43a1c419baa3b373aa491fb15b413a9692334f2774153082de8af0807adeaf",
      "three_way": false
    },
    {
      "path": "Sources/Slotstream/Layers.swift",
      "before_sha256": "dafd97a45f42ffab751cad4568155f774fa10e874fd28e7326d3673f40c245a1",
      "after_sha256": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
      "three_way": false
    },
    {
      "path": "Sources/Slotstream/Model.swift",
      "before_sha256": "6bee81d286e0f1412645f8f701e28cad01d9ba0eee182b94ed97ed5b8c278b38",
      "after_sha256": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
      "three_way": false
    },
    {
      "path": "Sources/Slotstream/RouterProjection.swift",
      "before_sha256": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "after_sha256": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
      "three_way": false
    },
    {
      "path": "Sources/Slotstream/Weights.swift",
      "before_sha256": "b9b9b271d4affe29cd9714768433a31e01e487f8b964e646023b3b3e8dc3cc9b",
      "after_sha256": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "three_way": false
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "before_sha256": "6173baf54d89e7c133233d2de7f828486b9e1c51f9608dd729b878ac6e45787e",
      "after_sha256": "86cb6127bd84f33a036a92a0ef561925d141ae1b257aac46c8a55c10d30406a2",
      "three_way": false
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift",
      "before_sha256": null,
      "after_sha256": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "three_way": false
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift",
      "before_sha256": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "after_sha256": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
      "three_way": false
    },
    {
      "path": "Sources/slotstream-cli/ContextCommands.swift",
      "before_sha256": "11dbce09610ef5b9af782c736b1ece328b1e3b8bd4d9b2d60cb93cbfe0392405",
      "after_sha256": "ac3bdf70521f77c42fada851e132a1561c4ee06e5057302cb3f50d8f3cc597d3",
      "three_way": false
    },
    {
      "path": "Sources/slotstream-cli/OptimizationCommands.swift",
      "before_sha256": "e1dcee57b5ec1f7957305bc32954807a356de50ec2b8c5785e024ec6dc69aad7",
      "after_sha256": "bb3a76becb56a4e6bd46fe118122b8479e55a61701ce4d37aa7c39a88d456022",
      "three_way": true
    },
    {
      "path": "Tools/context_gates.py",
      "before_sha256": "27461549d21c8e1815a8eea59bb1d3a021973c7dd4e02c63929cbfab8048d09a",
      "after_sha256": "60767a837601e3b41b17a0f1b0bb04551852ef08735d667513d1cb333e713e41",
      "three_way": false
    },
    {
      "path": "Tools/context_qualification.py",
      "before_sha256": null,
      "after_sha256": "e9f9cf2f82b89fb64418f918966ca5c62ca303212723bf32457b9d65729e4807",
      "three_way": false
    },
    {
      "path": "Tools/context_qualification_checks.py",
      "before_sha256": null,
      "after_sha256": "398c4d8bf9d98d77c0cb76873cd1a6c62e26f53839a1edde83080f1bc789d3b4",
      "three_way": false
    }
  ],
  "protected": {
    "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a13dbbc695b58db42dbf8f8437def183b732e848c59f103912c662225ffcfb3f",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "04ba0fdae78172e42692455f85e3f21606bef533f4918e1642723f1059c82b50",
    "Tools/ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "Tools/indexer_score_probe.py": "78ae5880826a6743f725d4285846b9befed98bb3a3215b79cf79719a170501a5"
  },
  "runtime_run": false
}

````

Artifact `/tmp/slotstream-optimization-execution/prompt-epoch-v183/fix.patch` — 4298 bytes, SHA-256 `4ab94aca36168b5dc4b05a02756e23b02ca497c1a948c105c95e3a06f714c4b5`.

````text
--- a/Sources/Slotstream/PrefixCache.swift
+++ b/Sources/Slotstream/PrefixCache.swift
@@ -42,12 +42,17 @@
 /// Computation settings and model identity prevent reuse across a changed
 /// numerical path or a different loaded model. No persistent cache is implied.
 package struct PromptCheckpointKey: Equatable {
+    // One version for direct generation and Engine requests. Long-context
+    // qualification selects the same bounded arithmetic family; it is not a
+    // separate cache identity. Retained logits never cross arithmetic epochs.
+    package static let currentContextArithmetic = 1
     package let model: UUID
     package let optimizations: InferenceOptimizations
     package let prefillChunk: Int
     package let mtp: Bool
     package let contextArithmetic: Int
-    package init(model: UUID, optimizations: InferenceOptimizations, prefillChunk: Int, mtp: Bool, contextArithmetic: Int = 0) {
+    package init(model: UUID, optimizations: InferenceOptimizations, prefillChunk: Int, mtp: Bool,
+                 contextArithmetic: Int = PromptCheckpointKey.currentContextArithmetic) {
         self.model = model; self.optimizations = optimizations
         self.prefillChunk = prefillChunk; self.mtp = mtp; self.contextArithmetic = contextArithmetic
     }
--- a/Sources/Slotstream/Generate.swift
+++ b/Sources/Slotstream/Generate.swift
@@ -548,8 +548,7 @@
         let checkpointHitsBefore = cache?.checkpointHits ?? 0
         let completeKey = model.optimizations.completePromptCheckpoint
             ? PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
-                prefillChunk: prefillChunk, mtp: speculationEnabled && model.mtpHead != nil,
-                contextArithmetic: 1) : nil
+                prefillChunk: prefillChunk, mtp: speculationEnabled && model.mtpHead != nil) : nil
         let hit = cache?.takeForGeneration(
             matching: promptIds, images: images,
             reserveTokens: promptIds.count + params.maxTokens,
--- a/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift
@@ -125,8 +125,10 @@
                     PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                         prefillChunk: 128, mtp: mtp),
                     PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
-                        prefillChunk: generator.prefillChunk, mtp: !mtp)] {
-                    c.expect("wrong model, schedule or draft identity refuses complete hit",
+                        prefillChunk: generator.prefillChunk, mtp: !mtp),
+                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
+                        prefillChunk: generator.prefillChunk, mtp: mtp, contextArithmetic: 0)] {
+                    c.expect("wrong model, schedule, draft or arithmetic identity refuses complete hit",
                         cache.takeForGeneration(matching: ids, completePromptKey: wrongKey) == nil)
                 }
                 if let root = cache.takeForGeneration(matching: ids, completePromptKey: key), let raw = root.logits {
--- a/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift
@@ -4,6 +4,12 @@
 extension Diagnostics {
     public static func configurableContext() throws -> CheckReport {
         var c = CheckBuilder("configurable-context")
+        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
+        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
+            prefillChunk: 256, mtp: false)
+        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
+        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
+            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
         let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                     128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
         for cap in caps {

````

Artifact `/tmp/slotstream-optimization-execution/prompt-epoch-v183/manifest.json` — 1073 bytes, SHA-256 `c8c0424bb34648ab44035998d0f32c75b7e5b4146fb5c0b1dca777fe5f749d0c`.

````text
{
  "files": [
    {
      "path": "Sources/Slotstream/PrefixCache.swift",
      "before_sha256": "3bd1841ec1bebb52b210d75b0fd4d4bdb0e49277ff9c529aebbc7227d94811d8",
      "after_sha256": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919"
    },
    {
      "path": "Sources/Slotstream/Generate.swift",
      "before_sha256": "5d43a1c419baa3b373aa491fb15b413a9692334f2774153082de8af0807adeaf",
      "after_sha256": "42310629aef5869a882d4957076e988682aea230bce7f9ffbdae1dfa2d984133"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift",
      "before_sha256": "e4a88b55578952d038c2892948665d91a8ba7d1d816578fce5fc8b2ceef76ce2",
      "after_sha256": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "before_sha256": "86cb6127bd84f33a036a92a0ef561925d141ae1b257aac46c8a55c10d30406a2",
      "after_sha256": "0c5f8e429c3b519d3b7ce2636961137bea7d82d7328a11180609450517a6c27e"
    }
  ],
  "native_run": false
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/consumer-strides-help-v1/fix.patch` — 2414 bytes, SHA-256 `20c345f18456921eddb0d4bd5695213c9657233de4edad19ca422c8487f9a386`.

````text
--- a/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift
@@ -37,7 +37,10 @@
                     let name = "\(base).\(stem).\(suffix)"
                     let a = reference.tensor(name), b = packed.tensor(name)
                     c.expect("layer\(layer): \(stem).\(suffix) exact bytes", exact(a, b))
-                    c.equal("layer\(layer): \(stem).\(suffix) strides", b.strides, a.strides)
+                    // Preserve the evaluated backing layout without creating a
+                    // contiguous copy; both array owners remain alive here.
+                    c.equal("layer\(layer): \(stem).\(suffix) strides",
+                        b.asData(access: .noCopy).strides, a.asData(access: .noCopy).strides)
                     expectedPayload += a.nbytes
                 }
             }
--- a/Sources/slotstream-cli/main.swift
+++ b/Sources/slotstream-cli/main.swift
@@ -449,13 +449,12 @@
         help: ArgumentHelp(
             "Longest prompt plus reply accepted per request, in tokens (default \(ContextPolicy.defaultTokens), ceiling \(ContextPolicy.maxTokens)).",
             discussion: """
-                Past it a request is refused with a 400 that says why, instead \
-                of stalling. The ceiling is the largest context slotstream has \
-                measured on real hardware, not a memory limit: the model is \
-                trained for 262,144 tokens and context state costs ~27 KiB per \
-                token. What a long prompt really costs is time, since all of it \
-                is read before the first token; `doctor` prints the wait for \
-                this machine and `context-check` measures a longer prompt.
+                The configured window stays fixed for this engine. The planner \
+                must fit its state and workspaces before loading; requests \
+                above the window are refused. --max-prefill-wait separately \
+                bounds accepted-request-to-first-token time. `doctor` reports \
+                memory feasibility and available timing estimates; \
+                `context-check` runs explicit, unqualified capacity diagnostics.
                 """))
     var maxContext: Int = ContextPolicy.defaultTokens
     @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")

````

Artifact `/tmp/slotstream-optimization-execution/consumer-fix-v184/receipt.json` — 559 bytes, SHA-256 `b09cd876b60a247a35b977027d7361d3d4c6612af876fb156cdaac75fbe45f86`.

````text
{
  "files": [
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift",
      "before_sha256": "450a558155202d247a8bb73348a381ea35c7c06ed82999a3df356dcc65b2c930",
      "after_sha256": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd"
    },
    {
      "path": "Sources/slotstream-cli/main.swift",
      "before_sha256": "a7291c58fa698be74e50964e22f1a1ddbc6584bdd02e9462fac54a6672706b36",
      "after_sha256": "19c67da92554623e267ff0f2a065d95f8ca2e3b152cf858ce39b75acf0b8f046"
    }
  ],
  "native_run": false
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/c07-source-integration-v183-v184/pure-tests.txt` — 1003 bytes, SHA-256 `a1a7699a9c13c6320e93f93066a2db709c3c411a58decff9f38ff1c802a1bbf6`.

````text
{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}
test_complete_delivery (context_qualification_checks.CapacityEvidence) ... ok
test_failed_first_rung_never_launches_the_next (context_qualification_checks.CapacityEvidence) ... ok
test_failed_verification_preflight_retains_failure_without_launch (context_qualification_checks.CapacityEvidence) ... ok
test_incomplete_or_forged_observations_are_rejected (context_qualification_checks.CapacityEvidence) ... ok
test_padding_is_inside_product_bound (context_qualification_checks.CapacityEvidence) ... ok
test_retained_capacity_requires_complete_interleaved_ownership (context_qualification_checks.CapacityEvidence) ... ok
test_swap_and_missing_memory_observations_fail (context_qualification_checks.CapacityEvidence) ... ok

----------------------------------------------------------------------
Ran 7 tests in 0.007s

OK

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/c07-source-integration-v183-v184/diff-check.txt` — 0 bytes, SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/ContextMemory.swift` — 13753 bytes, SHA-256 `1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683`.

````text
import Foundation

// Saturation is a refusal sentinel, never permission to wrap a byte budget.
package enum ContextBytes {
    package static func product(_ values: Int...) -> Int {
        var result = 1
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.multipliedReportingOverflow(by: value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
    package static func sum(_ values: Int...) -> Int {
        var result = 0
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.addingReportingOverflow(value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
}

/// Pure geometry shared by the planner and the actual stepped sequence caches.
/// A capacity is bytes of backing storage, not the number of live token IDs.
public enum ContextGeometry {
    public static let allocationStep = 1024
    public static let attentionLayers = 12
    public static let rowBytes = 2304

    /// Physical bytes needed when one buffer grows. The old allocation can
    /// still have GPU or checkpoint readers, so growth charges the complete
    /// replacement. Capacity in another buffer never grants a credit here.
    public static func nextBufferAllocationBytes(tokens: Int, rowBytes: Int,
                                                 allocatedBytes: Int, step: Int = allocationStep) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit, rowBytes > 0,
              allocatedBytes >= 0, step > 0, step <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + step - 1) / step) * step
        let required = ContextBytes.product(capacity, rowBytes)
        return required > allocatedBytes ? required : 0
    }

    public static func capacityBytes(tokens: Int, layers: Int = attentionLayers,
                                     rowBytes: Int = rowBytes, pooledRowBytes: Int = 256,
                                     compressionRatio: Int = 4, indexerBudget: Int = 2048,
                                     incrementalIndexer: Bool = false) -> Int {
        guard tokens >= 0, layers >= 0, rowBytes > 0, pooledRowBytes >= 0,
              compressionRatio > 0, indexerBudget >= 0, tokens <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + allocationStep - 1) / allocationStep) * allocationStep
        let pooled = incrementalIndexer && tokens > indexerBudget
            ? ((tokens / compressionRatio + 255) / 256) * 256 : 0
        let (rows, a) = capacity.multipliedReportingOverflow(by: rowBytes)
        let (blocks, b) = pooled.multipliedReportingOverflow(by: pooledRowBytes)
        let (one, c) = rows.addingReportingOverflow(blocks)
        let (total, d) = one.multipliedReportingOverflow(by: layers)
        return a || b || c || d ? Int.max : total
    }

    public static func sequenceBytes(tokens: Int, mtp: Bool = false) -> Int {
        capacityBytes(tokens: tokens, layers: attentionLayers + (mtp ? 1 : 0))
    }

    public static func additionalActiveBytes(tokens: Int, mtp: Bool = false) -> Int {
        max(0, sequenceBytes(tokens: tokens, mtp: mtp)
            - sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtp))
    }
}

/// Exact integer accounting of an otherwise empirical process envelope. The
/// fixed and workspace allowances are measured budgets, not allocator telemetry.
public struct ContextMemoryLedger: Sendable {
    public let fixedBytes: Int
    public let poolBytes: Int
    public let activeCapacityBytes: Int
    public let additionalActiveBytes: Int
    public let retainedCapacityBytes: Int
    public let retainedRecurrentBytes: Int
    public let prefillBytes: Int
    public let longContextReserveBytes: Int
    public let mtpResidentBytes: Int
    public let visionResidentBytes: Int
    public let planningMarginBytes: Int

    public init(slots: Int, context: Int, chunk: Int, retentionTokens: Int,
                mtp: Bool, visionResident: Bool) {
        fixedBytes = 5_300_000_000
        poolBytes = ContextBytes.product(slots, 2_764_800)
        activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
        additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
        retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
        retainedRecurrentBytes = retentionTokens > 0
            ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
        prefillBytes = ContextBytes.product(chunk, 1_300_000)
        longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
        mtpResidentBytes = mtp ? 1_600_000_000 : 0
        visionResidentBytes = visionResident ? 900_000_000 : 0
        planningMarginBytes = 1_000_000_000
    }

    /// The Hermes envelope is anchored permanently at 65K. Above it, reserve
    /// an additional complete growth allocation for candidate qualification;
    /// this conservative copy budget is not a measured interpolation.
    public static func transientReserveBytes(context: Int, mtp: Bool = false) -> Int {
        guard context > ContextPolicy.tokensInFixedFootprint else { return 0 }
        let hermes = 32_768 * PrefixCache.bytesPerToken
        return max(hermes, ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp))
    }

    public var expectedPeakBytes: Int {
        ContextBytes.sum(fixedBytes, poolBytes, additionalActiveBytes, retainedCapacityBytes,
            retainedRecurrentBytes, prefillBytes, longContextReserveBytes,
            mtpResidentBytes, visionResidentBytes)
    }
    public var json: [String: Any] {
        ["version": 1, "fixed_bytes": fixedBytes, "pool_bytes": poolBytes,
         "active_capacity_bytes": activeCapacityBytes, "additional_active_bytes": additionalActiveBytes,
         "retained_capacity_bytes": retainedCapacityBytes, "retained_recurrent_bytes": retainedRecurrentBytes,
         "prefill_bytes": prefillBytes, "long_context_reserve_bytes": longContextReserveBytes,
         "mtp_resident_bytes": mtpResidentBytes, "vision_resident_bytes": visionResidentBytes,
         "planning_margin_bytes": planningMarginBytes, "expected_peak_bytes": expectedPeakBytes]
    }
}

/// Bounds for the next dispatch. These are conservative geometry allowances,
/// not throughput anchors or new measured process-peak claims.
public enum ContextWorkspace {
    /// A short pass stays inside one canonical projection/attention domain.
    /// Include masked key columns when choosing its actual query count.
    public static func boundedSmallPass(requested: Int, at position: Int,
                                         referenceStart: Int, referenceEnd: Int) -> Int {
        guard requested > 0, requested < 256, referenceStart >= 0,
              position >= referenceStart, referenceEnd > position,
              referenceEnd <= ContextPolicy.modelLimit else { return 0 }
        let blockRemaining = 256 - ((position - referenceStart) % 256)
        // Only the qualified 64/128-row family is selected for full late
        // passes. Odd user batch overrides cannot introduce a new kernel
        // shape such as 68 or 137; logical terminal rows are still exact.
        let preferred = requested >= 128 ? 128 : requested >= 64 ? 64 : requested
        var count = min(preferred, blockRemaining, referenceEnd - position)
        while count > 0 {
            let extent = keyExtent(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            let queries = queryRows(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            if queries <= PrefillSchedule.measuredQueryKeyProduct / extent { return count }
            count /= 2
        }
        return 0
    }

    public static func keyExtent(pass: Int, context: Int, referenceStart: Int = 0,
                                 referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass < 256 else { return context }
        let rows = context - referenceStart
        return min(referenceEnd, referenceStart + ((rows + 255) / 256) * 256)
    }

    /// A tiny tail inside a matrix-prefill reference domain must not switch
    /// to the vector attention kernel. Dummy query rows are cropped before
    /// any state update, but they still count toward the physical Q x K bound.
    public static func queryRows(pass: Int, context: Int, referenceStart: Int = 0,
                                  referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass <= 8 else { return pass }
        let block = referenceStart + ((context - pass - referenceStart) / 256) * 256
        return min(256, referenceEnd - block) > 8 ? 64 : pass
    }

    public static func prefillBytes(pass: Int, context: Int, scope: Int = 0, attentionHeads: Int = 24,
                                    referenceStart: Int = 0, referenceEnd: Int = ContextPolicy.modelLimit,
                                    minimumProjectionRows: Int = 0, padSmallQueries: Bool = false) -> Int {
        guard pass > 0, pass <= 4096, attentionHeads > 0, scope >= 0, context >= pass, context <= ContextPolicy.modelLimit,
              (0 ... 256).contains(minimumProjectionRows),
              pass <= PrefillSchedule.measuredQueryKeyProduct / context else { return Int.max }
        let extent = keyExtent(pass: pass, context: context, referenceStart: referenceStart, referenceEnd: referenceEnd)
        let queries = padSmallQueries ? queryRows(pass: pass, context: context,
            referenceStart: referenceStart, referenceEnd: referenceEnd) : pass
        guard queries <= PrefillSchedule.measuredQueryKeyProduct / extent else { return Int.max }
        // Indexer score/mask/top-k and selected attention coexist with layer
        // activations. Preserve the original linear allowance; bound the
        // query-by-context part even when late passes fall below 256.
        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), 1_300_000),
            ContextBytes.product(queries, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
    }

    public static func visionBytes(patches: Int, hidden: Int = 1152, heads: Int = 16,
                                   queryTile: Int = 0, padding: Int = 0) -> Int {
        guard patches > 0, patches <= 9216, hidden > 0, heads > 0,
              [0, 256].contains(queryTile), [0, 80, 128].contains(padding),
              queryTile == 0 || padding == 0 else { return Int.max }
        // The pinned width-72 fallback materializes BF16 QK and softmax.
        // Each tile is evaluated before the next, so the candidate really
        // bounds Q by 256. Padding uses a different kernel; retain the full
        // original-score allowance until its resource gate is qualified.
        let queries = queryTile == 256 ? min(patches, 256) : patches
        return ContextBytes.sum(ContextBytes.product(queries, patches, heads, 4),
            ContextBytes.product(patches, hidden, 32))
    }
}

/// Count existing request values without formatting or serializing them first.
/// Depth and overflow fail closed before Jinja/JSON can copy the structure.
package enum ContextInputMemory {
    package static func bytes(_ value: Any, depth: Int = 0) -> Int {
        guard depth < 64 else { return Int.max }
        if let text = value as? String { return ContextBytes.sum(text.utf8.count, 16) }
        if let value = value as? JSONValue {
            switch value {
            case .string(let text): return ContextBytes.sum(text.utf8.count, 16)
            case .array(let values): return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
            case .object(let values): return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
            default: return 32
            }
        }
        if let values = value as? [String: Any] {
            return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
        }
        if let values = value as? [Any] {
            return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
        }
        return 32
    }
    package static func bytes(messages: [ChatMessage], tools: [ToolDefinition]) -> Int {
        let messagesBytes = messages.reduce(0) { sum, m in
            let calls = m.toolCalls.reduce(0) { ContextBytes.sum($0, $1.name.utf8.count, bytes(JSONValue.object($1.arguments))) }
            return ContextBytes.sum(sum, m.role.utf8.count, m.content.utf8.count, m.reasoning?.utf8.count ?? 0,
                m.toolCallId?.utf8.count ?? 0, m.toolName?.utf8.count ?? 0, calls, bytes(m.images), 256)
        }
        return tools.reduce(messagesBytes) { ContextBytes.sum($0, $1.name.utf8.count, $1.description.utf8.count, bytes($1.parameters), 256) }
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/Generate.swift` — 73452 bytes, SHA-256 `42310629aef5869a882d4957076e988682aea230bce7f9ffbdae1dfa2d984133`.

````text
// Prefill + decode loop with sampling, stop tokens, and streaming callbacks.

import Foundation
import MLX

public struct SampleParams {
    public var temperature: Float = 0.7
    public var topP: Float = 0.8
    public var topK: Int = 20
    public var minP: Float = 0
    public var presencePenalty: Float = 1.5
    public var seed: UInt64? = nil
    public var maxTokens = 512
    /// Text sequences that end generation (Ollama `options.stop`, OpenAI `stop`).
    public var stop: [String] = []

    public init() {}

    /// Clamp every knob into the range the sampler is defined on.
    ///
    /// Values outside it used to produce silent garbage rather than an error:
    /// a `top_p` of 0 or a `min_p` above 1 filters out every candidate, and the
    /// old `probs / probs.sum()` then divided 0 by 0, so the sampler emitted
    /// token 0 forever. A negative `num_predict` (Ollama's "until EOS") indexed
    /// a reversed Range and trapped, killing the process.
    public func sanitized() -> SampleParams {
        var p = self
        if !p.temperature.isFinite { p.temperature = 0 }
        p.temperature = max(0, p.temperature)
        if !p.topP.isFinite || p.topP <= 0 || p.topP > 1 { p.topP = 1 }
        if !p.minP.isFinite { p.minP = 0 }
        p.minP = min(max(0, p.minP), 1)
        if !p.presencePenalty.isFinite { p.presencePenalty = 0 }
        p.topK = max(0, p.topK)
        // <= 0 means "as many as allowed" for Ollama (-1) and OpenAI clients.
        if p.maxTokens <= 0 { p.maxTokens = SampleParams.maxTokenCeiling }
        p.maxTokens = min(p.maxTokens, SampleParams.maxTokenCeiling)
        p.stop = p.stop.filter { !$0.isEmpty }
        return p
    }

    /// Upper bound on a single response. Decode is the slow axis here, so an
    /// unbounded "until EOS" request needs a ceiling that is generous but finite.
    public static let maxTokenCeiling = 32_768

    public static var instruct: SampleParams { SampleParams() }
    public static var thinking: SampleParams {
        var p = SampleParams()
        p.temperature = 1.0
        p.topP = 0.95
        p.presencePenalty = 0
        return p
    }
    public static var greedy: SampleParams {
        var p = SampleParams()
        p.temperature = 0
        p.presencePenalty = 0
        return p
    }

    /// Defaults for an agent turn that may call tools.
    ///
    /// Two departures from `instruct`, and both are about the tool grammar
    /// rather than taste:
    ///
    /// * **presence penalty 0.** The instruct default of 1.5 penalises every
    ///   token already used, and the call format is obliged to repeat itself —
    ///   `</parameter>` after every argument, then `</function>`, then
    ///   `</tool_call>`. Penalising a closing tag because an earlier argument
    ///   already used it pushes the model off the grammar exactly where it must
    ///   stay on it.
    /// * **low temperature.** A tool call is a structured artefact with one
    ///   right shape, not prose; there is nothing for sampling diversity to buy
    ///   here, and at 0.7 the same prompt answered with a call on one run and
    ///   with "I don't have any tools available" on the next.
    ///
    /// Not fully greedy: `0.2` keeps a little room to escape a repetition loop,
    /// which pure argmax has no way out of.
    public static var agent: SampleParams {
        var p = SampleParams()
        p.temperature = 0.2
        p.topP = 0.9
        p.presencePenalty = 0
        return p
    }
}

public struct GenStats: Codable {
    public var requestSeconds = 0.0
    public var queueSeconds = 0.0
    public var imageEncodeSeconds = 0.0
    /// Configured vision query bound for this image request, not a kernel count.
    public var visionQueryTile = 0
    /// Counted after each query tile has actually evaluated, across tower blocks.
    public var visionQueryTileCalls = 0
    public var encodedImages = 0
    public var reusedImageFeatures = 0
    public var prefixSkippedImages = 0
    /// From Generator entry to first sampled, non-EOS token; excludes Engine queue.
    public var firstTokenSeconds: Double?
    /// From Engine entry to first nonempty decoded callback, before that callback.
    public var firstTextSeconds: Double?
    public var tokenCallbackSeconds = 0.0
    public var sampleSeconds = 0.0
    public var prefillLocalVictims = 0
    public var decodeLocalVictims = 0
    public var prefillSlotSliceBatches = 0
    public var decodeSlotSliceBatches = 0
    public var decodeSlotSliceRuns = 0
    public var decodeSlotScatterBatches = 0
    public var prefillSlotWordBatches = 0
    public var decodeSlotWordBatches = 0
    public var decodeSlotWordBuffers = 0
    public var prefillSlotCPUBatches = 0
    public var decodeSlotCPUBatches = 0
    public var prefixCheckpointForks = 0
    public var prefixCheckpointStores = 0
    public var prefixCheckpointRefusals = 0
    public var prefixCheckpointErrors = 0
    public var completePromptHits = 0
    public var completePromptStores = 0
    public var embeddingRowsEnabled = false
    /// Unique lookup rows served/read within this request, including MTP.
    public var embeddingRowHits = 0
    public var embeddingRowMisses = 0
    public var embeddingCachedRows = 0
    public var embeddingCachedPayloadBytes = 0
    public var reconciliationSeconds = 0.0
    public var draftSeconds = 0.0
    public var verifySeconds = 0.0
    /// Actual attempted depths: zero is a useful calibration/tail target step;
    /// minus one permanently hands this request to plain decode. Bounded by
    /// the request's output ceiling, and exported with diagnostic stats only.
    public var adaptiveDraftDepths: [Int] = []
    public var adaptiveDisabledAtOutput: Int?
    public var adaptivePlainTokens = 0
    public var decodeForwardPasses = 0
    public var decodeModelTokens = 0
    /// Arrival intervals at the token callback, including earlier callback
    /// stalls. Speculative bursts can contain several very short intervals.
    public var interTokenSeconds: [Double] = []
    public var prefillPasses: [Int] = []
    public var prefillComputePasses: [Int] = []
    /// Actual maximum attention key extent of each committed compute pass,
    /// including masked numerical-alignment padding when that path executes.
    public var prefillComputeKeyExtents: [Int] = []
    /// Physical query rows, including cropped dummy rows used to preserve
    /// matrix-attention arithmetic for very short late-context tails.
    public var prefillComputeQueryRows: [Int] = []
    public var terminalQueryRowsSkipped = 0
    public var terminalMoERowsSkipped = 0
    public var abortedReadScopes = 0
    public var reconciledHeadTokens = 0
    public var reusedHeadTokens = 0
    public var lifetimeRSSPeakBytes: UInt64 = 0
    public var physicalFootprintEndBytes: UInt64 = 0
    public var sampledFootprint: FootprintSampler.Result?
    public var imagePreparation: ImagePreparationObservation?
    public var generatorVMBefore: ProcessMemory.VMActivity?
    public var generatorVMAfter: ProcessMemory.VMActivity?
    public var generatorSystemBefore: ProcessMemory.OperatingConditions?
    public var generatorSystemAfter: ProcessMemory.OperatingConditions?
    public var mlxActiveEndBytes = 0
    public var mlxCacheEndBytes = 0
    public var prefillMLXActiveBytes = 0
    public var prefillMLXCacheBytes = 0
    public var prefillPhysicalFootprintBytes: UInt64 = 0
    public var prefillGPUWaitSeconds = 0.0
    public var prefillRowSortSeconds = 0.0
    public var prefillReadBytes = 0
    public var decodeReadBytes = 0
    public var allocatedSequenceBytes = 0
    public var sharedExpertPrelaunches = 0
    public var fusedRoPERotationsScheduled = 0
    public var fusedGDNProjectionsScheduled = 0
    public var packedGDNProjectionLayers = 0
    public var packedGDNProjectionPayloadBytes = 0
    public var ropeTableHits = 0
    public var ropeTableBuilds = 0
    public var residentExpertPrelaunches = 0
    public var residentExpertJoins = 0
    /// Host wait at the explicit join; this is not a measured GPU duration.
    public var residentExpertJoinSeconds = 0.0
    public var ngramCachedRows = 0
    public var cachedRouterBytes = 0
    public var ngramCachePayloadBytes = 0
    /// Every token in the prompt, whether or not it had to be recomputed.
    /// This is what the Ollama/OpenAI surfaces report as prompt_eval_count.
    public var promptTokens = 0
    /// Prompt tokens actually pushed through the model this request. Equal to
    /// `promptTokens` on a cold prompt; `promptTokens - reusedPrefixTokens`
    /// when the conversation prefix cache matched.
    public var prefillTokens = 0
    /// Prompt tokens served from the retained state of a previous request.
    public var reusedPrefixTokens = 0
    public var prefillSeconds = 0.0
    public var decodeTokens = 0
    public var decodeSeconds = 0.0
    public var expertHitRate = 0.0
    public var ngramRowHits = 0
    public var ngramRowMisses = 0
    public var ngramLookaheadRows = 0
    public var ngramLookaheadDiscarded = 0
    public var ngramLookaheadWaitSeconds = 0.0
    public var ngramPrefetchSeconds = 0.0
    /// Speculative decode (MTP): drafts proposed, drafts accepted, and verify
    /// passes run. Zero when the draft head is disabled.
    public var draftedTokens = 0
    public var acceptedDrafts = 0
    public var verifyPasses = 0
    public var draftAcceptRate: Double {
        draftedTokens > 0 ? Double(acceptedDrafts) / Double(draftedTokens) : 0
    }
    /// Legacy observation: max(lifetime RSS, current physical footprint).
    /// It is not an upper bound on physical-footprint peaks. The separate
    /// sampledFootprint observation is required for memory qualification.
    public var peakMemoryGB = 0.0
    /// MLX-only high-water retained as a diagnostic, never as the RAM gate.
    public var mlxPeakMemoryGB = 0.0
    /// Read/scatter host intervals can overlap GPU work. Subtracting them
    /// from wall time does not measure GPU compute.
    public var prefillIOSeconds = 0.0
    public var prefillScatterSeconds = 0.0
    public var prefillRecords = 0
    /// The same split for decode. Prefill's was what showed the chunk size was
    /// the lever and read-ahead was not; decode had no equivalent, so "decode
    /// is slow" could not be attributed to the miss path, to the scatter, or
    /// to per-token dispatch without guessing. Everything not counted here is
    /// compute plus dispatch.
    public var decodeIOSeconds = 0.0
    public var decodeScatterSeconds = 0.0
    public var decodeRecords = 0
    /// "stop" (EOS or stop sequence), "length", "error", or a low-level
    /// caller's explicit "cancelled" checkpoint yield.
    public var finishReason = "stop"
    /// A recoverable request failure. The failed state is never cached and
    /// serving adapters must emit an error instead of a successful completion.
    public var runtimeError: String?
    public var requestFailure: RequestFailure?
    public var smallPrefillSweeps = 0
    public var contextArithmetic = "standard"
    public var preparationSeconds = 0.0
    /// Pressure-to-observed-safe-boundary latency, not GPU preemption time.
    public var memoryPressureCancelled = false
    public var memoryPressureBoundarySeconds: Double?

    public var prefillTPS: Double { prefillSeconds > 0 ? Double(prefillTokens) / prefillSeconds : 0 }
    public var prefixHit: Bool { reusedPrefixTokens > 0 }
    public var decodeTPS: Double { decodeSeconds > 0 ? Double(decodeTokens) / decodeSeconds : 0 }
}

/// Token sampling, split out from the decode loop so it can be exercised on
/// synthetic logits with no checkpoint loaded (`slotstream sampler-golden`)
/// and compared against the numpy reference in `Tools/sampler_ref.py`.
///
/// Order matches HuggingFace's processor chain: presence penalty on raw
/// logits, then temperature, then top-k, then top-p, then min-p.
public struct Sampler {
    public var rngState: UInt64 = 0x9E37_79B9_7F4A_7C15
    public var valueOnlyTopK = false
    public var deviceDraw = false

    public init(seed: UInt64? = nil) {
        if let s = seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
    }

    public mutating func next(
        _ logits: MLXArray, params: SampleParams, generated: Set<Int>
    ) -> Int {
        var l = logits.reshaped([-1]).asType(.float32)
        if params.presencePenalty != 0 && !generated.isEmpty {
            // subtract penalty on already-generated tokens
            let ids = MLXArray(generated.sorted().map { Int32($0) })
            let current = take(l, ids, axis: 0)
            l = putAlong(l, ids, values: current - params.presencePenalty, axis: 0)
        }
        if params.temperature <= 0 {
            return argMax(l).item(Int.self)
        }
        l = l / params.temperature
        if params.topK > 0 && params.topK < l.dim(0) {
            let kth: MLXArray
            if valueOnlyTopK {
                // Only the threshold is needed, never the sort's indices.
                // Threshold ties still survive; CDF ordering and RNG are intact.
                kth = -partitioned(-l, kth: params.topK - 1)[params.topK - 1]
            } else {
                kth = takeAlong(
                    l, argPartition(-l, kth: params.topK - 1)[..<params.topK], axis: 0
                ).min()
            }
            l = which(l .< kth, MLXArray(-Float.infinity), l)
        }
        var probs = softmax(l, axis: -1)
        if params.topP < 1 {
            let order = argSort(-probs)
            let sorted = take(probs, order, axis: 0)
            let cum = cumsum(sorted, axis: 0)
            let keepSorted = (cum - sorted) .< params.topP  // keep until cumulative prob (exclusive) reaches topP
            var keep = MLXArray.zeros([probs.dim(0)], dtype: .bool)
            keep = putAlong(keep, order, values: keepSorted, axis: 0)
            probs = which(keep, probs, MLXArray(Float(0)))
        }
        if params.minP > 0 {
            let cutoff = probs.max() * params.minP
            probs = which(probs .< cutoff, MLXArray(Float(0)), probs)
        }
        // gumbel-free categorical: inverse CDF with a splitmix stream.
        // The draw is scaled by the unnormalized total instead of normalizing
        // the probabilities: it avoids a 0/0 when a filter empties the
        // candidate set, and since u < 1 it also guarantees u*total < total,
        // so the pick can never run off the end of the CDF onto a
        // zero-probability token the way a bare `cdf .< u` could.
        rngState = Splitmix.mix(rngState &+ 1)
        let u = Float(Double(rngState >> 11) / Double(1 << 53))
        let cdf = cumsum(probs, axis: 0)
        if deviceDraw {
            let total = cdf[probs.dim(0) - 1]
            let valid = isFinite(total) .&& (total .> MLXArray(Float(0)))
            // At zero, select the first strictly positive CDF. A lower-bound
            // search otherwise chooses a leading token with zero mass.
            let before = u == 0 ? cdf .<= MLXArray(Float(0)) : cdf .< (MLXArray(u) * total)
            let pick = minimum(before.sum(), MLXArray(probs.dim(0) - 1))
            let fallback = argMax(logits.reshaped([-1]).asType(.float32)).asType(pick.dtype)
            return which(valid, pick, fallback).item(Int.self)
        }
        let total = cdf[probs.dim(0) - 1].item(Float.self)
        guard total.isFinite, total > 0 else {
            // Nothing survived filtering (or the logits were NaN): fall back to
            // the most likely token rather than emitting token 0 forever.
            return argMax(logits.reshaped([-1]).asType(.float32)).item(Int.self)
        }
        let before = u == 0 ? cdf .<= MLXArray(Float(0)) : cdf .< MLXArray(u * total)
        let pick = before.sum().item(Int.self)
        return min(pick, probs.dim(0) - 1)
    }
}

public final class Generator {
    public let model: Qwen4ExpModel
    /// Tokens per prefill pass. Bigger is faster on long prompts: a chunk
    /// activates nearly every expert of every layer, so the expert stream is
    /// re-read roughly once per chunk and halving the chunk count halves the
    /// bytes moved. It costs transient activation memory, which is why it is a
    /// knob rather than "as large as the prompt". Measured in MEASUREMENTS.md.
    public var prefillChunk = PrefillTuning.chunk {
        didSet { if let ceiling = prefillBudgetCeiling { prefillChunk = min(max(1, prefillChunk), ceiling) } }
    }
    private var prefillBudgetCeiling: Int?
    package func setPrefillBudgetCeiling(_ ceiling: Int?) {
        prefillBudgetCeiling = ceiling
        if let ceiling { prefillChunk = min(max(1, prefillChunk), ceiling) }
    }
    /// Draft tokens per speculative round when the MTP head is enabled.
    /// Depth 1 by measurement (MEASUREMENTS M9). At 122 experts/layer, the
    /// size auto enables the head at, depth 1 reads ×1.17, depth 2 ×1.13 and
    /// depth 4 ×0.88; at 57/layer ×1.13 / ×1.12 / ×0.96. A k-token verify
    /// pass costs about 1 + 0.16k single passes with every expert resident
    /// and verified recurrent states are recorded for exact rollback.
    /// SLOTSTREAM_DRAFT_DEPTH overrides for experiments.
    public var draftDepth: Int = {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_DRAFT_DEPTH"],
            let n = Int(s), n >= 1, n <= 16 { return n }
        return 1
    }()
    /// Gate for the speculative path — `mtp-check` compares speculative
    /// against plain decode on the same loaded model by flipping this.
    public var speculationEnabled = true
    /// Optional observer, disabled in ordinary inference. A/B its overhead.
    public var footprintSampling = false
    /// Deterministic cost injection for state-transition diagnostics only.
    /// Does not change allocations, model values or request authority.
    package var adaptiveCostOverride: ((Double, Bool) -> Double)?
    /// `SLOTSTREAM_SWEEP_TRACE=1` prints where a sweep's prefill time went.
    static let sweepTrace = ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP_TRACE"] == "1"
    /// MLX buffer-cache cap in bytes while a prompt of `SweepTuning.minTokens`
    /// or more is read, nil for no cap. The engine sets it from the memory
    /// plan: 512 MB at targets of 12 GB and under, where the sweep's varying
    /// array sizes filling the 2 GB cache cost a 7,960-token prompt 1.7 GB of
    /// peak at the 8.1 GB floor (measured 7.4 against 9.1 GB); nothing above,
    /// where the cache is cheap and the cap costs about 6% of prefill.
    /// `SLOTSTREAM_PREFILL_CACHE_MB` overrides at any target.
    public var prefillCacheLimit: Int? = nil
    /// Called after every prefill pass with (tokens read this request, tokens
    /// this request will read, seconds elapsed). `run` and `serve` hang a
    /// PrefillProgressReporter here so a five-minute prompt does not look
    /// like a hang.
    public var onPrefillProgress: ((Int, Int, Double) -> Void)?
    /// Same progress plus the absolute already-consumed prefix. The original
    /// callback remains compatible for embedding clients.
    public var onPrefillProgressAbsolute: ((Int, Int, Double, Int) -> Void)?
    var sampler = Sampler()
    var rngState: UInt64 {
        get { sampler.rngState }
        set { sampler.rngState = newValue }
    }

    public init(model: Qwen4ExpModel) {
        self.model = model
    }

    func sample(_ logits: MLXArray, params: SampleParams, generated: Set<Int>) -> Int {
        sampler.next(logits, params: params, generated: generated)
    }

    /// Runs prefill + decode; calls `onToken` for each generated token id.
    /// Returns (tokenIds, stats). `stop` checked between tokens (cancellation).
    /// `cache`, when given, is consulted for a state this prompt extends and
    /// receives the state back at the end, holding exactly the ids it consumed.
    public func generate(
        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
        cache: PrefixCache? = nil, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int) -> Bool)? = nil
    ) -> ([Int], GenStats) {
        generate(promptIds: promptIds, params: params, eosIds: eosIds, cache: cache, vision: vision,
            shouldContinue: shouldContinue, onToken: onToken, request: nil)
    }

    public func generate(
        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
        cache: PrefixCache? = nil, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int) -> Bool)? = nil,
        request: RequestController?, onAdmitted: (() -> Bool)? = nil
    ) -> ([Int], GenStats) {
        let requestStart = RuntimeClock.now()
        let smallSweepStart = model.smallPrefillSweeps
        let originalSmallSweep = model.smallPrefillSweep
        let originalReferenceStart = model.smallPrefillReferenceStart
        let originalReferenceEnd = model.smallPrefillReferenceEnd
        let originalSmallRouting = model.stableSmallPrefillRouting
        let originalSmallAttention = model.stableSmallPrefillAttention
        let originalSmallProjections = model.stableSmallPrefillProjections
        let originalReferenceDispatch = model.alignSmallReferenceDispatch
        defer {
            model.smallPrefillSweep = originalSmallSweep
            model.smallPrefillReferenceStart = originalReferenceStart
            model.smallPrefillReferenceEnd = originalReferenceEnd
            model.stableSmallPrefillRouting = originalSmallRouting
            model.stableSmallPrefillAttention = originalSmallAttention
            model.stableSmallPrefillProjections = originalSmallProjections
            model.alignSmallReferenceDispatch = originalReferenceDispatch
        }
        let sharedPrelaunchStart = model.sharedExpertPrelaunches
        let rotationStart = model.fusedRoPERotationsScheduled
        let gdnProjectionStart = model.fusedGDNProjectionsScheduled
        let ropeHitStart = model.ropeTableHits
        let ropeBuildStart = model.ropeTableBuilds
        let residentPrelaunchStart = model.residentExpertPrelaunches
        let residentJoinsStart = model.residentExpertJoins
        let residentJoinStart = model.residentExpertJoinSeconds
        let terminalQueryStart = model.terminalQueryRowsSkipped
        let terminalMoEStart = model.terminalMoERowsSkipped
        let footprint = footprintSampling ? FootprintSampler() : nil
        let params = params.sanitized()
        sampler.valueOnlyTopK = model.optimizations.valueOnlySamplerThreshold
        sampler.deviceDraw = model.optimizations.deviceSamplerDraw
        if let s = params.seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
        var stats = GenStats()
        // The speculative loop borrows stats as inout. Its continuation
        // callback must record cancellation outside that exclusive borrow.
        var callerCancellation: RequestFailure?
        stats.promptTokens = promptIds.count
        let embeddingHitsStart = model.resident.embeddingRowHits
        let embeddingMissesStart = model.resident.embeddingRowMisses
        func finish(_ output: [Int]) -> ([Int], GenStats) {
            stats.smallPrefillSweeps = model.smallPrefillSweeps - smallSweepStart
            stats.embeddingRowsEnabled = model.resident.usesEmbeddingRows
            stats.embeddingRowHits = model.resident.embeddingRowHits - embeddingHitsStart
            stats.embeddingRowMisses = model.resident.embeddingRowMisses - embeddingMissesStart
            stats.embeddingCachedRows = model.resident.embeddingCachedRows
            stats.embeddingCachedPayloadBytes = model.resident.embeddingCachedPayloadBytes
            if let failure = request?.failure {
                stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
                stats.memoryPressureCancelled = failure.code == .insufficientMemory
            } else if let failure = callerCancellation {
                stats.requestFailure = failure
                stats.finishReason = "cancelled"
            } else if stats.requestFailure?.code == .clientCancelled {
                stats.finishReason = "cancelled"
            }
            return (output, stats)
        }
        stats.imagePreparation = vision?.preparationObservation
        stats.visionQueryTile = vision == nil ? 0 : model.optimizations.visionQueryTile
        stats.generatorVMBefore = footprintSampling ? ProcessMemory.vmActivity() : nil
        stats.generatorSystemBefore = footprintSampling ? ProcessMemory.operatingConditions() : nil
        // An empty prompt would leave `logits` at its placeholder value and make
        // the sampler invent a first token from nothing. Callers reject this at
        // the API boundary; this is the backstop.
        guard !promptIds.isEmpty else {
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.sampledFootprint = footprint?.finish()
            stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
            stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
            return finish([])
        }
        // Preserve the idle-pool guarantee even when a nonempty request is
        // rejected before state reservation or model preparation.
        defer { Stream.gpu.synchronize(); model.pool.unpinAll() }
        guard promptIds.count <= ContextPolicy.modelLimit,
              params.maxTokens <= ContextPolicy.modelLimit - promptIds.count else {
            let failure = RequestFailure(.contextLengthExceeded, "prompt plus output exceeds the model context limit")
            request?.fail(failure)
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.sampledFootprint = footprint?.finish()
            return finish([])
        }
        // A retained checkpoint may fork backing arrays. Its reservation is
        // real future work, so require physical headroom before taking it.
        let forkBytes = (cache?.heldCheckpoints ?? 0) > 0
            ? model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                mtp: speculationEnabled && model.mtpHead != nil) : 0
        do { try request?.check(nextAllocationBytes: ContextBytes.sum(PrefixCache.fixedBytesPerEntry, forkBytes), phase: "state reservation") }
        catch {
            stats.sampledFootprint = footprint?.finish()
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return finish([])
        }
        model.prepareOptimizationKernels()
        // Vision prompts are cacheable, but not on ids alone: every image
        // expands to a run of the same placeholder id, so a second picture of
        // the same shape produces identical ids. The image segments carry a
        // digest of the bytes behind each run, and `take` requires those to
        // agree as well; a swapped image therefore misses instead of resuming
        // a state built from the wrong pixels.
        let images = vision?.cacheSegments(attentionPadding: model.optimizations.visionAttentionPadding,
            queryTile: model.optimizations.visionQueryTile) ?? []
        // A hit hands over the state and the count of prompt tokens it already
        // consumed; a miss evicts enough LRU state before this allocation to
        // keep retained + active state inside the shared bounds (PrefixCache).
        let checkpointHitsBefore = cache?.checkpointHits ?? 0
        let completeKey = model.optimizations.completePromptCheckpoint
            ? PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                prefillChunk: prefillChunk, mtp: speculationEnabled && model.mtpHead != nil) : nil
        let hit = cache?.takeForGeneration(
            matching: promptIds, images: images,
            reserveTokens: promptIds.count + params.maxTokens,
            reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                mtp: speculationEnabled && model.mtpHead != nil), completePromptKey: completeKey,
            modelIdentity: model.promptCheckpointIdentity)
        let state = hit?.state ?? model.makeState()
        let reused = hit?.reused ?? 0
        let stateKnowsMTP = hit == nil || state.hasValidMTP
        let mtpHead = speculationEnabled && stateKnowsMTP ? model.mtpHead : nil
        model.smallPrefillReferenceStart = reused
        model.smallPrefillReferenceEnd = promptIds.count
        var smallReferenceStart: Int?
        func checkAllocation(end: Int, draftEnd: Int? = nil, workspaceBytes: Int = 0, phase: String) throws {
            let allocated = model.sequenceAllocationBytes(tokens: end, draftTokens: draftEnd, state: state,
                sharedBacking: (cache?.heldCheckpoints ?? 0) > 0 || hit?.logits != nil)
            let (bytes, overflow) = allocated.addingReportingOverflow(workspaceBytes)
            try request?.check(nextAllocationBytes: overflow ? Int.max : bytes, phase: phase)
        }
        let canContinue: () -> Bool = {
            // Sampling and cancellation checks do not imply a forward. Each
            // actual prefill, decode or speculative allocation is priced at
            // its real end position immediately before that work starts.
            do { try request?.check(phase: "inference boundary") }
            catch { return false }
            if shouldContinue?() == false {
                let failure = request?.failure ?? RequestFailure(.clientCancelled, "inference was cancelled by its caller")
                request?.fail(failure)
                callerCancellation = failure
                return false
            }
            return true
        }
        do {
            try request?.admit(missingTokens: promptIds.count - reused, from: reused,
                maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)
            let initialEnd = min(promptIds.count, reused + prefillChunk)
            try checkAllocation(end: initialEnd, draftEnd: mtpHead != nil ? max(0, initialEnd - 1) : nil,
                phase: "initial state allocation")
            if onAdmitted?() == false {
                request?.cancel()
                stats.sampledFootprint = footprint?.finish()
                return finish([])
            }
        } catch {
            stats.sampledFootprint = footprint?.finish()
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return finish([])
        }
        stats.reusedPrefixTokens = reused
        stats.prefixCheckpointForks = (cache?.checkpointHits ?? 0) - checkpointHitsBefore
        stats.completePromptHits = hit?.logits == nil ? 0 : 1
        MLX.Memory.peakMemory = 0
        // Zero before prefill, not only after: otherwise these carry the
        // previous request's decode phase into this request's prefill split.
        model.pool.resetStats()
        model.ngram.resetStats()
        model.ngram.resetObservation()

        // ---- prefill in chunks (only the tokens the state has not consumed)
        // With the MTP draft head enabled, every chunk also flows through the
        // head so its attention cache covers the whole prompt: the entry for
        // token i fuses the previous position's multi stream with token i's
        // embedding, keeping the invariant mtp.offset == tokenCount - 1.
        // A state handed back by the cache that a plain-path request built
        // has no draft cache to extend; finish that request plain rather than
        // speculating over a misaligned head (unreachable in serve, where the
        // mode is fixed per process; the A/B tools flip it per request).
        // Vision prompts speculate too now: the head's prefill consumption
        // splices the tower's rows at the placeholder positions (MTPHead's
        // `spliceVisionEmbeds`), so its cache is built on the embeddings the
        // main model actually saw. A state produced by a plain vision request
        // still runs plain, since its head cache would claim positions the
        // main state no longer matches.
        if mtpHead != nil && state.mtp == nil { state.mtp = MTPState() }
        if mtpHead == nil { state.invalidateMTP() }
        // Vision: the tower runs here and not at tokenize time, so an image the
        // reused prefix already covers costs nothing at all. What comes back is
        // one run per image still needing a splice, at absolute prompt offsets,
        // which each chunk clips to its own window. The offsets come from the
        // segments rather than from a scan for placeholder ids, so the reused
        // head is skipped for free.
        // A sweep allocates arrays whose sizes vary from group to group, and
        // MLX's buffer cache keeps every freed size up to its limit, so by the
        // end of a long prompt the cache alone held its whole 2 GB (measured
        // 2.16 GB) on top of the pass. Where memory is tight the engine caps
        // it while the prompt is read (`prefillCacheLimit`); decode's small,
        // uniform working set gets the full cache back.
        let savedCacheLimit = MLX.Memory.cacheLimit
        defer { MLX.Memory.cacheLimit = savedCacheLimit }
        if let cap = prefillCacheLimit, promptIds.count - reused >= SweepTuning.minTokens {
            MLX.Memory.cacheLimit = min(savedCacheLimit, cap)
        }
        let imageStart = RuntimeClock.now()
        let visionRuns: [VisionRun]
        do {
            visionRuns = try vision?.runsChecked(consumedTokens: reused, deduplicate: model.optimizations.deduplicateImages,
                attentionPadding: model.optimizations.visionAttentionPadding,
                queryTile: model.optimizations.visionQueryTile, request: request) ?? []
        } catch {
            Stream.gpu.synchronize()
            model.pool.unpinAll()
            model.pool.admitOnSweep = false
            stats.runtimeError = "image preprocessing failed: \(error)"
            stats.visionQueryTileCalls = vision?.executedQueryTiles ?? 0
            stats.finishReason = "error"
            stats.imageEncodeSeconds = RuntimeClock.seconds(since: imageStart)
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.sampledFootprint = footprint?.finish()
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
            stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
            return finish([])
        }
        // The tower evaluates each transformer block, but its final merger is
        // lazy. Complete it here so image time includes the whole encoder and
        // prefill time does not silently absorb the last image projection.
        if !visionRuns.isEmpty { eval(visionRuns.map(\.rows)) }
        stats.imageEncodeSeconds = RuntimeClock.seconds(since: imageStart)
        stats.encodedImages = vision?.encodedImages ?? 0
        stats.visionQueryTileCalls = vision?.executedQueryTiles ?? 0
        stats.reusedImageFeatures = vision?.reusedImageFeatures ?? 0
        stats.prefixSkippedImages = vision?.prefixSkippedImages ?? 0
        var t0 = RuntimeClock.now()
        var logits: MLXArray = hit?.logits ?? MLXArray(0)
        var i = reused
        func discardFailedState(_ error: Error) {
            // Read workers are already joined by the checked stores. Complete
            // previously queued, valid pool copies and GPU readers before
            // releasing pins. This request state is never returned to cache.
            model.pool.commitAdmissions()
            Stream.gpu.synchronize()
            model.pool.unpinAll()
            model.pool.admitOnSweep = false
            state.setRecording(false)
            state.invalidateMTP()
            stats.runtimeError = "model execution failed: \(error)"
            stats.finishReason = "error"
        }
        func progress(_ done: Int, _ elapsed: Double) {
            onPrefillProgress?(done, promptIds.count - reused, elapsed)
            onPrefillProgressAbsolute?(done, promptIds.count - reused, elapsed, reused)
        }
        if i < promptIds.count { progress(0, 0) }
        var cancelledPrefill = false
        while i < promptIds.count {
            if cancelledPrefill || !canContinue() {
                MLX.Memory.cacheLimit = savedCacheLimit
                stats.finishReason = "stop"
                stats.prefillTokens = i - reused
                stats.prefillSeconds = RuntimeClock.seconds(since: t0)
                stats.peakMemoryGB = ProcessMemory.peakResidentGB
                stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
                stats.prefillRecords = model.pool.recordsFetched
                stats.prefillLocalVictims = model.pool.floorLocalVictims
                stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
                stats.allocatedSequenceBytes = state.allocatedSequenceBytes
                stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
                stats.sampledFootprint = footprint?.finish()
                stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
                stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
                model.pool.admitOnSweep = false
                // Each completed chronological pass is a whole-stack commit.
                // Publish only that boundary; a partial image keeps its digest
                // and consumed span, never identities of future images.
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                if request?.mayRetainState != false, i > 0, state.tokenCount == i {
                    let committedImages = images.compactMap { image -> ImageSegment? in
                        guard image.start < i else { return nil }
                        return ImageSegment(start: image.start, count: min(image.count, i - image.start),
                            hash: image.hash, preparationIdentity: image.preparationIdentity)
                    }
                    cache?.store(state: state, tokens: Array(promptIds.prefix(i)), images: committedImages)
                }
                stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
                stats.cachedRouterBytes = model.cachedRouterBytes
                stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
                stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
                return finish([])
            }
            // Shape changes retain the measured envelope and are qualified
            // against the rechunking numerical contract, not assumed exact.
            var passes = model.optimizations.readScopeEnabled
                ? PrefillSchedule.scopePasses(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, maxScope: model.optimizations.readScopeTokens,
                    tailAware: model.optimizations.tailAwarePrefill)
                : [PrefillSchedule.next(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)]
            model.smallPrefillSweep = PrefillSchedule.chunk(at: i, maxChunk: 256) < 256
            if model.smallPrefillSweep {
                model.stableSmallPrefillRouting = true
                model.stableSmallPrefillAttention = true
                model.stableSmallPrefillProjections = true
                model.alignSmallReferenceDispatch = true
                stats.contextArithmetic = "reference-256-v1"
                // Larger or odd earlier passes need not end at an absolute
                // multiple of 256. This phase's first missing row is its
                // reference origin, including when it starts from a cache hit.
                if smallReferenceStart == nil { smallReferenceStart = i }
                model.smallPrefillReferenceStart = smallReferenceStart!
                let count = ContextWorkspace.boundedSmallPass(requested: passes.first ?? 0, at: i,
                    referenceStart: model.smallPrefillReferenceStart, referenceEnd: promptIds.count)
                passes = count > 0 ? [count] : []
            }
            let hi = i + passes.reduce(0, +)
            do {
                var at = i, workspace = 0
                for pass in passes {
                    at += pass
                    workspace = max(workspace, ContextWorkspace.prefillBytes(pass: pass, context: at,
                        attentionHeads: model.cfg.numAttentionHeads,
                        referenceStart: model.smallPrefillReferenceStart, referenceEnd: promptIds.count,
                        minimumProjectionRows: model.smallPrefillSweep && model.stableSmallPrefillProjections ? 256 : 0,
                        padSmallQueries: model.smallPrefillSweep && model.stableSmallPrefillAttention))
                }
                workspace = ContextBytes.sum(workspace, ContextBytes.product(max(0, hi - i - (passes.max() ?? 0)), 32_768))
                try checkAllocation(end: hi, draftEnd: mtpHead != nil ? max(0, hi - 1) : nil,
                    workspaceBytes: workspace, phase: "prefill pass")
            } catch { cancelledPrefill = true; continue }
            guard hi > i else {
                request?.fail(RequestFailure(.contextLengthExceeded, "no bounded prefill pass fits the remaining model context"))
                cancelledPrefill = true; continue
            }
            // Only the last pass warms the pool with the prompt's hot experts
            // (sweep admission); no other pass may evict what decode was using.
            model.pool.admitOnSweep = hi == promptIds.count
            let chunk = Array(promptIds[i ..< hi])
            let chunkVision = visionRuns.compactMap { $0.clipped(to: i, hi) }
            do {
            if model.optimizations.readScopeEnabled, passes.count > 1 {
                let result = try model.consumeReadScopeChecked(chunk, passes: passes, state: state,
                    vision: chunkVision, head: mtpHead, final: hi == promptIds.count,
                    shouldContinue: canContinue)
                if !result.committed {
                    stats.abortedReadScopes += 1
                    cancelledPrefill = true
                    continue
                }
                if let value = result.logits { logits = value }
            } else if let head = mtpHead {
                let (mixed, multi) = try model.hiddenStatesWithMultiChecked(chunk, state: state, vision: chunkVision)
                state.lastMulti = try head.consumeChecked(
                    chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                    resident: model.resident, rope: model.rope, state: state.mtp!,
                    vision: chunkVision, compactRetainedRow: model.optimizations.compactMTPRow)
                if hi == promptIds.count {
                    logits = model.lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...])
                    eval(logits)
                } else if !model.optimizations.demandedPrefillOutput {
                    eval(mixed)
                }
            } else if hi == promptIds.count {
                logits = try model.lastLogitsChecked(chunk, state: state, vision: chunkVision)
                eval(logits)
            } else if model.optimizations.demandedPrefillOutput {
                try model.consumePromptChecked(chunk, state: state, vision: chunkVision)
            } else {
                let h = try model.hiddenStatesChecked(chunk, state: state, vision: chunkVision)
                eval(h)
            }
            try request?.check(phase: "prefill commit")
            } catch {
                discardFailedState(error)
                if model.optimizations.readScopeEnabled, passes.count > 1 { stats.abortedReadScopes += 1 }
                stats.prefillTokens = i - reused
                stats.prefillSeconds = RuntimeClock.seconds(since: t0)
                stats.prefillIOSeconds = model.pool.ioSeconds
                stats.prefillScatterSeconds = model.pool.scatterSeconds
                stats.prefillRecords = model.pool.recordsFetched
                stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
                stats.allocatedSequenceBytes = state.allocatedSequenceBytes
                stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
                stats.peakMemoryGB = ProcessMemory.peakResidentGB
                stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
                stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
                stats.sampledFootprint = footprint?.finish()
                stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
                stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
                stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
                return finish([])
            }
            stats.prefillPasses.append(chunk.count)
            stats.prefillComputePasses.append(contentsOf: passes)
            var keyEnd = i
            for pass in passes {
                keyEnd += pass
                stats.prefillComputeQueryRows.append(model.smallPrefillSweep && model.stableSmallPrefillAttention
                    ? ContextWorkspace.queryRows(pass: pass, context: keyEnd,
                        referenceStart: model.smallPrefillReferenceStart, referenceEnd: model.smallPrefillReferenceEnd) : pass)
                stats.prefillComputeKeyExtents.append(model.smallPrefillSweep && model.stableSmallPrefillAttention
                    ? ContextWorkspace.keyExtent(pass: pass, context: keyEnd,
                        referenceStart: model.smallPrefillReferenceStart, referenceEnd: model.smallPrefillReferenceEnd) : keyEnd)
            }
            i = hi
            if let cache, i == model.optimizations.prefixCheckpointTokens,
               reused < i, i < promptIds.count {
                // Only an existing whole-stack commit is eligible. Do not
                // split/rebatch a pass merely to manufacture this boundary.
                do {
                    let retained = try cache.storeReusableCheckpoint(state: state,
                        tokens: Array(promptIds.prefix(i)), images: images,
                        reserveTokens: promptIds.count + params.maxTokens,
                        reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                            mtp: mtpHead != nil))
                    if retained { stats.prefixCheckpointStores += 1 }
                    else { stats.prefixCheckpointRefusals += 1 }
                } catch {
                    // Optional retention must not publish an invalid state or
                    // fail an otherwise valid forward. The miss stays visible.
                    stats.prefixCheckpointErrors += 1
                }
            }
            progress(i - reused, RuntimeClock.seconds(since: t0))
        }
        if reused < promptIds.count, let cache, let completeKey {
            // Reuse the actual complete prefill boundary, without splitting
            // or replaying a pass. State alone cannot supply the first token;
            // retain its compact raw logits too, before any sampling mutation.
            do {
                // A strict-prefix hit can have been produced without a draft
                // state. That request deliberately finishes plain; stamp the
                // mode actually used, so a later MTP request rebuilds its head.
                let producedKey = PromptCheckpointKey(model: completeKey.model,
                    optimizations: completeKey.optimizations, prefillChunk: completeKey.prefillChunk,
                    mtp: mtpHead != nil, contextArithmetic: completeKey.contextArithmetic)
                let retained = try cache.storeCompletePrompt(state: state, tokens: promptIds, images: images,
                    reserveTokens: promptIds.count + params.maxTokens,
                    reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                        mtp: mtpHead != nil), logits: logits, vocabularySize: model.cfg.vocabSize, key: producedKey)
                if retained { stats.completePromptStores += 1 }
                else { stats.prefixCheckpointRefusals += 1 }
            } catch { stats.prefixCheckpointErrors += 1 }
        }
        MLX.Memory.cacheLimit = savedCacheLimit
        model.pool.admitOnSweep = false
        // The new projection shape applies only while consuming missing
        // prompt rows. Ordinary decode and speculative verification retain
        // their established arithmetic even after a long-context prefill.
        model.smallPrefillSweep = false
        stats.prefillTokens = promptIds.count - reused
        stats.prefillSeconds = RuntimeClock.seconds(since: t0)
        stats.prefillIOSeconds = model.pool.ioSeconds
        stats.prefillScatterSeconds = model.pool.scatterSeconds
        stats.prefillRecords = model.pool.recordsFetched
        stats.prefillLocalVictims = model.pool.floorLocalVictims
        stats.prefillSlotSliceBatches = model.pool.slotSliceBatches
        stats.prefillSlotWordBatches = model.pool.slotWordBatches
        stats.prefillSlotCPUBatches = model.pool.slotCPUBatches
        stats.prefillMLXActiveBytes = MLX.Memory.activeMemory
        stats.prefillMLXCacheBytes = MLX.Memory.cacheMemory
        stats.prefillPhysicalFootprintBytes = ProcessMemory.residentBytes()
        stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
        stats.prefillGPUWaitSeconds = model.pool.sweepWaitSeconds
        stats.prefillRowSortSeconds = model.pool.sweepSortSeconds
        if Self.sweepTrace {
            let line = String(
                format: "sweep trace: io %.2fs, gpu wait %.2fs, row sort %.2fs, pool copies %.2fs, "
                    + "mlx peak %.2f GB, mlx cache %.2f GB\n",
                model.pool.ioSeconds, model.pool.sweepWaitSeconds, model.pool.sweepSortSeconds,
                model.pool.scatterSeconds, Double(MLX.Memory.peakMemory) / 1e9,
                Double(MLX.Memory.cacheMemory) / 1e9)
            FileHandle.standardError.write(line.data(using: .utf8)!)
        }
        model.pool.resetStats()
        model.ngram.resetStats()

        // ---- decode
        var out: [Int] = []
        var generated = Set<Int>()
        var reason = "length"
        // Exactly the ids `state` has consumed, tracked rather than inferred:
        // a token is sampled before it is fed, so both break paths below leave
        // the last one unconsumed and it must not be claimed.
        var consumed = promptIds
        t0 = RuntimeClock.now()
        var firstToken: Double?
        var callbackSeconds = 0.0
        var lastTokenAt: UInt64?
        var interTokenSeconds: [Double] = []
        let observedToken: (Int) -> Bool = { tok in
            request?.sampledFirstToken()
            if firstToken == nil { firstToken = RuntimeClock.seconds(since: requestStart) }
            if let previous = lastTokenAt { interTokenSeconds.append(RuntimeClock.seconds(since: previous)) }
            lastTokenAt = RuntimeClock.now()
            let start = RuntimeClock.now()
            let result = onToken?(tok) ?? true
            callbackSeconds += RuntimeClock.seconds(since: start)
            return result
        }
        do {
        if let head = mtpHead, speculationEnabled, let mtpState = state.mtp {
            try speculativeDecode(
                head: head, mtpState: mtpState, state: state, logits: logits,
                params: params, eosIds: eosIds, shouldContinue: canContinue,
                contextLimit: request?.configuration.maxContextTokens ?? ContextPolicy.modelLimit,
                checkAllocation: { main, draft, workspace, phase in
                    try checkAllocation(end: main, draftEnd: draft, workspaceBytes: workspace, phase: phase)
                },
                onToken: observedToken, out: &out, generated: &generated,
                reason: &reason, consumed: &consumed, stats: &stats)
        } else {
            state.invalidateMTP()
            for _ in 0 ..< max(0, params.maxTokens) {
                if !canContinue() { reason = "stop"; break }
                let sampleStart = RuntimeClock.now()
                let tok = sample(logits, params: params, generated: generated)
                stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                if eosIds.contains(tok) { reason = "stop"; break }
                out.append(tok)
                generated.insert(tok)
                // The callback stops the run for a stop sequence or a gone client.
                if !observedToken(tok) { reason = "stop"; break }
                if model.optimizations.skipUnusedFinalForward, out.count == params.maxTokens { break }
                try checkAllocation(end: state.tokenCount + 1, workspaceBytes: 1_300_000, phase: "decode cache growth")
                logits = try model.lastLogitsChecked([tok], state: state)
                stats.decodeForwardPasses += 1
                stats.decodeModelTokens += 1
                consumed.append(tok)
                eval(logits)
            }
        }
        } catch {
            discardFailedState(error)
            reason = "error"
        }
        if stats.runtimeError == nil, request?.mayRetainState != false { cache?.store(state: state, tokens: consumed, images: images) }
        stats.finishReason = reason
        stats.decodeTokens = out.count
        stats.decodeSeconds = RuntimeClock.seconds(since: t0)
        stats.firstTokenSeconds = firstToken
        stats.tokenCallbackSeconds = callbackSeconds
        stats.interTokenSeconds = interTokenSeconds
        stats.expertHitRate = model.pool.hitRate
        // The pool's counters were reset after prefill, so these cover decode
        // only.
        stats.decodeIOSeconds = model.pool.ioSeconds
        stats.decodeScatterSeconds = model.pool.scatterSeconds
        stats.decodeRecords = model.pool.recordsFetched
        stats.decodeLocalVictims = model.pool.floorLocalVictims
        stats.decodeSlotSliceBatches = model.pool.slotSliceBatches
        stats.decodeSlotSliceRuns = model.pool.slotSliceRuns
        stats.decodeSlotScatterBatches = model.pool.slotScatterBatches
        stats.decodeSlotWordBatches = model.pool.slotWordBatches
        stats.decodeSlotWordBuffers = model.pool.slotWordBuffers
        stats.decodeSlotCPUBatches = model.pool.slotCPUBatches
        stats.decodeReadBytes = model.pool.recordsFetched * model.pool.recordBytes
        stats.ngramRowHits = model.ngram.rowHits
        stats.ngramRowMisses = model.ngram.rowMisses
        stats.ngramLookaheadRows = model.ngram.lookaheadRowsConsumed
        stats.ngramLookaheadDiscarded = model.ngram.lookaheadTicketsDiscarded
        stats.ngramLookaheadWaitSeconds = model.ngram.lookaheadWaitSeconds
        stats.ngramPrefetchSeconds = model.ngram.prefetchSeconds
        stats.allocatedSequenceBytes = state.allocatedSequenceBytes
        stats.ngramCachedRows = model.ngram.cachedRowCount
        stats.cachedRouterBytes = model.cachedRouterBytes
        stats.ngramCachePayloadBytes = model.ngram.cachedPayloadBytes
        stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
        stats.peakMemoryGB = ProcessMemory.peakResidentGB
        stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
        stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
        stats.mlxActiveEndBytes = MLX.Memory.activeMemory
        stats.mlxCacheEndBytes = MLX.Memory.cacheMemory
        stats.sampledFootprint = footprint?.finish()
        stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
        stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
        stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
        stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
        return finish(out)
    }
}

extension Generator {
    /// Hard cap bounds recording memory even if an embedding client assigns
    /// an arbitrary public depth. A terminal target output needs no draft.
    public static func effectiveDraftDepth(requested: Int, remainingOutputs: Int, bounded: Bool) -> Int {
        let depth = min(16, max(1, requested))
        return bounded ? min(depth, max(0, remainingOutputs - (remainingOutputs > 0 ? 1 : 0))) : depth
    }

    /// Self-speculative decode with the MTP draft head. One round:
    ///
    ///   1. draft `draftDepth` tokens greedily by chaining the head
    ///      (each step fuses the previous multi stream with the previous
    ///      token's embedding — "scheme A"),
    ///   2. verify them in one batched main-model pass, whose measured cost
    ///      grows with the number of positions,
    ///   3. sample sequentially from the verified logits with the plain
    ///      loop's exact semantics — same rng draw order, same presence
    ///      penalty evolution, drawing ONLY for tokens the plain loop would
    ///      have sampled, so the sampler stream never desyncs,
    ///   4. reconcile: the verify pass consumed all k+1 tokens; if some were
    ///      rejected, roll the state back (zero-copy checkpoint — recurrent
    ///      arrays are replaced, never mutated; KV rolls back by offset).
    ///      Recorded target states avoid replaying accepted target tokens;
    ///      only draft entries with provisional hidden inputs need rebuilding.
    ///
    /// Every emitted token's logits still come from the main model, so this
    /// changes WHAT computes the logits (batched passes instead of
    /// single-token passes), not the sampling rule. Batch shape changes move
    /// logits within the same floating-point envelope as prefill re-chunking
    /// (see MEASUREMENTS on the prefix cache); `mtp-check` gates on that.
    func speculativeDecode(
        head: MTPHead, mtpState: MTPState, state: Qwen4ExpModel.State,
        logits: MLXArray, params: SampleParams, eosIds: Set<Int>,
        shouldContinue: (() -> Bool)?, contextLimit: Int,
        checkAllocation: (Int, Int?, Int, String) throws -> Void, onToken: ((Int) -> Bool)?,
        out: inout [Int], generated: inout Set<Int>, reason: inout String,
        consumed: inout [Int], stats: inout GenStats
    ) throws {
        // The first token comes off the prefill logits exactly like the
        // plain loop's first iteration.
        var pending: Int? = nil
        var policy = model.optimizations.adaptiveSpeculation ? AdaptiveSpeculationPolicy(maximumDepth: draftDepth) : nil
        if params.maxTokens > 0 {
            if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; return }
            let sampleStart = RuntimeClock.now()
            let tok = sample(logits, params: params, generated: generated)
            stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
            if eosIds.contains(tok) { reason = "stop"; return }
            out.append(tok)
            generated.insert(tok)
            if let cb = onToken, !cb(tok) { reason = "stop"; return }
            pending = tok
        }

        while let p = pending, out.count < params.maxTokens {
            if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; break }
            let action = policy?.action(contextTokens: state.tokenCount)
            if action == .plain {
                stats.adaptiveDraftDepths.append(-1)
                stats.adaptiveDisabledAtOutput = out.count
                // A disabled head cannot be resumed from a stale cache. The
                // already-emitted pending token is consumed exactly once.
                state.invalidateMTP()
                var tokenToConsume = p
                while out.count < params.maxTokens {
                    if shouldContinue?() == false { reason = "stop"; break }
                    try checkAllocation(state.tokenCount + 1, nil, 1_300_000, "plain decode cache growth")
                    let nextLogits = try model.lastLogitsChecked([tokenToConsume], state: state)
                    consumed.append(tokenToConsume)
                    eval(nextLogits)
                    stats.decodeForwardPasses += 1; stats.decodeModelTokens += 1
                    let sampleStart = RuntimeClock.now()
                    let token = sample(nextLogits, params: params, generated: generated)
                    stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                    if eosIds.contains(token) { reason = "stop"; break }
                    out.append(token); generated.insert(token)
                    stats.adaptivePlainTokens += 1
                    if onToken?(token) == false { reason = "stop"; break }
                    tokenToConsume = token
                }
                return
            }
            let emittedBefore = out.count, sampleBefore = stats.sampleSeconds
            let draftBefore = stats.draftSeconds, verifyBefore = stats.verifySeconds
            let reconcileBefore = stats.reconciliationSeconds
            let ck = state.checkpoint()

            // ---- draft (greedy chain; provisional MTP cache entries)
            var drafts: [Int] = []
            let draftStart = RuntimeClock.now()
            var dMulti = state.lastMulti!
            var dTok = p
            let requestedDepth: Int
            if case .draft(let depth) = action { requestedDepth = depth }
            else { requestedDepth = draftDepth }
            let requestedAvailable = action == .calibrate ? 0 : Self.effectiveDraftDepth(requested: requestedDepth,
                remainingOutputs: params.maxTokens - out.count,
                bounded: model.optimizations.boundedDraftTail || policy != nil)
            // Provisional verification must fit the same total context as
            // committed tokens, even when legacy draft-tail bounding is off.
            let availableDepth = ContextPolicy.maximumDraftDepth(requested: requestedAvailable,
                at: state.tokenCount, limit: contextLimit)
            if policy != nil { stats.adaptiveDraftDepths.append(availableDepth) }
            var draftCancelled = false
            for _ in 0 ..< availableDepth {
                if shouldContinue?() == false { draftCancelled = true; break }
                try checkAllocation(state.tokenCount, mtpState.offset + 1, 1_300_000, "draft cache growth")
                let e = try model.resident.embedChecked([dTok], shape: [1, 1]).asType(.bfloat16)
                let (s, m) = head(embedded: e, hiddenMulti: dMulti, rope: model.rope, state: mtpState)
                let dl = model.lmHead(s)
                dTok = argMax(dl.reshaped([-1]).asType(.float32)).item(Int.self)
                drafts.append(dTok)
                dMulti = m
            }
            stats.draftedTokens += drafts.count
            stats.draftSeconds += RuntimeClock.seconds(since: draftStart)
            if draftCancelled || shouldContinue?() == false {
                try state.restoreChecked(ck); state.setRecording(false)
                reason = "stop"; break
            }

            // ---- one batched verify pass over pending + drafts, recording
            // the recurrent state after every position so a rejection can
            // roll back to the kept prefix without re-running it.
            let verifyIds = [p] + drafts
            let verifyEnd = state.tokenCount + verifyIds.count
            try checkAllocation(verifyEnd, mtpState.offset,
                ContextWorkspace.prefillBytes(pass: verifyIds.count, context: verifyEnd), "speculative verification")
            let verifyStart = RuntimeClock.now()
            state.setRecording(true)
            let (vLogits, vMulti) = try model.allLogitsWithMultiChecked(verifyIds, state: state)
            eval(vLogits, vMulti)
            stats.verifyPasses += 1
            stats.decodeForwardPasses += 1
            stats.decodeModelTokens += verifyIds.count
            stats.verifySeconds += RuntimeClock.seconds(since: verifyStart)

            // ---- sequential acceptance
            var good = 0  // accepted drafts == generation tokens consumed beyond p
            var nextPending: Int? = nil
            for i in 0 ... drafts.count {
                if out.count >= params.maxTokens { break }  // reason stays "length"
                if shouldContinue?() == false { reason = "stop"; break }
                let sampleStart = RuntimeClock.now()
                let tok = sample(
                    vLogits[0..., i ..< (i + 1), 0...], params: params, generated: generated)
                stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                if eosIds.contains(tok) { reason = "stop"; break }
                out.append(tok)
                generated.insert(tok)
                if let cb = onToken, !cb(tok) { reason = "stop"; break }
                if i < drafts.count && tok == drafts[i] {
                    good += 1
                    continue
                }
                nextPending = tok  // the rejection correction, or the bonus token
                break
            }
            stats.acceptedDrafts += good

            // ---- reconcile the state with what was actually kept: roll the
            // recurrent caches back to the recorded state at the last kept
            // position, trim the attention caches, and slice the pass's own
            // multi stream (causal, so its first keep.count positions are
            // exactly the kept tokens' stream). No re-run.
            let reconcileStart = RuntimeClock.now()
            let keep = [p] + Array(drafts[0 ..< good])
            try checkAllocation(ck.tokenCount + keep.count, ck.mtpOffset + keep.count,
                ContextBytes.product(keep.count, 1_300_000), "draft reconciliation")
            try state.rollbackChecked(
                keeping: keep.count, of: verifyIds, from: ck, ngramWindow: model.cfg.ngramSize - 1)
            let passMulti = keep.count == verifyIds.count
                ? vMulti : vMulti[0..., 0 ..< keep.count, 0...]
            if model.optimizations.reuseFirstMTPEntry && !drafts.isEmpty {
                // The first draft-cache entry uses the true checkpoint multi
                // and pending token. Later entries used provisional multis.
                mtpState.trim(to: ck.mtpOffset + 1)
                let first = passMulti[0..., 0 ..< 1, 0...]
                state.lastMulti = model.optimizations.compactMTPRow ? contiguous(first) : first
                eval(state.lastMulti!)
                stats.reusedHeadTokens += 1
                if keep.count > 1 {
                    state.lastMulti = try head.consumeChecked(chunk: Array(keep.dropFirst()),
                        chunkMulti: passMulti[0..., 1 ..< keep.count, 0...], prevMulti: state.lastMulti,
                        resident: model.resident, rope: model.rope, state: mtpState,
                        compactRetainedRow: model.optimizations.compactMTPRow)
                    stats.reconciledHeadTokens += keep.count - 1
                }
            } else {
                mtpState.trim(to: ck.mtpOffset)
                state.lastMulti = try head.consumeChecked(
                    chunk: keep, chunkMulti: passMulti, prevMulti: ck.lastMulti,
                    resident: model.resident, rope: model.rope, state: mtpState,
                    compactRetainedRow: model.optimizations.compactMTPRow)
                stats.reconciledHeadTokens += keep.count
            }
            consumed.append(contentsOf: keep)
            stats.reconciliationSeconds += RuntimeClock.seconds(since: reconcileStart)
            // The draft cache holds one entry per consumed token except the
            // first. A drift here silently degrades every later draft, so
            // fail loud instead.
            precondition(
                mtpState.offset == state.tokenCount - 1,
                "mtp cache misaligned: \(mtpState.offset) entries at \(state.tokenCount) tokens")
            pending = nextPending
            if reason == "stop" { break }
            if policy != nil, out.count > emittedBefore {
                let targetCost = stats.verifySeconds - verifyBefore + stats.sampleSeconds - sampleBefore
                if action == .calibrate {
                    policy?.observePlain(seconds: adaptiveCostOverride?(targetCost, false) ?? targetCost,
                        contextTokens: state.tokenCount)
                } else if !drafts.isEmpty {
                    let totalCost = targetCost + stats.draftSeconds - draftBefore + stats.reconciliationSeconds - reconcileBefore
                    policy?.observeDraft(seconds: adaptiveCostOverride?(totalCost, true) ?? totalCost,
                        emitted: out.count - emittedBefore, drafted: drafts.count, accepted: good)
                }
            }
        }
    }
}

/// Prefill chunking. Overridable so the size can be measured and so a small
/// machine can trade prefill speed for transient memory.
public enum PrefillTuning {
    public static var chunk: Int {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"],
            let n = Int(s), n > 0
        {
            return min(n, 4096)
        }
        return 256
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/Layers.swift` — 77861 bytes, SHA-256 `1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120`.

````text
// qwen4_exp blocks, ported 1:1 from the vendored reference implementation
// (Tools/reference/qwen4_exp.py). Weights come from ResidentWeights (trunk)
// and SlotPool/NgramStore (streamed).

import Foundation
import MLX
import MLXFast
import MLXNN

// MARK: - norms

/// RMSNorm; with groupSize set, statistics are computed per group of `groupSize`
/// (hyper-connections normalize each of the hc streams separately).
struct RMSNorm {
    let weight: MLXArray
    let eps: Float
    let groupSize: Int?

    func callAsFunction(_ x: MLXArray, compiledFinish: Bool = false) -> MLXArray {
        guard let g = groupSize else {
            return MLXFast.rmsNorm(x, weight: weight, eps: eps)
        }
        let shape = x.shape
        var v = x.reshaped(Array(shape.dropLast()) + [-1, g])
        let vf = v.asType(.float32)
        if compiledFinish, CompiledArithmetic.prepare() {
            let result = CompiledArithmetic.execute(v, meanSquare: vf.square().mean(axis: -1, keepDims: true),
                weight: weight.reshaped([-1, g]), epsilon: eps)
            return result.reshaped(shape)
        }
        v = (vf * rsqrt(vf.square().mean(axis: -1, keepDims: true) + eps)).asType(x.dtype)
        return v.reshaped(shape) * weight
    }
}

/// Gated RMSNorm used by GDN output (sigmoid gate for this model).
struct RMSNormGated {
    let weight: MLXArray
    let eps: Float
    let sigmoidGate: Bool

    func callAsFunction(_ x: MLXArray, gate: MLXArray) -> MLXArray {
        let out = MLXFast.rmsNorm(x, weight: weight, eps: eps)
        let gf = gate.asType(.float32)
        let g = sigmoidGate ? sigmoid(gf) : MLXNN.silu(gf)
        return (g * out.asType(.float32)).asType(x.dtype)
    }
}

@inline(__always) func l2normQK(_ x: MLXArray, eps: Float = 1e-6) -> MLXArray {
    let xf = x.asType(.float32)
    return (xf * rsqrt(xf.square().sum(axis: -1, keepDims: true) + eps)).asType(x.dtype)
}

// MARK: - rope

public struct Rope {
    let invFreq: MLXArray  // (dim/2) f32
    let dim: Int
    private let tables = RopeTables()
    public var sharedTables: Bool {
        get { tables.enabled }
        nonmutating set { tables.configure(newValue) }
    }

    package var fusedRotation: Bool {
        get { tables.fusedRotation }
        nonmutating set { tables.fusedRotation = newValue }
    }
    package var fusedRotationsScheduled: Int { tables.fusedRotationsScheduled }
    package var tableHits: Int { tables.hits }
    package var tableBuilds: Int { tables.builds }

    package func rotate(_ x: MLXArray, _ cosine: MLXArray, _ sine: MLXArray) -> MLXArray {
        guard tables.fusedRotation, PartialRotation.supported(x, cosine, sine) else {
            return ropePartial(x, cosine, sine)
        }
        tables.fusedRotationsScheduled += 1
        return PartialRotation.apply(x, cosine, sine)
    }

    public init(dim: Int, base: Float) {
        self.dim = dim
        let exps = MLXArray(stride(from: 0, to: Int32(dim), by: 2).map { Float($0) / Float(dim) })
        self.invFreq = pow(MLXArray(base), -exps)
    }

    /// positions (B, T) -> cos/sin (B, T, dim)
    func callAsFunction(_ positions: MLXArray) -> (MLXArray, MLXArray) {
        let freqs = positions.asType(.float32).expandedDimensions(axis: -1) * invFreq
        let emb = concatenated([freqs, freqs], axis: -1)
        return (cos(emb), sin(emb))
    }

    /// All text, image placeholders and draft entries use absolute cache
    /// positions. Equal geometry within this Rope instance shares angles;
    /// values are still formed by the reference multiply/cos/sin sequence.
    package func table(start: Int, count: Int, stride: Int = 1) -> (MLXArray, MLXArray) {
        tables.get(start: start, count: count, stride: stride) {
            self(MLXArray((0 ..< count).map { Int32(start + $0 * stride) }).expandedDimensions(axis: 0))
        }
    }

}

private final class RopeTables {
    struct Key: Equatable { let start: Int; let count: Int; let stride: Int }
    private var entries: [(Key, (MLXArray, MLXArray))] = []
    private(set) var enabled = false
    var fusedRotation = false
    var fusedRotationsScheduled = 0
    private(set) var hits = 0
    private(set) var builds = 0
    func configure(_ enabled: Bool) {
        if self.enabled != enabled { entries.removeAll(); self.enabled = enabled }
    }
    func get(start: Int, count: Int, stride: Int, make: () -> (MLXArray, MLXArray)) -> (MLXArray, MLXArray) {
        guard enabled else { builds += 1; return make() }
        let key = Key(start: start, count: count, stride: stride)
        if let i = entries.firstIndex(where: { $0.0 == key }) {
            hits += 1
            let entry = entries.remove(at: i); entries.append(entry); return entry.1
        }
        builds += 1
        let value = make()
        // One query range and one completed-block range. This never grows
        // with conversation count or context iterations.
        if entries.count == 2 { entries.removeFirst() }
        entries.append((key, value))
        return value
    }
}

/// Apply rope to the first `d` dims only (partial rotary), NeoX half-rotation.
func ropePartial(_ x: MLXArray, _ cosA: MLXArray, _ sinA: MLXArray) -> MLXArray {
    let d = cosA.dim(-1)
    let c = cosA.asType(x.dtype)
    let s = sinA.asType(x.dtype)
    let xr = x[.ellipsis, 0 ..< d]
    let xp = x[.ellipsis, d...]
    let half = d / 2
    let x1 = xr[.ellipsis, 0 ..< half]
    let x2 = xr[.ellipsis, half...]
    let rot = concatenated([-x2, x1], axis: -1)
    let rotated = xr * c + rot * s
    return xp.dim(-1) > 0 ? concatenated([rotated, xp], axis: -1) : rotated
}

// MARK: - caches

final class KVCache {
    var keys: MLXArray?
    var values: MLXArray?
    var offset = 0
    let step = 1024
    var allocatedBytes: Int { (keys?.nbytes ?? 0) + (values?.nbytes ?? 0) }

    /// Distinct Swift array contexts share the existing MLX storage. Indexed
    /// updates then retain the other branch's reader and copy on write.
    func copyForPrefix(to target: KVCache) {
        target.keys = keys.map { $0.reshaped($0.shape) }
        target.values = values.map { $0.reshaped($0.shape) }
        target.offset = offset
    }

    func updateAndFetch(_ k: MLXArray, _ v: MLXArray) -> (MLXArray, MLXArray) {
        let prev = offset
        let s = k.dim(2)
        if keys == nil || prev + s > keys!.dim(2) {
            let newCap = ((prev + s + step - 1) / step) * step
            let b = k.dim(0)
            let h = k.dim(1)
            let grownK = MLXArray.zeros([b, h, newCap, k.dim(3)], dtype: k.dtype)
            let grownV = MLXArray.zeros([b, h, newCap, v.dim(3)], dtype: v.dtype)
            if let ok = keys, prev > 0 {
                grownK[0..., 0..., 0 ..< prev, 0...] = ok[0..., 0..., 0 ..< prev, 0...]
                grownV[0..., 0..., 0 ..< prev, 0...] = values![0..., 0..., 0 ..< prev, 0...]
            }
            keys = grownK
            values = grownV
        }
        keys![0..., 0..., prev ..< (prev + s), 0...] = k
        values![0..., 0..., prev ..< (prev + s), 0...] = v
        offset = prev + s
        return (keys![0..., 0..., 0 ..< offset, 0...], values![0..., 0..., 0 ..< offset, 0...])
    }

    /// Roll back to `n` entries. Bytes past `n` stay in the buffer but are
    /// dead: the next update writes over them, and fetches slice 0..<offset.
    func trim(to n: Int) { offset = min(offset, max(0, n)) }
}

/// Grown in blocks like KVCache rather than re-concatenated per token: a
/// fresh `concatenated` every step copies the whole cache each time, which is
/// quadratic in context length. Values are identical either way.
package final class IndexerCache {
    private var buf: MLXArray?  // (B, cap, dim)
    private var pooledBuf: MLXArray?
    private var pooledCount = 0
    private var pooledRatio = 1
    package private(set) var offset = 0
    package private(set) var rawBase = 0
    package let compactRaw: Bool
    private var preserveRaw = false
    let step = 1024
    package var allocatedBytes: Int { (buf?.nbytes ?? 0) + (pooledBuf?.nbytes ?? 0) }
    package var rawAllocatedBytes: Int { buf?.nbytes ?? 0 }
    package var pooledAllocatedBytes: Int { pooledBuf?.nbytes ?? 0 }
    package init(compactRaw: Bool = false) { self.compactRaw = compactRaw }

    func copyForPrefix(to target: IndexerCache) {
        precondition(target.compactRaw == compactRaw)
        target.buf = buf.map { $0.reshaped($0.shape) }
        target.pooledBuf = pooledBuf.map { $0.reshaped($0.shape) }
        target.pooledCount = pooledCount; target.pooledRatio = pooledRatio
        target.offset = offset; target.rawBase = rawBase
        target.preserveRaw = false
    }

    func forkForPrefix() -> IndexerCache {
        let result = IndexerCache(compactRaw: compactRaw)
        copyForPrefix(to: result)
        return result
    }

    package func prefixForkFields() -> [String: MLXArray] {
        var result = ["offset": MLXArray(Int64(offset)), "rawBase": MLXArray(Int64(rawBase)),
            "pooledCount": MLXArray(Int64(pooledCount)), "pooledRatio": MLXArray(Int64(pooledRatio))]
        if let pooledBuf, pooledCount > 0 { result["pooled"] = pooledBuf[0..., 0 ..< pooledCount, 0...] }
        return result
    }

    package struct Snapshot {
        fileprivate var raw: MLXArray?
        fileprivate var pooled: MLXArray?
        fileprivate var offset: Int
        fileprivate var rawBase: Int
        fileprivate var pooledCount: Int
        fileprivate var ratio: Int
    }

    package func snapshot() -> Snapshot? {
        guard compactRaw else { return nil }
        return Snapshot(raw: buf, pooled: pooledBuf, offset: offset, rawBase: rawBase,
                        pooledCount: pooledCount, ratio: pooledRatio)
    }

    package func restore(_ saved: Snapshot) {
        buf = saved.raw; pooledBuf = saved.pooled; offset = saved.offset
        rawBase = saved.rawBase; pooledCount = saved.pooledCount; pooledRatio = saved.ratio
        preserveRaw = false
        materializeStorage()
    }

    /// A recording pass can have an arbitrary public length. Keep all its
    /// raw rows until rollback chooses its committed position; no draft-depth
    /// assumption is allowed to change State.rollback's contract.
    package func preserveRecordingRows(_ on: Bool) {
        preserveRaw = on
        if !on { compactCompletedRaw() }
    }

    package func update(_ k: MLXArray) -> MLXArray {
        let s = k.dim(1)
        let live = offset - rawBase
        let allocationStep = compactRaw && rawBase > 0 ? 256 : step
        if buf == nil || live + s > buf!.dim(1) {
            let newCap = ((live + s + allocationStep - 1) / allocationStep) * allocationStep
            let grown = MLXArray.zeros([k.dim(0), newCap, k.dim(2)], dtype: k.dtype)
            if let old = buf, live > 0 {
                grown[0..., 0 ..< live, 0...] = old[0..., 0 ..< live, 0...]
            }
            buf = grown
        }
        buf![0..., live ..< (live + s), 0...] = k
        offset += s
        return buf![0..., 0 ..< (offset - rawBase), 0...]
    }

    /// Roll back to `n` entries (see KVCache.trim).
    package func trim(to n: Int) {
        precondition(!compactRaw || max(0, n) >= rawBase, "released indexer history requires its checkpoint")
        offset = min(offset, max(0, n))
        // A partial block must be rebuilt from the retained raw rows after
        // speculation overwrites its rejected suffix.
        pooledCount = min(pooledCount, offset / pooledRatio)
    }

    package func completedBlocks(
        count: Int, ratio: Int, transform: (Int, Int) -> MLXArray
    ) -> MLXArray {
        precondition(count > 0 && ratio > 0)
        if pooledRatio != ratio {
            precondition(rawBase == 0, "released indexer history cannot change compression ratio")
            pooledBuf = nil; pooledCount = 0; pooledRatio = ratio
        }
        if count > pooledCount {
            let added = transform(pooledCount, count)
            if pooledBuf == nil || pooledBuf!.dim(1) < count {
                let capacity = ((count + 255) / 256) * 256
                let grown = MLXArray.zeros([added.dim(0), capacity, added.dim(2)], dtype: added.dtype)
                if let old = pooledBuf, pooledCount > 0 {
                    grown[0..., 0 ..< pooledCount, 0...] = old[0..., 0 ..< pooledCount, 0...]
                }
                pooledBuf = grown
            }
            pooledBuf![0..., pooledCount ..< count, 0...] = added
            pooledCount = count
        }
        compactCompletedRaw()
        return pooledBuf![0..., 0 ..< count, 0...]
    }

    private func compactCompletedRaw() {
        guard compactRaw, !preserveRaw, let old = buf, pooledCount > 0 else { return }
        // Only completed keys can replace raw rows. Retain a small aligned
        // tail and amortize copies; a StateCheckpoint owns any earlier undo.
        let first = min(pooledCount * pooledRatio, max(0, offset - 32) / pooledRatio * pooledRatio)
        guard first - rawBase >= 256 else { return }
        let live = offset - first
        let capacity = max(256, ((live + 255) / 256) * 256)
        let owned = MLXArray.zeros([old.dim(0), capacity, old.dim(2)], dtype: old.dtype)
        if live > 0 { owned[0..., 0 ..< live, 0...] = old[0..., (first - rawBase) ..< (offset - rawBase), 0...] }
        // Complete both dependents before dropping their oversized parent.
        if let pooledBuf { eval(owned, pooledBuf) } else { eval(owned) }
        buf = owned; rawBase = first
    }

    package func materializeStorage() {
        if let b = buf { eval(b) }
        if let p = pooledBuf { eval(p) }
    }

    package func diagnosticValues() -> MLXArray? {
        buf.map { $0[0..., 0 ..< (offset - rawBase), 0...] }
    }
}

final class LinearCache {
    var convState: MLXArray?  // (B, K-1, convDim)
    var ssmState: MLXArray?  // (B, Hv, Dv, Dk) f32
    var pleConvState: MLXArray?  // (B, (k-1)*dilation, hcDim)
    var ngramCtx: [Int64] = []  // rolling last (ngramSize-1) token ids
    /// While a speculative verify pass runs, the state after each of its
    /// positions (index t = state after consuming t+1 of the pass's
    /// tokens), so a rejection rolls back by position instead of re-running
    /// the kept tokens. Empty outside a recording pass.
    var record = false
    var convStates: [MLXArray] = []
    var ssmStates: [MLXArray] = []
    var pleConvStates: [MLXArray] = []

    func forkForPrefix() throws -> LinearCache {
        guard !record, convStates.isEmpty, ssmStates.isEmpty, pleConvStates.isEmpty else {
            throw ModelError("cannot fork a prefix during speculative state recording")
        }
        let result = LinearCache()
        // Windows must not keep a whole prefill activation alive. Full FP32
        // recurrent arrays are already replaced on every recurrence step.
        result.convState = convState.map { contiguous($0).reshaped($0.shape) }
        result.pleConvState = pleConvState.map { contiguous($0).reshaped($0.shape) }
        result.ssmState = ssmState.map { $0.reshaped($0.shape) }
        result.ngramCtx = ngramCtx
        eval([result.convState, result.pleConvState, result.ssmState].compactMap { $0 })
        return result
    }

    func compactWindows() {
        if let window = convState { convState = contiguous(window) }
        if let window = pleConvState { pleConvState = contiguous(window) }
        // eval alone does not detach a view. contiguous copies oversized
        // backing allocations in the pinned MLX implementation.
        if let window = convState { eval(window) }
        if let window = pleConvState { eval(window) }
        // Recording windows intentionally share one bounded verify parent.
        // rollback compacts the selected window after releasing the others.
    }

    func clearRecording() {
        record = false
        convStates = []
        ssmStates = []
        pleConvStates = []
    }
}

// MARK: - QSA (sparse attention)

final class QSAIndexer {
    var minimumProjectionRows = 0
    var incrementalBlocks = false
    var denseBypass = false
    var specializedSelector = false
    private(set) var specializedRows = 0
    let cfg: ModelConfig
    let proj: QLinear
    let qNorm: RMSNorm
    let kNorm: RMSNorm
    let blockTopK: Int

    convenience init(_ w: TensorSource, layer: Int) {
        self.init(w, base: "model.layers.\(layer).self_attn.indexer")
    }

    init(_ w: TensorSource, base b: String) {
        cfg = w.config
        proj = w.linear(b + ".index_qk_proj")
        qNorm = RMSNorm(weight: w.tensor(b + ".q_layernorm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        kNorm = RMSNorm(weight: w.tensor(b + ".k_layernorm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        blockTopK = cfg.indexerBudget / cfg.indexerCompressRatio
    }

    /// Preparation appends each key once. Query tiles subsequently select
    /// from this same full block domain, so partition tie order stays defined
    /// by the original block IDs, including invisible blocks.
    func prepare(_ x: MLXArray, rope: Rope, cache: IndexerCache?, offset: Int) -> QSASelection? {
        let (B, S) = (x.dim(0), x.dim(1))
        let qk = proj(x, minimumRows: minimumProjectionRows)
        let split = cfg.indexerNHeads * cfg.indexerHeadDim
        var q = qk[.ellipsis, 0 ..< split].reshaped([B, S, cfg.indexerNHeads, cfg.indexerHeadDim])
        var rawK = qk[.ellipsis, split...].reshaped([B, S, cfg.indexerHeadDim])
        if let c = cache { rawK = c.update(rawK) }
        let kvLen = cache?.offset ?? rawK.dim(1)
        if kvLen <= cfg.indexerBudget { return nil }

        let ratio = cfg.indexerCompressRatio
        let nBlocks = kvLen / ratio
        let rawBase = cache?.rawBase ?? 0
        let blockStarts = MLXArray((0 ..< nBlocks).map { Int32($0 * ratio) })
        func transform(_ lo: Int, _ hi: Int) -> MLXArray {
            let rows = rawK[0..., (lo * ratio - rawBase) ..< (hi * ratio - rawBase), 0...]
                .reshaped([B, hi - lo, ratio, cfg.indexerHeadDim])
            let normalized = kNorm(rows.asType(.float32).mean(axis: 2).asType(rawK.dtype))
            let (cK, sK) = rope.table(start: lo * ratio, count: hi - lo, stride: ratio)
            return rope.rotate(normalized, cK, sK)
        }
        let pooled: MLXArray
        if let cache, incrementalBlocks || cache.compactRaw {
            pooled = cache.completedBlocks(count: nBlocks, ratio: ratio, transform: transform)
        } else { pooled = transform(0, nBlocks) }

        let (cQ, sQ) = rope.table(start: offset, count: S)
        q = qNorm(q)
        q = rope.rotate(
            q, cQ.expandedDimensions(axis: 2), sQ.expandedDimensions(axis: 2))

        return QSASelection(q: q, pooled: pooled, blockStarts: blockStarts,
                            offset: offset, kvLen: kvLen, ratio: ratio,
                            blockTopK: blockTopK, headDim: cfg.indexerHeadDim,
                            denseBypass: denseBypass, specializedSelector: specializedSelector,
                            onSpecialized: specializedSelector ? { [weak self] count in self?.specializedRows += count } : nil)
    }

    /// Original full-pass mask remains available as the exact reference.
    func appendKeysOnly(_ x: MLXArray, rope: Rope, cache: IndexerCache) {
        let split = cfg.indexerNHeads * cfg.indexerHeadDim
        let raw = proj(x, minimumRows: minimumProjectionRows)[.ellipsis, split...].reshaped([x.dim(0), x.dim(1), cfg.indexerHeadDim])
        let rows = cache.update(raw)
        if cache.compactRaw, cache.offset > cfg.indexerBudget {
            let ratio = cfg.indexerCompressRatio, base = cache.rawBase
            _ = cache.completedBlocks(count: cache.offset / ratio, ratio: ratio) { lo, hi in
                let block = rows[0..., (lo * ratio - base) ..< (hi * ratio - base), 0...]
                    .reshaped([x.dim(0), hi - lo, ratio, cfg.indexerHeadDim])
                let normalized = self.kNorm(block.asType(.float32).mean(axis: 2).asType(rows.dtype))
                let (c, s) = rope.table(start: lo * ratio, count: hi - lo, stride: ratio)
                return rope.rotate(normalized, c, s)
            }
        }
        cache.materializeStorage()
    }

    /// Original full-pass mask remains available as the exact reference.
    func callAsFunction(_ x: MLXArray, rope: Rope, cache: IndexerCache?, offset: Int) -> MLXArray? {
        prepare(x, rope: rope, cache: cache, offset: offset)?
            .mask(lo: 0, hi: x.dim(1), keyEnd: offset + x.dim(1))
    }
}

/// Prepared indexer inputs; scores and keep masks live only for one query
/// tile. It owns no state and cannot append or rewind cache entries.
package struct QSASelection {
    let q: MLXArray
    let pooled: MLXArray
    let blockStarts: MLXArray
    let offset: Int
    let kvLen: Int
    let ratio: Int
    let blockTopK: Int
    let headDim: Int
    let denseBypass: Bool
    let specializedSelector: Bool
    let onSpecialized: ((Int) -> Void)?

    package init(q: MLXArray, pooled: MLXArray, blockStarts: MLXArray,
                 offset: Int, kvLen: Int, ratio: Int, blockTopK: Int,
                 headDim: Int, denseBypass: Bool = false, specializedSelector: Bool = false,
                 onSpecialized: ((Int) -> Void)? = nil) {
        self.q = q; self.pooled = pooled; self.blockStarts = blockStarts
        self.offset = offset; self.kvLen = kvLen; self.ratio = ratio
        self.blockTopK = blockTopK; self.headDim = headDim
        self.denseBypass = denseBypass
        self.specializedSelector = specializedSelector
        self.onSpecialized = onSpecialized
    }

    package func mask(lo: Int, hi: Int, keyEnd: Int) -> MLXArray {
        let (B, S, nBlocks) = (q.dim(0), hi - lo, pooled.dim(1))
        let qPos = MLXArray((offset + lo ..< offset + hi).map { Int32($0) })
        // At query p there are floor((p+1)/ratio) complete visible blocks.
        // If even the last query fits the selection budget, all visible
        // blocks plus its partial own block are exactly the causal keep set.
        // Keep a boolean mask and the same full key domain/attention shapes;
        // switching to a different causal-kernel dispatch is a separate probe.
        if denseBypass, ratio > 0, (offset + hi) / ratio <= blockTopK {
            // NaN visible scores sort after invisible -infinity in the pinned
            // selector, so "all visible fit" alone is insufficient. This
            // conservative operand bound excludes NaNs/infinities and leaves
            // ample headroom against dot-product/head-sum overflow. Its scalar
            // synchronization cost belongs in this candidate's timing gate.
            let terms = Float(headDim) * Float(q.dim(2))
            let limit = sqrt(Float.greatestFiniteMagnitude / max(1, terms)) / 4
            let bounded = (abs(q[0..., lo ..< hi, 0..., 0...]).asType(.float32) .<= limit).all()
                .&& (abs(pooled).asType(.float32) .<= limit).all()
            if bounded.item(Bool.self) {
                let keys = MLXArray((0 ..< keyEnd).map(Int32.init)).reshaped([1, 1, keyEnd])
                return broadcast(keys .<= qPos.reshaped([1, S, 1]), to: [B, S, keyEnd])
                    .expandedDimensions(axis: 1)
            }
        }
        var scores = einsum(
            "bshd,bnd->bsnh", q[0..., lo ..< hi, 0..., 0...].asType(.float32), pooled.asType(.float32))
        scores = maximum(scores, 0).sum(axis: -1) / sqrt(Float(headDim))

        let blockEnd = blockStarts + Int32(ratio - 1)
        let visible = blockEnd.reshaped([1, 1, nBlocks]) .<= qPos.reshaped([1, S, 1])
        scores = which(visible, scores, MLXArray(-Float.infinity))

        let k = min(blockTopK, nBlocks)
        let keepBlock: MLXArray
        if specializedSelector {
            if BlockSelection.supported(scores, k: k), BlockSelection.prepare() { onSpecialized?(B * S) }
            keepBlock = BlockSelection.keep(scores, k: k, enabled: true) .&& visible
        } else {
            var top = argPartition(-scores, kth: k - 1, axis: -1)[.ellipsis, ..<k].asType(.int32)
            top = which(takeAlong(broadcast(visible, to: [B, S, nBlocks]), top, axis: -1), top, MLXArray(Int32(nBlocks)))
            var storage = MLXArray.zeros([B, S, nBlocks + 1], dtype: .bool)
            storage = putAlong(storage, top, values: MLXArray(true), axis: -1)
            keepBlock = storage[.ellipsis, ..<nBlocks]
        }

        var keep = repeated(keepBlock, count: ratio, axis: -1)
        let tail = kvLen - nBlocks * ratio
        if tail > 0 {
            keep = concatenated([keep, MLXArray.zeros([B, S, tail], dtype: .bool)], axis: -1)
        }
        let keyPos = MLXArray((0 ..< kvLen).map { Int32($0) }).reshaped([1, 1, kvLen])
        let qp = qPos.reshaped([1, S, 1])
        // MLX tensor `/` is true division even for Int32 inputs. Flooring
        // here is essential: otherwise ownBlockStart becomes qp+1 and every
        // partial current block is silently omitted from sparse attention.
        let ownBlockStart = floorDivide(qp + 1, Int32(ratio)) * Int32(ratio)
        let ownTail = (keyPos .>= ownBlockStart) .&& (keyPos .<= qp)
        keep = (keep .|| ownTail) .&& (keyPos .<= qp)
        return keep[0..., 0..., 0 ..< keyEnd].expandedDimensions(axis: 1)
    }

    /// Unchanged score arithmetic and original partition domain. Only the
    /// selected complete-block IDs escape; the attention consumer reconstructs
    /// causality and the own partial block from absolute query positions.
    package func compactBlocks(lo: Int, hi: Int) -> MLXArray {
        let (B, S, nBlocks) = (q.dim(0), hi - lo, pooled.dim(1))
        let positions = MLXArray((offset + lo ..< offset + hi).map(Int32.init))
        var scores = einsum("bshd,bnd->bsnh",
            q[0..., lo ..< hi, 0..., 0...].asType(.float32), pooled.asType(.float32))
        scores = maximum(scores, 0).sum(axis: -1) / sqrt(Float(headDim))
        let visible = (blockStarts + Int32(ratio - 1)).reshaped([1, 1, nBlocks])
            .<= positions.reshaped([1, S, 1])
        scores = which(visible, scores, MLXArray(-Float.infinity))
        let count = min(blockTopK, nBlocks)
        let top = argPartition(-scores, kth: count - 1, axis: -1)[.ellipsis, ..<count].asType(.int32)
        return which(takeAlong(broadcast(visible, to: [B, S, nBlocks]), top, axis: -1),
            top, MLXArray(Int32(nBlocks)))
    }
}

final class QSAAttention {
    var minimumProjectionRows = 0
    var stableSmallKeyDomain = false
    var smallReferenceStart = 0
    var smallReferenceEnd = ContextPolicy.modelLimit
    private(set) var paddedSmallKeyDomains = 0
    private(set) var paddedSmallQueryRows = 0
    var boundedIndexer = false
    var selectedAttention = false
    private(set) var selectedAttentionTiles = 0
    var debugSink: ((String, MLXArray) -> Void)? = nil
    let cfg: ModelConfig
    let qProj: QLinear
    let kProj: QLinear
    let vProj: QLinear
    let oProj: QLinear
    let qNorm: RMSNorm
    let kNorm: RMSNorm
    let indexer: QSAIndexer
    let scale: Float

    convenience init(_ w: TensorSource, layer: Int) {
        self.init(w, base: "model.layers.\(layer).self_attn")
    }

    init(_ w: TensorSource, base b: String) {
        cfg = w.config
        qProj = w.linear(b + ".q_proj")
        kProj = w.linear(b + ".k_proj")
        vProj = w.linear(b + ".v_proj")
        oProj = w.linear(b + ".o_proj")
        qNorm = RMSNorm(weight: w.tensor(b + ".q_norm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        kNorm = RMSNorm(weight: w.tensor(b + ".k_norm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        indexer = QSAIndexer(w, base: b + ".indexer")
        scale = 1.0 / sqrt(Float(cfg.headDim))
    }

    /// An intermediate terminal layer needs only keys and values for later
    /// tokens. Keep the same full-row projection/norm/RoPE shapes and finish
    /// cache writes; queries, attention outputs and MoE cannot affect state.
    func appendKeysOnly(_ x: MLXArray, rope: Rope, cache: KVCache, idxCache: IndexerCache) {
        let (B, S, D) = (x.dim(0), x.dim(1), cfg.headDim)
        let offset = cache.offset
        indexer.appendKeysOnly(x, rope: rope, cache: idxCache)
        var k = kNorm(kProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D])).transposed(0, 2, 1, 3)
        let v = vProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D]).transposed(0, 2, 1, 3)
        let (c, s) = rope.table(start: offset, count: S)
        k = rope.rotate(k, c.expandedDimensions(axis: 1), s.expandedDimensions(axis: 1))
        let retained = cache.updateAndFetch(k, v)
        eval(retained.0, retained.1)
    }

    func callAsFunction(
        _ x: MLXArray, rope: Rope, cache: KVCache, idxCache: IndexerCache, lastQueryOnly: Bool = false
    ) -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        let offset = cache.offset
        let H = cfg.numAttentionHeads
        let D = cfg.headDim

        let selection = indexer.prepare(x, rope: rope, cache: idxCache, offset: offset)
        let pruneLastQuery = lastQueryOnly && S > InferenceOptimizations.terminalQueryTile
        let useSelected = selectedAttention && S > 8 && !pruneLastQuery
        let sparse = boundedIndexer || useSelected || pruneLastQuery ? nil : selection?.mask(lo: 0, hi: S, keyEnd: offset + S)

        let qg = qProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, H, 2 * D])
        var q = qg[.ellipsis, 0 ..< D]
        let gate = qg[.ellipsis, D...].reshaped([B, S, H * D])
        debugSink?("qgRaw", qg)
        q = qNorm(q).transposed(0, 2, 1, 3)
        var k = kNorm(kProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D])).transposed(0, 2, 1, 3)
        var v = vProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D]).transposed(0, 2, 1, 3)
        debugSink?("qNormed", q)
        debugSink?("kNormed", k)
        debugSink?("v", v)

        var (c, s) = rope.table(start: offset, count: S)
        c = c.expandedDimensions(axis: 1)
        s = s.expandedDimensions(axis: 1)
        q = rope.rotate(q, c, s)
        k = rope.rotate(k, c, s)

        (k, v) = cache.updateAndFetch(k, v)

        if pruneLastQuery {
            // Preserve matrix dispatch with one 64-row terminal tile. The
            // single-query predecessor changed final router rank. This bounded
            // successor has its own unchanged numerical/state gates; shorter
            // passes retain their entire original attention/HC geometry.
            let rows = InferenceOptimizations.terminalQueryTile
            let first = S - rows
            let queries = q[0..., 0..., first..., 0...]
            let mask = selection?.mask(lo: first, hi: S, keyEnd: offset + S)
            let attended = Self.attend(q: queries, k: k, v: v, sparse: mask,
                base: offset + first, scale: scale, block: rows)
            let flattened = attended.transposed(0, 2, 1, 3).reshaped([B, rows, H * D])
            return oProj(flattened * sigmoid(gate[0..., first..., 0...]), minimumRows: minimumProjectionRows)
        }

        debugSink?("qRoped", q)
        debugSink?("kRoped", k)
        if stableSmallKeyDomain, S < 256 {
            let actual = k.dim(2)
            let extent = ContextWorkspace.keyExtent(pass: S, context: actual,
                referenceStart: smallReferenceStart, referenceEnd: smallReferenceEnd)
            let queryRows = ContextWorkspace.queryRows(pass: S, context: actual,
                referenceStart: smallReferenceStart, referenceEnd: smallReferenceEnd)
            if (extent > actual || queryRows > S), extent <= ContextPolicy.modelLimit,
               queryRows <= PrefillSchedule.measuredQueryKeyProduct / extent {
                // Masked future columns preserve the established 256-row
                // prefill's softmax reduction domain. They never enter state,
                // selection, or a logical token count; only Q x padded K is
                // charged to the next-dispatch workspace bound.
                let paddedK = extent > actual ? concatenated([k, MLXArray.zeros([B, cfg.numKVHeads, extent - actual, D], dtype: k.dtype)], axis: 2) : k
                let paddedV = extent > actual ? concatenated([v, MLXArray.zeros([B, cfg.numKVHeads, extent - actual, D], dtype: v.dtype)], axis: 2) : v
                var keep: MLXArray
                if let selected = selection?.mask(lo: 0, hi: S, keyEnd: actual) {
                    keep = concatenated([selected, MLXArray.zeros([B, 1, S, extent - actual], dtype: .bool)], axis: -1)
                } else {
                    let queries = MLXArray((offset ..< offset + S).map(Int32.init)).reshaped([1, 1, S, 1])
                    let keys = MLXArray((0 ..< extent).map(Int32.init)).reshaped([1, 1, 1, extent])
                    keep = queries .>= keys
                }
                var queries = q
                if queryRows > S {
                    queries = concatenated([q, broadcast(q[0..., 0..., (S - 1) ..< S, 0...],
                        to: [B, H, queryRows - S, D])], axis: 2)
                    keep = concatenated([keep, broadcast(keep[0..., 0..., (S - 1) ..< S, 0...],
                        to: [B, 1, queryRows - S, extent])], axis: 2)
                    paddedSmallQueryRows += queryRows - S
                }
                let attended = Self.attend(q: queries, k: paddedK, v: paddedV, sparse: keep,
                    base: offset, scale: scale, block: queryRows)[0..., 0..., 0 ..< S, 0...]
                if extent > actual { paddedSmallKeyDomains += 1 }
                let flattened = attended.transposed(0, 2, 1, 3).reshaped([B, S, H * D])
                return oProj(flattened * sigmoid(gate), minimumRows: minimumProjectionRows)
            }
        }
        var out = Self.attend(
            q: q, k: k, v: v, sparse: sparse, base: offset, scale: scale,
            block: boundedIndexer && selection != nil
                ? min(256, AttentionTuning.queryBlock(pass: S, context: k.dim(2)))
                : AttentionTuning.queryBlock(pass: S, context: k.dim(2)),
            selection: boundedIndexer || useSelected ? selection : nil,
            selectedAttention: useSelected,
            onSelected: { [weak self] in self?.selectedAttentionTiles += 1 })
        debugSink?("sdpaOut", out)
        out = out.transposed(0, 2, 1, 3).reshaped([B, S, H * D])
        return oProj(out * sigmoid(gate), minimumRows: minimumProjectionRows)
    }

    /// Attention over a pass, in blocks of queries.
    ///
    /// Mask semantics mirror the reference: fused-causal sdpa when the indexer
    /// is inactive (bit-parity with mlx-lm's "causal" string mask), and the
    /// boolean keep-set (already causal) when it is.
    ///
    /// **Why the pass is split.** MLX 0.31.1 admits the fused prefill kernel
    /// only for head dims 64, 80 and 128 (`sdpa_full_supported_head_dim` in
    /// `scaled_dot_product_attention.cpp`). These layers run at head dim 256,
    /// so every pass longer than 8 tokens takes the unfused path in
    /// `fast.cpp`, which materialises the whole `[24, pass, context]` score
    /// matrix — a transient that grows with pass x context, which is what
    /// `PrefillSchedule` shrinks the pass to stay ahead of. Splitting the
    /// queries bounds it to `[24, block, context]`.
    ///
    /// **Why it is exact.** The fallback builds its causal mask as
    /// `arange(kL - qL, qL + (kL - qL)) >= arange(0, kL)`, so queries align to
    /// the END of the keys: a block `[lo, hi)` of a pass that starts at
    /// context position `base` sees exactly keys `[0, base + hi)`, which
    /// reproduces the same mask rows. Every output row depends only on its own
    /// query and all keys, so nothing is re-associated. Measured
    /// bit-identical at blocks of 256 and up and 1.3x faster
    /// (`swift-probe/Sources/AttnProbe`); a block of 128 measured 1.6e-3 of
    /// logit spread at one shape, which is why 256 is the floor.
    ///
    /// **The per-block `eval` is load-bearing, not tidiness.** Without it MLX
    /// builds the whole graph before evaluating anything and holds every
    /// block's score matrix at once: measured 6.5 GB at a 4096-token pass over
    /// a 32k context, exactly what not blocking costs. With it, 0.76 GB.
    static func attend(
        q: MLXArray, k: MLXArray, v: MLXArray, sparse: MLXArray?, base: Int,
        scale: Float, block: Int, selection: QSASelection? = nil,
        selectedAttention: Bool = false, onSelected: (() -> Void)? = nil
    ) -> MLXArray {
        let S = q.dim(2)
        if selectedAttention, S > 8, scale == 0.0625, sparse == nil,
           selection == nil || selection!.ratio == 4,
           SelectedAttention.prepare() {
            // Initialization precedes model state mutation at request entry.
            // Query tiling also bounds compact selection scores. The kernel
            // never materializes a query-by-key attention matrix.
            var outs: [MLXArray] = []
            var lo = 0
            while lo < S {
                var hi = min(S, lo + 256)
                if S - hi <= 8 { hi = S }
                let query = q[0..., 0..., lo ..< hi, 0...]
                let ids = selection?.compactBlocks(lo: lo, hi: hi)
                guard SelectedAttention.supported(q: query, k: k, v: v, base: base + lo, blocks: ids) else {
                    // Capability/shape fallback is pure, before kernel work
                    // for this tile. No error recovery after GPU mutation.
                    return attend(q: q, k: k, v: v, sparse: sparse, base: base,
                        scale: scale, block: block, selection: selection)
                }
                let out = SelectedAttention.execute(q: query, k: k, v: v, base: base + lo, blocks: ids)
                eval(out); outs.append(out); onSelected?()
                lo = hi
            }
            return concatenated(outs, axis: 2)
        }
        func mask(_ sp: MLXArray?, queries: Int) -> MLXFast.ScaledDotProductAttentionMaskMode {
            if let sp { return .array(sp) }
            // A single query sits at the last key position, so every key it is
            // handed is already visible to it and no mask is needed.
            return queries > 1 ? .causal : .none
        }
        if block >= S {
            return MLXFast.scaledDotProductAttention(
                queries: q, keys: k, values: v, scale: scale, mask: mask(selection?.mask(lo: 0, hi: S, keyEnd: base + S) ?? sparse, queries: S))
        }
        var outs: [MLXArray] = []
        outs.reserveCapacity((S + block - 1) / block)
        var lo = 0
        while lo < S {
            var hi = Swift.min(lo + block, S)
            if selection != nil, S - hi < block { hi = S }
            // Keep the reference softmax key domain for explicit sparse
            // masks. Truncating masked future columns can change its reduction
            // tree. Merge a short final tile so it cannot switch to the <=8
            // query vector kernel: a 256 target therefore bounds tiles at 511.
            let kEnd = selection != nil ? k.dim(2) : base + hi
            let o = MLXFast.scaledDotProductAttention(
                queries: q[0..., 0..., lo ..< hi, 0...],
                keys: k[0..., 0..., 0 ..< kEnd, 0...],
                values: v[0..., 0..., 0 ..< kEnd, 0...],
                scale: scale,
                mask: mask(selection?.mask(lo: lo, hi: hi, keyEnd: kEnd)
                    ?? sparse?[0..., 0..., lo ..< hi, 0 ..< kEnd], queries: hi - lo))
            eval(o)
            outs.append(o)
            lo = hi
        }
        return concatenated(outs, axis: 2)
    }
}

/// How a pass is split across the sparse-attention layers.
///
/// **This is a bound, not an optimisation, and the measurements say so.**
/// Splitting the queries was built expecting it to cut peak memory; measured
/// end to end it does not, because the score matrix is not where the pass
/// peaks. Interleaved A/B on the 7,960-token acceptance prompt at a pinned
/// 20-experts-per-layer pool: peak 7.35/7.70/8.50 GB whole against
/// 7.40/7.75/8.50 blocked at passes of 512/1024/2048, and a 16,384-token
/// `context-check` read 8.58 GB whole against 8.64 GB blocked. The high-water
/// mark sits in the MoE sweep's activations, so bounding attention lowers
/// something that was never the maximum. Output was byte-identical throughout.
///
/// So the default threshold is set to make blocking a **no-op at every
/// configuration the planner produces today**: it engages only above
/// `PrefillSchedule.measuredQueryKeyProduct`, which is exactly where the
/// schedule currently shrinks the pass instead. That keeps the measured
/// envelope unchanged while capping a transient that would otherwise grow
/// without limit as the context cap rises, and it is what would let the pass
/// stay large at a long context rather than halving. Do not turn it on below
/// the threshold expecting memory back; it costs a few percent and returns
/// nothing.
///
/// The block is a function of the pass and the context alone, never of the
/// pool or of what is resident, so it cannot touch the golden-equivalence
/// invariant (§6.1).
public enum AttentionTuning {
    /// Below this a block stops being exact: 128 measured 1.6e-3 of logit
    /// spread against the whole pass, where 256 and up measured 0.0.
    public static let minQueryBlock = 256
    /// Query-by-key elements one call may score before the pass is split. The
    /// same product the prefill schedule treats as measured-safe, so blocking
    /// never engages inside the envelope the measurements cover.
    public static var queryKeyBudget: Int { PrefillSchedule.measuredQueryKeyProduct }

    /// `SLOTSTREAM_ATTN_BLOCK=0` forces the single-call pass at any size (the
    /// A/B arm); any other positive value pins the block.
    static let override: Int? = {
        guard let raw = ProcessInfo.processInfo.environment["SLOTSTREAM_ATTN_BLOCK"],
            let n = Int(raw)
        else { return nil }
        return n
    }()

    /// The query block for a pass of `pass` tokens ending at `context`, or
    /// `Int.max` for "do not split".
    public static func queryBlock(pass: Int, context: Int) -> Int {
        if let o = override { return o <= 0 ? Int.max : o }
        let ctx = Swift.max(1, context)
        if pass * ctx <= queryKeyBudget { return Int.max }
        var b = pass
        while b > minQueryBlock, b * ctx > queryKeyBudget { b /= 2 }
        return b
    }
}

// MARK: - Gated DeltaNet

final class GDNLayer {
    var minimumProjectionRows = 0
    var fuseInputProjection = false
    private(set) var fusedProjectionsScheduled = 0
    let packedInput: PackedProjectionPair?
    var fusedRecording = false
    var phaseProfile: GDNPhaseProfile?
    let layerIndex: Int
    let cfg: ModelConfig
    let inQKV: QLinear
    let inZ: QLinear
    let inB: QLinear
    let inA: QLinear
    let convWeight: MLXArray  // (convDim, K, 1)
    let dtBias: MLXArray
    let aLog: MLXArray
    let norm: RMSNormGated
    let outProj: QLinear
    let keyDim: Int
    let valueDim: Int
    let convDim: Int

    init(_ w: ResidentWeights, layer: Int) {
        layerIndex = layer
        cfg = w.config
        let b = "model.layers.\(layer).linear_attn"
        inQKV = w.linear(b + ".in_proj_qkv")
        inZ = w.linear(b + ".in_proj_z")
        packedInput = w.packedGDNProjections[layer]
        inB = w.linear(b + ".in_proj_b")
        inA = w.linear(b + ".in_proj_a")
        convWeight = w.tensor(b + ".conv1d.weight")
        dtBias = w.tensor(b + ".dt_bias")
        aLog = w.tensor(b + ".A_log")
        norm = RMSNormGated(
            weight: w.tensor(b + ".norm.weight"), eps: cfg.rmsNormEps,
            sigmoidGate: cfg.outputGateType == "sigmoid")
        outProj = w.linear(b + ".out_proj")
        keyDim = cfg.linearNumKHeads * cfg.linearKHeadDim
        valueDim = cfg.linearNumVHeads * cfg.linearVHeadDim
        convDim = 2 * keyDim + valueDim
    }

    func callAsFunction(_ x: MLXArray, cache: LinearCache?) -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        let profile = phaseProfile
        let inputStart = profile == nil ? 0 : RuntimeClock.now()
        if profile != nil {
            eval([x] + [cache?.convState, cache?.ssmState].compactMap { $0 })
        }
        let preparationStart = profile == nil ? 0 : RuntimeClock.now()
        let mixed: MLXArray, zProjection: MLXArray
        if fuseInputProjection, let packedInput, packedInput.supportsOneToken(x) {
            let projected = packedInput(x)
            mixed = projected.0; zProjection = projected.1
            fusedProjectionsScheduled += 1
        } else {
            mixed = inQKV(x, minimumRows: minimumProjectionRows)
            zProjection = inZ(x, minimumRows: minimumProjectionRows)
        }
        let z = zProjection.reshaped([B, S, cfg.linearNumVHeads, cfg.linearVHeadDim])
        let bProj = inB(x, minimumRows: minimumProjectionRows)
        let aProj = inA(x, minimumRows: minimumProjectionRows)

        let K = cfg.convKernel
        let convState =
            cache?.convState
            ?? MLXArray.zeros([B, K - 1, convDim], dtype: x.dtype)
        let convInput = concatenated([convState, mixed], axis: 1)
        if let c = cache {
            c.convState = convInput[0..., (convInput.dim(1) - (K - 1))..., 0...]
            if c.record {
                // window of K-1 rows ending after position t
                c.convStates = (0 ..< S).map { t in convInput[0..., (t + 1) ..< (t + K), 0...] }
            }
        }
        let convOut = MLXNN.silu(conv1d(convInput, convWeight, groups: convDim))

        var q = convOut[.ellipsis, 0 ..< keyDim]
            .reshaped([B, S, cfg.linearNumKHeads, cfg.linearKHeadDim])
        var k = convOut[.ellipsis, keyDim ..< (2 * keyDim)]
            .reshaped([B, S, cfg.linearNumKHeads, cfg.linearKHeadDim])
        let v = convOut[.ellipsis, (2 * keyDim)...]
            .reshaped([B, S, cfg.linearNumVHeads, cfg.linearVHeadDim])

        q = l2normQK(q) * Float(pow(Double(cfg.linearKHeadDim), -0.5))
        k = l2normQK(k)

        if profile != nil { eval(q, k, v, z, aProj, bProj, aLog, dtBias) }
        let recurrenceStart = profile == nil ? 0 : RuntimeClock.now()

        let y: MLXArray
        if let c = cache, c.record, S > 1, fusedRecording {
            let recorded = gatedDeltaUpdateRecording(q: q, k: k, v: v, a: aProj, b: bProj,
                aLog: aLog, dtBias: dtBias, state: c.ssmState)
            y = recorded.output
            c.ssmStates = recorded.states
            c.ssmState = recorded.states.last
        } else if let c = cache, c.record, S > 1 {
            // Step the recurrence one token at a time so every intermediate
            // state is available for a speculative rollback. The state is
            // fp32 between steps exactly as inside the fused kernel, so the
            // outputs match the batched pass.
            var st = c.ssmState
            var ys: [MLXArray] = []
            var states: [MLXArray] = []
            for t in 0 ..< S {
                let (yt, nt) = gatedDeltaUpdate(
                    q: q[0..., t ..< (t + 1)], k: k[0..., t ..< (t + 1)], v: v[0..., t ..< (t + 1)],
                    a: aProj[0..., t ..< (t + 1)], b: bProj[0..., t ..< (t + 1)],
                    aLog: aLog, dtBias: dtBias, state: st, mask: nil)
                ys.append(yt)
                states.append(nt)
                st = nt
            }
            y = concatenated(ys, axis: 1)
            c.ssmStates = states
            c.ssmState = st
        } else {
            let (yy, newState) = gatedDeltaUpdate(
                q: q, k: k, v: v, a: aProj, b: bProj,
                aLog: aLog, dtBias: dtBias,
                state: cache?.ssmState, mask: nil)
            cache?.ssmState = newState
            y = yy
        }
        if profile != nil {
            eval([y] + [cache?.ssmState].compactMap { $0 } + (cache?.ssmStates ?? []))
        }
        let finishStart = profile == nil ? 0 : RuntimeClock.now()
        let result = outProj(norm(y, gate: z).reshaped([B, S, valueDim]), minimumRows: minimumProjectionRows)
        if let profile {
            eval([result] + [cache?.convState].compactMap { $0 } + (cache?.convStates ?? []))
            let end = RuntimeClock.now()
            profile.append(layer: layerIndex, tokens: S,
                input: Double(preparationStart - inputStart) / 1e9,
                preparation: Double(recurrenceStart - preparationStart) / 1e9,
                recurrence: Double(finishStart - recurrenceStart) / 1e9,
                finish: Double(end - finishStart) / 1e9)
        }
        return result
    }
}

// MARK: - MoE

final class MoELayer {
    var minimumProjectionRows = 0
    // Context qualification successor: preserve the established grouped QMM
    // arithmetic for bounded 64/128-token prefill. Decode is unchanged.
    var smallPrefillSweep = false
    var contextNumericsObserver: ((String, MLXArray) -> Void)?
    private(set) var smallPrefillSweeps = 0
    var specializedRouter = false
    var overlapShared = false
    private(set) var sharedPrelaunches = 0
    var overlapResident = false
    private(set) var residentPrelaunches = 0
    private(set) var residentJoins = 0
    private(set) var residentJoinSeconds = 0.0
    var routerObserver: ((Int, [Int32]) -> Void)?
    var useLayerWorkspace = false
    var workspaceTokenTile = 256
    var workspaceComputeRanges: [Range<Int>] = []
    var disjointOutput = false
    var boundedRows = false
    let cfg: ModelConfig
    let layer: Int
    let routerProjection: RouterProjection
    let sharedGate: QLinear
    let sharedGateProj: QLinear
    let sharedUpProj: QLinear
    let sharedDownProj: QLinear
    let pool: SlotPool

    init(_ w: ResidentWeights, layer: Int, pool: SlotPool) {
        cfg = w.config
        self.layer = layer
        self.pool = pool
        let b = "model.layers.\(layer).mlp"
        routerProjection = RouterProjection(w.tensor(b + ".gate.weight"))
        sharedGate = w.linear(b + ".shared_expert_gate")
        sharedGateProj = w.linear(b + ".shared_expert.gate_proj")
        sharedUpProj = w.linear(b + ".shared_expert.up_proj")
        sharedDownProj = w.linear(b + ".shared_expert.down_proj")
    }

    func callAsFunction(_ x: MLXArray) throws -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        // The reference matmul promotes the BF16 router to FP32. An optional
        // pre-materialized copy removes that repeated conversion at extra cost.
        let logits: MLXArray
        if useLayerWorkspace, !workspaceComputeRanges.isEmpty {
            var pieces: [MLXArray] = []
            for range in workspaceComputeRanges {
                let piece = routerProjection(x[0..., range, 0...])
                eval(piece); pieces.append(piece)
            }
            logits = concatenated(pieces, axis: 1)
        } else { logits = routerProjection(x) }
        contextNumericsObserver?("router", logits)
        let idx = RouterSelection.indices(logits, k: cfg.topK, enabled: specializedRouter)
        let weights = softmax(takeAlong(logits, idx, axis: -1), axis: -1, precise: true)

        // routing decision to CPU
        let expertIds = idx.asType(.int32).asArray(Int32.self)  // B*S*topK
        if RouterTrace.on {
            RouterTrace.record(layer: layer, tokens: B * S, topK: cfg.topK, ids: expertIds)
        }
        routerObserver?(layer, expertIds)
        func sharedParts(_ input: MLXArray) -> (MLXArray, MLXArray) {
            let value = sharedDownProj(MLXNN.silu(sharedGateProj(input, minimumRows: minimumProjectionRows))
                * sharedUpProj(input, minimumRows: minimumProjectionRows), minimumRows: minimumProjectionRows)
            let gate = sharedGate(input, minimumRows: minimumProjectionRows)
            contextNumericsObserver?("sharedValue", value)
            contextNumericsObserver?("sharedGate", gate)
            return (value, gate)
        }
        func shared(_ input: MLXArray) -> MLXArray {
            let (value, gate) = sharedParts(input)
            return sigmoid(gate) * value
        }
        // Router materialization above has already completed the input and
        // every prior pool reader. These resident projections do not read or
        // mutate expert slots, so their work can run while ensure/sweep reads.
        // Stop at the two matmul outputs: leave the final sigmoid/product/add
        // in the original graph to preserve its rounding/fusion boundary.
        var earlyShared: (MLXArray, MLXArray)?
        if overlapShared && !useLayerWorkspace {
            let parts = sharedParts(x)
            asyncEval(parts.0, parts.1)
            earlyShared = parts
            sharedPrelaunches += 1
        }
        pool.unpinAll()
        let routed: MLXArray
        if useLayerWorkspace, B * S >= SweepTuning.minTokens {
            routed = try workspaceRouted(x, expertIds: expertIds, weights: weights)
        } else {
            let smallSweep = smallPrefillSweep && B * S >= 64 && B * S < 256
                && SweepTuning.minTokens != Int.max
            if smallSweep { smallPrefillSweeps += 1 }
            let experts = try B * S >= SweepTuning.minTokens || smallSweep
                ? sweep(x, expertIds: expertIds) : cached(x, expertIds: expertIds)
            routed = (experts * weights.expandedDimensions(axis: -1)).sum(axis: -2).asType(x.dtype)
        }

        contextNumericsObserver?("routed", routed)
        if useLayerWorkspace, !workspaceComputeRanges.isEmpty {
            var outputs: [MLXArray] = []
            for range in workspaceComputeRanges {
                let value = shared(x[0..., range, 0...])
                eval(value); outputs.append(value)
            }
            return routed + concatenated(outputs, axis: 1)
        }
        if let (value, gate) = earlyShared { return routed + sigmoid(gate) * value }
        return routed + shared(x)
    }

    /// Workspace C: keep one layer's expert weights, reduce one token tile
    /// at a time in canonical router-rank order, and retain only N x H output.
    /// It trades E x recordBytes for removing N x K x H live output/product.
    private func workspaceRouted(_ x: MLXArray, expertIds: [Int32], weights: MLXArray) throws -> MLXArray {
        let (B, S, K, H, E) = (x.dim(0), x.dim(1), cfg.topK, cfg.hiddenSize, cfg.numExperts)
        let countStart = RuntimeClock.now()
        var count = [Int](repeating: 0, count: E)
        for e in expertIds { count[Int(e)] += 1 }
        let active = (0 ..< E).filter { count[$0] > 0 }
        pool.sweepSortSeconds += RuntimeClock.seconds(since: countStart)
        let w = try pool.layerWorkspaceChecked(layer: layer, experts: active)
        MemTrace.mark("workspace-loaded", nil)
        if pool.admitOnSweep, SlotPool.sweepAdmitEnabled {
            let quota = max(1, pool.slots / cfg.numLayers)
            // Share reads across the scope while preserving the existing
            // final chronological pass's admission policy and decode warmth.
            var admissionCount = count
            if let tail = workspaceComputeRanges.last {
                admissionCount = [Int](repeating: 0, count: E)
                for e in expertIds[(tail.lowerBound * K) ..< (tail.upperBound * K)] { admissionCount[Int(e)] += 1 }
            }
            let hot = active.filter { admissionCount[$0] > 0 }.sorted {
                admissionCount[$0] != admissionCount[$1] ? admissionCount[$0] > admissionCount[$1] : $0 < $1
            }
            let picked = Array(hot.prefix(quota)).sorted { a, b in
                let ar = pool.isResident(ExpertKey(layer, a)), br = pool.isResident(ExpertKey(layer, b))
                return ar != br ? ar : a < b
            }
            pool.admit(layer: layer, experts: picked, rows: picked, from: w)
            pool.commitAdmissions()
        }
        MemTrace.mark("workspace-admitted", nil)
        let flat = x.reshaped([B * S, H])
        let routeWeights = weights.reshaped([B * S, K])
        var outs: [MLXArray] = []
        var lo = 0
        while lo < B * S {
            var hi = min(B * S, lo + min(4096, max(256, workspaceTokenTile)))
            // Merge only a small dispatch tail, not an entire nearly-full
            // tile. The live output bound is tile + 255 tokens.
            if B * S - hi < 256 { hi = B * S }
            let n = hi - lo, rows = n * K
            let sortStart = RuntimeClock.now()
            let ids = Array(expertIds[(lo * K) ..< (hi * K)])
            var starts = [Int](repeating: 0, count: E + 1)
            for e in ids { starts[Int(e) + 1] += 1 }
            for e in 0 ..< E { starts[e + 1] += starts[e] }
            var fill = starts
            var order = [Int32](repeating: 0, count: rows)
            for (r, e) in ids.enumerated() {
                order[fill[Int(e)]] = Int32(r); fill[Int(e)] += 1
            }
            var inverse = [Int32](repeating: 0, count: rows)
            for (sorted, original) in order.enumerated() { inverse[Int(original)] = Int32(sorted) }
            var ridx = order.map { ids[Int($0)] }
            pool.sweepSortSeconds += RuntimeClock.seconds(since: sortStart)
            var gathered = flat[MLXArray(order.map { Int32(lo) + $0 / Int32(K) })].expandedDimensions(axis: 1)
            let pad = max(0, max(16, 4 * E) - rows)
            if pad > 0 {
                ridx.append(contentsOf: repeatElement(ridx.last!, count: pad))
                gathered = concatenated([gathered,
                    broadcast(gathered[(rows - 1) ..< rows], to: [pad, 1, H])], axis: 0)
            }
            let indices = MLXArray(ridx)
            let g = gatherQuantizedMM(gathered, w[0], scales: w[1], biases: w[2], rhsIndices: indices,
                transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
            let u = gatherQuantizedMM(gathered, w[3], scales: w[4], biases: w[5], rhsIndices: indices,
                transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
            let d = gatherQuantizedMM(MLXNN.silu(g) * u, w[6], scales: w[7], biases: w[8], rhsIndices: indices,
                transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
            let canonical = d[0 ..< rows].squeezed(axis: 1)[MLXArray(inverse)].reshaped([n, K, H])
            let reduced = (canonical * routeWeights[lo ..< hi].expandedDimensions(axis: -1))
                .sum(axis: -2).asType(x.dtype)
            let waitStart = RuntimeClock.now()
            eval(reduced)
            MemTrace.mark("workspace-reduced", nil)
            pool.sweepWaitSeconds += RuntimeClock.seconds(since: waitStart)
            outs.append(reduced)
            lo = hi
        }
        return concatenated(outs, axis: 0).reshaped([B, S, H])
    }

    /// The pool path: pin the routed experts in the slot pool and gather over
    /// it, one matvec per (token, expert). Returns every expert's output,
    /// (B,S,topK,H).
    private func cached(_ x: MLXArray, expertIds: [Int32]) throws -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        var uniq: [ExpertKey] = []
        var seen: [ExpertKey: Int] = [:]
        for e in expertIds {
            let key = ExpertKey(layer, Int(e))
            if seen[key] == nil {
                seen[key] = uniq.count
                uniq.append(key)
            }
        }
        func project(_ slotIds: [Int32]) -> MLXArray {
            let count = slotIds.count / (B * S)
            let slotIdx = MLXArray(slotIds, [B, S, count])
            let xe = x.expandedDimensions(axes: [-2, -3])
            let g = gatherQuantizedMM(
                xe, pool.pools[0], scales: pool.pools[1], biases: pool.pools[2],
                rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
            let u = gatherQuantizedMM(
                xe, pool.pools[3], scales: pool.pools[4], biases: pool.pools[5],
                rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
            let hidden = MLXNN.silu(g) * u
            return gatherQuantizedMM(
                hidden, pool.pools[6], scales: pool.pools[7], biases: pool.pools[8],
                rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
                .squeezed(axis: -2)
        }
        var readyRanks: [Int] = []
        var ready: MLXArray?
        let slotOf: [Int]
        // Only split the batch of independent one-row QMV operations. Larger
        // token batches retain the original kernel/grouping and sweep rules.
        if overlapResident && B == 1 && S == 1 {
            slotOf = try pool.ensureOverlapping(uniq, reservedHits: { existing in
                readyRanks = expertIds.indices.filter { existing[seen[ExpertKey(self.layer, Int(expertIds[$0]))]!] >= 0 }
                guard !readyRanks.isEmpty else { return }
                let slots = readyRanks.map { Int32(existing[seen[ExpertKey(self.layer, Int(expertIds[$0]))]!]) }
                ready = project(slots)
                asyncEval(ready!)
                self.residentPrelaunches += 1
            }, finishReaders: {
                if let ready {
                    let start = RuntimeClock.now()
                    eval(ready)
                    self.residentJoins += 1
                    self.residentJoinSeconds += RuntimeClock.seconds(since: start)
                }
            })
        } else { slotOf = try pool.ensureChecked(uniq) }
        let slotIds = expertIds.map { Int32(slotOf[seen[ExpertKey(layer, Int($0))]!]) }
        guard let ready else { return project(slotIds) }
        let readySet = Set(readyRanks)
        let missingRanks = expertIds.indices.filter { !readySet.contains($0) }
        let missing = project(missingRanks.map { slotIds[$0] })
        let order = readyRanks + missingRanks
        var inverse = Array(repeating: Int32(0), count: expertIds.count)
        for (position, rank) in order.enumerated() { inverse[rank] = Int32(position) }
        // The outer router weighting/reduction still sees original rank order.
        return take(concatenated([ready, missing], axis: 2), MLXArray(inverse), axis: 2)
    }

    /// The sweep (PLAN §3.3): rows sorted by expert; the layer's experts in
    /// groups of `ExpertStore.defaultLoadBatch`, resident ones copied out of
    /// the pool and the rest read from the checkpoint in contiguous runs; one
    /// grouped GEMM per projection and group over that group's rows. Sorting
    /// the rows is what reaches MLX's `gather_qmm_rhs` kernel, which reads an
    /// expert's weights once per tile of tokens instead of once per token —
    /// where the old pass spent most of its compute. Resident groups go first
    /// so that admission (final pass only) can never evict a resident expert
    /// this layer has not copied yet.
    private func sweep(_ x: MLXArray, expertIds: [Int32]) throws -> MLXArray {
        let (B, S, K, H, E) = (x.dim(0), x.dim(1), cfg.topK, cfg.hiddenSize, cfg.numExperts)
        let rows = B * S * K
        let tSort = RuntimeClock.now()
        var count = [Int](repeating: 0, count: E)
        for e in expertIds { count[Int(e)] += 1 }
        let resident = (0 ..< E).map { count[$0] > 0 && pool.isResident(ExpertKey(layer, $0)) }
        // Counting sort of the rows by (resident first, then expert id):
        // stable, linear, and a function of the routing alone.
        func bucket(_ e: Int) -> Int { (resident[e] ? 0 : E) + e }
        var start = [Int](repeating: 0, count: 2 * E + 1)
        for e in 0 ..< E where count[e] > 0 { start[bucket(e) + 1] = count[e] }
        for b in 0 ..< 2 * E { start[b + 1] += start[b] }
        var fill = start
        var order = [Int32](repeating: 0, count: rows)
        for (r, e) in expertIds.enumerated() {
            let b = bucket(Int(e))
            order[fill[b]] = Int32(r)
            fill[b] += 1
        }
        var invOrder = disjointOutput ? [] : [Int32](repeating: 0, count: rows)
        if !disjointOutput {
            for (s, r) in order.enumerated() { invOrder[Int(r)] = Int32(s) }
        }
        pool.sweepSortSeconds += RuntimeClock.seconds(since: tSort)
        // The token each sorted row belongs to. Gathering the rows for the
        // whole pass up front materialised one replicated copy of it —
        // rows x hidden, so K=10 times the hidden state, 105 MB at a
        // 2048-token pass and 210 at 4096 — and held it for the whole layer
        // while each group used a 32-expert slice. The gather happens per
        // group instead; the kernel is handed exactly the same rows in the
        // same order, so the arithmetic is untouched.
        let flat = x.reshaped([B * S, H])
        let tokenOf = order.map { $0 / Int32(K) }
        // SLOTSTREAM_SWEEP_ROWS=all restores the up-front gather for an A/B.
        let xsAll: MLXArray? = SweepTuning.gatherAllRows
            ? flat[MLXArray(tokenOf)].expandedDimensions(axis: 1) : nil

        // The final pass of a prompt admits each layer's hottest experts, its
        // fair share of the pool, so decode starts warm.
        var admitSet = Set<Int>()
        if pool.admitOnSweep, SlotPool.sweepAdmitEnabled {
            let quota = max(1, pool.slots / cfg.numLayers)
            let hot = (0 ..< E).filter { count[$0] > 0 }
                .sorted { count[$0] != count[$1] ? count[$0] > count[$1] : $0 < $1 }
            admitSet = Set(hot.prefix(quota))
        }

        let groupSize = ExpertStore.defaultLoadBatch
        var outs: [MLXArray] = []
        var orderedOutput: MLXArray? = disjointOutput
            ? MLXArray.zeros([rows, H], dtype: x.dtype) : nil
        var inFlight: MLXArray? = nil
        for source in 0 ..< 2 {  // 0: resident (out of the pool), 1: from the checkpoint
            let ids = (0 ..< E).filter { count[$0] > 0 && resident[$0] == (source == 0) }
            var lo = 0
            while lo < ids.count {
                let hi = min(lo + groupSize, ids.count)
                let group = Array(ids[lo ..< hi])
                let w = try
                    source == 0
                    ? pool.gatherResident(group.map { ExpertKey(layer, $0) })
                    : pool.readStagedChecked(layer: layer, experts: group)
                let rowLo = start[bucket(group[0])]
                let rowHi = start[bucket(group[group.count - 1]) + 1]
                // Admission remains once per loaded group. All of its rows
                // reuse these exact weight arrays, including across row tiles.
                if !admitSet.isEmpty {
                    let picks = group.enumerated().filter { admitSet.contains($0.element) }
                    if !picks.isEmpty {
                        pool.admit(
                            layer: layer, experts: picks.map { $0.element },
                            rows: picks.map { $0.offset }, from: w)
                    }
                }
                var localOf = [Int32](repeating: -1, count: E)
                for (j, e) in group.enumerated() { localOf[e] = Int32(j) }
                let tileSize = boundedRows ? 256 : rowHi - rowLo
                var row = rowLo
                while row < rowHi {
                    let end = min(row + tileSize, rowHi)
                    let n = end - row
                    // Preserve the grouped kernel dispatch even for a short
                    // tile. Padding repeats its last real row and expert.
                    let pad = max(0, max(16, 4 * group.count) - n)
                    var local = order[row ..< end].map { localOf[Int(expertIds[Int($0)])] }
                    local.append(contentsOf: repeatElement(local.last!, count: pad))
                    var xg = xsAll.map { $0[row ..< end] }
                        ?? flat[MLXArray(Array(tokenOf[row ..< end]))].expandedDimensions(axis: 1)
                    if pad > 0 {
                        xg = concatenated(
                            [xg, broadcast(xg[(n - 1) ..< n], to: [pad, 1, H])], axis: 0)
                    }
                    let ridx = MLXArray(local)
                    let g = gatherQuantizedMM(
                        xg, w[0], scales: w[1], biases: w[2], rhsIndices: ridx, transpose: true,
                        groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
                    let u = gatherQuantizedMM(
                        xg, w[3], scales: w[4], biases: w[5], rhsIndices: ridx, transpose: true,
                        groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
                    let dAll = gatherQuantizedMM(
                        MLXNN.silu(g) * u, w[6], scales: w[7], biases: w[8], rhsIndices: ridx,
                        transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
                    let d = pad > 0 ? dAll[0 ..< n] : dAll
                    let completed: MLXArray
                    if let output = orderedOutput {
                        // Router rank is the destination, with each row written
                        // exactly once. No floating-point accumulation here;
                        // the existing K-axis reduction below is unchanged.
                        completed = putAlong(output,
                            MLXArray(Array(order[row ..< end])).expandedDimensions(axis: 1),
                            values: d.squeezed(axis: 1), axis: 0)
                        orderedOutput = completed
                    } else {
                        outs.append(d)
                        completed = d
                    }
                    asyncEval(completed)
                    if let prev = inFlight {
                        let tWait = RuntimeClock.now()
                        eval(prev)
                        pool.sweepWaitSeconds += RuntimeClock.seconds(since: tWait)
                    }
                    inFlight = completed
                    row = end
                }
                lo = hi
            }
        }
        pool.commitAdmissions()
        if let output = orderedOutput { return output.reshaped([B, S, K, H]) }
        let all = concatenated(outs, axis: 0).squeezed(axis: 1)  // (rows, H), sorted
        return all[MLXArray(invOrder)].reshaped([B, S, K, H])
    }
}

/// The prefill sweep's one knob, public so `sweep-check` can flip it in
/// process and measurements can A/B it (`SLOTSTREAM_SWEEP=0`).
public enum SweepTuning {
    /// Inputs of this many tokens or more, which only a prefill pass is, take
    /// the sweep: each layer's routed experts stream through staging groups
    /// and MLX's grouped GEMM and never touch the slot pool. Shorter inputs
    /// (decode, speculative verify passes, short follow-up turns) gather over
    /// the pool as before. The choice is a function of the token count alone,
    /// never of the pool, so pool size and contents still cannot change the
    /// math (the golden-equivalence invariant). `Int.max` forces the pool path
    /// at every size.
    /// Whether the sweep gathers every sorted row up front (what shipped
    /// through 0.2.3) instead of per staging group. `SLOTSTREAM_SWEEP_ROWS=all`
    /// restores it for an A/B; the rows the kernel sees are identical either
    /// way, only how long the replicated copy is held changes.
    public static let gatherAllRows: Bool =
        ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP_ROWS"] == "all"

    public static var minTokens: Int =
        ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP"] == "0" ? Int.max : 256
}

// MARK: - hyper-connections

final class GatedResidual {
    var minimumProjectionRows = 0
    var compiledNormFinish = false
    private(set) var compiledFinishes = 0
    let cfg: ModelConfig
    let hcNorm: RMSNorm
    let down: QLinear
    let up: QLinear
    let inject: MLXArray?  // (hc, hcDim), bf16
    var debugName: String? = nil

    init(_ w: TensorSource, base: String, useCombine: Bool) {
        cfg = w.config
        hcNorm = RMSNorm(
            weight: w.tensor(base + ".hc_norm.weight"), eps: cfg.rmsNormEps,
            groupSize: cfg.hiddenSize)
        down = w.linear(base + ".input_mix_weight_down")
        up = w.linear(base + ".input_mix_weight_up")
        inject = useCombine ? w.tensor(base + ".block_inject_weight.weight") : nil
    }

    /// hyper (B,S,hc*H) -> (mixed (B,S,H), hyper, inject (B,S,hc)) or just mixed.
    func callAsFunction(_ hyper: MLXArray) -> (MLXArray, MLXArray?) {
        let useCompiled = compiledNormFinish && CompiledArithmetic.prepare()
        if useCompiled { compiledFinishes += 1 }
        let normed = hcNorm(hyper, compiledFinish: useCompiled)
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_normed", normed) }
        let downOut = down(normed, minimumRows: minimumProjectionRows)
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_down", downOut) }
        var w = MLXNN.silu(downOut / Float(cfg.hcCount))
        w = sigmoid(up(w, minimumRows: minimumProjectionRows))
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_wup", w) }
        let shape = Array(w.shape.dropLast()) + [cfg.hcCount, cfg.hiddenSize]
        let mixed = (w.reshaped(shape) * normed.reshaped(shape)).mean(axis: -2)
        guard let injW = inject else { return (mixed, nil) }
        let projected = QLinear.withReferenceRows(normed, minimumRows: minimumProjectionRows) { matmul($0, injW.transposed()) }
        let injected = 2 * sigmoid(projected / Float(cfg.hcCount))
        return (mixed, injected)
    }
}

// MARK: - PLE

final class PLELayer {
    var minimumProjectionRows = 0
    var boundedTokens = false
    let cfg: ModelConfig
    let store: NgramStore
    let keyProj: QLinear
    let valueProj: QLinear
    let normKey: RMSNorm
    let normQuery: RMSNorm
    let normConv: RMSNorm
    let convWeight: MLXArray
    let dilation: Int
    let stateLen: Int

    init(_ w: ResidentWeights, layer: Int, store: NgramStore) {
        cfg = w.config
        self.store = store
        let b = "model.layers.\(layer).ple"
        keyProj = w.linear(b + ".key_proj")
        valueProj = w.linear(b + ".value_proj")
        let hcDim = cfg.hcCount * cfg.hiddenSize
        _ = hcDim
        normKey = RMSNorm(weight: w.tensor(b + ".norm_key.weight"), eps: cfg.rmsNormEps, groupSize: cfg.hiddenSize)
        normQuery = RMSNorm(weight: w.tensor(b + ".norm_query.weight"), eps: cfg.rmsNormEps, groupSize: cfg.hiddenSize)
        normConv = RMSNorm(weight: w.tensor(b + ".norm_conv.weight"), eps: cfg.rmsNormEps, groupSize: cfg.hiddenSize)
        convWeight = w.tensor(b + ".conv1d.weight")
        dilation = cfg.ngramSize
        stateLen = (cfg.pleConvKernel - 1) * dilation
    }

    private func shortConv(_ x: MLXArray, cache: LinearCache?) -> MLXArray {
        let S = x.dim(1)
        let state =
            cache?.pleConvState
            ?? MLXArray.zeros([x.dim(0), stateLen, x.dim(-1)], dtype: x.dtype)
        let full = concatenated([state, x], axis: 1)
        if let c = cache {
            c.pleConvState = full[0..., (full.dim(1) - stateLen)..., 0...]
            if c.record {
                c.pleConvStates = (0 ..< S).map { t in full[0..., (t + 1) ..< (t + 1 + stateLen), 0...] }
            }
        }
        let window = full[0..., (full.dim(1) - (stateLen + S))..., 0...]
        return MLXNN.silu(conv1d(window, convWeight, dilation: dilation, groups: convWeight.dim(0)))
    }

    /// hidden (B,S,hc*H); ids/prevCtx handled CPU-side via NgramStore.
    func callAsFunction(_ hidden: MLXArray, history: [Int64], nNew: Int, cache: LinearCache?) throws -> MLXArray {
        if boundedTokens, nNew > 256, let cache, !cache.record {
            var outputs: [MLXArray] = []
            let base = history.count - nNew
            for lo in stride(from: 0, to: nNew, by: 256) {
                let hi = min(nNew, lo + 256)
                let contextStart = max(0, base + lo - (cfg.ngramSize - 1))
                let ids = Array(history[contextStart ..< base + hi])
                let result = try transform(hidden[0..., lo ..< hi, 0...], history: ids, nNew: hi - lo, cache: cache)
                // Materialize before the next tile replaces the convolution
                // window. Projection, gating and conv workspaces stay bounded.
                eval(result)
                outputs.append(result)
            }
            return concatenated(outputs, axis: 1)
        }
        return try transform(hidden, history: history, nNew: nNew, cache: cache)
    }

    private func transform(_ hidden: MLXArray, history: [Int64], nNew: Int, cache: LinearCache?) throws -> MLXArray {
        let emb = try store.embeddingChecked(history: history, nNew: nNew).asType(hidden.dtype)
        var key = normKey(keyProj(emb, minimumRows: minimumProjectionRows))
        let keyShape = Array(key.shape.dropLast()) + [cfg.hcCount, cfg.hiddenSize]
        key = key.reshaped(keyShape)
        let value = valueProj(emb, minimumRows: minimumProjectionRows)
        var query = normQuery(hidden)
        query = query.reshaped(keyShape)

        var gate = (key * query).sum(axis: -1, keepDims: true) / sqrt(Float(cfg.hiddenSize))
        gate = sqrt(maximum(abs(gate), 1e-6)) * sign(gate)
        var gated = sigmoid(gate) * value.expandedDimensions(axis: -2)
        gated = gated.reshaped(Array(gated.shape.dropLast(2)) + [cfg.hcCount * cfg.hiddenSize])
        return gated + shortConv(normConv(gated), cache: cache)
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/Model.swift` — 54003 bytes, SHA-256 `a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6`.

````text
// Qwen4Exp model assembly: 48 layers of (GDN | QSA) + MoE with
// hyper-connection residuals, PLE injection at the configured layer, and the
// final mixer + lm_head. Streams experts (SlotPool) and n-gram rows (NgramStore).

import Foundation
import MLX

public final class Qwen4ExpModel {
    /// All recurrent state and complete-prompt logits belong to this loaded model, even
    /// when another model has the same vocabulary and cache geometry.
    package let promptCheckpointIdentity = UUID()
    public let cfg: ModelConfig
    public let resident: ResidentWeights
    public let pool: SlotPool
    public let ngram: NgramStore
    public var optimizations: InferenceOptimizations
    /// Only the bounded long-context prefill path selects this arithmetic.
    /// Kept outside the independent optimization candidate bundle.
    package var smallPrefillSweep = false
    package var smallPrefillReferenceStart = 0
    package var smallPrefillReferenceEnd = ContextPolicy.modelLimit
    package var alignSmallReferenceDispatch = false
    package var stableSmallPrefillRouting = false
    package var stableSmallPrefillAttention = false
    package var stableSmallPrefillProjections = false
    public var paddedSmallKeyDomains: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallKeyDomains } }
    public var paddedSmallQueryRows: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallQueryRows } }
    public var smallPrefillSweeps: Int { moe.values.reduce(0) { $0 + $1.smallPrefillSweeps } }
    public var residentExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.residentPrelaunches } }
    public var residentExpertJoins: Int { moe.values.reduce(0) { $0 + $1.residentJoins } }
    public var residentExpertJoinSeconds: Double { moe.values.reduce(0) { $0 + $1.residentJoinSeconds } }
    public var sharedExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.sharedPrelaunches } }
    public var indexerSpecializedRows: Int { qsa.values.reduce(0) { $0 + $1.indexer.specializedRows } }
    private var routerCacheConfigured = false
    public var cachedRouterBytes: Int {
        moe.values.reduce(0) { $0 + $1.routerProjection.cachedBytes }
            + (mtpHead?.moe.routerProjection.cachedBytes ?? 0)
    }

    /// Request entry calls this before a cached MTP draft can advance. Direct
    /// model callers also prepare before touching main recurrent state.
    public var compiledNormFinishes: Int {
        (attnHC + mlpHC + [mixer]).reduce(0) { $0 + $1.compiledFinishes }
    }
    public var readHandleCount: Int { pool.readHandleCount + ngram.readHandleCount }
    public var selectedAttentionTiles: Int {
        qsa.values.reduce(0) { $0 + $1.selectedAttentionTiles } + (mtpHead?.attn.selectedAttentionTiles ?? 0)
    }
    public private(set) var terminalQueryRowsSkipped = 0
    public private(set) var terminalMoERowsSkipped = 0
    private enum HiddenDemand { case fullMulti, stateOnly, lastRow }
    private var compiledNormConfigured = false
    /// Lazy dispatch counters; GPU completion is established by evaluated outputs,
    /// never inferred from these scheduled-operation counts alone.
    public var fusedRoPERotationsScheduled: Int { rope.fusedRotationsScheduled }
    public var ropeTableHits: Int { rope.tableHits }
    public var ropeTableBuilds: Int { rope.tableBuilds }
    public var fusedGDNProjectionsScheduled: Int { gdn.values.reduce(0) { $0 + $1.fusedProjectionsScheduled } }
    func prepareOptimizationKernels() {
        for layer in gdn.values { layer.fuseInputProjection = optimizations.fusedGDNProjection }
        rope.sharedTables = optimizations.sharedRoPE
        rope.fusedRotation = optimizations.fusedRoPE && PartialRotation.prepare()
        let selected = optimizations.selectedTextAttention && SelectedAttention.prepare()
        for layer in qsa.values { layer.selectedAttention = selected }
        mtpHead?.attn.selectedAttention = selected
        pool.directReadHandles = optimizations.directReadHandles
        ngram.directReadHandles = optimizations.directReadHandles
        let compiledNorm = optimizations.compiledNormFinish && CompiledArithmetic.prepare()
        if compiledNorm != compiledNormConfigured {
            for unit in attnHC + mlpHC + [mixer] { unit.compiledNormFinish = compiledNorm }
            compiledNormConfigured = compiledNorm
        }
        mtpHead?.attnHC.compiledNormFinish = compiledNorm
        mtpHead?.mlpHC.compiledNormFinish = compiledNorm
        mtpHead?.mixer.compiledNormFinish = compiledNorm
        ngram.ringEvictionOrder = optimizations.ngramRingOrder
        pool.denseLookup = optimizations.denseExpertLookup
        pool.sparsePinClearing = optimizations.sparsePoolPins
        pool.contiguousSlotWrites = optimizations.contiguousSlotWrites
        pool.wordSlotWrites = optimizations.wordSlotWrites
        pool.cpuSlotWrites = optimizations.cpuSlotWrites
        pool.layerLocalFloorEviction = optimizations.layerLocalFloorCache
        if routerCacheConfigured != optimizations.cachedRouterWeights {
            for layer in moe.values { layer.routerProjection.configure(cached: optimizations.cachedRouterWeights) }
            routerCacheConfigured = optimizations.cachedRouterWeights
        }
        mtpHead?.moe.routerProjection.configure(cached: optimizations.cachedRouterWeights)
        if optimizations.routerTopK { RouterSelection.prepare() }
        if optimizations.indexerBlockTopK { BlockSelection.prepare() }
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
    }

    let rope: Rope
    var gdn: [Int: GDNLayer] = [:]
    var qsa: [Int: QSAAttention] = [:]
    var moe: [Int: MoELayer] = [:]
    var attnHC: [GatedResidual] = []
    var mlpHC: [GatedResidual] = []
    var ple: [Int: PLELayer] = [:]
    let mixer: GatedResidual
    let lmHead: QLinear
    /// The optional MTP draft head for self-speculative decode; loaded from
    /// mtp.safetensors on demand (`enableMTP`), everything resident.
    public private(set) var mtpHead: MTPHead? = nil
    /// Diagnostic observer; called on the serialized model thread with router-rank IDs.
    public var routerObserver: ((Int, [Int32]) -> Void)?
    package var contextNumericsObserver: ((Int, String, MLXArray) -> Void)?
    package var gdnPhaseProfile: GDNPhaseProfile? {
        didSet { for layer in gdn.values { layer.phaseProfile = gdnPhaseProfile } }
    }
    public let runLayers: Int  // truncated for parity rigs; numLayers normally

    public final class State {
        var modelIdentity: UUID?
        package var ownerModelIdentity: UUID? { modelIdentity }
        let checkpointIdentity = UUID()
        var checkpointLifetimes: [WeakStateCheckpointLifetime] = []
        var recordingEnabled = false
        var recordedTokenIds: [Int]?
        var recordingBaseTokenCount: Int?
        var linear: [Int: LinearCache] = [:]
        var kv: [Int: KVCache] = [:]
        var indexer: [Int: IndexerCache] = [:]
        var ngramCtx: [Int64] = []
        public var tokenCount = 0
        // A failed low-level forward can change early layers while tokenCount
        // still names the preceding boundary. Count alone cannot certify reuse.
        var committedBoundaryValid = true
        /// Speculative-decode companions, created lazily by the MTP-aware
        /// generate path: the draft head's own attention state, and the
        /// pre-mixer multi stream at the last consumed position (the next
        /// draft step's hidden input). They ride the prefix cache with the
        /// rest of the state so conversations keep their draft context.
        public var mtp: MTPState?
        public var lastMulti: MLXArray?
        /// A draft pointer alone is insufficient: plain inference may have
        /// advanced the main prefix since the draft cache was last updated.
        public var hasValidMTP: Bool {
            guard let row = lastMulti, row.ndim == 3, row.dim(0) == 1, row.dim(1) == 1 else { return false }
            return mtp?.isAligned(withConsumedTokens: tokenCount) == true
        }
        public func invalidateMTP() { mtp = nil; lastMulti = nil }
        /// Allocated sequence buffers, including unused capacity after trim.
        /// Recurrent state, convolution windows and allocator cache are separate.
        public var allocatedSequenceBytes: Int {
            kv.values.reduce(0) { $0 + $1.allocatedBytes }
                + indexer.values.reduce(0) { $0 + $1.allocatedBytes }
                + (mtp.map { $0.kv.allocatedBytes + $0.indexer.allocatedBytes } ?? 0)
        }
        var compactStateWindows = false
        public init() {}
    }

    public convenience init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil) throws {
        try self.init(index: index, poolSlots: poolSlots, runLayers: runLayers, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil, embeddingRowCache: Bool?,
                 packGDNProjections: Bool? = nil) throws {
        self.optimizations = try InferenceOptimizations.environment()
        try ModelProcessGuard.acquire()
        self.cfg = index.config
        let selectedLayers = runLayers ?? index.config.numLayers
        guard selectedLayers >= 1, selectedLayers <= index.config.numLayers else {
            throw ModelError(
                "layer count must be between 1 and \(index.config.numLayers), got \(selectedLayers)")
        }
        guard poolSlots >= 1, poolSlots <= Geometry.totalRecords else {
            throw ModelError(
                "expert-pool slot count must be between 1 and \(Geometry.totalRecords), got \(poolSlots)")
        }
        self.runLayers = selectedLayers
        let store = try ExpertStore(index: index)
        // Reject a wrong/custom checkpoint before allocating the 3.8 GB
        // resident trunk or the expert pool.
        try Geometry.check(against: index.config, recordBytes: store.recordBytes)
        // Explicit experimental startup path: full-file verification precedes
        // resident/pool allocation. Default construction needs no repack.
        if let path = ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LAYOUT"] {
            guard !path.isEmpty else { throw ModelError("SLOTSTREAM_EXPERT_LAYOUT must name a packed artifact directory") }
            let report = try store.loadPackedLayout(at:URL(fileURLWithPath:path,isDirectory:true))
            fputs("[expert-layout] verified \(report.bytes) bytes in \(report.seconds) s\n",stderr)
        }
        // parity rigs keep the truncated layers' experts resident? no — pool serves them
        self.resident = try ResidentWeights(index: index, embeddingRowCache: embeddingRowCache,
            packGDNProjections: packGDNProjections ?? optimizations.fusedGDNProjection)
        self.pool = SlotPool(slots: poolSlots, store: store)
        self.ngram = NgramStore(index: index, resident: resident)
        self.rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta)

        for l in 0 ..< self.runLayers {
            let base = "model.layers.\(l)"
            if cfg.layerTypes[l] == "linear_attention" {
                gdn[l] = GDNLayer(resident, layer: l)
            } else {
                qsa[l] = QSAAttention(resident, layer: l)
            }
            moe[l] = MoELayer(resident, layer: l, pool: pool)
            attnHC.append(GatedResidual(resident, base: base + ".attn_hyper_connection", useCombine: true))
            mlpHC.append(GatedResidual(resident, base: base + ".mlp_hyper_connection", useCombine: true))
            if cfg.pleLayerIndices.contains(l) {
                ple[l] = PLELayer(resident, layer: l, store: ngram)
            }
        }
        if Self.debugDir != nil { attnHC[0].debugName = "hc0" }
        mixer = GatedResidual(resident, base: "model.hyper_connection_mixer", useCombine: false)
        lmHead = resident.linear("lm_head")
    }

    /// The model's rotary embedding (the MTP head shares it).
    public var sharedRope: Rope { rope }

    /// lm_head applied to a draft-head sample hidden — the draft's logits.
    public func draftLogits(_ sample: MLXArray) -> MLXArray { lmHead(sample) }

    /// Load the MTP draft head (1.5 GB resident). Idempotent; throws when
    /// mtp.safetensors is absent.
    public func enableMTP(modelDir: URL) throws {
        guard mtpHead == nil else { return }
        mtpHead = MTPHead(try MTPWeights(modelDir: modelDir, config: cfg))
    }

    /// Conservative capacity needed before a request grows its sequence
    /// caches. Charges allocation steps, completed-block storage and the draft
    /// head when it may be used; it performs no allocation or GPU evaluation.
    public func sequenceCapacityBytes(tokens: Int, mtp: Bool) -> Int {
        let layers = cfg.layerTypes.prefix(runLayers).filter { $0 != "linear_attention" }.count + (mtp ? 1 : 0)
        let rowBytes = (2 * cfg.numKVHeads * cfg.headDim + cfg.indexerHeadDim) * 2
        return ContextGeometry.capacityBytes(tokens: tokens, layers: layers, rowBytes: rowBytes,
            pooledRowBytes: cfg.indexerHeadDim * 2, compressionRatio: cfg.indexerCompressRatio,
            indexerBudget: cfg.indexerBudget, incrementalIndexer: optimizations.incrementalIndexer)
    }

    /// Bound the next physical sequence allocations, keeping main, draft,
    /// raw-indexer and pooled-indexer capacity separate. Rollback retains spare
    /// rows, but they can only be reused by the buffer that actually owns them.
    package func sequenceAllocationBytes(tokens: Int, draftTokens: Int?, state: State,
                                         sharedBacking: Bool = false) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit,
              draftTokens.map({ $0 >= 0 && $0 <= ContextPolicy.modelLimit }) ?? true else { return Int.max }
        let kvRowBytes = ContextBytes.product(cfg.numKVHeads, cfg.headDim, 2)
        let indexRowBytes = ContextBytes.product(cfg.indexerHeadDim, 2)
        func bytes(_ end: Int, kv: KVCache?, index: IndexerCache?, compact: Bool) -> Int {
            func replacement(_ count: Int, _ rowBytes: Int, _ owned: Int, step: Int = 1024) -> Int {
                ContextGeometry.nextBufferAllocationBytes(tokens: count, rowBytes: rowBytes,
                    allocatedBytes: sharedBacking ? 0 : owned, step: step)
            }
            let rawBase = index?.rawBase ?? 0
            guard end >= rawBase else { return Int.max }
            var result = ContextBytes.sum(
                replacement(end, kvRowBytes, kv?.keys?.nbytes ?? 0),
                replacement(end, kvRowBytes, kv?.values?.nbytes ?? 0),
                replacement(end - rawBase, indexRowBytes, index?.rawAllocatedBytes ?? 0,
                    step: compact && rawBase > 0 ? 256 : 1024))
            if end > cfg.indexerBudget, optimizations.incrementalIndexer || compact {
                let blocks = end / cfg.indexerCompressRatio
                result = ContextBytes.sum(result, replacement(blocks, indexRowBytes,
                    index?.pooledAllocatedBytes ?? 0, step: 256))
                if compact {
                    let first = min(blocks * cfg.indexerCompressRatio,
                        max(0, end - 32) / cfg.indexerCompressRatio * cfg.indexerCompressRatio)
                    if first - rawBase >= 256 {
                        // Compaction also creates a fresh small tail before
                        // releasing its parent; it is not a pre-allocation credit.
                        result = ContextBytes.sum(result, replacement(end - first, indexRowBytes, 0, step: 256))
                    }
                }
            }
            return result
        }
        var total = 0
        for layer in 0 ..< runLayers where cfg.layerTypes[layer] != "linear_attention" {
            let index = state.indexer[layer]
            total = ContextBytes.sum(total, bytes(tokens, kv: state.kv[layer], index: index,
                compact: index?.compactRaw ?? optimizations.compactIndexerRaw))
        }
        if let draftTokens {
            total = ContextBytes.sum(total, bytes(draftTokens, kv: state.mtp?.kv,
                index: state.mtp?.indexer, compact: state.mtp?.indexer.compactRaw ?? false))
        }
        return total
    }

    public func makeState() -> State {
        let s = State()
        s.modelIdentity = promptCheckpointIdentity
        s.ngramCtx = Array(repeating: Int64(cfg.eosTokenId), count: cfg.ngramSize - 1)
        for l in 0 ..< runLayers {
            if cfg.layerTypes[l] == "linear_attention" {
                s.linear[l] = LinearCache()
            } else {
                s.kv[l] = KVCache()
                s.indexer[l] = IndexerCache(compactRaw: optimizations.compactIndexerRaw)
            }
        }
        return s
    }

    /// One forward pass over `ids` (1, S). Returns final hidden (1, S, hidden).
    /// `perLayerHook` (parity rigs) receives the hyper-width h after each layer.
    /// Read once: ProcessInfo builds a fresh dictionary on every access, and
    /// this used to run 48 times per token.
    static let debugDir = ProcessInfo.processInfo.environment["SS_DEBUG_DIR"]
    static let debugLayer = Int(ProcessInfo.processInfo.environment["SS_DEBUG_LAYER"] ?? "0") ?? 0

    static func debugDump(_ name: String, _ arr: MLXArray) {
        guard let dir = debugDir else { return }
        let v = arr.asType(.float32).asArray(Float.self)
        let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent(name + ".bin"))
    }

    /// Replace the embeddings under each placeholder run with the tower's rows.
    ///
    /// The template expands one `<|image_pad|>` per image into a run of them,
    /// so what has to happen is a substitution of contiguous spans — which is
    /// what this does, entirely on the GPU. The first version copied the whole
    /// hidden to the CPU as float32, looped over `S × hidden` scalars, and
    /// uploaded it again, on every prefill pass of every vision request. It
    /// also scanned the ids for placeholders and, when the count disagreed with
    /// the rows it was given, logged a line and continued with unspliced
    /// placeholder embeddings — a silently wrong answer. A run carries its own
    /// rows, so the two cannot disagree; a wrong offset is a programming error
    /// and stops here.
    public static func spliceVision(
        _ h: MLXArray, runs: [VisionRun], length S: Int, hidden: Int
    ) -> MLXArray {
        var pieces: [MLXArray] = []
        var cursor = 0
        for run in runs.sorted(by: { $0.start < $1.start }) {
            precondition(
                run.start >= cursor && run.end <= S,
                "vision run \(run.start)..<\(run.end) outside 0..<\(S) or overlapping")
            if run.start > cursor { pieces.append(h[0..., cursor ..< run.start, 0...]) }
            pieces.append(run.rows.reshaped([1, run.count, hidden]).asType(h.dtype))
            cursor = run.end
        }
        if cursor < S { pieces.append(h[0..., cursor ..< S, 0...]) }
        return pieces.count == 1 ? pieces[0] : concatenated(pieces, axis: 1)
    }

    public func hiddenStates(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) -> MLXArray {
        checkpointCompatibility { try hiddenStatesChecked(ids, state: state, vision: vision, perLayerHook: perLayerHook) }
    }

    /// A read error may leave this caller-owned state partially advanced.
    /// Discard it or restore a prior checkpoint before any reuse. Generator
    /// performs that cleanup for its checked forward calls.
    public func hiddenStatesChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        let h = try hiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)
        return mixScope(h)
    }

    private func hiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        try runHiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)!
    }

    private func validateForward(_ ids: [Int], state: State) throws {
        guard !ids.isEmpty, ids.allSatisfy({ $0 >= 0 && $0 < cfg.vocabSize }) else {
            throw ModelError("model forward requires a nonempty sequence of valid token IDs")
        }
        guard state.committedBoundaryValid else {
            throw ModelError("model state has an incomplete forward; restore a committed checkpoint or create a new state")
        }
        // State() and tokenCount are public API. Reject an uninitialized,
        // incompatible or offset-corrupted state before changing any cache;
        // otherwise QSA's required cache access can trap after early layers
        // have already advanced. MTP alignment is intentionally checked by
        // its own lifecycle: target verification may have a provisional head.
        guard state.modelIdentity == promptCheckpointIdentity,
              state.tokenCount >= 0, ids.count <= Int(Int32.max),
              state.tokenCount <= Int(Int32.max) - ids.count,
              state.linear.count == gdn.count,
              state.kv.count == qsa.count, state.indexer.count == qsa.count,
              gdn.keys.allSatisfy({ state.linear[$0] != nil }),
              qsa.keys.allSatisfy({ state.kv[$0]?.offset == state.tokenCount
                  && state.indexer[$0]?.offset == state.tokenCount }) else {
            throw ModelError("model state is uninitialized, incompatible or offset-inconsistent; use makeState() or restore a committed checkpoint")
        }
    }

    private func runHiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil,
        computeRanges: [Range<Int>]? = nil, shouldContinue: (() -> Bool)? = nil,
        demand: HiddenDemand = .fullMulti
    ) throws -> MLXArray? {
        try validateForward(ids, state: state)
        state.recordedTokenIds = state.recordingEnabled ? ids : nil
        state.recordingBaseTokenCount = state.recordingEnabled ? state.tokenCount : nil
        state.committedBoundaryValid = false
        let S = ids.count
        let referenceRows: Int
        if alignSmallReferenceDispatch, smallPrefillSweep, state.tokenCount >= smallPrefillReferenceStart,
           state.tokenCount < smallPrefillReferenceEnd {
            let blockStart = smallPrefillReferenceStart + ((state.tokenCount - smallPrefillReferenceStart) / 256) * 256
            referenceRows = min(256, smallPrefillReferenceEnd - blockStart)
        } else { referenceRows = 256 }
        let projectionRows = stableSmallPrefillProjections && smallPrefillSweep && S < referenceRows ? referenceRows : 0
        let ranges = computeRanges ?? stride(from: 0, to: S, by: 4096).map { $0 ..< min(S, $0 + 4096) }
        let layerMajor = optimizations.layerExpertWorkspace && ranges.count > 1
        // Public full-output APIs, MTP and truncated diagnostic models retain
        // all rows. The pinned final layer is QSA; no recurrent update is
        // inferred from a configuration label or omitted for another family.
        let terminalPruning = optimizations.terminalPrefillPruning && mtpHead == nil
            && runLayers == cfg.numLayers && qsa[runLayers - 1] != nil
            && perLayerHook == nil && demand != .fullMulti
        let terminalLastQuery = terminalPruning && optimizations.terminalLastQuery && demand == .lastRow
        if layerMajor {
            precondition(optimizations.compactStateWindows && optimizations.boundedIndexer && optimizations.boundedPLE
                && !state.linear.values.contains(where: { $0.record }),
                "a larger layer workspace requires bounded state, indexer, PLE and a non-recording prefill")
        }
        prepareOptimizationKernels()
        pool.workspacePiecewiseWrites = optimizations.workspacePiecewiseWrites
        state.compactStateWindows = optimizations.compactStateWindows
        ngram.compactRows = optimizations.compactNgramRows
        mtpHead?.attn.indexer.incrementalBlocks = optimizations.incrementalIndexer
        mtpHead?.attn.boundedIndexer = optimizations.boundedIndexer
        mtpHead?.attn.indexer.denseBypass = optimizations.denseIndexerBypass
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        var h0 = try resident.embedChecked(ids, shape: [1, S]).asType(.bfloat16)
        if !vision.isEmpty { h0 = Self.spliceVision(h0, runs: vision, length: S, hidden: cfg.hiddenSize) }
        Self.debugDump("embed", h0)
        var h = tiled(h0, repetitions: [1, 1, cfg.hcCount])

        // n-gram history: rolling context + new ids
        let history = state.ngramCtx + ids.map { Int64($0) }
        state.ngramCtx = Array(history.suffix(cfg.ngramSize - 1))
        let lookahead = optimizations.ngramLookahead && S >= 16 && runLayers > ngram.pleLayerIndex
            ? try ngram.beginPrefetch(history:history,nNew:S,maxTokens:optimizations.boundedPLE || layerMajor ? 256 : 1024) : nil
        defer { if let lookahead { ngram.discardPrefetch(lookahead) } }

        for l in 0 ..< runLayers {
            if shouldContinue?() == false { return nil }
            if MemTrace.on { MemTrace.enterLayer(l, kind: gdn[l] != nil ? "gdn" : "qsa") }
            moe[l]!.specializedRouter = optimizations.routerTopK
            moe[l]!.overlapShared = optimizations.overlapSharedExpert
            moe[l]!.overlapResident = optimizations.overlapResidentExperts
            qsa[l]?.indexer.denseBypass = optimizations.denseIndexerBypass
            qsa[l]?.indexer.specializedSelector = optimizations.indexerBlockTopK
            moe[l]!.workspaceComputeRanges = layerMajor ? ranges : []
            moe[l]!.workspaceTokenTile = optimizations.workspaceTokenTile
            attnHC[l].minimumProjectionRows = projectionRows
            mlpHC[l].minimumProjectionRows = projectionRows
            gdn[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.indexer.minimumProjectionRows = projectionRows
            ple[l]?.minimumProjectionRows = projectionRows
            moe[l]!.minimumProjectionRows = projectionRows
            if terminalPruning, l == runLayers - 1, demand == .stateOnly, layerMajor {
                let historyBase = history.count - S
                for range in ranges {
                    var hidden = h[0..., range, 0...]
                    if let p = ple[l] {
                        p.boundedTokens = true
                        let begin = max(0, historyBase + range.lowerBound - (cfg.ngramSize - 1))
                        hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + range.upperBound]),
                            nNew: range.count, cache: state.linear[l])
                    }
                    let x = attnHC[l](hidden).0
                    qsa[l]!.appendKeysOnly(x, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                    if shouldContinue?() == false { return nil }
                }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            if layerMajor {
                // Preserve the established 4096-token compute shapes while
                // sharing expert reads over the whole layer frontier.
                var bases: [MLXArray] = [], inputs: [MLXArray] = [], injections: [MLXArray] = []
                let historyBase = history.count - S
                for range in ranges {
                    let (lo, hi) = (range.lowerBound, range.upperBound)
                    let begin = max(0, historyBase + lo - (cfg.ngramSize - 1))
                    let lastQuery = terminalLastQuery && l == runLayers - 1
                    if lastQuery && hi < S {
                        // Earlier tiles contribute only persistent keys. Keep
                        // each original PLE/HC/projection compute shape.
                        var hidden = h[0..., lo ..< hi, 0...]
                        if let p = ple[l] {
                            p.boundedTokens = true
                            hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + hi]),
                                nNew: hi - lo, cache: state.linear[l])
                        }
                        qsa[l]!.appendKeysOnly(attnHC[l](hidden).0, rope: rope,
                            cache: state.kv[l]!, idxCache: state.indexer[l]!)
                        if shouldContinue?() == false { return nil }
                        continue
                    }
                    let prepared = try prepareScopeAttention(layer: l, hidden: h[0..., lo ..< hi, 0...],
                        history: Array(history[begin ..< historyBase + hi]), state: state, lastQueryOnly: lastQuery)
                    eval(prepared.base, prepared.input, prepared.injection)
                    state.linear[l]?.compactWindows()
                    if shouldContinue?() == false { return nil }
                    bases.append(prepared.base); inputs.append(prepared.input); injections.append(prepared.injection)
                }
                let base = concatenated(bases, axis: 1)
                let input = concatenated(inputs, axis: 1)
                let injection = concatenated(injections, axis: 1)
                if optimizations.compactScopeFrontier {
                    // The previous frontier and the component arrays are no
                    // longer needed after their joined values materialize.
                    // Release them before loading the full expert workspace.
                    eval(base, input, injection)
                    bases.removeAll(); inputs.removeAll(); injections.removeAll()
                    h = base
                }
                MemTrace.mark("scope-frontier", nil)
                moe[l]!.routerObserver = routerObserver
                moe[l]!.useLayerWorkspace = true
                if terminalPruning, l == runLayers - 1, demand == .lastRow {
                    moe[l]!.useLayerWorkspace = false
                    moe[l]!.workspaceComputeRanges = []
                    let row = input.dim(1) - 1
                    let output = try moe[l]!(input[0..., row..., 0...])
                    h = base[0..., row..., 0...] + (output.expandedDimensions(axis: -2)
                        * injection[0..., row..., 0...].expandedDimensions(axis: -1)).reshaped([1, 1, cfg.hcCount * cfg.hiddenSize])
                    terminalMoERowsSkipped += S - 1
                    if terminalLastQuery { terminalQueryRowsSkipped += S - input.dim(1) }
                } else {
                    let output = try moe[l]!(input)
                    h = base + (output.expandedDimensions(axis: -2)
                        * injection.expandedDimensions(axis: -1)).reshaped(base.shape)
                }
                eval(h)
                MemTrace.mark("layer-end", h)
                perLayerHook?(l, h)
                continue
            }
            if let p = ple[l] {
                p.boundedTokens = optimizations.boundedPLE
                h = try h + p(h, history: history, nNew: S, cache: state.linear[l] ?? nil)
                MemTrace.mark("ple", h)
            }
            let dbgLayer = Self.debugLayer
            let (x1, inj1) = attnHC[l](h)
            if l == dbgLayer { Self.debugDump("x1", x1); Self.debugDump("inj1", inj1!) }
            contextNumericsObserver?(l, "x1", x1)
            contextNumericsObserver?(l, "inj1", inj1!)
            MemTrace.mark("hc1", x1)
            if terminalPruning, l == runLayers - 1, demand == .stateOnly {
                qsa[l]!.appendKeysOnly(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                if shouldContinue?() == false { return nil }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            let attnOut: MLXArray
            if let g = gdn[l] {
                g.fusedRecording = optimizations.fusedGDNRecording
                attnOut = g(x1, cache: state.linear[l])
            } else {
                qsa[l]!.stableSmallKeyDomain = stableSmallPrefillAttention && smallPrefillSweep
                qsa[l]!.smallReferenceStart = smallPrefillReferenceStart
                qsa[l]!.smallReferenceEnd = smallPrefillReferenceEnd
                qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
                qsa[l]!.boundedIndexer = optimizations.boundedIndexer
                attnOut = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!,
                    lastQueryOnly: terminalLastQuery && l == runLayers - 1)
            }
            contextNumericsObserver?(l, "attn", attnOut)
            MemTrace.mark("attn", attnOut)
            if l == dbgLayer { Self.debugDump("attn", attnOut) }
            let lastQuery = terminalLastQuery && l == runLayers - 1
            let attentionInjection: MLXArray
            if lastQuery {
                let first = S - attnOut.dim(1)
                h = h[0..., first..., 0...]
                attentionInjection = inj1![0..., first..., 0...]
                terminalQueryRowsSkipped += first
            } else { attentionInjection = inj1! }
            h = h + (attnOut.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1))
                .reshaped(h.shape)
            contextNumericsObserver?(l, "hAfterAttn", h)
            if l == dbgLayer { Self.debugDump("hAfterAttn", h) }

            let pruneLastMoE = terminalPruning && l == runLayers - 1 && demand == .lastRow
            let (fullMLPInput, fullMLPInjection) = mlpHC[l](h)
            let mlpRow = h.dim(1) - 1
            let x2 = pruneLastMoE ? fullMLPInput[0..., mlpRow..., 0...] : fullMLPInput
            let inj2 = pruneLastMoE ? fullMLPInjection![0..., mlpRow..., 0...] : fullMLPInjection
            if pruneLastMoE {
                h = h[0..., mlpRow..., 0...]
                terminalMoERowsSkipped += S - 1
            }
            if l == dbgLayer { Self.debugDump("x2", x2) }
            contextNumericsObserver?(l, "x2", x2)
            contextNumericsObserver?(l, "inj2", inj2!)
            MemTrace.mark("hc2", x2)
            moe[l]!.routerObserver = routerObserver
            moe[l]!.useLayerWorkspace = optimizations.layerExpertWorkspace
            moe[l]!.disjointOutput = optimizations.disjointSweepOutput
            moe[l]!.boundedRows = optimizations.boundedSweepRows
            // A canonical terminal pass shorter than 256 uses the pool path.
            // Its smaller subpasses must preserve that expert arithmetic too.
            moe[l]!.smallPrefillSweep = smallPrefillSweep && referenceRows == 256
            moe[l]!.routerProjection.minimumRows = stableSmallPrefillRouting && smallPrefillSweep && S < referenceRows ? referenceRows : 0
            if let observe = contextNumericsObserver {
                moe[l]!.contextNumericsObserver = { name, value in observe(l, name, value) }
            } else { moe[l]!.contextNumericsObserver = nil }
            let moeOut = try moe[l]!(x2)
            contextNumericsObserver?(l, "moe", moeOut)
            if l == dbgLayer { Self.debugDump("moe", moeOut) }
            MemTrace.mark("moe", moeOut)
            h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
                .reshaped(h.shape)

            // synchronize the layer so pool references release before the next
            // layer's ensure() scatters (keeps slot writes in place, see PLAN §4.2)
            eval(h)
            // The layer has finished reading the convolution parent. Compact
            // only multi-token passes; a one-token decode parent is bounded
            // to the small convolution window plus one row already.
            if optimizations.compactStateWindows, S > 1 {
                state.linear[l]?.compactWindows()
            }
            MemTrace.mark("layer-end", h)
            perLayerHook?(l, h)
        }
        if shouldContinue?() == false { return nil }
        state.tokenCount += S
        state.committedBoundaryValid = true
        return h
    }

    private func mixScope(_ h: MLXArray, computeRanges: [Range<Int>]? = nil) -> MLXArray {
        let ranges = computeRanges ?? stride(from: 0, to: h.dim(1), by: 4096).map { $0 ..< min(h.dim(1), $0 + 4096) }
        guard optimizations.layerExpertWorkspace, ranges.count > 1 else { return mixer(h).0 }
        var outputs: [MLXArray] = []
        for range in ranges {
            let mixed = mixer(h[0..., range, 0...]).0
            eval(mixed); outputs.append(mixed)
        }
        return concatenated(outputs, axis: 1)
    }

    private func prepareScopeAttention(layer l: Int, hidden: MLXArray, history: [Int64], state: State, lastQueryOnly: Bool = false)
        throws -> (base: MLXArray, input: MLXArray, injection: MLXArray) {
        var h = hidden
        if let p = ple[l] {
            p.boundedTokens = true
            h = try h + p(h, history: history, nNew: h.dim(1), cache: state.linear[l])
        }
        let (x1, inject) = attnHC[l](h)
        let attention: MLXArray
        if let g = gdn[l] {
            g.fusedRecording = optimizations.fusedGDNRecording
            attention = g(x1, cache: state.linear[l])
        } else {
            qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
            qsa[l]!.boundedIndexer = true
            attention = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!, lastQueryOnly: lastQueryOnly)
        }
        let attentionInjection: MLXArray
        if lastQueryOnly {
            let first = h.dim(1) - attention.dim(1)
            h = h[0..., first..., 0...]
            attentionInjection = inject![0..., first..., 0...]
        } else { attentionInjection = inject! }
        h = h + (attention.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1)).reshaped(h.shape)
        let (x2, inject2) = mlpHC[l](h)
        return (h, x2, inject2!)
    }

    /// Transactional prefill: only a completed whole-model scope is reusable.
    /// The checkpoint owns old recurrent states; append-only sequence caches
    /// restore logical offsets while retaining (and charging) grown capacity.
    package func consumeReadScope(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) -> (logits: MLXArray?, committed: Bool) {
        checkpointCompatibility {
            try consumeReadScopeChecked(ids, passes: passes, state: state, vision: vision,
                head: head, final: final, shouldContinue: shouldContinue)
        }
    }

    package func consumeReadScopeChecked(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) throws -> (logits: MLXArray?, committed: Bool) {
        precondition(!passes.isEmpty && passes.allSatisfy { $0 > 0 } && passes.reduce(0, +) == ids.count)
        try validateForward(ids, state: state)
        var offset = 0
        let ranges = passes.map { n -> Range<Int> in
            defer { offset += n }; return offset ..< offset + n
        }
        let checkpoint = state.checkpoint()
        var committed = false
        defer {
            if !committed { state.restore(checkpoint); state.setRecording(false) }
        }
        let demand: HiddenDemand = head != nil ? .fullMulti
            : final ? .lastRow : optimizations.demandedPrefillOutput ? .stateOnly : .fullMulti
        guard let multi = try runHiddenMulti(ids, state: state, vision: vision,
            computeRanges: ranges, shouldContinue: shouldContinue, demand: demand) else { return (nil, false) }
        if let head {
            for range in ranges {
                if shouldContinue?() == false { return (nil, false) }
                state.lastMulti = try head.consumeChecked(chunk: Array(ids[range]),
                    chunkMulti: multi[0..., range, 0...], prevMulti: state.lastMulti,
                    resident: resident, rope: rope, state: state.mtp!,
                    vision: vision.compactMap { $0.clipped(to: range.lowerBound, range.upperBound) },
                    compactRetainedRow: optimizations.compactMTPRow)
            }
        }
        var logits: MLXArray?
        if final || !optimizations.demandedPrefillOutput {
            let mixed = mixScope(multi, computeRanges: multi.dim(1) == ids.count ? ranges : nil)
            if final { logits = lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...]); eval(logits!) }
            else { eval(mixed) }
        }
        if shouldContinue?() == false { return (nil, false) }
        committed = true
        return (logits, true)
    }

    /// All state-producing operations complete. The terminal QSA outputs,
    /// MoE and final mixer have no state needed by subsequent prompt passes.
    package func consumePrompt(_ ids: [Int], state: State, vision: [VisionRun] = []) {
        checkpointCompatibility { try consumePromptChecked(ids, state: state, vision: vision) }
    }

    package func consumePromptChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws {
        _ = try runHiddenMulti(ids, state: state, vision: vision, demand: .stateOnly)
    }

    /// Like `hiddenStates`, but also returns the pre-final-mixer multi stream
    /// (B,S,hc*H) — the hidden the MTP draft head consumes ("scheme A": the
    /// main model truly emits the pre-mixer stream on the first draft step).
    public func hiddenStatesWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (mixed: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try hiddenStatesWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func hiddenStatesWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (mixed: MLXArray, multi: MLXArray) {
        let multi = try hiddenMulti(ids, state: state, vision: vision)
        return (mixScope(multi), multi)
    }

    /// Logits for the last position only.
    public func lastLogits(_ ids: [Int], state: State, vision: [VisionRun] = []) -> MLXArray {
        checkpointCompatibility { try lastLogitsChecked(ids, state: state, vision: vision) }
    }

    public func lastLogitsChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws -> MLXArray {
        let multi = try runHiddenMulti(ids, state: state, vision: vision, demand: .lastRow)!
        let hidden = mixScope(multi)
        let last = hidden[0..., (hidden.dim(1) - 1)..., 0...]
        return lmHead(last)  // (1,1,vocab)
    }

    /// Logits at EVERY position plus the pre-mixer multi stream — the
    /// speculative verify pass needs both. S stays small (draft length + 1).
    public func allLogitsWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (logits: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try allLogitsWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func allLogitsWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (logits: MLXArray, multi: MLXArray) {
        let (mixed, multi) = try hiddenStatesWithMultiChecked(ids, state: state, vision: vision)
        return (lmHead(mixed), multi)
    }
}

/// A zero-copy snapshot of a State, for speculative-decode rollback. The
/// recurrent caches' arrays are REPLACED on every step (the GDN kernel emits
/// a fresh state_out; conv windows are re-sliced), never mutated in place, so
/// holding references is enough. KV/indexer buffers ARE written in place, but
/// only at rows past their offset — rolling the offset back is a full undo.
/// Compact main indexers additionally retain their bounded raw/pooled storage
/// here, so a cancelled long scope can undo released raw history exactly.
public struct StateCheckpoint {
    var lifetime: StateCheckpointLifetime
    var conv: [Int: MLXArray]
    var ssm: [Int: MLXArray]
    var pleConv: [Int: MLXArray]
    var kvOffsets: [Int: Int]
    var indexerOffsets: [Int: Int]
    var indexerSnapshots: [Int: IndexerCache.Snapshot]
    var ngramCtx: [Int64]
    var tokenCount: Int
    var committedBoundaryValid: Bool
    var mtpBoundaryValid: Bool
    var mtpOffset: Int
    var lastMulti: MLXArray?
}

extension Qwen4ExpModel.State {
    package func diagnosticIndexerBases() -> [String: Int] {
        Dictionary(uniqueKeysWithValues: indexer.map { ("index.\($0.key)", $0.value.rawBase) })
    }
    package var diagnosticDraftIndexerBase: Int? { mtp?.indexer.rawBase }
    /// Read-only logical state for exact continuation/ownership diagnostics.
    /// Indexer arrays expose the retained raw range, whose absolute base is
    /// available to package diagnostics. Released rows are represented by
    /// completed keys, not reconstructed or fabricated raw values.
    /// Returned arrays retain storage; release the snapshot before measuring
    /// liveness or memory. Unwritten KV capacity is deliberately excluded.
    public func diagnosticTensors() -> [String: MLXArray] {
        var result: [String: MLXArray] = [:]
        for (l, c) in linear {
            result["conv.\(l)"] = c.convState
            result["ssm.\(l)"] = c.ssmState
            result["ple.\(l)"] = c.pleConvState
        }
        for (l, c) in kv {
            result["key.\(l)"] = c.keys.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
            result["value.\(l)"] = c.values.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
        }
        for (l, c) in indexer { result["index.\(l)"] = c.diagnosticValues() }
        result["ngram"] = MLXArray(ngramCtx)
        result["tokens"] = MLXArray(Int64(tokenCount))
        result["lastMulti"] = lastMulti
        if let c = mtp {
            result["mtp.key"] = c.kv.keys.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.value"] = c.kv.values.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.index"] = c.indexer.diagnosticValues()
            result["mtp.offset"] = MLXArray(Int64(c.offset))
        }
        return result
    }

    public func checkpoint() -> StateCheckpoint {
        var conv: [Int: MLXArray] = [:]
        var ssm: [Int: MLXArray] = [:]
        var pleConv: [Int: MLXArray] = [:]
        for (l, c) in linear {
            if let a = c.convState { conv[l] = a }
            if let a = c.ssmState { ssm[l] = a }
            if let a = c.pleConvState { pleConv[l] = a }
        }
        checkpointLifetimes.removeAll { $0.value == nil }
        let lifetime = StateCheckpointLifetime(owner: checkpointIdentity, tokens: tokenCount,
            mtpOffset: mtp?.offset ?? 0)
        checkpointLifetimes.append(WeakStateCheckpointLifetime(lifetime))
        return StateCheckpoint(
            lifetime: lifetime, conv: conv, ssm: ssm, pleConv: pleConv,
            kvOffsets: kv.mapValues { $0.offset },
            indexerOffsets: indexer.mapValues { $0.offset },
            indexerSnapshots: indexer.compactMapValues { $0.snapshot() },
            ngramCtx: ngramCtx, tokenCount: tokenCount,
            committedBoundaryValid: committedBoundaryValid,
            mtpBoundaryValid: mtp == nil || hasValidMTP
                || (tokenCount == 0 && mtp?.offset == 0 && lastMulti == nil),
            mtpOffset: mtp?.offset ?? 0, lastMulti: lastMulti)
    }

    /// Start or stop recording per-position recurrent states in the linear
    /// layers (speculative verify passes only).
    public func setRecording(_ on: Bool) {
        recordingEnabled = on
        recordedTokenIds = nil
        recordingBaseTokenCount = nil
        for cache in indexer.values { cache.preserveRecordingRows(on) }
        for (_, cache) in linear {
            if on { cache.record = true } else { cache.clearRecording() }
        }
    }

    /// After a recording pass over `ids` from checkpoint `c`, keep only its
    /// first `n` tokens: recurrent states become the recorded ones at
    /// position n-1, KV and indexer caches trim to the checkpoint offset
    /// plus n, and the n-gram context is rebuilt from the ids. No model
    /// compute. `n` must be at least 1 and at most ids.count; keeping all of
    /// them only clears the recording.
    public func rollback(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) {
        do { try rollbackChecked(keeping: n, of: ids, from: c, ngramWindow: ngramWindow) }
        catch { preconditionFailure("\(error)") }
    }

    /// Recover only the recorded pass on this state; reject invalid input before mutation.
    public func rollbackChecked(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) throws {
        try validateRollback(keeping: n, ids: ids, checkpoint: c, ngramWindow: ngramWindow)
        if n < ids.count {
            for (_, cache) in linear {
                if !cache.ssmStates.isEmpty { cache.ssmState = cache.ssmStates[n - 1] }
                if !cache.convStates.isEmpty { cache.convState = cache.convStates[n - 1] }
                if !cache.pleConvStates.isEmpty { cache.pleConvState = cache.pleConvStates[n - 1] }
            }
            for (l, cache) in kv { cache.trim(to: (c.kvOffsets[l] ?? 0) + n) }
            for (l, cache) in indexer { cache.trim(to: (c.indexerOffsets[l] ?? 0) + n) }
            let history = c.ngramCtx + ids.prefix(n).map { Int64($0) }
            ngramCtx = Array(history.suffix(ngramWindow))
            tokenCount = c.tokenCount + n
        }
        invalidateCheckpoints(after: tokenCount, mtpOffset: nil)
        setRecording(false)
        if compactStateWindows {
            for cache in linear.values { cache.compactWindows() }
        }
    }

    /// Diagnostic for the rollback gate: the largest relative difference, over
    /// all linear layers, between this state's recurrent tensors and another's
    /// (max |a-b| / max |b|). A wrong window or a stale state reads order one;
    /// re-association reads bf16-ulp small.
    public func recurrentDelta(vs other: Qwen4ExpModel.State) -> (ssm: Double, conv: Double, ple: Double) {
        func delta(_ a: MLXArray?, _ b: MLXArray?) -> Double {
            guard let a, let b else { return (a == nil && b == nil) ? 0 : .infinity }
            guard a.shape == b.shape else { return .infinity }
            let d = abs(a.asType(.float32) - b.asType(.float32)).max().item(Float.self)
            let m = abs(b.asType(.float32)).max().item(Float.self)
            return Double(m > 0 ? d / m : d)
        }
        var s = 0.0, c = 0.0, p = 0.0
        for (l, cache) in linear {
            guard let o = other.linear[l] else { continue }
            s = max(s, delta(cache.ssmState, o.ssmState))
            c = max(c, delta(cache.convState, o.convState))
            p = max(p, delta(cache.pleConvState, o.pleConvState))
        }
        return (s, c, p)
    }

    public func restore(_ c: StateCheckpoint) {
        do { try restoreChecked(c) }
        catch { preconditionFailure("\(error)") }
    }

    /// Restore a live ancestor checkpoint from this exact state. KV storage is
    /// append-only, so snapshots from discarded future branches cannot be reused.
    public func restoreChecked(_ c: StateCheckpoint) throws {
        try validateCheckpoint(c)
        for (l, cache) in linear {
            cache.convState = c.conv[l]
            cache.ssmState = c.ssm[l]
            cache.pleConvState = c.pleConv[l]
        }
        for (l, cache) in kv {
            cache.trim(to: c.kvOffsets[l] ?? 0)
            if let k = cache.keys, let v = cache.values { eval(k, v) }
        }
        for (l, cache) in indexer {
            if let snapshot = c.indexerSnapshots[l] { cache.restore(snapshot) }
            else { cache.trim(to: c.indexerOffsets[l] ?? 0) }
            // Dense attention may not have evaluated raw indexer writes.
            // Detach their graph before a canceled scope releases its inputs.
            cache.materializeStorage()
        }
        ngramCtx = c.ngramCtx
        tokenCount = c.tokenCount
        committedBoundaryValid = c.committedBoundaryValid
        mtp?.trim(to: c.mtpOffset)
        mtp?.materialize()
        lastMulti = c.lastMulti
        invalidateCheckpoints(after: tokenCount, mtpOffset: c.mtpOffset)
        setRecording(false)
    }
}

// PLE cache slot rides on the linear cache of its (linear-attention) layer; if
// the PLE layer were ever a QSA layer this would need its own cache. Reject it
// at init time instead of failing silently.
extension Qwen4ExpModel {
    public func validate() throws {
        try Geometry.check(against: cfg, recordBytes: pool.recordBytes)
        for l in cfg.pleLayerIndices where l < runLayers {
            guard cfg.layerTypes[l] == "linear_attention" else {
                throw ModelError(
                    "PLE layer \(l) is not linear_attention, so its recurrent cache has no home — check --model")
            }
        }
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/PrefixCache.swift` — 29466 bytes, SHA-256 `f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919`.

````text
// Conversation prefix cache: reuse of one generation's model state by the next
// request, when the next prompt extends the one that produced it.
//
// Why this exists. `Generator.generate` used to call `model.makeState()` on
// every request, so a chat re-prefilled its entire history every turn. At the
// measured 92 tok/s that is ~9 s of dead air at turn 2 (~800 tokens), ~33 s at
// turn 5, ~65 s at turn 10 — by which point prefill is most of the wait for a
// 500-token reply, and all of it is recomputing tokens the previous turn
// already processed. Agentic and tool-loop use, many short turns over one long
// identical prefix, is both the worst case and the use that most justifies a
// local model.
//
// Extend-only, never rewind. A pure-attention runner can slice a KV cache to
// any prefix. This model cannot: `LinearCache` holds the GDN recurrent state,
// which is a fold over every token seen and has no inverse, and `ngramCtx`
// is likewise carried forward. So the state is reusable only when the new
// prompt *extends* exactly the ids that produced it; anything else — an edited
// earlier message, a different conversation, a regenerate with a shorter
// prompt — is a full rebuild. That covers the dominant chat and tool-loop
// shape and fails safe for the rest.
//
// Images. Token ids alone are not a sufficient key for a vision prompt: the
// template expands each image into a run of the *same* placeholder id, so two
// different pictures that resize to the same grid produce byte-identical ids.
// Matching on ids alone would hand a follow-up turn a state built from the
// wrong pixels. An entry therefore also carries an `ImageSegment` per image —
// where its run starts and a digest of the bytes that produced it — and a
// match requires the segments to agree as well as the ids. That is what makes
// a vision conversation cacheable at all; before it, every image request
// re-prefilled its whole prompt and re-ran the tower on every turn.
//
// Memory. A held state is ~27 KiB per token (KV + indexer) plus ~113 MB of
// fixed GDN recurrent state. Several conversations are genuinely additive.
// A miss evicts enough LRU entries before the caller allocates its state that
// retained + active states never exceed maxEntries and their token capacities
// share one budget. The governor sheds them before shrinking the pool.

import Foundation
import MLX

/// Sampling settings are deliberately absent: cached logits precede sampling.
/// Computation settings and model identity prevent reuse across a changed
/// numerical path or a different loaded model. No persistent cache is implied.
package struct PromptCheckpointKey: Equatable {
    // One version for direct generation and Engine requests. Long-context
    // qualification selects the same bounded arithmetic family; it is not a
    // separate cache identity. Retained logits never cross arithmetic epochs.
    package static let currentContextArithmetic = 1
    package let model: UUID
    package let optimizations: InferenceOptimizations
    package let prefillChunk: Int
    package let mtp: Bool
    package let contextArithmetic: Int
    package init(model: UUID, optimizations: InferenceOptimizations, prefillChunk: Int, mtp: Bool,
                 contextArithmetic: Int = PromptCheckpointKey.currentContextArithmetic) {
        self.model = model; self.optimizations = optimizations
        self.prefillChunk = prefillChunk; self.mtp = mtp; self.contextArithmetic = contextArithmetic
    }
}

/// A digest of one image's encoded bytes, wide enough that a collision is not
/// a practical concern. Bytes rather than the URL: the same http URL may serve
/// different pictures later, while identical bytes always decode, resize and
/// encode to the same rows for a given tower.
public struct ImageHash: Hashable, Sendable {
    public let hi: UInt64
    public let lo: UInt64
    public init(hi: UInt64, lo: UInt64) {
        self.hi = hi
        self.lo = lo
    }
}

/// One image's placeholder run inside an expanded prompt: where it starts, how
/// many tokens it occupies, and which image produced it. Offsets are in the
/// expanded id space — the same space `promptIds` is in.
public struct ImageSegment: Hashable, Sendable {
    public let start: Int
    public let count: Int
    public let hash: ImageHash
    /// Opaque in-process tower/processor identity. Legacy callers without a
    /// VisionPrompt keep nil; they cannot match a prepared image accidentally.
    package let preparationIdentity: String?
    public init(start: Int, count: Int, hash: ImageHash) {
        self.start = start
        self.count = count
        self.hash = hash
        self.preparationIdentity = nil
    }
    package init(start: Int, count: Int, hash: ImageHash, preparationIdentity: String?) {
        self.start = start
        self.count = count
        self.hash = hash
        self.preparationIdentity = preparationIdentity
    }
    /// One past the last token of the run.
    public var end: Int { start + count }
}

/// A bounded set of reusable conversation states plus the exact ids that
/// produced them. Not a general KV cache: every entry matches by exact prefix.
///
/// Entries are shared by every client, which is safe for a reason worth stating
/// rather than rediscovering: a match requires the incoming prompt to *begin
/// with the entire held id sequence*, so a client can only ever reuse state
/// whose full content it just supplied itself. There is nothing to learn from a
/// hit that the requester did not already send.
///
/// An ordinary conversation entry includes consumed reply tokens, so a repeated
/// identical prompt cannot reuse that longer state. An optional shorter input
/// checkpoint can be forked at its exact committed boundary; its remaining
/// prompt is still evaluated before any new output is sampled.
public final class PrefixCache {
    /// Main-model KV + raw indexer bytes per logical token. Retention is
    /// charged in these units using actual allocated sequence capacity, so
    /// stepped buffers, completed blocks and MTP cannot hide behind the count
    /// of live token IDs. Fixed recurrent state is budgeted separately.
    public static let bytesPerToken = 27_648

    /// 36 linear-attention layers × 48 value heads × 128 × 128 float32.
    public static let fixedBytesPerEntry = 36 * 48 * 128 * 128 * 4
    // Pinned MLX Contiguous may retain up to 16 KiB of excess backing storage.
    // Charge that bound even when a vocabulary row already owns its buffer.
    package static let logitStorageSlackBytes = 16_384

    /// How many states (conversations and reusable checkpoints) fit at once.
    ///
    /// **This is not one for a measured reason.** A single slot was defeated by
    /// the first real client it met: Open WebUI fires a title-generation
    /// request straight after each chat turn, with a completely different
    /// prompt, so by the time the user's next turn arrives the one slot holds
    /// the title prompt and the conversation has been evicted. Measured through
    /// its UI: 0 hits, 7 misses across a two-turn chat. Any client with
    /// auxiliary requests — title, tags, follow-up suggestions, embeddings —
    /// behaves the same way, so a one-slot cache is a cache that only works in
    /// benchmarks.
    public static let maxEntries = 4

    private struct Entry {
        var state: Qwen4ExpModel.State
        var tokens: [Int]
        var images: [ImageSegment]
        var used: Int
        var reusable = false
        // A speculative retention opportunity has less value than an actual
        // conversation. A hit, or an ordinary return at this same boundary,
        // gives the checkpoint normal LRU standing.
        var wasUsedOrReturned = false
        var lastLogits: MLXArray?
        var promptKey: PromptCheckpointKey?
    }

    /// Do a held entry and an incoming prompt describe the same images?
    ///
    /// Checked in both directions over the entry's token range, which matters
    /// for the asymmetric cases: an entry whose image the prompt replaced (the
    /// first loop), and a text-only entry whose ids a vision prompt happens to
    /// extend because the placeholder id can also appear as a plain token (the
    /// second loop). Runs are compared by start and digest, not by length: an
    /// entry may end part-way through a run, and a partly consumed image is
    /// still the same image.
    public static func imagesAgree(
        entry: [ImageSegment], prompt: [ImageSegment], upTo tokens: Int
    ) -> Bool {
        for e in entry {
            guard let p = prompt.first(where: { $0.start == e.start }), p.hash == e.hash,
                  p.preparationIdentity == e.preparationIdentity
            else { return false }
        }
        for p in prompt where p.start < tokens {
            guard let e = entry.first(where: { $0.start == p.start }), e.hash == p.hash,
                  e.preparationIdentity == p.preparationIdentity
            else { return false }
        }
        return true
    }

    private let lock = NSLock()
    private var entries: [Entry] = []
    private var clock = 0

    /// Ceiling on tokens held across *all* entries, so several conversations
    /// share one budget rather than each reserving the maximum. One long chat
    /// may still use the whole allowance.
    private var _maxTokens: Int
    private var _enabled: Bool
    private var budgetLimit: Int?

    /// An allocation that has been reassigned to experts cannot be restored
    /// through a later cache toggle. Only a newly applied plan changes this.
    package func setBudgetLimit(_ tokens: Int?) {
        lock.withLock {
            budgetLimit = tokens.map { max(0, $0) }
            if let budgetLimit { _maxTokens = min(_maxTokens, budgetLimit) }
            while entries.reduce(0, { $0 + Self.charge($1) }) > _maxTokens { evictLRU() }
        }
    }

    public var maxTokens: Int {
        get { lock.withLock { _maxTokens } }
        set { configure(maxTokens: newValue) }
    }
    public var enabled: Bool {
        get { lock.withLock { _enabled } }
        set {
            lock.withLock {
                _enabled = newValue
                if !newValue { _evictions += entries.count; entries.removeAll() }
            }
        }
    }

    private var _hits = 0
    private var _misses = 0
    private var _evictions = 0
    private var _checkpointHits = 0
    private var _checkpointStores = 0
    private var _checkpointForkFailures = 0
    public var hits: Int { lock.withLock { _hits } }
    public var misses: Int { lock.withLock { _misses } }
    public var evictions: Int { lock.withLock { _evictions } }
    public var checkpointHits: Int { lock.withLock { _checkpointHits } }
    public var checkpointStores: Int { lock.withLock { _checkpointStores } }
    public var heldCheckpoints: Int { lock.withLock { entries.filter(\.reusable).count } }

    public init(maxTokens: Int, enabled: Bool = true) {
        self._maxTokens = max(0, maxTokens)
        self._enabled = enabled
    }

    public var heldTokens: Int {
        lock.lock(); defer { lock.unlock() }
        return entries.reduce(0) { $0 + $1.tokens.count }
    }

    /// Additional resident ownership beyond the one active baseline already
    /// credited by the governor. Unallocated reservation never enters this sum.
    public var ownedAdditionalBytes: Int { ownedAdditionalBytes(mtpResident: false) }

    package func ownedAdditionalBytes(mtpResident: Bool) -> Int {
        lock.withLock {
            let held = entries.reduce(0) { total, entry in
                total + entry.state.allocatedSequenceBytes + Self.fixedBytesPerEntry
                    + (entry.lastLogits.map { $0.nbytes + Self.logitStorageSlackBytes } ?? 0)
            }
            let included = ContextGeometry.sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtpResident)
                + Self.fixedBytesPerEntry
            return max(0, held - included)
        }
    }

    public var heldGB: Double {
        lock.withLock {
            let bytes = entries.reduce(0) { $0 + Self.charge($1) } * Self.bytesPerToken
                + entries.count * Self.fixedBytesPerEntry
            return Double(bytes) / 1e9
        }
    }

    /// Take ownership of a state that `promptIds` extends, or nil.
    ///
    /// The *longest* matching prefix wins, so a follow-up turn resumes the
    /// deepest state available rather than an older, shorter one. An ordinary
    /// hit transfers ownership; a reusable checkpoint forks independent cache
    /// contexts when the retained and active reservations both fit. Misses keep
    /// other conversations unless making room for the new active state requires
    /// eviction, preserving the multi-client and auxiliary-request behavior.
    public func take(
        matching promptIds: [Int], images: [ImageSegment] = [], reserveTokens: Int? = nil,
        reserveSequenceBytes: Int? = nil
    ) -> (state: Qwen4ExpModel.State, reused: Int)? {
        let hit = takeForGeneration(matching: promptIds, images: images, reserveTokens: reserveTokens,
            reserveSequenceBytes: reserveSequenceBytes, completePromptKey: nil)
        return hit.map { ($0.state, $0.reused) }
    }

    /// Equal-length reuse is legal only when the exact committed state's raw
    /// next-token logits were retained. The public extend-only API stays strict.
    package func takeForGeneration(
        matching promptIds: [Int], images: [ImageSegment] = [], reserveTokens: Int? = nil,
        reserveSequenceBytes: Int? = nil, completePromptKey: PromptCheckpointKey?, modelIdentity: UUID? = nil
    ) -> (state: Qwen4ExpModel.State, reused: Int, logits: MLXArray?)? {
        lock.lock()
        defer { lock.unlock() }
        guard _enabled else { entries.removeAll(); return nil }
        var best: Int?
        for (i, e) in entries.enumerated()
        where (modelIdentity == nil || e.state.modelIdentity == modelIdentity)
            && (promptIds.count > e.tokens.count || (completePromptKey != nil
                && e.promptKey == completePromptKey && e.lastLogits != nil
                && promptIds.count == e.tokens.count)) && promptIds.starts(with: e.tokens)
            && Self.imagesAgree(entry: e.images, prompt: images, upTo: e.tokens.count) {
            if best == nil || e.tokens.count > entries[best!].tokens.count { best = i }
        }
        guard let i = best else {
            _misses += 1
            // The caller is about to allocate a new state. Make room first so
            // four retained states plus a fifth active state never coexist.
            reserveActiveTokens(max(promptIds.count, reserveTokens ?? promptIds.count, Self.tokenUnits(reserveSequenceBytes ?? 0)))
            return nil
        }
        let selected = entries[i]
        // An independent Swift context prevents later sampling/diagnostic
        // mutation from changing a retained entry. MLX owns storage aliases.
        let logits = promptIds.count == selected.tokens.count
            ? selected.lastLogits.map { $0.reshaped($0.shape) } : nil
        if selected.reusable {
            clock += 1
            entries[i].used = clock
            entries[i].wasUsedOrReturned = true
            // Charge a complete future active branch in addition to retained
            // checkpoints. If it cannot remain, transfer the original entry
            // after eviction; do not create a fifth state or an unbudgeted fork.
            reserveActiveTokens(max(promptIds.count, reserveTokens ?? promptIds.count,
                Self.tokenUnits(reserveSequenceBytes ?? 0), Self.charge(selected)))
            if entries.contains(where: { $0.state === selected.state }) {
                do {
                    let branch = try selected.state.forkForPrefix()
                    _hits += 1; _checkpointHits += 1
                    return (branch, selected.tokens.count, logits)
                } catch {
                    if let failed = entries.firstIndex(where: { $0.state === selected.state }) {
                        entries.remove(at: failed); _evictions += 1
                    }
                    _checkpointForkFailures += 1; _misses += 1
                    return nil
                }
            }
            _hits += 1
            return (selected.state, selected.tokens.count, logits)
        }
        let e = entries.remove(at: i)
        // A reused state grows too. Reserve its complete incoming prompt and
        // permitted reply before handing it out, just as on a miss.
        reserveActiveTokens(max(promptIds.count, reserveTokens ?? promptIds.count, Self.tokenUnits(reserveSequenceBytes ?? 0), Self.charge(e)))
        _hits += 1
        return (e.state, e.tokens.count, logits)
    }

    private static func tokenUnits(_ bytes: Int) -> Int {
        if bytes == Int.max { return Int.max }
        let bytes = max(0, bytes)
        return bytes / bytesPerToken + (bytes % bytesPerToken == 0 ? 0 : 1)
    }

    private static func charge(_ entry: Entry) -> Int {
        max(entry.tokens.count, tokenUnits(entry.state.allocatedSequenceBytes))
            + tokenUnits(entry.lastLogits.map { $0.nbytes + logitStorageSlackBytes } ?? 0)
    }

    /// Called with the cache lock held. Saturating the allowance also avoids
    /// overflowing a diagnostic caller's arbitrarily large reserve request.
    private func reserveActiveTokens(_ reserve: Int) {
        let allowance = _maxTokens - min(_maxTokens, max(0, reserve))
        while !entries.isEmpty && (entries.count >= Self.maxEntries
            || entries.reduce(0, { $0 + Self.charge($1) }) > allowance) {
            evictLRU()
        }
    }

    /// The ids of the longest retained entry that *extends* `prefix`, without
    /// taking it.
    ///
    /// `take` asks the opposite question — is there an entry the incoming
    /// prompt extends — and consumes what it finds. This one asks whether a
    /// previous turn's own output is still held, so the caller can splice those
    /// exact ids back in place of a re-rendered assistant turn (`Engine`'s
    /// spliced encoding). It must not consume: the caller may still decide the
    /// entry does not describe the turn the client sent, and the entry is then
    /// wanted for the ordinary `take` that follows.
    public func peek(extending prefix: [Int]) -> [Int]? {
        lock.lock()
        defer { lock.unlock() }
        guard _enabled else { return nil }
        var best: [Int]?
        // Vision entries are skipped: the caller splices these ids into a
        // text-only render that carries no images, and the resulting prompt
        // would claim placeholder tokens it has no embeddings for.
        for e in entries
        where !e.reusable && e.images.isEmpty && e.tokens.count > prefix.count
            && e.tokens.starts(with: prefix) {
            if best == nil || e.tokens.count > best!.count { best = e.tokens }
        }
        return best
    }

    /// Retain `state` as the consumer of exactly `tokens`, evicting
    /// least-recently-used entries until the shared budget fits.
    public func store(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment] = []
    ) {
        lock.lock()
        defer { lock.unlock() }
        guard _enabled, s.committedBoundaryValid, !t.isEmpty, t.count == s.tokenCount,
              t.count <= _maxTokens else { return }
        clock += 1
        // Repeating the same deterministic request produces the same consumed
        // token history. Replace its state instead of filling all four entries
        // with byte-identical conversations and evicting useful chats. Same
        // ids with different pictures is a different conversation, so the
        // images have to match for this to be a replacement.
        if let i = entries.firstIndex(where: { $0.tokens == t && $0.images == images
                && $0.state.modelIdentity == s.modelIdentity }) {
            // Cancellation at this same committed boundary may return the
            // active branch. Preserve the private reusable snapshot; adopting
            // the caller's mutable object would violate fork ownership.
            if entries[i].reusable {
                entries[i].used = clock
                entries[i].wasUsedOrReturned = true
                return
            }
            entries[i] = Entry(state: s, tokens: t, images: images, used: clock)
        } else {
            entries.append(Entry(state: s, tokens: t, images: images, used: clock))
        }
        while entries.count > Self.maxEntries
            || entries.reduce(0, { $0 + Self.charge($1) }) > _maxTokens
        {
            guard !entries.isEmpty else { break }
            evictLRU()
        }
    }

    /// Retain an exact committed common prefix while its producer continues.
    /// The caller supplies the actual consumed IDs/images, serializes with
    /// model execution and declares the producer's complete future reservation.
    /// Cache objects and MLX contexts are forked; both branches are charged at
    /// full allocated sequence capacity plus fixed recurrent state. False means
    /// retention is disabled or does not fit, without changing model behavior.
    @discardableResult
    public func storeReusableCheckpoint(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment] = [],
        reserveTokens: Int, reserveSequenceBytes: Int
    ) throws -> Bool {
        try storeCheckpoint(state: s, tokens: t, images: images, reserveTokens: reserveTokens,
            reserveSequenceBytes: reserveSequenceBytes, logits: nil, promptKey: nil)
    }

    @discardableResult
    package func storeCompletePrompt(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment] = [],
        reserveTokens: Int, reserveSequenceBytes: Int, logits: MLXArray,
        vocabularySize: Int, key: PromptCheckpointKey
    ) throws -> Bool {
        guard vocabularySize > 0, logits.size == vocabularySize,
              logits.dtype == .bfloat16 || logits.dtype == .float32 else {
            throw ModelError("complete prompt requires exactly one raw vocabulary logit row")
        }
        guard key.model == s.modelIdentity else {
            throw ModelError("complete prompt key must belong to the state's loaded model")
        }
        return try storeCheckpoint(state: s, tokens: t, images: images, reserveTokens: reserveTokens,
            reserveSequenceBytes: reserveSequenceBytes, logits: logits, promptKey: key)
    }

    private func storeCheckpoint(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment],
        reserveTokens: Int, reserveSequenceBytes: Int, logits: MLXArray?, promptKey: PromptCheckpointKey?
    ) throws -> Bool {
        guard !t.isEmpty, s.tokenCount == t.count else {
            throw ModelError("a reusable checkpoint needs its exact committed token count")
        }
        try s.validatePrefixFork()
        var committedImages: [ImageSegment] = []
        var previousEnd = 0
        for image in images {
            guard image.start >= previousEnd, image.count > 0,
                  !image.start.addingReportingOverflow(image.count).overflow else {
                throw ModelError("invalid image segments for reusable checkpoint")
            }
            previousEnd = image.start + image.count
            if image.start < t.count {
                committedImages.append(ImageSegment(start: image.start, count: min(image.count, t.count - image.start),
                    hash: image.hash, preparationIdentity: image.preparationIdentity))
            }
        }
        lock.lock(); defer { lock.unlock() }
        guard _enabled else { return false }
        let charge = max(t.count, Self.tokenUnits(s.allocatedSequenceBytes))
            + Self.tokenUnits(logits.map { $0.nbytes + Self.logitStorageSlackBytes } ?? 0)
        let active = max(t.count, reserveTokens, Self.tokenUnits(reserveSequenceBytes), charge)
        let allowance = _maxTokens - min(_maxTokens, active)
        guard charge <= allowance else { return false }
        if let existing = entries.firstIndex(where: { $0.tokens == t && $0.images == committedImages
                && $0.state.modelIdentity == s.modelIdentity && $0.reusable && $0.promptKey == promptKey }) {
            let retained = entries[existing].state
            clock += 1; entries[existing].used = clock
            reserveActiveTokens(active)
            if entries.contains(where: { $0.state === retained && $0.reusable && $0.promptKey == promptKey }) { return true }
        }
        // Plan room before changing anything. Creating an unused checkpoint
        // may replace its own exact duplicate or other unused checkpoints, but
        // cannot evict unrelated conversations or checkpoints with actual hits.
        // The active producer outside the cache still occupies the fourth slot.
        var victims = Set<Int>()
        var inheritedConversationValue = false
        if let duplicate = entries.firstIndex(where: { $0.tokens == t && $0.images == committedImages
                && $0.state.modelIdentity == s.modelIdentity }) {
            inheritedConversationValue = !entries[duplicate].reusable || entries[duplicate].wasUsedOrReturned
            victims.insert(duplicate)
        }
        var remainingCount = entries.count - victims.count
        var remainingCharge = entries.enumerated().reduce(0) { $0 + (victims.contains($1.offset) ? 0 : Self.charge($1.element)) }
        for candidate in entries.enumerated().filter({ $0.element.reusable && !$0.element.wasUsedOrReturned
                && !victims.contains($0.offset) }).sorted(by: { $0.element.used < $1.element.used }) {
            if remainingCount < Self.maxEntries - 1 && remainingCharge <= allowance - charge { break }
            victims.insert(candidate.offset); remainingCount -= 1
            remainingCharge -= Self.charge(candidate.element)
        }
        guard remainingCount < Self.maxEntries - 1, remainingCharge <= allowance - charge else { return false }
        for victim in victims.sorted(by: >) { entries.remove(at: victim); _evictions += 1 }
        let frozen = try s.forkForPrefix()
        let frozenLogits = logits.map { contiguous($0.reshaped([-1])).reshaped([-1]) }
        if let frozenLogits { eval(frozenLogits) }
        clock += 1
        entries.append(Entry(state: frozen, tokens: t, images: committedImages, used: clock, reusable: true,
            wasUsedOrReturned: inheritedConversationValue,
            lastLogits: frozenLogits, promptKey: promptKey))
        _checkpointStores += 1
        return true
    }

    private func evictLRU() {
        let optional = entries.enumerated().filter { $0.element.reusable && !$0.element.wasUsedOrReturned }
        let candidates = optional.isEmpty ? Array(entries.enumerated()) : optional
        guard let lru = candidates.min(by: { $0.element.used < $1.element.used })?.offset
        else { return }
        entries.remove(at: lru)
        _evictions += 1
    }

    /// Apply a smaller live plan immediately, evicting until it is true.
    public func configure(maxTokens: Int) {
        lock.withLock {
            _maxTokens = min(max(0, maxTokens), budgetLimit ?? Int.max)
            while entries.reduce(0, { $0 + Self.charge($1) }) > _maxTokens {
                evictLRU()
            }
        }
    }

    /// Release everything held. Used by the governor when memory tightens and
    /// by `--no-prefix-cache`.
    public func drop() {
        lock.lock()
        defer { lock.unlock() }
        _evictions += entries.count
        entries.removeAll()
    }

    public func resetStats() {
        lock.lock()
        defer { lock.unlock() }
        _hits = 0
        _misses = 0
        _evictions = 0
        _checkpointHits = 0
        _checkpointStores = 0
        _checkpointForkFailures = 0
    }

    public func json() -> [String: Any] {
        lock.lock()
        let held = entries.reduce(0) { $0 + $1.tokens.count }
        let charged = entries.reduce(0) { $0 + Self.charge($1) }
        let allocated = entries.reduce(0) { $0 + $1.state.allocatedSequenceBytes }
        let n = entries.count
        let heldImages = entries.reduce(0) { $0 + $1.images.count }
        let checkpointCount = entries.filter(\.reusable).count
        let (checkpointHits, checkpointStores, forkFailures) = (_checkpointHits, _checkpointStores, _checkpointForkFailures)
        let (h, m, e, enabled, maxTokens) =
            (_hits, _misses, _evictions, _enabled, _maxTokens)
        lock.unlock()
        return [
            "enabled": enabled,
            "conversations": n,
            "max_conversations": Self.maxEntries,
            "held_tokens": held,
            "charged_token_capacity": charged,
            "allocated_sequence_bytes": allocated,
            "held_images": heldImages,
            "reusable_checkpoints": checkpointCount,
            "checkpoint_hits": checkpointHits,
            "checkpoint_stores": checkpointStores,
            "checkpoint_fork_failures": forkFailures,
            "held_gb": (Double(
                charged * Self.bytesPerToken + n * Self.fixedBytesPerEntry) / 1e9 * 100).rounded() / 100,
            "max_tokens": maxTokens,
            "hits": h,
            "misses": m,
            "evictions": e,
        ]
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/RouterProjection.swift` — 1533 bytes, SHA-256 `98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d`.

````text
import MLX

/// The pinned matmul promotes a BF16 weight when activations are FP32. Keep
/// that exact promoted tensor only for the explicit cache experiment. The
/// original remains owned by the checkpoint/resident set and is still charged.
package final class RouterProjection {
    package var minimumRows = 0
    private let original: MLXArray
    private var promoted: MLXArray?
    private var enabled = false
    package private(set) var materializations = 0
    package var cachedBytes: Int { promoted?.nbytes ?? 0 }

    package init(_ weight: MLXArray) { original = weight }

    package func configure(cached: Bool) {
        guard cached != enabled else { return }
        enabled = cached
        if cached, original.dtype != .float32 {
            let value = original.asType(.float32)
            eval(value)
            promoted = value
            materializations += 1
        } else { promoted = nil }
    }

    package func callAsFunction(_ x: MLXArray) -> MLXArray {
        let rows = x.size / x.dim(-1)
        if rows > 0, rows < minimumRows {
            let flat = x.reshaped([rows, x.dim(-1)])
            let padded = concatenated([flat, broadcast(flat[(rows - 1)...], to: [minimumRows - rows, x.dim(-1)])], axis: 0)
            let output = matmul(padded.asType(.float32), (promoted ?? original).transposed())[0 ..< rows]
            return output.reshaped(Array(x.shape.dropLast()) + [original.dim(0)])
        }
        return matmul(x.asType(.float32), (promoted ?? original).transposed())
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/Weights.swift` — 11340 bytes, SHA-256 `27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b`.

````text
// Resident weight loading and the quantized-linear primitive.
//
// Residents = everything except routed experts (switch_mlp) and the n-gram
// store shards; ~3.8 GB at 4-bit, loaded whole via MLX's safetensors reader.

import Foundation
import MLX

/// A linear layer read from the checkpoint: quantized (weight+scales+biases)
/// or plain bf16, decided by whether `<name>.scales` exists.
public struct QLinear {
    public let w: MLXArray
    public let scales: MLXArray?
    public let biases: MLXArray?
    public let groupSize: Int
    public let bits: Int

    package init(w: MLXArray, scales: MLXArray?, biases: MLXArray?, groupSize: Int, bits: Int) {
        self.w = w; self.scales = scales; self.biases = biases
        self.groupSize = groupSize; self.bits = bits
    }

    public var isQuantized: Bool { scales != nil }

    public func callAsFunction(_ x: MLXArray) -> MLXArray {
        if let s = scales {
            return quantizedMM(
                x, w, scales: s, biases: biases, transpose: true,
                groupSize: groupSize, bits: bits)
        }
        return matmul(x, w.transposed())
    }

    /// Keep the established row dispatch for a token-wise projection. Dummy
    /// rows are cropped before any sequence operation or cache update. This
    /// does not pad attention queries, recurrent steps, or logical token IDs.
    package func callAsFunction(_ x: MLXArray, minimumRows: Int) -> MLXArray {
        Self.withReferenceRows(x, minimumRows: minimumRows) { self($0) }
    }

    package static func withReferenceRows(_ x: MLXArray, minimumRows: Int,
                                          _ project: (MLXArray) -> MLXArray) -> MLXArray {
        let rows = x.size / x.dim(-1)
        guard rows > 0, rows < minimumRows, minimumRows <= 256 else { return project(x) }
        let flat = x.reshaped([rows, x.dim(-1)])
        let padded = concatenated([flat, broadcast(flat[(rows - 1)...],
            to: [minimumRows - rows, x.dim(-1)])], axis: 0)
        let output = project(padded)
        return output[0 ..< rows].reshaped(Array(x.shape.dropLast()) + [output.dim(-1)])
    }
}

/// Anything that can hand out named tensors from a checkpoint: the resident
/// trunk (ResidentWeights) or the MTP block's own file (MTPWeights). Layer
/// blocks are built against this so the MTP head can reuse them verbatim.
public protocol TensorSource: AnyObject {
    var config: ModelConfig { get }
    func optionalTensor(_ name: String) -> MLXArray?
}

extension TensorSource {
    public func has(_ name: String) -> Bool { optionalTensor(name) != nil }

    public func tensor(_ name: String) -> MLXArray {
        guard let a = optionalTensor(name) else { fatalError("missing tensor \(name)") }
        return a
    }

    public func linear(_ base: String, groupSize: Int? = nil, bits: Int? = nil) -> QLinear {
        let w = tensor(base + ".weight")
        let s = optionalTensor(base + ".scales")
        let b = optionalTensor(base + ".biases")
        return QLinear(
            w: w, scales: s, biases: b,
            groupSize: groupSize ?? config.qGroup, bits: bits ?? config.qBits)
    }
}

public final class ResidentWeights: TensorSource {
    public let arrays: [String: MLXArray]
    public let config: ModelConfig
    package let packedGDNProjections: [Int: PackedProjectionPair]
    public var packedGDNProjectionLayers: Int { packedGDNProjections.count }
    /// Shared backing already included in named resident tensors; not extra bytes.
    public var packedGDNProjectionPayloadBytes: Int {
        packedGDNProjections.values.reduce(0) { $0 + $1.payloadBytes }
    }
    private let embeddingRows: EmbeddingRows?
    public var usesEmbeddingRows: Bool { embeddingRows != nil }
    package var embeddingReadFault: ReadFault? {
        get { embeddingRows?.readFault }
        set { embeddingRows?.readFault = newValue }
    }
    package var embeddingRowHits: Int { embeddingRows?.uniqueRowHits ?? 0 }
    package var embeddingRowMisses: Int { embeddingRows?.uniqueRowMisses ?? 0 }
    package var embeddingCachedRows: Int { embeddingRows?.cachedRows ?? 0 }
    package var embeddingCachedPayloadBytes: Int { embeddingRows?.cachedPayloadBytes ?? 0 }
    package func clearEmbeddingRows() { embeddingRows?.clear() }

    public convenience init(index: CheckpointIndex, includeLayerExperts: Set<Int> = []) throws {
        try self.init(index: index, includeLayerExperts: includeLayerExperts, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, includeLayerExperts: Set<Int> = [], embeddingRowCache: Bool?,
                 packGDNProjections: Bool = false) throws {
        // Golden/debug commands can load the multi-GB resident trunk without
        // constructing Qwen4ExpModel. They need the same cross-process guard as
        // run/serve or they can silently stack underneath another model.
        try ModelProcessGuard.acquire()
        self.config = index.config
        let setting = ProcessInfo.processInfo.environment["SLOTSTREAM_EMBEDDING_ROWS"] ?? "0"
        guard setting == "0" || setting == "1" else { throw ModelError("SLOTSTREAM_EMBEDDING_ROWS must be 0 or 1") }
        let useRows = embeddingRowCache ?? (setting == "1")
        self.embeddingRows = useRows ? try EmbeddingRows(index: index) : nil
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if key.hasPrefix("mtp.") || key.hasPrefix("vision_tower.") || key.hasPrefix("model.visual.") {
                    continue
                }
                if key.contains("ngram_embedding.shard_") { continue }
                if key.contains(".switch_mlp.") {
                    // routed experts stay on SSD unless explicitly requested (parity rig)
                    let isWanted = includeLayerExperts.contains { key.contains("model.layers.\($0).mlp.switch_mlp.") }
                    if !isWanted { continue }
                }
                kept[key] = arr
            }
        }
        var packed: [Int: PackedProjectionPair] = [:]
        if packGDNProjections {
            func projection(_ base: String) -> QLinear? {
                guard let weight = kept[base + ".weight"] else { return nil }
                return QLinear(w: weight, scales: kept[base + ".scales"], biases: kept[base + ".biases"],
                    groupSize: index.config.qGroup, bits: index.config.qBits)
            }
            for layer in config.layerTypes.indices where config.layerTypes[layer] == "linear_attention" {
                let base = "model.layers.\(layer).linear_attn"
                let a = base + ".in_proj_qkv", b = base + ".in_proj_z"
                guard let first = projection(a), let second = projection(b),
                      let pair = PackedProjectionPair(first, second) else { continue }
                for (name, view) in [(a, pair.first), (b, pair.second)] {
                    kept[name + ".weight"] = view.w
                    kept[name + ".scales"] = view.scales
                    kept[name + ".biases"] = view.biases
                }
                packed[layer] = pair
            }
        }
        self.packedGDNProjections = packed
        // Keep the public tensor dictionary complete. In the experimental row
        // path only lookup tensors stay lazy; explicit external tensor access
        // can still materialize their exact original values. No planner credit
        // is granted for this optional retention change.
        eval(kept.filter { !useRows || !EmbeddingRows.names.contains($0.key) }.map(\.value))
        self.arrays = kept
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    /// Dequantized embedding rows for token ids: (B, S) -> (B, S, hidden).
    public func embed(_ ids: MLXArray) -> MLXArray {
        do { return try embedChecked(ids) }
        catch { preconditionFailure("embedding lookup failed: \(error)") }
    }

    /// Error-propagating companion for checked main/draft execution. Larger
    /// callers are split only for independent row lookup/dequantization; no
    /// model arithmetic or chronological prefill boundary is changed.
    public func embedChecked(_ ids: MLXArray) throws -> MLXArray {
        if let embeddingRows {
            guard [.uint8, .uint16, .uint32, .uint64, .int8, .int16, .int32, .int64].contains(ids.dtype) else {
                throw ModelError("embedding row IDs must be integers")
            }
            // Validate before narrowing: a large Int64 must not wrap onto a
            // different, apparently valid token ID.
            let values = ids.asType(.int64).asArray(Int64.self).map(Int.init)
            guard values.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
                throw ModelError("embedding row ID outside vocabulary")
            }
            return try gatherEmbeddingRows(values, shape: ids.shape, rows: embeddingRows)
        }
        let w = tensor("model.embed_tokens.weight")
        guard let s = arrays["model.embed_tokens.scales"] else {
            return take(w, ids, axis: 0)
        }
        let b = arrays["model.embed_tokens.biases"]
        let rows = take(w, ids, axis: 0)
        let rs = take(s, ids, axis: 0)
        let rb = b.map { take($0, ids, axis: 0) }
        return dequantized(
            rows, scales: rs, biases: rb, groupSize: config.qGroup, bits: config.qBits)
    }

    /// Main and draft callers already own CPU token IDs. Avoid uploading them
    /// merely to synchronize a cast/readback in the row-cache path.
    package func embedChecked(_ ids: [Int], shape: [Int]) throws -> MLXArray {
        guard ids.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
            throw ModelError("embedding row ID outside vocabulary")
        }
        if let embeddingRows { return try gatherEmbeddingRows(ids, shape: shape, rows: embeddingRows) }
        return try embedChecked(MLXArray(ids.map(Int32.init), shape))
    }

    private func gatherEmbeddingRows(_ values: [Int], shape: [Int], rows: EmbeddingRows) throws -> MLXArray {
        var count = 1
        for dim in shape {
            let next = count.multipliedReportingOverflow(by: dim)
            guard dim >= 0, dim <= Int(Int32.max), !next.overflow else {
                throw ModelError("invalid embedding lookup shape")
            }
            count = next.partialValue
        }
        guard count == values.count else { throw ModelError("embedding lookup shape does not match IDs") }
        if values.isEmpty { return MLXArray.zeros(shape + [config.hiddenSize], dtype: .bfloat16) }
        if values.count <= 4096 { return try rows.gather(values, shape: shape) }
        var parts: [MLXArray] = []
        for lo in stride(from: 0, to: values.count, by: 4096) {
            let end = min(values.count, lo + 4096)
            parts.append(try rows.gather(Array(values[lo ..< end]), shape: [end - lo]))
        }
        return concatenated(parts, axis: 0).reshaped(shape + [config.hiddenSize])
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift` — 17050 bytes, SHA-256 `0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da`.

````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationCompletePrompt(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: true)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var options = InferenceOptimizations.integrationCandidate
        options.prefixCheckpointTokens = 0
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        var c = CheckBuilder("optimization-complete-prompt\(mtp ? "-mtp" : "")")
        c.expect("complete prompt remains default off", try !InferenceOptimizations.environment([:]).completePromptCheckpoint)
        c.expect("explicit complete prompt option", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "1"]).completePromptCheckpoint)
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func stateAfter(_ cache: PrefixCache, _ ids: [Int], _ output: [Int], _ vision: VisionPrompt?) throws -> [String: String] {
            guard let hit = cache.take(matching: ids + output + [907], images: vision?.segments ?? []) else {
                throw ModelError("complete-prompt diagnostic lost consumed state")
            }
            var values = hit.state.prefixForkDiagnosticTensors().mapValues(hash)
            hit.state.invalidateMTP()
            values["continuedLogits"] = hash(try model.lastLogitsChecked([907], state: hit.state))
            return values
        }
        let tower = try VisionTower(index: index)
        let bytes = ["iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
                     "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="].map { Data(base64Encoded: $0)! }
        let images = try bytes.map { try VisionPreprocess.decodeCGImage($0) }
        let plans = try images.map { try tower.plan(for: $0) }
        func vision(_ start: Int?, color: Int = 0) -> VisionPrompt? {
            guard let start else { return nil }
            return VisionPrompt(tower: tower, items: [.init(image: images[color], plan: plans[color])],
                segments: [.init(start: start, count: plans[color].mergedTokens, hash: ImageHash(hashing: bytes[color]))],
                hiddenSize: model.cfg.hiddenSize)
        }
        let cases: [(Int, Int?)] = [(17, nil), (255, nil), (256, nil), (257, nil), (1025, nil),
            (273, 1), (273 + plans[0].mergedTokens, 256 - plans[0].mergedTokens / 2)]
        for (count, imageStart) in cases {
            let label = "\(count)/image=\(String(describing: imageStart))"
            FileHandle.standardError.write(Data("complete prompt \(label)\n".utf8))
            var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
            if let imageStart {
                ids.replaceSubrange(imageStart..<imageStart+plans[0].mergedTokens,
                    with: repeatElement(model.cfg.imageTokenId, count: plans[0].mergedTokens))
            }
            let referenceCache = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            let referenceVision = vision(imageStart)
            let reference = generator.generate(promptIds: ids, params: params, eosIds: [], cache: referenceCache, vision: referenceVision)
            c.expect("\(label): reference completes", reference.1.runtimeError == nil && reference.0.count == params.maxTokens)
            let expected = try stateAfter(referenceCache, ids, reference.0, referenceVision)
            referenceCache.drop()
            options.completePromptCheckpoint = true; model.optimizations = options
            let cache = PrefixCache(maxTokens: 8192)
            for attempt in 0..<3 {
                let vp = vision(imageStart)
                let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vp)
                c.expect("\(label)/\(attempt): completes", result.1.runtimeError == nil)
                c.equal("\(label)/\(attempt): exact output IDs", result.0, reference.0)
                c.equal("\(label)/\(attempt): complete hits", result.1.completePromptHits, attempt == 0 ? 0 : 1)
                c.equal("\(label)/\(attempt): prefill tokens", result.1.prefillTokens, attempt == 0 ? count : 0)
                c.equal("\(label)/\(attempt): reused tokens", result.1.reusedPrefixTokens, attempt == 0 ? 0 : count)
                c.equal("\(label)/\(attempt): retained prompts", cache.heldCheckpoints, 1)
                c.equal("\(label)/\(attempt): checkpoint errors", result.1.prefixCheckpointErrors, 0)
                if attempt > 0 {
                    c.equal("\(label)/\(attempt): no prefill records", result.1.prefillRecords, 0)
                    c.equal("\(label)/\(attempt): no prefill passes", result.1.prefillPasses, [])
                    c.equal("\(label)/\(attempt): tower skipped", result.1.encodedImages, 0)
                }
                c.equal("\(label)/\(attempt): all state and continued logits exact", try stateAfter(cache, ids, result.0, vp), expected)
            }
            c.expect("\(label): public API remains strictly extend-only", cache.take(matching: ids, images: vision(imageStart)?.segments ?? []) == nil)
            if imageStart != nil {
                let changed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vision(imageStart, color: 1))
                c.equal("\(label): changed pixels refuse reuse", changed.1.completePromptHits, 0)
                c.equal("\(label): changed pixels rebuild prompt", changed.1.prefillTokens, count)
            }
            if count == 17 {
                for filtered in [false, true] {
                    var sample = params; sample.temperature = 0.7
                    sample.topK = filtered ? 40 : 0; sample.topP = filtered ? 0.8 : 1
                    sample.minP = filtered ? 0.05 : 0; sample.presencePenalty = filtered ? 1.1 : 0
                    for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                        sample.seed = seed
                        let cold = generator.generate(promptIds: ids, params: sample, eosIds: [])
                        let hot = generator.generate(promptIds: ids, params: sample, eosIds: [], cache: cache)
                        c.equal("sample \(filtered)/\(seed): exact output", hot.0, cold.0)
                        c.equal("sample \(filtered)/\(seed): complete hit", hot.1.completePromptHits, 1)
                    }
                }
                // Public maxTokens <= 0 means "up to the response ceiling";
                // test zero emissions through cancellation, never by asking
                // this bounded diagnostic to generate 32,768 tokens.
                for limit in [1] {
                    var limited = params; limited.maxTokens = limit
                    let result = generator.generate(promptIds: ids, params: limited, eosIds: [], cache: cache)
                    c.equal("limit \(limit): exact output count", result.0.count, limit)
                    c.equal("limit \(limit): complete hit", result.1.completePromptHits, 1)
                }
                let noOutput = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    shouldContinue: { false })
                c.expect("cancel before first output is empty", noOutput.0.isEmpty && noOutput.1.finishReason == "cancelled" && noOutput.1.requestFailure?.code == .clientCancelled)
                c.equal("zero-emission cancellation reuses complete prompt", noOutput.1.completePromptHits, 1)
                let eos = generator.generate(promptIds: ids, params: params, eosIds: [reference.0[0]], cache: cache)
                c.expect("EOS stops without output", eos.0.isEmpty && eos.1.finishReason == "stop")
                var delivered: [Int] = []
                let stopped = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    onToken: { delivered.append($0); return delivered.count < 2 })
                c.equal("callback cancellation preserves exact prefix", stopped.0, Array(reference.0.prefix(2)))
                let retry = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("cancelled request preserves root", retry.0, reference.0)
                c.equal("retry avoids prefill", retry.1.prefillTokens, 0)
                let key = PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp)
                for wrongKey in [PromptCheckpointKey(model: UUID(), optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: 128, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: !mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: mtp, contextArithmetic: 0)] {
                    c.expect("wrong model, schedule, draft or arithmetic identity refuses complete hit",
                        cache.takeForGeneration(matching: ids, completePromptKey: wrongKey) == nil)
                }
                if let root = cache.takeForGeneration(matching: ids, completePromptKey: key), let raw = root.logits {
                    let rawHash = hash(raw)
                    let unit = PrefixCache.bytesPerToken
                    let stateCharge = max(ids.count, (root.state.allocatedSequenceBytes + unit - 1) / unit)
                    let logitCharge = (raw.nbytes + PrefixCache.logitStorageSlackBytes + unit - 1) / unit
                    let charge = stateCharge + logitCharge
                    for budget in [0, charge, 2 * charge - 1, 2 * charge] {
                        let bounded = PrefixCache(maxTokens: budget)
                        let stored = try bounded.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: ids.count + params.maxTokens, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: raw, vocabularySize: model.cfg.vocabSize, key: key)
                        c.equal("logits charged at budget \(budget)", stored, budget >= 2 * charge)
                        c.equal("exact charged capacity at budget \(budget)", bounded.json()["charged_token_capacity"] as? Int,
                            stored ? charge : 0)
                    }
                    let owned = PrefixCache(maxTokens: 8192)
                    c.expect("ownership checkpoint stored", try owned.storeCompletePrompt(state: root.state, tokens: ids,
                        reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                        logits: raw, vocabularySize: model.cfg.vocabSize, key: key))
                    raw[0] = MLXArray(Float(333))
                    if let first = owned.takeForGeneration(matching: ids, completePromptKey: key), let firstRow = first.logits {
                        c.equal("producer logit context cannot mutate retained row", hash(firstRow), rawHash)
                        firstRow[0] = MLXArray(Float(-333))
                    } else { c.expect("owned checkpoint remains readable", false) }
                    if let second = owned.takeForGeneration(matching: ids, completePromptKey: key), let secondRow = second.logits {
                        c.equal("returned logit context cannot mutate retained row", hash(secondRow), rawHash)
                    } else { c.expect("owned checkpoint remains repeatable", false) }
                    do {
                        _ = try owned.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: MLXArray.zeros([2], dtype: .bfloat16), vocabularySize: model.cfg.vocabSize, key: key)
                        c.expect("malformed logits rejected", false)
                    } catch { c.expect("malformed logits rejected", true) }
                    c.equal("invalid logits preserve existing checkpoint", owned.heldCheckpoints, 1)
                    owned.configure(maxTokens: 0)
                    c.equal("pressure releases state and logits", owned.heldTokens, 0)
                    c.equal("pressure preserves borrowed active state", root.state.tokenCount, count)
                } else { c.expect("complete root exposes logits for ownership checks", false) }
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                try model.pool.diagnosticDiscardResidency()
                let fault = ReadFault(afterJobs: 0); model.pool.readFault = fault
                let failed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                model.pool.readFault = nil
                c.expect("decode read fault fires after complete reuse", fault.hasFired && failed.1.runtimeError != nil)
                c.equal("failed decode reused the prompt", failed.1.completePromptHits, 1)
                let recovered = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("decode failure preserves exact reusable root", recovered.0, reference.0)
                c.equal("read-failure retry avoids prefill", recovered.1.prefillTokens, 0)
                var edited = ids; edited[0] += 1
                let edit = generator.generate(promptIds: edited, params: params, eosIds: [], cache: cache)
                c.equal("edited token misses", edit.1.reusedPrefixTokens, 0)
                let auxiliary = generator.generate(promptIds: [17, 23, 31], params: params, eosIds: [], cache: cache)
                c.expect("auxiliary completes", auxiliary.1.runtimeError == nil)
                let interleaved = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("interleaved output remains exact", interleaved.0, reference.0)
                c.expect("charged capacity stays bounded", (cache.json()["charged_token_capacity"] as? Int ?? Int.max) <= cache.maxTokens)
            }
            cache.drop()
        }
        if mtp {
            let ids = (0..<17).map { 1000 + $0 * 79 }
            let transition = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            generator.speculationEnabled = false
            let plain = generator.generate(promptIds: ids, params: params, eosIds: [], cache: transition)
            c.expect("draft transition seed succeeds", plain.1.runtimeError == nil)
            guard let consumed = transition.peek(extending: ids) else { throw ModelError("draft transition lost exact consumed IDs") }
            let extended = consumed + [907]
            options.completePromptCheckpoint = true; model.optimizations = options
            generator.speculationEnabled = true
            let fallback = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("plain cached state finishes current request plain", fallback.1.verifyPasses, 0)
            c.equal("plain-to-draft transition really reused state", fallback.1.reusedPrefixTokens, consumed.count)
            let rebuilt = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("complete prompt with missing head is not an MTP hit", rebuilt.1.completePromptHits, 0)
            c.equal("missing draft head is rebuilt from the full prompt", rebuilt.1.prefillTokens, extended.count)
            c.expect("rebuilt draft participates", rebuilt.1.verifyPasses > 0)
            let hot = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("rebuilt draft checkpoint can be reused completely", hot.1.completePromptHits, 1)
            c.equal("reused draft output is exact", hot.0, rebuilt.0)
        }
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift` — 26965 bytes, SHA-256 `0c5f8e429c3b519d3b7ce2636961137bea7d82d7328a11180609450517a6c27e`.

````text
import Foundation
import Slotstream

extension Diagnostics {
    public static func configurableContext() throws -> CheckReport {
        var c = CheckBuilder("configurable-context")
        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
            prefillChunk: 256, mtp: false)
        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
            // Independent allocator geometry, not a restatement of a helper call.
            let rows = ((cap + 1023) / 1024) * 1024
            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
                    rows * 13 * (2 * 2 * 256 + 128) * 2)
        }
        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
        // These represent separately owned buffers, including different spare
        // main/draft capacities after rollback. A large unrelated buffer cannot
        // pay for a replacement, and old storage is not yet reclaimable.
        let keyRow = 2 * 256 * 2
        let mainGrowth = ContextGeometry.nextBufferAllocationBytes(tokens: 1025,
            rowBytes: keyRow, allocatedBytes: 1024 * keyRow)
        let draftSpare = ContextGeometry.nextBufferAllocationBytes(tokens: 1024,
            rowBytes: keyRow, allocatedBytes: 4096 * keyRow)
        c.equal("main growth charges complete replacement", mainGrowth, 2048 * keyRow)
        c.equal("draft can reuse its own spare rows", draftSpare, 0)
        c.equal("draft spare does not offset main growth", mainGrowth + draftSpare, 2048 * keyRow)
        c.equal("matching buffer reuses existing capacity", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1024, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 0)
        c.equal("absent pooled indexer needs its own allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1025, rowBytes: 256, allocatedBytes: 0, step: 256), 1280 * 256)
        c.equal("compact raw growth preserves its 256-row step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 304, rowBytes: 256, allocatedBytes: 256 * 256, step: 256), 512 * 256)
        c.equal("compact tail copy is a new allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 32, rowBytes: 256, allocatedBytes: 0, step: 256), 256 * 256)
        c.equal("provisional batch crosses the next allocation step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1023 + 1 + 16, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 2048 * keyRow)
        c.equal("checkpoint copy cannot spend shared backing", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1000, rowBytes: keyRow, allocatedBytes: 0), 1024 * keyRow)
        c.equal("invalid allocation geometry refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: Int.max, rowBytes: keyRow, allocatedBytes: 0), Int.max)
        c.equal("negative owned byte count refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1, rowBytes: keyRow, allocatedBytes: -1), Int.max)
        for room in 0 ... 18 {
            let depth = ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536)
            c.equal("provisional context bounds draft depth/\(room)", depth, min(16, max(0, room - 1)))
            if room > 0 { c.expect("pending plus drafts remain inside context/\(room)", 1 + depth <= room) }
        }
        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
        // Concurrent requests see one unchanged injected reading. Atomic
        // reservations, not real large allocations, decide how many fit.
        let reservations = RequestMemoryReservations()
        let resultLock = NSLock()
        var accepted: [RequestController] = []
        var refusals = 0
        let reservationPolicy = try ContextConfiguration(maxPrefillWaitMinutes: 0)
        DispatchQueue.concurrentPerform(iterations: 8) { _ in
            let control = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000,
                availableGB: { 0.010 })
            do {
                try control.attachReservations(reservations)
                try control.reservePreparedImageBytes(4_000_000)
                resultLock.withLock { accepted.append(control) }
            } catch { resultLock.withLock { refusals += 1 } }
        }
        c.equal("concurrent preparations cannot spend the same headroom", accepted.count, 2)
        c.equal("excess concurrent preparations refuse before allocation", refusals, 6)
        c.equal("queued decoded pixels remain reserved", reservations.reservedBytes, 8_000_000)
        if let active = accepted.first {
            do { try active.check(nextAllocationBytes: 3_000_000, phase: "test active generation") } catch {}
            c.equal("generation cannot spend queued preparation ownership", active.failure?.code, .insufficientMemory)
            c.equal("failed dispatch preserves retained-pixel reservations", reservations.reservedBytes, 8_000_000)
        }
        var retainedPreparation: RequestController? = accepted.popLast()
        accepted.removeAll()
        c.equal("prepared-image owner keeps its lease after request queue release", reservations.reservedBytes, 4_000_000)
        withExtendedLifetime(retainedPreparation) {}
        retainedPreparation = nil
        c.equal("last preparation owner releases its exact reservation", reservations.reservedBytes, 0)
        do {
            let fresh = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.010 })
            try fresh.attachReservations(reservations)
            try fresh.checkInputBytes(100_000)
            try fresh.checkInputBytes(1)
            c.equal("shorter later input check cannot release retained copies", reservations.reservedBytes, 1_600_000)
            try fresh.check(nextAllocationBytes: 4_000_000, phase: "test dispatch")
            c.equal("prepared and pending dispatch bytes are separately reserved", reservations.reservedBytes, 5_600_000)
            fresh.releaseDispatchReservation()
            c.equal("completed dispatch releases only transient ownership", reservations.reservedBytes, 1_600_000)
        }
        c.equal("request completion returns all reservations", reservations.reservedBytes, 0)
        for cap in caps {
            for target in [8.1, 10, 16, 24, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    do {
                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
                            simulated: true, qualification: true)
                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
                    } catch {
                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
                    }
                }
            }
        }
        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
            maxContextTokens: 1024, simulated: true)
        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 24, 33] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
                let next = result.maximumFeasibleWindow + 1
                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
                c.expect("next solver token refused at \(target)", p == nil)
            }
        }
        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
                let count = ContextPolicy.modelLimit - start
                var position = start
                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
                var bounded = !passes.isEmpty
                for n in passes {
                    // Ordinary scheduling has always clamped small batch
                    // overrides up to 256. The 64-row floor applies only
                    // after the 256-row query/key product no longer fits.
                    let floor = 256 * (position + 256) <= 4096 * 8016 ? 256 : 64
                    bounded = bounded && n > 0 && n <= max(floor, chunk)
                        && n * (position + n) <= 4096 * 8016
                    position += n
                }
                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
            }
        }
        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)

        var tick: UInt64 = 0
        var available = 10.0
        var connected = true
        var pressure = false
        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
                connected: { connected }, pressure: { pressure })
        }
        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
        }
        let estimated = try controller()
        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
        let reused = try controller()
        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        c.expect("fast continuation admits from its real position", reused.failure == nil)
        tick = 61_000_000_000
        do { try reused.check(phase: "image preparation") } catch {}
        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let queue = try controller()
        tick = 61_000_000_000
        do { try queue.check(phase: "queue") } catch {}
        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let decoding = try controller()
        decoding.sampledFirstToken(); tick = 61_000_000_000
        try decoding.check(phase: "decode")
        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
        let timeless = try controller(wait: 0)
        tick += 100_000_000_000; try timeless.check()
        available = 1
        do { try timeless.check(nextAllocationBytes: 1) } catch {}
        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
        available = 3
        let growth = try controller(wait: 0)
        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
        available = 10; pressure = true
        let pressed = try controller(wait: 0)
        do { try pressed.check() } catch {}
        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
        pressure = false; connected = false
        let cancelled = try controller()
        do { try cancelled.check() } catch {}
        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
            slackBytes: 1_500_000_000, availableGB: { nil })
        do { try unknown.check(nextAllocationBytes: 1) } catch {}
        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
            workingSetGB: 40.2, maxContextTokens: 65536)
        let empty = GovernorPolicy.desiredPlan(governor)
        governor.ownedAdditionalBytes = 1_000_000_000
        let owned = GovernorPolicy.desiredPlan(governor)
        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
        governor.ownedAdditionalBytes = 0
        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
            for position in [0, 32768, 65535, 65536] {
                c.expect("ordinary window preserves original floor/\(override)/\(position)",
                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
            }
        }
        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 257), Int.max)
        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
            context: 448, referenceEnd: 470), 470)
        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 17, referenceEnd: 515), 273)
        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
        c.equal("one-row tail preserves matrix query dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 449, referenceEnd: 449), 64)
        c.equal("canonical one-row terminal keeps vector dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 513, referenceEnd: 513), 1)
        c.equal("one-row tail prices its real key domain", ContextWorkspace.keyExtent(pass: 1,
            context: 449, referenceEnd: 449), 449)
        c.expect("padded tail workspace includes physical queries", ContextWorkspace.prefillBytes(pass: 1,
            context: 262143, referenceEnd: 262144, minimumProjectionRows: 256, padSmallQueries: true)
            >= 64 * 262144 * (24 * 8 + 16))
        for override in [64, 68, 127, 128, 136, 137, 255] {
            c.equal("late odd override selects a qualified full-pass shape/\(override)",
                ContextWorkspace.boundedSmallPass(requested: override, at: 200000,
                    referenceStart: 200000, referenceEnd: 262144), override >= 128 ? 128 : 64)
        }
        for origin in [0, 1, 17, 130001, 131073] {
            var position = max(origin, 256273), total = 0
            while position < ContextPolicy.modelLimit {
                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                let queries = ContextWorkspace.queryRows(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                c.expect("actual padded product stays bounded/\(origin)/\(position)",
                    queries * extent <= PrefillSchedule.measuredQueryKeyProduct)
                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
                    n <= 256 - ((position - origin) % 256))
                position += n; total += n
            }
            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
        }
        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
        for prefix in [false, true] {
            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
                on: machine, runtimePolicy: policy, qualification: true)
            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
                    simulated: true, qualification: true, runtimePolicy: policy)
                c.expect("same-policy next token fails \(prefix)", next == nil)
            }
        }
        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
        var nested = JSONValue.string("payload")
        for _ in 0 ..< 64 { nested = .array([nested]) }
        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
        // Freeze a whole-machine reading, then account for what an existing
        // instance actually owns. Restart planning and a settled governor
        // must agree across cap, retention, mode and availability changes.
        var governorCaps = Set<Int>()
        for cap in [8192, 32768, 65536, 131072, 262144] {
            for prefix in [false, true] {
                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
                    for whole in [10.0, 18.0, 44.0] {
                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
                            visionResidentReserved: mode == 2, maxContextTokens: cap,
                            qualification: true, runtimePolicy: policy)
                        guard let initial else { continue }
                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
                            - (mode == 1 ? Planner.mtpResidentGB : 0)
                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
                        guard physical >= 0 else { continue }
                        governorCaps.insert(cap)
                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
                            ownedAdditionalBytes: owned, contextQualification: true)
                        let settled = GovernorPolicy.desiredPlan(input)
                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
                        input.pressure = .critical
                        let decision = GovernorPolicy.decide(input)
                        if case .resize(let slots, _) = decision {
                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - slots)
                            input.currentSlots = slots
                        }
                        input.pressure = nil; input.secondsSincePressure = 1
                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
                            input.currentSlots = slots
                        }
                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
                    }
                }
            }
        }
        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift` — 16905 bytes, SHA-256 `90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f`.

````text
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Preregistered C07: 515 deterministic IDs, 256 reference / 512 rechunk
    /// control / 64 or 128 candidate / identical repeat, followed by three
    /// teacher-forced tokens and every keep count of a three-row rollback.
    /// Existing control band is max(3 * control drift, 1%); fixed before runs.
    /// Timings describe this short pass family, not late-context throughput.
    public static func contextSmallPass(modelDir: URL, pass: Int, swept: Bool = false, paddedRouter: Bool = false, paddedAttention: Bool = false,
                                        tokens: Int = 515, prefix: Int = 0, paddedProjections: Bool = false) throws -> CheckReport {
        guard [64, 128].contains(pass) else { throw ModelError("context small pass must be 64 or 128") }
        guard tokens >= 16, tokens <= 4096, prefix >= 0, prefix < tokens else {
            throw ModelError("context numerical fixture length or prefix is invalid")
        }
        let scoped = false, selectedAttention = false, terminalPrefill = false, terminalQuery = false
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        var options = InferenceOptimizations()
        // This feature must qualify the shipped arithmetic without enabling
        // unrelated optimization candidates to make the gate pass.
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        options.workspacePiecewiseWrites = model.optimizations.workspacePiecewiseWrites
        model.optimizations = options
        model.pool.admitOnSweep = false
        model.stableSmallPrefillRouting = paddedRouter
        model.stableSmallPrefillAttention = paddedAttention
        model.stableSmallPrefillProjections = paddedProjections
        model.alignSmallReferenceDispatch = paddedAttention
        model.smallPrefillReferenceEnd = tokens
        model.smallPrefillReferenceStart = prefix
        var c = CheckBuilder("context-small-pass-\(pass)\(swept ? "-swept" : "")\(paddedRouter ? "-router-padded" : "")\(paddedAttention ? "-attention-aligned" : "")\(paddedProjections ? "-projections-aligned" : "")/tokens=\(tokens)/prefix=\(prefix)")
        c.measure("workspace_token_tile", Double(options.workspaceTokenTile))
        c.measure("compact_scope_frontier", options.compactScopeFrontier ? 1 : 0)
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        let chunks = [256, 512, pass, pass]
        let states = chunks.map { _ in model.makeState() }
        var logits: [MLXArray] = []
        var traces: [[Int: [Int32]]] = []
        for (arm, chunk) in chunks.enumerated() {
            model.smallPrefillSweep = false
            if prefix > 0 {
                for lo in stride(from: 0, to: prefix, by: 256) {
                    let seed = model.lastLogits(Array(ids[lo ..< min(prefix, lo + 256)]), state: states[arm]); eval(seed)
                }
            }
            model.smallPrefillSweep = swept && arm >= 2
            let smallSweepsBefore = model.smallPrefillSweeps
            let paddedQueriesBefore = model.paddedSmallQueryRows
            let started = RuntimeClock.now()
            var routes: [Int: [Int32]] = [:]
            model.routerObserver = { layer, ids in routes[layer, default: []].append(contentsOf: ids) }
            model.pool.resetStats()
            let pieceWrites = model.pool.workspacePieceWriteCompletions
            var last = MLXArray(Float(0))
            model.optimizations = options
            model.optimizations.selectedTextAttention = selectedAttention && arm == 2
            model.optimizations.terminalPrefillPruning = terminalPrefill && arm == 2
            model.optimizations.terminalLastQuery = terminalQuery && arm == 2
            if arm == 2 && scoped {
                var lo = 0
                while lo < tokens {
                    let passes = PrefillSchedule.scopePasses(remaining: tokens - lo, at: lo,
                        maxChunk: 256, maxScope: chunk, tailAware: false)
                    let hi = lo + passes.reduce(0, +)
                    model.optimizations.layerExpertWorkspace = passes.count > 1
                    if passes.count > 1 {
                        let result = model.consumeReadScope(Array(ids[lo ..< hi]), passes: passes,
                            state: states[arm], vision: [], head: nil, final: hi == tokens, shouldContinue: nil)
                        c.expect("scope through \(hi) commits", result.committed)
                        if let value = result.logits { last = value }
                    } else { last = model.lastLogits(Array(ids[lo ..< hi]), state: states[arm]) }
                    eval(last); lo = hi
                }
            } else {
                for lo in stride(from: prefix, to: tokens, by: chunk) {
                    let hi = min(tokens, lo + chunk)
                    if terminalPrefill && arm == 2 && hi < tokens {
                        model.consumePrompt(Array(ids[lo ..< hi]), state: states[arm])
                    } else {
                        last = model.lastLogits(Array(ids[lo ..< hi]), state: states[arm])
                        eval(last)
                    }
                }
            }
            model.routerObserver = nil
            Stream.gpu.synchronize(); model.pool.unpinAll()
            let grouped = stride(from: prefix, to: tokens, by: chunk).filter { lo in
                let canonicalStart = prefix + ((lo - prefix) / 256) * 256
                return min(chunk, tokens - lo) >= 64 && (!paddedAttention || tokens - canonicalStart >= 256)
            }.count
            c.equal("arm\(arm): requested grouped small-pass dispatch", model.smallPrefillSweeps - smallSweepsBefore,
                swept && arm >= 2 ? grouped * model.runLayers : 0)
            c.measure("arm\(arm).seconds", RuntimeClock.seconds(since: started))
            c.measure("arm\(arm).allocated_bytes", Double(states[arm].allocatedSequenceBytes))
            c.equal("arm\(arm): correct absolute token count", states[arm].tokenCount, tokens)
            c.equal("arm\(arm): no pins survive dispatch", model.pool.pinnedSlotCount, 0)
            c.measure("arm\(arm).chunk", Double(chunk))
            c.measure("arm\(arm).read_records", Double(model.pool.recordsFetched))
            c.measure("arm\(arm).workspace_piece_writes", Double(model.pool.workspacePieceWriteCompletions - pieceWrites))
            c.measure("arm\(arm).padded_query_rows", Double(model.paddedSmallQueryRows - paddedQueriesBefore))
            if scoped && arm == 2 && options.workspacePiecewiseWrites {
                c.expect("piecewise workspace writes actually complete", model.pool.workspacePieceWriteCompletions > pieceWrites)
            }
            logits.append(last); traces.append(routes)
        }
        if terminalPrefill {
            c.equal("all undemanded terminal queries skipped", model.terminalQueryRowsSkipped,
                terminalQuery ? tokens - min(64, (tokens - 1) % 256 + 1) : tokens - ((tokens - 1) % 256 + 1))
            c.equal("all unused terminal MoE rows skipped", model.terminalMoERowsSkipped, tokens - 1)
            c.equal("last-row final router IDs", Array((traces[2][model.runLayers - 1] ?? []).suffix(model.cfg.topK)),
                Array((traces[0][model.runLayers - 1] ?? []).suffix(model.cfg.topK)))
        }
        if selectedAttention {
            c.expect("selected attention actually executed", model.selectedAttentionTiles > 0)
            c.measure("selected_attention_tiles", Double(model.selectedAttentionTiles))
        }
        model.smallPrefillSweep = false
        c.equal("identical small-pass routing on repeat", traces[2], traces[3])
        c.expect("identical small-pass logits on repeat", (logits[2] .== logits[3]).all().item(Bool.self))
        model.optimizations = options
        func relative(_ value: MLXArray, _ reference: MLXArray, spread: Bool = false) -> Double {
            guard value.shape == reference.shape, value.dtype == reference.dtype else { return .infinity }
            let a = value.asType(.float32), b = reference.asType(.float32)
            let delta = abs(a - b).max().item(Float.self)
            let denominator = spread ? (b.max() - b.min()).item(Float.self) : abs(b).max().item(Float.self)
            return Double(delta / max(denominator, 1e-6))
        }
        func band(_ label: String, _ values: [MLXArray], spread: Bool = false) {
            let control = relative(values[1], values[0], spread: spread)
            let candidate = relative(values[2], values[0], spread: spread)
            c.measure("\(label).control", control); c.measure("\(label).candidate", candidate)
            if scoped || (terminalPrefill && !spread) {
                c.expect("\(label): exact original 256-token arithmetic", candidate == 0)
            } else {
                c.expect("\(label): existing rechunk band", control.isFinite && candidate.isFinite
                    && candidate <= max(3 * control, 0.01))
            }
        }
        func compare(_ label: String, _ outputs: [MLXArray]) {
            band("\(label).logits", outputs, spread: true)
            c.equal("\(label): greedy final token", argMax(outputs[2].reshaped([-1])).item(Int.self),
                    argMax(outputs[0].reshaped([-1])).item(Int.self))
            let fields = states.map { $0.diagnosticTensors() }
            c.equal("\(label): deterministic field names", Set(fields[2].keys), Set(fields[3].keys))
            for (key, value) in fields[2] {
                c.expect("\(label): deterministic repeated \(key)", fields[3][key].map {
                    value.shape == $0.shape && (value .== $0).all().item(Bool.self)
                } ?? false)
            }
            c.equal("\(label): control fields", Set(fields[1].keys), Set(fields[0].keys))
            c.equal("\(label): candidate fields", Set(fields[2].keys), Set(fields[0].keys))
            for key in fields[0].keys.sorted() {
                guard let control = fields[1][key], let candidate = fields[2][key] else { continue }
                let values = [fields[0][key]!, control, candidate]
                if key == "tokens" || key == "ngram" {
                    c.expect("\(label): exact \(key)", (values[0] .== values[1]).all().item(Bool.self)
                        && (values[0] .== values[2]).all().item(Bool.self))
                } else { band("\(label).\(key)", values) }
            }
        }
        compare("prefill", logits)
        func disagreement(_ got: [Int: [Int32]]) -> Double {
            var missing = 0, count = 0
            for layer in traces[0].keys.sorted() where !terminalPrefill || layer != model.runLayers - 1 {
                let reference = traces[0][layer]!, candidate = got[layer] ?? []
                guard candidate.count == reference.count else { return .infinity }
                for lo in stride(from: 0, to: reference.count, by: model.cfg.topK) {
                    let selected = Set(reference[lo ..< lo + model.cfg.topK])
                    for id in candidate[lo ..< lo + model.cfg.topK] {
                        if !selected.contains(id) { missing += 1 }
                        count += 1
                    }
                }
            }
            return Double(missing) / Double(max(1, count))
        }
        if paddedAttention { c.expect("padded small key domains actually execute", model.paddedSmallKeyDomains > 0) }
        let controlRoutes = disagreement(traces[1]), candidateRoutes = disagreement(traces[2])
        c.measure("routing.control", controlRoutes); c.measure("routing.candidate", candidateRoutes)
        c.expect("route keep sets inside existing rechunk band", candidateRoutes <= max(3 * controlRoutes, 0.01))
        if scoped { c.equal("exact ordered router traces", traces[2], traces[0]) }
        if terminalPrefill {
            c.equal("all state-producing layers retain ordered routes", traces[2].filter { $0.key != model.runLayers - 1 },
                traces[0].filter { $0.key != model.runLayers - 1 })
        }
        // Teacher-forced continuation exposes drift hidden by a final-logit
        // check. The same suffix is actual work in every arm, regardless of
        // its free-generation choice.
        for token in [907, 1337, 2103] {
            logits = states.map { state in
                let value = model.lastLogits([token], state: state); eval(value); return value
            }
            compare("continued-\(token)", logits)
        }
        // Rejected speculative rows must restore the accepted prefix in all
        // schedule families, including a partial four-token indexer block.
        let checkpoints = states.map { $0.checkpoint() }
        let verify = [1137, 732, 2091]
        for keep in 1 ... verify.count {
            for (arm, state) in states.enumerated() {
                state.restore(checkpoints[arm]); state.setRecording(true)
                let verified = model.allLogitsWithMulti(verify, state: state)
                eval(verified.logits, verified.multi)
                state.rollback(keeping: keep, of: verify, from: checkpoints[arm], ngramWindow: model.cfg.ngramSize - 1)
            }
            logits = states.map { state in
                let value = model.lastLogits([907], state: state); eval(value); return value
            }
            compare("rollback-\(keep)", logits)
        }
        return c.report()
    }
}

extension Diagnostics {
    /// Bounded mechanistic probe, not a replacement for C07 qualification.
    public static func contextSmallComponents(modelDir: URL, paddedRouter: Bool = false, fullModel: Bool = false,
                                              layers: Int = 4, paddedProjections: Bool = false) throws -> CheckReport {
        guard [4, 12].contains(layers) else { throw ModelError("component probe supports four or twelve layers") }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640, runLayers: fullModel ? nil : layers)
        model.optimizations = InferenceOptimizations()
        model.pool.admitOnSweep = false
        model.stableSmallPrefillRouting = paddedRouter
        model.stableSmallPrefillProjections = paddedProjections
        model.alignSmallReferenceDispatch = paddedProjections
        model.stableSmallPrefillAttention = paddedProjections
        model.smallPrefillReferenceEnd = 515
        let ids = (0 ..< 515).map { 1000 + (($0 * 7919) % 200_000) }
        var c = CheckBuilder("context-small-components\(fullModel ? "-full" : "")\(paddedRouter ? "-router-padded" : "")\(paddedProjections ? "-projections" : "")/layers=\(layers)")
        c.measure("model_layers", Double(model.runLayers))
        var arms: [[String: MLXArray]] = []
        for chunk in [256, 512, 64] {
            model.smallPrefillSweep = chunk == 64
            var collected: [String: [MLXArray]] = [:]
            model.contextNumericsObserver = { layer, stage, value in
                guard layer < layers else { return }
                eval(value); collected["\(layer).\(stage)", default: []].append(value)
            }
            let state = model.makeState()
            for lo in stride(from: 0, to: ids.count, by: chunk) {
                let rows = Array(ids[lo ..< min(ids.count, lo + chunk)])
                let out: MLXArray
                if fullModel { out = try model.lastLogitsChecked(rows, state: state) }
                else { out = try model.hiddenStatesChecked(rows, state: state) }
                eval(out)
            }
            Stream.gpu.synchronize(); model.pool.unpinAll()
            c.equal("\(chunk): exact committed count", state.tokenCount, ids.count)
            arms.append(collected.mapValues { concatenated($0, axis: 1) })
        }
        for key in arms[0].keys.sorted() {
            let reference = arms[0][key]!.asType(.float32)
            for arm in 1 ... 2 {
                let candidate = arms[arm][key]!.asType(.float32)
                let delta = abs(candidate - reference)
                c.measure("\(key).arm\(arm).relative", Double(delta.max().item(Float.self) / max(abs(reference).max().item(Float.self), 1e-6)))
                c.measure("\(key).arm\(arm).different", Double((candidate .!= reference).sum().item(Int.self)))
                let rows = delta.reshaped([515, -1]).max(axis: 1).asArray(Float.self)
                c.measure("\(key).arm\(arm).first_row", Double(rows.firstIndex(where: { $0 != 0 }) ?? -1))
                c.expect("\(key).arm\(arm): finite", isFinite(candidate).all().item(Bool.self))
            }
        }
        model.contextNumericsObserver = nil
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift` — 5302 bytes, SHA-256 `983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd`.

````text
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationGDNProjectionPacking(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        MLX.Memory.clearCache()
        var c = CheckBuilder("optimization-gdn-projection-packing")
        let index = try CheckpointIndex(dir: modelDir)
        let initialActive = MLX.Memory.activeMemory
        let reference = try ResidentWeights(index: index, embeddingRowCache: true)
        let referenceLive = MLX.Memory.activeMemory - initialActive
        let beforePacked = MLX.Memory.activeMemory
        let packed = try ResidentWeights(index: index, embeddingRowCache: true, packGDNProjections: true)
        let packedLive = MLX.Memory.activeMemory - beforePacked
        c.measure("reference_resident_active_bytes", Double(referenceLive))
        c.measure("packed_resident_active_bytes", Double(packedLive))
        c.measure("packed_payload_bytes_already_in_named_tensors", Double(packed.packedGDNProjectionPayloadBytes))
        // Compare measured resident increments while both owners are alive.
        // A duplicated all-layer backing adds ~849MB and cannot pass this32MiB allowance.
        c.expect("packed resident has no second full projection payload", abs(packedLive - referenceLive) <= 32 << 20)
        c.equal("complete public named-tensor interface", Set(packed.arrays.keys), Set(reference.arrays.keys))
        let layers = index.config.layerTypes.indices.filter { index.config.layerTypes[$0] == "linear_attention" }
        c.equal("all recurrent layers packed", packed.packedGDNProjectionLayers, layers.count)
        c.equal("reference has no packed layers", reference.packedGDNProjectionLayers, 0)
        func exact(_ a: MLXArray, _ b: MLXArray) -> Bool {
            a.shape == b.shape && a.dtype == b.dtype &&
                (a.reshaped([-1]).view(dtype: .uint8) .== b.reshaped([-1]).view(dtype: .uint8)).all().item(Bool.self)
        }
        var expectedPayload = 0
        for layer in layers {
            let base = "model.layers.\(layer).linear_attn"
            guard let pair = packed.packedGDNProjections[layer] else { continue }
            for stem in ["in_proj_qkv", "in_proj_z"] {
                for suffix in ["weight", "scales", "biases"] {
                    let name = "\(base).\(stem).\(suffix)"
                    let a = reference.tensor(name), b = packed.tensor(name)
                    c.expect("layer\(layer): \(stem).\(suffix) exact bytes", exact(a, b))
                    // Preserve the evaluated backing layout without creating a
                    // contiguous copy; both array owners remain alive here.
                    c.equal("layer\(layer): \(stem).\(suffix) strides",
                        b.asData(access: .noCopy).strides, a.asData(access: .noCopy).strides)
                    expectedPayload += a.nbytes
                }
            }
            let a = reference.linear(base + ".in_proj_qkv"), b = reference.linear(base + ".in_proj_z")
            for rows in [1, 2, 256] {
                let values = (0..<(rows * index.config.hiddenSize)).map { Float(($0 * 31 + layer * 7) % 257 - 128) / 131 }
                let x = MLXArray(values, [1, rows, index.config.hiddenSize]).asType(.bfloat16)
                let r0 = a(x), r1 = b(x)
                let got = rows == 1 ? pair(x) : (pair.first(x), pair.second(x))
                c.expect("layer\(layer)/rows\(rows): exact QKV", exact(r0, got.0))
                c.expect("layer\(layer)/rows\(rows): exact Z", exact(r1, got.1))
                c.equal("layer\(layer)/rows\(rows): bounded fusion dispatch", pair.supportsOneToken(x), rows == 1)
            }
        }
        c.equal("shared backing payload counted once", packed.packedGDNProjectionPayloadBytes, expectedPayload)
        if let layer = layers.first, let pair = packed.packedGDNProjections[layer] {
            let width = index.config.hiddenSize
            for shape in [[2, 1, width], [1, 2, width], [1, 0, width], [1, 1, width + 1], [width]] {
                c.expect("unsupported input shape\(shape) retains fallback",
                    !pair.supportsOneToken(MLXArray.zeros(shape, dtype: .bfloat16)))
            }
            c.expect("FP32 input retains fallback", !pair.supportsOneToken(MLXArray.zeros([1, 1, width], dtype: .float32)))
            let a = pair.first, b = pair.second
            for invalid in [
                QLinear(w: a.w, scales: nil, biases: a.biases, groupSize: a.groupSize, bits: a.bits),
                QLinear(w: a.w, scales: a.scales, biases: nil, groupSize: a.groupSize, bits: a.bits),
                QLinear(w: a.w, scales: a.scales, biases: a.biases, groupSize: 0, bits: a.bits),
                QLinear(w: a.w, scales: a.scales, biases: a.biases, groupSize: a.groupSize, bits: 2),
                QLinear(w: a.w.reshaped([-1]), scales: a.scales, biases: a.biases, groupSize: a.groupSize, bits: a.bits),
                QLinear(w: a.w, scales: a.scales![0..<1, 0...], biases: a.biases, groupSize: a.groupSize, bits: a.bits)
            ].enumerated() {
                c.expect("invalid metadata\(invalid.offset) refuses packing", PackedProjectionPair(invalid.element, b) == nil)
            }
        }
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift` — 19733 bytes, SHA-256 `5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb`.

````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationPrefixRetention(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.skipUnusedFinalForward = true
        model.optimizations = options
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        var c = CheckBuilder("optimization-prefix-retention\(mtp ? "-mtp" : "")")
        let prefix = (0 ..< 256).map { 1000 + ($0 * 7919) % 200_000 }
        let prompt = prefix + (0 ..< 17).map { 1700 + $0 * 107 }
        func snapshot(_ state: Qwen4ExpModel.State) -> [String: String] {
            state.prefixForkDiagnosticTensors().mapValues { array in
                let bytes = array.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
                return "\(array.dtype):\(array.shape):\(SHA256.hash(data: Data(bytes)))"
            }
        }
        // Create an actual committed, MTP-aligned root. No sampled token has
        // been consumed and no diagnostic array is retained across mutations.
        let seedCache = PrefixCache(maxTokens: 8192)
        var keepGoing = true
        generator.onPrefillProgress = { done, total, _ in if done == total && done > 0 { keepGoing = false } }
        let seeded = generator.generate(promptIds: prefix, params: params, eosIds: [], cache: seedCache,
            shouldContinue: { keepGoing })
        generator.onPrefillProgress = nil
        guard let root = seedCache.take(matching: prompt)?.state else { throw ModelError("prefix retention seed missing") }
        c.expect("seed succeeds without output", seeded.1.runtimeError == nil && seeded.0.isEmpty)
        c.equal("seed is exactly committed", root.tokenCount, prefix.count)
        if mtp { c.expect("seed draft is aligned", root.hasValidMTP) }
        let original = snapshot(root)
        let bytes = root.allocatedSequenceBytes
        let unit = PrefixCache.bytesPerToken
        let charge = max(prefix.count, bytes / unit + (bytes % unit == 0 ? 0 : 1))
        func store(_ cache: PrefixCache, reserve: Int? = nil, sequence: Int? = nil,
                   images: [ImageSegment] = []) throws -> Bool {
            try cache.storeReusableCheckpoint(state: root, tokens: prefix, images: images,
                reserveTokens: reserve ?? charge, reserveSequenceBytes: sequence ?? bytes)
        }
        for limit in [0, charge, charge * 2 - 1, charge * 2, charge * 3, charge * 4, charge * 8] {
            let cache = PrefixCache(maxTokens: limit)
            let retained = try store(cache)
            c.equal("budget \(limit): exact two-state fit", retained, limit >= charge * 2)
            c.equal("budget \(limit): retained charge", cache.json()["charged_token_capacity"] as? Int,
                retained ? charge : 0)
            c.equal("budget \(limit): store count", cache.checkpointStores, retained ? 1 : 0)
            cache.drop()
        }
        let cache = PrefixCache(maxTokens: charge * 8)
        c.expect("initial retention", try store(cache))
        c.expect("same committed prefix is deduplicated", try store(cache))
        c.equal("dedup allocates no new checkpoint", cache.checkpointStores, 1)
        c.equal("one frozen entry", cache.heldCheckpoints, 1)
        c.expect("input checkpoint cannot become assistant output", cache.peek(extending: Array(prefix.prefix(10))) == nil)
        c.expect("equal length cannot produce next logits", cache.take(matching: prefix) == nil)
        var edited = prompt; edited[19] += 1
        c.expect("edited earlier token misses", cache.take(matching: edited) == nil)
        for n in 0 ..< 3 {
            guard let branch = cache.take(matching: prompt, reserveTokens: charge) else {
                throw ModelError("repeat prefix fork missing")
            }
            c.expect("branch \(n): independent root", branch.state !== root)
            c.equal("branch \(n): exact represented state", snapshot(branch.state), original)
            c.equal("branch \(n): retained snapshot survives", cache.heldCheckpoints, 1)
            c.equal("branch \(n): reuse count", branch.reused, 256)
        }
        c.equal("three reusable hits", cache.checkpointHits, 3)
        // Returning a producer at the same boundary must not replace the
        // private snapshot with this externally owned mutable state.
        let producer = try root.forkForPrefix()
        cache.store(state: producer, tokens: prefix)
        producer.tokenCount = 0
        c.equal("ordinary return preserves reusable status", cache.heldCheckpoints, 1)
        c.equal("ordinary return preserves private state", cache.take(matching: prompt)?.state.tokenCount, 256)
        c.expect("huge token reservation refuses without eviction", try !store(cache, reserve: Int.max))
        c.expect("huge byte reservation refuses without eviction", try !store(cache, sequence: Int.max))
        c.equal("refusal preserves coherent checkpoint", cache.heldCheckpoints, 1)
        // Synthetic IDs below exercise cache selection/accounting only. They
        // are never fed to the model with these bookkeeping fixture states.
        for n in 0 ..< 3 {
            let ids = Array(repeating: 800 + n, count: 256)
            cache.store(state: try root.forkForPrefix(), tokens: ids)
        }
        c.equal("four retained states while idle", cache.json()["conversations"] as? Int, 4)
        c.expect("existing checkpoint survives room for active branch", try store(cache))
        c.equal("at most three retained plus producer", cache.json()["conversations"] as? Int, 3)
        cache.drop()
        c.expect("reseed before longest-match fixture", try store(cache))
        let longer = prefix + [17]
        let longerState = try root.forkForPrefix(); longerState.tokenCount = longer.count
        cache.store(state: longerState, tokens: longer)
        c.equal("ordinary output still available for splicing", cache.peek(extending: prefix), longer)
        let longest = cache.take(matching: longer + [23])
        c.expect("longer ordinary entry wins", longest?.state === longerState)
        c.equal("longer ordinary reuse", longest?.reused, 257)
        c.equal("shorter common checkpoint stays retained", cache.heldCheckpoints, 1)
        cache.configure(maxTokens: charge)
        let forkHits = cache.checkpointHits
        let transferred = cache.take(matching: prompt, reserveTokens: charge)
        c.expect("tight reservation transfers coherent ownership", transferred != nil)
        c.equal("transfer avoids extra fork", cache.checkpointHits, forkHits)
        c.equal("transferred checkpoint no longer retained", cache.heldCheckpoints, 0)
        if let transferred { c.equal("transferred bytes are intact", snapshot(transferred.state), original) }
        for action in 0 ..< 4 {
            cache.setBudgetLimit(nil); cache.enabled = true; cache.configure(maxTokens: charge * 8)
            c.expect("lifecycle \(action): seed", try store(cache))
            let active = cache.take(matching: prompt)!.state
            switch action {
            case 0: cache.drop()
            case 1: cache.configure(maxTokens: 0)
            case 2: cache.enabled = false
            default:
                cache.setBudgetLimit(0); cache.configure(maxTokens: charge * 8)
                c.equal("released budget cannot be resurrected", cache.maxTokens, 0)
            }
            c.equal("lifecycle \(action): retention released", cache.heldTokens, 0)
            c.equal("lifecycle \(action): active branch survives", snapshot(active), original)
            if action != 0 { c.expect("lifecycle \(action): refuses new retention", try !store(cache)) }
        }
        cache.setBudgetLimit(nil); cache.enabled = true; cache.configure(maxTokens: charge * 8)
        c.expect("validation seed", try store(cache))
        func rejected(_ name: String, _ operation: () throws -> Void) {
            do { try operation(); c.expect(name, false) } catch { c.expect(name, true) }
            c.equal("\(name): no prior checkpoint lost", cache.heldCheckpoints, 1)
        }
        rejected("wrong token count") {
            _ = try cache.storeReusableCheckpoint(state: root, tokens: prefix + [1], reserveTokens: charge, reserveSequenceBytes: bytes)
        }
        root.setRecording(true)
        rejected("recording state") { _ = try store(cache) }
        root.setRecording(false)
        if mtp {
            let row = root.lastMulti
            root.lastMulti = nil
            rejected("misaligned draft state") { _ = try store(cache) }
            rejected("misaligned draft fork") { _ = try root.forkForPrefix() }
            root.lastMulti = row
        }
        for failureLayer in [0, 3] {
            let broken = try root.forkForPrefix(), saved = broken.checkpoint()
            try model.pool.diagnosticDiscardResidency()
            let fault = ReadFault(afterJobs: 0)
            model.routerObserver = { layer, _ in if layer == failureLayer { model.pool.readFault = fault } }
            do { _ = try model.lastLogitsChecked([907], state: broken); c.expect("partial layer\(failureLayer): read error", false) }
            catch { c.expect("partial layer\(failureLayer): read error", true) }
            model.routerObserver = nil; model.pool.readFault = nil
            c.expect("partial layer\(failureLayer): fault fired", fault.hasFired)
            c.equal("partial layer\(failureLayer): old count alone is insufficient", broken.tokenCount, prefix.count)
            rejected("partial layer\(failureLayer): cannot publish checkpoint") {
                _ = try cache.storeReusableCheckpoint(state: broken, tokens: prefix,
                    reserveTokens: charge, reserveSequenceBytes: bytes)
            }
            rejected("partial layer\(failureLayer): cannot fork") { _ = try broken.forkForPrefix() }
            rejected("partial layer\(failureLayer): cannot continue") { _ = try model.lastLogitsChecked([17], state: broken) }
            let invalidCache = PrefixCache(maxTokens: charge * 8)
            invalidCache.store(state: broken, tokens: prefix)
            c.equal("partial layer\(failureLayer): ordinary cache refuses too", invalidCache.heldTokens, 0)
            broken.restore(saved)
            c.equal("partial layer\(failureLayer): restore recovers exact state", snapshot(broken), original)
            c.equal("partial layer\(failureLayer): restored prefix can fork", snapshot(try broken.forkForPrefix()), original)
            c.equal("partial layer\(failureLayer): pins released", model.pool.pinnedSlotCount, 0)
        }
        let hash = ImageHash(hi: 17, lo: 23)
        for images in [[ImageSegment(start: -1, count: 1, hash: hash)],
                       [ImageSegment(start: 0, count: 0, hash: hash)],
                       [ImageSegment(start: Int.max, count: 1, hash: hash)],
                       [ImageSegment(start: 2, count: 10, hash: hash), ImageSegment(start: 3, count: 2, hash: hash)]] {
            rejected("malformed image \(images)") { _ = try store(cache, images: images) }
        }
        // This tests image metadata identity, not tower numerical integration.
        cache.drop()
        let image = ImageSegment(start: 128, count: 256, hash: hash, preparationIdentity: "fixture-A")
        let future = ImageSegment(start: 1000, count: 2, hash: hash)
        c.expect("partial image and future span retained correctly", try store(cache, images: [image, future]))
        c.equal("future image absent from checkpoint", cache.json()["held_images"] as? Int, 1)
        c.expect("same partial image hits", cache.take(matching: prompt, images: [image]) != nil)
        c.expect("image versus text misses", cache.take(matching: prompt) == nil)
        c.expect("different pixels miss", cache.take(matching: prompt,
            images: [ImageSegment(start: 128, count: 256, hash: ImageHash(hi: 18, lo: 23), preparationIdentity: "fixture-A")]) == nil)
        c.expect("different preparation misses", cache.take(matching: prompt,
            images: [ImageSegment(start: 128, count: 256, hash: hash, preparationIdentity: "fixture-B")]) == nil)
        cache.drop()

        // Actual Generator requests keep identical chronological pass boundaries
        // in cold and checkpoint paths, so full generated IDs must be exact.
        let reference = generator.generate(promptIds: prompt, params: params, eosIds: [])
        c.expect("reference generation succeeds", reference.1.runtimeError == nil)
        options.prefixCheckpointTokens = 256; model.optimizations = options
        for n in 0 ..< 3 {
            let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
            c.expect("request \(n): succeeds", result.1.runtimeError == nil)
            c.equal("request \(n): exact output", result.0, reference.0)
            c.equal("request \(n): exact reused prefix", result.1.reusedPrefixTokens, n == 0 ? 0 : 256)
            c.equal("request \(n): fork observation", result.1.prefixCheckpointForks, n == 0 ? 0 : 1)
            c.equal("request \(n): checkpoint error count", result.1.prefixCheckpointErrors, 0)
            c.equal("request \(n): snapshot remains reusable", cache.heldCheckpoints, 1)
            if mtp { c.expect("request \(n): draft verification still runs", result.1.verifyPasses > 0) }
        }
        for (n, count) in [17, 259, 1795].enumerated() {
            let branchPrompt = prefix + (0 ..< count).map { 3100 + (($0 * 997 + n) % 190_000) }
            options.prefixCheckpointTokens = 0; model.optimizations = options
            let direct = generator.generate(promptIds: branchPrompt, params: params, eosIds: [])
            options.prefixCheckpointTokens = 256; model.optimizations = options
            let branch = generator.generate(promptIds: branchPrompt, params: params, eosIds: [], cache: cache)
            c.expect("divergent client \(n): direct and branch succeed", direct.1.runtimeError == nil && branch.1.runtimeError == nil)
            c.equal("divergent client \(n): shared prefix reused", branch.1.reusedPrefixTokens, 256)
            c.equal("divergent client \(n): exact output", branch.0, direct.0)
            let auxiliary = generator.generate(promptIds: [19, 23, 907], params: params, eosIds: [], cache: cache)
            c.expect("auxiliary request \(n): succeeds", auxiliary.1.runtimeError == nil)
            c.equal("auxiliary request \(n): does not steal common prefix", cache.heldCheckpoints, 1)
            c.expect("auxiliary request \(n): respects state count", (cache.json()["conversations"] as? Int ?? 99) <= PrefixCache.maxEntries)
        }
        cache.drop()
        // Cancellation returns exactly the boundary we just checkpointed.
        keepGoing = true
        generator.onPrefillProgress = { done, _, _ in if done == 256 { keepGoing = false } }
        let cancelled = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
            shouldContinue: { keepGoing })
        generator.onPrefillProgress = nil
        c.expect("boundary cancellation emits nothing", cancelled.0.isEmpty)
        c.equal("boundary cancellation preserves checkpoint", cache.heldCheckpoints, 1)
        c.equal("boundary cancellation has exact committed bytes", snapshot(cache.take(matching: prompt)!.state), original)
        cache.drop()
        // A later failed forward cannot invalidate an earlier frozen commit.
        try model.pool.diagnosticDiscardResidency()
        let fault = ReadFault(afterJobs: 0)
        generator.onPrefillProgress = { done, _, _ in if done == 256 { model.pool.readFault = fault } }
        let failed = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
        model.pool.readFault = nil; generator.onPrefillProgress = nil
        c.expect("second-pass fault exercised", fault.hasFired)
        c.expect("second-pass failure reported without output", failed.1.runtimeError != nil && failed.0.isEmpty)
        c.equal("failure retains only the committed prefix", cache.heldTokens, 256)
        c.equal("failure leaves no request pins", model.pool.pinnedSlotCount, 0)
        let retry = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
        c.equal("retry resumes committed prefix", retry.1.reusedPrefixTokens, 256)
        c.expect("retry succeeds", retry.1.runtimeError == nil)
        c.equal("retry produces exact output", retry.0, reference.0)
        cache.drop()
        options.prefixCheckpointTokens = 512; model.optimizations = options
        let noBoundary = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
        c.equal("absent boundary changes no batching", noBoundary.1.prefillPasses, reference.1.prefillPasses)
        c.equal("absent boundary retains no checkpoint", cache.heldCheckpoints, 0)
        c.equal("absent boundary exact output", noBoundary.0, reference.0)
        c.equal("producer remains unchanged throughout", snapshot(root), original)
        if mtp {
            // The legacy callback above intentionally retains a committed
            // prefix. A typed request cancellation must instead fail closed,
            // including when the speculative loop has an inout stats borrow.
            let configuration = try ContextConfiguration(maxContextTokens: 1024, maxPrefillWaitMinutes: 0)
            let shortPrompt = Array(prefix.prefix(17))
            for stopAt in [0, 1, 3] {
                let request = RequestController(configuration: configuration, slackBytes: 0)
                let held = PrefixCache(maxTokens: 8192)
                var delivered = 0
                let stopped = generator.generate(promptIds: shortPrompt, params: params, eosIds: [], cache: held,
                    shouldContinue: { delivered < stopAt },
                    onToken: { _ in delivered += 1; return true }, request: request)
                c.equal("typed MTP cancel \(stopAt): exact delivery boundary", stopped.0.count, stopAt)
                c.equal("typed MTP cancel \(stopAt): failure code", stopped.1.requestFailure?.code, .clientCancelled)
                c.expect("typed MTP cancel \(stopAt): failure is observable", stopped.1.runtimeError != nil)
                c.equal("typed MTP cancel \(stopAt): invalid request state is not retained", held.heldTokens, 0)
                c.equal("typed MTP cancel \(stopAt): all request pins released", model.pool.pinnedSlotCount, 0)
            }
            let recovery = generator.generate(promptIds: shortPrompt, params: params, eosIds: [],
                request: RequestController(configuration: configuration, slackBytes: 0))
            c.expect("typed MTP cancellation recovers on a fresh request", recovery.1.runtimeError == nil)
            c.equal("typed MTP recovery completes its reply", recovery.0.count, params.maxTokens)
            c.equal("typed MTP recovery releases its pins", model.pool.pinnedSlotCount, 0)
        }
        c.measure("checkpoint_allocated_sequence_bytes", Double(bytes))
        c.measure("checkpoint_charged_tokens", Double(charge))
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/slotstream-cli/ContextCommands.swift` — 23067 bytes, SHA-256 `ac3bdf70521f77c42fada851e132a1561c4ee06e5057302cb3f50d8f3cc597d3`.

````text
// context-check: measure what a long prompt really costs on this Mac.
// prefill-schedule: the pass ladder and the wait it implies, no weights needed.

import ArgumentParser
import Foundation
import Slotstream

// MARK: prefill-schedule

struct PrefillScheduleCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "prefill-schedule",
        abstract: "Print the prefill passes a prompt runs and the wait they imply (no weights needed)")
    @Option(help: "Largest pass the plan allows (the `prefill:` line of the banner)")
    var chunk: Int = 4096
    @Option(help: "Prompt length in tokens") var tokens: Int = ContextPolicy.defaultTokens
    @Option(help: "Tokens already held by the state (a prefix-cache hit)") var from: Int = 0
    @Flag(name: .customLong("json"), help: "Machine-readable output") var asJSON = false

    func validate() throws {
        guard chunk >= 1, chunk <= 65_536 else { throw ValidationError("--chunk must be between 1 and 65536") }
        guard tokens >= 1 else { throw ValidationError("--tokens must be at least 1") }
        guard from >= 0, from <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - from else {
            throw ValidationError("--from plus --tokens must fit the pinned model limit of \(ContextPolicy.modelLimit)")
        }
    }

    func run() throws {
        let tailAware = try InferenceOptimizations.environment().tailAwarePrefill
        let passes = PrefillSchedule.passes(tokens: tokens, from: from, maxChunk: chunk, tailAware: tailAware)
        let secs = PrefillSchedule.estSeconds(tokens: tokens, from: from, maxChunk: chunk, tailAware: tailAware)
        if asJSON {
            let d: [String: Any] = [
                "chunk": chunk, "tokens": tokens, "from": from,
                "passes": passes, "pass_count": passes.count, "tail_aware": tailAware,
                "est_seconds": secs.isFinite ? secs as Any : NSNull(),
                "measured_query_key_product": PrefillSchedule.measuredQueryKeyProduct,
                "min_chunk": PrefillSchedule.minChunk,
            ]
            let data = try JSONSerialization.data(withJSONObject: d, options: [.prettyPrinted, .sortedKeys])
            print(String(decoding: data, as: UTF8.self))
            return
        }
        // Collapse the ladder into runs: "4096 x1, 2048 x5, ..."
        var runs: [(Int, Int)] = []
        for p in passes {
            if let last = runs.last, last.0 == p { runs[runs.count - 1].1 += 1 } else { runs.append((p, 1)) }
        }
        print("reading \(tokens) tokens from position \(from) with a \(chunk)-token pass:")
        print("  passes: " + runs.map { "\($0.0) x\($0.1)" }.joined(separator: ", ")
            + " (\(passes.count) passes)")
        print("  wait:   ~\(PrefillSchedule.describe(seconds: secs)) before the first token "
            + "(measured per-pass rates, see MEASUREMENTS.md)")
        print("  rule:   pass x context stays under \(PrefillSchedule.measuredQueryKeyProduct) "
            + "(4096 x 8016, the largest measured), never below \(PrefillSchedule.minChunk)")
    }
}

// MARK: context-check

/// Reads a synthetic prompt of N tokens through the real engine and reports
/// what it cost: seconds, tok/s, and the process RSS high-water against the
/// plan's expected peak. It watches reclaimable memory between passes and
/// stops before the machine swaps; it writes nothing, so a number it prints
/// becomes a MEASUREMENTS.md entry by a person, not by the tool.
struct ContextCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "context-check",
        abstract: "Measure what reading an N-token prompt costs on this Mac: time, tok/s, peak memory, and whether it stayed inside the plan")
    @OptionGroup var model: ModelOptions
    @Option(help: "Prompt length in tokens (rungs double from 2048 up to here with --ladder)")
    var tokens: Int = 8192
    @Option(help: "Required output tokens, reserved before loading") var replyTokens: Int = 16
    @Option(help: "Accepted request to first token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0
    @Option(help: "Independent wall-clock ceiling for each diagnostic rung") var wallSeconds = 7200.0
    @Flag(help: "Compatibility flag; context qualification always samples physical footprint every 20 ms")
    var sampleFootprint = false
    @Flag(help: "Run 2048, 4096, ... up to --tokens, stopping at the first rung that leaves the plan")
    var ladder = false
    @Flag(help: "Print the unqualified plan and exact runtime controls without loading an Engine")
    var planOnly = false
    @Option(help: "Retain this many distinct conversations and interleave follow-ups before the capacity request (0...4)")
    var warmConversations = 0
    @Option(help: "Prompt tokens in each retained warm-up conversation") var warmTokens = 2048
    @Option(name: .customLong("min-free-gb"),
            help: "Abort a pass when reclaimable memory falls below this (default: the planner's slack, 5% of RAM, at least 1.5 GB)")
    var minFreeGB: Double?
    @Flag(name: .customLong("json"), help: "Machine-readable output, one object per rung") var asJSON = false

    func validate() throws {
        guard tokens >= 16 else { throw ValidationError("--tokens must be at least 16") }
        guard replyTokens > 0, replyTokens < ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - replyTokens else {
            throw ValidationError("--tokens plus --reply-tokens must fit the model limit of \(ContextPolicy.modelLimit)")
        }
        _ = try ContextConfiguration(maxContextTokens: tokens + replyTokens,
            maxPrefillWaitMinutes: maxPrefillWait, qualification: true)
        guard wallSeconds.isFinite, wallSeconds > 0, wallSeconds <= 86_400 else {
            throw ValidationError("--wall-seconds must be finite, positive and at most 86400")
        }
        if let m = minFreeGB, !(m.isFinite && m >= 0) {
            throw ValidationError("--min-free-gb must be a finite number >= 0")
        }
        guard (0...PrefixCache.maxEntries).contains(warmConversations), warmTokens >= 16,
              warmTokens <= ContextPolicy.modelLimit - 4 else {
            throw ValidationError("--warm-conversations must be 0...4 and --warm-tokens must fit the model window with four tokens of follow-up room")
        }
        if warmConversations > 0 {
            guard !ladder, warmTokens <= tokens + replyTokens - 4 else {
                throw ValidationError("retained-context qualification requires one rung and warm-up plus follow-up room inside its configured window")
            }
        }
    }

    /// A deterministic filler that tokenizes densely and never repeats a
    /// sentence within the window, so the n-gram store cannot short-cut it.
    static func filler(tokens n: Int, conversation: Int = 0, tokenizer: (String) -> [Int]) -> [Int] {
        var text = conversation == 0 ? "Context check. " : "Context check conversation \(conversation). "
        var i = 0
        var nextCheck = 50
        while true {
            text += "Record \(i): the sensor on line \(i % 97) reported \(37 + (i * 31) % 500) units at "
                + "\(i % 24):\(String(format: "%02d", (i * 7) % 60)), and technician \((i * 13) % 1000) filed note \(i). "
            i += 1
            if i == nextCheck {
                let ids = tokenizer(text)
                if ids.count >= n { return Array(ids.prefix(n)) }
                nextCheck *= 2
            }
        }
    }

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let target = tokens
        let ladder = self.ladder
        let asJSON = self.asJSON
        let minFree = minFreeGB
        let plan = try model.announcedPlan(maxContext: target + replyTokens,
            prefixCacheEnabled: warmConversations > 0, maxPrefillWait: maxPrefillWait, qualification: true)
        if planOnly {
            let output: [String: Any] = [
                "kind": "unqualified-context-plan", "qualified": false,
                "plan": plan.json(), "model_revision": PinnedModel.revision,
                "warm_conversations": warmConversations, "warm_tokens": warmTokens,
                "optimizations": try JSONSerialization.jsonObject(
                    with: JSONEncoder().encode(InferenceOptimizations.environment())),
            ]
            print(String(decoding: try JSONSerialization.data(withJSONObject: output, options: [.sortedKeys]), as: UTF8.self))
            return
        }
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                // Missing observations must never compare equal and turn
                // an unobserved memory/swap interval into a passing result.
                engine.generator.footprintSampling = true
                // Cold rungs have no retained state. The separate retained
                // diagnostic deliberately fills and reuses four real states.
                engine.prefixCache.enabled = warmConversations > 0
                engine.prefixCache.drop()
                var rungs: [Int] = []
                if ladder {
                    var r = 2048
                    while r < target { rungs.append(r); r *= 2 }
                }
                rungs.append(target)
                let slack = minFree ?? Planner.availabilitySlackGB(ramGB: plan.ramGB)
                let all = Self.filler(tokens: rungs.max()!) { engine.tokenizer.encode(text: $0) }
                let progress = PrefillProgressReporter(
                    quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
                    FileHandle.standardError.write("  \(line)\n".data(using: .utf8)!)
                }
                progress.tailAware = engine.model.optimizations.tailAwarePrefill
                engine.generator.onPrefillProgress = progress.report
                let retainedStarted = RuntimeClock.now()
                var warmup: [[String: Any]] = []
                var warmupFailure: String?
                var warmInputs: [[Int]] = []
                var warmOutputs: [[Int]] = []
                if warmConversations > 0 {
                    for conversation in 1...warmConversations {
                        warmInputs.append(Self.filler(tokens: warmTokens, conversation: conversation) {
                            engine.tokenizer.encode(text: $0)
                        })
                    }
                    // Complete all first turns before revisiting each client;
                    // this proves interleaving rather than immediate reuse.
                    for phase in 0...1 {
                        for (index, initial) in warmInputs.enumerated() {
                            var ids = initial
                            var expectedReuse = 0
                            if phase == 1 {
                                guard let retained = engine.prefixCache.peek(extending: Array(initial.dropLast())),
                                      retained.starts(with: initial) else {
                                    warmupFailure = "warm conversation \(index) was evicted before its interleaved follow-up"
                                    break
                                }
                                expectedReuse = retained.count
                                ids = initial + warmOutputs[index] + [1000 + index]
                                guard ids.starts(with: retained) else {
                                    warmupFailure = "retained state differs from the conversation's actual completed delivery"
                                    break
                                }
                            }
                            var params = SampleParams.greedy; params.maxTokens = 1
                            let control = try engine.beginRequest()
                            let delivery = engine.generate(promptIds: ids, params: params, shouldContinue: {
                                if RuntimeClock.seconds(since: retainedStarted) >= wallSeconds {
                                    warmupFailure = "retained diagnostic wall-clock ceiling exceeded"
                                    control.cancel(); return false
                                }
                                if let available = Planner.deviceAvailableGB(), available < slack {
                                    warmupFailure = "warm-up reclaimable memory fell below the frozen slack"
                                    control.cancel(); return false
                                }
                                return true
                            }, request: control)
                            let stats = delivery.stats
                            if phase == 0 { warmOutputs.append(delivery.ids) }
                            let complete = stats.runtimeError == nil && !stats.memoryPressureCancelled
                                && stats.prefillTokens == ids.count - expectedReuse
                                && stats.reusedPrefixTokens == expectedReuse && delivery.ids.count == 1
                                && stats.decodeTokens == 1
                            let noSwap = stats.generatorVMBefore != nil && stats.generatorVMAfter != nil
                                && stats.generatorVMBefore?.swapins == stats.generatorVMAfter?.swapins
                                && stats.generatorVMBefore?.swapouts == stats.generatorVMAfter?.swapouts
                            let peak = max(stats.peakMemoryGB, Double(stats.sampledFootprint?.peakBytes ?? 0) / 1e9)
                            let observed = (stats.sampledFootprint?.samples ?? 0) > 0
                                && (stats.sampledFootprint?.peakBytes ?? 0) > 0 && stats.lifetimeRSSPeakBytes > 0
                            let fits = complete && noSwap && observed && peak <= plan.expectedPeakGB && warmupFailure == nil
                            warmup.append([
                                "conversation": index, "phase": phase, "prompt_ids": ids,
                                "output_ids": delivery.ids, "text": delivery.text, "expected_reuse": expectedReuse,
                                "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(stats)),
                                "retained": engine.prefixCache.json(), "fits": fits,
                            ])
                            if !fits {
                                warmupFailure = warmupFailure ?? "retained warm-up failed completion, reuse, memory or swap contract"
                                break
                            }
                        }
                        if warmupFailure != nil { break }
                    }
                }
                let retainedBefore = engine.prefixCache.json()
                if let failure = warmupFailure {
                    let output: [String: Any] = ["kind": "retained-context-warmup-failure",
                        "fits": false, "aborted": failure, "warmup": warmup,
                        "retained_before": retainedBefore, "main_request_started": false]
                    print(String(decoding: try JSONSerialization.data(withJSONObject: output, options: [.sortedKeys]), as: UTF8.self))
                    throw PlanError(failure)
                }
                var fitsSoFar = true
                for n in rungs {
                    let ids = Array(all.prefix(n))
                    var aborted: String?
                    var params = SampleParams.greedy
                    params.maxTokens = replyTokens
                    let control = try engine.beginRequest()
                    let rungStarted = warmConversations > 0 ? retainedStarted : RuntimeClock.now()
                    var timings: [[String: Any]] = []
                    var previousDone = 0, previousElapsed = 0.0
                    var lastProgressSeconds = 0.0
                    engine.generator.onPrefillProgressAbsolute = { done, total, elapsed, base in
                        guard done > previousDone else { return }
                        timings.append(["from": base + previousDone, "tokens": done - previousDone,
                            "seconds": elapsed - previousElapsed])
                        previousDone = done; previousElapsed = elapsed
                        if elapsed - lastProgressSeconds >= 30 {
                            FileHandle.standardError.write(Data("  context-check progress: \(done)/\(total) missing tokens committed\n".utf8))
                            lastProgressSeconds = elapsed
                        }
                    }
                    let (text, outputIds, stats) = engine.generate(
                        promptIds: ids, params: params,
                        shouldContinue: {
                            if RuntimeClock.seconds(since: rungStarted) >= wallSeconds {
                                aborted = "diagnostic wall-clock ceiling exceeded"
                                control.cancel(); return false
                            }
                            // The guard: stop before the machine pays in swap.
                            if let a = Planner.deviceAvailableGB(), a < slack {
                                aborted = String(format: "reclaimable memory fell to %.1f GB (floor %.1f)", a, slack)
                                return false
                            }
                            return true
                        }, request: control)
                    engine.generator.onPrefillProgressAbsolute = nil
                    let retainedAfter = engine.prefixCache.json()
                    engine.dropPrefixCache()
                    let peak = max(stats.peakMemoryGB, Double(stats.sampledFootprint?.peakBytes ?? 0) / 1e9)
                    let completed = stats.runtimeError == nil && !stats.memoryPressureCancelled
                        && stats.prefillTokens == n && stats.decodeTokens == replyTokens
                    let noSwap = stats.generatorVMBefore != nil && stats.generatorVMAfter != nil
                        && stats.generatorVMBefore?.swapins == stats.generatorVMAfter?.swapins
                        && stats.generatorVMBefore?.swapouts == stats.generatorVMAfter?.swapouts
                    let observed = (stats.sampledFootprint?.samples ?? 0) > 0
                        && (stats.sampledFootprint?.peakBytes ?? 0) > 0 && stats.lifetimeRSSPeakBytes > 0
                    let fits = aborted == nil && completed && observed && peak <= plan.expectedPeakGB && noSwap
                    let verdict: String
                    if let a = aborted {
                        verdict = "ABORTED at \(stats.prefillTokens) tokens: \(a)"
                    } else if !completed {
                        verdict = "INCOMPLETE: \(stats.runtimeError ?? "prompt or reply did not complete")"
                    } else if !noSwap || !observed {
                        verdict = "EXCLUDED: swap activity or missing memory observations during the request"
                    } else if fits {
                        verdict = "OK"
                    } else {
                        verdict = String(format: "OVER the plan by %.1f GB", peak - plan.expectedPeakGB)
                    }
                    if asJSON {
                        let d: [String: Any] = [
                            "text": text, "output_ids": outputIds,
                            "tokens": n, "reply_tokens": replyTokens, "configured_context": plan.maxContextTokens, "prompt_ids": ids, "prefill_tokens": stats.prefillTokens,
                            "prefill_seconds": stats.prefillSeconds, "prefill_tok_s": stats.prefillTPS,
                            "peak_rss_gb": Double(stats.lifetimeRSSPeakBytes) / 1e9,
                            "process_peak_bound_gb": peak,
                            "plan_expected_peak_gb": plan.expectedPeakGB,
                            "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(stats)),
                            "optimizations": try JSONSerialization.jsonObject(with: JSONEncoder().encode(engine.model.optimizations)),
                            "prefill_chunk": engine.generator.prefillChunk,
                            "pass_timings": timings,
                            "passes": stats.prefillPasses,
                            "compute_passes": stats.prefillComputePasses,
                            "compute_key_extents": stats.prefillComputeKeyExtents,
                            "compute_query_rows": stats.prefillComputeQueryRows,
                            "memory_ledger": plan.memoryLedger.json,
                            "warmup": warmup, "retained_before": retainedBefore, "retained_after": retainedAfter,
                            "model_revision": PinnedModel.revision,
                            "fits": fits, "aborted": aborted ?? NSNull(),
                            "verdict": verdict,
                        ]
                        let data = try JSONSerialization.data(withJSONObject: d, options: [.sortedKeys])
                        print(String(decoding: data, as: UTF8.self))
                    } else {
                        print(String(
                            format: "context-check %6d tokens: %@ in %@ (%.0f tok/s), peak RSS %.1f GB vs plan %.1f GB — %@",
                            n, aborted == nil ? "read" : "stopped",
                            PrefillSchedule.describe(seconds: stats.prefillSeconds), stats.prefillTPS,
                            peak, plan.expectedPeakGB, verdict))
                    }
                    if !fits {
                        fitsSoFar = false
                        break
                    }
                }
                if !asJSON {
                    let cap = ContextPolicy.maxTokens
                    if fitsSoFar {
                        print("verdict: \(target) prompt tokens plus \(replyTokens) output tokens completed inside the plan on this Mac. "
                            + "Ordinary serving defaults to \(ContextPolicy.defaultTokens); its implementation ceiling remains \(cap). "
                            + "A larger supported window requires an explicit --max-context. Diagnostic success does not raise that ceiling.")
                    } else {
                        print("verdict: the plan does not cover this prompt length here; lower --tokens, raise "
                            + "--memory-gb if the machine has room, or close other apps and retry.")
                    }
                }
                result = fitsSoFar ? .success(()) : .failure(PlanError("context qualification failed; preserved output contains the incomplete or over-budget rung"))
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/slotstream-cli/OptimizationCommands.swift` — 21678 bytes, SHA-256 `bb3a76becb56a4e6bd46fe118122b8479e55a61701ce4d37aa7c39a88d456022`.

````text
import ArgumentParser
import Foundation
import Slotstream
import SlotstreamDiagnostics

struct OptimizationStateCheck: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "optimization-state-check",
        abstract: "Compare retained state and continued logits across optimization controls")
    @OptionGroup var model: ModelOptions
    @Option var tokens: Int = 256
    @Flag var json = false
    @Flag(help: "Check output limits, pending token ownership, EOS and cancellation")
    var generation = false
    @Option(help: "Candidate to compare: integrated | integrated-mtp | compute-islands | compute-islands-performance | slot-cpu-component | terminal-prefill-lifecycle | mtp-terminal-prefill | terminal-prefill-family | selected-attention-component | selected-attention-family | compact-state | compiled-norm | compiled-norm-component | mtp-compiled-norm | ngram | cache-bookkeeping | cache-containers | exact-read | read-handles | mtp-read-handles | read-handle-lifetime | mtp-cache-bookkeeping | mtp | indexer | sweep-placement | sweep-tiles | sweep-both | indexer-tiles | indexer-dense | indexer-dense-tiles | indexer-topk | indexer-visibility | rope | gdn-record | gdn-kernel | ple | workspace | scope | scope-256 | scope-lifecycle | scope-mtp-vision | mtp-work | lifecycle | output | router-weights | mtp-router-weights | router-projection | router-selection | block-selection | router | mtp-router | mtp-indexer | image-reuse | vision-attention | shared-overlap | prefill-family") var variant = "compact-state"

    func run() throws {
        let report: CheckReport
        if generation { report = try Diagnostics.optimizationGeneration(modelDir: model.modelURL) }
        else if ["runtime-budget-lifecycle", "governor-boundary", "governor-boundary-mtp", "read-failure-serving", "output-serving", "context-serving"].contains(variant) {
            // This executable has a synchronous root, as do its existing
            // Engine-backed commands. Bridge only the tokenizer load here.
            let ready = DispatchSemaphore(value: 0)
            var result: Result<CheckReport, Error>?
            Task {
                do {
                    if variant == "context-serving" {
                        result = .success(try await Diagnostics.contextServing(modelDir: model.modelURL))
                    } else if variant == "output-serving" {
                        result = .success(try await Diagnostics.optimizationOutputServing(modelDir: model.modelURL))
                    } else if variant == "read-failure-serving" {
                        result = .success(try await Diagnostics.optimizationReadFailureServing(modelDir: model.modelURL))
                    } else if variant == "runtime-budget-lifecycle" {
                        result = .success(try await Diagnostics.optimizationRuntimeBudgetLifecycle(modelDir: model.modelURL))
                    } else {
                        result = .success(try await Diagnostics.optimizationGovernorBoundary(modelDir: model.modelURL, mtp: variant == "governor-boundary-mtp"))
                    }
                }
                catch { result = .failure(error) }
                ready.signal()
            }
            ready.wait()
            report = try result!.get()
        }
        else if variant == "context-small-components-projections" {
            report = try Diagnostics.contextSmallComponents(modelDir: model.modelURL,
                paddedRouter: true, layers: 12, paddedProjections: true)
        }
        else if ["context-small-projections-64", "context-small-projections-128",
                 "context-small-projections-partial-64", "context-small-projections-partial-128",
                 "context-small-projections-prefix-64", "context-small-projections-prefix-128",
                 "context-small-projections-shorttail-64", "context-small-projections-shorttail-128",
                 "context-small-projections-sparse-prefix-64", "context-small-projections-sparse-prefix-128"].contains(variant) {
            report = try Diagnostics.contextSmallPass(modelDir: model.modelURL,
                pass: variant.hasSuffix("64") ? 64 : 128, swept: true, paddedRouter: true, paddedAttention: true,
                tokens: variant.contains("partial") ? 470 : variant.contains("shorttail") ? 449 : variant.contains("sparse") ? 2564 : 515,
                prefix: variant.contains("sparse") ? 2049 : variant.contains("prefix") ? 17 : 0,
                paddedProjections: true)
        }
        else if ["context-small-components", "context-small-components-padded", "context-small-components-full-padded"].contains(variant) {
            report = try Diagnostics.contextSmallComponents(modelDir: model.modelURL, paddedRouter: variant.hasSuffix("padded"), fullModel: variant.contains("full"))
        }
        else if ["context-small-aligned-partial-64", "context-small-aligned-partial-128", "context-small-aligned-prefix-64", "context-small-aligned-prefix-128"].contains(variant) {
            report = try Diagnostics.contextSmallPass(modelDir: model.modelURL,
                pass: variant.hasSuffix("64") ? 64 : 128, swept: true, paddedRouter: true, paddedAttention: true,
                tokens: variant.contains("partial") ? 470 : 515, prefix: variant.contains("prefix") ? 17 : 0)
        }
        else if ["context-small-64", "context-small-128", "context-small-swept-64", "context-small-swept-128", "context-small-swept-padded-64", "context-small-swept-padded-128", "context-small-swept-aligned-64", "context-small-swept-aligned-128"].contains(variant) {
            report = try Diagnostics.contextSmallPass(modelDir: model.modelURL,
                pass: variant.hasSuffix("64") ? 64 : 128, swept: variant.contains("swept"), paddedRouter: variant.contains("padded") || variant.contains("aligned"), paddedAttention: variant.contains("aligned"))
        }
        else if variant == "all-hit-replay" { report = try Diagnostics.optimizationAllHitReplay(modelDir: model.modelURL) }
        else if variant == "compute-islands" || variant == "compute-islands-performance" {
            report = try Diagnostics.optimizationComputeIslands(modelDir: model.modelURL, timed: variant == "compute-islands-performance")
        }
        else if variant == "compute-islands-quantized" || variant == "compute-islands-quantized-performance" {
            report = try Diagnostics.optimizationComputeIslands(modelDir: model.modelURL,
                timed: variant == "compute-islands-quantized-performance", quantizedOnly: true)
        }
        else if variant == "gdn-projection-packing" { report = try Diagnostics.optimizationGDNProjectionPacking(modelDir: model.modelURL) }
        else if variant == "gdn-profile" { report = try Diagnostics.optimizationGDNProfile(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "vision-capacity" { report = Diagnostics.optimizationVisionCapacity() }
        else if variant == "vision-tower-capacity" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL) }
        else if variant == "vision-prescaled-capacity" { report = Diagnostics.optimizationVisionCapacity(preserveQueryRounding: true) }
        else if variant == "vision-prescaled-tower" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL, preserveQueryRounding: true) }
        else if variant == "resident-overlap-component" { report = try Diagnostics.optimizationResidentOverlap(modelDir: model.modelURL) }
        else if variant == "resident-overlap-recovery" || variant == "resident-overlap-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "resident-overlap-recovery-mtp", residentOverlap: true)
        }
        else if variant == "state-recovery-lineage" { report = try Diagnostics.optimizationStateRecovery(modelDir: model.modelURL) }
        else if variant == "prefix-client-capacity" { report = try Diagnostics.optimizationPrefixCapacity() }
        else if variant == "rope-performance" { report = Diagnostics.optimizationRopePerformance() }
        else if variant == "rope-rotation-component" { report = Diagnostics.optimizationPartialRotation() }
        else if variant == "vision-query-tile-capacity" { report = Diagnostics.optimizationVisionCapacity(queryTile: 256) }
        else if variant == "vision-query-tile-tower" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL, queryTile: 256) }
        else if variant == "vision-query-maximum-reference" {
            report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL,
                queryTile: 256, maximumReferenceOnly: true)
        }
        else if variant == "transfer-profile" { report = try Diagnostics.optimizationTransferProfile(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "slot-slices-component" { report = Diagnostics.optimizationSlotSlices() }
        else if variant == "slot-words-component" { report = Diagnostics.optimizationSlotSlices(wordWrites: true) }
        else if variant == "slot-cpu-component" { report = try Diagnostics.optimizationCPUSlotWrites() }
        else if variant == "slot-cpu-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, cpuWrites: true) }
        else if variant == "slot-cpu-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, cpuWrites: true) }
        else if variant == "slot-cpu-recovery" || variant == "slot-cpu-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-cpu-recovery-mtp", cpuWrites: true)
        }
        else if variant == "embedding-rows" { report = try Diagnostics.optimizationEmbeddingRows(modelDir: model.modelURL) }
        else if variant == "embedding-runtime" || variant == "embedding-runtime-mtp" {
            report = try Diagnostics.optimizationEmbeddingRuntime(modelDir: model.modelURL, mtp: variant == "embedding-runtime-mtp")
        }
        else if variant == "integrated-gdn-projection" || variant == "integrated-gdn-projection-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-gdn-projection-mtp", gdnProjection: true)
        }
        else if variant == "integrated-rope" || variant == "integrated-rope-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-rope-mtp", ropeFusion: true)
        }
        else if variant == "integrated" || variant == "integrated-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL, mtp: variant == "integrated-mtp")
        }
        else if variant == "integrated-vision-query" || variant == "integrated-vision-query-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-vision-query-mtp", visionQueryTile: true)
        }
        else if variant == "prefix-vision" || variant == "prefix-vision-mtp" {
            report = try Diagnostics.optimizationPrefixVision(modelDir: model.modelURL, mtp: variant == "prefix-vision-mtp")
        }
        else if variant == "complete-prompt" || variant == "complete-prompt-mtp" {
            report = try Diagnostics.optimizationCompletePrompt(modelDir: model.modelURL, mtp: variant == "complete-prompt-mtp")
        }
        else if variant == "prefix-retention" || variant == "prefix-retention-mtp" {
            report = try Diagnostics.optimizationPrefixRetention(modelDir: model.modelURL, mtp: variant == "prefix-retention-mtp")
        }
        else if variant == "prefix-fork" || variant == "prefix-fork-mtp" {
            report = try Diagnostics.optimizationPrefixFork(modelDir: model.modelURL, tokens: tokens, mtp: variant == "prefix-fork-mtp")
        }
        else if variant == "slot-words-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, wordWrites: true) }
        else if variant == "slot-words-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, wordWrites: true) }
        else if variant == "slot-words-recovery" || variant == "slot-words-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-words-recovery-mtp", wordWrites: true)
        }
        else if variant == "slot-slices-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, slotSlices: true) }
        else if variant == "slot-slices-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, slotSlices: true) }
        else if variant == "slot-slices-recovery" || variant == "slot-slices-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-slices-recovery-mtp", slotSlices: true)
        }
        else if variant == "image-failure" { report = try Diagnostics.optimizationImageFailure(modelDir: model.modelURL) }
        else if variant == "pool-requests" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL) }
        else if variant == "packed-layout-component" { report = try Diagnostics.optimizationPackedLayout() }
        else if variant == "ngram-lookahead-rows" { report = try Diagnostics.optimizationNgramLookahead(modelDir:model.modelURL) }
        else if ["ngram-cache-reference", "ngram-cache-compact", "ngram-cache-reference-ring", "ngram-cache-compact-ring"].contains(variant) {
            report = try Diagnostics.optimizationNgramCache(modelDir: model.modelURL,
                compact: variant.contains("compact"), ring: variant.hasSuffix("-ring"))
        }
        else if variant == "ngram-lookahead-ticket" { report = try Diagnostics.optimizationNgramPrefetchTicket() }
        else if variant == "ngram-lookahead-recovery" || variant == "ngram-lookahead-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir:model.modelURL,
                mtp:variant == "ngram-lookahead-recovery-mtp",lookahead:true)
        }
        else if variant == "packed-layout-storage" { report = try Diagnostics.optimizationPackedStorage(modelDir:model.modelURL) }
        else if variant == "packed-layout-recovery" || variant == "packed-layout-recovery-mtp" {
            report = try Diagnostics.optimizationPackedRecovery(modelDir:model.modelURL,mtp:variant == "packed-layout-recovery-mtp")
        }
        else if variant == "read-recovery" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL) }
        else if variant == "request-read-recovery" || variant == "request-read-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL, mtp: variant == "request-read-recovery-mtp")
        }
        else if variant == "sampler-performance" { report = Diagnostics.optimizationSamplerPerformance() }
        else if variant == "adaptive-mtp" { report = try Diagnostics.optimizationAdaptiveMTP(modelDir: model.modelURL) }
        else if variant == "adaptive-sensitivity" { report = try Diagnostics.optimizationAdaptiveSensitivity(modelDir: model.modelURL) }
        else if variant == "mtp-floor-cache" { report = try Diagnostics.optimizationMTPFloorCache(modelDir: model.modelURL) }
        else if variant == "floor-cache-mechanism" { report = try Diagnostics.optimizationFloorCacheMechanism(modelDir: model.modelURL) }
        else if variant == "indexer-raw-component" { report = Diagnostics.optimizationCompactIndexer() }
        else if variant == "read-handle-lifetime" { report = try Diagnostics.optimizationReadHandles(modelDir: model.modelURL) }
        else if variant == "mtp-read-handles" { report = try Diagnostics.optimizationMTPReadHandles(modelDir: model.modelURL) }
        else if variant == "selected-attention-component" { report = Diagnostics.optimizationSelectedAttention() }
        else if variant == "selected-attention-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, selectedAttention: true) }
        else if variant == "terminal-query-family" {
            report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens,
                terminalPrefill: true, terminalQuery: true)
        }
        else if variant == "terminal-query-lifecycle" {
            report = try Diagnostics.optimizationTerminalPrefillLifecycle(modelDir: model.modelURL, lastQuery: true)
        }
        else if variant == "terminal-prefill-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, terminalPrefill: true) }
        else if variant == "terminal-prefill-lifecycle" { report = try Diagnostics.optimizationTerminalPrefillLifecycle(modelDir: model.modelURL) }
        else if variant == "mtp-terminal-query" {
            report = try Diagnostics.optimizationMTPTerminalQuery(modelDir: model.modelURL)
        }
        else if variant == "mtp-terminal-prefill" { report = try Diagnostics.optimizationMTPTerminalPrefill(modelDir: model.modelURL) }
        else if variant == "exact-read" { report = Diagnostics.optimizationExactRead() }
        else if variant == "mtp-compiled-norm" { report = try Diagnostics.optimizationMTPCompiledNorm(modelDir: model.modelURL) }
        else if variant == "compiled-norm-component" { report = try Diagnostics.optimizationCompiledNorm() }
        else if variant == "cache-containers" { report = Diagnostics.optimizationCacheBookkeeping() }
        else if variant == "mtp-cache-bookkeeping" { report = try Diagnostics.optimizationMTPCacheBookkeeping(modelDir: model.modelURL) }
        else if variant == "router-selection" { report = Diagnostics.optimizationRouterSelection() }
        else if variant == "router-projection" { report = Diagnostics.optimizationRouterProjection() }
        else if variant == "block-selection" { report = Diagnostics.optimizationBlockSelection() }
        else if variant == "indexer-visibility" { report = Diagnostics.optimizationIndexerVisibility() }
        else if variant == "prefill-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "scope-256" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, scoped: true) }
        else if variant == "output" { report = try Diagnostics.optimizationOutput() }
        else if variant == "output-tcp" { report = try Diagnostics.optimizationOutputTCP() }
        else if variant == "scope-mtp-vision" { report = try Diagnostics.optimizationScopeMTPVision(modelDir: model.modelURL) }
        else if variant == "mtp-work" { report = try Diagnostics.optimizationMTPWork(modelDir: model.modelURL) }
        else if variant == "mtp-work-integrated" {
            report = try Diagnostics.optimizationMTPWork(modelDir: model.modelURL, integratedBase: true)
        }
        else if variant == "scope-integrated-family" {
            report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens,
                scoped: true, integratedBase: true)
        }
        else if variant == "scope-integrated-lifecycle" {
            report = try Diagnostics.optimizationScopeLifecycle(modelDir: model.modelURL, integratedBase: true)
        }
        else if variant == "scope-integrated-mtp-vision" {
            report = try Diagnostics.optimizationScopeMTPVision(modelDir: model.modelURL, integratedBase: true)
        }
        else if variant == "scope-lifecycle" { report = try Diagnostics.optimizationScopeLifecycle(modelDir: model.modelURL) }
        else if variant == "scope" { report = try Diagnostics.optimizationReadScope(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "gdn-kernel" { report = Diagnostics.optimizationGDNKernel() }
        else if variant == "lifecycle" { report = try Diagnostics.optimizationLifecycle(modelDir: model.modelURL) }
        else if variant == "mtp-indexer" { report = try Diagnostics.optimizationMTPIndexer(modelDir: model.modelURL) }
        else if variant == "mtp-indexer-raw" { report = try Diagnostics.optimizationMTPIndexer(modelDir: model.modelURL, rawCompact: true) }
        else if variant == "image-reuse" { report = try Diagnostics.optimizationImageReuse(modelDir: model.modelURL) }
        else if variant == "vision-attention" { report = Diagnostics.optimizationVisionAttention() }
        else if variant == "mtp-router" { report = try Diagnostics.optimizationMTP(modelDir: model.modelURL, router: true) }
        else if variant == "mtp-router-weights" { report = try Diagnostics.optimizationMTPRouterWeights(modelDir: model.modelURL) }
        else if variant == "mtp" { report = try Diagnostics.optimizationMTP(modelDir: model.modelURL) }
        else { report = try Diagnostics.optimizationState(modelDir: model.modelURL, tokens: tokens, variant: variant) }
        if json {
            let encoder = JSONEncoder(); encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            print(String(data: try encoder.encode(report), encoding: .utf8)!)
        } else {
            for item in report.items { print("\(item.passed ? "PASS" : "FAIL")  \(item.name)") }
        }
        if !report.passed { throw ExitCode.failure }
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/slotstream-cli/main.swift` — 77859 bytes, SHA-256 `19c67da92554623e267ff0f2a065d95f8ca2e3b152cf858ce39b75acf0b8f046`.

````text
// slotstream CLI: run · serve · parity · doctor · goldens

import ArgumentParser
import Foundation
import MLX
import Slotstream
import SlotstreamDiagnostics

struct Slotstream: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "slotstream",
        abstract: "Qwen3.8-Flash-Next on Apple Silicon via SSD-streamed experts + cache slots.",
        version: SlotstreamBuild.version,
        subcommands: [
            Run.self, Serve.self, Pull.self, Doctor.self, Parity.self, ElasticCheck.self,
            NgramGolden.self, DequantGolden.self, TemplateCheck.self, SamplerGolden.self, GovernorCheck.self,
            PrefixCheck.self, ElasticDrill.self, RuntimeCheck.self, PullCheck.self,
            MTPParity.self, MTPAccept.self, MTPCheck.self, MTPFixtureInputs.self, MTPBench.self, MTPPassCost.self,
            ContextCheck.self, PrefillScheduleCommand.self, SweepCheck.self,
            VisionParity.self, OptimizationStateCheck.self, PackExperts.self,
        ]
    )
}

/// Weights-free regressions for process and cache safety invariants that are
/// otherwise only observable during a 100+ GB model run. The checks themselves
/// live in SlotstreamDiagnostics; this is the adapter that prints them.
struct RuntimeCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "runtime-check",
        abstract: "Check process RSS accounting and prefix-cache bounds without loading weights")

    func run() throws {
        try CheckRendering.emit(Diagnostics.runtime(), banner: "RUNTIME CHECK PASS")
    }
}

struct ModelOptions: ParsableArguments {
    @Option(name: .long,
            help: "Model name or directory (default \(PinnedModel.name); a name resolves to the dev checkout's models/ or ~/.slotstream/models)")
    var model: String = PinnedModel.name

    @Option(
        name: .customLong("memory-gb"),
        help: ArgumentHelp(
            "Total memory target for the whole process, in GB.",
            discussion: """
                The easiest knob: how much of this Mac slotstream may use. The \
                expert cache gets what remains after the conservatively charged \
                resident/runtime/context footprint and a 1 GB margin. Run \
                `slotstream doctor --memory-gb N` for the exact cache size. \
                Default: auto -- 70% of RAM, kept 2 GB under \
                the Metal working-set limit; the chosen plan is announced at \
                startup. --experts-per-layer / --pool-gb take precedence.
                """))
    var memoryGB: Double?

    @Option(
        name: .customLong("experts-per-layer"),
        help: ArgumentHelp(
            "Expert cache size, in experts per layer (1...512).",
            discussion: """
                The precise memory<->speed knob. Each of the 48 layers has 512 \
                experts of 2.76 MB; the cache holds N x 48 of them, so pool = \
                N x 0.133 GB (e.g. 226/layer = 30 GB, 181/layer = 24 GB, \
                30/layer = 4 GB) plus the fixed runtime/context footprint. The pool \
                itself is one GLOBAL cache shared across layers -- N is the \
                intuitive unit, not a per-layer quota: hot layers borrow slots \
                from cold ones. Takes precedence over --memory-gb/--pool-gb. \
                Default: auto (see `slotstream doctor`).
                """))
    var expertsPerLayer: Int?

    @Option(name: .customLong("pool-gb"),
            help: "Raw expert-pool size in GB (1 GB ≈ 7.5 experts/layer). Beats --memory-gb; loses to --experts-per-layer.")
    var poolGB: Double?

    @Option(
        name: .customLong("max-ram-percent"),
        help: ArgumentHelp(
            "Auto only: the largest share of this Mac's RAM auto may target (default 70).",
            discussion: """
                Lower it to keep more of the machine for your other apps; auto \
                still sizes down on its own when they are actually holding \
                memory. It cannot raise the target past the point where more \
                cache stops buying decode speed (~33 GB) — use --memory-gb for \
                that. Ignored when an explicit memory knob is given.
                """))
    var maxRAMPercent: Double?

    @Option(
        name: .customLong("mtp"),
        help: ArgumentHelp(
            "Speculative decode with the MTP draft head: auto | on | off (default auto).",
            discussion: """
                The model's own next-next-token head drafts a few tokens \
                and the main model verifies them in one batched pass. Costs \
                a fixed 1.6 GB of memory; auto enables it only when the \
                expert cache still reaches ~120 experts/layer after paying, \
                which is where the multiplier beats spending the same RAM on \
                cache. Needs the separately converted mtp.safetensors next \
                to the model (Tools/mtp_convert.py).
                """))
    var mtp: String = "auto"

    @Option(
        name: .customLong("vision"),
        help: ArgumentHelp(
            "Accept images: auto | on | off (default auto).",
            discussion: """
                The checkpoint carries a vision tower; auto loads it the \
                first time a request sends a picture and keeps it resident \
                after that (+0.9 GB, on top of the plan below, and refused \
                if the machine cannot spare it at that moment). off refuses \
                images outright, which is what to use when the announced \
                peak is the number that matters.
                """))
    var vision: String = "auto"

    // Resolved once here so the tokenizer, the draft-head probe, and the index
    // all see the real directory; Foundation will not list a symlinked one.
    var modelURL: URL { ModelLocator.resolve(model).resolvingSymlinksInPath() }

    func mtpMode() throws -> Planner.MTPMode {
        guard let m = Planner.MTPMode(rawValue: mtp) else {
            throw PlanError("--mtp must be auto, on, or off (got \(mtp))")
        }
        return m
    }

    func visionMode() throws -> Planner.VisionMode {
        guard let v = Planner.VisionMode(rawValue: vision) else {
            throw PlanError("--vision must be auto, on, or off (got \(vision))")
        }
        return v
    }

    /// Does this checkpoint carry a tower? Reads the shard headers only.
    func visionAvailable() -> Bool {
        guard let idx = try? CheckpointIndex(dir: modelURL) else { return false }
        return VisionTower.present(index: idx)
    }

    /// Resolve knobs -> plan, print the announce, return it. Also the first
    /// place a stranger hits with no weights — offer the download right there.
    func announcedPlan(maxContext: Int = ContextPolicy.defaultTokens, prefixCacheEnabled: Bool = true,
                       maxPrefillWait: Double = 30, qualification: Bool = false) throws -> MemoryPlan {
        let configuration = try ContextConfiguration(maxContextTokens: maxContext,
            maxPrefillWaitMinutes: maxPrefillWait, qualification: qualification)
        let policy = try runtimePolicy(prefixCacheEnabled: prefixCacheEnabled)
        _ = try mtpMode(); _ = try visionMode()
        try ensureWeights()
        let base = try Planner.plan(
            expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramPercent: maxRAMPercent,
            mtp: mtpMode(), mtpAvailable: MTPWeights.present(modelDir: modelURL),
            vision: visionMode(), visionAvailable: visionAvailable(),
            maxContextTokens: maxContext, qualification: qualification,
            runtimePolicy: policy)
        let plan = try runtimePlan(base, prefixCacheEnabled: prefixCacheEnabled).withRequestPolicy(configuration)
        FileHandle.standardError.write((plan.banner() + "\n").data(using: .utf8)!)
        return plan
    }

    /// The announce, doctor and serving metadata share the same reservation
    /// resolution. Merely printing a simulated plan never makes it loadable.
    func runtimePlan(_ base: MemoryPlan, prefixCacheEnabled: Bool = true) throws -> MemoryPlan {
        try Planner.applyingRuntimePolicy(base, policy: runtimePolicy(prefixCacheEnabled: prefixCacheEnabled))
    }

    func runtimePolicy(prefixCacheEnabled: Bool = true) throws -> RuntimeAllocationPolicy {
        let env = ProcessInfo.processInfo.environment
        let chunk: Int?
        if let raw = env["SLOTSTREAM_PREFILL_CHUNK"] {
            guard let value = Int(raw) else { throw PlanError("SLOTSTREAM_PREFILL_CHUNK must be an integer") }
            chunk = value
        } else { chunk = nil }
        return try RuntimeAllocationPolicy(prefillChunkOverride: chunk,
            prefixCacheEnabled: prefixCacheEnabled && env["SLOTSTREAM_PREFIX_CACHE"] != "0")
    }

    /// If the pinned model isn't fully downloaded and we have a terminal, ask
    /// once and run the pull inline (resuming whatever is already there).
    /// Anything else fails with the fix, not a stack.
    func ensureWeights() throws {
        let url = modelURL
        let fm = FileManager.default
        guard model == PinnedModel.name || model == PinnedModel.dirName else {
            // explicit path: all we can check cheaply is that a model is there
            guard fm.fileExists(atPath: url.appendingPathComponent("config.json").path) else {
                throw PlanError("no model at \(url.path) — download it first with:  slotstream pull")
            }
            return
        }
        // pinned model: every manifest file must be present whole (a partial
        // first download must resume here, not die later in the engine)
        var remaining = WeightStore.remainingBytes(at: url)
        var corrupt: [PinnedModel.File] = []
        if remaining == 0 {
            // Size alone cannot distinguish a valid file from same-size
            // corruption. Hash before loading; this takes seconds and prevents
            // a damaged tokenizer/config/weight from reaching the engine.
            corrupt = WeightStore.invalidFiles(at: url)
            if corrupt.isEmpty { return }
            remaining = corrupt.reduce(0) { $0 + $1.size }
            print("found \(corrupt.count) same-size file(s) that fail the pinned sha256: "
                + corrupt.map(\.path).joined(separator: ", "))
        }
        let have = max(0, PinnedModel.requiredBytes - remaining)
        // free disk where the weights will actually land
        var probe = url
        while !fm.fileExists(atPath: probe.path), probe.path != "/" {
            probe.deleteLastPathComponent()
        }
        let free = (try? fm.attributesOfFileSystem(
            forPath: probe.path))?[.systemFreeSize] as? Int64 ?? 0
        print("""
            \(PinnedModel.name) is not \(have > 0 ? "fully " : "")downloaded yet.
              size:  \(String(format: "%.1f", Double(PinnedModel.totalBytes) / 1e9)) GB in \(PinnedModel.files.count) files (resumable if interrupted)\(
                  have > 0 ? String(format: "\n  have:  %.1f GB already here — the download resumes", Double(have) / 1e9) : "")
              time:  measured during download; compressed transfer and reconstruction overlap
              to:    \(url.path)
              disk:  \(String(format: "%.1f", Double(free) / 1e9)) GB free
            """)
        fflush(stdout)
        switch askYesNo("download now? [Y/n] ") {
        case .some(true):
            try withInterruptiblePull { cancellation in
                try WeightStore.download(to: url, transport: .automatic, cancellation: cancellation, log: { print($0); fflush(stdout) })
            }
        case .some(false):
            throw PlanError("not downloading — when you are ready:  slotstream pull")
        case .none:  // no terminal to ask on
            throw PlanError("no model at \(url.path) — download it first with:  slotstream pull")
        }
    }
}

/// Ask on the controlling terminal. Returns nil when there is no terminal
/// (piped stdin and no /dev/tty), so callers can fail with instructions
/// instead of hanging.
func askYesNo(_ prompt: String) -> Bool? {
    func parse(_ s: String) -> Bool {
        let t = s.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return t.isEmpty || t == "y" || t == "yes"
    }
    if isatty(0) == 1 {
        print(prompt, terminator: "")
        guard let line = readLine() else { return false }
        return parse(line)
    }
    guard let tty = fopen("/dev/tty", "r") else { return nil }
    defer { fclose(tty) }
    print(prompt, terminator: "")
    fflush(stdout)
    var buf = [CChar](repeating: 0, count: 64)
    guard fgets(&buf, 64, tty) != nil else { return false }
    return parse(String(cString: buf))
}

// MARK: run

struct Run: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Generate from a prompt")
    @OptionGroup var model: ModelOptions
    @Option(help: "Prompt plus reply context window") var maxContext = ContextPolicy.defaultTokens
    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0
    @Option var prompt: String = "Why is the sky blue?"
    @Option(help: "Read the exact UTF-8 prompt from a file") var promptFile: String?
    @Option(help: "Write exact tokens, effective configuration and generation measurements as JSON")
    var statsJson: String?
    @Option(help: "Deterministic sampling seed") var seed: UInt64?
    @Flag(help: "Sample physical footprint during generation (diagnostic overhead)")
    var sampleFootprint = false
    @Option(help: "Maximum tokens to generate (<= 0 means as many as allowed)")
    var maxTokens: Int = 128
    @Flag(help: "Greedy sampling (deterministic)") var greedy = false
    @Flag(help: "Raw prompt (no chat template)") var raw = false
    @Flag(help: "Enable thinking mode") var think = false
    @Option(
        name: .customLong("image"),
        help: ArgumentHelp(
            "Path to an image to send with the prompt (repeatable).",
            discussion: """
                Read from disk here, by you, and sent inline — the server \
                itself never opens a path or a URL a request names.
                """))
    var images: [String] = []

    func run() throws {
        if raw, !images.isEmpty {
            throw PlanError("--raw has no chat template to place an image in; drop one of them")
        }
        _ = try ContextConfiguration(maxContextTokens: maxContext, maxPrefillWaitMinutes: maxPrefillWait)
        let launchStart = RuntimeClock.now()
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let plan = try model.announcedPlan(maxContext: maxContext, maxPrefillWait: maxPrefillWait)
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                let loadSeconds = RuntimeClock.seconds(since: launchStart)
                engine.generator.footprintSampling = sampleFootprint
                let control = try engine.beginRequest()
                let encodeStart = RuntimeClock.now()
                var promptText = prompt
                if let promptFile {
                    let handle = try FileHandle(forReadingFrom: URL(fileURLWithPath: promptFile))
                    defer { try? handle.close() }
                    var data = Data()
                    while true {
                        let (next, overflow) = data.count.addingReportingOverflow(65_536)
                        try control.checkInputBytes(overflow ? Int.max : next)
                        guard let part = try handle.read(upToCount: 65_536), !part.isEmpty else { break }
                        data.append(part)
                    }
                    try control.checkInputBytes(data.count)
                    guard let decoded = String(data: data, encoding: .utf8) else {
                        throw PlanError("prompt file must contain valid UTF-8")
                    }
                    promptText = decoded
                }
                let ids: [Int]
                var vision: VisionPrompt?
                if raw {
                    try control.checkInputBytes(promptText.utf8.count)
                    ids = engine.tokenizer.encode(text: promptText)
                } else {
                    var msg = ChatMessage(role: "user", content: promptText)
                    var retainedInputBytes = promptText.utf8.count
                    msg.images = try images.map { path in
                        let handle = try FileHandle(forReadingFrom: URL(fileURLWithPath: path))
                        defer { try? handle.close() }
                        let size = try handle.seekToEnd()
                        guard size > 0, size <= UInt64(VisionPreprocess.maxImageBytes) else {
                            throw PlanError("image must be nonempty and at most \(VisionPreprocess.maxImageBytes >> 20) MiB")
                        }
                        let encodedBytes = ((Int(size) + 2) / 3) * 4
                        let (next, overflow) = retainedInputBytes.addingReportingOverflow(encodedBytes)
                        try control.checkInputBytes(overflow ? Int.max : next)
                        retainedInputBytes = next
                        try handle.seek(toOffset: 0)
                        let d = try handle.read(upToCount: Int(size) + 1) ?? Data()
                        guard d.count == Int(size) else {
                            throw PlanError("image changed size while being read")
                        }
                        return d.base64EncodedString()
                    }
                    (ids, vision) = try engine.encodeChatWithVision([msg], thinking: think, request: control)
                }
                if let e = engine.contextError(promptTokens: ids.count) { throw PlanError(e) }
                let encodeSeconds = RuntimeClock.seconds(since: encodeStart)
                let wait = PrefillSchedule.estSeconds(tokens: ids.count, maxChunk: engine.generator.prefillChunk, tailAware: engine.model.optimizations.tailAwarePrefill)
                FileHandle.standardError.write(
                    "prompt tokens: \(ids.count) (~\(PrefillSchedule.describe(seconds: wait)) to the first token at this plan)\n"
                        .data(using: .utf8)!)
                // A long prompt reports its progress so minutes of silence do
                // not read as a hang; short prompts stay quiet.
                let progress = PrefillProgressReporter(
                    quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
                    FileHandle.standardError.write("  \(line)\n".data(using: .utf8)!)
                }
                progress.tailAware = engine.model.optimizations.tailAwarePrefill
                engine.generator.onPrefillProgressAbsolute = progress.report
                var params: SampleParams = greedy ? .greedy : (think ? .thinking : .instruct)
                params.maxTokens = maxTokens
                params.seed = seed
                let t0 = Date()
                let (text, outputIds, stats) = engine.generate(
                    promptIds: ids, params: params, vision: vision, onToken: { _, delta in
                    fputs(delta, stdout)
                    fflush(stdout)
                    return true
                }, request: control)
                print("")
                if let statsJson {
                    let workspaceGB = engine.model.optimizations.layerExpertWorkspace
                        ? Double(engine.model.cfg.numExperts * engine.model.pool.recordBytes) / 1e9 : 0
                    // Conservative experimental allowance, not a calibrated
                    // production parameter family or a fixed-total comparison.
                    let scopeGB = engine.model.optimizations.readScopeEnabled
                        ? max(0, Planner.prefillCostGB(engine.model.optimizations.readScopeTokens)
                            - Planner.prefillCostGB(engine.generator.prefillChunk))
                            + Double(PrefixCache.fixedBytesPerEntry) / 1e9 : 0
                    let statsData = try JSONEncoder().encode(stats)
                    let routerGB = Double(stats.cachedRouterBytes) / 1e9
                    let payload: [String: Any] = [
                        "schema_version": 1,
                        "stats": try JSONSerialization.jsonObject(with: statsData),
                        "prompt_ids": ids, "output_ids": outputIds, "text": text,
                        "plan": plan.json(), "effective_prefill_chunk": engine.generator.prefillChunk,
                        "effective_pool_slots": engine.model.pool.slots,
                        "effective_prefill_cost_gb": Planner.prefillCostGB(engine.generator.prefillChunk),
                        "effective_expected_peak_gb": plan.expectedPeakGB + Planner.prefillCostGB(engine.generator.prefillChunk) - Planner.prefillCostGB(plan.prefillChunk) + workspaceGB + scopeGB + routerGB,
                        "extra_expert_workspace_gb": workspaceGB,
                        "extra_read_scope_allowance_gb": scopeGB,
                        "extra_router_cache_gb": routerGB,
                        "experimental_memory_family": workspaceGB > 0 || scopeGB > 0 || routerGB > 0,
                        "optimizations": try JSONSerialization.jsonObject(with: JSONEncoder().encode(engine.model.optimizations)),
                        "effective_mtp": engine.model.mtpHead != nil && engine.generator.speculationEnabled,
                        "load_seconds": loadSeconds, "encode_seconds": encodeSeconds,
                        "launch_seconds": RuntimeClock.seconds(since: launchStart),
                        "sampling": ["greedy": greedy, "seed": seed.map(String.init) ?? "default",
                                     "requested_max_tokens": String(maxTokens)],
                    ]
                    try JSONSerialization.data(withJSONObject: payload, options: [.sortedKeys])
                        .write(to: URL(fileURLWithPath: statsJson), options: .atomic)
                }
                if let error = stats.runtimeError { throw ModelError(error) }
                let hs = String(format: "%.3f", stats.expertHitRate)
                let perLayer = String(format: "~%.0f/%d experts per layer", plan.expertsPerLayerCached, Geometry.expertsPerLayer)
                let memoryObservation: String
                if let sample = stats.sampledFootprint {
                    memoryObservation = String(format: "sampled footprint peak %.3f GB", Double(sample.peakBytes) / 1e9)
                } else {
                    memoryObservation = String(format: "RSS high-water %.3f GB, current footprint %.3f GB",
                        Double(stats.lifetimeRSSPeakBytes) / 1e9, Double(stats.physicalFootprintEndBytes) / 1e9)
                }
                FileHandle.standardError.write(
                    """

                    -- prefill \(stats.prefillTokens) tok in \(String(format: "%.2f", stats.prefillSeconds))s (\(String(format: "%.1f", stats.prefillTPS)) tok/s)\(stats.prefixHit ? " | \(stats.reusedPrefixTokens) of \(stats.promptTokens) reused from the previous turn" : "")
                    -- prefill split: io \(String(format: "%.2f", stats.prefillIOSeconds))s + scatter \(String(format: "%.2f", stats.prefillScatterSeconds))s | \(stats.prefillRecords) records (\(String(format: "%.1f", Double(stats.prefillRecords) * 2.7648e-3)) GB, \(String(format: "%.1f", Double(stats.prefillRecords) * 2.7648e-3 / max(stats.prefillIOSeconds, 1e-9))) GB/s)
                    -- decode \(stats.decodeTokens) tok in \(String(format: "%.2f", stats.decodeSeconds))s (\(String(format: "%.2f", stats.decodeTPS)) tok/s)
                    \(RouterTrace.flush().map { $0 + "\n" } ?? "")\(MemTrace.on ? MemTrace.report() + "\n" : "")-- decode split: io \(String(format: "%.2f", stats.decodeIOSeconds))s + scatter \(String(format: "%.2f", stats.decodeScatterSeconds))s | \(stats.decodeRecords) records\(stats.verifyPasses > 0 ? String(format: " | mtp %d/%d drafts accepted (%.0f%%), %d verify passes", stats.acceptedDrafts, stats.draftedTokens, 100 * stats.draftAcceptRate, stats.verifyPasses) : "")
                    -- expert cache \(perLayer), hit rate \(hs) | ngram rows \(stats.ngramRowHits)h/\(stats.ngramRowMisses)m | \(memoryObservation) | total \(String(format: "%.1f", -t0.timeIntervalSinceNow))s

                    """.data(using: .utf8)!)
                result = .success(())
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: serve

struct Serve: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Ollama-compatible API server")
    @OptionGroup var model: ModelOptions
    @Option var port: UInt16 = 11434
    @Option(
        name: .customLong("max-context"),
        help: ArgumentHelp(
            "Longest prompt plus reply accepted per request, in tokens (default \(ContextPolicy.defaultTokens), ceiling \(ContextPolicy.maxTokens)).",
            discussion: """
                The configured window stays fixed for this engine. The planner \
                must fit its state and workspaces before loading; requests \
                above the window are refused. --max-prefill-wait separately \
                bounds accepted-request-to-first-token time. `doctor` reports \
                memory feasibility and available timing estimates; \
                `context-check` runs explicit, unqualified capacity diagnostics.
                """))
    var maxContext: Int = ContextPolicy.defaultTokens
    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0
    @Flag(name: .customLong("no-elastic"),
          help: "Pin the cache at its startup size. Default: an auto-sized cache resizes itself between requests as memory pressure and availability change (explicit size flags are always pinned).")
    var noElastic = false
    @Flag(name: .customLong("no-prefix-cache"),
          help: "Re-prefill every request from scratch. Default: the state of one request is reused by the next when that request's prompt extends it, so a chat turn only prefills what is new.")
    var noPrefixCache = false

    func run() throws {
        if let why = ContextPolicy.validationError(maxContext) { throw PlanError(why) }
        let plan = try model.announcedPlan(maxContext: maxContext, prefixCacheEnabled: !noPrefixCache, maxPrefillWait: maxPrefillWait)
        // Claim the port first: failing here after a full model load wastes
        // half a minute and used to be a fatalError.
        let listenFD = try Server.bindPort(port)
        let sem = DispatchSemaphore(value: 0)
        var engine: Engine!
        var err: Error?
        Task {
            do { engine = try await Engine(modelDir: model.modelURL, plan: plan) } catch { err = error }
            sem.signal()
        }
        sem.wait()
        if let e = err { throw e }
        engine.maxContextTokens = maxContext
        // Long prompts announce themselves in the server log with the wait to
        // expect, then report by quarters; anything under 2k tokens is quiet.
        let progress = PrefillProgressReporter(
            quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
            let stamp = DateFormatter.localizedString(
                from: Date(), dateStyle: .none, timeStyle: .medium)
            FileHandle.standardError.write("[\(stamp)] \(line)\n".data(using: .utf8)!)
        }
        progress.tailAware = engine.model.optimizations.tailAwarePrefill
        engine.generator.onPrefillProgressAbsolute = { done, total, elapsed, base in
            progress.maxChunk = engine.generator.prefillChunk
            progress.report(done: done, total: total, elapsed: elapsed, base: base)
        }
        if noPrefixCache {
            engine.prefixCache.enabled = false
            engine.prefixCache.drop()
            FileHandle.standardError.write(
                "prefix cache: off — every request re-prefills its whole prompt\n"
                    .data(using: .utf8)!)
        }
        var governor: MemoryGovernor?
        if plan.source == .auto, !noElastic {
            governor = MemoryGovernor(engine: engine)
            governor?.start()
        } else if plan.source != .auto, !noElastic {
            FileHandle.standardError.write(
                "elastic: off — an explicit size is pinned; omit the size flag for elastic auto\n"
                    .data(using: .utf8)!)
        }
        defer { governor?.stop() }
        let server = Server(
            engine: engine, port: port, weightsBytes: Int(PinnedModel.totalBytes),
            listenFD: listenFD)
        try server.run()
    }
}

// MARK: parity

struct Parity: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Run N truncated layers and compare hidden states against the Python reference dumps")
    @OptionGroup var model: ModelOptions
    @Option var layers: Int = 4
    @Option(help: "Comma-separated token ids") var tokens: String
    @Option(help: "Directory with python layer_{i}.bin dumps") var compare: String?
    @Option(help: "Write swift layer_{i}.bin dumps here") var out: String?

    func run() throws {
        guard layers >= 1, layers <= Geometry.layers else {
            throw ValidationError("--layers must be between 1 and \(Geometry.layers)")
        }
        let fields = tokens.split(separator: ",", omittingEmptySubsequences: false)
        let parsed = fields.map { Int($0.trimmingCharacters(in: .whitespaces)) }
        guard !fields.isEmpty, parsed.allSatisfy({ $0 != nil }) else {
            throw ValidationError("--tokens must be a non-empty comma-separated list of integers")
        }
        let ids = parsed.compactMap { $0 }
        let index = try CheckpointIndex(dir: model.modelURL)
        guard ids.allSatisfy({ $0 >= 0 && $0 < index.config.vocabSize }) else {
            throw ValidationError("--tokens contains an id outside 0..<\(index.config.vocabSize)")
        }
        let m = try Qwen4ExpModel(index: index, poolSlots: 2048, runLayers: layers)
        try m.validate()
        let state = m.makeState()
        var dumps: [Int: [Float]] = [:]
        let h = m.hiddenStates(ids, state: state) { l, arr in
            dumps[l] = arr.asType(.float32).asArray(Float.self)
        }
        eval(h)
        if let out {
            try FileManager.default.createDirectory(atPath: out, withIntermediateDirectories: true)
            for (l, v) in dumps {
                let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
                try d.write(to: URL(fileURLWithPath: out).appendingPathComponent("layer_\(l).bin"))
            }
            print("wrote \(dumps.count) layer dumps to \(out)")
        }
        if let cmp = compare {
            var worst: Float = 0
            for l in 0 ..< layers {
                let url = URL(fileURLWithPath: cmp).appendingPathComponent("layer_\(l).bin")
                let refData = try Data(contentsOf: url)
                guard refData.count % MemoryLayout<Float>.size == 0 else {
                    throw ValidationError("layer \(l) reference is not a whole number of Float32 values")
                }
                let ref: [Float] = refData.withUnsafeBytes { Array($0.bindMemory(to: Float.self)) }
                guard let got = dumps[l] else {
                    throw ValidationError("no generated dump for layer \(l)")
                }
                guard ref.count == got.count else {
                    throw ValidationError(
                        "layer \(l) reference has \(ref.count) floats, generated dump has \(got.count)")
                }
                var maxAbs: Float = 0
                var refScale: Float = 0
                for i in 0 ..< ref.count {
                    maxAbs = max(maxAbs, abs(ref[i] - got[i]))
                    refScale = max(refScale, abs(ref[i]))
                }
                let rel = maxAbs / max(refScale, 1e-6)
                worst = max(worst, rel)
                print(String(format: "layer %2d: max abs %.5f, rel %.5f  %@", l, maxAbs, rel, rel < 2e-2 ? "OK" : "FAIL"))
            }
            print(worst < 2e-2 ? "PARITY PASS" : "PARITY FAIL")
            if worst >= 2e-2 { throw ExitCode(2) }
        }
    }
}

// MARK: doctor

struct Doctor: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Machine report, the plan your flags produce, and what each memory target buys")
    @OptionGroup var model: ModelOptions

    @Option(name: .customLong("sim-ram"),
            help: "What-if: preview the plan for a machine with this much RAM in GB (pristine unless --sim-available is also given; working set defaults to 75% of RAM)")
    var simRAM: Double?
    @Option(name: .customLong("sim-working-set"),
            help: "What-if: pretend this Metal working-set limit (GB)")
    var simWorkingSet: Double?
    @Option(name: .customLong("sim-available"),
            help: "What-if: pretend this much memory is reclaimable right now (GB)")
    var simAvailable: Double?

    @Flag(name: .customLong("json"),
          help: "Print the resolved plan as JSON instead of the report. Estimates are unrounded here; the report rounds them.")
    var asJSON = false

    @Option(name: .customLong("max-context"),
            help: "Preview the plan `serve --max-context N` would announce (default \(ContextPolicy.defaultTokens), ceiling \(ContextPolicy.maxTokens)).")
    var maxContext: Int = ContextPolicy.defaultTokens
    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0

    /// One line on the 104 GB the plan above says nothing about: is it here,
    /// is there room for it, and roughly how long it takes.
    func weightsLine() -> String {
        let url = model.modelURL
        guard model.model == PinnedModel.name || model.model == PinnedModel.dirName else {
            return "weights: \(url.path) (not the pinned model — size unknown)"
        }
        let fm = FileManager.default
        let remaining = WeightStore.remainingBytes(at: url)
        if remaining == 0 {
            return String(format: "weights: present by size, %.1f GB at %@ (run pull --verify for hashes)",
                          Double(PinnedModel.totalBytes) / 1e9, url.path)
        }
        var probe = url
        while !fm.fileExists(atPath: probe.path), probe.path != "/" {
            probe.deleteLastPathComponent()
        }
        let free = (try? fm.attributesOfFileSystem(forPath: probe.path))?[
            .systemFreeSize] as? Int64 ?? 0
        let need = remaining + 2_000_000_000
        let room = free >= need
            ? String(format: "%.0f GB free is enough", Double(free) / 1e9)
            : String(format: "ONLY %.0f GB free, needs %.0f GB",
                     Double(free) / 1e9, Double(need) / 1e9)
        return String(format: "weights: %.1f GB to download (%@ at best) — %@",
                      Double(remaining) / 1e9, WeightStore.etaHint(remaining), room)
    }

    func run() throws {
        let configuration = try ContextConfiguration(maxContextTokens: maxContext, maxPrefillWaitMinutes: maxPrefillWait)
        // --json is for machines: emit the plan and nothing else.
        let quiet = asJSON
        let info = MLX.GPU.deviceInfo()
        if !quiet {
            print("device: \(info.architecture)  |  "
                + String(format: "%.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                         Planner.deviceRAMGB(),
                         Planner.deviceAvailableGB() ?? .nan, Planner.deviceWorkingSetGB()))
        }
        if !quiet {
            print("model:  \(Geometry.layers) layers x \(Geometry.expertsPerLayer) experts x 2.76 MB "
                + "(\(Geometry.totalRecords) records = 67.9 GB streamed from SSD)")
        }
        // Disk is the gate that bites before memory does, and the README sends
        // people here *before* they download, so answer that question too.
        if !quiet { print(weightsLine()) }
        if !quiet { print("") }
        let simulating = simRAM != nil || simWorkingSet != nil || simAvailable != nil
        if simulating, !quiet { print("what-if for a simulated machine (this device shown above):") }
        let simulatedAvailable = simulating
            ? (simAvailable ?? simRAM ?? Planner.deviceRAMGB()) : nil
        // A what-if plans against a Machine that says it is simulated, so the
        // plan it produces is marked and can never be handed to Engine.load.
        let device: Machine = simulating
            ? Machine(
                ramGB: simRAM ?? Planner.deviceRAMGB(),
                workingSetGB: simWorkingSet ?? (simRAM.map { $0 * 0.75 } ?? Planner.deviceWorkingSetGB()),
                availableGB: simulatedAvailable, isSimulated: true)
            : .current()
        let request = PlanRequest(expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
            memoryGB: model.memoryGB, maxRAMPercent: model.maxRAMPercent,
            mtp: try model.mtpMode(), vision: try model.visionMode(), maxContextTokens: maxContext)
        let feasibility = Planner.contextFeasibility(request, on: device,
            mtpAvailable: MTPWeights.present(modelDir: model.modelURL),
            visionAvailable: model.visionAvailable(), runtimePolicy: try model.runtimePolicy())
        let advisory: MemoryPlan?
        if feasibility.requestedPlan == nil, maxContext <= ContextPolicy.defaultTokens,
           model.expertsPerLayer != nil || model.poolGB != nil {
            advisory = try Planner.plan(expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
                memoryGB: model.memoryGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
                availableGB: device.availableGB, ramPercent: model.maxRAMPercent,
                mtp: model.mtpMode(), mtpAvailable: MTPWeights.present(modelDir: model.modelURL),
                vision: model.visionMode(), visionAvailable: model.visionAvailable(),
                maxContextTokens: maxContext, simulated: device.isSimulated, runtimePolicy: model.runtimePolicy())
        } else { advisory = nil }
        guard let requestedPlan = feasibility.requestedPlan ?? advisory else {
            if asJSON {
                let output: [String: Any] = ["error": ["code": "insufficient_memory",
                    "message": feasibility.refusal ?? "requested configuration does not fit"],
                    "context_feasibility": feasibility.json]
                print(String(decoding: try JSONSerialization.data(withJSONObject: output,
                    options: [.prettyPrinted, .sortedKeys]), as: UTF8.self))
                throw ExitCode(2)
            }
            throw PlanError("\(feasibility.refusal ?? "requested configuration does not fit"); maximum feasible window: \(feasibility.maximumFeasibleWindow) tokens")
        }
        let plan = try requestedPlan.withRequestPolicy(configuration)
        if asJSON {
            var output = plan.json(); output["context_feasibility"] = feasibility.json
            let data = try JSONSerialization.data(
                withJSONObject: output, options: [.prettyPrinted, .sortedKeys])
            print(String(decoding: data, as: UTF8.self))
            return
        }
        print(plan.banner())
        print("memory-feasible window: \(feasibility.maximumFeasibleWindow) tokens; separate from the \(maxPrefillWait)-minute request-to-first-token policy")
        print("""

        knobs (first one given wins; with none, auto is the default):
          --memory-gb G           easiest: total memory the process may use
          --experts-per-layer N   precise: cache N of 512 per layer (pool = N x 0.133 GB)
          --pool-gb G             raw pool size (1 GB = 7.5 experts/layer)
        """)
        print(String(
            format: "min ~%.0f/layer = %.1f GB total. The pool is one global cache shared across",
            Geometry.perLayer(Geometry.floorSlots), Planner.minMemoryGB))
        print("""
            all layers -- per-layer is the unit of intuition (a token activates 10
            of its 512 per layer), not a quota: hot layers borrow slots from cold.

            what a memory target buys (conservative warm-decode estimate from
            measured M5 Pro anchors: 30/layer = 6.0, 150/layer = 11.6; the last
            column is the wait before the first token of a prompt filling the
            whole context, follow-up turns read only what is new):
              target     experts/layer  est. warm decode   pass    full \(maxContext)-token prompt
            """)
        for t in [Planner.minMemoryGB, 10, 12, 16, 24, 28, 36, 48, 73]
        where t >= Planner.minMemoryGB
        {
            guard let row = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: t,
                ramGB: device.ramGB, workingSetGB: device.workingSetGB, availableGB: device.availableGB,
                maxContextTokens: maxContext, simulated: true, runtimePolicy: model.runtimePolicy()) else {
                print(String(format: "  %6.1f GB   unavailable at this context", t)); continue
            }
            let e = row.expertsPerLayerCached
            let est = row.estWarmTokS
            let full = row.fullyResident
            let chunk = row.prefillChunk
            let wait = PrefillSchedule.estSeconds(tokens: maxContext, maxChunk: chunk)
            print(String(
                format: "  %6.1f GB   %8.0f/512      ~%2.0f tok/s%@   %5d   ~%@",
                t, e, est, full ? " (resident)" : "", chunk,
                PrefillSchedule.describe(seconds: wait)))
        }
        print("""

        time to first token at this plan, by prompt length (the pass shrinks past ~4k
        tokens so its transient memory stays inside what was measured):
        """)
        let chunk = plan.prefillChunk
        var lengths = [2048, 8192, 16384].filter { $0 < maxContext }
        lengths.append(maxContext)
        let row = lengths.map { n -> String in
                let secs = PrefillSchedule.estSeconds(tokens: n, maxChunk: chunk)
                let label = n % 1024 == 0 ? "\(n / 1024)k" : "\(n)"
                return "\(label) ~\(PrefillSchedule.describe(seconds: secs))"
            }
        print("  " + row.joined(separator: " · ") + " (the cap)")
        print("""
          context state is ~27 KiB per token; the cap of \(ContextPolicy.maxTokens) is the largest context
          measured so far, not a memory limit. `slotstream context-check --tokens N` measures a
          longer prompt on this Mac and stops before it swaps.
        """)
    }
}

// MARK: elastic-check

struct ElasticCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "elastic-check",
        abstract: "Prove greedy output is byte-identical across live pool grow/shrink")
    @OptionGroup var model: ModelOptions
    @Option var maxTokens: Int = 24
    @Option(help: "Slot count for the grow step (lower it on small machines; the equality property is size-independent)")
    var bigSlots: Int = 960

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let tokens = maxTokens
        let big = bigSlots
        Task {
            do {
                // stay near the safe floor; equality is independent of size
                let smallSlots = Geometry.floorSlots
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: smallSlots)
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: "Why is the sky blue?")], thinking: false)
                var p = SampleParams.greedy
                p.maxTokens = tokens
                func gen(_ label: String) -> String {
                    let t0 = Date()
                    let out = engine.generate(promptIds: ids, params: p).text
                    FileHandle.standardError.write(String(
                        format: "  %@ (%d slots): %.1fs\n", label, engine.model.pool.slots,
                        -t0.timeIntervalSinceNow).data(using: .utf8)!)
                    return out
                }
                let a = gen("baseline    ")
                engine.withExclusive { engine.model.pool.resize(to: big); engine.publishPoolSnapshot() }
                let b = gen("after grow  ")
                engine.withExclusive { engine.model.pool.resize(to: smallSlots); engine.publishPoolSnapshot() }
                let c = gen("after shrink")
                engine.withExclusive { engine.model.pool.resize(to: 800); engine.publishPoolSnapshot() }
                let d = gen("after regrow")
                if a == b, b == c, c == d {
                    print("ELASTIC CHECK PASS: 4 generations byte-identical across "
                        + "\(Int(Geometry.perLayer(smallSlots)))→\(Int(Geometry.perLayer(big)))"
                        + "→\(Int(Geometry.perLayer(smallSlots)))→\(Int(Geometry.perLayer(800))) experts/layer")
                } else {
                    print("ELASTIC CHECK FAIL")
                    for (n, s) in [("a", a), ("b", b), ("c", c), ("d", d)] { print("--- \(n):\n\(s)") }
                    throw ExitCode(2)
                }
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

struct ElasticDrill: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "elastic-drill",
        abstract: "Drive the live governor through shrink and grow and prove output is unchanged")
    @OptionGroup var model: ModelOptions
    @Option(help: "Slots to start from (must be well above the floor so there is room to shrink)")
    var slots: Int = 4000
    @Flag(help: "Skip the 60 s grow cooldown wait and only assert the shrink half")
    var quick = false

    /// `elastic-check` proves the *pool* can be resized without changing the
    /// math. This proves the *governor* actually decides to do it: poll,
    /// decide, take the generation lock, resize, update the plan, log. That
    /// path had never been exercised on a shipped build, because triggering it
    /// for real needs the machine pushed to the edge of its memory — which is
    /// exactly what `Planner.availabilityOverride` exists to avoid.
    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let startSlots = slots
        let skipGrow = quick
        Task {
            do {
                var fail: [String] = []
                func note(_ s: String) {
                    FileHandle.standardError.write((s + "\n").data(using: .utf8)!)
                }
                // `availabilityOverride` makes the governor allocate for real,
                // so every simulated figure here is bounded by what the machine
                // actually has. Simulating "plenty free" on a busy Mac once made
                // the governor take a 25 GB pool and drove tens of GB of swap —
                // the seam avoids *needing* pressure, it does not make the
                // resulting allocation imaginary.
                // A shrink can only be demonstrated from a pool at least the
                // floor plus both policy dead-bands: shrink needs 1 GB and the
                // later recovery needs 2 GB. Below that, the governor correctly
                // refuses to grow and the drill would misreport a policy failure.
                // The planner's round-trip reserves prefill/cache state from
                // this budget too, so use 3 GB to leave the desired expert pool
                // safely more than 2 GB above the floor after that reservation.
                let extraSlots = Int((3.0e9 / Geometry.recordBytes).rounded(.up))
                let minStartSlots = Geometry.floorSlots + extraSlots
                let minStartPool = Geometry.gb(minStartSlots)
                let minAvailable = max(12.0, minStartPool * 3)
                guard let realAvail = Planner.deviceAvailableGB(), realAvail >= minAvailable else {
                    print(String(format:
                        "ELASTIC DRILL SKIP: needs ~%.0f GB reclaimable to leave room for a "
                        + "shrink, machine has %.1f GB. Close some apps and retry.",
                        minAvailable, Planner.deviceAvailableGB() ?? 0))
                    sem.signal()
                    return
                }
                // Take at most a third of what is genuinely free for the pool,
                // but always start far enough above the floor to cross the
                // governor's 1 GB dead-band. Running an auto replan here used
                // to subtract availability slack and cache costs again, turning
                // --slots 1000 into a pool that was too small to shrink.
                let cappedSlots = Int(realAvail / 3 * 1e9 / Geometry.recordBytes)
                let initialSlots = min(max(startSlots, minStartSlots), cappedSlots)
                let poolCeiling = Geometry.gb(initialSlots)
                let chunk = Planner.prefillChunkFor(poolBudgetGB: poolCeiling)
                let cacheTokens = Planner.prefixCacheTokensFor(poolBudgetGB: poolCeiling)
                let target = poolCeiling + Planner.fixedFootprintGB
                    + Planner.prefillCostGB(chunk)
                    + Planner.prefixCacheCostGB(tokens: cacheTokens)
                    + Planner.planningMarginGB
                let plan = MemoryPlan(
                    source: .auto, slots: initialSlots, targetGB: target,
                    ramGB: Planner.deviceRAMGB(),
                    workingSetGB: Planner.deviceWorkingSetGB(),
                    ramPercent: Planner.defaultRAMPercent,
                    availableGB: realAvail, clamped: false,
                    prefillChunk: chunk, prefixCacheTokens: cacheTokens,
                    notes: ["elastic drill bounded test plan"])
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                note(String(format: "  (machine has %.1f GB reclaimable; drill capped at a "
                    + "%.1f GB pool)", realAvail, poolCeiling))

                var p = SampleParams.greedy
                p.maxTokens = 20
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: "Name three rivers, comma separated.")],
                    thinking: false)
                func gen() -> String { engine.generate(promptIds: ids, params: p).text }

                let gov = MemoryGovernor(engine: engine)
                gov.start()
                defer { gov.stop() }

                let before = gen()
                let s0 = engine.model.pool.slots
                note(String(format: "  start:  %d slots (~%.0f/layer) -> %@",
                    s0, Geometry.perLayer(s0), before))

                // --- shrink: pretend the machine just got busy
                Planner.availabilityOverride = 2.0
                let shrinkInputs = GovernorPolicy.Inputs(
                    currentSlots: s0, availableGB: 2.0,
                    ramGB: plan.ramGB, workingSetGB: plan.workingSetGB,
                    ramPercent: plan.ramPercent)
                let startCache = engine.prefixCache.maxTokens
                gov.pollNow()
                let s1 = engine.model.pool.slots
                let underPressure = gen()
                note(String(format: "  squeeze: %d slots (~%.0f/layer) -> %@",
                    s1, Geometry.perLayer(s1), underPressure))
                if s1 >= s0 { fail.append("governor did not shrink: \(s0) -> \(s1)") }
                // Expect the controls for the pool the governor actually landed
                // on. decide() applies dead-bands and a per-step shed cap, so
                // the resulting pool is frequently not the target desiredSlots
                // suggested; asserting against that suggestion made this gate
                // pass on a quiet machine and fail on a busy one, which is the
                // opposite of what a memory gate is for. Tracking s1 still
                // proves the point -- the live controls follow the real pool --
                // and the ceiling must separately have gone down, so this
                // cannot pass by never changing at all.
                let shrinkControls = GovernorPolicy.liveControls(
                    for: s1, inputs: shrinkInputs)
                let expectedChunk = shrinkControls.prefillChunk
                let expectedCache = shrinkControls.prefixCacheTokens
                if engine.prefixCache.maxTokens >= startCache {
                    fail.append("prefix-cache ceiling did not shrink at all: stayed at \(startCache)")
                }
                if engine.generator.prefillChunk != expectedChunk {
                    fail.append("live prefill chunk stayed at \(engine.generator.prefillChunk), expected \(expectedChunk) after shrink")
                }
                if engine.prefixCache.maxTokens != expectedCache {
                    fail.append("live prefix-cache ceiling stayed at \(engine.prefixCache.maxTokens), expected \(expectedCache) after shrink")
                }
                if underPressure != before {
                    fail.append("output changed across a shrink\n    before: \(before)\n    after:  \(underPressure)")
                }

                // --- grow: memory comes back, but only to where we started —
                //     never to a figure the machine cannot actually honour.
                // The governor credits the currently resident (shrunken) pool
                // and fixed weights before replanning. Find the smallest safe
                // availability stimulus that reconstructs the actual starting
                // pool; deriving it from the hand-built target loses the
                // planner's nonlinear prefill/cache reservations and can land
                // below the 2 GB grow dead-band.
                func desiredSlots(at available: Double) -> Int {
                    GovernorPolicy.desiredSlots(GovernorPolicy.Inputs(
                        currentSlots: s1, availableGB: available,
                        ramGB: plan.ramGB, workingSetGB: plan.workingSetGB,
                        ramPercent: plan.ramPercent)) ?? s1
                }
                var low = 0.0
                var high = realAvail
                if desiredSlots(at: high) < s0 {
                    fail.append("real reclaimable memory cannot reconstruct the bounded starting pool")
                } else {
                    for _ in 0 ..< 48 {
                        let mid = (low + high) / 2
                        if desiredSlots(at: mid) < s0 { low = mid } else { high = mid }
                    }
                }
                let recoveryAvailability = high
                let recoveryInputs = GovernorPolicy.Inputs(
                    currentSlots: s1, availableGB: recoveryAvailability,
                    ramGB: plan.ramGB, workingSetGB: plan.workingSetGB,
                    ramPercent: plan.ramPercent)
                note(String(
                    format: "  recovery stimulus: %.1f GB available -> %d desired slots (%.1f GB growth)",
                    recoveryAvailability,
                    GovernorPolicy.desiredSlots(recoveryInputs) ?? s1,
                    Geometry.gb((GovernorPolicy.desiredSlots(recoveryInputs) ?? s1) - s1)))
                Planner.availabilityOverride = recoveryAvailability
                gov.pollNow()
                if engine.model.pool.slots != s1 {
                    fail.append("governor grew during the cooldown (should wait \(Int(GovernorPolicy.growCooldown)) s)")
                } else {
                    note("  cooldown: held at \(s1) slots, as designed")
                }

                if !skipGrow {
                    note("  waiting out the \(Int(GovernorPolicy.growCooldown)) s grow cooldown...")
                    try await Task.sleep(
                        for: .seconds(GovernorPolicy.growCooldown + 3))
                    gov.pollNow()
                    let s2 = engine.model.pool.slots
                    let recovered = gen()
                    note(String(format: "  recover: %d slots (~%.0f/layer) -> %@",
                        s2, Geometry.perLayer(s2), recovered))
                    if s2 <= s1 { fail.append("governor did not grow back: \(s1) -> \(s2)") }
                    if recovered != before {
                        fail.append("output changed across a grow\n    before: \(before)\n    after:  \(recovered)")
                    }
                }
                Planner.availabilityOverride = nil

                if fail.isEmpty {
                    print("ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the "
                        + "grow cooldown\(skipGrow ? "" : ", grew back when memory returned"), "
                        + "and every generation was byte-identical")
                } else {
                    print("ELASTIC DRILL FAIL")
                    for f in fail { print("  - \(f)") }
                    throw ExitCode(2)
                }
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

struct PrefixCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "prefix-check",
        abstract: "Prove conversation prefix reuse is equivalent, bounded, and deterministic")
    @OptionGroup var model: ModelOptions
    @Option(help: "Slots to run with (small keeps the check cheap; these properties are size-independent)")
    var slots: Int = Geometry.floorSlots
    @Option var maxTokens: Int = 24

    /// A short multi-turn chat, driven exactly as a client drives one: every
    /// turn re-sends the whole history through the chat template, so the prompt
    /// is re-tokenized from text each time. That is the real test of whether a
    /// cache can hit at all — re-encoding the previous reply has to reproduce
    /// the ids that were generated.
    static let turns = [
        "Name one planet. Answer with just the name.",
        "Is it bigger than Earth? Answer yes or no.",
        "Why? One short sentence.",
    ]

    /// Logits after a state was built incrementally — a prefill plus one-token
    /// decode steps, exactly how the cache builds one — against logits from a
    /// single cold prefill of the same ids.
    ///
    /// These are NOT bit-identical and cannot be. MLX selects kernels and
    /// reduction orders by tensor shape, so summing the same values in a
    /// different batching sums them in a different order, and floating point
    /// is not associative. Measured here: over a 64-token sequence, every one
    /// of the 63 possible split points differs. What must hold instead is that
    /// the difference stays down in the rounding noise and does not grow as a
    /// conversation gets longer — that is the line between harmless
    /// re-association and a state that is actually being corrupted.
    /// Logits for `ids`, built either in one pass, in fixed-size passes, or
    /// incrementally the way a cached state is (a prefill, then one-token
    /// steps).
    enum Build { case whole, chunked(Int), incremental(Int) }

    static func logits(_ engine: Engine, ids: [Int], _ how: Build) -> [Float] {
        func vec(_ a: MLXArray) -> [Float] {
            a.reshaped([-1]).asType(.float32).asArray(Float.self)
        }
        let st = engine.model.makeState()
        switch how {
        case .whole:
            return vec(engine.model.lastLogits(ids, state: st))
        case .chunked(let c):
            var i = 0
            var last = MLXArray(0)
            while i < ids.count {
                let hi = min(i + c, ids.count)
                if hi == ids.count {
                    last = engine.model.lastLogits(Array(ids[i ..< hi]), state: st)
                } else {
                    eval(engine.model.hiddenStates(Array(ids[i ..< hi]), state: st))
                }
                i = hi
            }
            return vec(last)
        case .incremental(let split):
            eval(engine.model.hiddenStates(Array(ids[0 ..< split]), state: st))
            var last = MLXArray(0)
            for t in ids[split...] { last = engine.model.lastLogits([t], state: st) }
            return vec(last)
        }
    }

    static func compare(_ a: [Float], _ b: [Float]) -> (relDelta: Double, sameTop1: Bool) {
        var maxDiff: Float = 0
        for (x, y) in zip(a, b) { maxDiff = max(maxDiff, abs(x - y)) }
        let spread = (a.max() ?? 1) - (a.min() ?? 0)
        func argmax(_ v: [Float]) -> Int {
            var bi = 0
            for i in v.indices where v[i] > v[bi] { bi = i }
            return bi
        }
        return (Double(maxDiff) / Double(max(spread, 1e-6)), argmax(a) == argmax(b))
    }

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let tokens = maxTokens
        let poolSlots = slots
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: poolSlots)
                var p = SampleParams.greedy
                p.maxTokens = tokens
                var failures: [String] = []
                func note(_ s: String) {
                    FileHandle.standardError.write((s + "\n").data(using: .utf8)!)
                }

                // ---- 1. Equivalence is bounded, and does not drift with depth.
                //
                // A reused state must stay in rounding noise against a cold
                // rebuild. Corruption — a misaligned prefix, a stale cache, a
                // dropped position — moves logits by a large fraction of their
                // own spread, so a relative bound catches it while accepting
                // re-association. Growth with depth is the other failure this
                // separates out: rounding does not compound, corruption does.
                let base = try engine.encodeChat(
                    [ChatMessage(role: "user", content:
                        "Explain in two sentences why the ocean is salty and how rivers carry minerals.")],
                    thinking: false)
                var deltas: [(Int, Double)] = []
                var controls: [Double] = []
                var top1 = 0
                var probes = 0
                for reps in [1, 4, 8] {
                    var ids = base
                    let body = Array(base.dropFirst(4))
                    for _ in 1 ..< reps { ids += body }
                    let split = ids.count / 2
                    let whole = Self.logits(engine, ids: ids, .whole)
                    // Control: re-chunking a plain prefill. Nobody disputes
                    // that this is the same computation — it is the existing
                    // chunk-equivalence gate — so whatever it moves the logits
                    // by is the size of "the same answer, summed differently"
                    // on this model. The cache has to live inside that band.
                    let (ctrl, _) = Self.compare(whole, Self.logits(engine, ids: ids, .chunked(7)))
                    let (rel, same) = Self.compare(
                        whole, Self.logits(engine, ids: ids, .incremental(split)))
                    deltas.append((ids.count, rel))
                    controls.append(ctrl)
                    probes += 1
                    if same { top1 += 1 }
                    note(String(format: "  equivalence at %d tokens: reuse %.3f%% vs "
                        + "prefill-rechunk control %.3f%% of logit spread, top-1 %@",
                        ids.count, rel * 100, ctrl * 100, same ? "same" : "differs"))
                }
                let worst = deltas.map(\.1).max() ?? 0
                let worstControl = controls.max() ?? 0
                // The bound is the control, not a number picked by hand: state
                // reuse may not move logits materially more than re-chunking a
                // prefill already does. A corrupted or misaligned state fails
                // this by orders of magnitude.
                let bound = max(worstControl * 3, 0.01)
                if worst > bound {
                    failures.append(String(format:
                        "reused state moved logits by %.2f%% of their spread, over the "
                        + "%.2f%% bound set by the prefill-rechunk control — that is "
                        + "corruption, not re-association", worst * 100, bound * 100))
                }
                // Depth must not amplify it. Allow a factor of 3 over the
                // shallowest probe before calling it drift.
                if let first = deltas.first?.1, let deepest = deltas.last?.1,
                    first > 0, deepest > max(first * 3, 0.01)
                {
                    failures.append(String(format:
                        "equivalence degrades with depth (%.3f%% -> %.3f%%): state is "
                        + "accumulating error, not just re-associating",
                        first * 100, deepest * 100))
                }

                // ---- 2. A conversation, driven as a client drives one.
                func conversation(cached: Bool, edit: String? = nil) throws -> [(String, GenStats)] {
                    engine.prefixCache.drop()
                    engine.prefixCache.enabled = cached
                    engine.prefixCache.resetStats()
                    var history: [ChatMessage] = []
                    var out: [(String, GenStats)] = []
                    for (i, q) in Self.turns.enumerated() {
                        history.append(ChatMessage(
                            role: "user", content: (i == 0 && edit != nil) ? edit! : q))
                        let ids = try engine.encodeChat(history, thinking: false)
                        let r = engine.generate(promptIds: ids, params: p)
                        history.append(ChatMessage(role: "assistant", content: r.text))
                        out.append((r.text, r.stats))
                    }
                    return out
                }

                let warmA = try conversation(cached: true)
                let warmB = try conversation(cached: true)
                let cold = try conversation(cached: false)

                // ---- 3. Reuse actually happens. Without this the rest is vacuous.
                let reusing = warmA.dropFirst().filter { $0.1.prefixHit }.count
                if reusing == 0 {
                    failures.append(
                        "no turn reused a cached prefix — re-encoding a reply does not "
                        + "reproduce its generated ids, so the cache can never hit")
                }

                // ---- 4. The cached path is deterministic. Two identical runs
                //         must agree exactly; this is the invariant that a real
                //         cache bug breaks, and it is not weakened by the
                //         re-association in check 1.
                for (i, (a, b)) in zip(warmA, warmB).enumerated() where a.0 != b.0 {
                    failures.append("cached run is not deterministic at turn \(i + 1)\n"
                        + "    run 1: \(a.0)\n    run 2: \(b.0)")
                }

                // ---- 5. A prompt that does not extend the held state must
                //         rebuild, and must still be deterministic.
                let editQ = "Name one ocean. Answer with just the name."
                let edA = try conversation(cached: true, edit: editQ)
                let edB = try conversation(cached: true, edit: editQ)
                for (i, (a, b)) in zip(edA, edB).enumerated() where a.0 != b.0 {
                    failures.append("edited-history run is not deterministic at turn \(i + 1)")
                }

                // ---- 6. The shed path the governor uses under memory pressure:
                //         the state is released and the next turn rebuilds. Tested
                //         through its own contract rather than by putting the
                //         machine under real pressure to watch it happen.
                engine.prefixCache.drop()
                engine.prefixCache.enabled = true
                engine.prefixCache.resetStats()
                var hist: [ChatMessage] = [ChatMessage(role: "user", content: Self.turns[0])]
                let r1 = engine.generate(
                    promptIds: try engine.encodeChat(hist, thinking: false), params: p)
                hist.append(ChatMessage(role: "assistant", content: r1.text))
                if engine.prefixCache.heldTokens == 0 {
                    failures.append("nothing retained after a generation")
                }
                engine.dropPrefixCache()
                if engine.prefixCache.heldTokens != 0 {
                    failures.append("dropPrefixCache left \(engine.prefixCache.heldTokens) tokens held")
                }
                hist.append(ChatMessage(role: "user", content: Self.turns[1]))
                let afterShed = engine.generate(
                    promptIds: try engine.encodeChat(hist, thinking: false), params: p)
                if afterShed.stats.prefixHit {
                    failures.append("a shed state was still reused — drop() is not releasing it")
                }
                note(String(format: "  shed: retained %d tokens, dropped, next turn rebuilt %d",
                    r1.stats.promptTokens + r1.ids.count, afterShed.stats.prefillTokens))

                for (i, (t, st)) in warmA.enumerated() {
                    note(String(format: "  turn %d: %d prompt tok, %d reused, prefill %.2fs -> %@",
                        i + 1, st.promptTokens, st.reusedPrefixTokens, st.prefillSeconds,
                        t.replacingOccurrences(of: "\n", with: " ").prefix(44).description))
                }
                let coldPrefill = cold.dropFirst().reduce(0.0) { $0 + $1.1.prefillSeconds }
                let warmPrefill = warmA.dropFirst().reduce(0.0) { $0 + $1.1.prefillSeconds }
                // Informational, never asserted: how often re-association moved
                // a near-tied greedy pick far enough to change the reply.
                let changed = zip(cold, warmA).filter { $0.0 != $1.0 }.count

                if failures.isEmpty {
                    print(String(format:
                        "PREFIX CHECK PASS: reuse moves logits %.2f%% vs %.2f%% for the "
                        + "prefill-rechunk control, flat with depth, top-1 %d/%d; %d of %d "
                        + "turns reused a prefix; cached and edited-history runs "
                        + "deterministic; follow-up prefill %.2fs -> %.2fs (%d of %d replies "
                        + "differ from a cold rebuild)",
                        worst * 100, worstControl * 100, top1, probes, reusing,
                        warmA.count - 1, coldPrefill, warmPrefill, changed, cold.count))
                } else {
                    print("PREFIX CHECK FAIL")
                    for f in failures { print("  - \(f)") }
                    throw ExitCode(2)
                }
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: goldens

struct NgramGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "ngram-golden",
        abstract: "Print n-gram row ids for a token sequence (compare vs python)")
    @OptionGroup var model: ModelOptions
    @Option var tokens: String

    func run() throws {
        let fields = tokens.split(separator: ",", omittingEmptySubsequences: false)
        let parsed = fields.map { Int64($0.trimmingCharacters(in: .whitespaces)) }
        guard !fields.isEmpty, parsed.allSatisfy({ $0 != nil }) else {
            throw ValidationError("--tokens must be a non-empty comma-separated list of integers")
        }
        let ids = parsed.compactMap { $0 }
        let index = try CheckpointIndex(dir: model.modelURL)
        guard ids.allSatisfy({ $0 >= 0 && $0 < Int64(index.config.vocabSize) }) else {
            throw ValidationError("--tokens contains an id outside 0..<\(index.config.vocabSize)")
        }
        let resident = try ResidentWeights(index: index)
        let store = NgramStore(index: index, resident: resident)
        let eos = Int64(index.config.eosTokenId)
        let history = [eos, eos] + ids
        let rows = store.rowIds(history: history, nNew: ids.count)
        for (i, r) in rows.enumerated() {
            print("pos\(i): " + r.map(String.init).joined(separator: ","))
        }
    }
}

struct DequantGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "dequant-golden",
        abstract: "CPU-dequantize one ngram row and print values (compare vs mx.dequantize)")
    @OptionGroup var model: ModelOptions
    @Option var gid: Int64 = 12345

    func run() throws {
        guard gid >= 0 else { throw ValidationError("--gid must not be negative") }
        let index = try CheckpointIndex(dir: model.modelURL)
        let resident = try ResidentWeights(index: index)
        let store = NgramStore(index: index, resident: resident)
        guard gid >= 0, gid < Int64(store.rowCapacity) else {
            throw ValidationError("--gid must be between 0 and \(store.rowCapacity - 1)")
        }
        print("rowsPerShard: \(store.rowsPerShard)")
        print("multipliers: \(store.multipliers)")
        let row = store.debugRow(gid)
        print("row[\(gid)][0..16]: " + row.prefix(16).map { String(format: "%.6f", $0) }.joined(separator: ","))
    }
}

/// Drives the elastic governor's decision policy across every branch with
/// scripted inputs. No checkpoint is loaded and no real memory is consumed:
/// putting the machine under genuine pressure to observe the policy is both
/// dangerous and unrepeatable, so the policy is a pure function and this is
/// its test. `elastic-check` separately proves the resize *mechanism* keeps
/// output byte-identical.
struct GovernorCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "governor-check",
        abstract: "Prove the elastic resize policy behaves across pressure, availability and cooldowns")

    func run() throws {
        try CheckRendering.emitTally(Diagnostics.governorPolicy(), label: "governor policy")
    }
}

/// Drives the sampler on synthetic logits with no checkpoint loaded, so its
/// behaviour can be diffed against `Tools/sampler_ref.py`. The logits come from
/// the same splitmix64 stream on both sides, built only from exactly
/// representable float operations so the two agree bit for bit.
struct SamplerGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sampler-golden",
        abstract: "Sample from reproducible synthetic logits (compare vs Tools/sampler_ref.py)")
    @Option var vocab: Int = 256
    @Option var draws: Int = 24
    @Option var seed: UInt64 = 7
    @Option(help: "Seed for the synthetic logits themselves") var logitSeed: UInt64 = 99
    @Option var temperature: Float = 0.8
    @Option var topP: Float = 0.95
    @Option var topK: Int = 40
    @Option var minP: Float = 0
    @Option var presencePenalty: Float = 0
    @Flag(help: "Feed each pick back as 'already generated' (exercises the penalty)")
    var accumulate = false

    func run() throws {
        var p = SampleParams()
        p.temperature = temperature
        p.topP = topP
        p.topK = topK
        p.minP = minP
        p.presencePenalty = presencePenalty
        let picks = try Goldens.sampler(
            vocab: vocab, draws: draws, seed: seed, logitSeed: logitSeed, params: p,
            accumulate: accumulate)
        print(picks.map(String.init).joined(separator: ","))
    }
}

struct TemplateCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "template-check",
        abstract: "Render the chat template for a canned conversation and print token ids")
    @OptionGroup var model: ModelOptions
    @Flag var think = false

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var out: [Int] = []
        var err: Error?
        Task {
            do {
                out = try await Engine.encodeChatWithoutModel(
                    modelDir: model.modelURL,
                    messages: [
                        ChatMessage(role: "system", content: "You are helpful."),
                        ChatMessage(role: "user", content: "Hi there"),
                    ], thinking: think)
            } catch { err = error }
            sem.signal()
        }
        sem.wait()
        if let e = err { throw e }
        print(out.map(String.init).joined(separator: ","))
    }
}

Slotstream.main()

````

Artifact `/Users/carlos/Projects/slotstream/Tools/context_gates.py` — 8396 bytes, SHA-256 `60767a837601e3b41b17a0f1b0bb04551852ef08735d667513d1cb333e713e41`.

````text
#!/usr/bin/env python3
"""Weight-free configurable-context CLI/metadata contracts; never loads a model."""
import argparse
import json
import os
import re
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent.parent


def run(binary, args):
    env = {k: v for k, v in os.environ.items() if not k.startswith("SLOTSTREAM_")}
    result = subprocess.run([str(binary), *args], env=env, text=True, capture_output=True, timeout=120)
    return {"args": args, "code": result.returncode, "stdout": result.stdout, "stderr": result.stderr}


def successful_tools(frames):
    """Receiving-side fixture: valid arguments alone never authorize execution."""
    calls = {}
    finished = False
    terminal = False
    failed = False
    for frame in frames:
        if frame == "[DONE]":
            if not finished or failed:
                return []
            terminal = True
            continue
        if terminal or not isinstance(frame, dict) or frame.get("error"):
            return []
        for choice in frame.get("choices", []):
            reason = choice.get("finish_reason")
            if reason is not None:
                if finished or reason != "tool_calls":
                    return []
                finished = True
            for delta in choice.get("delta", {}).get("tool_calls", []):
                if finished:
                    return []
                current = calls.setdefault(delta["index"], {"id": "", "name": "", "arguments": ""})
                current["id"] += delta.get("id", "")
                function = delta.get("function", {})
                current["name"] += function.get("name", "")
                current["arguments"] += function.get("arguments", "")
    if not terminal or not finished or failed:
        return []
    result = []
    try:
        for call in calls.values():
            args = json.loads(call["arguments"])
            if not call["id"] or not call["name"] or not isinstance(args, dict):
                return []
            result.append({**call, "arguments": args})
    except (ValueError, TypeError):
        return []
    return result


def check(binary):
    evidence, assertions = [], []

    def expect(name, condition, detail=None):
        assertions.append({"name": name, "passed": bool(condition), "detail": detail if not condition else None})

    fixture = json.loads((ROOT / "Tools/fixtures/context-default-v1.json").read_text())
    help_result = run(binary, ["context-check", "--help"])
    evidence.append(help_result)
    help_text = help_result["stdout"]
    for flag, default in [("--reply-tokens", "16"), ("--wall-seconds", "7200.0")]:
        expect(f"diagnostic {flag} default is explicit", bool(re.search(
            re.escape(flag) + r"(?:(?!\n  --).)*\(default: " + re.escape(default) + r"\)", help_text, re.S)), help_text)
    fields = fixture["projection_fields"]
    additions = set(fixture["allowed_additions"])
    for tier in fixture["tiers"]:
        repeats = [run(binary, tier["args"]) for _ in range(2)]
        evidence.extend(repeats)
        values = [json.loads(r["stdout"]) for r in repeats]
        projected = [{k: d[k] for k in fields if k in d} for d in values]
        expect(f"default {tier['tier']} preserved", projected[0] == projected[1] == tier["expected"], projected)
        for d in values:
            expect(f"default {tier['tier']} additions declared", set(d) <= set(fields) | additions, sorted(d))
            expect(f"default {tier['tier']} ledger agrees", abs(d["expected_peak_gb"] - d["memory_ledger"]["expected_peak_bytes"] / 1e9) <= .051)
            expect(f"default {tier['tier']} wait policy", d["max_prefill_wait_minutes"] == 30 and d["prefill_wait_scope"] == "accepted_request_to_first_model_token")

    for start in [0, 1, 32768, 65535, 128256, 131071, 262079, 262143]:
        result = run(binary, ["prefill-schedule", "--tokens", str(262144 - start), "--from", str(start), "--chunk", "4096", "--json"])
        evidence.append(result)
        d = json.loads(result["stdout"])
        pos = start
        bounded = True
        for count in d["passes"]:
            bounded &= count > 0 and count * (pos + count) <= 4096 * 8016
            pos += count
        expect(f"full schedule from {start}", bounded and pos == 262144, d)
        expect(f"uncalibrated schedule from {start} labeled unknown", d["est_seconds"] is None)

    for surface in ["serve", "run", "doctor"]:
        for args in [["--max-context", "0"], ["--max-context", "262145"],
                     ["--max-prefill-wait", "nan"], ["--max-prefill-wait", "inf"],
                     ["--max-prefill-wait", "-1"], ["--max-prefill-wait", "1e300"]]:
            result = run(binary, [surface, *args, "--model", "/nonexistent/context-gate-no-model"])
            evidence.append(result)
            expect(f"{surface} rejects {args}", result["code"] != 0 and "engine ready" not in result["stderr"], result)
            expect(f"{surface} validates policy before weights {args}", "still to download" not in result["stderr"] and "no model at" not in result["stderr"], result)
    for args in [["--tokens", "262144"], ["--tokens", "-1"],
                 ["--tokens", "9223372036854775807"], ["--reply-tokens", "9223372036854775807"],
                 ["--reply-tokens", "0"], ["--wall-seconds", "nan"],
                 ["--warm-conversations", "5"], ["--warm-conversations", "-1"],
                 ["--warm-conversations", "4", "--warm-tokens", "9223372036854775807"],
                 ["--warm-conversations", "4", "--ladder"],
                 ["--tokens", "16", "--warm-conversations", "4", "--warm-tokens", "32"]]:
        result = run(binary, ["context-check", *args, "--model", "/nonexistent/context-gate-no-model"])
        evidence.append(result)
        expect(f"diagnostic rejects before allocation {args}", result["code"] != 0 and "engine ready" not in result["stderr"], result)

    # This reads pinned headers and prices a plan; it must never construct an
    # Engine or turn a predicted fit into qualification evidence.
    result = run(binary, ["context-check", "--tokens", "4096", "--reply-tokens", "16",
                          "--memory-gb", "8.1", "--mtp", "off", "--vision", "off", "--plan-only"])
    evidence.append(result)
    try:
        planned = json.loads(result["stdout"])
    except ValueError:
        planned = {}
    expect("plan-only does not allocate or qualify an Engine", result["code"] == 0
           and planned.get("kind") == "unqualified-context-plan" and planned.get("qualified") is False
           and "fits" not in planned and "engine ready" not in result["stderr"], result)
    expect("plan-only binds configured context and exact runtime controls",
           planned.get("plan", {}).get("max_context_tokens") == 4112
           and bool(planned.get("optimizations")) and bool(planned.get("model_revision")), planned)

    tool = {"choices": [{"delta": {"tool_calls": [{"index": 0, "id": "call_1", "function": {"name": "lookup", "arguments": '{"key":"a"}'}}]}, "finish_reason": None}]}
    finish = {"choices": [{"delta": {}, "finish_reason": "tool_calls"}]}
    expect("successful tool turn is deliverable", len(successful_tools([tool, finish, "[DONE]"])) == 1)
    for suffix in [[], [{"error": {"code": "insufficient_memory"}}],
                   [{"error": {"code": "prefill_deadline_exceeded"}}],
                   [{"choices": [{"delta": {}, "finish_reason": "length"}]}, "[DONE]"],
                   [finish], [finish, {"error": {"code": "inference_error"}}, "[DONE]"]]:
        expect(f"failed/incomplete tool turn is inert {suffix}", successful_tools([tool, *suffix]) == [])
    return {"passed": all(a["passed"] for a in assertions), "assertions": assertions, "commands": evidence}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--binary", type=Path, default=ROOT / ".build/release/slotstream")
    p.add_argument("--report", type=Path, required=True)
    a = p.parse_args()
    result = check(a.binary.resolve())
    a.report.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"passed": result["passed"], "assertions": len(result["assertions"]),
                      "failures": [v for v in result["assertions"] if not v["passed"]]}))
    return 0 if result["passed"] else 1


if __name__ == "__main__":
    raise SystemExit(main())

````

Artifact `/Users/carlos/Projects/slotstream/Tools/context_qualification.py` — 16753 bytes, SHA-256 `e9f9cf2f82b89fb64418f918966ca5c62ca303212723bf32457b9d65729e4807`.

````text
#!/usr/bin/env python3
"""Execute a frozen, incremental capacity protocol; stop on the first failed rung.

This gate is capacity and completion evidence. Numerical parity, real-client
behavior and answer quality remain separate gates. Never loosens a failed
protocol, retries a rung, or refreshes a baseline.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tarfile
import time

from prefill_bench import digest, model_identity, preflight, run_child, vm_snapshot
from memory_gate import check_memory as memory_check

ROOT = Path(__file__).resolve().parent.parent
DRIVERS = ['Tools/context_qualification.py', 'Tools/prefill_bench.py', 'Tools/memory_gate.py']


def observed_model(directory):
    result = model_identity(directory)
    for file in sorted(directory.iterdir()):
        if file.suffix in ('.txt', '.py', '.md') or file.name == 'LICENSE':
            result[file.name] = {'bytes':file.stat().st_size, 'mtime_ns':file.stat().st_mtime_ns,
                                 'sha256':digest(file)}
    return result


def quiet_preflight(needed_gb):
    active = [name.strip() for name in subprocess.check_output(['ps','-axo','comm='],text=True).splitlines()
              if Path(name.strip()).name in ('swift-frontend','swift-driver','slotstream','slotstream-checks')]
    if active: raise RuntimeError('competing compiler or model process; refusing capacity launch')
    return preflight(needed_gb)


def validate(protocol):
    retained = protocol.get('kind') == 'configurable-context-retained-capacity'
    if protocol.get('schema') != 1 or protocol.get('kind') not in (
            'configurable-context-capacity', 'configurable-context-retained-capacity'):
        raise ValueError('unknown context qualification protocol')
    if protocol.get('mtp') != 'off' or protocol.get('vision') != 'off':
        raise ValueError('this protocol qualifies text only; mode gates are independent')
    if protocol.get('prefix_cache') is not retained or protocol.get('max_prefill_wait_minutes') != 0:
        raise ValueError('capacity protocol requires explicit matching retention and a disabled estimate policy')
    if not isinstance(protocol.get('optimizations'), dict) or not protocol['optimizations']:
        raise ValueError('freeze the exact resolved optimization controls before qualification')
    rungs = protocol['prompt_tokens']
    if not rungs or rungs != sorted(set(rungs)):
        raise ValueError('rungs must be strictly increasing')
    reply = protocol['reply_tokens']
    if type(reply) is not int or not 16 <= reply <= 128:
        raise ValueError('16..128 required reply tokens')
    if any(type(n) is not int or not 16 <= n <= 262144-reply for n in rungs):
        raise ValueError('prompt plus reply must fit the model window')
    if retained:
        if type(protocol.get('warm_conversations')) is not int or protocol['warm_conversations'] != 4 \
                or type(protocol.get('warm_tokens')) is not int \
                or not 16 <= protocol['warm_tokens'] <= min(rungs)+reply-4:
            raise ValueError('retained capacity requires four complete conversations with explicit bounded warm prompts')
    elif protocol.get('warm_conversations', 0) != 0:
        raise ValueError('cold capacity cannot carry warm-up conversations')
    if type(protocol['wall_seconds']) is not int or not 30 <= protocol['wall_seconds'] <= 7200:
        raise ValueError('each rung needs an independent bounded wall ceiling')
    memory = protocol['memory_gb']
    if type(memory) not in (float,int) or not 8.1 <= memory <= 26:
        raise ValueError('explicit 8.1..26 GB capacity target required')
    binary = Path(protocol['binary']).resolve()
    identity = json.loads((binary.parent/'build-identity.json').read_text())
    for file, key in [(binary,'binary_sha256'), (binary.parent/'mlx.metallib','metallib_sha256'),
                      (binary.parent/'build-source.tar.gz','source_archive_sha256')]:
        if digest(file) != protocol[key] or identity[key] != protocol[key]:
            raise ValueError(f'protocol identity mismatch: {key}')
    with tarfile.open(binary.parent/'build-source.tar.gz', 'r:gz') as archive:
        pinned = archive.extractfile('Sources/Slotstream/PinnedModel.swift').read()
    if hashlib.sha256(pinned).hexdigest() != protocol['model_manifest_sha256']:
        raise ValueError('protocol model manifest does not match the frozen binary source')
    revision = re.search(rb'public static let revision = "([a-f0-9]+)"', pinned)
    if not revision or protocol['model_revision'] != revision.group(1).decode():
        raise ValueError('protocol revision is absent from its pinned model source')
    model = Path(protocol['model_dir'])
    known = {name.decode() for name in re.findall(rb'File\(path: "([^"/]+)"', pinned)}
    if {file.name for file in model.glob('*.safetensors')} - known:
        raise ValueError('unpinned weight files are present in the qualification model')
    if observed_model(model) != protocol['model_identity']:
        raise ValueError('model metadata changed since protocol freeze; full verification is still independently required')
    if protocol['driver_sources'] != {name:digest(ROOT/name) for name in DRIVERS}:
        raise ValueError('qualification driver changed since protocol freeze')
    return binary


def validate_delivery(result, protocol, n):
    """Independent completed-work and allocation checks, never a text verdict."""
    stats = result['stats']
    if result['fits'] is not True or result['aborted'] is not None or stats.get('runtimeError') or stats.get('requestFailure'):
        raise ValueError('capacity rung was incomplete, aborted or over its plan')
    if stats.get('memoryPressureCancelled') or stats.get('reusedPrefixTokens',0) != 0:
        raise ValueError('cold qualification was cancelled or reused state')
    if len(result['prompt_ids']) != n or stats['promptTokens'] != n or stats['prefillTokens'] != n:
        raise ValueError('observed input differs from the frozen prompt count')
    if len(result['output_ids']) != protocol['reply_tokens'] or stats['decodeTokens'] != protocol['reply_tokens']:
        raise ValueError('required reply was not fully delivered')
    if result['configured_context'] != n+protocol['reply_tokens']:
        raise ValueError('candidate window was not priced before load')
    if result['model_revision'] != protocol['model_revision']:
        raise ValueError('delivered model revision differs from protocol')
    if json.dumps(result.get('optimizations'), sort_keys=True) != json.dumps(protocol['optimizations'], sort_keys=True):
        raise ValueError('delivered arithmetic/runtime controls differ from the frozen protocol')
    validate_compute(result['compute_passes'], result['compute_key_extents'], result['compute_query_rows'], n, 0, stats)
    peak = result['memory_ledger']['expected_peak_bytes']
    if type(peak) is not int or peak <= 0 or peak > protocol['memory_gb']*1e9:
        raise ValueError('ledger exceeds the frozen total-memory target')
    retained = protocol.get('kind') == 'configurable-context-retained-capacity'
    warm_memory = validate_retention(result, protocol, peak) if retained else []
    if not retained and result.get('warmup'):
        raise ValueError('cold qualification unexpectedly performed warm-up work')
    return {**memory_check({'stats':stats}, peak/1e9), 'warmup_memory': warm_memory}


def validate_compute(passes, extents, queries, total, reused, stats):
    if len(passes) != len(extents) or len(passes) != len(queries) or not passes:
        raise ValueError('missing actual attention query rows or key extents')
    position = reused
    uses_small_arithmetic = False
    for count, extent, query in zip(passes, extents, queries):
        if type(count) is not int or type(extent) is not int or type(query) is not int or not 0 < count <= query <= 4096:
            raise ValueError('invalid actual compute pass')
        uses_small_arithmetic |= 256 * (position + 256) > 4096 * 8016
        position += count
        if not position <= extent <= 262144 or query*extent > 4096*8016:
            raise ValueError('unbounded actual query-by-key product, including padding')
    if position != total: raise ValueError('compute pass counts do not close prompt')
    expected_arithmetic = 'reference-256-v1' if uses_small_arithmetic else 'standard'
    if stats.get('contextArithmetic') != expected_arithmetic:
        raise ValueError('generation did not report the required qualified context arithmetic')


def validate_retention(result, protocol, peak):
    """Prove four actual completed, interleaved conversations, not synthetic cache entries."""
    def cache(snapshot, require_full=False):
        if snapshot['enabled'] is not True or snapshot['max_conversations'] != 4:
            raise ValueError('retention was disabled or its four-state ceiling changed')
        counts = ['conversations', 'held_tokens', 'charged_token_capacity', 'allocated_sequence_bytes', 'max_tokens']
        if any(type(snapshot[key]) is not int or snapshot[key] < 0 for key in counts):
            raise ValueError('invalid retained ownership observation')
        if not snapshot['held_tokens'] <= snapshot['charged_token_capacity'] <= snapshot['max_tokens'] \
                or snapshot['allocated_sequence_bytes'] > snapshot['charged_token_capacity']*27648 \
                or not 0 <= snapshot['conversations'] <= 4:
            raise ValueError('retained allocation exceeds its bounded budget')
        if require_full and (snapshot['conversations'] != 4 or snapshot['held_tokens'] < 4*protocol['warm_tokens']):
            raise ValueError('capacity request did not start with four filled conversations')

    warmup = result['warmup']
    if len(warmup) != 8: raise ValueError('missing complete interleaved warm-up matrix')
    first_turns, memories = {}, []
    for ordinal, row in enumerate(warmup):
        phase, conversation = divmod(ordinal, 4)
        if row['phase'] != phase or row['conversation'] != conversation or row['fits'] is not True:
            raise ValueError('warm-up order or completed-work verdict changed')
        stats, ids, output, reuse = row['stats'], row['prompt_ids'], row['output_ids'], row['expected_reuse']
        if type(reuse) is not int or reuse < 0 or stats.get('runtimeError') or stats.get('requestFailure') \
                or stats.get('memoryPressureCancelled') or len(output) != 1 or stats['decodeTokens'] != 1 \
                or stats['promptTokens'] != len(ids) or stats['prefillTokens'] != len(ids)-reuse \
                or stats.get('reusedPrefixTokens', 0) != reuse:
            raise ValueError('warm-up delivery or exact prefix reuse failed')
        if phase == 0:
            if len(ids) != protocol['warm_tokens'] or reuse != 0 or any(ids == previous[0] for previous in first_turns.values()):
                raise ValueError('first warm-up turns must be distinct cold prompts of the frozen length')
            first_turns[conversation] = (ids, output)
        else:
            initial, answer = first_turns[conversation]
            if ids != initial+answer+[1000+conversation] or not len(initial) <= reuse <= len(initial)+len(answer):
                raise ValueError('follow-up does not extend the exact prior delivery and retained state')
        cache(row['retained'])
        validate_compute(stats['prefillComputePasses'], stats['prefillComputeKeyExtents'],
                         stats['prefillComputeQueryRows'], len(ids), reuse, stats)
        memories.append(memory_check({'stats': stats}, peak/1e9))
    cache(result['retained_before'], require_full=True)
    cache(result['retained_after'])
    return memories


def run(protocol, out):
    binary = validate(protocol)
    out.mkdir(parents=True, exist_ok=False)
    (out/'protocol.json').write_text(json.dumps(protocol,indent=2)+'\n')
    (out/'protocol.sha256').write_text(digest(out/'protocol.json')+'\n')
    for name in DRIVERS:
        target = out/name; target.parent.mkdir(exist_ok=True)
        target.write_bytes((ROOT/name).read_bytes())
    results = []
    env = {k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
    # These controls change reservations, not any experimental arithmetic.
    retained = protocol.get('kind') == 'configurable-context-retained-capacity'
    env['SLOTSTREAM_PREFIX_CACHE'] = '1' if retained else '0'
    verification = out/'model-verification'; verification.mkdir()
    # Verify every pinned payload, not only header/stat identities. This is
    # read-only but belongs to the exclusive local-storage interval.
    command = [str(binary),'pull','--verify','--dir',str(Path(protocol['model_dir']).resolve())]
    receipt = {'command':command, 'passed':False}
    try:
        receipt['before'] = quiet_preflight(protocol['memory_gb']+3)
        receipt['exit_code'] = run_child(command,env,verification,600)
        if receipt['exit_code']: raise ValueError('full model verification failed')
        receipt['passed'] = True
    except Exception as error:
        receipt['error'] = f'{type(error).__name__}: {error}'
    finally:
        receipt['after'] = vm_snapshot()
        for name in ['stdout.txt','stderr.txt']:
            if (verification/name).exists(): receipt[name+'_sha256'] = digest(verification/name)
        (verification/'manifest.json').write_text(json.dumps(receipt,indent=2)+'\n')
    if not receipt['passed']:
        (out/'manifest.json').write_text(json.dumps({'passed':False,
            'error':receipt.get('error','model verification incomplete'), 'results':[],
            'completed_full_model_window':False})+'\n')
        return 1
    for n in protocol['prompt_tokens']:
        cell = out/str(n); cell.mkdir()
        row = {'prompt_tokens':n, 'passed':False, 'started_unix':time.time()}
        results.append(row)
        try:
            # Recheck frozen driver/model identities before each next rung;
            # no later edit can silently join an already running protocol.
            validate(protocol)
            row['before'] = quiet_preflight(protocol['memory_gb']+3)
            command = [str(binary),'context-check','--tokens',str(n),'--reply-tokens',str(protocol['reply_tokens']),
                       '--memory-gb',str(protocol['memory_gb']),'--mtp','off','--vision','off',
                       '--model',str(Path(protocol['model_dir']).resolve()),
                       '--max-prefill-wait','0','--wall-seconds',str(protocol['wall_seconds']),
                       '--sample-footprint','--json']
            if retained:
                command += ['--warm-conversations','4','--warm-tokens',str(protocol['warm_tokens'])]
            row['command'] = command
            print(json.dumps({'phase':'starting','prompt_tokens':n,'reclaimable_gb':row['before']['reclaimable_bytes']/1e9}),flush=True)
            row['exit_code'] = run_child(command,env,cell,protocol['wall_seconds']+120)
            result = json.loads((cell/'stdout.txt').read_text())
            # Validate the exact completed work independently of the binary's
            # verdict. A normal EOS before required output is a failed capacity
            # delivery, never an excuse to adjust the reply requirement.
            if row['exit_code']: raise ValueError('context-check exited unsuccessfully')
            row['memory'] = validate_delivery(result, protocol, n)
            row['passed'] = True
        except Exception as error:
            row['error'] = f'{type(error).__name__}: {error}'
        finally:
            row['after'] = vm_snapshot(); row['ended_unix'] = time.time()
            if row['after']['swapins'] != row.get('before',row['after'])['swapins'] or row['after']['swapouts'] != row.get('before',row['after'])['swapouts']:
                row['passed'] = False; row['swap_activity'] = True
            (cell/'manifest.json').write_text(json.dumps(row,indent=2)+'\n')
            summary={'passed':all(r['passed'] for r in results),'results':results,
                     'completed_full_model_window':bool(row['passed'] and n+protocol['reply_tokens']==262144)}
            (out/'manifest.json').write_text(json.dumps(summary,indent=2)+'\n')
            print(json.dumps({k:v for k,v in row.items() if k in ('prompt_tokens','passed','error','swap_activity')}),flush=True)
        if not row['passed']: return 1
    return 0


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('protocol',type=Path);parser.add_argument('--out',type=Path,required=True)
    args=parser.parse_args()
    return run(json.loads(args.protocol.read_text()),args.out)

if __name__=='__main__': raise SystemExit(main())

````

Artifact `/Users/carlos/Projects/slotstream/Tools/context_qualification_checks.py` — 9953 bytes, SHA-256 `398c4d8bf9d98d77c0cb76873cd1a6c62e26f53839a1edde83080f1bc789d3b4`.

````text
#!/usr/bin/env python3
"""Weight-free rejection tests for the capacity evidence boundary."""
import copy
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import context_qualification as gate


def delivery():
    vm = {'swapins': 3, 'swapouts': 4}
    return {
        'fits': True, 'aborted': None, 'prompt_ids': list(range(16)),
        'output_ids': list(range(16)), 'configured_context': 32,
        'model_revision': 'frozen', 'compute_passes': [16], 'compute_key_extents': [16], 'compute_query_rows': [16],
        'memory_ledger': {'expected_peak_bytes': 8_000_000_000},
        'optimizations': {'workspaceTokenTile': 256, 'compactStateWindows': False},
        'stats': {'promptTokens': 16, 'prefillTokens': 16, 'decodeTokens': 16,
                  'contextArithmetic': 'standard',
                  'sampledFootprint': {'peakBytes': 7_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                  'lifetimeRSSPeakBytes': 7_000_000_000, 'physicalFootprintEndBytes': 6_000_000_000,
                  'generatorVMBefore': vm.copy(), 'generatorVMAfter': vm.copy()}}


def retained_delivery():
    result = delivery()
    snapshot = {'enabled': True, 'max_conversations': 4, 'conversations': 4,
                'held_tokens': 80, 'charged_token_capacity': 4096,
                'allocated_sequence_bytes': 4096*27648, 'max_tokens': 8192}
    warmup = []
    for phase in (0, 1):
        for conversation in range(4):
            ids = list(range(conversation*16, (conversation+1)*16))
            reuse = 0
            if phase == 1:
                ids += [123, 1000+conversation]; reuse = 17
            stats = delivery()['stats']
            stats.update(promptTokens=len(ids), prefillTokens=len(ids)-reuse, decodeTokens=1,
                         reusedPrefixTokens=reuse, prefillComputePasses=[len(ids)-reuse],
                         prefillComputeKeyExtents=[len(ids)], prefillComputeQueryRows=[len(ids)-reuse])
            warmup.append({'phase': phase, 'conversation': conversation, 'fits': True,
                           'prompt_ids': ids, 'output_ids': [123], 'expected_reuse': reuse,
                           'stats': stats, 'retained': copy.deepcopy(snapshot)})
    result.update(warmup=warmup, retained_before=copy.deepcopy(snapshot), retained_after=copy.deepcopy(snapshot))
    return result


class CapacityEvidence(unittest.TestCase):
    protocol = {'reply_tokens': 16, 'memory_gb': 8.1, 'model_revision': 'frozen',
                'optimizations': {'workspaceTokenTile': 256, 'compactStateWindows': False}}

    def test_complete_delivery(self):
        self.assertTrue(gate.validate_delivery(delivery(), self.protocol, 16)['passed'])

    def test_incomplete_or_forged_observations_are_rejected(self):
        cases = [
            ('fits', False), ('aborted', 'deadline'), ('prompt_ids', [1]),
            ('output_ids', [1]), ('configured_context', 16), ('model_revision', 'changed'),
            ('compute_passes', [16, 1]), ('compute_key_extents', []),
            ('compute_passes', [True]), ('compute_key_extents', [262145]),
            ('compute_query_rows', [True]), ('compute_query_rows', [15]), ('compute_query_rows', []),
            ('optimizations', {'workspaceTokenTile': 128, 'compactStateWindows': False}),
            ('memory_ledger', {'expected_peak_bytes': 8_100_000_001})]
        for key, value in cases:
            with self.subTest(key=key, value=value):
                result = delivery(); result[key] = value
                with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)
        for key, value in [('runtimeError', 'fault'), ('requestFailure', {'code': 'fault'}),
                           ('memoryPressureCancelled', True), ('reusedPrefixTokens', 1),
                           ('promptTokens', 15), ('prefillTokens', 15), ('decodeTokens', 15),
                           ('contextArithmetic', 'reference-256-v1'),
                           ('lifetimeRSSPeakBytes', 8_000_000_001)]:
            with self.subTest(stat=key):
                result = delivery(); result['stats'][key] = value
                with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)

    def test_padding_is_inside_product_bound(self):
        result = delivery()
        n = 128256
        result.update(prompt_ids=[0]*n, configured_context=n+16,
                      compute_passes=[256]*(n//256),
                      compute_query_rows=[256]*(n//256),
                      compute_key_extents=list(range(256,n+1,256)))
        result['stats'].update(promptTokens=n, prefillTokens=n)
        self.assertTrue(gate.validate_delivery(result, self.protocol, n)['passed'])
        # Only 256 extra masked columns break the product at this boundary.
        result['compute_key_extents'][-1] += 256
        with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, n)
        result['compute_key_extents'][-1] -= 256
        result['compute_query_rows'][-1] += 1
        with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, n)

    def test_swap_and_missing_memory_observations_fail(self):
        result = delivery(); result['stats']['generatorVMAfter']['swapins'] += 1
        with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)
        result = delivery(); del result['stats']['sampledFootprint']
        with self.assertRaises(KeyError): gate.validate_delivery(result, self.protocol, 16)

    def test_retained_capacity_requires_complete_interleaved_ownership(self):
        protocol = {**self.protocol, 'kind': 'configurable-context-retained-capacity',
                    'warm_conversations': 4, 'warm_tokens': 16}
        self.assertEqual(len(gate.validate_delivery(retained_delivery(), protocol, 16)['warmup_memory']), 8)
        mutations = [
            lambda r: r['warmup'].pop(),
            lambda r: r['warmup'][0].update(fits=False),
            lambda r: r['warmup'][1].update(conversation=0),
            lambda r: r['warmup'][1].update(prompt_ids=r['warmup'][0]['prompt_ids']),
            lambda r: r['warmup'][4]['prompt_ids'].__setitem__(0, 999),
            lambda r: r['warmup'][4].update(expected_reuse=0),
            lambda r: r['warmup'][4]['stats'].update(reusedPrefixTokens=0),
            lambda r: r['warmup'][0]['stats']['generatorVMAfter'].update(swapins=999),
            lambda r: r['warmup'][0]['stats'].update(prefillComputeKeyExtents=[262144], prefillComputeQueryRows=[4096]),
            lambda r: r['retained_before'].update(conversations=3),
            lambda r: r['retained_before'].update(enabled=False),
            lambda r: r['retained_before'].update(charged_token_capacity=8193),
            lambda r: r['retained_after'].update(allocated_sequence_bytes=4096*27648+1),
        ]
        for mutate in mutations:
            result = retained_delivery(); mutate(result)
            with self.assertRaises(ValueError): gate.validate_delivery(result, protocol, 16)
        with self.assertRaises(ValueError): gate.validate_delivery(retained_delivery(), self.protocol, 16)

    def test_failed_first_rung_never_launches_the_next(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)/'run'; calls = []
            protocol = {**self.protocol, 'prompt_tokens': [16, 32], 'wall_seconds': 30, 'model_dir': directory}
            def child(command, env, cell, timeout):
                calls.append(command)
                result = delivery(); result['fits'] = False
                (cell/'stdout.txt').write_text(json.dumps(result))
                (cell/'stderr.txt').write_text('')
                return 0
            snapshot = {'reclaimable_bytes': 20_000_000_000, 'swapins': 3, 'swapouts': 4}
            with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
                 patch.object(gate, 'quiet_preflight', return_value=copy.deepcopy(snapshot)), \
                 patch.object(gate, 'vm_snapshot', return_value=copy.deepcopy(snapshot)), \
                 patch.object(gate, 'run_child', side_effect=child):
                self.assertEqual(gate.run(protocol, out), 1)
            self.assertEqual(len(calls), 2)  # full verification, then first rung
            self.assertFalse((out/'32').exists())
            result = json.loads((out/'manifest.json').read_text())
            self.assertFalse(result['passed'])
            self.assertFalse(result['completed_full_model_window'])
            self.assertEqual(result['results'][0]['prompt_tokens'], 16)
            self.assertTrue((out/'16/stdout.txt').is_file())
            self.assertEqual((out/'protocol.sha256').read_text().strip(), gate.digest(out/'protocol.json'))

    def test_failed_verification_preflight_retains_failure_without_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)/'run'
            protocol = {**self.protocol, 'prompt_tokens': [16], 'wall_seconds': 30, 'model_dir': directory}
            with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
                 patch.object(gate, 'quiet_preflight', side_effect=RuntimeError('competing build')), \
                 patch.object(gate, 'vm_snapshot', return_value={}), \
                 patch.object(gate, 'run_child') as child:
                self.assertEqual(gate.run(protocol, out), 1)
                child.assert_not_called()
            result = json.loads((out/'manifest.json').read_text())
            self.assertFalse(result['passed'])
            self.assertFalse(result['completed_full_model_window'])
            self.assertEqual(result['results'], [])
            self.assertIn('competing build', result['error'])
            self.assertTrue((out/'model-verification/manifest.json').exists())


if __name__ == '__main__': unittest.main()

````
