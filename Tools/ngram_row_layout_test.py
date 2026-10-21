#!/usr/bin/env python3
"""Exercise the actual CPU n-gram reader with bounded, literal packed rows.

Only the checkpoint/handle file-read seam is substituted. RowReader, TensorRef,
BF16 conversion and ExactRead are extracted from the current production source.
No package build, MLX, model weights or GPU is involved.
"""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parent.parent


class NgramRowLayout(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temporary = tempfile.TemporaryDirectory(prefix="slotstream-ngram-layout-")
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.directory = Path(cls.temporary.name)
        ngram = (ROOT / "Sources/Slotstream/NgramStore.swift").read_text()
        checkpoint = (ROOT / "Sources/Slotstream/Checkpoint.swift").read_text()
        exact = (ROOT / "Sources/Slotstream/ExactRead.swift").read_text()
        reader_start = ngram.index("    private struct RowReader {")
        reader_end = ngram.index("    private func insert(", reader_start)
        bf16_start = ngram.index("@inline(__always) public func bf16Round(")
        bf16_end = ngram.index("public final class NgramStore {", bf16_start)
        ref_start = checkpoint.index("public struct TensorRef {")
        ref_end = checkpoint.index("/// Immutable descriptor", ref_start)
        harness = exact + "\n" + checkpoint[ref_start:ref_end] + "\n" + ngram[bf16_start:bf16_end] + r'''
public struct ModelError: Error, CustomStringConvertible {
    public let description: String
    public init(_ description: String) { self.description = description }
}

// Instrument only the read seam. Range checking and syscall completion use
// production ExactRead, and every successful read consumes real fixture bytes.
final class CheckpointIndex {
    var descriptorCalls = 0
    var handleCalls = 0
    var syscallCalls = 0
    func preadChecked(into dst: UnsafeMutableRawPointer, _ ref: TensorRef,
        offset: Int, count: Int, shouldContinue: () -> Bool) throws {
        descriptorCalls += 1
        try readFile(into: dst, ref, offset: offset, count: count, shouldContinue: shouldContinue)
    }
    func readFile(into dst: UnsafeMutableRawPointer, _ ref: TensorRef,
        offset: Int, count: Int, shouldContinue: () -> Bool) throws {
        let absolute = try ExactRead.tensorOffset(base: ref.byteOffset, length: ref.byteCount,
                                                  offset: offset, count: count)
        let descriptor = Foundation.open(ref.file.path, O_RDONLY)
        guard descriptor >= 0 else { throw CheckpointReadError.system(offset: absolute, code: errno) }
        defer { Foundation.close(descriptor) }
        try ExactRead.transfer(into: dst, offset: absolute, count: count,
                               shouldContinue: shouldContinue) { pointer, remaining, position in
            self.syscallCalls += 1
            let got = Foundation.pread(descriptor, pointer, remaining, off_t(position))
            return .init(count: got, error: got < 0 ? errno : 0)
        }
    }
}
struct TensorReadHandle {
    let owner: CheckpointIndex
    let ref: TensorRef
    func readChecked(into dst: UnsafeMutableRawPointer, offset: Int, count: Int,
                     shouldContinue: () -> Bool) throws {
        owner.handleCalls += 1
        try owner.readFile(into: dst, ref, offset: offset, count: count, shouldContinue: shouldContinue)
    }
}
''' + ngram[reader_start:reader_end] + r'''
let directory = URL(fileURLWithPath: CommandLine.arguments[1])
var reports: [[String: Any]] = []

struct Fixture {
    var weights: [TensorRef]
    var scales: [TensorRef]
    var biases: [TensorRef]
    var rowsPerShard = 2
    var headDim = 160
    var qGroup = 32
    var weightStride = 80
    var scaleStride = 10
    var byteCount = 0
}

func makeFixture(_ mutation: String) throws -> Fixture {
    let file = directory.appendingPathComponent("rows.bin")
    // Leading and trailing bytes ensure descriptors use their real offsets.
    var bytes = Data([0xA5, 0x5A, 0xA5, 0x5A])
    func append(_ dtype: String, _ shape: [Int], _ payload: [UInt8]) -> TensorRef {
        let ref = TensorRef(file: file, dtype: dtype, shape: shape,
                            byteOffset: bytes.count, byteCount: payload.count)
        bytes.append(contentsOf: payload)
        return ref
    }
    // Literal U32 words (each byte 0x11 means two nibbles of 1). The wide
    // later shard is [row0: 1 then 2, row1: 3 then 4], twenty words per half.
    func packed(_ width: Int, _ row: Int, wide: Bool) -> [UInt8] {
        if wide {
            let first: UInt8 = row == 0 ? 0x11 : 0x33
            let second: UInt8 = row == 0 ? 0x22 : 0x44
            return Array(repeating: first, count: width * 2)
                 + Array(repeating: second, count: width * 2)
        }
        let literal: UInt8 = row == 0 ? 0x55 : 0x66
        return Array(repeating: literal, count: width * 4)
    }
    var weights: [TensorRef] = []
    var scales: [TensorRef] = []
    var biases: [TensorRef] = []
    for shard in 0..<2 {
        let selected = shard == 1
        let wideWeight = (selected && mutation == "later-weight-width")
                      || (!selected && mutation == "first-weight-stride")
        let wideScale = (selected && mutation == "later-scale-width")
                     || (!selected && mutation == "first-scale-stride")
        let wideBias = selected && mutation == "later-bias-width"
        let weightWidth = wideWeight ? 40 : 20
        let scaleWidth = wideScale ? 10 : 5
        let biasWidth = wideBias ? 10 : 5
        let weightRows = selected && mutation == "weight-row-count" ? 3 : 2
        let scaleRows = selected && mutation == "scale-row-count" ? 3 : 2
        let biasRows = selected && mutation == "bias-row-count" ? 3 : 2
        let weightShape = selected && mutation == "weight-rank" ? [2, 20, 1] : [weightRows, weightWidth]
        let scaleShape = selected && mutation == "scale-rank" ? [2, 5, 1] : [scaleRows, scaleWidth]
        let biasShape = selected && mutation == "bias-rank" ? [2, 5, 1] : [biasRows, biasWidth]
        let weightType = selected && mutation == "weight-dtype" ? "F32" : "U32"
        let scaleType = selected && mutation == "scale-dtype" ? "F16" : "BF16"
        let biasType = selected && mutation == "bias-dtype" ? "U16" : "BF16"
        var w: [UInt8] = []
        for row in 0..<weightRows {
            w += packed(weightWidth, row, wide: selected && mutation == "later-weight-width")
        }
        // BF16 little-endian 1.0 = 0x3F80; bias 0.0 = 0x0000.
        let s = Array(repeating: [UInt8(0x80), UInt8(0x3F)], count: scaleRows * scaleWidth).flatMap { $0 }
        let b = Array(repeating: UInt8(0), count: biasRows * biasWidth * 2)
        weights.append(append(weightType, weightShape, w))
        scales.append(append(scaleType, scaleShape, s))
        biases.append(append(biasType, biasShape, b))
    }
    bytes.append(contentsOf: [0x5A, 0xA5, 0x5A, 0xA5])
    try bytes.write(to: file)
    var fixture = Fixture(weights: weights, scales: scales, biases: biases)
    fixture.byteCount = bytes.count
    // Real NgramStore initializes these shared strides from shard zero.
    fixture.weightStride = weights[0].rowBytes
    fixture.scaleStride = scales[0].rowBytes
    if mutation == "unequal-ref-counts" { fixture.scales.append(scales[0]) }
    // These malformed geometries are safe in the original reader. Zero rows,
    // zero qGroup and undersized payloads are excluded: they would trap before
    // yielding a useful original-source RED assertion.
    if mutation == "negative-rows" { fixture.rowsPerShard = -2 }
    if mutation == "zero-head-dim" { fixture.headDim = 0 }
    if mutation == "nonintegral-packed-dim" { fixture.headDim = 159 }
    if mutation == "negative-group" { fixture.qGroup = -192 }
    if mutation == "nonintegral-group" { fixture.qGroup = 33 }
    return fixture
}

func errorType(_ error: Error) -> String {
    if error is ModelError { return "ModelError" }
    if case CheckpointReadError.invalidRange = error { return "invalidRange" }
    return String(describing: type(of: error))
}

func check(_ label: String, _ fixture: Fixture, _ gid: Int64, route: String,
           expected: String, value: Float? = nil, probeFault: Bool = false) {
    let index = CheckpointIndex()
    let reader = RowReader(index: index, rowsPerShard: fixture.rowsPerShard,
        headDim: fixture.headDim, qGroup: fixture.qGroup, wRefs: fixture.weights,
        sRefs: fixture.scales, bRefs: fixture.biases, wRowBytes: fixture.weightStride,
        sRowBytes: fixture.scaleStride)
    let handles: [[TensorReadHandle]]? = route == "handle"
        ? [fixture.weights, fixture.scales, fixture.biases].map { refs in
            refs.map { TensorReadHandle(owner: index, ref: $0) }
          } : nil
    let fault: ReadFault? = probeFault ? ReadFault(afterJobs: 0) : nil
    var report: [String: Any] = ["label": label, "route": route, "gid": gid,
        "expected": expected, "fault_probe": probeFault,
        "source": "NgramStore.RowReader.read + TensorRef + BF16 + ExactRead",
        "fixture_bytes": fixture.byteCount]
    do {
        let row = try reader.read(gid, handles: handles, fault: fault)
        report["returned"] = row
        report["returned_count"] = row.count
        report["returned_first"] = row.first.map { $0 as Any } ?? NSNull()
        report["exact_control"] = value.map { target in
            row.count == 160 && row.allSatisfy { $0 == target }
        } ?? false
        report["error_type"] = "none"
    } catch {
        report["error_type"] = errorType(error)
        report["error"] = String(describing: error)
    }
    report["descriptor_calls"] = index.descriptorCalls
    report["handle_calls"] = index.handleCalls
    report["syscall_calls"] = index.syscallCalls
    report["fault_fired"] = fault?.hasFired ?? false
    reports.append(report)
}

let malformed = ["later-weight-width", "later-scale-width", "later-bias-width",
    "weight-dtype", "scale-dtype", "bias-dtype", "first-weight-stride", "first-scale-stride",
    "weight-rank", "scale-rank", "bias-rank", "weight-row-count", "scale-row-count",
    "bias-row-count", "unequal-ref-counts", "negative-rows", "zero-head-dim",
    "nonintegral-packed-dim", "negative-group", "nonintegral-group"]
for route in ["descriptor", "handle"] {
    let valid = try makeFixture("valid")
    check("valid-first-row", valid, 0, route: route, expected: "accept", value: 5)
    check("valid-second-row", valid, 1, route: route, expected: "accept", value: 6)
    check("valid-later-first-row", valid, 2, route: route, expected: "accept", value: 5)
    // Row 3 is the last physically padded row; a logical vocab cutoff must
    // not reject it while its selected descriptors retain rowsPerShard=2.
    check("valid-padded-end-row", valid, 3, route: route, expected: "accept", value: 6)
    check("invalid-negative-gid", valid, -1, route: route, expected: "invalidRange")
    check("invalid-end-gid", valid, 4, route: route, expected: "invalidRange")
    check("invalid-large-gid", valid, Int64.max, route: route, expected: "invalidRange")
    for label in malformed {
        let fixture = try makeFixture(label)
        // A valid selected shard1,row0 isolates the poisoned shared stride
        // inherited from shard zero. Its two-row payload covers the wider
        // original-source read without any out-of-bounds access.
        let gid: Int64 = label == "negative-rows" ? 0
            : (["first-weight-stride", "first-scale-stride"].contains(label) ? 2 : 3)
        check(label, fixture, gid, route: route, expected: "ModelError")
        check(label, fixture, gid, route: route, expected: "ModelError", probeFault: true)
    }
}
print(String(decoding: try JSONSerialization.data(withJSONObject: reports, options: [.sortedKeys]), as: UTF8.self))
'''
        swift = cls.directory / "main.swift"
        swift.write_text(harness)
        binary = cls.directory / "reader"
        compiler = os.environ.get("SWIFTC", "swiftc")
        if compiler != "swiftc" and not Path(compiler).is_absolute():
            raise ValueError("SWIFTC must be an absolute path (or unset for swiftc)")
        subprocess.run([compiler, "-package-name", "SlotstreamNgramFixture", str(swift),
                        "-o", str(binary)], check=True, timeout=60)
        result = subprocess.run([str(binary), str(cls.directory)], check=True,
                                capture_output=True, text=True, timeout=15)
        report_path = os.environ.get("SLOTSTREAM_NGRAM_REPORT_PATH")
        if report_path:
            Path(report_path).write_text(result.stdout)
        cls.reports = json.loads(result.stdout)

    def assert_no_reads(self, report):
        self.assertEqual([report[key] for key in
                          ("descriptor_calls", "handle_calls", "syscall_calls")], [0, 0, 0], report)

    def test_valid_rows_keep_exact_values_on_both_routes(self):
        reports = [r for r in self.reports if r["expected"] == "accept"]
        self.assertEqual(len(reports), 8)
        for report in reports:
            with self.subTest(label=report["label"], route=report["route"]):
                self.assertEqual(report["error_type"], "none", report)
                self.assertTrue(report["exact_control"], report)
                self.assertEqual(report["syscall_calls"], 3, report)
                self.assertEqual(report["descriptor_calls"], 3 if report["route"] == "descriptor" else 0, report)
                self.assertEqual(report["handle_calls"], 3 if report["route"] == "handle" else 0, report)
                self.assertFalse(report["fault_fired"], report)
                self.assertLessEqual(report["fixture_bytes"], 2048)

    def test_incompatible_layouts_are_refused_before_row_io(self):
        reports = [r for r in self.reports if r["expected"] == "ModelError" and not r["fault_probe"]]
        self.assertEqual(len(reports), 40)
        for report in reports:
            with self.subTest(label=report["label"], route=report["route"]):
                self.assertEqual(report["error_type"], "ModelError", report)
                self.assertIn("unsupported n-gram shard layout", report["error"].lower(), report)
                self.assert_no_reads(report)

    def test_incompatible_layouts_are_refused_before_fault_injection(self):
        reports = [r for r in self.reports if r["fault_probe"]]
        self.assertEqual(len(reports), 40)
        for report in reports:
            with self.subTest(label=report["label"], route=report["route"]):
                self.assertEqual(report["error_type"], "ModelError", report)
                self.assertFalse(report["fault_fired"], report)
                self.assert_no_reads(report)

    def test_invalid_ids_keep_invalid_range_and_zero_io(self):
        reports = [r for r in self.reports if r["expected"] == "invalidRange"]
        self.assertEqual(len(reports), 6)
        for report in reports:
            with self.subTest(label=report["label"], route=report["route"]):
                self.assertEqual(report["error_type"], "invalidRange", report)
                self.assert_no_reads(report)
                self.assertFalse(report["fault_fired"], report)


if __name__ == "__main__":
    unittest.main(verbosity=2)
