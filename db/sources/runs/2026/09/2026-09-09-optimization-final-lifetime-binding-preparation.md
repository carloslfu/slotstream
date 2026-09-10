---
type: run
id: 01m23my787zke7bkq6ak6jw1h5
created: 2026-09-09T17:55:04.071038+00:00
updated: 2026-09-09T17:55:04.410539+00:00
summary: Exact final lifetime adapter retains both original60request workloads and passes12 model-free checks
binary: none; model-free final lifetime binding preparation
captured_at: 2026-09-09
command: V555 checks.py; original V321 execution/assessment/bound-protocol AST identity and original V308 driver/protocol checks
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Exact final lifetime adapter retains both original60request workloads and passes12 model-free checks
tool: Slotstream exact native and source qualification capture
---
Twelve model-free checks pass. The adapter retains original V321 execution, assessment, binding, guard, timeout and cleanup function bodies, both original corrected V308 sixty-request10/12GB lifetime workloads, empty actual-default environments and all original acceptance requirements. Only final source/native/eight-paired/public-consumer proof binding changes. The public-planner verifier retains its body after replacing the previously reviewed consumer-script SHA with the current65f947d8ada5865fed24a93acbca6345578c61b64067f93acf3fcdd33efff0d0identity. Actual earlier V451 consumer proof exercises this verifier during tests; it never qualifies the final consumer or a model run. Negative tests reject altered work/bounds/contracts/planner claims, expired intervals and retries; interruption handlers remain. Preparation requires all eight final paired studies, all seven current native proofs and the exact final public consumer. No corrected final contract, lifetime preparation, model attempt or lifetime result exists.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-lifetime-v555/checks.py",
    "bytes": 7680,
    "sha256": "c82c995a0a14ebdf1e1400126879e175b55858f5c5fb9adf47860d1908290ad0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-lifetime-v555/checks.stderr",
    "bytes": 111,
    "sha256": "03ee0f96059a6f4bf3a127dbefd2f185c4bd7bfe8df1fdefb58cd2247e0a4983"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-lifetime-v555/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-lifetime-v555/qualification.py",
    "bytes": 9338,
    "sha256": "9f0ce59cb240674975db2bede332a835819e25184da79ee4af14a0a29bdfe423"
  }
]
```

## Artifact SHA-256 c82c995a0a14ebdf1e1400126879e175b55858f5c5fb9adf47860d1908290ad0

Encoding: `utf-8`. Original bytes: 7680.

````````````text
"""Model-free checks of final lifetime binding; no fixture qualifies inference."""
from pathlib import Path
import ast
import copy
import importlib.util
import inspect
import json
import tempfile
import unittest
from unittest import mock

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('final_lifetime_checks', HERE / 'qualification.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


class BindingTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.original = m.adapter.contract()
        cls.corrected = m.corrected_contract(cls.original)
        cls.prior_consumer = m.BASE / 'automatic-scope-external-consumer-v451'
        cls.prior_build = m.c.read(cls.prior_consumer / 'protocol.json')['base_candidate']

    def test_original_two_sixty_request_workloads(self):
        baseline = m.c.read(m.OLD_CORRECTED / 'qualification-contract.json')
        for mode, budget in [('off', 10), ('on', 12)]:
            p = self.corrected['soak_modes'][mode]
            self.assertEqual(60, len(p['sequence']) * (p['warmup_cycles'] + p['measured_cycles']))
            self.assertEqual(budget, p['memory_gb'])
            self.assertEqual({}, p['env'])
            restored = copy.deepcopy(p)
            for k in ('binary', 'model', 'frozen_binary_sha256'):
                restored[k] = baseline['soak_modes'][mode][k]
            self.assertEqual(baseline['soak_modes'][mode], restored)

    def test_original_execution_assessment_and_binding_bodies(self):
        tree = ast.parse((m.ORIGINAL / 'qualification.py').read_text())
        for name in ('run_one', 'assess_mode', 'bound_protocol'):
            original = next(n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name == name)
            actual = ast.parse(inspect.getsource(getattr(m, name))).body[0]
            self.assertEqual(ast.dump(original), ast.dump(actual))

    def test_original_matrix_mutations_refuse(self):
        changes = [(['build_identity', 'binary_sha256'], '0'*64),
            (['native','combined-plain','command'], []),
            (['paired_protocols','short-one','max_tokens'], 2),
            (['paired_protocols','mtp-resource','memory_gb'], 12),
            (['soak_modes','off','memory_gb'], 12),
            (['soak_modes','on','acceptance','maximum_active_growth_bytes_per_position'], 128 << 20),
            (['soak_modes','on','acceptance','replacement_cycles'], 1),
            (['soak_modes','on','memory_gb'], 13),
            (['soak_modes','on','acceptance','maximum_sampled_physical_peak_bytes'], 13_000_000_000),
            (['soak_modes','on','measured_cycles'], 1)]
        for path, value in changes:
            with self.subTest(path=path):
                bad = copy.deepcopy(self.corrected); node = bad
                for key in path[:-1]: node = node[key]
                node[path[-1]] = value
                with self.assertRaises(ValueError): m.old.check_delta(self.original, bad)

    def test_lifetime_workload_changes_refuse(self):
        for key, value in [('measured_cycles', 4), ('maximum_duration_seconds_per_mode', 1800),
                           ('maximum_prompt_tokens', 2048), ('env', {'SLOTSTREAM_OPT_AUTO_READ_SCOPE':'1'})]:
            with self.subTest(key=key):
                bad = copy.deepcopy(self.original); bad['soak_modes']['off'][key] = value
                with self.assertRaises(ValueError): m.corrected_contract(bad)

    def test_original_driver_limits(self):
        for mode in ('off','on'):
            p = self.corrected['soak_modes'][mode]
            self.assertEqual(6, len(m.old_driver.validate_protocol(p)))
            bad = copy.deepcopy(p); bad['acceptance']['minimum_clean_observations_per_position'] = 1
            with self.assertRaises(ValueError): m.old_driver.validate_protocol(bad)

    def planner_fixture(self):
        return mock.patch.dict(m.planner_proof.__globals__, CONSUMER=self.prior_consumer)

    def test_actual_prior_consumer_verifier(self):
        # Actual earlier source evidence exercises the verifier, never final proof.
        with self.planner_fixture():
            proof = m.planner_proof(self.prior_build)
        self.assertIn('planner-lifetime-preflight.json', proof['sha256'])

    def test_planner_missing_validation_refuses(self):
        real_read = m.c.read; path = self.prior_consumer / 'manifest.json'
        changed = copy.deepcopy(real_read(path)); changed['passed'] = False
        with self.planner_fixture(), mock.patch.object(m.c, 'read', side_effect=lambda p: changed if Path(p)==path else real_read(p)):
            with self.assertRaises(ValueError): m.planner_proof(self.prior_build)

    def test_planner_wrong_build_refuses(self):
        bad = copy.deepcopy(self.prior_build); bad['identity']['binary_sha256'] = '0'*64
        with self.planner_fixture():
            with self.assertRaises(ValueError): m.planner_proof(bad)

    def test_planner_receipt_claims_refuse(self):
        real_read = m.c.read; path = self.prior_consumer / 'planner-lifetime-preflight.json'
        for key,value in [('existing_12gb_combined_plan_admissible',False),
                          ('combined_nominal_minimum_gb',0), ('existing_12gb_prefix_tokens',0)]:
            changed = copy.deepcopy(real_read(path)); changed[key] = value
            with self.subTest(key=key), self.planner_fixture(), mock.patch.object(m.c,'read',side_effect=lambda p: changed if Path(p)==path else real_read(p)):
                with self.assertRaises(ValueError): m.planner_proof(self.prior_build)

    def test_expired_interval_cannot_launch(self):
        real_read = m.c.read
        def read(path):
            if Path(path)==m.HERE/'preparation.json': return {'executor_sha256':m.digest(m.__file__)}
            return real_read(path)
        with mock.patch.object(m.c,'read',side_effect=read), mock.patch.object(m.old,'guarded_run',side_effect=AssertionError('no model')) as launch:
            with self.assertRaisesRegex(ValueError,'allowance'): m.run_one('2000-01-01T00:00:00Z')
            launch.assert_not_called()

    def test_failed_lifetime_cannot_retry(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d); (root/'preparation.json').write_text(json.dumps({'executor_sha256':m.digest(m.__file__)}))
            stages=[{'stage':str(i),'status':'passed'} for i in range(11)]
            stages += [{'stage':'corrected-lifetime/off','status':'failed-or-incomplete'}, {'stage':'corrected-lifetime/on','status':'unrun'}]
            with mock.patch.object(m.old,'HERE',root), mock.patch.object(m.old,'PRIOR',root), mock.patch.object(m.old,'status',return_value={'stages':stages}), mock.patch.object(m.old,'guarded_run',side_effect=AssertionError('no model')) as launch:
                # Separate original lock paths are needed; two locks on one file
                # would test flock ownership rather than the no-retry gate.
                prior=root/'prior'; prior.mkdir()
                with mock.patch.object(m.old,'PRIOR',prior):
                    with self.assertRaisesRegex(ValueError,'cannot be retried'): m.run_one('2099-01-01T00:00:00Z')
                launch.assert_not_called()

    def test_interruption_handlers_and_no_execution_artifacts(self):
        source=inspect.getsource(m.main)
        self.assertIn('signal.signal(signal.SIGINT, interrupted)', source)
        self.assertIn('signal.signal(signal.SIGTERM, interrupted)', source)
        self.assertFalse((HERE/'off').exists())
        self.assertFalse((HERE/'on').exists())
        self.assertFalse((HERE/'preparation.json').exists())


if __name__=='__main__': unittest.main()

````````````

## Artifact SHA-256 03ee0f96059a6f4bf3a127dbefd2f185c4bd7bfe8df1fdefb58cd2247e0a4983

Encoding: `utf-8`. Original bytes: 111.

````````````text
............
----------------------------------------------------------------------
Ran 12 tests in 0.584s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 9f0ce59cb240674975db2bede332a835819e25184da79ee4af14a0a29bdfe423

Encoding: `utf-8`. Original bytes: 9338.

````````````text
"""Bind the original two corrected lifetimes to the exact final qualification.

Preparation never launches a model. Both sixty-request workloads, all original
assessment and execution code, and the 10/12 GB limits are retained. The old
V321 identity and its earlier prerequisites remain untouched.
"""
from pathlib import Path
import argparse
import copy
import importlib.util
import inspect
import json
import signal

HERE = Path(__file__).resolve().parent
BASE = Path('/tmp/slotstream-optimization-execution')
ROOT = Path('/Users/carlos/Projects/slotstream')
ORIGINAL = BASE / 'confirmed-lifetime-composition-v321'
OLD_CORRECTED = BASE / 'lifetime-mode-contract-v308'
CORRECTED = HERE / 'corrected'
CONSUMER = BASE / 'final-composition-external-consumer-v529'
ADAPTER = BASE / 'final-composition-campaign-v525/campaign.py'
CONSUMER_SHA = '65f947d8ada5865fed24a93acbca6345578c61b64067f93acf3fcdd33efff0d0'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


adapter = module('final_lifetime_campaign', ADAPTER)
old = module('original_v321_lifetime', ORIGINAL / 'qualification.py')
c, require, digest = adapter.c, old.require, old.digest
old_driver = module('original_corrected_lifetime', OLD_CORRECTED / 'driver.py')


def corrected_contract(original):
    successor = copy.deepcopy(original)
    successor['soak_modes']['on']['memory_gb'] = 12
    successor['soak_modes']['on']['acceptance']['maximum_sampled_physical_peak_bytes'] = 12_000_000_000
    old.check_delta(original, successor)
    baseline = c.read(OLD_CORRECTED / 'qualification-contract.json')
    for mode in ('off', 'on'):
        actual = successor['soak_modes'][mode]
        restored = copy.deepcopy(actual)
        for key in ('binary', 'model', 'frozen_binary_sha256'):
            restored[key] = baseline['soak_modes'][mode][key]
        require(restored == baseline['soak_modes'][mode],
                'original lifetime workload, environment, limits or acceptance changed')
        require(actual['env'] == {}, 'lifetimes must exercise actual final defaults')
        old_driver.validate_protocol(actual)
    return successor


def dependencies():
    paths = [Path(__file__).resolve(), HERE / 'checks.py', HERE / 'checks.stderr',
             ORIGINAL / 'qualification.py', ORIGINAL / 'preparation.json',
             OLD_CORRECTED / 'driver.py', OLD_CORRECTED / 'qualification-contract.json',
             OLD_CORRECTED / 'preparation.json', ADAPTER,
             adapter.HERE / 'preparation.json', adapter.controls.HERE / 'preparation.json',
             adapter.controls.SOURCE, adapter.native.HERE / 'preparation.json',
             CORRECTED / 'driver.py', CORRECTED / 'qualification-contract.json',
             CONSUMER / 'prepare.py', CONSUMER / 'run.py', CONSUMER / 'preparation.json',
             CONSUMER / 'protocol.json', CONSUMER / 'manifest.json',
             CONSUMER / 'planner-lifetime-preflight.json', CONSUMER / 'stdout.txt',
             CONSUMER / 'source/Tools/consumer_smoke.sh']
    paths += [ROOT / 'Tools' / name for name in c.DRIVERS + ('thermal_readiness.py',)]
    return {str(p.resolve()): digest(p) for p in paths}


def confirmation_state():
    prepared = c.read(HERE / 'preparation.json')
    require(prepared['confirmation_preparation_sha256'] == digest(adapter.HERE / 'preparation.json'),
            'final campaign provenance changed')
    state = adapter.status()
    require(adapter.native_proof() == prepared['native_proof'], 'exact seven-case native proof changed')
    require(state['paired_matrix_complete'] is True
            and all(row['status'] == 'passed' for row in state['stages'][:11])
            and all(row['status'] == 'unrun' for row in state['stages'][11:]),
            'all original final native/paired gates must pass; legacy lifetimes stay unrun')
    return state


def load():
    prepared = c.read(HERE / 'preparation.json')
    require(prepared['dependencies'] == dependencies(), 'final lifetime source or prerequisite changed')
    confirmation_state()
    _, packet, original = adapter.load()
    successor = c.read(CORRECTED / 'qualification-contract.json')
    require(successor == corrected_contract(original), 'final corrected contract changed')
    require((CORRECTED / 'driver.py').read_bytes() == (OLD_CORRECTED / 'driver.py').read_bytes(),
            'original lifetime driver changed')
    require(digest(ORIGINAL / 'qualification.py') == c.read(ORIGINAL / 'preparation.json')['executor_sha256'],
            'original lifetime executor changed')
    driver = module('bound_final_lifetime_driver', CORRECTED / 'driver.py')
    return packet, successor, driver


# Keep the original planner verifier, replacing only the exact already-reviewed
# consumer script identity. Its original public API and floor/capacity checks stay.
_planner_source = inspect.getsource(old.planner_proof)
_old_sha = 'fddd0ed4018df6e0086b6915bbacc8622473321fa3e7b14dde55657d62060940'
require(_planner_source.count(_old_sha) == 1, 'original planner verifier differs')
_planner_source = _planner_source.replace(_old_sha, CONSUMER_SHA)
_namespace = dict(old.__dict__, CONSUMER=CONSUMER, campaign=c)
exec(compile(_planner_source, str(ORIGINAL / 'qualification.py') + '::final_consumer_identity', 'exec'), _namespace)
planner_proof = _namespace['planner_proof']


def prepare():
    require(not (HERE / 'preparation.json').exists() and not CORRECTED.exists(), 'already prepared')
    require('Ran 12 tests' in (HERE / 'checks.stderr').read_text()
            and (HERE / 'checks.stderr').read_text().endswith('OK\n'), 'current binding checks missing')
    require(not c.bench.competing_jobs(), 'model and compiler must drain before final lifetime preparation')
    state = adapter.status()
    require(state['paired_matrix_complete'] is True, 'all eight final paired gates must qualify first')
    _, packet, original = adapter.load()
    successor = corrected_contract(original)
    require(digest(CONSUMER / 'source/Tools/consumer_smoke.sh') == CONSUMER_SHA,
            'exact public consumer script changed')
    proof = planner_proof(packet['build'])
    require(digest(OLD_CORRECTED / 'driver.py') == c.read(OLD_CORRECTED / 'preparation.json')['driver_sha256'],
            'original corrected lifetime driver changed')
    CORRECTED.mkdir()
    (CORRECTED / 'driver.py').write_bytes((OLD_CORRECTED / 'driver.py').read_bytes())
    c.write_new(CORRECTED / 'qualification-contract.json', successor)
    result = {'classification': 'Exact final build and actual defaults with both original corrected 60-request lifetimes. Source binding only; no model launch, acceptance or activation.',
              'executor_sha256': digest(Path(__file__)), 'dependencies': dependencies(),
              'confirmation_preparation_sha256': digest(adapter.HERE / 'preparation.json'),
              'native_proof': adapter.native_proof(), 'planner_proof': proof,
              'original_executor_sha256': digest(ORIGINAL / 'qualification.py'),
              'original_driver_sha256': digest(OLD_CORRECTED / 'driver.py'),
              'original_execution_and_assessment_functions_unchanged': True,
              'actual_default_environments_empty': True, 'model_launched': False}
    c.write_new(HERE / 'preparation.json', result)
    return status()


def status():
    packet, contract, driver = load()
    state = confirmation_state()
    stages = state['stages'][:11] + [old.assess_mode(mode, packet, contract, driver) for mode in ('off', 'on')]
    return {'stages': stages, 'combined_matrix_complete': all(r['status'] == 'passed' for r in stages),
            'build_identity': contract['build_identity'], 'legacy_campaign_complete': False,
            'optimization_program_complete': False, 'activation_performed': False}


# These original functions execute in the original module with only explicit
# provenance paths and prerequisite readers rebound. No workload, assertion,
# timeout, memory guard, interruption handling or cleanup body is rewritten.
old.HERE, old.PRIOR, old.CORRECTED, old.CONSUMER = HERE, adapter.PACKET, CORRECTED, CONSUMER
old.campaign, old.__file__ = c, str(Path(__file__))
old.confirmation_state, old.load, old.planner_proof, old.status = confirmation_state, load, planner_proof, status
run_one, assess_mode, bound_protocol = old.run_one, old.assess_mode, old.bound_protocol


def main():
    def interrupted(number, _frame):
        raise KeyboardInterrupt(f'lifetime interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=['prepare', 'status', 'run-one'])
    parser.add_argument('--deadline')
    args = parser.parse_args()
    if args.action == 'prepare': result = prepare()
    elif args.action == 'status': result = status()
    else:
        require(args.deadline is not None, 'one complete original interval is required')
        result = run_one(args.deadline)
    print(json.dumps(result, indent=2), flush=True)
    return 0 if all(row['status'] in ('passed', 'unrun') for row in result['stages']) else 1


if __name__ == '__main__':
    raise SystemExit(main())

````````````
