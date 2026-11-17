// MLX's wired limit for this process.
//
// MLX wires no Metal buffer by default (limit 0). Under memory pressure macOS
// may then compress idle expert-pool and weight buffers, and because 4-bit
// weights barely compress, the compressor spills to swap. With a limit, MLX
// keeps its buffers resident up to that many bytes (macOS 15 and later).
//
// Opt-in: `SLOTSTREAM_WIRED_LIMIT=1` wires up to the plan's total-process
// target. Evidence, scope and what would make it a default:
// db/records/decisions/wire-mlx-buffers-to-the-memory-target.md
//
// It is memory policy, not arithmetic, so it is deliberately not one of the
// `InferenceOptimizations`: those are part of a saved prefix's identity, and
// turning wiring on must not make a server read its prompts again.
//
// MLX refuses a limit above the Metal working set, and an MLX error ends the
// process unless a handler is installed. So the limit is clamped to the working
// set first and set inside `withError`, which turns a refusal into a Swift
// error the engine reports and survives.
//
// The limit is process-wide. Each `WiredLimit` is one holder; the limit that
// was in force before the first holder is put back when the last one goes away,
// including when an engine fails to finish loading.

import Cmlx
import Foundation
import MLX

package final class WiredLimit {
    package struct Refused: Error, CustomStringConvertible {
        package let description: String
    }

    package static let variable = "SLOTSTREAM_WIRED_LIMIT"

    /// `1` asks for the limit; unset or `0` does not. Any other value is an
    /// error, so a typo cannot silently leave a server's buffers pageable.
    package static func requested(_ environment: [String: String] = ProcessInfo.processInfo.environment) throws -> Bool {
        switch environment[variable] {
        case nil, "0": return false
        case "1": return true
        case let other?: throw ModelError("\(variable) must be 0 or 1, not \"\(other)\"")
        }
    }

    /// The bytes to wire for a plan: its target, never above the Metal working
    /// set. Nil when the plan has no total-process target or the working set
    /// is unknown.
    package static func bytes(targetGB: Double?, workingSetGB: Double) -> Int? {
        guard let targetGB, targetGB.isFinite, targetGB > 0,
              workingSetGB.isFinite, workingSetGB > 0 else { return nil }
        let gb = min(targetGB, workingSetGB)
        guard gb < Double(Int.max) / 1e9 else { return nil }
        let bytes = Int(gb * 1e9)
        return bytes > 0 ? bytes : nil
    }

    private static let lock = NSLock()
    private static var holders = 0
    private static var baseline = 0

    /// The limit in force for this holder, after clamping.
    package private(set) var bytes: Int
    /// The limit that was in force when this holder asked for its own.
    package let previousBytes: Int

    private init(bytes: Int, previousBytes: Int) {
        self.bytes = bytes
        self.previousBytes = previousBytes
    }

    /// Wire MLX buffers up to `requested` bytes, clamped to what MLX reports
    /// as the Metal working set. Throws `Refused` instead of ending the process.
    package static func apply(bytes requested: Int) throws -> WiredLimit {
        let bytes = try clamped(requested)
        lock.lock()
        defer { lock.unlock() }
        let previous = try set(bytes)
        if holders == 0 { baseline = previous }
        holders += 1
        return WiredLimit(bytes: bytes, previousBytes: previous)
    }

    /// Move this holder's limit, for a plan whose target changed.
    package func update(bytes requested: Int) throws {
        let next = try Self.clamped(requested)
        Self.lock.lock()
        defer { Self.lock.unlock() }
        guard next != bytes else { return }
        _ = try Self.set(next)
        bytes = next
    }

    deinit {
        Self.lock.lock()
        defer { Self.lock.unlock() }
        Self.holders -= 1
        if Self.holders == 0 { _ = try? Self.set(Self.baseline) }
    }

    private static func clamped(_ requested: Int) throws -> Int {
        guard requested > 0 else { throw Refused(description: "the wired limit must be positive") }
        guard let ceiling = GPU.maxRecommendedWorkingSetBytes() else {
            throw Refused(description: "the Metal working set is unknown")
        }
        return min(requested, ceiling)
    }

    /// Set the process limit and return the one it replaces. An MLX refusal is
    /// thrown, never fatal. `package` so the checks can reach the refusal.
    @discardableResult
    package static func set(_ bytes: Int) throws -> Int {
        guard bytes >= 0 else { throw Refused(description: "the wired limit must not be negative") }
        var previous: size_t = 0
        do {
            try withError { _ = mlx_set_wired_limit(&previous, size_t(bytes)) }
        } catch {
            throw Refused(description: "\(error)")
        }
        return Int(previous)
    }
}
