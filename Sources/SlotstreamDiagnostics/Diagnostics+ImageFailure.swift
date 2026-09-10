import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationImageFailure(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let model = try Qwen4ExpModel(index: index, poolSlots: 640)
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.skipUnusedFinalForward = true
        model.optimizations = options
        let tower = try VisionTower(index: index)
        let bytes = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==")!
        let image = try VisionPreprocess.decodeCGImage(bytes)
        let invalidPlan = VisionTower.ImagePlan(height: .max, width: 32,
            gridH: 1, gridW: 1, patches: 1, mergedTokens: 1)
        let vision = VisionPrompt(tower: tower, items: [.init(image: image, plan: invalidPlan)],
            segments: [.init(start: 2, count: 1, hash: ImageHash(hashing: bytes))], hiddenSize: model.cfg.hiddenSize)
        let cache = PrefixCache(maxTokens: 4096)
        let seed = model.makeState()
        eval(model.lastLogits([1000, 1001], state: seed))
        cache.store(state: seed, tokens: [1000, 1001])
        let generator = Generator(model: model)
        generator.footprintSampling = true
        generator.prefillCacheLimit = 64 << 20
        generator.prefillChunk = 256
        var params = SampleParams.greedy; params.maxTokens = 1
        var emitted = 0
        let oldLimit = MLX.Memory.cacheLimit
        // 256 new rows also exercises restoration of the temporary allocator
        // cap on an error after a prefix was taken out of the cache.
        let prompt = [1000, 1001] + Array(repeating: 1002, count: 256)
        let result = generator.generate(promptIds: prompt, params: params, eosIds: [],
            cache: cache, vision: vision, onToken: { _ in emitted += 1; return true })
        var c = CheckBuilder("optimization-image-failure")
        c.expect("invalid processor plan becomes a request error", result.1.runtimeError?.contains("pixel budget") == true)
        c.equal("failed generation reports error finish", result.1.finishReason, "error")
        c.equal("no generated tokens on image failure", result.0, [])
        c.equal("no delivered tokens on image failure", emitted, 0)
        c.equal("existing prefix was taken", cache.hits, 1)
        c.equal("failed state is not returned to prefix cache", cache.heldTokens, 0)
        c.equal("allocator cache cap restored on failure", MLX.Memory.cacheLimit, oldLimit)
        c.expect("failed interval retains physical footprint observations", (result.1.sampledFootprint?.samples ?? 0) >= 1)
        c.expect("failed interval retains VM observations", result.1.generatorVMBefore != nil && result.1.generatorVMAfter != nil)
        let reference = generator.generate(promptIds: [1000, 1001, 907], params: params, eosIds: [])
        let continued = generator.generate(promptIds: [1000, 1001, 907], params: params, eosIds: [], cache: cache)
        c.expect("subsequent text request succeeds", continued.1.runtimeError == nil)
        c.equal("subsequent text request has exact cold output", continued.0, reference.0)
        c.expect("subsequent successful state is cacheable", cache.heldTokens > 0)
        return c.report()
    }
}
