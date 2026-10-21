"""Connected prefix-gate lifecycle checks with no real child, socket or signal.

The actual two guarded tool modules and Server methods are used. Only external
Popen/HTTP/clock/log/diagnostic boundaries are finite fakes. Missing owned
cleanup must fail these assertions; no model or fixture executable is started.
"""
from contextlib import ExitStack, contextmanager
import builtins
import io
import os
from pathlib import Path
import signal
import socket
import subprocess
import sys
import time
import types
import unittest
from unittest.mock import patch


TOOLS = Path(__file__).resolve().parent
KINDS = ("persistent", "shared")
BASELINE_METHODS = (
    "test_ready_success_preserves_owned_child_log_and_launch_inputs",
    "test_normal_stop_cleans_owned_child_before_global_guard",
    "test_normal_stop_escalates_owned_wait_timeout",
    "test_shared_busy_classification_does_not_query_foreign_model",
    "test_exited_startup_failure_preserves_classification",
    "test_normal_stop_keeps_existing_global_failure_guard",
    "test_stopping_an_exited_child_is_repeatable_without_signals",
)


def forbidden(*args, **kwargs):
    raise AssertionError("unexpected real process, network, signal or sleep")


@contextmanager
def no_real_work():
    with ExitStack() as stack:
        for module, names in (
            (subprocess, ("Popen", "run", "call", "check_call", "check_output")),
            (socket, ("socket", "create_connection")),
            (os, ("kill", "killpg")),
            (signal, ("signal", "set_wakeup_fd")),
            (time, ("sleep",)),
        ):
            for name in names:
                stack.enter_context(patch.object(module, name, forbidden))
        yield


def actual_server_modules():
    """Use exact source bytes, avoiding cached bytecode or their guarded mains."""
    previous_path = sys.path[:]
    absent = object()
    previous = sys.modules.get("persistent_prefix_e2e", absent)
    modules = {}
    try:
        with no_real_work():
            for kind, name in (("persistent", "persistent_prefix_e2e"),
                               ("shared", "_prefix_cleanup_shared_fixture")):
                path = TOOLS / ("persistent_prefix_e2e.py" if kind == "persistent"
                                else "shared_prefix_e2e.py")
                module = types.ModuleType(name)
                module.__file__ = str(path)
                module.__package__ = ""
                if kind == "persistent":
                    sys.modules["persistent_prefix_e2e"] = module
                exec(compile(path.read_bytes(), str(path), "exec"), module.__dict__)
                modules[kind] = module
    finally:
        sys.path[:] = previous_path
        if previous is absent:
            sys.modules.pop("persistent_prefix_e2e", None)
        else:
            sys.modules["persistent_prefix_e2e"] = previous
    return modules


class FakeClock:
    def __init__(self, expire_on_sleep=False):
        self.now = 0.0
        self.calls = 0
        self.sleeps = []
        self.expire_on_sleep = expire_on_sleep

    def time(self):
        self.calls += 1
        if self.calls > 256:
            raise AssertionError("finite clock exhausted")
        return self.now

    def sleep(self, seconds):
        self.sleeps.append(seconds)
        self.now = 1000.0 if self.expire_on_sleep else self.now + seconds


class FakeLog:
    def __init__(self, timeline, close_error=None, text="fixture startup failure"):
        self.timeline = timeline
        self.close_error = close_error
        self.text = text
        self.closed = False
        self.close_attempts = 0

    def close(self):
        self.close_attempts += 1
        self.timeline.append(("close",))
        if self.close_error is not None:
            raise self.close_error
        self.closed = True


class FakeProcess:
    def __init__(self, timeline, returncode=None, waits=None, signal_error=None):
        self.timeline = timeline
        self.returncode = returncode
        self.waits = list(waits or [0])
        self.signal_error = signal_error
        self.events = []

    def poll(self):
        return self.returncode

    def send_signal(self, value):
        event = ("signal", value)
        self.events.append(event)
        self.timeline.append(event)
        if self.signal_error is not None:
            raise self.signal_error

    def wait(self, timeout):
        event = ("wait", timeout)
        self.events.append(event)
        self.timeline.append(event)
        if not self.waits:
            raise AssertionError("finite owned wait responses exhausted")
        result = self.waits.pop(0)
        if isinstance(result, BaseException):
            raise result
        self.returncode = result
        return result

    def kill(self):
        event = ("kill",)
        self.events.append(event)
        self.timeline.append(event)


class FailingDiagnostic:
    def write(self, value):
        raise OSError("fixture diagnostic writer failed")

    def flush(self):
        pass


class PrefixStartupCleanup(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.modules = actual_server_modules()

    @contextmanager
    def fixture(self, kind, *, returncode=None, http_error=None, popen_error=None,
                waits=None, signal_error=None, close_error=None, expire=False,
                busy_text=False, global_running=None, broken_diagnostic=False):
        timeline = []
        log = FakeLog(timeline, close_error,
                      "another model is already running" if busy_text else "fixture startup failure")
        process = FakeProcess(timeline, returncode, waits, signal_error)
        clock = FakeClock(expire)
        state = types.SimpleNamespace(module=self.modules[kind], log=log, process=process,
            timeline=timeline, clock=clock, popen_calls=[], http_calls=[], global_calls=0,
            stderr=FailingDiagnostic() if broken_diagnostic else io.StringIO())

        def fake_open(path, mode="r", **kwargs):
            if str(path) != "/fixture/server.log":
                raise AssertionError("unexpected production file access: " + str(path))
            return log if mode == "w" else io.StringIO(log.text)

        def fake_popen(arguments, **kwargs):
            state.popen_calls.append((arguments, kwargs))
            if popen_error is not None:
                raise popen_error
            return process

        def fake_http(*args, **kwargs):
            state.http_calls.append((args, kwargs))
            if len(state.http_calls) > 8:
                raise AssertionError("finite HTTP fixture exhausted")
            if http_error is not None:
                raise http_error
            return 200, b'{"version":"fixture"}'

        def fake_global_model():
            state.global_calls += 1
            timeline.append(("global",))
            if global_running is None:
                raise AssertionError("startup cleanup queried a foreign/global model")
            return global_running

        with no_real_work(), ExitStack() as stack:
            stack.enter_context(patch.dict(os.environ,
                {"HOME": "/fixture/home", "SLOTSTREAM_FIXTURE_SENTINEL": "kept",
                 "SLOTSTREAM_BENCH_DETAILS": "old"}, clear=True))
            stack.enter_context(patch.object(builtins, "open", fake_open))
            stack.enter_context(patch.object(subprocess, "Popen", fake_popen))
            stack.enter_context(patch.object(time, "time", clock.time))
            stack.enter_context(patch.object(time, "sleep", clock.sleep))
            stack.enter_context(patch.object(sys, "stderr", state.stderr))
            for module in self.modules.values():
                stack.enter_context(patch.object(module, "http", fake_http))
                stack.enter_context(patch.object(module, "model_process_running", fake_global_model))
            yield state

    @staticmethod
    def server(kind, state):
        binary = "/fixture/selected binary/slotstream"
        if kind == "persistent":
            return state.module.Server(binary, 11537, 10.0, "/fixture/cache", 2048,
                                       "/fixture/server.log")
        return state.module.Server(binary, 11537, 10.0, "/fixture/server.log",
            ["--prefix-cache-dir", "/fixture/cache", "--prefix-cache-min-tokens", "2048"])

    def assert_clean_owned(self, state, events):
        self.assertEqual(state.process.events, events)
        self.assertEqual(state.process.returncode, 0)
        self.assertTrue(state.log.closed)
        self.assertEqual(state.global_calls, 0)

    def test_ready_success_preserves_owned_child_log_and_launch_inputs(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                with self.fixture(kind) as state:
                    server = self.server(kind, state)
                    self.assertIsNone(server.wait_ready())
                self.assertEqual(state.process.events, [])
                self.assertIsNone(state.process.returncode)
                self.assertFalse(state.log.closed)
                self.assertEqual(state.log.close_attempts, 0)
                self.assertEqual(state.global_calls, 0)
                self.assertEqual(len(state.popen_calls), 1)
                arguments, kwargs = state.popen_calls[0]
                self.assertEqual(arguments, ["/fixture/selected binary/slotstream", "serve",
                    "--port", "11537", "--memory-gb", "10.0", "--prefix-cache-dir",
                    "/fixture/cache", "--prefix-cache-min-tokens", "2048"])
                self.assertIs(kwargs["stdout"], state.log)
                self.assertEqual(kwargs["stderr"], subprocess.STDOUT)
                self.assertIs(kwargs["start_new_session"], True)
                self.assertEqual(kwargs["env"], {"HOME": "/fixture/home",
                    "SLOTSTREAM_FIXTURE_SENTINEL": "kept", "SLOTSTREAM_BENCH_DETAILS": "1"})
                self.assertEqual(state.http_calls, [((11537, "GET", "/api/version"), {"timeout": 2})])

    def test_normal_stop_cleans_owned_child_before_global_guard(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                with self.fixture(kind, global_running=False) as state:
                    self.server(kind, state).stop()
                self.assertEqual(state.timeline, [("signal", signal.SIGINT), ("wait", 60),
                                                  ("close",), ("global",), ("global",)])
                self.assertEqual(state.process.returncode, 0)
                self.assertTrue(state.log.closed)

    def test_normal_stop_escalates_owned_wait_timeout(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                with self.fixture(kind, global_running=False,
                                  waits=[subprocess.TimeoutExpired("fixture", 60), 0]) as state:
                    self.server(kind, state).stop()
                self.assertEqual(state.process.events, [("signal", signal.SIGINT), ("wait", 60),
                                                       ("kill",), ("wait", 30)])
                self.assertTrue(state.log.closed)
                self.assertEqual(state.global_calls, 2)

    def test_shared_busy_classification_does_not_query_foreign_model(self):
        with self.fixture("shared", returncode=1, busy_text=True) as state:
            server = self.server("shared", state)
            with self.assertRaises(state.module.ModelSlotBusy):
                server.wait_ready()
        self.assertEqual(state.process.events, [])
        self.assertTrue(state.log.closed)
        self.assertEqual(state.global_calls, 0)

    def test_exited_startup_failure_preserves_classification(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                with self.fixture(kind, returncode=3) as state:
                    with self.assertRaisesRegex(RuntimeError, "server exited with 3"):
                        self.server(kind, state).wait_ready()
                self.assertEqual(state.process.events, [])
                self.assertEqual(state.global_calls, 0)

    def test_normal_stop_keeps_existing_global_failure_guard(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                with self.fixture(kind, returncode=0, global_running=True) as state:
                    with self.assertRaisesRegex(RuntimeError, "still running after stopping"):
                        self.server(kind, state).stop()
                self.assertEqual(state.process.events, [])
                self.assertTrue(state.log.closed)
                self.assertGreater(state.global_calls, 1)
                self.assertEqual(sum(state.clock.sleeps), 30)

    def test_stopping_an_exited_child_is_repeatable_without_signals(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                with self.fixture(kind, returncode=0, global_running=False) as state:
                    server = self.server(kind, state)
                    server.stop()
                    server.stop()
                self.assertEqual(state.process.events, [])
                self.assertTrue(state.log.closed)
                self.assertEqual(state.global_calls, 4)

    def test_readiness_timeout_cleans_owned_child_and_log(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                with self.fixture(kind, http_error=OSError("fixture not ready"), expire=True) as state:
                    with self.assertRaisesRegex(RuntimeError, "server not ready after 900 s"):
                        self.server(kind, state).wait_ready()
                self.assert_clean_owned(state, [("signal", signal.SIGINT), ("wait", 60)])

    def test_readiness_http_error_cleans_and_preserves_primary(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                primary = ValueError("fixture version parser failed")
                with self.fixture(kind, http_error=primary) as state:
                    with self.assertRaises(ValueError) as caught:
                        self.server(kind, state).wait_ready()
                self.assertIs(caught.exception, primary)
                self.assert_clean_owned(state, [("signal", signal.SIGINT), ("wait", 60)])

    def test_readiness_interrupt_cleans_and_preserves_primary(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                primary = KeyboardInterrupt("fixture interrupt, no real signal")
                with self.fixture(kind, http_error=primary) as state:
                    with self.assertRaises(KeyboardInterrupt) as caught:
                        self.server(kind, state).wait_ready()
                self.assertIs(caught.exception, primary)
                self.assert_clean_owned(state, [("signal", signal.SIGINT), ("wait", 60)])

    def test_readiness_signal_cleanup_failure_does_not_replace_primary(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                primary = ValueError("fixture primary readiness failure")
                with self.fixture(kind, http_error=primary,
                                  signal_error=OSError("fixture owned signal failed")) as state:
                    with self.assertRaises(ValueError) as caught:
                        self.server(kind, state).wait_ready()
                self.assertIs(caught.exception, primary)
                self.assertEqual(state.process.events, [("signal", signal.SIGINT)])
                self.assertTrue(state.log.closed)
                self.assertIn("fixture owned signal failed", state.stderr.getvalue())
                self.assertEqual(state.global_calls, 0)

    def test_readiness_log_cleanup_failure_does_not_replace_primary(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                primary = ValueError("fixture primary readiness failure")
                with self.fixture(kind, http_error=primary,
                                  close_error=OSError("fixture log close failed")) as state:
                    with self.assertRaises(ValueError) as caught:
                        self.server(kind, state).wait_ready()
                self.assertIs(caught.exception, primary)
                self.assertEqual(state.process.events, [("signal", signal.SIGINT), ("wait", 60)])
                self.assertEqual(state.process.returncode, 0)
                self.assertEqual(state.log.close_attempts, 1)
                self.assertIn("fixture log close failed", state.stderr.getvalue())
                self.assertEqual(state.global_calls, 0)

    def test_constructor_failure_closes_log_preserving_popen_error(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                primary = OSError("fixture Popen failed")
                with self.fixture(kind, popen_error=primary) as state:
                    with self.assertRaises(OSError) as caught:
                        self.server(kind, state)
                self.assertIs(caught.exception, primary)
                self.assertTrue(state.log.closed)
                self.assertEqual(len(state.popen_calls), 1)
                self.assertEqual(state.process.events, [])
                self.assertEqual(state.global_calls, 0)

    def test_constructor_log_cleanup_failure_does_not_replace_popen_error(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                primary = OSError("fixture primary Popen failed")
                with self.fixture(kind, popen_error=primary,
                                  close_error=OSError("fixture constructor log close failed")) as state:
                    with self.assertRaises(OSError) as caught:
                        self.server(kind, state)
                self.assertIs(caught.exception, primary)
                self.assertEqual(state.log.close_attempts, 1)
                self.assertIn("fixture constructor log close failed", state.stderr.getvalue())
                self.assertEqual(state.process.events, [])
                self.assertEqual(state.global_calls, 0)

    def test_readiness_cleanup_escalates_only_owned_wait_timeout(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                primary = ValueError("fixture readiness primary before escalation")
                with self.fixture(kind, http_error=primary,
                                  waits=[subprocess.TimeoutExpired("fixture", 60), 0]) as state:
                    with self.assertRaises(ValueError) as caught:
                        self.server(kind, state).wait_ready()
                self.assertIs(caught.exception, primary)
                self.assert_clean_owned(state, [("signal", signal.SIGINT), ("wait", 60),
                                                ("kill",), ("wait", 30)])

    def test_readiness_wait_cleanup_failure_does_not_replace_primary(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                primary = ValueError("fixture readiness primary before wait failure")
                with self.fixture(kind, http_error=primary,
                                  waits=[OSError("fixture owned wait failed")]) as state:
                    with self.assertRaises(ValueError) as caught:
                        self.server(kind, state).wait_ready()
                self.assertIs(caught.exception, primary)
                self.assertEqual(state.process.events, [("signal", signal.SIGINT), ("wait", 60)])
                self.assertTrue(state.log.closed)
                self.assertIn("fixture owned wait failed", state.stderr.getvalue())
                self.assertEqual(state.global_calls, 0)

    def test_primary_survives_failed_cleanup_diagnostic_write(self):
        for kind in KINDS:
            with self.subTest(kind=kind):
                primary = ValueError("fixture primary with unwritable diagnostic")
                with self.fixture(kind, http_error=primary, broken_diagnostic=True,
                                  close_error=OSError("fixture log close failed")) as state:
                    with self.assertRaises(ValueError) as caught:
                        self.server(kind, state).wait_ready()
                self.assertIs(caught.exception, primary)
                self.assertEqual(state.process.events, [("signal", signal.SIGINT), ("wait", 60)])
                self.assertEqual(state.process.returncode, 0)
                self.assertEqual(state.log.close_attempts, 1)
                self.assertEqual(state.global_calls, 0)


if __name__ == "__main__":
    unittest.main()
