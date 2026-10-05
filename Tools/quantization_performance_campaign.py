#!/usr/bin/env python3
"""Frozen, sequential complete-configuration performance comparisons.

All attempted cells survive. A timing exclusion invalidates the whole frozen
timing comparison; no replacement or favorable subset is selected. This owns
execution and evidence, not model qualification or application activation.
"""
import argparse
import ctypes
import ctypes.util
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import stat
import statistics
import subprocess
import sys
import time

from context_qualification import quiet_preflight
from prefill_bench import digest, terminate_child_tree, vm_snapshot
from quantization_inventory import relative_path, unique_json
from quantization_performance_metrics import metrics, median_lower_bound, median_upper_bound, number
from serve_bench import competing_jobs, verified_build
from thermal_readiness import observe

KIND = 'quantization-complete-performance-v1'
KIND_V2 = 'quantization-complete-performance-v2'
ELIGIBILITY = 'complete-normal-no-paging-no-competing-v1'
NORMAL = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
ARMS = ('original', 'candidate')
REVISION = 'aa7c790e804bbf9d491ddb109c3d61bc4a555f7c'
MANIFESTS = {'original': '8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082',
             'candidate': 'af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182'}
ROTARY = 'f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a'
# Percentage of one CPU core in ps's recent average. This is a prospective
# clean-timing exclusion, not a safety limit or proof that lesser activity is
# harmless. A different threshold requires a new protocol before collection.
COMPETING_CPU_PERCENT = 50


def read(path, sha=None, maximum=16_000_000):
    path = Path(path)
    with path.open('rb') as stream: raw = stream.read(maximum + 1)
    if not 0 < len(raw) <= maximum or sha is not None and hashlib.sha256(raw).hexdigest() != sha:
        raise ValueError('bounded evidence identity changed: ' + str(path))
    return unique_json(raw)


def write(path, value):
    path = Path(path); raw = json.dumps(value, allow_nan=False, sort_keys=True).encode()
    if len(raw) > 16_000_000: raise ValueError('campaign receipt exceeds its byte bound')
    temporary = path.with_suffix('.pending')
    with temporary.open('wb') as stream:
        stream.write(raw); stream.flush(); os.fsync(stream.fileno())
    temporary.replace(path)


def helper_pins():
    root = Path(__file__).resolve().parent
    return {name: digest(Path(module.__file__)) for name, module in list(sys.modules.items())
            if getattr(module, '__file__', None) and Path(module.__file__).resolve().parent == root
            and Path(module.__file__).suffix == '.py' and not Path(module.__file__).name.endswith('_test.py')
            and Path(module.__file__).resolve() != Path(__file__).resolve()}


def integer(value, minimum, maximum):
    return type(value) is int and minimum <= value <= maximum


def validate(protocol, root):
    root = Path(root).resolve()
    extended = protocol.get('kind') == KIND_V2
    keys = {'schema', 'kind', 'scope', 'driver_sha256', 'helper_sha256', 'files', 'paths', 'profiles',
            'repetitions', 'eligibility', 'sampling_basis', 'latency_max_ratio', 'resource'}
    if extended: keys.add('candidate_deployment')
    if (set(protocol) != keys or type(protocol['schema']) is not int or protocol['schema'] != (2 if extended else 1)
            or protocol['kind'] != (KIND_V2 if extended else KIND) or protocol['scope'] not in ('pilot', 'held-out')
            or protocol['driver_sha256'] != digest(__file__) or protocol['helper_sha256'] != helper_pins()
            or protocol['eligibility'] != ELIGIBILITY or not integer(protocol['repetitions'], 3, 64)
            or extended and protocol['candidate_deployment'] not in ('composite', 'standalone')):
        raise ValueError('unknown, unbounded or changed complete performance protocol')
    files, paths = protocol['files'], protocol['paths']
    if (type(files) is not dict or not 6 <= len(files) <= 256
            or set(paths) != {'binary', 'metallib', 'build_identity', 'source_archive', 'control', 'rotary', 'baseline'}):
        raise ValueError('exact producer and artifact paths required')
    total = 0
    for name, sha in files.items():
        relative_path(name); path = root / name; info = path.lstat(); total += info.st_size
        if (path.resolve() != path or not stat.S_ISREG(info.st_mode) or not 0 < info.st_size
                or total > 1_000_000_000 or type(sha) is not str or re.fullmatch('[a-f0-9]{64}', sha) is None):
            raise ValueError('frozen input path, type, digest or aggregate size changed')
    for name, sha in files.items():
        if digest(root / name) != sha: raise ValueError('frozen performance input changed: ' + name)
    for key in ('binary', 'metallib', 'build_identity', 'source_archive', 'rotary'):
        if paths[key] not in files: raise ValueError('required producer input is unpinned')
    binary = root / paths['binary']
    for key, name in [('metallib', 'mlx.metallib'), ('build_identity', 'build-identity.json'), ('source_archive', 'build-source.tar.gz')]:
        if root / paths[key] != binary.parent / name: raise ValueError('native build companions must be colocated')
    verified_build(binary)
    relative_path(paths['control'])
    standalone = extended and protocol['candidate_deployment'] == 'standalone'
    numerical_manifest = paths['control'] + ('/expert-control-manifest.json' if standalone else '/manifest.json')
    if (files.get(numerical_manifest) != MANIFESTS['candidate']
            or files[paths['rotary']] != ROTARY or not Path(paths['baseline']).expanduser().is_absolute()):
        raise ValueError('performance study requires the exact original and minmax artifacts')
    standalone_sha = None
    if standalone:
        manifest = paths['control'] + '/standalone-manifest.json'
        if manifest not in files or paths['rotary'] != paths['control'] + '/angles-f32le.bin':
            raise ValueError('standalone deployment must pin its complete manifest and owned rotary table')
        standalone_sha = files[manifest]
        complete = read(root / manifest, standalone_sha, maximum=4_000_000)
        if (type(complete.get('schema')) is not int or complete['schema'] != 1
                or complete.get('kind') != 'standalone-research-bundle-v1' or complete.get('complete') is not True
                or complete.get('qualification') is not False
                or complete.get('identity', {}).get('expert_control_manifest_sha256') != MANIFESTS['candidate']
                or complete.get('identity', {}).get('rotary_sha256') != ROTARY
                or complete.get('identity', {}).get('parent_revision') != REVISION):
            raise ValueError('standalone performance source changed its complete same-parent identity')
        # This only checks the frozen research inputs. Native execution still
        # requires the independently audited, compiled standalone admission.
    profiles = protocol['profiles']; natives = {}
    if type(profiles) is not list or not 1 <= len(profiles) <= 8: raise ValueError('bounded profiles required')
    for profile in profiles:
        if (type(profile) is not dict or set(profile) != {'id', 'arms', 'gate_cases'}
                or type(profile['id']) is not str or re.fullmatch('[a-z0-9][a-z0-9-]{0,63}', profile['id']) is None
                or profile['id'] in natives or set(profile['arms']) != set(ARMS)):
            raise ValueError('unique profile and paired arm identities required')
        pair = {}
        for arm in ARMS:
            path = profile['arms'][arm]
            if path not in files: raise ValueError('native performance protocol is unpinned')
            native = read(root / path, files[path], maximum=4_000_000)
            if (type(native.get('schema')) is not int or native['schema'] != protocol['schema']
                    or native['scope'] != protocol['scope']
                    or native['kind'] != ('same-model-engine-performance-v2' if extended else 'same-model-engine-performance-v1')
                    or native['artifact'] != ('original' if arm == 'original' else 'affine3')
                    or not integer(native['memory_bytes'], 8_100_000_000, 24_000_000_000)
                    or not integer(native['maximum_seconds'], 1, 7200)
                    or not integer(native['request_seconds'], 1, 1800)
                    or native['request_seconds'] > native['maximum_seconds']
                    or native['context_limit'] not in (8192, 32768)):
                raise ValueError('native performance configuration is outside the priced scope')
            if extended:
                expected_deployment = 'original' if arm == 'original' else protocol['candidate_deployment']
                if (native.get('deployment') != expected_deployment
                        or 'standalone_manifest_sha256' not in native
                        or native['standalone_manifest_sha256'] != (standalone_sha if arm == 'candidate' else None)
                        or type(native.get('short_prompt_tokens')) is not int or type(native.get('short_prompt_chunk')) is not int
                        or (native['short_prompt_tokens'], native['short_prompt_chunk']) not in ((0, 0), (1536, 512))):
                    raise ValueError('native deployment, complete manifest or short-prompt policy differs from V2')
            pair[arm] = native
        # Different pack internals may be optimized independently. Complete
        # work, context, physical ceiling and user control semantics may not.
        for key in ('schema', 'scope', 'memory_bytes', 'memory_mode', 'context_limit', 'prefix_cache',
                    'live_memory', 'maximum_seconds', 'request_seconds', 'seed', 'tokenizer_sha256', 'cases'):
            if pair['original'][key] != pair['candidate'][key]:
                raise ValueError('paired configurations changed the shared work or user envelope')
        if extended and any(pair['original'][key] != pair['candidate'][key] for key in ('short_prompt_tokens', 'short_prompt_chunk')):
            raise ValueError('paired configurations changed the shared Desktop prefill policy')
        cases = pair['original']['cases']; ids = [row['id'] for row in cases]
        gates = profile['gate_cases']
        if (not 1 <= len(cases) <= 16 or len(set(ids)) != len(ids) or type(gates) is not list or not gates
                or len(set(gates)) != len(gates) or not set(gates) <= set(ids)
                or any(row['work'] != 'fixed' for row in cases if row['id'] in gates)):
            raise ValueError('speed gates require complete predeclared fixed-work cases')
        natives[profile['id']] = pair
    comparisons = comparison_count(protocol, natives)
    if comparisons > 256 or 2 * len(profiles) * protocol['repetitions'] > 256:
        raise ValueError('scenario family or session count exceeds its bounded scope')
    basis = protocol['sampling_basis']
    if protocol['scope'] == 'pilot':
        if basis is not None or protocol['latency_max_ratio'] is not None:
            raise ValueError('pilot must not borrow a final sampling or latency verdict')
    else:
        limits = protocol['latency_max_ratio']
        # No default tolerance is inferred from the pilot. The prospective
        # owner chooses each margin explicitly; this instrument refuses more
        # than 25% median regression, even if a faster decode might hide it.
        if (type(limits) is not dict or set(limits) != {'request', 'first_text', 'load'}
                or any(not number(v) or not 1 <= v <= 1.25 for v in limits.values())
                or any(not any(case['work'] == 'natural' for case in pair['original']['cases']) for pair in natives.values())):
            raise ValueError('final performance needs natural answers and explicit bounded latency margins')
        if (type(basis) is not dict or set(basis) != {'analysis', 'rationale'} or basis['analysis'] not in files
                or type(basis['rationale']) is not str or not 20 <= len(basis['rationale']) <= 4000):
            raise ValueError('freeze the pilot-based sampling rationale before final observations')
        pilot = read(root / basis['analysis'], files[basis['analysis']])
        if (pilot.get('kind') != protocol['kind'] or pilot.get('scope') != 'pilot' or pilot.get('complete') is not True
                or pilot.get('all_timings_eligible') is not True or pilot.get('qualification') is not False
                or pilot.get('natural_completion_complete') is not True
                or extended and (pilot.get('schema') != 2 or pilot.get('candidate_deployment') != protocol['candidate_deployment'])
                or median_lower_bound([1] * protocol['repetitions'], comparisons=comparisons)['lower_bound'] is None):
            raise ValueError('final sampling needs a complete eligible pilot and enough independent runs')
    resource = protocol['resource']
    bounds = {'maximum_parent_bytes': (1, 256_000_000), 'maximum_campaign_seconds': (1, 172800),
              'maximum_output_bytes': (1, 1_000_000_000), 'maximum_research_staging_bytes': (1, 430_000_000_000)}
    if (set(resource) != set(bounds) | {'headroom_bytes', 'new_weight_bytes', 'new_raw_logit_bytes', 'paid_compute_usd'}
            or any(not integer(resource[k], *limits) for k, limits in bounds.items())
            or type(resource['headroom_bytes']) is not int or resource['headroom_bytes'] != 3_000_000_000
            or any(type(resource[k]) is not int or resource[k] != 0
                   for k in ('new_weight_bytes', 'new_raw_logit_bytes', 'paid_compute_usd'))):
        raise ValueError('unpriced performance campaign resources')
    return natives


def comparison_count(protocol, natives):
    # One startup comparison per profile, two latency comparisons per natural
    # task, plus each declared decode scenario. Freeze the whole family.
    return sum(len(p['gate_cases']) + 1 + 2 * sum(c['work'] == 'natural' for c in natives[p['id']]['original']['cases'])
               for p in protocol['profiles'])


def cells(protocol):
    # Adjacent AB/BA pairs, with profile order reversed on alternate rounds.
    # One fresh process per arm; filesystem cache is explicitly uncontrolled.
    result = []
    for repetition in range(protocol['repetitions']):
        profiles = protocol['profiles'][::1 if repetition % 2 == 0 else -1]
        for profile in profiles:
            for arm in ARMS[::1 if repetition % 2 == 0 else -1]:
                result.append({'index': len(result), 'repetition': repetition, 'profile': profile['id'], 'arm': arm})
    return result


def validate_plan(plan, native, resource_identity):
    if (plan.get('resource_profile') != resource_identity
            or plan.get('source') != ('auto' if native['memory_mode'] == 'ceiling' else '--memory-gb')
            or not number(plan.get('target_gb')) or plan['target_gb'] * 1e9 > native['memory_bytes'] + 1
            or plan.get('max_context_tokens') != native['context_limit'] or plan.get('vision') is not False
            or plan.get('runtime_prefix_cache_enabled') is not native['prefix_cache']
            or not integer(plan.get('memory_ledger', {}).get('expected_peak_bytes'), 1, native['memory_bytes'])
            or native['memory_mode'] == 'ceiling' and plan.get('memory_limit_gb') != native['memory_bytes'] / 1e9
            or native['memory_mode'] == 'target' and plan['target_gb'] != native['memory_bytes'] / 1e9):
        raise ValueError('applied native plan differs from its complete user envelope')
    if (native['draft_mode'] in ('on', 'off') and plan.get('mtp') is not (native['draft_mode'] == 'on')
            or native['lookahead'] in ('off', 'uncorrected') and plan.get('decode_lookahead') is not (native['lookahead'] == 'uncorrected')
            or plan.get('mtp') is True and native['draft_placement'] in ('streamed', 'resident')
                and plan.get('mtp_streamed_experts') is not (native['draft_placement'] == 'streamed')):
        raise ValueError('applied native features differ from explicit performance overrides')


def validate_native(receipt, native, protocol_sha, arm):
    extended = native['kind'] == 'same-model-engine-performance-v2'
    physical_manifest = native['standalone_manifest_sha256'] if extended and native['deployment'] == 'standalone' else MANIFESTS[arm]
    resource = ('original-affine4-memory-v1' if arm == 'original' else
                'affine3-grouped-lookahead-memory-v1' if native['lookahead'] == 'uncorrected' else 'affine3-grouped-memory-v1')
    if (type(receipt.get('schema')) is not int or receipt['schema'] != (2 if extended else 1)
            or receipt.get('complete') is not True or receipt.get('loaded') is not True
            or receipt.get('plan_only') is not False or receipt.get('qualification') is not False or 'failure' in receipt
            or receipt.get('protocol_sha256') != protocol_sha or receipt.get('scope') != native['scope']
            or receipt.get('artifact') != native['artifact'] or receipt.get('baseline_revision') != REVISION
            or receipt.get('resource_identity') != resource or receipt.get('artifact_manifest_sha256') != physical_manifest
            or receipt.get('memory_ceiling_bytes') != native['memory_bytes']
            or receipt.get('required_preflight_bytes') != native['memory_bytes'] + 3_000_000_000
            or not integer(receipt.get('preflight', {}).get('reclaimableBytes'), native['memory_bytes'] + 3_000_000_000, 2**64-1)
            or not integer(receipt.get('peak_process_bytes'), 1, native['memory_bytes'])
            or not number(receipt.get('load_seconds')) or not number(receipt.get('seconds'))
            or receipt['seconds'] > native['maximum_seconds'] or receipt['load_seconds'] > receipt['seconds']
            or receipt.get('original_correction_sha256') != native['original_correction_sha256']):
        raise ValueError('native performance receipt has incomplete execution, identity or resources')
    if extended and (any(key not in receipt or receipt[key] != native[key]
                         for key in ('deployment', 'standalone_manifest_sha256', 'short_prompt_tokens', 'short_prompt_chunk'))
            or any(type(receipt.get(key)) is not int for key in ('short_prompt_tokens', 'short_prompt_chunk'))
            or receipt.get('numerical_manifest_sha256') != MANIFESTS[arm]):
        raise ValueError('native V2 deployment, numerical identity or prefill policy differs from the protocol')
    validate_plan(receipt['plan'], native, resource)
    rows = receipt['cases']
    if type(rows) is not list or [row['id'] for row in rows] != [row['id'] for row in native['cases']]:
        raise ValueError('native performance receipt changed complete case coverage or order')
    result = {}
    for row, case in zip(rows, native['cases']):
        stats = row['stats']
        if (any(row[k] != case[k] for k in ('id', 'work', 'prefix', 'prompt_tokens'))
                or not integer(stats.get('reusedPrefixTokens'), case['minimum_reused_tokens'], len(case['prompt_tokens']))
                or stats.get('promptTokens') != len(case['prompt_tokens'])
                or row['request_wall_seconds'] > native['request_seconds']
                or not integer(len(row['output_tokens']), 1, case['output_tokens'])
                or stats.get('finishReason') == 'length' and len(row['output_tokens']) != case['output_tokens']
                or case['work'] == 'fixed' and (len(row['output_tokens']) != case['output_tokens'] or stats.get('finishReason') != 'length')
                or case['work'] == 'natural' and row.get('natural_task_completed') is not (stats.get('finishReason') == 'stop')):
            raise ValueError('performance work, completion or cache reuse changed')
        footprint = stats.get('sampledFootprint', {})
        if (not integer(footprint.get('samples'), 1, 1_000_000)
                or any(not integer(value, 1, native['memory_bytes']) for value in
                       (footprint.get('peakBytes'), stats.get('lifetimePhysicalFootprintPeakBytes')))
                or not number(stats.get('peakMemoryGB')) or stats['peakMemoryGB'] * 1e9 > native['memory_bytes'] + 1):
            raise ValueError('request lacks bounded positive physical memory evidence')
        validate_plan(row['plan_before'], native, resource); validate_plan(row['plan_after'], native, resource)
        if extended:
            maximum = row['plan_before'].get('prefill_chunk')
            if not integer(maximum, 256, 4096): raise ValueError('request has no bounded starting prefill plan')
            applied = min(512, maximum) if native['short_prompt_tokens'] == 1536 and len(case['prompt_tokens']) < 1536 else maximum
            if type(stats.get('prefillChunkLimit')) is not int or stats['prefillChunkLimit'] != applied:
                raise ValueError('request prefill differs from its frozen policy and observed starting plan')
        result[row['id']] = metrics(row)
    return result


def paging(before, after):
    for key in ('swapins', 'swapouts'):
        if not integer(before.get(key), 0, 2**64-1) or not integer(after.get(key), before[key], 2**64-1):
            raise ValueError('paging observation is missing or moved backwards')
    return any(before[key] != after[key] for key in ('swapins', 'swapouts'))


def exclusions(receipt, observation):
    reasons = []
    if observation['timing_exclusions']: reasons.extend(observation['timing_exclusions'])
    if paging(observation['before'], observation['after']): reasons.append('whole-process global paging changed')
    if receipt['load_conditions'] != NORMAL: reasons.append('startup thermal or power condition')
    for row in receipt['cases']:
        stats = row['stats']; label = row['id']
        if (not row['operating_conditions'] or any(value != NORMAL for value in row['operating_conditions'])
                or any(stats.get(k) != NORMAL for k in ('generatorSystemBefore', 'generatorSystemAfter'))):
            reasons.append(label + ': thermal or power condition')
        if paging(row['vm_before'], row['vm_after']) or paging(stats['generatorVMBefore'], stats['generatorVMAfter']):
            reasons.append(label + ': global paging changed')
        # A live resize is useful functional evidence, but no longer samples
        # the declared stationary allocation. Preserve it and exclude timing.
        allocation = ('pool_slots', 'prefill_chunk', 'prefix_cache_max_tokens', 'target_gb', 'mtp', 'mtp_streamed_experts', 'decode_lookahead')
        if any(plan.get(k) != receipt['plan'].get(k) for plan in (row['plan_before'], row['plan_after']) for k in allocation):
            reasons.append(label + ': allocation changed from the initial plan')
    return sorted(set(reasons))


def allocated(directory):
    return int(subprocess.check_output(['du', '-sk', str(directory)], text=True, timeout=30).split()[0]) * 1024


def physical_bytes(pid):
    lib = ctypes.CDLL(ctypes.util.find_library('proc')); data = ctypes.create_string_buffer(296)
    if lib.proc_pid_rusage(pid, 4, data) != 0: raise RuntimeError('physical memory observation unavailable')
    result = max(int.from_bytes(data.raw[72:80], 'little'), int.from_bytes(data.raw[240:248], 'little'))
    if result <= 0: raise RuntimeError('physical memory observation is empty')
    return result


def contention(excluded_pids):
    # ps reports a recent CPU average, not instantaneous isolation. Persist
    # numeric PID/CPU only, never command lines, URLs or credential arguments.
    raw = subprocess.check_output(['ps', '-axo', 'pid=,pcpu='], text=True, timeout=5)
    busy = []
    for line in raw.splitlines():
        fields = line.split()
        if len(fields) != 2: raise ValueError('unreadable CPU contention observation')
        pid, cpu = int(fields[0]), float(fields[1])
        if pid <= 0 or not number(cpu, zero=True): raise ValueError('invalid CPU contention observation')
        if pid not in excluded_pids and cpu >= COMPETING_CPU_PERCENT: busy.append({'pid': pid, 'cpu_percent': cpu})
    jobs = [{'pid': job['pid'], 'kind': job['kind']} for job in competing_jobs() if job['pid'] not in excluded_pids]
    return {'busy_processes': busy, 'known_jobs': jobs}


def resource_check(root, output, protocol, started):
    resource = protocol['resource']
    if time.monotonic() - started > resource['maximum_campaign_seconds']: raise TimeoutError('performance campaign deadline')
    if physical_bytes(os.getpid()) > resource['maximum_parent_bytes']: raise MemoryError('performance parent physical ceiling')
    if (allocated(output) > resource['maximum_output_bytes'] or allocated(root) > resource['maximum_research_staging_bytes']
            or shutil.disk_usage(output).free < 3_000_000_000):
        raise RuntimeError('performance receipt, staging or disk-headroom reservation exhausted')


def run_cell(command, destination, native, protocol, root, output, campaign_started):
    destination.mkdir(exist_ok=False)
    row = {'complete': False, 'timing_exclusions': [], 'samples': 0, 'peak_model_bytes': 0,
           'observer_scope': 'Sampled process CPU averages and known jobs; not continuous host isolation.'}
    child = None; started = time.monotonic()
    environment = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VQ_', 'VQLAB_'))}
    row['removed_override_names'] = sorted(set(os.environ) - set(environment))
    def save():
        row['seconds'] = time.monotonic() - started; write(destination / 'supervision.json', row)
    try:
        save(); resource_check(root, output, protocol, campaign_started)
        row['before'] = quiet_preflight(native['memory_bytes'] / 1e9 + 3)
        row['conditions_before'] = observe(); row['contention_before'] = contention({os.getpid()})
        busy = row['contention_before']
        if (not row['conditions_before']['ready'] or busy['known_jobs']
                or busy['busy_processes'] and protocol.get('scope') != 'pilot'):
            raise RuntimeError('timing preflight is not eligible; native process not launched')
        if busy['busy_processes']:
            # A pilot can still expose functional failures under ordinary host
            # activity. Keep the timing excluded even if that activity later
            # stops. Analysis cannot turn these observations into a clean
            # comparison or qualification, and known heavy jobs still refuse.
            row['timing_exclusions'].append('pre-process competing CPU')
        row['command'] = command; save()
        with (destination / 'stdout.txt').open('xb') as stdout, (destination / 'stderr.txt').open('xb') as stderr:
            child = subprocess.Popen(command, stdin=subprocess.DEVNULL, stdout=stdout, stderr=stderr,
                                     env=environment, start_new_session=True)
            row['pid'] = child.pid; save(); next_slow = next_disk = next_save = 0.0
            while child.poll() is None:
                now = time.monotonic()
                if now - started > native['maximum_seconds'] + 30: raise TimeoutError('native performance process deadline')
                if now - campaign_started > protocol['resource']['maximum_campaign_seconds']: raise TimeoutError('performance campaign deadline')
                try: physical = physical_bytes(child.pid)
                except RuntimeError:
                    if child.poll() is not None: break
                    raise
                row['samples'] += 1; row['peak_model_bytes'] = max(row['peak_model_bytes'], physical)
                if physical > native['memory_bytes']: raise MemoryError('native performance physical ceiling')
                if now >= next_slow:
                    vm = vm_snapshot()
                    if vm['reclaimable_bytes'] < 3_000_000_000: raise MemoryError('performance real headroom below reserve')
                    if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True, timeout=5).strip() != '1':
                        raise MemoryError('performance OS memory pressure')
                    if not observe()['ready']: row['timing_exclusions'].append('sampled thermal or power condition')
                    busy = contention({os.getpid(), child.pid})
                    if any(busy.values()):
                        row['timing_exclusions'].append('sampled competing CPU or known build/storage job')
                        row.setdefault('first_contention', busy)
                    row['timing_exclusions'] = sorted(set(row['timing_exclusions']))
                    next_slow = now + 1
                if now >= next_disk:
                    resource_check(root, output, protocol, campaign_started); next_disk = now + 5
                if now >= next_save: save(); next_save = now + 30
                time.sleep(.25)
            row['exit_code'] = child.wait(timeout=5)
            if row['exit_code'] != 0 or not row['samples']: raise RuntimeError('native performance process did not complete')
        row['complete'] = True
    except BaseException as error:
        row['failure'] = type(error).__name__ + ': ' + str(error); raise
    finally:
        # Always drain before a subsequent arm, even when logging or final
        # observation fails. Preserve the trigger separately from cleanup.
        cleanup_error = None
        try:
            if child is not None and child.poll() is None: terminate_child_tree(child)
            if child is not None:
                row['exit_code'] = child.wait(timeout=5)
                settle = time.monotonic()
                while time.monotonic() - settle < 1.05: time.sleep(max(.001, 1.05 - (time.monotonic() - settle)))
                row['release_settle_seconds'] = time.monotonic() - settle
            row['after'] = vm_snapshot(); row['conditions_after'] = observe()
            row['contention_after'] = contention({os.getpid()})
            if not row['conditions_after']['ready'] or any(row['contention_after'].values()):
                row['timing_exclusions'].append('post-process thermal, power or contention condition')
        except BaseException as error:
            cleanup_error = error; row['cleanup_failure'] = type(error).__name__ + ': ' + str(error); row['complete'] = False
        save()
        if cleanup_error is not None: raise cleanup_error
    return row


def run(protocol_path, protocol_sha, root, output):
    root, output = Path(root).resolve(), Path(output).resolve()
    protocol = read(protocol_path, protocol_sha, maximum=4_000_000); natives = validate(protocol, root)
    if output.parent != root: raise ValueError('performance output must be a new direct child of the research root')
    output.mkdir(exist_ok=False); started = time.monotonic()
    record = {'schema': protocol['schema'], 'kind': protocol['kind'], 'scope': protocol['scope'], 'complete': False, 'qualification': False,
              'protocol_sha256': protocol_sha, 'driver_sha256': protocol['driver_sha256'], 'cells': [],
              'filesystem_cache': 'Uncontrolled OS file cache; fresh process means empty application caches only.'}
    if protocol['schema'] == 2: record['candidate_deployment'] = protocol['candidate_deployment']
    def save():
        record['seconds'] = time.monotonic() - started; write(output / 'coordinator.json', record)
    previous_handlers = {}
    def interrupt(signum, _frame): raise KeyboardInterrupt('performance campaign interrupted: ' + str(signum))
    try:
        for signum in (signal.SIGINT, signal.SIGTERM):
            previous_handlers[signum] = signal.signal(signum, interrupt)
        with (output / 'campaign.lock').open('a') as lock:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
            save(); resource_check(root, output, protocol, started)
            if allocated(root) + protocol['resource']['maximum_output_bytes'] > protocol['resource']['maximum_research_staging_bytes']:
                raise RuntimeError('complete performance receipt reservation does not fit staging')
            for cell in cells(protocol):
                profile = next(p for p in protocol['profiles'] if p['id'] == cell['profile'])
                native = natives[cell['profile']][cell['arm']]; path = profile['arms'][cell['arm']]
                destination = output / f"cell-{cell['index']:04d}"; native_output = destination / 'native'
                command = [str(root / protocol['paths']['binary']), 'quantization-performance-run',
                           '--baseline', str(Path(protocol['paths']['baseline']).expanduser()),
                           '--protocol-file', str(root / path), '--protocol-sha256', protocol['files'][path],
                           '--output', str(native_output)]
                if cell['arm'] == 'candidate':
                    command += ['--control', str(root / protocol['paths']['control'])]
                    if native.get('deployment') != 'standalone': command += ['--table', str(root / protocol['paths']['rotary'])]
                record['active_cell'] = cell; save(); validate(protocol, root)
                observation = run_cell(command, destination, native, protocol, root, output, started)
                receipt = read(native_output / 'receipt.json'); validate_native(receipt, native, protocol['files'][path], cell['arm'])
                excluded = exclusions(receipt, observation)
                row = {**cell, 'receipt_sha256': digest(native_output / 'receipt.json'),
                       'supervision_sha256': digest(destination / 'supervision.json'), 'timing_exclusions': excluded}
                record['cells'].append(row); save()
                print(json.dumps({'completed_cells': len(record['cells']), 'of': len(cells(protocol)), 'timing_eligible': not excluded}), flush=True)
            validate(protocol, root); resource_check(root, output, protocol, started)
            record.pop('active_cell', None); record['complete'] = True; save()
    except BaseException as error:
        record['failure'] = type(error).__name__ + ': ' + str(error); save(); raise
    finally:
        for signum, handler in previous_handlers.items(): signal.signal(signum, handler)
    return record


def analyze(protocol_path, protocol_sha, root, output):
    root, output = Path(root).resolve(), Path(output).resolve()
    protocol = read(protocol_path, protocol_sha, maximum=4_000_000); natives = validate(protocol, root)
    coordinator = read(output / 'coordinator.json'); expected = cells(protocol)
    if (coordinator.get('complete') is not True or coordinator.get('protocol_sha256') != protocol_sha
            or coordinator.get('schema') != protocol['schema'] or coordinator.get('kind') != protocol['kind']
            or protocol['schema'] == 2 and coordinator.get('candidate_deployment') != protocol['candidate_deployment']
            or coordinator.get('driver_sha256') != protocol['driver_sha256'] or 'failure' in coordinator
            or not number(coordinator.get('seconds')) or coordinator['seconds'] > protocol['resource']['maximum_campaign_seconds']
            or len(coordinator['cells']) != len(expected)):
        raise ValueError('complete frozen performance execution required before analysis')
    measurements = {}; excluded = []; startup = {}; incomplete_answers = []
    for expected_cell, row in zip(expected, coordinator['cells']):
        if any(row[key] != value for key, value in expected_cell.items()): raise ValueError('performance execution order or coverage changed')
        destination = output / f"cell-{row['index']:04d}"
        receipt = read(destination / 'native/receipt.json', row['receipt_sha256'])
        observation = read(destination / 'supervision.json', row['supervision_sha256'])
        if (observation.get('complete') is not True or observation.get('exit_code') != 0
                or 'failure' in observation or 'cleanup_failure' in observation or not integer(observation.get('samples'), 1, 1_000_000)):
            raise ValueError('performance process cleanup or physical supervision did not complete')
        native = natives[row['profile']][row['arm']]
        if not integer(observation.get('peak_model_bytes'), 1, native['memory_bytes']): raise ValueError('supervisor physical ceiling changed')
        profile = next(p for p in protocol['profiles'] if p['id'] == row['profile'])
        measured = validate_native(receipt, native, protocol['files'][profile['arms'][row['arm']]], row['arm'])
        for answer in receipt['cases']:
            if answer['work'] == 'natural' and (answer.get('natural_task_completed') is not True
                    or not number(measured[answer['id']]['first_text_seconds'])):
                incomplete_answers.append({**expected_cell, 'case': answer['id']})
        reasons = exclusions(receipt, observation)
        if reasons != row['timing_exclusions']: raise ValueError('stored timing eligibility differs from raw observations')
        if reasons: excluded.append({**expected_cell, 'reasons': reasons})
        startup.setdefault(row['profile'], {arm: [] for arm in ARMS})[row['arm']].append(receipt['load_seconds'])
        for case_id, value in measured.items():
            key = row['profile'] + '/' + case_id
            measurements.setdefault(key, {arm: [] for arm in ARMS})[row['arm']].append(value)
    result = {'schema': protocol['schema'], 'kind': protocol['kind'], 'scope': protocol['scope'], 'complete': True, 'qualification': False,
              'protocol_sha256': protocol_sha, 'all_timings_eligible': not excluded, 'excluded_cells': excluded,
              'comparison_count': comparison_count(protocol, natives),
              'natural_completion_complete': not incomplete_answers, 'incomplete_natural_answers': incomplete_answers,
              'speed_gate_passed': False, 'latency_gate_passed': False, 'performance_gate_passed': False,
              'scope_limit': 'Frozen local configurations only; no other-Mac speed, task quality or model-promotion verdict.'}
    if protocol['schema'] == 2: result['candidate_deployment'] = protocol['candidate_deployment']
    # Keep exclusions and individual raw receipts; do not manufacture a clean
    # median or final verdict from a selected subset of successful timings.
    if excluded or incomplete_answers: return result
    result['scenarios'] = {}
    for key, values in measurements.items():
        summaries = {}
        for arm in ARMS:
            summaries[arm] = {metric: statistics.median(row[metric] for row in values[arm])
                              if all(number(row[metric], zero=True) for row in values[arm]) else None
                              for metric in values[arm][0] if type(values[arm][0][metric]) in (int, float) or values[arm][0][metric] is None}
        ratios = [b['conservative_generation_tps'] / a['conservative_generation_tps']
                  for a, b in zip(values['original'], values['candidate'])
                  if a['conservative_generation_tps'] is not None and b['conservative_generation_tps'] is not None]
        result['scenarios'][key] = {'medians': summaries, 'runs': values,
            'worst_observed_stall_seconds': {arm: max((r['inter_token_max_seconds'] or 0) for r in values[arm]) for arm in ARMS},
            'paired_throughput_ratios': ratios, 'median_paired_throughput_ratio': statistics.median(ratios) if ratios else None}
    gates = {p['id'] + '/' + name: [r['conservative_generation_tps'] for r in measurements[p['id'] + '/' + name]['candidate']]
             for p in protocol['profiles'] for name in p['gate_cases']}
    comparisons = result['comparison_count']
    result['candidate_speed'] = {name: median_lower_bound(values, comparisons=comparisons) for name, values in gates.items()}
    result['speed_gate_passed'] = protocol['scope'] == 'held-out' and all(
        bound['lower_bound'] is not None and bound['lower_bound'] >= 20 for bound in result['candidate_speed'].values())
    result['load_seconds_by_profile'] = {name: {arm: {'runs': values, 'median': statistics.median(values)}
        for arm, values in arms.items()} for name, arms in startup.items()}
    latency = {}
    for profile in protocol['profiles']:
        name = profile['id']; loads = startup[name]
        latency[name + '/load'] = ('load', [b / a for a, b in zip(loads['original'], loads['candidate'])])
        for case in natives[name]['original']['cases']:
            if case['work'] != 'natural': continue
            values = measurements[name + '/' + case['id']]
            for label, metric in [('request', 'request_seconds'), ('first_text', 'first_text_seconds')]:
                ratios = [b[metric] / a[metric] for a, b in zip(values['original'], values['candidate'])]
                latency[name + '/' + case['id'] + '/' + label] = (label, ratios)
    result['paired_latency'] = {name: {'metric': label, 'ratios': ratios,
        **median_upper_bound(ratios, comparisons=comparisons)} for name, (label, ratios) in latency.items()}
    limits = protocol['latency_max_ratio']; result['latency_max_ratio'] = limits
    result['latency_gate_passed'] = protocol['scope'] == 'held-out' and all(
        bound['upper_bound'] is not None and bound['upper_bound'] <= limits[bound['metric']]
        for bound in result['paired_latency'].values())
    result['performance_gate_passed'] = result['speed_gate_passed'] and result['latency_gate_passed']
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('protocol', 'root', 'output'): parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--protocol-sha256', required=True)
    parser.add_argument('--analyze', action='store_true')
    args = parser.parse_args()
    value = (analyze if args.analyze else run)(args.protocol, args.protocol_sha256, args.root, args.output)
    if args.analyze:
        target = args.output / 'analysis.json'
        if target.exists(): raise FileExistsError('analysis already exists; preserve it')
        write(target, value)
    print(json.dumps(value if args.analyze else {key: value[key] for key in ('complete', 'seconds', 'qualification')}, allow_nan=False))


if __name__ == '__main__': main()
