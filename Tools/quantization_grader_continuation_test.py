import copy
import json
from pathlib import Path
import shutil
import tempfile
import time
import unittest
from unittest.mock import patch

import quantization_grader_continuation as q
import quantization_outcome_campaign as campaign
import quantization_outcome_continuation as previous
import quantization_outcome_continuation_test as fixtures
import quantization_outcome_campaign_test as campaign_fixtures
from quantization_code_sandbox import runtime_executable


def synthetic_grader(case, response, *args, **kwargs):
    passed = response['choices'][0]['message']['content'] != 'synthetic worker check.'
    return {'passed': passed, 'instructions': [passed], 'method': 'upstream-strict-prompt', 'peak_worker_bytes': 1000}


class GraderRecoveryTests(unittest.TestCase):
    def fixture(self, directory):
        helper = fixtures.ContinuationTests()
        root, old, base, native, tasks, _ = helper.fixture(directory)
        tasks['instruction'] = [{'id': key, 'prompt': 'synthetic ' + key} for key in ('c', 'd')]
        campaign.write(root / 'tasks.json', tasks)
        base['files']['tasks.json'] = campaign.digest(root / 'tasks.json')
        base['paths'].update(instruction_source='instruction', grader_runtime='packages')
        base['sample_counts']['instruction'] = 2; base['task_ids']['instruction'] = ['c', 'd']
        base['pilot_exclusions']['instruction'] = []
        base['family_weights'] = {'facts': .5, 'instruction': .5}; base['family_margins']['instruction'] = .05
        base['resource']['maximum_model_sessions'] = 8
        job = {'index': 1, 'family': 'instruction', 'ids': ['c', 'd'], 'arms': ['candidate', 'original']}
        base['jobs'].append(job); campaign.write(root / 'base.json', base)
        old['base_protocol_sha256'] = campaign.digest(root / 'base.json')
        path = root / 'old/job-0000/receipt.json'; value = campaign.read(path)
        value['protocol_sha256'] = old['base_protocol_sha256']; campaign.write(path, value)
        helper.refreeze(root, old)
        with patch.object(campaign.outcomes, 'isolated_instruction', synthetic_grader):
            helper.execute_fixture(root, old, native, tasks)
        old_path = root / 'continuation.json'; old_sha = campaign.digest(old_path)
        effective = copy.deepcopy(base); effective['_root'] = root
        directory = root / 'new/job-0001'; directory.mkdir()
        arm = job['arms'][0]
        session, _ = helper.native_session(directory / ('session-000-' + arm), arm, tasks['instruction'][:1], effective, native)
        receipt = session.pop('receipt'); receipt['complete'] = False
        campaign.write(directory / ('session-000-' + arm) / 'receipt.json', receipt)
        session.update(complete=False, exit_code=-15, release_settle_seconds=1.06)
        stdout = directory / ('session-000-' + arm + '.stdout')
        events = stdout.read_text().splitlines(); stdout.write_text('\n'.join(events[:-1]) + '\n')
        event = json.loads(events[2])
        row = {'schema': 1, 'job': job, 'complete': False, 'qualification': False,
            'protocol_sha256': old_sha, 'driver_sha256': base['driver_sha256'], 'seconds': 3., 'sessions': [session], 'outcomes': [],
            'failure': 'RuntimeError: instruction grader infrastructure failed: Traceback (most recent call last):\n import nltk'}
        campaign.write(directory / 'receipt.json', row)
        first = campaign.read(root / 'new/job-0000/receipt.json')
        proof = {'kind': 'first-instruction-import-custody-v1', 'complete': True,
            'previous_protocol_sha256': old_sha, 'stop_job': 1, 'partial_scores_computed': False,
            'heldout_answers_regraded': 0, 'model_runs': 0, 'source_output': 'new',
            'source_files': {str(p.relative_to(root)): campaign.digest(p) for p in (root / 'new').rglob('*') if p.is_file()},
            'all_prior_allocated_bytes': campaign.allocated(root / 'new') + old['source_allocated_bytes'],
            'spent_job_seconds': first['seconds'] + row['seconds'],
            'attempted_model_sessions': len(first['sessions']) + 1,
            'pending_answer': {'arm': arm, 'id': 'c', 'event_sha256': q.event_digest(event),
                'stdout_path': str(stdout.relative_to(root)), 'receipt_sha256': campaign.digest(directory / 'receipt.json')}}
        campaign.write(root / 'audit.json', proof)
        (root / 'helpers').mkdir()
        for name in [*old['helper_sha256'], 'quantization_outcome_continuation']:
            shutil.copyfile(Path(q.__file__).parent / (name + '.py'), root / 'helpers' / (name + '.py'))
        protocol = {'schema': 1, 'kind': q.KIND, 'driver_sha256': campaign.digest(q.__file__),
            'helper_sha256': q.helper_pins(), 'python': previous.python_identity(), 'correction': q.CORRECTION,
            'previous_protocol': 'continuation.json', 'previous_protocol_sha256': old_sha,
            'source_audit': 'audit.json', 'source_audit_sha256': campaign.digest(root / 'audit.json'), 'stop_job': 1,
            'instruction_worker': {'executable': str(runtime_executable()), 'executable_sha256': campaign.digest(runtime_executable()),
                'source': 'helpers/quantization_outcomes.py', 'source_sha256': old['helper_sha256']['quantization_outcomes']}}
        campaign.write(root / 'recovery.json', protocol)
        return root, protocol, native, tasks

    def execute(self, root, protocol, native, tasks):
        calls = []; helper = fixtures.ContinuationTests()
        class Session:
            RELEASE_SETTLE_SECONDS = campaign.Session.RELEASE_SETTLE_SECONDS
            def __init__(self, command, output, native, effective, arm, row, **kwargs):
                self.started = time.monotonic(); self.output = output; self.native = native
                self.effective, self.arm, self.row, self.cases = effective, arm, row, []
            def reset(self): pass
            def chat(self, messages):
                case = next(c for c in tasks['instruction'] if c['prompt'] == messages[0]['content'])
                self.cases.append(case); calls.append((self.arm, case['id']))
                return campaign_fixtures.CampaignTests().response(native, messages)['response']
            def finish(self):
                helper.native_session(self.output, self.arm, self.cases, self.effective, self.native, external_row=self.row)
            def close(self): pass
        pin = campaign.digest(root / 'recovery.json'); output = root / 'recovery'
        with patch.object(campaign, 'Session', Session), patch.object(campaign.bfcl, 'Bundle', fixtures.EmptyBundle), \
                patch.object(campaign.outcomes, 'isolated_instruction', synthetic_grader):
            for index in range(2): q.run_job(root / 'recovery.json', pin, root, output, index)
        campaign.write(output / 'coordinator.json', {'complete': True, 'protocol_sha256': pin,
            'driver_sha256': protocol['driver_sha256'], 'completed_jobs': [
                {'index': i, 'receipt_sha256': campaign.digest(output / f'job-{i:04d}/receipt.json')} for i in range(2)]})
        return output, pin, calls

    def test_saved_answer_survives_and_only_unanswered_cases_generate(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, native, tasks = self.fixture(directory)
            output, pin, calls = self.execute(root, protocol, native, tasks)
            self.assertEqual(calls, [('candidate', 'd'), ('original', 'c'), ('original', 'd')])
            old = campaign.read(root / 'new/job-0001/receipt.json')
            row = campaign.read(output / 'job-0001/receipt.json')
            self.assertEqual(row['sessions'][0], old['sessions'][0])
            self.assertGreater(row['seconds'], old['seconds'])
            self.assertEqual(len(row['outcomes']), 4)
            with patch.object(campaign.bfcl, 'Bundle', fixtures.EmptyBundle), patch.object(campaign.outcomes, 'isolated_instruction', synthetic_grader):
                result = q.analyze(root / 'recovery.json', pin, root, output)
            self.assertEqual(len(result['paired_rows']), 4)
            instruction = [x for x in result['regrade_custody'] if x['family'] == 'instruction']
            self.assertEqual(len(instruction), 4)
            self.assertTrue(all(x['peak_worker_bytes'] == 1000 for x in instruction))
            with self.assertRaises(FileExistsError): q.run_job(root / 'recovery.json', pin, root, output, 1)

    def test_mutated_source_worker_or_cost_refuses_before_new_work(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, _, _ = self.fixture(directory)
            q.validate(protocol, root)
            for edit in [lambda p: p.update(stop_job=0), lambda p: p.update(correction={}),
                         lambda p: p['instruction_worker'].update(executable_sha256='a'*64),
                         lambda p: p['instruction_worker'].update(source='helpers/quantization_tasks.py')]:
                changed = copy.deepcopy(protocol); edit(changed)
                with self.assertRaises(ValueError): q.validate(changed, root)
            proof = campaign.read(root / 'audit.json'); proof['spent_job_seconds'] = 0
            campaign.write(root / 'audit.json', proof); protocol['source_audit_sha256'] = campaign.digest(root / 'audit.json')
            with self.assertRaisesRegex(ValueError, 'debt'): q.validate(protocol, root)

    def test_recovery_grade_failure_is_durable_and_never_retried(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, _, _ = self.fixture(directory); output = root / 'recover-failure'; output.mkdir()
            effective, _, tasks, sources, proof, _ = q.validate(protocol, root)
            attempts = []
            def fail(*args): attempts.append(1); raise RuntimeError('synthetic worker infrastructure failure')
            with self.assertRaisesRegex(RuntimeError, 'infrastructure'):
                q.recover_answer(protocol, 'pin', effective, tasks, sources, proof, fail, output)
            with self.assertRaises(FileExistsError):
                q.recover_answer(protocol, 'pin', effective, tasks, sources, proof, fail, output)
            self.assertEqual(len(attempts), 1)
            receipt = campaign.read(output / 'recovered-answer.json')
            self.assertFalse(receipt['complete']); self.assertNotIn('outcome', receipt)

    def test_partial_completion_never_replays_any_grade(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, _, _ = self.fixture(directory); output = root / 'incomplete'; output.mkdir()
            campaign.write(output / 'coordinator.json', {'complete': False})
            with patch.object(campaign.outcomes, 'grade', side_effect=AssertionError('no partial grading')), \
                    patch.object(campaign.outcomes, 'isolated_instruction', side_effect=AssertionError('no partial grading')):
                with self.assertRaises((ValueError, FileNotFoundError)):
                    q.analyze(root / 'recovery.json', campaign.digest(root / 'recovery.json'), root, output)

    def test_changed_recovery_or_regenerated_prefix_is_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, native, tasks = self.fixture(directory)
            output, pin, _ = self.execute(root, protocol, native, tasks)
            effective, native, _, sources, proof, _ = q.validate(protocol, root)
            check = lambda: list(q.checked_rows(protocol, pin, root, output, effective, native, sources, proof, 2))
            check()
            path = output / 'recovered-answer.json'; receipt = campaign.read(path)
            changed = copy.deepcopy(receipt); changed['outcome']['response']['choices'][0]['message']['content'] = 'replacement'
            campaign.write(path, changed)
            with self.assertRaisesRegex(ValueError, 'grading receipt'): check()
            campaign.write(path, receipt)
            path = output / 'job-0001/receipt.json'; row = campaign.read(path)
            for edit in [lambda r: r['outcomes'].reverse(), lambda r: r['sessions'].pop(0),
                         lambda r: r.update(seconds=0), lambda r: r['outcomes'][0].update(passed=False),
                         lambda r: r['continuation_source'].update(recovery_sha256='0'*64)]:
                changed = copy.deepcopy(row); edit(changed); campaign.write(path, changed)
                with self.assertRaises(ValueError): check()

    def test_coordinator_stops_on_first_failure_and_never_replaces_run(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); output = root / 'run'; calls = []
            class Child:
                def __init__(self, command, **kwargs): calls.append(command)
                def wait(self): return 1
                def poll(self): return 1
            state = ({'driver_sha256': 'driver'}, ({'jobs': [{'index': 0}, {'index': 1}]}, None, None, None, None, None))
            with patch.object(q, 'load', return_value=state), patch.object(q.subprocess, 'Popen', Child), patch.object(q.signal, 'signal'):
                with self.assertRaisesRegex(RuntimeError, 'preserve evidence'):
                    q.coordinate(root / 'protocol.json', 'pin', root, output)
                with self.assertRaises(FileExistsError):
                    q.coordinate(root / 'protocol.json', 'pin', root, output)
            self.assertEqual(len(calls), 1)
            record = campaign.read(output / 'coordinator.json')
            self.assertFalse(record['complete']); self.assertEqual(record['active_job'], 0)
            self.assertEqual(record['completed_jobs'], [])


if __name__ == '__main__': unittest.main()
