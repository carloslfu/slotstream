import MLX

/// Fuse only pointwise work after the existing grouped RMS reduction. The
/// reduction tree and BF16 rounding boundary remain explicit. No model state,
/// weights or shape-dependent Swift values are captured by the compiler.
package enum CompiledArithmetic {
    private static let compiled = compile(shapeless: true) { (values: [MLXArray]) -> [MLXArray] in
        let x = values[0], meanSquare = values[1], weight = values[2], epsilon = values[3]
        let normalized = (x.asType(.float32) * rsqrt(meanSquare + epsilon)).asType(x.dtype)
        return [normalized * weight]
    }
    package static func reference(_ x: MLXArray, meanSquare: MLXArray, weight: MLXArray, epsilon: Float) -> MLXArray {
        (x.asType(.float32) * rsqrt(meanSquare + epsilon)).asType(x.dtype) * weight
    }
    package static func execute(_ x: MLXArray, meanSquare: MLXArray, weight: MLXArray, epsilon: Float) -> MLXArray {
        // Empty results occur only inside MLX.withError after an initialization
        // failure. Return a placeholder so that scope can throw cleanly.
        compiled([x, meanSquare, weight, MLXArray(epsilon)]).first ?? MLXArray(0)
    }
    private static let initialized: Bool = {
        do {
            return try withError {
                let x = MLXArray.ones([1, 1, 4, 2560], dtype: .bfloat16)
                let mean = MLXArray.ones([1, 1, 4, 1], dtype: .float32)
                let weight = MLXArray.ones([4, 2560], dtype: .bfloat16)
                let got = execute(x, meanSquare: mean, weight: weight, epsilon: 1e-6)
                eval(got)
                return (got .== reference(x, meanSquare: mean, weight: weight, epsilon: 1e-6)).all().item(Bool.self)
            }
        } catch { return false }
    }()
    @discardableResult package static func prepare() -> Bool { initialized }
}
