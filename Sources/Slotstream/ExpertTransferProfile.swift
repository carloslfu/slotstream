import Foundation

/// Serialized diagnostic only. Timings are not additive with pool.ioSeconds,
/// which already contains staging work. Scatter attribution forces GPU waits.
package final class ExpertTransferProfile {
    package var allocationSeconds = 0.0
    package var wrappingSeconds = 0.0
    package var stagingEvalSeconds = 0.0
    package var scatterPriorWaitSeconds = 0.0
    package var scatterExecutionSeconds = 0.0
    package var allocatedBytes = 0
    package var batches = 0
    package var wrappedBuffers = 0
    package var immediateReleaseBuffers = 0
    package init() {}
}

/// MLX's managed-data constructor synchronously calls the deleter when its
/// allocator cannot wrap the pointer and instead copies it. A callback after
/// construction is ordinary lifetime completion and must not count as a copy.
/// The callback can also run on an MLX worker, hence this separate lock.
final class ManagedBufferReleaseObservation {
    private let lock = NSLock()
    private var released = false
    func record() { lock.withLock { released = true } }
    var observed: Bool { lock.withLock { released } }
}
