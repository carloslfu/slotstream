---
type: run
id: 01m234bnqja946nmwdr3rgxd02
created: 2026-09-09T13:05:19.090306+00:00
updated: 2026-09-09T13:05:19.402610+00:00
summary: Full 12 and 16 GB original planner cohorts frozen after independent fixture delivery
binary: /Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream
captured_at: 2026-09-09
command: V537 six adapter checks and actual prerequisite-bound prepare; V542 exact terminal-auditor reconstruction
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Full 12 and 16 GB original planner cohorts frozen after independent fixture delivery
tool: Slotstream exact native and source qualification capture
---
Both independent functionaldeliveriesnowpass. V537freezes originalfull16pairs/32measured+32first/16outputs for12and16GB, preserving numericalgeometry, controls, exactness, everyoriginalresource/thermal/swapguard, exclusion/acceptance and complete15000+60allowance. Only the explicitly documented same-dimension continuation fixture corrections and provenance differ. Both original complete execution and assessment bodies are retained. OriginalV515512failed cohort andV5351024firstfailure stay consumed/unpooled; qualifiedV515256is not repeated and originalV5151024staysunrun. V542reconstructs the original full64response independentauditor exactly after reversing only its newsource binding and descriptiveclassification. No full cohort has run or been audited at capturetime, no pilot timingqualifies performance, and all finalprogram gates/activation remain.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/checks.py",
    "bytes": 3640,
    "sha256": "d2a0951d86229c206f8c155b42f1f086ad46781a049f3ea279fb0ecafa801959"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/checks.stderr",
    "bytes": 611,
    "sha256": "4bd020e50fdbcfd1d9591b1ecdc1ea33e9645f48cd7ba46620172ff7b4eae1b4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/initial-unprepared-checks.py",
    "bytes": 3590,
    "sha256": "588e383d83e300868b9a328c63e18990d5d7d5aee302f791a8a797a8dedf848f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/initial-unprepared-run.py",
    "bytes": 7357,
    "sha256": "50655e0262a014f03e75c27510158b98e21f17efdd97d54a1d7f0ed4cc1dc171"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/planner-1024/binding.json",
    "bytes": 184,
    "sha256": "0b47fba949e470ee6d28e2daba7d0a8abda91a31a71456fd7fc9a2610fc37fb0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/planner-1024/protocol.json",
    "bytes": 10231,
    "sha256": "bffcc30bfe65e302bbc7d6a1f928c771dfb47cc46e1cc64dc91b12bc922e5786"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/planner-512/binding.json",
    "bytes": 184,
    "sha256": "134e2223acc2004bd49899301c14f33ec28f8dcd98e01e00a1731c8245071ed8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/planner-512/protocol.json",
    "bytes": 10226,
    "sha256": "b4914f9705f15635829c8653ed1aafaf1e90d03056f3516c182fb627f7c68613"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/preparation.json",
    "bytes": 67214,
    "sha256": "96ee7a553829919f27de8e337c590e6ade51e080138cc0b58ee71f18751b456d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/run.py",
    "bytes": 7930,
    "sha256": "b0f6c64f1584c367cb85f3521f94fae83efe1de15bfaabddf2f2e7ee8e7fc175"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-terminal-v542/audit.py",
    "bytes": 4877,
    "sha256": "b1bb0641b8aa45aa547e67d1074c119eba3d53689088637ed7c5861d29a715ba"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-terminal-v542/preparation.json",
    "bytes": 734,
    "sha256": "4440195a6fa46cf535484dc38d3dd71e9e337f9f13be08c3675c92e1016af76f"
  }
]
```

## Artifact SHA-256 d2a0951d86229c206f8c155b42f1f086ad46781a049f3ea279fb0ecafa801959

Encoding: `utf-8`. Original bytes: 3640.

````````````text
from pathlib import Path
import datetime, importlib.util, inspect, unittest
from unittest.mock import patch
HERE=Path(__file__).resolve().parent
s=importlib.util.spec_from_file_location('full_cohort_checks',HERE/'run.py')
m=importlib.util.module_from_spec(s);s.loader.exec_module(m)

class Checks(unittest.TestCase):
    def test_full_original_protocol_reconstructs_except_declared_fixture_and_provenance(self):
        for name in m.PROFILES:
            original, actual = m.old.materialize(name), m.materialize(name)
            for key in ['label','classification','conditions','fixture','fixture_sha256','warmup_fixture','warmup_fixture_sha256']:
                actual[key]=original[key]
            self.assertEqual(actual,original)
            self.assertEqual(actual['rounds'],16)
            self.assertEqual(actual['acceptance']['minimum_pairs'],5)
            self.assertEqual(actual['startup_acceptance']['minimum_pairs'],5)

    def test_original_execution_assessment_and_complete_policies_unchanged(self):
        self.assertEqual(inspect.getsource(m.runner.run),inspect.getsource(m.old.old.prior.run))
        self.assertEqual(inspect.getsource(m.ORIGINAL_ASSESS),inspect.getsource(m.old.old.prior.assess))
        for name in m.PROFILES:self.assertEqual(m.runner.policy(name),m.old.old.prior.policy(name))
        self.assertEqual(m.runner.WORK_SECONDS,15000)
        self.assertEqual(m.runner.CLEANUP_SECONDS,60)

    def test_functional_pilot_does_not_replace_full_cohort(self):
        for name in m.PROFILES:
            p=m.materialize(name)
            diagnostic=(m.pilot if name == 'planner-512' else m.continuation).materialize(name)
            self.assertEqual(diagnostic['rounds'],1)
            self.assertEqual(p['rounds'],16)
            self.assertEqual(p['acceptance'],diagnostic['acceptance'])
        source=inspect.getsource(m.prerequisites)
        self.assertIn("q.get('performance_qualified') is False",source)
        self.assertIn('provider.assess(name)',source)

    def test_short_full_allowance_refuses_before_source_or_model(self):
        deadline=(datetime.datetime.now(datetime.timezone.utc)+datetime.timedelta(seconds=1860)).isoformat()
        with patch.object(m.runner,'load',side_effect=AssertionError('source access')):
            with self.assertRaisesRegex(ValueError,'original work allowance and cleanup must fit'):
                m.runner.run('planner-512',deadline)

    def test_actual_dispatch_reaches_original_full_preflight(self):
        deadline=(datetime.datetime.now(datetime.timezone.utc)+datetime.timedelta(hours=5)).isoformat()
        for name in m.PROFILES:
            value={'profiles':{name:{'protocol':m.materialize(name)}}}
            with patch.object(m.runner,'load',return_value=value),patch.object(m.runner.core,'readiness',side_effect=RuntimeError('intercepted')) as ready:
                with self.assertRaisesRegex(RuntimeError,'intercepted'):m.runner.run(name,deadline)
                ready.assert_called_once_with(deadline,15060,m.runner.policy(name)['startup_reclaimable_bytes']/1e9)

    def test_no_qualified256_rerun_and_raw_requests_preserve16(self):
        self.assertEqual(set(m.PROFILES),{'planner-512','planner-1024'})
        import json
        for name,(chunk,_) in m.PROFILES.items():
            p=m.materialize(name)
            for row in m.fixtures(chunk).values():
                wire=json.loads(m.bench.request_body(p,Path(row['path']).read_text(),images=[]))
                self.assertEqual(wire['options']['num_predict'],16)
                self.assertNotIn('think',wire)

if __name__=='__main__':unittest.main(verbosity=2)

````````````

## Artifact SHA-256 4bd020e50fdbcfd1d9591b1ecdc1ea33e9645f48cd7ba46620172ff7b4eae1b4

Encoding: `utf-8`. Original bytes: 611.

````````````text
test_actual_dispatch_reaches_original_full_preflight (__main__.Checks) ... ok
test_full_original_protocol_reconstructs_except_declared_fixture_and_provenance (__main__.Checks) ... ok
test_functional_pilot_does_not_replace_full_cohort (__main__.Checks) ... ok
test_no_qualified256_rerun_and_raw_requests_preserve16 (__main__.Checks) ... ok
test_original_execution_assessment_and_complete_policies_unchanged (__main__.Checks) ... ok
test_short_full_allowance_refuses_before_source_or_model (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 0.123s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 588e383d83e300868b9a328c63e18990d5d7d5aee302f791a8a797a8dedf848f

Encoding: `utf-8`. Original bytes: 3590.

````````````text
from pathlib import Path
import datetime, importlib.util, inspect, unittest
from unittest.mock import patch
HERE=Path(__file__).resolve().parent
s=importlib.util.spec_from_file_location('full_cohort_checks',HERE/'run.py')
m=importlib.util.module_from_spec(s);s.loader.exec_module(m)

class Checks(unittest.TestCase):
    def test_full_original_protocol_reconstructs_except_declared_fixture_and_provenance(self):
        for name in m.PROFILES:
            original, actual = m.old.materialize(name), m.materialize(name)
            for key in ['label','classification','conditions','fixture','fixture_sha256','warmup_fixture','warmup_fixture_sha256']:
                actual[key]=original[key]
            self.assertEqual(actual,original)
            self.assertEqual(actual['rounds'],16)
            self.assertEqual(actual['acceptance']['minimum_pairs'],5)
            self.assertEqual(actual['startup_acceptance']['minimum_pairs'],5)

    def test_original_execution_assessment_and_complete_policies_unchanged(self):
        self.assertEqual(inspect.getsource(m.runner.run),inspect.getsource(m.old.old.prior.run))
        self.assertEqual(inspect.getsource(m.ORIGINAL_ASSESS),inspect.getsource(m.old.old.prior.assess))
        for name in m.PROFILES:self.assertEqual(m.runner.policy(name),m.old.old.prior.policy(name))
        self.assertEqual(m.runner.WORK_SECONDS,15000)
        self.assertEqual(m.runner.CLEANUP_SECONDS,60)

    def test_functional_pilot_does_not_replace_full_cohort(self):
        for name in m.PROFILES:
            p=m.materialize(name)
            diagnostic=m.pilot.materialize(name)
            self.assertEqual(diagnostic['rounds'],1)
            self.assertEqual(p['rounds'],16)
            self.assertEqual(p['acceptance'],diagnostic['acceptance'])
        source=inspect.getsource(m.prerequisites)
        self.assertIn("q.get('performance_qualified') is False",source)
        self.assertIn('pilot.assess(name)',source)

    def test_short_full_allowance_refuses_before_source_or_model(self):
        deadline=(datetime.datetime.now(datetime.timezone.utc)+datetime.timedelta(seconds=1860)).isoformat()
        with patch.object(m.runner,'load',side_effect=AssertionError('source access')):
            with self.assertRaisesRegex(ValueError,'original work allowance and cleanup must fit'):
                m.runner.run('planner-512',deadline)

    def test_actual_dispatch_reaches_original_full_preflight(self):
        deadline=(datetime.datetime.now(datetime.timezone.utc)+datetime.timedelta(hours=5)).isoformat()
        for name in m.PROFILES:
            value={'profiles':{name:{'protocol':m.materialize(name)}}}
            with patch.object(m.runner,'load',return_value=value),patch.object(m.runner.core,'readiness',side_effect=RuntimeError('intercepted')) as ready:
                with self.assertRaisesRegex(RuntimeError,'intercepted'):m.runner.run(name,deadline)
                ready.assert_called_once_with(deadline,15060,m.runner.policy(name)['startup_reclaimable_bytes']/1e9)

    def test_no_qualified256_rerun_and_raw_requests_preserve16(self):
        self.assertEqual(set(m.PROFILES),{'planner-512','planner-1024'})
        import json
        for name,(chunk,_) in m.PROFILES.items():
            p=m.materialize(name)
            for row in m.fixtures(chunk).values():
                wire=json.loads(m.bench.request_body(p,Path(row['path']).read_text(),images=[]))
                self.assertEqual(wire['options']['num_predict'],16)
                self.assertNotIn('think',wire)

if __name__=='__main__':unittest.main(verbosity=2)

````````````

## Artifact SHA-256 50655e0262a014f03e75c27510158b98e21f17efdd97d54a1d7f0ed4cc1dc171

Encoding: `utf-8`. Original bytes: 7357.

````````````text
"""Full original planner cohorts after independent first-fixture delivery."""
from pathlib import Path
import copy
import importlib.util
import sys

HERE = Path(__file__).resolve().parent
BASE = Path('/tmp/slotstream-optimization-execution')


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


old = module('v537_original', BASE / 'public-plan-observed-cohort-v515/run.py')
pilot = module('v537_functional_delivery', BASE / 'public-planner-fixture-delivery-v535/run.py')
runner, c, digest, require = old.runner, old.c, old.digest, old.require
ROOT, BINARY = old.ROOT, old.BINARY
PROFILES = {'planner-512': (512, 12), 'planner-1024': (1024, 16)}
OUT = ROOT / '.build/optimization/public-planner-qualified-fixture-cohort-v537'
DRIVER_ROOT, DRIVER, bench, helper = pilot.DRIVER_ROOT, pilot.DRIVER, pilot.bench, pilot.helper
fixtures = pilot.fixtures
ORIGINAL_ASSESS = old.ORIGINAL_ASSESS


def prerequisites():
    build, native = old.prerequisites()
    delivery = {}
    for name in PROFILES:
        path = pilot.HERE / name / 'execution'
        q = c.read(path / 'qualification.json')
        require(q.get('fixture_delivery_qualified') is True and q.get('performance_qualified') is False
                and q.get('completed') is True and q.get('qualified') is True
                and q.get('proofs_unchanged') is True and q.get('cleanup_complete') is True
                and q.get('within_reservation') is True and q.get('remaining_jobs') == []
                and q.get('all4_original_work_exactness_geometry_and_caps_pass') is True,
                'both functional deliveries must pass before any fresh full cohort')
        assessed = pilot.assess(name)
        require(assessed['fixture_delivery_qualified'] is True and assessed['performance_qualified'] is False
                and q['execution_receipt_sha256'] == digest(path / 'receipt.json')
                and q['stdout_sha256'] == digest(path / 'stdout.txt'), 'functional evidence changed')
        delivery[name] = {str(p): digest(p) for p in path.iterdir() if p.is_file()}
    return build, {'native': native, 'functional_delivery_only': delivery}


def materialize(name):
    original = old.materialize(name)
    value = copy.deepcopy(original)
    f = fixtures(PROFILES[name][0])
    value.update(label='qualified-fixture-' + name + '-v537',
                 fixture=f['measured']['path'], fixture_sha256=f['measured']['sha256'],
                 warmup_fixture=f['first']['path'], warmup_fixture_sha256=f['first']['sha256'],
                 classification='Fresh complete original32measured+32first/16paired study after independent functional fixture delivery. V515512stop and all old rows remain consumed and unpooled. Only512first input is corrected to the independently verified distinct2051token instruction; original512measured and both4099token1024inputs retain exactbytes. The existing first-work check now also executes before measurement. Every original work dimension,16outputs, chronological geometry, control, memory/spatial/thermal/swap guard, acceptance threshold, exclusion and full15000+60allowance remains. No pilot data enters timing or acceptance; unchanged qualified256is not repeated.')
    value['conditions'] = value['classification']
    restored = copy.deepcopy(value)
    for key in ['label','classification','conditions','fixture','fixture_sha256','warmup_fixture','warmup_fixture_sha256']:
        restored[key] = original[key]
    require(restored == original, 'original full workload or criterion changed')
    require(value['rounds'] == 16 and value['minimum_output_tokens'] == value['max_tokens'] == 16,
            'full64responses and16outputs required')
    return value


def dependencies():
    value = old.dependencies()
    paths = [Path(__file__), HERE / 'checks.py', HERE / 'checks.stderr', Path(pilot.__file__),
             pilot.HERE / 'preparation.json', pilot.HERE / 'checks.py', pilot.HERE / 'checks.stderr',
             pilot.FIXTURES / 'fixture-manifest.json', DRIVER_ROOT / 'driver-transformation.json',
             DRIVER_ROOT / 'checks.py', DRIVER_ROOT / 'checks.stderr']
    paths += list(DRIVER.parent.glob('*.py')) + list((pilot.FIXTURES / 'fixtures').glob('*.txt'))
    value.update({str(p.resolve()): digest(p) for p in paths})
    return value


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'prepared or attempted')
    require('Ran 6 tests' in (HERE / 'checks.stderr').read_text()
            and (HERE / 'checks.stderr').read_text().endswith('OK\n'), 'full cohort checks missing')
    build, proof = prerequisites()
    value = {'prepared_at': runner.core.now(), 'build': build, 'native_proof': proof,
             'dependencies': dependencies(), 'work_seconds': 15000, 'cleanup_seconds': 60,
             'profiles': {n: {'protocol': materialize(n), 'policy': runner.policy(n)} for n in PROFILES},
             'model_launched': False}
    c.write_new(HERE / 'preparation.json', value)
    for name in PROFILES:
        target = HERE / name; target.mkdir()
        c.write_new(target / 'protocol.json', value['profiles'][name]['protocol'])
        c.write_new(target / 'binding.json', {'protocol_sha256': digest(target / 'protocol.json'), 'preparation_sha256': digest(HERE / 'preparation.json')})
    return {'prepared': True, 'profiles': list(PROFILES), 'model_launched': False}


def load():
    value = c.read(HERE / 'preparation.json')
    build, proof = prerequisites()
    require(value['build'] == build and value['native_proof'] == proof and value['dependencies'] == dependencies()
            and value['work_seconds'] == 15000 and value['cleanup_seconds'] == 60, 'full original proofs or allowance changed')
    for name in PROFILES:
        target = HERE / name
        require(c.read(target / 'protocol.json') == value['profiles'][name]['protocol'] == materialize(name)
                and value['profiles'][name]['policy'] == runner.policy(name)
                and c.read(target / 'binding.json') == {'protocol_sha256': digest(target / 'protocol.json'), 'preparation_sha256': digest(HERE / 'preparation.json')}, 'full original protocol or binding changed')
    return value


def assess(name):
    result = ORIGINAL_ASSESS(name)
    import json
    for row in map(json.loads, (OUT / name / 'results.jsonl').read_text().splitlines()):
        path = OUT / name / f"{row['round']}-{row['arm']}/public-plan-response.json"
        require(row['public_plan_source'] == '/api/tags models[0].details.memory_plan'
                and row['public_plan_response_sha256'] == digest(path)
                and helper.parse_public_plan(path.read_bytes()) == row['public_plan'], 'public endpoint evidence changed')
    result['all_actual_public_plan_response_bytes_verified'] = True
    result['pilot_timing_excluded'] = True
    return result


runner.HERE, runner.OUT, runner.PROFILES = HERE, OUT, PROFILES
runner.DRIVER_ROOT, runner.DRIVER, runner.bench = DRIVER_ROOT, DRIVER, bench
runner.prepare, runner.load, runner.assess = prepare, load, assess
runner.dependencies, runner.materialize, runner.fixtures = dependencies, materialize, fixtures
runner.core.load = load

if __name__ == '__main__':
    raise SystemExit(runner.main())

````````````

## Artifact SHA-256 0b47fba949e470ee6d28e2daba7d0a8abda91a31a71456fd7fc9a2610fc37fb0

Encoding: `utf-8`. Original bytes: 184.

````````````text
{
  "protocol_sha256": "bffcc30bfe65e302bbc7d6a1f928c771dfb47cc46e1cc64dc91b12bc922e5786",
  "preparation_sha256": "96ee7a553829919f27de8e337c590e6ade51e080138cc0b58ee71f18751b456d"
}

````````````

## Artifact SHA-256 bffcc30bfe65e302bbc7d6a1f928c771dfb47cc46e1cc64dc91b12bc922e5786

Encoding: `utf-8`. Original bytes: 10231.

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
  "label": "qualified-fixture-planner-1024-v537",
  "classification": "Fresh complete original32measured+32first/16paired study after independent functional fixture delivery. V515512stop and all old rows remain consumed and unpooled. The independently verified distinct2051token first instruction replaces only512first;512measured stays exact. Both4099token inputs retain4085original prefix tokens and add an explicit analysis continuation cue. Every fixture is independently functionally qualified before timing. The existing first-work check now also executes before measurement. Every original work dimension,16outputs, chronological geometry, control, memory/spatial/thermal/swap guard, acceptance threshold, exclusion and full15000+60allowance remains. No pilot data enters timing or acceptance; unchanged qualified256is not repeated.",
  "fixture": "/private/tmp/slotstream-optimization-execution/public-planner-continuation-fixture-v539/fixtures/1024-measured.txt",
  "fixture_sha256": "da8db794de2dea1bee871dfcacdb0e2cdefb34e6e4f0940bccf1d4e1cac9f9c0",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "conditions": "Fresh complete original32measured+32first/16paired study after independent functional fixture delivery. V515512stop and all old rows remain consumed and unpooled. The independently verified distinct2051token first instruction replaces only512first;512measured stays exact. Both4099token inputs retain4085original prefix tokens and add an explicit analysis continuation cue. Every fixture is independently functionally qualified before timing. The existing first-work check now also executes before measurement. Every original work dimension,16outputs, chronological geometry, control, memory/spatial/thermal/swap guard, acceptance threshold, exclusion and full15000+60allowance remains. No pilot data enters timing or acceptance; unchanged qualified256is not repeated.",
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
  "warmup_fixture": "/private/tmp/slotstream-optimization-execution/public-planner-continuation-fixture-v539/fixtures/1024-first.txt",
  "warmup_fixture_sha256": "7b1906c8296a9f7fdb29b06fa29e9d9a4cd3a12017c6a2eff088ec05e914472a",
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

## Artifact SHA-256 134e2223acc2004bd49899301c14f33ec28f8dcd98e01e00a1731c8245071ed8

Encoding: `utf-8`. Original bytes: 184.

````````````text
{
  "protocol_sha256": "b4914f9705f15635829c8653ed1aafaf1e90d03056f3516c182fb627f7c68613",
  "preparation_sha256": "96ee7a553829919f27de8e337c590e6ade51e080138cc0b58ee71f18751b456d"
}

````````````

## Artifact SHA-256 b4914f9705f15635829c8653ed1aafaf1e90d03056f3516c182fb627f7c68613

Encoding: `utf-8`. Original bytes: 10226.

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
  "label": "qualified-fixture-planner-512-v537",
  "classification": "Fresh complete original32measured+32first/16paired study after independent functional fixture delivery. V515512stop and all old rows remain consumed and unpooled. The independently verified distinct2051token first instruction replaces only512first;512measured stays exact. Both4099token inputs retain4085original prefix tokens and add an explicit analysis continuation cue. Every fixture is independently functionally qualified before timing. The existing first-work check now also executes before measurement. Every original work dimension,16outputs, chronological geometry, control, memory/spatial/thermal/swap guard, acceptance threshold, exclusion and full15000+60allowance remains. No pilot data enters timing or acceptance; unchanged qualified256is not repeated.",
  "fixture": "/private/tmp/slotstream-optimization-execution/public-planner-continuation-fixture-v539/fixtures/512-measured.txt",
  "fixture_sha256": "19f859c2a14d9746bd652d39bb0caa65edb42064d0a69bc28d1d3be47c632f23",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "conditions": "Fresh complete original32measured+32first/16paired study after independent functional fixture delivery. V515512stop and all old rows remain consumed and unpooled. The independently verified distinct2051token first instruction replaces only512first;512measured stays exact. Both4099token inputs retain4085original prefix tokens and add an explicit analysis continuation cue. Every fixture is independently functionally qualified before timing. The existing first-work check now also executes before measurement. Every original work dimension,16outputs, chronological geometry, control, memory/spatial/thermal/swap guard, acceptance threshold, exclusion and full15000+60allowance remains. No pilot data enters timing or acceptance; unchanged qualified256is not repeated.",
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
  "warmup_fixture": "/private/tmp/slotstream-optimization-execution/public-planner-continuation-fixture-v539/fixtures/512-first.txt",
  "warmup_fixture_sha256": "67d6cbc41225abebf70d60d37613bd62fc908609dbac49f4892350d2117ab7f9",
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

## Artifact SHA-256 96ee7a553829919f27de8e337c590e6ade51e080138cc0b58ee71f18751b456d

Encoding: `gzip+base64`. Original bytes: 67214.

````````````text
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
````````````

## Artifact SHA-256 b0f6c64f1584c367cb85f3521f94fae83efe1de15bfaabddf2f2e7ee8e7fc175

Encoding: `utf-8`. Original bytes: 7930.

````````````text
"""Full original planner cohorts after independent first-fixture delivery."""
from pathlib import Path
import copy
import importlib.util
import sys

HERE = Path(__file__).resolve().parent
BASE = Path('/tmp/slotstream-optimization-execution')


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


old = module('v537_original', BASE / 'public-plan-observed-cohort-v515/run.py')
pilot = module('v537_functional_delivery', BASE / 'public-planner-fixture-delivery-v535/run.py')
continuation = module('v537_continuation_delivery', BASE / 'public-planner-continuation-delivery-v540/run.py')
runner, c, digest, require = old.runner, old.c, old.digest, old.require
ROOT, BINARY = old.ROOT, old.BINARY
PROFILES = {'planner-512': (512, 12), 'planner-1024': (1024, 16)}
OUT = ROOT / '.build/optimization/public-planner-qualified-fixture-cohort-v537'
DRIVER_ROOT, DRIVER, bench, helper = pilot.DRIVER_ROOT, pilot.DRIVER, pilot.bench, pilot.helper
fixtures = continuation.fixtures
ORIGINAL_ASSESS = old.ORIGINAL_ASSESS


def prerequisites():
    build, native = old.prerequisites()
    delivery = {}
    for name in PROFILES:
        provider = pilot if name == 'planner-512' else continuation
        path = provider.HERE / name / 'execution'
        q = c.read(path / 'qualification.json')
        require(q.get('fixture_delivery_qualified') is True and q.get('performance_qualified') is False
                and q.get('completed') is True and q.get('qualified') is True
                and q.get('proofs_unchanged') is True and q.get('cleanup_complete') is True
                and q.get('within_reservation') is True and q.get('remaining_jobs') == []
                and q.get('all4_original_work_exactness_geometry_and_caps_pass') is True,
                'both functional deliveries must pass before any fresh full cohort')
        assessed = provider.assess(name)
        require(assessed['fixture_delivery_qualified'] is True and assessed['performance_qualified'] is False
                and q['execution_receipt_sha256'] == digest(path / 'receipt.json')
                and q['stdout_sha256'] == digest(path / 'stdout.txt'), 'functional evidence changed')
        delivery[name] = {str(p): digest(p) for p in path.iterdir() if p.is_file()}
    return build, {'native': native, 'functional_delivery_only': delivery}


def materialize(name):
    original = old.materialize(name)
    value = copy.deepcopy(original)
    f = fixtures(PROFILES[name][0])
    value.update(label='qualified-fixture-' + name + '-v537',
                 fixture=f['measured']['path'], fixture_sha256=f['measured']['sha256'],
                 warmup_fixture=f['first']['path'], warmup_fixture_sha256=f['first']['sha256'],
                 classification='Fresh complete original32measured+32first/16paired study after independent functional fixture delivery. V515512stop and all old rows remain consumed and unpooled. The independently verified distinct2051token first instruction replaces only512first;512measured stays exact. Both4099token inputs retain4085original prefix tokens and add an explicit analysis continuation cue. Every fixture is independently functionally qualified before timing. The existing first-work check now also executes before measurement. Every original work dimension,16outputs, chronological geometry, control, memory/spatial/thermal/swap guard, acceptance threshold, exclusion and full15000+60allowance remains. No pilot data enters timing or acceptance; unchanged qualified256is not repeated.')
    value['conditions'] = value['classification']
    restored = copy.deepcopy(value)
    for key in ['label','classification','conditions','fixture','fixture_sha256','warmup_fixture','warmup_fixture_sha256']:
        restored[key] = original[key]
    require(restored == original, 'original full workload or criterion changed')
    require(value['rounds'] == 16 and value['minimum_output_tokens'] == value['max_tokens'] == 16,
            'full64responses and16outputs required')
    return value


def dependencies():
    value = old.dependencies()
    paths = [Path(__file__), HERE / 'checks.py', HERE / 'checks.stderr', Path(pilot.__file__),
             pilot.HERE / 'preparation.json', pilot.HERE / 'checks.py', pilot.HERE / 'checks.stderr',
             pilot.FIXTURES / 'fixture-manifest.json', DRIVER_ROOT / 'driver-transformation.json',
             DRIVER_ROOT / 'checks.py', DRIVER_ROOT / 'checks.stderr']
    paths += [Path(continuation.__file__), continuation.HERE / 'preparation.json', continuation.HERE / 'checks.py', continuation.HERE / 'checks.stderr', continuation.FIXTURES / 'fixture-manifest.json']
    paths += list(DRIVER.parent.glob('*.py')) + list((pilot.FIXTURES / 'fixtures').glob('*.txt')) + list((continuation.FIXTURES / 'fixtures').glob('*.txt'))
    value.update({str(p.resolve()): digest(p) for p in paths})
    return value


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'prepared or attempted')
    require('Ran 6 tests' in (HERE / 'checks.stderr').read_text()
            and (HERE / 'checks.stderr').read_text().endswith('OK\n'), 'full cohort checks missing')
    build, proof = prerequisites()
    value = {'prepared_at': runner.core.now(), 'build': build, 'native_proof': proof,
             'dependencies': dependencies(), 'work_seconds': 15000, 'cleanup_seconds': 60,
             'profiles': {n: {'protocol': materialize(n), 'policy': runner.policy(n)} for n in PROFILES},
             'model_launched': False}
    c.write_new(HERE / 'preparation.json', value)
    for name in PROFILES:
        target = HERE / name; target.mkdir()
        c.write_new(target / 'protocol.json', value['profiles'][name]['protocol'])
        c.write_new(target / 'binding.json', {'protocol_sha256': digest(target / 'protocol.json'), 'preparation_sha256': digest(HERE / 'preparation.json')})
    return {'prepared': True, 'profiles': list(PROFILES), 'model_launched': False}


def load():
    value = c.read(HERE / 'preparation.json')
    build, proof = prerequisites()
    require(value['build'] == build and value['native_proof'] == proof and value['dependencies'] == dependencies()
            and value['work_seconds'] == 15000 and value['cleanup_seconds'] == 60, 'full original proofs or allowance changed')
    for name in PROFILES:
        target = HERE / name
        require(c.read(target / 'protocol.json') == value['profiles'][name]['protocol'] == materialize(name)
                and value['profiles'][name]['policy'] == runner.policy(name)
                and c.read(target / 'binding.json') == {'protocol_sha256': digest(target / 'protocol.json'), 'preparation_sha256': digest(HERE / 'preparation.json')}, 'full original protocol or binding changed')
    return value


def assess(name):
    result = ORIGINAL_ASSESS(name)
    import json
    for row in map(json.loads, (OUT / name / 'results.jsonl').read_text().splitlines()):
        path = OUT / name / f"{row['round']}-{row['arm']}/public-plan-response.json"
        require(row['public_plan_source'] == '/api/tags models[0].details.memory_plan'
                and row['public_plan_response_sha256'] == digest(path)
                and helper.parse_public_plan(path.read_bytes()) == row['public_plan'], 'public endpoint evidence changed')
    result['all_actual_public_plan_response_bytes_verified'] = True
    result['pilot_timing_excluded'] = True
    return result


runner.HERE, runner.OUT, runner.PROFILES = HERE, OUT, PROFILES
runner.DRIVER_ROOT, runner.DRIVER, runner.bench = DRIVER_ROOT, DRIVER, bench
runner.prepare, runner.load, runner.assess = prepare, load, assess
runner.dependencies, runner.materialize, runner.fixtures = dependencies, materialize, fixtures
runner.core.load = load

if __name__ == '__main__':
    raise SystemExit(runner.main())

````````````

## Artifact SHA-256 b1bb0641b8aa45aa547e67d1074c119eba3d53689088637ed7c5861d29a715ba

Encoding: `utf-8`. Original bytes: 4877.

````````````text
"""Audit one completed original public-planner cohort; preserve every row and gate."""
from pathlib import Path
import argparse
import collections
import importlib.util
import json
import sys

HERE = Path(__file__).resolve().parent
SOURCE = Path('/tmp/slotstream-optimization-execution/public-planner-qualified-fixture-cohort-v537/run.py')
spec = importlib.util.spec_from_file_location('qualified_planner', SOURCE)
wrapper = importlib.util.module_from_spec(spec)
spec.loader.exec_module(wrapper)
m = wrapper.runner
parser = argparse.ArgumentParser()
parser.add_argument('name', choices=m.PROFILES)
args = parser.parse_args()
name = args.name
receipt_path = m.HERE / name / 'execution/qualification.json'
receipt = m.c.read(receipt_path)
m.require(receipt.get('cleanup_complete') is True and receipt.get('remaining_jobs') == [],
          'terminal cleanup required before audit')
assessment = m.assess(name)
protocol = m.c.read(m.HERE / name / 'protocol.json')
raw = m.OUT / name
rows = [json.loads(line) for line in (raw / 'results.jsonl').read_bytes().splitlines()]
groups, firsts, peaks = collections.defaultdict(list), {}, []
for row in rows:
    groups[row['round']].append(row)
    first = m.c.read(raw / f"{row['round']}-{row['arm']}/warmup.json")
    firsts[(row['round'], row['arm'])] = first
    for response in (first, row):
        stats = response['metrics']['stats']
        m.bench.validate_work_observation(protocol['work_constraints'], row['arm'], stats)
        peak = stats['sampledFootprint']['peakBytes']
        m.require(0 < peak <= protocol['maximum_sampled_footprint_bytes'],
                  'original whole-response sampled cap failed')
        peaks.append(peak)
m.require(assessment['completed'] is True and len(peaks) == 64, 'all original responses required')
for number, pair in groups.items():
    arms = {row['arm']: row for row in pair}
    m.require(len(pair) == 2 and set(arms) == {'reference', 'automatic'}, 'complete unique pair required')
    for phase in ('first', 'measured'):
        a, b = [(firsts[(number, arm)] if phase == 'first' else arms[arm])
                for arm in ('reference', 'automatic')]
        m.require(a['metrics']['prompt_ids'] == b['metrics']['prompt_ids']
                  and a['metrics']['output_ids'] == b['metrics']['output_ids']
                  and a['text'] == b['text'], 'complete pair prompt/output/text mismatch')
        m.require(a['metrics']['stats']['prefillComputePasses'] == b['metrics']['stats']['prefillComputePasses'],
                  'chronological numerical schedule mismatch')
result = {'audited_at_utc': m.core.now(), 'assessment': assessment,
          'all64_exact_prompt_output_text_and_equal_work': True,
          'all64_original_sampled_physical_caps_pass': True,
          'maximum_observed_sampled_peak_bytes': max(peaks),
          'absolute_cap_bytes': protocol['maximum_sampled_footprint_bytes'],
          'clean_measured_pairs': [n for n,p in groups.items() if all(r.get('valid') is True for r in p)],
          'clean_first_and_measured_pairs': [n for n,p in groups.items() if all(
              r.get('valid') is True and r.get('startup_and_warmup_valid') is True for r in p)],
          'exclusions': dict(collections.Counter(r.get('exclusion') for r in rows if not r.get('valid'))),
          'protocol_sha256': m.digest(m.HERE / name / 'protocol.json'),
          'results_sha256': m.digest(raw / 'results.jsonl'),
          'terminal_receipt_sha256': m.digest(receipt_path), 'activation_performed': False}
sys.path.insert(0, str(m.ROOT / 'Tools'))
import optimization_results as reporter
mapped = [dict(row, arm='combined' if row['arm'] == 'automatic' else row['arm']) for row in rows]
descriptive = {'classification': 'One complete corrected-fixture actual-planner profile only; not final composition or sustained TPS.',
               'reporter_sha256': m.digest(Path(reporter.__file__)),
               'results_sha256': result['results_sha256'], 'label_mapping_only': {'automatic': 'combined'},
               'percentage_method': 'Median of per-pair percentage improvements; positive is faster or lower memory.',
               'metrics': {key: reporter.summarize_metric(mapped, key) for key in reporter.METRICS}}
out = HERE / name
out.mkdir(exist_ok=False)
m.c.write_new(out / 'audit.json', result)
m.c.write_new(out / 'descriptive-metrics.json', descriptive)
print(json.dumps({'qualified': assessment['qualified'], 'clean_measured_pairs': result['clean_measured_pairs'],
                  'clean_first_pairs': result['clean_first_and_measured_pairs'],
                  'maximum_sampled_peak_bytes': max(peaks),
                  'metrics': {key: {k: value.get(k) for k in ['clean_pairs', 'measured', 'median_reference',
                      'median_combined', 'median_improvement_percent']} for key, value in descriptive['metrics'].items()}}, indent=2))

````````````

## Artifact SHA-256 4440195a6fa46cf535484dc38d3dd71e9e337f9f13be08c3675c92e1016af76f

Encoding: `utf-8`. Original bytes: 734.

````````````text
{
  "original_auditor": "/tmp/slotstream-optimization-execution/public-planner-terminal-v513/audit.py",
  "original_sha256": "1f14a3b93375ac2270c2129614d92eed67b3f9f1210b04747f761b25a5b38543",
  "new_sha256": "b1bb0641b8aa45aa547e67d1074c119eba3d53689088637ed7c5861d29a715ba",
  "changes": [
    [
      "public-plan-observed-cohort-v515/run.py",
      "public-planner-qualified-fixture-cohort-v537/run.py"
    ],
    [
      "One complete actual-planner profile only; not final composition or sustained TPS.",
      "One complete corrected-fixture actual-planner profile only; not final composition or sustained TPS."
    ]
  ],
  "original_auditor_reconstructs_exactly": true,
  "model_launched": false,
  "cohort_audited": false
}

````````````
