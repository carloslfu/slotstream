#!/usr/bin/env python3
"""Exercise Launch.request's actual body against tiny local HTTP responses."""
import json
import hashlib
from pathlib import Path
import re
import shlex
import signal
import subprocess
import tempfile
import threading
import time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import unittest

ROOT = Path(__file__).resolve().parent.parent


class Peer(BaseHTTPRequestHandler):
    def log_message(self, *args):
        pass

    def do_GET(self):
        if self.path == "/empty":
            self.send_response(204)
            self.end_headers()
            return
        if self.path == "/redirect":
            self.send_response(302)
            self.send_header("Location", "/fast")
            self.send_header("Content-Length", "0")
            self.end_headers()
            return
        if self.path == "/idle":
            time.sleep(2)
        body = b"response"
        self.send_response(200)
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        if self.path == "/truncated":
            self.wfile.write(body[:1])
            self.wfile.flush()
            self.close_connection = True
            return
        try:
            for byte in body:
                self.wfile.write(bytes([byte]))
                self.wfile.flush()
                if self.path == "/slow":
                    time.sleep(0.3)
        except (BrokenPipeError, ConnectionResetError):
            pass


class RequestDeadlines(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temporary = tempfile.TemporaryDirectory(prefix="slotstream-launch-request-")
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.directory = Path(cls.temporary.name)
        source = (ROOT / "Sources/slotstream-cli/LaunchCommand.swift").read_text()
        start = source.index("    static func request(")
        end = source.index("    static func compareVersions(", start)
        # The method body stays byte-identical to the production CLI. Neither
        # ArgumentParser nor a running model is needed for this HTTP boundary.
        method = source[start:end]
        harness = "import Foundation\nstruct Launch {\n" + method + "}\n" + r'''
let start = Date()
let answer = Launch.request("GET", CommandLine.arguments[1],
                            timeout: Double(CommandLine.arguments[2])!, direct: true)
var report: [String: Any] = ["elapsed": Date().timeIntervalSince(start),
                           "status": NSNull(), "body": ""]
if let answer {
    report["status"] = answer.status
    report["body"] = String(decoding: answer.body, as: UTF8.self)
}
let data = try JSONSerialization.data(withJSONObject: report, options: [.sortedKeys])
print(String(decoding: data, as: UTF8.self))
'''
        swift = cls.directory / "main.swift"
        swift.write_text(harness)
        cls.binary = cls.directory / "request"
        subprocess.run(["swiftc", str(swift), "-o", str(cls.binary)], check=True)
        cls.server = ThreadingHTTPServer(("127.0.0.1", 0), Peer)
        cls.server.daemon_threads = True
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()
        cls.addClassCleanup(cls.server.server_close)
        cls.addClassCleanup(cls.server.shutdown)

    def request(self, path):
        url = f"http://127.0.0.1:{self.server.server_port}{path}"
        result = subprocess.run([str(self.binary), url, "0.8"],
                                capture_output=True, text=True, check=True, timeout=6)
        return json.loads(result.stdout)

    def test_fast_response_remains_complete(self):
        answer = self.request("/fast")
        self.assertEqual((answer["status"], answer["body"]), (200, "response"))

    def test_redirect_remains_supported(self):
        answer = self.request("/redirect")
        self.assertEqual((answer["status"], answer["body"]), (200, "response"))

    def test_successful_empty_response_is_preserved(self):
        answer = self.request("/empty")
        self.assertEqual((answer["status"], answer["body"]), (204, ""))

    def test_incomplete_body_is_not_reported_as_success(self):
        answer = self.request("/truncated")
        self.assertIsNone(answer["status"], answer)

    def test_slow_progress_cannot_extend_the_total_deadline(self):
        answer = self.request("/slow")
        self.assertIsNone(answer["status"], answer)
        self.assertLess(answer["elapsed"], 1.8, answer)

    def test_idle_peer_returns_no_answer(self):
        answer = self.request("/idle")
        self.assertIsNone(answer["status"], answer)
        self.assertLess(answer["elapsed"], 1.8, answer)


class CodexVersion(unittest.TestCase):
    """Run the real version probe against only small owned executables."""

    @classmethod
    def setUpClass(cls):
        cls.temporary = tempfile.TemporaryDirectory(prefix="slotstream-codex-version-")
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.directory = Path(cls.temporary.name)
        cli = (ROOT / "Sources/slotstream-cli/LaunchCommand.swift").read_text()
        pure = (ROOT / "Sources/Slotstream/CodingToolLaunch.swift").read_text()

        def exact_region(source, start, end):
            if source.count(start) != 1 or source.count(end) != 1:
                raise ValueError("version-probe source boundary changed")
            begin = source.index(start)
            return source[begin:source.index(end, begin)]

        method = exact_region(cli, "    static func codexVersion(_ executable: String)",
                              "    /// The base instructions")
        failure = exact_region(pure, "    package struct Failure:", "    package enum Tool:")
        parser = exact_region(pure, "    package static func codexVersion(fromOutput text: String)",
                              "    /// Whether a downloaded or cached file")
        # The declarations stay verbatim apart from their package access
        # modifier; neither the parser nor process/error policy is copied.
        def local_access(source):
            return re.sub(r"(?m)^(\s*)package (?=(?:struct|static func|let|init|var)\b)",
                          r"\1", source)

        harness = ("import Foundation\nenum CodingToolLaunch {\n"
                   + local_access(failure) + local_access(parser)
                   + "}\nstruct Launch {\n" + method + "}\n" + r'''
var report: [String: Any]
do {
    let version = try Launch.codexVersion(CommandLine.arguments[1])
    report = ["accepted": true, "version": version]
} catch {
    report = ["accepted": false, "error": String(describing: error)]
}
let data = try JSONSerialization.data(withJSONObject: report, options: [.sortedKeys])
print(String(decoding: data, as: UTF8.self))
''')
        swift = cls.directory / "main.swift"
        swift.write_text(harness)
        cls.binary = cls.directory / "version-probe"
        command = ["swiftc", "-num-threads", "1", "-module-cache-path",
                   str(cls.directory / "module-cache"), str(swift), "-o", str(cls.binary)]
        try:
            subprocess.run(command, check=True, capture_output=True, text=True,
                           stdin=subprocess.DEVNULL, timeout=120)
        except subprocess.CalledProcessError as error:
            raise RuntimeError("isolated version-probe compilation failed:\n"
                               + error.stdout + error.stderr) from error
        cls.source_hashes = {
            "cli_method": hashlib.sha256(method.encode()).hexdigest(),
            "failure_declaration": hashlib.sha256(failure.encode()).hexdigest(),
            "version_parser": hashlib.sha256(parser.encode()).hexdigest(),
            "generated_harness": hashlib.sha256(harness.encode()).hexdigest(),
            "compiled_binary": hashlib.sha256(cls.binary.read_bytes()).hexdigest(),
        }
        cls.executables = cls.directory / "owned tools"
        cls.executables.mkdir()
        cls.fixture_index = 0
        cls.observations = []

    @classmethod
    def tearDownClass(cls):
        # Retained by the outer fixture's stdout receipt, including when
        # assertions fail; no additional persistent path is created here.
        print(json.dumps({"kind": "isolated-codex-version-probe",
                          "source_sha256": cls.source_hashes,
                          "observations": cls.observations}, sort_keys=True), flush=True)

    def executable(self, output, status=0, terminate=False):
        cls = type(self)
        cls.fixture_index += 1
        path = self.executables / ("codex-" + str(cls.fixture_index))
        source = ('#!/bin/sh\n'
                  'if [ "$#" -ne 1 ] || [ "$1" != "--version" ]; then exit 97; fi\n'
                  "printf '%s' " + shlex.quote(output) + "\n")
        if terminate:
            # Only this shell's own PID, never a process group or server.
            source += 'trap - TERM\nkill -TERM "$$"\nexit 99\n'
        else:
            source += "exit " + str(status) + "\n"
        path.write_text(source)
        path.chmod(0o755)
        return path

    def probe(self, executable, label):
        completed = subprocess.run([str(self.binary), str(executable)],
                                   capture_output=True, text=True, check=True,
                                   stdin=subprocess.DEVNULL, timeout=20)
        report = json.loads(completed.stdout)
        self.observations.append({"case": label, "result": report})
        return report

    def failed_probe(self, report):
        self.assertIs(report.get("accepted"), False, report)
        message = report.get("error")
        self.assertIsInstance(message, str, report)
        self.assertIn("codex", message.lower())
        self.assertIn("version", message.lower())
        return message

    def test_successful_versions_and_multiline_stdout_are_preserved(self):
        cases = [("release", "codex-cli 0.148.0\n", "0.148.0"),
                 ("prerelease", "codex-cli 0.149.0-alpha.3\n", "0.149.0-alpha.3"),
                 ("build", "codex 1.2.3-rc.1+build\n", "1.2.3-rc.1"),
                 ("multiline", "startup note\ncodex-cli 0.148.0\nfinished\n", "0.148.0")]
        for label, output, version in cases:
            with self.subTest(case=label):
                report = self.probe(self.executable(output), label)
                self.assertEqual(report, {"accepted": True, "version": version})

    def test_empty_and_malformed_success_output_remain_errors(self):
        for label, output in [("empty", ""), ("development", "codex-cli dev\n"),
                              ("malformed", "not a version\n")]:
            with self.subTest(case=label):
                self.failed_probe(self.probe(self.executable(output), label))

    def test_missing_executable_remains_an_error(self):
        missing = self.directory / "missing-codex"
        self.assertFalse(missing.exists())
        self.failed_probe(self.probe(missing, "missing-executable"))

    def test_nonzero_exit_cannot_certify_a_parseable_version(self):
        for status in (1, 23, 137):
            with self.subTest(status=status):
                report = self.probe(self.executable("codex-cli 0.148.0\n", status),
                                    "exit-" + str(status))
                message = self.failed_probe(report)
                self.assertRegex(message.lower(), r"exit|status")
                self.assertRegex(message, r"(?<!\d)" + str(status) + r"(?!\d)")

    def test_signal_termination_is_distinguished_from_the_same_exit_status(self):
        messages = {}
        cases = [("numeric-exit", self.executable("codex-cli 0.148.0\n", int(signal.SIGTERM))),
                 ("signal", self.executable("codex-cli 0.148.0\n", terminate=True))]
        for label, executable in cases:
            with self.subTest(termination=label):
                message = self.failed_probe(self.probe(executable, label))
                self.assertRegex(message, r"(?<!\d)" + str(int(signal.SIGTERM)) + r"(?!\d)")
                if label == "numeric-exit":
                    self.assertRegex(message.lower(), r"exit|status")
                else:
                    self.assertRegex(message.lower(), r"signal|abnormal|uncaught|not.{0,30}normal")
                messages[label] = message
        if len(messages) == 2:
            self.assertNotEqual(messages["numeric-exit"], messages["signal"])


if __name__ == "__main__":
    unittest.main(verbosity=2)
