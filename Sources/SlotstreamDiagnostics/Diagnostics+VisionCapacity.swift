import Foundation
import CoreGraphics
import MLX
import Slotstream

extension Diagnostics {
    /// The complete trained tower at bounded and maximum admitted geometry.
    /// Maximum-grid checks establish finite/deterministic output and memory;
    /// numerical agreement with the original full tower is tested up to 4096
    /// patches. They do not imply a Float32 whole-tower oracle at 9216 patches.
    public static func optimizationVisionTowerCapacity(modelDir: URL, preserveQueryRounding: Bool = false,
                                                       queryTile: Int = 0,
                                                       maximumReferenceOnly: Bool = false) throws -> CheckReport {
        guard !maximumReferenceOnly || (queryTile == 256 && !preserveQueryRounding) else {
            throw ModelError("maximum full-reference comparison is reserved for the original query-tile candidate")
        }
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let tower = try VisionTower(index: index)
        var c = CheckBuilder("optimization-vision-tower-capacity\(preserveQueryRounding ? "-prescaled" : "")\(queryTile > 0 ? "-query256" : "")\(maximumReferenceOnly ? "-maximum-reference" : "")")
        let geometries = maximumReferenceOnly ? [(1536, 1536)] :
            [(256, 256), (2080, 32), (4128, 32), (4128, 64),
             (512, 512), (832, 864), (1024, 1024), (1536, 1536)]
        for (width, height) in geometries {
            let side = "\(width)x\(height)"
            let sampler = FootprintSampler(intervalMilliseconds: 5)
            let candidateSampler = FootprintSampler(intervalMilliseconds: 5)
            MLX.Memory.peakMemory = 0
            guard let context = CGContext(data: nil, width: width, height: height,
                bitsPerComponent: 8, bytesPerRow: width * 4, space: CGColorSpaceCreateDeviceRGB(),
                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
                throw ModelError("cannot allocate bounded vision capacity fixture")
            }
            context.setFillColor(CGColor(red: 1, green: 0, blue: 0, alpha: 1))
            context.fill(CGRect(x: 0, y: 0, width: width, height: height))
            context.setFillColor(CGColor(red: 0, green: 0, blue: 1, alpha: 1))
            context.fill(CGRect(x: 0, y: 0, width: width / 2, height: height / 2))
            guard let image = context.makeImage() else { throw ModelError("cannot materialize capacity fixture") }
            let plan = try tower.plan(for: image)
            c.equal("\(side): exact patch geometry", plan.patches, (width / 16) * (height / 16))
            var queryCalls = 0
            let candidate = try tower.encodeChecked(image, plan: plan, attentionPadding: queryTile == 0 ? 128 : 0,
                preserveQueryRounding: preserveQueryRounding, queryTile: queryTile,
                onQueryTile: { queryCalls += 1 })
            eval(candidate)
            c.equal("\(side): executed query tile count", queryCalls,
                queryTile > 0 && plan.patches > 256 ? tower.vcfg.depth * ((plan.patches + 255) / 256) : 0)
            c.expect("\(side): complete finite trained-tower output",
                candidate.shape == [1, plan.mergedTokens, tower.vcfg.outHiddenSize]
                && candidate.dtype == .bfloat16 && isFinite(candidate).all().item(Bool.self))
            let again = try tower.encodeChecked(image, plan: plan, attentionPadding: queryTile == 0 ? 128 : 0,
                preserveQueryRounding: preserveQueryRounding, queryTile: queryTile)
            c.expect("\(side): exact repeated tower output",
                (candidate.reshaped([-1]).view(dtype: .uint8)
                 .== again.reshaped([-1]).view(dtype: .uint8)).all().item(Bool.self))
            c.measure("\(side).candidate_sampled_footprint_bytes", Double(candidateSampler.finish().peakBytes))
            c.measure("\(side).candidate_mlx_peak_bytes", Double(MLX.Memory.peakMemory))
            if plan.patches <= 4096 || maximumReferenceOnly {
                let reference = try tower.encodeChecked(image, plan: plan, attentionPadding: 0)
                c.measure("\(side).reference_exact_bytes",
                    (candidate.reshaped([-1]).view(dtype: .uint8)
                     .== reference.reshaped([-1]).view(dtype: .uint8)).all().item(Bool.self) ? 1 : 0)
                let a = candidate.asType(.float32).asArray(Float.self)
                let b = reference.asType(.float32).asArray(Float.self)
                var dot = 0.0, aa = 0.0, bb = 0.0, worst = 1.0
                let width = tower.vcfg.outHiddenSize
                for token in 0..<plan.mergedTokens {
                    var td = 0.0, ta = 0.0, tb = 0.0
                    for d in 0..<width {
                        let i = token * width + d, av = Double(a[i]), bv = Double(b[i])
                        td += av * bv; ta += av * av; tb += bv * bv
                    }
                    dot += td; aa += ta; bb += tb
                    worst = min(worst, td / sqrt(ta * tb))
                }
                let cosine = dot / sqrt(aa * bb)
                c.measure("\(side).reference_cosine", cosine)
                c.measure("\(side).worst_token_cosine", worst)
                c.expect("\(side): trained-tower same-dtype agreement", cosine.isFinite && cosine > 0.998)
                // Per-token angles are reported, without inventing a new
                // weaker whole-tower threshold from this run's observations.
            }
            let peak = sampler.finish()
            c.measure("\(side).sampled_footprint_bytes", Double(peak.peakBytes))
            c.measure("\(side).mlx_peak_bytes", Double(MLX.Memory.peakMemory))
            c.expect("\(side): bounded tower and reference footprint", peak.peakBytes > 0
                && peak.peakBytes <= (maximumReferenceOnly ? 8_100_000_000 : 5_000_000_000))
        }
        return c.report()
    }

    /// Actual 16-head / 72-channel geometry through the maximum admitted image
    /// grid. Only the padded candidate computes every query at large N. An
    /// independent Float64 oracle and the original attention path compute three
    /// query rows against every key, avoiding an unsafe full N-by-N reference.
    public static func optimizationVisionCapacity(preserveQueryRounding: Bool = false,
                                                 queryTile: Int = 0) -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-vision-capacity\(preserveQueryRounding ? "-prescaled" : "")\(queryTile > 0 ? "-query256" : "")")
        let heads = 16, width = 72
        for n in [1, 8, 9, 255, 256, 257, 511, 512, 513, 1024, 2048, 4096, 9216] {
            for sharp in [false, true] {
                let label = "N\(n).\(sharp ? "sharp" : "smooth")"
                let sampler = FootprintSampler(intervalMilliseconds: 5)
                MLX.Memory.peakMemory = 0
                let count = heads * n * width
                func input(_ multiplier: Int, _ offset: Int, _ divisor: Float) -> MLXArray {
                    var values = [Float](repeating: 0, count: count)
                    for i in values.indices {
                        values[i] = Float((i * multiplier + offset) % 263 - 131) / divisor
                    }
                    // Match the tower's transposed [N, heads, D] layout.
                    return MLXArray(values, [n, heads, width]).asType(.bfloat16)
                        .transposed(1, 0, 2).reshaped([1, heads, n, width])
                }
                let q = input(31, 7, sharp ? 8 : 128)
                let k = input(43, 13, sharp ? 8 : 128)
                let v = input(59, 17, 64)
                eval(q, k, v)
                let rows = Array(Set([0, n / 2, n - 1])).sorted()
                let selectedQ = take(q, MLXArray(rows.map(Int32.init)), axis: 2)
                let reference = VisionAttention.apply(queries: selectedQ, keys: k, values: v)
                eval(reference)
                var queryCalls = 0
                let output = VisionAttention.apply(queries: q, keys: k, values: v, padding: queryTile == 0 ? 128 : 0,
                    preserveQueryRounding: preserveQueryRounding, queryTile: queryTile,
                    onQueryTile: { queryCalls += 1 })
                eval(output)
                c.equal(label + ": executed query tile count", queryCalls,
                    queryTile > 0 && n > 256 ? (n + 255) / 256 : 0)
                c.expect(label + ": complete finite output", output.shape == [1, heads, n, width]
                    && output.dtype == .bfloat16 && isFinite(output).all().item(Bool.self))
                let sampled = take(output, MLXArray(rows.map(Int32.init)), axis: 2)
                    .asType(.float32).asArray(Float.self)
                let rv = reference.asType(.float32).asArray(Float.self)
                let qv = q.asType(.float32).asArray(Float.self)
                let kv = k.asType(.float32).asArray(Float.self)
                let vv = v.asType(.float32).asArray(Float.self)
                var refError = 0.0, candidateError = 0.0
                for h in 0..<heads {
                    for (sampleIndex, row) in rows.enumerated() {
                        var scores = [Double](repeating: 0, count: n)
                        let qi = (h * n + row) * width
                        for key in 0..<n {
                            let ki = (h * n + key) * width
                            var dot = 0.0
                            for d in 0..<width { dot += Double(qv[qi + d]) * Double(kv[ki + d]) }
                            scores[key] = dot / Double(width).squareRoot()
                        }
                        let maximum = scores.max()!
                        var denominator = 0.0
                        for key in 0..<n {
                            scores[key] = exp(scores[key] - maximum)
                            denominator += scores[key]
                        }
                        for d in 0..<width {
                            var expected = 0.0
                            for key in 0..<n {
                                expected += scores[key] * Double(vv[(h * n + key) * width + d])
                            }
                            expected /= denominator
                            let i = (h * rows.count + sampleIndex) * width + d
                            refError = max(refError, abs(Double(rv[i]) - expected))
                            candidateError = max(candidateError, abs(Double(sampled[i]) - expected))
                        }
                    }
                }
                c.measure(label + ".sampled_reference_max_error", refError)
                c.measure(label + ".sampled_candidate_max_error", candidateError)
                c.expect(label + ": independent Float64 sampled-row oracle",
                    candidateError.isFinite && refError.isFinite
                    && candidateError <= max(3 * refError, 0.01))
                let peak = sampler.finish()
                c.measure(label + ".sampled_footprint_bytes", Double(peak.peakBytes))
                c.measure(label + ".mlx_peak_bytes", Double(MLX.Memory.peakMemory))
                c.expect(label + ": bounded component and oracle footprint", peak.peakBytes > 0
                    && peak.peakBytes <= 2_000_000_000)
            }
        }
        return c.report()
    }
}
