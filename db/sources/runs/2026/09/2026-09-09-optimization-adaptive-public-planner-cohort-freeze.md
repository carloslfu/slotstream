---
type: run
id: 01m22tv178ab3589qnxkv0400f
created: 2026-09-09T10:18:56.616343+00:00
updated: 2026-09-09T10:18:56.924249+00:00
summary: Three original public-planner cohorts rebound to the exact seven-case-qualified candidate
binary: /Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream
captured_at: 2026-09-09
command: V505 seven model-free adapter checks, original-workload reconstruction, actual native proof verification and prospective preparation
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Three original public-planner cohorts rebound to the exact seven-case-qualified candidate
tool: Slotstream exact native and source qualification capture
---
All three unrun V475 original workloads are rebound to V492 after all seven current native cases pass and V484 original explicit scope qualifies. Only binary paths, evidence label and classification change. Every original fixture, 16 alternating pairs, 32 measured plus 32 first responses, 16 outputs, actual public planner observation, prefix-allocation/no-reuse rule, process target/cap, original timing/startup acceptance, exclusions, quiet periods, guards and full 15,000-second work plus 60-second cleanup allowance remains. Exact chunks/targets are 256/10 GB, 512/12 GB and 1024/16 GB, each four full passes plus three tail tokens. Seven model-free checks pass, including the actual current native import path. The initial six-check adapter missed the literal /tmp versus /private/tmp import-name mismatch; preparation refused before any study directory or model launch. Its original source/check outputs remain preserved. The fix imports the frozen native executor at its original path and adds a real proof regression check. All three current cohorts are prepared and unrun at this capture; no earlier study is retried, pooled or replaced.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/checks.py",
    "bytes": 4673,
    "sha256": "795f59a8fa7e384df6091e8df9b74b4aeb9799b686a40bffbdd9221e87c675f1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/checks.stderr",
    "bytes": 105,
    "sha256": "c818c8cbab804f12ca7fe7b305287d1e8cf1e2e28915ce6e5496efa00ea5160b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/initial-checks.py",
    "bytes": 4353,
    "sha256": "5893545a6787ccc32951736614ee26ce486441624d5e6f7c1cc12ac66d557a5c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/initial-checks.stderr",
    "bytes": 104,
    "sha256": "bfbc056a35d4f8e02168daee35a768fb736497f3a5ffd2892af4bf0955385137"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/initial-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/initial-run.py",
    "bytes": 7147,
    "sha256": "b62241dedb394fe945bfa9d85a8b11ff0ff1deab4d6293cead6bf4e89a85d420"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/planner-1024/binding.json",
    "bytes": 184,
    "sha256": "d4a1c374704fa3caeb00aae3c9bb0e6e9e984691b35e390b1c910c7849517942"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/planner-1024/protocol.json",
    "bytes": 10095,
    "sha256": "023d3b57843028a2dce301c0a5478edac150631f33bcfeb0b38f3491f75d6af7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/planner-256/binding.json",
    "bytes": 184,
    "sha256": "0e2dcb6a3720bfa76fef1c5d75b61596e002f3f44ad986dd857c2b019df70f8e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/planner-256/protocol.json",
    "bytes": 10090,
    "sha256": "7b99f1582a09f909b352f6311a888ab7f1d7e75d0f8bda96d7246525b686a8d4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/planner-512/binding.json",
    "bytes": 184,
    "sha256": "e1eaf2c070a80872d2c3ec7f91091aa8a5f62e9f66b12e22d6c3755b6683b92f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/planner-512/protocol.json",
    "bytes": 10090,
    "sha256": "8d9dbd78d085dfa248f445e34bacc32666ee2a1c384fc215d0ff14abcca448c1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/preparation.json",
    "bytes": 64014,
    "sha256": "8ddba14439f00defec48bda1b40cb5aacf3050b6b389898f41dc64beb4966eb4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/run.py",
    "bytes": 7339,
    "sha256": "a62ada2c0faafee867e7aba72303ddb2c6219d16044cc859c80d8a2551b8e19f"
  }
]
```

## Artifact SHA-256 795f59a8fa7e384df6091e8df9b74b4aeb9799b686a40bffbdd9221e87c675f1

Encoding: `utf-8`. Original bytes: 4673.

````````````text
"""Model-free binding and actual-dispatch checks; no model execution."""
from pathlib import Path
import copy
import datetime
import importlib.util
import inspect
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('v505_checks', HERE / 'run.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


class Checks(unittest.TestCase):
    def test_current_native_identity_revalidates_through_the_real_import_path(self):
        build, proof = m.prerequisites()
        self.assertEqual(build, m.native.load()['build'])
        self.assertEqual(set(proof['current_native']), set(m.native.NATIVE))
        self.assertEqual(len(proof['current_native']), 7)

    def test_only_build_and_evidence_identity_changes(self):
        for name in m.prior.PROFILES:
            old, new = m.prior.materialize(name), m.materialize(name)
            self.assertEqual(old, m.c.read(m.prior.HERE / name / 'protocol.json'))
            self.assertNotEqual(old['binary'], new['binary'])
            restored = copy.deepcopy(new)
            for key in ['binary', 'label', 'classification']:
                restored[key] = old[key]
            for arm in restored['arms']:
                restored['arms'][arm]['binary'] = old['arms'][arm]['binary']
            self.assertEqual(restored, old)

    def test_original_executor_assessor_and_limits_preserved(self):
        for name in ['run', 'assess', 'policy']:
            self.assertEqual(inspect.getsource(getattr(m.runner, name)),
                             inspect.getsource(getattr(m.prior, name)))
        self.assertEqual(m.runner.WORK_SECONDS, 15000)
        self.assertEqual(m.runner.CLEANUP_SECONDS, 60)
        for name in m.prior.PROFILES:
            self.assertEqual(m.runner.policy(name), m.prior.policy(name))

    def test_four_full_pass_fixtures_and_prefix_geometry_preserved(self):
        for name, (chunk, memory) in m.prior.PROFILES.items():
            rows = m.runner.fixtures(chunk)
            protocol = m.materialize(name)
            self.assertEqual(protocol['rounds'], 16)
            self.assertEqual(protocol['max_tokens'], 16)
            self.assertEqual(protocol['memory_gb'], memory)
            for phase in ['first', 'measured']:
                self.assertEqual(rows[phase]['tokens'], chunk * 4 + 3)
            self.assertNotEqual(rows['first']['prompt_ids'], rows['measured']['prompt_ids'])
            for arm in protocol['arms'].values():
                # Prefix allocation remains enabled, while its optional
                # checkpoint cannot split the minimum-size numerical group.
                self.assertEqual(arm['env']['SLOTSTREAM_OPT_PREFIX_CHECKPOINT'], '0')
                self.assertNotIn('SLOTSTREAM_PREFILL_CHUNK', arm['env'])

    def test_incomplete_native_proof_cannot_qualify_serving(self):
        with patch.object(m.native, 'load', return_value={'build': {}}), \
             patch.object(m.c, 'read', return_value={'qualified': False}):
            with self.assertRaisesRegex(ValueError, 'every exact-current native case'):
                m.prerequisites()

    def test_full_interval_required_before_build_or_model_access(self):
        deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(seconds=1)).isoformat()
        for name in m.prior.PROFILES:
            with patch.object(m.runner, 'load', side_effect=AssertionError('no build access')) as load:
                with self.assertRaisesRegex(ValueError, 'original work allowance and cleanup must fit'):
                    m.runner.run(name, deadline)
                load.assert_not_called()

    def test_actual_dispatch_retains_each_original_resource_policy(self):
        deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(hours=5)).isoformat()
        for name in m.prior.PROFILES:
            value = {'profiles': {name: {'protocol': m.materialize(name)}}}
            with patch.object(m.runner, 'load', return_value=value), \
                 patch.object(m.runner.core, 'readiness', side_effect=RuntimeError('intercepted admission')) as ready, \
                 patch.object(m.runner.core, 'execute', side_effect=AssertionError('no model')) as execute:
                with self.assertRaisesRegex(RuntimeError, 'intercepted admission'):
                    m.runner.run(name, deadline)
                ready.assert_called_once_with(deadline, 15060,
                                               m.prior.policy(name)['startup_reclaimable_bytes'] / 1e9)
                execute.assert_not_called()


if __name__ == '__main__':
    unittest.main()

````````````

## Artifact SHA-256 c818c8cbab804f12ca7fe7b305287d1e8cf1e2e28915ce6e5496efa00ea5160b

Encoding: `utf-8`. Original bytes: 105.

````````````text
.......
----------------------------------------------------------------------
Ran 7 tests in 0.215s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 5893545a6787ccc32951736614ee26ce486441624d5e6f7c1cc12ac66d557a5c

Encoding: `utf-8`. Original bytes: 4353.

````````````text
"""Model-free binding and actual-dispatch checks; no model execution."""
from pathlib import Path
import copy
import datetime
import importlib.util
import inspect
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('v505_checks', HERE / 'run.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


class Checks(unittest.TestCase):
    def test_only_build_and_evidence_identity_changes(self):
        for name in m.prior.PROFILES:
            old, new = m.prior.materialize(name), m.materialize(name)
            self.assertEqual(old, m.c.read(m.prior.HERE / name / 'protocol.json'))
            self.assertNotEqual(old['binary'], new['binary'])
            restored = copy.deepcopy(new)
            for key in ['binary', 'label', 'classification']:
                restored[key] = old[key]
            for arm in restored['arms']:
                restored['arms'][arm]['binary'] = old['arms'][arm]['binary']
            self.assertEqual(restored, old)

    def test_original_executor_assessor_and_limits_preserved(self):
        for name in ['run', 'assess', 'policy']:
            self.assertEqual(inspect.getsource(getattr(m.runner, name)),
                             inspect.getsource(getattr(m.prior, name)))
        self.assertEqual(m.runner.WORK_SECONDS, 15000)
        self.assertEqual(m.runner.CLEANUP_SECONDS, 60)
        for name in m.prior.PROFILES:
            self.assertEqual(m.runner.policy(name), m.prior.policy(name))

    def test_four_full_pass_fixtures_and_prefix_geometry_preserved(self):
        for name, (chunk, memory) in m.prior.PROFILES.items():
            rows = m.runner.fixtures(chunk)
            protocol = m.materialize(name)
            self.assertEqual(protocol['rounds'], 16)
            self.assertEqual(protocol['max_tokens'], 16)
            self.assertEqual(protocol['memory_gb'], memory)
            for phase in ['first', 'measured']:
                self.assertEqual(rows[phase]['tokens'], chunk * 4 + 3)
            self.assertNotEqual(rows['first']['prompt_ids'], rows['measured']['prompt_ids'])
            for arm in protocol['arms'].values():
                # Prefix allocation remains enabled, while its optional
                # checkpoint cannot split the minimum-size numerical group.
                self.assertEqual(arm['env']['SLOTSTREAM_OPT_PREFIX_CHECKPOINT'], '0')
                self.assertNotIn('SLOTSTREAM_PREFILL_CHUNK', arm['env'])

    def test_incomplete_native_proof_cannot_qualify_serving(self):
        with patch.object(m.native, 'load', return_value={'build': {}}), \
             patch.object(m.c, 'read', return_value={'qualified': False}):
            with self.assertRaisesRegex(ValueError, 'every exact-current native case'):
                m.prerequisites()

    def test_full_interval_required_before_build_or_model_access(self):
        deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(seconds=1)).isoformat()
        for name in m.prior.PROFILES:
            with patch.object(m.runner, 'load', side_effect=AssertionError('no build access')) as load:
                with self.assertRaisesRegex(ValueError, 'original work allowance and cleanup must fit'):
                    m.runner.run(name, deadline)
                load.assert_not_called()

    def test_actual_dispatch_retains_each_original_resource_policy(self):
        deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(hours=5)).isoformat()
        for name in m.prior.PROFILES:
            value = {'profiles': {name: {'protocol': m.materialize(name)}}}
            with patch.object(m.runner, 'load', return_value=value), \
                 patch.object(m.runner.core, 'readiness', side_effect=RuntimeError('intercepted admission')) as ready, \
                 patch.object(m.runner.core, 'execute', side_effect=AssertionError('no model')) as execute:
                with self.assertRaisesRegex(RuntimeError, 'intercepted admission'):
                    m.runner.run(name, deadline)
                ready.assert_called_once_with(deadline, 15060,
                                               m.prior.policy(name)['startup_reclaimable_bytes'] / 1e9)
                execute.assert_not_called()


if __name__ == '__main__':
    unittest.main()

````````````

## Artifact SHA-256 bfbc056a35d4f8e02168daee35a768fb736497f3a5ffd2892af4bf0955385137

Encoding: `utf-8`. Original bytes: 104.

````````````text
......
----------------------------------------------------------------------
Ran 6 tests in 0.091s

OK

````````````

## Artifact SHA-256 b62241dedb394fe945bfa9d85a8b11ff0ff1deab4d6293cead6bf4e89a85d420

Encoding: `utf-8`. Original bytes: 7147.

````````````text
"""Fresh exact-source bindings for the three preserved V475 planner workloads."""
from pathlib import Path
import copy
import importlib.util

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
PRIOR = BASE / 'automatic-planner-cohort-v475/run.py'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


prior = module('v505_preserved_workloads', PRIOR)
runner = module('v505_original_execution', PRIOR)
native = module('v505_current_native', BASE / 'adaptive-scope-native-v496/run.py')
c, digest, require = prior.c, prior.digest, prior.require
OUT = prior.ROOT / '.build/optimization/adaptive-public-planner-v505'
BINARY = native.BINARY
SCOPE = BASE / 'scope-quiet-terminal-audit-v499/audit.json'
SCOPE_RECEIPT = BASE / 'scope-quiet-resource-cohort-v484/execution/qualification.json'


def prerequisites():
    value = native.load()
    result = {}
    for name in native.NATIVE:
        target = native.OUT / name
        qualification = c.read(target / 'qualification.json')
        report = c.read(target / 'stdout.txt')
        require(qualification.get('qualified') is True and qualification.get('completed') is True
                and qualification.get('proofs_unchanged') is True
                and qualification.get('cleanup_complete') is True
                and qualification.get('remaining_jobs') == []
                and qualification.get('within_reservation') is True,
                'every exact-current native case must qualify and drain')
        native.assess(name, report)
        require(qualification['stdout_sha256'] == digest(target / 'stdout.txt')
                and qualification['execution_receipt_sha256'] == digest(target / 'receipt.json'),
                'native report or receipt changed')
        result[name] = {file: digest(target / file)
                        for file in ['qualification.json', 'receipt.json', 'stdout.txt']}
    audit, receipt = c.read(SCOPE), c.read(SCOPE_RECEIPT)
    require(audit['assessment']['qualified'] is True
            and audit['all64_exact_prompt_output_text_and_equal_work'] is True
            and audit['all64_original_sampled_physical_caps_pass'] is True
            and receipt['qualified'] is True and receipt['cleanup_complete'] is True
            and receipt['remaining_jobs'] == [] and audit['terminal_receipt_sha256'] == digest(SCOPE_RECEIPT),
            'full isolated original scope qualification missing')
    return value['build'], {'current_native': result, 'scope_audit_sha256': digest(SCOPE),
                             'scope_receipt_sha256': digest(SCOPE_RECEIPT)}


def dependencies():
    result = prior.dependencies()
    files = [Path(__file__), HERE / 'checks.py', HERE / 'checks.stderr', PRIOR,
             prior.HERE / 'preparation.json', native.HERE / 'run.py',
             native.HERE / 'preparation.json', SCOPE, SCOPE_RECEIPT]
    files += [prior.HERE / name / file for name in prior.PROFILES
              for file in ['protocol.json', 'binding.json']]
    result.update({str(path.resolve()): digest(path) for path in files})
    return result


def materialize(name):
    original = prior.materialize(name)
    result = copy.deepcopy(original)
    result['binary'] = str(BINARY)
    for arm in result['arms'].values():
        arm['binary'] = str(BINARY)
    result['label'] = 'adaptive-public-' + name + '-v505'
    result['classification'] = (
        'Exact V492 smaller-group sizing with all seven current native proofs. '
        'Fresh binding of the preserved, unrun V475 workload. Only build paths and '
        'evidence identity change; every original input, control, planner observation, '
        '32 measured plus32 first responses, timing/capacity criterion, quiet period, '
        'resource guard and whole allowance remains. This does not replace any final gate.')
    restored = copy.deepcopy(result)
    for key in ['binary', 'label', 'classification']:
        restored[key] = original[key]
    for name, arm in restored['arms'].items():
        arm['binary'] = original['arms'][name]['binary']
    require(restored == original, 'workload or acceptance changed beyond source binding')
    return result


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'already prepared or attempted')
    prior.load()
    require(all(not (prior.HERE / name / 'execution').exists()
                and not (prior.OUT / name).exists() for name in prior.PROFILES),
            'old frozen identity unexpectedly ran; preserve and review before rebinding')
    checks = (HERE / 'checks.stderr').read_text()
    require('Ran 6 tests' in checks and checks.endswith('OK\n'), 'adapter checks missing')
    build, proof = prerequisites()
    protocols = {name: materialize(name) for name in prior.PROFILES}
    record = {'prepared_at': prior.core.now(), 'build': build, 'native_proof': proof,
              'dependencies': dependencies(), 'work_seconds': prior.WORK_SECONDS,
              'cleanup_seconds': prior.CLEANUP_SECONDS, 'model_launched': False,
              'profiles': {name: {'protocol': p, 'policy': prior.policy(name)} for name, p in protocols.items()},
              'classification': 'Current-source successors only. Original V475 freezes remain intact and unrun.'}
    c.write_new(HERE / 'preparation.json', record)
    for name, p in protocols.items():
        target = HERE / name
        target.mkdir()
        c.write_new(target / 'protocol.json', p)
        c.write_new(target / 'binding.json', {'protocol_sha256': digest(target / 'protocol.json'),
                                             'preparation_sha256': digest(HERE / 'preparation.json')})
    return {'prepared': True, 'frozen': list(prior.PROFILES), 'model_launched': False}


def load():
    prior.load()
    record = c.read(HERE / 'preparation.json')
    build, proof = prerequisites()
    require(record['dependencies'] == dependencies() and record['build'] == build
            and record['native_proof'] == proof and record['work_seconds'] == prior.WORK_SECONDS == 15000
            and record['cleanup_seconds'] == prior.CLEANUP_SECONDS == 60,
            'exact source/native/isolated proof or allowance changed')
    for name in prior.PROFILES:
        target = HERE / name
        protocol, binding = c.read(target / 'protocol.json'), c.read(target / 'binding.json')
        require(protocol == materialize(name) == record['profiles'][name]['protocol']
                and record['profiles'][name]['policy'] == prior.policy(name)
                and binding == {'protocol_sha256': digest(target / 'protocol.json'),
                                'preparation_sha256': digest(HERE / 'preparation.json')},
                'fixed workload, policy or binding changed')
    return record


runner.HERE, runner.OUT = HERE, OUT
runner.fixtures = prior.fixtures
runner.dependencies, runner.materialize = dependencies, materialize
runner.prepare, runner.load = prepare, load
runner.core.load = load


if __name__ == '__main__':
    raise SystemExit(runner.main())

````````````

## Artifact SHA-256 d4a1c374704fa3caeb00aae3c9bb0e6e9e984691b35e390b1c910c7849517942

Encoding: `utf-8`. Original bytes: 184.

````````````text
{
  "protocol_sha256": "023d3b57843028a2dce301c0a5478edac150631f33bcfeb0b38f3491f75d6af7",
  "preparation_sha256": "8ddba14439f00defec48bda1b40cb5aacf3050b6b389898f41dc64beb4966eb4"
}

````````````

## Artifact SHA-256 023d3b57843028a2dce301c0a5478edac150631f33bcfeb0b38f3491f75d6af7

Encoding: `utf-8`. Original bytes: 10095.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
  "memory_gb": 16,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 16000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
      "chunk": 1024,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0"
      }
    },
    "automatic": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
      "chunk": 1024,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1"
      }
    }
  },
  "label": "adaptive-public-planner-1024-v505",
  "classification": "Exact V492 smaller-group sizing with all seven current native proofs. Fresh binding of the preserved, unrun V475 workload. Only build paths and evidence identity change; every original input, control, planner observation, 32 measured plus32 first responses, timing/capacity criterion, quiet period, resource guard and whole allowance remains. This does not replace any final gate.",
  "fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/1024-measured.txt",
  "fixture_sha256": "83187d500329183727b7fb4f4a9c7a9631f8f5e0582b745f1ca043418767632b",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "conditions": "Separate prospective actual-planner policy experiment, not a successor or replacement for the original explicit-scope study. No forced prefill chunk, pool, simulated availability or prefix-disable switch. Both arms retain the same actual target-driven pool and prefix allocation. First and measured inputs each contain exactly four full chronological passes plus three tail tokens, with frozen distinct prompt IDs and no reuse. The automatic arm must actually group the four full passes and leave the tail unchanged. Other controls are identical. Sixteen fixed alternating pairs, 32 measured plus 32 first responses, 16 outputs, min5 clean pairs, 5percent median client gain, 80percent positive, separate min5 first-job pairs and at most5percent first-job regression. Exact IDs/text and logical/model work on every completed cell, including timing exclusions. Original quiet/cooling/live guards, exact target footprint cap and no replacements. This does not qualify short/prefix reuse or MTP final workloads, which remain separately required.",
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "think": false,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeModelTokens",
    "decodeForwardPasses",
    "draftedTokens",
    "verifyPasses"
  ],
  "work_constraints": {
    "reference": {
      "prefillTokens": {
        "min": 4099,
        "max": 4099
      },
      "decodeTokens": {
        "min": 16,
        "max": 16
      },
      "decodeModelTokens": {
        "min": 15,
        "max": 15
      },
      "decodeForwardPasses": {
        "min": 15,
        "max": 15
      },
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 0,
        "max": 0
      }
    },
    "automatic": {
      "prefillTokens": {
        "min": 4099,
        "max": 4099
      },
      "decodeTokens": {
        "min": 16,
        "max": 16
      },
      "decodeModelTokens": {
        "min": 15,
        "max": 15
      },
      "decodeForwardPasses": {
        "min": 15,
        "max": 15
      },
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 0,
        "max": 0
      }
    }
  },
  "primary_metric": "Paired full-client request latency with demonstrated prefill read reduction and exact output at one unchanged10GB target; first-job and peak constraints remain independent.",
  "before_cell_thermal_settle": {
    "stable_seconds": 60,
    "maximum_wait_seconds": 300,
    "poll_seconds": 2
  },
  "abort_on_resource_failure": true,
  "warmup_fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/1024-first.txt",
  "warmup_fixture_sha256": "6bacff526572f22fdfd8f269e0affe9b33e60bd1982cecdfd7daff64d179250f",
  "prefix_cache": {
    "retention_only": true,
    "expected_reused_tokens": {
      "reference": 0,
      "automatic": 0
    }
  },
  "automatic_scope_measurement": {
    "purpose": "Actual public planner selects its bounded geometry; exact four full chronological passes plus an odd tail test the minimum automatic grouping threshold.",
    "expect_grouped_prefill": true
  }
}

````````````

## Artifact SHA-256 0e2dcb6a3720bfa76fef1c5d75b61596e002f3f44ad986dd857c2b019df70f8e

Encoding: `utf-8`. Original bytes: 184.

````````````text
{
  "protocol_sha256": "7b99f1582a09f909b352f6311a888ab7f1d7e75d0f8bda96d7246525b686a8d4",
  "preparation_sha256": "8ddba14439f00defec48bda1b40cb5aacf3050b6b389898f41dc64beb4966eb4"
}

````````````

## Artifact SHA-256 7b99f1582a09f909b352f6311a888ab7f1d7e75d0f8bda96d7246525b686a8d4

Encoding: `utf-8`. Original bytes: 10090.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
  "memory_gb": 10,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 10000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0"
      }
    },
    "automatic": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1"
      }
    }
  },
  "label": "adaptive-public-planner-256-v505",
  "classification": "Exact V492 smaller-group sizing with all seven current native proofs. Fresh binding of the preserved, unrun V475 workload. Only build paths and evidence identity change; every original input, control, planner observation, 32 measured plus32 first responses, timing/capacity criterion, quiet period, resource guard and whole allowance remains. This does not replace any final gate.",
  "fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/256-measured.txt",
  "fixture_sha256": "d6307260f0f89570117e7243fd59580cd879c8c7ddc2e1df2be0242ab45bcb91",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "conditions": "Separate prospective actual-planner policy experiment, not a successor or replacement for the original explicit-scope study. No forced prefill chunk, pool, simulated availability or prefix-disable switch. Both arms retain the same actual target-driven pool and prefix allocation. First and measured inputs each contain exactly four full chronological passes plus three tail tokens, with frozen distinct prompt IDs and no reuse. The automatic arm must actually group the four full passes and leave the tail unchanged. Other controls are identical. Sixteen fixed alternating pairs, 32 measured plus 32 first responses, 16 outputs, min5 clean pairs, 5percent median client gain, 80percent positive, separate min5 first-job pairs and at most5percent first-job regression. Exact IDs/text and logical/model work on every completed cell, including timing exclusions. Original quiet/cooling/live guards, exact target footprint cap and no replacements. This does not qualify short/prefix reuse or MTP final workloads, which remain separately required.",
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "think": false,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeModelTokens",
    "decodeForwardPasses",
    "draftedTokens",
    "verifyPasses"
  ],
  "work_constraints": {
    "reference": {
      "prefillTokens": {
        "min": 1027,
        "max": 1027
      },
      "decodeTokens": {
        "min": 16,
        "max": 16
      },
      "decodeModelTokens": {
        "min": 15,
        "max": 15
      },
      "decodeForwardPasses": {
        "min": 15,
        "max": 15
      },
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 0,
        "max": 0
      }
    },
    "automatic": {
      "prefillTokens": {
        "min": 1027,
        "max": 1027
      },
      "decodeTokens": {
        "min": 16,
        "max": 16
      },
      "decodeModelTokens": {
        "min": 15,
        "max": 15
      },
      "decodeForwardPasses": {
        "min": 15,
        "max": 15
      },
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 0,
        "max": 0
      }
    }
  },
  "primary_metric": "Paired full-client request latency with demonstrated prefill read reduction and exact output at one unchanged10GB target; first-job and peak constraints remain independent.",
  "before_cell_thermal_settle": {
    "stable_seconds": 60,
    "maximum_wait_seconds": 300,
    "poll_seconds": 2
  },
  "abort_on_resource_failure": true,
  "warmup_fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/256-first.txt",
  "warmup_fixture_sha256": "8eb45c0add6ef3331864f6fee894b5ce37612e92946bd13fb313ca36d6ae2139",
  "prefix_cache": {
    "retention_only": true,
    "expected_reused_tokens": {
      "reference": 0,
      "automatic": 0
    }
  },
  "automatic_scope_measurement": {
    "purpose": "Actual public planner selects its bounded geometry; exact four full chronological passes plus an odd tail test the minimum automatic grouping threshold.",
    "expect_grouped_prefill": true
  }
}

````````````

## Artifact SHA-256 e1eaf2c070a80872d2c3ec7f91091aa8a5f62e9f66b12e22d6c3755b6683b92f

Encoding: `utf-8`. Original bytes: 184.

````````````text
{
  "protocol_sha256": "8d9dbd78d085dfa248f445e34bacc32666ee2a1c384fc215d0ff14abcca448c1",
  "preparation_sha256": "8ddba14439f00defec48bda1b40cb5aacf3050b6b389898f41dc64beb4966eb4"
}

````````````

## Artifact SHA-256 8d9dbd78d085dfa248f445e34bacc32666ee2a1c384fc215d0ff14abcca448c1

Encoding: `utf-8`. Original bytes: 10090.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
  "memory_gb": 12,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 12000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
      "chunk": 512,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0"
      }
    },
    "automatic": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
      "chunk": 512,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1"
      }
    }
  },
  "label": "adaptive-public-planner-512-v505",
  "classification": "Exact V492 smaller-group sizing with all seven current native proofs. Fresh binding of the preserved, unrun V475 workload. Only build paths and evidence identity change; every original input, control, planner observation, 32 measured plus32 first responses, timing/capacity criterion, quiet period, resource guard and whole allowance remains. This does not replace any final gate.",
  "fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/512-measured.txt",
  "fixture_sha256": "19f859c2a14d9746bd652d39bb0caa65edb42064d0a69bc28d1d3be47c632f23",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "conditions": "Separate prospective actual-planner policy experiment, not a successor or replacement for the original explicit-scope study. No forced prefill chunk, pool, simulated availability or prefix-disable switch. Both arms retain the same actual target-driven pool and prefix allocation. First and measured inputs each contain exactly four full chronological passes plus three tail tokens, with frozen distinct prompt IDs and no reuse. The automatic arm must actually group the four full passes and leave the tail unchanged. Other controls are identical. Sixteen fixed alternating pairs, 32 measured plus 32 first responses, 16 outputs, min5 clean pairs, 5percent median client gain, 80percent positive, separate min5 first-job pairs and at most5percent first-job regression. Exact IDs/text and logical/model work on every completed cell, including timing exclusions. Original quiet/cooling/live guards, exact target footprint cap and no replacements. This does not qualify short/prefix reuse or MTP final workloads, which remain separately required.",
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "think": false,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeModelTokens",
    "decodeForwardPasses",
    "draftedTokens",
    "verifyPasses"
  ],
  "work_constraints": {
    "reference": {
      "prefillTokens": {
        "min": 2051,
        "max": 2051
      },
      "decodeTokens": {
        "min": 16,
        "max": 16
      },
      "decodeModelTokens": {
        "min": 15,
        "max": 15
      },
      "decodeForwardPasses": {
        "min": 15,
        "max": 15
      },
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 0,
        "max": 0
      }
    },
    "automatic": {
      "prefillTokens": {
        "min": 2051,
        "max": 2051
      },
      "decodeTokens": {
        "min": 16,
        "max": 16
      },
      "decodeModelTokens": {
        "min": 15,
        "max": 15
      },
      "decodeForwardPasses": {
        "min": 15,
        "max": 15
      },
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 0,
        "max": 0
      }
    }
  },
  "primary_metric": "Paired full-client request latency with demonstrated prefill read reduction and exact output at one unchanged10GB target; first-job and peak constraints remain independent.",
  "before_cell_thermal_settle": {
    "stable_seconds": 60,
    "maximum_wait_seconds": 300,
    "poll_seconds": 2
  },
  "abort_on_resource_failure": true,
  "warmup_fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/512-first.txt",
  "warmup_fixture_sha256": "cc303d3e3337f323f4f72754a9920fa6de2a8695d229c341a30d16f7bc35c0fc",
  "prefix_cache": {
    "retention_only": true,
    "expected_reused_tokens": {
      "reference": 0,
      "automatic": 0
    }
  },
  "automatic_scope_measurement": {
    "purpose": "Actual public planner selects its bounded geometry; exact four full chronological passes plus an odd tail test the minimum automatic grouping threshold.",
    "expect_grouped_prefill": true
  }
}

````````````

## Artifact SHA-256 8ddba14439f00defec48bda1b40cb5aacf3050b6b389898f41dc64beb4966eb4

Encoding: `utf-8`. Original bytes: 64014.

````````````text
{
  "prepared_at": "2026-09-09T10:18:18.956157+00:00",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "10b63deee430c1e1d5792221f128bea0a6158161911676679665a168116cf743",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "6369274313f2baa58e96a0e81b09878173b24e69149ffc4c939812a4c9b7a763",
      "binary_sha256": "d3701afdb0540850f376ca9a696a2a0ffa31a67121362e341f87ebc9e27fd7dc",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "native_proof": {
    "current_native": {
      "scope-family-2051": {
        "qualification.json": "7411f29f0ffd8f21b9424d9577e47fadb988698526b249a2fa66c6b678cdabee",
        "receipt.json": "9540e825f4aa4c2775e525e2059560fdf03108b89d9085fb8c83b7b5fe34638a",
        "stdout.txt": "7c02a1ac8903d1473cdd697e34ad3be4b7530c5a073f79d33dee29b9606b7cba"
      },
      "scope-family-4096": {
        "qualification.json": "b81a0edbd9e0d35320e0031c899bdd5e61cbd2b3b29e6ed62510d97737eddbe9",
        "receipt.json": "2be332206451fe4eae7fe42bcaa8d990a616a4df3d8d19d46e39535b1ffc9777",
        "stdout.txt": "74f4557310de989b4646be90bf741687dfc35cc1744678124bf9389069ce8281"
      },
      "scope-lifecycle": {
        "qualification.json": "e9d659cc52a25b312807e1acfb7f9fbd684bbf94bd6a3bcfc0a7d68380f90fd0",
        "receipt.json": "742d945c59756263609a1a1677af1f489169494db304f1ae23c4ec9743f37224",
        "stdout.txt": "764d8e8e5cfec3021d70e2fc91720ba17bf1f7cb9b72c40391cf9a94b183bef9"
      },
      "scope-mtp-vision": {
        "qualification.json": "a736a419b84d2509506805cf4672abf1a612033b5a30b814e92ec89d083fcd79",
        "receipt.json": "c797e3a910ea893450b674caa9b143a1c0ef3dc6cae1510fadfd60414e4f9a38",
        "stdout.txt": "f8cc4841050a940ed9dcc269d4d1014908030cd7cecd78801582ea892d3d457a"
      },
      "combined-plain": {
        "qualification.json": "063ceda130f9dd9aed8263a5740546aabe74fef51adfb964c58efe3f10076b80",
        "receipt.json": "26bbb1d7dd3f6778b289d212e6cdec99b1ca21f36f27caaf03ca77d10a016161",
        "stdout.txt": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41"
      },
      "combined-mtp": {
        "qualification.json": "451095f4a77cdbe8e4f9e3f91eaee2a80a69cb7df153e2f3efb0dabed78d1f8e",
        "receipt.json": "08ddbdbfc4462f6a9dd9b08255d967f885e106cbc4fffd38fecd6a2d1d475a67",
        "stdout.txt": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e"
      },
      "read-failure-serving": {
        "qualification.json": "4068134722204b62d1bddb3dff35c950590b1d4ebffdad33f2e19ed783d5081b",
        "receipt.json": "24b0f8bffdb9ac2d51304ac669da2c4f04abb121a26c1185564b8066ad52e36d",
        "stdout.txt": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127"
      }
    },
    "scope_audit_sha256": "889b0bac1ce94174343fe0d11aa0f9abef5858ccd3510c160be5ac248dbe71b6",
    "scope_receipt_sha256": "df07b645b8e6d33cd9621031ecc0c747aded6c0beac9ae323b5d3cd0b2bd6d01"
  },
  "dependencies": {
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/run.py": "3a12dbe6800f3d58d45e0b177e8dc58468f0d9200a96e25483574dadbf813f1f",
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/checks.py": "481b2f356a713bbb8dcb6d6aa605f79fff35e77ca955632da0068a6aa0b54758",
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/checks.stderr": "e1c1ba376351d924973f9defb75f5fad00bd0b562f19b973d7ed63e9c779472b",
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixture-manifest.json": "07a6ae1291ae62d2842262252cdfaaf5ebcd8f703ebfdafff85a2e12ec0f9fa4",
    "/private/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver-transformation.json": "80c3035d058c3ba103674d6ad19a3a2d3fbb9d35a1b2157c03a72ce4308ab941",
    "/private/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/checks.py": "90e21a2eafb6f5698f943b2a6b95f271390877e83ab65c9e8dcd630b2647eeb0",
    "/private/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/checks.stderr": "92a0238dbe51e57d1e6367018d8359c0a8b42d95a19d06e0959987c6b60064ff",
    "/private/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/run.py": "062081c5e30c9eda4b0de1d57d93c1907b70edeb4aae8b4c8e806346eb26cc09",
    "/private/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/protocol.json": "9597d8ba4fc007bc4ee0c700746ce34a7f9de8789d6873be84aab012e57964b0",
    "/private/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/preparation.json": "f35f3b583c95363de208684c3a75bb54271d06f5d918e999067268c28f8b5c5d",
    "/private/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/binding.json": "da9d67e8a31793b5820b0f16e6ad1af6f14dba0048b568bb83a739cdcbf2c2b0",
    "/private/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py": "5793aa8bcb3af55fb99c9da698475ee54272ee791ccef30141c94ba6c405b95f",
    "/private/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/private/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/automatic_scope.py": "a06ac5399853201a7ce92e2f42be98fdffc1131e6fabedb68ea146765b6dfe0b",
    "/private/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/thermal_settle.py": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad",
    "/private/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/serve_bench.py": "3b1d2f37f247b5c786154125d5fadd4500ebf007509c45fddf185681beb583bf",
    "/Users/carlos/Projects/slotstream/Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "/Users/carlos/Projects/slotstream/Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "/Users/carlos/Projects/slotstream/Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "/Users/carlos/Projects/slotstream/Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "/Users/carlos/Projects/slotstream/Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "/Users/carlos/Projects/slotstream/Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "/private/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/run.py": "a62ada2c0faafee867e7aba72303ddb2c6219d16044cc859c80d8a2551b8e19f",
    "/private/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/checks.py": "795f59a8fa7e384df6091e8df9b74b4aeb9799b686a40bffbdd9221e87c675f1",
    "/private/tmp/slotstream-optimization-execution/adaptive-public-planner-v505/checks.stderr": "c818c8cbab804f12ca7fe7b305287d1e8cf1e2e28915ce6e5496efa00ea5160b",
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/preparation.json": "e580f635b7534b436c3b88f03e30948e4ad95740bd6cd61b4b2bd3d14e8d424d",
    "/private/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/run.py": "cd287f95c4ef989a807ebfcffbd3c15b72563c4496e0dbd27411d130a700f937",
    "/private/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/preparation.json": "20fb2090d27c6effaa0ff0da407456fceffc1aedea731afc5caef7dc7d0edc9f",
    "/private/tmp/slotstream-optimization-execution/scope-quiet-terminal-audit-v499/audit.json": "889b0bac1ce94174343fe0d11aa0f9abef5858ccd3510c160be5ac248dbe71b6",
    "/private/tmp/slotstream-optimization-execution/scope-quiet-resource-cohort-v484/execution/qualification.json": "df07b645b8e6d33cd9621031ecc0c747aded6c0beac9ae323b5d3cd0b2bd6d01",
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/planner-256/protocol.json": "7ee899c52b3fdf1e52aa8aa3436a86bd5fa3281c5afe4d5caae18186c2766ceb",
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/planner-256/binding.json": "d970c61a2e6f0e603ec68ae50bb5397bd6199ad42315b893c9537be218663b2a",
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/planner-512/protocol.json": "b315faed1d9af5f36c70270b181ea3e8a80b276c4a03bd9c4eaaa49aca566c6c",
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/planner-512/binding.json": "7c2ce6ab1a5f80f1123377f582d9576f657c98214d814c6e72749347381eb589",
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/planner-1024/protocol.json": "7408bb65fc00c6c7ff659c10ecdf6fe2500318b1545ca2541d6d611725a9bb29",
    "/private/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/planner-1024/binding.json": "4dbbf6e4bcf8ce128fd2a0006cf46ab89e3d1e1a0b9994d80b0de5191a554876"
  },
  "work_seconds": 15000,
  "cleanup_seconds": 60,
  "model_launched": false,
  "profiles": {
    "planner-256": {
      "protocol": {
        "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
        "memory_gb": 10,
        "mtp": "off",
        "raw": true,
        "seed": 7,
        "rounds": 16,
        "comparison_basis": "fixed-pool",
        "maximum_sampled_footprint_bytes": 10000000000,
        "require_nominal_power_state": true,
        "between_cells_seconds": 60,
        "model_reservation_wait_seconds": 1800,
        "arms": {
          "reference": {
            "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
            "chunk": 256,
            "env": {
              "SLOTSTREAM_OPT_COMPACT_STATE": "1",
              "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
              "SLOTSTREAM_OPT_COMPACT_MTP": "1",
              "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
              "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
              "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
              "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
              "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
              "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
              "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
              "SLOTSTREAM_OPT_INDEXER_RAW": "0",
              "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
              "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
              "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
              "SLOTSTREAM_OPT_SWEEP_TILES": "0",
              "SLOTSTREAM_OPT_INDEXER_TILES": "1",
              "SLOTSTREAM_OPT_SHARED_ROPE": "1",
              "SLOTSTREAM_OPT_FUSED_ROPE": "1",
              "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
              "SLOTSTREAM_OPT_GDN_RECORD": "0",
              "SLOTSTREAM_OPT_PLE_TILES": "1",
              "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
              "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
              "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
              "SLOTSTREAM_OPT_MTP_TAIL": "0",
              "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
              "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
              "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
              "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
              "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
              "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
              "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
              "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
              "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
              "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
              "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
              "SLOTSTREAM_OPT_READ_HANDLES": "0",
              "SLOTSTREAM_OPT_COMPILED_NORM": "0",
              "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
              "SLOTSTREAM_OPT_NGRAM_RING": "0",
              "SLOTSTREAM_OPT_EXPERT_MAP": "0",
              "SLOTSTREAM_OPT_POOL_PINS": "0",
              "SLOTSTREAM_OPT_SLOT_SLICES": "0",
              "SLOTSTREAM_OPT_SLOT_WORDS": "0",
              "SLOTSTREAM_OPT_SLOT_CPU": "0",
              "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
              "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
              "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
              "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
              "SLOTSTREAM_OPT_VISION_PADDING": "0",
              "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
              "SLOTSTREAM_OPT_READ_SCOPE": "0",
              "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
              "SLOTSTREAM_EMBEDDING_ROWS": "1",
              "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0"
            }
          },
          "automatic": {
            "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
            "chunk": 256,
            "env": {
              "SLOTSTREAM_OPT_COMPACT_STATE": "1",
              "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
              "SLOTSTREAM_OPT_COMPACT_MTP": "1",
              "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
              "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
              "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
              "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
              "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
              "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
              "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
              "SLOTSTREAM_OPT_INDEXER_RAW": "0",
              "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
              "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
              "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
              "SLOTSTREAM_OPT_SWEEP_TILES": "0",
              "SLOTSTREAM_OPT_INDEXER_TILES": "1",
              "SLOTSTREAM_OPT_SHARED_ROPE": "1",
              "SLOTSTREAM_OPT_FUSED_ROPE": "1",
              "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
              "SLOTSTREAM_OPT_GDN_RECORD": "0",
              "SLOTSTREAM_OPT_PLE_TILES": "1",
              "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
              "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
              "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
              "SLOTSTREAM_OPT_MTP_TAIL": "0",
              "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
              "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
              "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
              "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
              "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
              "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
              "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
              "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
              "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
              "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
              "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
              "SLOTSTREAM_OPT_READ_HANDLES": "0",
              "SLOTSTREAM_OPT_COMPILED_NORM": "0",
              "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
              "SLOTSTREAM_OPT_NGRAM_RING": "0",
              "SLOTSTREAM_OPT_EXPERT_MAP": "0",
              "SLOTSTREAM_OPT_POOL_PINS": "0",
              "SLOTSTREAM_OPT_SLOT_SLICES": "0",
              "SLOTSTREAM_OPT_SLOT_WORDS": "0",
              "SLOTSTREAM_OPT_SLOT_CPU": "0",
              "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
              "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
              "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
              "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
              "SLOTSTREAM_OPT_VISION_PADDING": "0",
              "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
              "SLOTSTREAM_OPT_READ_SCOPE": "0",
              "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
              "SLOTSTREAM_EMBEDDING_ROWS": "1",
              "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1"
            }
          }
        },
        "label": "adaptive-public-planner-256-v505",
        "classification": "Exact V492 smaller-group sizing with all seven current native proofs. Fresh binding of the preserved, unrun V475 workload. Only build paths and evidence identity change; every original input, control, planner observation, 32 measured plus32 first responses, timing/capacity criterion, quiet period, resource guard and whole allowance remains. This does not replace any final gate.",
        "fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/256-measured.txt",
        "fixture_sha256": "d6307260f0f89570117e7243fd59580cd879c8c7ddc2e1df2be0242ab45bcb91",
        "max_tokens": 16,
        "minimum_output_tokens": 16,
        "conditions": "Separate prospective actual-planner policy experiment, not a successor or replacement for the original explicit-scope study. No forced prefill chunk, pool, simulated availability or prefix-disable switch. Both arms retain the same actual target-driven pool and prefix allocation. First and measured inputs each contain exactly four full chronological passes plus three tail tokens, with frozen distinct prompt IDs and no reuse. The automatic arm must actually group the four full passes and leave the tail unchanged. Other controls are identical. Sixteen fixed alternating pairs, 32 measured plus 32 first responses, 16 outputs, min5 clean pairs, 5percent median client gain, 80percent positive, separate min5 first-job pairs and at most5percent first-job regression. Exact IDs/text and logical/model work on every completed cell, including timing exclusions. Original quiet/cooling/live guards, exact target footprint cap and no replacements. This does not qualify short/prefix reuse or MTP final workloads, which remain separately required.",
        "acceptance": {
          "minimum_pairs": 5,
          "minimum_median_client_reduction": 0.05,
          "minimum_positive_fraction": 0.8,
          "all_outputs_exact": true,
          "replacement_rounds": 0
        },
        "initial_workspace_quiet": {
          "stable_seconds": 180,
          "maximum_wait_seconds": 1800
        },
        "stop_on_workspace_contention": true,
        "startup_acceptance": {
          "minimum_pairs": 5,
          "maximum_median_first_job_regression": 0.05,
          "all_outputs_exact": true
        },
        "think": false,
        "required_equal_work": [
          "prefillTokens",
          "decodeTokens",
          "decodeModelTokens",
          "decodeForwardPasses",
          "draftedTokens",
          "verifyPasses"
        ],
        "work_constraints": {
          "reference": {
            "prefillTokens": {
              "min": 1027,
              "max": 1027
            },
            "decodeTokens": {
              "min": 16,
              "max": 16
            },
            "decodeModelTokens": {
              "min": 15,
              "max": 15
            },
            "decodeForwardPasses": {
              "min": 15,
              "max": 15
            },
            "draftedTokens": {
              "min": 0,
              "max": 0
            },
            "verifyPasses": {
              "min": 0,
              "max": 0
            }
          },
          "automatic": {
            "prefillTokens": {
              "min": 1027,
              "max": 1027
            },
            "decodeTokens": {
              "min": 16,
              "max": 16
            },
            "decodeModelTokens": {
              "min": 15,
              "max": 15
            },
            "decodeForwardPasses": {
              "min": 15,
              "max": 15
            },
            "draftedTokens": {
              "min": 0,
              "max": 0
            },
            "verifyPasses": {
              "min": 0,
              "max": 0
            }
          }
        },
        "primary_metric": "Paired full-client request latency with demonstrated prefill read reduction and exact output at one unchanged10GB target; first-job and peak constraints remain independent.",
        "before_cell_thermal_settle": {
          "stable_seconds": 60,
          "maximum_wait_seconds": 300,
          "poll_seconds": 2
        },
        "abort_on_resource_failure": true,
        "warmup_fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/256-first.txt",
        "warmup_fixture_sha256": "8eb45c0add6ef3331864f6fee894b5ce37612e92946bd13fb313ca36d6ae2139",
        "prefix_cache": {
          "retention_only": true,
          "expected_reused_tokens": {
            "reference": 0,
            "automatic": 0
          }
        },
        "automatic_scope_measurement": {
          "purpose": "Actual public planner selects its bounded geometry; exact four full chronological passes plus an odd tail test the minimum automatic grouping threshold.",
          "expect_grouped_prefill": true
        }
      },
      "policy": {
        "startup_reclaimable_bytes": 16000000000,
        "minimum_live_reclaimable_bytes": 3000000000,
        "maximum_owned_rss_bytes": 12000000000,
        "sample_interval_seconds": 0.2,
        "maximum_build_seconds": 15000,
        "stop_on_new_swapouts": true
      }
    },
    "planner-512": {
      "protocol": {
        "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
        "memory_gb": 12,
        "mtp": "off",
        "raw": true,
        "seed": 7,
        "rounds": 16,
        "comparison_basis": "fixed-pool",
        "maximum_sampled_footprint_bytes": 12000000000,
        "require_nominal_power_state": true,
        "between_cells_seconds": 60,
        "model_reservation_wait_seconds": 1800,
        "arms": {
          "reference": {
            "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
            "chunk": 512,
            "env": {
              "SLOTSTREAM_OPT_COMPACT_STATE": "1",
              "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
              "SLOTSTREAM_OPT_COMPACT_MTP": "1",
              "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
              "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
              "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
              "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
              "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
              "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
              "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
              "SLOTSTREAM_OPT_INDEXER_RAW": "0",
              "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
              "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
              "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
              "SLOTSTREAM_OPT_SWEEP_TILES": "0",
              "SLOTSTREAM_OPT_INDEXER_TILES": "1",
              "SLOTSTREAM_OPT_SHARED_ROPE": "1",
              "SLOTSTREAM_OPT_FUSED_ROPE": "1",
              "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
              "SLOTSTREAM_OPT_GDN_RECORD": "0",
              "SLOTSTREAM_OPT_PLE_TILES": "1",
              "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
              "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
              "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
              "SLOTSTREAM_OPT_MTP_TAIL": "0",
              "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
              "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
              "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
              "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
              "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
              "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
              "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
              "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
              "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
              "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
              "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
              "SLOTSTREAM_OPT_READ_HANDLES": "0",
              "SLOTSTREAM_OPT_COMPILED_NORM": "0",
              "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
              "SLOTSTREAM_OPT_NGRAM_RING": "0",
              "SLOTSTREAM_OPT_EXPERT_MAP": "0",
              "SLOTSTREAM_OPT_POOL_PINS": "0",
              "SLOTSTREAM_OPT_SLOT_SLICES": "0",
              "SLOTSTREAM_OPT_SLOT_WORDS": "0",
              "SLOTSTREAM_OPT_SLOT_CPU": "0",
              "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
              "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
              "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
              "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
              "SLOTSTREAM_OPT_VISION_PADDING": "0",
              "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
              "SLOTSTREAM_OPT_READ_SCOPE": "0",
              "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
              "SLOTSTREAM_EMBEDDING_ROWS": "1",
              "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0"
            }
          },
          "automatic": {
            "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
            "chunk": 512,
            "env": {
              "SLOTSTREAM_OPT_COMPACT_STATE": "1",
              "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
              "SLOTSTREAM_OPT_COMPACT_MTP": "1",
              "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
              "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
              "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
              "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
              "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
              "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
              "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
              "SLOTSTREAM_OPT_INDEXER_RAW": "0",
              "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
              "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
              "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
              "SLOTSTREAM_OPT_SWEEP_TILES": "0",
              "SLOTSTREAM_OPT_INDEXER_TILES": "1",
              "SLOTSTREAM_OPT_SHARED_ROPE": "1",
              "SLOTSTREAM_OPT_FUSED_ROPE": "1",
              "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
              "SLOTSTREAM_OPT_GDN_RECORD": "0",
              "SLOTSTREAM_OPT_PLE_TILES": "1",
              "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
              "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
              "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
              "SLOTSTREAM_OPT_MTP_TAIL": "0",
              "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
              "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
              "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
              "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
              "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
              "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
              "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
              "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
              "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
              "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
              "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
              "SLOTSTREAM_OPT_READ_HANDLES": "0",
              "SLOTSTREAM_OPT_COMPILED_NORM": "0",
              "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
              "SLOTSTREAM_OPT_NGRAM_RING": "0",
              "SLOTSTREAM_OPT_EXPERT_MAP": "0",
              "SLOTSTREAM_OPT_POOL_PINS": "0",
              "SLOTSTREAM_OPT_SLOT_SLICES": "0",
              "SLOTSTREAM_OPT_SLOT_WORDS": "0",
              "SLOTSTREAM_OPT_SLOT_CPU": "0",
              "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
              "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
              "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
              "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
              "SLOTSTREAM_OPT_VISION_PADDING": "0",
              "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
              "SLOTSTREAM_OPT_READ_SCOPE": "0",
              "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
              "SLOTSTREAM_EMBEDDING_ROWS": "1",
              "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1"
            }
          }
        },
        "label": "adaptive-public-planner-512-v505",
        "classification": "Exact V492 smaller-group sizing with all seven current native proofs. Fresh binding of the preserved, unrun V475 workload. Only build paths and evidence identity change; every original input, control, planner observation, 32 measured plus32 first responses, timing/capacity criterion, quiet period, resource guard and whole allowance remains. This does not replace any final gate.",
        "fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/512-measured.txt",
        "fixture_sha256": "19f859c2a14d9746bd652d39bb0caa65edb42064d0a69bc28d1d3be47c632f23",
        "max_tokens": 16,
        "minimum_output_tokens": 16,
        "conditions": "Separate prospective actual-planner policy experiment, not a successor or replacement for the original explicit-scope study. No forced prefill chunk, pool, simulated availability or prefix-disable switch. Both arms retain the same actual target-driven pool and prefix allocation. First and measured inputs each contain exactly four full chronological passes plus three tail tokens, with frozen distinct prompt IDs and no reuse. The automatic arm must actually group the four full passes and leave the tail unchanged. Other controls are identical. Sixteen fixed alternating pairs, 32 measured plus 32 first responses, 16 outputs, min5 clean pairs, 5percent median client gain, 80percent positive, separate min5 first-job pairs and at most5percent first-job regression. Exact IDs/text and logical/model work on every completed cell, including timing exclusions. Original quiet/cooling/live guards, exact target footprint cap and no replacements. This does not qualify short/prefix reuse or MTP final workloads, which remain separately required.",
        "acceptance": {
          "minimum_pairs": 5,
          "minimum_median_client_reduction": 0.05,
          "minimum_positive_fraction": 0.8,
          "all_outputs_exact": true,
          "replacement_rounds": 0
        },
        "initial_workspace_quiet": {
          "stable_seconds": 180,
          "maximum_wait_seconds": 1800
        },
        "stop_on_workspace_contention": true,
        "startup_acceptance": {
          "minimum_pairs": 5,
          "maximum_median_first_job_regression": 0.05,
          "all_outputs_exact": true
        },
        "think": false,
        "required_equal_work": [
          "prefillTokens",
          "decodeTokens",
          "decodeModelTokens",
          "decodeForwardPasses",
          "draftedTokens",
          "verifyPasses"
        ],
        "work_constraints": {
          "reference": {
            "prefillTokens": {
              "min": 2051,
              "max": 2051
            },
            "decodeTokens": {
              "min": 16,
              "max": 16
            },
            "decodeModelTokens": {
              "min": 15,
              "max": 15
            },
            "decodeForwardPasses": {
              "min": 15,
              "max": 15
            },
            "draftedTokens": {
              "min": 0,
              "max": 0
            },
            "verifyPasses": {
              "min": 0,
              "max": 0
            }
          },
          "automatic": {
            "prefillTokens": {
              "min": 2051,
              "max": 2051
            },
            "decodeTokens": {
              "min": 16,
              "max": 16
            },
            "decodeModelTokens": {
              "min": 15,
              "max": 15
            },
            "decodeForwardPasses": {
              "min": 15,
              "max": 15
            },
            "draftedTokens": {
              "min": 0,
              "max": 0
            },
            "verifyPasses": {
              "min": 0,
              "max": 0
            }
          }
        },
        "primary_metric": "Paired full-client request latency with demonstrated prefill read reduction and exact output at one unchanged10GB target; first-job and peak constraints remain independent.",
        "before_cell_thermal_settle": {
          "stable_seconds": 60,
          "maximum_wait_seconds": 300,
          "poll_seconds": 2
        },
        "abort_on_resource_failure": true,
        "warmup_fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/512-first.txt",
        "warmup_fixture_sha256": "cc303d3e3337f323f4f72754a9920fa6de2a8695d229c341a30d16f7bc35c0fc",
        "prefix_cache": {
          "retention_only": true,
          "expected_reused_tokens": {
            "reference": 0,
            "automatic": 0
          }
        },
        "automatic_scope_measurement": {
          "purpose": "Actual public planner selects its bounded geometry; exact four full chronological passes plus an odd tail test the minimum automatic grouping threshold.",
          "expect_grouped_prefill": true
        }
      },
      "policy": {
        "startup_reclaimable_bytes": 18332800000,
        "minimum_live_reclaimable_bytes": 3000000000,
        "maximum_owned_rss_bytes": 14000000000,
        "sample_interval_seconds": 0.2,
        "maximum_build_seconds": 15000,
        "stop_on_new_swapouts": true
      }
    },
    "planner-1024": {
      "protocol": {
        "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
        "memory_gb": 16,
        "mtp": "off",
        "raw": true,
        "seed": 7,
        "rounds": 16,
        "comparison_basis": "fixed-pool",
        "maximum_sampled_footprint_bytes": 16000000000,
        "require_nominal_power_state": true,
        "between_cells_seconds": 60,
        "model_reservation_wait_seconds": 1800,
        "arms": {
          "reference": {
            "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
            "chunk": 1024,
            "env": {
              "SLOTSTREAM_OPT_COMPACT_STATE": "1",
              "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
              "SLOTSTREAM_OPT_COMPACT_MTP": "1",
              "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
              "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
              "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
              "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
              "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
              "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
              "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
              "SLOTSTREAM_OPT_INDEXER_RAW": "0",
              "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
              "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
              "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
              "SLOTSTREAM_OPT_SWEEP_TILES": "0",
              "SLOTSTREAM_OPT_INDEXER_TILES": "1",
              "SLOTSTREAM_OPT_SHARED_ROPE": "1",
              "SLOTSTREAM_OPT_FUSED_ROPE": "1",
              "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
              "SLOTSTREAM_OPT_GDN_RECORD": "0",
              "SLOTSTREAM_OPT_PLE_TILES": "1",
              "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
              "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
              "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
              "SLOTSTREAM_OPT_MTP_TAIL": "0",
              "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
              "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
              "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
              "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
              "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
              "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
              "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
              "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
              "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
              "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
              "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
              "SLOTSTREAM_OPT_READ_HANDLES": "0",
              "SLOTSTREAM_OPT_COMPILED_NORM": "0",
              "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
              "SLOTSTREAM_OPT_NGRAM_RING": "0",
              "SLOTSTREAM_OPT_EXPERT_MAP": "0",
              "SLOTSTREAM_OPT_POOL_PINS": "0",
              "SLOTSTREAM_OPT_SLOT_SLICES": "0",
              "SLOTSTREAM_OPT_SLOT_WORDS": "0",
              "SLOTSTREAM_OPT_SLOT_CPU": "0",
              "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
              "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
              "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
              "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
              "SLOTSTREAM_OPT_VISION_PADDING": "0",
              "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
              "SLOTSTREAM_OPT_READ_SCOPE": "0",
              "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
              "SLOTSTREAM_EMBEDDING_ROWS": "1",
              "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0"
            }
          },
          "automatic": {
            "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
            "chunk": 1024,
            "env": {
              "SLOTSTREAM_OPT_COMPACT_STATE": "1",
              "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
              "SLOTSTREAM_OPT_COMPACT_MTP": "1",
              "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
              "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
              "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
              "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
              "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
              "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
              "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
              "SLOTSTREAM_OPT_INDEXER_RAW": "0",
              "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
              "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
              "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
              "SLOTSTREAM_OPT_SWEEP_TILES": "0",
              "SLOTSTREAM_OPT_INDEXER_TILES": "1",
              "SLOTSTREAM_OPT_SHARED_ROPE": "1",
              "SLOTSTREAM_OPT_FUSED_ROPE": "1",
              "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
              "SLOTSTREAM_OPT_GDN_RECORD": "0",
              "SLOTSTREAM_OPT_PLE_TILES": "1",
              "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
              "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
              "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
              "SLOTSTREAM_OPT_MTP_TAIL": "0",
              "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
              "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
              "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
              "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
              "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
              "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
              "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
              "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
              "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
              "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
              "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
              "SLOTSTREAM_OPT_READ_HANDLES": "0",
              "SLOTSTREAM_OPT_COMPILED_NORM": "0",
              "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
              "SLOTSTREAM_OPT_NGRAM_RING": "0",
              "SLOTSTREAM_OPT_EXPERT_MAP": "0",
              "SLOTSTREAM_OPT_POOL_PINS": "0",
              "SLOTSTREAM_OPT_SLOT_SLICES": "0",
              "SLOTSTREAM_OPT_SLOT_WORDS": "0",
              "SLOTSTREAM_OPT_SLOT_CPU": "0",
              "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
              "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
              "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
              "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
              "SLOTSTREAM_OPT_VISION_PADDING": "0",
              "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
              "SLOTSTREAM_OPT_READ_SCOPE": "0",
              "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
              "SLOTSTREAM_EMBEDDING_ROWS": "1",
              "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1"
            }
          }
        },
        "label": "adaptive-public-planner-1024-v505",
        "classification": "Exact V492 smaller-group sizing with all seven current native proofs. Fresh binding of the preserved, unrun V475 workload. Only build paths and evidence identity change; every original input, control, planner observation, 32 measured plus32 first responses, timing/capacity criterion, quiet period, resource guard and whole allowance remains. This does not replace any final gate.",
        "fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/1024-measured.txt",
        "fixture_sha256": "83187d500329183727b7fb4f4a9c7a9631f8f5e0582b745f1ca043418767632b",
        "max_tokens": 16,
        "minimum_output_tokens": 16,
        "conditions": "Separate prospective actual-planner policy experiment, not a successor or replacement for the original explicit-scope study. No forced prefill chunk, pool, simulated availability or prefix-disable switch. Both arms retain the same actual target-driven pool and prefix allocation. First and measured inputs each contain exactly four full chronological passes plus three tail tokens, with frozen distinct prompt IDs and no reuse. The automatic arm must actually group the four full passes and leave the tail unchanged. Other controls are identical. Sixteen fixed alternating pairs, 32 measured plus 32 first responses, 16 outputs, min5 clean pairs, 5percent median client gain, 80percent positive, separate min5 first-job pairs and at most5percent first-job regression. Exact IDs/text and logical/model work on every completed cell, including timing exclusions. Original quiet/cooling/live guards, exact target footprint cap and no replacements. This does not qualify short/prefix reuse or MTP final workloads, which remain separately required.",
        "acceptance": {
          "minimum_pairs": 5,
          "minimum_median_client_reduction": 0.05,
          "minimum_positive_fraction": 0.8,
          "all_outputs_exact": true,
          "replacement_rounds": 0
        },
        "initial_workspace_quiet": {
          "stable_seconds": 180,
          "maximum_wait_seconds": 1800
        },
        "stop_on_workspace_contention": true,
        "startup_acceptance": {
          "minimum_pairs": 5,
          "maximum_median_first_job_regression": 0.05,
          "all_outputs_exact": true
        },
        "think": false,
        "required_equal_work": [
          "prefillTokens",
          "decodeTokens",
          "decodeModelTokens",
          "decodeForwardPasses",
          "draftedTokens",
          "verifyPasses"
        ],
        "work_constraints": {
          "reference": {
            "prefillTokens": {
              "min": 4099,
              "max": 4099
            },
            "decodeTokens": {
              "min": 16,
              "max": 16
            },
            "decodeModelTokens": {
              "min": 15,
              "max": 15
            },
            "decodeForwardPasses": {
              "min": 15,
              "max": 15
            },
            "draftedTokens": {
              "min": 0,
              "max": 0
            },
            "verifyPasses": {
              "min": 0,
              "max": 0
            }
          },
          "automatic": {
            "prefillTokens": {
              "min": 4099,
              "max": 4099
            },
            "decodeTokens": {
              "min": 16,
              "max": 16
            },
            "decodeModelTokens": {
              "min": 15,
              "max": 15
            },
            "decodeForwardPasses": {
              "min": 15,
              "max": 15
            },
            "draftedTokens": {
              "min": 0,
              "max": 0
            },
            "verifyPasses": {
              "min": 0,
              "max": 0
            }
          }
        },
        "primary_metric": "Paired full-client request latency with demonstrated prefill read reduction and exact output at one unchanged10GB target; first-job and peak constraints remain independent.",
        "before_cell_thermal_settle": {
          "stable_seconds": 60,
          "maximum_wait_seconds": 300,
          "poll_seconds": 2
        },
        "abort_on_resource_failure": true,
        "warmup_fixture": "/tmp/slotstream-optimization-execution/automatic-planner-cohort-v475/fixtures/1024-first.txt",
        "warmup_fixture_sha256": "6bacff526572f22fdfd8f269e0affe9b33e60bd1982cecdfd7daff64d179250f",
        "prefix_cache": {
          "retention_only": true,
          "expected_reused_tokens": {
            "reference": 0,
            "automatic": 0
          }
        },
        "automatic_scope_measurement": {
          "purpose": "Actual public planner selects its bounded geometry; exact four full chronological passes plus an odd tail test the minimum automatic grouping threshold.",
          "expect_grouped_prefill": true
        }
      },
      "policy": {
        "startup_reclaimable_bytes": 22998400000,
        "minimum_live_reclaimable_bytes": 3000000000,
        "maximum_owned_rss_bytes": 18000000000,
        "sample_interval_seconds": 0.2,
        "maximum_build_seconds": 15000,
        "stop_on_new_swapouts": true
      }
    }
  },
  "classification": "Current-source successors only. Original V475 freezes remain intact and unrun."
}

````````````

## Artifact SHA-256 a62ada2c0faafee867e7aba72303ddb2c6219d16044cc859c80d8a2551b8e19f

Encoding: `utf-8`. Original bytes: 7339.

````````````text
"""Fresh exact-source bindings for the three preserved V475 planner workloads."""
from pathlib import Path
import copy
import importlib.util

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
PRIOR = BASE / 'automatic-planner-cohort-v475/run.py'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


prior = module('v505_preserved_workloads', PRIOR)
runner = module('v505_original_execution', PRIOR)
# Retain the exact import spelling frozen by the native executor. On macOS
# /tmp resolves to /private/tmp, but its existing dependency keys are literal.
native = module('v505_current_native', Path('/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/run.py'))
c, digest, require = prior.c, prior.digest, prior.require
OUT = prior.ROOT / '.build/optimization/adaptive-public-planner-v505'
BINARY = native.BINARY
SCOPE = BASE / 'scope-quiet-terminal-audit-v499/audit.json'
SCOPE_RECEIPT = BASE / 'scope-quiet-resource-cohort-v484/execution/qualification.json'


def prerequisites():
    value = native.load()
    result = {}
    for name in native.NATIVE:
        target = native.OUT / name
        qualification = c.read(target / 'qualification.json')
        report = c.read(target / 'stdout.txt')
        require(qualification.get('qualified') is True and qualification.get('completed') is True
                and qualification.get('proofs_unchanged') is True
                and qualification.get('cleanup_complete') is True
                and qualification.get('remaining_jobs') == []
                and qualification.get('within_reservation') is True,
                'every exact-current native case must qualify and drain')
        native.assess(name, report)
        require(qualification['stdout_sha256'] == digest(target / 'stdout.txt')
                and qualification['execution_receipt_sha256'] == digest(target / 'receipt.json'),
                'native report or receipt changed')
        result[name] = {file: digest(target / file)
                        for file in ['qualification.json', 'receipt.json', 'stdout.txt']}
    audit, receipt = c.read(SCOPE), c.read(SCOPE_RECEIPT)
    require(audit['assessment']['qualified'] is True
            and audit['all64_exact_prompt_output_text_and_equal_work'] is True
            and audit['all64_original_sampled_physical_caps_pass'] is True
            and receipt['qualified'] is True and receipt['cleanup_complete'] is True
            and receipt['remaining_jobs'] == [] and audit['terminal_receipt_sha256'] == digest(SCOPE_RECEIPT),
            'full isolated original scope qualification missing')
    return value['build'], {'current_native': result, 'scope_audit_sha256': digest(SCOPE),
                             'scope_receipt_sha256': digest(SCOPE_RECEIPT)}


def dependencies():
    result = prior.dependencies()
    files = [Path(__file__), HERE / 'checks.py', HERE / 'checks.stderr', PRIOR,
             prior.HERE / 'preparation.json', native.HERE / 'run.py',
             native.HERE / 'preparation.json', SCOPE, SCOPE_RECEIPT]
    files += [prior.HERE / name / file for name in prior.PROFILES
              for file in ['protocol.json', 'binding.json']]
    result.update({str(path.resolve()): digest(path) for path in files})
    return result


def materialize(name):
    original = prior.materialize(name)
    result = copy.deepcopy(original)
    result['binary'] = str(BINARY)
    for arm in result['arms'].values():
        arm['binary'] = str(BINARY)
    result['label'] = 'adaptive-public-' + name + '-v505'
    result['classification'] = (
        'Exact V492 smaller-group sizing with all seven current native proofs. '
        'Fresh binding of the preserved, unrun V475 workload. Only build paths and '
        'evidence identity change; every original input, control, planner observation, '
        '32 measured plus32 first responses, timing/capacity criterion, quiet period, '
        'resource guard and whole allowance remains. This does not replace any final gate.')
    restored = copy.deepcopy(result)
    for key in ['binary', 'label', 'classification']:
        restored[key] = original[key]
    for name, arm in restored['arms'].items():
        arm['binary'] = original['arms'][name]['binary']
    require(restored == original, 'workload or acceptance changed beyond source binding')
    return result


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'already prepared or attempted')
    prior.load()
    require(all(not (prior.HERE / name / 'execution').exists()
                and not (prior.OUT / name).exists() for name in prior.PROFILES),
            'old frozen identity unexpectedly ran; preserve and review before rebinding')
    checks = (HERE / 'checks.stderr').read_text()
    require('Ran 7 tests' in checks and checks.endswith('OK\n'), 'adapter checks missing')
    build, proof = prerequisites()
    protocols = {name: materialize(name) for name in prior.PROFILES}
    record = {'prepared_at': prior.core.now(), 'build': build, 'native_proof': proof,
              'dependencies': dependencies(), 'work_seconds': prior.WORK_SECONDS,
              'cleanup_seconds': prior.CLEANUP_SECONDS, 'model_launched': False,
              'profiles': {name: {'protocol': p, 'policy': prior.policy(name)} for name, p in protocols.items()},
              'classification': 'Current-source successors only. Original V475 freezes remain intact and unrun.'}
    c.write_new(HERE / 'preparation.json', record)
    for name, p in protocols.items():
        target = HERE / name
        target.mkdir()
        c.write_new(target / 'protocol.json', p)
        c.write_new(target / 'binding.json', {'protocol_sha256': digest(target / 'protocol.json'),
                                             'preparation_sha256': digest(HERE / 'preparation.json')})
    return {'prepared': True, 'frozen': list(prior.PROFILES), 'model_launched': False}


def load():
    prior.load()
    record = c.read(HERE / 'preparation.json')
    build, proof = prerequisites()
    require(record['dependencies'] == dependencies() and record['build'] == build
            and record['native_proof'] == proof and record['work_seconds'] == prior.WORK_SECONDS == 15000
            and record['cleanup_seconds'] == prior.CLEANUP_SECONDS == 60,
            'exact source/native/isolated proof or allowance changed')
    for name in prior.PROFILES:
        target = HERE / name
        protocol, binding = c.read(target / 'protocol.json'), c.read(target / 'binding.json')
        require(protocol == materialize(name) == record['profiles'][name]['protocol']
                and record['profiles'][name]['policy'] == prior.policy(name)
                and binding == {'protocol_sha256': digest(target / 'protocol.json'),
                                'preparation_sha256': digest(HERE / 'preparation.json')},
                'fixed workload, policy or binding changed')
    return record


runner.HERE, runner.OUT = HERE, OUT
runner.fixtures = prior.fixtures
runner.dependencies, runner.materialize = dependencies, materialize
runner.prepare, runner.load = prepare, load
runner.core.load = load


if __name__ == '__main__':
    raise SystemExit(runner.main())

````````````
