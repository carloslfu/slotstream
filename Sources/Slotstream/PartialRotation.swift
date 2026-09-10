import MLX

/// One pointwise pass for the existing partial NeoX rotation. Preserve BF16
/// rounding of both angle casts, both products and the final sum. In particular,
/// this is not a float FMA followed by a single output cast. Arbitrary input and
/// broadcast-angle strides avoid adding a whole-array layout copy.
package enum PartialRotation {
    private enum Kernels {
        static let rotation: MLXFast.MLXFastKernel? = MLXFast.metalKernel(
            name: "slotstream_partial_rotation_3d_bf16", inputNames: ["x", "anglesC", "anglesS"],
            outputNames: ["rotated"], source: """
            const uint column = thread_position_in_grid.x;
            const uint row = thread_position_in_grid.y;
            const uint group = thread_position_in_grid.z;
            if (column >= Width || row >= Rows || group >= Batches * Heads) return;
            const uint head = group % Heads, batch = group / Heads;
            const uint i = (group * Rows + row) * Width + column;
            int64_t inputOffset;
            if (Rank == 4) {
                inputOffset = int64_t(batch) * x_strides[0] + int64_t(head) * x_strides[1]
                    + int64_t(row) * x_strides[2] + int64_t(column) * x_strides[3];
            } else {
                inputOffset = int64_t(batch) * x_strides[0] + int64_t(row) * x_strides[1]
                    + int64_t(column) * x_strides[2];
            }
            if (column >= RotaryDim) {
                rotated[i] = x[inputOffset];
                return;
            }
            int64_t cosineOffset, sineOffset;
            if (Rank == 4) {
                cosineOffset = int64_t(batch) * anglesC_strides[0] + int64_t(head) * anglesC_strides[1]
                    + int64_t(row) * anglesC_strides[2] + int64_t(column) * anglesC_strides[3];
                sineOffset = int64_t(batch) * anglesS_strides[0] + int64_t(head) * anglesS_strides[1]
                    + int64_t(row) * anglesS_strides[2] + int64_t(column) * anglesS_strides[3];
            } else {
                cosineOffset = int64_t(batch) * anglesC_strides[0] + int64_t(row) * anglesC_strides[1]
                    + int64_t(column) * anglesC_strides[2];
                sineOffset = int64_t(batch) * anglesS_strides[0] + int64_t(row) * anglesS_strides[1]
                    + int64_t(column) * anglesS_strides[2];
            }
            const int64_t delta = int64_t(RotaryDim / 2) * x_strides[Rank - 1];
            const int64_t partnerOffset = column < RotaryDim / 2 ? inputOffset + delta : inputOffset - delta;
            const T cosine = T(anglesC[cosineOffset]);
            const T sine = T(anglesS[sineOffset]);
            const T first = T(float(x[inputOffset]) * float(cosine));
            const T partner = column < RotaryDim / 2 ? T(-float(x[partnerOffset])) : x[partnerOffset];
            const T second = T(float(partner) * float(sine));
            rotated[i] = T(float(first) + float(second));
            """, ensureRowContiguous: false)
    }

    package static func reference(_ x: MLXArray, _ cosine: MLXArray, _ sine: MLXArray) -> MLXArray {
        ropePartial(x, cosine, sine)
    }

    package static func supported(_ x: MLXArray, _ cosine: MLXArray, _ sine: MLXArray) -> Bool {
        guard x.dtype == .bfloat16, x.ndim == 3 || x.ndim == 4, x.size > 0, x.size <= Int(Int32.max),
              cosine.dtype == .float32, sine.dtype == .float32,
              cosine.shape == sine.shape, cosine.ndim > 0, cosine.ndim <= x.ndim,
              cosine.dim(-1) > 0, cosine.dim(-1).isMultiple(of: 2), cosine.dim(-1) <= x.dim(-1) else { return false }
        let shape = Array(repeating: 1, count: x.ndim - cosine.ndim) + cosine.shape
        return zip(shape.dropLast(), x.shape.dropLast()).allSatisfy { $0 == 1 || $0 == $1 }
    }

    private static func execute(_ x: MLXArray, _ cosine: MLXArray, _ sine: MLXArray,
                                kernel: MLXFast.MLXFastKernel) -> MLXArray {
        let angleShape = Array(x.shape.dropLast()) + [cosine.dim(-1)]
        let heads = x.ndim == 4 ? x.dim(1) : 1
        return kernel([x, broadcast(cosine, to: angleShape), broadcast(sine, to: angleShape)],
            template: [("T", x.dtype), ("Rank", x.ndim), ("Width", x.dim(-1)),
                ("Rows", x.dim(-2)), ("Heads", heads), ("Batches", x.dim(0)), ("RotaryDim", cosine.dim(-1))],
            grid: (x.dim(-1), x.dim(-2), x.dim(0) * heads), threadGroup: (256, 1, 1),
            outputShapes: [x.shape], outputDTypes: [x.dtype]).first ?? MLXArray(0)
    }

    private static let initialized: Bool = {
        do {
            return try withError {
                guard let kernel = Kernels.rotation else { return false }
                let x = MLXArray((0..<128).map { Float($0 - 64) / 17 }).reshaped([1, 1, 128]).asType(.bfloat16)
                let c = MLXArray.full([1, 1, 64], values: MLXArray(Float(0.314159)))
                let s = MLXArray.full([1, 1, 64], values: MLXArray(Float(-0.271828)))
                let actual = execute(x, c, s, kernel: kernel), expected = reference(x, c, s)
                return actual.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
                    == expected.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
            }
        } catch { return false }
    }()

    @discardableResult package static func prepare() -> Bool { initialized }

    package static func apply(_ x: MLXArray, _ cosine: MLXArray, _ sine: MLXArray) -> MLXArray {
        guard supported(x, cosine, sine), prepare(), let kernel = Kernels.rotation else {
            return reference(x, cosine, sine)
        }
        return execute(x, cosine, sine, kernel: kernel)
    }
}
