---
type: run
id: 01m1xevqvq16kren0f9sqc1df6
created: 2026-09-07T08:13:24.727923+00:00
updated: 2026-09-07T08:13:25.050464+00:00
summary: Pressure failures retain the observed kernel level without changing eligibility
binary: V273 cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6; see exact per-run bindings
captured_at: 2026-09-07
command: Exact commands, prospective protocols and tool hashes embedded below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Pressure failures retain the observed kernel level without changing eligibility
tool: python3
---
# Pressure failures retain the observed kernel level without changing eligibility

V277 preserves the exact prior pressure reader and demonstrates that levels2and4 previously produced indistinguishable errors. The correction includes the observed level in the rejection message. Only exact integer1remains eligible; kernel parsing, startup/RSS/floor requirements, all frozen workloads and VM performance criteria are unchanged. All four existing readiness tests pass. Actual before/after warning/critical fixtures are retained. No model runs and no previous native failure is reclassified. Later campaigns must bind the new driver hash; V276status was captured before this change.

## /tmp/slotstream-optimization-execution/pressure-cause-v277/after.json

SHA-256 `be69cd546bda79c722cb05ed37977fc817dcd32f4b60373a69abfa3b1ddd3fe3`; 243 bytes.

````text
[
  {
    "level": 2,
    "error": "OS memory pressure is not normal (observed level=2); model work is not eligible"
  },
  {
    "level": 4,
    "error": "OS memory pressure is not normal (observed level=4); model work is not eligible"
  }
]
````

## /tmp/slotstream-optimization-execution/pressure-cause-v277/after.py

SHA-256 `56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c`; 1092 bytes.

````text
"""Read the Mac's OS pressure state without changing memory or applications."""
import subprocess


def pressure_snapshot(run=subprocess.run):
    command = ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level']
    result = run(command, text=True, capture_output=True, timeout=2)
    raw = result.stdout.strip()
    if result.returncode != 0 or raw not in ('1', '2', '4'):
        raise RuntimeError(f'OS memory pressure is unreadable: exit={result.returncode}, value={raw!r}')
    level = int(raw)
    return {'command': command, 'level': level,
            'name': {1: 'normal', 2: 'warning', 4: 'critical'}[level],
            'stdout': result.stdout, 'stderr': result.stderr}


def require_normal(snapshot):
    level = snapshot.get('level')
    if type(level) is not int or level != 1:
        raise RuntimeError(f'OS memory pressure is not normal (observed level={level!r}); '
                           'model work is not eligible')


if __name__ == '__main__':
    import json
    observation = pressure_snapshot()
    print(json.dumps(observation))
    require_normal(observation)
````

## /tmp/slotstream-optimization-execution/pressure-cause-v277/before.json

SHA-256 `8d0c3cb0ef4ded01ae85b1f81be9ac1a1c6119f397484161dfc7ea60ce70bc51`; 205 bytes.

````text
[
  {
    "level": 2,
    "error": "OS memory pressure is not normal; model work is not eligible"
  },
  {
    "level": 4,
    "error": "OS memory pressure is not normal; model work is not eligible"
  }
]
````

## /tmp/slotstream-optimization-execution/pressure-cause-v277/before.py

SHA-256 `ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc`; 1028 bytes.

````text
"""Read the Mac's OS pressure state without changing memory or applications."""
import subprocess


def pressure_snapshot(run=subprocess.run):
    command = ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level']
    result = run(command, text=True, capture_output=True, timeout=2)
    raw = result.stdout.strip()
    if result.returncode != 0 or raw not in ('1', '2', '4'):
        raise RuntimeError(f'OS memory pressure is unreadable: exit={result.returncode}, value={raw!r}')
    level = int(raw)
    return {'command': command, 'level': level,
            'name': {1: 'normal', 2: 'warning', 4: 'critical'}[level],
            'stdout': result.stdout, 'stderr': result.stderr}


def require_normal(snapshot):
    if type(snapshot.get('level')) is not int or snapshot['level'] != 1:
        raise RuntimeError('OS memory pressure is not normal; model work is not eligible')


if __name__ == '__main__':
    import json
    observation = pressure_snapshot()
    print(json.dumps(observation))
    require_normal(observation)
````

## /tmp/slotstream-optimization-execution/pressure-cause-v277/manifest.json

SHA-256 `536a2d4eaf142f9b42f763a1dbf1da9baed6868c0e5f27fa044a571de678b8ff`; 540 bytes.

````text
{
  "classification": "Pressure failure telemetry only; eligibility unchanged. No compiler/model or performance test. V276 preserved before this driver revision.",
  "before_sha256": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
  "after_sha256": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
  "tests": 4,
  "passed": true,
  "actual_original_pressure_level": "V276 observed a valid non-normal level2or4; its old wrapper did not retain which. No exact original warning-versus-critical claim."
}
````

## /tmp/slotstream-optimization-execution/pressure-cause-v277/tests.py

SHA-256 `6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016`; 1796 bytes.

````text
"""Pressure readiness refuses bad observations without launching a model."""
import subprocess
import unittest

from optimization_readiness import pressure_snapshot, require_normal


class PressureReadiness(unittest.TestCase):
    def observe(self, stdout, code=0):
        calls = []
        def run(command, **kwargs):
            calls.append((command, kwargs))
            return subprocess.CompletedProcess(command, code, stdout, '')
        result = pressure_snapshot(run)
        self.assertEqual(calls[0][0], ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'])
        self.assertEqual(calls[0][1]['timeout'], 2)
        return result

    def test_only_normal_pressure_is_eligible(self):
        require_normal(self.observe('1\n'))
        for value in ['2\n', '4\n']:
            with self.subTest(value=value), self.assertRaises(RuntimeError):
                require_normal(self.observe(value))

    def test_bad_or_failed_kernel_reading_is_refused(self):
        for value, code in [('', 0), ('0', 0), ('3', 0), ('5', 0), ('true', 0),
                            ('1.0', 0), ('1\n2', 0), ('1', 1)]:
            with self.subTest(value=value, code=code), self.assertRaises(RuntimeError):
                self.observe(value, code)

    def test_untyped_or_unknown_pressure_cannot_pass(self):
        for value in [None, True, 1.0, '1', -1, 0, 2, 4]:
            with self.subTest(value=value), self.assertRaises(RuntimeError):
                require_normal({'level': value})

    def test_timeout_cannot_turn_into_normal(self):
        def run(command, **kwargs):
            raise subprocess.TimeoutExpired(command, kwargs['timeout'])
        with self.assertRaises(subprocess.TimeoutExpired):
            pressure_snapshot(run)


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/pressure-cause-v277/tests.stderr

SHA-256 `e6ec182765cd965f2837d8eeaef5a64af48a104f245cd1a0b7281559194c57c1`; 102 bytes.

````text
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
````

## /tmp/slotstream-optimization-execution/pressure-cause-v277/tests.stdout

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

