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
            let controlQueue = DispatchQueue(label: "fixture.cancellation")
            var control: DispatchSourceTimer?
            if args.count > 5, args[5] == "after-progress" || args[5].hasPrefix("cancel-file:") {
                let timer = DispatchSource.makeTimerSource(queue: controlQueue)
                let deadline = ProcessInfo.processInfo.systemUptime + 30
                timer.schedule(deadline: .now(), repeating: .milliseconds(10))
                timer.setEventHandler {
                    let ready: Bool
                    if args[5].hasPrefix("cancel-file:") {
                        ready = FileManager.default.fileExists(atPath: String(args[5].dropFirst("cancel-file:".count)))
                    } else if rawTest {
                        ready = pins.contains { file in
                            DownloadFiles.readSmall(dest.appendingPathComponent(file.path).appendingPathExtension("partmap"), limit: 1 << 20)?.contains(1) == true
                        }
                    } else {
                        let state = DownloadFiles.readSmall(dest.appendingPathComponent(".slotpack-state.json"), limit: 1 << 20)
                        let json = state.flatMap { try? JSONSerialization.jsonObject(with: $0) } as? [String: Any]
                        ready = (json?["done"] as? [Int])?.contains(1) == true
                    }
                    if ready || ProcessInfo.processInfo.systemUptime >= deadline { cancellation.cancel() }
                }
                timer.resume(); control = timer
            }
            defer { control?.cancel(); controlQueue.sync {} }
            if args.count > 5, let seconds = Double(args[5]), seconds > 0 {
                DispatchQueue.global().asyncAfter(deadline: .now() + seconds) { cancellation.cancel() }
            }
            if let delay = Double(ProcessInfo.processInfo.environment["SLOTPACK_FIXTURE_START_DELAY"] ?? "0"), delay > 0 {
                Thread.sleep(forTimeInterval: min(delay, 5))
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
