import copy
import json
from pathlib import Path
import tempfile
import time
import unittest
from unittest.mock import patch

import quantization_outcome_campaign as campaign
import quantization_outcome_continuation as q
import quantization_outcome_campaign_test as fixtures


class EmptyBundle:
    def __init__(self, *args): pass
    def __enter__(self): return self
    def __exit__(self, *args): pass


class ContinuationTests(unittest.TestCase):
    def fixture(self, directory, *, prior=False):
        root = Path(directory).resolve(); helper = fixtures.CampaignTests()
        base, _, native = helper.fixture(root)
        ids = ['p', 'q', 'a', 'b'] if prior else ['a', 'b']
        tasks = {'facts': [{'id': key, 'prompt': 'Question ' + key, 'answer': '5'} for key in ids]}
        campaign.write(root / 'tasks.json', tasks)
        base.update(task_ids={'facts': ids}, sample_counts={'facts': len(ids)}, pilot_exclusions={'facts': []},
                    jobs=[{'index': i, 'family': 'facts', 'ids': ids[i*2:i*2+2],
                           'arms': ['candidate', 'original'] if i % 2 else ['original', 'candidate']} for i in range(len(ids)//2)],
                    family_weights={'facts': 1.}, family_margins={'facts': .05})
        base['resource']['maximum_model_sessions'] = 2 * len(ids)
        for arm in ('original', 'candidate'): base['native_pins'][arm]['model'] = 'fixture-' + arm
        base['paths'].update(baseline=str(root / 'baseline'), control='control', rotary='rotary', bfcl_source='source', bfcl_runtime='runtime')
        base['files']['tasks.json'] = campaign.digest(root / 'tasks.json')
        original_helpers = {}
        (root / 'old-helpers').mkdir()
        for name, pin in q.helper_pins().items():
            path = 'old-helpers/' + name + '.py'
            (root / path).write_bytes(Path(q.importlib.import_module(name).__file__).read_bytes())
            base['files'][path] = pin
            if name != 'quantization_outcome_campaign': original_helpers[name] = path
        campaign.write(root / 'base.json', base); base_sha = campaign.digest(root / 'base.json')
        directory = root / f'old/job-{int(prior):04d}'; directory.mkdir(parents=True)
        effective = copy.deepcopy(base); effective['_root'] = root
        job = base['jobs'][int(prior)]; arm_a, arm_b = job['arms']; selected = tasks['facts'][-2:]
        original, first = self.native_session(directory / ('session-000-' + arm_a), arm_a, selected, effective, native)
        candidate, second = self.native_session(directory / ('session-001-' + arm_b), arm_b, selected[:1], effective, native)
        failed, _ = self.native_session(directory / ('session-002-' + arm_b), arm_b, [], effective, native, failed=True)
        row = {'schema': 1, 'complete': False, 'qualification': False, 'driver_sha256': base['driver_sha256'],
               'protocol_sha256': base_sha, 'job': job, 'seconds': 15., 'sessions': [original, candidate, failed],
               'outcomes': first + second, 'failure': q.STARTUP_FAILURE}
        campaign.write(directory / 'receipt.json', row)
        (directory.parent / (directory.name + '.driver.log')).write_text('preserved driver events\n')
        if prior:
            prior_directory = root / 'old/job-0000'; prior_directory.mkdir()
            prior_row = {'schema': 1, 'complete': True, 'qualification': False, 'driver_sha256': base['driver_sha256'],
                         'protocol_sha256': base_sha, 'job': base['jobs'][0], 'seconds': 5., 'sessions': [], 'outcomes': []}
            for arm in base['jobs'][0]['arms']:
                session, values = self.native_session(prior_directory / arm, arm, tasks['facts'][:2], effective, native)
                prior_row['sessions'].append(session); prior_row['outcomes'] += values
            campaign.write(prior_directory / 'receipt.json', prior_row)
        protocol = {'schema': 1, 'kind': q.KIND, 'driver_sha256': campaign.digest(q.__file__),
                    'helper_sha256': q.helper_pins(), 'original_helpers': original_helpers, 'python': q.python_identity(),
                    'correction': {'release_settle_seconds': campaign.Session.RELEASE_SETTLE_SECONDS,
                                   'native_unchanged': True, 'unanswered_only': True},
                    'base_protocol': 'base.json', 'base_protocol_sha256': base_sha, 'source_output': 'old', 'stop_job': int(prior)}
        self.refreeze(root, protocol)
        return root, protocol, base, native, tasks, row

    def refreeze(self, root, protocol):
        protocol['source_files'] = {str(p.relative_to(root)): campaign.digest(p) for p in (root / 'old').rglob('*') if p.is_file()}
        protocol['source_allocated_bytes'] = campaign.allocated(root / 'old')
        campaign.write(root / 'continuation.json', protocol)
        return campaign.digest(root / 'continuation.json')

    def native_session(self, path, arm, cases, protocol, native, *, failed=False, external_row=None):
        path.mkdir(); helper = fixtures.CampaignTests(); identity = helper.native_identity(protocol, native)
        identity.update(protocol['native_pins'][arm])
        if arm == 'candidate': identity.pop('manifest_sha256')
        command = [str(protocol['_root'] / protocol['paths']['binary']), 'quantization-session', '--baseline', protocol['paths']['baseline'],
                   '--protocol-file', str(protocol['_root'] / protocol['paths']['native_protocol']), '--protocol-sha256', protocol['native_protocol_sha256'], '--output', str(path)]
        if arm == 'candidate': command += ['--control', str(protocol['_root'] / protocol['paths']['control']), '--table', str(protocol['_root'] / protocol['paths']['rotary'])]
        row = external_row if external_row is not None else {}
        row.update(arm=arm, complete=not failed, seconds=1., command=command)
        receipt = {**identity, 'loaded': not failed, 'complete': not failed, 'requests': len(cases),
                   'resets': len(cases), 'admission_refusals': 0, 'peak_process_bytes': 1000}
        if failed: receipt.pop('model')
        campaign.write(path / 'receipt.json', receipt)
        events = [{'event': 'ready', 'identity': identity}]; outcomes = []
        for index, case in enumerate(cases, 1):
            event = helper.response(native, [{'role': 'user', 'content': case['prompt']}]); event['id'] = 'call-' + str(index)
            events += [{'event': 'reset', 'id': 'reset-' + str(index)}, event]
            outcomes.append({'arm': arm, 'id': case['id'], 'seconds': 1., 'passed': True, 'method': 'exact-option', 'response': event['response']})
        if failed:
            path.with_suffix('.stdout').write_bytes(b''); path.with_suffix('.stderr').write_bytes(q.PREFLIGHT_ERROR)
        else:
            row.update(identity=identity, receipt=receipt, peak_model_bytes=1000, peak_parent_bytes=1000)
            events.append({'event': 'complete', 'receipt': receipt})
            path.with_suffix('.stdout').write_text(''.join(json.dumps(x) + '\n' for x in events))
            path.with_suffix('.stderr').write_text('')
        return row, outcomes

    def execute_fixture(self, root, protocol, native, tasks, *, fail=False, index=0):
        calls = []; test = self
        class Session:
            RELEASE_SETTLE_SECONDS = campaign.Session.RELEASE_SETTLE_SECONDS
            def __init__(self, command, output, native, effective, arm, row, **kwargs):
                self.started = time.monotonic(); self.output = output; self.native = native
                self.effective, self.arm, self.row, self.cases = effective, arm, row, []
                calls.append((arm, kwargs))
                if fail: raise RuntimeError('simulated next-session refusal')
            def reset(self): pass
            def chat(self, messages):
                case = next(x for x in tasks['facts'] if x['prompt'] == messages[0]['content'])
                self.cases.append(case); calls.append(case['id'])
                return fixtures.CampaignTests().response(native, messages)['response']
            def finish(self):
                test.native_session(self.output, self.arm, self.cases, self.effective, self.native, external_row=self.row)
            def close(self): pass
        with patch.object(campaign, 'Session', Session), patch.object(campaign.bfcl, 'Bundle', EmptyBundle):
            value = q.run_job(root / 'continuation.json', campaign.digest(root / 'continuation.json'), root, root / 'new', index)
        return value, calls

    def test_only_unanswered_cell_executes_and_all_prior_costs_and_evidence_survive(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, base, native, tasks, old = self.fixture(directory)
            effective, _, _, _ = q.validate(protocol, root)
            self.assertEqual(effective['resource']['maximum_output_bytes'], base['resource']['maximum_output_bytes'] - protocol['source_allocated_bytes'])
            value, calls = self.execute_fixture(root, protocol, native, tasks)
            self.assertEqual([x for x in calls if isinstance(x, str)], ['b'])
            self.assertEqual(calls[0][0], 'candidate')
            self.assertGreaterEqual(value['seconds'], old['seconds'])
            self.assertEqual(value['outcomes'][:3], old['outcomes'])
            self.assertEqual(value['sessions'][:3], old['sessions'])
            self.assertEqual(len(value['sessions']), base['resource']['maximum_model_sessions'])
            with patch.object(campaign.bfcl, 'Bundle', EmptyBundle):
                result = q.analyze(root / 'continuation.json', campaign.digest(root / 'continuation.json'), root, root / 'new')
            self.assertEqual(len(result['paired_rows']), 2)
            self.assertEqual(result['original_protocol_sha256'], protocol['base_protocol_sha256'])
            with self.assertRaises(FileExistsError): self.execute_fixture(root, protocol, native, tasks)

    def test_partial_answers_cannot_be_analyzed_or_regraded(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, _, _, _, _ = self.fixture(directory)
            with patch.object(campaign.outcomes, 'grade', side_effect=AssertionError('no partial regrading')):
                with self.assertRaises(FileNotFoundError): q.analyze(root / 'continuation.json', campaign.digest(root / 'continuation.json'), root, root / 'new')

    def test_whole_completed_jobs_import_without_a_model_and_keep_cumulative_cost(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, base, native, tasks, old = self.fixture(directory, prior=True)
            first, calls = self.execute_fixture(root, protocol, native, tasks)
            self.assertEqual(calls, [])
            self.assertGreaterEqual(first['seconds'], 5)
            last, calls = self.execute_fixture(root, protocol, native, tasks, index=1)
            self.assertEqual(calls[0][0], 'original'); self.assertEqual(calls[1:], ['b'])
            self.assertLess(calls[0][1]['campaign_deadline'] - time.monotonic(), base['resource']['maximum_campaign_seconds'] - 20)
            self.assertEqual(last['outcomes'][:3], old['outcomes'])
            with patch.object(campaign.bfcl, 'Bundle', EmptyBundle):
                result = q.analyze(root / 'continuation.json', campaign.digest(root / 'continuation.json'), root, root / 'new')
            self.assertEqual(len(result['paired_rows']), 4)

    def test_exhausted_original_active_time_refuses_before_any_continuation(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, base, _, _, old = self.fixture(directory)
            old['seconds'] = base['resource']['maximum_campaign_seconds']
            campaign.write(root / 'old/job-0000/receipt.json', old); self.refreeze(root, protocol)
            with self.assertRaisesRegex(ValueError, 'budget is exhausted'): q.validate(protocol, root)

    def test_changed_omitted_extra_and_mutated_source_files_are_refused(self):
        for change in ('omit', 'extra', 'mutate', 'symlink'):
            with tempfile.TemporaryDirectory() as directory:
                root, protocol, _, _, _, _ = self.fixture(directory)
                path = root / 'old/job-0000/session-002-candidate.stderr'
                if change == 'omit': protocol['source_files'].pop(str(path.relative_to(root)))
                elif change == 'extra': (root / 'old/unregistered').write_text('extra')
                elif change == 'mutate': path.write_text('different reason')
                else:
                    data = path.read_bytes(); path.unlink(); (root / 'elsewhere').write_bytes(data); path.symlink_to(root / 'elsewhere')
                with self.assertRaises(ValueError): q.validate(protocol, root)

    def test_continuation_cannot_replace_native_grading_or_prior_budget(self):
        edits = [lambda p: p['correction'].update(native_unchanged=False),
                 lambda p: p['python'].update(executable_sha256='0' * 64),
                 lambda p: p['helper_sha256'].update(quantization_outcomes='0' * 64),
                 lambda p: p['original_helpers'].pop('quantization_outcomes'),
                 lambda p: p.update(source_allocated_bytes=0), lambda p: p.update(stop_job=1)]
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, _, _, _, _ = self.fixture(directory)
            for edit in edits:
                altered = copy.deepcopy(protocol); edit(altered)
                with self.assertRaises(ValueError): q.validate(altered, root)

    def test_loaded_or_answered_failure_and_missing_completed_cases_cannot_continue(self):
        for mode in ('loaded', 'reset', 'answer', 'missing', 'reordered'):
            with tempfile.TemporaryDirectory() as directory:
                root, protocol, _, _, _, old = self.fixture(directory)
                path = root / 'old/job-0000/session-002-candidate/receipt.json'; value = campaign.read(path)
                if mode == 'loaded': value['loaded'] = True
                elif mode == 'reset': value['resets'] = 1
                elif mode == 'answer': (path.parent / 'conversation.jsonl').write_text('answered')
                elif mode == 'missing': old['outcomes'].pop()
                else: old['outcomes'].reverse()
                campaign.write(path, value); campaign.write(root / 'old/job-0000/receipt.json', old); self.refreeze(root, protocol)
                with self.assertRaises(ValueError): q.validate(protocol, root)

    def test_native_counters_memory_and_answers_are_authenticated(self):
        for edit in (lambda x: x['sessions'][0]['receipt'].update(requests=99),
                     lambda x: x['sessions'][0].update(peak_model_bytes=14_000_000_001),
                     lambda x: x['outcomes'][0]['response']['choices'][0]['message'].update(content='different')):
            with tempfile.TemporaryDirectory() as directory:
                root, protocol, _, _, _, old = self.fixture(directory); edit(old)
                campaign.write(root / 'old/job-0000/receipt.json', old); self.refreeze(root, protocol)
                with self.assertRaises(ValueError): q.validate(protocol, root)

    def test_a_failed_continuation_stays_incomplete_and_cannot_be_retried(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, _, native, tasks, old = self.fixture(directory)
            with self.assertRaisesRegex(RuntimeError, 'next-session'): self.execute_fixture(root, protocol, native, tasks, fail=True)
            failed = campaign.read(root / 'new/job-0000/receipt.json')
            self.assertFalse(failed['complete']); self.assertEqual(failed['outcomes'], old['outcomes'])
            self.assertGreaterEqual(failed['seconds'], old['seconds'])
            with self.assertRaises(FileExistsError): self.execute_fixture(root, protocol, native, tasks)

    def test_full_regrading_rejects_a_recorded_grade_that_disagrees_with_its_answer(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, _, native, tasks, old = self.fixture(directory)
            old['outcomes'][0]['passed'] = False
            campaign.write(root / 'old/job-0000/receipt.json', old); self.refreeze(root, protocol)
            self.execute_fixture(root, protocol, native, tasks)
            with patch.object(campaign.bfcl, 'Bundle', EmptyBundle):
                with self.assertRaisesRegex(ValueError, 'frozen grade'):
                    q.analyze(root / 'continuation.json', campaign.digest(root / 'continuation.json'), root, root / 'new')

    def test_regrading_ignores_only_valid_volatile_sandbox_custody(self):
        left = {'passed': True, 'grade': {'result': {'valid': True}, 'peak_worker_bytes': 1000, 'sandbox_profile_sha256': 'a' * 64}}
        right = copy.deepcopy(left); right['grade'].update(peak_worker_bytes=2000, sandbox_profile_sha256='b' * 64)
        self.assertEqual(q.stable_grade('tools', left), q.stable_grade('tools', right))
        right['grade']['result']['valid'] = False
        self.assertNotEqual(q.stable_grade('tools', left), q.stable_grade('tools', right))
        for edit in (lambda x: x['grade'].update(peak_worker_bytes=256_000_001), lambda x: x['grade'].update(sandbox_profile_sha256='invalid')):
            value = copy.deepcopy(left); edit(value)
            with self.assertRaises(ValueError): q.stable_grade('tools', value)


if __name__ == '__main__': unittest.main()
