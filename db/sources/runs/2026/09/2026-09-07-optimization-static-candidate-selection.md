---
type: run
id: 01m1wsf6aj000spkpw4e540ny5
created: 2026-09-07T01:59:33.458250+00:00
updated: 2026-09-07T01:59:33.737321+00:00
summary: Static acceptance uses the exact selected candidate
binary: Fixture executables only; no native model or compiler
captured_at: 2026-09-07
command: python3 Tools/static_gates_binary_test.py; bash -n Tools/static_gates.sh
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Static acceptance uses the exact selected candidate
tool: Actual Bash entry point with model-free fixture tools
---
# Static acceptance must use the chosen candidate

The real static entry point hardcoded .build/release/slotstream for its runtime
and pull checks, and did not translate SLOTSTREAM_TEST_BINARY into the BIN used
by the nested planner gates. A requested frozen candidate could therefore be
ignored, including when its file was missing. V225 executes the original shell
against small fixture tools and preserves six failing selection/forwarding
contracts. The requested-frozen case selected release/release/release; the
legacy-BIN case selected release/release/legacy. The fixtures load no model,
GPU, compiler or network service.

V226 resolves SLOTSTREAM_TEST_BINARY first, then legacy BIN, then the unchanged
release default. It exports both names and quotes both direct native invocations.
The durable six-case regression suite is part of static_gates.sh. It executes
the actual shell entry point in temporary fixture repositories, covering the
default, both overrides and their precedence, paths with spaces, a missing
candidate and a selected-binary failure with no fallback. All six cases pass
on the applied source, as does shell syntax. The underlying model/native static
battery remains unrun; these fixtures certify selection and failure propagation
only. All143runtime source hashes remain exact to V215 and all three frozen
component/serving driver hashes remain unchanged. No optimizer default,
context driver, frozen performance protocol or resource limit changed.

## /tmp/slotstream-optimization-execution/static-binary-v225/after-stderr.txt

SHA-256 `edb36c87de1d69fd9b45eba1a0d50d69107c0eaf90aa7915608b9588c7a80f80`; 104 bytes.

````text
......
----------------------------------------------------------------------
Ran 6 tests in 5.594s

OK

````

## /tmp/slotstream-optimization-execution/static-binary-v225/after-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/static-binary-v225/after-tests.json

SHA-256 `327976277ced7a3b4589272c9ab101b4d93971dcd63c2f66065114998ab78e0f`; 309 bytes.

````text
{
  "command": [
    "python3",
    "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py",
    "/tmp/slotstream-optimization-execution/static-binary-v225/after.sh"
  ],
  "exit_code": 0,
  "seconds": 5.635267666,
  "classification": "six model-free shell binary-selection tests"
}

````

## /tmp/slotstream-optimization-execution/static-binary-v225/after.sh

SHA-256 `6eaba7328806c54fd7de7f2410e46259bd7fe0d2f40229209a0a3b5712c3a015`; 1019 bytes.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/process_cleanup_checks.py
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

"$BIN" runtime-check
"$BIN" pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"

````

## /tmp/slotstream-optimization-execution/static-binary-v225/before-stderr.txt

SHA-256 `ea4ca526b231a853605d048707404b0a5ed535264ec28a6adb03e74eb7a80af5`; 4968 bytes.

````text
FFFFFF
======================================================================
FAIL: test_default_release_is_used_and_forwarded (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py", line 81, in test_default_release_is_used_and_forwarded
    self.expect_selected({}, 'release')
  File "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py", line 77, in expect_selected
    self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
AssertionError: False is not true : [{'selected': 'release', 'arguments': ['runtime-check'], 'BIN': None, 'SLOTSTREAM_TEST_BINARY': None}, {'selected': 'release', 'arguments': ['pull-check'], 'BIN': None, 'SLOTSTREAM_TEST_BINARY': None}, {'selected': 'release', 'arguments': ['doctor', '--json'], 'BIN': None, 'SLOTSTREAM_TEST_BINARY': None}]

======================================================================
FAIL: test_frozen_override_takes_precedence_over_legacy_bin (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py", line 90, in test_frozen_override_takes_precedence_over_legacy_bin
    self.expect_selected({'BIN': str(self.binaries['legacy']),
  File "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py", line 73, in expect_selected
    self.assertEqual([row['selected'] for row in rows], [name]*3)
AssertionError: Lists differ: ['release', 'release', 'legacy'] != ['frozen', 'frozen', 'frozen']

First differing element 0:
'release'
'frozen'

- ['release', 'release', 'legacy']
+ ['frozen', 'frozen', 'frozen']

======================================================================
FAIL: test_frozen_override_with_spaces_is_used_and_forwarded (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py", line 87, in test_frozen_override_with_spaces_is_used_and_forwarded
    self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')
  File "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py", line 73, in expect_selected
    self.assertEqual([row['selected'] for row in rows], [name]*3)
AssertionError: Lists differ: ['release', 'release', 'release'] != ['frozen', 'frozen', 'frozen']

First differing element 0:
'release'
'frozen'

- ['release', 'release', 'release']
+ ['frozen', 'frozen', 'frozen']

======================================================================
FAIL: test_legacy_bin_override_is_used_and_forwarded (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py", line 84, in test_legacy_bin_override_is_used_and_forwarded
    self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')
  File "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py", line 73, in expect_selected
    self.assertEqual([row['selected'] for row in rows], [name]*3)
AssertionError: Lists differ: ['release', 'release', 'legacy'] != ['legacy', 'legacy', 'legacy']

First differing element 0:
'release'
'legacy'

- ['release', 'release', 'legacy']
?   --   ^^    --   ^^

+ ['legacy', 'legacy', 'legacy']
?     + ^^      + ^^


======================================================================
FAIL: test_missing_selected_binary_fails_without_fallback (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py", line 95, in test_missing_selected_binary_fails_without_fallback
    self.assertNotEqual(p.returncode, 0)
AssertionError: 0 == 0

======================================================================
FAIL: test_selected_binary_failure_stops_without_fallback (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py", line 102, in test_selected_binary_failure_stops_without_fallback
    self.assertEqual([row['selected'] for row in rows], ['frozen'])
AssertionError: Lists differ: ['release'] != ['frozen']

First differing element 0:
'release'
'frozen'

- ['release']
+ ['frozen']

----------------------------------------------------------------------
Ran 6 tests in 6.905s

FAILED (failures=6)

````

## /tmp/slotstream-optimization-execution/static-binary-v225/before-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/static-binary-v225/before-tests.json

SHA-256 `6240e3e45eeed144a4efba6c625cef7760ef3f6fa0c320a9dbdd8983952879c0`; 310 bytes.

````text
{
  "command": [
    "python3",
    "/tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py",
    "/tmp/slotstream-optimization-execution/static-binary-v225/before.sh"
  ],
  "exit_code": 1,
  "seconds": 6.948600375,
  "classification": "six model-free shell binary-selection tests"
}

````

## /tmp/slotstream-optimization-execution/static-binary-v225/before.sh

SHA-256 `aff70a1d15c50632f702a9f9349f6a6ebee550b3a092624acf0fcd7c47cf6c93`; 951 bytes.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/process_cleanup_checks.py
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

.build/release/slotstream runtime-check
.build/release/slotstream pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"

````

## /tmp/slotstream-optimization-execution/static-binary-v225/fix.patch

SHA-256 `030d83c275dac738456e4b1e8c232498942f8c0b5603909a2793c7d3c000effe`; 602 bytes.

````text
--- a/Tools/static_gates.sh
+++ b/Tools/static_gates.sh
@@ -2,6 +2,8 @@
 # Fast, weights-free checks suitable for every pull request and release.
 set -euo pipefail
 cd "$(dirname "$0")/.."
+BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
+export BIN SLOTSTREAM_TEST_BINARY="$BIN"
 
 for f in install.sh Tools/*.sh .githooks/*; do
   bash -n "$f"
@@ -23,8 +25,8 @@
   exit 1
 fi
 
-.build/release/slotstream runtime-check
-.build/release/slotstream pull-check
+"$BIN" runtime-check
+"$BIN" pull-check
 python3 Tools/slotpack/checks.py
 Tools/planner_gates.sh
 Tools/installer_gates.sh

````

## /tmp/slotstream-optimization-execution/static-binary-v225/manifest.json

SHA-256 `f1dfbf222b1b8da155aa12cac2d23d455a4fed033633a1c51ac14fdf4b71615c`; 401 bytes.

````text
{
  "path": "Tools/static_gates.sh",
  "before_sha256": "aff70a1d15c50632f702a9f9349f6a6ebee550b3a092624acf0fcd7c47cf6c93",
  "after_sha256": "6eaba7328806c54fd7de7f2410e46259bd7fe0d2f40229209a0a3b5712c3a015",
  "state": "DRAFT_NOT_APPLIED",
  "problem": "Static battery hardcodes old release executable for runtime/pull and never forwards SLOTSTREAM_TEST_BINARY to nested BIN-based planner gates."
}

````

## /tmp/slotstream-optimization-execution/static-binary-v225/test_static_binary.py

SHA-256 `cb58291abab3d08183aa4069f04691952a694b763ac7b1c318e608b1b14afbc2`; 5150 bytes.

````text
"""Execute the real static entry point against tiny, model-free fixture tools."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(sys.argv.pop(1)).resolve()


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # The nested planner gate uses BIN just like the production script.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/coverage_ratchet_test.py', 'Tools/process_cleanup_checks.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
        self.write('bench/parity31/fixture.txt', 'exact fixture\n')
        sha = hashlib.sha256((self.root/'bench/parity31/fixture.txt').read_bytes()).hexdigest()
        self.write('bench/parity31/SHA256SUMS', f'{sha}  fixture.txt\n')
        self.binaries = {}
        for name, path in [('release', '.build/release/slotstream'),
                           ('legacy', 'legacy binary/slotstream'),
                           ('frozen', 'frozen binary/slotstream')]:
            self.binaries[name] = self.root/path
            self.write(path, f'''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:],
        'BIN': os.environ.get('BIN'), 'SLOTSTREAM_TEST_BINARY': os.environ.get('SLOTSTREAM_TEST_BINARY')}})+'\\n')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
''')

    def write(self, relative, text):
        path = self.root/relative
        path.write_text(text)
        path.chmod(0o755)

    def run_entry(self, changes):
        env = {k: v for k, v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(SLOTSTREAM_SELECTION_TRACE=str(self.trace))
        env.update(changes)
        p = subprocess.run(['bash', 'Tools/static_gates.sh'], cwd=self.root,
                           env=env, text=True, capture_output=True, timeout=15)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return p, rows

    def expect_selected(self, changes, name):
        p, rows = self.run_entry(changes)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual([row['selected'] for row in rows], [name]*3)
        self.assertEqual([row['arguments'] for row in rows],
                         [['runtime-check'], ['pull-check'], ['doctor', '--json']])
        expected = str(self.binaries[name]) if name != 'release' else '.build/release/slotstream'
        self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
                            for row in rows), rows)

    def test_default_release_is_used_and_forwarded(self):
        self.expect_selected({}, 'release')

    def test_legacy_bin_override_is_used_and_forwarded(self):
        self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')

    def test_frozen_override_with_spaces_is_used_and_forwarded(self):
        self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_frozen_override_takes_precedence_over_legacy_bin(self):
        self.expect_selected({'BIN': str(self.binaries['legacy']),
                              'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_missing_selected_binary_fails_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing binary')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_binary_failure_stops_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen']),
                                  'SLOTSTREAM_SELECTION_EXIT': '23'})
        self.assertEqual(p.returncode, 23)
        self.assertEqual([row['selected'] for row in rows], ['frozen'])


if __name__ == '__main__':
    unittest.main()

````

## /tmp/slotstream-optimization-execution/static-binary-v226/applied.json

SHA-256 `67c1783533c43ec981b95b831bfb380f8c7d0af989a7e2bd3349077124c06b55`; 510 bytes.

````text
{
  "state": "APPLIED",
  "files": [
    {
      "path": "Tools/static_gates.sh",
      "before_sha256": "aff70a1d15c50632f702a9f9349f6a6ebee550b3a092624acf0fcd7c47cf6c93",
      "after_sha256": "53fc4d8cd92af1f87a651be1a58a488b1c162e6f2d29481e1c64cd6b21532302"
    },
    {
      "path": "Tools/static_gates_binary_test.py",
      "before_sha256": null,
      "after_sha256": "9c01bc0f81ce935fc3aa777c3ca0f6d94edce4270b3c12c78fef8b02a0956aea"
    }
  ],
  "no_runtime_or_frozen_context_driver_change": true
}

````

## /tmp/slotstream-optimization-execution/static-binary-v226/manifest.json

SHA-256 `3cafb18bbdd3cd9888c19e499a1e0e5dbf4d0ab94e63d053bfb54392d6278dfa`; 523 bytes.

````text
{
  "state": "PREPARED_NOT_APPLIED",
  "files": [
    {
      "path": "Tools/static_gates.sh",
      "before_sha256": "aff70a1d15c50632f702a9f9349f6a6ebee550b3a092624acf0fcd7c47cf6c93",
      "after_sha256": "53fc4d8cd92af1f87a651be1a58a488b1c162e6f2d29481e1c64cd6b21532302"
    },
    {
      "path": "Tools/static_gates_binary_test.py",
      "before_sha256": null,
      "after_sha256": "9c01bc0f81ce935fc3aa777c3ca0f6d94edce4270b3c12c78fef8b02a0956aea"
    }
  ],
  "no_runtime_or_frozen_context_driver_change": true
}

````

## /tmp/slotstream-optimization-execution/static-binary-v226/pure-result.json

SHA-256 `69deedfd9b6a16fbd2959c12088f3788a8f91e128970bcd24db8ef6c0a8644ae`; 122 bytes.

````text
{
  "command": [
    "python3",
    "Tools/static_gates_binary_test.py"
  ],
  "exit_code": 0,
  "seconds": 6.092946875
}

````

## /tmp/slotstream-optimization-execution/static-binary-v226/pure-stderr.txt

SHA-256 `3a10c80be715ef26b8edcf3c95acce776c435af1aecc21f55f03230ea8fd0abb`; 104 bytes.

````text
......
----------------------------------------------------------------------
Ran 6 tests in 6.057s

OK

````

## /tmp/slotstream-optimization-execution/static-binary-v226/pure-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/static-binary-v226/source-audit.json

SHA-256 `5b31fdf23434a3c8a0d460376cba6abeef1606561e2b171012185f30d33aa963`; 26833 bytes.

````text
{
  "captured_utc": "2026-09-07T01:58:32.063098+00:00",
  "runtime_sources": [
    {
      "path": "Sources/CSlotpack/include/slotpack.h",
      "sha256": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "matches": true
    },
    {
      "path": "Sources/CSlotpack/slotpack.c",
      "sha256": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/AdaptiveSpeculation.swift",
      "sha256": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/BlockSelection.swift",
      "sha256": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/BoundedOutput.swift",
      "sha256": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/CPUSlotWrite.swift",
      "sha256": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/CacheBookkeeping.swift",
      "sha256": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Checkpoint.swift",
      "sha256": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/CompiledArithmetic.swift",
      "sha256": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Context.swift",
      "sha256": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/ContextFeasibility.swift",
      "sha256": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "sha256": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/DownloadConcurrency.swift",
      "sha256": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/DownloadHTTP.swift",
      "sha256": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/EmbeddingRows.swift",
      "sha256": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Engine.swift",
      "sha256": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Errors.swift",
      "sha256": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/ExactRead.swift",
      "sha256": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/ExpertStore.swift",
      "sha256": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/ExpertTransferProfile.swift",
      "sha256": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/GDNPhaseProfile.swift",
      "sha256": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/GatewayDialect.swift",
      "sha256": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Generate.swift",
      "sha256": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Governor.swift",
      "sha256": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/LayerLocalVictim.swift",
      "sha256": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Layers.swift",
      "sha256": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/MTP.swift",
      "sha256": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Machine.swift",
      "sha256": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/MemTrace.swift",
      "sha256": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Model.swift",
      "sha256": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/NgramPrefetch.swift",
      "sha256": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/NgramStore.swift",
      "sha256": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Observation.swift",
      "sha256": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/OpenAIDialect.swift",
      "sha256": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/OpenAIOutput.swift",
      "sha256": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/OptimizationPlatform.swift",
      "sha256": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Optimizations.swift",
      "sha256": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/PackedExpertLayout.swift",
      "sha256": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/PackedProjectionPair.swift",
      "sha256": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/PartialRotation.swift",
      "sha256": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/PinnedModel.swift",
      "sha256": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/PinnedTransport.swift",
      "sha256": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/PinnedTransportManifest.swift",
      "sha256": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Plan.swift",
      "sha256": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/PrefixCache.swift",
      "sha256": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/PressureBoundary.swift",
      "sha256": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/ProcessMemory.swift",
      "sha256": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/RequestControl.swift",
      "sha256": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/ResidentExpertOverlap.swift",
      "sha256": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/RouterProjection.swift",
      "sha256": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/RouterSelection.swift",
      "sha256": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/RouterTrace.swift",
      "sha256": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/SelectedAttention.swift",
      "sha256": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Server.swift",
      "sha256": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/SlotWritePlan.swift",
      "sha256": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/SlotpackDownload.swift",
      "sha256": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/SlotpackManifest.swift",
      "sha256": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/StatePrefixFork.swift",
      "sha256": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/StateRecovery.swift",
      "sha256": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/ToolCallSplitter.swift",
      "sha256": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Vendored/GatedDelta.swift",
      "sha256": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Version.swift",
      "sha256": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Vision.swift",
      "sha256": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/VisionAttention.swift",
      "sha256": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/VisionPrompt.swift",
      "sha256": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/WeightDownload.swift",
      "sha256": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/WeightStore.swift",
      "sha256": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/Weights.swift",
      "sha256": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "matches": true
    },
    {
      "path": "Sources/Slotstream/WordSlotWrite.swift",
      "sha256": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/CheckReport.swift",
      "sha256": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift",
      "sha256": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift",
      "sha256": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift",
      "sha256": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift",
      "sha256": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift",
      "sha256": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift",
      "sha256": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift",
      "sha256": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift",
      "sha256": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "sha256": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift",
      "sha256": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift",
      "sha256": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift",
      "sha256": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift",
      "sha256": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift",
      "sha256": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift",
      "sha256": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift",
      "sha256": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift",
      "sha256": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift",
      "sha256": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift",
      "sha256": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift",
      "sha256": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift",
      "sha256": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift",
      "sha256": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift",
      "sha256": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift",
      "sha256": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift",
      "sha256": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift",
      "sha256": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
      "sha256": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift",
      "sha256": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift",
      "sha256": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift",
      "sha256": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift",
      "sha256": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift",
      "sha256": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift",
      "sha256": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift",
      "sha256": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift",
      "sha256": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift",
      "sha256": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift",
      "sha256": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift",
      "sha256": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift",
      "sha256": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift",
      "sha256": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift",
      "sha256": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift",
      "sha256": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift",
      "sha256": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift",
      "sha256": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift",
      "sha256": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
      "sha256": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift",
      "sha256": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift",
      "sha256": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift",
      "sha256": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift",
      "sha256": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift",
      "sha256": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift",
      "sha256": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift",
      "sha256": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift",
      "sha256": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift",
      "sha256": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift",
      "sha256": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics.swift",
      "sha256": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Goldens.swift",
      "sha256": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamTestKit/Catalogue.swift",
      "sha256": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamTestKit/GatewayChecks.swift",
      "sha256": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamTestKit/OpenAIChecks.swift",
      "sha256": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamTestKit/T0Checks.swift",
      "sha256": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
      "matches": true
    },
    {
      "path": "Sources/SlotstreamTestKit/ToolCallChecks.swift",
      "sha256": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "matches": true
    },
    {
      "path": "Sources/slotstream-checks/main.swift",
      "sha256": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "matches": true
    },
    {
      "path": "Sources/slotstream-cli/CheckRendering.swift",
      "sha256": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "matches": true
    },
    {
      "path": "Sources/slotstream-cli/ContextCommands.swift",
      "sha256": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
      "matches": true
    },
    {
      "path": "Sources/slotstream-cli/MTPCommands.swift",
      "sha256": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
      "matches": true
    },
    {
      "path": "Sources/slotstream-cli/OptimizationCommands.swift",
      "sha256": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
      "matches": true
    },
    {
      "path": "Sources/slotstream-cli/PackedExpertCommands.swift",
      "sha256": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "matches": true
    },
    {
      "path": "Sources/slotstream-cli/Pull.swift",
      "sha256": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
      "matches": true
    },
    {
      "path": "Sources/slotstream-cli/SweepCommands.swift",
      "sha256": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "matches": true
    },
    {
      "path": "Sources/slotstream-cli/VisionCommands.swift",
      "sha256": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
      "matches": true
    },
    {
      "path": "Sources/slotstream-cli/main.swift",
      "sha256": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
      "matches": true
    }
  ],
  "runtime_unchanged": true,
  "drivers": {
    "ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  },
  "frozen_drivers_unchanged": true,
  "no_native_or_build_command_executed": true
}

````

## /tmp/slotstream-optimization-execution/static-binary-v226/static_gates.sh

SHA-256 `53fc4d8cd92af1f87a651be1a58a488b1c162e6f2d29481e1c64cd6b21532302`; 1061 bytes.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/static_gates_binary_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/process_cleanup_checks.py
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

"$BIN" runtime-check
"$BIN" pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"

````

## /tmp/slotstream-optimization-execution/static-binary-v226/static_gates.sh.patch

SHA-256 `e326d80a53efb2aeca187ec9e81ec6d4363e925e3a7d9d4b6c8e9d1aff8a5b28`; 855 bytes.

````text
--- a/Tools/static_gates.sh
+++ b/Tools/static_gates.sh
@@ -2,12 +2,15 @@
 # Fast, weights-free checks suitable for every pull request and release.
 set -euo pipefail
 cd "$(dirname "$0")/.."
+BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
+export BIN SLOTSTREAM_TEST_BINARY="$BIN"
 
 for f in install.sh Tools/*.sh .githooks/*; do
   bash -n "$f"
 done
 sh -n install.sh
 python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
+python3 Tools/static_gates_binary_test.py
 python3 Tools/coverage_ratchet_test.py
 python3 Tools/process_cleanup_checks.py
 Tools/llms_full.sh --check
@@ -23,8 +26,8 @@
   exit 1
 fi
 
-.build/release/slotstream runtime-check
-.build/release/slotstream pull-check
+"$BIN" runtime-check
+"$BIN" pull-check
 python3 Tools/slotpack/checks.py
 Tools/planner_gates.sh
 Tools/installer_gates.sh

````

## /tmp/slotstream-optimization-execution/static-binary-v226/static_gates_binary_test.py

SHA-256 `9c01bc0f81ce935fc3aa777c3ca0f6d94edce4270b3c12c78fef8b02a0956aea`; 5481 bytes.

````text
"""Execute the real static entry point against tiny, model-free fixture tools."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("static_gates.sh").resolve()


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # The nested planner gate uses BIN just like the production script.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
        self.write('bench/parity31/fixture.txt', 'exact fixture\n')
        sha = hashlib.sha256((self.root/'bench/parity31/fixture.txt').read_bytes()).hexdigest()
        self.write('bench/parity31/SHA256SUMS', f'{sha}  fixture.txt\n')
        self.binaries = {}
        for name, path in [('release', '.build/release/slotstream'),
                           ('legacy', 'legacy binary/slotstream'),
                           ('frozen', 'frozen binary/slotstream')]:
            self.binaries[name] = self.root/path
            self.write(path, f'''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:],
        'BIN': os.environ.get('BIN'), 'SLOTSTREAM_TEST_BINARY': os.environ.get('SLOTSTREAM_TEST_BINARY')}})+'\\n')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
''')

    def write(self, relative, text):
        path = self.root/relative
        path.write_text(text)
        path.chmod(0o755)

    def run_entry(self, changes):
        env = {k: v for k, v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(SLOTSTREAM_SELECTION_TRACE=str(self.trace))
        env.update(changes)
        p = subprocess.run(['bash', 'Tools/static_gates.sh'], cwd=self.root,
                           env=env, text=True, capture_output=True, timeout=15)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return p, rows

    def expect_selected(self, changes, name):
        p, rows = self.run_entry(changes)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual([row['selected'] for row in rows], [name]*3)
        self.assertEqual([row['arguments'] for row in rows],
                         [['runtime-check'], ['pull-check'], ['doctor', '--json']])
        expected = str(self.binaries[name]) if name != 'release' else '.build/release/slotstream'
        self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
                            for row in rows), rows)

    def test_default_release_is_used_and_forwarded(self):
        self.expect_selected({}, 'release')

    def test_legacy_bin_override_is_used_and_forwarded(self):
        self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')

    def test_frozen_override_with_spaces_is_used_and_forwarded(self):
        self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_frozen_override_takes_precedence_over_legacy_bin(self):
        self.expect_selected({'BIN': str(self.binaries['legacy']),
                              'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_missing_selected_binary_fails_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing binary')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_binary_failure_stops_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen']),
                                  'SLOTSTREAM_SELECTION_EXIT': '23'})
        self.assertEqual(p.returncode, 23)
        self.assertEqual([row['selected'] for row in rows], ['frozen'])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])

````

## /tmp/slotstream-optimization-execution/static-binary-v226/static_gates_binary_test.py.patch

SHA-256 `09eb36d2dcea8deda75c323366e8f9d75f7f34d3df29704ec2dec92c99036e62`; 5691 bytes.

````text
--- a/Tools/static_gates_binary_test.py
+++ b/Tools/static_gates_binary_test.py
@@ -0,0 +1,112 @@
+"""Execute the real static entry point against tiny, model-free fixture tools."""
+import argparse
+import hashlib
+import json
+import os
+from pathlib import Path
+import subprocess
+import sys
+import tempfile
+import unittest
+
+SCRIPT = Path(__file__).with_name("static_gates.sh").resolve()
+
+
+class StaticBinarySelection(unittest.TestCase):
+    def setUp(self):
+        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
+        self.addCleanup(self.temp.cleanup)
+        self.root = Path(self.temp.name)
+        self.trace = self.root/'trace.jsonl'
+        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
+                          'bench/parity31', 'Sources/Slotstream', '.build/release',
+                          'legacy binary', 'frozen binary']:
+            (self.root/directory).mkdir(parents=True, exist_ok=True)
+        self.write('Tools/static_gates.sh', SCRIPT.read_text())
+        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
+                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
+            self.write(path, '#!/bin/bash\nexit 0\n')
+        # The nested planner gate uses BIN just like the production script.
+        self.write('Tools/planner_gates.sh', '''#!/bin/bash
+set -eu
+BIN=${BIN:-.build/release/slotstream}
+"$BIN" doctor --json
+''')
+        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
+                     'Tools/process_cleanup_checks.py',
+                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
+            self.write(path, '# Model-free dependency fixture.\n')
+        self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
+        self.write('bench/parity31/fixture.txt', 'exact fixture\n')
+        sha = hashlib.sha256((self.root/'bench/parity31/fixture.txt').read_bytes()).hexdigest()
+        self.write('bench/parity31/SHA256SUMS', f'{sha}  fixture.txt\n')
+        self.binaries = {}
+        for name, path in [('release', '.build/release/slotstream'),
+                           ('legacy', 'legacy binary/slotstream'),
+                           ('frozen', 'frozen binary/slotstream')]:
+            self.binaries[name] = self.root/path
+            self.write(path, f'''#!/usr/bin/env python3
+import json, os, sys
+with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
+    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:],
+        'BIN': os.environ.get('BIN'), 'SLOTSTREAM_TEST_BINARY': os.environ.get('SLOTSTREAM_TEST_BINARY')}})+'\\n')
+raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
+''')
+
+    def write(self, relative, text):
+        path = self.root/relative
+        path.write_text(text)
+        path.chmod(0o755)
+
+    def run_entry(self, changes):
+        env = {k: v for k, v in os.environ.items()
+               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
+        env.update(SLOTSTREAM_SELECTION_TRACE=str(self.trace))
+        env.update(changes)
+        p = subprocess.run(['bash', 'Tools/static_gates.sh'], cwd=self.root,
+                           env=env, text=True, capture_output=True, timeout=15)
+        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
+            if self.trace.exists() else []
+        return p, rows
+
+    def expect_selected(self, changes, name):
+        p, rows = self.run_entry(changes)
+        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
+        self.assertEqual([row['selected'] for row in rows], [name]*3)
+        self.assertEqual([row['arguments'] for row in rows],
+                         [['runtime-check'], ['pull-check'], ['doctor', '--json']])
+        expected = str(self.binaries[name]) if name != 'release' else '.build/release/slotstream'
+        self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
+                            for row in rows), rows)
+
+    def test_default_release_is_used_and_forwarded(self):
+        self.expect_selected({}, 'release')
+
+    def test_legacy_bin_override_is_used_and_forwarded(self):
+        self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')
+
+    def test_frozen_override_with_spaces_is_used_and_forwarded(self):
+        self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')
+
+    def test_frozen_override_takes_precedence_over_legacy_bin(self):
+        self.expect_selected({'BIN': str(self.binaries['legacy']),
+                              'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')
+
+    def test_missing_selected_binary_fails_without_fallback(self):
+        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing binary')})
+        self.assertNotEqual(p.returncode, 0)
+        self.assertEqual(rows, [])
+
+    def test_selected_binary_failure_stops_without_fallback(self):
+        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen']),
+                                  'SLOTSTREAM_SELECTION_EXIT': '23'})
+        self.assertEqual(p.returncode, 23)
+        self.assertEqual([row['selected'] for row in rows], ['frozen'])
+
+
+if __name__ == '__main__':
+    parser = argparse.ArgumentParser(add_help=False)
+    parser.add_argument('--script', type=Path, default=SCRIPT)
+    options, remaining = parser.parse_known_args()
+    SCRIPT = options.script.resolve()
+    unittest.main(argv=[sys.argv[0], *remaining])

````

## /tmp/slotstream-optimization-execution/static-binary-v226/syntax-result.json

SHA-256 `2c861d6307a60f2e18dd70cdb64d7703680f581858f221ce9972a52dd8cd16a4`; 126 bytes.

````text
{
  "command": [
    "bash",
    "-n",
    "Tools/static_gates.sh"
  ],
  "exit_code": 0,
  "seconds": 0.003637916999999824
}

````

## /tmp/slotstream-optimization-execution/static-binary-v226/syntax-stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/static-binary-v226/syntax-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````
