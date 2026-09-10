---
type: run
id: 01m1ygx00495rrfa9fjer07vwt
created: 2026-09-07T18:08:17.412523+00:00
updated: 2026-09-07T18:08:17.709807+00:00
summary: Additional direct Foundation thermal/power pre-launch observation
binary: V304 af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d
captured_at: 2026-09-07
command: Frozen prose assessment, exact installed/text/vision gates, and model-free thermal readiness below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Additional direct Foundation thermal/power pre-launch observation
tool: python3
---
# Detect an already non-nominal machine without loading a model

The fixed prose trace exposes a readiness gap: normal memory pressure and adequate reclaimable memory can coexist with Foundation thermalState fair. pmset warning history does not replace the runtime's instantaneous Foundation observation. The new Tools/thermal_readiness.py reads NSProcessInfo thermalState and isLowPowerModeEnabled directly through the Objective-C runtime using standard-library ctypes. Its mapping matches Sources/Slotstream/ProcessMemory.swift and the local SDK enum. No compiler, model, MLX/GPU runtime, setting change or new dependency is involved.

Observation mode emits current state with ready:false when non-nominal. The explicit --require-nominal gate exits 2 for a known non-ready state and 1 for unavailable/malformed/unsupported observations; only nominal plus low-power false succeeds. API selector availability is checked before dispatch. Eight unit tests cover all four states and both power modes, unknown or malformed values, state changes without cached readiness, unavailable providers, unsupported platforms and CLI failure status. They pass in 0.083955875 seconds. A real live Foundation query completes in 0.031780417 seconds and reports nominal with low-power disabled.

This is one prospective pre-launch observation, not a temperature, energy measurement, continuous stability proof or a guarantee about the next request. Every original per-request thermal, memory, VM, fixed-round and acceptance condition remains mandatory. No frozen driver, protocol, existing observation, native source/binary or default is modified by this helper. A new performance attempt still needs explicit machine coordination and all original workload gates; this helper never retries a failed stage or authorizes activation.

## Evidence inventory

````json
[
  {
    "path": "/Users/carlos/Projects/slotstream/Tools/thermal_readiness.py",
    "bytes": 3908,
    "sha256": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/Tools/thermal_readiness_test.py",
    "bytes": 3619,
    "sha256": "5eb2d5d27258b2b1250d2588ec332472d18b65171122340ecd8cccb4f90b9467"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-readiness-v317/live.stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-readiness-v317/live.stdout.txt",
    "bytes": 293,
    "sha256": "2fe5020e6bdd1a7531856d2bf9bc9e7b056f2b3cdabe18d8b246bb2b3d321de3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-readiness-v317/tests.stderr.txt",
    "bytes": 1017,
    "sha256": "891a382684ba3782d885ebe5a49bbf2650e9acc7d13c801cdf59c00f9fb767de"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-readiness-v317/tests.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-readiness-v317/validation.json",
    "bytes": 1477,
    "sha256": "73a1b1451fb4639b212126d253285e0e1441a4b80deac9a9e4604a442b7ff5ee"
  }
]
````

## /Users/carlos/Projects/slotstream/Tools/thermal_readiness.py

SHA-256 `461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048`.

````text
#!/usr/bin/env python3
"""Observe the same instantaneous Foundation policy state used by the runtime.

This optional pre-launch check loads no model, compiler or GPU runtime. It does
not replace any frozen per-request thermal, memory, VM or acceptance checks.
One nominal observation is not a temperature reading or a promise about a run.
"""
import argparse
import ctypes
import datetime
import json
import sys


THERMAL_STATES = {0: 'nominal', 1: 'fair', 2: 'serious', 3: 'critical'}


def current_conditions():
    if sys.platform != 'darwin':
        raise RuntimeError('Foundation operating conditions require macOS')
    # Match ProcessMemory.operatingConditions(): NSProcessInfo, rather than
    # pmset's historical warning text. Keep both libraries alive for the calls.
    foundation = ctypes.CDLL('/System/Library/Frameworks/Foundation.framework/Foundation')
    objc = ctypes.CDLL('/usr/lib/libobjc.A.dylib')
    objc.objc_getClass.argtypes = [ctypes.c_char_p]
    objc.objc_getClass.restype = ctypes.c_void_p
    objc.sel_registerName.argtypes = [ctypes.c_char_p]
    objc.sel_registerName.restype = ctypes.c_void_p
    address = ctypes.cast(objc.objc_msgSend, ctypes.c_void_p).value
    if not address:
        raise RuntimeError('Objective-C message dispatch is unavailable')
    pointer_call = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p)(address)
    integer_call = ctypes.CFUNCTYPE(ctypes.c_long, ctypes.c_void_p, ctypes.c_void_p)(address)
    boolean_call = ctypes.CFUNCTYPE(ctypes.c_bool, ctypes.c_void_p, ctypes.c_void_p)(address)
    responds = ctypes.CFUNCTYPE(ctypes.c_bool, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p)(address)
    responds_selector = objc.sel_registerName(b'respondsToSelector:')

    def selector(receiver, name):
        value = objc.sel_registerName(name)
        if not receiver or not value or not responds(receiver, responds_selector, value):
            raise RuntimeError('Foundation selector is unavailable: ' + name.decode('ascii'))
        return value

    process_class = objc.objc_getClass(b'NSProcessInfo')
    process = pointer_call(process_class, selector(process_class, b'processInfo'))
    if not process:
        raise RuntimeError('Foundation returned no process information')
    thermal = integer_call(process, selector(process, b'thermalState'))
    low_power = boolean_call(process, selector(process, b'isLowPowerModeEnabled'))
    return thermal, low_power


def observe(reader=None):
    thermal, low_power = (reader or current_conditions)()
    if type(thermal) is not int or thermal not in THERMAL_STATES:
        raise ValueError('unknown or unavailable Foundation thermal state')
    if type(low_power) is not bool:
        raise ValueError('unknown or unavailable Foundation low-power state')
    conditions = {'thermalState': THERMAL_STATES[thermal], 'lowPowerModeEnabled': low_power}
    return {
        'provider': 'Foundation NSProcessInfo',
        'observed_at_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'conditions': conditions,
        'ready': thermal == 0 and not low_power,
        'scope': 'One pre-launch policy observation; all original request and qualification gates remain required.',
    }


def main(argv=None, *, reader=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--require-nominal', action='store_true',
                        help='Exit 2 unless the observation is nominal and low-power mode is disabled')
    args = parser.parse_args(argv)
    try:
        result = observe(reader)
    except (AttributeError, OSError, RuntimeError, TypeError, ValueError) as error:
        print(json.dumps({'ready': False, 'error': str(error)}))
        return 1
    print(json.dumps(result))
    return 2 if args.require_nominal and not result['ready'] else 0


if __name__ == '__main__':
    raise SystemExit(main())

````

## /Users/carlos/Projects/slotstream/Tools/thermal_readiness_test.py

SHA-256 `5eb2d5d27258b2b1250d2588ec332472d18b65171122340ecd8cccb4f90b9467`.

````text
"""Pre-launch thermal checks fail closed and never cache a prior ready result."""
import contextlib
import io
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).parent))
import thermal_readiness as thermal


class ThermalReadinessTests(unittest.TestCase):
    def test_every_known_state_and_power_mode(self):
        for state, name in thermal.THERMAL_STATES.items():
            for low_power in [False, True]:
                with self.subTest(state=name, low_power=low_power):
                    result = thermal.observe(lambda: (state, low_power))
                    self.assertEqual(result['conditions'],
                                     {'thermalState': name, 'lowPowerModeEnabled': low_power})
                    self.assertIs(result['ready'], state == 0 and not low_power)

    def test_unavailable_and_malformed_values_never_become_nominal(self):
        for values in [(4, False), (-1, False), (None, False), (True, False),
                       (0.0, False), ('0', False), (0, None), (0, 0), (0, 'false')]:
            with self.subTest(values=values), self.assertRaises(ValueError):
                thermal.observe(lambda: values)

    def test_next_observation_detects_changed_conditions(self):
        readings = iter([(0, False), (1, False), (0, True), (0, False)])
        self.assertEqual([thermal.observe(lambda: next(readings))['ready'] for _ in range(4)],
                         [True, False, False, True])

    def test_missing_provider_does_not_reuse_an_earlier_success(self):
        self.assertTrue(thermal.observe(lambda: (0, False))['ready'])
        with self.assertRaises(OSError):
            thermal.observe(lambda: (_ for _ in ()).throw(OSError('unavailable')))

    def test_unsupported_platform_refuses_before_loading_foundation(self):
        with patch.object(thermal.sys, 'platform', 'linux'), patch.object(thermal.ctypes, 'CDLL') as load:
            with self.assertRaises(RuntimeError):
                thermal.current_conditions()
            load.assert_not_called()

    def run_cli(self, args, reader):
        output = io.StringIO()
        with contextlib.redirect_stdout(output):
            status = thermal.main(args, reader=reader)
        return status, json.loads(output.getvalue())

    def test_required_check_only_accepts_nominal_normal_power(self):
        for reading, expected in [((0, False), 0), ((1, False), 2), ((2, False), 2),
                                  ((3, False), 2), ((0, True), 2)]:
            with self.subTest(reading=reading):
                status, result = self.run_cli(['--require-nominal'], lambda: reading)
                self.assertEqual(status, expected)
                self.assertIs(result['ready'], expected == 0)

    def test_observation_mode_reports_non_nominal_without_concealing_it(self):
        status, result = self.run_cli([], lambda: (1, False))
        self.assertEqual(status, 0)
        self.assertFalse(result['ready'])
        self.assertEqual(result['conditions']['thermalState'], 'fair')

    def test_provider_failure_and_unknown_values_have_nonzero_exit(self):
        for reader in [lambda: (99, False), lambda: (0, None),
                       lambda: (_ for _ in ()).throw(OSError('unavailable'))]:
            with self.subTest(reader=reader):
                status, result = self.run_cli(['--require-nominal'], reader)
                self.assertEqual(status, 1)
                self.assertFalse(result['ready'])
                self.assertIn('error', result)


if __name__ == '__main__':
    unittest.main()

````

## /tmp/slotstream-optimization-execution/thermal-readiness-v317/live.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/thermal-readiness-v317/live.stdout.txt

SHA-256 `2fe5020e6bdd1a7531856d2bf9bc9e7b056f2b3cdabe18d8b246bb2b3d321de3`.

````text
{"provider": "Foundation NSProcessInfo", "observed_at_utc": "2026-09-07T17:59:06.004652+00:00", "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "ready": true, "scope": "One pre-launch policy observation; all original request and qualification gates remain required."}

````

## /tmp/slotstream-optimization-execution/thermal-readiness-v317/tests.stderr.txt

SHA-256 `891a382684ba3782d885ebe5a49bbf2650e9acc7d13c801cdf59c00f9fb767de`.

````text
test_every_known_state_and_power_mode (Tools.thermal_readiness_test.ThermalReadinessTests) ... ok
test_missing_provider_does_not_reuse_an_earlier_success (Tools.thermal_readiness_test.ThermalReadinessTests) ... ok
test_next_observation_detects_changed_conditions (Tools.thermal_readiness_test.ThermalReadinessTests) ... ok
test_observation_mode_reports_non_nominal_without_concealing_it (Tools.thermal_readiness_test.ThermalReadinessTests) ... ok
test_provider_failure_and_unknown_values_have_nonzero_exit (Tools.thermal_readiness_test.ThermalReadinessTests) ... ok
test_required_check_only_accepts_nominal_normal_power (Tools.thermal_readiness_test.ThermalReadinessTests) ... ok
test_unavailable_and_malformed_values_never_become_nominal (Tools.thermal_readiness_test.ThermalReadinessTests) ... ok
test_unsupported_platform_refuses_before_loading_foundation (Tools.thermal_readiness_test.ThermalReadinessTests) ... ok

----------------------------------------------------------------------
Ran 8 tests in 0.002s

OK

````

## /tmp/slotstream-optimization-execution/thermal-readiness-v317/tests.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/thermal-readiness-v317/validation.json

SHA-256 `73a1b1451fb4639b212126d253285e0e1441a4b80deac9a9e4604a442b7ff5ee`.

````text
{
  "captured_at": "2026-09-07T17:59:05.891797+00:00",
  "purpose": "Additional model-free pre-launch thermal/power observation; no frozen driver, protocol, benchmark observation or acceptance threshold changed.",
  "rows": [
    {
      "name": "tests",
      "command": [
        "python3",
        "-m",
        "unittest",
        "-v",
        "Tools/thermal_readiness_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.083955875
    },
    {
      "name": "live",
      "command": [
        "python3",
        "Tools/thermal_readiness.py",
        "--require-nominal"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.03178041699999999,
      "observation": {
        "provider": "Foundation NSProcessInfo",
        "observed_at_utc": "2026-09-07T17:59:06.004652+00:00",
        "conditions": {
          "thermalState": "nominal",
          "lowPowerModeEnabled": false
        },
        "ready": true,
        "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
      }
    }
  ],
  "source_sha256": {
    "Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048",
    "Tools/thermal_readiness_test.py": "5eb2d5d27258b2b1250d2588ec332472d18b65171122340ecd8cccb4f90b9467",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e"
  },
  "passed": true,
  "model_compiler_gpu_launched": false
}

````

