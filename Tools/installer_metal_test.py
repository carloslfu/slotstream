"""Exercise the public installer's actual release-to-wheel selection block."""
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


INSTALLER = Path(__file__).resolve().parent.parent / "install.sh"
TEXT = INSTALLER.read_text()
SELECTION = TEXT[TEXT.index("# Match the downloaded release"):
                 TEXT.index('if [ -n "$WHEEL_URL" ]')]
LEGACY = "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
CURRENT = "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed"


class InstallerMetalSelection(unittest.TestCase):
    def select(self, digest, major):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            # Isolate only the hash observation; run the real selection logic.
            # Whole-archive/wheel hash failures have separate installer gates.
            observer = root / "shasum"
            observer.write_text('#!/bin/sh\n[ "$1" = -a ] && [ "$2" = 256 ] || exit 8\n'
                                '[ "$3" = "$STAGE/mlx.metallib" ] || exit 9\n'
                                'printf "%s  %s\\n" "$FIXTURE_DIGEST" "$3"\n')
            observer.chmod(0o755)
            env = os.environ | {"PATH": str(root) + os.pathsep + os.environ["PATH"],
                "STAGE": str(root / "downloaded release's bytes"), "MAJOR": str(major),
                "SLOTSTREAM_MACOS_MAJOR": str(major), "FIXTURE_DIGEST": digest}
            return subprocess.run(["sh", "-c", "set -eu\n" + SELECTION +
                '\nprintf "%s\\n%s\\n" "$WHEEL_URL" "$WHEEL_SHA"\n'],
                env=env, text=True, capture_output=True, timeout=10)

    def test_main_installer_still_selects_legacy_release_wheels(self):
        for major in [14, 15]:
            with self.subTest(major=major):
                result = self.select(LEGACY, major)
                self.assertEqual(result.returncode, 0, result.stderr)
                self.assertIn(f"mlx_metal-0.31.1-py3-none-macosx_{major}_0_arm64.whl", result.stdout)
                self.assertEqual(len(result.stdout.splitlines()[1]), 64)

    def test_new_release_selects_new_family(self):
        for major in [14, 15]:
            with self.subTest(major=major):
                result = self.select(CURRENT, major)
                self.assertEqual(result.returncode, 0, result.stderr)
                self.assertIn(f"mlx_metal-0.32.2-py3-none-macosx_{major}_0_arm64.whl", result.stdout)
                self.assertEqual(len(result.stdout.splitlines()[1]), 64)

    def test_unknown_release_is_refused_before_activation(self):
        for major in [14, 15]:
            result = self.select("0" * 64, major)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("existing install was not changed", result.stderr)

    def test_current_os_keeps_the_bundled_shader(self):
        result = self.select("not observed", 26)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout, "\n\n")


if __name__ == "__main__":
    unittest.main()
