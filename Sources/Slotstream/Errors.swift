// One error type for the library.
//
// These used to be ArgumentParser's `ValidationError` thrown from deep inside
// the download and the engine, which tied the library to the CLI's error
// vocabulary and gave a host app nothing to switch on. The descriptions are
// the strings the CLI has always printed: a user sees the same sentence, a
// program now gets a case.

import Foundation

public enum SlotstreamError: Error, CustomStringConvertible, Sendable {
    /// The weights are absent or incomplete at this directory.
    case weightsMissing(directory: URL, remainingBytes: Int64, freeDiskBytes: Int64)
    /// Present at the right size, wrong bytes.
    case weightsCorrupt([String])
    /// Anything the download decided it could not do.
    case pull(String)
    /// A checkpoint that is not the pinned model, or is damaged.
    case unsupportedCheckpoint(String)
    /// A plan the planner refuses to make.
    case invalidPlan(String)
    /// Another process already holds the per-user model lock.
    case anotherProcessHoldsModel(lockPath: String)
    /// A simulated device may never authorize a real allocation.
    case simulatedDeviceCannotLoad

    public var description: String {
        switch self {
        case let .weightsMissing(directory, remaining, _):
            return "no model at \(directory.path) — \(remaining) bytes still to download; "
                + "get them with:  slotstream pull"
        case let .weightsCorrupt(paths):
            return "\(paths.count) file(s) do not match the pinned revision: "
                + paths.joined(separator: ", ") + " — run `slotstream pull` to repair"
        case let .pull(message): return message
        case let .unsupportedCheckpoint(message): return message
        case let .invalidPlan(message): return message
        case let .anotherProcessHoldsModel(lockPath):
            return "another Slotstream model process is already running for this user — "
                + "stop it before starting run, serve, parity, or a heavyweight check "
                + "(lock: \(lockPath))"
        case .simulatedDeviceCannotLoad:
            return "this plan was made for a simulated device, so it cannot load a model: "
                + "a simulated availability figure still produces a real allocation. "
                + "Plan against Device.current() to load."
        }
    }

    public var localizedDescription: String { description }
}
