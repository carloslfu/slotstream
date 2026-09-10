---
type: run
id: 01m21dkb33arwet86e16jrs751
created: 2026-09-08T21:08:18.659449+00:00
updated: 2026-09-08T21:08:19.116551+00:00
summary: Bounded nominal-condition settling prepared for future benchmark cohorts
binary: No model or compiler launched; isolated future benchmark driver only
captured_at: 2026-09-08
command: /Library/Developer/CommandLineTools/usr/bin/python3 thermal-settle-preparation-v388/checks.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Bounded nominal-condition settling prepared for future benchmark cohorts
tool: Slotstream exact native and source qualification capture
---
The live original V377 scope study remains unchanged. Its original 60-second before-cell pause can expire while the actual Foundation policy state remains fair. V388 prepares an optional sampled nominal-condition wait for a future prospectively frozen cohort, while holding the ordinary model lock. It checks original startup headroom, normal OS pressure, competing work, thermal/power observations and VM counter validity; new swap-outs, malformed observations, severe thermal state, low-power mode and timeouts stop before launch. Fair readings reset the sampled nominal interval, and long observation gaps cannot supply unobserved stability. The wait changes no existing request timing or acceptance predicate and makes no claim that a subsequent request will remain nominal. Three bounded isolated-driver changes reconstruct the original shared driver exactly; the copied prefill and thermal helpers match their source bytes. All 13 model-free methods pass under both Python 3.12.9 and the actual repository Python 3.9.6; the latter takes 0.109 seconds. Real driver-entrypoint tests intercept model launches and verify zero launches on a settling failure. The initial delivery test rejected the original scope protocol because it does not enable post-request abort_on_resource_failure. Its exact failure and source are retained. The correction makes the new prelaunch wait stop its own failures independently, preserving the original protocol's post-request cohort/exclusion behavior. No real cohort is bound or run with this helper yet. Future use requires an explicit policy, preserved fixed workload and acceptance, sufficient newly declared whole-run time for the added waits, and exact helper/driver provenance. No historical cohort is rescored or continued, and no runtime source, installed binary or automatic optimization default changes.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/build.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/build.stdout",
    "bytes": 198,
    "sha256": "9571d76b5e3fc42d4a67b0d2d2ab1067bd29cec006e1705e3b3e88b3e1f946ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/build_driver.py",
    "bytes": 3339,
    "sha256": "14af663bdd222c2a105352c74ac0465dee59535eee66e14306f0634af36c297e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/checks.py",
    "bytes": 11107,
    "sha256": "27b43360c2e809003cc5ecd0b95701939d85c84cbcba9fbe3d7d09bde7b09085"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/checks.python312.stderr",
    "bytes": 2033,
    "sha256": "2d4ff171cc0a163b163ebe18e4e70874ecad253996f103e1aaeab996a3e5dea5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/checks.python312.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/checks.stderr",
    "bytes": 1274,
    "sha256": "eeab02abe9b92e7c152c32b1cc7001c9ce940d8aa68d7a1f819249dbe80aaa6e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/driver/prefill_bench.py",
    "bytes": 19176,
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/driver/serve_bench.py",
    "bytes": 60552,
    "sha256": "fed47f315c9f3ea8f67696939aec1ff91a18cd23633de9c48c1ec229ee37f25c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/driver/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/driver-transformation.json",
    "bytes": 2512,
    "sha256": "6a87ec5ea890dc30d4f8ac564036c4a508023063fd37a5d64575b612b6fd0972"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/build.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/build.stdout",
    "bytes": 198,
    "sha256": "9571d76b5e3fc42d4a67b0d2d2ab1067bd29cec006e1705e3b3e88b3e1f946ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/build_driver.py",
    "bytes": 3339,
    "sha256": "14af663bdd222c2a105352c74ac0465dee59535eee66e14306f0634af36c297e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/checks.py",
    "bytes": 10883,
    "sha256": "94bffa977c4682affdc4cfe17336a9d7e1552144a08ac6594e26f16325bef6ff"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/checks.stderr",
    "bytes": 3469,
    "sha256": "b0e41ba5b0ad600919f64f81bdf4fd9c2eefe85e95b60af0634a182a8bbfde54"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/driver/prefill_bench.py",
    "bytes": 19176,
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/driver/serve_bench.py",
    "bytes": 60552,
    "sha256": "fed47f315c9f3ea8f67696939aec1ff91a18cd23633de9c48c1ec229ee37f25c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/driver/thermal_settle.py",
    "bytes": 7012,
    "sha256": "eafab00029964eb25c20efc212367600938b0a4a6a2abb63127a785e749ac0b6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/driver-transformation.json",
    "bytes": 2512,
    "sha256": "d76261e5fae58b1a144161087581ecfb5eb6942656a168723aa76a16aef474f0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/initial/thermal_settle.py",
    "bytes": 7012,
    "sha256": "eafab00029964eb25c20efc212367600938b0a4a6a2abb63127a785e749ac0b6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  }
]
```

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 9571d76b5e3fc42d4a67b0d2d2ab1067bd29cec006e1705e3b3e88b3e1f946ad

Encoding: `utf-8`. Original bytes: 198.

````````````text
{"original_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb", "driver_sha256": "fed47f315c9f3ea8f67696939aec1ff91a18cd23633de9c48c1ec229ee37f25c", "model_launched": false}

````````````

## Artifact SHA-256 14af663bdd222c2a105352c74ac0465dee59535eee66e14306f0634af36c297e

Encoding: `utf-8`. Original bytes: 3339.

````````````text
"""Create an isolated future driver; never change the shared or running driver."""
from pathlib import Path
import hashlib
import json

ROOT = Path('/Users/carlos/Projects/slotstream')
HERE = Path(__file__).resolve().parent
TARGET = HERE / 'driver'


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def build():
    original = (ROOT / 'Tools/serve_bench.py').read_text()
    edits = [
        ('from prefill_bench import ROOT,',
         'import sys\nsys.path.insert(0, ' + repr(str(ROOT / 'Tools')) + ')\n'
         'from thermal_settle import validate as validate_thermal_settle, wait as wait_thermal_settle\n'
         'from prefill_bench import ROOT,'),
        ("    validate_arms(protocol.get('arms'))\n",
         "    validate_arms(protocol.get('arms'))\n    thermal_settle = validate_thermal_settle(protocol)\n"),
        ("                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)\n",
         "                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)\n"
         "                if thermal_settle is not None:\n"
         "                    try:\n"
         "                        row['thermal_settle'] = wait_thermal_settle(thermal_settle, required_memory+extra)\n"
         "                    except Exception:\n"
         "                        stop_requested = True\n"
         "                        raise\n")]
    revised = original
    for old, new in edits:
        assert revised.count(old) == 1
        revised = revised.replace(old, new)
    restored = revised
    for old, new in reversed(edits):
        assert restored.count(new) == 1
        restored = restored.replace(new, old)
    assert restored == original
    compile(revised, str(TARGET / 'serve_bench.py'), 'exec')
    TARGET.mkdir(exist_ok=False)
    (TARGET / 'serve_bench.py').write_text(revised)
    for source in (ROOT / 'Tools/prefill_bench.py', HERE / 'thermal_settle.py'):
        (TARGET / source.name).write_bytes(source.read_bytes())
        assert digest(TARGET / source.name) == digest(source)
    record = {'classification': 'Isolated, unbound and unrun optional prelaunch thermal-settling driver. Existing shared source and all in-flight/frozen protocols are unchanged.',
              'original_sha256': digest(ROOT / 'Tools/serve_bench.py'),
              'driver_sha256': digest(TARGET / 'serve_bench.py'),
              'source_files': {str(p): digest(p) for p in (Path(__file__), HERE / 'thermal_settle.py', ROOT / 'Tools/prefill_bench.py', ROOT / 'Tools/thermal_readiness.py', ROOT / 'Tools/optimization_readiness.py')},
              'edits': [{'old': old, 'new': new} for old, new in edits],
              'reverse_restores_original_bytes': True, 'model_launched': False,
              'future_protocol_requirements': ['Explicit before_cell_thermal_settle policy', 'Full prospective fixed cohort with unchanged workload and acceptance', 'Sufficient separately declared whole-run allowance for the added prelaunch waits', 'Pinned helper and driver source closure; no old result reuse']}
    (HERE / 'driver-transformation.json').write_text(json.dumps(record, indent=2) + '\n')
    print(json.dumps({k: record[k] for k in ('original_sha256', 'driver_sha256', 'model_launched')}))


if __name__ == '__main__':
    build()

````````````

## Artifact SHA-256 27b43360c2e809003cc5ecd0b95701939d85c84cbcba9fbe3d7d09bde7b09085

Encoding: `utf-8`. Original bytes: 11107.

````````````text
import contextlib
import fcntl
import importlib.util
import io
import json
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import thermal_settle as t

POLICY = {'stable_seconds': 30, 'maximum_wait_seconds': 60, 'poll_seconds': 2}


class Clock:
    def __init__(self): self.value = 0
    def now(self): return self.value
    def sleep(self, seconds): self.value += seconds


def observation(thermal='nominal', low=False):
    return {'conditions': {'thermalState': thermal, 'lowPowerModeEnabled': low},
            'ready': thermal == 'nominal' and not low}


class ThermalChecks(unittest.TestCase):
    def execute(self, root, *, clock=None, **overrides):
        clock = clock or Clock()
        calls = {'observe': lambda: observation(),
                 'vm': lambda: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10, 'swapouts': 20},
                 'pressure': lambda: {'level': 1}, 'jobs': lambda: [],
                 'now': clock.now, 'sleep': clock.sleep, 'lock_path': root / 'model.lock',
                 'record': lambda _: None}
        calls.update(overrides)
        return t.wait(POLICY, 20.112, **calls)

    def test_absent_policy_is_noop_and_invalid_types_or_disabled_guards_refuse(self):
        self.assertIsNone(t.validate({}))
        self.assertEqual(t.wait(None, 1, observe=lambda: self.fail('observed disabled policy')), {'enabled': False})
        protocol = {'before_cell_thermal_settle': POLICY, 'require_nominal_power_state': True,
                    'stop_on_workspace_contention': True, 'abort_on_resource_failure': True}
        self.assertEqual(t.validate(protocol), POLICY)
        for key in ('require_nominal_power_state', 'stop_on_workspace_contention'):
            with self.subTest(key=key), self.assertRaises(ValueError):
                t.validate({**protocol, key: False})
        # The new prelaunch wait stops its own failures independently. Existing
        # post-request cohort handling may continue to record excluded cells.
        self.assertEqual(t.validate({**protocol, 'abort_on_resource_failure': False}), POLICY)
        for key, value in [('stable_seconds', True), ('maximum_wait_seconds', 601), ('poll_seconds', 0)]:
            with self.subTest(key=key), self.assertRaises(ValueError):
                t.validate({**protocol, 'before_cell_thermal_settle': {**POLICY, key: value}})

    def test_stable_nominal_samples_and_lock_release(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            result = self.execute(root)
            self.assertEqual(result['sampled_nominal_seconds'], 30)
            self.assertEqual(result['samples'], 16)
            with (root / 'model.lock').open('a') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_fair_observation_resets_the_interval(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            result = self.execute(Path(directory), clock=clock,
                observe=lambda: observation('fair' if clock.value == 10 else 'nominal'))
            self.assertEqual(result['seconds'], 42)
            self.assertEqual(result['sampled_nominal_seconds'], 30)

    def test_no_nominal_reading_times_out_and_releases_lock(self):
        with tempfile.TemporaryDirectory() as directory:
            root, clock = Path(directory), Clock()
            with self.assertRaises(TimeoutError):
                self.execute(root, clock=clock, observe=lambda: observation('fair'))
            self.assertEqual(clock.value, 60)
            with (root / 'model.lock').open('a') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_other_model_lock_is_not_waited_out_or_bypassed(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with (root / 'model.lock').open('a') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                with self.assertRaisesRegex(RuntimeError, 'another model'):
                    self.execute(root, observe=lambda: self.fail('observed while another model owns lock'))

    def test_low_power_severe_and_unknown_state_cannot_become_nominal(self):
        for state in [observation(low=True), observation('serious'), observation('critical'),
                      observation('unknown'), {'ready': True, 'conditions': None},
                      {**observation(), 'ready': False}]:
            with self.subTest(state=state), tempfile.TemporaryDirectory() as directory:
                with self.assertRaises(RuntimeError):
                    self.execute(Path(directory), observe=lambda: state)

    def test_pressure_memory_and_competing_work_stops(self):
        for override in [{'pressure': lambda: {'level': 2}},
                         {'pressure': lambda: {'level': True}},
                         {'vm': lambda: {'reclaimable_bytes': 20_111_999_999, 'swapins': 10, 'swapouts': 20}},
                         {'jobs': lambda: [{'kind': 'Swift build', 'pid': 123}]}]:
            with self.subTest(override=override), tempfile.TemporaryDirectory() as directory:
                with self.assertRaises(RuntimeError):
                    self.execute(Path(directory), **override)

    def test_swapouts_counter_drift_and_missing_vm_stops(self):
        for make in [lambda n: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10, 'swapouts': 20 + n},
                     lambda n: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10 - n, 'swapouts': 20},
                     lambda n: {'reclaimable_bytes': 30_000_000_000, 'swapouts': 20}]:
            with self.subTest(make=make), tempfile.TemporaryDirectory() as directory:
                clock = Clock()
                with self.assertRaises(RuntimeError):
                    self.execute(Path(directory), clock=clock, vm=lambda: make(int(clock.value)))

    def test_swapins_outside_measurement_do_not_become_a_measured_pass(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            result = self.execute(Path(directory), clock=clock,
                vm=lambda: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10 + int(clock.value), 'swapouts': 20})
            self.assertTrue(result['before_launch_only'])
            self.assertTrue(result['request_acceptance_unchanged'])

    def test_long_observation_gap_does_not_supply_unobserved_stability(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            def observe():
                if clock.value == 10: clock.value += 6
                return observation()
            result = self.execute(Path(directory), clock=clock, observe=observe)
            self.assertEqual(result['seconds'], 48)

    def test_slow_observation_cannot_exceed_deadline_then_pass(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            def observe():
                clock.value += 61
                return observation()
            with self.assertRaisesRegex(TimeoutError, 'during observation'):
                self.execute(Path(directory), clock=clock, observe=observe)

    def test_generated_driver_reconstructs_original_and_packages_actual_helper(self):
        record = json.loads((HERE / 'driver-transformation.json').read_text())
        text = (HERE / 'driver/serve_bench.py').read_text()
        for item in reversed(record['edits']):
            self.assertEqual(text.count(item['new']), 1)
            text = text.replace(item['new'], item['old'])
        root = Path('/Users/carlos/Projects/slotstream')
        self.assertEqual(text.encode(), (root / 'Tools/serve_bench.py').read_bytes())
        self.assertEqual((HERE / 'driver/prefill_bench.py').read_bytes(), (root / 'Tools/prefill_bench.py').read_bytes())
        self.assertEqual((HERE / 'driver/thermal_settle.py').read_bytes(), (HERE / 'thermal_settle.py').read_bytes())

    def test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success(self):
        spec = importlib.util.spec_from_file_location('thermal_driver_test', HERE / 'driver/serve_bench.py')
        driver = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(driver)
        protocol = json.loads((HERE.parent / 'scope-serving-resource-resume-v377/protocol.json').read_text())
        protocol['rounds'] = 1  # Synthetic delivery fixture, never an inference measurement.
        protocol['before_cell_thermal_settle'] = POLICY
        build = driver.verified_build(protocol['binary'])
        for fail in (False, True):
            with self.subTest(fail=fail), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                path, out = root / 'protocol.json', root / 'evidence'
                path.write_text(json.dumps(protocol))
                launches, settled = [], []
                def settle(requirement, gb):
                    settled.append((requirement, gb))
                    if fail: raise TimeoutError('SYNTHETIC_SETTLE_TIMEOUT')
                    return {'enabled': True, 'synthetic_test': True}
                def launch(command, **kwargs):
                    self.assertEqual(len(settled), len(launches) + 1)
                    launches.append(command)
                    raise RuntimeError('INTERCEPTED_MODEL_LAUNCH')
                with patch.object(sys, 'argv', ['delivery', '--protocol', str(path), '--out', str(out)]), \
                     patch.object(driver, 'verified_build', return_value=build), \
                     patch.object(driver, 'model_identity', return_value={'model_loaded': False}), \
                     patch.object(driver, 'wait_for_quiet_workspace', return_value={'synthetic': True}), \
                     patch.object(driver, 'competing_jobs', return_value=[]), \
                     patch.object(driver, 'reserved_cooldown', return_value={'synthetic': True}), \
                     patch.object(driver, 'wait_thermal_settle', side_effect=settle), \
                     patch.object(driver, 'wait_for_headroom', return_value=({'swapins': 0, 'swapouts': 0}, {})), \
                     patch.object(driver, 'subprocess', types.SimpleNamespace(Popen=launch)), \
                     contextlib.redirect_stdout(io.StringIO()):
                    code = driver.main()
                self.assertEqual(code, 1)
                self.assertEqual(len(launches), 0 if fail else 2)
                self.assertEqual(len(settled), 1 if fail else 2)
                rows = [json.loads(line) for line in (out / 'results.jsonl').read_text().splitlines()]
                self.assertTrue(all(row['valid'] is False for row in rows))
                self.assertIn('SYNTHETIC_SETTLE_TIMEOUT' if fail else 'INTERCEPTED_MODEL_LAUNCH', rows[0]['error'])
                self.assertFalse(any('metrics' in row for row in rows))


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 2d4ff171cc0a163b163ebe18e4e70874ecad253996f103e1aaeab996a3e5dea5

Encoding: `utf-8`. Original bytes: 2033.

````````````text
test_absent_policy_is_noop_and_invalid_types_or_disabled_guards_refuse (__main__.ThermalChecks.test_absent_policy_is_noop_and_invalid_types_or_disabled_guards_refuse) ... ok
test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success (__main__.ThermalChecks.test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success) ... ok
test_fair_observation_resets_the_interval (__main__.ThermalChecks.test_fair_observation_resets_the_interval) ... ok
test_generated_driver_reconstructs_original_and_packages_actual_helper (__main__.ThermalChecks.test_generated_driver_reconstructs_original_and_packages_actual_helper) ... ok
test_long_observation_gap_does_not_supply_unobserved_stability (__main__.ThermalChecks.test_long_observation_gap_does_not_supply_unobserved_stability) ... ok
test_low_power_severe_and_unknown_state_cannot_become_nominal (__main__.ThermalChecks.test_low_power_severe_and_unknown_state_cannot_become_nominal) ... ok
test_no_nominal_reading_times_out_and_releases_lock (__main__.ThermalChecks.test_no_nominal_reading_times_out_and_releases_lock) ... ok
test_other_model_lock_is_not_waited_out_or_bypassed (__main__.ThermalChecks.test_other_model_lock_is_not_waited_out_or_bypassed) ... ok
test_pressure_memory_and_competing_work_stops (__main__.ThermalChecks.test_pressure_memory_and_competing_work_stops) ... ok
test_slow_observation_cannot_exceed_deadline_then_pass (__main__.ThermalChecks.test_slow_observation_cannot_exceed_deadline_then_pass) ... ok
test_stable_nominal_samples_and_lock_release (__main__.ThermalChecks.test_stable_nominal_samples_and_lock_release) ... ok
test_swapins_outside_measurement_do_not_become_a_measured_pass (__main__.ThermalChecks.test_swapins_outside_measurement_do_not_become_a_measured_pass) ... ok
test_swapouts_counter_drift_and_missing_vm_stops (__main__.ThermalChecks.test_swapouts_counter_drift_and_missing_vm_stops) ... ok

----------------------------------------------------------------------
Ran 13 tests in 0.090s

OK

````````````

## Artifact SHA-256 eeab02abe9b92e7c152c32b1cc7001c9ce940d8aa68d7a1f819249dbe80aaa6e

Encoding: `utf-8`. Original bytes: 1274.

````````````text
test_absent_policy_is_noop_and_invalid_types_or_disabled_guards_refuse (__main__.ThermalChecks) ... ok
test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success (__main__.ThermalChecks) ... ok
test_fair_observation_resets_the_interval (__main__.ThermalChecks) ... ok
test_generated_driver_reconstructs_original_and_packages_actual_helper (__main__.ThermalChecks) ... ok
test_long_observation_gap_does_not_supply_unobserved_stability (__main__.ThermalChecks) ... ok
test_low_power_severe_and_unknown_state_cannot_become_nominal (__main__.ThermalChecks) ... ok
test_no_nominal_reading_times_out_and_releases_lock (__main__.ThermalChecks) ... ok
test_other_model_lock_is_not_waited_out_or_bypassed (__main__.ThermalChecks) ... ok
test_pressure_memory_and_competing_work_stops (__main__.ThermalChecks) ... ok
test_slow_observation_cannot_exceed_deadline_then_pass (__main__.ThermalChecks) ... ok
test_stable_nominal_samples_and_lock_release (__main__.ThermalChecks) ... ok
test_swapins_outside_measurement_do_not_become_a_measured_pass (__main__.ThermalChecks) ... ok
test_swapouts_counter_drift_and_missing_vm_stops (__main__.ThermalChecks) ... ok

----------------------------------------------------------------------
Ran 13 tests in 0.109s

OK

````````````

## Artifact SHA-256 3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036

Encoding: `utf-8`. Original bytes: 19176.

````````````text
#!/usr/bin/env python3
"""Paired inference experiments with raw results and exact token identities.

Repeat --arm NAME=EXECUTABLE for AB/BA order. A fresh process means empty
expert/prefix caches, not cold SSD: OS file cache is explicitly uncontrolled.
Failed, incomplete, and swapping runs are preserved and excluded.
"""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import statistics
import struct
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "Tools/fixtures/optimization"


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""): h.update(part)
    return h.hexdigest()


def vm_snapshot(raw=None):
    raw = raw if raw is not None else subprocess.check_output(["vm_stat"], text=True)
    size = re.search(r"page size of (\d+) bytes", raw)
    if not size: raise ValueError("vm_stat page size missing")
    pages = {k.strip('"'): int(v) for k, v in re.findall(r'^([^:\n]+):\s+(\d+)\.', raw, re.M)}
    required = ("Pages free", "Pages purgeable", "File-backed pages", "Swapins", "Swapouts")
    if any(k not in pages for k in required): raise ValueError("vm_stat counters missing")
    return {"page_bytes": int(size[1]), "reclaimable_bytes": sum(pages[k] for k in required[:3]) * int(size[1]),
            "swapins": pages["Swapins"], "swapouts": pages["Swapouts"], "raw": raw}


class InsufficientHeadroom(RuntimeError):
    pass


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise InsufficientHeadroom(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    return state


def host_conditions():
    """Read-only observations outside timed intervals; unavailable is explicit.

    pmset's warning history is not an instantaneous thermal sensor. Preserve
    that distinction and do not infer energy or thermal headroom from it.
    """
    result = {"load_average_1_5_15_minutes": list(os.getloadavg()),
              "observed_at_unix_seconds": time.time(),
              "thermal_limit": "pmset warning/status history, not continuous temperature",
              "energy_joules": None}
    for key, command in [("power_source", ["pmset", "-g", "batt"]),
                         ("power_configuration", ["pmset", "-g", "custom"]),
                         ("thermal_status", ["pmset", "-g", "therm"])]:
        try:
            output = subprocess.run(command, capture_output=True, text=True, timeout=5)
            result[key] = {"exit_code": output.returncode, "stdout": output.stdout, "stderr": output.stderr}
        except (OSError, subprocess.TimeoutExpired) as e:
            result[key] = {"unavailable": f"{type(e).__name__}: {e}"}
    return result


def validate_metrics(d, *, allow_complete_prompt=False):
    if type(allow_complete_prompt) is not bool: raise ValueError("complete prompt permission must be Boolean")
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if type(s.get(k)) not in (int, float) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] == 0:
        if not allow_complete_prompt: raise ValueError("no completed prefill")
        if (type(s.get('promptTokens')) is not int or s['promptTokens'] <= 0
            or type(s.get('reusedPrefixTokens')) is not int or s['reusedPrefixTokens'] != s['promptTokens']
            or type(s.get('completePromptHits')) is not int or s['completePromptHits'] != 1
            or s['prefillRecords'] != 0 or s.get('prefillPasses') != []
            or s.get('prefillComputePasses') != []
            or type(s.get('prefillReadBytes')) is not int or s['prefillReadBytes'] != 0):
            raise ValueError("zero-prefill request lacks an exact complete-prompt hit and zero work")
    elif s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
    if sum(s["prefillPasses"]) != s["prefillTokens"]: raise ValueError("pass/token mismatch")
    if len(d["prompt_ids"]) != s["promptTokens"] or len(d["output_ids"]) != s["decodeTokens"]:
        raise ValueError("token identity/count mismatch")
    return s


def capture_sources(dest):
    files = sorted([*ROOT.glob("Sources/**/*.swift"), ROOT/"Package.swift", ROOT/"Package.resolved", ROOT/"Makefile"])
    with tarfile.open(dest/"source.tar.gz", "w:gz") as archive:
        for p in files: archive.add(p, arcname=str(p.relative_to(ROOT)))
    return {str(p.relative_to(ROOT)): digest(p) for p in files}


def model_identity(model):
    # This identifies headers/stat metadata, NOT full payload verification.
    result = {}
    for p in sorted(model.iterdir()):
        if p.suffix not in (".json", ".jinja", ".safetensors"): continue
        info = {"bytes": p.stat().st_size, "mtime_ns": p.stat().st_mtime_ns}
        if p.suffix == ".safetensors":
            with p.open("rb") as f:
                n = struct.unpack("<Q", f.read(8))[0]
                if n > 64*1024*1024 or n+8 > info["bytes"]: raise ValueError(f"invalid header: {p.name}")
                info["header_sha256"] = hashlib.sha256(f.read(n)).hexdigest()
        else: info["sha256"] = digest(p)
        result[p.name] = info
    if "config.json" not in result: raise ValueError("model config missing")
    return result


def terminate_child_tree(child):
    """Drain a timed-out child and the independently grouped descendants we
    can prove it owns. Never signal the caller's inherited process group."""
    groups = {child.pid}  # run_child starts a new session before exec.
    snapshot_error = None
    try:
        # Capture parent links before terminating the root. SwiftPM may put
        # Git/compiler descendants in independent sessions/process groups.
        rows = [tuple(map(int, line.split())) for line in subprocess.check_output(
            ['ps', '-axo', 'pid=,ppid=,pgid='], text=True, timeout=5).splitlines() if line.strip()]
        owned = {child.pid}
        while True:
            expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
            if expanded == owned: break
            owned = expanded
        groups.update(group for pid, _, group in rows if pid in owned and group in owned)
    except (OSError, subprocess.SubprocessError, ValueError) as error:
        snapshot_error = error
    finally:
        def signal_owned(sig):
            for group in groups:
                try: os.killpg(group, sig)
                except ProcessLookupError: pass
        signal_owned(signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired: pass
        finally:
            # The root can exit while an independently grouped descendant
            # ignores TERM. Enumeration failure must not skip root cleanup.
            signal_owned(signal.SIGKILL)
            child.wait(timeout=5)
    if snapshot_error is not None:
        raise RuntimeError('child root drained, but descendant enumeration failed; full cleanup is unverified') from snapshot_error


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None: terminate_child_tree(child)


def paired_summary(rows, reference):
    groups = {}
    for row in rows:
        groups.setdefault((row["prompt"], row["chunk"], row["round"]), {})[row["arm"]] = row
    by_arm = {}
    for (prompt, chunk, round_number), arms in groups.items():
        for name, candidate in arms.items():
            if name == reference: continue
            result = by_arm.setdefault((prompt, chunk, name), {"pairs": [], "excluded_rounds": []})
            control = arms.get(reference)
            if not control or not control["valid"] or not candidate["valid"]:
                result["excluded_rounds"].append(round_number); continue
            a, b = control["metrics"], candidate["metrics"]
            if a["prompt_ids"] != b["prompt_ids"] or a["effective_pool_slots"] != b["effective_pool_slots"] or a.get("effective_mtp") != b.get("effective_mtp"):
                result["excluded_rounds"].append(round_number); continue
            result["pairs"].append({"round": round_number,
                "request_reduction_fraction": 1 - b["stats"]["requestSeconds"] / a["stats"]["requestSeconds"],
                "request_saved_seconds": a["stats"]["requestSeconds"] - b["stats"]["requestSeconds"],
                "output_ids_equal": a["output_ids"] == b["output_ids"]})
    result = []
    for (prompt, chunk, name), entry in sorted(by_arm.items()):
        pairs = entry["pairs"]
        result.append({"prompt": prompt, "chunk": chunk, "reference": reference, "candidate": name, **entry,
            "median_request_reduction_fraction": statistics.median(p["request_reduction_fraction"] for p in pairs) if pairs else None})
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--arm", action="append", help="NAME=EXECUTABLE (repeatable)")
    p.add_argument("--arm-env", action="append", default=[], help='NAME={"SLOTSTREAM_...":"value"}')
    p.add_argument("--arm-chunk", action="append", default=[], help="NAME=256..4096, explicit per-arm compute-pass override")
    p.add_argument("--label", default="baseline")
    p.add_argument("--mtp", choices=("off", "on"), default="off")
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--chunks", default="256")
    p.add_argument("--prompts", default="short,prose")
    p.add_argument("--memory-gb", type=float, default=8.1)
    p.add_argument("--max-tokens", type=int, default=16)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--sampled", action="store_true")
    p.add_argument("--sample-footprint", action="store_true")
    p.add_argument("--observe-arm", action="append", default=[], help="Enable footprint sampling only for this arm")
    p.add_argument("--model", type=Path, default=Path.home()/".slotstream/models/qwen38-flash-next-mlx-4bit")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--timeout", type=int, default=1800)
    p.add_argument("--prepare-only", action="store_true")
    a = p.parse_args()
    if not (8.1 <= a.memory_gb <= 10 and a.rounds > 0 and a.max_tokens > 0 and a.timeout > 0):
        p.error("use an 8.1–10 GB target and positive rounds/output/timeout")
    chunks = [int(c) for c in a.chunks.split(",")]
    if any(c < 256 or c > 4096 for c in chunks): p.error("chunks must be within 256..4096")
    if len(chunks) != len(set(chunks)): p.error("chunks must be unique")
    arms = {}
    for arm in a.arm or [f"{a.label}=.build/release/slotstream"]:
        name, path = arm.split("=", 1)
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name) or name in arms: p.error("unique safe arm names required")
        arms[name] = Path(path).resolve()
    if any(name not in arms for name in a.observe_arm): p.error("observe-arm must name an arm")
    arm_chunks = {}
    for item in a.arm_chunk:
        name, value = item.split("=", 1)
        if name not in arms or name in arm_chunks or not value.isdecimal() or not 256 <= int(value) <= 4096:
            p.error("arm-chunk requires a unique arm and a 256..4096 integer")
        arm_chunks[name] = int(value)
    envs = {n: {} for n in arms}
    for item in a.arm_env:
        name, value = item.split("=", 1); values = json.loads(value)
        if name not in arms or not isinstance(values, dict) or any(not k.startswith("SLOTSTREAM_") or not isinstance(v, str) for k,v in values.items()):
            p.error("arm-env requires an arm and string SLOTSTREAM_ overrides")
        envs[name].update(values)
    prompts = {}
    for name in a.prompts.split(","):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name): p.error("invalid fixture name")
        prompts[name] = FIXTURES/f"{name}.txt"
        if not prompts[name].is_file(): p.error(f"missing immutable fixture {name}")
    a.out = a.out.resolve(); a.out.mkdir(parents=True, exist_ok=False)
    # Preserve fixture bytes as well as hashes; a future source edit must not
    # make an old benchmark impossible to reconstruct.
    (a.out / "fixtures").mkdir()
    import shutil
    for name, fixture in list(prompts.items()):
        shutil.copyfile(fixture, a.out / "fixtures" / fixture.name)
        prompts[name] = a.out / "fixtures" / fixture.name
    identities = {}
    for name, binary in arms.items():
        identity_file = binary.parent / "build-identity.json"
        source_file = binary.parent / "build-source.tar.gz"
        identity = json.loads(identity_file.read_text())
        if identity["binary_sha256"] != digest(binary) or identity["metallib_sha256"] != digest(binary.parent / "mlx.metallib"):
            raise ValueError(f"{name}: executable/metallib does not match build identity")
        if identity["source_archive_sha256"] != digest(source_file):
            raise ValueError(f"{name}: source archive does not match build identity")
        shutil.copyfile(source_file, a.out / f"{name}-source.tar.gz")
        identities[name] = identity
    base_env = {k:v for k,v in os.environ.items() if not k.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
    manifest = {"schema_version": 1, "head": subprocess.check_output(["git","rev-parse","HEAD"], cwd=ROOT, text=True).strip(),
                "worktree_source": capture_sources(a.out), "build_identities": identities, "model": model_identity(a.model),
                "arms": {n:{"binary":str(b),"sha256":digest(b),"metallib_sha256":digest(b.parent/"mlx.metallib"),"env":envs[n]} for n,b in arms.items()},
                "fixtures": {n:{"path":str(f),"sha256":digest(f)} for n,f in prompts.items()},
                "conditions": {"filesystem_cache":"uncontrolled; no purge","expert_cache":"empty per process","prefix_cache":"empty per process","mtp":a.mtp == "on"},
                "arguments": {k:str(v) if isinstance(v,Path) else v for k,v in vars(a).items()}}
    (a.out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    if a.prepare_only: print(json.dumps({"prepared":str(a.out)})); return
    rows = []
    for ri in range(a.rounds):
        order = list(arms) if ri%2 == 0 else list(reversed(arms))
        for pname,fixture in prompts.items():
            for chunk in chunks:
                for name in order:
                    cell = a.out/f"{ri+1}-{pname}-{chunk}-{name}"; cell.mkdir()
                    row = {"round":ri+1,"prompt":pname,"chunk":chunk,"arm":name,"valid":False}
                    effective_chunk = arm_chunks.get(name, chunk)
                    row["requested_effective_chunk"] = effective_chunk
                    env = base_env | envs[name] | {"SLOTSTREAM_PREFILL_CHUNK":str(effective_chunk)}
                    command = [str(arms[name]),"run","--raw","--prompt-file",str(fixture),"--model",str(a.model),
                               "--memory-gb",str(a.memory_gb),"--mtp",a.mtp,"--seed",str(a.seed),
                               "--max-tokens",str(a.max_tokens),"--stats-json",str(cell/"metrics.json")]
                    if not a.sampled: command.append("--greedy")
                    if a.sample_footprint or name in a.observe_arm: command.append("--sample-footprint")
                    row["command"] = command
                    row["environment"] = {k:v for k,v in env.items() if k.startswith("SLOTSTREAM_")}
                    try:
                        extra = max(0, (effective_chunk - 256) * 1.30e-3)
                        if env.get("SLOTSTREAM_OPT_LAYER_WORKSPACE") == "1": extra += 2.0
                        scope = int(env.get("SLOTSTREAM_OPT_READ_SCOPE", "0"))
                        if scope > 0: extra += max(0, scope - effective_chunk) * 1.30e-3 + 0.12
                        row["override_extra_allowance_gb"] = extra
                        row["host_before"] = host_conditions()
                        row["before"] = preflight(a.memory_gb+extra+3)
                        start = time.monotonic()
                        row["exit_code"] = run_child(command,env,cell,a.timeout)
                        row["wall_seconds"] = time.monotonic()-start; row["after"] = vm_snapshot()
                        row["host_after"] = host_conditions()
                        if row["exit_code"] != 0: raise ValueError(f"child exit {row['exit_code']}")
                        d = json.loads((cell/"metrics.json").read_text()); validate_metrics(d)
                        if d["effective_prefill_chunk"] != effective_chunk or d["effective_mtp"] != (a.mtp == "on"): raise ValueError("effective configuration differs")
                        row["metrics"] = d
                        if any(row["after"][k] != row["before"][k] for k in ("swapins","swapouts")):
                            raise ValueError("swap activity during cell; timing excluded")
                        row["valid"] = True
                    except (OSError,ValueError,KeyError,RuntimeError,subprocess.TimeoutExpired) as e: row["exclusion"] = str(e)
                    (cell/"result.json").write_text(json.dumps(row,indent=2)+"\n")
                    with (a.out/"results.jsonl").open("a") as f: f.write(json.dumps(row)+"\n")
                    rows.append(row)
                    print(json.dumps({k:v for k,v in row.items() if k not in ("metrics","before","after","command","environment","host_before","host_after")}),flush=True)
    groups = {}
    for row in rows:
        if row["valid"]: groups.setdefault((row["prompt"],row["chunk"],row["arm"]),[]).append(row)
    summary = [{"prompt":k[0],"chunk":k[1],"arm":k[2],"valid_rounds":len(rs),
                "median_prefill_seconds":statistics.median(r["metrics"]["stats"]["prefillSeconds"] for r in rs),
                "median_request_seconds":statistics.median(r["metrics"]["stats"]["requestSeconds"] for r in rs),
                "prefill_records":[r["metrics"]["stats"]["prefillRecords"] for r in rs]} for k,rs in sorted(groups.items())]
    (a.out/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    (a.out/"paired-summary.json").write_text(json.dumps(paired_summary(rows, next(iter(arms))), indent=2)+"\n")
    if not all(r["valid"] for r in rows): raise SystemExit(1)


if __name__ == "__main__": main()

````````````

## Artifact SHA-256 fed47f315c9f3ea8f67696939aec1ff91a18cd23633de9c48c1ec229ee37f25c

Encoding: `utf-8`. Original bytes: 60552.

````````````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
import sys
sys.path.insert(0, '/Users/carlos/Projects/slotstream/Tools')
from thermal_settle import validate as validate_thermal_settle, wait as wait_thermal_settle
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix',
                             'expected_warmup_checkpoint_stores'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    stores = study.get('expected_warmup_checkpoint_stores')
    if 'expected_warmup_checkpoint_stores' in study:
        if (not study.get('complete_prompt', False) or type(stores) is not dict
            or set(stores) != set(protocol['arms'])
            or any(type(n) is not int or n not in [0, 1] for n in stores.values())
            or stores.get('reference') != 0):
            raise ValueError('combined complete-prompt warmup stores require exact zero/one counts for every arm')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'ngramCachedRows', 'ngramCachePayloadBytes', 'ngramRowHits', 'ngramRowMisses',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False,
                                partial_prefix=False, warmup_checkpoint_stores=None):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    stores = (warmup_checkpoint_stores[name] if warmup_checkpoint_stores is not None
              else int(want > 0 and not full))
    if warm['stats'].get('prefixCheckpointStores') != stores:
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses',
               'ngramCachedRows', 'ngramRowHits', 'ngramRowMisses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    thermal_settle = validate_thermal_settle(protocol)
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    warmup_checkpoint_stores = (protocol.get('prefix_cache') or {}).get('expected_warmup_checkpoint_stores')
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if thermal_settle is not None:
                    try:
                        row['thermal_settle'] = wait_thermal_settle(thermal_settle, required_memory+extra)
                    except Exception:
                        stop_requested = True
                        raise
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix,
                        warmup_checkpoint_stores=warmup_checkpoint_stores)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

````````````

## Artifact SHA-256 13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad

Encoding: `utf-8`. Original bytes: 6912.

````````````text
"""Optional sampled thermal readiness before a future benchmark model launch.

No inference, timed request, historical result or acceptance rule is changed.
The model lock is held while waiting and released before ordinary preflight.
Nominal samples do not promise that a subsequent request stays nominal.
"""
import fcntl
import json
import math
import os
from pathlib import Path
import time


def validate(protocol):
    value = protocol.get('before_cell_thermal_settle')
    if value is None:
        return None
    if (type(value) is not dict
        or set(value) != {'stable_seconds', 'maximum_wait_seconds', 'poll_seconds'}
        or type(value['stable_seconds']) is not int or not 30 <= value['stable_seconds'] <= 120
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 600
        or type(value['poll_seconds']) is not int or not 1 <= value['poll_seconds'] <= 5
        or protocol.get('require_nominal_power_state') is not True
        or protocol.get('stop_on_workspace_contention') is not True):
        raise ValueError('thermal settling requires explicit bounded durations and original strict resource/thermal/contention guards')
    return dict(value)


def wait(requirement, required_gb, *, observe=None, vm=None, pressure=None, jobs=None,
         now=time.monotonic, sleep=time.sleep, lock_path=None, record=None):
    if requirement is None:
        return {'enabled': False}
    validate({'before_cell_thermal_settle': requirement, 'require_nominal_power_state': True,
              'stop_on_workspace_contention': True})
    if type(required_gb) not in (int, float) or not math.isfinite(required_gb) or required_gb < 0:
        raise ValueError('invalid original admission requirement')
    if observe is None:
        from thermal_readiness import observe
    if vm is None:
        from prefill_bench import vm_snapshot as vm
    if pressure is None:
        from optimization_readiness import pressure_snapshot as pressure
    if jobs is None:
        from serve_bench import competing_jobs as jobs
    if record is None:
        record = lambda value: print(json.dumps({'thermal_settle': value}), flush=True)
    started = now()
    nominal_since = previous_time = swapouts = previous_swapins = None
    samples = 0
    minimum = required_gb * 1e9
    path = lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock'
    with open(path, 'a') as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as error:
            raise RuntimeError('another model owns the lock; no thermal settling or launch') from error
        while True:
            current = now()
            elapsed = current - started
            if elapsed < 0 or (previous_time is not None and current < previous_time):
                raise RuntimeError('monotonic clock moved backwards')
            if elapsed > requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired; no model launched')
            state, memory, pressure_state, competing = observe(), vm(), pressure(), jobs()
            after_observation = now()
            if after_observation < current:
                raise RuntimeError('monotonic clock moved backwards')
            current = after_observation
            elapsed = current - started
            if elapsed > requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired during observation; no model launched')
            samples += 1
            record({'seconds': elapsed, 'conditions': state.get('conditions'),
                    'reclaimable_bytes': memory.get('reclaimable_bytes'),
                    'swapins': memory.get('swapins'), 'swapouts': memory.get('swapouts'),
                    'pressure_level': pressure_state.get('level'), 'competing_jobs': competing})
            if competing:
                raise RuntimeError('competing storage/build work during thermal settling')
            if type(pressure_state.get('level')) is not int or pressure_state['level'] != 1:
                raise RuntimeError('memory pressure is not normal during thermal settling')
            if type(memory.get('reclaimable_bytes')) is not int or memory['reclaimable_bytes'] < minimum:
                raise RuntimeError('original startup memory requirement no longer fits')
            for key in ('swapins', 'swapouts'):
                if type(memory.get(key)) is not int or memory[key] < 0:
                    raise RuntimeError('VM counters are unavailable during thermal settling')
            if swapouts is not None and memory['swapouts'] != swapouts:
                raise RuntimeError('swap-out counter changed during thermal settling')
            if previous_swapins is not None and memory['swapins'] < previous_swapins:
                raise RuntimeError('swap-in counter moved backwards during thermal settling')
            swapouts = memory['swapouts']
            previous_swapins = memory['swapins']
            conditions = state.get('conditions')
            if (type(conditions) is not dict or set(conditions) != {'thermalState', 'lowPowerModeEnabled'}
                or conditions['thermalState'] not in ('nominal', 'fair', 'serious', 'critical')
                or type(conditions['lowPowerModeEnabled']) is not bool
                or type(state.get('ready')) is not bool
                or state['ready'] != (conditions['thermalState'] == 'nominal' and not conditions['lowPowerModeEnabled'])):
                raise RuntimeError('thermal/power observation is malformed or unavailable')
            if conditions['lowPowerModeEnabled'] or conditions['thermalState'] in ('serious', 'critical'):
                raise RuntimeError('thermal/power condition requires stopping before a model launch')
            # A scheduling gap cannot supply an unobserved stability interval.
            gap = previous_time is not None and current - previous_time > 2 * requirement['poll_seconds']
            if conditions['thermalState'] != 'nominal' or gap:
                nominal_since = None
            elif nominal_since is None:
                nominal_since = current
            previous_time = current
            stable = 0 if nominal_since is None else current - nominal_since
            if stable >= requirement['stable_seconds']:
                return {'enabled': True, 'reserved': True, 'seconds': elapsed,
                        'sampled_nominal_seconds': stable, 'samples': samples,
                        'before_launch_only': True, 'request_acceptance_unchanged': True}
            if elapsed >= requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired; no model launched')
            sleep(min(requirement['poll_seconds'], requirement['maximum_wait_seconds'] - elapsed))

````````````

## Artifact SHA-256 6a87ec5ea890dc30d4f8ac564036c4a508023063fd37a5d64575b612b6fd0972

Encoding: `utf-8`. Original bytes: 2512.

````````````text
{
  "classification": "Isolated, unbound and unrun optional prelaunch thermal-settling driver. Existing shared source and all in-flight/frozen protocols are unchanged.",
  "original_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "driver_sha256": "fed47f315c9f3ea8f67696939aec1ff91a18cd23633de9c48c1ec229ee37f25c",
  "source_files": {
    "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/build_driver.py": "14af663bdd222c2a105352c74ac0465dee59535eee66e14306f0634af36c297e",
    "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/thermal_settle.py": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad",
    "/Users/carlos/Projects/slotstream/Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/Users/carlos/Projects/slotstream/Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048",
    "/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c"
  },
  "edits": [
    {
      "old": "from prefill_bench import ROOT,",
      "new": "import sys\nsys.path.insert(0, '/Users/carlos/Projects/slotstream/Tools')\nfrom thermal_settle import validate as validate_thermal_settle, wait as wait_thermal_settle\nfrom prefill_bench import ROOT,"
    },
    {
      "old": "    validate_arms(protocol.get('arms'))\n",
      "new": "    validate_arms(protocol.get('arms'))\n    thermal_settle = validate_thermal_settle(protocol)\n"
    },
    {
      "old": "                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)\n",
      "new": "                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)\n                if thermal_settle is not None:\n                    try:\n                        row['thermal_settle'] = wait_thermal_settle(thermal_settle, required_memory+extra)\n                    except Exception:\n                        stop_requested = True\n                        raise\n"
    }
  ],
  "reverse_restores_original_bytes": true,
  "model_launched": false,
  "future_protocol_requirements": [
    "Explicit before_cell_thermal_settle policy",
    "Full prospective fixed cohort with unchanged workload and acceptance",
    "Sufficient separately declared whole-run allowance for the added prelaunch waits",
    "Pinned helper and driver source closure; no old result reuse"
  ]
}

````````````

## Artifact SHA-256 94bffa977c4682affdc4cfe17336a9d7e1552144a08ac6594e26f16325bef6ff

Encoding: `utf-8`. Original bytes: 10883.

````````````text
import contextlib
import fcntl
import importlib.util
import io
import json
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import thermal_settle as t

POLICY = {'stable_seconds': 30, 'maximum_wait_seconds': 60, 'poll_seconds': 2}


class Clock:
    def __init__(self): self.value = 0
    def now(self): return self.value
    def sleep(self, seconds): self.value += seconds


def observation(thermal='nominal', low=False):
    return {'conditions': {'thermalState': thermal, 'lowPowerModeEnabled': low},
            'ready': thermal == 'nominal' and not low}


class ThermalChecks(unittest.TestCase):
    def execute(self, root, *, clock=None, **overrides):
        clock = clock or Clock()
        calls = {'observe': lambda: observation(),
                 'vm': lambda: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10, 'swapouts': 20},
                 'pressure': lambda: {'level': 1}, 'jobs': lambda: [],
                 'now': clock.now, 'sleep': clock.sleep, 'lock_path': root / 'model.lock',
                 'record': lambda _: None}
        calls.update(overrides)
        return t.wait(POLICY, 20.112, **calls)

    def test_absent_policy_is_noop_and_invalid_types_or_disabled_guards_refuse(self):
        self.assertIsNone(t.validate({}))
        self.assertEqual(t.wait(None, 1, observe=lambda: self.fail('observed disabled policy')), {'enabled': False})
        protocol = {'before_cell_thermal_settle': POLICY, 'require_nominal_power_state': True,
                    'stop_on_workspace_contention': True, 'abort_on_resource_failure': True}
        self.assertEqual(t.validate(protocol), POLICY)
        for key in ('require_nominal_power_state', 'stop_on_workspace_contention', 'abort_on_resource_failure'):
            with self.subTest(key=key), self.assertRaises(ValueError):
                t.validate({**protocol, key: False})
        for key, value in [('stable_seconds', True), ('maximum_wait_seconds', 601), ('poll_seconds', 0)]:
            with self.subTest(key=key), self.assertRaises(ValueError):
                t.validate({**protocol, 'before_cell_thermal_settle': {**POLICY, key: value}})

    def test_stable_nominal_samples_and_lock_release(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            result = self.execute(root)
            self.assertEqual(result['sampled_nominal_seconds'], 30)
            self.assertEqual(result['samples'], 16)
            with (root / 'model.lock').open('a') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_fair_observation_resets_the_interval(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            result = self.execute(Path(directory), clock=clock,
                observe=lambda: observation('fair' if clock.value == 10 else 'nominal'))
            self.assertEqual(result['seconds'], 42)
            self.assertEqual(result['sampled_nominal_seconds'], 30)

    def test_no_nominal_reading_times_out_and_releases_lock(self):
        with tempfile.TemporaryDirectory() as directory:
            root, clock = Path(directory), Clock()
            with self.assertRaises(TimeoutError):
                self.execute(root, clock=clock, observe=lambda: observation('fair'))
            self.assertEqual(clock.value, 60)
            with (root / 'model.lock').open('a') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_other_model_lock_is_not_waited_out_or_bypassed(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with (root / 'model.lock').open('a') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                with self.assertRaisesRegex(RuntimeError, 'another model'):
                    self.execute(root, observe=lambda: self.fail('observed while another model owns lock'))

    def test_low_power_severe_and_unknown_state_cannot_become_nominal(self):
        for state in [observation(low=True), observation('serious'), observation('critical'),
                      observation('unknown'), {'ready': True, 'conditions': None},
                      {**observation(), 'ready': False}]:
            with self.subTest(state=state), tempfile.TemporaryDirectory() as directory:
                with self.assertRaises(RuntimeError):
                    self.execute(Path(directory), observe=lambda: state)

    def test_pressure_memory_and_competing_work_stops(self):
        for override in [{'pressure': lambda: {'level': 2}},
                         {'pressure': lambda: {'level': True}},
                         {'vm': lambda: {'reclaimable_bytes': 20_111_999_999, 'swapins': 10, 'swapouts': 20}},
                         {'jobs': lambda: [{'kind': 'Swift build', 'pid': 123}]}]:
            with self.subTest(override=override), tempfile.TemporaryDirectory() as directory:
                with self.assertRaises(RuntimeError):
                    self.execute(Path(directory), **override)

    def test_swapouts_counter_drift_and_missing_vm_stops(self):
        for make in [lambda n: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10, 'swapouts': 20 + n},
                     lambda n: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10 - n, 'swapouts': 20},
                     lambda n: {'reclaimable_bytes': 30_000_000_000, 'swapouts': 20}]:
            with self.subTest(make=make), tempfile.TemporaryDirectory() as directory:
                clock = Clock()
                with self.assertRaises(RuntimeError):
                    self.execute(Path(directory), clock=clock, vm=lambda: make(int(clock.value)))

    def test_swapins_outside_measurement_do_not_become_a_measured_pass(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            result = self.execute(Path(directory), clock=clock,
                vm=lambda: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10 + int(clock.value), 'swapouts': 20})
            self.assertTrue(result['before_launch_only'])
            self.assertTrue(result['request_acceptance_unchanged'])

    def test_long_observation_gap_does_not_supply_unobserved_stability(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            def observe():
                if clock.value == 10: clock.value += 6
                return observation()
            result = self.execute(Path(directory), clock=clock, observe=observe)
            self.assertEqual(result['seconds'], 48)

    def test_slow_observation_cannot_exceed_deadline_then_pass(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            def observe():
                clock.value += 61
                return observation()
            with self.assertRaisesRegex(TimeoutError, 'during observation'):
                self.execute(Path(directory), clock=clock, observe=observe)

    def test_generated_driver_reconstructs_original_and_packages_actual_helper(self):
        record = json.loads((HERE / 'driver-transformation.json').read_text())
        text = (HERE / 'driver/serve_bench.py').read_text()
        for item in reversed(record['edits']):
            self.assertEqual(text.count(item['new']), 1)
            text = text.replace(item['new'], item['old'])
        root = Path('/Users/carlos/Projects/slotstream')
        self.assertEqual(text.encode(), (root / 'Tools/serve_bench.py').read_bytes())
        self.assertEqual((HERE / 'driver/prefill_bench.py').read_bytes(), (root / 'Tools/prefill_bench.py').read_bytes())
        self.assertEqual((HERE / 'driver/thermal_settle.py').read_bytes(), (HERE / 'thermal_settle.py').read_bytes())

    def test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success(self):
        spec = importlib.util.spec_from_file_location('thermal_driver_test', HERE / 'driver/serve_bench.py')
        driver = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(driver)
        protocol = json.loads((HERE.parent / 'scope-serving-resource-resume-v377/protocol.json').read_text())
        protocol['rounds'] = 1  # Synthetic delivery fixture, never an inference measurement.
        protocol['before_cell_thermal_settle'] = POLICY
        build = driver.verified_build(protocol['binary'])
        for fail in (False, True):
            with self.subTest(fail=fail), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                path, out = root / 'protocol.json', root / 'evidence'
                path.write_text(json.dumps(protocol))
                launches, settled = [], []
                def settle(requirement, gb):
                    settled.append((requirement, gb))
                    if fail: raise TimeoutError('SYNTHETIC_SETTLE_TIMEOUT')
                    return {'enabled': True, 'synthetic_test': True}
                def launch(command, **kwargs):
                    self.assertEqual(len(settled), len(launches) + 1)
                    launches.append(command)
                    raise RuntimeError('INTERCEPTED_MODEL_LAUNCH')
                with patch.object(sys, 'argv', ['delivery', '--protocol', str(path), '--out', str(out)]), \
                     patch.object(driver, 'verified_build', return_value=build), \
                     patch.object(driver, 'model_identity', return_value={'model_loaded': False}), \
                     patch.object(driver, 'wait_for_quiet_workspace', return_value={'synthetic': True}), \
                     patch.object(driver, 'competing_jobs', return_value=[]), \
                     patch.object(driver, 'reserved_cooldown', return_value={'synthetic': True}), \
                     patch.object(driver, 'wait_thermal_settle', side_effect=settle), \
                     patch.object(driver, 'wait_for_headroom', return_value=({'swapins': 0, 'swapouts': 0}, {})), \
                     patch.object(driver, 'subprocess', types.SimpleNamespace(Popen=launch)), \
                     contextlib.redirect_stdout(io.StringIO()):
                    code = driver.main()
                self.assertEqual(code, 1)
                self.assertEqual(len(launches), 0 if fail else 2)
                self.assertEqual(len(settled), 1 if fail else 2)
                rows = [json.loads(line) for line in (out / 'results.jsonl').read_text().splitlines()]
                self.assertTrue(all(row['valid'] is False for row in rows))
                self.assertIn('SYNTHETIC_SETTLE_TIMEOUT' if fail else 'INTERCEPTED_MODEL_LAUNCH', rows[0]['error'])
                self.assertFalse(any('metrics' in row for row in rows))


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 b0e41ba5b0ad600919f64f81bdf4fd9c2eefe85e95b60af0634a182a8bbfde54

Encoding: `utf-8`. Original bytes: 3469.

````````````text
test_absent_policy_is_noop_and_invalid_types_or_disabled_guards_refuse (__main__.ThermalChecks) ... ok
test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success (__main__.ThermalChecks) ... test_fair_observation_resets_the_interval (__main__.ThermalChecks) ... ok
test_generated_driver_reconstructs_original_and_packages_actual_helper (__main__.ThermalChecks) ... ok
test_long_observation_gap_does_not_supply_unobserved_stability (__main__.ThermalChecks) ... ok
test_low_power_severe_and_unknown_state_cannot_become_nominal (__main__.ThermalChecks) ... ok
test_no_nominal_reading_times_out_and_releases_lock (__main__.ThermalChecks) ... ok
test_other_model_lock_is_not_waited_out_or_bypassed (__main__.ThermalChecks) ... ok
test_pressure_memory_and_competing_work_stops (__main__.ThermalChecks) ... ok
test_slow_observation_cannot_exceed_deadline_then_pass (__main__.ThermalChecks) ... ok
test_stable_nominal_samples_and_lock_release (__main__.ThermalChecks) ... ok
test_swapins_outside_measurement_do_not_become_a_measured_pass (__main__.ThermalChecks) ... ok
test_swapouts_counter_drift_and_missing_vm_stops (__main__.ThermalChecks) ... ok

======================================================================
ERROR: test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success (__main__.ThermalChecks) (fail=False)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/checks.py", line 184, in test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success
    code = driver.main()
  File "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/driver/serve_bench.py", line 751, in main
    thermal_settle = validate_thermal_settle(protocol)
  File "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/thermal_settle.py", line 28, in validate
    raise ValueError('thermal settling requires explicit bounded durations and original strict resource/thermal/contention guards')
ValueError: thermal settling requires explicit bounded durations and original strict resource/thermal/contention guards

======================================================================
ERROR: test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success (__main__.ThermalChecks) (fail=True)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/checks.py", line 184, in test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success
    code = driver.main()
  File "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/driver/serve_bench.py", line 751, in main
    thermal_settle = validate_thermal_settle(protocol)
  File "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/thermal_settle.py", line 28, in validate
    raise ValueError('thermal settling requires explicit bounded durations and original strict resource/thermal/contention guards')
ValueError: thermal settling requires explicit bounded durations and original strict resource/thermal/contention guards

----------------------------------------------------------------------
Ran 13 tests in 0.145s

FAILED (errors=2)

````````````

## Artifact SHA-256 eafab00029964eb25c20efc212367600938b0a4a6a2abb63127a785e749ac0b6

Encoding: `utf-8`. Original bytes: 7012.

````````````text
"""Optional sampled thermal readiness before a future benchmark model launch.

No inference, timed request, historical result or acceptance rule is changed.
The model lock is held while waiting and released before ordinary preflight.
Nominal samples do not promise that a subsequent request stays nominal.
"""
import fcntl
import json
import math
import os
from pathlib import Path
import time


def validate(protocol):
    value = protocol.get('before_cell_thermal_settle')
    if value is None:
        return None
    if (type(value) is not dict
        or set(value) != {'stable_seconds', 'maximum_wait_seconds', 'poll_seconds'}
        or type(value['stable_seconds']) is not int or not 30 <= value['stable_seconds'] <= 120
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 600
        or type(value['poll_seconds']) is not int or not 1 <= value['poll_seconds'] <= 5
        or protocol.get('require_nominal_power_state') is not True
        or protocol.get('stop_on_workspace_contention') is not True
        or protocol.get('abort_on_resource_failure') is not True):
        raise ValueError('thermal settling requires explicit bounded durations and original strict resource/thermal/contention guards')
    return dict(value)


def wait(requirement, required_gb, *, observe=None, vm=None, pressure=None, jobs=None,
         now=time.monotonic, sleep=time.sleep, lock_path=None, record=None):
    if requirement is None:
        return {'enabled': False}
    validate({'before_cell_thermal_settle': requirement, 'require_nominal_power_state': True,
              'stop_on_workspace_contention': True, 'abort_on_resource_failure': True})
    if type(required_gb) not in (int, float) or not math.isfinite(required_gb) or required_gb < 0:
        raise ValueError('invalid original admission requirement')
    if observe is None:
        from thermal_readiness import observe
    if vm is None:
        from prefill_bench import vm_snapshot as vm
    if pressure is None:
        from optimization_readiness import pressure_snapshot as pressure
    if jobs is None:
        from serve_bench import competing_jobs as jobs
    if record is None:
        record = lambda value: print(json.dumps({'thermal_settle': value}), flush=True)
    started = now()
    nominal_since = previous_time = swapouts = previous_swapins = None
    samples = 0
    minimum = required_gb * 1e9
    path = lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock'
    with open(path, 'a') as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as error:
            raise RuntimeError('another model owns the lock; no thermal settling or launch') from error
        while True:
            current = now()
            elapsed = current - started
            if elapsed < 0 or (previous_time is not None and current < previous_time):
                raise RuntimeError('monotonic clock moved backwards')
            if elapsed > requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired; no model launched')
            state, memory, pressure_state, competing = observe(), vm(), pressure(), jobs()
            after_observation = now()
            if after_observation < current:
                raise RuntimeError('monotonic clock moved backwards')
            current = after_observation
            elapsed = current - started
            if elapsed > requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired during observation; no model launched')
            samples += 1
            record({'seconds': elapsed, 'conditions': state.get('conditions'),
                    'reclaimable_bytes': memory.get('reclaimable_bytes'),
                    'swapins': memory.get('swapins'), 'swapouts': memory.get('swapouts'),
                    'pressure_level': pressure_state.get('level'), 'competing_jobs': competing})
            if competing:
                raise RuntimeError('competing storage/build work during thermal settling')
            if type(pressure_state.get('level')) is not int or pressure_state['level'] != 1:
                raise RuntimeError('memory pressure is not normal during thermal settling')
            if type(memory.get('reclaimable_bytes')) is not int or memory['reclaimable_bytes'] < minimum:
                raise RuntimeError('original startup memory requirement no longer fits')
            for key in ('swapins', 'swapouts'):
                if type(memory.get(key)) is not int or memory[key] < 0:
                    raise RuntimeError('VM counters are unavailable during thermal settling')
            if swapouts is not None and memory['swapouts'] != swapouts:
                raise RuntimeError('swap-out counter changed during thermal settling')
            if previous_swapins is not None and memory['swapins'] < previous_swapins:
                raise RuntimeError('swap-in counter moved backwards during thermal settling')
            swapouts = memory['swapouts']
            previous_swapins = memory['swapins']
            conditions = state.get('conditions')
            if (type(conditions) is not dict or set(conditions) != {'thermalState', 'lowPowerModeEnabled'}
                or conditions['thermalState'] not in ('nominal', 'fair', 'serious', 'critical')
                or type(conditions['lowPowerModeEnabled']) is not bool
                or type(state.get('ready')) is not bool
                or state['ready'] != (conditions['thermalState'] == 'nominal' and not conditions['lowPowerModeEnabled'])):
                raise RuntimeError('thermal/power observation is malformed or unavailable')
            if conditions['lowPowerModeEnabled'] or conditions['thermalState'] in ('serious', 'critical'):
                raise RuntimeError('thermal/power condition requires stopping before a model launch')
            # A scheduling gap cannot supply an unobserved stability interval.
            gap = previous_time is not None and current - previous_time > 2 * requirement['poll_seconds']
            if conditions['thermalState'] != 'nominal' or gap:
                nominal_since = None
            elif nominal_since is None:
                nominal_since = current
            previous_time = current
            stable = 0 if nominal_since is None else current - nominal_since
            if stable >= requirement['stable_seconds']:
                return {'enabled': True, 'reserved': True, 'seconds': elapsed,
                        'sampled_nominal_seconds': stable, 'samples': samples,
                        'before_launch_only': True, 'request_acceptance_unchanged': True}
            if elapsed >= requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired; no model launched')
            sleep(min(requirement['poll_seconds'], requirement['maximum_wait_seconds'] - elapsed))

````````````

## Artifact SHA-256 d76261e5fae58b1a144161087581ecfb5eb6942656a168723aa76a16aef474f0

Encoding: `utf-8`. Original bytes: 2512.

````````````text
{
  "classification": "Isolated, unbound and unrun optional prelaunch thermal-settling driver. Existing shared source and all in-flight/frozen protocols are unchanged.",
  "original_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "driver_sha256": "fed47f315c9f3ea8f67696939aec1ff91a18cd23633de9c48c1ec229ee37f25c",
  "source_files": {
    "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/build_driver.py": "14af663bdd222c2a105352c74ac0465dee59535eee66e14306f0634af36c297e",
    "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/thermal_settle.py": "eafab00029964eb25c20efc212367600938b0a4a6a2abb63127a785e749ac0b6",
    "/Users/carlos/Projects/slotstream/Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/Users/carlos/Projects/slotstream/Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048",
    "/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c"
  },
  "edits": [
    {
      "old": "from prefill_bench import ROOT,",
      "new": "import sys\nsys.path.insert(0, '/Users/carlos/Projects/slotstream/Tools')\nfrom thermal_settle import validate as validate_thermal_settle, wait as wait_thermal_settle\nfrom prefill_bench import ROOT,"
    },
    {
      "old": "    validate_arms(protocol.get('arms'))\n",
      "new": "    validate_arms(protocol.get('arms'))\n    thermal_settle = validate_thermal_settle(protocol)\n"
    },
    {
      "old": "                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)\n",
      "new": "                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)\n                if thermal_settle is not None:\n                    try:\n                        row['thermal_settle'] = wait_thermal_settle(thermal_settle, required_memory+extra)\n                    except Exception:\n                        stop_requested = True\n                        raise\n"
    }
  ],
  "reverse_restores_original_bytes": true,
  "model_launched": false,
  "future_protocol_requirements": [
    "Explicit before_cell_thermal_settle policy",
    "Full prospective fixed cohort with unchanged workload and acceptance",
    "Sufficient separately declared whole-run allowance for the added prelaunch waits",
    "Pinned helper and driver source closure; no old result reuse"
  ]
}

````````````
