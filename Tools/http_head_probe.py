#!/usr/bin/env python3
"""Check a local HEAD response without a client's automatic body suppression.

The probe checks status and raw body absence, not HEAD/GET representation parity.
"""

import argparse
import re
import socket
import sys
import time


DEADLINE_SECONDS = 20.0
MAX_RESPONSE_BYTES = 64 * 1024
REQUEST_PATH = "/api/tags"
_FIELD_NAME = re.compile(rb"[!#$%&'*+.^_`|~0-9A-Za-z-]+")


class ProbeError(ValueError):
    """The bounded response did not satisfy this acceptance check."""


def _remaining(deadline):
    remaining = deadline - time.monotonic()
    if remaining <= 0:
        raise ProbeError("HEAD response exceeded the total 20 s deadline")
    return remaining


def read_response(port):
    """Send one HEAD to IPv4 loopback and retain at most 64 KiB until EOF."""
    deadline = time.monotonic() + DEADLINE_SECONDS
    request = (
        "HEAD " + REQUEST_PATH + " HTTP/1.1\r\n"
        "Host: 127.0.0.1:" + str(port) + "\r\n"
        "Connection: close\r\n\r\n"
    ).encode("ascii")
    raw = bytearray()
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as conn:
        conn.settimeout(_remaining(deadline))
        conn.connect(("127.0.0.1", port))
        conn.settimeout(_remaining(deadline))
        conn.sendall(request)
        while True:
            conn.settimeout(_remaining(deadline))
            # At the limit, one sentinel byte distinguishes EOF from overflow;
            # it is never appended, so the retained response stays <= 64 KiB.
            room = MAX_RESPONSE_BYTES - len(raw)
            chunk = conn.recv(min(4096, room) if room else 1)
            if not chunk:
                _remaining(deadline)
                return bytes(raw)
            if len(chunk) > room:
                raise ProbeError("HEAD response exceeded the 64 KiB limit")
            raw.extend(chunk)


def check_response(raw):
    """Validate complete raw bytes; Content-Length is representation metadata."""
    if len(raw) > MAX_RESPONSE_BYTES:
        raise ProbeError("HEAD response exceeded the 64 KiB limit")
    head, separator, body = raw.partition(b"\r\n\r\n")
    if not separator:
        raise ProbeError("HEAD response has no complete CRLF header terminator")
    lines = head.split(b"\r\n")
    status = lines[0].split(b" ", 2)
    if (
        len(status) != 3
        or status[0] not in (b"HTTP/1.0", b"HTTP/1.1")
        or status[1] != b"200"
    ):
        raise ProbeError("HEAD response status is not HTTP 200")
    if any((byte < 32 and byte != 9) or byte == 127 for byte in status[2]):
        raise ProbeError("HEAD response has an invalid status reason")
    lengths = set()
    for line in lines[1:]:
        name, colon, value = line.partition(b":")
        if not colon or _FIELD_NAME.fullmatch(name) is None:
            raise ProbeError("HEAD response contains a malformed header field")
        if any((byte < 32 and byte != 9) or byte == 127 for byte in value):
            raise ProbeError("HEAD response contains an invalid header value")
        if name.lower() == b"content-length":
            # This is the GET representation's length, not HEAD body length.
            # Do not allocate or read according to it, or require it to be 0.
            values = [member.strip(b" \t") for member in value.split(b",")]
            if any(not member or not member.isdigit() for member in values):
                raise ProbeError("HEAD response has an invalid Content-Length")
            lengths.update(member.lstrip(b"0") or b"0" for member in values)
    if len(lengths) > 1:
        raise ProbeError("HEAD response has conflicting Content-Length values")
    if body:
        raise ProbeError("HEAD response carried " + str(len(body)) + " body bytes")


def _port(value):
    if not value.isascii() or not value.isdecimal():
        raise argparse.ArgumentTypeError("port must be an integer from 1 to 65535")
    normalized = value.lstrip("0") or "0"
    if len(normalized) > 5:
        raise argparse.ArgumentTypeError("port must be an integer from 1 to 65535")
    port = int(normalized)
    if not 1 <= port <= 65535:
        raise argparse.ArgumentTypeError("port must be an integer from 1 to 65535")
    return port


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("port", type=_port, help="existing IPv4 loopback server port")
    args = parser.parse_args(argv)
    try:
        check_response(read_response(args.port))
    except (OSError, ProbeError) as error:
        print("FAIL HEAD: " + str(error), file=sys.stderr)
        return 1
    print("PASS HEAD /api/tags: HTTP 200, no raw body bytes through EOF")
    return 0


if __name__ == "__main__":
    sys.exit(main())
