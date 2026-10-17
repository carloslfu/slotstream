#!/usr/bin/env python3
"""Drive only the exact Foundation/POSIX confirmation helper on private PTYs."""
import errno
import fcntl
import hashlib
import json
import os
from pathlib import Path
import pty
import select
import shutil
import stat
import signal
import subprocess
import tempfile
import termios
import time
import unittest

ROOT = Path(__file__).resolve().parent.parent
SOURCE = ROOT / "Sources/slotstream-cli/TerminalConfirmation.swift"
SWIFTC = os.environ.get("SLOTSTREAM_CONFIRMATION_SWIFTC", "swiftc")
SDK = os.environ.get("SLOTSTREAM_CONFIRMATION_SDK")
OUTPUT = os.environ.get("SLOTSTREAM_CONFIRMATION_OUTPUT")
PROMPT = b"confirm fixture? [Y/n] "
CANCELLED = []
OWNED = []
NATIVE_STARTED = False
COMPILER_TEMPORARIES = []
# This harness has no Slotstream import or caller. Both marker files belong to
# the individual private fixture; nothing is written to the user's terminal.
HARNESS = r'''import Foundation
#if canImport(Darwin)
import Darwin
#else
import Glibc
#endif
let fixture = URL(fileURLWithPath: CommandLine.arguments[1], isDirectory: true)
func terminalName(_ fd: Int32) -> String? {
    guard let name = ttyname(fd) else { return nil }
    return String(cString: name)
}
var ready: [String: Any] = ["pid": getpid(), "sid": getsid(0), "pgid": getpgrp(),
    "stdin_tty": isatty(0), "stdout_tty": isatty(1), "stderr_tty": isatty(2),
    "stdin_name": terminalName(0).map { $0 as Any } ?? NSNull(),
    "controlling_tty": NSNull(), "controlling_foreground_group": NSNull()]
if let terminal = fopen("/dev/tty", "r+") {
    ready["controlling_tty"] = terminalName(fileno(terminal)).map { $0 as Any } ?? NSNull()
    ready["controlling_foreground_group"] = tcgetpgrp(fileno(terminal))
    fclose(terminal)
}
try JSONSerialization.data(withJSONObject: ready, options: [.sortedKeys])
    .write(to: fixture.appendingPathComponent("ready.json"), options: .atomic)
let answer = askYesNo("confirm fixture? [Y/n] ")
let result = answer.map { $0 ? "true" : "false" } ?? "nil"
try result.write(to: fixture.appendingPathComponent("result.txt"), atomically: true, encoding: .utf8)
'''


EVIDENCE_ERRORS = []
CLEANUP_SECONDS = 8


class CleanupIncomplete(KeyboardInterrupt):
    """Stop unittest from launching further cases until the recorder drains us."""


def save(path, value):
    # Evidence I/O must never interrupt signalling/reaping or skip another child.
    try:
        path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
        return True
    except BaseException as error:
        EVIDENCE_ERRORS.append({"path": str(path), "error": repr(error), "time": time.time()})
        return False


def cancelled():
    if CANCELLED or EVIDENCE_ERRORS:
        raise RuntimeError("cancelled or evidence incomplete: " + repr(CANCELLED + EVIDENCE_ERRORS))


def session_members(sid, timeout=2):
    observation = subprocess.run(["ps", "-axo", "pid=,pgid=,stat="],
                                 capture_output=True, text=True, check=True, timeout=timeout)
    members = []
    for line in observation.stdout.splitlines():
        row = line.split()
        if len(row) != 3 or not row[0].isdigit() or not row[1].isdigit():
            raise RuntimeError("malformed owned-session inventory")
        pid, group = int(row[0]), int(row[1])
        if pid == 0:
            continue
        try:
            if os.getsid(pid) == sid:
                members.append({"pid": pid, "pgid": group, "state": row[2]})
        except ProcessLookupError:
            pass
    return members


def track(child, record, path):
    global NATIVE_STARTED
    NATIVE_STARTED = True
    record.update(pid=child.pid, session=child.pid)
    owned = (child, record, path)
    OWNED.append(owned)
    save(path, record)  # never raises: the local handle is always returned
    return owned


def clean_owned(owned):
    """Try TERM/KILL, direct reap and fresh empty-session proof for <=8s.

    Return False with the handle retained if cleanup remains unproved. The
    recorder must then hold its serial lock in an explicit attention state.
    """
    child, record, path = owned
    started = time.monotonic()
    deadline = started + CLEANUP_SECONDS
    members = None
    observations = []
    signals = []
    while time.monotonic() < deadline:
        code = child.poll()  # reaps only this owned direct handle
        sig = signal.SIGTERM if time.monotonic() - started < 1 else signal.SIGKILL
        # Direct Popen signalling remains possible even if ps observation fails.
        if code is None:
            try:
                child.send_signal(sig)
                signals.append({"direct_pid": child.pid, "signal": int(sig)})
            except ProcessLookupError:
                pass
            except BaseException as error:
                observations.append({"direct_signal_error": repr(error)})
        try:
            remaining = deadline - time.monotonic()
            if remaining <= 0:
                break
            members = session_members(child.pid, timeout=min(2, remaining))
            code = child.poll()
            if code is not None and not members:
                child.wait()  # already exited; direct handle only
                record["cleanup"] = {"complete": True, "returncode": code,
                                     "remaining_session_members": [], "observations": observations,
                                     "signals": signals, "elapsed": time.monotonic() - started}
                OWNED.remove(owned)
                save(path, record)
                return True
            groups = sorted({row["pgid"] for row in members if not row["state"].startswith("Z")})
            for group in groups:
                remaining = deadline - time.monotonic()
                if remaining <= 0:
                    break
                # Re-observe membership, never signal a group from stale state.
                current = session_members(child.pid, timeout=min(2, remaining))
                if any(row["pgid"] == group for row in current):
                    try:
                        os.killpg(group, sig)
                        signals.append({"group": group, "signal": int(sig)})
                    except ProcessLookupError:
                        pass
        except BaseException as error:
            observations.append({"observation_or_group_signal_error": repr(error)})
        time.sleep(min(0.1, max(0, deadline - time.monotonic())))
    record["cleanup"] = {"complete": False, "attention_required": True,
                         "remaining_session_members_last_observed": members,
                         "direct_returncode": child.poll(), "observations": observations,
                         "signals": signals, "elapsed": time.monotonic() - started}
    save(path, record)
    return False


def cleanup_all():
    # A reporting/observation fault for one child must not skip another handle.
    pending = []
    for owned in list(OWNED):
        try:
            if not clean_owned(owned):
                pending.append(owned[0].pid)
        except BaseException as error:
            child, record, path = owned
            record["cleanup"] = {"complete": False, "attention_required": True,
                                 "unexpected_cleanup_error": repr(error)}
            save(path, record)
            pending.append(child.pid)
    return pending


def compiler_tmpdir_identity(directory):
    info = directory.lstat()
    resolved = directory.resolve(strict=True)
    if (not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode)
            or info.st_uid != os.getuid() or stat.S_IMODE(info.st_mode) != 0o700
            or directory != resolved or resolved.parent != Path("/private/tmp")
            or not resolved.name.startswith("slotstream-confirmation-compiler-")
            or not str(resolved).isascii()):
        raise RuntimeError("compiler TMPDIR is not an owned0700 ASCII private directory")
    return {"path": str(directory), "resolved_path": str(resolved), "device": info.st_dev,
            "inode": info.st_ino, "uid": info.st_uid, "mode": stat.S_IMODE(info.st_mode)}


def cleanup_compiler_temporaries():
    for directory, expected, record, path in list(COMPILER_TEMPORARIES):
        if OWNED:
            record["compiler_tmpdir_cleanup"] = {"removed": False,
                "retained_reason": "owned session cleanup is unproved"}
            save(path, record)
            continue
        try:
            if compiler_tmpdir_identity(directory) != expected:
                raise RuntimeError("compiler TMPDIR identity changed; retaining without removal")
            # Only the unique0700 task-owned root with exact creation identity.
            # Compiler sessions were reaped/proved empty before reaching here.
            shutil.rmtree(directory)
            record["compiler_tmpdir_cleanup"] = {"removed": True, "identity": expected}
            COMPILER_TEMPORARIES.remove((directory, expected, record, path))
        except BaseException as error:
            record["compiler_tmpdir_cleanup"] = {"removed": False, "error": repr(error)}
            EVIDENCE_ERRORS.append({"operation": "owned compiler TMPDIR removal", "error": repr(error)})
        save(path, record)


def require_cleanup():
    if cleanup_all():
        raise CleanupIncomplete("owned sessions require recorder attention")
    cleanup_compiler_temporaries()


class TerminalConfirmation(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if OUTPUT:
            cls.directory = Path(OUTPUT)
            cls.directory.mkdir(exist_ok=False)
        else:
            cls.temporary = tempfile.TemporaryDirectory(prefix="slotstream-confirmation-")
            cls.addClassCleanup(cls.temporary.cleanup)
            cls.directory = Path(cls.temporary.name)
        cls.addClassCleanup(require_cleanup)
        cls.binary = cls.directory / "confirmation-helper"
        cls.source = cls.directory / "TerminalConfirmation.swift"
        cls.source.write_bytes(SOURCE.read_bytes())
        main = cls.directory / "main.swift"
        main.write_text(HARNESS)
        cls.source_identity = {p.name: hashlib.sha256(p.read_bytes()).hexdigest()
                               for p in (cls.source, main)}
        cache = cls.directory / "module-cache"
        cache.mkdir()
        temporary = cls.directory / "tmp"
        temporary.mkdir()
        cls.child_env = {"PATH": "/usr/bin:/bin:/usr/sbin:/sbin",
                         "TMPDIR": str(temporary), "CLANG_MODULE_CACHE_PATH": str(cache),
                         "SWIFT_MODULECACHE_PATH": str(cache)}
        if "HOME" in os.environ:
            cls.child_env["HOME"] = os.environ["HOME"]
        argv = [str(SWIFTC), "-swift-version", "5", "-module-cache-path", str(cache)]
        if SDK:
            argv += ["-sdk", str(SDK)]
        argv += [str(cls.source), str(main), "-o", str(cls.binary)]
        record = {"argv": argv, "cwd": str(cls.directory), "source_sha256": cls.source_identity,
                  "wall_limit_seconds": 90, "started": time.time(), "environment": cls.child_env}
        path = cls.directory / "compilation.json"
        owned = None
        try:
            cancelled()
            # Swift6.3.3 temporary setup may trap on UTF8 paths. Change only
            # compiler TMPDIR; helper env/source/cache paths remain as before.
            compiler_tmpdir = Path(tempfile.mkdtemp(prefix="slotstream-confirmation-compiler-", dir="/private/tmp"))
            record["compiler_tmpdir_created_path"] = str(compiler_tmpdir)
            record["compiler_tmpdir_cleanup"] = {"removed": False, "retained_reason": "creation identity not yet validated"}
            temporary_identity = compiler_tmpdir_identity(compiler_tmpdir)
            COMPILER_TEMPORARIES.append((compiler_tmpdir, temporary_identity, record, path))
            compiler_env = dict(cls.child_env)
            compiler_env["TMPDIR"] = str(compiler_tmpdir)
            record.update(environment=compiler_env, compiler_tmpdir=temporary_identity,
                          helper_environment=cls.child_env,
                          changed_compiler_environment_keys=[key for key in compiler_env
                              if compiler_env[key] != cls.child_env.get(key)])
            if record["changed_compiler_environment_keys"] != ["TMPDIR"]:
                raise RuntimeError("compiler environment differs by more than TMPDIR")
            if not save(path, record):
                raise RuntimeError("cannot persist owned compiler TMPDIR identity; no compiler launch")
            with (cls.directory / "compilation.stdout").open("xb") as out, \
                    (cls.directory / "compilation.stderr").open("xb") as err:
                child = subprocess.Popen(argv, cwd=cls.directory, stdin=subprocess.DEVNULL,
                                         stdout=out, stderr=err, start_new_session=True, env=compiler_env)
                owned = track(child, record, path)
                deadline = time.monotonic() + 90
                while child.poll() is None:
                    cancelled()
                    if time.monotonic() >= deadline:
                        raise TimeoutError("bounded helper compilation exceeded 90 seconds")
                    time.sleep(0.03)
                if child.returncode:
                    raise RuntimeError("helper compilation failed; inspect compilation.stderr")
            record["binary_sha256"] = hashlib.sha256(cls.binary.read_bytes()).hexdigest()
        except BaseException as error:
            record["error"] = repr(error)
            raise
        finally:
            complete = not cleanup_all()
            cleanup_compiler_temporaries()
            record["ended"] = time.time()
            save(path, record)
            if not complete:
                raise CleanupIncomplete("compiler session cleanup remains unproved")

    def run_case(self, name, *, pipe_input=False, redirect_stdout=False,
                 redirect_stderr=False, answer=b"n\n", expected="false", no_terminal=False):
        directory = self.directory / name
        directory.mkdir()
        record_path = directory / "case.json"
        argv = [str(self.binary), str(directory)]
        record = {"argv": argv, "started": time.time(), "expected": expected,
                  "routing": {"stdin": "pipe" if pipe_input else "private_tty",
                              "stdout": "file" if redirect_stdout else "private_tty",
                              "stderr": "file" if redirect_stderr else "private_tty"},
                  "wall_limit_seconds": 6, "source_sha256": self.source_identity,
                  "environment": self.child_env}
        master = slave = None
        owned = None
        terminal = bytearray()
        visibility_error = None
        try:
            cancelled()
            if not no_terminal:
                master, slave = pty.openpty()
                record["private_slave"] = os.ttyname(slave)
                os.set_blocking(master, False)
                # Only this owned slave is examined; no parent /dev/tty open.
                record["canonical_eof_hex"] = bytes(termios.tcgetattr(slave)[6][termios.VEOF]).hex()
                def acquire_private_terminal():
                    os.setsid()
                    fcntl.ioctl(slave, termios.TIOCSCTTY, 0)
                child_setup = {"preexec_fn": acquire_private_terminal, "pass_fds": (slave,)}
            else:
                child_setup = {"start_new_session": True}
            with (directory / "stdout.bin").open("xb", buffering=0) as out, \
                    (directory / "stderr.bin").open("xb", buffering=0) as err:
                child = subprocess.Popen(argv, cwd=directory,
                    stdin=subprocess.PIPE if pipe_input else slave,
                    stdout=out if redirect_stdout else slave,
                    stderr=err if redirect_stderr else slave, env=self.child_env, **child_setup)
                owned = track(child, record, record_path)
                if slave is not None:
                    os.close(slave)
                    slave = None
                if pipe_input:
                    child.stdin.close()
                deadline = time.monotonic() + 6

                def drain():
                    if master is None:
                        return
                    while select.select([master], [], [], 0)[0]:
                        try:
                            chunk = os.read(master, 65536)
                        except BlockingIOError:
                            return
                        except OSError as error:
                            if error.errno == errno.EIO:
                                record["terminal_drain_end"] = "EIO after slave close"
                                return
                            raise
                        if not chunk:
                            record["terminal_drain_end"] = "EOF after slave close"
                            return
                        terminal.extend(chunk)

                ready_path = directory / "ready.json"
                while not ready_path.exists():
                    cancelled()
                    drain()
                    if child.poll() is not None or time.monotonic() >= deadline:
                        raise RuntimeError("harness never reached ready handshake")
                    time.sleep(0.01)
                ready = json.loads(ready_path.read_text())
                record["ready"] = ready
                self.assertEqual((ready["pid"], ready["sid"], ready["pgid"]),
                                 (child.pid, child.pid, child.pid), record)
                self.assertEqual(ready["stdin_tty"], 0 if pipe_input else 1, record)
                self.assertEqual(ready["stdout_tty"], 0 if redirect_stdout else 1, record)
                self.assertEqual(ready["stderr_tty"], 0 if redirect_stderr else 1, record)
                if no_terminal:
                    self.assertIsNone(ready["controlling_tty"], record)
                else:
                    self.assertIsNotNone(ready["controlling_tty"], record)
                    self.assertEqual(ready["controlling_foreground_group"], child.pid, record)
                    if not pipe_input:
                        self.assertEqual(ready["stdin_name"], record["private_slave"], record)
                    prompt_deadline = min(deadline, time.monotonic() + 1.2)
                    while PROMPT not in terminal and time.monotonic() < prompt_deadline:
                        cancelled()
                        drain()
                        if child.poll() is not None:
                            break
                        time.sleep(0.01)
                    drain()
                    before = bytes(terminal)
                    (directory / "terminal-before-answer.bin").write_bytes(before)
                    (directory / "stdout-before-answer.bin").write_bytes((directory / "stdout.bin").read_bytes())
                    (directory / "stderr-before-answer.bin").write_bytes((directory / "stderr.bin").read_bytes())
                    record.update(prompt_visible_before_answer=PROMPT in before,
                                  pre_answer_time=time.time(), child_alive_before_answer=child.poll() is None,
                                  result_exists_before_answer=(directory / "result.txt").exists())
                    try:
                        self.assertIn(PROMPT, before, record)
                    except AssertionError as error:
                        visibility_error = error
                        record["pre_answer_visibility_assertion"] = "failed"
                    else:
                        record["pre_answer_visibility_assertion"] = "passed"
                    save(record_path, record)
                    # Missing-prompt RED must still let the original child exit:
                    # assert and record state BEFORE answering; re-raise the
                    # visibility failure after routing/result capture and reaping.
                    if child.poll() is None:
                        if answer == b"EOF":
                            answer = bytes.fromhex(record["canonical_eof_hex"])
                        record["answer_hex"] = answer.hex()
                        os.write(master, answer)
                while child.poll() is None:
                    cancelled()
                    drain()
                    if time.monotonic() >= deadline:
                        raise TimeoutError("confirmation helper exceeded six seconds")
                    time.sleep(0.01)
                drain()
                record.update(returncode=child.returncode, ended=time.time())
                result_path = directory / "result.txt"
                record["result"] = result_path.read_text() if result_path.exists() else None
                record["stdout_prompt_after_exit"] = PROMPT in (directory / "stdout.bin").read_bytes()
                record["stderr_prompt_after_exit"] = PROMPT in (directory / "stderr.bin").read_bytes()
                self.assertEqual(child.returncode, 0, record)
                self.assertEqual(record["result"], expected, record)
                if no_terminal:
                    self.assertLess(record["ended"] - record["started"], 2, record)
                    self.assertEqual((directory / "stdout.bin").read_bytes(), b"", record)
                else:
                    self.assertTrue(record["child_alive_before_answer"], record)
                    self.assertFalse(record["result_exists_before_answer"], record)
                    if visibility_error is not None:
                        raise visibility_error
                if redirect_stdout:
                    self.assertEqual((directory / "stdout.bin").read_bytes(), b"", record)
                if redirect_stderr:
                    self.assertEqual((directory / "stderr.bin").read_bytes(), b"", record)
        except BaseException as error:
            record["error"] = repr(error)
            raise
        finally:
            complete = not cleanup_all()
            if master is not None:
                # Drain already captured normal output before closing our master.
                try:
                    drain()
                except Exception as error:
                    record["final_drain_error"] = repr(error)
                    EVIDENCE_ERRORS.append({"operation": "final owned terminal drain", "error": repr(error)})
                try:
                    os.close(master)
                except BaseException as error:
                    EVIDENCE_ERRORS.append({"operation": "close owned master", "error": repr(error)})
            if slave is not None:
                try:
                    os.close(slave)
                except BaseException as error:
                    EVIDENCE_ERRORS.append({"operation": "close owned slave", "error": repr(error)})
            try:
                (directory / "terminal.bin").write_bytes(terminal)
            except BaseException as error:
                EVIDENCE_ERRORS.append({"path": str(directory / "terminal.bin"), "error": repr(error)})
            if owned:
                record["returncode"] = owned[0].returncode
            record["ended"] = time.time()
            save(record_path, record)
            if not complete:
                raise CleanupIncomplete("helper session cleanup remains unproved")

    def test_ordinary_terminal_answers(self):
        for name, answer, expected in [
            ("mixed-case-whitespace-yes", b"  yEs \t\n", "true"),
            ("uppercase-single-y", b"Y\n", "true"),
            ("empty-yes", b"\n", "true"), ("no", b"n\n", "false"),
            ("other", b"other\n", "false"), ("eof", b"EOF", "false"),
        ]:
            with self.subTest(name=name):
                self.run_case(name, answer=answer, expected=expected)

    def test_pipe_input_controlling_terminal_output_preserves_no(self):
        self.run_case("pipe-input-terminal-output", pipe_input=True)

    def test_pipe_input_without_controlling_terminal_returns_nil(self):
        self.run_case("no-controlling-terminal", pipe_input=True, redirect_stdout=True,
                      redirect_stderr=True, no_terminal=True, expected="nil")

    def test_terminal_input_redirected_stdout_shows_prompt(self):
        self.run_case("terminal-input-redirected-stdout", redirect_stdout=True)

    def test_pipe_input_redirected_stdout_shows_controlling_terminal_prompt(self):
        self.run_case("pipe-input-redirected-stdout", pipe_input=True, redirect_stdout=True)

    def test_terminal_input_both_outputs_redirected_shows_prompt(self):
        self.run_case("terminal-input-both-outputs-redirected", redirect_stdout=True,
                      redirect_stderr=True)


if __name__ == "__main__":
    def request_cancel(signum, _frame):
        CANCELLED.append(signal.Signals(signum).name)
    for signum in (signal.SIGTERM, signal.SIGINT):
        signal.signal(signum, request_cancel)
    try:
        unittest.main(verbosity=2)
    finally:
        pending = cleanup_all()
        if pending:
            # No automatic retry loop. Explicit SIGUSR1 requests a fresh bounded
            # cleanup attempt; INT/TERM remain cancellation requests only.
            import threading
            retry = threading.Event()
            signal.signal(signal.SIGUSR1, lambda _sig, _frame: retry.set())
            notice = ("ATTENTION REQUIRED: unproved owned sessions " + repr(pending)
                      + "; retaining process/handles. SIGUSR1 requests bounded cleanup retry.\n")
            try:
                os.write(2, notice.encode())
            except OSError:
                pass
            while pending:
                if retry.wait(30):
                    retry.clear()
                    pending = cleanup_all()
        cleanup_compiler_temporaries()
        if EVIDENCE_ERRORS:
            raise SystemExit("confirmation evidence incomplete: " + repr(EVIDENCE_ERRORS))
