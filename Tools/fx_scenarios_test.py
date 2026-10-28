"""Check the real fx wire decoder with finite in-memory socket responses.

The live script has top-level scenarios. Load its exact definition prefix at
the catalogue marker, never the scenario matrix or its disconnect exercise.
No model, server, fx client, real network or subprocess is used here.
"""
if not __debug__:
    raise SystemExit("optimized Python is forbidden for fx stream fixture tests")

import ast
import contextlib
import io
import json
import os
from pathlib import Path
import socket
import subprocess
import sys
import time
import unittest
from unittest import mock
import urllib.request


SCRIPT = Path(__file__).with_name("fx_scenarios.py")
MARKER = "# --- catalogue -------------------------------------------------------------\n"
PORT = 12345
MAX_WIRE = 16384
FUNCTIONS = {"ok", "bad", "request", "dechunk", "events", "post", "get", "expect_400", "stream"}


def load_definitions():
    """Execute the unchanged source prefix; a moved/ambiguous boundary fails shut."""
    raw = SCRIPT.read_bytes()
    if len(raw) > 131072:
        raise ValueError("fx scenario source exceeds the fixture bound")
    text = raw.decode("utf-8")
    if text.count(MARKER) != 1:
        raise ValueError("fx catalogue boundary must be unique")
    prefix = text.split(MARKER, 1)[0]
    tree = ast.parse(prefix, filename=str(SCRIPT))
    functions = set()
    assignments = set()
    for node in tree.body:
        if isinstance(node, ast.Expr) and isinstance(node.value, ast.Constant) and isinstance(node.value.value, str):
            continue
        if isinstance(node, ast.Import):
            if any(item.name not in {"json", "socket", "sys", "time"} or item.asname for item in node.names):
                raise ValueError("unexpected import in fx definition prefix")
        elif isinstance(node, ast.FunctionDef):
            if node.decorator_list:
                raise ValueError("fx fixture does not execute decorators")
            functions.add(node.name)
        elif isinstance(node, ast.Assign):
            if any(not isinstance(target, ast.Name) for target in node.targets):
                raise ValueError("unexpected assignment in fx definition prefix")
            assignments.update(target.id for target in node.targets)
            if not any(target.id in {"PORT", "QUICK"} for target in node.targets):
                ast.literal_eval(node.value)
        else:
            raise ValueError("unexpected executable statement before fx catalogue")
    if functions != FUNCTIONS or assignments != {"PORT", "QUICK", "HEADERS", "TOOLS", "USER", "passed", "failed"}:
        raise ValueError("fx definition prefix no longer has the reviewed boundary")
    namespace = {"__name__": "fx_scenarios_fixture", "__file__": str(SCRIPT)}
    with mock.patch.object(sys, "argv", [str(SCRIPT), str(PORT), "--quick"]):
        exec(compile(prefix, str(SCRIPT), "exec"), namespace)
    return namespace


class FiniteSocket:
    def __init__(self, wire, read_size):
        if not isinstance(wire, bytes) or len(wire) > MAX_WIRE or read_size < 1:
            raise ValueError("fixture wire must be tiny bytes with finite reads")
        self.remaining = wire
        self.read_size = read_size
        self.reads_left = len(wire) + 1
        self.sent = bytearray()
        self.closed = False

    def settimeout(self, timeout):
        if not 0 < timeout <= 1800:
            raise ValueError("unexpected fixture timeout")

    def sendall(self, raw):
        if self.closed or not isinstance(raw, bytes) or len(self.sent) + len(raw) > MAX_WIRE:
            raise ValueError("unbounded or invalid fixture send")
        self.sent.extend(raw)

    def recv(self, maximum):
        if self.closed or not 0 < maximum <= 65536 or self.reads_left <= 0:
            raise ValueError("fixture receive exceeded its finite budget")
        self.reads_left -= 1
        size = min(maximum, self.read_size)
        result, self.remaining = self.remaining[:size], self.remaining[size:]
        return result

    def close(self):
        self.closed = True


def chunked(parts, status="200 OK", *, uppercase=False, trailers=b"", whitespace=False):
    """Build a tiny RFC byte-counted envelope; expected payload is supplied separately."""
    head = ("HTTP/1.1 " + status + "\r\nTransfer-Encoding: chunked\r\n"
            "Content-Type: text/event-stream\r\nConnection: close\r\n\r\n").encode("ascii")
    body = bytearray()
    for part in parts:
        if not isinstance(part, bytes) or not part:
            raise ValueError("fixture data chunks must be nonempty bytes")
        length = format(len(part), "X" if uppercase else "x").encode("ascii")
        if whitespace:
            length = b" " + length + b" "
        body.extend(length + b"\r\n" + part + b"\r\n")
    return head + bytes(body) + b"0\r\n" + trailers + b"\r\n"


def plain(payload, status="200 OK"):
    return (("HTTP/1.1 " + status + "\r\nContent-Type: application/json\r\nContent-Length: "
             + str(len(payload)) + "\r\nConnection: close\r\n\r\n").encode("ascii") + payload)


def frame(value):
    return ("data: " + json.dumps(value, ensure_ascii=False, separators=(",", ":")) + "\n\n").encode("utf-8")


def stream_rows(text):
    return [
        {"type": "stream-start", "warnings": []},
        {"type": "text-start", "id": "t0"},
        {"type": "text-delta", "id": "t0", "delta": text},
        {"type": "text-end", "id": "t0"},
        {"type": "finish", "finishReason": {"unified": "stop", "raw": "stop"},
         "usage": {"inputTokens": {"total": 4, "noCache": 4, "cacheRead": 0, "cacheWrite": 0},
                   "outputTokens": {"total": 2, "text": 2, "reasoning": 0}}},
    ]


class FXStreamBytes(unittest.TestCase):
    def setUp(self):
        self.stack = contextlib.ExitStack()
        self.addCleanup(self.stack.close)
        self.violations = []

        def forbidden(*args, **kwargs):
            self.violations.append("external boundary")
            raise AssertionError("fx fixture attempted real network/process/sleep")

        for module, names in [(socket, ["socket", "create_connection", "getaddrinfo", "gethostbyname",
                                       "gethostbyname_ex", "gethostbyaddr"]),
                              (subprocess, ["Popen", "run"]), (os, ["system", "fork", "posix_spawn"]),
                              (urllib.request, ["urlopen"]), (time, ["sleep"])]:
            for name in names:
                if hasattr(module, name):
                    self.stack.enter_context(mock.patch.object(module, name, side_effect=forbidden))
        self.ns = load_definitions()
        self.sockets = []
        self.addCleanup(self.check_isolation)

    def check_isolation(self):
        self.assertEqual(self.violations, [])
        self.assertTrue(all(sock.closed for sock in self.sockets), "real request must close its fixture socket")

    def call(self, name, wire, *args, read_size=65536, **kwargs):
        sock = FiniteSocket(wire, read_size)
        self.sockets.append(sock)
        connected = []

        def connect(address, timeout):
            if connected or address != ("127.0.0.1", PORT) or not 0 < timeout <= 1800:
                raise AssertionError("unexpected or repeated fixture connection")
            connected.append(address)
            return sock

        output = io.StringIO()
        with mock.patch.object(socket, "create_connection", side_effect=connect), contextlib.redirect_stdout(output):
            value = self.ns[name](*args, **kwargs)
        self.assertEqual(len(connected), 1)
        self.assertEqual(sock.remaining, b"", "real request must read through fixture EOF")
        return value, bytes(sock.sent), output.getvalue()

    def test_ascii_chunked_post_preserves_events_and_done(self):
        rows = stream_rows("OK")
        parts = [frame(row) for row in rows] + [b"data: [DONE]\n\n"]
        (status, payload, seconds), sent, _ = self.call("post", chunked(parts), {"prompt": self.ns["USER"]})
        self.assertEqual(status, "HTTP/1.1 200 OK")
        self.assertEqual(payload, b"".join(parts).decode("utf-8"))
        self.assertEqual(self.ns["events"](payload), rows)
        self.assertTrue(payload.rstrip().endswith("[DONE]"))
        self.assertGreaterEqual(seconds, 0)
        self.assertTrue(sent.startswith(b"POST /v3/ai/language-model HTTP/1.1\r\n"))

    def test_ascii_stream_preserves_tool_reasoning_and_finish_checks(self):
        rows = stream_rows("OK")
        rows[1:1] = [{"type": "reasoning-start", "id": "r0"},
                     {"type": "reasoning-delta", "id": "r0", "delta": "check"},
                     {"type": "reasoning-end", "id": "r0"}]
        rows[-1:-1] = [{"type": "tool-input-delta", "id": "c0", "delta": '{"path":"a"}'},
                       {"type": "tool-call", "toolCallId": "c0", "toolName": "read_file", "input": '{"path":"a"}'}]
        rows[-1]["finishReason"] = {"unified": "tool-calls", "raw": "tool_calls"}
        value, _, output = self.call("stream", chunked([frame(row) for row in rows] + [b"data: [DONE]\n\n"]),
                                     "ASCII tool stream", {"prompt": self.ns["USER"]},
                                     want_finish="tool-calls", want_tool=True, want_reasoning=True, read_size=7)
        self.assertEqual(value, rows)
        self.assertEqual((self.ns["passed"], self.ns["failed"]), (1, 0))
        self.assertIn("PASS  ASCII tool stream", output)

    def test_nonchunked_get_preserves_catalogue_unicode(self):
        payload = '{"data":[{"id":"模型-🚀"}]}'.encode("utf-8")
        (status, body), sent, _ = self.call("get", plain(payload), "/coding-agent/v1/models", read_size=1)
        self.assertEqual(status, "HTTP/1.1 200 OK")
        self.assertEqual(body, payload.decode("utf-8"))
        self.assertEqual(json.loads(body), {"data": [{"id": "模型-🚀"}]})
        self.assertTrue(sent.startswith(b"GET /coding-agent/v1/models HTTP/1.1\r\n"))
        self.assertNotIn(b"Content-Length:", sent)

    def test_ascii_http_errors_keep_typed_json(self):
        payload = b'{"error":{"code":"unsupported_field"}}'
        for wire in [plain(payload, "400 Bad Request"), chunked([payload], "400 Bad Request")]:
            with self.subTest(chunked=b"Transfer-Encoding" in wire):
                value, _, output = self.call("expect_400", wire, "typed refusal", {"prompt": self.ns["USER"]}, "unsupported_field")
                self.assertIsNone(value)
                self.assertIn("PASS  typed refusal", output)
        self.assertEqual((self.ns["passed"], self.ns["failed"]), (2, 0))

    def test_chunk_size_hex_whitespace_and_trailer_controls(self):
        payload = b"data: [DONE]\n\n"
        for options in [{"uppercase": True}, {"whitespace": True}, {"trailers": b"X-Fixture: ok\r\n"}]:
            with self.subTest(options=options):
                (status, body, _), _, _ = self.call("post", chunked([payload], **options), {"prompt": self.ns["USER"]})
                self.assertEqual(status, "HTTP/1.1 200 OK")
                self.assertEqual(body, "data: [DONE]\n\n")

    def test_request_sends_utf8_body_length_and_explicit_headers(self):
        body = '{"prompt":"你好"}'
        (raw, _), sent, _ = self.call("request", plain(b"{}"), "POST", "/fixture", body,
                                     headers={"X-Fixture": "present"}, timeout=3)
        head, payload = self.ns["dechunk"](raw)
        self.assertEqual(payload, "{}")
        self.assertTrue(head.startswith("HTTP/1.1 200 OK"))
        request_head, _, request_body = sent.partition(b"\r\n\r\n")
        self.assertEqual(request_body, b'{"prompt":"\xe4\xbd\xa0\xe5\xa5\xbd"}')
        self.assertIn(b"Content-Length: 19\r\n", request_head + b"\r\n")
        self.assertIn(b"X-Fixture: present\r\n", request_head + b"\r\n")
        self.assertNotIn(b"authorization:", request_head)

    def test_stream_keeps_existing_rejection_controls(self):
        rows = stream_rows("OK")
        complete = [frame(row) for row in rows] + [b"data: [DONE]\n\n"]
        cases = [
            (chunked(complete[:-1]), {}, "stream did not end with [DONE]"),
            (plain(b'{"error":"refused"}', "503 Service Unavailable"), {}, "status HTTP/1.1 503"),
            (chunked(complete), {"want_finish": "length"}, "finish stop, want length"),
            (chunked(complete), {"want_tool": True}, "no tool call"),
            (chunked(complete), {"want_reasoning": True}, "no reasoning"),
        ]
        for index, (wire, options, message) in enumerate(cases, 1):
            with self.subTest(message=message):
                value, _, output = self.call("stream", wire, "expected refusal", {"prompt": self.ns["USER"]}, **options)
                self.assertIsNone(value)
                self.assertIn(message, output)
                self.assertEqual((self.ns["passed"], self.ns["failed"]), (0, index))

    def test_unicode_post_keeps_later_frames_and_done(self):
        for text in ["é", "你好", "🚀", "e\u0301"]:
            with self.subTest(text=text):
                rows = stream_rows(text)
                parts = [frame(row) for row in rows] + [b"data: [DONE]\n\n"]
                (status, body, _), _, _ = self.call("post", chunked(parts), {"prompt": self.ns["USER"]})
                self.assertEqual(status, "HTTP/1.1 200 OK")
                self.assertEqual(body, b"".join(parts).decode("utf-8"))
                self.assertEqual(self.ns["events"](body), rows)

    def test_unicode_stream_accepts_text_before_finish_and_done(self):
        rows = stream_rows("你好，café 🚀 e\u0301")
        wire = chunked([frame(row) for row in rows] + [b"data: [DONE]\n\n"])
        value, _, output = self.call("stream", wire, "Unicode stream", {"prompt": self.ns["USER"]}, want_finish="stop", read_size=1)
        self.assertEqual(value, rows, output)
        self.assertEqual((self.ns["passed"], self.ns["failed"]), (1, 0))

    def test_utf8_scalar_split_between_http_chunks_is_decoded_after_join(self):
        rows = stream_rows("🚀")
        encoded = frame(rows[2])
        offset = encoded.index(b"\xf0\x9f\x9a\x80")
        for split in [1, 2, 3]:
            with self.subTest(scalar_split=split):
                parts = [frame(rows[0]), frame(rows[1]), encoded[:offset + split], encoded[offset + split:],
                         frame(rows[3]), frame(rows[4]), b"data: [DONE]\n\n"]
                (_, body, _), _, _ = self.call("post", chunked(parts), {"prompt": self.ns["USER"]}, read_size=3)
                self.assertEqual(body, b"".join(parts).decode("utf-8"))
                self.assertEqual(self.ns["events"](body), rows)
                self.assertNotIn("\ufffd", body)

    def test_sse_frames_and_utf8_survive_independent_chunk_and_recv_boundaries(self):
        rows = stream_rows("中文🚀")
        payload = b"".join(frame(row) for row in rows) + b"data: [DONE]\n\n"
        # Splits cover SSE lines, scalar bytes and multiple frames per chunk.
        parts = [payload[:7], payload[7:47], payload[47:113], payload[113:]]
        (_, body, _), _, _ = self.call("post", chunked(parts), {"prompt": self.ns["USER"]}, read_size=2)
        self.assertEqual(body, payload.decode("utf-8"))
        self.assertEqual(self.ns["events"](body), rows)

    def test_chunked_unicode_error_body_is_preserved(self):
        payload = '{"error":{"code":"refused","message":"拒绝🚀"}}'.encode("utf-8")
        (status, body, _), _, _ = self.call("post", chunked([payload], "400 Bad Request"), {"prompt": self.ns["USER"]}, read_size=5)
        self.assertEqual(status, "HTTP/1.1 400 Bad Request")
        self.assertEqual(body, payload.decode("utf-8"))
        self.assertEqual(json.loads(body), {"error": {"code": "refused", "message": "拒绝🚀"}})


if __name__ == "__main__":
    unittest.main(verbosity=2)
