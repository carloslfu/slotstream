#!/usr/bin/env python3
"""Bounded Foundation-only test of ordinary Engine queue callback forwarding.

Extracted production admission ends before generation/model work. The success
sentinel is fixture-only, not inference qualification. Exit 2 is setup/containment,
exit 1 is any valid semantic failure (including a partial regression set).
GENERATION_QUEUE_REPORT_PATH optionally receives source/fragment hashes and cases.
"""
import hashlib
import json
import os
from pathlib import Path
import shutil
import signal
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parents[1]
SOURCES = ['Sources/Slotstream/Engine.swift', 'Sources/Slotstream/RequestControl.swift',
           'Sources/Slotstream/PressureBoundary.swift', 'Sources/Slotstream/Observation.swift']
CASES = {'implicit-false-queued', 'implicit-flips-queued', 'implicit-false-free',
         'nil-callback-queued', 'true-callback-queued', 'explicit-connected-authority',
         'explicit-disconnected', 'explicit-cancel-queued', 'explicit-sticky-error'}


def unique_slice(source, begin, end, name):
    if source.count(begin) != 1 or source.count(end) != 1:
        raise RuntimeError('missing/ambiguous extraction fence: ' + name)
    lo, hi = source.index(begin), source.index(end)
    if hi <= lo:
        raise RuntimeError('reversed extraction fence: ' + name)
    return source[lo:hi]


def extract():
    engine, request, pressure, observation = [(ROOT / name).read_text() for name in SOURCES]
    fragments = {
        'clock': unique_slice(observation, 'public enum RuntimeClock {',
                              '/// Image source decoding', 'clock'),
        'begin_request': unique_slice(engine, '    public func beginRequest(',
                                      '    private let requestReservations', 'beginRequest'),
        'public_overloads': unique_slice(engine, '    public func generate(\n        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,\n        shouldContinue: (() -> Bool)? = nil,\n        onToken: ((Int, String) -> Bool)? = nil\n',
                                         '    public typealias GenerationResult', 'public overloads'),
        'exclusive': unique_slice(engine, '    public func withExclusive<T>(',
                                  '    @discardableResult\n    package func tryWithExclusive', 'withExclusive'),
        'admission': unique_slice(engine, '    private func generatePhase(\n',
                                  '        let queueSeconds = RuntimeClock.seconds(since: requestStart)',
                                  'complete admission prefix/catch'),
        'request_control': request,
        'pressure_boundary_and_gate': pressure,
    }
    if fragments['public_overloads'].count('    public func generate(') != 2:
        raise RuntimeError('expected both public ordinary overloads')
    if 'return ("", [], stats)\n        }\n' not in fragments['admission']:
        raise RuntimeError('admission catch return fence changed')
    receipt = {
        'sources': {name: hashlib.sha256((ROOT / name).read_bytes()).hexdigest() for name in SOURCES},
        'fragments': {name: {'sha256': hashlib.sha256(value.encode()).hexdigest(),
                             'bytes': len(value.encode())} for name, value in fragments.items()},
        'prefix_end_excluded': 'let queueSeconds = RuntimeClock.seconds(since: requestStart)',
    }
    swift = '\n'.join(['import Foundation', ADAPTERS, fragments['clock'], request, pressure,
                       ENGINE_ADAPTER, fragments['begin_request'], fragments['exclusive'],
                       fragments['public_overloads'], fragments['admission'], SUCCESS_TAIL, TESTS])
    receipt['fixture_sha256'] = hashlib.sha256(swift.encode()).hexdigest()
    return swift, receipt


# Inert adapters only: configuration dependencies, unrelated model types, memory
# telemetry and unused prefill estimates. Controller, reservations, gate, clock,
# beginRequest, forwarding methods, and the complete admission catch are actual.
ADAPTERS = r'''
public enum ContextPolicy {
    public static let defaultTokens = 32768
    public static func validationError(_ tokens: Int, qualification: Bool) -> String? {
        tokens == defaultTokens ? nil : "fixture supports only default window"
    }
}
enum ContextBytes {
    static func sum(_ values: Int...) -> Int {
        values.reduce(0) { a, b in
            let (result, overflow) = a.addingReportingOverflow(b)
            return overflow ? Int.max : result
        }
    }
    static func product(_ a: Int, _ b: Int) -> Int {
        let (result, overflow) = a.multipliedReportingOverflow(by: b)
        return overflow ? Int.max : result
    }
}
enum PrefillSchedule {
    static func estimateSeconds(tokens: Int, from: Int, maxChunk: Int, tailAware: Bool) -> Double? { nil }
}
public enum Planner {
    private static let observerLock = NSLock()
    private static var observer: DispatchSemaphore?
    static func observe(_ next: DispatchSemaphore?) { observerLock.withLock { observer = next } }
    public static func deviceAvailableGB() -> Double? {
        observerLock.withLock { observer }?.signal()
        return 64 // Inert availability; no platform/memory allocation observation.
    }
    static func deviceRAMGB() -> Double { 48 }
    static func availabilitySlackGB(ramGB: Double) -> Double { 0 }
}
public struct SampleParams { public init() {} }
public struct VisionPrompt {}
public struct GenStats {
    var promptTokens = 0
    var requestFailure: RequestFailure?
    var runtimeError: String?
    var finishReason = ""
    var memoryPressureCancelled = false
    var memoryPressureBoundarySeconds: Double?
    var requestSeconds: Double = 0
    mutating func recordProcessMemory() {} // Telemetry only, no native memory work.
}
struct GenerationPhaseState {}
struct FixturePlan {
    var maxPrefillWaitMinutes: Double = 0 // Disable only deadline; test cancellation.
    var contextQualification = false
    var ramGB: Double = 48
}
struct FixtureResources { var usesBaselineSpeedEvidence = true }
'''

ENGINE_ADAPTER = r'''
// Storage adapters, not a replacement for the admission logic extracted below.
public final class Engine: @unchecked Sendable {
    public typealias GenerationResult = (text: String, ids: [Int], stats: GenStats)
    private let lock = GenerationGate()
    private let contextLock = NSLock(), planLock = NSLock(), osPressureLock = NSLock()
    private var contextAssignmentFailure: RequestFailure?
    private var allocationUnavailable: RequestFailure?
    private let pressureBoundary = PressureBoundary()
    private var osPressure = false
    private let requestReservations = RequestMemoryReservations()
    // Deliberately nil: this diagnostic factory ignores beginRequest's connected.
    private let requestControllerOverride: (() throws -> RequestController)? = nil
    private let currentPlan: FixturePlan? = FixturePlan()
    private let resources = FixtureResources()
    private let maxContextTokens = ContextPolicy.defaultTokens
    private let allocatedContextTokens = ContextPolicy.defaultTokens
    private func contextError(promptTokens: Int) -> String? { nil }
    func fixtureGateAvailable() -> Bool { lock.tryWithExclusive {} }
}
// Keep the real method access levels, including private generatePhase, together.
extension Engine {
'''

SUCCESS_TAIL = r'''
        // FIXTURE-ONLY SUCCESS TAIL: admission sentinel, no generator/model work.
        // The production prefix owns the gate here; release on the same worker.
        defer { control.releaseDispatchReservation(); if !gateHeld { lock.unlock() } }
        var stats = GenStats(); stats.finishReason = "fixture_admitted"
        return ("fixture-only admission", [4242], stats)
    }
}
'''

TESTS = r'''
final class Flag {
    private let lock = NSLock()
    private var value: Bool
    init(_ value: Bool) { self.value = value }
    func set(_ next: Bool) { lock.withLock { value = next } }
    func get() -> Bool { lock.withLock { value } }
}
final class ResultBox {
    private let lock = NSLock()
    private var value: Engine.GenerationResult?
    func put(_ next: Engine.GenerationResult) { lock.withLock { value = next } }
    func get() -> Engine.GenerationResult? { lock.withLock { value } }
}
var rows: [[String: Any]] = []
func cancelled(_ result: Engine.GenerationResult?) -> Bool {
    guard let result else { return false }
    return result.stats.requestFailure?.code == .clientCancelled && result.ids.isEmpty
        && result.text.isEmpty && result.stats.finishReason == "error"
        && result.stats.runtimeError == result.stats.requestFailure?.message
        && !result.stats.memoryPressureCancelled && result.stats.promptTokens == 1
}
func admitted(_ result: Engine.GenerationResult?) -> Bool {
    result?.ids == [4242] && result?.stats.finishReason == "fixture_admitted"
        && result?.stats.requestFailure == nil
}
func gateReusable(_ engine: Engine) -> Bool {
    // Probe without blocking first; the joined waiter cannot acquire it again.
    guard engine.fixtureGateAvailable() else { return false }
    return admitted(invoke(engine, nil, nil, legacy: false))
}
func record(_ name: String, _ checks: [String: Bool], _ errors: [String] = []) {
    let failed = checks.filter { !$0.value }.map { $0.key }.sorted()
    rows.append(["case": name, "checks": checks, "failed": failed,
                 "setup_errors": errors, "passed": failed.isEmpty && errors.isEmpty])
}
func freshRequest(_ connected: @escaping () -> Bool = { true }) throws -> RequestController {
    RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0),
                      slackBytes: 0, connected: connected)
}
func invoke(_ engine: Engine, _ callback: (() -> Bool)?, _ request: RequestController?,
            legacy: Bool) -> Engine.GenerationResult {
    if legacy {
        return engine.generate(promptIds: [1], params: SampleParams(), shouldContinue: callback)
    }
    return engine.generate(promptIds: [1], params: SampleParams(), shouldContinue: callback, request: request)
}
// The main thread holds actual withExclusive and releases that NSLock itself.
// Only one background waiter exists at a time. Every path releases and joins it.
func queued(_ name: String, flag: Flag?, request: RequestController? = nil,
            legacy: Bool = false, expectCancellation: Bool, observeQueue: Bool = true,
            change: () -> Void = {}) {
    let engine = Engine(), box = ResultBox()
    let entered = DispatchSemaphore(value: 0), observed = DispatchSemaphore(value: 0)
    let done = DispatchSemaphore(value: 0)
    var errors: [String] = [], checks: [String: Bool] = [:]
    var returnedWhileHeld = false
    Planner.observe(observed)
    engine.withExclusive {
        DispatchQueue(label: "fixture.single.waiter").async {
            entered.signal()
            let callback: (() -> Bool)? = flag.map { flag in { flag.get() } }
            box.put(invoke(engine, callback, request, legacy: legacy))
            done.signal()
        }
        if entered.wait(timeout: .now() + 2) != .success { errors.append("waiter invocation handshake") }
        if observeQueue && observed.wait(timeout: .now() + 2) != .success {
            errors.append("actual controller queue availability handshake")
        }
        change()
        // A missed bounded cancellation observation is SEMANTIC, not setup.
        returnedWhileHeld = done.wait(timeout: .now() + (expectCancellation ? 0.8 : 0.03)) == .success
        checks["expected_return_while_holder_held"] = returnedWhileHeld == expectCancellation
        if expectCancellation {
            checks["cancelled_before_release"] = cancelled(box.get())
            checks["no_successful_admission_before_release"] = !admitted(box.get())
        }
    }
    if !returnedWhileHeld && done.wait(timeout: .now() + 2) != .success {
        errors.append("waiter completion after holder release")
    }
    Planner.observe(nil)
    if errors.contains("waiter completion after holder release") {
        // Containment failure: do not run another case while a waiter survives.
        record(name, checks, errors)
        emitAndExit(2)
    }
    checks["terminal_result"] = expectCancellation ? cancelled(box.get()) : admitted(box.get())
    // A later real public call proves the gate is available after both outcomes.
    checks["gate_released_after_join"] = gateReusable(engine)
    record(name, checks, errors)
}
func emitAndExit(_ code: Int? = nil) -> Never {
    let failures = rows.filter { ($0["passed"] as? Bool) != true }.count
    let setup = rows.contains { !(($0["setup_errors"] as? [String]) ?? []).isEmpty }
    let data = try! JSONSerialization.data(withJSONObject: ["cases": rows, "failures": failures], options: [.sortedKeys])
    print(String(data: data, encoding: .utf8)!)
    exit(Int32(code ?? (setup ? 2 : failures > 0 ? 1 : 0)))
}
let initiallyFalse = Flag(false)
queued("implicit-false-queued", flag: initiallyFalse, legacy: true,
       expectCancellation: true, observeQueue: false)
let flipping = Flag(true)
queued("implicit-flips-queued", flag: flipping, expectCancellation: true) { flipping.set(false) }
do {
    let engine = Engine()
    let result = invoke(engine, { false }, nil, legacy: true)
    record("implicit-false-free", ["cancelled_at_free_gate": cancelled(result),
        "no_successful_admission": !admitted(result),
        "gate_released_after_cancellation": gateReusable(engine)])
}
queued("nil-callback-queued", flag: nil, legacy: true, expectCancellation: false)
queued("true-callback-queued", flag: Flag(true), expectCancellation: false)
do {
    let explicit = try freshRequest()
    queued("explicit-connected-authority", flag: Flag(false), request: explicit, expectCancellation: false)
    let engine = Engine(), disconnected = try freshRequest({ false })
    record("explicit-disconnected", ["explicit_callback_preserved": cancelled(invoke(engine, { true }, disconnected, legacy: false)),
        "same_controller_sticky_failure": disconnected.failure?.code == .clientCancelled,
        "gate_released": gateReusable(engine)])
    let control = try freshRequest()
    queued("explicit-cancel-queued", flag: Flag(true), request: control,
           expectCancellation: true) { control.cancel() }
    let sticky = try freshRequest()
    let original = RequestFailure(.invalidConfiguration, "fixture original sticky failure")
    sticky.fail(original)
    let result = invoke(engine, { false }, sticky, legacy: false)
    record("explicit-sticky-error", ["same_error_returned": result.stats.requestFailure == original,
        "same_controller_failure": sticky.failure == original,
        "error_normalization": result.text.isEmpty && result.ids.isEmpty && result.stats.finishReason == "error"
            && result.stats.runtimeError == original.message,
        "gate_released": gateReusable(engine)])
} catch {
    record("fixture-setup", [:], [String(describing: error)])
}
emitAndExit()
'''



def bounded_run(command, budget):
    # Own a separate process group inside the supervisor's existing session.
    # No signal handlers or new session: phase_child may execute other fixtures
    # in this interpreter, and its SID supervisor must retain full ownership.
    deadline = time.monotonic() + budget
    process = subprocess.Popen(command, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                               preexec_fn=os.setpgrp)
    try:
        stdout, stderr = process.communicate(timeout=max(0.01, deadline - time.monotonic() - 2))
        return subprocess.CompletedProcess(command, process.returncode, stdout, stderr)
    except BaseException:
        try:
            os.killpg(process.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        # Reap the direct child after killing its owned group on any interruption.
        # The outer SID supervisor additionally verifies descendants are absent.
        process.communicate(timeout=max(0.01, deadline - time.monotonic()))
        raise


def main():
    report = {'scope': 'ordinary implicit-request admission/cancellation; no inference',
              'runtime_started': False, 'compiler': {'status': 'not-started'},
              'binary': {'status': 'not-started'}}
    code = 2
    try:
        swift, report['extraction'] = extract()
        compiler = os.environ.get('SWIFTC') or shutil.which('swiftc')
        if not compiler:
            raise RuntimeError('Swift compiler unavailable')
        with tempfile.TemporaryDirectory(prefix='generation-queue-') as directory:
            source, binary = Path(directory) / 'main.swift', Path(directory) / 'queue-cancel'
            source.write_text(swift)
            report['compiler'] = {'status': 'running', 'limit_seconds': 45}
            compiled = bounded_run([compiler, '-swift-version', '5', '-package-name', 'SlotstreamFixture',
                '-module-cache-path', str(Path(directory) / 'module-cache'), str(source), '-o', str(binary)],
                45)
            report['compiler'] = {'status': 'completed', 'exitcode': compiled.returncode,
                                  'stdout': compiled.stdout, 'stderr': compiled.stderr}
            if compiled.returncode:
                raise RuntimeError('fixture compiler failed; not semantic RED')
            report['runtime_started'] = True
            report['binary'] = {'status': 'running', 'limit_seconds': 25}
            run = bounded_run([str(binary)], 25)
            report['binary'] = {'status': 'completed', 'exitcode': run.returncode,
                                'stdout': run.stdout, 'stderr': run.stderr}
            payload = json.loads(run.stdout)
            rows = payload.get('cases', [])
            report['cases'] = rows
            valid = (len(rows) == len(CASES) and {row.get('case') for row in rows} == CASES
                     and all(isinstance(row.get('checks'), dict) and row['checks']
                             and all(type(value) is bool for value in row['checks'].values())
                             and row.get('failed') == sorted(key for key, value in row['checks'].items() if not value)
                             and row.get('passed') == (not row['failed'] and not row.get('setup_errors'))
                             and row.get('setup_errors') == [] for row in rows)
                     and payload.get('failures') == sum(row.get('passed') is not True for row in rows))
            expected = 0 if all(row.get('passed') is True for row in rows) else 1
            if not valid or run.returncode != expected:
                raise RuntimeError('invalid case receipt, setup or containment failure')
            code = expected
            report['classification'] = 'GREEN' if code == 0 else 'semantic-RED'
    except BaseException as error:
        for phase in ('compiler', 'binary'):
            if report[phase].get('status') == 'running':
                report[phase]['status'] = 'timed-out' if isinstance(error, subprocess.TimeoutExpired) else 'failed'
        report['setup_error'] = repr(error)
        report['classification'] = 'setup-or-containment-fault'
        print(str(error), file=sys.stderr)
    finally:
        report['exitcode'] = code
        path = os.environ.get('GENERATION_QUEUE_REPORT_PATH')
        if path:
            Path(path).write_text(json.dumps(report, indent=2) + '\n')
        print(json.dumps(report, sort_keys=True))
    return code


if __name__ == '__main__':
    raise SystemExit(main())
