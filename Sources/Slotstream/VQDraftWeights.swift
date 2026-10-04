import CryptoKit
import Darwin
import Foundation
import MLX

/// Original four-bit head attached only to authenticated research targets. This is a
/// separate authenticated recipe, never the VQ trunk's default quantization.
/// All centered norms in this sidecar already have +1 folded into BF16.
package enum VQDraftWeights {
    package static let payloadBytes = 1_470_946_816
    package static let largestLoadCopyBytes = 419_430_400
    package static let fileSHA256 = "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744"
    package static let configSHA256 = "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5"

    /// Exact small immutable configuration, read through one regular descriptor.
    /// Hashing the captured bytes pins what is parsed even if its path changes.
    package static func configuration(_ url: URL) throws -> ModelConfig {
        let fd = open(url.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot open original draft configuration") }
        let handle = FileHandle(fileDescriptor: fd, closeOnDealloc: true)
        defer { try? handle.close() }
        var initial = stat()
        guard fstat(fd, &initial) == 0, initial.st_mode & S_IFMT == S_IFREG, initial.st_size == 33_408,
              let data = try handle.read(upToCount: 33_409), data.count == 33_408,
              SHA256.hash(data: data).map({ String(format: "%02x", $0) }).joined() == configSHA256 else {
            throw ModelError("original draft requires its exact separate configuration")
        }
        let config = try ModelConfig.parse(data, label: "original four-bit research draft")
        guard config.qBits == 4, config.qGroup == 64, config.hiddenSize == 2560,
              config.hcCount == 4 else { throw ModelError("original draft quantization or geometry changed") }
        return config
    }

    package static func load(baseline: URL, maximumPayloadBytes: Int = payloadBytes,
                             maximumLoadCopyBytes: Int = largestLoadCopyBytes,
                             streamedExperts: Bool = false,
                             shouldContinue: () -> Bool = { true }) throws -> MTPWeights {
        let streamedBytes = payloadBytes - PlannerCostModel.mtpExpertCount * PlannerCostModel.mtpExpertBytes
            + (PlannerCostModel.mtpStreamSlots + PlannerCostModel.mtpStreamScratchExperts) * PlannerCostModel.mtpExpertBytes
        guard maximumPayloadBytes >= (streamedExperts ? streamedBytes : payloadBytes),
              maximumLoadCopyBytes >= (streamedExperts ? 1 : largestLoadCopyBytes) else {
            throw ModelError("original draft payload or load-copy reservation is insufficient")
        }
        try ModelProcessGuard.acquire()
        func admit(_ nextBytes: Int) throws {
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            guard let vm = ProcessMemory.vmActivity(),
                  vm.reclaimableBytes >= UInt64(nextBytes + 3_000_000_000),
                  ProcessMemory.peakResidentBytes() <= 10_000_000_000 else {
                throw ModelError("original draft lost its bounded load or three-GB headroom")
            }
        }
        try admit(0)
        let config = try configuration(baseline.appendingPathComponent("config.json"))
        let url = MTPWeights.fileURL(modelDir: baseline)
        let owner = try VQTensorFile(url: url, identity: .init(fileBytes: 1_470_955_171,
            headerBytes: 8347, headerSHA256: "836ae4156c99452e932c7a81322bcca959ac6f7ed86d6270cfd56ff94c62f4b9",
            fileSHA256: fileSHA256), uncachedRandomReads: streamedExperts,
            shouldContinue: { (try? admit(0)) != nil })
        let refs = owner.tensors
        guard refs.count == 68, refs.values.reduce(0, { $0 + $1.byteCount }) == payloadBytes,
              refs.values.map(\.byteCount).max() == largestLoadCopyBytes,
              refs.keys.allSatisfy({ $0.hasPrefix("mtp.") }),
              refs["mtp.pre_fc_norm_embedding.weight"]?.shape == [2560],
              refs["mtp.pre_fc_norm_hidden.weight"]?.shape == [10240],
              refs.keys.filter({ $0.hasSuffix(".scales") }).count == 18 else {
            throw ModelError("original draft tensor coverage differs from its byte ledger")
        }
        let selected = refs.filter { !streamedExperts || !$0.key.contains(".switch_mlp.") }
        let selectedBytes = selected.values.reduce(0) { $0 + $1.byteCount }
        let loadCopyBytes = selected.values.map(\.byteCount).max() ?? 0
        let cacheBytes = streamedExperts
            ? (PlannerCostModel.mtpStreamSlots + PlannerCostModel.mtpStreamScratchExperts) * PlannerCostModel.mtpExpertBytes : 0
        guard selected.count == (streamedExperts ? 59 : 68),
              selectedBytes + cacheBytes == (streamedExperts ? streamedBytes : payloadBytes),
              maximumLoadCopyBytes >= loadCopyBytes else {
            throw ModelError("original draft resident families exceed their declared reservation")
        }
        try admit(selectedBytes + cacheBytes + loadCopyBytes)
        var arrays: [String: MLXArray] = [:]
        // One host copy and one MLX array may coexist for the current tensor.
        // Earlier arrays stay owned. No partial loader is published on failure.
        for name in selected.keys.sorted() {
            let ref = selected[name]!
            guard ref.byteCount > 0, ref.byteCount <= largestLoadCopyBytes,
                  ref.dtype == "BF16" || ref.dtype == "U32" else {
                throw ModelError("original draft tensor exceeds its pinned load extent")
            }
            try admit(2 * ref.byteCount)
            arrays[name] = try autoreleasepool {
                var data = Data(); data.reserveCapacity(ref.byteCount)
                for offset in stride(from: 0, to: ref.byteCount, by: VQTensorFile.maximumRead) {
                    data.append(try owner.read(name, offset: offset,
                        count: min(VQTensorFile.maximumRead, ref.byteCount - offset),
                        shouldContinue: { (try? admit(0)) != nil }))
                }
                let array = MLXArray(data, ref.shape, dtype: ref.dtype == "BF16" ? .bfloat16 : .uint32)
                eval(array)
                return array
            }
            MLX.Memory.clearCache()
        }
        try admit(0); try owner.verifyUnchanged()
        guard arrays.values.reduce(0, { $0 + $1.nbytes }) == selectedBytes else {
            throw ModelError("original draft materialized payload differs")
        }
        try admit(cacheBytes)
        let stream = try streamedExperts ? MTPExpertStream(verifiedOwner: owner, slots: PlannerCostModel.mtpStreamSlots) : nil
        return try MTPWeights(verifiedArrays: arrays, config: config, url: url, stream: stream)
    }
}
