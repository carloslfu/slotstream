---
type: run
created: 2026-10-04T15:14:22.102131+00:00
updated: 2026-10-04T15:14:22.102131+00:00
summary: Outcome watchdog cleanup ownership correction
binary: Exact pinned interpreters, source files and frozen native build identities below
captured_at: 2026-10-04
command: Capture failed CI 37209525799; run a barrier-controlled old-runner negative control and ten corrected local unit groups on both Python runtimes.
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Outcome watchdog cleanup ownership correction
tool: CI failure capture and isolated child-process cleanup regression checks
---

The earlier full local static suites passed, but main CI later exposed a PermissionError while the monitor and caller could independently signal and reap the same child process group. The exact failing log and leaked-stream warnings are preserved. An isolated negative control using the frozen runner reproduces two cleanup owners without issuing their competing signals; its tiny child is then drained once. The corrected runner serializes the complete termination attempt, retains and propagates any cleanup error, closes every pipe/log independently, and saves the incomplete job receipt even if cleanup raises. Deadline and pressure fixtures trigger after readiness, independent of interpreter startup speed. Ten test groups pass on both local Python runtimes with ResourceWarning promoted to an error. No model is loaded by these tests. The already launched final campaign and its frozen helpers are unchanged; no task, answer, grade, margin or completed job is replaced. Full CI acceptance of the correction remains pending. Any execution failure in the frozen campaign still prevents final qualification.

Local home prefixes are normalized to <HOME>. Original and normalized byte lengths and SHA-256 digests identify every file. Large, whitespace-bearing or Markdown-sensitive text is losslessly zlib-compressed and base64 encoded, with roundtrip verification. Binary weights, raw logits and executable archives remain in bounded local staging; their complete identities are recorded below.

### .build/quantization-research/capture-outcome-cleanup-v1.py

Original bytes: 4150. SHA-256: `f1f202b40fc6040ffff1e9b8c8f940ef0116edede5fe9ed4041b992617e26811`.

Normalized bytes: 4150. SHA-256: `f1f202b40fc6040ffff1e9b8c8f940ef0116edede5fe9ed4041b992617e26811`.

````zlib-base64
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
````

### Tools/quantization_outcome_campaign.py

Original bytes: 27195. SHA-256: `a997418bfc2124ea4a8e4196421d47a560a852a62787dad67d3c9880f85100dc`.

Normalized bytes: 27195. SHA-256: `a997418bfc2124ea4a8e4196421d47a560a852a62787dad67d3c9880f85100dc`.

````text
#!/usr/bin/env python3
"""Run one immutable paired outcome job, preserving every answer and refusal.

The protocol owns sampling, budgets, identities and statistical decisions. This
runner never selects favorable outcomes, retries a launched job or promotes a
pack. Jobs are serial under a campaign lock; their model processes are serial
under the existing native model lock. Incomplete jobs remain inspectable and
prevent final analysis. No real external tool actions are available.
"""
import argparse
import ctypes
import ctypes.util
import fcntl
import hashlib
import json
import os
from pathlib import Path
import selectors
import shutil
import subprocess
import sys
import threading
import time

from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree, vm_snapshot
import quantization_bfcl as bfcl
import quantization_outcomes as outcomes
from quantization_paired import stratified_mover_summary

FAMILIES = ('facts', 'multilingual', 'coding', 'instruction', 'tools')
MAX_EVENT = 2 << 20


def digest(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as stream:
        while chunk := stream.read(1 << 20):
            h.update(chunk)
    return h.hexdigest()


def read(path):
    from quantization_inventory import unique_json
    return unique_json(Path(path).read_bytes())


def write(path, value):
    path = Path(path)
    temporary = path.with_suffix(path.suffix + '.tmp')
    with temporary.open('w') as stream:
        json.dump(value, stream, ensure_ascii=False, allow_nan=False, indent=2)
        stream.write('\n'); stream.flush(); os.fsync(stream.fileno())
    temporary.replace(path)


def allocated(directory):
    return sum(p.stat().st_blocks * 512 for p in Path(directory).rglob('*') if p.is_file())


def validate_selection(tasks, protocol):
    if (not tasks or not set(tasks).issubset(FAMILIES)
            or protocol['scope'] == 'held-out' and set(tasks) != set(FAMILIES)):
        raise ValueError('frozen outcome families required')
    expected = protocol['task_ids']
    if set(expected) != set(tasks) or set(protocol['pilot_exclusions']) != set(tasks):
        raise ValueError('incomplete sampling or pilot exclusions')
    for family, cases in tasks.items():
        ids = [case['id'] for case in cases]
        if not ids or len(ids) != len(set(ids)) or ids != expected[family]:
            raise ValueError('task order or identity differs from the frozen selection')
        if set(ids) & set(protocol['pilot_exclusions'][family]):
            raise ValueError('pilot contamination')
        if len(ids) != protocol['sample_counts'][family]:
            raise ValueError('sample count changed')
    observed = {family: [] for family in tasks}
    for number, job in enumerate(protocol['jobs']):
        if job['index'] != number or job['family'] not in tasks:
            raise ValueError('invalid frozen job sequence')
        if job['arms'] != (['original', 'candidate'] if number % 2 == 0 else ['candidate', 'original']):
            raise ValueError('paired arm order changed')
        observed[job['family']].extend(job['ids'])
    if observed != expected:
        raise ValueError('jobs must cover every frozen task exactly once')


def validate_native(identity, native, pins, arm, protocol_sha):
    if identity.get('loaded') is not True or identity.get('protocol_sha256') != protocol_sha:
        raise ValueError('unloaded or wrong native protocol')
    for key in ('draft_depth', 'prefix_cache', 'output_limit', 'maximum_requests', 'maximum_seconds', 'scope', 'seed'):
        if identity.get(key) != native[key]:
            raise ValueError('native setting differs: ' + key)
    if identity.get('protocol_kind') != native['kind']:
        raise ValueError('native reply-reservation protocol changed')
    for key, expected in pins[arm].items():
        if identity.get(key) != expected:
            raise ValueError('native artifact differs: ' + key)
    plan = identity['plan']
    if plan['target_gb'] * 1e9 != native['memory_bytes'] or plan['max_context_tokens'] != native['context_limit']:
        raise ValueError('native admission plan differs')
    if plan.get('availability_clamped') or plan.get('vision') or plan.get('decode_lookahead'):
        raise ValueError('unexpected native feature or availability change')
    if not plan.get('mtp') or not plan.get('mtp_streamed_experts') or not plan.get('runtime_prefix_cache_enabled'):
        raise ValueError('required complete configuration absent')


def verify_response(event, request_id, messages, tools, native):
    if event.get('id') != request_id:
        raise ValueError('response belongs to a different request')
    request = event.get('request', {})
    if request.get('messages') != messages or request.get('tools', []) != (tools or []):
        raise ValueError('native request content changed')
    if any(request.get(key) != expected for key, expected in {
            'max_tokens':native['output_limit'], 'seed':native['seed'], 'stream':False,
            'temperature':0, 'think':False}.items()):
        raise ValueError('native generation settings changed')
    if event.get('event') == 'admission_refusal':
        prompt = event.get('prompt_tokens')
        if (event.get('code') != 'reply_reservation_exceeded' or type(prompt) is not int
                or prompt <= native['context_limit'] - native['output_limit']
                or event.get('context_limit') != native['context_limit']
                or event.get('output_limit') != native['output_limit'] or 'response' in event):
            raise ValueError('unverified task admission refusal')
        raise outcomes.TaskBudgetExceeded('complete reply cannot fit the frozen context')
    if event.get('event') != 'response' or not event.get('http_head', '').startswith('HTTP/1.1 200 OK\r\n'):
        raise RuntimeError('native HTTP request failed')
    response = event['response']; usage = response['usage']
    prompt, completion = usage['prompt_tokens'], usage['completion_tokens']
    if (type(prompt) is not int or type(completion) is not int or prompt < 0
            or not 0 <= completion <= native['output_limit']
            or event.get('reserved_prompt_tokens') != prompt
            or prompt + native['output_limit'] > native['context_limit']
            or usage['total_tokens'] != prompt + completion):
        raise ValueError('native token accounting differs from reservation')
    return response


class Session:
    def __init__(self, command, output, native, protocol, arm, row, *, campaign_deadline=None, output_root=None):
        self.row, self.native, self.protocol, self.arm = row, native, protocol, arm
        self.started = time.monotonic(); self.error = None
        self.stop = threading.Event(); self.buffer = bytearray()
        self.termination_lock = threading.Lock()
        self.termination_attempted = False; self.termination_error = None
        self.count = self.resets = self.refusals = 0
        self.child = self.thread = self.selector = self.stderr = self.stdout = None
        self.output = Path(output)
        self.campaign_deadline = campaign_deadline
        self.output_root = Path(output_root) if output_root is not None else self.output.parent
        row['before'] = quiet_preflight(protocol['resource']['preflight_gb'])
        row['command'] = command
        environment = {k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VQ_', 'VQLAB_'))}
        try:
            self.stderr = self.output.with_suffix('.stderr').open('xb')
            self.stdout = self.output.with_suffix('.stdout').open('xb')
            self.child = subprocess.Popen(command, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                stderr=self.stderr, start_new_session=True, env=environment)
            row['pid'] = self.child.pid
            os.set_blocking(self.child.stdout.fileno(), False)
            self.selector = selectors.DefaultSelector()
            self.selector.register(self.child.stdout, selectors.EVENT_READ)
            self.thread = threading.Thread(target=self.monitor, daemon=True); self.thread.start()
            row['identity'] = self.receive({'ready'})['identity']
            validate_native(row['identity'], native, protocol['native_pins'], arm, protocol['native_protocol_sha256'])
        except BaseException as error:
            self.row['startup_failure'] = type(error).__name__ + ': ' + str(error)
            self.close(); raise

    def monitor(self):
        try:
            lib = ctypes.CDLL(ctypes.util.find_library('proc'))
            last_disk_check = 0
            while not self.stop.wait(.25) and self.child.poll() is None:
                if time.monotonic() - self.started > self.native['maximum_seconds']:
                    raise TimeoutError('native session deadline')
                if self.campaign_deadline is not None and time.monotonic() > self.campaign_deadline:
                    raise TimeoutError('prospective campaign deadline')
                if time.monotonic() - last_disk_check >= 5:
                    last_disk_check = time.monotonic()
                    if allocated(self.output_root) > self.protocol['resource']['maximum_output_bytes']:
                        raise RuntimeError('campaign output reservation exhausted')
                    if shutil.disk_usage(self.output_root).free < 3_000_000_000:
                        raise RuntimeError('less than three GB actual disk headroom')
                for pid, label, maximum in [(self.child.pid, 'model', self.native['memory_bytes']),
                        (os.getpid(), 'parent', self.protocol['resource']['maximum_parent_bytes'])]:
                    buffer = ctypes.create_string_buffer(296)
                    if lib.proc_pid_rusage(pid, 4, buffer) == 0:
                        physical = max(int.from_bytes(buffer.raw[72:80], 'little'), int.from_bytes(buffer.raw[240:248], 'little'))
                        self.row['peak_' + label + '_bytes'] = max(self.row.get('peak_' + label + '_bytes', 0), physical)
                        if physical > maximum: raise MemoryError(label + ' physical ceiling')
                    elif label == 'parent' or self.child.poll() is None:
                        raise RuntimeError('missing physical observation for ' + label)
                if vm_snapshot()['reclaimable_bytes'] < self.protocol['resource']['headroom_bytes']:
                    raise MemoryError('real headroom below frozen reserve')
                if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True, timeout=5).strip() != '1':
                    raise MemoryError('OS memory pressure')
        except BaseException as error:
            self.error = error
            try: self.terminate()
            except BaseException:
                # The caller still observes the original watchdog failure;
                # close also reports the recorded failure to drain the child.
                pass

    def terminate(self):
        # The monitor publishes its failure before draining. A caller woken by
        # that failure can enter close immediately, so a poll check alone does
        # not serialize process-group signals or reaping. Exactly one owner
        # performs the entire termination, including on an error.
        with self.termination_lock:
            if self.termination_attempted:
                if self.termination_error is not None: raise self.termination_error
                return
            if self.child is None or self.child.poll() is not None: return
            self.termination_attempted = True
            try: terminate_child_tree(self.child)
            except BaseException as error:
                self.termination_error = error
                self.row['cleanup_failure'] = type(error).__name__ + ': ' + str(error)
                raise

    def receive(self, events):
        while True:
            if self.error: raise self.error
            if b'\n' in self.buffer:
                line, _, tail = self.buffer.partition(b'\n'); self.buffer[:] = tail
                value = json.loads(line)
                if not isinstance(value, dict) or value.get('event') not in events:
                    raise ValueError('unexpected native event')
                return value
            for key, _ in self.selector.select(.1):
                data = os.read(key.fd, 8192)
                if not data:
                    if self.error: raise self.error
                    raise RuntimeError('native session ended before expected event')
                self.stdout.write(data); self.stdout.flush(); self.buffer.extend(data)
                if len(self.buffer) > MAX_EVENT: raise ValueError('native event exceeds two MiB')

    def send(self, value):
        if self.error: raise self.error
        raw = json.dumps(value, ensure_ascii=False, allow_nan=False).encode() + b'\n'
        if len(raw) > MAX_EVENT: raise ValueError('request exceeds native journal bound')
        self.child.stdin.write(raw); self.child.stdin.flush()

    def chat(self, messages, tools=None):
        self.count += 1; request_id = 'call-' + str(self.count)
        body = {'messages': messages}
        if tools: body['tools'] = tools
        self.send({'op':'chat', 'id':request_id, 'body':body})
        event = self.receive({'response', 'admission_refusal'})
        try:
            return verify_response(event, request_id, messages, tools, self.native)
        except outcomes.TaskBudgetExceeded:
            self.refusals += 1; raise

    def reset(self):
        self.resets += 1; name = 'reset-' + str(self.resets)
        self.send({'op':'reset', 'id':name})
        if self.receive({'reset'}).get('id') != name: raise ValueError('reset identity changed')

    def finish(self):
        self.send({'op':'finish'}); self.child.stdin.close()
        receipt = self.receive({'complete'})['receipt']; self.child.wait(timeout=30)
        if self.error: raise self.error
        validate_native(receipt, self.native, self.protocol['native_pins'], self.arm, self.protocol['native_protocol_sha256'])
        if (self.child.returncode != 0 or receipt.get('complete') is not True
                or receipt.get('requests') != self.count or receipt.get('resets') != self.resets
                or receipt.get('admission_refusals') != self.refusals):
            raise ValueError('native completion counters differ')
        self.row['receipt'] = receipt; self.row['complete'] = True

    def close(self):
        self.stop.set()
        failure = None
        def cleanup(action):
            nonlocal failure
            try: action()
            except BaseException as error:
                if failure is None: failure = error
        cleanup(self.terminate)
        if self.thread is not None:
            cleanup(lambda: self.thread.join(timeout=10))
            if self.thread.is_alive() and failure is None:
                failure = RuntimeError('native monitor did not drain during cleanup')
        if self.selector is not None: cleanup(self.selector.close)
        if self.child is not None:
            for stream in (self.child.stdin, self.child.stdout):
                if stream is not None: cleanup(stream.close)
        for stream in (self.stderr, self.stdout):
            if stream is not None: cleanup(stream.close)
        cleanup(lambda: self.row.update(after=vm_snapshot()))
        self.row['seconds'] = time.monotonic() - self.started
        if failure is not None:
            self.row.setdefault('cleanup_failure', type(failure).__name__ + ': ' + str(failure))
            raise failure


def validate_inputs(protocol, tasks, root):
    if (protocol.get('schema') != 1 or protocol.get('kind') != 'same-model-outcome-campaign-v1'
            or protocol.get('scope') not in ('instrument-check', 'held-out')):
        raise ValueError('unsupported prospective campaign')
    if protocol.get('analysis_method') != 'fixed-weight-paired-tango-mover-bonferroni-v1':
        raise ValueError('unknown prospectively selected method')
    if protocol.get('driver_sha256') != digest(__file__):
        raise ValueError('campaign driver changed after protocol freeze')
    validate_selection(tasks, protocol)
    required = ['tasks', 'binary', 'native_protocol', 'bfcl_manifest']
    if any(protocol['paths'][name] not in protocol['files'] for name in required):
        raise ValueError('required input is not hash-bound')
    for name, expected in protocol['files'].items():
        path = root / name
        if digest(path) != expected: raise ValueError('frozen input changed: ' + name)
    native = read(root / protocol['paths']['native_protocol'])
    if digest(root / protocol['paths']['native_protocol']) != protocol['native_protocol_sha256']:
        raise ValueError('native protocol digest changed')
    if (native != {'schema':1, 'kind':'quantization-tool-session-v2', 'scope':protocol['scope'],
            'memory_bytes':14_000_000_000, 'context_limit':32768, 'output_limit':4096,
            'draft_depth':2, 'prefix_cache':True, 'maximum_requests':256, 'maximum_seconds':1800, 'seed':7}):
        raise ValueError('unpriced native evaluation mode')
    resource = protocol['resource']
    if (resource['preflight_gb'] < 17 or resource['headroom_bytes'] < 3_000_000_000
            or not 0 < resource['maximum_parent_bytes'] <= 512_000_000
            or resource['maximum_model_sessions'] != 2 * sum(protocol['sample_counts'].values())
            or not 0 < resource['maximum_campaign_seconds'] <= 259200
            or resource['new_weight_bytes'] != 0 or resource['new_raw_logit_bytes'] != 0
            or resource['paid_compute_usd'] != 0
            or not 0 <= resource['new_task_session_cutoff_seconds'] <= 900
            or not 0 < resource['maximum_output_bytes'] <= 6_000_000_000
            or not 0 < resource['maximum_research_staging_bytes'] <= 430_000_000_000):
        raise ValueError('unpriced campaign envelope')
    outcomes.ToolLimits(**protocol['tool_limits'])
    # Validate the prospectively chosen analysis parameters before any model
    # runs, without reading or deriving a final task outcome.
    stratified_mover_summary([{'id':f, 'family':f, 'baseline_pass':False, 'candidate_pass':False} for f in tasks],
        family_weights=protocol['family_weights'], family_margins=protocol['family_margins'],
        overall_margin=protocol['overall_margin'], alpha=protocol['alpha'])
    return native


def run_job(protocol_path, protocol_sha, root, output, job_index):
    protocol_path, root, output = Path(protocol_path), Path(root), Path(output)
    if digest(protocol_path) != protocol_sha: raise ValueError('prospective protocol digest changed')
    protocol = read(protocol_path); tasks = read(root / protocol['paths']['tasks'])
    native = validate_inputs(protocol, tasks, root)
    if not 0 <= job_index < len(protocol['jobs']): raise ValueError('job outside frozen selection')
    output.mkdir(parents=True, exist_ok=True)
    with (output / 'campaign.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        previous = []
        for index in range(job_index):
            value = read(output / f'job-{index:04d}' / 'receipt.json')
            if value.get('complete') is not True or value.get('protocol_sha256') != protocol_sha:
                raise ValueError('prior job incomplete or uses another protocol')
            previous.append(value)
        spent = sum(x['seconds'] for x in previous)
        prior_sessions = sum(len(x['sessions']) for x in previous)
        job = protocol['jobs'][job_index]
        destination = output / f'job-{job_index:04d}'; destination.mkdir(exist_ok=False)
        started = time.monotonic(); session = None
        result = {'schema':1, 'complete':False, 'qualification':False, 'protocol_sha256':protocol_sha,
            'driver_sha256':digest(__file__), 'job':job, 'sessions':[], 'outcomes':[]}
        def save():
            result['seconds'] = time.monotonic() - started
            write(destination / 'receipt.json', result)
        def budget():
            if spent + time.monotonic() - started > protocol['resource']['maximum_campaign_seconds']:
                raise TimeoutError('prospective campaign deadline')
            if prior_sessions + len(result['sessions']) >= protocol['resource']['maximum_model_sessions']:
                raise RuntimeError('prospective model-session count exhausted')
            if allocated(output) > protocol['resource']['maximum_output_bytes']:
                raise RuntimeError('campaign output reservation exhausted')
            if allocated(root) > protocol['resource']['maximum_research_staging_bytes']:
                raise RuntimeError('total research staging reservation exhausted')
        lookup = {x['id']:x for x in tasks[job['family']]}
        try:
            save(); budget()
            paths = protocol['paths']
            with bfcl.Bundle(root / paths['bfcl_source'], root / paths['bfcl_runtime'],
                    root / paths['bfcl_manifest'], protocol['files'][paths['bfcl_manifest']]) as bundle:
                for arm in job['arms']:
                    for case_id in job['ids']:
                        budget()
                        if session is not None and time.monotonic() - session.started > protocol['resource']['new_task_session_cutoff_seconds']:
                            session.finish(); session.close(); session = None; save()
                        if session is None:
                            number = len(result['sessions']); row = {'arm':arm, 'complete':False}
                            result['sessions'].append(row); save()
                            local = destination / f'session-{number:03d}-{arm}'
                            command = [str(root / paths['binary']), 'quantization-session', '--baseline', str(Path(paths['baseline']).expanduser()),
                                '--protocol-file', str(root / paths['native_protocol']), '--protocol-sha256', protocol['native_protocol_sha256'], '--output', str(local)]
                            if arm == 'candidate': command += ['--control', str(root / paths['control']), '--table', str(root / paths['rotary'])]
                            session = Session(command, local, native, protocol, arm, row,
                                campaign_deadline=started + protocol['resource']['maximum_campaign_seconds'] - spent,
                                output_root=output); save()
                        session.reset(); case = lookup[case_id]; began = time.monotonic()
                        if job['family'] == 'tools':
                            outcome = outcomes.tool_case(session, case, bundle, root / paths['bfcl_source'], bfcl.CLASSES,
                                outcomes.ToolLimits(**protocol['tool_limits']))
                        else:
                            try:
                                response = session.chat([{'role':'user', 'content':case['prompt']}])
                                outcome = (outcomes.isolated_instruction(case, response, root / paths['instruction_source'], root / paths['grader_runtime'])
                                    if job['family'] == 'instruction' else outcomes.grade(job['family'], case, response))
                                outcome['response'] = response
                            except outcomes.TaskBudgetExceeded as error:
                                outcome = {'passed':False, 'reason':str(error)}
                        if type(outcome.get('passed')) is not bool: raise ValueError('nonbinary outcome')
                        result['outcomes'].append({'arm':arm, 'id':case_id, 'seconds':time.monotonic()-began, **outcome}); save()
                        print(json.dumps({'job':job_index, 'family':job['family'], 'arm':arm, 'id':case_id, 'complete_task':True}), flush=True)
                    session.finish(); session.close(); session = None; save()
            validate_inputs(protocol, tasks, root)
            result['complete'] = True; save()
        except BaseException as error:
            result['failure'] = type(error).__name__ + ': ' + str(error)
            try:
                if session is not None: session.close()
            finally: save()
            raise
        return result


def analyze(protocol_path, protocol_sha, root, output):
    if digest(protocol_path) != protocol_sha: raise ValueError('prospective protocol digest changed')
    protocol = read(protocol_path); root, output = Path(root), Path(output)
    tasks = read(root / protocol['paths']['tasks']); validate_inputs(protocol, tasks, root)
    rows = []; receipts = {}
    for job in protocol['jobs']:
        path = output / f"job-{job['index']:04d}" / 'receipt.json'
        result = read(path)
        if result.get('complete') is not True or result.get('job') != job or result.get('protocol_sha256') != protocol_sha:
            raise ValueError('missing, incomplete or changed paired job')
        if len(result['outcomes']) != 2 * len(job['ids']): raise ValueError('incorrect paired outcome count')
        by_arm = {}
        for arm in ('original', 'candidate'):
            selected = [x for x in result['outcomes'] if x['arm'] == arm]
            if [x['id'] for x in selected] != job['ids']: raise ValueError('changed paired task order')
            by_arm[arm] = selected
        for original, candidate in zip(by_arm['original'], by_arm['candidate']):
            rows.append({'id':job['family']+'/'+original['id'], 'family':job['family'],
                'baseline_pass':original['passed'], 'candidate_pass':candidate['passed']})
        receipts[str(path.relative_to(output))] = digest(path)
    result = stratified_mover_summary(rows, family_weights=protocol['family_weights'],
        family_margins=protocol['family_margins'], overall_margin=protocol['overall_margin'], alpha=protocol['alpha'])
    result.update({'protocol_sha256':protocol_sha, 'paired_rows':rows, 'receipts':receipts,
        'campaign_scope':protocol['scope'],
        'scope':'Frozen text/task outcomes only. Instrument checks cannot qualify a model. Image quality, app workflows, long-context outcomes, memory and performance are independent gates.'})
    return result


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', required=True); parser.add_argument('--sha256', required=True)
    parser.add_argument('--root', required=True); parser.add_argument('--output', required=True)
    parser.add_argument('--job', type=int); parser.add_argument('--analyze', action='store_true')
    args = parser.parse_args()
    if args.analyze == (args.job is not None): parser.error('choose one job or final analysis')
    if args.analyze:
        value = analyze(args.protocol, args.sha256, args.root, args.output)
        print(json.dumps(value, ensure_ascii=False, allow_nan=False, indent=2))
    else:
        value = run_job(args.protocol, args.sha256, args.root, args.output, args.job)
        print(json.dumps({'complete':value['complete'], 'job':args.job, 'sessions':len(value['sessions']), 'seconds':value['seconds']}))
````

### Tools/quantization_outcome_campaign_test.py

Original bytes: 17306. SHA-256: `fc9a6a7f66420455c16b9c24c35d24d10d81eddd6abe28b3d3f59826b1123a66`.

Normalized bytes: 17306. SHA-256: `fc9a6a7f66420455c16b9c24c35d24d10d81eddd6abe28b3d3f59826b1123a66`.

````text
import copy
import json
import os
from pathlib import Path
import sys
import tempfile
import threading
import unittest
from unittest.mock import patch

import quantization_outcome_campaign as q


class CampaignTests(unittest.TestCase):
    def fixture(self, root):
        root = Path(root)
        native = {'schema':1, 'kind':'quantization-tool-session-v2', 'scope':'instrument-check',
            'memory_bytes':14_000_000_000, 'context_limit':32768, 'output_limit':4096,
            'draft_depth':2, 'prefix_cache':True, 'maximum_requests':256, 'maximum_seconds':1800, 'seed':7}
        tasks = {'tools':[{'id':'a'}, {'id':'b'}]}
        for name, value in [('native.json',native), ('tasks.json',tasks), ('bundle.json',{})]:
            q.write(root / name, value)
        (root / 'binary').write_text('fixture, never executed\n')
        protocol = {'schema':1, 'kind':'same-model-outcome-campaign-v1', 'scope':'instrument-check',
            'driver_sha256':q.digest(q.__file__),
            'analysis_method':'fixed-weight-paired-tango-mover-bonferroni-v1',
            'task_ids':{'tools':['a','b']}, 'sample_counts':{'tools':2}, 'pilot_exclusions':{'tools':['pilot']},
            'jobs':[{'index':0,'family':'tools','ids':['a'],'arms':['original','candidate']},
                    {'index':1,'family':'tools','ids':['b'],'arms':['candidate','original']}],
            'paths':{'tasks':'tasks.json','binary':'binary','native_protocol':'native.json','bfcl_manifest':'bundle.json'},
            'files':{name:q.digest(root / name) for name in ['native.json','tasks.json','binary','bundle.json']},
            'native_protocol_sha256':q.digest(root / 'native.json'),
            'native_pins':{'original':{'manifest_sha256':'a'*64}, 'candidate':{'control_manifest_sha256':'b'*64}},
            'resource':{'preflight_gb':17, 'headroom_bytes':3_000_000_000, 'maximum_parent_bytes':256_000_000,
                'maximum_model_sessions':4, 'maximum_campaign_seconds':7200,
                'new_weight_bytes':0, 'new_raw_logit_bytes':0, 'paid_compute_usd':0,
                'new_task_session_cutoff_seconds':600, 'maximum_output_bytes':500_000_000,
                'maximum_research_staging_bytes':430_000_000_000},
            'tool_limits':{'steps_per_turn':12,'calls_per_step':8,'calls_per_case':96},
            'family_weights':{'tools':1.}, 'family_margins':{'tools':.05}, 'overall_margin':.02, 'alpha':.05}
        return protocol, tasks, native

    def native_identity(self, protocol, native):
        return {'loaded':True, 'protocol_sha256':protocol['native_protocol_sha256'],
            **{key:native[key] for key in ['draft_depth','prefix_cache','output_limit','maximum_requests','maximum_seconds','scope','seed']},
            'protocol_kind':native['kind'], 'manifest_sha256':'a'*64,
            'plan':{'target_gb':14, 'max_context_tokens':32768, 'availability_clamped':False,
                'vision':False, 'decode_lookahead':False, 'mtp':True, 'mtp_streamed_experts':True,
                'runtime_prefix_cache_enabled':True}}

    def test_selection_rejects_contamination_omission_duplicates_and_arm_changes(self):
        with tempfile.TemporaryDirectory() as directory:
            protocol, tasks, _ = self.fixture(directory)
            q.validate_selection(tasks, protocol)
            for edit in [lambda p:p['pilot_exclusions']['tools'].append('a'),
                         lambda p:p['task_ids']['tools'].reverse(),
                         lambda p:p['jobs'].pop(),
                         lambda p:p['jobs'][1]['ids'].append('b'),
                         lambda p:p['jobs'][1]['arms'].reverse(),
                         lambda p:p.update(scope='held-out')]:
                altered = copy.deepcopy(protocol); edit(altered)
                with self.assertRaises(ValueError): q.validate_selection(tasks, altered)

    def test_every_frozen_input_and_analysis_setting_is_checked_before_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); protocol, tasks, native = self.fixture(root)
            self.assertEqual(q.validate_inputs(protocol, tasks, root), native)
            for edit in [lambda p:p['files'].pop('tasks.json'),
                         lambda p:p['family_weights'].update(tools=.5),
                         lambda p:p['tool_limits'].update(calls_per_case=97),
                         lambda p:p['resource'].update(maximum_campaign_seconds=259201),
                         lambda p:p['resource'].update(maximum_model_sessions=5),
                         lambda p:p['resource'].update(headroom_bytes=1)]:
                altered = copy.deepcopy(protocol); edit(altered)
                with self.assertRaises(ValueError): q.validate_inputs(altered, tasks, root)
            (root / 'binary').write_text('changed\n')
            with self.assertRaisesRegex(ValueError, 'frozen input changed'): q.validate_inputs(protocol,tasks,root)

    def test_native_identity_retains_artifact_plan_and_complete_features(self):
        with tempfile.TemporaryDirectory() as directory:
            protocol, _, native = self.fixture(directory); identity = self.native_identity(protocol,native)
            check = lambda value:q.validate_native(value,native,protocol['native_pins'],'original',protocol['native_protocol_sha256'])
            check(identity)
            for edit in [lambda p:p.update(manifest_sha256='b'*64), lambda p:p.update(output_limit=1024),
                         lambda p:p['plan'].update(target_gb=10), lambda p:p['plan'].update(availability_clamped=True),
                         lambda p:p['plan'].update(mtp_streamed_experts=False), lambda p:p['plan'].update(runtime_prefix_cache_enabled=False)]:
                altered = copy.deepcopy(identity); edit(altered)
                with self.assertRaises(ValueError):check(altered)

    def response(self, native, messages):
        return {'event':'response','id':'call-1','http_head':'HTTP/1.1 200 OK\r\nContent-Type: application/json',
            'request':{'messages':messages,'max_tokens':4096,'seed':7,'temperature':0,'stream':False,'think':False},
            'reserved_prompt_tokens':12, 'response':{'usage':{'prompt_tokens':12,'completion_tokens':1,'total_tokens':13},
                'choices':[{'finish_reason':'stop','message':{'role':'assistant','content':'5'}}]}}

    def test_only_a_bound_verified_context_refusal_becomes_a_task_outcome(self):
        with tempfile.TemporaryDirectory() as directory:
            _, _, native = self.fixture(directory); messages=[{'role':'user','content':'Test.'}]
            event=self.response(native,messages)
            self.assertEqual(q.verify_response(event,'call-1',messages,None,native),event['response'])
            for edit in [lambda e:e.update(id='another'), lambda e:e['request'].update(messages=[]),
                         lambda e:e['request'].update(max_tokens=128), lambda e:e['request'].update(think=True),
                         lambda e:e.update(reserved_prompt_tokens=13),
                         lambda e:e['response']['usage'].update(total_tokens=14)]:
                altered=copy.deepcopy(event);edit(altered)
                with self.assertRaises(ValueError):q.verify_response(altered,'call-1',messages,None,native)
            refusal={k:v for k,v in event.items() if k in ('id','request')}
            refusal.update(event='admission_refusal',code='reply_reservation_exceeded',context_limit=32768,output_limit=4096,prompt_tokens=28673)
            with self.assertRaises(q.outcomes.TaskBudgetExceeded):q.verify_response(refusal,'call-1',messages,None,native)
            for edit in [lambda e:e.update(prompt_tokens=28672),lambda e:e.update(context_limit=8192),
                         lambda e:e.update(code='worker_crash'),lambda e:e.update(response={})]:
                altered=copy.deepcopy(refusal);edit(altered)
                with self.assertRaises(ValueError):q.verify_response(altered,'call-1',messages,None,native)
            event['http_head']='HTTP/1.1 500 Error\r\n'
            with self.assertRaises(RuntimeError):q.verify_response(event,'call-1',messages,None,native)

    def test_complete_pairs_required_for_analysis_and_launched_jobs_are_never_replaced(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);protocol,tasks,_=self.fixture(root)
            path=root/'protocol.json';q.write(path,protocol);pin=q.digest(path);output=root/'runs';output.mkdir()
            with self.assertRaises(FileNotFoundError):q.analyze(path,pin,root,output)
            for job in protocol['jobs']:
                folder=output/f"job-{job['index']:04d}";folder.mkdir()
                value={'complete':True,'protocol_sha256':pin,'job':job,'seconds':1,'sessions':[{}],
                    'outcomes':[{'arm':arm,'id':job['ids'][0],'passed':True} for arm in job['arms']]}
                q.write(folder/'receipt.json',value)
            result=q.analyze(path,pin,root,output)
            self.assertEqual(len(result['paired_rows']),2);self.assertFalse(result['qualification'])
            with patch.object(q,'Session',side_effect=AssertionError('must not launch')):
                with self.assertRaises(FileExistsError):q.run_job(path,pin,root,output,0)
            record=q.read(output/'job-0000/receipt.json');record['complete']=False;q.write(output/'job-0000/receipt.json',record)
            with self.assertRaises(ValueError):q.analyze(path,pin,root,output)
            with patch.object(q,'Session',side_effect=AssertionError('must not launch')):
                with self.assertRaises(ValueError):q.run_job(path,pin,root,output,1)

    def test_unexpected_ready_identity_drains_the_owned_child(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);protocol,_,native=self.fixture(root)
            identity=self.native_identity(protocol,native);identity['manifest_sha256']='wrong'
            fixture=root/'child.py'
            fixture.write_text('import json,time\nprint('+repr(json.dumps({'event':'ready','identity':identity}))+',flush=True)\ntime.sleep(30)\n')
            row={}
            with patch.object(q,'quiet_preflight',return_value={}):
                with self.assertRaisesRegex(ValueError,'native artifact differs'):
                    q.Session([sys.executable,str(fixture)],root/'native',native,protocol,'original',row)
            with self.assertRaises(ProcessLookupError):os.kill(row['pid'],0)
            self.assertIn('after',row)

    def test_native_child_completion_and_premature_eof_are_distinct(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);protocol,_,native=self.fixture(root)
            identity=self.native_identity(protocol,native)
            fixture=root/'child.py'
            fixture.write_text('''import json,sys
identity=json.loads(sys.argv[1]);print(json.dumps({'event':'ready','identity':identity}),flush=True)
resets=0
for line in sys.stdin:
    value=json.loads(line)
    if value['op']=='reset':
        resets+=1;print(json.dumps({'event':'reset','id':value['id']}),flush=True)
    elif value['op']=='finish':
        if sys.argv[2]=='eof':break
        identity.update(complete=True,requests=0,resets=resets,admission_refusals=0)
        print(json.dumps({'event':'complete','receipt':identity}),flush=True);break
''')
            for mode in ('complete','eof'):
                row={}
                with patch.object(q,'quiet_preflight',return_value={}):
                    session=q.Session([sys.executable,str(fixture),json.dumps(identity),mode],root/mode,native,protocol,'original',row)
                try:
                    session.reset()
                    if mode=='eof':
                        with self.assertRaisesRegex(RuntimeError,'ended before'):session.finish()
                    else:
                        session.finish();self.assertTrue(row['complete'])
                finally:session.close()
                self.assertTrue(session.child.stdin.closed);self.assertTrue(session.child.stdout.closed)
                with self.assertRaises(ProcessLookupError):os.kill(row['pid'],0)

    def test_pressure_and_campaign_deadlines_abort_without_fabricating_an_outcome(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);protocol,_,native=self.fixture(root)
            identity=self.native_identity(protocol,native)
            fixture=root/'child.py'
            fixture.write_text('import time\nprint('+repr(json.dumps({'event':'ready','identity':identity}))+',flush=True)\ntime.sleep(30)\n')
            for mode in ('pressure','deadline'):
                row={}; available={'reclaimable_bytes':50_000_000_000}
                with patch.object(q,'quiet_preflight',return_value={}),patch.object(q,'vm_snapshot',side_effect=lambda:dict(available)):
                    session=q.Session([sys.executable,str(fixture)],root/mode,native,protocol,'original',row)
                    try:
                        # Trigger after ready, independently of interpreter or
                        # CI startup speed. Neither event becomes a task score.
                        if mode=='pressure':available['reclaimable_bytes']=0
                        else:session.campaign_deadline=q.time.monotonic()-1
                        with self.assertRaises(MemoryError if mode=='pressure' else TimeoutError):session.receive({'never'})
                    finally:session.close()
                self.assertNotIn('complete',row)
                with self.assertRaises(ProcessLookupError):os.kill(row['pid'],0)

    def test_monitor_and_caller_share_one_termination_owner(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);protocol,_,native=self.fixture(root)
            identity=self.native_identity(protocol,native);fixture=root/'child.py'
            fixture.write_text('import time\nprint('+repr(json.dumps({'event':'ready','identity':identity}))+',flush=True)\ntime.sleep(30)\n')
            entered=threading.Event();release=threading.Event();caller_entered=threading.Event()
            available={'reclaimable_bytes':50_000_000_000};calls=[];errors=[]
            real_terminate=q.terminate_child_tree
            def held_terminate(child):
                calls.append(child.pid);entered.set()
                if not release.wait(5):raise TimeoutError('cleanup fixture did not release')
                real_terminate(child)
            def caller():
                caller_entered.set()
                try:session.close()
                except BaseException as error:errors.append(error)
            with patch.object(q,'quiet_preflight',return_value={}),patch.object(q,'vm_snapshot',side_effect=lambda:dict(available)),patch.object(q,'terminate_child_tree',side_effect=held_terminate):
                session=q.Session([sys.executable,str(fixture)],root/'native',native,protocol,'original',{})
                closer=None
                try:
                    available['reclaimable_bytes']=0
                    self.assertTrue(entered.wait(3),'monitor did not enter owned termination')
                    closer=threading.Thread(target=caller);closer.start()
                    self.assertTrue(caller_entered.wait(3))
                    release.set();closer.join(5)
                    self.assertFalse(closer.is_alive());self.assertEqual(errors,[])
                    self.assertEqual(calls,[session.child.pid])
                    self.assertIsInstance(session.error,MemoryError)
                    self.assertTrue(session.child.stdin.closed);self.assertTrue(session.child.stdout.closed)
                finally:
                    release.set()
                    if closer is not None:closer.join(5)
                    if session.child.poll() is None:real_terminate(session.child)

    def test_failed_termination_is_retained_without_leaking_pipes_or_retrying_signals(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);protocol,_,native=self.fixture(root)
            identity=self.native_identity(protocol,native);fixture=root/'child.py'
            fixture.write_text('import time\nprint('+repr(json.dumps({'event':'ready','identity':identity}))+',flush=True)\ntime.sleep(30)\n')
            with patch.object(q,'quiet_preflight',return_value={}),patch.object(q.Session,'monitor',return_value=None):
                session=q.Session([sys.executable,str(fixture)],root/'native',native,protocol,'original',{})
            try:
                with patch.object(q,'terminate_child_tree',side_effect=PermissionError('fixture refusal')) as terminate:
                    for _ in range(2):
                        with self.assertRaises(PermissionError):session.close()
                    self.assertEqual(terminate.call_count,1)
                self.assertIn('PermissionError',session.row['cleanup_failure'])
                self.assertIn('after',session.row)
                for stream in (session.child.stdin,session.child.stdout,session.stderr,session.stdout):
                    self.assertTrue(stream.closed)
            finally:
                if session.child.poll() is None:q.terminate_child_tree(session.child)


if __name__=='__main__':unittest.main()
````

### .build/quantization-research/serial-outcome-ci-details-v1.json

Original bytes: 5963. SHA-256: `73599ca8936abef90085738465a4e7fbaeefac128dcaf2393036ec01bb464212`.

Normalized bytes: 5963. SHA-256: `73599ca8936abef90085738465a4e7fbaeefac128dcaf2393036ec01bb464212`.

````text
{"conclusion":"failure","jobs":[{"completedAt":"2026-10-04T14:50:19Z","conclusion":"failure","databaseId":111457672760,"name":"weights-free","startedAt":"2026-10-04T14:30:50Z","status":"completed","steps":[{"completedAt":"2026-10-04T14:30:52Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-04T14:30:51Z","status":"completed"},{"completedAt":"2026-10-04T14:31:17Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-04T14:30:52Z","status":"completed"},{"completedAt":"2026-10-04T14:31:58Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-04T14:31:17Z","status":"completed"},{"completedAt":"2026-10-04T14:31:58Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-04T14:31:58Z","status":"completed"},{"completedAt":"2026-10-04T14:32:02Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-04T14:31:58Z","status":"completed"},{"completedAt":"2026-10-04T14:45:24Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-04T14:32:02Z","status":"completed"},{"completedAt":"2026-10-04T14:45:31Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-04T14:45:24Z","status":"completed"},{"completedAt":"2026-10-04T14:45:37Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-04T14:45:31Z","status":"completed"},{"completedAt":"2026-10-04T14:47:14Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-04T14:45:37Z","status":"completed"},{"completedAt":"2026-10-04T14:47:15Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-04T14:47:14Z","status":"completed"},{"completedAt":"2026-10-04T14:50:14Z","conclusion":"failure","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-04T14:47:15Z","status":"completed"},{"completedAt":"2026-10-04T14:50:14Z","conclusion":"skipped","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-04T14:50:14Z","status":"completed"},{"completedAt":"2026-10-04T14:50:14Z","conclusion":"skipped","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-04T14:50:14Z","status":"completed"},{"completedAt":"2026-10-04T14:50:14Z","conclusion":"skipped","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-04T14:50:14Z","status":"completed"},{"completedAt":"2026-10-04T14:50:16Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-04T14:50:14Z","status":"completed"},{"completedAt":"2026-10-04T14:50:17Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-04T14:50:16Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37209525799/job/111457672760"},{"completedAt":"2026-10-04T14:45:10Z","conclusion":"success","databaseId":111457673006,"name":"coverage","startedAt":"2026-10-04T14:30:52Z","status":"completed","steps":[{"completedAt":"2026-10-04T14:30:55Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-04T14:30:53Z","status":"completed"},{"completedAt":"2026-10-04T14:31:17Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-04T14:30:55Z","status":"completed"},{"completedAt":"2026-10-04T14:31:17Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-04T14:31:17Z","status":"completed"},{"completedAt":"2026-10-04T14:31:19Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-04T14:31:17Z","status":"completed"},{"completedAt":"2026-10-04T14:45:04Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-04T14:31:19Z","status":"completed"},{"completedAt":"2026-10-04T14:45:04Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-04T14:45:04Z","status":"completed"},{"completedAt":"2026-10-04T14:45:06Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-04T14:45:04Z","status":"completed"},{"completedAt":"2026-10-04T14:45:07Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-04T14:45:06Z","status":"completed"},{"completedAt":"2026-10-04T14:45:09Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-04T14:45:07Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37209525799/job/111457673006"},{"completedAt":"2026-10-04T14:35:23Z","conclusion":"success","databaseId":111457673046,"name":"public-library","startedAt":"2026-10-04T14:30:49Z","status":"completed","steps":[{"completedAt":"2026-10-04T14:30:50Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-04T14:30:49Z","status":"completed"},{"completedAt":"2026-10-04T14:31:08Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-04T14:30:50Z","status":"completed"},{"completedAt":"2026-10-04T14:31:08Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-04T14:31:08Z","status":"completed"},{"completedAt":"2026-10-04T14:35:17Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-04T14:31:08Z","status":"completed"},{"completedAt":"2026-10-04T14:35:18Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-04T14:35:17Z","status":"completed"},{"completedAt":"2026-10-04T14:35:21Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-04T14:35:18Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37209525799/job/111457673046"}],"status":"completed"}
````

### .build/quantization-research/serial-outcome-ci-failure-v1.log

Original bytes: 27954. SHA-256: `3aba1343cb483f06c61dabcfda0235471e6a2ebe00b9bcafd6e8778c9aced00e`.

Normalized bytes: 27954. SHA-256: `3aba1343cb483f06c61dabcfda0235471e6a2ebe00b9bcafd6e8778c9aced00e`.

````zlib-base64
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
/wvFdrda
````

### .build/quantization-research/check-outcome-campaign-cleanup-negative-v1.py

Original bytes: 3392. SHA-256: `8840b83779356a7281ad37ba9d092415513f9e2bdc43aea995d939afe7a00753`.

Normalized bytes: 3392. SHA-256: `8840b83779356a7281ad37ba9d092415513f9e2bdc43aea995d939afe7a00753`.

````text
"""Deterministically expose the frozen runner's duplicate cleanup ownership."""
from pathlib import Path
import hashlib, importlib.util, json, sys, tempfile, threading, time
from unittest.mock import patch
repo=Path.cwd();root=repo/'.build/quantization-research'
sys.path.insert(0,str(repo/'Tools'))
import quantization_outcome_campaign_test as fixtures
source=root/'heldout-outcome-protocol-v1/helpers/quantization_outcome_campaign.py'
spec=importlib.util.spec_from_file_location('old_campaign_cleanup',source)
old=importlib.util.module_from_spec(spec);spec.loader.exec_module(old)
record={'complete':False,'model_runs':0,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
        'expected_negative_control':True,'description':'Signals are replaced by a barrier; the tiny owned child is drained once after observing both old cleanup owners.'}
start=time.monotonic();real_terminate=old.terminate_child_tree
with tempfile.TemporaryDirectory() as directory:
    folder=Path(directory);test=fixtures.CampaignTests();protocol,_,native=test.fixture(folder)
    identity=test.native_identity(protocol,native);child_script=folder/'child.py'
    child_script.write_text('import time\nprint('+repr(json.dumps({'event':'ready','identity':identity}))+',flush=True)\ntime.sleep(30)\n')
    entered=threading.Event();duplicate=threading.Event();release=threading.Event();lock=threading.Lock()
    calls=[];errors=[];available={'reclaimable_bytes':50_000_000_000};session=None;closer=None
    def delayed(child):
        with lock:
            calls.append(child.pid);entered.set()
            if len(calls)>1:duplicate.set()
        if not release.wait(10):raise TimeoutError('negative-control barrier did not release')
    def caller():
        try:session.close()
        except BaseException as error:errors.append(type(error).__name__+': '+str(error))
    try:
        with patch.object(old,'quiet_preflight',return_value={}),patch.object(old,'vm_snapshot',side_effect=lambda:dict(available)),patch.object(old,'terminate_child_tree',side_effect=delayed):
            session=old.Session([sys.executable,str(child_script)],folder/'native',native,protocol,'original',{})
            available['reclaimable_bytes']=0
            assert entered.wait(3),'watchdog did not enter cleanup'
            closer=threading.Thread(target=caller);closer.start()
            assert duplicate.wait(3),'old duplicate cleanup was not reproduced'
            release.set();closer.join(3)
            assert not closer.is_alive() and not errors
            record.update(duplicate_cleanup_calls=len(calls),owned_pid=session.child.pid,
                original_watchdog_failure=type(session.error).__name__,complete=len(calls)==2)
    finally:
        release.set()
        if closer is not None:closer.join(5)
        if session is not None:
            session.stop.set()
            if session.thread is not None:session.thread.join(5)
            if session.child is not None and session.child.poll() is None:real_terminate(session.child)
            for stream in [session.child.stdin,session.child.stdout,session.stderr,session.stdout]:
                if stream is not None and not stream.closed:stream.close()
record['seconds']=time.monotonic()-start
assert record['complete']
(root/'outcome-campaign-cleanup-negative-v1.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record))
````

### .build/quantization-research/outcome-campaign-cleanup-negative-v1.json

Original bytes: 433. SHA-256: `0147a0812e75d2d05d7e55e508704b9e664f698eaf97812c0951c0c1b71a0667`.

Normalized bytes: 433. SHA-256: `0147a0812e75d2d05d7e55e508704b9e664f698eaf97812c0951c0c1b71a0667`.

````text
{
  "complete": true,
  "model_runs": 0,
  "source_sha256": "f6b62b36f3d38f36fe040373aa7c3a08f9dea79fc0e2fa1b21eae7203682142c",
  "expected_negative_control": true,
  "description": "Signals are replaced by a barrier; the tiny owned child is drained once after observing both old cleanup owners.",
  "duplicate_cleanup_calls": 2,
  "owned_pid": 23280,
  "original_watchdog_failure": "MemoryError",
  "seconds": 0.28008395800134167
}
````

### .build/quantization-research/outcome-campaign-cleanup-negative-v1.log

Original bytes: 413. SHA-256: `0a729c3beda46313acc65b87cd1eaca7d11e02b52f8f508bc7a6adb3dac5b5b1`.

Normalized bytes: 413. SHA-256: `0a729c3beda46313acc65b87cd1eaca7d11e02b52f8f508bc7a6adb3dac5b5b1`.

````text
{"complete": true, "model_runs": 0, "source_sha256": "f6b62b36f3d38f36fe040373aa7c3a08f9dea79fc0e2fa1b21eae7203682142c", "expected_negative_control": true, "description": "Signals are replaced by a barrier; the tiny owned child is drained once after observing both old cleanup owners.", "duplicate_cleanup_calls": 2, "owned_pid": 23280, "original_watchdog_failure": "MemoryError", "seconds": 0.28008395800134167}
````

### .build/quantization-research/outcome-campaign-unit-system-v6.log

Original bytes: 109. SHA-256: `b640be209ee768cda822ee9b1886d8bd5f64ebd60ef9e54f7c82a5736009e4e3`.

Normalized bytes: 109. SHA-256: `b640be209ee768cda822ee9b1886d8bd5f64ebd60ef9e54f7c82a5736009e4e3`.

````text
..........
----------------------------------------------------------------------
Ran 10 tests in 0.999s

OK
````

### .build/quantization-research/outcome-campaign-unit-venv-v6.log

Original bytes: 109. SHA-256: `457c37727832a4b8579a4ef7fa991e8d64daa16e97e2471451d2faa2a41fb3b3`.

Normalized bytes: 109. SHA-256: `457c37727832a4b8579a4ef7fa991e8d64daa16e97e2471451d2faa2a41fb3b3`.

````text
..........
----------------------------------------------------------------------
Ran 10 tests in 0.997s

OK
````
