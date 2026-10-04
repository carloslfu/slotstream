// T0: the cancellable weight verification an embedding app uses for its Stop
// button and for shutdown. No model files: a temporary directory stands in,
// and a counting closure decides when verification must stop.

import Foundation
import Slotstream
import SlotstreamDiagnostics

/// Answers `true` a fixed number of times, then `false`, and counts the asks.
private final class ContinueBudget: @unchecked Sendable {
    private let lock = NSLock()
    private var left: Int
    private var count = 0
    init(_ left: Int) { self.left = left }
    var asked: Int { lock.withLock { count } }
    func next() -> Bool {
        lock.withLock {
            count += 1
            guard left > 0 else { return false }
            left -= 1
            return true
        }
    }
}

extension Catalogue {
    static var weightStoreChecks: [Check] {
        [Check("weightstore-cancellable", tier: .t0) { try weightStoreCancellable() }]
    }

    static func weightStoreCancellable() throws -> CheckReport {
        var c = CheckBuilder("weightstore-cancellable")
        let dir = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-weightstore-check-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: dir) }

        // Digests: the cancellable reader agrees with the plain one.
        let small = dir.appendingPathComponent("abc")
        try Data("abc".utf8).write(to: small)
        let abc = "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
        let smallDigest = try WeightStore.sha256(of: small, shouldContinue: { true })
        c.equal("the cancellable digest is the known digest", smallDigest, abc)
        let big = dir.appendingPathComponent("big")
        try Data(count: (8 << 20) * 2 + 5).write(to: big)
        let bigDigest = try WeightStore.sha256(of: big, shouldContinue: { true })
        c.equal("a three-chunk digest agrees with the plain reader", bigDigest, WeightStore.sha256(of: big))
        let missing = try WeightStore.sha256(of: dir.appendingPathComponent("absent"), shouldContinue: { true })
        c.equal("a missing file has an empty digest, as with the plain reader", missing, "")

        // Stops: before the first read, and between two 8 MiB reads.
        var refused = false
        do { _ = try WeightStore.sha256(of: small, shouldContinue: { false }) } catch { refused = true }
        c.expect("a stop before the first read ends the digest with an error", refused)
        let budget = ContinueBudget(2)
        var stopped = false
        do { _ = try WeightStore.sha256(of: big, shouldContinue: { budget.next() }) } catch { stopped = true }
        c.expect("a stop between reads ends the digest with an error", stopped)
        c.equal("...at the first ask past its budget, before the second read", budget.asked, 3)

        // Status over an empty copy: the same answer as the plain status, and a
        // stop before verification is an error rather than a status.
        let modelDir = dir.appendingPathComponent("model")
        try FileManager.default.createDirectory(at: modelDir, withIntermediateDirectories: true)
        let store = WeightStore(modelDirectory: modelDir)
        let selectedStore = WeightStore(modelDirectory: modelDir, pack: ModelPackRegistry.baseline)
        let plain = store.status()
        let cancellable = try store.status(shouldContinue: { true })
        if case let .missing(want, _) = plain, case let .missing(got, free) = cancellable {
            c.equal("an empty copy reads as missing the required model", got, want)
            c.expect("the cancellable status carries free disk", free > 0, "free \(free)")
        } else {
            c.expect("an empty copy reads as missing in both statuses", false, "plain \(plain), cancellable \(cancellable)")
        }
        c.equal("the public selected-pack store retains original byte requirements", selectedStore.requiredBytes, PinnedModel.requiredBytes)
        c.equal("the public selected-pack store retains original optional bytes", selectedStore.totalBytes, PinnedModel.totalBytes)
        c.equal("legacy and selected original stores report the same missing bytes", selectedStore.remainingBytes(), store.remainingBytes())
        var statusStopped = false
        do { _ = try store.status(shouldContinue: { false }) } catch { statusStopped = true }
        c.expect("a stop before verification ends status with an error", statusStopped)
        return c.report()
    }
}
