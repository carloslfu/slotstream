import Darwin
import Foundation
import Metal

// Compiled with the production ProcessMemory and Observation sources. No model
// or MLX runtime is loaded; the largest live GPU allocation is 192 MiB.
@main struct ProcessMemoryCheck {
    static func main() throws {
        guard let device = MTLCreateSystemDefaultDevice(), let queue = device.makeCommandQueue() else {
            throw NSError(domain: "process-memory-check", code: 1,
                userInfo: [NSLocalizedDescriptionKey: "a Metal device is required"])
        }
        var observations: [[String: Any]] = []
        var failures: [String] = []
        var sampledPeak: UInt64 = 0
        var info = task_vm_info_data_t()
        let extent = MemoryLayout<task_vm_info_data_t>.offset(of: \.ledger_phys_footprint_peak)! + MemoryLayout<Int64>.size
        let count = mach_msg_type_number_t(extent / MemoryLayout<integer_t>.stride)
        info.ledger_phys_footprint_peak = 123
        if ProcessMemory.footprintPeak(info: info, count: count - 1) != 0 {
            failures.append("short task_info reply exposed an unavailable ledger field")
        }
        if ProcessMemory.footprintPeak(info: info, count: count) != 123 {
            failures.append("complete task_info ledger field was not read")
        }
        for value: Int64 in [-1, 0, Int64.min] {
            info.ledger_phys_footprint_peak = value
            if ProcessMemory.footprintPeak(info: info, count: count) != 0 {
                failures.append("invalid signed peak was converted to an enormous allocation")
            }
        }
        func sample(_ phase: String) {
            let current = ProcessMemory.residentBytes()
            sampledPeak = max(sampledPeak, current)
            let reported = ProcessMemory.peakResidentBytes()
            observations.append(["phase": phase, "physical_footprint_bytes": current,
                "reported_peak_bytes": reported, "sampled_peak_bytes": sampledPeak,
                "lifetime_rss_peak_bytes": ProcessMemory.lifetimeRSSPeakBytes()])
            if current == 0 { failures.append("\(phase): unreadable current footprint") }
            if reported < sampledPeak { failures.append("\(phase): reported peak forgot an observed allocation") }
        }
        func buffer(_ mib: Int) throws -> MTLBuffer {
            guard let buffer = device.makeBuffer(length: mib * 1024 * 1024, options: .storageModeShared),
                  let command = queue.makeCommandBuffer(), let encoder = command.makeBlitCommandEncoder() else {
                throw NSError(domain: "process-memory-check", code: 2)
            }
            encoder.__fill(buffer, range: NSRange(location: 0, length: buffer.length), value: 0x5a)
            encoder.endEncoding()
            command.commit()
            command.waitUntilCompleted()
            guard command.status == .completed else { throw command.error ?? NSError(domain: "process-memory-check", code: 3) }
            return buffer
        }
        sample("baseline")
        let sampler = FootprintSampler(intervalMilliseconds: 5)
        try autoreleasepool {
            let transient = try buffer(128)
            sample("transient_128_mib")
            Thread.sleep(forTimeInterval: 0.03)
            withExtendedLifetime(transient) {}
        }
        Thread.sleep(forTimeInterval: 0.5)
        sample("transient_freed")
        try autoreleasepool {
            let persistent = try buffer(64)
            sample("persistent_64_mib")
            try autoreleasepool {
                let transient = try buffer(128)
                sample("persistent_plus_transient")
                withExtendedLifetime(transient) {}
            }
            Thread.sleep(forTimeInterval: 0.5)
            sample("persistent_after_transient_freed")
            withExtendedLifetime(persistent) {}
        }
        Thread.sleep(forTimeInterval: 0.5)
        sample("all_gpu_buffers_freed")
        // Exercise the CPU path and repeated reads after the GPU high-water.
        let cpu = mmap(nil, 8 * 1024 * 1024, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0)!
        guard cpu != MAP_FAILED else { throw NSError(domain: "process-memory-check", code: 4) }
        memset(cpu, 0x5a, 8 * 1024 * 1024)
        sample("cpu_allocation_after_gpu_peak")
        guard munmap(cpu, 8 * 1024 * 1024) == 0 else { throw NSError(domain: "process-memory-check", code: 5) }
        let priorPeak = ProcessMemory.peakResidentBytes()
        let failureLock = NSLock()
        DispatchQueue.concurrentPerform(iterations: 64) { _ in
            if ProcessMemory.peakResidentBytes() < priorPeak {
                failureLock.lock(); failures.append("concurrent read lost the peak"); failureLock.unlock()
            }
        }
        sample("after_concurrent_reads")
        let sampled = sampler.finish()
        if ProcessMemory.peakResidentBytes() < sampled.peakBytes {
            failures.append("lifetime peak is below the independently sampled interval")
        }
        let firstPeak = observations[1]["physical_footprint_bytes"] as! UInt64
        let released = observations[2]["physical_footprint_bytes"] as! UInt64
        if firstPeak <= released + 64 * 1024 * 1024 {
            failures.append("fixture did not observe GPU memory release")
        }
        let result: [String: Any] = ["passed": failures.isEmpty, "device": device.name,
            "model_loaded": false, "maximum_live_gpu_buffer_bytes": 192 * 1024 * 1024,
            "observations": observations, "failures": failures]
        print(String(data: try JSONSerialization.data(withJSONObject: result, options: [.prettyPrinted, .sortedKeys]), encoding: .utf8)!)
        if !failures.isEmpty { exit(1) }
    }
}
