import MLX

extension Qwen4ExpModel {
    /// Fixed-input trained-weight diagnostic. Normal model forwards set these
    /// controls at each layer; this seam does not create or modify model state.
    package func diagnosticResidentExpertOutput(_ input: MLXArray, layer: Int,
                                                overlapping: Bool) throws -> MLXArray {
        guard input.ndim == 3, input.dim(0) == 1, input.dim(1) > 0,
              input.dim(2) == cfg.hiddenSize, let unit = moe[layer] else {
            throw ModelError("invalid resident-overlap diagnostic geometry")
        }
        let previous = unit.overlapResident, observer = unit.routerObserver
        unit.overlapResident = overlapping; unit.routerObserver = routerObserver
        defer { unit.overlapResident = previous; unit.routerObserver = observer }
        return try unit(input)
    }
}
