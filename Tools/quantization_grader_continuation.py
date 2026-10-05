#!/usr/bin/env python3
"""One frozen recovery of an ungraded answer after an instruction-worker ABI failure.

No completed answer is regenerated. The previous source and its original
ancestry remain immutable. The only changed execution choice is the bound
instruction-worker interpreter; the worker's source and dependencies stay exact.
"""
import argparse
import copy
import functools
import hashlib
import json
from pathlib import Path
import signal
import stat
import subprocess
import sys
import time

import quantization_outcome_campaign as campaign
import quantization_outcome_continuation as previous
import quantization_grader_source_audit as audit
from quantization_inventory import relative_path

KIND = 'same-model-instruction-grader-recovery-v1'
CORRECTION = {'worker_interpreter_only': True, 'worker_source_unchanged': True,
    'native_unchanged': True, 'saved_answer_graded_once': True, 'unanswered_only': True,
    'instruction_footprint_is_custody': True}


def helper_pins():
    return {**previous.helper_pins(),
        'quantization_outcome_continuation': campaign.digest(previous.__file__),
        'quantization_grader_source_audit': campaign.digest(audit.__file__)}


def event_digest(event):
    return hashlib.sha256(json.dumps(event, sort_keys=True, separators=(',', ':'), ensure_ascii=False).encode()).hexdigest()


def closure(root, folder, files, maximum):
    relative_path(folder); source = root / folder
    if type(files) is not dict or not 0 < len(files) <= 10000:
        raise ValueError('bounded source closure required')
    actual = set(); total = 0
    for path in source.rglob('*'):
        info = path.lstat()
        if stat.S_ISDIR(info.st_mode): continue
        name = str(path.relative_to(root)); relative_path(name); total += info.st_size
        if (not stat.S_ISREG(info.st_mode) or total > maximum
                or source.resolve() not in path.resolve().parents
                or name not in files or campaign.digest(path) != files[name]):
            raise ValueError('source evidence type, size or digest changed')
        actual.add(name)
    if actual != set(files): raise ValueError('source evidence closure changed')


def pending_event(row, job, directory, native, effective, proof):
    event, arm = audit.interrupted_case(row, job, directory, native, effective, campaign, previous)
    path = previous.session_output(row['sessions'][0], directory).with_suffix('.stdout')
    if proof['pending_answer'] != {'arm': arm, 'id': job['ids'][0], 'event_sha256': event_digest(event),
            'stdout_path': str(path.relative_to(effective['_root'])),
            'receipt_sha256': campaign.digest(directory / 'receipt.json')}:
        raise ValueError('ungraded answer custody changed')
    return event


def validate(protocol, root):
    root = Path(root).resolve()
    if (protocol.get('schema') != 1 or protocol.get('kind') != KIND
            or protocol.get('driver_sha256') != campaign.digest(__file__)
            or protocol.get('helper_sha256') != helper_pins()
            or protocol.get('python') != previous.python_identity()
            or protocol.get('correction') != CORRECTION):
        raise ValueError('changed recovery owner, interpreter or correction')
    for key in ('previous_protocol', 'source_audit'):
        relative_path(protocol[key])
        if campaign.digest(root / protocol[key]) != protocol[key + '_sha256']:
            raise ValueError('frozen ' + key + ' changed')
    old = campaign.read(root / protocol['previous_protocol'])
    proof = campaign.read(root / protocol['source_audit'])
    if (old.get('kind') != previous.KIND or proof.get('kind') != 'first-instruction-import-custody-v1'
            or proof.get('complete') is not True or proof.get('previous_protocol_sha256') != protocol['previous_protocol_sha256']
            or proof.get('stop_job') != protocol['stop_job']
            or proof.get('partial_scores_computed') is not False or proof.get('heldout_answers_regraded') != 0
            or proof.get('model_runs') != 0):
        raise ValueError('source audit is not the preserved first-instruction failure')
    old_helpers = (root / protocol['previous_protocol']).parent / 'helpers'
    for name, pin in {**old['helper_sha256'], 'quantization_outcome_continuation': old['driver_sha256']}.items():
        relative_path(name + '.py')
        if campaign.digest(old_helpers / (name + '.py')) != pin: raise ValueError('old helper changed')
    for name, pin in old['helper_sha256'].items():
        if name not in ('quantization_outcome_campaign', 'quantization_outcomes') and helper_pins()[name] != pin:
            raise ValueError('a grader or resource helper changed beyond the declared correction')
    relative_path(old['base_protocol'])
    if campaign.digest(root / old['base_protocol']) != old['base_protocol_sha256']:
        raise ValueError('original study changed')
    effective = campaign.read(root / old['base_protocol'])
    effective['driver_sha256'] = campaign.digest(campaign.__file__)
    tasks = campaign.read(root / effective['paths']['tasks'])
    native = campaign.validate_inputs(effective, tasks, root); effective['_root'] = root
    if protocol['stop_job'] != next(j['index'] for j in effective['jobs'] if j['family'] == 'instruction'):
        raise ValueError('only the first instruction job may recover')
    for folder, files in [(old['source_output'], old['source_files']), (proof['source_output'], proof['source_files'])]:
        closure(root, folder, files, effective['resource']['maximum_output_bytes'])
    allocated = campaign.allocated(root / old['source_output']) + campaign.allocated(root / proof['source_output'])
    if (type(proof['all_prior_allocated_bytes']) is not int or proof['all_prior_allocated_bytes'] < allocated
            or proof['all_prior_allocated_bytes'] >= effective['resource']['maximum_output_bytes']):
        raise ValueError('original storage debt is missing or exhausted')
    worker = protocol['instruction_worker']; executable = Path(worker['executable'])
    relative_path(worker['source'])
    if (not executable.is_absolute() or campaign.digest(executable) != worker['executable_sha256']
            or root / worker['source'] != old_helpers / 'quantization_outcomes.py'
            or worker['source_sha256'] != old['helper_sha256']['quantization_outcomes']
            or campaign.digest(root / worker['source']) != worker['source_sha256']):
        raise ValueError('instruction worker image or unchanged source changed')
    grader = functools.partial(campaign.outcomes.isolated_instruction,
        worker_executable=executable, worker_source=root / worker['source'])
    sources = []; spent = sessions = 0
    for index in range(protocol['stop_job'] + 1):
        directory = root / proof['source_output'] / f'job-{index:04d}'
        row = campaign.read(directory / 'receipt.json'); job = effective['jobs'][index]
        if row.get('protocol_sha256') != protocol['previous_protocol_sha256'] or row.get('driver_sha256') != old['helper_sha256']['quantization_outcome_campaign']:
            raise ValueError('previous receipt identity changed')
        if index == protocol['stop_job']:
            event = pending_event(row, job, directory, native, effective, proof)
            case = next(case for case in tasks['instruction'] if case['id'] == job['ids'][0])
            response = campaign.verify_response(event, 'call-1', [{'role': 'user', 'content': case['prompt']}], None, native)
            if campaign.outcomes.terminal(response) is None: raise ValueError('pending answer is not complete')
            cells = [(proof['pending_answer']['arm'], [event])]
        else:
            imported = None
            if index <= old['stop_job']:
                original = root / old['source_output'] / f'job-{index:04d}'
                imported = (campaign.read(original / 'receipt.json'), original)
            cells = previous.validate_job(row, job, directory, native, effective, imported=imported)
        spent += previous.seconds(row['seconds']); sessions += len(row['sessions'])
        sources.append((row, cells))
    if (spent != proof['spent_job_seconds'] or sessions != proof['attempted_model_sessions']
            or spent >= effective['resource']['maximum_campaign_seconds']
            or sessions >= effective['resource']['maximum_model_sessions']):
        raise ValueError('original time or session debt changed or exhausted')
    effective['resource']['maximum_output_bytes'] -= proof['all_prior_allocated_bytes']
    return effective, native, tasks, sources, proof, grader


def recover_answer(protocol, pin, effective, tasks, sources, proof, grader, output):
    """One grading attempt, durably marked before invocation; never starts a model."""
    path = output / 'recovered-answer.json'
    began = time.monotonic()
    receipt = {'schema': 1, 'complete': False, 'protocol_sha256': pin,
        'pending_answer': proof['pending_answer'], 'model_runs': 0}
    with path.open('x') as stream: json.dump(receipt, stream)
    try:
        paths = effective['paths']; root = effective['_root']
        receipt['instruction_preflight'] = campaign.outcomes.preflight_instruction(grader,
            root / paths['instruction_source'], root / paths['grader_runtime'])
        event = sources[-1][1][0][1][0]
        case = next(case for case in tasks['instruction'] if case['id'] == proof['pending_answer']['id'])
        started = time.monotonic()
        value = grader(case, event['response'], root / paths['instruction_source'], root / paths['grader_runtime'])
        previous.stable_grade('instruction', value)
        receipt['outcome'] = {**value, 'response': event['response'], 'arm': proof['pending_answer']['arm'],
            'id': case['id'], 'seconds': time.monotonic() - started}
        receipt['complete'] = True
    except BaseException as error:
        receipt['failure'] = type(error).__name__ + ': ' + str(error)
        raise
    finally:
        receipt['seconds'] = time.monotonic() - began; campaign.write(path, receipt)


def inherited_row(protocol, pin, root, output, sources, proof, index):
    if index >= len(sources): return None
    row = copy.deepcopy(sources[index][0])
    path = Path(proof['source_output']) / f'job-{index:04d}' / 'receipt.json'
    row['continuation_source'] = {'path': str(path), 'sha256': proof['source_files'][str(path)],
        'protocol_sha256': protocol['previous_protocol_sha256']}
    if index == protocol['stop_job']:
        receipt = campaign.read(output / 'recovered-answer.json')
        event = sources[index][1][0][1][0]
        value = receipt.get('outcome', {})
        if (receipt.get('complete') is not True or receipt.get('protocol_sha256') != pin
                or receipt.get('pending_answer') != proof['pending_answer'] or receipt.get('model_runs') != 0
                or 'failure' in receipt or type(value.get('passed')) is not bool
                or value.get('response') != event['response']
                or (value.get('arm'), value.get('id')) != (proof['pending_answer']['arm'], proof['pending_answer']['id'])):
            raise ValueError('saved-answer grading receipt changed or failed')
        previous.stable_grade('instruction', value)
        row['outcomes'] = [value]; row['seconds'] += previous.seconds(receipt['seconds'])
        row['continuation_source']['recovery_sha256'] = campaign.digest(output / 'recovered-answer.json')
    return row


def checked_rows(protocol, pin, root, output, effective, native, sources, proof, count):
    for index in range(count):
        directory = output / f'job-{index:04d}'; row = campaign.read(directory / 'receipt.json')
        job = effective['jobs'][index]; source = inherited_row(protocol, pin, root, output, sources, proof, index)
        if (row.get('protocol_sha256') != pin or row.get('driver_sha256') != effective['driver_sha256']
                or row.get('complete') is not True or 'failure' in row or row.get('job') != job
                or row.get('continuation_source') != (source['continuation_source'] if source else None)):
            raise ValueError('recovery receipt identity, completion or lineage changed')
        previous.seconds(row['seconds'])
        cells = []; inherited_sessions = 0
        if source:
            inherited_sessions = len(source['sessions'])
            if (row['sessions'][:inherited_sessions] != source['sessions']
                    or row['outcomes'][:len(source['outcomes'])] != source['outcomes']
                    or row['seconds'] < source['seconds']):
                raise ValueError('prior evidence or resource debt was changed')
            cells = list(sources[index][1])
        for session in row['sessions'][inherited_sessions:]:
            cells += [(session['arm'], events) for events in previous.transcript(session, directory, native, effective)]
        if ([(v['arm'], v['id']) for v in row['outcomes']] != [(arm, case) for arm in job['arms'] for case in job['ids']]
                or len(cells) != len(row['outcomes']) or any(type(v.get('passed')) is not bool for v in row['outcomes'])):
            raise ValueError('recovery does not cover every ordered case exactly once')
        for (arm, events), value in zip(cells, row['outcomes']):
            responses = [e['response'] for e in events if e['event'] == 'response']
            recorded = value.get('responses', []) if job['family'] == 'tools' else ([value['response']] if 'response' in value else [])
            if (arm != value['arm'] or responses != recorded or job['family'] != 'tools' and len(events) != 1
                    or any(e['event'] == 'admission_refusal' for e in events[:-1])):
                raise ValueError('native answer coverage changed')
        yield row, cells


def load(path, pin, root):
    if campaign.digest(path) != pin: raise ValueError('recovery protocol changed')
    protocol = campaign.read(path)
    return protocol, validate(protocol, root)


def run_job(path, pin, root, output, index):
    root = Path(root).resolve(); output = Path(output).resolve()
    protocol, (effective, native, tasks, sources, proof, grader) = load(path, pin, root)
    if type(index) is not int or not 0 <= index < len(effective['jobs']): raise ValueError('job outside frozen recovery')
    for _ in checked_rows(protocol, pin, root, output, effective, native, sources, proof, index): pass
    if index == protocol['stop_job']:
        # Even if this attempt fails, exclusive creation prevents a second
        # grading attempt or replacement of its failure evidence.
        recover_answer(protocol, pin, effective, tasks, sources, proof, grader, output)
    source = inherited_row(protocol, pin, root, output, sources, proof, index)
    return campaign.execute_job(effective, pin, tasks, native, root, output, index,
        inherited=source, instruction_grader=grader)


def analyze(path, pin, root, output):
    root = Path(root).resolve(); output = Path(output).resolve()
    protocol, (effective, native, tasks, sources, proof, grader) = load(path, pin, root)
    coordinator = campaign.read(output / 'coordinator.json')
    expected = [{'index': j['index'], 'receipt_sha256': campaign.digest(output / f"job-{j['index']:04d}/receipt.json")}
                for j in effective['jobs']]
    if (coordinator.get('complete') is not True or coordinator.get('protocol_sha256') != pin
            or coordinator.get('driver_sha256') != protocol['driver_sha256']
            or coordinator.get('completed_jobs') != expected or 'failure' in coordinator):
        raise ValueError('complete coordinator required before any final replay')
    checked = lambda: checked_rows(protocol, pin, root, output, effective, native, sources, proof, len(effective['jobs']))
    result = previous.analyze_complete(effective, native, tasks, root, output, checked, instruction_grader=grader)
    old = campaign.read(root / protocol['previous_protocol'])
    result.update(protocol_sha256=pin, previous_protocol_sha256=protocol['previous_protocol_sha256'],
        original_protocol_sha256=old['base_protocol_sha256'], source_audit_sha256=protocol['source_audit_sha256'],
        recovery_receipt_sha256=campaign.digest(output / 'recovered-answer.json'),
        scope='Complete frozen text/task outcomes, preserving prior execution failures. Product, speed, memory and distribution gates are independent.')
    return result


def coordinate(path, pin, root, output):
    protocol, (effective, _, _, _, _, _) = load(path, pin, root)
    output = Path(output); output.mkdir(exist_ok=False)
    row = {'schema': 1, 'complete': False, 'qualification': False, 'protocol_sha256': pin,
        'driver_sha256': protocol['driver_sha256'], 'completed_jobs': []}
    child = None; began = time.monotonic()
    def save():
        row['seconds'] = time.monotonic() - began; campaign.write(output / 'coordinator.json', row)
    def stop(*_): raise KeyboardInterrupt('recovery coordinator interrupted')
    signal.signal(signal.SIGTERM, stop); signal.signal(signal.SIGINT, stop)
    try:
        save()
        for job in effective['jobs']:
            index = job['index']; row['active_job'] = index; save()
            command = [sys.executable, str(Path(__file__).resolve()), '--protocol', str(path), '--sha256', pin,
                '--root', str(root), '--output', str(output), '--job', str(index)]
            with (output / f'job-{index:04d}.driver.log').open('xb') as stream:
                child = subprocess.Popen(command, stdout=stream, stderr=subprocess.STDOUT, start_new_session=True)
                code = child.wait()
            child = None
            if code: raise RuntimeError('recovery job failed; preserve evidence and do not retry: ' + str(index))
            receipt = output / f'job-{index:04d}/receipt.json'
            if campaign.read(receipt).get('complete') is not True: raise RuntimeError('incomplete recovery job')
            row['completed_jobs'].append({'index': index, 'receipt_sha256': campaign.digest(receipt)})
            save(); print(json.dumps({'complete_job': index, 'total_jobs': len(effective['jobs'])}), flush=True)
        row.pop('active_job'); row['complete'] = True; save()
    except BaseException as error:
        row['failure'] = type(error).__name__ + ': ' + str(error)
        try:
            if child is not None and child.poll() is None: campaign.terminate_child_tree(child)
        finally: save()
        raise


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    for key in ('protocol', 'sha256', 'root', 'output'): parser.add_argument('--' + key, required=True)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--job', type=int); mode.add_argument('--analyze', action='store_true'); mode.add_argument('--coordinate', action='store_true')
    args = parser.parse_args()
    if args.coordinate: coordinate(args.protocol, args.sha256, args.root, args.output)
    elif args.analyze: print(json.dumps(analyze(args.protocol, args.sha256, args.root, args.output), indent=2, allow_nan=False))
    else:
        value = run_job(args.protocol, args.sha256, args.root, args.output, args.job)
        print(json.dumps({'complete': value['complete'], 'job': args.job, 'sessions': len(value['sessions'])}))
