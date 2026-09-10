import MLX

/// Exact keep-set prototype for the indexer's 512-of-N selection. It searches
/// the sortable IEEE key space for the kth key, then resolves threshold ties
/// in original-index order. Scores and their arithmetic remain unchanged.
/// Storage is N/256 integer keys per lane plus eight shared integer counters;
/// no N-wide sorted value/index pair or floating-point atomic is required.
package enum BlockSelection {
    private final class Kernels: Sendable {
        static let shared = Kernels()
        let select: MLXFast.MLXFastKernel? = MLXFast.metalKernel(name: "slotstream_block_keep512",
            inputNames: ["scores"], outputNames: ["selected"], source: """
            const uint tid = thread_position_in_grid.x % 256;
            const uint row = thread_position_in_grid.x / 256;
            const uint lane = thread_index_in_simdgroup;
            const uint group = tid / 32;
            constexpr uint Steps = (N + 255) / 256;
            uint keys[Steps];
            for (uint i = 0; i < Steps; ++i) {
                uint index = i * 256 + tid;
                uint bits = index < N ? as_type<uint>(scores[row * N + index]) : 0;
                uint magnitude = bits & 0x7fffffffu;
                // The pinned Metal comparator treats all FP32 subnormals as
                // zero. Preserve that backend contract, including its ties.
                if (magnitude < 0x00800000u) bits = 0;
                keys[i] = magnitude > 0x7f800000u ? 0u
                    : ((bits & 0x80000000u) ? ~bits : (bits ^ 0x80000000u));
            }
            threadgroup uint partial[8];
            uint threshold = 0;
            for (int bit = 31; bit >= 0; --bit) {
                uint trial = threshold | (1u << uint(bit));
                uint count = 0;
                for (uint i = 0; i < Steps; ++i)
                    count += (i * 256 + tid < N && keys[i] >= trial);
                uint sum = simd_sum(count);
                if (lane == 0) partial[group] = sum;
                threadgroup_barrier(mem_flags::mem_threadgroup);
                uint total = 0;
                for (uint g = 0; g < 8; ++g) total += partial[g];
                if (total >= 512) threshold = trial;
                threadgroup_barrier(mem_flags::mem_threadgroup);
            }
            uint greater = 0;
            for (uint i = 0; i < Steps; ++i)
                greater += (i * 256 + tid < N && keys[i] > threshold);
            uint sum = simd_sum(greater);
            if (lane == 0) partial[group] = sum;
            threadgroup_barrier(mem_flags::mem_threadgroup);
            uint totalGreater = 0;
            for (uint g = 0; g < 8; ++g) totalGreater += partial[g];
            uint tieBudget = 512 - totalGreater;
            uint earlierTies = 0;
            threadgroup_barrier(mem_flags::mem_threadgroup);
            for (uint i = 0; i < Steps; ++i) {
                uint index = i * 256 + tid;
                uint equal = index < N && keys[i] == threshold;
                uint prefix = simd_prefix_inclusive_sum(equal);
                uint sum = simd_sum(equal);
                if (lane == 0) partial[group] = sum;
                threadgroup_barrier(mem_flags::mem_threadgroup);
                uint beforeGroup = 0, tileTies = 0;
                for (uint g = 0; g < 8; ++g) {
                    if (g < group) beforeGroup += partial[g];
                    tileTies += partial[g];
                }
                if (index < N) selected[row * N + index] = keys[i] > threshold
                    || (equal && earlierTies + beforeGroup + prefix <= tieBudget);
                earlierTies += tileTies;
                threadgroup_barrier(mem_flags::mem_threadgroup);
            }
            """)
    }

    package static func reference(_ scores: MLXArray, k: Int) -> MLXArray {
        precondition(scores.ndim > 0)
        let n = scores.dim(-1), count = min(n, max(0, k))
        let empty = MLXArray.zeros(scores.shape, dtype: .bool)
        if count == 0 || scores.size == 0 { return empty }
        if count == n { return MLXArray.ones(scores.shape, dtype: .bool) }
        let indices = argPartition(-scores, kth: count - 1, axis: -1)[.ellipsis, ..<count]
        return putAlong(empty, indices, values: MLXArray(true), axis: -1)
    }

    package static func supported(_ scores: MLXArray, k: Int) -> Bool {
        scores.ndim > 0 && scores.dtype == .float32 && scores.size > 0 && k == 512
            && scores.dim(-1) > 512 && scores.dim(-1) <= 8192
    }

    private static func execute(_ scores: MLXArray, kernel: MLXFast.MLXFastKernel) -> MLXArray {
        let n = scores.dim(-1)
        return kernel([contiguous(scores)], template: [("N", n)],
            grid: (scores.size / n * 256, 1, 1), threadGroup: (256, 1, 1),
            outputShapes: [scores.shape], outputDTypes: [.bool])[0]
    }

    private static let initialized: Bool = {
        guard let kernel = Kernels.shared.select else { return false }
        let result = execute(MLXArray.zeros([1, 513], dtype: .float32), kernel: kernel)
        guard result.asType(.uint8).asArray(UInt8.self) == [UInt8](repeating: 1, count: 512) + [0] else { return false }
        let bits: [UInt32] = [0, 0x80000000, 1, 0x80000001, 0x007fffff, 0x807fffff, 0x00800000, 0x80800000]
        let tiny = MLXArray((0 ..< 1024).map { Float(bitPattern: bits[$0 % bits.count]) })
        return (execute(tiny, kernel: kernel) .== reference(tiny, k: 512)).all().item(Bool.self)
    }()
    @discardableResult package static func prepare() -> Bool { initialized }

    package static func keep(_ scores: MLXArray, k: Int, enabled: Bool) -> MLXArray {
        guard enabled, supported(scores, k: k), prepare(), let kernel = Kernels.shared.select else {
            return reference(scores, k: k)
        }
        return execute(scores, kernel: kernel)
    }
}
