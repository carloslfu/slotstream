// A bounded throughput trial. Manual connection counts never enter this policy.
// Compare equal 30-second windows; retain extra connections only for >=10% gain.
struct DownloadConcurrency {
    private(set) var active: Int
    private(set) var finished = false
    private var best: Int
    private var baseline: Double?
    init(initial: Int = 8) { active = max(1,min(32,initial)); best = active }
    mutating func observe(bytesPerSecond rate: Double, decodeBacklog: Bool, hadRetries: Bool) -> Int? {
        guard !finished, rate.isFinite, rate > 0 else { return nil }
        let previous = active
        if let baseline {
            if hadRetries || decodeBacklog || rate < baseline * 1.10 {
                active = best; finished = true
            } else {
                best = active; self.baseline = rate
                if active < 32 { active = min(32, active * 2) } else { finished = true }
            }
        } else if decodeBacklog || hadRetries {
            finished = true
        } else {
            baseline = rate; best = active; active = min(32, active * 2)
        }
        return active == previous ? nil : active
    }
}
