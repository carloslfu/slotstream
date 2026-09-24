import Foundation
import Slotstream

public struct ModelSetupStatus: Sendable, Equatable {
    public var phase: String
    public var detail: String
    public var requiredBytes: Int64
    public var freeBytes: Int64
    public var ready: Bool
    public var busy: Bool
}

/// Separate from inference so setup can be observed and cancelled while a
/// blocking library download drains its workers. It never downloads on init.
public final class ModelSetup: @unchecked Sendable {
    private let store: WeightStore
    private let lock = NSLock()
    private var cancellation: PullCancellation?
    private var value = ModelSetupStatus(phase: "Not checked", detail: "Check the installed local model, or download its pinned files.", requiredBytes: PinnedModel.requiredBytes, freeBytes: 0, ready: false, busy: false)
    public init(model: URL = WeightStore.default.modelDirectory) { store = WeightStore(modelDirectory: model) }
    public func snapshot() -> ModelSetupStatus { lock.lock(); defer { lock.unlock() }; return value }
    private func set(_ mutate: (inout ModelSetupStatus) -> Void) { lock.lock(); defer { lock.unlock() }; mutate(&value) }
    private func begin(_ phase: String) throws -> PullCancellation {
        lock.lock(); defer { lock.unlock() }
        guard !value.busy else { throw SevraError.refused("Model setup is already in progress.") }
        let token = PullCancellation(); cancellation = token; value.busy = true; value.phase = phase; value.detail = phase
        return token
    }
    public func check() throws {
        let token = try begin("Checking local files")
        do { finish(try store.status(shouldContinue: { !token.isCancelled })) }
        catch { let reason: Error = token.isCancelled ? SevraError.cancelled : error; pause(reason); throw reason }
    }
    public func download() throws {
        let token = try begin("Downloading local model")
        do {
            try store.download(PullOptions(cancellation: token), log: { [weak self] line in
                // Raw transport logs stay out of product copy and persistent
                // diagnostics. Surface a bounded phase only.
                self?.set { $0.detail = line.localizedCaseInsensitiveContains("verif") ? "Verifying downloaded files" : "Downloading verified model files. Progress is saved so you can resume." }
            })
            // The optional decode-forecast file `slotstream pull` also fetches;
            // without it decode uses the earlier, slower forecast. A failure is
            // logged by the library and never fails setup.
            for file in TapCorrectionSidecar.files where !token.isCancelled {
                set { $0.detail = "Downloading the decode forecast file" }
                TapCorrectionSidecar.ensure(modelDir: store.modelDirectory, file: file, cancellation: token, log: { _ in })
            }
            finish(try store.status(shouldContinue: { !token.isCancelled }))
        } catch {
            let reason: Error = token.isCancelled ? SevraError.cancelled : error
            pause(reason)
            throw reason
        }
    }
    private func pause(_ error: Error) {
        set { $0.phase = "Setup paused"; $0.detail = error.localizedDescription; $0.busy = false; $0.ready = false }
        lock.lock(); cancellation = nil; lock.unlock()
    }
    public func cancel() {
        lock.lock(); let token = cancellation; if value.busy { value.detail = "Stopping setup. Waiting for file writes to finish." }; lock.unlock()
        token?.cancel()
    }
    private func finish(_ result: WeightStatus) {
        set {
            $0.ready = result.isReady; $0.busy = false; $0.requiredBytes = result.bytesToFetch
            $0.freeBytes = result.freeDiskBytes ?? WeightStore.freeDiskBytes(near: store.modelDirectory)
            switch result {
            case .ready: $0.phase = "Local model ready"; $0.detail = "The installed model matches its pinned file hashes."
            case .missing: $0.phase = "Model download needed"; $0.detail = "Download the pinned model files to use local inference."
            case .incomplete: $0.phase = "Download incomplete"; $0.detail = "Resume setup to finish and verify the local model."
            case .corrupt: $0.phase = "Model repair needed"; $0.detail = "Some files failed verification. Repair them before using the model."
            }
        }
        lock.lock(); cancellation = nil; lock.unlock()
    }
}
