// Isolates HTTP delivery from decode and disk writes using production sessions.
import Foundation
import Dispatch

@main struct TransferProbe {
    static func main() throws {
        let args = CommandLine.arguments
        let manifest = try PinnedTransport.manifest.get()
        let mode = args[1], base = args[2], connections = Int(args[3])!
        let objects = Array(manifest.objects.filter { $0.size > 20 << 20 }.prefix(connections * 2))
        let cancellation = PullCancellation()
        let lock = NSLock()
        var errors = [String](), bytes: Int64 = 0, hits = [String: Int]()
        let start = ProcessInfo.processInfo.systemUptime
        DispatchQueue.concurrentPerform(iterations: connections) { worker in
            let http = DownloadHTTP(cancellation: cancellation, timeout: 15, cache: { status in
                lock.lock(); hits[status, default: 0] += 1; lock.unlock()
            })
            defer { http.close() }
            for i in stride(from: worker, to: objects.count, by: connections) {
                do {
                    try autoreleasepool {
                        let object = objects[i]
                        let data: Data
                        if mode == "compressed" {
                            data = try http.fetch(URL(string: base+"/"+object.path)!, size: object.size)
                            guard SlotpackManifest.digest(data) == object.sha256 else { throw SlotstreamError.pull("probe object hash") }
                        } else {
                            let range = object.ranges[0], file = manifest.files[range.file]
                            data = try http.fetch(URL(string: base+"/"+file.path)!, size: range.length, range: (range.offset, file.size))
                        }
                        lock.lock(); bytes += Int64(data.count); lock.unlock()
                    }
                } catch { lock.lock(); errors.append(String(describing: error)); lock.unlock() }
            }
        }
        let elapsed = ProcessInfo.processInfo.systemUptime-start
        let result: [String: Any] = ["mode":mode,"connections":connections,"bytes":bytes,"seconds":elapsed,
                                     "MBps":Double(bytes)/1e6/elapsed,"errors":errors,"cache":hits]
        print(String(data: try JSONSerialization.data(withJSONObject: result, options: [.sortedKeys]), encoding: .utf8)!)
    }
}
