#!/usr/bin/env python3
"""Exercise Engine's actual stop holdback with bounded decoded Unicode pieces.

Extract the production matcher, feed, holdback and final reconciliation into a
Foundation-only fixture. The adapters replace tokenization/generation and the
callback, not stop matching. No package build, MLX or model weights are used.
"""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parent.parent


def source_between(source, start, end):
    """Fail closed if an extraction boundary disappears or becomes ambiguous."""
    if source.count(start) != 1 or source.count(end) != 1:
        raise ValueError(f"production extraction markers must be unique: {start!r}, {end!r}")
    first = source.index(start)
    last = source.index(end)
    if last <= first:
        raise ValueError(f"production extraction markers out of order: {start!r}")
    return source[first:last]


def fixtures():
    cases = []

    def add(label, group, stops, pieces, expected=None, reasoning=False):
        row = dict(label=label, group=group, stops=stops, pieces=pieces,
                   reasoning=reasoning)
        if expected is not None:
            row["expected"] = expected
        cases.append(row)

    add("composed-stop-decomposed-pieces", "canonical", ["é"], ["e", "\u0301", "tail"], "")
    add("prefix-before-canonical-stop", "canonical", ["é"], ["safe ", "e", "\u0301", "tail"], "safe ")
    add("canonically-reordered-marks", "canonical", ["ṩ"], ["s", "\u0307", "\u0323", "tail"], "")
    add("repeated-combining-marks", "canonical", ["é\u0301"], ["e", "\u0301", "\u0301", "tail"], "")
    add("hangul-lv", "canonical", ["가"], ["\u1100", "\u1161", "tail"], "")
    add("hangul-lvt", "canonical", ["각"], ["\u1100", "\u1161", "\u11a8", "tail"], "")
    add("decomposed-stop-composed-piece", "canonical", ["e\u0301"], ["é", "tail"], "")
    add("canonical-singleton-angstrom", "canonical", ["Å"], ["A", "\u030a", "tail"], "")
    add("ascii-split", "ascii", ["STOP"], ["before ", "S", "T", "OP", "tail"], "before ")
    add("ascii-single-scalar", "ascii", ["!"], ["a", "!", "tail"], "a")
    add("earliest-of-multiple-stops", "ascii", ["LATE", "END"], ["x", "E", "ND then LATE", "tail"], "x")
    add("multiple-lengths-canonical-stop", "ascii", ["ZZZZ", "é"], ["x", "e", "\u0301", "tail"], "x")
    add("whole-piece-earliest-over-list-order", "ascii", ["LATE", "END"],
        ["xEND then LATE", "tail"], "x")
    add("variation-selector-split", "emoji", ["❤️"], ["x", "❤", "\ufe0f", "tail"], "x")
    add("emoji-zwj-split", "emoji", ["👩‍💻"], ["x", "👩", "\u200d", "💻", "tail"], "x")
    add("no-stops-combining", "no_stops", [], ["e", "\u0301", "!"], "e\u0301!")
    add("no-stops-emoji", "no_stops", [], ["❤", "\ufe0f", "!"], "❤️!")
    add("unfinished-ascii-stop", "unfinished", ["END"], ["x", "E", "N"], "xEN")
    add("unfinished-canonical-stop", "unfinished", ["é"], ["e"], "e")
    add("nonmatching-stop-preserves-decomposed-bytes", "unfinished", ["END"],
        ["e", "\u0301", "!"], "e\u0301!")
    add("long-nonmatching-combining-sequence", "unfinished", ["END"],
        ["e", "\u0301" * 32, "!"], "e" + "\u0301" * 32 + "!")
    add("reasoning-then-canonical-stop", "reasoning", ["é"],
        ["secret é", "</thi", "nk>", "answer e", "\u0301", "tail"],
        "secret é</think>answer ", reasoning=True)
    add("stop-ignored-in-open-reasoning", "reasoning", ["é"],
        ["secret e", "\u0301"], "secret e\u0301", reasoning=True)
    add("split-reasoning-tag-then-ascii-stop", "reasoning", ["STOP"],
        ["inside STOP", "</", "think>", "ok", "S", "TOP", "tail"],
        "inside STOP</think>ok", reasoning=True)
    # These controls inherit Foundation's actual whole-text search behavior;
    # do not silently impose literal, ignorable-character or compatibility rules.
    add("cgj-control", "matcher_controls", ["é"], ["e", "\u034f", "\u0301", "!"])
    add("zwj-control", "matcher_controls", ["é"], ["e", "\u200d", "\u0301", "!"])
    add("variation-selector-control", "matcher_controls", ["é"], ["e", "\ufe0f", "\u0301", "!"])
    add("compatibility-ligature-control", "matcher_controls", ["ﬁ"], ["f", "i", "!"])

    # All 104 partitions of these short scalar sequences. Cuts may lie inside
    # a grapheme cluster; Python iteration and Swift's feed both use scalars.
    families = [("accent", ["é"], "oke\u0301!"),
                ("reordered", ["ṩ"], "xs\u0307\u0323!"),
                ("repeated", ["é\u0301"], "xe\u0301\u0301!"),
                ("hangul", ["각"], "x\u1100\u1161\u11a8!"),
                ("decomposed-stop", ["e\u0301"], "oké!"),
                ("ascii", ["END"], "xEND!"),
                ("emoji", ["❤️"], "x❤️!"),
                ("no-stops", [], "xe\u0301!")]
    for name, stops, text in families:
        for mask in range(1 << (len(text) - 1)):
            pieces = []
            begin = 0
            for end in range(1, len(text)):
                if mask & (1 << (end - 1)):
                    pieces.append(text[begin:end])
                    begin = end
            pieces.append(text[begin:])
            add(f"partition-{name}-{mask}", "partitions", stops, pieces)
    return cases


def harness_source(source):
    helpers = source_between(source, "    package static func stopIndex(",
                             "    /// Serialized generation (single-flight;")
    holdback = source_between(source, "        let holdBack = stops.isEmpty\n",
                              "        var pendingIds: [Int] = []\n")
    feed = source_between(source, "        func feed(_ piece: String, final: Bool, tok: Int) -> Bool {\n",
                          "        /// Qwen's ByteLevel decoder is concatenative")
    final = source_between(source, "        if !stops.isEmpty, let from = Self.answerStart(text, reasoningOpen: reasoningOpen),\n",
                           "        stats.queueSeconds = queueSeconds\n        stats.preparationSeconds = preparationSeconds\n        stats.memoryPressureCancelled")
    return "import Foundation\nfinal class StopFixture {\n" + helpers + r'''
    struct Stats { var stopSequence: String?; var runtimeError: String? }
    struct Control { var failure: String? }
    static func truncated(_ input: String, _ stops: [String], _ reasoning: Bool) -> String {
        guard !stops.isEmpty, let from = answerStart(input, reasoningOpen: reasoning),
              let cut = stopIndex(input, stops, from: from) else { return input }
        return String(input[..<cut])
    }
    func run(_ row: [String: Any]) -> [String: Any] {
        let pieces = row["pieces"] as! [String]
        let stops = row["stops"] as! [String]
        let reasoningOpen = row["reasoning"] as! Bool
''' + holdback + r'''
        var withheld = ""
        var delivered = ""
        var stopFound = false
        var inReasoning = reasoningOpen
        var deltas: [String] = []
        var snapshots: [String] = []
        var lastTok = -1
        // The callback adapter records raw deltas. Cancellation and failures
        // are absent from this successful, stop-only fixture.
        let clientGone = false
        let control = Control()
        let onToken: ((Int, String) -> Bool)? = { _, _ in true }
        var stats = Stats()
        func emit(_ delta: String, _ tok: Int) -> Bool {
            if delta.isEmpty { return true }
            delivered += delta
            deltas.append(delta)
            return onToken?(tok, delta) ?? true
        }
''' + feed + r'''
        var consumed = ""
        var consumedPieces = 0
        for (tok, piece) in pieces.enumerated() {
            consumed += piece
            consumedPieces += 1
            lastTok = tok
            let keepGoing = feed(piece, final: false, tok: tok)
            snapshots.append(delivered)
            // Real generator stops when its callback returns false. Do not
            // include later fixture pieces in the one final decoded text.
            if !keepGoing { break }
        }
        var text = consumed
''' + final + r'''
        let expected = Self.truncated(consumed, stops, reasoningOpen)
        func scalars(_ value: String) -> [UInt32] { value.unicodeScalars.map { $0.value } }
        var report: [String: Any] = [
            "label": row["label"]!, "group": row["group"]!, "holdback": holdBack,
            "reasoning_open": reasoningOpen, "stops_bytes": stops.map { Array($0.utf8) },
            "pieces_bytes": pieces.map { Array($0.utf8) },
            "consumed_pieces": consumedPieces, "input_pieces": pieces.count,
            "consumed_scalars": scalars(consumed), "consumed_bytes": Array(consumed.utf8),
            "stop_found": stopFound,
            "final_scalars": scalars(text), "stream_scalars": scalars(delivered),
            "oracle_scalars": scalars(expected),
            "final_bytes": Array(text.utf8), "stream_bytes": Array(delivered.utf8),
            "oracle_bytes": Array(expected.utf8), "deltas": deltas.map(scalars),
            "deltas_bytes": deltas.map { Array($0.utf8) },
            "snapshots": snapshots.map(scalars), "snapshot_bytes": snapshots.map { Array($0.utf8) }]
        if let literal = row["expected"] as? String {
            report["literal_scalars"] = scalars(literal)
            report["literal_bytes"] = Array(literal.utf8)
        }
        return report
    }
}
let input = try Data(contentsOf: URL(fileURLWithPath: CommandLine.arguments[1]))
let cases = try JSONSerialization.jsonObject(with: input) as! [[String: Any]]
let reports = cases.map { StopFixture().run($0) }
print(String(decoding: try JSONSerialization.data(withJSONObject: reports, options: [.sortedKeys]), as: UTF8.self))
'''


class StopSequenceStream(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temporary = tempfile.TemporaryDirectory(prefix="slotstream-stop-stream-")
        cls.addClassCleanup(cls.temporary.cleanup)
        directory = Path(cls.temporary.name)
        source = (ROOT / "Sources/Slotstream/Engine.swift").read_text()
        swift = directory / "main.swift"
        swift.write_text(harness_source(source))
        fixture = directory / "cases.json"
        fixture.write_text(json.dumps(fixtures(), ensure_ascii=True))
        binary = directory / "stop-stream"
        compiler = os.environ.get("SWIFTC", "swiftc")
        if compiler != "swiftc" and not Path(compiler).is_absolute():
            raise ValueError("SWIFTC must be an absolute path (or unset for swiftc)")
        subprocess.run([compiler, "-package-name", "SlotstreamStopFixture", str(swift),
                        "-o", str(binary)], check=True, timeout=60)
        result = subprocess.run([str(binary), str(fixture)], check=True,
                                capture_output=True, text=True, timeout=15)
        report_path = os.environ.get("SLOTSTREAM_STOP_REPORT_PATH")
        if report_path:
            Path(report_path).write_text(result.stdout)
        cls.reports = json.loads(result.stdout)

    def check_group(self, group, count):
        reports = [row for row in self.reports if row["group"] == group]
        self.assertEqual(len(reports), count)
        for row in reports:
            with self.subTest(label=row["label"]):
                # Swift String equality is canonically equivalent. Compare raw
                # scalars AND UTF-8 bytes so normalization cannot hide a leak.
                self.assertEqual(row["final_scalars"], row["oracle_scalars"], row)
                if "literal_scalars" in row:
                    self.assertEqual(row["final_scalars"], row["literal_scalars"], row)
                    self.assertEqual(row["final_bytes"], row["literal_bytes"], row)
                self.assertEqual(row["stream_scalars"], row["final_scalars"], row)
                self.assertEqual(row["stream_bytes"], row["final_bytes"], row)
                self.assertEqual(row["final_bytes"], row["oracle_bytes"], row)
                self.assertEqual([scalar for delta in row["deltas"] for scalar in delta],
                                 row["stream_scalars"], row)
                # Even before final reconciliation, no delta may disclose the
                # prefix of a stop that completes in the consumed text. Pieces
                # after the callback returned false are outside this oracle.
                for snapshot in row["snapshots"]:
                    self.assertEqual(snapshot, row["oracle_scalars"][:len(snapshot)], row)
                if not row["stop_found"]:
                    self.assertEqual(row["consumed_pieces"], row["input_pieces"], row)

    def test_canonical_equivalent_stop_splits(self):
        self.check_group("canonical", 8)

    def test_ascii_and_earliest_stop(self):
        self.check_group("ascii", 5)

    def test_emoji_and_variation_selector_splits(self):
        self.check_group("emoji", 2)

    def test_no_stops_preserves_raw_output(self):
        self.check_group("no_stops", 2)

    def test_unfinished_or_nonmatching_stop_preserves_bytes(self):
        self.check_group("unfinished", 4)

    def test_reasoning_tag_and_ignored_reasoning_stops(self):
        self.check_group("reasoning", 3)

    def test_foundation_matcher_controls(self):
        self.check_group("matcher_controls", 4)

    def test_all_finite_scalar_piece_partitions(self):
        self.check_group("partitions", 104)


if __name__ == "__main__":
    unittest.main(verbosity=2)
