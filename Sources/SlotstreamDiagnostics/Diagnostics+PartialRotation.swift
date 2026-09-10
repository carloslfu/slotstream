import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationPartialRotation() -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        var c = CheckBuilder("optimization-partial-rotation")
        c.expect("bounded BF16 kernel initializes with exact rounding", PartialRotation.prepare())
        guard PartialRotation.prepare() else { return c.report() }
        func bytes(_ value: MLXArray) -> [UInt8] {
            value.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
        }
        func equalBytes(_ label: String, _ actual: MLXArray, _ expected: MLXArray) {
            let got = bytes(actual), want = bytes(expected)
            let first = zip(got, want).enumerated().first { $0.element.0 != $0.element.1 }?.offset
            c.expect(label, got == want,
                "actual/expected bytes \(got.count)/\(want.count); first difference \(first.map(String.init) ?? "none")")
        }
        func compare(_ label: String, _ x: MLXArray, _ cosine: MLXArray, _ sine: MLXArray) {
            c.expect(label + ": supported", PartialRotation.supported(x, cosine, sine))
            let expected = PartialRotation.reference(x, cosine, sine), actual = PartialRotation.apply(x, cosine, sine)
            c.equal(label + ": output shape", actual.shape, expected.shape)
            equalBytes(label + ": exact BF16 bytes", actual, expected)
            let d = cosine.dim(-1)
            if d < x.dim(-1) {
                equalBytes(label + ": untouched dimensions exact", actual[.ellipsis, d...], x[.ellipsis, d...])
            }
            equalBytes(label + ": deterministic repeat", PartialRotation.apply(x, cosine, sine), actual)
        }
        // Actual QSA query/key and indexer layouts, including transposed
        // batch/head/time axes, non-power-of-two rows and partial rotation.
        for rows in [1, 2, 8, 9, 17, 255, 256, 257, 1024] {
            for heads in [1, 2, 24] {
                let d = heads == 1 ? 128 : 256
                let source = sin(MLXArray(0..<rows * heads * d).asType(.float32) * Float(0.0137))
                    .reshaped([1, rows, heads, d]).asType(.bfloat16)
                let q = source.transposed(0, 2, 1, 3)
                let angles = MLXArray((0..<rows * 64).map { Float(($0 * 997) % 65537) / 37 }).reshaped([1, 1, rows, 64])
                compare("QSA \(rows)/\(heads)", q, cos(angles), sin(angles))
                if heads == 1 {
                    compare("indexer keys \(rows)", q.reshaped([1, rows, d]),
                        cos(angles).reshaped([1, rows, 64]), sin(angles).reshaped([1, rows, 64]))
                }
            }
        }
        // Large/small finite operands, signed zero and cancellation around
        // explicit BF16 product boundaries. Powers span normal and subnormal
        // inputs without assuming the backend preserves denormals.
        let bitPatterns: [UInt32] = [0, 0x80000000, 0x00010000, 0x80010000, 0x00800000, 0x80800000,
            0x3f7f0000, 0xbf7f0000, 0x3f800000, 0xbf800000, 0x3f810000, 0xbf810000,
            0x3f010000, 0xbf010000, 0x4b000000, 0xcb000000, 0x5f000000, 0xdf000000]
        let edge = MLXArray((0..<3 * 256).map { Float(bitPattern: bitPatterns[$0 % bitPatterns.count]) })
            .reshaped([1, 3, 256]).asType(.bfloat16)
        for d in [2, 64, 128, 256] {
            let angles = MLXArray((0..<3 * d).map { Float(($0 * 117) % 997 - 498) / 997 }).reshaped([1, 3, d])
            compare("rounding edges \(d)", edge, cos(angles), sin(angles))
        }
        let interleavedValues: [Float] = (0..<5120).map { index in
            let numerator: Int = index % 701 - 350
            return Float(numerator) / Float(31)
        }
        let interleaved = MLXArray(interleavedValues).reshaped([2, 5, 2, 256]).asType(.bfloat16)
        let sliced = interleaved[0..., 1..<4, 0..., 0...].transposed(0, 2, 1, 3)
        let angleRows = MLXArray((0..<5 * 64).map { Float($0) / 11 }).reshaped([1, 5, 64])
        compare("strided batch and angle offsets", sliced,
            cos(angleRows)[0..., 1..<4, 0...].expandedDimensions(axis: 1),
            sin(angleRows)[0..., 1..<4, 0...].expandedDimensions(axis: 1))
        let cView = cos(angleRows)[0..., 1..<4, 0...].expandedDimensions(axis: 1)
        let sView = sin(angleRows)[0..., 1..<4, 0...].expandedDimensions(axis: 1)
        compare("reversed input columns", sliced[.ellipsis, .stride(by: -1)], cView, sView)
        compare("strided input columns", sliced[.ellipsis, .stride(by: 2)], cView, sView)
        compare("reversed row and head axes", sliced[0..., .stride(by: -1), .stride(by: -1), 0...],
            cView[0..., 0..., .stride(by: -1), 0...], sView[0..., 0..., .stride(by: -1), 0...])
        compare("reversed angle columns", sliced, cView[.ellipsis, .stride(by: -1)], sView[.ellipsis, .stride(by: -1)])
        let empty = MLXArray.zeros([1, 0, 128], dtype: .bfloat16)
        let emptyAngles = MLXArray.zeros([1, 0, 64], dtype: .float32)
        c.expect("zero-row dispatch stays on original path", !PartialRotation.supported(empty, emptyAngles, emptyAngles))
        equalBytes("zero-row fallback retains exact empty output", PartialRotation.apply(empty, emptyAngles, emptyAngles),
            PartialRotation.reference(empty, emptyAngles, emptyAngles))
        let floatInput = edge.asType(.float32), angles = MLXArray.ones([1, 3, 64], dtype: .float32)
        c.expect("FP32 retains original dispatch", !PartialRotation.supported(floatInput, angles, angles))
        equalBytes("FP32 fallback is exact", PartialRotation.apply(floatInput, angles, angles),
            PartialRotation.reference(floatInput, angles, angles))
        c.expect("component footprint bounded", ProcessMemory.residentBytes() < 2_000_000_000)
        return c.report()
    }
}
