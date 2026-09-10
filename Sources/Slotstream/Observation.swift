import Foundation

/// Monotonic durations; wall-clock adjustments must not change a measurement.
public enum RuntimeClock {
    public static func now() -> UInt64 { DispatchTime.now().uptimeNanoseconds }
    public static func seconds(since start: UInt64) -> Double {
        Double(now() - start) / 1e9
    }
}

/// Image source decoding and first-tower loading happen before Generator.
/// Keep this separate interval observable instead of omitting a cold peak.
public struct ImagePreparationObservation: Codable {
    public var seconds: Double
    public var sourceDecodeSeconds: Double
    public var towerReadySeconds: Double
    public var sampledFootprint: FootprintSampler.Result?
    public var vmBefore: ProcessMemory.VMActivity?
    public var vmAfter: ProcessMemory.VMActivity?
    public var sourceDecodedImages: Int?
    public var sourceReusedImages: Int?
    /// Conservative admission charge, not physical-footprint measurement.
    public var sourceAdmissionBytes: Int?
}

/// Optional physical-footprint sampling. This observes Mach only: it neither
/// evaluates MLX graphs nor changes GPU synchronization. The maximum is a
/// sampled lower bound, not the kernel's lifetime RSS high-water.
public final class FootprintSampler {
    public struct Result: Codable {
        public var peakBytes: UInt64
        public var samples: Int
        public var intervalMilliseconds: Int
    }
    private let queue = DispatchQueue(label: "slotstream.footprint-observer")
    private var timer: DispatchSourceTimer?
    private var result: Result

    public init(intervalMilliseconds: Int = 20) {
        let interval = max(1, intervalMilliseconds)
        result = Result(peakBytes: ProcessMemory.residentBytes(), samples: 1,
                        intervalMilliseconds: interval)
        let timer = DispatchSource.makeTimerSource(queue: queue)
        timer.schedule(deadline: .now() + .milliseconds(interval),
                       repeating: .milliseconds(interval))
        timer.setEventHandler { [weak self] in self?.sample() }
        self.timer = timer
        timer.resume()
    }

    private func sample() {
        result.peakBytes = max(result.peakBytes, ProcessMemory.residentBytes())
        result.samples += 1
    }

    public func finish() -> Result {
        queue.sync {
            timer?.cancel()
            timer = nil
            sample()
            return result
        }
    }

    deinit { timer?.cancel() }
}
