import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationCompiledNorm() throws -> CheckReport {
        var c = CheckBuilder("optimization-compiled-norm")
        c.expect("compiler initialization before model state", CompiledArithmetic.prepare())
        guard CompiledArithmetic.prepare() else { return c.report() }
        for dtype: DType in [.bfloat16, .float32] {
            for rows in [1, 2, 8, 16, 256, 257] {
                for magnitude: Float in [0, 1e-20, 1, 1e10] {
                    var values = [Float](repeating: 0, count: rows * 4 * 2560)
                    for i in values.indices { values[i] = magnitude * Float((i * 31 + 7) % 257 - 128) / 131 }
                    // Transpose a materialized tensor to include a real
                    // noncontiguous input with the production grouped shape.
                    let storage = MLXArray(values, [1, 4, rows, 2560]).asType(dtype)
                    eval(storage)
                    let x = storage.transposed(0, 2, 1, 3)
                    let weight = MLXArray((0..<10240).map { Float(($0 * 7) % 31 - 15) / 13 }, [4, 2560]).asType(dtype)
                    let mean = x.asType(.float32).square().mean(axis: -1, keepDims: true)
                    let reference = CompiledArithmetic.reference(x, meanSquare: mean, weight: weight, epsilon: 1e-6)
                    let compiled = try withError {
                        let result = CompiledArithmetic.execute(x, meanSquare: mean, weight: weight, epsilon: 1e-6)
                        eval(result)
                        return result
                    }
                    c.expect("exact \(dtype), rows \(rows), magnitude \(magnitude)",
                        compiled.dtype == reference.dtype && compiled.shape == reference.shape
                            && (compiled .== reference).all().item(Bool.self))
                }
            }
        }
        return c.report()
    }
}
