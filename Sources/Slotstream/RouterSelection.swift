import MLX

/// Fixed-shape selection probe. Integer ordering of IEEE float bits preserves
/// normal-value order, makes zero/subnormal scores tie as the pinned Metal
/// comparator does, and places every NaN after -infinity.
/// Each row uses one SIMD group and sixteen keys per lane; no full sorted row
/// or floating-point score/reduction change is needed to select ten indices.
package enum RouterSelection {
    private final class Kernels: Sendable {
        static let shared = Kernels()
        let select: MLXFast.MLXFastKernel? = MLXFast.metalKernel(
            name: "slotstream_router_top10_512",
            inputNames: ["scores"], outputNames: ["indices"],
            source: """
                uint lane = thread_index_in_simdgroup;
                uint row = thread_position_in_grid.x / 32;
                uint keys[16];
                for (uint i = 0; i < 16; ++i) {
                    uint bits = as_type<uint>(scores[row * 512 + i * 32 + lane]);
                    uint magnitude = bits & 0x7fffffffu;
                    // Match Metal comparisons: subnormals and signed zeros tie.
                    if (magnitude < 0x00800000u) bits = 0;
                    keys[i] = magnitude > 0x7f800000u ? 0u
                        : ((bits & 0x80000000u) ? ~bits : (bits ^ 0x80000000u));
                }
                uint used = 0;
                for (uint rank = 0; rank < 10; ++rank) {
                    uint key = 0, index = 512;
                    for (uint i = 0; i < 16; ++i) {
                        uint id = i * 32 + lane;
                        if (!(used & (1u << i)) &&
                            (keys[i] > key || (keys[i] == key && id < index))) {
                            key = keys[i]; index = id;
                        }
                    }
                    uint best = simd_max(key);
                    uint winner = simd_min(key == best ? index : 512u);
                    if (lane == 0) indices[row * 10 + rank] = winner;
                    if (winner % 32 == lane) used |= (1u << (winner / 32));
                }
                """
        )
    }

    // Compile/validate before a model advances any recurrent or sequence state.
    // Failure to initialize keeps the existing selector; execution failures are
    // never caught and resumed on a partially advanced request.
    private static let initialized: Bool = {
        guard let kernel = Kernels.shared.select else { return false }
        let indices = kernel([MLXArray.zeros([1, 512], dtype: .float32)],
            grid: (32, 1, 1), threadGroup: (32, 1, 1), outputShapes: [[1, 10]],
            outputDTypes: [.uint32])[0]
        guard indices.asArray(UInt32.self) == (0 ..< 10).map(UInt32.init) else { return false }
        let bits: [UInt32] = [0, 0x80000000, 1, 0x80000001, 0x007fffff, 0x807fffff]
        let tiny = MLXArray((0 ..< 512).map { Float(bitPattern: bits[$0 % bits.count]) })
        let got = kernel([tiny], grid: (32, 1, 1), threadGroup: (32, 1, 1),
            outputShapes: [[10]], outputDTypes: [.uint32])[0]
        return (got .== reference(tiny, k: 10)).all().item(Bool.self)
    }()

    @discardableResult package static func prepare() -> Bool { initialized }

    package static func supported(_ scores: MLXArray, k: Int) -> Bool {
        scores.ndim >= 1 && scores.dim(-1) == 512 && scores.dtype == .float32
            && scores.size > 0 && k == 10
    }

    package static func reference(_ scores: MLXArray, k: Int) -> MLXArray {
        argPartition(-scores, kth: k - 1, axis: -1)[.ellipsis, ..<k]
    }

    package static func indices(_ scores: MLXArray, k: Int, enabled: Bool) -> MLXArray {
        guard enabled, supported(scores, k: k), prepare(), let kernel = Kernels.shared.select else {
            return reference(scores, k: k)
        }
        let shape = Array(scores.shape.dropLast()) + [10]
        return kernel([contiguous(scores)], grid: (scores.size / 512 * 32, 1, 1),
                      threadGroup: (32, 1, 1), outputShapes: [shape],
                      outputDTypes: [.uint32])[0]
    }
}
