// Learned correction of the attention tap's forecast logits (Expert Lookahead).
//
// `RouterForecastTap.attentionCorrected` reads the same streams as the
// attention tap and adds, for target layer T, a low-rank linear map of the
// target's mixed router input fitted offline on training requests
// (Tools/expert_lookahead_learned.py):
//
//     logits + ((mixed - mu[T]) a[T]) b[T] + delta[T]
//
// It moves forecast logits only; routing, expert computation and outputs are
// untouched. The factors are FP16 and stay resident; the wide product runs in
// FP16 and the narrow one in FP32.

import CryptoKit
import Foundation
import MLX

package final class RouterTapCorrection {
    package static let schema = "slotstream-tap-correction-v1"

    /// What a correction file declares, read from its safetensors header
    /// without loading any tensor.
    package struct Header: Equatable {
        package var targets: Int
        package var firstTarget: Int
        package var hidden: Int
        package var rank: Int
        package var experts: Int
        package var fileBytes: Int
        /// The tap the file was fitted on: `attention` or `attentionReadout`.
        package var tap: RouterForecastTap = .attention
    }

    /// The corrected tap this file serves.
    package var correctedTap: RouterForecastTap { header.tap == .attentionReadout ? .attentionReadoutCorrected : .attentionCorrected }

    package let identity: String
    package let header: Header
    package let residentBytes: Int
    private let a: MLXArray
    private let b: MLXArray
    private let mu: MLXArray
    private let delta: MLXArray

    /// Checks the header: schema, the tap it was fitted on, tensor dtypes and
    /// mutually consistent shapes. Geometry against a model is checked at load.
    package static func readHeader(path: String) throws -> Header {
        guard let handle = FileHandle(forReadingAtPath: path) else {
            throw ModelError("tap correction is not readable: \(path)")
        }
        defer { try? handle.close() }
        let prefix = handle.readData(ofLength: 8)
        guard prefix.count == 8 else { throw ModelError("tap correction is not a safetensors file: \(path)") }
        let length = prefix.withUnsafeBytes { UInt64(littleEndian: $0.loadUnaligned(as: UInt64.self)) }
        guard length > 0, length < 1 << 24 else { throw ModelError("tap correction header length is invalid: \(path)") }
        let json = handle.readData(ofLength: Int(length))
        guard json.count == Int(length), let object = try? JSONSerialization.jsonObject(with: json) as? [String: Any] else {
            throw ModelError("tap correction header is not JSON: \(path)")
        }
        let metadata = object["__metadata__"] as? [String: String] ?? [:]
        guard metadata["schema"] == schema else { throw ModelError("tap correction schema must be \(schema): \(path)") }
        guard let fitted = RouterForecastTap(rawValue: metadata["tap"] ?? ""), fitted == .attention || fitted == .attentionReadout else {
            throw ModelError("tap correction must be fitted on the attention or attention-readout tap: \(path)")
        }
        func shape(_ name: String, _ dtype: String) throws -> [Int] {
            guard let entry = object[name] as? [String: Any], entry["dtype"] as? String == dtype,
                  let dims = entry["shape"] as? [Int] else {
                throw ModelError("tap correction needs tensor \(name) as \(dtype): \(path)")
            }
            return dims
        }
        let a = try shape("a", "F16"), b = try shape("b", "F16")
        let mu = try shape("mu", "F32"), delta = try shape("delta", "F32"), targets = try shape("targets", "I32")
        guard a.count == 3, b.count == 3, mu.count == 2, delta.count == 2, targets.count == 1, a[0] > 0, a[2] > 0,
              b[0] == a[0], mu[0] == a[0], delta[0] == a[0], targets[0] == a[0],
              b[1] == a[2], mu[1] == a[1], delta[1] == b[2] else {
            throw ModelError("tap correction tensor shapes are inconsistent: \(path)")
        }
        guard let first = Int(metadata["first_target"] ?? ""), first >= 1 else {
            throw ModelError("tap correction must declare first_target: \(path)")
        }
        let bytes = ((try? FileManager.default.attributesOfItem(atPath: path))?[.size] as? NSNumber)?.intValue ?? 0
        return Header(targets: a[0], firstTarget: first, hidden: a[1], rank: a[2], experts: b[2], fileBytes: bytes, tap: fitted)
    }

    /// Loads a correction for a model with `experts` experts whose forecast
    /// targets are 1...`targets`; `hidden`, when given, must match the router
    /// input width.
    package init(path: String, hidden: Int?, experts: Int, targets: Int) throws {
        let header = try Self.readHeader(path: path)
        guard header.experts == experts, header.firstTarget == 1, header.targets == targets,
              hidden == nil || header.hidden == hidden else {
            throw ModelError("tap correction geometry (targets \(header.firstTarget)...\(header.firstTarget + header.targets - 1), "
                + "hidden \(header.hidden), experts \(header.experts)) does not match the model (targets 1...\(targets), "
                + "hidden \(hidden.map(String.init) ?? "any"), experts \(experts)): \(path)")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let arrays = try loadArrays(data: data)
        guard let a = arrays["a"], let b = arrays["b"], let mu = arrays["mu"], let delta = arrays["delta"],
              let declared = arrays["targets"] else {
            throw ModelError("tap correction is missing a tensor: \(path)")
        }
        guard declared.asArray(Int32.self) == (1 ... targets).map(Int32.init) else {
            throw ModelError("tap correction targets must run 1...\(targets): \(path)")
        }
        eval(a, b, mu, delta)
        guard isFinite(a).all().item(Bool.self), isFinite(b).all().item(Bool.self),
              isFinite(mu).all().item(Bool.self), isFinite(delta).all().item(Bool.self) else {
            throw ModelError("tap correction is not finite: \(path)")
        }
        self.identity = SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
        self.header = header
        self.a = a
        self.b = b
        self.mu = mu
        self.delta = delta
        self.residentBytes = Self.bytes(a: a, b: b, mu: mu, delta: delta)
    }

    /// An in-memory correction (checks): `a` [targets, hidden, rank],
    /// `b` [targets, rank, experts], `mu` [targets, hidden], `delta` [targets, experts].
    package init(a: MLXArray, b: MLXArray, mu: MLXArray, delta: MLXArray) {
        let a16 = a.asType(.float16), b16 = b.asType(.float16), mu32 = mu.asType(.float32), delta32 = delta.asType(.float32)
        eval(a16, b16, mu32, delta32)
        self.identity = "in-memory"
        self.header = Header(targets: a.dim(0), firstTarget: 1, hidden: a.dim(1), rank: a.dim(2), experts: b.dim(2), fileBytes: 0)
        self.a = a16
        self.b = b16
        self.mu = mu32
        self.delta = delta32
        self.residentBytes = Self.bytes(a: a16, b: b16, mu: mu32, delta: delta32)
    }

    private static func bytes(a: MLXArray, b: MLXArray, mu: MLXArray, delta: MLXArray) -> Int {
        (a.size + b.size) * 2 + (mu.size + delta.size) * 4
    }

    package func covers(target: Int) -> Bool {
        target >= header.firstTarget && target < header.firstTarget + header.targets
    }

    /// The corrected logits [..., experts] of target `t` from its mixed router
    /// input `mixed` [..., hidden] and the tap's own `logits`. Lazy.
    package func apply(target t: Int, mixed: MLXArray, logits: MLXArray) -> MLXArray {
        let i = t - header.firstTarget
        let centered = (mixed.asType(.float32) - mu[i]).asType(.float16)
        let narrow = matmul(centered, a[i]).asType(.float32)
        let correction = matmul(narrow, b[i].asType(.float32)) + delta[i]
        return logits + correction.asType(logits.dtype)
    }
}

extension RouterTapCorrection {
    /// Where a checkpoint's shipped correction lives, relative to the model
    /// directory: an optional pinned file next to the weights, like the draft
    /// head, so `pull` fetches and verifies it when the revision carries it.
    package static let shippedRelativePath = "lookahead/tap-correction-attention-rank128-v1.safetensors"
    /// The file the held-out confirmation measured (learned confirmation,
    /// 2026-09-15): the rank-128 attention-tap correction for the pinned
    /// checkpoint, 37,540,708 bytes. A file at the shipped path with another
    /// digest is not the measured correction and does not select the default.
    package static let shippedSHA256 = "37b00d3a32d1e1889a1794bbb8e97905a157a77c0508db620c1a11f2a895f7f5"

    /// A correction found next to the weights: its path, header and whole-file
    /// digest (the loader's identity).
    package struct Located: Equatable {
        package var path: String
        package var header: Header
        package var sha256: String
    }

    /// Finds the shipped correction under `modelDirectory`. It qualifies only
    /// when the file is present, its header serves the corrected attention tap
    /// and its digest equals `pinnedSHA256` (nil skips the digest, for tests
    /// and unpinned checkpoints). The reason says why nothing qualified.
    package static func locate(modelDirectory: URL, pinnedSHA256: String? = shippedSHA256) -> (located: Located?, reason: String) {
        let url = modelDirectory.appendingPathComponent(shippedRelativePath)
        guard FileManager.default.fileExists(atPath: url.path) else {
            return (nil, "no correction at \(shippedRelativePath); `slotstream pull` downloads it (37.5 MB) for the faster corrected forecast")
        }
        let header: Header
        do { header = try readHeader(path: url.path) } catch { return (nil, "correction header rejected: \(error)") }
        guard header.tap == .attention else { return (nil, "correction at \(shippedRelativePath) was fitted on the \(header.tap.rawValue) tap") }
        guard let data = FileManager.default.contents(atPath: url.path) else { return (nil, "correction at \(shippedRelativePath) is not readable") }
        let digest = SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
        if let pinnedSHA256, digest != pinnedSHA256 {
            return (nil, "correction at \(shippedRelativePath) has digest \(digest.prefix(16)), not the measured \(pinnedSHA256.prefix(16))")
        }
        return (Located(path: url.path, header: header, sha256: digest), "measured correction \(digest.prefix(16)) at \(shippedRelativePath)")
    }
}

extension RouterTapCorrection {
    /// The shipped correction the qualified default uses: `locate` unless
    /// `SLOTSTREAM_EXPERT_PREFETCH_TAP=boundary` asks for the previous forecast
    /// with the file present (the documented override for comparisons).
    package static func shipped(modelDirectory: URL, env: [String: String] = ProcessInfo.processInfo.environment,
                                pinnedSHA256: String? = shippedSHA256) -> (located: Located?, reason: String) {
        if env["SLOTSTREAM_EXPERT_PREFETCH_TAP"] == RouterForecastTap.boundary.rawValue {
            return (nil, "boundary forecast selected by SLOTSTREAM_EXPERT_PREFETCH_TAP")
        }
        return locate(modelDirectory: modelDirectory, pinnedSHA256: pinnedSHA256)
    }
}
