import MLX

extension Qwen4ExpModel.State {
    package func validatePrefixFork() throws {
        guard committedBoundaryValid,
              kv.values.allSatisfy({ $0.offset == tokenCount }),
              indexer.values.allSatisfy({ $0.offset == tokenCount }) else {
            throw ModelError("cannot fork an incomplete or offset-inconsistent prefix state")
        }
        guard mtp == nil || hasValidMTP else {
            throw ModelError("cannot fork a prefix with misaligned draft state")
        }
        guard linear.values.allSatisfy({ !$0.record && $0.convStates.isEmpty
            && $0.ssmStates.isEmpty && $0.pleConvStates.isEmpty }) else {
            throw ModelError("cannot fork a prefix during speculative state recording")
        }
    }
    /// Additional representation fields matter when proving a branch shares
    /// an identical cache representation. Ordinary numerical comparisons can
    /// intentionally compare raw and compressed indexers, so keep this exact
    /// representation check separate from diagnosticTensors().
    package func prefixForkDiagnosticTensors() -> [String: MLXArray] {
        var result = diagnosticTensors()
        result["committedBoundaryValid"] = MLXArray(committedBoundaryValid)
        for (layer, cache) in kv { result["kvOffset.\(layer)"] = MLXArray(Int64(cache.offset)) }
        for (layer, cache) in indexer {
            for (name, value) in cache.prefixForkFields() { result["indexer.\(layer).\(name)"] = value }
        }
        for (layer, cache) in linear { result["linearNgram.\(layer)"] = MLXArray(cache.ngramCtx) }
        if let mtp {
            for (name, value) in mtp.indexer.prefixForkFields() { result["mtp.indexer.\(name)"] = value }
        }
        return result
    }

    /// Fork an already committed prefix into independently mutable caches.
    ///
    /// The recurrent state cannot be rewound or inferred from a string LCP.
    /// This copies cache objects/MLX contexts at the exact current token count.
    /// Existing sequence capacity is shared until an indexed write, then MLX
    /// copy-on-write preserves every surviving reader. Budget both branches'
    /// full allocated sequence capacity and fixed recurrent state; shared
    /// initial bytes are not a license to reserve less future memory.
    /// The caller must serialize this with model execution and materialize the
    /// completed forward before calling. Recording transactions are rejected.
    public func forkForPrefix() throws -> Qwen4ExpModel.State {
        try validatePrefixFork()
        let result = Qwen4ExpModel.State()
        result.modelIdentity = modelIdentity
        for (layer, cache) in linear { result.linear[layer] = try cache.forkForPrefix() }
        for (layer, cache) in kv {
            let fork = KVCache()
            cache.copyForPrefix(to: fork)
            result.kv[layer] = fork
            eval([fork.keys, fork.values].compactMap { $0 })
        }
        for (layer, cache) in indexer {
            let fork = cache.forkForPrefix()
            result.indexer[layer] = fork
            fork.materializeStorage()
        }
        result.ngramCtx = ngramCtx
        result.tokenCount = tokenCount
        result.committedBoundaryValid = committedBoundaryValid
        result.compactStateWindows = compactStateWindows
        result.mtp = mtp?.forkForPrefix()
        result.lastMulti = lastMulti.map { contiguous($0).reshaped($0.shape) }
        if let row = result.lastMulti { eval(row) }
        return result
    }
}
