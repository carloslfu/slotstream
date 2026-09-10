---
type: run
id: 01m227fj5xktkv22q40kkw2440
created: 2026-09-09T04:40:37.821916+00:00
updated: 2026-09-09T04:40:38.135695+00:00
summary: Public planner serving measurement driver prepared and model-free checked
binary: /Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream
captured_at: 2026-09-08
command: Actual model-free doctor at explicit memory targets; V472 checks.py with model launch intercepted
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Public planner serving measurement driver prepared and model-free checked
tool: Slotstream exact native and source qualification capture
---
The old serving harness always forces the prefill chunk, so it cannot independently prove actual public planner selection. This isolated new family omits the forced chunk, retains prefix allocation and validates actual planned/effective chunk, target, pool, options and chronological compute/read shapes for every first and measured response. It retains original request/resource/timing assessment and requires exact grouping or declared short fallback. Twelve model-free tests pass in 0.201 seconds, including actual entrypoint with Popen intercepted. The initial one-test fixture failure was macOS /var versus /private/var path canonicalization; its exact failure is preserved and only the expected test path was resolved. No production helper behavior changed for that fix. Read-only actual planner observations select 256 at 8.1/10 GB without MTP, 512 at 12 GB without MTP and 1024 at 16 GB; MTP selects 256 at 10/12 GB and 1024 at 16 GB, while 8.1 GB refuses its draft head. These are planning metadata, not capacity or performance proof. No automatic serving protocol is frozen and no automatic cohort is run by this preparation. Existing frozen scope, vision and final protocols remain unchanged.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/automatic_scope.py",
    "bytes": 9569,
    "sha256": "a06ac5399853201a7ce92e2f42be98fdffc1131e6fabedb68ea146765b6dfe0b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/checks.py",
    "bytes": 12064,
    "sha256": "90e21a2eafb6f5698f943b2a6b95f271390877e83ab65c9e8dcd630b2647eeb0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/checks.stderr",
    "bytes": 1035,
    "sha256": "92a0238dbe51e57d1e6367018d8359c0a8b42d95a19d06e0959987c6b60064ff"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/automatic_scope.py",
    "bytes": 9569,
    "sha256": "a06ac5399853201a7ce92e2f42be98fdffc1131e6fabedb68ea146765b6dfe0b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/prefill_bench.py",
    "bytes": 19176,
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/serve_bench.py",
    "bytes": 61619,
    "sha256": "3b1d2f37f247b5c786154125d5fadd4500ebf007509c45fddf185681beb583bf"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver-transformation.json",
    "bytes": 3938,
    "sha256": "80c3035d058c3ba103674d6ad19a3a2d3fbb9d35a1b2157c03a72ce4308ab941"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/initial/checks.py",
    "bytes": 12054,
    "sha256": "34c09db67c0ad4050fa03d2a69332f5919128119291a82071f6c06f75909f596"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/initial/checks.stderr",
    "bytes": 1660,
    "sha256": "1b2d089d7b44b09e965f28d444cf76a4fc1e7396432b992d42037f99dc1c14a7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/initial/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/10-off.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/10-off.stdout",
    "bytes": 2910,
    "sha256": "044255fa228d499ba7542bdf826b976b51e8d7b56ea0c9fe8c9b4c496ab24c72"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/10-on.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/10-on.stdout",
    "bytes": 2928,
    "sha256": "8f12d7aae5650ce8224980b7463a3c933a257f9a672b51b57dab920ad9fa4ced"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/12-off.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/12-off.stdout",
    "bytes": 2917,
    "sha256": "2641198a483ba6ecae4a90184452f57d46262bb581ab06b69de040daf18cb9c5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/12-on.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/12-on.stdout",
    "bytes": 2940,
    "sha256": "428e7829456d790a0dde13c4b9859f203d441d601b387693cf4b7f7cf611ed1e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/16-off.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/16-off.stdout",
    "bytes": 2938,
    "sha256": "361e97385115857c7cfc3dff4585f6b9119d240bc7b34061c907e38a6850ee4c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/16-on.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/16-on.stdout",
    "bytes": 2962,
    "sha256": "6944bff4f2935ca2700e460d5e5f0fd1c7b09f319b09cd75c1bddc422aa7404a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/8.1-off.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/8.1-off.stdout",
    "bytes": 2918,
    "sha256": "48a2b10b02b92c8550c5043080b28d9da6084c4884a78c6bb456279702c577c0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/8.1-on.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/8.1-on.stdout",
    "bytes": 689,
    "sha256": "a5ba5eee7d131b883adbde345ca46a6efac947795053b01a6211e33afda11eaf"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/planner-observations/manifest.json",
    "bytes": 5250,
    "sha256": "f26b3a32c82df635054d1f35b60ec2cdd1cbba6d608cb2981092dc9f0dba9f23"
  }
]
```

## Artifact SHA-256 a06ac5399853201a7ce92e2f42be98fdffc1131e6fabedb68ea146765b6dfe0b

Encoding: `utf-8`. Original bytes: 9569.

````````````text
"""Additional bounds for a separately declared real-planner scope study.

This module never loads a model. Existing benchmark families keep their
original validation, configuration and request/resource assessors.
"""
from pathlib import Path


def require(value, message):
    if not value:
        raise ValueError(message)


def declaration(protocol):
    value = protocol.get('automatic_scope_measurement')
    if value is None:
        return None
    require(type(value) is dict and set(value) == {'purpose', 'expect_grouped_prefill'},
            'automatic scope study requires an exact purpose/grouping declaration')
    require(type(value['purpose']) is str and bool(value['purpose'].strip())
            and type(value['expect_grouped_prefill']) is bool,
            'automatic scope purpose and grouping expectation are invalid')
    memory = protocol.get('memory_gb')
    require(type(memory) in (int, float) and memory in (8.1, 10, 12, 16),
            'automatic scope study supports only bounded 8.1/10/12/16 GB profiles')
    require(protocol.get('raw') is True and protocol.get('mtp') in ('off', 'on')
            and type(protocol.get('max_tokens')) is int and 1 <= protocol['max_tokens'] <= 16,
            'automatic scope study requires explicit raw input, MTP mode and at most 16 outputs')
    require(protocol['mtp'] == 'off' or memory >= 10,
            'the observed public planner refuses the draft head at 8.1 GB')
    require(not any(k in protocol for k in ('large_pool_measurement', 'large_scope_measurement',
                'large_vision_measurement', 'fixed_pool_slots', 'images')),
            'automatic planner qualification cannot substitute another memory or image family')
    require(protocol.get('abort_on_resource_failure') is True
            and protocol.get('require_nominal_power_state') is True
            and protocol.get('stop_on_workspace_contention') is True
            and type(protocol.get('maximum_sampled_footprint_bytes')) is int
            and protocol['maximum_sampled_footprint_bytes'] == round(memory * 1e9),
            'automatic scope study requires the exact process cap and original live guards')
    require(protocol.get('comparison_basis') == 'fixed-pool',
            'both automatic-policy arms must retain the same actual planner pool')
    arms = protocol.get('arms')
    require(type(arms) is dict and set(arms) == {'reference', 'automatic'},
            'automatic scope study requires exactly reference and automatic arms')
    common = {
        'SLOTSTREAM_OPT_COMPACT_STATE': '1', 'SLOTSTREAM_OPT_COMPACT_MTP': '1',
        'SLOTSTREAM_OPT_TAIL_SCHEDULE': '0', 'SLOTSTREAM_OPT_LAYER_WORKSPACE': '0',
        'SLOTSTREAM_OPT_READ_SCOPE': '0', 'SLOTSTREAM_OPT_WORKSPACE_TILE': '256',
        'SLOTSTREAM_OPT_WORKSPACE_PIECES': '0', 'SLOTSTREAM_OPT_SCOPE_FRONTIER': '0',
    }
    controls = []
    for name, arm in arms.items():
        require(type(arm) is dict and type(arm.get('chunk')) is int
                and arm['chunk'] in (256, 512, 1024) and type(arm.get('env')) is dict,
                'automatic planner expectation must be a supported compute size')
        env = arm['env']
        require('SLOTSTREAM_PREFILL_CHUNK' not in env,
                'a forced prefill environment is not a public-planner test')
        require(all(env.get(k) == v for k, v in common.items()),
                'automatic selection prerequisites or manual geometry changed')
        require(env.get('SLOTSTREAM_OPT_AUTO_READ_SCOPE') == ('0' if name == 'reference' else '1'),
                'automatic policy arm does not select the declared option')
        controls.append({k: v for k, v in env.items() if k != 'SLOTSTREAM_OPT_AUTO_READ_SCOPE'})
    require(controls[0] == controls[1] and arms['reference']['chunk'] == arms['automatic']['chunk'],
            'automatic scope arms must differ only in the automatic policy')
    prefix = protocol.get('prefix_cache')
    require(type(prefix) is dict and prefix == {
        'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'automatic': 0}},
        'automatic planner study keeps prefix reservation with distinct unreused inputs')
    require(all(type(protocol.get(k)) is str and bool(protocol[k])
                for k in ('warmup_fixture', 'warmup_fixture_sha256')),
            'automatic planner study requires a frozen distinct warmup')
    return value


def measurement_memory(protocol, original):
    if declaration(protocol) is None:
        return original(protocol)
    # A separate conservative startup allowance covers optional workspace
    # admission. It grants no extra process capacity or peak allowance.
    return protocol['memory_gb'] + 6


def warmup_fixture(protocol, measured, original, digest):
    if declaration(protocol) is None:
        return original(protocol, measured)
    path = Path(protocol['warmup_fixture']).resolve()
    require(path != Path(measured).resolve() and digest(path) == protocol['warmup_fixture_sha256'],
            'automatic planner warmup must be distinct and match its frozen bytes')
    require(path.stat().st_size <= 32768 and Path(measured).stat().st_size <= 32768,
            'automatic planner input exceeds its bounded byte size')
    return path


def environment(protocol, arm, clean):
    result = dict(clean)
    result.update(arm['env'])
    result['SLOTSTREAM_BENCH_DETAILS'] = '1'
    if declaration(protocol) is None:
        result['SLOTSTREAM_PREFILL_CHUNK'] = str(arm['chunk'])
    else:
        require('SLOTSTREAM_PREFILL_CHUNK' not in result, 'inherited environment forces prefill')
    return result


def passes(value, label):
    require(type(value) is list and value and all(type(n) is int and n > 0 for n in value),
            label + ' must contain actual positive integer pass sizes')
    return value


def validate_observation(protocol, name, row, warm, measured):
    declared = declaration(protocol)
    if declared is None:
        return None
    require('SLOTSTREAM_PREFILL_CHUNK' not in row.get('env', {})
            and not any(arg.startswith(('--prefill-chunk', '--sim-')) for arg in row['command'])
            and '--no-prefix-cache' not in row['command'] and '--pool-gb' not in row['command'],
            'executed command bypasses the public planner')
    expected = protocol['arms'][name]['chunk']
    result = {}
    observations = [('first', warm)]
    if measured is not None:
        observations.append(('measured', measured))
    for phase, metrics in observations:
        plan = metrics.get('plan', {})
        require(type(plan.get('prefill_chunk')) is int
                and type(metrics.get('effective_prefill_chunk')) is int
                and plan['prefill_chunk'] == expected == metrics['effective_prefill_chunk']
                and plan.get('target_gb') == protocol['memory_gb']
                and plan.get('runtime_prefix_cache_enabled') is True
                and 'runtime_prefill_override' not in plan
                and plan.get('availability_clamped') is False
                and type(plan.get('pool_slots')) is int and plan['pool_slots'] > 0
                and plan['pool_slots'] == metrics.get('effective_pool_slots'),
                phase + ': actual public planner differs from the frozen profile')
        enabled = metrics.get('optimizations', {}).get('automaticReadScope')
        require(enabled is True if name == 'automatic' else enabled is None or enabled is False,
                phase + ': actual automatic policy differs')
        stats = metrics['stats']
        count = stats.get('prefillTokens')
        require(type(count) is int and 1 <= count <= 8192
                and type(stats.get('reusedPrefixTokens')) is int
                and stats['reusedPrefixTokens'] == 0,
                phase + ': the distinct bounded input or zero-reuse workload changed')
        read = passes(stats.get('prefillPasses'), phase + ' read passes')
        compute = passes(stats.get('prefillComputePasses'), phase + ' compute passes')
        require(sum(read) == sum(compute) == count,
                phase + ': logical rows and actual numerical passes differ')
        canonical = [expected] * (count // expected)
        if count % expected:
            canonical.append(count % expected)
        require(compute == canonical, phase + ': original chronological compute shapes changed')
        # Every read group must contain whole original numerical passes.
        at = 0
        grouped = 0
        for count in read:
            used = 0
            start = at
            while at < len(compute) and used < count:
                used += compute[at]
                at += 1
            require(used == count and count <= 4096, phase + ': read group changed numerical boundaries')
            if at - start > 1:
                require(at - start >= 4 and len(set(compute[start:at])) == 1
                        and compute[start] == expected,
                        phase + ': automatic group violates its four-full-pass policy')
                grouped += 1
        require(at == len(compute), phase + ': numerical passes were dropped')
        expect_grouped = name == 'automatic' and declared['expect_grouped_prefill']
        require((grouped > 0) == expect_grouped and (expect_grouped or read == compute),
                phase + ': required automatic sharing or ordinary fallback was not observed')
        result[phase] = {'planner_chunk': expected, 'read_groups': len(read),
                         'compute_passes': len(compute), 'grouped_reads': grouped}
    return result

````````````

## Artifact SHA-256 90e21a2eafb6f5698f943b2a6b95f271390877e83ab65c9e8dcd630b2647eeb0

Encoding: `utf-8`. Original bytes: 12064.

````````````text
import contextlib
import copy
import hashlib
import importlib.util
import inspect
import io
import json
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE / 'driver'))
import automatic_scope as scope


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


driver = module('planner_driver', HERE / 'driver/serve_bench.py')
original = module('original_driver', HERE.parent / 'thermal-settle-preparation-v388/driver/serve_bench.py')
OLD = json.loads((HERE.parent / 'automatic-scope-explicit-serving-v467/protocol.json').read_text())


def protocol(chunk=256, grouped=True):
    env = dict(OLD['arms']['reference']['env'])
    env['SLOTSTREAM_OPT_AUTO_READ_SCOPE'] = '0'
    arms = {'reference': {'chunk': chunk, 'env': env}}
    arms['automatic'] = copy.deepcopy(arms['reference'])
    arms['automatic']['env']['SLOTSTREAM_OPT_AUTO_READ_SCOPE'] = '1'
    return {
        'automatic_scope_measurement': {'purpose': 'Synthetic driver delivery only',
                                         'expect_grouped_prefill': grouped},
        'memory_gb': {256: 10, 512: 12, 1024: 16}[chunk],
        'raw': True, 'mtp': 'off', 'max_tokens': 16, 'minimum_output_tokens': 16,
        'abort_on_resource_failure': True, 'require_nominal_power_state': True,
        'stop_on_workspace_contention': True, 'comparison_basis': 'fixed-pool',
        'maximum_sampled_footprint_bytes': {256: 10, 512: 12, 1024: 16}[chunk] * 10**9,
        'arms': arms, 'prefix_cache': {'retention_only': True,
            'expected_reused_tokens': {'reference': 0, 'automatic': 0}},
        'warmup_fixture': '/synthetic/warm.txt', 'warmup_fixture_sha256': '0' * 64,
    }


def metrics(p, enabled, count=4099, grouped=True):
    chunk = p['arms']['reference']['chunk']
    compute = [chunk] * (count // chunk) + ([count % chunk] if count % chunk else [])
    reads = [4096] + ([count - 4096] if count > 4096 else []) if enabled and grouped else compute[:]
    return {'plan': {'prefill_chunk': chunk, 'target_gb': p['memory_gb'],
                     'runtime_prefix_cache_enabled': True, 'availability_clamped': False,
                     'pool_slots': 640},
            'effective_prefill_chunk': chunk, 'effective_pool_slots': 640,
            'optimizations': {'automaticReadScope': True if enabled else None},
            'stats': {'prefillTokens': count, 'reusedPrefixTokens': 0,
                      'prefillPasses': reads, 'prefillComputePasses': compute}}


ROW = {'env': {'SLOTSTREAM_BENCH_DETAILS': '1'},
       'command': ['slotstream', 'serve', '--memory-gb', '10', '--no-elastic']}


class Checks(unittest.TestCase):
    def test_three_planner_profiles_and_real_group_shapes(self):
        for chunk in (256, 512, 1024):
            p = protocol(chunk)
            self.assertEqual(driver.measurement_memory(p), p['memory_gb'] + 6)
            for name in p['arms']:
                m = metrics(p, name == 'automatic')
                got = scope.validate_observation(p, name, ROW, m, m)
                self.assertEqual(got['first']['grouped_reads'], int(name == 'automatic'))

    def test_short_fallback_retains_exact_original_passes(self):
        p = protocol(grouped=False)
        m = metrics(p, True, count=257, grouped=False)
        self.assertEqual(scope.validate_observation(p, 'automatic', ROW, m, m)['measured']['grouped_reads'], 0)

    def test_forced_environment_is_removed_only_for_new_family(self):
        p = protocol()
        self.assertNotIn('SLOTSTREAM_PREFILL_CHUNK', scope.environment(p, p['arms']['automatic'], {}))
        self.assertEqual(scope.environment(OLD, OLD['arms']['reference'], {})['SLOTSTREAM_PREFILL_CHUNK'], '256')
        with self.assertRaises(ValueError):
            scope.environment(p, p['arms']['automatic'], {'SLOTSTREAM_PREFILL_CHUNK': '256'})

    def test_old_memory_and_request_assessors_are_unchanged(self):
        for name in ('resource_exclusions', 'summaries', 'acceptance_results', 'startup_summaries',
                     'startup_acceptance_results', 'validate_work_observation', 'validate_prefix_observation'):
            self.assertEqual(inspect.getsource(getattr(driver, name)), inspect.getsource(getattr(original, name)))
        self.assertEqual(inspect.getsource(driver._original_measurement_memory), inspect.getsource(original.measurement_memory))
        self.assertEqual(inspect.getsource(driver._original_warmup_fixture), inspect.getsource(original.warmup_fixture))
        self.assertEqual(driver.measurement_memory(OLD), original.measurement_memory(OLD))
        vision = json.loads((HERE.parent / 'vision-resource-resume-v462/mechanism/protocol.json').read_text())
        self.assertEqual(driver.measurement_memory(vision), original.measurement_memory(vision))

    def test_declaration_rejects_relaxed_bounds_and_guards(self):
        mutations = [lambda p: p.update(memory_gb=24), lambda p: p.update(memory_gb=True),
            lambda p: p.update(maximum_sampled_footprint_bytes=12 * 10**9),
            lambda p: p.update(abort_on_resource_failure=False),
            lambda p: p.update(require_nominal_power_state=False),
            lambda p: p.update(stop_on_workspace_contention=False), lambda p: p.update(raw=False),
            lambda p: p.update(max_tokens=17), lambda p: p.update(images=[]),
            lambda p: p.update(fixed_pool_slots=640), lambda p: p.update(large_pool_measurement={}),
            lambda p: p['automatic_scope_measurement'].update(expect_grouped_prefill=1),
            lambda p: p['arms']['automatic']['env'].update(SLOTSTREAM_PREFILL_CHUNK='256'),
            lambda p: p['arms']['automatic']['env'].update(SLOTSTREAM_OPT_READ_SCOPE='4096'),
            lambda p: p['arms']['automatic']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='0'),
            lambda p: p['arms']['automatic'].update(chunk=512), lambda p: p.update(prefix_cache=None)]
        for change in mutations:
            p = protocol(); change(p)
            with self.subTest(change=change), self.assertRaises(ValueError): scope.declaration(p)

    def test_actual_plan_and_option_drift_cannot_qualify(self):
        mutations = [lambda m: m['plan'].update(runtime_prefill_override=256),
            lambda m: m['plan'].update(runtime_prefix_cache_enabled=False),
            lambda m: m['plan'].update(availability_clamped=True),
            lambda m: m['plan'].update(target_gb=16), lambda m: m['plan'].update(prefill_chunk=256.0),
            lambda m: m['plan'].update(pool_slots=641),
            lambda m: m['optimizations'].update(automaticReadScope=False),
            lambda m: m['stats'].update(reusedPrefixTokens=256),
            lambda m: m['stats'].update(prefillTokens=True)]
        for change in mutations:
            p = protocol(); m = metrics(p, True); change(m)
            with self.subTest(change=change), self.assertRaises(ValueError):
                scope.validate_observation(p, 'automatic', ROW, m, m)

    def test_changed_math_and_partial_or_oversized_groups_are_rejected(self):
        for field, value in [('prefillPasses', [512, 512, 512, 512, 512, 512, 512, 512, 3]),
                             ('prefillPasses', [4095, 4]), ('prefillPasses', [4099]),
                             ('prefillPasses', [True]), ('prefillPasses', []),
                             ('prefillComputePasses', [1024, 1024, 1024, 1024, 3])]:
            p = protocol(); m = metrics(p, True); m['stats'][field] = value
            with self.subTest(field=field, value=value), self.assertRaises(ValueError):
                scope.validate_observation(p, 'automatic', ROW, m, m)

    def test_first_and_measured_are_both_checked(self):
        p = protocol(); good = metrics(p, True); bad = metrics(p, False)
        for a, b in ((good, bad), (bad, good)):
            with self.assertRaises(ValueError): scope.validate_observation(p, 'automatic', ROW, a, b)

    def test_actual_command_cannot_override_planner_or_prefix(self):
        for option in ('--prefill-chunk', '--sim-ram', '--no-prefix-cache', '--pool-gb'):
            p = protocol(); m = metrics(p, True); row = copy.deepcopy(ROW); row['command'].append(option)
            with self.subTest(option=option), self.assertRaises(ValueError):
                scope.validate_observation(p, 'automatic', row, m, m)

    def test_warmup_hash_distinctness_and_byte_limits(self):
        with tempfile.TemporaryDirectory() as tmp:
            a, b = Path(tmp) / 'a.txt', Path(tmp) / 'b.txt'
            a.write_text('first'); b.write_text('second'); p = protocol(512)
            p.update(warmup_fixture=str(a), warmup_fixture_sha256=driver.digest(a))
            self.assertEqual(driver.warmup_fixture(p, b), a.resolve())
            with self.assertRaises(ValueError): driver.warmup_fixture(p, a)
            a.write_text('tampered')
            with self.assertRaises(ValueError): driver.warmup_fixture(p, b)
            p['warmup_fixture_sha256'] = driver.digest(a); b.write_bytes(b'x' * 32769)
            with self.assertRaises(ValueError): driver.warmup_fixture(p, b)

    def test_all_edits_reconstruct_original_driver_exactly(self):
        proof = json.loads((HERE / 'driver-transformation.json').read_text())
        value = Path(proof['output']).read_text()
        for edit in reversed(proof['edits']):
            self.assertEqual(value.count(edit['new']), 1); value = value.replace(edit['new'], edit['old'])
        self.assertEqual(value, Path(proof['input']).read_text())
        for name, sha in proof['helpers'].items():
            self.assertEqual(hashlib.sha256(Path(name).read_bytes()).hexdigest(), sha)

    def test_actual_driver_does_not_force_prefill_and_stops_at_intercepted_launch(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); measured = root / 'measured.txt'; warm = root / 'warm.txt'
            measured.write_text('measured input'); warm.write_text('different warm input')
            p = protocol(512)
            p.update(binary=OLD['binary'], model=OLD['model'], fixture=str(measured),
                     fixture_sha256=driver.digest(measured), warmup_fixture=str(warm),
                     warmup_fixture_sha256=driver.digest(warm), rounds=1, seed=7)
            source = root / 'protocol.json'; out = root / 'out'; source.write_text(json.dumps(p))
            launches = []
            def launch(command, **kwargs):
                launches.append(command)
                self.assertNotIn('SLOTSTREAM_PREFILL_CHUNK', kwargs['env'])
                self.assertNotIn('--no-prefix-cache', command)
                self.assertIn('--memory-gb', command)
                raise RuntimeError('MODEL_LAUNCH_INTERCEPTED')
            with patch.object(sys, 'argv', ['test', '--protocol', str(source), '--out', str(out)]), \
                 patch.object(driver, 'model_identity', return_value={'model_loaded': False}), \
                 patch.object(driver, 'competing_jobs', return_value=[]), \
                 patch.object(driver, 'reserved_cooldown', return_value={}), \
                 patch.object(driver, 'wait_for_headroom', return_value=({'swapins': 0, 'swapouts': 0}, {})), \
                 patch.object(driver, 'subprocess', types.SimpleNamespace(Popen=launch)), \
                 contextlib.redirect_stdout(io.StringIO()):
                result = driver.main()
            self.assertEqual(result, 1); self.assertEqual(len(launches), 1)
            completion = json.loads((out / 'completion.json').read_text())
            self.assertTrue(completion['stopped_early'])
            self.assertEqual(completion['planned_cells'], 2)
            for name in ('automatic_scope.py', 'thermal_settle.py', 'prefill_bench.py'):
                self.assertEqual((out / name).read_bytes(), (HERE / 'driver' / name).read_bytes())


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 92a0238dbe51e57d1e6367018d8359c0a8b42d95a19d06e0959987c6b60064ff

Encoding: `utf-8`. Original bytes: 1035.

````````````text
test_actual_command_cannot_override_planner_or_prefix (__main__.Checks) ... ok
test_actual_driver_does_not_force_prefill_and_stops_at_intercepted_launch (__main__.Checks) ... ok
test_actual_plan_and_option_drift_cannot_qualify (__main__.Checks) ... ok
test_all_edits_reconstruct_original_driver_exactly (__main__.Checks) ... ok
test_changed_math_and_partial_or_oversized_groups_are_rejected (__main__.Checks) ... ok
test_declaration_rejects_relaxed_bounds_and_guards (__main__.Checks) ... ok
test_first_and_measured_are_both_checked (__main__.Checks) ... ok
test_forced_environment_is_removed_only_for_new_family (__main__.Checks) ... ok
test_old_memory_and_request_assessors_are_unchanged (__main__.Checks) ... ok
test_short_fallback_retains_exact_original_passes (__main__.Checks) ... ok
test_three_planner_profiles_and_real_group_shapes (__main__.Checks) ... ok
test_warmup_hash_distinctness_and_byte_limits (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 12 tests in 0.201s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

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

## Artifact SHA-256 3b1d2f37f247b5c786154125d5fadd4500ebf007509c45fddf185681beb583bf

Encoding: `utf-8`. Original bytes: 61619.

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
import automatic_scope
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
    automatic_scope.declaration(protocol)
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
        fixture_limit = 32768 if (protocol.get('large_scope_measurement') is not None or protocol.get('automatic_scope_measurement') is not None) else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py'), Path(__file__).with_name('thermal_settle.py'), Path(__file__).with_name('automatic_scope.py')]:
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
            env=automatic_scope.environment(protocol,arm,clean_env)
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
                    if protocol.get('automatic_scope_measurement') is not None:
                        row['automatic_scope_first']=automatic_scope.validate_observation(protocol,name,row,warm['metrics'],None)
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
                    if protocol.get('automatic_scope_measurement') is not None:
                        row['automatic_scope_observation']=automatic_scope.validate_observation(protocol,name,row,warm['metrics'],m)
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
            except Exception as e:
                row['error']=f'{type(e).__name__}: {e}'
                if protocol.get('automatic_scope_measurement') is not None: stop_requested=True
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


_original_measurement_memory=measurement_memory
_original_warmup_fixture=warmup_fixture

def measurement_memory(protocol):
    return automatic_scope.measurement_memory(protocol,_original_measurement_memory)

def warmup_fixture(protocol,measured_fixture):
    return automatic_scope.warmup_fixture(protocol,measured_fixture,_original_warmup_fixture,digest)

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

## Artifact SHA-256 80c3035d058c3ba103674d6ad19a3a2d3fbb9d35a1b2157c03a72ce4308ab941

Encoding: `utf-8`. Original bytes: 3938.

````````````text
{
  "input": "/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/driver/serve_bench.py",
  "input_sha256": "fed47f315c9f3ea8f67696939aec1ff91a18cd23633de9c48c1ec229ee37f25c",
  "output": "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/serve_bench.py",
  "output_sha256": "3b1d2f37f247b5c786154125d5fadd4500ebf007509c45fddf185681beb583bf",
  "edits": [
    {
      "old": "import sys\nsys.path.insert",
      "new": "import sys\nimport automatic_scope\nsys.path.insert"
    },
    {
      "old": "    validate_arms(protocol.get('arms'))",
      "new": "    automatic_scope.declaration(protocol)\n    validate_arms(protocol.get('arms'))"
    },
    {
      "old": "            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}",
      "new": "            env=automatic_scope.environment(protocol,arm,clean_env)"
    },
    {
      "old": "        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048",
      "new": "        fixture_limit = 32768 if (protocol.get('large_scope_measurement') is not None or protocol.get('automatic_scope_measurement') is not None) else 2048"
    },
    {
      "old": "    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:",
      "new": "    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py'), Path(__file__).with_name('thermal_settle.py'), Path(__file__).with_name('automatic_scope.py')]:"
    },
    {
      "old": "                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\\n')",
      "new": "                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\\n')\n                    if protocol.get('automatic_scope_measurement') is not None:\n                        row['automatic_scope_first']=automatic_scope.validate_observation(protocol,name,row,warm['metrics'],None)"
    },
    {
      "old": "                    m=row['metrics']; s=m['stats']",
      "new": "                    m=row['metrics']; s=m['stats']\n                    if protocol.get('automatic_scope_measurement') is not None:\n                        row['automatic_scope_observation']=automatic_scope.validate_observation(protocol,name,row,warm['metrics'],m)"
    },
    {
      "old": "            except Exception as e: row['error']=f'{type(e).__name__}: {e}'",
      "new": "            except Exception as e:\n                row['error']=f'{type(e).__name__}: {e}'\n                if protocol.get('automatic_scope_measurement') is not None: stop_requested=True"
    },
    {
      "old": "if __name__=='__main__': raise SystemExit(main())",
      "new": "_original_measurement_memory=measurement_memory\n_original_warmup_fixture=warmup_fixture\n\ndef measurement_memory(protocol):\n    return automatic_scope.measurement_memory(protocol,_original_measurement_memory)\n\ndef warmup_fixture(protocol,measured_fixture):\n    return automatic_scope.warmup_fixture(protocol,measured_fixture,_original_warmup_fixture,digest)\n\nif __name__=='__main__': raise SystemExit(main())"
    }
  ],
  "helpers": {
    "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/thermal_settle.py": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad",
    "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/driver/automatic_scope.py": "a06ac5399853201a7ce92e2f42be98fdffc1131e6fabedb68ea146765b6dfe0b"
  },
  "classification": "Unfrozen model-free driver preparation. Existing family validators/assessors delegate unchanged. New automatic family uses actual public planner, retains prefix reservation and actual caps, validates first/measured grouping and stops on an invalid observation."
}

````````````

## Artifact SHA-256 34c09db67c0ad4050fa03d2a69332f5919128119291a82071f6c06f75909f596

Encoding: `utf-8`. Original bytes: 12054.

````````````text
import contextlib
import copy
import hashlib
import importlib.util
import inspect
import io
import json
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE / 'driver'))
import automatic_scope as scope


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


driver = module('planner_driver', HERE / 'driver/serve_bench.py')
original = module('original_driver', HERE.parent / 'thermal-settle-preparation-v388/driver/serve_bench.py')
OLD = json.loads((HERE.parent / 'automatic-scope-explicit-serving-v467/protocol.json').read_text())


def protocol(chunk=256, grouped=True):
    env = dict(OLD['arms']['reference']['env'])
    env['SLOTSTREAM_OPT_AUTO_READ_SCOPE'] = '0'
    arms = {'reference': {'chunk': chunk, 'env': env}}
    arms['automatic'] = copy.deepcopy(arms['reference'])
    arms['automatic']['env']['SLOTSTREAM_OPT_AUTO_READ_SCOPE'] = '1'
    return {
        'automatic_scope_measurement': {'purpose': 'Synthetic driver delivery only',
                                         'expect_grouped_prefill': grouped},
        'memory_gb': {256: 10, 512: 12, 1024: 16}[chunk],
        'raw': True, 'mtp': 'off', 'max_tokens': 16, 'minimum_output_tokens': 16,
        'abort_on_resource_failure': True, 'require_nominal_power_state': True,
        'stop_on_workspace_contention': True, 'comparison_basis': 'fixed-pool',
        'maximum_sampled_footprint_bytes': {256: 10, 512: 12, 1024: 16}[chunk] * 10**9,
        'arms': arms, 'prefix_cache': {'retention_only': True,
            'expected_reused_tokens': {'reference': 0, 'automatic': 0}},
        'warmup_fixture': '/synthetic/warm.txt', 'warmup_fixture_sha256': '0' * 64,
    }


def metrics(p, enabled, count=4099, grouped=True):
    chunk = p['arms']['reference']['chunk']
    compute = [chunk] * (count // chunk) + ([count % chunk] if count % chunk else [])
    reads = [4096] + ([count - 4096] if count > 4096 else []) if enabled and grouped else compute[:]
    return {'plan': {'prefill_chunk': chunk, 'target_gb': p['memory_gb'],
                     'runtime_prefix_cache_enabled': True, 'availability_clamped': False,
                     'pool_slots': 640},
            'effective_prefill_chunk': chunk, 'effective_pool_slots': 640,
            'optimizations': {'automaticReadScope': True if enabled else None},
            'stats': {'prefillTokens': count, 'reusedPrefixTokens': 0,
                      'prefillPasses': reads, 'prefillComputePasses': compute}}


ROW = {'env': {'SLOTSTREAM_BENCH_DETAILS': '1'},
       'command': ['slotstream', 'serve', '--memory-gb', '10', '--no-elastic']}


class Checks(unittest.TestCase):
    def test_three_planner_profiles_and_real_group_shapes(self):
        for chunk in (256, 512, 1024):
            p = protocol(chunk)
            self.assertEqual(driver.measurement_memory(p), p['memory_gb'] + 6)
            for name in p['arms']:
                m = metrics(p, name == 'automatic')
                got = scope.validate_observation(p, name, ROW, m, m)
                self.assertEqual(got['first']['grouped_reads'], int(name == 'automatic'))

    def test_short_fallback_retains_exact_original_passes(self):
        p = protocol(grouped=False)
        m = metrics(p, True, count=257, grouped=False)
        self.assertEqual(scope.validate_observation(p, 'automatic', ROW, m, m)['measured']['grouped_reads'], 0)

    def test_forced_environment_is_removed_only_for_new_family(self):
        p = protocol()
        self.assertNotIn('SLOTSTREAM_PREFILL_CHUNK', scope.environment(p, p['arms']['automatic'], {}))
        self.assertEqual(scope.environment(OLD, OLD['arms']['reference'], {})['SLOTSTREAM_PREFILL_CHUNK'], '256')
        with self.assertRaises(ValueError):
            scope.environment(p, p['arms']['automatic'], {'SLOTSTREAM_PREFILL_CHUNK': '256'})

    def test_old_memory_and_request_assessors_are_unchanged(self):
        for name in ('resource_exclusions', 'summaries', 'acceptance_results', 'startup_summaries',
                     'startup_acceptance_results', 'validate_work_observation', 'validate_prefix_observation'):
            self.assertEqual(inspect.getsource(getattr(driver, name)), inspect.getsource(getattr(original, name)))
        self.assertEqual(inspect.getsource(driver._original_measurement_memory), inspect.getsource(original.measurement_memory))
        self.assertEqual(inspect.getsource(driver._original_warmup_fixture), inspect.getsource(original.warmup_fixture))
        self.assertEqual(driver.measurement_memory(OLD), original.measurement_memory(OLD))
        vision = json.loads((HERE.parent / 'vision-resource-resume-v462/mechanism/protocol.json').read_text())
        self.assertEqual(driver.measurement_memory(vision), original.measurement_memory(vision))

    def test_declaration_rejects_relaxed_bounds_and_guards(self):
        mutations = [lambda p: p.update(memory_gb=24), lambda p: p.update(memory_gb=True),
            lambda p: p.update(maximum_sampled_footprint_bytes=12 * 10**9),
            lambda p: p.update(abort_on_resource_failure=False),
            lambda p: p.update(require_nominal_power_state=False),
            lambda p: p.update(stop_on_workspace_contention=False), lambda p: p.update(raw=False),
            lambda p: p.update(max_tokens=17), lambda p: p.update(images=[]),
            lambda p: p.update(fixed_pool_slots=640), lambda p: p.update(large_pool_measurement={}),
            lambda p: p['automatic_scope_measurement'].update(expect_grouped_prefill=1),
            lambda p: p['arms']['automatic']['env'].update(SLOTSTREAM_PREFILL_CHUNK='256'),
            lambda p: p['arms']['automatic']['env'].update(SLOTSTREAM_OPT_READ_SCOPE='4096'),
            lambda p: p['arms']['automatic']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='0'),
            lambda p: p['arms']['automatic'].update(chunk=512), lambda p: p.update(prefix_cache=None)]
        for change in mutations:
            p = protocol(); change(p)
            with self.subTest(change=change), self.assertRaises(ValueError): scope.declaration(p)

    def test_actual_plan_and_option_drift_cannot_qualify(self):
        mutations = [lambda m: m['plan'].update(runtime_prefill_override=256),
            lambda m: m['plan'].update(runtime_prefix_cache_enabled=False),
            lambda m: m['plan'].update(availability_clamped=True),
            lambda m: m['plan'].update(target_gb=16), lambda m: m['plan'].update(prefill_chunk=256.0),
            lambda m: m['plan'].update(pool_slots=641),
            lambda m: m['optimizations'].update(automaticReadScope=False),
            lambda m: m['stats'].update(reusedPrefixTokens=256),
            lambda m: m['stats'].update(prefillTokens=True)]
        for change in mutations:
            p = protocol(); m = metrics(p, True); change(m)
            with self.subTest(change=change), self.assertRaises(ValueError):
                scope.validate_observation(p, 'automatic', ROW, m, m)

    def test_changed_math_and_partial_or_oversized_groups_are_rejected(self):
        for field, value in [('prefillPasses', [512, 512, 512, 512, 512, 512, 512, 512, 3]),
                             ('prefillPasses', [4095, 4]), ('prefillPasses', [4099]),
                             ('prefillPasses', [True]), ('prefillPasses', []),
                             ('prefillComputePasses', [1024, 1024, 1024, 1024, 3])]:
            p = protocol(); m = metrics(p, True); m['stats'][field] = value
            with self.subTest(field=field, value=value), self.assertRaises(ValueError):
                scope.validate_observation(p, 'automatic', ROW, m, m)

    def test_first_and_measured_are_both_checked(self):
        p = protocol(); good = metrics(p, True); bad = metrics(p, False)
        for a, b in ((good, bad), (bad, good)):
            with self.assertRaises(ValueError): scope.validate_observation(p, 'automatic', ROW, a, b)

    def test_actual_command_cannot_override_planner_or_prefix(self):
        for option in ('--prefill-chunk', '--sim-ram', '--no-prefix-cache', '--pool-gb'):
            p = protocol(); m = metrics(p, True); row = copy.deepcopy(ROW); row['command'].append(option)
            with self.subTest(option=option), self.assertRaises(ValueError):
                scope.validate_observation(p, 'automatic', row, m, m)

    def test_warmup_hash_distinctness_and_byte_limits(self):
        with tempfile.TemporaryDirectory() as tmp:
            a, b = Path(tmp) / 'a.txt', Path(tmp) / 'b.txt'
            a.write_text('first'); b.write_text('second'); p = protocol(512)
            p.update(warmup_fixture=str(a), warmup_fixture_sha256=driver.digest(a))
            self.assertEqual(driver.warmup_fixture(p, b), a)
            with self.assertRaises(ValueError): driver.warmup_fixture(p, a)
            a.write_text('tampered')
            with self.assertRaises(ValueError): driver.warmup_fixture(p, b)
            p['warmup_fixture_sha256'] = driver.digest(a); b.write_bytes(b'x' * 32769)
            with self.assertRaises(ValueError): driver.warmup_fixture(p, b)

    def test_all_edits_reconstruct_original_driver_exactly(self):
        proof = json.loads((HERE / 'driver-transformation.json').read_text())
        value = Path(proof['output']).read_text()
        for edit in reversed(proof['edits']):
            self.assertEqual(value.count(edit['new']), 1); value = value.replace(edit['new'], edit['old'])
        self.assertEqual(value, Path(proof['input']).read_text())
        for name, sha in proof['helpers'].items():
            self.assertEqual(hashlib.sha256(Path(name).read_bytes()).hexdigest(), sha)

    def test_actual_driver_does_not_force_prefill_and_stops_at_intercepted_launch(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); measured = root / 'measured.txt'; warm = root / 'warm.txt'
            measured.write_text('measured input'); warm.write_text('different warm input')
            p = protocol(512)
            p.update(binary=OLD['binary'], model=OLD['model'], fixture=str(measured),
                     fixture_sha256=driver.digest(measured), warmup_fixture=str(warm),
                     warmup_fixture_sha256=driver.digest(warm), rounds=1, seed=7)
            source = root / 'protocol.json'; out = root / 'out'; source.write_text(json.dumps(p))
            launches = []
            def launch(command, **kwargs):
                launches.append(command)
                self.assertNotIn('SLOTSTREAM_PREFILL_CHUNK', kwargs['env'])
                self.assertNotIn('--no-prefix-cache', command)
                self.assertIn('--memory-gb', command)
                raise RuntimeError('MODEL_LAUNCH_INTERCEPTED')
            with patch.object(sys, 'argv', ['test', '--protocol', str(source), '--out', str(out)]), \
                 patch.object(driver, 'model_identity', return_value={'model_loaded': False}), \
                 patch.object(driver, 'competing_jobs', return_value=[]), \
                 patch.object(driver, 'reserved_cooldown', return_value={}), \
                 patch.object(driver, 'wait_for_headroom', return_value=({'swapins': 0, 'swapouts': 0}, {})), \
                 patch.object(driver, 'subprocess', types.SimpleNamespace(Popen=launch)), \
                 contextlib.redirect_stdout(io.StringIO()):
                result = driver.main()
            self.assertEqual(result, 1); self.assertEqual(len(launches), 1)
            completion = json.loads((out / 'completion.json').read_text())
            self.assertTrue(completion['stopped_early'])
            self.assertEqual(completion['planned_cells'], 2)
            for name in ('automatic_scope.py', 'thermal_settle.py', 'prefill_bench.py'):
                self.assertEqual((out / name).read_bytes(), (HERE / 'driver' / name).read_bytes())


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 1b2d089d7b44b09e965f28d444cf76a4fc1e7396432b992d42037f99dc1c14a7

Encoding: `utf-8`. Original bytes: 1660.

````````````text
test_actual_command_cannot_override_planner_or_prefix (__main__.Checks) ... ok
test_actual_driver_does_not_force_prefill_and_stops_at_intercepted_launch (__main__.Checks) ... ok
test_actual_plan_and_option_drift_cannot_qualify (__main__.Checks) ... ok
test_all_edits_reconstruct_original_driver_exactly (__main__.Checks) ... ok
test_changed_math_and_partial_or_oversized_groups_are_rejected (__main__.Checks) ... ok
test_declaration_rejects_relaxed_bounds_and_guards (__main__.Checks) ... ok
test_first_and_measured_are_both_checked (__main__.Checks) ... ok
test_forced_environment_is_removed_only_for_new_family (__main__.Checks) ... ok
test_old_memory_and_request_assessors_are_unchanged (__main__.Checks) ... ok
test_short_fallback_retains_exact_original_passes (__main__.Checks) ... ok
test_three_planner_profiles_and_real_group_shapes (__main__.Checks) ... ok
test_warmup_hash_distinctness_and_byte_limits (__main__.Checks) ... FAIL

======================================================================
FAIL: test_warmup_hash_distinctness_and_byte_limits (__main__.Checks)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/automatic-serving-driver-v472/checks.py", line 157, in test_warmup_hash_distinctness_and_byte_limits
    self.assertEqual(driver.warmup_fixture(p, b), a)
AssertionError: PosixPath('/private/var/folders/d4/t1c8ltbx5s3_11cs9y[29 chars]txt') != PosixPath('/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m00[21 chars]txt')

----------------------------------------------------------------------
Ran 12 tests in 0.197s

FAILED (failures=1)

````````````

## Artifact SHA-256 044255fa228d499ba7542bdf826b976b51e8d7b56ea0c9fe8c9b4c496ab24c72

Encoding: `utf-8`. Original bytes: 2910.

````````````text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 9742730496,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 188780544,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 640,
    "maximum_prefill_chunk" : 256,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 8999496960,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 2656972800,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 369985536,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "device_available_gb" : 37,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 385.50588235294038,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 4.0041666666666664,
  "expected_peak_gb" : 9,
  "experts_per_layer_cached" : 20,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 905969664,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 8999496960,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 2656972800,
    "prefill_bytes" : 332800000,
    "retained_capacity_bytes" : 369985536,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 2.7000000000000002,
  "pool_slots" : 961,
  "prefill_chunk" : 256,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 13382,
  "runtime_prefix_cache_enabled" : true,
  "source" : "--memory-gb",
  "target_gb" : 10,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}

````````````

## Artifact SHA-256 8f12d7aae5650ce8224980b7463a3c933a257f9a672b51b57dab920ad9fa4ced

Encoding: `utf-8`. Original bytes: 2928.

````````````text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "memory_or_required_components",
    "maximum_feasible_window" : 32768,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 981467136,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 9551997184,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 209986560,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 640,
    "maximum_prefill_chunk" : 256,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 981467136,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 9551997184,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 209986560,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "device_available_gb" : 37,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 385.50588235294038,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 2.666666666666667,
  "expected_peak_gb" : 9.5999999999999996,
  "experts_per_layer_cached" : 13,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 981467136,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 9551997184,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 1769472000,
    "prefill_bytes" : 332800000,
    "retained_capacity_bytes" : 209986560,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "pool_gb" : 1.8,
  "pool_slots" : 640,
  "prefill_chunk" : 256,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 7595,
  "runtime_prefix_cache_enabled" : true,
  "source" : "--memory-gb",
  "target_gb" : 10,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}

````````````

## Artifact SHA-256 2641198a483ba6ecae4a90184452f57d46262bb581ab06b69de040daf18cb9c5

Encoding: `utf-8`. Original bytes: 2917.

````````````text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 10998889728,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 2825625600,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 388786176,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 1022,
    "maximum_prefill_chunk" : 256,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 10997646592,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 4122316800,
      "prefill_bytes" : 665600000,
      "retained_capacity_bytes" : 569991168,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "device_available_gb" : 37,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 262.14400000000018,
  "est_prefill_tok_s" : 125,
  "est_warm_tok_s" : 6.0861493142556382,
  "expected_peak_gb" : 11,
  "experts_per_layer_cached" : 31,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 905969664,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 10997646592,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 4122316800,
    "prefill_bytes" : 665600000,
    "retained_capacity_bytes" : 569991168,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 4.0999999999999996,
  "pool_slots" : 1491,
  "prefill_chunk" : 512,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 20616,
  "runtime_prefix_cache_enabled" : true,
  "source" : "--memory-gb",
  "target_gb" : 12,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}

````````````

## Artifact SHA-256 428e7829456d790a0dde13c4b9859f203d441d601b387693cf4b7f7cf611ed1e

Encoding: `utf-8`. Original bytes: 2940.

````````````text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 11518636288,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 213691392,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 640,
    "maximum_prefill_chunk" : 256,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 981467136,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 10998927616,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 3016396800,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 409992192,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "device_available_gb" : 37.100000000000001,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 385.50588235294038,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 4.5458333333333343,
  "expected_peak_gb" : 11,
  "experts_per_layer_cached" : 23,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 981467136,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 10998927616,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 3016396800,
    "prefill_bytes" : 332800000,
    "retained_capacity_bytes" : 409992192,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "pool_gb" : 3,
  "pool_slots" : 1091,
  "prefill_chunk" : 256,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 14829,
  "runtime_prefix_cache_enabled" : true,
  "source" : "--memory-gb",
  "target_gb" : 12,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}

````````````

## Artifact SHA-256 361e97385115857c7cfc3dff4585f6b9119d240bc7b34061c907e38a6850ee4c

Encoding: `utf-8`. Original bytes: 2938.

````````````text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 14998977792,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 5427302400,
      "prefill_bytes" : 1331200000,
      "retained_capacity_bytes" : 788797440,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 1963,
    "maximum_prefill_chunk" : 1024,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 14999033088,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 7122124800,
      "prefill_bytes" : 1331200000,
      "retained_capacity_bytes" : 905969664,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "device_available_gb" : 37.100000000000001,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 200.57987878787887,
  "est_prefill_tok_s" : 165,
  "est_warm_tok_s" : 7.6139937176257977,
  "expected_peak_gb" : 15,
  "experts_per_layer_cached" : 54,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 905969664,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 14999033088,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 7122124800,
    "prefill_bytes" : 1331200000,
    "retained_capacity_bytes" : 905969664,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 7.0999999999999996,
  "pool_slots" : 2576,
  "prefill_chunk" : 1024,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 32768,
  "runtime_prefix_cache_enabled" : true,
  "source" : "--memory-gb",
  "target_gb" : 16,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}

````````````

## Artifact SHA-256 6944bff4f2935ca2700e460d5e5f0fd1c7b09f319b09cd75c1bddc422aa7404a

Encoding: `utf-8`. Original bytes: 2962.

````````````text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 14999658752,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 4517683200,
      "prefill_bytes" : 665600000,
      "retained_capacity_bytes" : 613702656,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 1634,
    "maximum_prefill_chunk" : 512,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 981467136,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 14998988032,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 5618073600,
      "prefill_bytes" : 1331200000,
      "retained_capacity_bytes" : 809975808,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "device_available_gb" : 37.100000000000001,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 200.57987878787887,
  "est_prefill_tok_s" : 165,
  "est_warm_tok_s" : 6.9089709744896952,
  "expected_peak_gb" : 15,
  "experts_per_layer_cached" : 42,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 981467136,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 14998988032,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 5618073600,
    "prefill_bytes" : 1331200000,
    "retained_capacity_bytes" : 809975808,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "pool_gb" : 5.5999999999999996,
  "pool_slots" : 2032,
  "prefill_chunk" : 1024,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 29296,
  "runtime_prefix_cache_enabled" : true,
  "source" : "--memory-gb",
  "target_gb" : 16,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}

````````````

## Artifact SHA-256 48a2b10b02b92c8550c5043080b28d9da6084c4884a78c6bb456279702c577c0

Encoding: `utf-8`. Original bytes: 2918.

````````````text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "memory_or_required_components",
    "maximum_feasible_window" : 32768,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 7921999104,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 179988480,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 640,
    "maximum_prefill_chunk" : 256,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 7921999104,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 179988480,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "device_available_gb" : 37,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 385.50588235294038,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 2.666666666666667,
  "expected_peak_gb" : 7.9000000000000004,
  "experts_per_layer_cached" : 13,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 905969664,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 7921999104,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 1769472000,
    "prefill_bytes" : 332800000,
    "retained_capacity_bytes" : 179988480,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 1.8,
  "pool_slots" : 640,
  "prefill_chunk" : 256,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 6510,
  "runtime_prefix_cache_enabled" : true,
  "source" : "--memory-gb",
  "target_gb" : 8.0999999999999996,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}

````````````

## Artifact SHA-256 a5ba5eee7d131b883adbde345ca46a6efac947795053b01a6211e33afda11eaf

Encoding: `utf-8`. Original bytes: 689.

````````````text
{
  "context_feasibility" : {
    "limiting_resource" : "memory_or_required_components",
    "maximum_feasible_window" : 0,
    "maximum_memory_ledger" : null,
    "maximum_pool_slots" : null,
    "maximum_prefill_chunk" : null,
    "refusal" : "--memory-gb 8.1 cannot fit the 1.6 GB draft head above the 8.1 GB minimum — raise the target or drop --mtp on",
    "requested_memory_ledger" : null,
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "error" : {
    "code" : "insufficient_memory",
    "message" : "--memory-gb 8.1 cannot fit the 1.6 GB draft head above the 8.1 GB minimum — raise the target or drop --mtp on"
  }
}

````````````

## Artifact SHA-256 f26b3a32c82df635054d1f35b60ec2cdd1cbba6d608cb2981092dc9f0dba9f23

Encoding: `utf-8`. Original bytes: 5250.

````````````text
{
  "classification": "Read-only actual V436 planner metadata, no simulated device or model load; capacity and performance remain unqualified.",
  "rows": [
    {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
        "doctor",
        "--memory-gb",
        "8.1",
        "--mtp",
        "off",
        "--json"
      ],
      "exit_code": 0,
      "plan": {
        "prefill_chunk": 256,
        "pool_slots": 640,
        "prefix_cache_max_tokens": 6510,
        "target_gb": 8.1,
        "availability_clamped": false,
        "mtp": false,
        "runtime_prefix_cache_enabled": true,
        "max_context_tokens": 32768
      }
    },
    {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
        "doctor",
        "--memory-gb",
        "8.1",
        "--mtp",
        "on",
        "--json"
      ],
      "exit_code": 2,
      "plan": {},
      "error": {
        "context_feasibility": {
          "limiting_resource": "memory_or_required_components",
          "maximum_feasible_window": 0,
          "maximum_memory_ledger": null,
          "maximum_pool_slots": null,
          "maximum_prefill_chunk": null,
          "refusal": "--memory-gb 8.1 cannot fit the 1.6 GB draft head above the 8.1 GB minimum \u2014 raise the target or drop --mtp on",
          "requested_memory_ledger": null,
          "requested_window": 32768,
          "scope": "memory feasibility; independent of prefill deadline"
        },
        "error": {
          "code": "insufficient_memory",
          "message": "--memory-gb 8.1 cannot fit the 1.6 GB draft head above the 8.1 GB minimum \u2014 raise the target or drop --mtp on"
        }
      }
    },
    {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
        "doctor",
        "--memory-gb",
        "10",
        "--mtp",
        "off",
        "--json"
      ],
      "exit_code": 0,
      "plan": {
        "prefill_chunk": 256,
        "pool_slots": 961,
        "prefix_cache_max_tokens": 13382,
        "target_gb": 10,
        "availability_clamped": false,
        "mtp": false,
        "runtime_prefix_cache_enabled": true,
        "max_context_tokens": 32768
      }
    },
    {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
        "doctor",
        "--memory-gb",
        "10",
        "--mtp",
        "on",
        "--json"
      ],
      "exit_code": 0,
      "plan": {
        "prefill_chunk": 256,
        "pool_slots": 640,
        "prefix_cache_max_tokens": 7595,
        "target_gb": 10,
        "availability_clamped": false,
        "mtp": true,
        "runtime_prefix_cache_enabled": true,
        "max_context_tokens": 32768
      }
    },
    {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
        "doctor",
        "--memory-gb",
        "12",
        "--mtp",
        "off",
        "--json"
      ],
      "exit_code": 0,
      "plan": {
        "prefill_chunk": 512,
        "pool_slots": 1491,
        "prefix_cache_max_tokens": 20616,
        "target_gb": 12,
        "availability_clamped": false,
        "mtp": false,
        "runtime_prefix_cache_enabled": true,
        "max_context_tokens": 32768
      }
    },
    {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
        "doctor",
        "--memory-gb",
        "12",
        "--mtp",
        "on",
        "--json"
      ],
      "exit_code": 0,
      "plan": {
        "prefill_chunk": 256,
        "pool_slots": 1091,
        "prefix_cache_max_tokens": 14829,
        "target_gb": 12,
        "availability_clamped": false,
        "mtp": true,
        "runtime_prefix_cache_enabled": true,
        "max_context_tokens": 32768
      }
    },
    {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
        "doctor",
        "--memory-gb",
        "16",
        "--mtp",
        "off",
        "--json"
      ],
      "exit_code": 0,
      "plan": {
        "prefill_chunk": 1024,
        "pool_slots": 2576,
        "prefix_cache_max_tokens": 32768,
        "target_gb": 16,
        "availability_clamped": false,
        "mtp": false,
        "runtime_prefix_cache_enabled": true,
        "max_context_tokens": 32768
      }
    },
    {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
        "doctor",
        "--memory-gb",
        "16",
        "--mtp",
        "on",
        "--json"
      ],
      "exit_code": 0,
      "plan": {
        "prefill_chunk": 1024,
        "pool_slots": 2032,
        "prefix_cache_max_tokens": 29296,
        "target_gb": 16,
        "availability_clamped": false,
        "mtp": true,
        "runtime_prefix_cache_enabled": true,
        "max_context_tokens": 32768
      }
    }
  ]
}

````````````
