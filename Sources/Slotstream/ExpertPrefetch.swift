// Expert Lookahead prefetch, version zero: raw staging only.
//
// A forecast never inserts an expert into the slot pool, never sets a CLOCK
// reference bit or a pin, and never reserves a future victim. It only reads
// candidate records into owned, aligned raw buffers ahead of the layer that
// may demand them. When `SlotPool.ensureCore` sees an actual miss whose ticket
// is complete, the ticket's nine buffers become that record's staging arrays
// and are scattered into the slot the ordinary victim scan chose, exactly as a
// demand read would have been. A wrong forecast costs a read and a buffer; it
// can never change which bytes land in which slot.
//
// Ownership: a ticket owns its buffers until either the model thread adopts
// them (MLX then owns them until the scatter graph releases them) or the
// ticket is discarded (the worker frees them if it is still running, the model
// thread frees them otherwise). Only the model thread touches MLX, the pool,
// pins or model state. Workers read through the store's existing checked
// read seam with immutable descriptors and offsets, check cancellation
// between pieces, and count their bytes against one shared cap that covers
// reading, ready and adopted-but-unreleased buffers.

import Darwin
import Foundation
import MLX

/// One shared lane budget for speculative and ordinary demand reads. Demand
/// keeps its existing lanes and priority: while a demand batch is being read,
/// speculative workers finish only the piece already in flight.
package final class IOLaneBudget {
    private let condition = NSCondition()
    private var demandActive = 0
    private var speculativeInUse = 0
    package let speculativeLanes: Int
    private var demandBatchCount = 0
    private var deferredCount = 0

    package init(speculativeLanes: Int) {
        self.speculativeLanes = max(1, speculativeLanes)
    }

    package func beginDemand() {
        condition.lock(); demandActive += 1; demandBatchCount += 1; condition.unlock()
    }

    package func endDemand() {
        condition.lock(); demandActive = max(0, demandActive - 1); condition.broadcast(); condition.unlock()
    }

    /// Returns false when the caller was cancelled while waiting. A worker
    /// whose ticket has been promoted to demand (`priority`) acquires at once,
    /// over the speculative budget and alongside demand: its remaining pieces
    /// are demand reads now, and waiting behind the queue would only delay the
    /// layer that asked for them.
    package func acquireSpeculative(shouldContinue: () -> Bool, priority: () -> Bool = { false }) -> Bool {
        condition.lock()
        defer { condition.unlock() }
        var deferred = false
        while demandActive > 0 || speculativeInUse >= speculativeLanes {
            if priority() { break }
            guard shouldContinue() else { return false }
            deferred = true
            condition.wait(until: Date(timeIntervalSinceNow: 0.005))
        }
        if deferred { deferredCount += 1 }
        speculativeInUse += 1
        return true
    }

    /// Wake waiting workers so a promotion is noticed without the wait slice.
    package func wake() { condition.lock(); condition.broadcast(); condition.unlock() }

    package func releaseSpeculative() {
        condition.lock(); speculativeInUse = max(0, speculativeInUse - 1); condition.broadcast(); condition.unlock()
    }

    package var demandBatches: Int { condition.lock(); defer { condition.unlock() }; return demandBatchCount }
    package var deferredAcquisitions: Int { condition.lock(); defer { condition.unlock() }; return deferredCount }
    package var snapshot: (demandActive: Int, speculativeInUse: Int) {
        condition.lock(); defer { condition.unlock() }
        return (demandActive, speculativeInUse)
    }
}

/// Bytes owned by speculative buffers in any state up to their release by
/// MLX. Thread-safe because MLX finalizers may run on any thread.
package final class ExpertPrefetchAccounting {
    private let lock = NSLock()
    private var live = 0
    private var peak = 0
    private var releases = 0
    package let capBytes: Int

    package init(capBytes: Int) { self.capBytes = capBytes }

    package func reserve(_ bytes: Int) -> Bool {
        lock.lock(); defer { lock.unlock() }
        guard bytes >= 0, live + bytes <= capBytes else { return false }
        live += bytes
        peak = max(peak, live)
        return true
    }

    package func release(_ bytes: Int) {
        lock.lock(); live = max(0, live - bytes); releases += 1; lock.unlock()
    }

    package var liveBytes: Int { lock.lock(); defer { lock.unlock() }; return live }
    package var peakBytes: Int { lock.lock(); defer { lock.unlock() }; return peak }
    package var releaseCount: Int { lock.lock(); defer { lock.unlock() }; return releases }
}

/// Reads one piece of one record into a caller-owned aligned buffer. The
/// production reader is the store's checked read; diagnostics inject fakes.
/// Aligned host scratch buffers for slot-mode workers: a speculative piece is
/// read into scratch through the ordinary uncached file read and then copied
/// into the reserved slot's pool memory, so the file read never targets
/// GPU-shared memory. Bounded by the lane count plus a margin for promoted
/// readers; an exhausted pool hands out a temporary buffer.
package final class ExpertPrefetchScratch {
    private let lock = NSLock()
    private var free: [UnsafeMutableRawPointer] = []
    private let bytes: Int
    package private(set) var temporaries = 0

    /// True when each buffer is sized for a complete record, so a worker may
    /// issue one read for the whole record instead of one read per piece.
    package let holdsWholeRecords: Bool

    package init(pieceBytes: Int, count: Int, wholeRecords: Bool = false) {
        holdsWholeRecords = wholeRecords
        bytes = max(1, pieceBytes)
        for _ in 0 ..< max(1, count) {
            var p: UnsafeMutableRawPointer? = nil
            if posix_memalign(&p, 16384, bytes) == 0, let p { free.append(p) }
        }
    }

    deinit { free.forEach { Darwin.free($0) } }

    package func acquire() -> (pointer: UnsafeMutableRawPointer, temporary: Bool)? {
        lock.lock()
        if let p = free.popLast() { lock.unlock(); return (p, false) }
        temporaries += 1
        lock.unlock()
        var p: UnsafeMutableRawPointer? = nil
        guard posix_memalign(&p, 16384, bytes) == 0, let p else { return nil }
        return (p, true)
    }

    package func release(_ p: UnsafeMutableRawPointer, temporary: Bool) {
        if temporary { Darwin.free(p); return }
        lock.lock(); free.append(p); lock.unlock()
    }
}

/// A pool slot reserved for one speculative record in slot adoption mode.
/// The pool hands it out on the model thread with the slot's previous key
/// already evicted; the worker writes the nine pieces into `destinations`;
/// the pool takes it back through `workerLeft` (from any thread, queued for
/// the model thread) or publishes it at adoption. Never copied or retained
/// beyond the ticket that owns it.
package final class SpeculativeSlotReservation {
    package let slot: Int
    package let destinations: [UnsafeMutableRawPointer]
    package let pieceBytes: [Int]
    /// The pool piece base pointers the destinations were derived from, so
    /// adoption can refuse a record whose pool memory moved meanwhile.
    package let bases: [UnsafeMutableRawPointer]
    private let onLeave: (Int) -> Void
    private let lock = NSLock()
    private var left = false

    package init(slot: Int, destinations: [UnsafeMutableRawPointer], pieceBytes: [Int],
                 bases: [UnsafeMutableRawPointer], onLeave: @escaping (Int) -> Void) {
        self.slot = slot; self.destinations = destinations; self.pieceBytes = pieceBytes
        self.bases = bases; self.onLeave = onLeave
    }

    /// Exactly once: the record is not going to be published.
    package func workerLeft() {
        lock.lock()
        let first = !left
        left = true
        lock.unlock()
        if first { onLeave(slot) }
    }
}

package typealias ExpertPieceReader = (_ key: ExpertKey, _ piece: Int, _ destination: UnsafeMutableRawPointer,
                                       _ shouldContinue: () -> Bool) throws -> Void

/// Reads one complete record into a record-sized destination in a single call.
/// Records are contiguous in the packed layout, so this moves the same bytes as
/// nine piece reads while paying the per-call cost once. The demand path has
/// always read this way; only the speculative path read piece by piece.
package typealias ExpertRecordReader = (_ key: ExpertKey, _ destination: UnsafeMutableRawPointer,
                                        _ shouldContinue: () -> Bool) throws -> Void

package final class ExpertPrefetchTicket {
    package enum State: String { case queued, reading, ready, adopted, discarded, failed }

    package let key: ExpertKey
    package let pass: Int
    package let revision: UInt64
    package let bytes: Int
    package let pieceBytes: [Int]
    private let accounting: ExpertPrefetchAccounting
    private let lock = NSLock()
    private var buffers: [UnsafeMutableRawPointer]?
    /// Slot mode: the reserved pool slot and its nine piece destinations,
    /// owned by the pool; the worker writes there and never frees them.
    package let slotReservation: SpeculativeSlotReservation?
    private var stateValue: State = .queued
    private var cancelled = false
    private var workerOwnsBuffers = false
    private var errorValue: Error?
    private let group = DispatchGroup()
    private var started = false
    private var promotedFlag = false
    private var lanesRef: IOLaneBudget?
    package private(set) var readNanos: UInt64 = 0
    package private(set) var completedAt: UInt64 = 0
    package private(set) var piecesRead = 0
    private var piecesDone = 0
    /// Pieces completed so far by a running worker. Zero means the worker
    /// has not finished its first piece: it is waiting for a lane or has just
    /// started, and a demand for its key is served faster by the demand path.
    package var progress: Int { lock.lock(); defer { lock.unlock() }; return piecesDone }

    /// Allocation reserves against the cap; nil when the cap is exhausted.
    package init?(key: ExpertKey, pass: Int, revision: UInt64, pieceBytes: [Int], accounting: ExpertPrefetchAccounting) {
        let total = pieceBytes.reduce(0, +)
        guard !pieceBytes.isEmpty, pieceBytes.allSatisfy({ $0 > 0 }), accounting.reserve(total) else { return nil }
        var allocated: [UnsafeMutableRawPointer] = []
        for pb in pieceBytes {
            var p: UnsafeMutableRawPointer? = nil
            let rc = posix_memalign(&p, 16384, pb)
            guard rc == 0, let p else {
                allocated.forEach { free($0) }
                accounting.release(total)
                return nil
            }
            allocated.append(p)
        }
        self.key = key; self.pass = pass; self.revision = revision; self.bytes = total
        self.pieceBytes = pieceBytes; self.accounting = accounting; self.buffers = allocated
        self.slotReservation = nil
    }

    /// Slot mode: no allocation and no byte accounting; the destinations are
    /// the reserved slot's pool memory. `buffers` is nil throughout, so every
    /// staging-mode path (adopt, staging arrays, deinit) is a no-op.
    package init(key: ExpertKey, pass: Int, revision: UInt64, reservation: SpeculativeSlotReservation,
                 accounting: ExpertPrefetchAccounting) {
        self.key = key; self.pass = pass; self.revision = revision
        self.pieceBytes = reservation.pieceBytes; self.bytes = reservation.pieceBytes.reduce(0, +)
        self.accounting = accounting; self.buffers = nil
        self.slotReservation = reservation
    }

    package var isSlotMode: Bool { slotReservation != nil }

    deinit {
        // A ticket dropped without adoption or discard must not leak; a live
        // worker always transitions out of `workerOwnsBuffers` before leaving.
        if let owned = buffers { owned.forEach { free($0) }; accounting.release(bytes) }
    }

    package var state: State { lock.lock(); defer { lock.unlock() }; return stateValue }
    package var isPromoted: Bool { lock.lock(); defer { lock.unlock() }; return promotedFlag }
    /// Demand has asked for this record while it was being read: the rest of
    /// the read proceeds at demand priority.
    package func promote() {
        lock.lock(); promotedFlag = true; let lanes = lanesRef; lock.unlock()
        lanes?.wake()
    }
    /// True when this ticket's record was fetched in one whole-record read.
    package var readWholeRecord: Bool { lock.lock(); defer { lock.unlock() }; return recordReadValue }
    package var error: Error? { lock.lock(); defer { lock.unlock() }; return errorValue }
    private var recordReadValue = false
    package var isCancelled: Bool { lock.lock(); defer { lock.unlock() }; return cancelled }
    package var ownsBuffers: Bool { lock.lock(); defer { lock.unlock() }; return buffers != nil }

    /// Launch the owned worker. Pieces are read in order through the checked
    /// reader, so injected faults and EINTR handling apply here too. When a
    /// whole-record reader and a record-sized scratch buffer are both supplied,
    /// the worker instead takes one lane, issues one read for the record and
    /// copies the nine pieces into their destinations, which is the shape the
    /// demand path uses.
    package func start(reader: @escaping ExpertPieceReader, lanes: IOLaneBudget,
                       queue: DispatchQueue = DispatchQueue.global(qos: .userInitiated),
                       scratch: ExpertPrefetchScratch? = nil,
                       recordReader: ExpertRecordReader? = nil) {
        lock.lock()
        let destinations: [UnsafeMutableRawPointer]
        if let reservation = slotReservation {
            guard stateValue == .queued, !started else { lock.unlock(); return }
            destinations = reservation.destinations
        } else {
            guard stateValue == .queued, !started, let owned = buffers else { lock.unlock(); return }
            destinations = owned
        }
        let owned = destinations
        let viaScratch = slotReservation != nil ? scratch : nil
        stateValue = .reading
        started = true
        workerOwnsBuffers = buffers != nil
        lanesRef = lanes
        lock.unlock()
        group.enter()
        queue.async { [self] in
            defer { group.leave() }
            let began = RuntimeClock.now()
            var failure: Error?
            var completed = 0
            if let recordReader, let viaScratch, viaScratch.holdsWholeRecords {
                // One lane, one read, nine copies. A cancelled ticket now stops
                // between records rather than between pieces; nothing is lost,
                // because a partially read record is discarded either way.
                if !isCancelled,
                   lanes.acquireSpeculative(shouldContinue: { !self.isCancelled }, priority: { self.isPromoted }) {
                    do {
                        guard let (buffer, temporary) = viaScratch.acquire() else {
                            throw ModelError("out of memory for a speculative record buffer")
                        }
                        defer { viaScratch.release(buffer, temporary: temporary) }
                        try recordReader(key, buffer, { !self.isCancelled })
                        var offset = 0
                        for piece in 0 ..< pieceBytes.count {
                            memcpy(owned[piece], buffer + offset, pieceBytes[piece])
                            offset += pieceBytes[piece]
                        }
                        completed = pieceBytes.count
                        lock.lock(); piecesDone = completed; recordReadValue = true; lock.unlock()
                    } catch { failure = error }
                    lanes.releaseSpeculative()
                }
                finishWorker(began: began, completed: completed, failure: failure)
                return
            }
            for piece in 0 ..< pieceBytes.count {
                guard !isCancelled else { break }
                guard lanes.acquireSpeculative(shouldContinue: { !self.isCancelled }, priority: { self.isPromoted }) else { break }
                do {
                    if let viaScratch {
                        // Slot mode: the file read lands in host scratch; the slot's
                        // pool memory only ever sees a plain memory copy.
                        guard let (buffer, temporary) = viaScratch.acquire() else {
                            throw ModelError("out of memory for a speculative scratch buffer")
                        }
                        defer { viaScratch.release(buffer, temporary: temporary) }
                        try reader(key, piece, buffer, { !self.isCancelled })
                        memcpy(owned[piece], buffer, pieceBytes[piece])
                    } else {
                        try reader(key, piece, owned[piece], { !self.isCancelled })
                    }
                    completed += 1
                    lock.lock(); piecesDone = completed; lock.unlock()
                } catch { failure = error }
                lanes.releaseSpeculative()
                if failure != nil { break }
            }
            finishWorker(began: began, completed: completed, failure: failure)
        }
    }

    /// Shared completion for both read shapes: record the timing, publish the
    /// state, free owned buffers exactly once and hand an unused slot back.
    private func finishWorker(began: UInt64, completed: Int, failure: Error?) {
        lock.lock()
        readNanos = RuntimeClock.now() - began
        piecesRead = completed
        workerOwnsBuffers = false
        if cancelled || failure != nil || completed != pieceBytes.count {
            // The model thread may already have asked for a discard while
            // this worker held the buffers; free exactly once, here.
            if let owned = buffers { owned.forEach { free($0) }; buffers = nil; accounting.release(bytes) }
            stateValue = failure != nil && !cancelled ? .failed : .discarded
            errorValue = failure
        } else {
            stateValue = .ready
            completedAt = RuntimeClock.now()
        }
        let reservation = slotReservation
        let unused = stateValue != .ready
        lock.unlock()
        // Slot mode: a worker that leaves without a complete record hands
        // the slot back; a complete record keeps it until the owner adopts
        // or discards the ticket (both on the model thread).
        if unused { reservation?.workerLeft() }
    }

    /// Slot mode: the complete record's slot, once, for the owner to publish.
    package func adoptSlot() -> SpeculativeSlotReservation? {
        lock.lock(); defer { lock.unlock() }
        guard let reservation = slotReservation, stateValue == .ready else { return nil }
        stateValue = .adopted
        return reservation
    }

    package func cancel() { lock.lock(); cancelled = true; lock.unlock() }

    /// Blocks until the worker has left. Only the owner joins, and only when
    /// promoting an in-flight record to demand or closing the request.
    package func join() { group.wait() }

    /// Transfer buffer ownership to the caller after a complete read. The
    /// accounting release is the caller's responsibility (the MLX finalizer).
    package func adopt() -> [UnsafeMutableRawPointer]? {
        lock.lock(); defer { lock.unlock() }
        guard stateValue == .ready, let owned = buffers else { return nil }
        buffers = nil
        stateValue = .adopted
        return owned
    }

    /// Release without adoption. A running worker frees on its own exit; a
    /// completed or queued ticket frees now. Never frees adopted bytes.
    package func discard() {
        lock.lock()
        cancelled = true
        if !workerOwnsBuffers, let owned = buffers {
            owned.forEach { free($0) }
            buffers = nil
            accounting.release(bytes)
        }
        var giveBack: SpeculativeSlotReservation? = nil
        if stateValue == .queued || stateValue == .ready {
            stateValue = .discarded
            giveBack = slotReservation
        }
        lock.unlock()
        // A reading worker gives the slot back itself when it leaves.
        giveBack?.workerLeft()
    }

    /// The nine buffers as their own MLX staging arrays. Zero host copies: the
    /// scatter graph reads these bytes and the finalizer frees them and pays
    /// the accounting back when that graph has released them.
    package func makeStagingArrays(shapes: [(shape: [Int], dtype: DType)]) -> [MLXArray]? {
        guard shapes.count == pieceBytes.count, let owned = adopt() else { return nil }
        let accounting = self.accounting
        let bytes = self.bytes
        let counter = ReleaseCounter(count: owned.count) { accounting.release(bytes) }
        var out: [MLXArray] = []
        for (p, spec) in shapes.enumerated() {
            let pointer = owned[p]
            out.append(MLXArray(rawPointer: pointer, [1] + spec.shape, dtype: spec.dtype) {
                free(pointer)
                counter.release()
            })
        }
        return out
    }

    /// Adopt into caller-managed raw buffers (diagnostics only): the caller
    /// frees them and releases the accounting through `finishedRaw`.
    package func adoptRaw() -> (buffers: [UnsafeMutableRawPointer], release: () -> Void)? {
        guard let owned = adopt() else { return nil }
        let accounting = self.accounting
        let bytes = self.bytes
        return (owned, { owned.forEach { free($0) }; accounting.release(bytes) })
    }

    private final class ReleaseCounter {
        private let lock = NSLock()
        private var remaining: Int
        private let done: () -> Void
        init(count: Int, done: @escaping () -> Void) { remaining = count; self.done = done }
        func release() {
            lock.lock()
            remaining -= 1
            let finished = remaining == 0
            lock.unlock()
            if finished { done() }
        }
    }
}

public struct ExpertPrefetchObservation: Codable, Equatable {
    public var mode = "off"
    public var passes = 0
    public var forecastPasses = 0
    public var candidates = 0
    public var issued = 0
    public var adopted = 0
    public var promoted = 0
    public var expired = 0
    public var cancelled = 0
    public var failed = 0
    public var capRefusals = 0
    public var demandMisses = 0
    public var issuedBytes = 0
    public var adoptedBytes = 0
    public var wastedBytes = 0
    public var peakLiveBytes = 0
    public var forecastSeconds = 0.0
    public var scheduleSeconds = 0.0
    public var adoptSeconds = 0.0
    public var joinSeconds = 0.0
    public var deferredLaneAcquisitions = 0
    public var demandBatches = 0
    public var predictorIdentity = ""
    /// Router policy: candidates merged from stride forecasts, forecast
    /// hand-offs received, and dirty-target re-scans after a refresh.
    public var forecastMerged = 0
    public var forecastTargets = 0
    public var dirtyRescans = 0
    /// Router forecast cost split: graph build, the layer's joint sync (which
    /// also evaluates the streams), and host selection plus hand-off.
    public var forecastBuildSeconds = 0.0
    public var forecastEvalSeconds = 0.0
    public var forecastSelectSeconds = 0.0
    /// Slot adoption: records read straight into reserved pool slots, slots
    /// reserved (each evicts the slot's previous key), slots given back
    /// unused, reservations refused at the slot cap, and adoptions refused
    /// because the pool memory moved while the ticket was in flight.
    public var adoption = "staging"
    /// "piece" or "record": how speculative workers read. Whole-record reads
    /// issue one call per record instead of nine.
    public var readShape = "piece"
    /// Layer events that needed no demand read: every routed expert was already
    /// resident. A complete layer pays no read, no scatter and, once the barrier
    /// is deferrable, no drain. The fraction of complete layers bounds what any
    /// layer-completeness objective or residency speculation could ever win.
    public var layersComplete = 0
    /// Layer events that still had at least one demand miss.
    public var layersWithMisses = 0
    /// Workers launched with a whole-record reader (one read per record).
    public var recordReads = 0
    /// Workers launched piece by piece, including every fall back from record mode.
    public var pieceModeReads = 0
    public var slotReservations = 0
    public var slotReleases = 0
    public var slotRefusals = 0
    public var slotStale = 0
    public var slotEvictedKeys = 0
    public init() {}
}

package struct ExpertPrefetchConfiguration: Equatable {
    package enum Policy: String { case pack, recent, frequency, router }
    package enum Device: String { case gpu, cpu }
    package var enabled = false
    package var shadow = false
    package var policy: Policy = .pack
    package var device: Device = .gpu
    package var packPath: String?
    package var capRecords = 32
    package var lanes = 8
    package var windowLayers = 4
    package var topPerLayer = 16
    package var threshold: Float = -Float.infinity
    package var recentPasses = 2
    /// Router policy: the strides (layers ahead) at which each target's own
    /// hyper-connection read and router are evaluated on the live streams, the
    /// per-target issue cap per pass, and the early-layer token memo depth
    /// (0 = off). All default-off controls, validated at parse time.
    package var strides: [Int] = [2, 1]
    package var issueCapPerTarget = 32
    package var memoLayers = 0
    /// How a speculative record reaches the pool. `staging` (the shipped
    /// mechanism): a ticket owns aligned host buffers and adoption scatters
    /// them into the slot the demand path's victim scan chooses. `slot`: the
    /// victim slot is reserved when the ticket is issued and the worker reads
    /// straight into that slot's pool memory, so adoption is a map insert
    /// with no copy, no allocation and no graph work; the reservation holds
    /// the slot out of every victim scan until the worker has left it.
    package enum Adoption: String { case staging, slot }
    package var adoption: Adoption = .staging
    /// How a speculative worker reads a record. `record` issues one read for the
    /// whole contiguous record and copies the nine pieces into the slot, which is
    /// what the demand path does; `piece` keeps the original read per piece.
    /// Whole-record reads need the packed layout and slot adoption's scratch.
    package enum ReadShape: String { case piece, record }
    package var readShape: ReadShape = .piece
    /// Slot mode: the most records that may be reserved out of the pool at
    /// once (the byte cap plays no part; the bytes are pool bytes).
    package var slotCap = 64
    /// Incremental runtime reservation charged before expert capacity is solved.
    package var reserveBytes = 0

    package static let defaultReserveBytes = DecodeLookahead.stagingReserveBytes
    package static let maximumCapRecords = 32

    package init() {}

    package var active: Bool { enabled || shadow }

    package static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment,
                                    optimizations: InferenceOptimizations) throws -> Self {
        var c = Self()
        c.enabled = optimizations.expertPrefetch == true
        c.shadow = optimizations.expertPrefetchShadow == true
        guard !(c.enabled && c.shadow) else {
            throw ModelError("expert prefetch shadow mode and enabled mode are mutually exclusive")
        }
        func integer(_ name: String, _ range: ClosedRange<Int>, fallback: Int) throws -> Int {
            guard let raw = env[name] else { return fallback }
            guard let n = Int(raw), range.contains(n) else {
                throw ModelError("\(name) must be an integer in \(range.lowerBound)...\(range.upperBound)")
            }
            return n
        }
        c.capRecords = try integer("SLOTSTREAM_EXPERT_PREFETCH_CAP", 1 ... maximumCapRecords, fallback: 32)
        c.lanes = try integer("SLOTSTREAM_EXPERT_PREFETCH_LANES", 1 ... 32, fallback: 8)
        c.windowLayers = try integer("SLOTSTREAM_EXPERT_PREFETCH_WINDOW", 1 ... 47, fallback: 4)
        c.topPerLayer = try integer("SLOTSTREAM_EXPERT_PREFETCH_TOP", 1 ... 64, fallback: 16)
        c.recentPasses = try integer("SLOTSTREAM_EXPERT_PREFETCH_RECENT", 1 ... 16, fallback: 2)
        if let raw = env["SLOTSTREAM_EXPERT_PREFETCH_THRESHOLD"] {
            guard let t = Float(raw), !t.isNaN else { throw ModelError("SLOTSTREAM_EXPERT_PREFETCH_THRESHOLD must be a number") }
            c.threshold = t
        }
        if let raw = env["SLOTSTREAM_EXPERT_PREFETCH_POLICY"] {
            guard let p = Policy(rawValue: raw) else { throw ModelError("SLOTSTREAM_EXPERT_PREFETCH_POLICY must be pack, recent, frequency or router") }
            c.policy = p
        }
        if let raw = env["SLOTSTREAM_EXPERT_PREFETCH_STRIDES"] {
            let parts = raw.split(separator: ",").map { Int($0.trimmingCharacters(in: .whitespaces)) }
            let values = parts.compactMap { $0 }
            guard !values.isEmpty, values.count == parts.count, values.allSatisfy({ (1 ... 8).contains($0) }),
                  Set(values).count == values.count else {
                throw ModelError("SLOTSTREAM_EXPERT_PREFETCH_STRIDES must be distinct integers in 1...8, comma-separated")
            }
            c.strides = values
        }
        c.issueCapPerTarget = try integer("SLOTSTREAM_EXPERT_PREFETCH_ISSUE_CAP", 1 ... 512, fallback: 32)
        c.memoLayers = try integer("SLOTSTREAM_EXPERT_PREFETCH_MEMO_LAYERS", 0 ... 47, fallback: 0)
        if let raw = env["SLOTSTREAM_EXPERT_PREFETCH_ADOPT"] {
            guard let a = Adoption(rawValue: raw) else { throw ModelError("SLOTSTREAM_EXPERT_PREFETCH_ADOPT must be staging or slot") }
            c.adoption = a
        }
        c.slotCap = try integer("SLOTSTREAM_EXPERT_PREFETCH_SLOT_CAP", 1 ... 512, fallback: 64)
        if let raw = env["SLOTSTREAM_EXPERT_PREFETCH_READ"] {
            guard let s = ReadShape(rawValue: raw) else {
                throw ModelError("SLOTSTREAM_EXPERT_PREFETCH_READ must be piece or record")
            }
            c.readShape = s
        }
        if c.policy == .router {
            // The window is the largest stride; candidates per position default
            // to the router's own top-10 unless TOP is set explicitly.
            c.windowLayers = c.strides.max() ?? 1
            if env["SLOTSTREAM_EXPERT_PREFETCH_TOP"] == nil { c.topPerLayer = 10 }
        }
        if let raw = env["SLOTSTREAM_EXPERT_PREFETCH_DEVICE"] {
            guard let d = Device(rawValue: raw) else { throw ModelError("SLOTSTREAM_EXPERT_PREFETCH_DEVICE must be gpu or cpu") }
            c.device = d
        }
        c.packPath = env["SLOTSTREAM_EXPERT_PACK"]
        if c.active, c.policy != .recent, c.policy != .router, (c.packPath ?? "").isEmpty {
            throw ModelError("expert prefetch with the \(c.policy.rawValue) policy requires SLOTSTREAM_EXPERT_PACK")
        }
        let defaultReserve = c.active ? Self.defaultReserveBytes >> 20 : 0
        let mib = try integer("SLOTSTREAM_EXPERT_LOOKAHEAD_RESERVE_MIB", 0 ... 4096, fallback: defaultReserve)
        c.reserveBytes = mib << 20
        return c
    }

    /// The incremental reserve the planner charges before solving capacity,
    /// without loading anything. Errors here are reported at engine start.
    package static func plannedReserveBytes(_ env: [String: String] = ProcessInfo.processInfo.environment) -> Int {
        guard let optimizations = try? InferenceOptimizations.environment(env),
              let configuration = try? environment(env, optimizations: optimizations) else { return 0 }
        // An explicit reserve without prefetch is the B1/B2 capacity control:
        // the same reduced pool, no forecasts.
        return configuration.reserveBytes
    }
}

/// Owner-side scheduler. Every method runs on the model thread; workers only
/// touch their own buffers and the shared lane budget.
package final class ExpertPrefetchScheduler {
    package let configuration: ExpertPrefetchConfiguration
    private let reader: ExpertPieceReader
    /// Present only when the store can read a whole record in one call.
    private let recordReader: ExpertRecordReader?
    private let isResident: (ExpertKey) -> Bool
    private let predictor: ExpertPredictor?
    package let lanes: IOLaneBudget
    package let accounting: ExpertPrefetchAccounting
    private let pieceBytes: [Int]
    private let recordBytes: Int
    private let layers: Int
    private let experts: Int
    private var revision: UInt64 = 1
    private var tickets: [ExpertKey: ExpertPrefetchTicket] = [:]
    private var draining: [ExpertPrefetchTicket] = []
    private var candidates: [[Int32]] = []
    private var issuedThrough = -1
    /// Router policy: targets whose candidate list changed after they were
    /// issued (the issue cursor is monotone, so they are re-scanned explicitly),
    /// the per-target issue counts of the current pass, and whether any
    /// forecast reached this pass.
    private var dirtyTargets = Set<Int>()
    private var issuedPerTarget: [Int] = []
    private var forecastMergedThisPass = false
    private var currentPass = -1
    private var recentRoutes: [[[Int32]]] = []
    private var closed = false
    private var observationValue = ExpertPrefetchObservation()
    private let workerQueue: DispatchQueue
    /// Slot mode: host scratch for the file reads (see `ExpertPrefetchScratch`).
    /// Record mode buys one buffer per lane at record size; piece mode keeps the
    /// original piece-sized buffers. `usesRecordReads` gates both together so a
    /// worker never sees a record reader with piece-sized scratch.
    private lazy var scratch = ExpertPrefetchScratch(
        pieceBytes: usesRecordReads ? recordBytes : (pieceBytes.max() ?? 1),
        count: configuration.lanes + 8, wholeRecords: usesRecordReads)

    /// Whole-record reads require the selected shape, a store that supports them
    /// and slot adoption, whose scratch path is the only destination they write.
    package var usesRecordReads: Bool {
        configuration.readShape == .record && recordReader != nil && configuration.adoption == .slot
    }
    /// Diagnostics inject deterministic candidate lists per pass. Never set
    /// by any wire or environment setting.
    package var forecastOverride: ((Int) -> [[Int32]])?
    /// Slot adoption: the pool's reservation seam (model thread only) and the
    /// number of reservations currently out. Nil keeps staging adoption.
    package var slotProvider: ((ExpertKey) -> SpeculativeSlotReservation?)?
    private var slotsOut = 0
    package var reservedSlots: Int { slotsOut }
    package var usesSlotAdoption: Bool { slotProvider != nil && configuration.adoption == .slot }

    package init(reader: @escaping ExpertPieceReader, isResident: @escaping (ExpertKey) -> Bool,
                 pieceBytes: [Int], configuration: ExpertPrefetchConfiguration,
                 predictor: ExpertPredictor?, layers: Int, experts: Int,
                 workerQueue: DispatchQueue = DispatchQueue.global(qos: .userInitiated),
                 recordReader: ExpertRecordReader? = nil) {
        self.recordReader = recordReader
        self.reader = reader; self.isResident = isResident; self.pieceBytes = pieceBytes
        self.configuration = configuration; self.predictor = predictor
        self.layers = layers; self.experts = experts
        self.recordBytes = pieceBytes.reduce(0, +)
        self.lanes = IOLaneBudget(speculativeLanes: configuration.lanes)
        self.accounting = ExpertPrefetchAccounting(capBytes: min(configuration.capRecords,
            ExpertPrefetchConfiguration.maximumCapRecords) * recordBytes)
        self.workerQueue = workerQueue
        observationValue.mode = configuration.shadow ? "shadow" : (configuration.enabled ? "on" : "diagnostic")
        observationValue.adoption = configuration.adoption.rawValue
        observationValue.readShape = configuration.readShape.rawValue
        observationValue.predictorIdentity = predictor?.identity
            ?? (configuration.policy == .recent ? "recent-routes"
                : configuration.policy == .router
                    ? "router-reuse:strides=\(configuration.strides.map(String.init).joined(separator: ","))" : "")
    }

    package convenience init(store: ExpertStore, pool: SlotPool, configuration: ExpertPrefetchConfiguration,
                             predictor: ExpertPredictor?, layers: Int, experts: Int) {
        self.init(reader: { key, piece, destination, shouldContinue in
            try store.readPieceChecked(into: destination, key: key, piece: piece, shouldContinue: shouldContinue)
        }, isResident: { [unowned pool] key in pool.isResident(key) }, pieceBytes: store.pieceRowBytes,
           configuration: configuration, predictor: predictor, layers: layers, experts: experts,
           recordReader: store.supportsRecordReads ? { key, destination, shouldContinue in
               try store.readRecordChecked(into: destination, key: key, shouldContinue: shouldContinue)
           } : nil)
    }

    /// The pool drained a returned reservation (model thread): one fewer out.
    package func slotReturned() { slotsOut = max(0, slotsOut - 1) }
    /// A reservation published into the pool at adoption: one fewer out.
    package func slotPublished() { slotsOut = max(0, slotsOut - 1) }

    package var wantsForecast: Bool { predictor != nil || forecastOverride != nil }
    /// The router policy forecasts at completed-layer boundaries through the
    /// session; it needs no start features and no pack.
    package var usesRouterForecast: Bool { configuration.policy == .router }
    package var liveTickets: Int { tickets.count }
    /// Diagnostics only: the state of one live ticket.
    package func diagnosticState(_ key: ExpertKey) -> ExpertPrefetchTicket.State? { tickets[key]?.state }
    package var isClosed: Bool { closed }
    package var currentRevision: UInt64 { revision }
    package var observation: ExpertPrefetchObservation {
        var o = observationValue
        o.peakLiveBytes = accounting.peakBytes
        o.deferredLaneAcquisitions = lanes.deferredAcquisitions
        o.demandBatches = lanes.demandBatches
        return o
    }

    package func resetObservation() {
        let mode = observationValue.mode, identity = observationValue.predictorIdentity
        let adoption = observationValue.adoption
        observationValue = ExpertPrefetchObservation()
        observationValue.mode = mode
        observationValue.predictorIdentity = identity
        observationValue.adoption = adoption
    }

    /// Slot mode bookkeeping for the pool: a record adopted straight from its
    /// reserved slot, or refused because the pool memory moved meanwhile.
    package func noteSlotAdopted() { observationValue.adopted += 1; observationValue.adoptedBytes += recordBytes }
    package func noteSlotStale() { observationValue.slotStale += 1; observationValue.demandMisses += 1 }

    /// One layer event's demand outcome, counted whether or not it had misses.
    package func noteLayerDemand(misses: Int) {
        if misses == 0 { observationValue.layersComplete += 1 } else { observationValue.layersWithMisses += 1 }
    }
    package func noteSlotRelease() { observationValue.slotReleases += 1 }
    package func noteEvictedKey() { observationValue.slotEvictedKeys += 1 }

    /// Forecast for a new verification pass, then issue the first window.
    package func beginPass(id: Int, features: [ExpertLookaheadStartFeature]) {
        guard !closed else { return }
        let started = RuntimeClock.now()
        if currentPass >= 0 { passEnded() }
        currentPass = id
        issuedThrough = -1
        observationValue.passes += 1
        if let override = forecastOverride {
            candidates = override(id)
        } else if let predictor, !features.isEmpty {
            candidates = predictor.rankedCandidates(features, top: configuration.topPerLayer,
                threshold: configuration.threshold)
        } else if configuration.policy == .recent {
            candidates = recentCandidates()
        } else {
            candidates = []
        }
        if candidates.count != layers { candidates = Array(repeating: [], count: layers) }
        issuedPerTarget = Array(repeating: 0, count: layers)
        dirtyTargets.removeAll()
        forecastMergedThisPass = false
        if candidates.contains(where: { !$0.isEmpty }) { observationValue.forecastPasses += 1 }
        observationValue.candidates += candidates.reduce(0) { $0 + $1.count }
        observationValue.forecastSeconds += RuntimeClock.seconds(since: started)
        let scheduleStart = RuntimeClock.now()
        issue(upTo: min(layers - 1, configuration.windowLayers - 1))
        observationValue.scheduleSeconds += RuntimeClock.seconds(since: scheduleStart)
    }

    /// Main-pass router IDs, for the recent-routes policy only.
    package func observeRoutes(layer: Int, ids: [Int32]) {
        guard configuration.policy == .recent, layer >= 0, layer < layers else { return }
        if layer == 0 || recentRoutes.isEmpty {
            recentRoutes.append(Array(repeating: [], count: layers))
            if recentRoutes.count > configuration.recentPasses { recentRoutes.removeFirst() }
        }
        var seen = Set<Int32>()
        var unique: [Int32] = []
        for id in ids where seen.insert(id).inserted { unique.append(id) }
        recentRoutes[recentRoutes.count - 1][layer] = unique
    }

    private func recentCandidates() -> [[Int32]] {
        var result: [[Int32]] = Array(repeating: [], count: layers)
        for layer in 0 ..< layers {
            var seen = Set<Int32>()
            var ordered: [Int32] = []
            for pass in recentRoutes.reversed() {
                for id in pass[layer] where seen.insert(id).inserted { ordered.append(id) }
            }
            result[layer] = Array(ordered.prefix(configuration.topPerLayer))
        }
        return result
    }

    /// Router policy: merge one target layer's candidates handed over at a
    /// completed-layer boundary. Deduplicated against the target's list, live
    /// tickets and resident keys; candidates below the margin threshold are
    /// dropped. A target already issued becomes dirty and is re-scanned at the
    /// next tick. Never cancels an issued ticket.
    package func forecast(target: Int, ids: [Int32], margins: [Float]) {
        guard !closed, currentPass >= 0, configuration.policy == .router, target >= 0, target < layers,
              candidates.count == layers else { return }
        var existing = Set(candidates[target])
        var added = 0
        for (i, id) in ids.enumerated() {
            if i < margins.count, margins[i] < configuration.threshold { continue }
            guard id >= 0, Int(id) < experts else { continue }
            let key = ExpertKey(target, Int(id))
            if tickets[key] != nil || isResident(key) { continue }
            guard existing.insert(id).inserted else { continue }
            candidates[target].append(id)
            added += 1
        }
        observationValue.candidates += added
        observationValue.forecastMerged += added
        observationValue.forecastTargets += 1
        if !forecastMergedThisPass { forecastMergedThisPass = true; observationValue.forecastPasses += 1 }
        if added > 0, target <= issuedThrough { dirtyTargets.insert(target) }
    }

    /// The model measures the forecast's own compute; it is charged here so
    /// the observation prices forecast and schedule separately.
    package func addForecastSeconds(_ seconds: Double) { observationValue.forecastSeconds += seconds }
    package func addForecastSeconds(build: Double, eval: Double, select: Double) {
        observationValue.forecastBuildSeconds += build
        observationValue.forecastEvalSeconds += eval
        observationValue.forecastSelectSeconds += select
        observationValue.forecastSeconds += build + select
    }

    /// Completed-layer tick: expire tickets this layer or earlier, re-scan
    /// dirty targets still ahead, extend the window.
    package func layerCompleted(_ layer: Int) {
        guard !closed, currentPass >= 0 else { return }
        let started = RuntimeClock.now()
        expire(throughLayer: layer)
        // A cap refusal can leave the cursor behind the completed layer; layers
        // already completed are never issued (their tickets would expire at once).
        if issuedThrough < layer { issuedThrough = layer }
        dirtyTargets = dirtyTargets.filter { $0 > layer }
        issueDirty()
        issue(upTo: min(layers - 1, layer + configuration.windowLayers))
        observationValue.scheduleSeconds += RuntimeClock.seconds(since: started)
    }

    /// Issue one layer's candidates up to the per-target cap; false when the
    /// byte cap refused a ticket (the layer keeps its remaining candidates).
    private func issueLayer(_ layer: Int) -> Bool {
        if configuration.shadow { return true }
        if issuedPerTarget.count != layers { issuedPerTarget = Array(repeating: 0, count: layers) }
        for expert in candidates[layer] {
            guard expert >= 0, Int(expert) < experts else { continue }
            if issuedPerTarget[layer] >= configuration.issueCapPerTarget { return true }
            let key = ExpertKey(layer, Int(expert))
            if isResident(key) || tickets[key] != nil { continue }
            let ticket: ExpertPrefetchTicket
            if let slotProvider, configuration.adoption == .slot {
                guard slotsOut < configuration.slotCap else {
                    observationValue.slotRefusals += 1
                    observationValue.capRefusals += 1
                    return false
                }
                guard let reservation = slotProvider(key) else {
                    observationValue.slotRefusals += 1
                    observationValue.capRefusals += 1
                    return false
                }
                slotsOut += 1
                observationValue.slotReservations += 1
                ticket = ExpertPrefetchTicket(key: key, pass: currentPass, revision: revision,
                    reservation: reservation, accounting: accounting)
            } else {
                guard let allocated = ExpertPrefetchTicket(key: key, pass: currentPass, revision: revision,
                    pieceBytes: pieceBytes, accounting: accounting) else {
                    observationValue.capRefusals += 1
                    return false
                }
                ticket = allocated
            }
            tickets[key] = ticket
            let wholeRecord = usesRecordReads && ticket.isSlotMode
            ticket.start(reader: reader, lanes: lanes, queue: workerQueue,
                         scratch: ticket.isSlotMode ? scratch : nil,
                         recordReader: wholeRecord ? recordReader : nil)
            if wholeRecord { observationValue.recordReads += 1 } else { observationValue.pieceModeReads += 1 }
            observationValue.issued += 1
            observationValue.issuedBytes += ticket.bytes
            issuedPerTarget[layer] += 1
        }
        return true
    }

    private func issue(upTo lastLayer: Int) {
        guard currentPass >= 0, !candidates.isEmpty else { return }
        var layer = issuedThrough + 1
        while layer <= lastLayer {
            guard issueLayer(layer) else { return }
            issuedThrough = layer
            layer += 1
        }
    }

    /// Re-scan targets whose lists grew after they were issued. A cap refusal
    /// leaves the refused target and the ones after it dirty for the next tick.
    private func issueDirty() {
        guard currentPass >= 0, !dirtyTargets.isEmpty, !candidates.isEmpty else { return }
        for target in dirtyTargets.sorted() {
            observationValue.dirtyRescans += 1
            guard issueLayer(target) else { return }
            dirtyTargets.remove(target)
        }
    }

    private func expire(throughLayer layer: Int) {
        for (key, ticket) in tickets where key.layer <= layer {
            retire(ticket, key: key)
        }
    }

    private func retire(_ ticket: ExpertPrefetchTicket, key: ExpertKey) {
        switch ticket.state {
        case .ready:
            observationValue.expired += 1
            observationValue.wastedBytes += ticket.bytes
        case .reading, .queued:
            observationValue.cancelled += 1
            observationValue.wastedBytes += ticket.bytes
        case .failed:
            observationValue.failed += 1
        case .adopted, .discarded: break
        }
        ticket.discard()
        if ticket.state == .reading { draining.append(ticket) }
        tickets.removeValue(forKey: key)
    }

    /// Adoption for actual misses: complete tickets are handed over, in-flight
    /// ones are promoted and joined, anything else falls back to demand.
    package func claim(_ misses: [ExpertKey]) -> [ExpertKey: ExpertPrefetchTicket] {
        guard !closed, currentPass >= 0, !tickets.isEmpty else {
            observationValue.demandMisses += misses.count
            return [:]
        }
        let started = RuntimeClock.now()
        var result: [ExpertKey: ExpertPrefetchTicket] = [:]
        for key in misses {
            if result[key] != nil { continue }
            guard let ticket = tickets[key], ticket.revision == revision else {
                observationValue.demandMisses += 1
                continue
            }
            var state = ticket.state
            if state == .reading || state == .queued {
                let joinStart = RuntimeClock.now()
                ticket.join()
                observationValue.joinSeconds += RuntimeClock.seconds(since: joinStart)
                state = ticket.state
                if state == .ready { observationValue.promoted += 1 }
            }
            if state == .ready {
                result[key] = ticket
                observationValue.adopted += 1
                observationValue.adoptedBytes += ticket.bytes
            } else {
                if state == .failed { observationValue.failed += 1 }
                observationValue.demandMisses += 1
                ticket.discard()
            }
            tickets.removeValue(forKey: key)
        }
        observationValue.adoptSeconds += RuntimeClock.seconds(since: started)
        return result
    }

    /// Split claim for actual misses: complete tickets are handed over now;
    /// tickets whose worker is reading are returned to be joined after the
    /// demand batch (their remaining pieces finish while demand reads run);
    /// tickets still queued for a lane are discarded so the demand batch reads
    /// their keys at demand priority instead of waiting behind the lane queue.
    package struct ClaimResult {
        package var ready: [ExpertKey: ExpertPrefetchTicket] = [:]
        package var reading: [ExpertKey: ExpertPrefetchTicket] = [:]
        package init() {}
    }

    package func claimSplit(_ misses: [ExpertKey]) -> ClaimResult {
        var result = ClaimResult()
        guard !closed, currentPass >= 0, !tickets.isEmpty else {
            observationValue.demandMisses += misses.count
            return result
        }
        let started = RuntimeClock.now()
        for key in misses {
            if result.ready[key] != nil || result.reading[key] != nil { continue }
            guard let ticket = tickets[key], ticket.revision == revision else {
                observationValue.demandMisses += 1
                continue
            }
            switch ticket.state {
            case .ready:
                result.ready[key] = ticket
                if !ticket.isSlotMode {
                    observationValue.adopted += 1
                    observationValue.adoptedBytes += ticket.bytes
                }
            case .reading where ticket.progress > 0:
                ticket.promote()
                result.reading[key] = ticket
            case .reading, .queued:
                // No piece complete yet: waiting for a lane or just started.
                // The demand batch reads this key; the worker stops and frees.
                observationValue.cancelled += 1
                observationValue.demandMisses += 1
                ticket.discard()
                if ticket.state == .reading { draining.append(ticket) }
            case .failed, .discarded, .adopted:
                if ticket.state == .failed { observationValue.failed += 1 }
                observationValue.demandMisses += 1
                ticket.discard()
            }
            tickets.removeValue(forKey: key)
        }
        observationValue.adoptSeconds += RuntimeClock.seconds(since: started)
        return result
    }

    /// Join tickets that were reading when demanded (after the demand batch):
    /// complete ones are promoted and handed over, anything else is demand.
    package func finishReading(_ pending: [ExpertKey: ExpertPrefetchTicket]) -> [ExpertKey: ExpertPrefetchTicket] {
        var result: [ExpertKey: ExpertPrefetchTicket] = [:]
        let started = RuntimeClock.now()
        for (key, ticket) in pending {
            let joinStart = RuntimeClock.now()
            ticket.join()
            observationValue.joinSeconds += RuntimeClock.seconds(since: joinStart)
            if ticket.state == .ready {
                observationValue.promoted += 1
                if !ticket.isSlotMode {
                    observationValue.adopted += 1
                    observationValue.adoptedBytes += ticket.bytes
                }
                result[key] = ticket
            } else {
                if ticket.state == .failed { observationValue.failed += 1 }
                observationValue.demandMisses += 1
                ticket.discard()
            }
        }
        observationValue.adoptSeconds += RuntimeClock.seconds(since: started)
        return result
    }

    package func passEnded() {
        for (key, ticket) in tickets { retire(ticket, key: key) }
        tickets.removeAll()
        draining.removeAll { $0.state != .reading }
        currentPass = -1
        candidates = []
        dirtyTargets.removeAll()
    }

    /// Join every owned worker. Called at request boundaries and before any
    /// model/store replacement; workers never outlive the owner's request.
    package func drain() {
        for ticket in draining { ticket.join() }
        draining.removeAll()
    }

    /// Invalidate every ticket identity: model/store replacement, pool
    /// resize, prefix restoration or request reuse.
    package func invalidate() {
        passEnded()
        drain()
        revision &+= 1
    }

    package func requestFinished() {
        passEnded()
        drain()
        recentRoutes.removeAll()
        revision &+= 1
    }

    package func close() {
        requestFinished()
        closed = true
    }
}
