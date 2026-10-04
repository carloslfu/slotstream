import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func quantizationMetadata() throws -> CheckReport {
        let automatic = try ModelPackRegistry.resolve(.automatic)
        let pinned = try ModelPackRegistry.resolve(.pack(PinnedModel.name))
        var c = CheckBuilder("quantization-metadata")
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("quantization-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        func load(_ quantization: Any, extra: [String: Any] = [:]) throws -> ModelConfig {
            var root: [String: Any] = ["text_config": [:], "quantization": quantization]
            root.merge(extra) { _, rhs in rhs }
            try JSONSerialization.data(withJSONObject: root).write(to: directory.appendingPathComponent("config.json"))
            return try ModelConfig.load(from: directory)
        }
        let ngram = "model.layers.1.ngram_embedding.embedding.0"
        let projection = "model.layers.3.mlp.switch_mlp.gate_proj"
        let good: [String: Any] = ["bits": 4, "group_size": 64,
            "language_model." + ngram: ["bits": 4, "group_size": 32], projection: ["bits": 4, "group_size": 64]]
        let config = try load(good)
        c.equal("legacy affine defaults preserved", config.qBits, 4)
        c.equal("per-module PLE descriptor resolved", try config.affineQuantization(for: ngram).groupSize, 32)
        c.equal("per-module projection descriptor resolved", try config.affineQuantization(for: projection).groupSize, 64)
        var rejected = [Any]()
        for field in ["bits", "group_size"] {
            for bad: Any in ["4", true, 4.5, NSNull(), [4]] {
                var value = good; value[field] = bad; rejected.append(value)
            }
        }
        for override: Any in [["bits": 3, "group_size": 64], ["bits": 4, "group_size": 32],
                             ["bits": 4], ["bits": 4, "group_size": 64, "mode": "vq"], false] {
            var value = good; value[projection] = override; rejected.append(value)
        }
        var mixed = good; mixed["language_model.model.layers.1.ngram_embedding.embedding.1"] = ["bits": 4, "group_size": 64]
        rejected.append(mixed)
        var duplicate = good; duplicate[ngram] = ["bits": 4, "group_size": 32]; rejected.append(duplicate)
        rejected += ["affine", NSNull(), ["bits": 4, "group_size": 64, "mode": "vq"]]
        for (index, value) in rejected.enumerated() {
            do { _ = try load(value); c.expect("corrupt descriptor \(index) refused", false) }
            catch { c.expect("corrupt descriptor \(index) refused", true) }
        }
        for marker in ["vq_modules", "vq_ple"] {
            do { _ = try load(good, extra: [marker: [:]]); c.expect("unqualified \(marker) refused", false) }
            catch { c.expect("unqualified \(marker) refused", true) }
        }
        let reviewed = "1685ec90feb24e421c379ae4e3594f659478905d2c1393617990d84d3f514ee8"
        let older = "36de8d6ba21ff93ac3de2994eed4fd59e9cfab86b1908f72f5ee2673bd0aa5bb"
        let small = "4f63194dec2e4c3bec31289d6503cc7c886685e16e7c4aac58116d4cf0c7f037"
        let larger = ["098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
                      "a30ded4e88270d33dfcca8e9b6c414a69cf82f0ad27d20bb3fe71b2b1c14ccac"]
        func execution(_ fields: [String: Any]) throws -> VQReferenceExecution {
            try JSONDecoder().decode(VQReferenceExecution.self, from: JSONSerialization.data(withJSONObject: fields))
        }
        let explicit: [String: Any] = ["schema": 1, "mode": "explicit-reviewed-v1",
            "bundled_runtime_sha256": older, "runtime_sha256": reviewed]
        try VQReferenceExecution.validate(inventorySHA: small, runtimeSHA: reviewed, profile: execution(explicit))
        c.expect("older bundle explicitly binds reviewed execution", true)
        for artifact in larger {
            try VQReferenceExecution.validate(inventorySHA: artifact, runtimeSHA: nil, profile: nil)
            try VQReferenceExecution.validate(inventorySHA: artifact, runtimeSHA: reviewed, profile: nil)
            c.expect("historical reviewed fixtures remain valid unchanged", true)
            var bundled = explicit; bundled["mode"] = "bundled-reviewed-v1"; bundled["bundled_runtime_sha256"] = reviewed
            try VQReferenceExecution.validate(inventorySHA: artifact, runtimeSHA: reviewed, profile: execution(bundled))
            c.expect("fresh bundled fixture binds both identities", true)
        }
        var badProfiles: [[String: Any]] = []
        for (key, value): (String, Any) in [("schema", 2), ("mode", "bundled-reviewed-v1"),
            ("bundled_runtime_sha256", reviewed), ("runtime_sha256", older)] {
            var fields = explicit; fields[key] = value; badProfiles.append(fields)
        }
        for fields in badProfiles {
            do {
                try VQReferenceExecution.validate(inventorySHA: small, runtimeSHA: reviewed, profile: execution(fields))
                c.expect("changed execution identity refused", false)
            } catch { c.expect("changed execution identity refused", true) }
        }
        for operation: () throws -> Void in [
            { try VQReferenceExecution.validate(inventorySHA: small, runtimeSHA: reviewed, profile: nil) },
            { try VQReferenceExecution.validate(inventorySHA: small, runtimeSHA: nil, profile: execution(explicit)) },
            { try VQReferenceExecution.validate(inventorySHA: small, runtimeSHA: older, profile: execution(explicit)) },
            { try VQReferenceExecution.validate(inventorySHA: "uninspected", runtimeSHA: reviewed, profile: execution(explicit)) },
            { try VQReferenceExecution.validate(inventorySHA: larger[0], runtimeSHA: older, profile: nil) }
        ] {
            do { try operation(); c.expect("incomplete or foreign execution binding refused", false) }
            catch { c.expect("incomplete or foreign execution binding refused", true) }
        }
        c.equal("Auto retains the supported original pack", automatic.pack.id, PinnedModel.name)
        c.equal("explicit selection binds the same bytes", pinned.pack.manifestDigest, automatic.pack.manifestDigest)
        c.equal("registry preserves required download bytes", automatic.pack.requiredBytes, PinnedModel.requiredBytes)
        c.expect("research packs cannot enter Auto", ModelPackRegistry.supported.count == 1)
        c.expect("supported baseline is not a new speed qualification", automatic.pack.qualifiedAutomaticProfiles.isEmpty)
        c.expect("selection modes have separate reasons", automatic.automatic && !pinned.automatic && automatic.reason != pinned.reason)
        for unknown in ["vq-2.1", "vq-3.2", "../model", "", "auto"] {
            do { _ = try ModelPackRegistry.resolve(.pack(unknown)); c.expect("unsupported explicit pack refused", false) }
            catch { c.expect("unsupported explicit pack refused", true) }
        }
        return c.report()
    }

    public static func quantizationGeometry() throws -> CheckReport {
        var c = CheckBuilder("quantization-geometry")
        let four = try AffineQuantization(bits: 4, groupSize: 64)
        c.equal("legacy expert bytes", try four.rowBytes(columns: 2560) * 640 * 2 + four.rowBytes(columns: 640) * 2560, 2_764_800)
        let three = try AffineQuantization(bits: 3, groupSize: 64)
        let baselineConfig = try ModelConfig.parse(Data("{\"text_config\": {}}".utf8), label: "quantization geometry fixture")
        let control = try baselineConfig.withAffineExpertControl()
        c.equal("research control sets only routed expert recipes", control.quantizationOverrides.count, 144)
        c.equal("research control preserves dense quantization", try control.affineQuantization(for: "lm_head"), four)
        c.equal("research control preserves PLE quantization", try control.affineQuantization(for: "ngram_embedding.shard_0").groupSize, 32)
        c.equal("controlled expert record geometry", control.admittedExpertRecordBytes, 2_150_400)
        try Geometry.check(against: control, recordBytes: 2_150_400)
        for (config, bytes) in [(baselineConfig, 2_150_400), (control, 2_764_800)] {
            do { try Geometry.check(against: config, recordBytes: bytes); c.expect("artifact-specific geometry mismatch refused", false) }
            catch { c.expect("artifact-specific geometry mismatch refused", true) }
        }
        c.equal("3-bit rows do not truncate fractional packing", try three.packedWords(columns: 2560), 240)
        let wide = try VQLayout(columns: 2560, dimensions: 8, codebookEntries: 16384, groupSize: 64, packing: .words32)
        let down = try VQLayout(columns: 640, dimensions: 4, codebookEntries: 256, groupSize: 64, packing: .words32)
        c.equal("VQ wide codes are 140 words", wide.codeRowBytes, 560)
        c.equal("VQ mixed record includes scales, excludes shared codebooks", try wide.recordBytes(rows: 640) * 2 + down.recordBytes(rows: 2560), 1_280_000)
        let ngram = try VQLayout(columns: 160, dimensions: 4, codebookEntries: 2048, groupSize: 32, packing: .bytes)
        c.equal("PLE uses byte packing without expert padding", ngram.codeRowBytes, 55)
        let padded = try VQLayout(columns: 160, dimensions: 4, codebookEntries: 2048, groupSize: 32, packing: .words32)
        c.equal("expert packing retains the padded tail", padded.codeRowBytes, 88)
        let narrow = try VQLayout(columns: 2560, dimensions: 4, codebookEntries: 2048, groupSize: 64, packing: .words32)
        let high = try VQLayout(columns: 2560, dimensions: 2, codebookEntries: 256, groupSize: 64, packing: .unpacked8)
        let tail = try VQLayout(columns: 640, dimensions: 4, codebookEntries: 2048, groupSize: 64, packing: .words32)
        let regular = try VQRecordLayout([narrow, narrow, tail])
        c.equal("complete 3.2 regular record bytes", regular.recordBytes, 1_843_200)
        c.equal("ordinary bank admission remains 512", try VQBankAdmission.standard.maximumRows(for: narrow), 512)
        c.equal("explicit dense bank admission is 1536", try VQBankAdmission.denseCompositeReinvestment.maximumRows(for: narrow), 1536)
        for operation: () throws -> Void in [
            { _ = try VQBankAdmission.denseCompositeReinvestment.maximumRows(for: high) },
            { _ = try VQBankAdmission.denseCompositeReinvestment.maximumRows(for: ngram) },
            { _ = try VQRecordBank(layout: regular, capacity: 513) },
            { _ = try VQRecordBank(layout: regular, capacity: 1537, admission: .denseCompositeReinvestment) }
        ] {
            do { try operation(); c.expect("unqualified bank admission refused before allocation", false) }
            catch { c.expect("unqualified bank admission refused before allocation", true) }
        }
        let mixed = try VQRecordLayout([narrow, high, tail])
        let swapped = try VQRecordLayout([high, narrow, tail])
        c.equal("swapped projections have equal byte counts", mixed.recordBytes, swapped.recordBytes)
        c.expect("equal bytes cannot alias different allocation classes", mixed != swapped)
        for operation: () throws -> Void in [
            { _ = try AffineQuantization(bits: 7, groupSize: 64) },
            { _ = try three.packedWords(columns: 63) },
            { _ = try four.packedWords(columns: Int.max - 63) },
            { _ = try VQLayout(columns: 160, dimensions: 4, codebookEntries: 2048, groupSize: 32, packing: .unpacked8) },
            { _ = try VQLayout(columns: 160, dimensions: 4, codebookEntries: 257, groupSize: 32, packing: .words32) },
            { _ = try wide.recordBytes(rows: Int.max) }
        ] {
            do { try operation(); c.expect("invalid geometry refused", false) }
            catch { c.expect("invalid geometry refused", true) }
        }
        return c.report()
    }

    /// CPU bit-packing and Float16 arithmetic are independent of the Metal
    /// decoder. Include word crossings, padded tails, every row endpoint and
    /// byte-packed PLE. No source model or upstream Python is executed.
    public static func quantizationKernels() throws -> CheckReport {
        try ModelProcessGuard.acquire()
        var c = CheckBuilder("quantization-kernels")
        return try withError {
            for (columns, dim, entries, group, packing) in [
                (2560, 2, 256, 64, VQLayout.Packing.unpacked8),
                (2560, 8, 16384, 64, .words32),
                (640, 4, 256, 64, .words32),
                (2560, 4, 2048, 64, .words32),
                (2560, 2, 1024, 64, .words32),
                (160, 8, 256, 32, .bytes),
                (160, 4, 2048, 32, .bytes),
                (160, 2, 256, 32, .bytes),
                (160, 4, 2048, 32, .words32),
                (160, 2, 1024, 32, .unpacked16)
            ] {
                let layout = try VQLayout(columns: columns, dimensions: dim, codebookEntries: entries, groupSize: group, packing: packing)
                let rows = 7, nsub = columns / dim, groups = columns / group
                let codes = (0..<rows * nsub).map { UInt32(($0 * 7919 + ($0 % nsub == nsub - 1 ? entries - 1 : 0)) % entries) }
                let book = (0..<entries * dim).map { Float16(Float(($0 * 37) % 1021 - 510) / 509) }
                let scales = (0..<rows * groups).map { Float16(Float(($0 * 11) % 97) / 37 - 1) }
                var bytes = [UInt8](repeating: 0, count: rows * layout.codeRowBytes)
                for row in 0..<rows {
                    for j in 0..<nsub {
                        let bits = packing == .unpacked8 ? 8 : packing == .unpacked16 ? 16 : layout.bits
                        let bit = j * bits
                        for b in 0..<bits where (codes[row * nsub + j] >> b) & 1 != 0 {
                            bytes[row * layout.codeRowBytes + (bit + b) / 8] |= 1 << ((bit + b) % 8)
                        }
                    }
                }
                let dtype: DType = packing == .words32 ? .uint32 : packing == .unpacked16 ? .uint16 : .uint8
                let packed = MLXArray(bytes).view(dtype: dtype).reshaped([rows, layout.codeRowBytes / dtype.size])
                let cb = MLXArray(book.map(Float.init)).asType(.float16).reshaped([entries, dim])
                let sc = MLXArray(scales.map(Float.init)).asType(.float16).reshaped([rows, groups])
                let output = try VQDecode.rows(codes: packed, codebook: cb, scales: sc, layout: layout)
                let expected = (0..<rows * columns).map { i -> UInt16 in
                    let row = i / columns, col = i % columns
                    return Float16(Float(book[Int(codes[row * nsub + col / dim]) * dim + col % dim])
                        * Float(scales[row * groups + col / group])).bitPattern
                }
                c.equal("\(packing.rawValue) D\(dim) K\(entries) C\(columns) exact half bits",
                    output.reshaped([-1]).view(dtype: .uint16).asArray(UInt16.self), expected)
                do {
                    _ = try VQDecode.rows(codes: packed, codebook: cb, scales: sc.asType(.bfloat16), layout: layout)
                    c.expect("wrong scale dtype refused", false)
                } catch { c.expect("wrong scale dtype refused", true) }
            }
            // Real pinned MLX operation support. Synthetic values and timings
            // are not model quality or application-throughput evidence.
            for bits in [4, 3, 2] {
                let dense = sin(MLXArray(0..<(10 * 640 * 2560)).asType(.float32) / 101).reshaped([10, 640, 2560]).asType(.bfloat16)
                let (w, scales, biases) = quantized(dense, groupSize: 64, bits: bits)
                let geometry = try AffineQuantization(bits: bits, groupSize: 64)
                c.equal("affine \(bits)-bit packed geometry", w.dim(-1), try geometry.packedWords(columns: 2560))
                let x = MLXArray.ones([1, 1, 1, 2560], dtype: .bfloat16)
                let indices = MLXArray(Array(0..<10).map(UInt32.init)).reshaped([1, 10])
                let result = gatherQuantizedMM(x, w, scales: scales, biases: biases, rhsIndices: indices,
                    transpose: true, groupSize: 64, bits: bits)
                eval(result)
                c.expect("affine \(bits)-bit gathered matmul finite", all(isFinite(result)).item(Bool.self))
            }
            try checkMixedDenseRecipes(&c)
            // A scalar-exact control covers every fused dispatch family and
            // the SIMD boundary. Real-row Python binding parity is a separate
            // fixture gate; these constant weights do not certify full math.
            for columns in [640, 2560] {
                for (dim, entries, packing) in [(2, 256, VQLayout.Packing.unpacked8),
                    (2, 1024, .words32), (4, 256, .words32), (4, 2048, .words32), (8, 16384, .words32)] {
                    let layout = try VQLayout(columns: columns, dimensions: dim,
                        codebookEntries: entries, groupSize: 64, packing: packing)
                    let firstKernels = try VQExpertKernels.shared(layout)
                    let otherWidth = try VQLayout(columns: columns == 640 ? 2560 : 640, dimensions: dim,
                        codebookEntries: entries, groupSize: 64, packing: packing)
                    let again = try VQExpertKernels.shared(otherWidth)
                    c.expect("code-only specialization reused across input widths",
                        firstKernels.row === again.row && firstKernels.prefill === again.prefill)
                    c.expect("SIMD code reuse preserves family admission",
                        dim == 8 ? (firstKernels.simd != nil && firstKernels.simd === again.simd) : again.simd == nil)
                    let dtype: DType = packing == .unpacked8 ? .uint8 : .uint32
                    let codes = MLXArray.zeros([1, 7, layout.codeRowBytes / dtype.size], dtype: dtype)
                    let book = MLXArray.ones([entries, dim], dtype: .float16)
                    let scales = MLXArray.full([1, 7, columns / 64], values: MLXArray(Float(1.0 / 64)), dtype: .float16)
                    let projection = try VQExpert(codes: codes, codebook: book, scales: scales, layout: layout)
                    for tokens in [1, 2, 3] {
                        let x = MLXArray.ones([tokens, columns], dtype: .bfloat16)
                        let indices = MLXArray.zeros([tokens, 10], dtype: .uint32)
                        let result = try projection.call(x, indices: indices)
                        c.expect("fused d\(dim)/k\(entries) columns\(columns) pairs\(tokens * 10) exact constant dot",
                            all(result .== Float(columns / 64)).item(Bool.self))
                    }
                    do {
                        _ = try projection.call(MLXArray.ones([1, columns], dtype: .bfloat16),
                            indices: MLXArray([UInt32(1)]).reshaped([1, 1]))
                        c.expect("fused rejects expert out of bounds", false)
                    } catch { c.expect("fused rejects expert out of bounds", true) }
                }
            }
            for layout in [
                try VQLayout(columns: 160, dimensions: 4, codebookEntries: 2048, groupSize: 32, packing: .bytes),
                try VQLayout(columns: 640, dimensions: 2, codebookEntries: 256, groupSize: 64, packing: .words32)
            ] {
                do { _ = try VQExpertKernels.shared(layout); c.expect("kernel cache rejects unadmitted specialization", false) }
                catch { c.expect("kernel cache rejects unadmitted specialization", true) }
            }
            return c.report()
        }
    }
}
