---
type: run
id: 01m1wwb8bq4675gtxepbyyjscx
created: 2026-09-07T02:49:50.199643+00:00
updated: 2026-09-07T02:49:50.423937+00:00
summary: Mandatory sampler fixture and final acceptance handoff
binary: Private command fixtures only in V235; owner V215 native evidence linked separately
captured_at: 2026-09-07
command: python3 Tools/sampler_gates_test.py; python3 Tools/static_gates_binary_test.py; byte-exact source import and closure audit
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Mandatory sampler fixture and final acceptance handoff
tool: Reviewed final Tools handoff and pure static/sampler tests
---
# Mandatory sampler fixture and acceptance handoff closure

V235 independently reviews the final API/sampler scripts and their durable
sampler fixture, verifies all three after-images against the context owner's
final packet, and makes the sampler fixture mandatory in static_gates.sh.
The static dependency fixture is updated consistently. The shared real-shell
sampler fixture passes8/8, the affected static-entry fixture passes9/9, and
all3affected shell syntax checks pass. These tests invoke private tiny scripts;
no native executable, compiler, model or API server is launched by V235.

[[sources/runs/2026/09/2026-09-07-configurable-context-sampler-exit-and-binary-selection]] is imported byte-exact. It preserves five original
sampler false-pass counterexamples, the corrected8/8fixture, actualV215
sampler/NumPy/governor17/17from a quoted candidate path, five API version/path
fixtures and its nonzero-version-status counterexample. The native17/17 is
identified owner evidence, not a repeated V235 execution or full API74pass.

All143runtime source files remain V215-exact, and the three frozen cache,
prefill and serving drivers are unchanged. No packet remains pending for the
reviewed static/planner/installer/verify/API/sampler/client acceptance edges.
The current37item disposition and exact applied Tools hashes are below.
No final8pairedstudy or2realsoak, optional/model/resource/P5/planner/default or
delivery qualification is claimed. The next component preflight needs12GB
reclaimable; the full-context profile needs25GB. Existing insufficient-headroom
and swapping evidence remain preserved. Production defaults remain off.
This source is discarded for performance.

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/after/Tools/static_gates.sh

SHA-256 `72168e1bd1121676a0c44f6f1239fd7ea2c1a5a230de2ae8f626ef78e00792f8`; 1710 bytes.

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
python3 Tools/installer_gates_binary_test.py
python3 Tools/verify_binary_test.py
python3 Tools/sampler_gates_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate \
             optimization_prerequisites optimization_soak; do
  python3 "Tools/${suite}_test.py"
done
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

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/after/Tools/static_gates_binary_test.py

SHA-256 `bafc16cdb443e47d31cad82da9500fffd23ec16cd789b11f68051b10cd0ec816`; 7513 bytes.

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
OPTIMIZATION_SUITES = [
    'build_identity', 'optimization_build', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate',
    'optimization_prerequisites', 'optimization_soak',
]


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.suite_trace = self.root/'suite-trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # Record the forwarded environment at the nested planner boundary.
        # This stub does not certify the real planner's argument handling.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
                     'Tools/installer_gates_binary_test.py',
                     'Tools/verify_binary_test.py',
                     'Tools/sampler_gates_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        for suite in OPTIMIZATION_SUITES:
            self.write(f'Tools/{suite}_test.py', f'''import json, os
with open(os.environ['SLOTSTREAM_SUITE_TRACE'], 'a') as output:
    output.write(json.dumps({suite!r})+'\\n')
raise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_SUITE') == {suite!r} else 0)
''')
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
        env.update(SLOTSTREAM_SUITE_TRACE=str(self.suite_trace))
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

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:-1])

    def test_missing_optimization_suite_is_a_failure(self):
        (self.root/'Tools/optimization_prerequisites_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/api-syntax.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/before/Tools/static_gates.sh

SHA-256 `c72b78352884e90390f081dbd160d1194babaf26d10f003bd08a3873738d2779`; 1674 bytes.

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
python3 Tools/installer_gates_binary_test.py
python3 Tools/verify_binary_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate \
             optimization_prerequisites optimization_soak; do
  python3 "Tools/${suite}_test.py"
done
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

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/before/Tools/static_gates_binary_test.py

SHA-256 `2df4b306c328cbb0b04ba1cbe0e5880d8bc0bf8e5f5725a77f7311ae91a0ca46`; 7461 bytes.

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
OPTIMIZATION_SUITES = [
    'build_identity', 'optimization_build', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate',
    'optimization_prerequisites', 'optimization_soak',
]


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.suite_trace = self.root/'suite-trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # Record the forwarded environment at the nested planner boundary.
        # This stub does not certify the real planner's argument handling.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
                     'Tools/installer_gates_binary_test.py',
                     'Tools/verify_binary_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        for suite in OPTIMIZATION_SUITES:
            self.write(f'Tools/{suite}_test.py', f'''import json, os
with open(os.environ['SLOTSTREAM_SUITE_TRACE'], 'a') as output:
    output.write(json.dumps({suite!r})+'\\n')
raise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_SUITE') == {suite!r} else 0)
''')
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
        env.update(SLOTSTREAM_SUITE_TRACE=str(self.suite_trace))
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

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:-1])

    def test_missing_optimization_suite_is_a_failure(self):
        (self.root/'Tools/optimization_prerequisites_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/closure-audit.json

SHA-256 `d9e5cb50ce549f72abdf987fe25061dd8ee1a2203a82a6df89d09656722266bd`; 377 bytes.

````text
{
  "runtime_files": 143,
  "runtime_mismatches": [],
  "frozen_drivers": {
    "Tools/ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  }
}

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/final-disposition-preparation-v235.json

SHA-256 `6d32841adb62b9e484942d3ebac310275c92b62f64afc55b79548363fd80f806`; 13809 bytes.

````text
{
  "status": "working inventory only; not a completion receipt",
  "authority": "db/records/plan/whole-engine-optimization-2026-09-04.md",
  "public_defaults": "reference/off until final gates",
  "performance_interval": "No active launch grant. Next component requires12GB reclaimable; full context capacity profile requires25GB. Frozen model studies remain unrun pending sufficient headroom and coordinated interval.",
  "items": [
    {
      "id": "OPT00",
      "area": "measurement foundation",
      "current": "implemented",
      "remaining_or_disposition": "Complete frozen final contract still pending. V229/V234 require all32first/measured cells, exact outputs, no runtime error, token accounting, absolute ceilings and hashed warmups. Pure30prereq+11soak pass; no final measurement launched."
    },
    {
      "id": "OPT01",
      "area": "attribution and baselines",
      "current": "implemented",
      "remaining_or_disposition": "combined fixed-work and actual-client matrix; component savings never summed"
    },
    {
      "id": "OPT02",
      "area": "compact retained convolution/PLE windows",
      "current": "qualified component",
      "remaining_or_disposition": "final combined memory and lifetime gates"
    },
    {
      "id": "OPT03",
      "area": "compact retained MTP row",
      "current": "implemented and exact",
      "remaining_or_disposition": "final MTP resource and lifetime gates"
    },
    {
      "id": "OPT04",
      "area": "tail-aware prefill scheduling",
      "current": "conditional: public default256 schedule is unchanged",
      "remaining_or_disposition": "larger chronological family remains rejected; no default-path speed claim"
    },
    {
      "id": "OPT05",
      "area": "skip unused final forward",
      "current": "qualified independently",
      "remaining_or_disposition": "final one-token and combined lifecycle matrix"
    },
    {
      "id": "OPT06",
      "area": "sampler threshold and device draw",
      "current": "qualified independently",
      "remaining_or_disposition": "final sampled exact-output/reference oracle matrix"
    },
    {
      "id": "OPT07",
      "area": "compact ngram rows and FIFO",
      "current": "native ngram1160/cache1163 pass V202",
      "remaining_or_disposition": "V205 outer preflight refused with zero children/cells; original frozen full-cache study is unrun, needs12GB observed headroom and coordinated interval; serving follows only a qualified component"
    },
    {
      "id": "OPT08",
      "area": "allocation accounting and planner",
      "current": "implemented; context ownership merged",
      "remaining_or_disposition": "final resource gates, larger-target reservation disposition, conservative complete estimator-family reconciliation"
    },
    {
      "id": "OPT09",
      "area": "completed indexer blocks and compact raw history",
      "current": "correctness passed; process qualification failed",
      "remaining_or_disposition": "combined bounded-scope prerequisites; independent compact history stays off absent a new justified qualification"
    },
    {
      "id": "OPT10",
      "area": "bounded indexer masks/scoring",
      "current": "bounded indexer source implemented; mask fix unconditional; V207 screen complete",
      "remaining_or_disposition": "General prefill score fusion rejected at3.78x/6.13xslower; Q1 preliminary34.10percent component observation is whole-run discarded and needs runtime attribution plus >512-visible cutoff tests before any successor"
    },
    {
      "id": "OPT11",
      "area": "shared and fused partial RoPE",
      "current": "qualified independently",
      "remaining_or_disposition": "final combined ordinary/MTP and platform fallback"
    },
    {
      "id": "OPT12",
      "area": "expert placement/reduction workspace",
      "current": "exact scopes implemented",
      "remaining_or_disposition": "combined4096 scope with1024 routed tile family and serving/resource qualification"
    },
    {
      "id": "OPT13",
      "area": "bounded routed rows",
      "current": "exact scopes implemented",
      "remaining_or_disposition": "same scope family; dispatch remains routing-only"
    },
    {
      "id": "OPT14",
      "area": "bounded PLE and ngram lookahead",
      "current": "PLE implemented; ngram lookahead rejected with evidence",
      "remaining_or_disposition": "PLE through scope integration; lookahead off"
    },
    {
      "id": "OPT15",
      "area": "selected D256 attention",
      "current": "rejected with numerical and performance evidence",
      "remaining_or_disposition": "reference preserved; no adoption"
    },
    {
      "id": "OPT16",
      "area": "layer-major read scope",
      "current": "implemented; earlier candidates failed footprint/latency",
      "remaining_or_disposition": "combined scope successor native/fixed-total-memory/short-guard/policy qualification"
    },
    {
      "id": "OPT17",
      "area": "router weight projection cache",
      "current": "rejected at declared5percent serving/materiality gate",
      "remaining_or_disposition": "off; no extra resident charge"
    },
    {
      "id": "OPT18",
      "area": "compute fusion",
      "current": "RoPE qualified; norm and GDN projection serving rejected",
      "remaining_or_disposition": "fused RoPE joint gate; others off"
    },
    {
      "id": "OPT19",
      "area": "shared/resident expert overlap",
      "current": "rejected at full-request gate",
      "remaining_or_disposition": "off; no GPU-overlap claim from host wait counters"
    },
    {
      "id": "OPT20",
      "area": "expert indexing and pin bookkeeping",
      "current": "prototypes rejected; duplicate-pool fix unconditional",
      "remaining_or_disposition": "final cleanup/read-failure integration"
    },
    {
      "id": "OPT21",
      "area": "admission and floor residency",
      "current": "prototypes rejected with evidence",
      "remaining_or_disposition": "off"
    },
    {
      "id": "OPT22",
      "area": "checked reads/layout/direct writes",
      "current": "checked reads and recovery qualified; layouts/CPU copies rejected",
      "remaining_or_disposition": "final read-failure and clean acceptance; staging arena conditional on measured residual"
    },
    {
      "id": "OPT23",
      "area": "fused GDN recording",
      "current": "correctness passed; serving benefit below threshold",
      "remaining_or_disposition": "off"
    },
    {
      "id": "OPT24",
      "area": "first MTP entry reuse and bounded draft tail",
      "current": "first-entry serving rejected; greedy tail conditional; sampled fallback284 pass V202",
      "remaining_or_disposition": "greedy two-token speed and sampled fallback serving nonregression pending"
    },
    {
      "id": "OPT25",
      "area": "adaptive/speculative mode validity",
      "current": "lifecycle implemented; adaptive transparency rejected",
      "remaining_or_disposition": "fixed request-boundary policy successor conditional on own quality and memory contract; current auto policy retained"
    },
    {
      "id": "OPT26",
      "area": "parallel recurrence",
      "current": "conditional deferred after bounded measured attribution",
      "remaining_or_disposition": "reopen only if measured remaining recurrence share warrants algorithm"
    },
    {
      "id": "OPT27",
      "area": "vision attention",
      "current": "padded families rejected; original query tiling correctness passed",
      "remaining_or_disposition": "V159 maximum-image fixed640/12GB qualification unrun; native10GB max capacity remained unqualified"
    },
    {
      "id": "OPT28",
      "area": "image preparation/reuse/startup",
      "current": "admission and request-local dedup implemented",
      "remaining_or_disposition": "two-duplicate and unique serving gates; cross-request features conditional on actual benefit and charged ownership"
    },
    {
      "id": "OPT29",
      "area": "partial and complete prompt checkpoints",
      "current": "partial/full checkpoints independently qualified; V202 cold scope lifecycle832 pass",
      "remaining_or_disposition": "final combined retention, accepted scope interaction, and soaks pending"
    },
    {
      "id": "OPT30",
      "area": "bounded output and responsive governor",
      "current": "V194 physical feasibility/V201 fixtures pass V202; V214 typed error correction passes V215 five-group affected correctness",
      "remaining_or_disposition": "Full13GB governor/12GB MTP-vision resource checks remain unqualified due background VM; correctness is observed separately and all swapping-run metadata now discarded"
    },
    {
      "id": "OPT31",
      "area": "continuous batching",
      "current": "deferred by demand prerequisite",
      "remaining_or_disposition": "requires demonstrated aggregate-throughput demand; not single-user speed default"
    },
    {
      "id": "OPT32",
      "area": "integrated matrix",
      "current": "pending final candidate",
      "remaining_or_disposition": "All original7 paired studies plus V219 actual-default-one-token =8 mandatory studies; exact actual-default source/binary, native gates, both60request soaks and full acceptance"
    },
    {
      "id": "OPT33",
      "area": "planner/artifacts/delivery",
      "current": "planner-family/default source drafts prepared, unapplied",
      "remaining_or_disposition": "V208 planner441case parity/calibration and V199 actual-default source activation remain unrun/unapplied. V230-V235 selected executable/Metal static/planner/installer/verify/API/sampler edges and all client fixtures integrated, with pure tests and owner17native sampler proof. Actual full64planner, portable fallback/current consumer/full resource/serving/installed acceptance remain open."
    },
    {
      "id": "OPT34",
      "area": "broader alternatives",
      "current": "conditional dispositions recorded",
      "remaining_or_disposition": "final findings closure; no quality-changing or hardware/energy claim without evidence"
    },
    {
      "id": "OPT35",
      "area": "terminal prefill demand",
      "current": "implemented; row-pruning candidates rejected or inconclusive",
      "remaining_or_disposition": "off; broader scope owns any demand-path integration"
    },
    {
      "id": "OPT36",
      "area": "router/indexer selection",
      "current": "selection serving/quality gates rejected; V207 score screen complete",
      "remaining_or_disposition": "Selection controls off; general prefill score fusion rejected; Q1 score followup conditional on actual runtime bottleneck and full trained-state/serving qualification"
    }
  ],
  "latest_source": "Runtime V215 source143 exact; optimizer/embedding defaults off. V234 final completion metadata30prereq+11soak pure pass; V235 sampler8+static9 pure pass, owner actual V215 sampler/NumPy/governor17pass. Shared evidence/projections integrated. No final model qualification or default activation.",
  "current_interval": "Pure source/harness work only; no model, GPU, build or study. V205 launch receipt preserved separately; zero cells.",
  "captured_utc": "2026-09-07T02:49:49.969035+00:00",
  "current_master_version": "v138",
  "final_paired_studies": [
    "short-one",
    "unique-prose",
    "sampled-short",
    "mtp-resource",
    "distinct-tail",
    "complete-repeat",
    "unique-with-retention",
    "actual-default-one-token"
  ],
  "remaining_execution_order": [
    "On new eligible machine interval: frozen full-ngram V205 component; retain first zero-cell refusal separately.",
    "Execute remaining scope native family and relevant optional serving/vision protocols, each at its unchanged prerequisite; reject rather than activate a failed gate.",
    "Resolve context/resource qualification on its owned frozen build; preserve earlier failures and unchanged ceilings.",
    "Rebase/apply unchanged-value V208 family with441case complete metadata parity and measured calibration; no theoretical memory credits.",
    "Prepare actual-default isolated candidate from final selected controls; run native/fallback/reference/integration gates on that exact source.",
    "Freeze complete eight-paired/two-soak workload contract BEFORE any final cell; measure fixed original rounds without replacements.",
    "Complete full model/weights/quality/API/vision/resource/consumer/installed acceptance on the deliverable identity, then source/control/claims/artifact reconciliation."
  ],
  "default_preflight_source_review": {
    "checks": {
      "live_defaults_still_reference": true,
      "integration_no_layer_workspace": true,
      "integration_no_router_cache": true,
      "integration_no_read_scope": true,
      "baseline_layer_workspace_off": true,
      "baseline_router_cache_off": true,
      "baseline_read_scope_zero": true,
      "live_embedding_defaults_reference": true
    },
    "source_sha256": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
    "finding": "Current proposed deployment family enables no resource-expanding read scope, layer workspace or router cache. Existing extra allowance is unchanged for this family. This is a source inspection, not a native execution proof. Re-review before freeze if optional candidates/defaults or preflight code change."
  },
  "activation_draft_review": {
    "path": "/tmp/slotstream-optimization-execution/default-activation-preparation-v199/manifest.json",
    "state": "Original V199 retained unchanged; final7 in historical dependency prose is superseded by mandatory final8 in V219/current plan, not permission to omit the eighth study."
  },
  "pending_context_packet": "All reviewed static/planner/installer/client/API/sampler Tools and immutable evidence handoffs are integrated. No pending Tools packet."
}

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/manifest.json

SHA-256 `ba5b54eb63d8f88e1a79c04af3a587af5bf106193246f0710207d90a39bc4604`; 1665 bytes.

````text
{
  "scope": "Wire reviewed sampler fixtures into mandatory static tests; no native/model/compiler/GPU or API server run by this integration",
  "files": [
    {
      "path": "Tools/static_gates.sh",
      "before_sha256": "c72b78352884e90390f081dbd160d1194babaf26d10f003bd08a3873738d2779",
      "after_sha256": "72168e1bd1121676a0c44f6f1239fd7ea2c1a5a230de2ae8f626ef78e00792f8"
    },
    {
      "path": "Tools/static_gates_binary_test.py",
      "before_sha256": "2df4b306c328cbb0b04ba1cbe0e5880d8bc0bf8e5f5725a77f7311ae91a0ca46",
      "after_sha256": "bafc16cdb443e47d31cad82da9500fffd23ec16cd789b11f68051b10cd0ec816"
    }
  ],
  "results": [
    {
      "command": [
        "python3",
        "Tools/sampler_gates_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 9.174205042,
      "output": "sampler.txt"
    },
    {
      "command": [
        "python3",
        "Tools/static_gates_binary_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 10.176106167,
      "output": "static.txt"
    },
    {
      "command": [
        "bash",
        "-n",
        "Tools/static_gates.sh"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.0038836670000002016,
      "output": "static-syntax.txt"
    },
    {
      "command": [
        "bash",
        "-n",
        "Tools/sampler_gates.sh"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.003224958000000555,
      "output": "sampler-syntax.txt"
    },
    {
      "command": [
        "bash",
        "-n",
        "Tools/api_robustness.sh"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.0038593329999976334,
      "output": "api-syntax.txt"
    }
  ]
}

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/owner-after-image-audit.json

SHA-256 `a6dc2c22fdd3c84fd0cb7a6b100b1dddafbf7630d80197290e3df6c50b0c9c38`; 393 bytes.

````text
[
  {
    "path": "Tools/sampler_gates.sh",
    "sha256": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144"
  },
  {
    "path": "Tools/api_robustness.sh",
    "sha256": "26a21c58d8e4532ee6b1714bf5fe28f38ef8cd20d6182d0b7ff89a6fef7bc565"
  },
  {
    "path": "Tools/sampler_gates_test.py",
    "sha256": "89f1a34df9dbb37e904c1b32e15e72cd9fc5c01a955097abaeb2ef6c2d435fc7"
  }
]

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/owner-source-import.json

SHA-256 `0f797d5b8ad3d5c02081196dd03984c4bb633a2341d373cd30bc5765ed13232d`; 226 bytes.

````text
{
  "path": "sources/runs/2026/09/2026-09-07-configurable-context-sampler-exit-and-binary-selection.md",
  "sha256": "4b6b055812b004499d2804af06c0464273b1d90c19b09cbe70f3ca1552a4e24f",
  "bytes": 59459,
  "byte_exact": true
}

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/sampler-syntax.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/sampler.txt

SHA-256 `f3422ef4842509a11a3acbfa67430ea1695e401fa3ec4590244c5c4792715140`; 106 bytes.

````text
........
----------------------------------------------------------------------
Ran 8 tests in 9.144s

OK

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/static-syntax.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/sampler-static-integration-v235/static.txt

SHA-256 `cf1a09e7c7150090f4f4109a0d8c613c85ed4bc521bc54267a7b7dddb13dfad4`; 108 bytes.

````text
.........
----------------------------------------------------------------------
Ran 9 tests in 10.133s

OK

````
