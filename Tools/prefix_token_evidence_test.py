"""Exercise the real prefix chat adapters with finite, model-free HTTP replies.

Only their guarded module definitions and chat functions run. No server, socket,
subprocess, readiness loop, model, or benchmark main is invoked.
"""

from contextlib import ExitStack
import json
from pathlib import Path
import sys
from types import ModuleType, SimpleNamespace
import unittest
from unittest import mock


TOOLS = Path(__file__).resolve().parent
MISSING = object()
ID_FIELDS = ("prompt_ids", "output_ids")
COUNT_FIELDS = ("prompt_eval_count", "eval_count")


def load_adapters():
    """Load actual definitions without invoking either guarded main function."""
    names = ("persistent_prefix_e2e", "shared_prefix_e2e")
    previous = {name: sys.modules.get(name, MISSING) for name in names}
    original_path = list(sys.path)
    modules = []
    try:
        for name in names:
            path = TOOLS / (name + ".py")
            module = ModuleType(name)
            module.__file__ = str(path)
            sys.modules[name] = module
            exec(compile(path.read_bytes(), str(path), "exec"), module.__dict__)
            modules.append(module)
        return modules
    finally:
        sys.path[:] = original_path
        for name, old in previous.items():
            if old is MISSING:
                sys.modules.pop(name, None)
            else:
                sys.modules[name] = old


def valid_frame():
    return {
        "prompt_eval_count": 3,
        "eval_count": 2,
        "message": {"role": "assistant", "content": "finite reply: 水"},
        "slotstream_benchmark": {
            "prompt_ids": [0, 2 ** 60, 7],
            "output_ids": [8, 9],
            "stats": {
                "reusedPrefixTokens": 1, "prefillTokens": 2,
                "prefillSeconds": 0.125, "firstTokenSeconds": 0.25,
                "requestSeconds": 0.5, "decodeTokens": 2,
                "finishReason": "length", "peakMemoryGB": 0.75,
                "sampledFootprint": {"peakBytes": 64},
                "persistentPrefix": {"saveOutcome": "saved"},
                "sharedPrefixHint": 512, "sharedPrefixCommon": 256,
                "sharedPrefixBoundaries": [256, 512],
                "sharedPrefixStores": 2, "sharedPrefixRefusals": 0,
                "sharedPrefixErrors": 0,
            },
        },
    }


class PrefixTokenEvidence(unittest.TestCase):
    def setUp(self):
        self.guards = ExitStack()
        self.addCleanup(self.guards.close)
        # Any accidental escape from the direct parser seam fails the fixture.
        for target in ("subprocess.Popen", "subprocess.run", "subprocess.call",
                       "subprocess.check_call", "subprocess.check_output",
                       "socket.socket", "socket.create_connection", "os.system",
                       "os.kill", "os.killpg", "time.sleep"):
            self.guards.enter_context(mock.patch(
                target, side_effect=AssertionError("real work forbidden: " + target)))
        self.adapters = load_adapters()

    def call_chat(self, adapter, frame, status=200):
        messages = [{"role": "system", "content": "Keep source order."},
                    {"role": "user", "content": "Finite question: 雨"}]
        payload = json.dumps(frame, ensure_ascii=False).encode("utf-8")
        clock = SimpleNamespace(time=mock.Mock(side_effect=(100.0, 100.125)))
        http = mock.Mock(return_value=(status, payload))
        with mock.patch.object(adapter, "http", http), mock.patch.object(adapter, "time", clock):
            try:
                return adapter.chat(11537, messages, 4)
            finally:
                http.assert_called_once_with(11537, "POST", "/api/chat", {
                    "model": adapter.MODEL, "messages": messages,
                    "stream": False, "think": False,
                    "options": {"temperature": 0, "seed": 7, "num_predict": 4},
                })
                self.assertEqual(clock.time.call_count, 2)

    def test_valid_ids_preserve_request_and_result(self):
        for adapter in self.adapters:
            with self.subTest(adapter=adapter.__name__):
                frame = valid_frame()
                expected = {
                    "wall_seconds": 0.125, "prompt_tokens": 3,
                    "reused_prefix_tokens": 1, "prefill_tokens": 2,
                    "prefill_seconds": 0.125, "first_token_seconds": 0.25,
                    "request_seconds": 0.5, "decode_tokens": 2,
                    "finish_reason": "length", "peak_memory_gb": 0.75,
                    "persistent": {"saveOutcome": "saved"},
                    "prompt_ids": [0, 2 ** 60, 7], "output_ids": [8, 9],
                    "content": "finite reply: 水",
                }
                if adapter.__name__ == "persistent_prefix_e2e":
                    expected["request_sampled_peak_bytes"] = 64
                else:
                    expected.update(shared_hint=512, shared_common=256,
                                    shared_boundaries=[256, 512], shared_stores=2,
                                    shared_refusals=0, shared_errors=0)
                self.assertEqual(self.call_chat(adapter, frame), expected)

    def test_zero_output_is_valid(self):
        for adapter in self.adapters:
            with self.subTest(adapter=adapter.__name__):
                frame = valid_frame()
                frame["eval_count"] = 0
                frame["slotstream_benchmark"]["output_ids"] = []
                frame["slotstream_benchmark"]["stats"].update(decodeTokens=0, finishReason="stop")
                frame["message"]["content"] = ""
                turn = self.call_chat(adapter, frame)
                self.assertEqual(turn["output_ids"], [])
                self.assertEqual(turn["decode_tokens"], 0)
                self.assertEqual(turn["finish_reason"], "stop")

    def test_zero_prompt_and_output_are_valid(self):
        for adapter in self.adapters:
            with self.subTest(adapter=adapter.__name__):
                frame = valid_frame()
                frame.update(prompt_eval_count=0, eval_count=0)
                frame["slotstream_benchmark"].update(prompt_ids=[], output_ids=[])
                frame["slotstream_benchmark"]["stats"].update(
                    reusedPrefixTokens=0, prefillTokens=0, decodeTokens=0, finishReason="length")
                frame["message"]["content"] = ""
                turn = self.call_chat(adapter, frame)
                self.assertEqual((turn["prompt_ids"], turn["output_ids"]), ([], []))
                self.assertEqual(turn["prompt_tokens"], 0)

    def test_empty_visible_text_keeps_raw_ids(self):
        for adapter in self.adapters:
            with self.subTest(adapter=adapter.__name__):
                frame = valid_frame()
                frame["message"]["content"] = ""
                frame["slotstream_benchmark"]["stats"]["finishReason"] = "stop"
                turn = self.call_chat(adapter, frame)
                self.assertEqual(turn["content"], "")
                self.assertEqual(turn["output_ids"], [8, 9])

    def test_distinct_ids_with_matching_counts_remain_distinct(self):
        for adapter in self.adapters:
            with self.subTest(adapter=adapter.__name__):
                first, second = valid_frame(), valid_frame()
                second["slotstream_benchmark"].update(prompt_ids=[0, 2 ** 60, 6], output_ids=[9, 8])
                a, b = self.call_chat(adapter, first), self.call_chat(adapter, second)
                self.assertNotEqual(a["prompt_ids"], b["prompt_ids"])
                self.assertNotEqual(a["output_ids"], b["output_ids"])

    def test_non_200_keeps_status_failure(self):
        for adapter in self.adapters:
            with self.subTest(adapter=adapter.__name__):
                with self.assertRaisesRegex(RuntimeError, "/api/chat returned 503"):
                    self.call_chat(adapter, {}, status=503)

    def test_rejects_missing_or_null_ids(self):
        for adapter in self.adapters:
            for field in ID_FIELDS:
                for value in (MISSING, None):
                    with self.subTest(adapter=adapter.__name__, field=field, value=repr(value)):
                        frame = valid_frame()
                        if value is MISSING:
                            del frame["slotstream_benchmark"][field]
                        else:
                            frame["slotstream_benchmark"][field] = value
                        with self.assertRaises((ValueError, RuntimeError)):
                            self.call_chat(adapter, frame)

    def test_rejects_non_list_ids(self):
        for adapter in self.adapters:
            for field in ID_FIELDS:
                for value in ("0,1", {"0": 1}, 3, True):
                    with self.subTest(adapter=adapter.__name__, field=field, value=value):
                        frame = valid_frame()
                        frame["slotstream_benchmark"][field] = value
                        with self.assertRaises((ValueError, RuntimeError)):
                            self.call_chat(adapter, frame)

    def test_rejects_invalid_token_members(self):
        for adapter in self.adapters:
            for field, count in zip(ID_FIELDS, COUNT_FIELDS):
                for value in (True, -1, 0.5, "7", None, [], {}):
                    with self.subTest(adapter=adapter.__name__, field=field, value=value):
                        frame = valid_frame()
                        frame["slotstream_benchmark"][field] = [value]
                        frame[count] = 1  # Isolate member validation from length validation.
                        with self.assertRaises((ValueError, RuntimeError)):
                            self.call_chat(adapter, frame)

    def test_rejects_missing_or_invalid_counts(self):
        for adapter in self.adapters:
            for field in COUNT_FIELDS:
                for value in (MISSING, None, True, False, -1, 1.0, 0.5, "3", []):
                    with self.subTest(adapter=adapter.__name__, field=field, value=repr(value)):
                        frame = valid_frame()
                        if value is MISSING:
                            del frame[field]
                        else:
                            frame[field] = value
                            # A bool or whole-valued float must not pass merely
                            # because Python considers it equal to an integer.
                            if type(value) is bool or type(value) is float and value == 1.0:
                                ids = ID_FIELDS[COUNT_FIELDS.index(field)]
                                frame["slotstream_benchmark"][ids] = [7] if value else []
                        with self.assertRaises((ValueError, RuntimeError)):
                            self.call_chat(adapter, frame)

    def test_rejects_count_mismatches(self):
        for adapter in self.adapters:
            for field, count in zip(ID_FIELDS, COUNT_FIELDS):
                for empty in (False, True):
                    with self.subTest(adapter=adapter.__name__, field=field, empty=empty):
                        frame = valid_frame()
                        if empty:
                            frame["slotstream_benchmark"][field] = []
                        else:
                            frame[count] += 1
                        with self.assertRaises((ValueError, RuntimeError)):
                            self.call_chat(adapter, frame)

    def test_two_missing_id_responses_cannot_be_equality_evidence(self):
        for adapter in self.adapters:
            for content in ("first response", "different response"):
                with self.subTest(adapter=adapter.__name__, content=content):
                    frame = valid_frame()
                    details = frame["slotstream_benchmark"]
                    del details["prompt_ids"], details["output_ids"]
                    frame["message"]["content"] = content
                    # Reject each real adapter result before two absent values can
                    # be treated as token equality. This does not run a live gate.
                    with self.assertRaises((ValueError, RuntimeError)):
                        self.call_chat(adapter, frame)


if __name__ == "__main__":
    unittest.main()
