import ArgumentParser
import Foundation
import Slotstream

struct PackExperts: ParsableCommand {
    static let configuration = CommandConfiguration(commandName:"pack-experts",
        abstract:"Build and verify an optional contiguous expert artifact for pool reads")
    @Option(name:.long,help:"Original model directory") var model: String
    @Option(name:.long,help:"New artifact directory; existing destinations are never replaced") var destination: String
    @Flag(name:.long) var json = false
    @Flag(name:.long,help:"Verify an existing artifact instead of building it") var verifyOnly = false
    func run() throws {
        let sampler = FootprintSampler()
        let before = ProcessMemory.vmActivity()
        let store = try ExpertStore(index:CheckpointIndex(dir:URL(fileURLWithPath:model,isDirectory:true)))
        let url = URL(fileURLWithPath:destination,isDirectory:true)
        let report = try verifyOnly ? store.loadPackedLayout(at:url) : store.buildPackedLayout(at:url)
        if json {
            struct Result: Encodable {
                let operation: String
                let artifact: PackedLayoutReport
                let footprint: FootprintSampler.Result
                let lifetimeRSSPeakBytes: UInt64
                let vmBefore: ProcessMemory.VMActivity?
                let vmAfter: ProcessMemory.VMActivity?
            }
            let result = Result(operation:verifyOnly ? "verify" : "build",artifact:report,footprint:sampler.finish(),
                lifetimeRSSPeakBytes:ProcessMemory.lifetimeRSSPeakBytes(),vmBefore:before,vmAfter:ProcessMemory.vmActivity())
            let encoder = JSONEncoder(); encoder.outputFormatting = [.prettyPrinted,.sortedKeys]
            print(String(decoding:try encoder.encode(result),as:UTF8.self))
        } else {
            print("Verified \(report.bytes) packed expert bytes in \(report.seconds) s at \(destination)")
        }
    }
}
