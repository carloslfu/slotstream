import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Runs the real tower on bounded PNG fixtures. No language model or expert
    /// pool is loaded. Compares every returned row, including clipped image runs.
    public static func optimizationImageReuse(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        guard VisionTower.present(index: index) else { throw ModelError("image-reuse requires the vision tower") }
        let tower = try VisionTower(index: index)
        let a = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==")!
        let b = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg==")!
        let ia = try VisionPreprocess.decodeCGImage(a), ib = try VisionPreprocess.decodeCGImage(b)
        let pa = try tower.plan(for: ia), pb = try tower.plan(for: ib)
        let ha = ImageHash(hashing: a), hb = ImageHash(hashing: b)
        let segments = [ImageSegment(start: 1, count: pa.mergedTokens, hash: ha),
            ImageSegment(start: pa.mergedTokens + 2, count: pa.mergedTokens, hash: ha),
            ImageSegment(start: 2 * pa.mergedTokens + 3, count: pb.mergedTokens, hash: hb)]
        let prompt = VisionPrompt(tower: tower,
            items: [.init(image: ia, plan: pa), .init(image: ia, plan: pa), .init(image: ib, plan: pb)],
            segments: segments, hiddenSize: tower.vcfg.outHiddenSize)
        var c = CheckBuilder("optimization-image-reuse")
        c.expect("fixture encoded-byte identities differ", ha != hb)
        c.expect("unchanged preparation permits prefix reuse", PrefixCache.imagesAgree(
            entry: prompt.segments, prompt: prompt.cacheSegments(attentionPadding: 0), upTo: segments[2].end))
        c.expect("changed attention arithmetic invalidates prefix", !PrefixCache.imagesAgree(
            entry: prompt.segments, prompt: prompt.cacheSegments(attentionPadding: 128), upTo: segments[2].end))
        c.expect("query tiling has an independent prefix identity", !PrefixCache.imagesAgree(
            entry: prompt.segments, prompt: prompt.cacheSegments(attentionPadding: 0, queryTile: 256), upTo: segments[2].end))
        c.expect("identical query tiling retains prefix identity", PrefixCache.imagesAgree(
            entry: prompt.cacheSegments(attentionPadding: 0, queryTile: 256),
            prompt: prompt.cacheSegments(attentionPadding: 0, queryTile: 256), upTo: segments[2].end))
        c.equal("query tiling remains off by default", try InferenceOptimizations.environment([:]).visionQueryTile, 0)
        c.equal("query tile parser selects only the bounded candidate",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_VISION_QUERY_TILE": "256"]).visionQueryTile, 256)
        for env in [["SLOTSTREAM_OPT_VISION_QUERY_TILE": "-1"],
                    ["SLOTSTREAM_OPT_VISION_QUERY_TILE": "512"],
                    ["SLOTSTREAM_OPT_VISION_QUERY_TILE": "true"],
                    ["SLOTSTREAM_OPT_VISION_QUERY_TILE": "256", "SLOTSTREAM_OPT_VISION_PADDING": "128"]] {
            do {
                _ = try InferenceOptimizations.environment(env)
                c.expect("unsupported vision combination rejected: \(env)", false)
            } catch { c.expect("unsupported vision combination rejected: \(env)", true) }
        }
        let first = prompt.segments[0]
        let clipped = ImageSegment(start: first.start, count: 3, hash: first.hash,
            preparationIdentity: first.preparationIdentity)
        c.expect("partial image retains processor identity", PrefixCache.imagesAgree(
            entry: [clipped], prompt: prompt.segments, upTo: first.start + 3))
        c.expect("partial image rejects changed attention arithmetic", !PrefixCache.imagesAgree(
            entry: [clipped], prompt: prompt.cacheSegments(attentionPadding: 128), upTo: first.start + 3))
        func compare(_ reference: [VisionRun], _ candidate: [VisionRun], _ label: String) {
            c.equal("\(label): run count", candidate.count, reference.count)
            for (i, pair) in zip(reference, candidate).enumerated() {
                c.equal("\(label) run \(i): start", pair.1.start, pair.0.start)
                c.equal("\(label) run \(i): shape", pair.1.rows.shape, pair.0.rows.shape)
                c.equal("\(label) run \(i): dtype", pair.1.rows.dtype, pair.0.rows.dtype)
                c.expect("\(label) run \(i): exact features", (pair.1.rows .== pair.0.rows).all().item(Bool.self))
            }
        }
        for (consumed, encodes, reuses, skipped) in [
            (0, 2, 1, 0), (1 + pa.mergedTokens / 2, 2, 1, 0),
            (segments[0].end, 2, 0, 1), (segments[2].end, 0, 0, 3),
        ] {
            let reference = prompt.runs(consumedTokens: consumed)
            eval(reference.map(\.rows))
            let candidate = prompt.runs(consumedTokens: consumed, deduplicate: true)
            eval(candidate.map(\.rows))
            c.equal("consumed \(consumed): real tower encodes", prompt.encodedImages, encodes)
            c.equal("consumed \(consumed): duplicate reuse", prompt.reusedImageFeatures, reuses)
            c.equal("consumed \(consumed): prefix skip", prompt.prefixSkippedImages, skipped)
            compare(reference, candidate, "consumed \(consumed)")
        }
        // Same content, a different processor plan: must recompute, even when
        // one model instance is deliberately handed two image geometries.
        let alternate = try VisionTower.plan(height: 512, width: 512, cfg: tower.vcfg,
            bounds: (65_536, 262_144))
        c.expect("processor fixture changes geometry", alternate != pa)
        let changed = VisionPrompt(tower: tower,
            items: [.init(image: ia, plan: pa), .init(image: ia, plan: alternate)],
            segments: [.init(start: 1, count: pa.mergedTokens, hash: ha),
                .init(start: pa.mergedTokens + 2, count: alternate.mergedTokens, hash: ha)],
            hiddenSize: tower.vcfg.outHiddenSize)
        let reference = changed.runs(consumedTokens: 0)
        eval(reference.map(\.rows))
        let candidate = changed.runs(consumedTokens: 0, deduplicate: true)
        eval(candidate.map(\.rows))
        c.equal("changed processor: both encoded", changed.encodedImages, 2)
        c.equal("changed processor: no stale reuse", changed.reusedImageFeatures, 0)
        compare(reference, candidate, "changed processor")
        // A second invocation owns no prior feature cache and must encode anew.
        let again = prompt.runs(consumedTokens: 0, deduplicate: true)
        eval(again.map(\.rows))
        c.equal("request-local cache is released", prompt.encodedImages, 2)
        c.equal("same request still deduplicates", prompt.reusedImageFeatures, 1)
        c.expect("changed image changes features", !(again[0].rows .== again[2].rows).all().item(Bool.self))
        return c.report()
    }
}
