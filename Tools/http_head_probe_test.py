#!/usr/bin/env python3
"""Finite socket-double tests for http_head_probe; no real sockets or server."""

import contextlib
import importlib.util
import io
from pathlib import Path
import socket
import sys
import unittest
from unittest import mock


_spec = importlib.util.spec_from_file_location(
    "http_head_probe_under_test", Path(__file__).with_name("http_head_probe.py")
)
probe = importlib.util.module_from_spec(_spec)
with mock.patch.object(sys, "dont_write_bytecode", True):
    _spec.loader.exec_module(probe)


class Clock:
    def __init__(self):
        self.now = 0.0

    def __call__(self):
        return self.now


class FakeSocket:
    """Finite recv script, including packet boundaries, errors and fake time."""

    def __init__(self, chunks, clock, connect_error=None):
        self.chunks = list(chunks)
        self.clock = clock
        self.connect_error = connect_error
        self.connected = None
        self.sent = None
        self.closed = False
        self.timeouts = []
        self.recv_sizes = []
        self.received = 0

    def __enter__(self):
        return self

    def __exit__(self, *unused):
        self.closed = True

    def settimeout(self, seconds):
        if seconds <= 0:
            raise RuntimeError("non-positive timeout supplied to fake socket")
        self.timeouts.append(seconds)

    def connect(self, address):
        self.connected = address
        if self.connect_error is not None:
            raise self.connect_error

    def sendall(self, request):
        self.sent = request

    def recv(self, size):
        self.recv_sizes.append(size)
        if size <= 0 or not self.chunks:
            raise RuntimeError("recv size invalid or finite fake script exhausted")
        item = self.chunks.pop(0)
        if isinstance(item, BaseException):
            raise item
        delay, data = item if isinstance(item, tuple) else (0.0, item)
        if delay > self.timeouts[-1]:
            self.clock.now += self.timeouts[-1]
            raise socket.timeout("finite fake socket reached its timeout")
        self.clock.now += delay
        if len(data) > size:
            self.chunks.insert(0, data[size:])
        answer = data[:size]
        self.received += len(answer)
        return answer


@contextlib.contextmanager
def network(fake, clock):
    with mock.patch.object(probe.socket, "socket", return_value=fake) as factory:
        with mock.patch.object(probe.time, "monotonic", side_effect=clock):
            yield factory


class HeadProbeTests(unittest.TestCase):
    def test_legal_header_only_responses(self):
        responses = [
            b"HTTP/1.1 200 OK\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nContent-Length: 37\r\n\r\n",
            b"HTTP/1.0 200 \r\ncOnTeNt-LeNgTh:\t0037 \t\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nContent-Length: 37, 037\r\nContent-Length: 37\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\nX-Note: \xff\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nContent-Length: " + b"9" * 5000 + b"\r\n\r\n",
        ]
        for response in responses:
            with self.subTest(response=response[:100]):
                self.assertIsNone(probe.check_response(response))

    def test_bad_status_headers_and_lengths(self):
        responses = [
            b"", b"HTTP/1.1 200 OK\r\n",
            b"HTTP/1.1 404 Not Found\r\n\r\n",
            b"HTTP/1.1 200\r\n\r\n",
            b"HTTP/1.1 200 OK\nInjected\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nBad Header: x\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nX-Note: a\x00b\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nContent-Length: \r\n\r\n",
            b"HTTP/1.1 200 OK\r\nContent-Length: +1\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nContent-Length: 1,\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nContent-Length: 1, 2\r\n\r\n",
            b"HTTP/1.1 200 OK\r\nContent-Length: 1\r\nContent-Length: 2\r\n\r\n",
        ]
        for response in responses:
            with self.subTest(response=response):
                with self.assertRaises(probe.ProbeError):
                    probe.check_response(response)

    def test_any_raw_body_fails_independently_of_metadata(self):
        for metadata, body in [
            (b"", b"x"),
            (b"Content-Length: 0\r\n", b"x"),
            (b"Content-Length: 37\r\n", b"x"),
            (b"Transfer-Encoding: chunked\r\n", b"0\r\n\r\n"),
        ]:
            with self.subTest(metadata=metadata):
                with self.assertRaisesRegex(probe.ProbeError, "body bytes"):
                    probe.check_response(b"HTTP/1.1 200 OK\r\n" + metadata + b"\r\n" + body)

    def test_fragmented_headers_and_later_body_are_read_through_EOF(self):
        for tail in [b"", b"later body"]:
            with self.subTest(tail=tail):
                clock = Clock()
                chunks = [b"HTTP/1.1 200 OK\r\nX: value\r", b"\n\r", b"\n"]
                if tail:
                    chunks.append(tail)
                chunks.append(b"")
                fake = FakeSocket(chunks, clock)
                with network(fake, clock) as factory:
                    response = probe.read_response(11466)
                self.assertTrue(fake.closed)
                self.assertEqual(fake.chunks, [])
                self.assertEqual(len(fake.recv_sizes), len(chunks))
                self.assertEqual(fake.connected, ("127.0.0.1", 11466))
                self.assertEqual(fake.sent, b"HEAD /api/tags HTTP/1.1\r\nHost: 127.0.0.1:11466\r\nConnection: close\r\n\r\n")
                factory.assert_called_once_with(socket.AF_INET, socket.SOCK_STREAM)
                if tail:
                    with self.assertRaisesRegex(probe.ProbeError, "body bytes"):
                        probe.check_response(response)
                else:
                    self.assertIsNone(probe.check_response(response))

    def test_exact_response_cap_and_one_byte_overflow(self):
        prefix, suffix = b"HTTP/1.1 200 OK\r\nX-Pad: ", b"\r\n\r\n"
        exact = prefix + b"a" * (probe.MAX_RESPONSE_BYTES - len(prefix) - len(suffix)) + suffix
        self.assertEqual(len(exact), 64 * 1024)
        for extra in [b"", b"x"]:
            with self.subTest(extra=extra):
                clock = Clock()
                fake = FakeSocket([exact + extra, b""], clock)
                with network(fake, clock):
                    if extra:
                        with self.assertRaisesRegex(probe.ProbeError, "64 KiB"):
                            probe.read_response(11466)
                    else:
                        response = probe.read_response(11466)
                        self.assertIsNone(probe.check_response(response))
                self.assertTrue(fake.closed)
                self.assertEqual(fake.recv_sizes[-1], 1)
                self.assertLessEqual(max(fake.recv_sizes), 4096)
                self.assertEqual(fake.received, len(exact) + len(extra))

    def test_one_deadline_spans_all_reads(self):
        clock = Clock()
        fake = FakeSocket([
            (0.06, b"HTTP/1.1 "), (0.06, b"200 OK\r\n"),
            (0.06, b"\r\n"), (0.06, b""),
        ], clock)
        with network(fake, clock):
            with mock.patch.object(probe, "DEADLINE_SECONDS", 0.2):
                with self.assertRaises(socket.timeout):
                    probe.read_response(11466)
        self.assertTrue(fake.closed)
        self.assertAlmostEqual(clock.now, 0.2)
        self.assertAlmostEqual(fake.timeouts[-1], 0.02)
        self.assertGreater(fake.timeouts[0], fake.timeouts[-1])

    def test_main_success_and_transport_or_body_failures(self):
        cases = [
            ([b"HTTP/1.1 200 OK\r\nContent-Length: 37\r\n\r\n", b""], None, 0),
            ([b"HTTP/1.1 200 OK\r\n\r\nx", b""], None, 1),
            ([ConnectionResetError("finite fake reset")], None, 1),
            ([], ConnectionRefusedError("finite fake refusal"), 1),
            ([b"HTTP/1.1 200 OK\r\n", b""], None, 1),
        ]
        for chunks, connect_error, expected in cases:
            with self.subTest(expected=expected, connect_error=connect_error, chunks=chunks):
                clock = Clock()
                fake = FakeSocket(chunks, clock, connect_error)
                output, errors = io.StringIO(), io.StringIO()
                with network(fake, clock):
                    with contextlib.redirect_stdout(output), contextlib.redirect_stderr(errors):
                        result = probe.main(["11466"])
                self.assertEqual(result, expected)
                self.assertTrue(fake.closed)
                self.assertEqual(bool(output.getvalue()), expected == 0)
                self.assertEqual(bool(errors.getvalue()), expected != 0)

    def test_invalid_ports_fail_before_socket_creation(self):
        for port in ["0", "00000", "65536", "00065536", "-1", "abc", "１２３", " 80", "1\r\nX: bad", "9999999999"]:
            with self.subTest(port=port):
                with mock.patch.object(probe.socket, "socket") as factory:
                    with contextlib.redirect_stderr(io.StringIO()):
                        with self.assertRaises(SystemExit) as failure:
                            probe.main([port])
                self.assertEqual(failure.exception.code, 2)
                factory.assert_not_called()

    def test_decimal_port_values_allow_leading_zeroes(self):
        for argument, port in [("1", 1), ("65535", 65535), ("00011466", 11466), ("00065535", 65535)]:
            with self.subTest(argument=argument):
                clock = Clock()
                fake = FakeSocket([b"HTTP/1.1 200 OK\r\n\r\n", b""], clock)
                with network(fake, clock):
                    with contextlib.redirect_stdout(io.StringIO()):
                        self.assertEqual(probe.main([argument]), 0)
                self.assertEqual(fake.connected, ("127.0.0.1", port))
                self.assertTrue(fake.closed)


if __name__ == "__main__":
    unittest.main()
