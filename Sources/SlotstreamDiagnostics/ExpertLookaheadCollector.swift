// Expert Lookahead collector: the versioned shard writer behind the
// `expert-lookahead-capture` diagnostic.
//
// One binary shard per request (rotated at 256 MiB of payload), a running
// SHA-256 over every byte written, and a JSON line per completed request in
// `requests.jsonl`. Feature bits are written losslessly as little-endian
// uint16 BF16; nothing is cast. The writer owns CPU buffers only and never
// retains an MLX array past the callback that handed it over.
//
// Shard format (all integers little-endian):
//   magic "XLA1", u32 version, u32 headerLength, header JSON, then records
//   record: u32 kind, u32 length, payload
//   kinds: see `ExpertLookaheadRecordKind`.

import CryptoKit
import Foundation
import MLX
import Slotstream

public enum ExpertLookaheadRecordKind: UInt32 {
    case passBegin = 1
    case feature = 2
    case routes = 3
    case layerDone = 4
    case demand = 5
    case admissions = 6
    case residency = 7
    case reconciled = 8
    case passEnd = 9
    /// Version 2: router-reuse forecast (source layer, target layer, rows,
    /// candidates per row, optional input width, ids, margins, inputs).
    case forecast = 10
}

public struct ExpertLookaheadShardSummary: Codable, Equatable {
    public var path: String
    public var bytes: Int
    public var sha256: String
    public var records: Int
}

public struct ExpertLookaheadRequestSummary: Codable, Equatable {
    public var passes = 0
    public var verifyPasses = 0
    public var plainPasses = 0
    public var prefillPasses = 0
    public var features = 0
    public var routeRecords = 0
    public var layerRecords = 0
    public var x2Bytes = 0
    public var featureBytes = 0
    public var demandEvents = 0
    public var admissionEvents = 0
    public var residencySnapshots = 0
    public var abortedPasses = 0
    public var forecastRecords = 0
    public var forecastBytes = 0
    public var writeSeconds = 0.0
    public var copySeconds = 0.0
    public var totalBytes = 0
    public var shards: [ExpertLookaheadShardSummary] = []
    public var schemaViolation: String?
    public init() {}
}

/// Serialized, append-only writer with a running digest. `FILE*` buffering
/// keeps the model thread from waiting on every small record; a shard is
/// closed at the request boundary with an explicit flush and fsync.
final class ExpertLookaheadShardWriter {
    static let payloadLimit = 256 << 20
    /// Format version 2 adds record kind 10; readers accept 1 and 2.
    static let formatVersion: UInt32 = 2
    let url: URL
    private var file: UnsafeMutablePointer<FILE>?
    private var digest = SHA256()
    private(set) var bytes = 0
    private(set) var records = 0
    private(set) var payloadBytes = 0
    private(set) var failure: String?

    init(url: URL, header: Data) throws {
        self.url = url
        guard let f = fopen(url.path, "wb") else {
            throw ModelError("cannot create shard \(url.path): \(String(cString: strerror(errno)))")
        }
        file = f
        setvbuf(f, nil, _IOFBF, 8 << 20)
        var prefix = Data("XLA1".utf8)
        prefix.append(le32(ExpertLookaheadShardWriter.formatVersion))
        prefix.append(le32(UInt32(header.count)))
        prefix.append(header)
        write(prefix)
    }

    var full: Bool { payloadBytes >= Self.payloadLimit }

    func record(_ kind: ExpertLookaheadRecordKind, _ payload: Data) {
        guard failure == nil else { return }
        var frame = Data(capacity: payload.count + 8)
        frame.append(le32(kind.rawValue))
        frame.append(le32(UInt32(payload.count)))
        frame.append(payload)
        write(frame)
        records += 1
        payloadBytes += payload.count
    }

    private func write(_ data: Data) {
        guard let file, failure == nil else { return }
        let written = data.withUnsafeBytes { fwrite($0.baseAddress, 1, data.count, file) }
        if written != data.count {
            failure = "short write to \(url.lastPathComponent): \(String(cString: strerror(errno)))"
            return
        }
        digest.update(data: data)
        bytes += data.count
    }

    func close() throws -> ExpertLookaheadShardSummary {
        guard let f = file else { throw ModelError("shard already closed") }
        file = nil
        if fflush(f) != 0 { failure = failure ?? "flush failed: \(String(cString: strerror(errno)))" }
        if fsync(fileno(f)) != 0 { failure = failure ?? "fsync failed: \(String(cString: strerror(errno)))" }
        fclose(f)
        if let failure { throw ModelError(failure) }
        let hex = digest.finalize().map { String(format: "%02x", $0) }.joined()
        return ExpertLookaheadShardSummary(path: url.lastPathComponent, bytes: bytes, sha256: hex, records: records)
    }
}

@inline(__always) func le32(_ v: UInt32) -> Data { withUnsafeBytes(of: v.littleEndian) { Data($0) } }
@inline(__always) func le64(_ v: UInt64) -> Data { withUnsafeBytes(of: v.littleEndian) { Data($0) } }
@inline(__always) func lei32(_ v: Int32) -> Data { withUnsafeBytes(of: v.littleEndian) { Data($0) } }

extension Data {
    mutating func appendInt32s(_ values: [Int32]) {
        append(le32(UInt32(values.count)))
        values.withUnsafeBufferPointer { buffer in
            // Little-endian host: append the raw bytes directly.
            append(UnsafeRawBufferPointer(buffer).bindMemory(to: UInt8.self))
        }
    }
    mutating func appendUInt16s(_ values: [UInt16]) {
        values.withUnsafeBufferPointer { buffer in
            append(UnsafeRawBufferPointer(buffer).bindMemory(to: UInt8.self))
        }
    }
}

/// The observer. Every method runs on the model thread; the collector copies
/// what it needs to owned CPU memory and returns.
package final class ExpertLookaheadCollector: ExpertLookaheadObserver {
    public let directory: URL
    public let captureX2: Bool
    public let captureFeatures: Bool
    private let header: Data
    private var writer: ExpertLookaheadShardWriter?
    private var requestId: String?
    private var shardIndex = 0
    private var summary = ExpertLookaheadRequestSummary()
    private var phases: [Int: ExpertLookaheadPhase] = [:]
    private var expectedRows: [Int: Int] = [:]
    public private(set) var requestsCompleted = 0
    public private(set) var lifetimeBytes = 0
    private var violation: String?

    package init(directory: URL, header: [String: Any], captureX2: Bool, captureFeatures: Bool) throws {
        self.directory = directory
        self.captureX2 = captureX2
        self.captureFeatures = captureFeatures
        try FileManager.default.createDirectory(at: directory.appendingPathComponent("shards"),
            withIntermediateDirectories: true)
        self.header = try JSONSerialization.data(withJSONObject: header, options: [.sortedKeys])
    }

    // MARK: request lifecycle (called by the capture command)

    package func beginRequest(id: String) throws {
        guard writer == nil, requestId == nil else { throw ModelError("collector already has an open request") }
        requestId = id
        shardIndex = 0
        summary = ExpertLookaheadRequestSummary()
        phases.removeAll(); expectedRows.removeAll()
        violation = nil
        try openShard()
    }

    private func openShard() throws {
        guard let requestId else { return }
        let name = shardIndex == 0 ? "\(requestId).bin" : "\(requestId).\(shardIndex).bin"
        writer = try ExpertLookaheadShardWriter(url: directory.appendingPathComponent("shards/\(name)"), header: header)
        shardIndex += 1
    }

    private func rotateIfNeeded() {
        guard let writer, writer.full else { return }
        do {
            let closed = try writer.close()
            summary.shards.append(closed)
            summary.totalBytes += closed.bytes
            self.writer = nil
            try openShard()
        } catch { violation = violation ?? "shard rotation failed: \(error)" }
    }

    package func endRequest() throws -> ExpertLookaheadRequestSummary {
        guard let writer else { throw ModelError("collector has no open request") }
        let closed = try writer.close()
        summary.shards.append(closed)
        summary.totalBytes += closed.bytes
        summary.schemaViolation = violation
        lifetimeBytes += summary.totalBytes
        self.writer = nil
        requestId = nil
        requestsCompleted += 1
        return summary
    }

    package var currentViolation: String? { violation }

    private func emit(_ kind: ExpertLookaheadRecordKind, _ payload: Data) {
        guard let writer else { return }
        let start = RuntimeClock.now()
        writer.record(kind, payload)
        summary.writeSeconds += RuntimeClock.seconds(since: start)
        if let failure = writer.failure { violation = violation ?? failure }
        rotateIfNeeded()
    }

    /// BF16 bits, losslessly. A non-BF16 array is a schema violation, never
    /// a silent cast.
    private func bf16Bits(_ array: MLXArray, expectedCount: Int?, what: String) -> [UInt16]? {
        guard array.dtype == .bfloat16 else {
            violation = violation ?? "\(what) is \(array.dtype), expected bfloat16"
            return nil
        }
        let start = RuntimeClock.now()
        let data = array.asData(access: .copy)
        summary.copySeconds += RuntimeClock.seconds(since: start)
        let count = data.data.count / 2
        if let expectedCount, count != expectedCount {
            violation = violation ?? "\(what) has \(count) values, expected \(expectedCount)"
            return nil
        }
        return data.data.withUnsafeBytes { Array($0.bindMemory(to: UInt16.self)) }
    }

    // MARK: ExpertLookaheadObserver

    package func beginPass(id: Int, phase: ExpertLookaheadPhase, tokens: [Int], features: [ExpertLookaheadStartFeature], nanos: UInt64) {
        phases[id] = phase
        expectedRows[id] = tokens.count
        summary.passes += 1
        switch phase {
        case .prefill: summary.prefillPasses += 1
        case .mainVerify: summary.verifyPasses += 1
        case .mainPlain: summary.plainPasses += 1
        }
        var payload = Data()
        payload.append(le32(UInt32(id)))
        payload.append(phase == .prefill ? 0 : phase == .mainVerify ? 1 : 2)
        payload.append(UInt8(min(features.count, 255)))
        payload.append(contentsOf: withUnsafeBytes(of: UInt16(min(tokens.count, Int(UInt16.max))).littleEndian) { Array($0) })
        payload.append(le64(nanos))
        payload.appendInt32s(tokens.map { Int32(clamping: $0) })
        emit(.passBegin, payload)
        guard captureFeatures, phase == .mainVerify else { return }
        for feature in features {
            guard let context = bf16Bits(feature.context, expectedCount: nil, what: "pass \(id) position \(feature.kind) context"),
                  let embedding = bf16Bits(feature.embedding, expectedCount: nil, what: "pass \(id) position \(feature.kind) embedding")
            else { return }
            var f = Data(capacity: 20 + 2 * (context.count + embedding.count))
            f.append(le32(UInt32(id)))
            f.append(le32(UInt32(feature.kind)))
            f.append(lei32(Int32(clamping: feature.token)))
            f.append(le32(UInt32(context.count)))
            f.append(le32(UInt32(embedding.count)))
            f.appendUInt16s(context)
            f.appendUInt16s(embedding)
            summary.features += 1
            summary.featureBytes += 2 * (context.count + embedding.count)
            emit(.feature, f)
        }
    }

    package func routes(pass: Int, layer: Int, rows: Int, topK: Int, ids: [Int32]) {
        var payload = Data(capacity: 16 + 2 * ids.count)
        payload.append(le32(UInt32(pass)))
        payload.append(le32(UInt32(layer)))
        payload.append(le32(UInt32(rows)))
        payload.append(le32(UInt32(topK)))
        payload.appendUInt16s(ids.map { UInt16(clamping: $0) })
        summary.routeRecords += 1
        emit(.routes, payload)
    }

    package func layerCompleted(pass: Int, layer: Int, x2: MLXArray, nanos: UInt64) {
        let phase = phases[pass]
        let wantsX2 = captureX2 && phase == .mainVerify
        var bits: [UInt16] = []
        var rows = 0, width = 0
        if wantsX2 {
            guard x2.ndim == 3, x2.dim(0) == 1 else {
                violation = violation ?? "pass \(pass) layer \(layer) x2 has shape \(x2.shape)"
                return
            }
            rows = x2.dim(1); width = x2.dim(2)
            guard let copied = bf16Bits(x2, expectedCount: rows * width, what: "pass \(pass) layer \(layer) x2") else { return }
            bits = copied
        }
        var payload = Data(capacity: 24 + 2 * bits.count)
        payload.append(le32(UInt32(pass)))
        payload.append(le32(UInt32(layer)))
        payload.append(le64(nanos))
        payload.append(le32(UInt32(rows)))
        payload.append(le32(UInt32(width)))
        payload.appendUInt16s(bits)
        summary.layerRecords += 1
        summary.x2Bytes += 2 * bits.count
        emit(.layerDone, payload)
    }

    package func demand(_ event: ExpertLookaheadDemandEvent) {
        var payload = Data()
        payload.append(le32(UInt32(bitPattern: Int32(clamping: event.pass))))
        payload.append(lei32(Int32(clamping: event.layer)))
        payload.append(event.mixedLayers ? 1 : 0)
        payload.append(contentsOf: [0, 0, 0])
        payload.append(le64(event.startNanos))
        payload.append(le64(event.readNanos))
        payload.append(le64(event.adoptNanos))
        payload.append(le64(event.endNanos))
        payload.appendInt32s(event.uniqueExperts)
        payload.appendInt32s(event.hitExperts)
        payload.appendInt32s(event.missExperts)
        payload.appendInt32s(event.victimSlots)
        payload.appendInt32s(event.adoptedExperts)
        payload.appendInt32s(event.promotedExperts)
        summary.demandEvents += 1
        emit(.demand, payload)
    }

    package func admissions(pass: Int, layer: Int, experts: [Int32]) {
        var payload = Data()
        payload.append(le32(UInt32(bitPattern: Int32(clamping: pass))))
        payload.append(le32(UInt32(layer)))
        payload.appendInt32s(experts)
        summary.admissionEvents += 1
        emit(.admissions, payload)
    }

    package func residency(_ snapshot: ExpertLookaheadResidency, afterPass: Int) {
        var payload = Data()
        payload.append(le32(UInt32(bitPattern: Int32(clamping: afterPass))))
        payload.appendInt32s(snapshot.slotKeys)
        payload.append(le32(UInt32(snapshot.referenceBits.count)))
        payload.append(contentsOf: snapshot.referenceBits.map { $0 ? UInt8(1) : UInt8(0) })
        payload.append(lei32(Int32(clamping: snapshot.hand)))
        summary.residencySnapshots += 1
        emit(.residency, payload)
    }

    package func passReconciled(id: Int, kept: Int) {
        var payload = Data()
        payload.append(le32(UInt32(id)))
        payload.append(le32(UInt32(kept)))
        emit(.reconciled, payload)
    }

    package func forecast(pass: Int, sourceLayer: Int, targetLayer: Int, rows: Int, ids: [Int32], margins: [Float], inputs: MLXArray?) {
        guard phases[pass] == .mainVerify else { return }
        var inputBits: [UInt16] = []
        var width = 0
        if let inputs {
            guard inputs.ndim == 3, inputs.dim(0) == 1, inputs.dim(1) == rows else {
                violation = violation ?? "pass \(pass) forecast \(sourceLayer)->\(targetLayer) inputs have shape \(inputs.shape)"
                return
            }
            width = inputs.dim(2)
            guard let copied = bf16Bits(inputs, expectedCount: rows * width, what: "pass \(pass) forecast inputs") else { return }
            inputBits = copied
        }
        let perRow = rows > 0 ? ids.count / rows : 0
        guard ids.count == margins.count, perRow * rows == ids.count else {
            violation = violation ?? "pass \(pass) forecast \(sourceLayer)->\(targetLayer) has \(ids.count) ids, \(margins.count) margins for \(rows) rows"
            return
        }
        var payload = Data(capacity: 24 + 2 * ids.count + 4 * margins.count + 2 * inputBits.count)
        payload.append(le32(UInt32(pass)))
        payload.append(le32(UInt32(sourceLayer)))
        payload.append(le32(UInt32(targetLayer)))
        payload.append(le32(UInt32(rows)))
        payload.append(le32(UInt32(perRow)))
        payload.append(le32(UInt32(width)))
        payload.appendUInt16s(ids.map { UInt16(clamping: $0) })
        margins.withUnsafeBufferPointer { payload.append(UnsafeRawBufferPointer($0).bindMemory(to: UInt8.self)) }
        payload.appendUInt16s(inputBits)
        summary.forecastRecords += 1
        summary.forecastBytes += payload.count
        emit(.forecast, payload)
    }

    package func endPass(id: Int, nanos: UInt64, aborted: Bool) {
        if aborted { summary.abortedPasses += 1 }
        var payload = Data()
        payload.append(le32(UInt32(id)))
        payload.append(le64(nanos))
        payload.append(aborted ? 1 : 0)
        emit(.passEnd, payload)
        phases.removeValue(forKey: id)
        expectedRows.removeValue(forKey: id)
    }
}
