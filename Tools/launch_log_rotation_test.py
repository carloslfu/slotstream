#!/usr/bin/env python3
"""Exercise launch logs without successfully spawning a background command."""
import hashlib
import json
import os
from pathlib import Path
import re
import stat
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parent.parent
PREVIOUS = b"previous launch\n\x00retained bytes\n"
OLDER = b"older launch\n"


class LaunchLogRotation(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if os.geteuid() == 0:
            raise RuntimeError("permission fixture requires an unprivileged user")
        cls.temporary = tempfile.TemporaryDirectory(prefix="slotstream-launch-logs-")
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.directory = Path(cls.temporary.name)
        source = (ROOT / "Sources/slotstream-cli/LaunchCommand.swift").read_text()
        pure = (ROOT / "Sources/Slotstream/CodingToolLaunch.swift").read_text()

        def exact_region(text, start, end):
            if text.count(start) != 1 or text.count(end) != 1:
                raise ValueError("launch log source boundary changed")
            begin = text.index(start)
            return text[begin:text.index(end, begin)]

        method = exact_region(source, "    static func spawnInBackground(",
                              "    /// The server being started")
        failure = exact_region(pure, "    package struct Failure:", "    package enum Tool:")
        local_failure = re.sub(
            r"(?m)^(\s*)package (?=(?:struct|let|init|var)\b)", r"\1", failure)
        harness = ("import Foundation\nimport Darwin\nenum CodingToolLaunch {\n"
                   + local_failure + "}\nstruct Launch {\n" + method + "}\n" + r'''
let missing = CommandLine.arguments[1]
guard !FileManager.default.fileExists(atPath: missing) else {
    fputs("fixture executable must not exist\n", stderr)
    exit(97)
}
var report: [String: Any]
do {
    let pid = try Launch.spawnInBackground(missing, arguments: [], log: CommandLine.arguments[2])
    // This cannot be reached with the owned missing path. Reap only a PID
    // returned by our own call if a fixture invariant ever fails.
    _ = kill(pid, SIGKILL)
    var status: Int32 = 0
    _ = waitpid(pid, &status, 0)
    report = ["returned": true, "unexpected_pid": Int(pid)]
} catch {
    report = ["returned": false, "error": String(describing: error)]
}
let data = try JSONSerialization.data(withJSONObject: report, options: [.sortedKeys])
print(String(decoding: data, as: UTF8.self))
''')
        swift = cls.directory / "main.swift"
        swift.write_text(harness)
        cls.binary = cls.directory / "log-boundary"
        try:
            subprocess.run(["swiftc", "-num-threads", "1", "-module-cache-path",
                            str(cls.directory / "module-cache"), str(swift),
                            "-o", str(cls.binary)], check=True, capture_output=True,
                           text=True, stdin=subprocess.DEVNULL, timeout=120)
        except subprocess.CalledProcessError as error:
            raise RuntimeError("isolated launch log compilation failed:\n"
                               + error.stdout + error.stderr) from error
        cls.source_hashes = {
            "spawn_method": hashlib.sha256(method.encode()).hexdigest(),
            "failure_declaration": hashlib.sha256(failure.encode()).hexdigest(),
            "generated_harness": hashlib.sha256(harness.encode()).hexdigest(),
            "compiled_binary": hashlib.sha256(cls.binary.read_bytes()).hexdigest(),
        }
        cls.missing = cls.directory / "owned missing tools" / "never-created-tool"
        cls.missing.parent.mkdir()
        cls.case_index = 0
        cls.observations = []

    @classmethod
    def tearDownClass(cls):
        print(json.dumps({"kind": "isolated-launch-log-rotation",
                          "source_sha256": cls.source_hashes,
                          "observations": cls.observations}, sort_keys=True), flush=True)

    def log_path(self, label, name="serve.log"):
        cls = type(self)
        cls.case_index += 1
        directory = self.directory / ("case-" + str(cls.case_index) + "-" + label)
        directory.mkdir(mode=0o700)
        return directory / name

    def write(self, path, data):
        path.write_bytes(data)
        path.chmod(0o600)

    def snapshot(self, path):
        try:
            info = path.lstat()
        except FileNotFoundError:
            return {"kind": "absent"}
        result = {"mode": stat.S_IMODE(info.st_mode), "inode": info.st_ino}
        if stat.S_ISLNK(info.st_mode):
            result.update(kind="symlink", target=os.readlink(path))
        elif stat.S_ISDIR(info.st_mode):
            result.update(kind="directory", children={
                p.name: self.snapshot(p) for p in sorted(path.iterdir())})
        elif stat.S_ISREG(info.st_mode):
            data = path.read_bytes()
            result.update(kind="file", size=len(data), sha256=hashlib.sha256(data).hexdigest())
        else:
            raise RuntimeError("unexpected object in owned log fixture")
        return result

    def probe(self, log, label):
        if os.path.lexists(self.missing):
            raise RuntimeError("owned fixture executable unexpectedly exists")
        backup = Path(str(log) + ".1")
        before = {"current": self.snapshot(log), "backup": self.snapshot(backup)}
        completed = subprocess.run([str(self.binary), str(self.missing), str(log)],
                                   capture_output=True, text=True, check=True,
                                   stdin=subprocess.DEVNULL, timeout=10)
        report = json.loads(completed.stdout)
        after = {"current": self.snapshot(log), "backup": self.snapshot(backup)}
        self.observations.append({"case": label, "probe": report,
                                  "before": before, "after": after})
        self.assertIs(report.get("returned"), False, report)
        self.assertNotIn("unexpected_pid", report)
        self.assertIsInstance(report.get("error"), str, report)
        self.assertFalse(os.path.lexists(self.missing))
        return report["error"], before, after

    def expect_missing_executable(self, message):
        self.assertIn("could not start", message)
        self.assertIn(str(self.missing), message)

    def expect_rotated(self, log):
        self.assertEqual(log.read_bytes(), b"")
        self.assertEqual(Path(str(log) + ".1").read_bytes(), PREVIOUS)
        self.assertEqual(stat.S_IMODE(log.stat().st_mode), 0o600)

    def test_absent_log_and_backup_reaches_only_missing_executable(self):
        log = self.log_path("absent")
        message, _, after = self.probe(log, "absent")
        self.expect_missing_executable(message)
        self.assertEqual(log.read_bytes(), b"")
        self.assertEqual(stat.S_IMODE(log.stat().st_mode), 0o600)
        self.assertEqual(after["backup"], {"kind": "absent"})

    def test_existing_log_rotates_to_missing_backup(self):
        log = self.log_path("no-backup")
        self.write(log, PREVIOUS)
        message, _, _ = self.probe(log, "no-backup")
        self.expect_missing_executable(message)
        self.expect_rotated(log)

    def test_regular_backup_is_replaced_with_previous_log(self):
        log = self.log_path("regular-backup")
        self.write(log, PREVIOUS)
        self.write(Path(str(log) + ".1"), OLDER)
        message, _, _ = self.probe(log, "regular-backup")
        self.expect_missing_executable(message)
        self.expect_rotated(log)

    def test_spaces_and_unicode_paths_preserve_log_bytes(self):
        for name in ("serve log with spaces.log", "上次启动日志.log"):
            with self.subTest(name=name):
                log = self.log_path("named", name)
                self.write(log, PREVIOUS)
                self.write(Path(str(log) + ".1"), OLDER)
                message, _, _ = self.probe(log, "named-" + name)
                self.expect_missing_executable(message)
                self.expect_rotated(log)

    def test_symbolic_log_preserves_link_and_target(self):
        log = self.log_path("symlink")
        target = log.parent / "previous-target"
        self.write(target, PREVIOUS)
        log.symlink_to(target.name)
        target_before = self.snapshot(target)
        message, _, after = self.probe(log, "symlink")
        self.expect_missing_executable(message)
        self.expect_rotated(log)
        self.assertFalse(log.is_symlink())
        self.assertEqual(after["backup"]["kind"], "symlink")
        self.assertEqual(after["backup"]["target"], target.name)
        self.assertEqual(self.snapshot(target), target_before)

    def test_hardlinked_logs_never_lose_the_previous_bytes(self):
        log = self.log_path("hardlink")
        backup = Path(str(log) + ".1")
        self.write(log, PREVIOUS)
        os.link(log, backup)
        message, before, after = self.probe(log, "hardlink")
        self.assertEqual(backup.read_bytes(), PREVIOUS)
        if "could not start" in message:
            # The old unlink+move safely rotates this input. Do not count
            # its different, data-preserving outcome as an old-code RED.
            self.expect_missing_executable(message)
            self.expect_rotated(log)
            self.assertNotEqual(after["current"]["inode"], after["backup"]["inode"])
        else:
            # rename of two names for one inode can be a successful no-op;
            # exclusive creation must refuse instead of truncating it.
            self.assertIn(str(log), message)
            self.assertEqual(after, before)

    def test_unwritable_parent_preserves_current_and_backup(self):
        log = self.log_path("readonly")
        self.write(log, PREVIOUS)
        self.write(Path(str(log) + ".1"), OLDER)
        log.parent.chmod(0o500)
        try:
            message, before, after = self.probe(log, "readonly-parent")
            self.assertEqual(after, before)
            self.assertIn(str(log), message)
            self.assertNotIn("could not start", message)
            self.assertEqual(stat.S_IMODE(log.parent.stat().st_mode), 0o500)
        finally:
            log.parent.chmod(0o700)

    def test_nonempty_backup_directory_is_not_recursively_removed(self):
        log = self.log_path("backup-directory")
        self.write(log, PREVIOUS)
        backup = Path(str(log) + ".1")
        backup.mkdir(mode=0o700)
        self.write(backup / "keep.txt", OLDER)
        message, before, after = self.probe(log, "nonempty-backup-directory")
        self.assertEqual(after, before)
        self.assertIn(str(log), message)
        self.assertNotIn("could not start", message)


if __name__ == "__main__":
    unittest.main(verbosity=2)
