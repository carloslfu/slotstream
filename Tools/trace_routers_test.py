"""Exercise the real trace-output block with NumPy; no MLX/model execution."""
import ast
import contextlib
import io
import json
import os
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest

import numpy as np


SCRIPT = Path(__file__).with_name("trace_routers.py")


def output_code():
    # Importing this producer would require MLX. Select its entire final output
    # block instead, preserving the actual statements and traceback locations.
    tree = ast.parse(SCRIPT.read_text(encoding="utf-8"), filename=str(SCRIPT))
    main = next(node for node in tree.body
                if isinstance(node, ast.FunctionDef) and node.name == "main")
    argument = ast.dump(ast.parse("args.out", mode="eval").body)
    starts = [index for index, node in enumerate(main.body)
              if isinstance(node, ast.Assign)
              and [getattr(target, "id", None) for target in node.targets] == ["out"]
              and isinstance(node.value, ast.BoolOp) and isinstance(node.value.op, ast.Or)
              and ast.dump(node.value.values[0]) == argument]
    if len(starts) != 1:
        raise AssertionError("expected one final trace-output block")
    tail = ast.Module(body=main.body[starts[0]:], type_ignores=[])
    return compile(tail, str(SCRIPT), "exec")


class RouterTraceOutputChecks(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.code = output_code()

    def save(self, requested, expected, *, absolute=False, existing_parent=False,
             reported=None):
        # Valid routing IDs and the actual producer's 48-layer/top10 layout.
        wanted = (np.arange(3 * 48 * 10, dtype=np.int16) % 512).reshape(3, 48, 10)
        prefill = (np.arange(2 * 48 * 10, dtype=np.int16) % 512).reshape(2, 48, 10)
        traces = {"chat": [wanted[:1].copy(), wanted[1:].copy()],
                  "chat_prefill": [prefill.copy()]}
        with tempfile.TemporaryDirectory(prefix="slotstream-trace-output-") as folder:
            root = Path(folder)
            target = root / expected
            supplied = str(target) if absolute else requested
            sentinel = target.parent / "keep.txt"
            if existing_parent:
                target.parent.mkdir(parents=True)
                sentinel.write_text("keep existing files", encoding="utf-8")

            def check_archive():
                self.assertTrue(target.is_file())
                self.assertEqual(list(root.rglob("*.npz")), [target])
                with np.load(target, allow_pickle=False) as archive:
                    self.assertEqual(set(archive.files), {"chat", "chat_prefill", "meta"})
                    self.assertEqual(archive["chat"].dtype, np.dtype("int16"))
                    self.assertEqual(archive["chat_prefill"].dtype, np.dtype("int16"))
                    np.testing.assert_array_equal(archive["chat"], wanted)
                    np.testing.assert_array_equal(archive["chat_prefill"], prefill)
                    self.assertEqual(archive["meta"].dtype, np.dtype("uint8"))
                    self.assertEqual(json.loads(archive["meta"].tobytes().decode("utf-8")),
                                     {"model": "fixture-model", "n_layers": 48,
                                      "top_k": 10, "workloads": ["chat"]})

            namespace = {"args": SimpleNamespace(out=supplied, workload="chat", model="fixture-model"),
                         "all_traces": traces, "n_layers": 48, "top_k": 10, "wls": ["chat"],
                         "np": np, "json": json, "os": os}
            previous = Path.cwd()
            output = io.StringIO()
            try:
                os.chdir(root)
                with contextlib.redirect_stdout(output):
                    try:
                        exec(self.code, namespace)
                    except OSError as error:
                        # Preserve the real producer traceback as exception
                        # context; an ordinary output filename must succeed.
                        note = ""
                        if reported is not None:
                            check_archive()
                            note = f"; verified archive {expected!r}"
                        self.fail(f"trace output failed for {supplied!r}: {error}{note}")
            finally:
                os.chdir(previous)
            check_archive()
            visible = supplied if supplied is not None else "bench/traces/chat.npz"
            if reported is not None:
                visible = reported
            self.assertIn(f"wrote {visible} (", output.getvalue())
            if existing_parent:
                self.assertEqual(sentinel.read_text(encoding="utf-8"), "keep existing files")

    def test_absolute_output_path(self):
        self.save(None, "absolute/trace.npz", absolute=True)

    def test_bare_output_filename(self):
        self.save("trace.npz", "trace.npz")

    def test_bare_unicode_output_filename(self):
        self.save("路由 轨迹.npz", "路由 轨迹.npz")

    def test_default_output_path(self):
        self.save(None, "bench/traces/chat.npz")

    def test_dot_relative_output_path(self):
        self.save("./trace.npz", "trace.npz")

    def test_existing_output_parent(self):
        self.save("existing/trace.npz", "existing/trace.npz", existing_parent=True)

    def test_nested_relative_output_path(self):
        self.save("new/nested/trace.npz", "new/nested/trace.npz")

    def test_other_extension_output_filename(self):
        self.save("trace.data", "trace.data.npz", reported="trace.data.npz")

    def test_suffixless_output_filename(self):
        self.save("trace", "trace.npz", reported="trace.npz")

    def test_suffixless_output_parent(self):
        self.save("new/nested/trace", "new/nested/trace.npz", reported="new/nested/trace.npz")

    def test_suffixless_unicode_output_filename(self):
        self.save("路由 轨迹", "路由 轨迹.npz", reported="路由 轨迹.npz")

    def test_unicode_output_parent(self):
        self.save("路由 目录/trace.npz", "路由 目录/trace.npz")

    def test_uppercase_npz_output_filename(self):
        self.save("trace.NPZ", "trace.NPZ.npz", reported="trace.NPZ.npz")


if __name__ == "__main__":
    unittest.main()
