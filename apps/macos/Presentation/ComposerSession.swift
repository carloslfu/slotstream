import Foundation
import Combine

/// The composer owns its acknowledged draft independently of display snapshots.
/// Only this object schedules draft writes; timers, navigation and Send join it.
@MainActor public final class ComposerSession: ObservableObject {
    public struct Draft: Equatable, Sendable {
        public var text: String
        public var revision: Int
        public init(text: String, revision: Int) { self.text = text; self.revision = revision }
    }
    public struct Changed: Error {
        public let current: Draft
        public init(_ current: Draft) { self.current = current }
    }
    public enum Issue: Equatable {
        case save(String), conflict(Draft), send(String)
        public var message: String {
            switch self {
            case .save(let reason): return "Sevra could not confirm that your draft was saved. " + reason
            case .conflict: return "The saved draft changed before saving finished. Your text is still here. Choose which version to keep."
            case .send(let reason): return "Sevra could not confirm that your message was sent. " + reason
            }
        }
    }
    public struct Store {
        public var read: (String) async throws -> Draft
        public var write: (String, String, Int) async throws -> Draft
        /// Accept the message and replace its draft in one durable transaction.
        public var send: (String, String, String, Int, String) async throws -> Draft
        public init(read: @escaping (String) async throws -> Draft,
                    write: @escaping (String, String, Int) async throws -> Draft,
                    send: @escaping (String, String, String, Int, String) async throws -> Draft) {
            self.read = read; self.write = write; self.send = send
        }
    }
    @Published public private(set) var threadID = "home"
    @Published public private(set) var text = ""
    @Published public private(set) var saved = true { didSet { if saved { unsavedSince = nil } } }
    @Published public private(set) var saving = false
    @Published public private(set) var sending = false
    @Published public private(set) var transitioning = false
    @Published public private(set) var closing = false
    @Published public private(set) var issue: Issue?
    @Published public private(set) var ready = false
    public var canSend: Bool {
        guard ready, !finished, !sending, !transitioning, !closing,
              !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return false }
        switch issue { case .save, .conflict: return false; default: return true }
    }
    private let store: Store
    private let delay: UInt64
    private let maxWait: UInt64
    /// When the oldest edit not yet saved was made, on the uptime clock.
    private var unsavedSince: UInt64?
    private var acknowledged = Draft(text: "", revision: 0)
    private var generation = 0
    private var debounce: Task<Void, Never>?
    private var writer: Task<Bool, Never>?
    private var finished = false
    // Retained until the input changes so an uncertain acceptance can be retried
    // with the same nonce instead of creating a duplicate user message.
    private var submission: (text: String, nonce: String)?

    /// Autosave waits for a pause in typing, but never longer than
    /// `maxWaitNanoseconds` after the first unsaved edit, so typing that never
    /// pauses is still saved about once a second.
    public init(store: Store, debounceNanoseconds: UInt64 = 300_000_000, maxWaitNanoseconds: UInt64 = 1_000_000_000) {
        self.store = store; delay = debounceNanoseconds; maxWait = max(debounceNanoseconds, maxWaitNanoseconds)
    }
    public func open(_ id: String) async throws {
        guard !ready else { return }
        let value = try await store.read(id)
        activate(id, value)
    }
    private func activate(_ id: String, _ value: Draft) {
        debounce?.cancel(); threadID = id; acknowledged = value; text = value.text
        generation += 1; saved = true; issue = nil; submission = nil; ready = true; unsavedSince = nil
    }
    private static var now: UInt64 { DispatchTime.now().uptimeNanoseconds }
    public func edit(_ value: String) {
        guard ready, !finished, !closing, text != value else { return }
        text = value; generation += 1; saved = text == acknowledged.text
        if saved { unsavedSince = nil } else if unsavedSince == nil { unsavedSince = Self.now }
        // A real competing edit needs an explicit choice, never blind rebasing.
        if case .conflict = issue { return }
        issue = nil
        schedule()
    }
    private func schedule() {
        debounce?.cancel()
        guard !finished, !sending, !saved, issue == nil else { return }
        let elapsed = unsavedSince.map { Self.now &- $0 } ?? 0
        let wait = min(delay, maxWait > elapsed ? maxWait - elapsed : 0)
        debounce = Task { [weak self] in
            if wait > 0 { do { try await Task.sleep(nanoseconds: wait) } catch { return } }
            guard let self, !Task.isCancelled else { return }
            await self.autosave()
        }
    }
    /// One write per wait. Typing that continued meanwhile schedules the next
    /// write, so continuous typing never turns into back-to-back disk writes.
    private func autosave() async {
        guard ready, !finished, !sending, writer == nil, !saved else { return }
        if case .conflict = issue { return }
        let task = Task { await self.drain(once: true) }
        writer = task
        _ = await task.value
        writer = nil
        schedule()
    }
    /// Join an existing writer, then drain the newest text, including edits
    /// made while a write is awaiting disk, before allowing navigation or close.
    @discardableResult public func flush() async -> Bool {
        guard ready, !finished, !sending else { return false }
        if let writer {
            _ = await writer.value
            guard issue == nil else { return false }
        }
        if case .conflict = issue { return false }
        if saved { return true }
        debounce?.cancel()
        let task = Task { await self.drain() }
        writer = task
        let result = await task.value
        writer = nil
        return result && saved
    }
    private func drain(once: Bool = false) async -> Bool {
        saving = true
        defer { saving = false }
        var rebases = 0
        while !saved {
            let attempt = text, base = acknowledged
            do {
                acknowledged = try await store.write(threadID, attempt, base.revision)
                saved = text == acknowledged.text
                unsavedSince = saved ? nil : Self.now
                if case .save = issue { issue = nil }
                if once { break }
            } catch let changed as Changed {
                // A lost acknowledgement or revision-only change is safe to
                // reconcile. A different saved draft must remain protected.
                guard changed.current.text == attempt || changed.current.text == base.text else {
                    issue = .conflict(changed.current); return false
                }
                acknowledged = changed.current; saved = text == acknowledged.text
                rebases += 1
                if rebases > 2, !saved { issue = .save("Saving is busy. Try again."); return false }
            } catch {
                issue = .save(error.localizedDescription); return false
            }
            if sending { break } // Send owns the next operation, not another autosave.
        }
        return saved
    }
    @discardableResult public func retry() async -> Bool {
        guard !sending, !transitioning else { return false }
        if case .conflict = issue { return false }
        if case .send = issue { return await send() }
        issue = nil
        return await flush()
    }
    /// Refresh after an explicit external-file adoption. A local unsaved edit
    /// remains visible and requires the existing two-version choice.
    public func reloadAfterExternalReview() async throws {
        debounce?.cancel()
        if let writer { _ = await writer.value }
        guard ready, !sending, !transitioning, !closing else { return }
        let value = try await store.read(threadID)
        if saved || text == value.text { activate(threadID, value) }
        else { issue = .conflict(value); saved = false }
    }
    public func keepMyDraft() async {
        guard case .conflict(let current) = issue, !sending, !transitioning else { return }
        acknowledged = current; saved = text == current.text; issue = nil
        _ = await flush()
    }
    public func useSavedDraft() {
        guard case .conflict(let current) = issue, !sending, !transitioning else { return }
        activate(threadID, current)
    }
    /// Preparation may suspend (reading/creating the destination). The final
    /// flush happens AFTER it, so typing during that suspension is also saved.
    public func move(prepare: () async throws -> (String, Draft), discardCurrent: Bool = false) async throws -> Bool {
        guard ready, !finished, !sending, !transitioning, !closing else { return false }
        transitioning = true
        defer { transitioning = false }
        if !discardCurrent { guard await flush() else { return false } }
        let destination = try await prepare()
        if !discardCurrent { guard await flush() else { return false } }
        else {
            debounce?.cancel()
            if let writer { _ = await writer.value }
        }
        activate(destination.0, destination.1)
        return true
    }
    public func move(to id: String) async throws -> Bool {
        guard id != threadID else { return true }
        return try await move { (id, try await store.read(id)) }
    }
    @discardableResult public func send() async -> Bool {
        guard ready, !finished, !sending, !transitioning, !closing,
              !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return false }
        if case .conflict = issue { return false }
        let prompt = text, sentGeneration = generation
        if submission?.text != prompt { submission = (prompt, UUID().uuidString.lowercased()) }
        let nonce = submission!.nonce
        sending = true; debounce?.cancel()
        defer { sending = false; schedule() }
        if let writer { _ = await writer.value }
        if case .conflict = issue { return false }
        // A failed draft write does not justify sending through a failed store.
        if case .save = issue { return false }
        var rebases = 0
        while true {
            let sendingGeneration = generation
            let remaining = generation == sentGeneration ? "" : text
            let base = acknowledged
            do {
                let result = try await store.send(threadID, prompt, nonce, base.revision, remaining)
                acknowledged = result
                if result.text != remaining {
                    // A retried, already accepted nonce can return a draft
                    // subsequently changed by another client. Never erase it.
                    saved = false; issue = .conflict(result); submission = nil
                    return true
                }
                if generation == sendingGeneration { text = remaining; generation += 1 }
                saved = text == result.text; issue = nil; submission = nil
                return true
            } catch let changed as Changed {
                guard changed.current.text == base.text, rebases < 2 else {
                    issue = .conflict(changed.current); return false
                }
                acknowledged = changed.current; rebases += 1
            } catch {
                issue = .send(error.localizedDescription); return false
            }
        }
    }
    /// Prevent close/quit while Send is still being accepted. The caller only
    /// shuts down the runtime after this returns true.
    public func prepareToClose() async -> Bool {
        guard !sending, !transitioning, !closing else { return false }
        return await flush()
    }
    public func close(perform operation: () async throws -> Void) async throws -> Bool {
        guard ready, !finished, !sending, !transitioning, !closing else { return false }
        closing = true
        defer { closing = false }
        guard await flush() else { return false }
        try await operation()
        return true
    }
    public func finish() { finished = true; debounce?.cancel() }
}
