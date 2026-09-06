// Standalone harness compiles the exact production downloader, without MLX.
import Foundation
import Dispatch
#if canImport(Glibc)
import Glibc
#else
import Darwin
#endif

@main struct DownloadHarness {
    static func main() {
        do {
            let args = CommandLine.arguments
            guard args.count >= 4 else { throw SlotstreamError.pull("usage: harness manifest destination compressed-base [raw-base] [cancel-after-seconds]") }
            let data = try Data(contentsOf: URL(fileURLWithPath: args[1]))
            let pins = try JSONDecoder().decode(SlotpackManifest.self, from: data).files
            let digest = SlotpackManifest.digest(data)
            let rawTest = ProcessInfo.processInfo.environment["SLOTSTREAM_TEST_RAW"] == "1"
            let manifest = try rawTest ? JSONDecoder().decode(SlotpackManifest.self, from: data) : SlotpackManifest.load(data, digest: digest, files: pins)
            let dest = URL(fileURLWithPath: args[2])
            try FileManager.default.createDirectory(at: dest, withIntermediateDirectories: true)
            let lease = try DownloadDirectoryLock(dest)
            let cancellation = PullCancellation()
            if args.count > 5, let seconds = Double(args[5]), seconds > 0 {
                DispatchQueue.global().asyncAfter(deadline: .now() + seconds) { cancellation.cancel() }
            }
            let raw = args.count > 4 && args[4] != "-" ? args[4].components(separatedBy: ",") : []
            if rawTest {
                let job = PullJob(dest: dest, bases: raw, connections: 4, files: pins, cancellation: cancellation, log: { print($0); fflush(stdout) })
                defer { job.shutdown() }
                _ = try job.plan()
                try withExtendedLifetime(lease) { try job.run() }
            } else {
            let job = SlotpackDownload(manifest: manifest, digest: digest, dest: dest,
                bases: args[3] == "-" ? [] : args[3].components(separatedBy: ","), rawBases: raw,
                connections: Int(ProcessInfo.processInfo.environment["SLOTSTREAM_PULL_CONNECTIONS"] ?? "4") ?? 4,
                cancellation: cancellation, timeout: Double(ProcessInfo.processInfo.environment["SLOTSTREAM_HTTP_TIMEOUT"] ?? "1") ?? 1, log: { print($0); fflush(stdout) })
            try withExtendedLifetime(lease) { try job.run() }
            }
            for file in pins where !file.optional || FileManager.default.fileExists(atPath: dest.appendingPathComponent(file.path).path) {
                guard WeightStore.fileMatches(dest.appendingPathComponent(file.path), size: file.size, sha256: file.sha256) else { throw SlotstreamError.pull("independent verification failed") }
            }
            print("HARNESS PASS")
        } catch { fputs("\(error)\n", stderr); exit(1) }
    }
}
