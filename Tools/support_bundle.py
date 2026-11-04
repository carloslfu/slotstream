#!/usr/bin/env python3
"""Export explicitly selected logs to a local, best-effort sanitized ZIP.

Standard library only; no discovery, subprocesses, network or model startup.
See docs/SUPPORT-BUNDLE.md for the privacy and filesystem limitations.
"""
import argparse
import hashlib
import io
import json
import os
from pathlib import Path
import re
import stat
import sys
import zipfile


# Inclusive exporter resource bounds, independent of model/runtime settings.
MAX_FILES = 16
MAX_FILE_BYTES = 1024 * 1024
MAX_TOTAL_BYTES = 8 * 1024 * 1024
READ_BYTES = 64 * 1024

_CREDENTIAL = re.compile(
    r"(?<![\w-])[\"']?(?:authorization|proxy-authorization|cookie|set-cookie|"
    r"x-api-key|api[-_]key|password|passwd|pwd|secret|client_secret|"
    r"access_token|refresh_token|id_token|token)[\"']?[ \t]*[:=]",
    re.IGNORECASE,
)
_BEARER = re.compile(r"(?<![\w-])bearer[ \t]+\S", re.IGNORECASE)
_PRIVATE_BEGIN = re.compile(r"-----BEGIN ([A-Z0-9 ]*PRIVATE KEY)-----")
# Apostrophes can be URL content; consume them even in single-quoted logs.
_URL = re.compile(r"https?://[^\s<>\"]+", re.IGNORECASE)
# Spaces are permitted in a home directory name. Quotes, path separators and
# line/tab boundaries terminate the component; unusual encodings are not decoded.
_HOME = re.compile(
    r"/(?:Users|home)/[^/\\\r\n\t\"'<>]+|"
    r"[A-Z]:\\+Users\\+[^/\\\r\n\t\"'<>]+",
    re.IGNORECASE,
)


def sanitize(text):
    """Return sanitized text and counts; counts describe applied replacements."""
    counts = dict(credential_lines=0, private_key_blocks=0, urls=0, home_paths=0)
    result = []
    private_end = None
    for line in text.splitlines(keepends=True):
        body = line.rstrip("\r\n\v\f\x1c\x1d\x1e\x85\u2028\u2029")
        ending = line[len(body):]
        if private_end is not None:
            result.append(ending)
            if private_end in body:
                private_end = None
            continue
        begin = _PRIVATE_BEGIN.search(body)
        if begin is not None:
            counts["private_key_blocks"] += 1
            private_end = "-----END " + begin.group(1) + "-----"
            # The complete marker line is removed, including any inline data.
            if private_end in body[begin.end():]:
                private_end = None
            result.append("[REDACTED PRIVATE KEY]" + ending)
            continue
        if _CREDENTIAL.search(body) or _BEARER.search(body):
            counts["credential_lines"] += 1
            result.append("[REDACTED CREDENTIAL LINE]" + ending)
            continue
        body, replaced = _URL.subn("[REDACTED URL]", body)
        counts["urls"] += replaced
        body, replaced = _HOME.subn("[HOME]", body)
        counts["home_paths"] += replaced
        result.append(body + ending)
    return "".join(result), counts


class _InputError(ValueError):
    """An input refusal whose message contains only a number and fixed text."""


def _snapshot(info):
    return (info.st_dev, info.st_ino, info.st_size,
            info.st_mtime_ns, info.st_ctime_ns)


def _read_log(path, number, seen, total):
    def refuse(reason):
        return _InputError("Input %d: %s" % (number, reason))

    if not hasattr(os, "O_NOFOLLOW") or not hasattr(os, "O_NONBLOCK"):
        raise refuse("secure regular-file reads are unavailable on this platform.")
    fd = None
    try:
        fd = os.open(path, os.O_RDONLY | os.O_NOFOLLOW | os.O_NONBLOCK)
        before = os.fstat(fd)
        if not stat.S_ISREG(before.st_mode):
            raise refuse("a regular file is required.")
        identity = (before.st_dev, before.st_ino)
        if identity in seen:
            raise refuse("duplicate file identity.")
        if before.st_size > MAX_FILE_BYTES:
            raise refuse("the per-file byte limit was exceeded.")
        if total + before.st_size > MAX_TOTAL_BYTES:
            raise refuse("the combined byte limit was exceeded.")
        raw = bytearray()
        limit = min(MAX_FILE_BYTES, MAX_TOTAL_BYTES - total)
        while True:
            chunk = os.read(fd, min(READ_BYTES, limit + 1 - len(raw)))
            if not chunk:
                break
            raw.extend(chunk)
            if len(raw) > limit:
                raise refuse("a byte limit was exceeded during reading.")
        after = os.fstat(fd)
        final = os.stat(path, follow_symlinks=False)
        if (not stat.S_ISREG(final.st_mode) or
                _snapshot(before) != _snapshot(after) or
                _snapshot(before) != _snapshot(final) or
                len(raw) != before.st_size):
            raise refuse("the file changed during reading.")
        if b"\x00" in raw:
            raise refuse("NUL bytes are not accepted.")
        try:
            text = raw.decode("utf-8")
        except UnicodeDecodeError:
            raise refuse("UTF-8 text is required.") from None
        seen.add(identity)
        return text, len(raw)
    except OSError:
        raise refuse("the file could not be read safely.") from None
    finally:
        if fd is not None:
            os.close(fd)


def _zip_member(archive, name, data):
    info = zipfile.ZipInfo(name, date_time=(1980, 1, 1, 0, 0, 0))
    info.create_system = 3
    info.external_attr = (stat.S_IFREG | 0o600) << 16
    info.compress_type = zipfile.ZIP_DEFLATED
    archive.writestr(info, data)


def _remove_owned_output(output, identity):
    # Parent directories must be trusted. This identity check avoids removing a
    # replacement observed here; it is not an atomic hostile-directory defense.
    try:
        current = os.stat(output, follow_symlinks=False)
        if (current.st_dev, current.st_ino) == identity:
            os.unlink(output)
    except OSError:
        pass


def _write_output(output, payload):
    fd = None
    identity = None
    try:
        flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
        flags |= getattr(os, "O_NOFOLLOW", 0)
        fd = os.open(output, flags, 0o600)
        created = os.fstat(fd)
        identity = (created.st_dev, created.st_ino)
        if os.name == "posix":
            os.fchmod(fd, 0o600)
        remaining = memoryview(payload)
        while remaining:
            written = os.write(fd, remaining)
            if written <= 0:
                raise OSError("Incomplete archive write.")
            remaining = remaining[written:]
        os.fsync(fd)
        os.close(fd)
        fd = None
    except (OSError, KeyboardInterrupt):
        if identity is not None:
            _remove_owned_output(output, identity)
        raise
    finally:
        if fd is not None:
            try:
                os.close(fd)
            except OSError:
                pass


def create_bundle(log_paths, output):
    """Write an exclusive local ZIP, raising ValueError for invalid inputs.

    Output I/O failures and KeyboardInterrupt propagate after best-effort cleanup
    of the output inode owned by this invocation.
    """
    if not 1 <= len(log_paths) <= MAX_FILES:
        raise ValueError("Supply between one and sixteen explicit log files.")
    seen = set()
    total = 0
    rows = []
    logs = []
    for number, path in enumerate(log_paths, 1):
        text, original_bytes = _read_log(path, number, seen, total)
        total += original_bytes
        clean, counts = sanitize(text)
        data = clean.encode("utf-8")
        member = "logs/%03d.txt" % number
        rows.append(dict(member=member, original_bytes=original_bytes,
                         sanitized_bytes=len(data),
                         sanitized_sha256=hashlib.sha256(data).hexdigest(),
                         redactions=counts))
        logs.append((member, data))
    manifest = dict(schema_version=1, policy_version=1, logs=rows)
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, "w") as archive:
        _zip_member(archive, "manifest.json",
                    (json.dumps(manifest, indent=2, sort_keys=True) + "\n").encode("utf-8"))
        for member, data in logs:
            _zip_member(archive, member, data)
    _write_output(output, buffer.getvalue())


class _Parser(argparse.ArgumentParser):
    def error(self, message):
        # argparse's normal errors can echo an unknown argument or path.
        self.exit(2, "Invalid arguments; use --help for usage.\n")


def main():
    parser = _Parser(
        prog="support_bundle.py",
        description="Export explicitly selected UTF-8 logs to a local sanitized ZIP. "
                    "No discovery, commands, network, upload or model startup.",
        epilog="Requires Python 3.9+ and no-follow/nonblocking file support. "
               "Limits: 16 files, 1 MiB each, 8 MiB total. "
               "Sanitization is best effort: inspect every member before sharing. "
               "Parent directories must be trusted; output must not exist.",
    )
    parser.add_argument("--log", action="append", type=Path, default=[], metavar="PATH",
                        help="explicit UTF-8 log file; repeat for each input")
    parser.add_argument("--output", required=True, type=Path, metavar="PATH",
                        help="new local ZIP path (never overwrites)")
    args = parser.parse_args()
    try:
        create_bundle(args.log, args.output)
    except _InputError as error:
        print(str(error), file=sys.stderr)
        return 1
    except (ValueError, OSError):
        print("Bundle refused: check input limits and the new output location.", file=sys.stderr)
        return 1
    except KeyboardInterrupt:
        print("Bundle export interrupted; check the output location.", file=sys.stderr)
        return 130
    print("Created local bundle with %d anonymous log member(s). Inspect before sharing."
          % len(args.log))
    return 0


if __name__ == "__main__":
    sys.exit(main())
