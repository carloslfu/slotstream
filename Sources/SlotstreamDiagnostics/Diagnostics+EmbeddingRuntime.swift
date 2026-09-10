import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationEmbeddingRuntime(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-embedding-runtime\(mtp ? "-mtp" : "")")
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        struct Outcome {
            var fields: [String: String]
            var output: [Int]
            var stats: GenStats
        }
        struct Arm {
            var requests: [String: Outcome]
            var tableFields: [String: String]
        }
        func arm(rows: Bool, expected: Arm?) throws -> Arm {
            let index = try CheckpointIndex(dir: modelDir)
            let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: rows)
            if mtp { try model.enableMTP(modelDir: modelDir) }
            c.equal("row mode \(rows): runtime selection", model.resident.usesEmbeddingRows, rows)
            let untouched = model.makeState()
            let untouchedFields = untouched.prefixForkDiagnosticTensors().mapValues(hash)
            for invalid in [[], [-1], [model.cfg.vocabSize], [Int.max]] {
                do { _ = try model.lastLogitsChecked(invalid, state: untouched); c.expect("\(rows): invalid model input rejected", false) }
                catch { c.expect("\(rows): invalid model input rejected", true) }
                c.equal("\(rows): invalid input leaves exact state reusable", untouched.prefixForkDiagnosticTensors().mapValues(hash), untouchedFields)
            }
            c.measure("\(rows ? "rows" : "resident")_loaded_mlx_active_bytes", Double(MLX.Memory.activeMemory))
            c.measure("\(rows ? "rows" : "resident")_loaded_physical_bytes", Double(ProcessMemory.residentBytes()))
            var options = InferenceOptimizations()
            options.compactStateWindows = true; options.compactMTPRow = true
            options.skipUnusedFinalForward = true; model.optimizations = options
            let generator = Generator(model: model)
            generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
            generator.speculationEnabled = mtp; generator.draftDepth = 1
            var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
            let tower = try VisionTower(index: index)
            let png = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==")!
            let image = try VisionPreprocess.decodeCGImage(png), imagePlan = try tower.plan(for: image)
            func vision(_ start: Int?) -> VisionPrompt? {
                guard let start else { return nil }
                return VisionPrompt(tower: tower, items: [.init(image: image, plan: imagePlan)],
                    segments: [.init(start: start, count: imagePlan.mergedTokens, hash: ImageHash(hashing: png))],
                    hiddenSize: model.cfg.hiddenSize)
            }
            let cases: [(String, Int, Int?)] = [
                ("cached17", 17, nil), ("sweep256", 256, nil), ("tail273", 273, nil),
                ("long1025", 1025, nil), ("image-before", 273, 1),
                ("image-crossing", 273 + imagePlan.mergedTokens, 256 - imagePlan.mergedTokens / 2),
            ]
            var results: [String: Outcome] = [:]
            for (label, count, imageStart) in cases {
                FileHandle.standardError.write(Data("embedding \(rows ? "rows" : "resident") / \(label)\n".utf8))
                var ids = (0 ..< count).map { 1000 + ($0 * 79) % 190_000 }
                if let start = imageStart {
                    ids.replaceSubrange(start ..< start + imagePlan.mergedTokens,
                        with: repeatElement(model.cfg.imageTokenId, count: imagePlan.mergedTokens))
                }
                model.resident.clearEmbeddingRows()
                let cache = PrefixCache(maxTokens: 8192)
                var keepGoing = true
                generator.onPrefillProgress = { done, total, _ in if done == total && done > 0 { keepGoing = false } }
                let vp = vision(imageStart)
                let pref = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    vision: vp, shouldContinue: { keepGoing })
                generator.onPrefillProgress = nil
                c.expect("\(rows)/\(label): prefill commits", pref.1.runtimeError == nil && pref.0.isEmpty)
                c.equal("\(rows)/\(label): mode observed", pref.1.embeddingRowsEnabled, rows)
                c.equal("\(rows)/\(label): unique cold prompt row count", pref.1.embeddingRowMisses, rows ? Set(ids).count : 0)
                if rows && mtp { c.expect("\(label): draft reuses main embedding rows", pref.1.embeddingRowHits > 0) }
                func stateFields() throws -> [String: String] {
                    guard let committed = cache.take(matching: ids + [17], images: vp?.segments ?? []) else {
                        throw ModelError("embedding runtime diagnostic lost committed state")
                    }
                    c.equal("\(rows)/\(label): committed token count", committed.state.tokenCount, ids.count)
                    if mtp { c.expect("\(rows)/\(label): draft aligned", committed.state.hasValidMTP) }
                    var fields = committed.state.prefixForkDiagnosticTensors().mapValues(hash)
                    committed.state.invalidateMTP()
                    fields["continuedLogits"] = hash(try model.lastLogitsChecked([17], state: committed.state))
                    return fields
                }
                let fields = try stateFields()
                let full = generator.generate(promptIds: ids, params: params, eosIds: [], vision: vision(imageStart))
                c.expect("\(rows)/\(label): generation succeeds", full.1.runtimeError == nil)
                c.equal("\(rows)/\(label): full greedy output length", full.0.count, params.maxTokens)
                if mtp { c.expect("\(rows)/\(label): verify path exercised", full.1.verifyPasses > 0) }
                c.expect("\(rows)/\(label): bounded row payload", full.1.embeddingCachedPayloadBytes <= 11_796_480)
                if let reference = expected?.requests[label] {
                    c.equal("\(label): all committed state fields and continued logits bit exact", fields, reference.fields)
                    c.equal("\(label): complete greedy output exact", full.0, reference.output)
                    c.equal("\(label): identical prefill boundaries", full.1.prefillComputePasses, reference.stats.prefillComputePasses)
                    c.equal("\(label): identical expert work", full.1.prefillRecords + full.1.decodeRecords,
                        reference.stats.prefillRecords + reference.stats.decodeRecords)
                }
                results[label] = Outcome(fields: fields, output: full.0, stats: full.1)
            }
            if rows {
                let ids = (0 ..< 273).map { 1000 + ($0 * 79) % 190_000 }
                options.prefixCheckpointTokens = 256; model.optimizations = options
                let retained = PrefixCache(maxTokens: 8192)
                let first = generator.generate(promptIds: ids, params: params, eosIds: [], cache: retained)
                let reused = generator.generate(promptIds: ids, params: params, eosIds: [], cache: retained)
                c.equal("row cache with reusable prefix: exact output", reused.0, first.0)
                c.equal("row cache with reusable prefix: retained boundary", reused.1.reusedPrefixTokens, 256)
                c.equal("row cache with reusable prefix: no checkpoint errors", reused.1.prefixCheckpointErrors, 0)
                c.equal("row cache with reusable prefix: no reread of retained rows", reused.1.embeddingRowMisses, 0)
                options.prefixCheckpointTokens = 0; model.optimizations = options

                // These faults use real checked embedding reads. Every retry
                // has a fresh request state, retaining only fully read rows.
                for stage in ["first prefill", "second prefill", "decode"] {
                    model.resident.clearEmbeddingRows()
                    let fault = ReadFault(afterJobs: 0)
                    let cache = PrefixCache(maxTokens: 8192)
                    let prompt = stage == "decode" ? Array(ids.prefix(17)) : ids
                    if stage == "first prefill" { model.resident.embeddingReadFault = fault }
                    generator.onPrefillProgress = { done, _, _ in
                        if stage == "second prefill" && done == 256 {
                            model.resident.clearEmbeddingRows(); model.resident.embeddingReadFault = fault
                        }
                    }
                    var delivered: [Int] = []
                    let savedLimit = MLX.Memory.cacheLimit
                    let failed = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                        onToken: { id in
                            delivered.append(id)
                            if stage == "decode" && delivered.count == 1 {
                                model.resident.clearEmbeddingRows(); model.resident.embeddingReadFault = fault
                            }
                            return true
                        })
                    model.resident.embeddingReadFault = nil; generator.onPrefillProgress = nil
                    c.expect("\(stage): embedding read fault actually fired", fault.hasFired)
                    c.equal("\(stage): explicit failed completion", failed.1.finishReason, "error")
                    c.expect("\(stage): runtime error propagated", failed.1.runtimeError != nil)
                    c.equal("\(stage): committed callback output preserved", failed.0, delivered)
                    c.equal("\(stage): no invalid state cached", cache.heldTokens, 0)
                    c.equal("\(stage): pool pins released", model.pool.pinnedSlotCount, 0)
                    c.expect("\(stage): sweep admission reset", !model.pool.admitOnSweep)
                    c.equal("\(stage): allocator restored", MLX.Memory.cacheLimit, savedLimit)
                    c.equal("\(stage): only committed prefill counted", failed.1.prefillTokens,
                        stage == "first prefill" ? 0 : stage == "second prefill" ? 256 : 17)
                    let reference = results[stage == "decode" ? "cached17" : "tail273"]!.output
                    c.equal("\(stage): exact committed output prefix", failed.0, Array(reference.prefix(delivered.count)))
                    let retry = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
                    c.expect("\(stage): retry succeeds", retry.1.runtimeError == nil)
                    c.equal("\(stage): retry exactly matches original table", retry.0, reference)
                }
                for invalid in [MLXArray([Int64(1) << 32]), MLXArray([Int64(-1)]), MLXArray([Float(17)])] {
                    do { _ = try model.resident.embedChecked(invalid); c.expect("invalid public lookup rejected", false) }
                    catch { c.expect("invalid public lookup rejected", true) }
                }
                let many = MLXArray(Array(repeating: Int32(17), count: 4097), [1, 4097])
                let got = try model.resident.embedChecked(many), one = try model.resident.embedChecked(MLXArray([Int32(17)], [1, 1]))
                c.equal("larger public lookup keeps exact shape", got.shape, [1, 4097, model.cfg.hiddenSize])
                c.expect("larger public lookup preserves every row", (got .== one).all().item(Bool.self))
                if let head = model.mtpHead {
                    let draftIds = Array(ids.prefix(17)), state = model.makeState()
                    state.mtp = MTPState()
                    let (_, multi) = try model.hiddenStatesWithMultiChecked(draftIds, state: state)
                    let before = state.prefixForkDiagnosticTensors().mapValues(hash)
                    model.resident.clearEmbeddingRows()
                    let fault = ReadFault(afterJobs: 1)
                    model.resident.embeddingReadFault = fault
                    do {
                        _ = try head.consumeChecked(chunk: draftIds, chunkMulti: multi, prevMulti: nil,
                            resident: model.resident, rope: model.sharedRope, state: state.mtp!, compactRetainedRow: true)
                        c.expect("direct draft prefill: error propagated", false)
                    } catch { c.expect("direct draft prefill: error propagated", true) }
                    model.resident.embeddingReadFault = nil
                    c.expect("direct draft prefill: read fault fired", fault.hasFired)
                    c.equal("direct draft prefill: failed embedding never mutates state",
                        state.prefixForkDiagnosticTensors().mapValues(hash), before)
                    c.expect("direct draft prefill: incomplete composition is not aligned", !state.hasValidMTP)
                    state.lastMulti = try head.consumeChecked(chunk: draftIds, chunkMulti: multi, prevMulti: nil,
                        resident: model.resident, rope: model.sharedRope, state: state.mtp!, compactRetainedRow: true)
                    c.expect("direct draft prefill: exact retry restores alignment", state.hasValidMTP)
                    do {
                        _ = try head.consumeChecked(chunk: [], chunkMulti: multi, prevMulti: nil,
                            resident: model.resident, rope: model.sharedRope, state: state.mtp!)
                        c.expect("empty checked draft chunk rejected", false)
                    } catch { c.expect("empty checked draft chunk rejected", true) }
                }
            }
            // Public tensor names/values remain available even when lookup
            // rows are enabled. Do this last: it intentionally materializes
            // the full original table, so no memory saving is claimed after it.
            let table = EmbeddingRows.names.map { model.resident.tensor($0) }
            let tableFields = Dictionary(uniqueKeysWithValues: zip(EmbeddingRows.names, table.map(hash)))
            if let reference = expected?.tableFields {
                c.equal("public tensor access preserves all table bytes", tableFields, reference)
            }
            model.pool.unpinAll(); Stream.gpu.synchronize()
            return Arm(requests: results, tableFields: tableFields)
        }
        // Only strings/scalars cross this boundary; no model, cache or MLX
        // array from the resident arm survives into the row arm.
        let reference = try arm(rows: false, expected: nil)
        Stream.gpu.synchronize(); MLX.Memory.clearCache()
        _ = try arm(rows: true, expected: reference)
        return c.report()
    }
}
