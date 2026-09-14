// Expert Lookahead runtime checks that need no weights: the shared lane
// budget and byte cap (C04), ticket lifecycle and failure handling (C05), the
// scheduler over fake readers (C04/C05), and zero-copy adoption lifetime
// (C05/C09: freeing a ticket can never free bytes a scatter graph still reads).

import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func expertLookaheadRuntime() throws -> [CheckReport] {
        [try expertLookaheadLaneBudget(), try expertLookaheadTickets(), try expertLookaheadScheduler(),
         try expertLookaheadForecastMerge(), try expertLookaheadAdoption(), try expertLookaheadRoutingReadback()]
    }

    /// C14: router-policy forecast merge. Per-target merges deduplicate against
    /// live tickets and resident keys and honor the margin threshold; a
    /// stride-1 refresh of an already issued target is re-scanned at the next
    /// tick without cancelling issued tickets; the per-target issue cap holds;
    /// expiry at the target layer is unchanged; a byte-cap refusal does not
    /// stop later targets permanently.
    public static func expertLookaheadForecastMerge() throws -> CheckReport {
        var c = CheckBuilder("expert-lookahead-forecast-merge")
        let pieces = fakePieces
        var configuration = ExpertPrefetchConfiguration()
        configuration.enabled = true
        configuration.policy = .router
        configuration.strides = [2, 1]
        configuration.windowLayers = 2
        configuration.capRecords = 4
        configuration.lanes = 2
        configuration.topPerLayer = 10
        configuration.issueCapPerTarget = 3
        configuration.threshold = 0
        let lock = NSLock()
        var reads: [ExpertKey: Int] = [:]
        let resident = Set<ExpertKey>([ExpertKey(1, 5)])
        let reader: ExpertPieceReader = { key, piece, destination, shouldContinue in
            if piece == 0 { lock.withLock { reads[key, default: 0] += 1 } }
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            fill(destination, key: key, piece: piece, bytes: pieces[piece])
        }
        let scheduler = ExpertPrefetchScheduler(reader: reader, isResident: { resident.contains($0) },
            pieceBytes: pieces, configuration: configuration, predictor: nil, layers: 6, experts: 16)
        c.expect("router policy needs no start features", !scheduler.wantsForecast)
        c.expect("router policy forecasts through the session", scheduler.usesRouterForecast)
        c.expect("forecast before any pass is ignored", { scheduler.forecast(target: 1, ids: [1], margins: [1]); return scheduler.observation.forecastMerged == 0 }())
        scheduler.beginPass(id: 1, features: [])
        c.equal("no candidates before any forecast", scheduler.liveTickets, 0)
        // Layer-0 boundary: stride-1 forecast for target 1 (5 resident, 6 twice, 7 below the threshold), stride-2 for target 2.
        scheduler.forecast(target: 1, ids: [5, 6, 6, 7], margins: [1, 1, 1, -1])
        c.equal("merge drops resident keys, duplicates and sub-threshold margins", scheduler.observation.forecastMerged, 1)
        scheduler.forecast(target: 2, ids: [1, 2], margins: [3, 2])
        scheduler.forecast(target: 9, ids: [1], margins: [3])
        c.equal("out-of-range target ignored", scheduler.observation.forecastMerged, 3)
        scheduler.layerCompleted(0)
        c.equal("window issues target 1 (one key) and target 2 (two keys)", scheduler.liveTickets, 3)
        c.expect("resident key never issued", scheduler.diagnosticState(ExpertKey(1, 5)) == nil)
        c.expect("target-1 ticket issued", scheduler.diagnosticState(ExpertKey(1, 6)) != nil)
        // Layer-1 boundary: stride-1 refresh of target 2 (already issued) and stride-2 forecast for target 3.
        scheduler.forecast(target: 2, ids: [9, 2], margins: [5, 5])
        c.equal("refresh merges only the new key", scheduler.observation.forecastMerged, 4)
        scheduler.forecast(target: 3, ids: [1, 2, 3, 4], margins: [4, 3, 2, 1])
        // Let the fake reads finish so expiry frees bytes deterministically.
        for key in [ExpertKey(1, 6), ExpertKey(2, 1), ExpertKey(2, 2)] {
            for _ in 0 ..< 400 where scheduler.diagnosticState(key) == .reading { usleep(5000) }
        }
        scheduler.layerCompleted(1)
        c.expect("target-1 ticket expired at its layer", scheduler.diagnosticState(ExpertKey(1, 6)) == nil)
        c.expect("dirty target re-scanned: refreshed key issued", scheduler.diagnosticState(ExpertKey(2, 9)) != nil)
        c.expect("refresh never cancels an issued ticket", scheduler.diagnosticState(ExpertKey(2, 1)) != nil && scheduler.diagnosticState(ExpertKey(2, 2)) != nil)
        c.expect("dirty re-scan counted", scheduler.observation.dirtyRescans >= 1)
        // Cap: 3 live target-2 tickets plus target 3 -> the fourth record fills the cap, the fifth is refused.
        c.equal("byte cap refused the rest of target 3", scheduler.observation.capRefusals, 1)
        c.equal("live tickets at the byte cap", scheduler.liveTickets, 4)
        for key in [ExpertKey(2, 1), ExpertKey(2, 2), ExpertKey(2, 9), ExpertKey(3, 1)] {
            for _ in 0 ..< 400 where scheduler.diagnosticState(key) == .reading { usleep(5000) }
        }
        scheduler.layerCompleted(2)
        c.expect("after the refusal the target still issues at the next tick", scheduler.diagnosticState(ExpertKey(3, 2)) != nil)
        c.expect("per-target issue cap held", scheduler.diagnosticState(ExpertKey(3, 4)) == nil)
        c.equal("target 3 holds exactly its cap", scheduler.liveTickets, 3)
        scheduler.layerCompleted(3)
        c.equal("expiry at the target layer unchanged", scheduler.liveTickets, 0)
        c.equal("no key read twice", lock.withLock { reads.values.filter { $0 > 1 }.count }, 0)
        scheduler.passEnded()
        scheduler.requestFinished()
        c.equal("accounting drained at request end", scheduler.accounting.liveBytes, 0)
        // Split claim: a ticket still reading is returned for a later join; a
        // ticket still queued for a lane is discarded and becomes demand.
        var splitConfiguration = configuration
        splitConfiguration.lanes = 1
        splitConfiguration.capRecords = 4
        splitConfiguration.issueCapPerTarget = 4
        let holdGate = DispatchSemaphore(value: 0)
        let entered = DispatchSemaphore(value: 0)
        let holdKey = ExpertKey(1, 1)
        let holding: ExpertPieceReader = { key, piece, destination, shouldContinue in
            if key == holdKey, piece == 1 { entered.signal(); _ = holdGate.wait(timeout: .now() + 3) }
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            fill(destination, key: key, piece: piece, bytes: pieces[piece])
        }
        let split = ExpertPrefetchScheduler(reader: holding, isResident: { _ in false }, pieceBytes: pieces,
            configuration: splitConfiguration, predictor: nil, layers: 6, experts: 16)
        split.beginPass(id: 3, features: [])
        split.forecast(target: 1, ids: [1, 2], margins: [1, 1])
        split.layerCompleted(0)
        c.expect("holding ticket entered its second piece", entered.wait(timeout: .now() + 5) == .success)
        c.expect("second ticket waits for the single lane with no progress", split.diagnosticState(ExpertKey(1, 2)) == .reading)
        let claimed = split.claimSplit([holdKey, ExpertKey(1, 2), ExpertKey(1, 9)])
        c.equal("ticket with progress returned for a later join", claimed.reading.count, 1)
        c.expect("reading ticket is the held one", claimed.reading[holdKey] != nil)
        c.equal("nothing ready yet", claimed.ready.count, 0)
        c.expect("lane-waiting ticket left the live set", split.diagnosticState(ExpertKey(1, 2)) == nil)
        var splitObservation = split.observation
        c.equal("lane-waiting ticket and unknown key counted as demand", splitObservation.demandMisses, 2)
        c.equal("lane-waiting ticket counted as cancelled", splitObservation.cancelled, 1)
        holdGate.signal()
        let finished = split.finishReading(claimed.reading)
        c.equal("joined ticket promoted after the demand batch", finished.count, 1)
        c.expect("promoted ticket ready", finished[holdKey]?.state.rawValue == "ready")
        finished[holdKey]?.adoptRaw()?.release()
        splitObservation = split.observation
        c.equal("promotion counted once", splitObservation.promoted, 1)
        c.equal("adoption counted once", splitObservation.adopted, 1)
        split.requestFinished()
        c.equal("split scheduler drained", split.accounting.liveBytes, 0)
        // Shadow mode merges and counts but never reads.
        var shadowConfiguration = configuration
        shadowConfiguration.enabled = false; shadowConfiguration.shadow = true
        var shadowReads = 0
        let shadow = ExpertPrefetchScheduler(reader: { _, _, _, _ in lock.withLock { shadowReads += 1 } },
            isResident: { _ in false }, pieceBytes: pieces, configuration: shadowConfiguration, predictor: nil, layers: 6, experts: 16)
        shadow.beginPass(id: 2, features: [])
        shadow.forecast(target: 2, ids: [1, 2, 3], margins: [1, 1, 1])
        shadow.layerCompleted(0); shadow.layerCompleted(1)
        shadow.passEnded()
        c.equal("shadow router policy issues no reads", lock.withLock { shadowReads }, 0)
        c.equal("shadow router policy still counts candidates", shadow.observation.forecastMerged, 3)
        return c.report()
    }

    static let fakePieces = [4096, 1024, 1024, 4096, 1024, 1024, 4096, 1024, 1024]

    /// Deterministic bytes for (key, piece): every byte identifies its source.
    static func fill(_ destination: UnsafeMutableRawPointer, key: ExpertKey, piece: Int, bytes: Int) {
        let seed = UInt8(truncatingIfNeeded: key.layer &* 31 &+ key.expert &* 7 &+ piece)
        memset(destination, Int32(seed), bytes)
    }

    static func expected(key: ExpertKey, piece: Int) -> UInt8 {
        UInt8(truncatingIfNeeded: key.layer &* 31 &+ key.expert &* 7 &+ piece)
    }

    public static func expertLookaheadLaneBudget() throws -> CheckReport {
        var c = CheckBuilder("expert-lookahead-lane-budget")
        let lanes = IOLaneBudget(speculativeLanes: 2)
        c.expect("first speculative lane acquires", lanes.acquireSpeculative { true })
        c.expect("second speculative lane acquires", lanes.acquireSpeculative { true })
        c.expect("third lane waits then honors cancellation", !lanes.acquireSpeculative { false })
        lanes.releaseSpeculative()
        c.expect("released lane acquires again", lanes.acquireSpeculative { true })
        lanes.releaseSpeculative(); lanes.releaseSpeculative()
        lanes.beginDemand()
        c.expect("demand blocks new speculative lanes", !lanes.acquireSpeculative { false })
        c.equal("demand batches counted", lanes.demandBatches, 1)
        // A waiter that outlives the demand batch acquires afterwards and is
        // counted as deferred; a cancelled waiter is not an acquisition.
        let waited = DispatchGroup()
        var lateAcquired = false
        waited.enter()
        DispatchQueue.global().async {
            lateAcquired = lanes.acquireSpeculative { true }
            waited.leave()
        }
        usleep(20_000)
        c.equal("waiter still blocked behind demand", lanes.snapshot.speculativeInUse, 0)
        lanes.endDemand()
        c.expect("waiter acquired after demand ended", waited.wait(timeout: .now() + 5) == .success && lateAcquired)
        lanes.releaseSpeculative()
        c.expect("speculative resumes after demand", lanes.acquireSpeculative { true })
        lanes.releaseSpeculative()
        c.expect("deferred acquisitions are counted", lanes.deferredAcquisitions >= 1)
        let accounting = ExpertPrefetchAccounting(capBytes: 10)
        c.expect("reserve within cap", accounting.reserve(6))
        c.expect("reserve beyond cap refused", !accounting.reserve(5))
        c.expect("reserve up to cap allowed", accounting.reserve(4))
        accounting.release(6)
        c.equal("live bytes track releases", accounting.liveBytes, 4)
        c.equal("peak bytes retained", accounting.peakBytes, 10)
        c.expect("negative reservation refused", !accounting.reserve(-1))
        return c.report()
    }

    public static func expertLookaheadTickets() throws -> CheckReport {
        var c = CheckBuilder("expert-lookahead-tickets")
        let pieces = fakePieces
        let record = pieces.reduce(0, +)
        let accounting = ExpertPrefetchAccounting(capBytes: 3 * record)
        let lanes = IOLaneBudget(speculativeLanes: 4)
        let lock = NSLock()
        var running = 0, peakRunning = 0
        let reader: ExpertPieceReader = { key, piece, destination, shouldContinue in
            lock.withLock { running += 1; peakRunning = max(peakRunning, running) }
            defer { lock.withLock { running -= 1 } }
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            fill(destination, key: key, piece: piece, bytes: pieces[piece])
        }
        // Complete read, adoption, exactly-once release.
        let key = ExpertKey(3, 17)
        guard let ticket = ExpertPrefetchTicket(key: key, pass: 1, revision: 1, pieceBytes: pieces, accounting: accounting) else {
            c.expect("ticket allocates within cap", false); return c.report()
        }
        c.equal("allocation reserved", accounting.liveBytes, record)
        ticket.start(reader: reader, lanes: lanes)
        ticket.join()
        c.equal("complete read is ready", ticket.state.rawValue, "ready")
        c.equal("all pieces read", ticket.piecesRead, pieces.count)
        guard let adopted = ticket.adoptRaw() else { c.expect("ready ticket adopts", false); return c.report() }
        c.equal("adopted state", ticket.state.rawValue, "adopted")
        var exact = true
        for (p, buffer) in adopted.buffers.enumerated() {
            let bytes = UnsafeRawBufferPointer(start: buffer, count: pieces[p])
            if bytes.contains(where: { $0 != expected(key: key, piece: p) }) { exact = false }
        }
        c.expect("adopted bytes are exactly the read bytes", exact)
        c.expect("double adoption refused", ticket.adoptRaw() == nil)
        c.equal("bytes stay charged until the consumer releases", accounting.liveBytes, record)
        ticket.discard()
        c.equal("discard after adoption frees nothing", accounting.liveBytes, record)
        adopted.release()
        c.equal("consumer release pays the accounting back", accounting.liveBytes, 0)
        // Cancellation before start, during, and after.
        let before = ExpertPrefetchTicket(key: ExpertKey(1, 1), pass: 1, revision: 1, pieceBytes: pieces, accounting: accounting)!
        before.discard()
        c.equal("discard before start releases", accounting.liveBytes, 0)
        before.start(reader: reader, lanes: lanes)
        c.equal("discarded ticket never starts", before.state.rawValue, "discarded")
        let gate = DispatchSemaphore(value: 0)
        let entered = DispatchSemaphore(value: 0)
        let slow: ExpertPieceReader = { key, piece, destination, shouldContinue in
            if piece == 0 { entered.signal(); gate.wait() }
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            fill(destination, key: key, piece: piece, bytes: pieces[piece])
        }
        let during = ExpertPrefetchTicket(key: ExpertKey(2, 2), pass: 1, revision: 1, pieceBytes: pieces, accounting: accounting)!
        during.start(reader: slow, lanes: lanes)
        c.expect("worker entered the read", entered.wait(timeout: .now() + 5) == .success)
        during.discard()
        c.expect("discard while reading does not free under the worker", during.ownsBuffers)
        c.equal("buffers still charged while the worker holds them", accounting.liveBytes, record)
        gate.signal()
        during.join()
        c.equal("cancelled mid-read ends discarded", during.state.rawValue, "discarded")
        c.expect("worker freed on exit", !during.ownsBuffers)
        c.equal("cancelled read releases once", accounting.liveBytes, 0)
        c.expect("cancelled ticket cannot be adopted", during.adoptRaw() == nil)
        // Read failure: recorded, buffers freed, never adoptable.
        let fault = ReadFault(afterJobs: 4)
        let failing: ExpertPieceReader = { key, piece, destination, _ in
            try fault.beforeRead()
            fill(destination, key: key, piece: piece, bytes: pieces[piece])
        }
        let failed = ExpertPrefetchTicket(key: ExpertKey(4, 4), pass: 1, revision: 1, pieceBytes: pieces, accounting: accounting)!
        failed.start(reader: failing, lanes: lanes)
        failed.join()
        c.equal("read fault marks the ticket failed", failed.state.rawValue, "failed")
        c.expect("failure is recorded", failed.error != nil)
        c.expect("failed ticket cannot be adopted", failed.adoptRaw() == nil)
        c.equal("failed ticket releases its bytes", accounting.liveBytes, 0)
        // EINTR through the exact read seam stops on cancellation.
        let interruptEntered = DispatchSemaphore(value: 0)
        let interrupting: ExpertPieceReader = { _, _, destination, shouldContinue in
            try ExactRead.transfer(into: destination, offset: 0, count: 1, shouldContinue: shouldContinue, read: { _, _, _ in
                interruptEntered.signal()
                return .init(count: -1, error: EINTR)
            })
        }
        let interrupted = ExpertPrefetchTicket(key: ExpertKey(5, 5), pass: 1, revision: 1, pieceBytes: pieces, accounting: accounting)!
        interrupted.start(reader: interrupting, lanes: lanes)
        c.expect("EINTR seam entered", interruptEntered.wait(timeout: .now() + 5) == .success)
        interrupted.discard()
        interrupted.join()
        c.expect("cancellation stops repeated EINTR", interrupted.state.rawValue == "discarded")
        c.equal("interrupted ticket releases its bytes", accounting.liveBytes, 0)
        // Cap exhaustion refuses allocation without side effects.
        var held: [ExpertPrefetchTicket] = []
        for e in 0 ..< 3 {
            if let t = ExpertPrefetchTicket(key: ExpertKey(6, e), pass: 1, revision: 1, pieceBytes: pieces, accounting: accounting) { held.append(t) }
        }
        c.equal("cap admits exactly three records", held.count, 3)
        c.expect("fourth record refused at the cap",
            ExpertPrefetchTicket(key: ExpertKey(6, 9), pass: 1, revision: 1, pieceBytes: pieces, accounting: accounting) == nil)
        held.forEach { $0.discard() }
        c.equal("held records released", accounting.liveBytes, 0)
        c.expect("lanes never exceed the speculative budget", peakRunning <= 4)
        c.equal("no worker left running", lock.withLock { running }, 0)
        // Slot adoption: the worker writes into caller-owned slot memory,
        // allocates nothing, charges nothing, and hands the slot back exactly
        // once when it leaves without a complete record.
        var returned: [Int] = []
        let returnLock = NSLock()
        func backedTicket(slot: Int, key: ExpertKey) -> (ticket: ExpertPrefetchTicket, memory: UnsafeMutableRawPointer) {
            let memory = UnsafeMutableRawPointer.allocate(byteCount: record, alignment: 16384)
            memory.initializeMemory(as: UInt8.self, repeating: 0, count: record)
            var offset = 0
            var destinations: [UnsafeMutableRawPointer] = []
            for pb in pieces { destinations.append(memory + offset); offset += pb }
            let reservation = SpeculativeSlotReservation(slot: slot, destinations: destinations, pieceBytes: pieces,
                bases: [memory], onLeave: { slot in returnLock.withLock { returned.append(slot) } })
            return (ExpertPrefetchTicket(key: key, pass: 1, revision: 1, reservation: reservation, accounting: accounting), memory)
        }
        let (slotTicket, slotMemory) = backedTicket(slot: 7, key: ExpertKey(8, 8))
        defer { slotMemory.deallocate() }
        c.expect("slot ticket is slot mode", slotTicket.isSlotMode)
        c.equal("slot ticket charges no bytes", accounting.liveBytes, 0)
        let scratch = ExpertPrefetchScratch(pieceBytes: pieces.max()!, count: 2)
        slotTicket.start(reader: reader, lanes: lanes, scratch: scratch)
        slotTicket.join()
        c.equal("slot read is ready", slotTicket.state.rawValue, "ready")
        c.expect("slot ticket keeps its reservation while ready", returnLock.withLock { returned }.isEmpty)
        var slotExact = true
        var offset = 0
        for (p, pb) in pieces.enumerated() {
            let want = expected(key: ExpertKey(8, 8), piece: p)
            let bytes = UnsafeRawBufferPointer(start: slotMemory + offset, count: pb)
            if bytes.contains(where: { $0 != want }) { slotExact = false }
            offset += pb
        }
        c.expect("slot bytes landed in the caller's memory", slotExact)
        c.expect("staging adoption refused for a slot ticket", slotTicket.adoptRaw() == nil)
        c.expect("slot adoption hands the reservation over", slotTicket.adoptSlot()?.slot == 7)
        c.equal("adopted slot state", slotTicket.state.rawValue, "adopted")
        c.expect("double slot adoption refused", slotTicket.adoptSlot() == nil)
        slotTicket.discard()
        c.expect("discard after slot adoption returns nothing", returnLock.withLock { returned }.isEmpty)
        // Whole-record reads: one call fills the record, and the worker splits it
        // into the same nine destinations the piece path writes. The split must
        // match the layout's piece order exactly, or experts would be corrupted
        // silently, so the bytes are checked against the same per-piece oracle.
        let (recordTicket, recordMemory) = backedTicket(slot: 11, key: ExpertKey(5, 6))
        defer { recordMemory.deallocate() }
        let recordScratch = ExpertPrefetchScratch(pieceBytes: record, count: 2, wholeRecords: true)
        c.expect("record scratch declares whole records", recordScratch.holdsWholeRecords)
        c.expect("piece scratch does not", ExpertPrefetchScratch(pieceBytes: pieces.max()!, count: 1).holdsWholeRecords == false)
        let recordCalls = NSLock()
        var recordCallCount = 0
        let wholeRecord: ExpertRecordReader = { key, destination, shouldContinue in
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            recordCalls.withLock { recordCallCount += 1 }
            var at = 0
            for (p, pb) in pieces.enumerated() {
                Self.fill(destination + at, key: key, piece: p, bytes: pb)
                at += pb
            }
        }
        recordTicket.start(reader: reader, lanes: lanes, scratch: recordScratch, recordReader: wholeRecord)
        recordTicket.join()
        c.equal("whole-record read is ready", recordTicket.state.rawValue, "ready")
        c.equal("one read call for the whole record", recordCalls.withLock { recordCallCount }, 1)
        c.expect("ticket reports a whole-record read", recordTicket.readWholeRecord)
        c.equal("whole-record read counts every piece", recordTicket.piecesRead, pieces.count)
        var recordExact = true
        var recordOffset = 0
        for (p, pb) in pieces.enumerated() {
            let want = expected(key: ExpertKey(5, 6), piece: p)
            let bytes = UnsafeRawBufferPointer(start: recordMemory + recordOffset, count: pb)
            if bytes.contains(where: { $0 != want }) { recordExact = false }
            recordOffset += pb
        }
        c.expect("whole-record split matches the piece path byte for byte", recordExact)
        c.expect("whole-record ticket keeps its slot while ready", returnLock.withLock { returned }.isEmpty)
        c.expect("whole-record slot adoption hands the reservation over", recordTicket.adoptSlot()?.slot == 11)
        recordTicket.discard()
        // A record reader with piece-sized scratch must fall back, never read a
        // whole record into a buffer that cannot hold it.
        let (fallbackTicket, fallbackMemory) = backedTicket(slot: 12, key: ExpertKey(4, 4))
        defer { fallbackMemory.deallocate() }
        let fallbackLock = NSLock()
        var fallbackCalls = 0
        let countingRecord: ExpertRecordReader = { _, _, _ in fallbackLock.withLock { fallbackCalls += 1 } }
        fallbackTicket.start(reader: reader, lanes: lanes,
                             scratch: ExpertPrefetchScratch(pieceBytes: pieces.max()!, count: 2),
                             recordReader: countingRecord)
        fallbackTicket.join()
        c.equal("piece-sized scratch refuses whole-record reads", fallbackLock.withLock { fallbackCalls }, 0)
        c.equal("fallback still completes through the piece path", fallbackTicket.state.rawValue, "ready")
        c.expect("fallback ticket reports no whole-record read", fallbackTicket.readWholeRecord == false)
        _ = fallbackTicket.adoptSlot(); fallbackTicket.discard()
        // Cancelled mid-read: the slot comes back exactly once, from the worker.
        let cancelEntered = DispatchSemaphore(value: 0)
        let cancelGate = DispatchSemaphore(value: 0)
        let slowSlot: ExpertPieceReader = { key, piece, destination, shouldContinue in
            if piece == 0 { cancelEntered.signal(); cancelGate.wait() }
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            fill(destination, key: key, piece: piece, bytes: pieces[piece])
        }
        let (cancelTicket, cancelMemory) = backedTicket(slot: 9, key: ExpertKey(9, 9))
        defer { cancelMemory.deallocate() }
        cancelTicket.start(reader: slowSlot, lanes: lanes, scratch: scratch)
        c.expect("slot worker entered the read", cancelEntered.wait(timeout: .now() + 5) == .success)
        cancelTicket.discard()
        c.expect("slot not returned while the worker still writes", returnLock.withLock { returned }.isEmpty)
        cancelGate.signal()
        cancelTicket.join()
        c.equal("cancelled slot read ends discarded", cancelTicket.state.rawValue, "discarded")
        c.equal("cancelled slot returned exactly once", returnLock.withLock { returned }, [9])
        cancelTicket.discard()
        c.equal("second discard returns nothing more", returnLock.withLock { returned }, [9])
        // Discarded before start: returned once, immediately.
        let (queuedTicket, queuedMemory) = backedTicket(slot: 11, key: ExpertKey(10, 10))
        defer { queuedMemory.deallocate() }
        queuedTicket.discard()
        c.equal("queued slot ticket returns its slot at discard", returnLock.withLock { returned }, [9, 11])
        queuedTicket.start(reader: reader, lanes: lanes)
        c.equal("discarded slot ticket never starts", queuedTicket.state.rawValue, "discarded")
        c.equal("slot mode never charged the byte cap", accounting.liveBytes, 0)
        c.expect("scratch pool served the slot reads without temporaries", scratch.temporaries == 0)
        return c.report()
    }

    public static func expertLookaheadScheduler() throws -> CheckReport {
        var c = CheckBuilder("expert-lookahead-scheduler")
        let pieces = fakePieces
        let record = pieces.reduce(0, +)
        var configuration = ExpertPrefetchConfiguration()
        configuration.enabled = true
        configuration.capRecords = 8
        configuration.lanes = 3
        configuration.windowLayers = 2
        configuration.topPerLayer = 4
        let lock = NSLock()
        var reads: [ExpertKey: Int] = [:]
        var resident = Set<ExpertKey>()
        let slowGate = DispatchSemaphore(value: 0)
        var slowKey: ExpertKey? = nil
        let reader: ExpertPieceReader = { key, piece, destination, shouldContinue in
            if piece == 0 { lock.withLock { reads[key, default: 0] += 1 } }
            if lock.withLock({ slowKey }) == key, piece == 0 { _ = slowGate.wait(timeout: .now() + 2) }
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            fill(destination, key: key, piece: piece, bytes: pieces[piece])
        }
        let scheduler = ExpertPrefetchScheduler(reader: reader, isResident: { key in lock.withLock { resident.contains(key) } },
            pieceBytes: pieces, configuration: configuration, predictor: nil, layers: 6, experts: 16)
        c.expect("no predictor means no forecast without an override", !scheduler.wantsForecast)
        // Deterministic hints: layer 0 duplicates, layer 1 resident key, layer 2 late, layer 4 beyond cap.
        resident.insert(ExpertKey(1, 3))
        scheduler.forecastOverride = { _ in
            [[1, 1, 2, 99], [3, 4], [5, 6], [7], [8, 9, 10, 11], [12, 13, 14, 15]]
        }
        c.expect("override enables forecasting", scheduler.wantsForecast)
        scheduler.beginPass(id: 7, features: [])
        c.equal("first window issues layers 0 and 1 without duplicates or residents or invalid ids",
            scheduler.liveTickets, 3)
        // Claim at layer 0 once the ticket is complete: the duplicate key
        // adopts once; an unknown key is demand.
        for _ in 0 ..< 400 where scheduler.diagnosticState(ExpertKey(0, 1)) != .ready { usleep(5000) }
        c.expect("first ticket completed on its own", scheduler.diagnosticState(ExpertKey(0, 1)) == .ready)
        let claimed = scheduler.claim([ExpertKey(0, 1), ExpertKey(0, 1), ExpertKey(0, 9)])
        c.equal("one ticket per distinct key", claimed.count, 1)
        c.expect("claimed ticket is ready", claimed[ExpertKey(0, 1)]?.state.rawValue == "ready")
        if let ticket = claimed[ExpertKey(0, 1)], let raw = ticket.adoptRaw() {
            c.expect("adopted bytes exact", UnsafeRawBufferPointer(start: raw.buffers[0], count: pieces[0]).allSatisfy { $0 == expected(key: ExpertKey(0, 1), piece: 0) })
            raw.release()
        } else { c.expect("adoption available", false) }
        var observation = scheduler.observation
        c.equal("adoption counted", observation.adopted, 1)
        c.equal("unknown miss counted as demand", observation.demandMisses, 1)
        scheduler.layerCompleted(0)
        c.equal("layer 0 tickets expired and layer 2 issued after the layer completed", scheduler.liveTickets, 3)
        observation = scheduler.observation
        c.equal("expired ready ticket counted", observation.expired, 1)
        // In-flight promotion: hold layer 3's read, then claim it.
        lock.withLock { slowKey = ExpertKey(3, 7) }
        scheduler.layerCompleted(1)
        scheduler.layerCompleted(2)
        c.expect("layer 3 ticket in flight", scheduler.liveTickets >= 1)
        let promotedBefore = scheduler.observation.promoted
        let promoteStart = RuntimeClock.now()
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.05) { slowGate.signal() }
        let promoted = scheduler.claim([ExpertKey(3, 7)])
        c.expect("in-flight ticket promoted and joined", promoted[ExpertKey(3, 7)]?.state.rawValue == "ready")
        c.expect("promotion waited for the read", RuntimeClock.seconds(since: promoteStart) >= 0.04)
        promoted[ExpertKey(3, 7)]?.adoptRaw()?.release()
        observation = scheduler.observation
        c.equal("promotion counted", observation.promoted - promotedBefore, 1)
        // Cap: layer 4 and 5 want 8 records with 8 cap minus live ones.
        scheduler.layerCompleted(3)
        c.expect("cap bounds outstanding tickets", scheduler.liveTickets <= 8)
        scheduler.passEnded()
        c.equal("pass end retires everything", scheduler.liveTickets, 0)
        scheduler.requestFinished()
        c.expect("stale claims after request end are demand", scheduler.claim([ExpertKey(4, 8)]).isEmpty)
        c.equal("no key read twice by the scheduler", lock.withLock { reads.values.filter { $0 > 1 }.count }, 0)
        c.equal("accounting drained at request end", scheduler.accounting.liveBytes, 0)
        // Shadow mode forecasts but never reads.
        var shadowConfiguration = configuration
        shadowConfiguration.enabled = false; shadowConfiguration.shadow = true
        var shadowReads = 0
        let shadow = ExpertPrefetchScheduler(reader: { _, _, _, _ in lock.withLock { shadowReads += 1 } },
            isResident: { _ in false }, pieceBytes: pieces, configuration: shadowConfiguration, predictor: nil, layers: 6, experts: 16)
        shadow.forecastOverride = { _ in [[1, 2], [3], [], [], [], []] }
        shadow.beginPass(id: 1, features: [])
        shadow.layerCompleted(0); shadow.layerCompleted(1)
        shadow.passEnded()
        c.equal("shadow mode issues no reads", lock.withLock { shadowReads }, 0)
        c.equal("shadow mode still counts candidates", shadow.observation.candidates, 3)
        c.equal("shadow claims are demand", shadow.claim([ExpertKey(0, 1)]).count, 0)
        // Recent-routes policy without a pack.
        var recentConfiguration = configuration
        recentConfiguration.policy = .recent; recentConfiguration.recentPasses = 2
        let recent = ExpertPrefetchScheduler(reader: reader, isResident: { _ in false }, pieceBytes: pieces,
            configuration: recentConfiguration, predictor: nil, layers: 6, experts: 16)
        for layer in 0 ..< 6 { recent.observeRoutes(layer: layer, ids: [Int32(layer), Int32(layer), 15]) }
        recent.beginPass(id: 2, features: [])
        c.expect("recent policy issues from observed routes", recent.liveTickets > 0)
        recent.requestFinished()
        c.equal("recent scheduler drained", recent.accounting.liveBytes, 0)
        c.equal("record size known", record, 18432)
        return c.report()
    }

    /// Zero-copy adoption: MLX owns the bytes after `makeStagingArrays`, the
    /// scatter graph reads them, and the finalizer pays the accounting back
    /// only after the graph has released them. Discarding the ticket first
    /// must not free those bytes.
    public static func expertLookaheadAdoption() throws -> CheckReport {
        var c = CheckBuilder("expert-lookahead-adoption")
        MLX.Memory.cacheLimit = 16 << 20
        let rows = 8, cols = 4
        let pieces = Array(repeating: rows * cols * 4, count: 9)
        let record = pieces.reduce(0, +)
        let accounting = ExpertPrefetchAccounting(capBytes: 2 * record)
        let lanes = IOLaneBudget(speculativeLanes: 2)
        let key = ExpertKey(9, 42)
        let reader: ExpertPieceReader = { key, piece, destination, _ in
            let values = destination.bindMemory(to: UInt32.self, capacity: rows * cols)
            for i in 0 ..< rows * cols { values[i] = UInt32(piece * 1000 + i) }
        }
        let ticket = ExpertPrefetchTicket(key: key, pass: 1, revision: 1, pieceBytes: pieces, accounting: accounting)!
        ticket.start(reader: reader, lanes: lanes)
        ticket.join()
        let specs = Array(repeating: (shape: [rows, cols], dtype: DType.uint32), count: 9)
        guard var staged = ticket.makeStagingArrays(shapes: specs) else { c.expect("staging arrays created", false); return c.report() }
        c.equal("ticket adopted", ticket.state.rawValue, "adopted")
        c.equal("bytes still charged after adoption", accounting.liveBytes, record)
        var pools = (0 ..< 9).map { _ in MLXArray.zeros([4, rows, cols], dtype: .uint32) }
        eval(pools)
        let slot = MLXArray([Int32(2)])
        for p in 0 ..< 9 { pools[p][slot] = staged[p] }
        ticket.discard()
        c.equal("discard after adoption cannot free adopted bytes", accounting.liveBytes, record)
        eval(pools)
        var exact = true
        for p in 0 ..< 9 {
            let got = pools[p][2].asArray(UInt32.self)
            if got != (0 ..< rows * cols).map({ UInt32(p * 1000 + $0) }) { exact = false }
        }
        c.expect("scattered bytes are exactly the ticket's bytes", exact)
        c.expect("untouched slots stay zero", pools[0][0].asArray(UInt32.self).allSatisfy { $0 == 0 })
        // Release the staging references and let MLX free them.
        staged.removeAll()
        pools.removeAll()
        Stream.gpu.synchronize()
        MLX.Memory.clearCache()
        for _ in 0 ..< 200 where accounting.liveBytes != 0 { usleep(5000) }
        let released = accounting.liveBytes == 0
        c.expect("finalizer pays the accounting back after the graph releases the bytes", released,
            "live \(accounting.liveBytes) of \(record)")
        // Batched adoption: two tickets' pieces concatenated into one scatter
        // per piece land in their own slots with exact bytes, and both tickets'
        // accounting is paid back once the graph has released the sources.
        var tickets2: [ExpertPrefetchTicket] = []
        for expert in [43, 44] {
            let t = ExpertPrefetchTicket(key: ExpertKey(9, expert), pass: 1, revision: 1, pieceBytes: pieces, accounting: accounting)!
            t.start(reader: { key, piece, destination, _ in
                let values = destination.bindMemory(to: UInt32.self, capacity: rows * cols)
                for i in 0 ..< rows * cols { values[i] = UInt32(key.expert * 100_000 + piece * 1000 + i) }
            }, lanes: lanes)
            t.join()
            tickets2.append(t)
        }
        var staged2 = tickets2.map { $0.makeStagingArrays(shapes: specs)! }
        var pools2 = (0 ..< 9).map { _ in MLXArray.zeros([4, rows, cols], dtype: .uint32) }
        eval(pools2)
        let slots2 = MLXArray([Int32(1), Int32(3)])
        for p in 0 ..< 9 { pools2[p][slots2] = concatenated([staged2[0][p], staged2[1][p]], axis: 0) }
        tickets2.forEach { $0.discard() }
        eval(pools2)
        var exact2 = true
        for (n, slot) in [(0, 1), (1, 3)] {
            for p in 0 ..< 9 where pools2[p][slot].asArray(UInt32.self) != (0 ..< rows * cols).map({ UInt32((43 + n) * 100_000 + p * 1000 + $0) }) {
                exact2 = false
            }
        }
        c.expect("batched adoption scatters each ticket's bytes into its own slot", exact2)
        c.expect("batched adoption leaves other slots zero",
            pools2[0][0].asArray(UInt32.self).allSatisfy { $0 == 0 } && pools2[0][2].asArray(UInt32.self).allSatisfy { $0 == 0 })
        staged2.removeAll(); pools2.removeAll()
        Stream.gpu.synchronize()
        MLX.Memory.clearCache()
        for _ in 0 ..< 200 where accounting.liveBytes != 0 { usleep(5000) }
        c.expect("batched adoption pays the accounting back", accounting.liveBytes == 0, "live \(accounting.liveBytes)")
        c.expect("wrong shape count refuses adoption", {
            let other = ExpertPrefetchTicket(key: key, pass: 1, revision: 1, pieceBytes: pieces, accounting: accounting)!
            other.start(reader: reader, lanes: lanes); other.join()
            let refused = other.makeStagingArrays(shapes: Array(specs.prefix(3))) == nil
            other.discard()
            return refused
        }())
        return c.report()
    }
}
