"""Finite synthetic fixtures for the offline support-bundle exporter.

No model, server, network, discovery, or real user logs are involved. Import the
exporter only inside tests, so the first CLI acceptance fails as an assertion
while the new feature is absent.
"""
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import stat
import subprocess
import sys
import tempfile
import unittest
from unittest import mock
import zipfile


TOOL = Path(__file__).with_name("support_bundle.py")


class SupportBundleTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="slotstream-support-fixture-")
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.output = self.root / "bundle.zip"

    def source(self, name="synthetic.log", content=b"diagnostic healthy\n"):
        path = self.root / name
        path.write_bytes(content)
        return path

    def cli(self, logs, output=None):
        arguments = [sys.executable, "-B", str(TOOL)]
        for path in logs:
            arguments.extend(["--log", str(path)])
        arguments.extend(["--output", str(output or self.output)])
        return subprocess.run(arguments, cwd=self.root, capture_output=True,
                              text=True, timeout=5)

    def module(self):
        self.assertTrue(TOOL.is_file(), "offline support-bundle tool is absent")
        spec = importlib.util.spec_from_file_location("support_bundle_fixture", TOOL)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        return module

    def archive(self, output=None):
        with zipfile.ZipFile(output or self.output) as archive:
            manifest = json.loads(archive.read("manifest.json"))
            logs = [archive.read(row["member"]) for row in manifest["logs"]]
            return manifest, logs

    def assert_refused(self, logs, *, output=None):
        result = self.cli(logs, output)
        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        for path in list(logs) + [output or self.output]:
            self.assertNotIn(str(path), result.stdout + result.stderr)
            self.assertNotIn(Path(path).name, result.stdout + result.stderr)
        self.assertNotIn("fixture-secret", result.stdout + result.stderr)
        if output is None:
            self.assertFalse(self.output.exists())
        return result

    def test_cli_exports_only_explicit_sanitized_logs(self):
        raw = (b"phase=decode status=healthy\r\n"
               b"Authorization: Bearer fixture-secret\r\n"
               b"cache hit at /Users/fixture-person/run\r\n")
        first = self.source("private-source-name.log", raw)
        second = self.source("second-private-name.log", b"latency_ms=12\n")
        self.source("unselected.log", b"UNSELECTED-FIXTURE-CONTENT\n")
        result = self.cli([first, second])
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertTrue(self.output.is_file())
        self.assertEqual(first.read_bytes(), raw)
        self.assertEqual(second.read_bytes(), b"latency_ms=12\n")
        manifest, logs = self.archive()
        self.assertEqual(len(logs), 2)
        self.assertIn(b"phase=decode status=healthy\r\n", logs[0])
        self.assertIn(b"cache hit at ", logs[0])
        self.assertEqual(logs[1], b"latency_ms=12\n")
        public = json.dumps(manifest).encode() + b"".join(logs)
        for secret in (b"fixture-secret", b"fixture-person", first.name.encode(),
                       second.name.encode(), b"UNSELECTED-FIXTURE-CONTENT"):
            self.assertNotIn(secret, public)
        for path in (first, second, self.output):
            self.assertNotIn(str(path), result.stdout + result.stderr)
            self.assertNotIn(path.name, result.stdout + result.stderr)
        self.assertNotIn("fixture-secret", result.stdout + result.stderr)

    def test_manifest_and_zip_metadata_are_anonymous_and_hash_sanitized_bytes(self):
        raw = b"cookie: fixture-secret\nstatus=healthy\n"
        source = self.source("person-sensitive-name.log", raw)
        os.utime(source, (1_700_000_000, 1_700_000_000))
        result = self.cli([source])
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        manifest, logs = self.archive()
        self.assertEqual(set(manifest), {"schema_version", "policy_version", "logs"})
        self.assertEqual(manifest["schema_version"], 1)
        self.assertEqual(manifest["policy_version"], 1)
        row = manifest["logs"][0]
        self.assertEqual(set(row), {"member", "original_bytes", "sanitized_bytes",
                                    "sanitized_sha256", "redactions"})
        self.assertEqual(row["member"], "logs/001.txt")
        self.assertEqual(row["original_bytes"], len(raw))
        self.assertEqual(row["sanitized_bytes"], len(logs[0]))
        self.assertEqual(row["sanitized_sha256"], hashlib.sha256(logs[0]).hexdigest())
        self.assertNotIn(hashlib.sha256(raw).hexdigest(), json.dumps(manifest))
        self.assertEqual(row["redactions"], {"credential_lines": 1,
                         "private_key_blocks": 0, "urls": 0, "home_paths": 0})
        with zipfile.ZipFile(self.output) as archive:
            self.assertEqual(archive.namelist(), ["manifest.json", "logs/001.txt"])
            self.assertEqual(archive.comment, b"")
            for member in archive.infolist():
                self.assertEqual(member.date_time, (1980, 1, 1, 0, 0, 0))
                self.assertEqual(member.comment, b"")
                self.assertEqual(member.extra, b"")
                self.assertEqual((member.external_attr >> 16) & 0o777, 0o600)
        if os.name == "posix":
            self.assertEqual(stat.S_IMODE(self.output.stat().st_mode), 0o600)

    def test_credential_lines_case_delimiters_json_and_bearer(self):
        module = self.module()
        keys = ["Authorization", "proxy-AUTHORIZATION", "Cookie", "Set-Cookie",
                "X-API-Key", "api-key", "api_key", "password", "passwd", "pwd",
                "secret", "client_secret", "access_token", "refresh_token",
                "token", "id_token"]
        for key in keys:
            for line in (key + ": fixture-secret", key + "=fixture-secret",
                         '  "' + key + '": "fixture-secret",'):
                with self.subTest(line=line):
                    text, counts = module.sanitize("before\r\n" + line + "\r\nafter\n")
                    self.assertTrue(text.startswith("before\r\n"))
                    self.assertTrue(text.endswith("\r\nafter\n"))
                    self.assertNotIn("fixture-secret", text)
                    self.assertNotIn(key, text)
                    self.assertEqual(counts["credential_lines"], 1)
        text, counts = module.sanitize("trace says bEaReR fixture-secret here\n")
        self.assertNotIn("fixture-secret", text)
        self.assertEqual(counts["credential_lines"], 1)

    def test_private_key_blocks_including_unterminated_eof(self):
        module = self.module()
        for label in ("PRIVATE KEY", "RSA PRIVATE KEY", "EC PRIVATE KEY",
                      "OPENSSH PRIVATE KEY", "ENCRYPTED PRIVATE KEY"):
            for closed in (False, True):
                with self.subTest(label=label, closed=closed):
                    text = "before\n-----BEGIN " + label + "-----\nfixture-secret\n"
                    if closed:
                        text += "-----END " + label + "-----\nafter\n"
                    clean, counts = module.sanitize(text)
                    self.assertTrue(clean.startswith("before\n"))
                    self.assertNotIn("fixture-secret", clean)
                    self.assertNotIn("-----BEGIN", clean)
                    if closed:
                        self.assertTrue(clean.endswith("after\n"))
                    self.assertEqual(counts["private_key_blocks"], 1)

    def test_urls_homes_and_harmless_unicode_context(self):
        module = self.module()
        harmless = ("错误码=17 cache_hit=true token_count=12 passwordless=true\r\n"
                    "authorization_failed retry=2 bearer_count=3\n"
                    "cache=/var/tmp/slotstream-fixture/cache build=Tools/support_bundle.py\n")
        clean, counts = module.sanitize(harmless)
        self.assertEqual(clean, harmless)
        self.assertTrue(all(value == 0 for value in counts.values()))
        raw = ("GET HTTPS://fixture-user:fixture-secret@example.invalid/private-path?q=fixture-query#fixture-fragment\n"
               "GET http://example.invalid/fixture-other-secret\n"
               "home=/Users/fixture-person/project /home/fixture-linux/cache "
               "C:\\Users\\fixture-windows\\logs\n")
        clean, counts = module.sanitize(raw)
        for fragment in ("fixture-user", "fixture-secret", "example.invalid", "private-path",
                         "fixture-query", "fixture-fragment", "fixture-other-secret",
                         "fixture-person", "fixture-linux", "fixture-windows"):
            self.assertNotIn(fragment, clean)
        self.assertIn("/project", clean)
        self.assertIn("/cache", clean)
        self.assertIn("\\logs", clean)
        self.assertEqual(counts["urls"], 2)
        self.assertEqual(counts["home_paths"], 3)

    def test_count_limit_is_inclusive_and_empty_input_is_refused(self):
        self.assert_refused([])
        paths = [self.source("input-%02d.log" % number) for number in range(17)]
        result = self.cli(paths[:16])
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(len(self.archive()[0]["logs"]), 16)
        self.output.unlink()
        self.assert_refused(paths)

    def test_url_apostrophes_do_not_leave_private_suffixes(self):
        module = self.module()
        for url in ("https://example.invalid/reset/part'fixture-secret",
                    "http://example.invalid/reset?q=part'fixture-secret"):
            with self.subTest(url=url):
                clean, counts = module.sanitize("request=" + url + "\nstatus=healthy\n")
                self.assertNotIn("fixture-secret", clean)
                self.assertNotIn("example.invalid", clean)
                self.assertTrue(clean.endswith("\nstatus=healthy\n"))
                self.assertEqual(counts["urls"], 1)

    def test_actual_per_file_byte_limit_is_inclusive(self):
        source = self.source(content=b"x" * (1024 * 1024))
        result = self.cli([source])
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(self.archive()[0]["logs"][0]["original_bytes"], 1024 * 1024)
        self.output.unlink()
        source.write_bytes(b"x" * (1024 * 1024 + 1))
        self.assert_refused([source])

    def test_total_byte_limit_is_inclusive(self):
        module = self.module()
        self.assertEqual(module.MAX_TOTAL_BYTES, 8 * 1024 * 1024)
        first = self.source("first.log", b"x" * 12)
        second = self.source("second.log", b"y" * 12)
        with mock.patch.object(module, "MAX_TOTAL_BYTES", 24):
            module.create_bundle([first, second], self.output)
            self.assertEqual(len(self.archive()[0]["logs"]), 2)
            self.output.unlink()
            second.write_bytes(b"y" * 13)
            with self.assertRaises(ValueError):
                module.create_bundle([first, second], self.output)
            self.assertFalse(self.output.exists())

    def test_invalid_utf8_nul_missing_and_directory_are_refused(self):
        for raw in (b"status=healthy\xff", b"status=healthy\x00tail"):
            with self.subTest(raw=raw):
                self.assert_refused([self.source(content=raw)])
        self.assert_refused([self.root / "missing-private-name.log"])
        directory = self.root / "private-directory"
        directory.mkdir()
        self.assert_refused([directory])
        valid = self.source("valid.log")
        invalid = self.source("invalid.log", b"invalid\xff")
        self.assert_refused([valid, invalid])

    def test_cli_output_failure_does_not_echo_paths(self):
        source = self.source()
        output = self.root / "missing-private-directory" / "private-output.zip"
        self.assert_refused([source], output=output)
        self.assertFalse(output.exists())

    def test_cli_help_and_invalid_arguments_do_not_create_output(self):
        result = subprocess.run([sys.executable, "-B", str(TOOL), "--help"],
                                cwd=self.root, capture_output=True, text=True, timeout=5)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("--log", result.stdout)
        self.assertIn("--output", result.stdout)
        result = subprocess.run([sys.executable, "-B", str(TOOL),
                                 "--unexpected=fixture-secret"], cwd=self.root,
                                capture_output=True, text=True, timeout=5)
        self.assertNotEqual(result.returncode, 0)
        self.assertNotIn("fixture-secret", result.stdout + result.stderr)
        self.assertFalse(self.output.exists())

    @unittest.skipUnless(hasattr(os, "symlink"), "requires symlinks")
    def test_final_symlink_input_and_duplicate_inode_are_refused(self):
        source = self.source()
        linked = self.root / "private-link.log"
        linked.symlink_to(source)
        self.assert_refused([linked])
        self.assert_refused([source, source])
        hardlink = self.root / "private-hardlink.log"
        os.link(source, hardlink)
        self.assert_refused([source, hardlink])

    @unittest.skipUnless(hasattr(os, "mkfifo"), "requires FIFOs")
    def test_fifo_is_refused_without_waiting_for_a_writer(self):
        fifo = self.root / "private-fifo.log"
        os.mkfifo(fifo)
        self.assert_refused([fifo])  # cli() has a five-second timeout.

    def test_input_change_during_read_is_refused(self):
        module = self.module()
        source = self.source()
        original_read = os.read
        changed = []

        def changing_read(fd, size):
            data = original_read(fd, size)
            if not changed:
                changed.append(True)
                source.write_bytes(b"changed synthetic diagnostic with a different size\n")
            return data

        with mock.patch.object(module.os, "read", side_effect=changing_read):
            with self.assertRaises(ValueError):
                module.create_bundle([source], self.output)
        self.assertTrue(changed, "mutation fixture must reach the production read")
        self.assertFalse(self.output.exists())

    def test_existing_output_file_and_symlink_are_never_clobbered(self):
        source = self.source()
        self.output.write_bytes(b"existing archive fixture")
        identity = self.output.stat().st_ino
        self.assert_refused([source], output=self.output)
        self.assertEqual(self.output.read_bytes(), b"existing archive fixture")
        self.assertEqual(self.output.stat().st_ino, identity)
        self.output.unlink()
        target = self.source("private-target.zip", b"target fixture")
        self.output.symlink_to(target)
        self.assert_refused([source], output=self.output)
        self.assertTrue(self.output.is_symlink())
        self.assertEqual(target.read_bytes(), b"target fixture")
        target.unlink()
        self.assert_refused([source], output=self.output)
        self.assertTrue(self.output.is_symlink())

    def test_short_output_writes_are_completed(self):
        module = self.module()
        source = self.source()
        real_write = os.write
        calls = []

        def short_write(fd, data):
            calls.append(True)
            return real_write(fd, data[:37])

        with mock.patch.object(module.os, "write", side_effect=short_write):
            module.create_bundle([source], self.output)
        self.assertGreater(len(calls), 1)
        self.assertEqual(self.archive()[1], [source.read_bytes()])

    def test_partial_write_failure_or_interruption_cleans_own_output(self):
        module = self.module()
        source = self.source()
        real_write = os.write
        for failure in (OSError("synthetic write failure"), KeyboardInterrupt()):
            calls = []

            def failing_write(fd, data):
                calls.append(True)
                real_write(fd, data[:7])
                raise failure

            with self.subTest(failure=type(failure).__name__):
                with mock.patch.object(module.os, "write", side_effect=failing_write):
                    with self.assertRaises(type(failure)):
                        module.create_bundle([source], self.output)
                self.assertTrue(calls, "failure fixture must reach the production write")
                self.assertFalse(self.output.exists())

    def test_failed_write_retains_concurrently_replaced_output(self):
        module = self.module()
        source = self.source()
        replacement = self.source("replacement.zip", b"concurrent replacement fixture")
        identity = replacement.stat().st_ino
        calls = []

        def replacing_write(fd, data):
            calls.append(True)
            os.replace(replacement, self.output)
            raise OSError("synthetic write failure")

        with mock.patch.object(module.os, "write", side_effect=replacing_write):
            with self.assertRaises(OSError):
                module.create_bundle([source], self.output)
        self.assertTrue(calls, "replacement fixture must reach the production write")
        self.assertEqual(self.output.read_bytes(), b"concurrent replacement fixture")
        self.assertEqual(self.output.stat().st_ino, identity)


if __name__ == "__main__":
    unittest.main()
