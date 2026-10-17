"""Exercise the real HTTP request reader with bounded local socket pairs.

Only the Request-through-parseHead source block is compiled, with Foundation
and Darwin. No Engine, MLX, listener, model, or live service is initialized.
SWIFTC/SDKROOT can select a qualified compiler and SDK for the invoking gate.
"""

import base64
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parent.parent
BASELINE_GROUPS = ("ascii", "header-bound", "framing", "body-limit", "closed")


def request(fields, body=b"", target=b"/api/chat", method=b"POST"):
    return method + b" " + target + b" HTTP/1.1\r\n" + b"\r\n".join(fields) + b"\r\n\r\n" + body


def case(name, wire, expected, kind="socket"):
    return {"name": name, "kind": kind, "wire": wire, "expected": expected}


def accepted(method="POST", path="/api/chat", body=b"", headers=None):
    value = {"outcome": "ok", "method": method, "path": path,
             "body_base64": base64.b64encode(body).decode("ascii")}
    if headers is not None:
        value["headers"] = {key: list(raw) for key, raw in headers.items()}
    return value


def refused(status, target="/api/chat"):
    return {"outcome": "fail", "status": status, "target": target}


def fixture_groups():
    binary_body = bytes(range(256)) * 320  # 80 KiB, not a model-sized body.
    groups = {"ascii": [
        case("ascii-get", request([b"Host: localhost"], target=b"/api/version", method=b"GET"),
             accepted("GET", "/api/version", headers={"host": b"localhost"})),
        case("ascii-json", request([b"Content-Length: 2", b"X-Value: token"], b"{}"),
             accepted(body=b"{}", headers={"content-length": b"2", "x-value": b"token"})),
        case("ascii-ows-leading-zero", request([b"cOnTeNt-LeNgTh:\t0005 \t"], b"hello"),
             accepted(body=b"hello", headers={"content-length": b"0005"})),
        case("binary-body-over-one-buffer", request([b"Content-Length: 81920"], binary_body),
             accepted(body=binary_body)),
    ]}
    prefix, ending = b"GET /v1/models HTTP/1.1\r\nX-Padding: ", b"\r\n\r\n"
    groups["header-bound"] = []
    for size in [65535, 65536, 65537]:
        wire = prefix + b"a" * (size - len(prefix) - len(ending)) + ending
        expected = accepted("GET", "/v1/models") if size <= 65536 else refused("431 Request Header Fields Too Large", "/v1/models")
        groups["header-bound"].append(case("header-bytes-" + str(size), wire, expected))
    groups["header-bound"].append(case("unterminated-over-bound", prefix + b"a" * (65537 - len(prefix)),
                                             refused("431 Request Header Fields Too Large", "/v1/models")))
    framing = [
        ("bad-length", [b"Content-Length: banana"], "400 Bad Request"),
        ("negative-length", [b"Content-Length: -2"], "400 Bad Request"),
        ("signed-length", [b"Content-Length: +2"], "400 Bad Request"),
        ("length-list", [b"Content-Length: 2, 2"], "400 Bad Request"),
        ("length-overflow", [b"Content-Length: 999999999999999999999999999"], "400 Bad Request"),
        ("non-ascii-length", [b"Content-Length: \xef\xbc\x92"], "400 Bad Request"),
        ("duplicate-same-length", [b"Content-Length: 2", b"content-length: 2"], "400 Bad Request"),
        ("duplicate-different-length", [b"Content-Length: 2", b"content-length: 3"], "400 Bad Request"),
        ("duplicate-transfer", [b"Transfer-Encoding: chunked", b"transfer-encoding: identity"], "400 Bad Request"),
        ("transfer-then-length", [b"Transfer-Encoding: chunked", b"Content-Length: 2"], "400 Bad Request"),
        ("length-then-transfer", [b"Content-Length: 2", b"Transfer-Encoding: chunked"], "400 Bad Request"),
        ("chunked", [b"Transfer-Encoding: chunked"], "411 Length Required"),
        ("unsupported-transfer", [b"Transfer-Encoding: gzip"], "400 Bad Request"),
    ]
    groups["framing"] = [case(name, request(fields, b"hi"), refused(status))
                         for name, fields, status in framing]
    groups["body-limit"] = [
        case("exact-declared-limit-no-allocation", b"POST /api/chat HTTP/1.1\r\nContent-Length: 33554432",
             {"outcome": "ok", "content_length": 33554432}, "parse"),
        case("above-declared-limit-no-allocation", b"POST /api/chat HTTP/1.1\r\nContent-Length: 33554433",
             {"outcome": "fail", "status": "413 Content Too Large"}, "parse"),
        case("oversized-ows-upload-eof", request([b"Content-Length:\t33554433 \t"], b"tiny"),
             refused("413 Content Too Large")),
    ]
    groups["closed"] = [
        case("empty-peer", b"", {"outcome": "closed"}),
        case("partial-body-eof", request([b"Content-Length: 5"], b"hi"), {"outcome": "closed"}),
        case("partial-head-eof", b"GET /api/version HTTP/1.1\r\nX: value", {"outcome": "closed"}),
    ]
    groups["obs-text"] = []
    opaque_values = [b"\xff", bytes(range(128, 256)), b"\xa0\xff\xa0", b"\x85"]
    for i, value in enumerate(opaque_values):
        fields = [b"Host: localhost", b"Content-Length: 2", b"X-Opaque: " + value]
        groups["obs-text"].append(case("opaque-" + str(i), request(fields, b"{}"),
            accepted(body=b"{}", headers={"host": b"localhost", "content-length": b"2", "x-opaque": value})))
    groups["utf8-octets"] = []
    for i, value in enumerate([b"\xc3\xa9", b"\xc2\xa0", b"\xf0\x9f\x99\x82", b"a\xc3\xa9b"]):
        groups["utf8-octets"].append(case("utf8-octets-" + str(i),
            request([b"Content-Length: 2", b"X-Opaque: " + value], b"{}"),
            accepted(body=b"{}", headers={"x-opaque": value})))
    obs_framing = [
        ("opaque-bad-length", [b"Content-Length: banana"], "400 Bad Request"),
        ("opaque-duplicate-length", [b"Content-Length: 2", b"content-length: 3"], "400 Bad Request"),
        ("opaque-duplicate-transfer", [b"Transfer-Encoding: chunked", b"Transfer-Encoding: identity"], "400 Bad Request"),
        ("opaque-transfer-and-length", [b"Transfer-Encoding: chunked", b"Content-Length: 2"], "400 Bad Request"),
        ("opaque-chunked", [b"Transfer-Encoding: chunked"], "411 Length Required"),
        ("opaque-unsupported-transfer", [b"Transfer-Encoding: gzip"], "400 Bad Request"),
        ("opaque-oversized-body", [b"Content-Length: 33554433"], "413 Content Too Large"),
        ("nbsp-before-length", [b"Content-Length: \xa01"], "400 Bad Request"),
        ("nbsp-after-length", [b"Content-Length: 1\xa0"], "400 Bad Request"),
    ]
    groups["obs-framing"] = [case(name, request(fields + [b"X-Opaque: \xff"], b"hi"), refused(status))
                             for name, fields, status in obs_framing]
    return groups


SWIFT_ENVELOPE = r'''
struct FixtureFailure: Error, CustomStringConvertible {
    let description: String
    init(_ message: String) { description = message }
}

func readWire(_ wire: Data) throws -> (Server.ReadOutcome, [String: Any]) {
    var pair: [Int32] = [-1, -1]
    guard socketpair(AF_UNIX, SOCK_STREAM, 0, &pair) == 0 else { throw FixtureFailure("socketpair failed") }
    defer { for fd in pair where fd >= 0 { close(fd) } }
    var capacity: Int32 = 256 << 10
    let optionSize = socklen_t(MemoryLayout<Int32>.size)
    guard setsockopt(pair[0], SOL_SOCKET, SO_SNDBUF, &capacity, optionSize) == 0,
          setsockopt(pair[1], SOL_SOCKET, SO_RCVBUF, &capacity, optionSize) == 0 else {
        throw FixtureFailure("cannot size bounded socket buffers")
    }
    var actualCapacity: Int32 = 0
    var capacitySize = optionSize
    guard getsockopt(pair[0], SOL_SOCKET, SO_SNDBUF, &actualCapacity, &capacitySize) == 0,
          actualCapacity > 0, wire.count <= Int(actualCapacity) / 2 else {
        throw FixtureFailure("socket send buffer cannot safely prequeue this bounded fixture")
    }
    var timeout = timeval(tv_sec: 2, tv_usec: 0)
    var one: Int32 = 1
    guard setsockopt(pair[0], SOL_SOCKET, SO_SNDTIMEO, &timeout, socklen_t(MemoryLayout<timeval>.size)) == 0,
          setsockopt(pair[1], SOL_SOCKET, SO_RCVTIMEO, &timeout, socklen_t(MemoryLayout<timeval>.size)) == 0,
          setsockopt(pair[0], SOL_SOCKET, SO_NOSIGPIPE, &one, optionSize) == 0 else {
        throw FixtureFailure("cannot set bounded socket deadlines or per-fd SIGPIPE protection")
    }
    let end = Date().addingTimeInterval(2)
    try wire.withUnsafeBytes { bytes in
        var sent = 0
        while sent < bytes.count {
            guard Date() < end else { throw FixtureFailure("prequeue total deadline exceeded") }
            let n = write(pair[0], bytes.baseAddress!.advanced(by: sent), min(16384, bytes.count - sent))
            if n < 0 && errno == EINTR { continue }
            guard n > 0 else { throw FixtureFailure("cannot prequeue bounded request") }
            sent += n
        }
    }
    guard shutdown(pair[0], SHUT_WR) == 0 else { throw FixtureFailure("cannot finish owned writer") }
    let outcome = Server.readRequest(pair[1])
    let writerClose = close(pair[0]); pair[0] = -1
    let readerClose = close(pair[1]); pair[1] = -1
    guard writerClose == 0, readerClose == 0 else { throw FixtureFailure("owned socket close failed") }
    return (outcome, ["prequeued": true, "queued_bytes": wire.count, "socket_pairs_closed": 1,
                      "send_buffer_bytes": actualCapacity])
}

func requestFields(_ request: Server.Request) -> [String: Any] {
    var prefixes: [String: [UInt32]] = [:]
    var counts: [String: Int] = [:]
    for (name, value) in request.headers {
        prefixes[name] = value.unicodeScalars.prefix(512).map { $0.value }
        counts[name] = value.unicodeScalars.count
    }
    return ["outcome": "ok", "method": request.method, "path": request.path,
            "body_base64": request.body.base64EncodedString(),
            "header_scalar_prefixes": prefixes, "header_scalar_counts": counts]
}

do {
    let input = FileHandle.standardInput.readDataToEndOfFile()
    guard input.count <= (2 << 20),
          let cases = try JSONSerialization.jsonObject(with: input) as? [[String: Any]],
          cases.count <= 64 else { throw FixtureFailure("invalid bounded input list") }
    var rows: [[String: Any]] = []
    for item in cases {
        guard let name = item["name"] as? String, let group = item["group"] as? String,
              let kind = item["kind"] as? String, let encoded = item["wire_base64"] as? String,
              let wire = Data(base64Encoded: encoded), wire.count <= (128 << 10) else {
            throw FixtureFailure("invalid bounded case")
        }
        var row: [String: Any] = ["name": name, "group": group, "kind": kind, "wire_bytes": wire.count]
        if kind == "parse" {
            guard let head = String(data: wire, encoding: .utf8) else { throw FixtureFailure("parse-only control is not UTF-8") }
            switch Server.parseHead(head) {
            case let .ok(request, length):
                row.merge(requestFields(request)) { _, rhs in rhs }
                row["content_length"] = length
            case let .fail(status, message):
                row.merge(["outcome": "fail", "status": status, "message": message]) { _, rhs in rhs }
            }
        } else if kind == "socket" {
            let (outcome, sockets) = try readWire(wire)
            row["sockets"] = sockets
            switch outcome {
            case let .ok(request): row.merge(requestFields(request)) { _, rhs in rhs }
            case .closed: row["outcome"] = "closed"
            case let .fail(status, message, target):
                row.merge(["outcome": "fail", "status": status, "message": message,
                           "target": target.map { $0 as Any } ?? NSNull()]) { _, rhs in rhs }
            }
        } else { throw FixtureFailure("unknown case kind") }
        rows.append(row)
    }
    FileHandle.standardOutput.write(try JSONSerialization.data(withJSONObject: rows, options: [.sortedKeys]))
} catch {
    fputs("HTTP request fixture setup failure: \(error)\n", stderr)
    exit(1)
}
'''


class HTTPRequestOctetsTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        source = (ROOT / "Sources/Slotstream/Server.swift").read_bytes()
        start = b"    package struct Request {\n"
        end = b"    /// The path a request routes on:"
        if source.count(start) != 1 or source.count(end) != 1:
            raise RuntimeError("request source markers changed; update the mechanical fixture")
        block_start = source.index(start)
        block_end = source.index(end, block_start)
        block = source[block_start:block_end]
        cls.temp = tempfile.TemporaryDirectory(prefix="slotstream-http-request-", dir=os.environ.get("TMPDIR") or "/tmp")
        cls.addClassCleanup(cls.temp.cleanup)
        folder = Path(cls.temp.name)
        swift = folder / "main.swift"
        generated = b"import Foundation\nimport Darwin\npublic final class Server {\n" + block + b"}\n" + SWIFT_ENVELOPE.encode("utf-8")
        swift.write_bytes(generated)
        compiler = os.environ.get("SWIFTC") or shutil.which("swiftc")
        if not compiler:
            raise RuntimeError("a qualified Swift compiler is required for the request fixture")
        executable = folder / "request-reader"
        command = [compiler, "-package-name", "HTTPRequestOctetsFixture", "-module-cache-path", str(folder / "modules")]
        if os.environ.get("SDKROOT"):
            command.extend(["-sdk", os.environ["SDKROOT"]])
        command.extend([str(swift), "-o", str(executable)])
        environment = dict(os.environ, TMPDIR=str(folder))
        built = subprocess.run(command, env=environment, capture_output=True, timeout=60)
        if built.returncode:
            raise RuntimeError("Swift fixture compilation failed:\n" + built.stdout.decode(errors="replace") + built.stderr.decode(errors="replace"))
        mode = os.environ.get("SLOTSTREAM_HTTP_OCTETS_MODE", "all")
        if mode not in ("baseline", "all"):
            raise RuntimeError("SLOTSTREAM_HTTP_OCTETS_MODE must be baseline or all")
        cls.cases = fixture_groups()
        selected = list(BASELINE_GROUPS) if mode == "baseline" else list(cls.cases)
        inputs = []
        for group in selected:
            for item in cls.cases[group]:
                inputs.append({"group": group, "name": item["name"], "kind": item["kind"],
                               "wire_base64": base64.b64encode(item["wire"]).decode("ascii")})
        stdin = json.dumps(inputs, separators=(",", ":")).encode("ascii")
        run = subprocess.run([str(executable)], input=stdin, env=environment, capture_output=True, timeout=10)
        if run.returncode:
            raise RuntimeError("Swift fixture setup/read failed:\n" + run.stdout.decode(errors="replace") + run.stderr.decode(errors="replace"))
        cls.rows = json.loads(run.stdout)
        receipt = os.environ.get("SLOTSTREAM_HTTP_OCTETS_TEST_RECEIPT")
        if receipt:
            observations = {
                "mode": mode, "groups": selected,
                "source_sha256": hashlib.sha256(source).hexdigest(),
                "extracted_source_sha256": hashlib.sha256(block).hexdigest(),
                "generated_swift_sha256": hashlib.sha256(generated).hexdigest(),
                "generated_swift_base64": base64.b64encode(generated).decode("ascii"),
                "executable_sha256": hashlib.sha256(executable.read_bytes()).hexdigest(),
                "compile_argv": command, "compile_returncode": built.returncode,
                "compile_stdout_base64": base64.b64encode(built.stdout).decode("ascii"),
                "compile_stderr_base64": base64.b64encode(built.stderr).decode("ascii"),
                "run_argv": [str(executable)], "run_returncode": run.returncode,
                "run_stdin_sha256": hashlib.sha256(stdin).hexdigest(), "run_stdin_bytes": len(stdin),
                "run_stdout_base64": base64.b64encode(run.stdout).decode("ascii"),
                "run_stderr_base64": base64.b64encode(run.stderr).decode("ascii"),
                "inputs": [{"group": group, "name": item["name"], "kind": item["kind"],
                            "wire_bytes": len(item["wire"]), "wire_sha256": hashlib.sha256(item["wire"]).hexdigest()}
                           for group in selected for item in cls.cases[group]],
                "rows": cls.rows,
                "limits": {"prequeued_not_a_fragmentation_claim": True, "complete_router_model_test": False},
            }
            # Written before assertions, including when the original source is RED.
            with open(receipt, "x") as stream:
                json.dump(observations, stream, indent=2)
                stream.write("\n")

    def assert_group(self, group):
        expected_cases = self.cases[group]
        rows = [row for row in self.rows if row["group"] == group]
        self.assertEqual([row["name"] for row in rows], [item["name"] for item in expected_cases], "fixture group missing or reordered")
        for row, item in zip(rows, expected_cases):
            with self.subTest(case=item["name"]):
                expected = item["expected"]
                got = {key: row.get(key) for key in expected if key != "headers"}
                if "headers" in expected:
                    got["headers"] = {key: row.get("header_scalar_prefixes", {}).get(key) for key in expected["headers"]}
                self.assertEqual(got, expected)

    def test_ascii_requests_and_binary_body(self):
        self.assert_group("ascii")

    def test_header_byte_boundaries(self):
        self.assert_group("header-bound")

    def test_ascii_framing_refusals(self):
        self.assert_group("framing")

    def test_declared_body_limit_and_ows(self):
        self.assert_group("body-limit")

    def test_incomplete_body_is_closed(self):
        self.assert_group("closed")

    def test_obs_text_preserves_request_and_value_octets(self):
        self.assert_group("obs-text")

    def test_valid_utf8_sequences_are_opaque_octets(self):
        self.assert_group("utf8-octets")

    def test_obs_text_does_not_hide_framing_refusals(self):
        self.assert_group("obs-framing")


if __name__ == "__main__":
    unittest.main()
