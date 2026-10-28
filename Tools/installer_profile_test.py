"""Exercise the installer's exact profile selection/update block in private homes.

The full installer can write /usr/local/bin and open /dev/tty, even with a
private HOME. Select the complete inner profile branch without rewriting it;
this does not certify downloads, activation, or the outer PATH branch choice.
"""
import argparse
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest


INSTALLER = Path(__file__).resolve().parent.parent / "install.sh"
CANONICAL = 'export PATH="$HOME/.slotstream/bin:$PATH"'
START = '        PROFILE=""\n'
END = '        NOW="$BIN_DIR/slotstream"\n'


def profile_block(installer):
    text = installer.read_text()
    if text.count(START) != 1 or text.count(END) != 1:
        raise ValueError("installer profile branch markers are no longer unique")
    start = text.index(START)
    end = text.index(END, start) + len(END)
    return text[start:end]


class InstallerProfileSetup(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="slotstream-installer-profile-")
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name).resolve()
        self.block = profile_block(INSTALLER)

    def profiles(self, shell, initial):
        # A quote and a space expose accidental expansion/splitting of HOME.
        home = self.root / (shell + " home's files")
        home.mkdir()
        selected_name, other_name = (
            (".zshrc", ".bash_profile") if shell == "zsh"
            else (".bash_profile", ".zshrc"))
        selected = home / selected_name
        if initial is not None:
            selected.write_text(initial)
        other = home / other_name
        other.write_text("# Unselected profile must remain unchanged.\n")
        return home, selected, other

    def run_profile_step(self, shell, home, other):
        result = subprocess.run(
            ["/bin/sh", "-eu", "-c", self.block],
            cwd=home, stdin=subprocess.DEVNULL, capture_output=True, text=True,
            env={"HOME": str(home), "SHELL": "/bin/" + shell,
                 "BIN_DIR": str(home / ".slotstream/bin"),
                 "PATH": "/usr/bin:/bin:/usr/sbin:/sbin", "LC_ALL": "C"},
            timeout=5)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(result.stderr, "")
        self.assertEqual(other.read_text(), "# Unselected profile must remain unchanged.\n")
        return result.stdout

    def expect_single_addition(self, shell, initial):
        home, selected, other = self.profiles(shell, initial)
        first = self.run_profile_step(shell, home, other)
        expected = (initial or "") + "\n" + CANONICAL + "\n"
        self.assertEqual(selected.read_text(), expected)
        self.assertIn("added ~/.slotstream/bin to PATH", first)
        second = self.run_profile_step(shell, home, other)
        self.assertEqual(selected.read_text(), expected)
        self.assertIn("PATH already set up", second)

    def test_commented_canonical_line_gets_one_active_line(self):
        for shell in ("zsh", "bash"):
            with self.subTest(shell=shell):
                self.expect_single_addition(shell, "# " + CANONICAL + "\n")

    def test_active_canonical_line_is_left_unchanged(self):
        for shell in ("zsh", "bash"):
            with self.subTest(shell=shell):
                initial = CANONICAL + "\n"
                home, selected, other = self.profiles(shell, initial)
                for _ in range(2):
                    output = self.run_profile_step(shell, home, other)
                    self.assertEqual(selected.read_text(), initial)
                    self.assertIn("PATH already set up", output)

    def test_missing_profile_gets_one_active_line(self):
        for shell in ("zsh", "bash"):
            with self.subTest(shell=shell):
                self.expect_single_addition(shell, None)

    def test_unrelated_comment_mention_does_not_skip_setup(self):
        for shell in ("zsh", "bash"):
            with self.subTest(shell=shell):
                self.expect_single_addition(shell, "# Documentation: ~/.slotstream/bin\n")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--installer", type=Path, default=INSTALLER)
    options, remaining = parser.parse_known_args()
    INSTALLER = options.installer.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
