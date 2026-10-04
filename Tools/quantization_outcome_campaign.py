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
MAX_INPUT = 1 << 20


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


def validate_plan(plan, native):
    vision = native['kind'] == 'quantization-image-session-v1'
    if plan['target_gb'] * 1e9 != native['memory_bytes'] or plan['max_context_tokens'] != native['context_limit']:
        raise ValueError('native admission plan differs')
    if (plan.get('availability_clamped') is not False or plan.get('vision') is not vision
            or plan.get('decode_lookahead') is not False):
        raise ValueError('unexpected native feature or availability change')
    drafted = native['draft_depth'] > 0
    if (plan.get('mtp') is not drafted or plan.get('mtp_streamed_experts') is not drafted
            or plan.get('runtime_prefix_cache_enabled') is not native['prefix_cache']):
        raise ValueError('required complete configuration absent')
    if vision:
        peak = plan.get('memory_ledger', {}).get('expected_peak_bytes')
        if type(peak) is not int or not 0 < peak <= native['memory_bytes']:
            raise ValueError('image plan does not price its complete memory envelope')


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
    vision = native['kind'] == 'quantization-image-session-v1'
    if identity.get('vision', False) is not vision:
        raise ValueError('native image capability differs from the protocol')
    if vision and identity.get('required_preflight_bytes') != native['memory_bytes'] + 6_000_000_000:
        raise ValueError('native image preflight reserve differs')
    if vision and (type(identity.get('vision_query_tile')) is not int or identity['vision_query_tile'] != 256
                   or type(identity.get('vision_attention_padding')) is not int or identity['vision_attention_padding'] != 0):
        raise ValueError('native image workspace arithmetic differs')
    validate_plan(identity['plan'], native)


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
    if native['kind'] == 'quantization-image-session-v1':
        if type(event.get('applied_plan')) is not dict:
            raise ValueError('image response lacks its applied allocation plan')
        validate_plan(event['applied_plan'], native)
    return response


class Session:
    # The app already waits past XNU's one-second host-statistics cache after
    # releasing an Engine. Apply the same conservative boundary between owned
    # native processes before a new caller can sample headroom and launch.
    # This does not increase a budget, retry a session or authorize allocation.
    RELEASE_SETTLE_SECONDS = 1.05

    def __init__(self, command, output, native, protocol, arm, row, *, campaign_deadline=None, output_root=None):
        self.row, self.native, self.protocol, self.arm = row, native, protocol, arm
        self.started = time.monotonic(); self.error = None
        self.stop = threading.Event(); self.buffer = bytearray()
        self.termination_lock = threading.Lock()
        self.termination_attempted = False; self.termination_error = None
        self.release_settled = False
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
        if len(raw) > MAX_INPUT: raise ValueError('request exceeds native input frame bound')
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
        if self.child is not None and self.child.poll() is not None and not self.release_settled:
            def settle():
                began = time.monotonic()
                remaining = self.RELEASE_SETTLE_SECONDS
                while remaining > 0:
                    time.sleep(remaining)
                    remaining = self.RELEASE_SETTLE_SECONDS - (time.monotonic() - began)
                self.row['release_settle_seconds'] = time.monotonic() - began
                self.row['exit_code'] = self.child.returncode
                self.release_settled = True
            cleanup(settle)
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
