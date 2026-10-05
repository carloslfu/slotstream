// Gates for the draft head's streamed experts and the plain-decode lookahead:
// both must leave the ids exact, and a failed draft expert read must end its
// request with an error rather than stop the process.

import ArgumentParser
import Foundation
import SlotstreamDiagnostics

struct DraftStreamCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "draft-stream-check",
        abstract: "Prove streamed draft-head experts and the plain-decode lookahead leave outputs exact")
    @OptionGroup var model: ModelOptions
    @Option(help: "Tokens to generate per run")
    var tokens: Int = 32

    func run() throws {
        let dir = try model.modelURL
        let tokens = self.tokens
        let sem = DispatchSemaphore(value: 0)
        var result: Result<[CheckReport], Error> = .success([])
        Task {
            do { result = .success(try await Diagnostics.draftStream(modelDir: dir, tokens: tokens)) }
            catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        var failed = false
        for report in try result.get() {
            for item in report.items {
                print("\(item.passed ? "PASS" : "FAIL")  \(report.name): \(item.name)\(item.passed ? "" : "  \(item.detail ?? "")")")
            }
            if !report.passed { failed = true }
        }
        if failed { throw ExitCode(2) }
        print("DRAFT STREAM CHECK PASS")
    }
}
