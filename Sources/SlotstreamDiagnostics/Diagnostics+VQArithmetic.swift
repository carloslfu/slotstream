import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Exhaustive finite BF16 unary comparison against the pinned Python
    /// MLX 0.32.2 output. The reference producer binds its installed libraries.
    public static func quantizationCandidateArithmetic() throws -> CheckReport {
        try ModelProcessGuard.acquire()
        var c = CheckBuilder("quantization-candidate-arithmetic")
        return try withError {
            let bits = (0...65535).map(UInt16.init).filter { $0 & 0x7f80 != 0x7f80 }
            let x = MLXArray(bits).view(dtype: .bfloat16)
            let output = VQArithmetic.sigmoid(x)
            eval(output)
            let data = output.asData(access: .copy).data
            let hash = SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
            c.equal("every finite BF16 bit pattern present", bits.count, 65280)
            c.equal("every finite BF16 sigmoid output bit matches pinned Python GPU",
                    hash, "c487ccb3208e0ad603a280dd5b17a28910f9487929a0ba9bdfb1f782b3722b32")
            c.expect("finite sigmoid outputs", all(isFinite(output)).item(Bool.self))
            let narrow = VQArithmetic.sigmoid(MLXArray([Float(-6.84375)], [1, 1, 1]).asType(.bfloat16))
            eval(narrow)
            c.equal("rounding-boundary scalar shape", narrow.asData(access: .copy).data, Data([0x8b, 0x3a]))
            let inverse = VQArithmetic.inverseFrequencies()
            let angles = Rope(dim: 64, base: 10_000_000, pinnedVQReference: true).table(start: 0, count: 512)
            for (name, value, expected) in [
                ("inverse frequencies", inverse, "2fb3c351f0a3fc12c0b204e77660cca2c1bc373dae37f5d0a2bfe2b92cef1248"),
                ("512-row rotary cosine", angles.0, "20be5bf2cc1ff4c4208827d99c0f95adb511816556777bc1e965fe782703fd60"),
                ("512-row rotary sine", angles.1, "3887752075ec29f866d82da8322cba01421caec5a6c257aa1eaa6f708280aba7")
            ] {
                eval(value)
                let actual = SHA256.hash(data: value.asData(access: .copy).data).map { String(format: "%02x", $0) }.joined()
                c.equal(name + " matches pinned Python FP32 bits", actual, expected)
            }
            let complete = Rope(dim: 64, base: 10_000_000, pinnedVQReference: true).table(start: 0, count: VQRotaryTable.rows)
            for (name, value, expected) in [
                ("complete cosine", complete.0, "2ea92fc755d7142d2bedffc271951b7f2b41b6883694c4f9ce7b49208b193467"),
                ("complete sine", complete.1, "8c8482f90c563ded98ca3880fa6838d5be4e9a1977f34721649668380ca0ce74")
            ] {
                eval(value)
                c.equal("every admitted position " + name + " matches pinned FP32 bits",
                    SHA256.hash(data: value.asData(access: .copy).data).map { String(format: "%02x", $0) }.joined(), expected)
            }
            let strided = Rope(dim: 64, base: 10_000_000, pinnedVQReference: true).table(start: 2049, count: 3, stride: 2)
            let index = MLXArray([Int32(2049), 2051, 2053])
            c.equal("strided final cosine positions", strided.0.asData(access: .copy).data,
                    complete.0[0, index, 0...].asData(access: .copy).data)
            c.equal("strided final sine positions", strided.1.asData(access: .copy).data,
                    complete.1[0, index, 0...].asData(access: .copy).data)
            c.expect("rotary table negative position refused", !VQRotaryTable.supports([-1]))
            c.expect("rotary table next position refused", !VQRotaryTable.supports([2054]))
            c.expect("rotary table empty request refused", !VQRotaryTable.supports([]))
            // The existing ordinary candidate recurrence is independently
            // pinned by whole-model reference fixtures. Recording must add
            // checkpoints without changing that arithmetic at any position.
            func values(_ shape: [Int], salt: Int, dtype: DType = .bfloat16) -> MLXArray {
                let count = shape.reduce(1, *)
                return MLXArray((0..<count).map { Float(($0 * 17 + salt) % 193 - 96) / 512 }, shape).asType(dtype)
            }
            for rows in [1, 2, 3, 5] {
                for nonzero in [false, true] {
                    let q = values([1, rows, 16, 128], salt: 7), k = values([1, rows, 16, 128], salt: 19)
                    let v = values([1, rows, 48, 128], salt: 31)
                    let a = values([1, rows, 48], salt: 43), b = values([1, rows, 48], salt: 53)
                    let aLog = values([48], salt: 61), bias = values([48], salt: 71)
                    let initial = nonzero ? values([1, 48, 128, 128], salt: 83, dtype: .float32) : nil
                    let recorded = candidateGatedDeltaUpdateRecording(q: q, k: k, v: v, a: a, b: b,
                        aLog: aLog, dtBias: bias, state: initial)
                    eval([recorded.output] + recorded.states)
                    c.equal("candidate records every position \(rows)/\(nonzero)", recorded.states.count, rows)
                    for keep in 1...rows {
                        let plain = candidateGatedDeltaUpdate(q: q[0..., 0..<keep], k: k[0..., 0..<keep],
                            v: v[0..., 0..<keep], a: a[0..., 0..<keep], b: b[0..., 0..<keep],
                            aLog: aLog, dtBias: bias, state: initial)
                        eval(plain.0, plain.1)
                        c.equal("candidate recorded output \(rows)/\(nonzero)/\(keep)",
                            recorded.output[0..., 0..<keep].asData(access: .copy).data, plain.0.asData(access: .copy).data)
                        c.equal("candidate recorded state \(rows)/\(nonzero)/\(keep)",
                            recorded.states[keep - 1].asData(access: .copy).data, plain.1.asData(access: .copy).data)
                    }
                }
            }
            return c.report()
        }
    }
}
