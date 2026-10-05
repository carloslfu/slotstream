#!/usr/bin/env python3
"""A separately frozen, unanswered-only continuation of a startup-interrupted study.

This is not a general retry facility. The only admitted interruption is an
unloaded native preflight refusal after a prefix of fully completed cases in
fully completed sessions. Original evidence stays immutable. No sample,
generation, grader, margin, native executable or total budget may change.
"""
import argparse
import copy
import importlib
import json
import math
from pathlib import Path
import re
import stat
import sys

import quantization_outcome_campaign as campaign
from quantization_inventory import relative_path

KIND = 'same-model-unanswered-continuation-v1'
STARTUP_FAILURE = 'RuntimeError: native session ended before expected event'
PREFLIGHT_ERROR = b'Error: session needs its physical ceiling plus three GB actual reclaimable memory\n'


def helper_pins():
    # Include graders that otherwise import lazily, before any answer exists.
    names = ('context_qualification', 'memory_gate', 'prefill_bench', 'quantization_bfcl',
             'quantization_code_sandbox', 'quantization_inventory', 'quantization_outcomes',
             'quantization_paired', 'quantization_tasks', 'quantization_outcome_campaign')
    return {name: campaign.digest(importlib.import_module(name).__file__) for name in names}


def python_identity():
    executable = importlib.import_module('quantization_code_sandbox').runtime_executable()
    return {'version': sys.version, 'executable_sha256': campaign.digest(executable)}


def seconds(value):
    if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
        raise ValueError('invalid elapsed-time evidence')
    return value


def session_output(row, directory):
    command = row['command']
    if command.count('--output') != 1:
        raise ValueError('one bound native output is required')
    path = Path(command[command.index('--output') + 1])
    if path.parent.resolve() != Path(directory).resolve() or path.is_symlink():
        raise ValueError('native output escaped its job')
    return path


def transcript(row, directory, native, protocol, *, unloaded=False):
    """Validate execution and partition a native transcript by independent case.

    No grade is computed here. This can establish custody without inspecting
    partial aggregate results or making selection depend on task outcomes.
    """
    path = session_output(row, directory)
    receipt = campaign.read(path / 'receipt.json')
    expected = [str(protocol['_root'] / protocol['paths']['binary']), 'quantization-session',
                '--baseline', str(Path(protocol['paths']['baseline']).expanduser()),
                '--protocol-file', str(protocol['_root'] / protocol['paths']['native_protocol']),
                '--protocol-sha256', protocol['native_protocol_sha256'], '--output', str(path)]
    if row['arm'] == 'candidate':
        expected += ['--control', str(protocol['_root'] / protocol['paths']['control']),
                     '--table', str(protocol['_root'] / protocol['paths']['rotary'])]
    if row['command'] != expected or any(key in row for key in ('cleanup_failure', 'startup_failure')):
        raise ValueError('native command or session execution changed')
    seconds(row['seconds'])
    if unloaded:
        if (row.get('complete') is not False or 'identity' in row or 'receipt' in row
                or receipt.get('complete') is not False or receipt.get('loaded') is not False
                or any(type(receipt.get(key)) is not int or receipt[key] != 0
                       for key in ('requests', 'resets', 'admission_refusals'))
                or path.with_suffix('.stdout').stat().st_size != 0
                or path.with_suffix('.stderr').read_bytes() != PREFLIGHT_ERROR
                or (path / 'conversation.jsonl').exists()):
            raise ValueError('interrupted native process is not an unanswered preflight refusal')
        # The display model name is published only after Engine initialization.
        # Its absence is required here; authenticate the pre-load artifact pins
        # without pretending that an Engine existed or a request ran.
        if 'model' in receipt: raise ValueError('unloaded refusal published a loaded model identity')
        identity = {**receipt, 'loaded': True, 'model': protocol['native_pins'][row['arm']]['model']}
        campaign.validate_native(identity, native, protocol['native_pins'],
                                 row['arm'], protocol['native_protocol_sha256'])
        return []
    if row.get('complete') is not True or receipt != row.get('receipt') or receipt.get('complete') is not True:
        raise ValueError('native session is incomplete or receipt changed')
    for identity in (row['identity'], receipt):
        campaign.validate_native(identity, native, protocol['native_pins'], row['arm'], protocol['native_protocol_sha256'])
    for key, maximum in (('peak_model_bytes', native['memory_bytes']),
                         ('peak_parent_bytes', protocol['resource']['maximum_parent_bytes'])):
        if type(row.get(key)) is not int or not 0 < row[key] <= maximum:
            raise ValueError('native physical observation missing or outside its budget')
    if type(receipt.get('peak_process_bytes')) is not int or not 0 < receipt['peak_process_bytes'] <= native['memory_bytes']:
        raise ValueError('native lifetime physical ceiling exceeded')
    cases = []; requests = refusals = 0; terminal = False; ready = False
    with path.with_suffix('.stdout').open('rb') as stream:
        while line := stream.readline(campaign.MAX_EVENT + 1):
            if len(line) > campaign.MAX_EVENT or not line.endswith(b'\n'):
                raise ValueError('incomplete or oversized native event')
            event = json.loads(line)
            if terminal: raise ValueError('native events after completion')
            if not ready:
                if event != {'event': 'ready', 'identity': row['identity']}:
                    raise ValueError('native ready identity changed')
                ready = True
            elif event.get('event') == 'reset':
                if event != {'event': 'reset', 'id': 'reset-' + str(len(cases) + 1)}:
                    raise ValueError('native independent-case reset changed')
                cases.append([])
            elif event.get('event') in ('response', 'admission_refusal'):
                if not cases: raise ValueError('native response before case reset')
                requests += 1
                body = event['request']
                try:
                    campaign.verify_response(event, 'call-' + str(requests), body['messages'], body.get('tools'), native)
                except campaign.outcomes.TaskBudgetExceeded:
                    refusals += 1
                cases[-1].append(event)
            elif event == {'event': 'complete', 'receipt': receipt}:
                terminal = True
            else:
                raise ValueError('unexpected native transcript event')
    if (not terminal or any(type(receipt.get(key)) is not int or receipt[key] != value
                            for key, value in [('requests', requests), ('resets', len(cases)), ('admission_refusals', refusals)])
            or requests > native['maximum_requests']):
        raise ValueError('native transcript and completion counters differ')
    return cases


def validate_job(row, job, directory, native, protocol, *, interrupted=False, imported=None):
    if row.get('job') != job or type(row.get('outcomes')) is not list or type(row.get('sessions')) is not list:
        raise ValueError('job identity or evidence shape changed')
    seconds(row['seconds'])
    if row.get('complete') is not (not interrupted) or ('failure' in row) is not interrupted:
        raise ValueError('paired job completion differs')
    if interrupted and row['failure'] != STARTUP_FAILURE:
        raise ValueError('only the preserved preflight interruption may continue')
    expected = [(arm, case) for arm in job['arms'] for case in job['ids']]
    observed = [(value['arm'], value['id']) for value in row['outcomes']]
    if (observed != expected[:len(observed)] or len(observed) > len(expected)
            or not interrupted and observed != expected or interrupted and not 0 < len(observed) < len(expected)
            or any(type(value.get('passed')) is not bool for value in row['outcomes'])):
        raise ValueError('outcomes are not the complete ordered prefix')
    inherited_sessions = inherited_outcomes = 0
    inherited_cases = []
    if imported is not None:
        source, source_directory = imported
        inherited_sessions, inherited_outcomes = len(source['sessions']), len(source['outcomes'])
        if (row['sessions'][:inherited_sessions] != source['sessions']
                or row['outcomes'][:inherited_outcomes] != source['outcomes']
                or row['seconds'] < source['seconds']):
            raise ValueError('imported evidence was changed or prior time was erased')
        inherited_cases = validate_job(source, job, source_directory, native, protocol,
                                       interrupted=source['complete'] is not True)
    cells = list(inherited_cases)
    for index, session in enumerate(row['sessions'][inherited_sessions:], inherited_sessions):
        failed = interrupted and index == len(row['sessions']) - 1
        if failed:
            if session['arm'] != expected[len(observed)][0]:
                raise ValueError('failed startup does not belong to the next unanswered arm')
            transcript(session, directory, native, protocol, unloaded=True)
        else:
            for events in transcript(session, directory, native, protocol):
                cells.append((session['arm'], events))
    if len(cells) != len(row['outcomes']):
        raise ValueError('native case coverage differs from recorded outcomes')
    for (arm, events), value in zip(cells, row['outcomes']):
        responses = [event['response'] for event in events if event['event'] == 'response']
        recorded = value.get('responses', []) if job['family'] == 'tools' else ([value['response']] if 'response' in value else [])
        if (arm != value['arm'] or responses != recorded
                or job['family'] != 'tools' and len(events) != 1
                or any(event['event'] == 'admission_refusal' for event in events[:-1])):
            raise ValueError('native answers differ from the complete recorded case')
    return cells


def validate(protocol, root):
    root = Path(root).resolve()
    if (protocol.get('schema') != 1 or protocol.get('kind') != KIND
            or protocol.get('driver_sha256') != campaign.digest(__file__)
            or protocol.get('helper_sha256') != helper_pins()
            or protocol.get('python') != python_identity()
            or protocol.get('correction') != {'release_settle_seconds': campaign.Session.RELEASE_SETTLE_SECONDS,
                                               'native_unchanged': True, 'unanswered_only': True}):
        raise ValueError('unknown continuation, changed owner or unsupported correction')
    relative_path(protocol['base_protocol']); relative_path(protocol['source_output'])
    if campaign.digest(root / protocol['base_protocol']) != protocol['base_protocol_sha256']:
        raise ValueError('original frozen protocol changed')
    base = campaign.read(root / protocol['base_protocol'])
    if 'continuation' in base or base.get('kind') != 'same-model-outcome-campaign-v1':
        raise ValueError('continuation must name the original task study')
    original_helpers = protocol['original_helpers']
    unchanged = set(protocol['helper_sha256']) - {'quantization_outcome_campaign'}
    if set(original_helpers) != unchanged:
        raise ValueError('the complete unchanged grader and resource-helper closure is required')
    for name, path in original_helpers.items():
        relative_path(path)
        if base['files'].get(path) != protocol['helper_sha256'][name]:
            raise ValueError('a grader or resource helper changed from the original study')
    effective = copy.deepcopy(base)
    # Only orchestration changes. Original native executable and all immutable
    # protocol inputs, task settings and statistical decisions are still checked.
    effective['driver_sha256'] = campaign.digest(campaign.__file__)
    tasks = campaign.read(root / base['paths']['tasks'])
    native = campaign.validate_inputs(effective, tasks, root)
    effective['_root'] = root
    files = protocol['source_files']; source = root / protocol['source_output']
    if (type(files) is not dict or not 1 <= len(files) <= 10000
            or type(protocol['stop_job']) is not int or not 0 <= protocol['stop_job'] < len(base['jobs'])):
        raise ValueError('bounded original evidence and stop position required')
    actual = {str(path.relative_to(root)) for path in source.rglob('*') if path.is_file()}
    if actual != set(files): raise ValueError('original evidence closure changed')
    total = 0
    for name, pin in files.items():
        relative_path(name); path = root / name; info = path.lstat(); total += info.st_size
        if (not stat.S_ISREG(info.st_mode) or source.resolve() not in path.resolve().parents
                or total > base['resource']['maximum_output_bytes'] or campaign.digest(path) != pin):
            raise ValueError('original evidence type, size or digest changed')
    if type(protocol['source_allocated_bytes']) is not int or protocol['source_allocated_bytes'] < campaign.allocated(source):
        raise ValueError('original receipt storage was not fully charged')
    inherited = []
    for index in range(protocol['stop_job'] + 1):
        directory = source / f'job-{index:04d}'; row = campaign.read(directory / 'receipt.json')
        if row.get('protocol_sha256') != protocol['base_protocol_sha256'] or row.get('driver_sha256') != base['driver_sha256']:
            raise ValueError('original job protocol or driver changed')
        validate_job(row, base['jobs'][index], directory, native, effective, interrupted=index == protocol['stop_job'])
        inherited.append(row)
    if sorted(p.name for p in source.glob('job-*') if p.is_dir()) != [f'job-{i:04d}' for i in range(len(inherited))]:
        raise ValueError('unregistered original job evidence')
    debt = sum(row['seconds'] for row in inherited)
    if (debt >= base['resource']['maximum_campaign_seconds']
            or sum(len(row['sessions']) for row in inherited) >= base['resource']['maximum_model_sessions']):
        raise ValueError('original active time or session budget is exhausted')
    remaining = base['resource']['maximum_output_bytes'] - protocol['source_allocated_bytes']
    if remaining <= 0: raise ValueError('original receipt budget is exhausted')
    effective['resource']['maximum_output_bytes'] = remaining
    return effective, native, tasks, inherited


def inherited_row(protocol, root, inherited, index):
    if index >= len(inherited): return None
    row = copy.deepcopy(inherited[index])
    path = Path(protocol['source_output']) / f'job-{index:04d}' / 'receipt.json'
    row['continuation_source'] = {'path': str(path), 'sha256': protocol['source_files'][str(path)],
                                  'protocol_sha256': protocol['base_protocol_sha256']}
    return row


def checked_rows(protocol, pin, root, output, effective, native, inherited, count):
    for index in range(count):
        directory = Path(output) / f'job-{index:04d}'; row = campaign.read(directory / 'receipt.json')
        source = inherited_row(protocol, root, inherited, index)
        if (row.get('protocol_sha256') != pin or row.get('driver_sha256') != effective['driver_sha256']
                or row.get('continuation_source') != (source['continuation_source'] if source else None)):
            raise ValueError('continuation receipt identity or lineage changed')
        old = (inherited[index], Path(root) / protocol['source_output'] / f'job-{index:04d}') if source else None
        cells = validate_job(row, effective['jobs'][index], directory, native, effective, imported=old)
        yield row, cells


def run_job(protocol_path, pin, root, output, index):
    if campaign.digest(protocol_path) != pin: raise ValueError('continuation protocol changed')
    protocol = campaign.read(protocol_path)
    effective, native, tasks, inherited = validate(protocol, root)
    if type(index) is not int or not 0 <= index < len(effective['jobs']):
        raise ValueError('job outside frozen continuation')
    for _ in checked_rows(protocol, pin, root, output, effective, native, inherited, index): pass
    result = campaign.execute_job(effective, pin, tasks, native, root, output, index,
                                  inherited=inherited_row(protocol, root, inherited, index))
    return result


class Replay:
    def __init__(self, events, native):
        self.events, self.native, self.used = events, native, 0

    def chat(self, messages, tools=None):
        if self.used >= len(self.events): raise ValueError('complete case replay needs an unrecorded answer')
        event = self.events[self.used]; self.used += 1
        return campaign.verify_response(event, event['id'], messages, tools, self.native)


def stable_grade(family, value):
    """Execution custody is validated separately from deterministic grading.

    The native sandbox profile includes its fresh temporary directory; the
    worker footprint is an observation, not a grade. Preserve both receipts,
    check their form/bound, and compare every other field exactly.
    """
    value = copy.deepcopy(value)
    custody = value.get('grade') if family == 'tools' else value if family in ('coding', 'instruction') else None
    if custody is not None and 'sandbox_profile_sha256' in custody:
        if re.fullmatch('[a-f0-9]{64}', custody.pop('sandbox_profile_sha256')) is None:
            raise ValueError('invalid sandbox custody digest')
    if family == 'tools' and custody is not None:
        peak = custody.pop('peak_worker_bytes')
        if type(peak) is not int or not 0 < peak <= campaign.bfcl.MAX_PHYSICAL_BYTES:
            raise ValueError('fixture worker exceeded its original physical ceiling')
    if family == 'instruction' and custody is not None and (
            custody.get('method') == 'upstream-strict-prompt' or 'peak_worker_bytes' in custody):
        peak = custody.pop('peak_worker_bytes', None)
        if type(peak) is not int or not 0 < peak <= campaign.outcomes.INSTRUCTION_PHYSICAL_LIMIT:
            raise ValueError('instruction worker exceeded its original physical ceiling')
    return value


def analyze_complete(effective, native, tasks, root, output, checked, *, instruction_grader=None):
    """Replay only a complete authenticated study, preserving worker custody."""
    instruction_grader = campaign.outcomes.isolated_instruction if instruction_grader is None else instruction_grader
    # Refuse before any regrading or summary unless the entire frozen study
    # completed. This also authenticates native counters, memory and transcripts.
    spent = sessions = 0; receipts = {}
    for index, (row, _) in enumerate(checked()):
        spent += row['seconds']; sessions += len(row['sessions'])
        path = f'job-{index:04d}/receipt.json'; receipts[path] = campaign.digest(Path(output) / path)
    if len(receipts) != len(effective['jobs']):
        raise ValueError('complete analysis requires every frozen job')
    if (spent > effective['resource']['maximum_campaign_seconds']
            or sessions > effective['resource']['maximum_model_sessions']
            or campaign.allocated(output) > effective['resource']['maximum_output_bytes']):
        raise ValueError('continuation exceeded the original aggregate resource budget')
    lookup = {family: {case['id']: case for case in cases} for family, cases in tasks.items()}
    paths = effective['paths']; pairs = []; regrade_custody = []
    with campaign.bfcl.Bundle(root / paths['bfcl_source'], root / paths['bfcl_runtime'],
                              root / paths['bfcl_manifest'], effective['files'][paths['bfcl_manifest']]) as bundle:
        for (row, cells), job in zip(checked(), effective['jobs']):
            path = f"job-{job['index']:04d}/receipt.json"
            if campaign.digest(Path(output) / path) != receipts[path]: raise ValueError('receipt changed during complete analysis')
            by_arm = {arm: {} for arm in job['arms']}
            for value, (_, events) in zip(row['outcomes'], cells):
                case = lookup[job['family']][value['id']]; replay = Replay(events, native)
                if job['family'] == 'tools':
                    grade = campaign.outcomes.tool_case(replay, case, bundle, root / paths['bfcl_source'],
                        campaign.bfcl.CLASSES, campaign.outcomes.ToolLimits(**effective['tool_limits']))
                else:
                    try:
                        response = replay.chat([{'role': 'user', 'content': case['prompt']}])
                        grade = (instruction_grader(case, response, root / paths['instruction_source'], root / paths['grader_runtime'])
                                 if job['family'] == 'instruction' else campaign.outcomes.grade(job['family'], case, response))
                        grade['response'] = response
                    except campaign.outcomes.TaskBudgetExceeded as error:
                        grade = {'passed': False, 'reason': str(error)}
                recorded = {key: item for key, item in value.items() if key not in ('arm', 'id', 'seconds')}
                if replay.used != len(events) or stable_grade(job['family'], grade) != stable_grade(job['family'], recorded):
                    raise ValueError('complete case replay differs from its recorded frozen grade')
                custody = grade.get('grade', {}) if job['family'] == 'tools' else grade if job['family'] in ('coding', 'instruction') else {}
                regrade_custody.append({'family': job['family'], 'id': value['id'], 'arm': value['arm'],
                    **{key: custody[key] for key in ('sandbox_profile_sha256', 'peak_worker_bytes') if key in custody}})
                by_arm[value['arm']][value['id']] = value['passed']
            pairs += [{'id': job['family'] + '/' + case_id, 'family': job['family'],
                       'baseline_pass': by_arm['original'][case_id], 'candidate_pass': by_arm['candidate'][case_id]} for case_id in job['ids']]
    result = campaign.stratified_mover_summary(pairs, family_weights=effective['family_weights'],
        family_margins=effective['family_margins'], overall_margin=effective['overall_margin'], alpha=effective['alpha'])
    result.update(paired_rows=pairs, campaign_scope=effective['scope'], receipts=receipts,
                  regrade_custody=regrade_custody)
    return result


def analyze(protocol_path, pin, root, output):
    if campaign.digest(protocol_path) != pin: raise ValueError('continuation protocol changed')
    protocol = campaign.read(protocol_path); root = Path(root)
    effective, native, tasks, inherited = validate(protocol, root)
    checked = lambda: checked_rows(protocol, pin, root, output, effective, native, inherited, len(effective['jobs']))
    result = analyze_complete(effective, native, tasks, root, output, checked)
    result.update(protocol_sha256=pin, original_protocol_sha256=protocol['base_protocol_sha256'],
                  scope='Frozen text/task outcomes with preserved preflight interruption. Product, memory, speed and distribution gates remain independent.')
    return result


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    for key in ('protocol', 'sha256', 'root', 'output'): parser.add_argument('--' + key, required=True)
    parser.add_argument('--job', type=int); parser.add_argument('--analyze', action='store_true')
    args = parser.parse_args()
    if args.analyze == (args.job is not None): parser.error('choose one job or final analysis')
    if args.analyze:
        print(json.dumps(analyze(args.protocol, args.sha256, args.root, args.output), ensure_ascii=False, allow_nan=False, indent=2))
    else:
        value = run_job(args.protocol, args.sha256, args.root, args.output, args.job)
        print(json.dumps({'complete': value['complete'], 'job': args.job, 'sessions': len(value['sessions']), 'seconds': value['seconds']}))
