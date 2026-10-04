import CryptoKit
import Darwin
import Foundation
import Slotstream

extension Diagnostics {
    public static func quantizationTensorFile() throws -> CheckReport {
        var c = CheckBuilder("quantization-tensor-file")
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("slotstream-vq-file-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: false, attributes: [.posixPermissions: 0o700])
        defer { try? FileManager.default.removeItem(at: directory) }
        func sha(_ data: Data) -> String { SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined() }
        func fixture(_ name: String, header: [String: Any], payload: Data) throws -> (URL, VQTensorFile.Identity) {
            let header = try JSONSerialization.data(withJSONObject: header, options: [.sortedKeys])
            var length = UInt64(header.count).littleEndian
            var data = withUnsafeBytes(of: &length) { Data($0) }
            data.append(header); data.append(payload)
            let path = directory.appendingPathComponent(name)
            try data.write(to: path)
            return (path, .init(fileBytes: data.count, headerBytes: header.count, headerSHA256: sha(header), fileSHA256: sha(data)))
        }
        func rejected(_ name: String, _ action: () throws -> Void) {
            do { try action(); c.expect(name, false) } catch { c.expect(name, true) }
        }
        let payload = Data((0..<1_000_006).map { UInt8($0 % 251) })
        let header: [String: Any] = ["tensor": ["dtype": "U8", "shape": [2, 500_003], "data_offsets": [0, payload.count]]]
        let (path, identity) = try fixture("good.safetensors", header: header, payload: payload)
        var file: VQTensorFile? = try VQTensorFile(url: path, identity: identity)
        c.equal("ordinary reader keeps buffered policy", file!.uncachedRandomReads, false)
        let uncached = try VQTensorFile(url: path, identity: identity, uncachedRandomReads: true)
        c.equal("uncached policy admitted only after checked OS calls", uncached.uncachedRandomReads, true)
        c.equal("uncached bounded tail read", try uncached.read("tensor", offset: 999_998, count: 8), Data(payload.suffix(8)))
        c.equal("uncached maximum read", try uncached.read("tensor", offset: 0, count: VQTensorFile.maximumRead), Data(payload.prefix(VQTensorFile.maximumRead)))
        rejected("uncached range guard retained") { _ = try uncached.read("tensor", offset: payload.count - 1, count: 2) }
        rejected("uncached cancellation retained") { _ = try uncached.read("tensor", offset: 0, count: 1, shouldContinue: { false }) }
        c.equal("verified tensor geometry", file!.tensors["tensor"]!.shape, [2, 500_003])
        let destination = UnsafeMutableRawPointer.allocate(byteCount: payload.count, alignment: 16)
        defer { destination.deallocate() }
        let directRef = file!.tensors["tensor"]!
        try file!.readDirect(into: destination, ref: directRef, offset: 0, count: payload.count)
        c.equal("allocation-free reads span bounded syscalls exactly", Data(bytes: destination, count: payload.count), payload)
        for (offset, count) in [(-1, 1), (payload.count, 1), (payload.count - 1, 2), (0, -1), (Int.max, 1)] {
            rejected("direct tensor bounds retained") { try file!.readDirect(into: destination, ref: directRef, offset: offset, count: count) }
        }
        rejected("direct cancellation retained") {
            try file!.readDirect(into: destination, ref: directRef, offset: 0, count: 1, shouldContinue: { false })
        }
        var directChecks = 0
        rejected("direct cancellation between syscall chunks never completes") {
            try file!.readDirect(into: destination, ref: directRef, offset: 0, count: payload.count,
                shouldContinue: { directChecks += 1; return directChecks < 3 })
        }
        let (foreign, foreignIdentity) = try fixture("foreign.safetensors", header: header, payload: payload)
        let foreignOwner = try VQTensorFile(url: foreign, identity: foreignIdentity)
        rejected("foreign tensor reference cannot enter owned reads") {
            try file!.readDirect(into: destination, ref: foreignOwner.tensors["tensor"]!, offset: 0, count: 1)
        }
        c.equal("bounded tail read", try file!.read("tensor", offset: 999_998, count: 8), Data(payload.suffix(8)))
        c.equal("maximum read", try file!.read("tensor", offset: 0, count: VQTensorFile.maximumRead), Data(payload.prefix(VQTensorFile.maximumRead)))
        for (offset, count) in [(-1, 1), (0, 0), (0, 1_000_001), (payload.count, 1), (payload.count - 1, 2), (Int.max, 1)] {
            rejected("invalid tensor read refused") { _ = try file!.read("tensor", offset: offset, count: count) }
        }
        for expert in [-1, 0, 511, 512, Int.max] {
            rejected("ordinary tensor cannot admit packed row reads") { _ = try file!.readPackedRecord(expert: expert) }
        }
        rejected("ordinary tensor cannot form a packed plan") {
            _ = try VQRecordReadPlan(packed: file!, pieceBytes: [Int](repeating: 2, count: 6))
        }
        rejected("unknown tensor refused") { _ = try file!.read("absent", offset: 0, count: 1) }
        rejected("cancelled admission refused") { _ = try VQTensorFile(url: path, identity: identity, shouldContinue: { false }) }
        rejected("cancelled read refused") { _ = try file!.read("tensor", offset: 0, count: 1, shouldContinue: { false }) }
        var checks = 0
        rejected("cancelled read publishes no completed data") {
            _ = try file!.read("tensor", offset: 0, count: 16, shouldContinue: { checks += 1; return checks < 3 })
        }
        let retained: () throws -> Data = { [owned = file!] in try owned.read("tensor", offset: 0, count: 16) }
        file = nil
        c.equal("reader closure owns verified descriptor", try retained(), Data(payload.prefix(16)))
        let alternate = directory.appendingPathComponent("retained.safetensors")
        try FileManager.default.moveItem(at: path, to: alternate)
        _ = try fixture("good.safetensors", header: header, payload: Data(repeating: 255, count: payload.count))
        do {
            c.equal("path replacement cannot change owned bytes", try retained(), Data(payload.prefix(16)))
        } catch {
            c.expect("path replacement safely refuses changed descriptor metadata", true)
        }

        let (changed, changedIdentity) = try fixture("changed.safetensors", header: header, payload: payload)
        let immutable = try VQTensorFile(url: changed, identity: changedIdentity)
        let uncachedImmutable = try VQTensorFile(url: changed, identity: changedIdentity, uncachedRandomReads: true)
        let writer = try FileHandle(forWritingTo: changed)
        try writer.seek(toOffset: UInt64(changedIdentity.fileBytes - 1)); try writer.write(contentsOf: Data([255])); try writer.close()
        try FileManager.default.setAttributes([.modificationDate: Date(timeIntervalSinceNow: 1)], ofItemAtPath: changed.path)
        rejected("in-place mutation refused") { _ = try immutable.read("tensor", offset: 0, count: 1) }
        rejected("direct in-place mutation refused") {
            try immutable.readDirect(into: destination, ref: immutable.tensors["tensor"]!, offset: 0, count: 1)
        }
        rejected("borrowed descriptor refuses mutation") { _ = try immutable.checkedDescriptor() }
        rejected("uncached in-place mutation refused") { _ = try uncachedImmutable.read("tensor", offset: 0, count: 1) }
        rejected("uncached corrupt payload refused before policy publication") { _ = try VQTensorFile(url: changed, identity: changedIdentity, uncachedRandomReads: true) }
        rejected("same-size corrupt payload fails complete hash") { _ = try VQTensorFile(url: changed, identity: changedIdentity) }

        let (truncated, truncatedIdentity) = try fixture("truncated.safetensors", header: header, payload: payload)
        let beforeTruncate = try VQTensorFile(url: truncated, identity: truncatedIdentity)
        let truncator = try FileHandle(forWritingTo: truncated)
        try truncator.truncate(atOffset: 8); try truncator.close()
        rejected("truncated owned file refused") { _ = try beforeTruncate.read("tensor", offset: 0, count: 1) }
        rejected("truncated admission refused") { _ = try VQTensorFile(url: truncated, identity: truncatedIdentity) }

        let link = directory.appendingPathComponent("link.safetensors")
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: alternate)
        rejected("symlink file refused") { _ = try VQTensorFile(url: link, identity: identity) }
        let fifo = directory.appendingPathComponent("fifo.safetensors")
        guard mkfifo(fifo.path, 0o600) == 0 else { throw ModelError("cannot create bounded FIFO fixture") }
        rejected("FIFO refused without waiting for writer") { _ = try VQTensorFile(url: fifo, identity: identity) }
        rejected("directory refused") { _ = try VQTensorFile(url: directory, identity: identity) }
        rejected("wrong header hash refused") {
            _ = try VQTensorFile(url: alternate, identity: .init(fileBytes: identity.fileBytes, headerBytes: identity.headerBytes,
                headerSHA256: String(repeating: "0", count: 64), fileSHA256: identity.fileSHA256))
        }
        rejected("oversized header refused before read") {
            _ = try VQTensorFile(url: alternate, identity: .init(fileBytes: identity.fileBytes, headerBytes: 4_000_001,
                headerSHA256: identity.headerSHA256, fileSHA256: identity.fileSHA256))
        }
        let invalidEntries: [[String: Any]] = [
            ["dtype": "U8", "shape": [true], "data_offsets": [0, 1]],
            ["dtype": "U8", "shape": [-1], "data_offsets": [0, 1]],
            ["dtype": "U8", "shape": [1.5], "data_offsets": [0, 1]],
            ["dtype": "F64", "shape": [Int.max, 2], "data_offsets": [0, 1]],
            ["dtype": "bad", "shape": [1], "data_offsets": [0, 1]],
            ["dtype": "U8", "shape": [2], "data_offsets": [0, 1]],
            ["dtype": "U8", "shape": [1], "data_offsets": [1, 2]],
            ["dtype": "U8", "shape": [1], "data_offsets": [0, true]]
        ]
        for (index, entry) in invalidEntries.enumerated() {
            let (url, identity) = try fixture("invalid-\(index).safetensors", header: ["tensor": entry], payload: Data([1]))
            rejected("invalid header \(index) refused before tensor use") { _ = try VQTensorFile(url: url, identity: identity) }
        }
        let entry: [String: Any] = ["dtype": "U8", "shape": [1], "data_offsets": [0, 1]]
        let (overlap, overlapID) = try fixture("overlap.safetensors", header: ["a": entry, "b": entry], payload: Data([1]))
        rejected("overlapping tensors refused") { _ = try VQTensorFile(url: overlap, identity: overlapID) }
        let (hole, holeID) = try fixture("hole.safetensors", header: ["a": entry], payload: Data([1, 2]))
        rejected("uncovered payload refused") { _ = try VQTensorFile(url: hole, identity: holeID) }
        // Head metadata and byte reservations are checked without loading a
        // model or constructing MLX arrays. Config identity stays independent
        // of the main VQ recipe.
        let draftConfig = directory.appendingPathComponent("draft-config.json")
        try Data(repeating: 32, count: 33_408).write(to: draftConfig)
        rejected("same-size corrupt draft config refused") { _ = try VQDraftWeights.configuration(draftConfig) }
        rejected("draft config symlink refused") { _ = try VQDraftWeights.configuration(link) }
        rejected("draft config FIFO refused without waiting") { _ = try VQDraftWeights.configuration(fifo) }
        rejected("draft payload reservation must cover every array") {
            _ = try VQDraftWeights.load(baseline: directory, maximumPayloadBytes: VQDraftWeights.payloadBytes - 1)
        }
        rejected("draft current tensor needs a separate load copy") {
            _ = try VQDraftWeights.load(baseline: directory, maximumLoadCopyBytes: VQDraftWeights.largestLoadCopyBytes - 1)
        }
        return c.report()
    }
}
