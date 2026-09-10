import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationVisionAttention() -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-vision-attention")
        let d = 72, heads = 2
        for n in [1, 8, 9, 64, 257] {
            for dtype in [DType.float32, .bfloat16] {
                for pattern in [0, 1, 2] {
                    let count = heads * n * d
                    let divisor: Float = pattern == 2 ? 2 : 64
                    var qa = [Float](repeating: 0, count: count), ka = qa, va = qa
                    for i in 0 ..< count {
                        qa[i] = pattern == 1 ? 0 : Float((i * 31 + 7) % 257 - 128) / divisor
                        ka[i] = Float((i * 43 + 13) % 263 - 131) / divisor
                        va[i] = Float((i * 59 + 17) % 269 - 134) / Float(64)
                    }
                    let q = MLXArray(qa, [1, heads, n, d]).asType(dtype)
                    let k = MLXArray(ka, [1, heads, n, d]).asType(dtype)
                    let v = MLXArray(va, [1, heads, n, d]).asType(dtype)
                    let qv: [Double] = q.asType(.float32).asArray(Float.self).map(Double.init)
                    let kv: [Double] = k.asType(.float32).asArray(Float.self).map(Double.init)
                    let vv: [Double] = v.asType(.float32).asArray(Float.self).map(Double.init)
                    var oracle = [Double](repeating: 0, count: count)
                    for head in 0 ..< heads {
                        for row in 0 ..< n {
                            let outputBase = (head * n + row) * d
                            var scores = [Double](repeating: 0, count: n)
                            for key in 0 ..< n {
                                var dot = 0.0
                                let keyBase = (head * n + key) * d
                                for dim in 0 ..< d { dot += qv[outputBase + dim] * kv[keyBase + dim] }
                                scores[key] = dot / Double(d).squareRoot()
                            }
                            let maximum = scores.max()!
                            var total = 0.0
                            for key in 0 ..< n { scores[key] = exp(scores[key] - maximum); total += scores[key] }
                            for key in 0 ..< n {
                                let p = scores[key] / total
                                let valueBase = (head * n + key) * d
                                for dim in 0 ..< d { oracle[outputBase + dim] += p * vv[valueBase + dim] }
                            }
                        }
                    }
                    func error(_ out: MLXArray) -> Double {
                        let values = out.asType(.float32).asArray(Float.self)
                        guard values.count == oracle.count, values.allSatisfy(\.isFinite) else { return .infinity }
                        return zip(values, oracle).reduce(0) { max($0, abs(Double($1.0) - $1.1)) }
                    }
                    let reference = error(VisionAttention.apply(queries: q, keys: k, values: v))
                    for pad in [80, 128] {
                        let candidate = error(VisionAttention.apply(queries: q, keys: k, values: v, padding: pad))
                        let name = "N\(n).\(dtype).pattern\(pattern).pad\(pad)"
                        c.measure(name + ".reference_max_error", reference)
                        c.measure(name + ".candidate_max_error", candidate)
                        c.expect(name + ": independent Float64 oracle", candidate.isFinite && reference.isFinite
                            && candidate <= max(3 * reference, dtype == .float32 ? 1e-5 : 0.01))
                    }
                }
            }
        }
        return c.report()
    }
}
