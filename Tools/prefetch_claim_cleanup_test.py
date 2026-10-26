#!/usr/bin/env python3
"""Bounded Foundation-only worker ownership regression, extracted from production.

No model, MLX module or GPU work. Compilation errors are setup errors (exit 2),
semantic case failures exit 1. The private admitted runner supplies SWIFTC and
PREFETCH_CLAIM_REPORT_PATH; normal static entry uses the installed Swift compiler.
"""
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = ['Sources/Slotstream/ExpertPrefetch.swift',
           'Sources/Slotstream/ExpertStore.swift', 'Sources/Slotstream/Observation.swift',
           'Sources/Slotstream/CacheBookkeeping.swift']


def unique_slice(text, begin, end, name):
    if text.count(begin) != 1 or text.count(end) != 1:
        raise RuntimeError('missing/ambiguous extraction markers: '+name)
    lo, hi = text.index(begin), text.index(end)
    if hi <= lo:
        raise RuntimeError('reversed extraction markers: '+name)
    return text[lo:hi]


def extract():
    prefetch, store, observation, bookkeeping = [(ROOT/name).read_text() for name in SOURCES]
    for text, marker in [(bookkeeping, 'package struct SlotPins {'), (prefetch, '    package func passEnded() {')]:
        if text.count(marker) != 1:
            raise RuntimeError('missing/ambiguous extraction marker: '+marker)
    fragments = {
        'pins': bookkeeping[bookkeeping.index('package struct SlotPins {'):],
        'returns': unique_slice(store, '    private func returnSpeculativeSlot(',
                                '    /// Publish a complete speculative record:', 'returned slots'),
        'slot_counters': unique_slice(prefetch, '    package func slotReturned() {',
                                      '    package var wantsForecast:', 'slot counters'),
        'retire': unique_slice(prefetch, '    private func retire(',
                               '    /// Adoption for actual misses:', 'retire'),
        'lifecycle': prefetch[prefetch.index('    package func passEnded() {'):].rsplit('}', 1)[0],
        'clock': unique_slice(observation, 'public enum RuntimeClock {',
                             '/// Image source decoding', 'clock'),
        'keys_errors': unique_slice(store, 'public struct ExpertKey:',
                                   'public final class ExpertStore {', 'keys/errors'),
        'ticket_lifetime': unique_slice(prefetch, 'package final class IOLaneBudget {',
                                       'public struct ExpertPrefetchObservation:', 'ticket lifetime'),
        'observation': unique_slice(prefetch, 'public struct ExpertPrefetchObservation:',
                                   'package struct ExpertPrefetchConfiguration:', 'observation'),
        'claims': unique_slice(prefetch, '    package struct ClaimResult {',
                              '    package func passEnded() {', 'claims'),
        'ensureCore': unique_slice(store, '    private func ensureCore(',
                                  '    public func unpinAll() {', 'entire ensureCore'),
        'publish': unique_slice(store, '    private func publishSpeculativeSlot(',
                               '    // MARK: sweep', 'slot publication'),
    }
    # Whole bodies stay byte-for-byte intact, including declaration scope,
    # defers, thrown read, both finishReading branches and completed=true.
    for needle in ('var completed = false', 'try readDemand(demandOrder)',
                   'pendingReads = slotClaim.reading', 'pendingReads = claimed.reading',
                   'completed = true'):
        if fragments['ensureCore'].count(needle) != 1:
            raise RuntimeError('missing/ambiguous ownership seam: '+needle)
    receipt = {'sources': {name: hashlib.sha256((ROOT/name).read_bytes()).hexdigest()
                           for name in SOURCES},
               'fragments': {name: {'sha256': hashlib.sha256(value.encode()).hexdigest(),
                                    'bytes': len(value.encode())}
                             for name, value in fragments.items()}}
    swift = ('import Foundation\nimport Darwin\n' + fragments['clock'] + fragments['keys_errors']
             + fragments['pins'] + ADAPTERS + fragments['ticket_lifetime'] + fragments['observation']
             + SCHEDULER + fragments['slot_counters'] + fragments['retire'] + fragments['claims'] + fragments['lifecycle'] + '}\n'
             + POOL + fragments['ensureCore'] + fragments['returns'] + fragments['publish'] + '}\n' + CASES)
    return swift, receipt


ADAPTERS = r'''
struct ModelError: Error { let message: String; init(_ m: String) { message = m } }
package enum DType { case unused }
// Compile-only tensor interfaces: every reached tensor operation is an error.
package struct MLXArray {
    init(_ values: [Int32]) { fatalError("unexpected tensor construction") }
    init(rawPointer: UnsafeMutableRawPointer, _ shape: [Int], dtype: DType,
         deallocator: @escaping () -> Void) { fatalError("unexpected tensor adoption") }
    subscript(_ index: MLXArray) -> MLXArray {
        get { fatalError("unexpected tensor gather") }
        set { fatalError("unexpected tensor scatter") }
    }
}
func eval(_ arrays: [MLXArray]) { fatalError("unexpected tensor eval") }
func asyncEval(_ arrays: [MLXArray]) { fatalError("unexpected tensor asyncEval") }
func concatenated(_ arrays: [MLXArray], axis: Int) -> MLXArray { fatalError("unexpected tensor concatenate") }
enum CPUSlotWrite {
    static func apply(to: MLXArray, from: MLXArray, slots: [Int32]) throws -> MLXArray { fatalError("unexpected CPU tensor write") }
}
enum WordSlotWrite {
    static func eligible(_ a: MLXArray, _ b: MLXArray) -> Bool { fatalError("unexpected tensor eligibility") }
    static func apply(to: MLXArray, from: MLXArray, at: MLXArray) -> MLXArray { fatalError("unexpected word write") }
}
enum SlotWriteRun {
    static func plan(_ slots: [Int32], capacity: Int) -> [Int]? { fatalError("unexpected slice plan") }
    static func apply(_ runs: [Int], to: MLXArray, from: MLXArray) { fatalError("unexpected slice write") }
}
struct ExpertLookaheadDemandEvent {
    var pass: Int; var layer: Int; var mixedLayers: Bool
    var uniqueExperts: [Int32]; var hitExperts: [Int32]; var missExperts: [Int32]
    var victimSlots: [Int32]; var adoptedExperts: [Int32]; var promotedExperts: [Int32]
    var startNanos: UInt64; var readNanos: UInt64; var adoptNanos: UInt64; var endNanos: UInt64
}
final class Session {
    let prefetch: ExpertPrefetchScheduler?; var observer: Int? = nil
    let inMainPass = true; let currentPass = 0
    init(_ scheduler: ExpertPrefetchScheduler?) { prefetch = scheduler }
    func demand(_ event: ExpertLookaheadDemandEvent) { fatalError("unexpected observer") }
}
final class Profile { var scatterPriorWaitSeconds = 0.0; var scatterExecutionSeconds = 0.0 }
// Synchronized observation wrapper delegates every operation to actual SlotPins.
final class PinProbe {
    private let lock = NSLock(); private var storage = SlotPins(count: 12)
    var onUnpin: (() -> Void)?
    var count: Int { lock.lock(); defer { lock.unlock() }; return storage.count }
    subscript(_ index: Int) -> Bool { lock.lock(); defer { lock.unlock() }; return storage[index] }
    func pin(_ index: Int) { lock.lock(); storage.pin(index); lock.unlock() }
    func unpin(_ index: Int) { lock.lock(); onUnpin?(); storage.unpin(index); lock.unlock() }
}
final class ExpertStore {
    static let defaultLoadBatch = 2
    let stagingPieceSpecs: [(shape: [Int], dtype: DType)] = Array(repeating: ([1], .unused), count: 9)
    let supportsRecordReads = false
    let pieceRowBytes = Array(repeating: 4, count: 9)
    var demand: ([ExpertKey]) throws -> Void = { _ in }
    func readIntoSlotsChecked(_ keys: [ExpertKey], slots: [Int], bases: [UnsafeMutableRawPointer],
                              scratch: Int?, finishReaders: (() -> Void)?) throws {
        try demand(keys); finishReaders?()
    }
    func readBatchChecked(_ keys: [ExpertKey]) throws -> [MLXArray] {
        // Throws before any tensor boundary on the staging failure case.
        try demand(keys); fatalError("unexpected tensor demand read")
    }
}
extension ExpertPrefetchTicket {
    var fixtureJoined: Bool { group.wait(timeout: .now()) == .success }
}
'''

SCHEDULER = r'''
// Fixture wiring only. Ownership and handoff algorithms below are verbatim.
package final class ExpertPrefetchScheduler {
    var candidates: [[Int32]] = []; var dirtyTargets = Set<Int>(); var recentRoutes: [[[Int32]]] = []
    var tickets: [ExpertKey: ExpertPrefetchTicket] = [:]
    var draining: [ExpertPrefetchTicket] = []
    var slotsOut = 0
    var closed = false; var currentPass = 0; var revision: UInt64 = 1
    var observationValue = ExpertPrefetchObservation()
    let lanes = IOLaneBudget(speculativeLanes: 4)
    var usesSlotAdoption = false
    let configuration = (inputForecast: false, fixtureOnly: true)
    var liveTickets: Int { tickets.count }
    func noteLayerDemand(misses: Int) {}
    func noteSlotStale() {}
    func noteSlotRelease() {}
    func noteSlotAdopted() {}
'''

POOL = r'''
final class Pool {
    let cfg = (numLayers: 4, numExperts: 32)
    let slots = 12
    let pinned = PinProbe()
    var map: [ExpertKey: Int] = [:]
    var keyOf: [ExpertKey?] = Array(repeating: nil, count: 12)
    var refBit = Array(repeating: false, count: 12)
    var inFlight = Array(repeating: false, count: 12)
    var inFlightCount = 0
    var hits = 0; var misses = 0; var recordsAdopted = 0; var recordsFetched = 0
    var speculativeSlotStale = 0; var readyTicketPrelaunchRecords = 0
    var slotScatterBatches = 0; var slotDirectBatches = 0; var overlapDirectBatches = 0
    var slotCPUBatches = 0; var slotWordBatches = 0; var slotWordBuffers = 0
    var slotSliceBatches = 0; var slotSliceRuns = 0; var speculativeSlotAdoptions = 0
    var poolWriteEpoch: UInt64 = 0
    var ioSeconds = 0.0; var scatterSeconds = 0.0; var fillSeconds = 0.0; var adoptSeconds = 0.0
    let diagnosticOverlapReadyTickets = false; let diagnosticOverlapDirectCopies = false
    var directDemandReads = true; let cpuSlotWrites = false; let wordSlotWrites = false
    let contiguousSlotWrites = false; let demandScratch: Int? = nil
    var transferProfile: Profile? = nil
    var pools: [MLXArray] = []
    enum ScatterMode { case sync, async, none }; static let scatterMode: ScatterMode = .none
    var lookahead: Session?; let store = ExpertStore()
    var bases: [UnsafeMutableRawPointer] = []
    init(_ scheduler: ExpertPrefetchScheduler?) {
        lookahead = Session(scheduler)
        bases = (0..<9).map { _ in UnsafeMutableRawPointer.allocate(byteCount: 4, alignment: 16) }
    }
    deinit { bases.forEach { $0.deallocate() } }
    func fixtureReturn(_ slot: Int) { returnSpeculativeSlot(slot) }
    func currentPoolBases() -> [UnsafeMutableRawPointer]? { bases }
    let returnedLock = NSLock(); var returnedSlots: [Int] = []; var freeSlots: [Int] = []
    func victim(preferLayer: Int) -> Int {
        for s in 0..<slots where !pinned[s] && !inFlight[s] { return s }
        fatalError("tiny fixture pool exhausted")
    }
    func run(_ keys: [ExpertKey]) throws -> [Int] { try ensureCore(keys, reservedHits: nil, finishReaders: nil) }
'''

CASES = r'''
enum FixtureFailure: Error { case siblingDemand, worker }
final class Shared {
    let lock = NSLock(); var returns = 0; var timedOut = false; var release = false
    var tickets: [ExpertPrefetchTicket] = []
    func returned() { lock.lock(); returns += 1; lock.unlock() }
    func snapshot() -> (returns: Int, timedOut: Bool) {
        lock.lock(); defer { lock.unlock() }; return (returns, timedOut)
    }
    func open() { lock.lock(); release = true; lock.unlock() }
    func gate() -> Bool {
        lock.lock(); let opened = release; let owned = tickets; lock.unlock()
        return opened || (!owned.isEmpty && owned.allSatisfy { $0.isCancelled })
    }
    func timeout() { lock.lock(); timedOut = true; lock.unlock() }
}
var receipts: [[String: Any]] = []
var failures = 0
func record(_ name: String, _ facts: [String: Any], _ checks: [(String, Bool)]) {
    let failed = checks.filter { !$0.1 }.map { $0.0 }
    var row = facts; row["case"] = name; row["failed"] = failed; row["passed"] = failed.isEmpty
    receipts.append(row); failures += failed.isEmpty ? 0 : 1
}
func makeTicket(_ key: ExpertKey, _ slot: Bool, _ index: Int, _ pool: Pool,
                _ state: Shared, _ accounting: ExpertPrefetchAccounting) -> ExpertPrefetchTicket {
    if slot {
        // Distinct tiny borrowed pieces, retained until all actual joins finish.
        let destinations = (0..<9).map { _ in UnsafeMutableRawPointer.allocate(byteCount: 4, alignment: 16) }
        fixtureAllocations.append(contentsOf: destinations)
        let reservation = SpeculativeSlotReservation(slot: index, destinations: destinations,
            pieceBytes: Array(repeating: 4, count: 9), bases: pool.bases, onLeave: { [weak pool] slot in
                guard let pool else { fatalError("pool released before worker") }
                state.returned()
                pool.fixtureReturn(slot)
            })
        pool.inFlight[index] = true; pool.inFlightCount += 1
        pool.lookahead!.prefetch!.slotsOut += 1
        return ExpertPrefetchTicket(key: key, pass: 0, revision: 1, reservation: reservation, accounting: accounting)
    }
    return ExpertPrefetchTicket(key: key, pass: 0, revision: 1,
        pieceBytes: Array(repeating: 4, count: 9), accounting: accounting)!
}
var fixtureAllocations: [UnsafeMutableRawPointer] = []
func failureCase(slot: Bool, count: Int) {
    let shared = Shared(); let scheduler = ExpertPrefetchScheduler(); scheduler.usesSlotAdoption = slot
    let pool = Pool(scheduler); pool.directDemandReads = slot
    let accounting = ExpertPrefetchAccounting(capBytes: 512)
    let arrived = (0..<count).map { _ in DispatchSemaphore(value: 0) }
    var owned: [ExpertPrefetchTicket] = []
    for i in 0..<count {
        let key = ExpertKey(2, i+1)
        let ticket = makeTicket(key, slot, i, pool, shared, accounting)
        owned.append(ticket); scheduler.tickets[key] = ticket
    }
    shared.tickets = owned
    // Guaranteed safe teardown on both RED and GREEN. No fixture pointer is
    // freed while any worker exists, even after a semantic assertion failure.
    defer {
        shared.open(); owned.forEach { $0.discard() }; owned.forEach { $0.join() }
        scheduler.draining.forEach { $0.discard() }; scheduler.draining.forEach { $0.join() }
        shared.lock.lock(); shared.tickets.removeAll(); shared.lock.unlock()
        fixtureAllocations.forEach { $0.deallocate() }; fixtureAllocations.removeAll()
    }
    for (i, ticket) in owned.enumerated() {
        ticket.start(reader: { _, piece, pointer, _ in
            if piece == 1 {
                arrived[i].signal()
                let ceiling = DispatchTime.now().uptimeNanoseconds + 3_000_000_000
                while !shared.gate() {
                    if DispatchTime.now().uptimeNanoseconds > ceiling { shared.timeout(); throw FixtureFailure.worker }
                    Thread.sleep(forTimeInterval: 0.001)
                }
            }
            pointer.storeBytes(of: UInt32(piece), as: UInt32.self)
        }, lanes: scheduler.lanes, scratch: ExpertPrefetchScratch(pieceBytes: 4, count: 2))
    }
    let allArrived = arrived.allSatisfy { $0.wait(timeout: .now()+2) == .success }
    pool.pinned.pin(11) // Preexisting pin must survive rollback.
    let priorPins = pool.pinned.count
    var pinReleaseBeforeJoin = false
    pool.pinned.onUnpin = { if !owned.allSatisfy({ $0.fixtureJoined }) { pinReleaseBeforeJoin = true } }
    pool.store.demand = { keys in
        guard keys == [ExpertKey(2, 20)] else { throw FixtureFailure.worker }
        throw FixtureFailure.siblingDemand
    }
    var original = false
    do { _ = try pool.run(owned.map { $0.key } + [ExpertKey(2, 20)]) }
    catch FixtureFailure.siblingDemand { original = true }
    catch {}
    // Snapshot BEFORE teardown repairs the deliberately broken baseline.
    let progress = owned.map { $0.progress }
    let promoted = owned.allSatisfy { $0.isPromoted }
    let lanesAtBoundary = scheduler.lanes.snapshot
    let cancelled = owned.allSatisfy { $0.isCancelled }
    let joined = owned.allSatisfy { $0.fixtureJoined }
    let boundary = shared.snapshot()
    let returns = boundary.returns
    let released = accounting.releaseCount
    scheduler.requestFinished(); pool.drainReturnedSlots()
    let outstandingAtRequestExit = pool.inFlightCount
    let schedulerSlotsOutAtRequestExit = scheduler.slotsOut
    let facts: [String: Any] = ["arrived": allArrived, "original_error": original, "progress": progress, "all_promoted": promoted,
        "lanes_demand_at_boundary": lanesAtBoundary.demandActive, "lanes_speculative_at_boundary": lanesAtBoundary.speculativeInUse,
        "cancelled_at_owner_exit": cancelled, "joined_at_owner_exit": joined,
        "returns_at_owner_exit": returns, "accounting_releases_at_owner_exit": released,
        "pin_release_before_join": pinReleaseBeforeJoin, "worker_deadline_hit": boundary.timedOut,
        "scheduler_tickets_after_claim": scheduler.liveTickets,
        "outstanding_slots_at_request_exit": outstandingAtRequestExit,
        "scheduler_slots_out_at_request_exit": schedulerSlotsOutAtRequestExit]
    // Teardown first, then assert exactly-once ownership after repeated discard.
    shared.open(); owned.forEach { $0.discard() }; owned.forEach { $0.join() }
    owned.forEach { $0.discard() }; owned.forEach { $0.join() }
    pool.drainReturnedSlots()
    record("failed-demand-\(slot ? "slot" : "staging")-\(count)", facts, [
        ("held_second_piece", allArrived && progress.allSatisfy { $0 >= 1 }), ("actual_split_promotion", promoted), ("original_error", original),
        ("cancelled_before_owner_exit", cancelled), ("joined_before_owner_exit", joined),
        ("lanes_clear_before_owner_exit", lanesAtBoundary.demandActive == 0 && lanesAtBoundary.speculativeInUse == 0),
        ("cleanup_before_pin_rollback", !pinReleaseBeforeJoin), ("cancel_all_before_join", !shared.snapshot().timedOut),
        ("claim_removed_scheduler_ownership", scheduler.liveTickets == 0),
        ("request_releases_reservations", outstandingAtRequestExit == 0 && schedulerSlotsOutAtRequestExit == 0),
        ("release_at_boundary", slot ? returns == count : released == count),
        ("exactly_once_release", slot ? shared.snapshot().returns == count : accounting.releaseCount == count),
        ("zero_staging_live_bytes", accounting.liveBytes == 0),
        ("lanes_clear_after_teardown", scheduler.lanes.snapshot.demandActive == 0 && scheduler.lanes.snapshot.speculativeInUse == 0),
        ("preexisting_pin_preserved", pool.pinned[11] && pool.pinned.count == priorPins)])
}
func slotControl(_ mode: String) {
    let shared = Shared(); let scheduler = ExpertPrefetchScheduler(); scheduler.usesSlotAdoption = true
    let pool = Pool(scheduler); let accounting = ExpertPrefetchAccounting(capBytes: 64)
    let key = ExpertKey(2, 1); let ticket = makeTicket(key, true, 0, pool, shared, accounting)
    scheduler.tickets[key] = ticket
    defer {
        shared.open(); ticket.discard(); ticket.join()
        scheduler.draining.forEach { $0.discard() }; scheduler.draining.forEach { $0.join() }
        fixtureAllocations.forEach { $0.deallocate() }; fixtureAllocations.removeAll()
    }
    let held = DispatchSemaphore(value: 0); let proceed = DispatchSemaphore(value: 0)
    ticket.start(reader: { _, piece, destination, _ in
        if mode == "failed-worker" && piece == 0 { throw FixtureFailure.worker }
        if mode == "split-success" && piece == 1 {
            held.signal()
            guard proceed.wait(timeout: .now()+2) == .success else { throw FixtureFailure.worker }
        }
        destination.storeBytes(of: UInt32(piece), as: UInt32.self)
    }, lanes: scheduler.lanes, scratch: ExpertPrefetchScratch(pieceBytes: 4, count: 2))
    var entered = true
    if mode == "split-success" { entered = held.wait(timeout: .now()+2) == .success }
    else { ticket.join() }
    if mode == "cancelled-worker" { ticket.discard(); ticket.join() }
    var demandCalls = 0
    pool.store.demand = { _ in demandCalls += 1; proceed.signal() }
    var succeeded = false
    do { let result = try pool.run([key, ExpertKey(2, 20)]); succeeded = result.count == 2 && result.allSatisfy { $0 >= 0 } }
    catch {}
    let adopted = ticket.state == .adopted
    let returns = shared.snapshot().returns
    pool.drainReturnedSlots()
    let exactPayload = !adopted || ticket.slotReservation!.destinations.enumerated().allSatisfy { index, p in p.load(as: UInt32.self) == UInt32(index) }
    record(mode, ["demand_calls": demandCalls, "adopted": adopted, "returns": returns], [
        ("successful_actual_ensureCore", succeeded), ("worker_entered", entered),
        ("worker_joined", ticket.fixtureJoined),
        ("expected_adoption", mode == "failed-worker" || mode == "cancelled-worker" ? !adopted : adopted),
        ("correct_return_count", mode == "failed-worker" || mode == "cancelled-worker" ? returns == 1 : returns == 0),
        ("success_not_cancelled", adopted ? !ticket.isCancelled : true),
        ("published_key_and_pin", adopted ? pool.map[key] == 0 && pool.pinned[0] : true),
        ("actual_worker_payload", adopted ? exactPayload : true),
        ("zero_outstanding_reservations", pool.inFlightCount == 0 && scheduler.slotsOut == 0)])
}
func stagingAdoptionControl() {
    let accounting = ExpertPrefetchAccounting(capBytes: 64)
    let ticket = ExpertPrefetchTicket(key: ExpertKey(2, 1), pass: 0, revision: 1,
        pieceBytes: Array(repeating: 4, count: 9), accounting: accounting)!
    ticket.start(reader: { _, _, p, _ in p.storeBytes(of: UInt32(1), as: UInt32.self) }, lanes: IOLaneBudget(speculativeLanes: 1))
    ticket.join()
    guard let raw = ticket.adoptRaw() else { record("staging-adopted", [:], [("adoptRaw", false)]); ticket.discard(); return }
    ticket.discard(); ticket.join()
    let retained = accounting.liveBytes == 36 && accounting.releaseCount == 0
    raw.release()
    record("staging-adopted", ["retained_until_adopter_release": retained], [
        ("adopted_state", ticket.state == .adopted), ("adopter_retains_bytes", retained),
        ("one_release", accounting.liveBytes == 0 && accounting.releaseCount == 1)])
}
func noPendingControl() {
    let pool = Pool(nil); var calls = 0; pool.store.demand = { _ in calls += 1 }
    var success = false
    do { success = try pool.run([ExpertKey(2, 1)]).count == 1 } catch {}
    record("no-pending", ["demand_calls": calls], [("success", success && calls == 1)])
}
failureCase(slot: true, count: 1)
failureCase(slot: false, count: 1)
failureCase(slot: true, count: 2)
failureCase(slot: false, count: 2)
for mode in ["ready-success", "split-success", "failed-worker", "cancelled-worker"] { slotControl(mode) }
stagingAdoptionControl()
noPendingControl()
let output = try JSONSerialization.data(withJSONObject: ["cases": receipts, "failures": failures], options: [.sortedKeys])
print(String(data: output, encoding: .utf8)!)
exit(failures == 0 ? 0 : 1)
'''


def main():
    report = {'scope': 'bounded extracted ownership logic only', 'runtime_started': False}
    path = os.environ.get('PREFETCH_CLAIM_REPORT_PATH')
    code = 2
    try:
        swift, extraction = extract()
        report['extraction'] = extraction
        compiler = os.environ.get('SWIFTC') or shutil.which('swiftc')
        if not compiler:
            raise RuntimeError('Swift compiler unavailable')
        with tempfile.TemporaryDirectory(prefix='prefetch-claim-') as directory:
            source, binary = Path(directory)/'main.swift', Path(directory)/'ownership'
            source.write_text(swift)
            compile_result = subprocess.run([compiler, '-swift-version', '5', '-package-name', 'SlotstreamFixture',
                '-module-cache-path', str(Path(directory)/'module-cache'),
                str(source), '-o', str(binary)], text=True, capture_output=True, timeout=45)
            report['compiler'] = {'exitcode': compile_result.returncode,
                'stdout': compile_result.stdout, 'stderr': compile_result.stderr}
            if compile_result.returncode:
                raise RuntimeError('fixture compiler failed; this is not semantic RED')
            report['runtime_started'] = True
            run = subprocess.run([str(binary)], text=True, capture_output=True, timeout=25)
            report['binary'] = {'exitcode': run.returncode, 'stdout': run.stdout, 'stderr': run.stderr}
            cases = json.loads(run.stdout)
            report['cases'] = cases
            if run.returncode not in (0, 1) or (run.returncode == 0) != (cases['failures'] == 0):
                raise RuntimeError('binary verdict inconsistent')
            expected_names = {'failed-demand-slot-1', 'failed-demand-staging-1',
                              'failed-demand-slot-2', 'failed-demand-staging-2'}
            semantic_checks = {'cancelled_before_owner_exit', 'joined_before_owner_exit',
                               'cleanup_before_pin_rollback', 'request_releases_reservations',
                               'lanes_clear_before_owner_exit',
                               'release_at_boundary'}
            rows = cases.get('cases', [])
            expected_rows = [row for row in rows if row.get('case') in expected_names]
            controls = [row for row in rows if row.get('case') not in expected_names]
            valid_shape = (len(rows) == 10 and len(expected_rows) == 4 and len(controls) == 6
                           and {row.get('case') for row in expected_rows} == expected_names)
            all_pass = valid_shape and all(row.get('passed') is True and row.get('failed') == [] for row in rows)
            semantic_red = (valid_shape and all(row.get('passed') is True and row.get('failed') == [] for row in controls)
                            and all(row.get('passed') is False and row.get('failed')
                                    and set(row['failed']) <= semantic_checks for row in expected_rows))
            report['classification'] = ('GREEN' if all_pass else 'semantic-RED' if semantic_red else 'setup-or-control-fault')
            code = 0 if all_pass and run.returncode == 0 else 1 if semantic_red and run.returncode == 1 else 2
    except BaseException as error:
        report['setup_error'] = repr(error)
        print(str(error), file=sys.stderr)
    finally:
        report['exitcode'] = code
        if path:
            Path(path).write_text(json.dumps(report, indent=2)+'\n')
        print(json.dumps(report, sort_keys=True))
    return code


if __name__ == '__main__':
    raise SystemExit(main())
