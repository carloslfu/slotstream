import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationPrefixVision(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let model = try Qwen4ExpModel(index: index, poolSlots: 640)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let tower = try VisionTower(index: index)
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.skipUnusedFinalForward = true
        model.optimizations = options
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var params = SampleParams.greedy; params.maxTokens = 1; params.seed = 7
        var c = CheckBuilder("optimization-prefix-vision\(mtp ? "-mtp" : "")")
        let data = ["iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
                    "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="].map { Data(base64Encoded: $0)! }
        let images = try data.map { try VisionPreprocess.decodeCGImage($0) }
        let plans = try images.map { try tower.plan(for: $0) }
        c.equal("equal token geometry for different pixels", plans[0].mergedTokens, plans[1].mergedTokens)
        c.expect("bounded real image fixture", plans[0].mergedTokens > 1 && plans[0].mergedTokens < 256)
        func vision(_ image: Int, start: Int) -> VisionPrompt {
            VisionPrompt(tower: tower, items: [.init(image: images[image], plan: plans[image])],
                segments: [.init(start: start, count: plans[image].mergedTokens, hash: ImageHash(hashing: data[image]))],
                hiddenSize: model.cfg.hiddenSize)
        }
        func snapshot(_ state: Qwen4ExpModel.State) -> [String: String] {
            state.prefixForkDiagnosticTensors().mapValues { a in
                "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
            }
        }
        for start in [1, 256 - plans[0].mergedTokens / 2] {
            let end = start + plans[0].mergedTokens
            var ids = (0 ..< max(273, end + 17)).map { 1000 + ($0 * 79) % 190_000 }
            ids.replaceSubrange(start ..< end, with: repeatElement(model.cfg.imageTokenId, count: end - start))
            let cache = PrefixCache(maxTokens: 8192)
            func run(_ checkpoint: Int, _ image: Int, retained: PrefixCache?) throws -> (GenStats, [String: String]) {
                options.prefixCheckpointTokens = checkpoint; model.optimizations = options
                let vp = vision(image, start: start)
                let target = retained ?? PrefixCache(maxTokens: 8192)
                var keepGoing = true
                generator.onPrefillProgress = { done, total, _ in if done == total && done > 0 { keepGoing = false } }
                let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: target,
                    vision: vp, shouldContinue: { keepGoing })
                generator.onPrefillProgress = nil
                c.expect("image \(start)/\(image): prefill succeeds without output", result.1.runtimeError == nil && result.0.isEmpty)
                guard let completed = target.take(matching: ids + [17], images: vp.segments) else {
                    throw ModelError("vision prefix diagnostic lost committed prefill")
                }
                if mtp { c.expect("image \(start)/\(image): draft remains aligned", completed.state.hasValidMTP) }
                let state = snapshot(completed.state)
                let logits = try model.lastLogitsChecked([17], state: completed.state)
                let bytes = logits.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
                var fields = state; fields["continuedLogits"] = "\(SHA256.hash(data: Data(bytes)))"
                return (result.1, fields)
            }
            let reference = try run(0, 0, retained: nil)
            let first = try run(256, 0, retained: cache)
            let reused = try run(256, 0, retained: cache)
            c.equal("image at \(start): first exact complete state/logits", first.1, reference.1)
            c.equal("image at \(start): fork exact complete state/logits", reused.1, reference.1)
            c.equal("image at \(start): checkpoint reuse", reused.0.reusedPrefixTokens, 256)
            c.equal("image at \(start): retained private snapshot", cache.heldCheckpoints, 1)
            c.equal("image at \(start): prefix skips only whole image", reused.0.prefixSkippedImages, end <= 256 ? 1 : 0)
            c.equal("image at \(start): partial image re-encodes", reused.0.encodedImages, end <= 256 ? 0 : 1)
            let changedReference = try run(0, 1, retained: nil)
            let changed = try run(256, 1, retained: cache)
            c.equal("image at \(start): changed pixels refuse reuse", changed.0.reusedPrefixTokens, 0)
            c.equal("image at \(start): changed image matches independent reference", changed.1, changedReference.1)
            c.expect("image at \(start): fixture really changes model state", changed.1 != reference.1)
            c.expect("bounded endpoint after real image requests", ProcessMemory.residentBytes() < 10_000_000_000)
            cache.drop()
        }
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}
