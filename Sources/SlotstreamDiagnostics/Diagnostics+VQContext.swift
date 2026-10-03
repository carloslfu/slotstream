import CryptoKit
import Darwin
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func quantizationRotary(table: URL) throws -> CheckReport {
        try ModelProcessGuard.acquire()
        guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("rotary checks require 13 GB real reclaimable memory")
        }
        let oldCache = MLX.Memory.cacheLimit
        MLX.Memory.cacheLimit = 16_000_000
        defer { Stream.gpu.synchronize(); MLX.Memory.clearCache(); MLX.Memory.cacheLimit = oldCache }
        var c = CheckBuilder("quantization-extended-rotary")
        let coefficients = try VQRotaryCoefficients(url: table)
        func digest(_ value: MLXArray) -> String {
            eval(value)
            return SHA256.hash(data: value.asData(access: .copy).data).map { String(format: "%02x", $0) }.joined()
        }
        let full = coefficients.angles(MLXArray(0..<VQRotaryCoefficients.rows).asType(.int32).reshaped([1, -1]))
        c.equal("all reference cosine coefficients", digest(full.0), "546b64f8e1800f128ccc02056430c0eca4e540a84591531d42ee05a7b7d09b27")
        c.equal("all reference sine coefficients", digest(full.1), "d3f305e44f0a0abd5c54b6c7096a59544c5b30b9e59f6680de1d90459c2e3f8c")
        let prefix = MLXArray(0..<VQRotaryTable.rows).asType(.int32).reshaped([1, -1])
        let old = VQRotaryTable.angles(prefix), extended = coefficients.angles(prefix)
        c.equal("every existing cosine bit", digest(old.0), digest(extended.0))
        c.equal("every existing sine bit", digest(old.1), digest(extended.1))
        let positions: [Int32] = [262143, 32768, 0, 2053, 8192, 131071]
        let picked = coefficients.angles(MLXArray(positions, [2, 3]))
        c.equal("noncontiguous positions and batch shape", digest(picked.0), digest(full.0[0][MLXArray(positions)].reshaped([2, 3, 64])))
        c.equal("noncontiguous sine positions", digest(picked.1), digest(full.1[0][MLXArray(positions)].reshaped([2, 3, 64])))
        for bad: [Int32] in [[], [-1], [262144], [0, -1], [Int32.max]] {
            c.expect("refuse invalid positions \(bad)", !VQRotaryCoefficients.supports(bad))
        }
        func refused(_ name: String, _ url: URL, cancel: (() -> Bool)? = nil) {
            do { _ = try VQRotaryCoefficients(url: url, shouldContinue: cancel ?? { true }); c.expect(name, false) }
            catch { c.expect(name, true) }
        }
        let temporary = FileManager.default.temporaryDirectory.appendingPathComponent("slotstream-rotary-check-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: temporary, withIntermediateDirectories: false)
        defer { try? FileManager.default.removeItem(at: temporary) }
        let linked = temporary.appendingPathComponent("linked")
        try FileManager.default.createSymbolicLink(at: linked, withDestinationURL: table)
        refused("symlink refused", linked)
        refused("directory refused", temporary)
        refused("missing file refused", temporary.appendingPathComponent("missing"))
        let short = temporary.appendingPathComponent("short")
        try Data([0]).write(to: short)
        refused("truncated component refused", short)
        let corrupt = temporary.appendingPathComponent("corrupt")
        let fd = open(corrupt.path, O_WRONLY | O_CREAT | O_EXCL | O_CLOEXEC, 0o600)
        guard fd >= 0 else { throw ModelError("cannot create owned rotary fault fixture") }
        let resized = ftruncate(fd, off_t(VQRotaryCoefficients.payloadBytes)); close(fd)
        guard resized == 0 else { throw ModelError("cannot size owned rotary fault fixture") }
        refused("complete wrong digest refused", corrupt)
        refused("early cancellation refused", table, cancel: { false })
        var polls = 0
        refused("mid-read cancellation refused", table, cancel: { polls += 1; return polls < 12 })
        c.expect("cancellation reached an active read", polls >= 12)
        c.equal("refused loads preserve owned coefficients", digest(coefficients.angles(prefix).0), digest(old.0))
        c.expect("coefficient checks fit two GB", ProcessMemory.peakResidentBytes() <= 2_000_000_000)
        return c.report()
    }

    public static func quantizationContext(source: URL, inventory: URL, baseline: URL,
        composite: URL, table: URL, limit: Int, output: URL) throws -> Data {
        guard [4096, 8192, 32768].contains(limit),
              !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("candidate context check needs a staged window, new output and no ambient overrides") }
        try ModelProcessGuard.acquire()
        guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("candidate context check requires 13 GB real reclaimable memory")
        }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false)
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000; MLX.Memory.memoryLimit = min(oldLimit, 9_000_000_000)
        defer { Stream.gpu.synchronize(); MLX.Memory.clearCache(); MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit }
        let checkpoint = try VQCheckpoint(directory: source, inventory: inventory,
            denseOverlayBaseline: baseline, denseOverlayManifest: composite)
        let coefficients = try VQRotaryCoefficients(url: table)
        let model = VQModelProbe(checkpoint, verificationArithmetic: true)
        try model.enableResidentText()
        try model.enableResidentRecords(wide: true, parallelReads: true)
        try model.enableExtendedContext(coefficients, limit: limit)
        try model.enableOriginalDraft(baseline: baseline)
        var c = CheckBuilder("quantization-context-\(limit)")
        var observations: [[String: Any]] = []
        func hashes(_ extra: VQModelProbe.Output? = nil) -> [String: String] {
            var values = model.diagnosticTensors()
            if let extra { values["logits"] = extra.logits; values["multi"] = extra.multi }
            return values.mapValues { value in
                eval(value)
                return "\(value.dtype):\(value.shape):" + SHA256.hash(data: value.asData(access: .copy).data).map { String(format: "%02x", $0) }.joined()
            }
        }
        func exact(_ name: String, _ a: [String: String], _ b: [String: String]) {
            c.equal(name + " fields", Set(a.keys), Set(b.keys))
            for key in a.keys.sorted() { c.equal(name + " " + key, a[key], b[key]) }
        }
        func receipt(_ failure: String? = nil) throws -> Data {
            var value: [String: Any] = ["schema": 1, "qualification": "unproven", "context_limit": limit,
                "scope": "native staged context, exact continuation and draft recovery; no held-out quality or speed qualification",
                "inventory_sha256": checkpoint.inventorySHA256, "composite_sha256": checkpoint.compositeSHA256 ?? "",
                "rotary_sha256": VQRotaryCoefficients.sha256, "draft_sha256": VQDraftWeights.fileSHA256,
                "report": try JSONSerialization.jsonObject(with: JSONEncoder().encode(c.report())),
                "observations": observations, "peak_process_bytes": ProcessMemory.peakResidentBytes(),
                "process_bound_bytes": model.processByteLimit, "minimum_headroom_bytes": 3_000_000_000]
            value["failure"] = failure
            let data = try JSONSerialization.data(withJSONObject: value, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        do {
            try withError {
                let prompt = (0..<(limit - 8)).map { 100 + ($0 * 17 % 1000) }
                var pending = 0
                for start in stride(from: 0, to: prompt.count, by: 512) {
                    let tokens = Array(prompt[start..<min(start + 512, prompt.count)])
                    let result = try model.forward(tokens, observe: { _, _, _ in }, inspectState: false)
                    pending = argMax(result.logits[0, tokens.count - 1]).item(Int.self)
                    c.equal("prefill boundary \(start)", model.consumedTokens, start + tokens.count)
                    c.expect("draft aligned after prefill \(start)", model.hasCommittedBoundary)
                    observations.append(["consumed": model.consumedTokens, "peak_process_bytes": ProcessMemory.peakResidentBytes()])
                }
                let base = try model.snapshot(), baseBits = hashes()
                let proposals = try model.proposeDraft(pending: pending, count: 2)
                try model.restore(base)
                exact("draft discard at long context", baseBits, hashes())
                let tokens = [pending] + proposals
                let direct = try model.forward(Array(tokens.prefix(2)), observe: { _, _, _ in }, inspectState: false)
                let directBits = hashes(direct)
                let continued = try model.forward([tokens[2]], observe: { _, _, _ in }, inspectState: false)
                let continuation = hashes(continued)
                try model.restore(base)
                let sameProposals = try model.proposeDraft(pending: pending, count: 2)
                c.equal("draft proposals survive exact restore", proposals, sameProposals)
                try model.beginRecording()
                let recorded = try model.forward(tokens, observe: { _, _, _ in }, inspectState: false)
                let keptLogits = recorded.logits[0..., 0..<2, 0...]
                eval(keptLogits)
                let keptDigest = SHA256.hash(data: keptLogits.asData(access: .copy).data).map { String(format: "%02x", $0) }.joined()
                c.equal("kept target logits at long context",
                    "\(keptLogits.dtype):\(keptLogits.shape):" + keptDigest, directBits["logits"])
                try model.rollbackRecorded(keeping: 2, of: tokens, from: base)
                exact("long-context target and head rollback", directBits.filter { $0.key != "logits" && $0.key != "multi" }, hashes())
                let next = try model.forward([tokens[2]], observe: { _, _, _ in }, inspectState: false)
                exact("long-context continuation", continuation, hashes(next))
                try model.forward([107, 108, 109, 110, 111], observe: { _, _, _ in }, inspectState: false)
                c.equal("complete context consumed", model.consumedTokens, limit)
                let full = hashes()
                do { try model.forward([112], observe: { _, _, _ in }, inspectState: false); c.expect("over-limit refused", false) }
                catch { c.expect("over-limit refused", true) }
                exact("over-limit does not mutate state", full, hashes())
                c.expect("final target and head committed", model.hasCommittedBoundary)
                c.equal("no leaked expert pins", model.recordCacheStats?["pinned_records"], 0)
                c.expect("context fits process envelope", ProcessMemory.peakResidentBytes() <= model.processByteLimit)
            }
            let data = try receipt()
            guard c.report().passed else { throw ModelError("native candidate context parity failed") }
            return data
        } catch { _ = try receipt(String(describing: error)); throw error }
    }
}
