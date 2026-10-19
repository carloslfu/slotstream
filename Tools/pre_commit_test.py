#!/usr/bin/env python3
"""Exercise the real projection hook using only tiny, private Git repositories."""
import hashlib
import json
import os
from pathlib import Path
import shutil
import signal
import subprocess
import sys
import tempfile
import unittest


SOURCE = Path(__file__).resolve().parents[1]
COPIED = (".githooks/pre-commit", "Tools/projections.py", "Tools/llms_full.sh")
OUTPUTS = ("llms-full.txt", "MEASUREMENTS.md", "PLAN.md")
TRACKED = "db/records/design/tracked.md"
WITHHELD = "db/records/design/withheld.md"
BODY = "WITHHELD_UNTRACKED_BODY"
TIMEOUT = 15


def record(body, order=1, doc="plan"):
    return (f"---\ndoc: {doc}\norder: {order}\nlevel: 1\n"
            f"title: Synthetic section {order}\n---\n{body}\n")


class PreCommitTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="slotstream-hook-test-")
        self.addCleanup(self.temporary.cleanup)
        self.base = Path(self.temporary.name).resolve()
        self.root = self.base / "repo"
        self.root.mkdir()
        for name in ("home", "xdg", "tmp", "templates"):
            (self.base / name).mkdir()
        # Construct from scratch: inherited GIT_*, credentials, global ignores,
        # shell startup hooks, Python injection and routing never enter children.
        self.env = {
            "PATH": os.pathsep.join((str(Path(sys.executable).parent), "/usr/bin", "/bin")),
            "HOME": str(self.base / "home"),
            "XDG_CONFIG_HOME": str(self.base / "xdg"),
            "TMPDIR": str(self.base / "tmp"),
            "LANG": "C", "LC_ALL": "C", "PYTHONDONTWRITEBYTECODE": "1",
            "GIT_CONFIG_NOSYSTEM": "1", "GIT_CONFIG_SYSTEM": os.devnull,
            "GIT_CONFIG_GLOBAL": os.devnull, "GIT_TERMINAL_PROMPT": "0",
            "GIT_ATTR_NOSYSTEM": "1", "GIT_ALLOW_PROTOCOL": "",
        }
        log_parent = os.environ.get("PRE_COMMIT_TEST_LOG_DIR")
        self.logs = Path(log_parent) / self._testMethodName if log_parent else None
        if self.logs:
            self.logs.mkdir(parents=True, exist_ok=False)
            self.addCleanup(self.archive)
        self.sequence = 0
        for name in COPIED:
            target = self.root / name
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(SOURCE / name, target)
        self.git("init", "--template=" + str(self.base / "templates"), ".")
        sources = self.run_command(["/bin/bash", "Tools/llms_full.sh", "--sources"]).stdout.splitlines()
        self.assertTrue(sources, "real generator must supply its source list")
        for name in sources:
            path = Path(name)
            self.assertFalse(path.is_absolute() or ".." in path.parts)
            self.write(name, "# Synthetic documentation\nTiny fixture only.\n")
        self.write(TRACKED, record("BASE_TRACKED_BODY"))
        self.write("db/records/measurements/tiny.md", record("TINY_MEASUREMENT", doc="measurements"))
        self.write("db/records/plan/.gitkeep", "")
        self.generate()
        self.git("add", "--", ".")
        self.git("commit", "-m", "Synthetic fixture baseline")
        self.assertEqual(self.git("status", "--porcelain").stdout, "")

    def run_command(self, argv, expected=0):
        # Every command, including all Git mutations, is confined to this fresh
        # TemporaryDirectory. A process group bounds hook/generator descendants.
        self.assertTrue(self.root.is_relative_to(self.base))
        self.sequence += 1
        process = subprocess.Popen(argv, cwd=self.root, env=self.env,
                                   stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                   text=True, start_new_session=True)
        timed_out = False
        try:
            stdout, stderr = process.communicate(timeout=TIMEOUT)
        except subprocess.TimeoutExpired:
            timed_out = True
            os.killpg(process.pid, signal.SIGKILL)
            stdout, stderr = process.communicate()
        except BaseException:
            if process.poll() is None:
                os.killpg(process.pid, signal.SIGKILL)
            process.communicate()
            raise
        result = subprocess.CompletedProcess(argv, process.returncode, stdout, stderr)
        if self.logs:
            prefix = self.logs / f"command-{self.sequence:03d}"
            prefix.with_suffix(".json").write_text(json.dumps({
                "argv": argv, "cwd": str(self.root), "environment": self.env,
                "timeout_seconds": TIMEOUT, "timed_out": timed_out,
                "returncode": result.returncode,
            }, indent=2) + "\n")
            prefix.with_suffix(".stdout").write_text(stdout)
            prefix.with_suffix(".stderr").write_text(stderr)
        self.assertFalse(timed_out, f"timeout: {argv!r}")
        if expected is not None:
            self.assertEqual(result.returncode, expected, f"{argv!r}\n{stdout}\n{stderr}")
        return result

    def git(self, *args, expected=0, hooks=False):
        return self.run_command([
            "/usr/bin/git", "-c", "user.name=Pybsama", "-c",
            "user.email=294532706+Pybsama@users.noreply.github.com",
            "-c", "commit.gpgsign=false", "-c", "tag.gpgsign=false",
            "-c", "credential.helper=", "-c", "core.fsmonitor=false",
            "-c", "core.hooksPath=" + (".githooks" if hooks else os.devnull),
            *args,
        ], expected=expected)

    def write(self, name, text):
        target = self.root / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding="utf-8")

    def generate(self):
        self.run_command(["/bin/bash", "Tools/llms_full.sh"])
        self.run_command([sys.executable, "Tools/projections.py"])

    def stage_change(self, coherent=False):
        self.write(TRACKED, record("STAGED_TRACKED_BODY"))
        self.git("add", "--", TRACKED)
        if coherent:
            self.generate()
            self.git("add", "--", *OUTPUTS)
        self.assertIn(TRACKED, self.git("diff", "--cached", "--name-only").stdout)

    def withheld(self, ignored=False):
        self.write(WITHHELD, record(BODY, order=2))
        if ignored:
            self.write(".git/info/exclude", WITHHELD + "\n")
            self.git("check-ignore", "--", WITHHELD)
        self.assertEqual(self.git("ls-files", "--stage", "--", WITHHELD).stdout, "")

    def state(self, label):
        state = {
            "index_entries": self.git("ls-files", "--stage").stdout,
            "index_outputs": {name: self.git("show", ":" + name).stdout for name in OUTPUTS},
            "worktree_outputs": {name: (self.root / name).read_text() for name in OUTPUTS},
            "tracked_worktree": (self.root / TRACKED).read_text(),
            "withheld_worktree": (self.root / WITHHELD).read_text() if (self.root / WITHHELD).exists() else None,
        }
        if self.logs:
            (self.logs / (label + ".json")).write_text(json.dumps(state, indent=2) + "\n")
        return state

    def archive(self):
        # This fixture contains only copied public scripts, tiny synthetic prose
        # and private Git objects; no real records or user configuration enter it.
        shutil.copytree(self.root, self.logs / "fixture-final")
        (self.logs / "copied-source-hashes.json").write_text(json.dumps({
            name: hashlib.sha256((self.root / name).read_bytes()).hexdigest() for name in COPIED
        }, indent=2) + "\n")

    def hook(self):
        return self.run_command(["/bin/bash", ".githooks/pre-commit"], expected=None)

    def refusal(self, ignored):
        self.stage_change()
        self.withheld(ignored)
        before = self.state("before")
        result = self.hook()
        after = self.state("after")
        self.assertEqual({"refused": result.returncode != 0, "state": after},
                         {"refused": True, "state": before},
                         "stale staged projections must refuse without importing withheld prose or mutating index/outputs")

    def valid_snapshot(self, ignored, commit=False):
        self.stage_change(coherent=True)
        self.withheld(ignored)
        before = self.state("before")
        self.assertNotIn(BODY, before["index_outputs"]["PLAN.md"])
        result = (self.git("commit", "-m", "Coherent synthetic snapshot", hooks=True, expected=None)
                  if commit else self.hook())
        after = self.state("after")
        committed = self.git("show", "HEAD:PLAN.md").stdout if commit and result.returncode == 0 else None
        committed_withheld = self.git("ls-tree", "HEAD", "--", WITHHELD).stdout if commit else ""
        if self.logs:
            (self.logs / "committed.json").write_text(json.dumps({
                "plan": committed, "withheld_tree_entry": committed_withheld,
                "head": self.git("rev-parse", "HEAD").stdout,
            }, indent=2) + "\n")
        self.assertEqual({"returncode": result.returncode, "state": after,
                          "committed_plan": committed, "withheld_tree_entry": committed_withheld},
                         {"returncode": 0, "state": before,
                          "committed_plan": before["index_outputs"]["PLAN.md"] if commit else None,
                          "withheld_tree_entry": ""})

    def test_ordinary_untracked_refuses_stale_snapshot(self):
        self.refusal(ignored=False)

    def test_ignored_untracked_refuses_stale_snapshot(self):
        self.refusal(ignored=True)

    def test_ordinary_untracked_preserves_valid_snapshot(self):
        self.valid_snapshot(ignored=False)

    def test_ignored_untracked_preserves_valid_commit(self):
        self.valid_snapshot(ignored=True, commit=True)

    def test_tracked_partial_preserves_worktree(self):
        self.stage_change(coherent=True)
        self.write(TRACKED, record("WITHHELD_TRACKED_BODY"))
        self.write("PLAN.md", "WITHHELD_WORKTREE_OUTPUT\n")
        before = self.state("before")
        result = self.hook()
        after = self.state("after")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(after, before)
        self.assertIn("STAGED_TRACKED_BODY", after["index_outputs"]["PLAN.md"])
        self.assertNotIn("WITHHELD_TRACKED_BODY", after["index_outputs"]["PLAN.md"])

    def test_normal_fast_path_regenerates(self):
        self.fast_path()

    def test_no_relevant_staged_source_returns_early(self):
        self.withheld(ignored=True)
        self.write("unrelated.txt", "Tiny unrelated staged file.\n")
        self.git("add", "--", "unrelated.txt")
        self.write("PLAN.md", "WITHHELD_WORKTREE_OUTPUT\n")
        before = self.state("before")
        result = self.hook()
        after = self.state("after")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(after, before)

    def test_irrelevant_untracked_file_keeps_fast_path(self):
        self.write("unrelated-private.txt", "TINY_UNRELATED_BODY\n")
        self.fast_path()
        self.assertEqual((self.root / "unrelated-private.txt").read_text(), "TINY_UNRELATED_BODY\n")
        self.assertEqual(self.git("ls-files", "--", "unrelated-private.txt").stdout, "")

    def fast_path(self):
        self.stage_change()
        before = self.state("before")
        result = self.hook()
        after = self.state("after")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertNotEqual(before["index_outputs"]["PLAN.md"], after["index_outputs"]["PLAN.md"])
        self.assertIn("STAGED_TRACKED_BODY", after["index_outputs"]["PLAN.md"])
        self.assertEqual(after["index_outputs"], after["worktree_outputs"])
        self.assertEqual(after["tracked_worktree"], before["tracked_worktree"])


if __name__ == "__main__":
    # Let the external recorder interrupt the suite while run_command still
    # gets to kill its separately bounded child process group.
    signal.signal(signal.SIGTERM, signal.default_int_handler)
    unittest.main(verbosity=2)
