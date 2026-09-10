import MLX

/// Experimental D256 GQA attention. Eight keys at a time, one query/head
/// per threadgroup, FP32 online softmax and value accumulation. This changes
/// reduction/rounding from the pinned BF16 matmul-softmax-matmul fallback;
/// it must pass the numerical-change contract before any default adoption.
package enum SelectedAttention {
    private final class Kernels: Sendable {
        static let shared = Kernels()
        let attend: MLXFast.MLXFastKernel? = MLXFast.metalKernel(
            name: "slotstream_selected_attention_d256",
            inputNames: ["query", "key", "value", "blocks", "metadata"],
            outputNames: ["output"], source: """
            uint tid = thread_position_in_grid.x % 256;
            uint row = thread_position_in_grid.x / 256;
            uint lane = thread_index_in_simdgroup;
            uint group = tid / 32;
            int S = metadata[0], N = metadata[1], H = metadata[2];
            int HK = metadata[3], base = metadata[4], K = metadata[5];
            int pos = row % S, head = (row / S) % H, batch = row / (S * H);
            int absolute = base + pos;
            int kvbase = (batch * HK + head / (H / HK)) * N * 256;
            int own = ((absolute + 1) / 4) * 4;
            int count = K ? K * 4 + absolute + 1 - own : absolute + 1;
            threadgroup float scores[8];
            threadgroup int keys[8];
            float maximum = -INFINITY, denominator = 0.0f, accumulated = 0.0f;
            // Scale is exactly 1/sqrt(256), representable in BF16 and FP32.
            float q[8];
            for (uint d = 0; d < 8; ++d)
                q[d] = float(InT(query[row * 256 + d * 32 + lane] * InT(0.0625f)));
            for (int lo = 0; lo < count; lo += 8) {
                int rank = lo + group, index = -1;
                if (rank < count) {
                    if (!K) index = rank;
                    else if (rank < K * 4) {
                        int block = blocks[(batch * S + pos) * K + rank / 4];
                        if (block >= 0 && block < N / 4 && block * 4 + 3 <= absolute)
                            index = block * 4 + rank % 4;
                    } else index = own + rank - K * 4;
                }
                float dot = 0.0f;
                if (index >= 0 && index < N) {
                    for (uint d = 0; d < 8; ++d)
                        dot += q[d] * float(key[kvbase + index * 256 + d * 32 + lane]);
                }
                dot = simd_sum(dot);
                if (lane == 0) {
                    keys[group] = index;
                    scores[group] = index >= 0 && index < N ? float(InT(dot)) : -INFINITY;
                }
                threadgroup_barrier(mem_flags::mem_threadgroup);
                float nextMax = maximum;
                for (uint i = 0; i < 8; ++i) nextMax = max(nextMax, scores[i]);
                // Entirely invisible groups are possible before the own tail.
                if (nextMax != -INFINITY) {
                    float correction = maximum == -INFINITY ? 0.0f : exp(maximum - nextMax);
                    accumulated *= correction;
                    denominator *= correction;
                    for (uint i = 0; i < 8; ++i) {
                        if (keys[i] >= 0 && keys[i] < N) {
                            float weight = exp(scores[i] - nextMax);
                            denominator += weight;
                            accumulated += weight * float(value[kvbase + keys[i] * 256 + tid]);
                        }
                    }
                    maximum = nextMax;
                }
                threadgroup_barrier(mem_flags::mem_threadgroup);
            }
            if (denominator == 0.0f) {
                // The pinned prefill fallback uses the finite dtype minimum
                // for masked scores. An entirely masked row is consequently
                // uniform over the full key domain, not a zero/NaN output.
                float weight = float(InT(1.0f / float(N)));
                for (int index = 0; index < N; ++index)
                    accumulated += weight * float(value[kvbase + index * 256 + tid]);
                output[row * 256 + tid] = InT(accumulated);
            } else output[row * 256 + tid] = InT(accumulated / denominator);
            """)
    }

    package static func supported(q: MLXArray, k: MLXArray, v: MLXArray, base: Int, blocks: MLXArray?) -> Bool {
        guard q.ndim == 4, k.ndim == 4, v.shape == k.shape,
              q.dtype == k.dtype, v.dtype == q.dtype, [.bfloat16, .float32].contains(q.dtype),
              q.dim(0) >= 1, q.dim(0) == k.dim(0), q.dim(1) >= 1, k.dim(1) >= 1,
              q.dim(1) % k.dim(1) == 0, q.dim(2) > 8, q.dim(2) <= 511,
              q.dim(3) == 256, k.dim(3) == 256, k.dim(2) <= 32768,
              base >= 0, base <= k.dim(2), q.dim(2) <= k.dim(2) - base else { return false }
        if let blocks {
            return blocks.ndim == 3 && blocks.dtype == .int32
                && blocks.shape == [q.dim(0), q.dim(2), blocks.dim(2)]
                && blocks.dim(2) > 0 && blocks.dim(2) <= 512
        }
        return true
    }

    package static func diagnosticProductionAttention(q: MLXArray, k: MLXArray, v: MLXArray, base: Int) -> MLXArray {
        QSAAttention.attend(q: q, k: k, v: v, sparse: nil, base: base,
            scale: 0.0625, block: 256, selectedAttention: true)
    }

    /// Callers supply unique complete-block IDs or sentinels. Causal checks
    /// and the own partial block are applied in the kernel; no host readback.
    package static func execute(q: MLXArray, k: MLXArray, v: MLXArray, base: Int, blocks: MLXArray? = nil) -> MLXArray {
        precondition(supported(q: q, k: k, v: v, base: base, blocks: blocks))
        guard let kernel = Kernels.shared.attend else { return MLXArray(0) }
        // Keep a one-element vector even in dense mode: scalar inputs are
        // generated as scalar Metal arguments and cannot be indexed at all.
        let ids = blocks ?? MLXArray([Int32(0)])
        let metadata = MLXArray([q.dim(2), k.dim(2), q.dim(1), k.dim(1), base, blocks?.dim(2) ?? 0].map(Int32.init))
        return kernel([contiguous(q), contiguous(k), contiguous(v), contiguous(ids), metadata],
            template: [("InT", q.dtype)], grid: (q.size, 1, 1), threadGroup: (256, 1, 1),
            outputShapes: [q.shape], outputDTypes: [q.dtype]).first ?? MLXArray(0)
    }

    private static let initialization: Result<Void, Error> = Result {
            try withError {
                guard Kernels.shared.attend != nil else { throw ModelError("selected attention kernel unavailable") }
                for dtype: DType in [.bfloat16, .float32] {
                    let q = MLXArray.zeros([1, 2, 9, 256], dtype: dtype)
                    let k = MLXArray.zeros([1, 1, 9, 256], dtype: dtype)
                    let v = MLXArray.ones([1, 1, 9, 256], dtype: dtype)
                    let got = execute(q: q, k: k, v: v, base: 0)
                    eval(got)
                    guard got.shape == q.shape, (got .== 1).all().item(Bool.self) else {
                        throw ModelError("selected attention initialization produced incorrect \(dtype) values")
                    }
                }
            }
    }
    package static var initializationIssue: String? {
        if case .failure(let error) = initialization { return String(describing: error) }
        return nil
    }
    @discardableResult package static func prepare() -> Bool {
        if case .success = initialization { return true }
        return false
    }
}
