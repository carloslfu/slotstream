#!/usr/bin/env python3
"""Read-only custody audit for a first-instruction-worker import failure.

The earlier continuation runs in its own interpreter/module namespace. Its
unchanged validator authenticates the completed prefix without recomputing a
single grade. Only the one completely journaled, still ungraded answer from
the failed job may be recovered. No model is started by this instrument.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import stat
import sys
import time


def digest(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as stream:
        while chunk := stream.read(1 << 20): h.update(chunk)
    return h.hexdigest()


def interrupted_case(row, job, directory, native, effective, campaign, previous):
    """Validate response custody, never score or return its visible text."""
    if (job['family'] != 'instruction' or row.get('job') != job
            or row.get('complete') is not False or row.get('qualification') is not False
            or row.get('outcomes') != [] or len(row.get('sessions', [])) != 1
            or not row.get('failure', '').startswith('RuntimeError: instruction grader infrastructure failed: Traceback (most recent call last):\n')
            or 'import nltk' not in row['failure']):
        raise ValueError('only an import failure before the first instruction grade is admitted')
    previous.seconds(row['seconds'])
    session = row['sessions'][0]
    if (session.get('arm') != job['arms'][0] or session.get('complete') is not False
            or session.get('exit_code') != -15 or session.get('release_settle_seconds', 0) < campaign.Session.RELEASE_SETTLE_SECONDS
            or any(key in session for key in ('receipt', 'cleanup_failure', 'startup_failure'))):
        raise ValueError('failed worker must leave one cleanly terminated native session')
    previous.seconds(session['seconds'])
    path = previous.session_output(session, directory)
    command = [str(effective['_root'] / effective['paths']['binary']), 'quantization-session',
        '--baseline', str(Path(effective['paths']['baseline']).expanduser()),
        '--protocol-file', str(effective['_root'] / effective['paths']['native_protocol']),
        '--protocol-sha256', effective['native_protocol_sha256'], '--output', str(path)]
    if session['arm'] == 'candidate':
        command += ['--control', str(effective['_root'] / effective['paths']['control']),
                    '--table', str(effective['_root'] / effective['paths']['rotary'])]
    if session.get('command') != command: raise ValueError('interrupted native command changed')
    receipt = campaign.read(path / 'receipt.json')
    for identity in (session.get('identity'), receipt):
        campaign.validate_native(identity, native, effective['native_pins'], session['arm'], effective['native_protocol_sha256'])
    if (receipt.get('complete') is not False or receipt.get('loaded') is not True
            or any(type(receipt.get(k)) is not int or receipt[k] != v
                for k, v in [('requests', 1), ('resets', 1), ('admission_refusals', 0)])
            or type(receipt.get('peak_process_bytes')) is not int
            or not 0 < receipt['peak_process_bytes'] <= native['memory_bytes']):
        raise ValueError('interrupted native counters or physical ceiling changed')
    for key, limit in [('peak_model_bytes', native['memory_bytes']),
                       ('peak_parent_bytes', effective['resource']['maximum_parent_bytes'])]:
        if type(session.get(key)) is not int or not 0 < session[key] <= limit:
            raise ValueError('interrupted physical observation missing or outside its budget')
    events = []
    with path.with_suffix('.stdout').open('rb') as stream:
        while line := stream.readline(campaign.MAX_EVENT + 1):
            if len(line) > campaign.MAX_EVENT or not line.endswith(b'\n') or len(events) >= 3:
                raise ValueError('unexpected, incomplete or oversized interrupted event')
            events.append(json.loads(line))
    if (len(events) != 3 or events[0] != {'event': 'ready', 'identity': session['identity']}
            or events[1] != {'event': 'reset', 'id': 'reset-1'}
            or events[2].get('event') != 'response'):
        raise ValueError('exactly one ready/reset/complete-response sequence is required')
    return events[2], session['arm']


def audit(previous_protocol, previous_sha, root, source, stop_job):
    root = Path(root).resolve(); previous_protocol = Path(previous_protocol).resolve()
    source = Path(source).resolve()
    if root not in source.parents or root not in previous_protocol.parents:
        raise ValueError('source must stay inside the research reservation')
    if digest(previous_protocol) != previous_sha: raise ValueError('previous protocol changed')
    protocol = json.loads(previous_protocol.read_bytes())
    helpers = previous_protocol.parent / 'helpers'
    pins = {**protocol['helper_sha256'], 'quantization_outcome_continuation': protocol['driver_sha256']}
    for name, pin in pins.items():
        if re.fullmatch('[a-z][a-z0-9_]*', name) is None:
            raise ValueError('unsafe frozen helper name')
        path = helpers / (name + '.py')
        if path.is_symlink() or digest(path) != pin: raise ValueError('previous helper changed')
    # This mode deliberately imports no current campaign module before the
    # old, hash-checked closure. Run it as a separate bounded subprocess.
    if any(name in sys.modules for name in pins):
        raise ValueError('source audit needs a fresh frozen module namespace')
    sys.path.insert(0, str(helpers))
    import quantization_outcome_continuation as previous
    import quantization_outcome_campaign as campaign
    effective, native, tasks, inherited = previous.validate(protocol, root)
    first_instruction = next(j['index'] for j in effective['jobs'] if j['family'] == 'instruction')
    if type(stop_job) is not int or stop_job != first_instruction:
        raise ValueError('recovery is limited to the first instruction job')
    coordinator = campaign.read(source / 'coordinator.json')
    if (coordinator.get('complete') is not False or coordinator.get('active_job') != stop_job
            or coordinator.get('protocol_sha256') != previous_sha
            or coordinator.get('coordinator_sha256') != protocol['coordinator_sha256']
            or coordinator.get('failure') != 'RuntimeError: continuation job failed; preserve evidence and do not retry: ' + str(stop_job)):
        raise ValueError('the source coordinator does not describe this exact interruption')
    if sorted(p.name for p in source.glob('job-*') if p.is_dir()) != [f'job-{i:04d}' for i in range(stop_job + 1)]:
        raise ValueError('unregistered source jobs')
    spent = 0; sessions = 0; completed = []
    for index, (row, _) in enumerate(previous.checked_rows(protocol, previous_sha, root, source,
            effective, native, inherited, stop_job)):
        spent += row['seconds']; sessions += len(row['sessions'])
        completed.append({'index': index, 'receipt_sha256': digest(source / f'job-{index:04d}' / 'receipt.json')})
    if coordinator.get('completed_jobs') != completed:
        raise ValueError('completed source prefix changed')
    directory = source / f'job-{stop_job:04d}'; row = campaign.read(directory / 'receipt.json')
    if (row.get('protocol_sha256') != previous_sha or row.get('driver_sha256') != effective['driver_sha256']
            or 'continuation_source' in row):
        raise ValueError('failed job identity or lineage changed')
    event, arm = interrupted_case(row, effective['jobs'][stop_job], directory, native, effective, campaign, previous)
    case_id = row['job']['ids'][0]
    case = next(case for case in tasks['instruction'] if case['id'] == case_id)
    response = campaign.verify_response(event, 'call-1', [{'role': 'user', 'content': case['prompt']}], None, native)
    if campaign.outcomes.terminal(response) is None:
        raise ValueError('import failure must follow a completely terminated plain answer')
    spent += row['seconds']; sessions += len(row['sessions'])
    closure = {}; size = allocated = 0
    for path in sorted(source.rglob('*')):
        info = path.lstat()
        if stat.S_ISLNK(info.st_mode): raise ValueError('source evidence contains a symlink')
        if path.is_dir(): continue
        if not stat.S_ISREG(info.st_mode): raise ValueError('nonregular source evidence')
        size += info.st_size; allocated += info.st_blocks * 512
        if size > effective['resource']['maximum_output_bytes'] or len(closure) >= 10000:
            raise ValueError('source evidence exceeds its original reservation')
        closure[str(path.relative_to(root))] = digest(path)
    if (spent >= effective['resource']['maximum_campaign_seconds']
            or sessions >= effective['resource']['maximum_model_sessions']):
        raise ValueError('the original active-time or session budget is exhausted')
    # Output contains custody and cost only, never grades or response text.
    return {'schema': 1, 'kind': 'first-instruction-import-custody-v1', 'complete': True,
        'previous_protocol_sha256': previous_sha, 'source_output': str(source.relative_to(root)),
        'stop_job': stop_job, 'completed_jobs': completed, 'source_files': closure,
        'source_allocated_bytes': allocated,
        'all_prior_allocated_bytes': allocated + protocol['source_allocated_bytes'],
        'spent_job_seconds': spent, 'attempted_model_sessions': sessions,
        'pending_answer': {'arm': arm, 'id': case_id,
            'event_sha256': hashlib.sha256(json.dumps(event, sort_keys=True, separators=(',', ':'), ensure_ascii=False).encode()).hexdigest(),
            'stdout_path': str(previous.session_output(row['sessions'][0], directory).with_suffix('.stdout').relative_to(root)),
            'receipt_sha256': digest(directory / 'receipt.json')},
        'partial_scores_computed': False, 'heldout_answers_regraded': 0, 'model_runs': 0}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    for field in ('previous-protocol', 'previous-sha', 'root', 'source', 'output'):
        parser.add_argument('--' + field, required=True)
    parser.add_argument('--stop-job', type=int, required=True)
    args = parser.parse_args()
    # Metadata/transcript authentication is separately bounded. This grants
    # no additional campaign time, model memory, generation or grading.
    import ctypes
    import ctypes.util
    import os
    import resource
    import signal
    resource.setrlimit(resource.RLIMIT_CPU, (30, 31))
    library = ctypes.CDLL(ctypes.util.find_library('proc')); began = time.monotonic(); peak = [0]
    def check(*_):
        data = ctypes.create_string_buffer(296)
        if library.proc_pid_rusage(os.getpid(), 4, data) != 0:
            raise RuntimeError('source audit physical observation unavailable')
        peak[0] = max(peak[0], int.from_bytes(data.raw[72:80], 'little'), int.from_bytes(data.raw[240:248], 'little'))
        if peak[0] > 1_000_000_000 or time.monotonic() - began > 60:
            raise RuntimeError('source audit exceeded its metadata-only resource budget')
    signal.signal(signal.SIGALRM, check); signal.setitimer(signal.ITIMER_REAL, .05, .05)
    value = audit(args.previous_protocol, args.previous_sha, args.root, args.source, args.stop_job)
    check(); signal.setitimer(signal.ITIMER_REAL, 0)
    value['audit_process_peak_bytes'] = peak[0]; value['audit_seconds'] = time.monotonic() - began
    with Path(args.output).open('x') as stream:
        json.dump(value, stream, indent=2, allow_nan=False); stream.write('\n')
    print(json.dumps({key: value[key] for key in ('complete', 'stop_job', 'spent_job_seconds',
        'attempted_model_sessions', 'source_allocated_bytes', 'partial_scores_computed', 'heldout_answers_regraded', 'model_runs')}))
