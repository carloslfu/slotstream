---
type: run
id: 01m21etc0vjvrk2xhd1n7jczdd
created: 2026-09-08T21:29:37.562708+00:00
updated: 2026-09-08T21:29:38.027969+00:00
summary: Full fixed scope successor executor preserves acceptance and prices thermal waits
binary: /Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream
captured_at: 2026-09-08
command: python3 thermally-settled-scope-v389/checks.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Full fixed scope successor executor preserves acceptance and prices thermal waits
tool: Slotstream exact native and source qualification capture
---
V389 prepares the prospective original scope workload with V388's sampled nominal-condition prelaunch wait: 30 sampled nominal seconds, at most 300 additional seconds per cell, after each original 60-second cooldown. All original 16 pairs, 32 first requests, 3,730-token fixture, 16 outputs, 10 GB targets, numerical/work controls and request/startup acceptance remain unchanged. The new whole-work allowance is the original 5,400 seconds plus all 32 possible 300-second waits, totaling 15,000 seconds, with 60 separate cleanup seconds. Original 20.112 GB startup, 12 GB owned-tree and 3 GB live guards remain, and the outer guard additionally stops on new swap-outs. Seven model-free binding methods pass in 2.604 seconds. Preparation refuses a still-running predecessor, a qualified cohort, a numerical counterexample, a materiality rejection with enough eligible pairs or unrelated failure. It requires the completed V377 cohort to have too few eligible pairs with actual thermal exclusions, preserves all its artifacts and reuses none of its rows. The real V389 preparation/protocol is not materialized or frozen yet because V377 remains live at capture. This source qualification performs no model launch, benchmark, final composition change or activation. Future execution retains all native prerequisites, exact driver/helper provenance and original assessments, then additionally verifies each completed cell's prelaunch settling record.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/thermally-settled-scope-v389/checks.py",
    "bytes": 8538,
    "sha256": "e18ca06d7c36889c833efd758adc53ee9c15e3facd713aeac9695f24efb76061"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermally-settled-scope-v389/checks.stderr",
    "bytes": 792,
    "sha256": "0259fcd3c84199b7dd8d1b2949021986afae88986eb6410999748eb28efe9b50"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermally-settled-scope-v389/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermally-settled-scope-v389/run.py",
    "bytes": 11096,
    "sha256": "480d822472f71a230b5a4f17010daa57209dcdbe0ef43a0ef2270654e2fd8a7e"
  }
]
```

## Artifact SHA-256 e18ca06d7c36889c833efd758adc53ee9c15e3facd713aeac9695f24efb76061

Encoding: `utf-8`. Original bytes: 8538.

````````````text
import copy
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('thermal_scope_binding', HERE / 'run.py')
r = importlib.util.module_from_spec(spec)
spec.loader.exec_module(r)


class ScopeBindingChecks(unittest.TestCase):
    def test_exact_original_workload_and_acceptance_are_preserved(self):
        value = r.previous.load()
        original, revised = r.previous.materialize(value), r.materialize(value)
        self.assertEqual(revised['before_cell_thermal_settle'], r.SETTLE)
        restored = copy.deepcopy(revised)
        restored.pop('before_cell_thermal_settle')
        for key in ('label', 'classification'): restored[key] = original[key]
        self.assertEqual(restored, original)
        self.assertEqual(revised['rounds'], 16)
        self.assertEqual(revised['max_tokens'], 16)
        self.assertEqual(revised['memory_gb'], 10)
        self.assertEqual(revised['between_cells_seconds'], 60)
        self.assertNotIn('before_cell_thermal_settle', r.c.read(r.previous.HERE / 'protocol.json'))

    def test_allowance_includes_all_32_added_waits_and_original_work(self):
        self.assertEqual(r.ORIGINAL_SECONDS, 5400)
        self.assertEqual(r.ADDED_WAIT_SECONDS, 32 * 300)
        self.assertEqual(r.WORK_SECONDS, 15000)
        self.assertEqual(r.CLEANUP_SECONDS, 60)
        with patch.object(r.core, 'allowance', side_effect=ValueError('full interval does not fit')), \
             patch.object(r.execution, 'load_serving') as load, patch.object(r.core, 'execute') as execute:
            with self.assertRaisesRegex(ValueError, 'full interval'):
                r.run('synthetic-deadline')
            load.assert_not_called()
            execute.assert_not_called()

    def test_live_or_unqualified_prior_evidence_creates_no_successor(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with patch.object(r, 'HERE', root / 'new'), patch.object(r, 'OUT', root / 'raw'), \
                 patch.object(r.previous, 'HERE', root / 'still-running'), \
                 patch.object(r.previous, 'load') as load:
                with self.assertRaises(FileNotFoundError): r.prepare()
                load.assert_not_called()
                self.assertFalse((root / 'new').exists())
                self.assertFalse((root / 'raw').exists())

    def test_changed_driver_or_helper_is_refused(self):
        original = r.digest
        with patch.object(r, 'digest', side_effect=lambda p: 'changed' if Path(p) == r.DRIVER else original(p)):
            with self.assertRaisesRegex(ValueError, 'thermal driver changed'):
                r.dependencies()
        paths = r.dependencies()
        self.assertIn(str((r.THERMAL / 'driver/thermal_settle.py').resolve()), paths)
        self.assertIn(str((r.THERMAL / 'driver/prefill_bench.py').resolve()), paths)

    def prior_fixture(self, root, *, qualified=False, numerical_error=False, enough=False, thermal=True):
        source, output = root / 'prior-wrapper', root / 'prior-output'
        (source / 'execution').mkdir(parents=True)
        raw = output / 'serving'; raw.mkdir(parents=True)
        (source / 'execution/qualification.json').write_text(json.dumps({
            'completed': True, 'qualified': qualified, 'cleanup_complete': True, 'remaining_jobs': []}))
        protocol = r.previous.materialize(r.previous.load())
        (source / 'protocol.json').write_text(json.dumps(protocol))
        rows = []
        for n in range(1,17):
            for arm in ('reference','scope'):
                ids = [2] if numerical_error and n == 5 and arm == 'scope' else [1]
                rows.append({'round': n, 'arm': arm, 'text': 'same', 'metrics': {'output_ids': ids},
                             'first_request': {'text': 'same', 'output_ids': [1]},
                             'exclusion': None if n == 1 else ('generator OS thermal/power state unavailable or non-nominal' if thermal else 'swap activity')})
        (raw / 'results.jsonl').write_text(''.join(json.dumps(row)+'\n' for row in rows))
        report = {'completed': True, 'qualified': qualified, 'summary': [{'pairs': [{}] * (5 if enough else 1)}]}
        return source, output, report

    def test_completed_numerical_or_materiality_rejections_are_not_repeated(self):
        for options, expected in [({'qualified': True}, 'inconclusively'),
                                  ({'numerical_error': True}, 'numerical counterexamples'),
                                  ({'enough': True}, 'materiality rejection'),
                                  ({'thermal': False}, 'unrelated failure')]:
            with self.subTest(options=options), tempfile.TemporaryDirectory() as directory:
                source, output, report = self.prior_fixture(Path(directory), **options)
                with patch.object(r.previous, 'HERE', source), patch.object(r.previous, 'OUT', output), \
                     patch.object(r.previous.execution, 'assess_serving', return_value=report), \
                     patch.object(r.c.bench, 'startup_summaries', return_value=[{'pairs': [{}]*5}]):
                    with self.assertRaisesRegex(ValueError, expected): r.preserved()

    def test_completed_thermal_inconclusive_cohort_is_preserved_without_reusing_rows(self):
        with tempfile.TemporaryDirectory() as directory:
            source, output, report = self.prior_fixture(Path(directory))
            before = (output / 'serving/results.jsonl').read_bytes()
            with patch.object(r.previous, 'HERE', source), patch.object(r.previous, 'OUT', output), \
                 patch.object(r.previous.execution, 'assess_serving', return_value=report), \
                 patch.object(r.c.bench, 'startup_summaries', return_value=[{'pairs': [{}]}]):
                proof = r.preserved()
            self.assertEqual((output / 'serving/results.jsonl').read_bytes(), before)
            self.assertEqual(proof['assessment'], report)
            self.assertIn('none enter the new cohort', proof['meaning'])

    def test_admission_failure_does_not_launch_and_dispatch_keeps_full_guard(self):
        value = r.previous.load()
        protocol = r.materialize(value)
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with patch.object(r, 'HERE', root / 'source'), patch.object(r, 'OUT', root / 'raw'), \
                 patch.object(r.core, 'allowance'), \
                 patch.object(r.execution, 'load_serving', return_value=(value, protocol)), \
                 patch.object(r.core, 'readiness', side_effect=RuntimeError('not nominal')), \
                 patch.object(r.core, 'execute') as execute:
                with self.assertRaisesRegex(RuntimeError, 'not nominal'): r.run('future')
                execute.assert_not_called()
                self.assertFalse((root / 'raw').exists())
            captured = {}
            def execute(command, target, seconds, policy, assessment, limit, attempt, progress):
                captured.update(command=command, seconds=seconds, policy=policy, attempt=attempt)
                return {'completed': False, 'qualified': False, 'synthetic': True}
            with patch.object(r, 'HERE', root / 'source'), patch.object(r, 'OUT', root / 'raw'), \
                 patch.object(r.core, 'allowance'), \
                 patch.object(r.execution, 'load_serving', return_value=(value, protocol)), \
                 patch.object(r.core, 'readiness', return_value=(9999999999, {}, {'ready': True})), \
                 patch.object(r, 'digest', return_value='synthetic'), \
                 patch.object(r.core, 'execute', side_effect=execute), \
                 patch.object(r.execution, 'finalize', side_effect=lambda target, result: result):
                result = r.run('future')
            self.assertTrue(result['synthetic'])
            self.assertEqual(captured['command'][1], str(r.DRIVER))
            self.assertEqual(captured['seconds'], 15000)
            policy = captured['policy']
            self.assertEqual(policy['startup_reclaimable_bytes'], 20_112_000_000)
            self.assertEqual(policy['minimum_live_reclaimable_bytes'], 3_000_000_000)
            self.assertEqual(policy['maximum_owned_rss_bytes'], 12_000_000_000)
            self.assertTrue(policy['stop_on_new_swapouts'])


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 0259fcd3c84199b7dd8d1b2949021986afae88986eb6410999748eb28efe9b50

Encoding: `utf-8`. Original bytes: 792.

````````````text
test_admission_failure_does_not_launch_and_dispatch_keeps_full_guard (__main__.ScopeBindingChecks) ... ok
test_allowance_includes_all_32_added_waits_and_original_work (__main__.ScopeBindingChecks) ... ok
test_changed_driver_or_helper_is_refused (__main__.ScopeBindingChecks) ... ok
test_completed_numerical_or_materiality_rejections_are_not_repeated (__main__.ScopeBindingChecks) ... ok
test_completed_thermal_inconclusive_cohort_is_preserved_without_reusing_rows (__main__.ScopeBindingChecks) ... ok
test_exact_original_workload_and_acceptance_are_preserved (__main__.ScopeBindingChecks) ... ok
test_live_or_unqualified_prior_evidence_creates_no_successor (__main__.ScopeBindingChecks) ... ok

----------------------------------------------------------------------
Ran 7 tests in 2.604s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 480d822472f71a230b5a4f17010daa57209dcdbe0ef43a0ef2270654e2fd8a7e

Encoding: `utf-8`. Original bytes: 11096.

````````````text
"""Prospective full scope cohort with bounded prelaunch thermal settling.

Preparation is permitted only after V377 has finished and is inconclusive from
too few eligible pairs. All original workload/acceptance rules remain. The new
whole-run allowance separately includes every added prelaunch wait.
"""
import argparse
import copy
import fcntl
import importlib.util
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
PREVIOUS = BASE / 'scope-serving-resource-resume-v377/run.py'
THERMAL = BASE / 'thermal-settle-preparation-v388'
DRIVER = THERMAL / 'driver/serve_bench.py'
SETTLE = {'stable_seconds': 30, 'maximum_wait_seconds': 300, 'poll_seconds': 2}
ORIGINAL_SECONDS = 5400
ADDED_WAIT_SECONDS = 32 * SETTLE['maximum_wait_seconds']
WORK_SECONDS = ORIGINAL_SECONDS + ADDED_WAIT_SECONDS
CLEANUP_SECONDS = 60


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


previous = module('scope_v377_preserved', PREVIOUS)
execution = module('scope_v389_original_assessment', previous.ORIGINAL)
c, core = execution.c, execution.core
digest, require = execution.digest, execution.require
OUT = execution.ROOT / '.build/optimization/thermally-settled-scope-v389'


def dependencies():
    files = [Path(__file__), PREVIOUS, previous.HERE / 'preparation.json',
             previous.HERE / 'protocol.json', previous.HERE / 'binding.json',
             THERMAL / 'thermal_settle.py', THERMAL / 'build_driver.py',
             THERMAL / 'driver-transformation.json', THERMAL / 'checks.py',
             THERMAL / 'checks.stderr', DRIVER, THERMAL / 'driver/thermal_settle.py',
             THERMAL / 'driver/prefill_bench.py', execution.ROOT / 'Tools/thermal_readiness.py',
             execution.ROOT / 'Tools/optimization_readiness.py']
    transform = c.read(THERMAL / 'driver-transformation.json')
    require(transform['original_sha256'] == digest(execution.ROOT / 'Tools/serve_bench.py')
            and transform['driver_sha256'] == digest(DRIVER), 'isolated thermal driver changed')
    for name, expected in transform['source_files'].items():
        require(digest(Path(name)) == expected, 'thermal driver dependency changed')
    for name, source in [('thermal_settle.py', THERMAL / 'thermal_settle.py'),
                         ('prefill_bench.py', execution.ROOT / 'Tools/prefill_bench.py')]:
        require((THERMAL / 'driver' / name).read_bytes() == source.read_bytes(), 'packaged helper differs from source')
    checks = (THERMAL / 'checks.stderr').read_text()
    require('Ran 13 tests' in checks and checks.endswith('OK\n'), 'thermal preparation checks must pass')
    return {str(p.resolve()): digest(p) for p in files}


def preserved():
    folder = previous.HERE / 'execution'
    receipt = c.read(folder / 'qualification.json')
    require(receipt.get('completed') is True and receipt.get('qualified') is False
            and receipt.get('cleanup_complete') is True and receipt.get('remaining_jobs') == [],
            'previous full cohort must finish inconclusively and drain before preparing a successor')
    report = previous.execution.assess_serving()
    require(report['completed'] is True and report['qualified'] is False,
            'previous cohort must not be repeated after qualification')
    protocol = c.read(previous.HERE / 'protocol.json')
    raw = previous.OUT / 'serving'
    rows = [json.loads(line) for line in (raw / 'results.jsonl').read_text().splitlines()]
    for number in range(1, 17):
        pair = [row for row in rows if row['round'] == number]
        require(len(pair) == 2 and pair[0]['text'] == pair[1]['text']
                and pair[0]['metrics']['output_ids'] == pair[1]['metrics']['output_ids']
                and pair[0]['first_request']['output_ids'] == pair[1]['first_request']['output_ids']
                and pair[0]['first_request']['text'] == pair[1]['first_request']['text'],
                'numerical counterexamples cannot be resolved by thermal settling')
    startup = c.bench.startup_summaries(rows, 'reference')
    insufficient = (any(len(item['pairs']) < protocol['acceptance']['minimum_pairs'] for item in report['summary'])
                    or any(len(item['pairs']) < protocol['startup_acceptance']['minimum_pairs'] for item in startup))
    require(insufficient and any('thermal/power' in (row.get('exclusion') or '') for row in rows),
            'a materiality rejection or unrelated failure does not authorize this thermal successor')
    return {'raw': c.artifact_hashes(raw), 'execution': c.artifact_hashes(folder),
            'assessment': report, 'startup_summary': startup,
            'meaning': 'Preserved complete original V377 observations; none enter the new cohort.'}


def materialize(value):
    old = previous.materialize(value)
    result = copy.deepcopy(old)
    result['label'] = 'thermally-settled-scope-v389'
    result['classification'] = ('New full 32-cell scope cohort. Each cell retains its original 60-second cooldown '
        'then waits at most 300 additional seconds for 30 seconds of sampled nominal conditions. '
        'Original V170/V377 workload, memory target, 32 first requests, acceptance and exclusions remain. '
        'All old rows stay excluded from new evidence; no replacement or default activation.')
    result['before_cell_thermal_settle'] = dict(SETTLE)
    restored = copy.deepcopy(result)
    restored.pop('before_cell_thermal_settle')
    for key in ('label', 'classification'): restored[key] = old[key]
    require(restored == old, 'original workload, controls or acceptance changed')
    return result


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'already prepared or attempted')
    prior = preserved()
    value = previous.load()
    materialize(value)
    record = {'prepared_at': core.now(), 'dependencies': dependencies(), 'preserved': prior,
              'build': value['build'], 'native_proof': previous.original.prerequisites(),
              'original_work_seconds': ORIGINAL_SECONDS, 'additional_wait_seconds': ADDED_WAIT_SECONDS,
              'whole_work_seconds': WORK_SECONDS, 'cleanup_seconds': CLEANUP_SECONDS,
              'settle_policy': SETTLE, 'model_launched': False}
    c.write_new(HERE / 'preparation.json', record)
    return {'prepared': True, 'model_launched': False, 'fixed_cells': 32,
            'whole_work_seconds': WORK_SECONDS, 'additional_wait_seconds': ADDED_WAIT_SECONDS}


def load():
    record, value = c.read(HERE / 'preparation.json'), previous.load()
    require(record['dependencies'] == dependencies() and record['preserved'] == preserved()
            and record['build'] == value['build']
            and record['native_proof'] == previous.original.prerequisites()
            and record['original_work_seconds'] == ORIGINAL_SECONDS == previous.original.SERVING_SECONDS
            and record['additional_wait_seconds'] == ADDED_WAIT_SECONDS
            and record['whole_work_seconds'] == WORK_SECONDS
            and record['cleanup_seconds'] == CLEANUP_SECONDS and record['settle_policy'] == SETTLE,
            'new source, prerequisite, original evidence or time/settling contract changed')
    return value


execution.HERE, execution.OUT = HERE, OUT
execution.load = load
execution.materialize = materialize
execution.prerequisites = previous.original.prerequisites


def assess():
    result = execution.assess_serving()
    raw = OUT / 'serving'
    manifest = c.read(raw / 'manifest.json')
    require(manifest['harness_sources']['serve_bench.py'] == digest(DRIVER)
            and manifest['harness_sources']['prefill_bench.py'] == digest(THERMAL / 'driver/prefill_bench.py'),
            'executed isolated driver or helper differs')
    for line in (raw / 'results.jsonl').read_text().splitlines():
        row = json.loads(line); observed = row.get('thermal_settle', {})
        require(observed.get('enabled') is True and observed.get('reserved') is True
                and observed.get('before_launch_only') is True
                and observed.get('request_acceptance_unchanged') is True
                and 0 <= observed.get('seconds', -1) <= SETTLE['maximum_wait_seconds']
                and observed.get('sampled_nominal_seconds', 0) >= SETTLE['stable_seconds']
                and observed.get('samples', 0) >= 16, 'completed cell lacks the declared thermal precondition')
    return result


def run(deadline):
    core.allowance(deadline, WORK_SECONDS + CLEANUP_SECONDS)
    value, protocol = execution.load_serving()
    target, output = HERE / 'execution', OUT / 'serving'
    require(not target.exists() and not output.exists(), 'attempted cohort cannot retry')
    limit, before, thermal = core.readiness(deadline, WORK_SECONDS + CLEANUP_SECONDS, execution.STARTUP_GB)
    policy = dict(c.NATIVE_POLICY, startup_reclaimable_bytes=int(execution.STARTUP_GB * 1e9),
                  maximum_owned_rss_bytes=12_000_000_000, maximum_build_seconds=WORK_SECONDS,
                  stop_on_new_swapouts=True)
    command = [sys.executable, str(DRIVER), '--protocol', str(HERE / 'protocol.json'), '--out', str(output)]
    attempt = {'started_at': core.now(), 'deadline_utc': deadline, 'command': command, 'environment': {},
               'build': value['build'], 'before': before, 'thermal_prelaunch': thermal, 'policy': policy,
               'protocol_sha256': digest(HERE / 'protocol.json'), 'driver_sha256': digest(DRIVER),
               'preparation_sha256': digest(HERE / 'preparation.json'),
               'classification': protocol['classification']}
    def assessment(code):
        require(code in (0, 1), 'scope serving process failed')
        return assess()
    result = execution.finalize(target, core.execute(command, target, WORK_SECONDS, policy, assessment,
                                                    limit, attempt, output / 'results.jsonl'))
    if output.exists(): c.write_new(target / 'artifact-sha256.json', c.artifact_hashes(output))
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=('prepare', 'freeze', 'status', 'run'))
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.action == 'prepare': result = prepare()
        elif args.action == 'freeze': result = execution.freeze_serving()
        elif args.action == 'status':
            load(); result = {'frozen': (HERE / 'protocol.json').exists(), 'attempted': (HERE / 'execution').exists()}
        else:
            require(args.deadline is not None, 'full user-authorized interval required')
            result = run(args.deadline)
    print(json.dumps(result, indent=2), flush=True)
    return 1 if args.action == 'run' and result.get('qualified') is not True else 0


if __name__ == '__main__':
    raise SystemExit(main())

````````````
