import Foundation

/// Durable saving, off the runtime actor.
///
/// The runtime changes its state in memory and hands each changed state here
/// at once, so a click, a snapshot or streaming text never waits for a disk
/// write. Changes that arrive while a save runs are merged into the next save:
/// every save writes the latest state against what is already on disk, so no
/// change is skipped. Artifacts and files published by a change travel with
/// it and are never dropped; a failed save keeps them for the retry, because
/// the state in memory already records them.
///
/// App records are different: an app hears whether its write was saved, so a
/// record is written with the first save that takes it or not at all, and its
/// ticket reports which.
///
/// Callers whose promise to the person is durability wait for it: accepting
/// a message, confirming a saved draft, publishing an approved document, app
/// or skill, and marking reviewed file changes as being applied.
final class SaveQueue: @unchecked Sendable {
    struct Batch {
        var state: HomeState
        var revision: Int
        var artifacts: [ArtifactProposal] = []
        var documents: [HomeStore.Document] = []
        var files: [HomeStore.OwnedFile] = []
        /// The tickets of the app records in `documents`.
        var tickets: [Int] = []
        mutating func absorb(_ newer: Batch) {
            state = newer.state; revision = max(revision, newer.revision)
            artifacts += newer.artifacts
            for document in newer.documents {
                if let at = documents.firstIndex(where: { $0.path == document.path }) { documents[at] = document }
                else { documents.append(document) }
            }
            files += newer.files
            tickets += newer.tickets
        }
        /// The retry of a failed save: the same state and publications,
        /// without the app records, whose writers heard about the failure.
        var withoutRecords: Batch { var value = self; value.documents = []; value.tickets = []; return value }
    }
    private let lock = NSLock()
    private var pending: Batch?
    private var wake: CheckedContinuation<Void, Never>?
    private var closed = false
    private var held = false
    /// The newest revision confirmed on disk.
    private var durable: Int
    /// Revisions up to this one failed with this error; later saves may still
    /// succeed and move `durable` past it.
    private var failure: (revision: Int, error: Error)?
    private var conflict = false
    private var waiters: [(revision: Int, continuation: CheckedContinuation<Void, Error>)] = []
    private var lastTicket = 0
    /// Saves written so far, for checks that changes merge.
    private var written = 0
    private var outcomes: [Int: Result<Void, Error>] = [:]
    private var ticketWaiters: [Int: CheckedContinuation<Void, Error>] = [:]
    private static let paused = SevraError.conflict("Home records changed outside Sevra. Writes and AI context are paused; the changed files have been preserved.")
    private static let closing = SevraError.refused("Sevra is closing. Your saved files are preserved.")

    init(durable revision: Int) { durable = revision }

    /// Queues the latest state. Never blocks on disk.
    func submit(_ batch: Batch) {
        let signal: CheckedContinuation<Void, Never>? = lock.withLock {
            guard !closed else { return nil }
            enqueue(batch)
            return takeWake()
        }
        signal?.resume()
    }
    /// Queues app records with the state. The ticket reports whether they
    /// were saved; while writes are paused or closing they are refused at once.
    func submit(records batch: Batch) -> Int {
        var resumes: [(CheckedContinuation<Void, Error>, Result<Void, Error>)] = []
        let (ticket, signal): (Int, CheckedContinuation<Void, Never>?) = lock.withLock {
            lastTicket += 1
            let ticket = lastTicket
            if closed || held {
                resolve(ticket, .failure(held ? (failure?.error ?? Self.paused) : Self.closing), into: &resumes)
                return (ticket, nil)
            }
            var value = batch; value.tickets = [ticket]
            enqueue(value)
            return (ticket, takeWake())
        }
        signal?.resume()
        resumes.forEach { $0.0.resume(with: $0.1) }
        return ticket
    }
    /// Must hold the lock.
    private func enqueue(_ batch: Batch) {
        if pending == nil { pending = batch } else { pending!.absorb(batch) }
    }
    /// Must hold the lock. The loop's continuation, if a batch can be taken.
    private func takeWake() -> CheckedContinuation<Void, Never>? {
        guard !held || closed else { return nil }
        defer { wake = nil }
        return wake
    }
    /// Must hold the lock. Records a ticket's outcome for its waiter.
    private func resolve(_ ticket: Int, _ outcome: Result<Void, Error>, into resumes: inout [(CheckedContinuation<Void, Error>, Result<Void, Error>)]) {
        if let waiter = ticketWaiters.removeValue(forKey: ticket) { resumes.append((waiter, outcome)) }
        else { outcomes[ticket] = outcome }
    }
    /// The next batch to write, waiting until one exists. Nil once closed and
    /// drained.
    func next() async -> Batch? {
        while true {
            let ready: Batch?? = lock.withLock {
                if !held, let batch = pending { pending = nil; return .some(batch) }
                // Closing ends the loop once drained. Writes held by a
                // conflict cannot drain; their bytes stay as they are on disk.
                if closed && (pending == nil || held) { return .some(nil) }
                return nil
            }
            if let ready { return ready }
            await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
                let resumeNow: Bool = lock.withLock {
                    if (!held && pending != nil) || (closed && (pending == nil || held)) { return true }
                    wake = continuation
                    return false
                }
                if resumeNow { continuation.resume() }
            }
        }
    }
    /// `batch` is on disk.
    func completed(_ batch: Batch) {
        var resumes: [(CheckedContinuation<Void, Error>, Result<Void, Error>)] = []
        lock.withLock {
            written += 1
            durable = max(durable, batch.revision)
            if let failure, failure.revision <= durable { self.failure = nil }
            for waiter in waiters where waiter.revision <= durable { resumes.append((waiter.continuation, .success(()))) }
            waiters.removeAll { $0.revision <= durable }
            for ticket in batch.tickets { resolve(ticket, .success(()), into: &resumes) }
        }
        resumes.forEach { $0.0.resume(with: $0.1) }
    }
    /// A save of `batch` failed. Its state and publications return to the
    /// queue for the next attempt, its app records are dropped, and everyone
    /// waiting on it hears why.
    func failed(_ batch: Batch, error: Error, isConflict: Bool) {
        var resumes: [(CheckedContinuation<Void, Error>, Result<Void, Error>)] = []
        lock.withLock {
            failure = (batch.revision, error)
            if isConflict { conflict = true; held = true }
            for ticket in batch.tickets { resolve(ticket, .failure(error), into: &resumes) }
            var retry = batch.withoutRecords
            if let newer = pending { retry.absorb(newer) }
            pending = retry
            // A conflict holds every write until the person reviews it, so
            // no one waiting would hear back; a transient failure retries,
            // so only the revisions this attempt carried hear about it.
            let due = isConflict ? waiters : waiters.filter { $0.revision <= batch.revision }
            if isConflict { waiters.removeAll() } else { waiters.removeAll { $0.revision <= batch.revision } }
            for waiter in due { resumes.append((waiter.continuation, .failure(error))) }
            if isConflict { dropRecords(error, into: &resumes) }
        }
        resumes.forEach { $0.0.resume(with: $0.1) }
    }
    /// Must hold the lock. App records still queued will not be written.
    private func dropRecords(_ error: Error, into resumes: inout [(CheckedContinuation<Void, Error>, Result<Void, Error>)]) {
        guard let batch = pending else { return }
        for ticket in batch.tickets { resolve(ticket, .failure(error), into: &resumes) }
        pending = batch.withoutRecords
    }
    /// Waits until `revision` is on disk, or throws the error that stopped it.
    func wait(for revision: Int) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            let outcome: Result<Void, Error>? = lock.withLock {
                if durable >= revision { return .success(()) }
                if held { return .failure(failure?.error ?? Self.paused) }
                if closed && pending == nil { return .failure(Self.closing) }
                waiters.append((revision, continuation))
                return nil
            }
            if let outcome { continuation.resume(with: outcome) }
        }
    }
    /// Waits until the app records behind `ticket` are saved, or throws why
    /// they were not.
    func wait(ticket: Int) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            let outcome: Result<Void, Error>? = lock.withLock {
                if let outcome = outcomes.removeValue(forKey: ticket) { return outcome }
                ticketWaiters[ticket] = continuation
                return nil
            }
            if let outcome { continuation.resume(with: outcome) }
        }
    }
    /// Writes resume after the person resolves a storage conflict.
    func resume() {
        let signal: CheckedContinuation<Void, Never>? = lock.withLock {
            conflict = false; held = false; failure = nil
            guard pending != nil else { return nil }
            defer { wake = nil }
            return wake
        }
        signal?.resume()
    }
    /// After closing, a failed save is not retried forever: everyone waiting
    /// hears the error and the loop ends. True when that happened.
    func abandonIfClosed(_ error: Error) -> Bool {
        var resumes: [(CheckedContinuation<Void, Error>, Result<Void, Error>)] = []
        let abandoned: Bool = lock.withLock {
            guard closed else { return false }
            dropRecords(error, into: &resumes)
            pending = nil
            for waiter in waiters { resumes.append((waiter.continuation, .failure(error))) }
            waiters.removeAll()
            return true
        }
        resumes.forEach { $0.0.resume(with: $0.1) }
        return abandoned
    }
    /// No further saves are accepted; pending ones still finish.
    func close() {
        var resumes: [(CheckedContinuation<Void, Error>, Result<Void, Error>)] = []
        let signal: CheckedContinuation<Void, Never>? = lock.withLock {
            closed = true
            // With writes held, nothing will drain; answer everyone now.
            if held {
                for waiter in waiters { resumes.append((waiter.continuation, .failure(Self.closing))) }
                waiters.removeAll()
                dropRecords(Self.closing, into: &resumes)
            }
            defer { wake = nil }
            return wake
        }
        signal?.resume()
        resumes.forEach { $0.0.resume(with: $0.1) }
    }
    var durableRevision: Int { lock.withLock { durable } }
    var savesWritten: Int { lock.withLock { written } }
    var conflicted: Bool { lock.withLock { conflict } }
    var lastFailure: String? { lock.withLock { failure?.error.localizedDescription } }
    /// True while a change is waiting to be written.
    var hasPending: Bool { lock.withLock { pending != nil } }
}

/// Owns the Home store once it has opened. Saves and every other store
/// operation run here, one at a time, never on the runtime actor.
actor HomeWriter {
    private let store: HomeStore
    let queue: SaveQueue
    private var loop: Task<Void, Never>?
    private var grantsVersion = 0

    init(store: HomeStore, queue: SaveQueue) {
        self.store = store; self.queue = queue
    }
    func start() {
        guard loop == nil else { return }
        loop = Task { await self.run() }
    }
    private func run() async {
        var failures = 0
        while let batch = await queue.next() {
            do {
                try store.save(batch.state, artifacts: batch.artifacts, extraDocuments: batch.documents, files: batch.files)
                queue.completed(batch)
                failures = 0
            } catch {
                let conflict: Bool
                if case SevraError.conflict = error { conflict = true } else { conflict = false }
                queue.failed(batch, error: error, isConflict: conflict)
                if queue.abandonIfClosed(error) { break }
                guard !conflict else { continue }
                // A transient failure (a full disk, a slow helper) retries with
                // backoff; the change stays queued and visible meanwhile.
                failures += 1
                try? await Task.sleep(nanoseconds: UInt64(min(8, 1 << min(failures, 3))) * 250_000_000)
            }
        }
    }
    /// Runs a store operation in turn with saves.
    func perform<T>(_ operation: (HomeStore) throws -> T) rethrows -> T { try operation(store) }
    /// Saves device grants. Callers change their cache first and number each
    /// change, so a save that arrives late never replaces a newer one.
    func saveGrants(_ grants: [String: AppGrant], version: Int) throws {
        guard version > grantsVersion else { return }
        try store.saveGrants(grants)
        grantsVersion = version
    }
    /// Waits for the writer to finish every queued save and stop.
    func finish() async {
        queue.close()
        await loop?.value
    }
}
