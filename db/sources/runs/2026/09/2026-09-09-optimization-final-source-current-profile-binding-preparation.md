---
type: run
id: 01m23d4qfwsya0dtn4gt3f2tt7
created: 2026-09-09T15:38:48.700766+00:00
updated: 2026-09-09T15:38:49.027959+00:00
summary: Final-source preparation requires the exact qualified profile identities and declared exclusion audit
binary: none; model-free source preparation only
captured_at: 2026-09-09
command: V549 checks.py; exact original compose/main reconstruction and eight original test-name preservation
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Final-source preparation requires the exact qualified profile identities and declared exclusion audit
tool: Slotstream exact native and source qualification capture
---
Eleven model-free checks pass, retaining all eight original V518 tests and the exact original source composition function. Prerequisites explicitly bind qualified V515256 and eventual qualified V546512/1024 with matching exact builds, actual independent full audits and mandatory startup-exclusion recomputation. Successful test envelopes are synthetic and never qualify an execution. The initial mock installed the read patch before constructing the second provider fixture; that setup-only failure and correction remain preserved. No final source, protocol, build, model, native result or activation is created. All final gates remain required.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/binding-preparation.json",
    "bytes": 909,
    "sha256": "1087e5201df33f0cdac487e9f33d9906e38193a106e0bb151ea2ffd3c05e195b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/checks.py",
    "bytes": 9495,
    "sha256": "f41f4e208398437b2216a86739f1031035605f310553242032d60d20ab3a275c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/checks.stderr",
    "bytes": 110,
    "sha256": "08b3cad696a35c99eb5d4fcf04d5b257f2520d2b7d42499d4430a8b2bb191684"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/initial-checks.py",
    "bytes": 9467,
    "sha256": "4e46a4f25623190a5b6b98efbf7bf6da608b14e4adebeb63dd3e55f0a66e0247"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/initial-checks.stderr",
    "bytes": 2484,
    "sha256": "9ac640903b8495a84d3442be024269facc9a512d64e1c58f46fcdb17670fc86b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/initial-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/prepare.py",
    "bytes": 8292,
    "sha256": "b3ee0f97cca4d5a7910227f3b6870d216809073542afc89820a6bf1126b07a06"
  }
]
```

## Artifact SHA-256 1087e5201df33f0cdac487e9f33d9906e38193a106e0bb151ea2ffd3c05e195b

Encoding: `utf-8`. Original bytes: 909.

````````````text
{
  "original_composition_function_identical": true,
  "original_main_identical_except_check_count": true,
  "all8_original_test_names_retained": true,
  "tests": 11,
  "source_prepared": false,
  "model_launched": false,
  "compiled": false,
  "activation_performed": false,
  "changes": "Only explicit successful profile identity selection, cross-build check, source/audit provenance and mandatory independently recomputed startup exclusions. Synthetic mock setup order failure is preserved; no runtime or source transformation changed.",
  "sha256": {
    "prepare.py": "b3ee0f97cca4d5a7910227f3b6870d216809073542afc89820a6bf1126b07a06",
    "checks.py": "f41f4e208398437b2216a86739f1031035605f310553242032d60d20ab3a275c",
    "checks.stdout": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "checks.stderr": "08b3cad696a35c99eb5d4fcf04d5b257f2520d2b7d42499d4430a8b2bb191684"
  }
}

````````````

## Artifact SHA-256 f41f4e208398437b2216a86739f1031035605f310553242032d60d20ab3a275c

Encoding: `utf-8`. Original bytes: 9495.

````````````text
"""Model-free final preparation checks; no terminal qualification is fabricated."""
from pathlib import Path
import copy
import importlib.util
import unittest
from contextlib import ExitStack
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('final_source_preparation_checks', HERE / 'prepare.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


class Checks(unittest.TestCase):
    def prepared(self):
        # Actual prior source hashes; no final-source qualification is implied.
        return {'build': {'identity': {'source': m.m.c.read(m.PRIOR / 'protocol.json')['candidate_source']}}}

    def test_actual_source_transform_is_exact_and_memory_only(self):
        before, after, changes = m.compose_overlay(self.prepared())
        self.assertEqual(len(before), 16)
        self.assertEqual(set(changes), {'Sources/Slotstream/Optimizations.swift',
                                      'Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift'})
        key = 'Sources/Slotstream/Optimizations.swift'
        selected = after[key].decode()
        addition = '        result.automaticReadScope = true\n        result.visionQueryTile = 256\n'
        self.assertEqual(selected.count(addition), 1)
        self.assertEqual(selected.replace(addition, ''), (m.OVERRIDES / 'after' / key).read_text())
        self.assertIn('public var automaticReadScope: Bool? = nil', selected)
        self.assertIn('public var visionQueryTile = 0', selected)
        for relative in set(before) - set(changes):
            self.assertEqual(before[relative], after[relative])
        self.assertFalse((HERE / 'after').exists())
        self.assertFalse((HERE / 'source-audit.json').exists())

    def test_wrong_candidate_source_is_rejected_before_output(self):
        value = self.prepared()
        value['build']['identity']['source']['Sources/Slotstream/Context.swift'] = '0' * 64
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            m.compose_overlay(value)
        self.assertFalse((HERE / 'after').exists())

    def test_changed_override_bytes_are_rejected_before_output(self):
        original = m.m.digest
        def changed(path):
            if Path(path) == m.OVERRIDES / 'after/Sources/Slotstream/Optimizations.swift':
                return '0' * 64
            return original(path)
        with patch.object(m.m, 'digest', side_effect=changed):
            with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                m.compose_overlay(self.prepared())
        self.assertFalse((HERE / 'after').exists())

    def profile_fixtures(self):
        # Deliberately synthetic completion envelopes for negative admission
        # tests. They are never written to a result or treated as model proof.
        qualifications, audits = {}, {}
        for name in m.m.PROFILES:
            qualifications[name] = dict(completed=True, qualified=True, proofs_unchanged=True,
                                        cleanup_complete=True, within_reservation=True, remaining_jobs=[])
            audits[name] = dict(assessment={'qualified': True},
                               all64_exact_prompt_output_text_and_equal_work=True,
                               all64_original_sampled_physical_caps_pass=True,
                               terminal_receipt_sha256='synthetic-receipt')
        return qualifications, audits

    def check_admission(self, qualifications, audits, *, jobs=None, assessment=True):
        def read(path):
            path = Path(path)
            if path.name == 'qualification.json': return qualifications[path.parent.parent.name]
            if path.name == 'audit.json': return audits[path.parent.name]
            raise AssertionError('unexpected evidence read')
        def digest(path):
            if Path(path).name == 'qualification.json': return 'synthetic-receipt'
            if Path(path).name == 'audit.json': return 'synthetic-audit'
            if Path(path).name == 'run.py': return 'synthetic-provider'
            if Path(path).name == '2026-09-09-optimization-vision-mechanism-complete-pass.md':
                return 'f1a93a712ffddf8e877bcc438dd4dcab7ef1c78df6b35e433303e0e797230554'
            raise AssertionError('unexpected evidence hash')
        prepared = self.prepared()
        with ExitStack() as stack:
            for provider in [m.m, m.n]:
                stack.enter_context(patch.object(provider, 'load', return_value=prepared))
                stack.enter_context(patch.object(provider.c, 'read', side_effect=read))
                stack.enter_context(patch.object(provider, 'digest', side_effect=digest))
                stack.enter_context(patch.object(provider, 'assess', return_value={
                    'qualified': assessment, 'startup_swapin_entire_pair_exclusions_recomputed': True}))
            stack.enter_context(patch.object(m.m.old.native.scope, 'competing_jobs', return_value=jobs or []))
            return m.qualified_profiles()

    def test_every_original_profile_and_terminal_condition_required(self):
        for name in m.m.PROFILES:
            for key in ['completed', 'qualified', 'proofs_unchanged', 'cleanup_complete', 'within_reservation', 'remaining_jobs']:
                q, a = self.profile_fixtures()
                q[name][key] = ['synthetic-active-job'] if key == 'remaining_jobs' else False
                with self.subTest(name=name, key=key):
                    with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                        self.check_admission(q, a)
        self.assertFalse((HERE / 'after').exists())

    def test_every_original_audit_and_receipt_binding_required(self):
        for name in m.m.PROFILES:
            for key in ['assessment', 'all64_exact_prompt_output_text_and_equal_work',
                        'all64_original_sampled_physical_caps_pass', 'terminal_receipt_sha256']:
                q, a = self.profile_fixtures()
                a[name][key] = {'qualified': False} if key == 'assessment' else False
                with self.subTest(name=name, key=key):
                    with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                        self.check_admission(q, a)

    def test_original_assessor_failure_and_live_job_refuse(self):
        q, a = self.profile_fixtures()
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            self.check_admission(q, a, assessment=False)
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            self.check_admission(q, a, jobs=['synthetic-model-or-compiler'])

    def test_terminal_checks_preserve_all_three_proof_keys(self):
        q, a = self.profile_fixtures()
        _, proof, _ = self.check_admission(q, a)
        self.assertEqual(set(proof), set(m.m.PROFILES))
        self.assertTrue(all(p['qualification_sha256'] == 'synthetic-receipt' for p in proof.values()))
        self.assertFalse((HERE / 'after').exists())

    def test_build_executor_preserves_original_guards_and_restoration(self):
        old = (m.BASE / 'adaptive-scope-build-v492/run.py').read_text()
        new = (m.BASE / 'final-composition-build-v519/run.py').read_text()
        restored = new.replace('final-composition-build-v519', 'adaptive-scope-build-v492').replace('.v519-', '.v492-')
        self.assertEqual(restored, old)

    def test_profile_binding_uses_only_the_three_current_successor_identities(self):
        bindings = m.profile_bindings()
        self.assertEqual([name for name, _, _ in bindings], ['planner-256', 'planner-512', 'planner-1024'])
        self.assertEqual([provider.HERE.name for _, provider, _ in bindings], [
            'public-plan-observed-cohort-v515', 'public-planner-swapin-exclusion-cohort-v546',
            'public-planner-swapin-exclusion-cohort-v546'])
        self.assertEqual([path.parent.parent.name for _, _, path in bindings], [
            'public-planner-terminal-v513', 'public-planner-swapin-terminal-v547',
            'public-planner-swapin-terminal-v547'])

    def test_mixed_candidate_builds_are_rejected_before_evidence_read_or_source_output(self):
        other = copy.deepcopy(self.prepared())
        other['build']['identity']['source']['Sources/Slotstream/Plan.swift'] = '0' * 64
        with patch.object(m.m, 'load', return_value=self.prepared()), \
             patch.object(m.n, 'load', return_value=other):
            with self.assertRaisesRegex((ValueError, RuntimeError, AssertionError), 'different exact candidate'):
                m.qualified_profiles()
        self.assertFalse((HERE / 'after').exists())

    def test_declared_exclusion_recomputation_is_mandatory(self):
        original = m.profile_bindings
        def bind():
            bindings = original()
            # Keep providers and exact evidence identities; alter only this
            # explicitly synthetic assessor result inside the admission test.
            m.n.assess.return_value['startup_swapin_entire_pair_exclusions_recomputed'] = False
            return bindings
        q, a = self.profile_fixtures()
        with patch.object(m, 'profile_bindings', side_effect=bind):
            with self.assertRaisesRegex((ValueError, RuntimeError, AssertionError), 'independently recompute'):
                self.check_admission(q, a)
        self.assertFalse((HERE / 'after').exists())


if __name__ == '__main__': unittest.main()

````````````

## Artifact SHA-256 08b3cad696a35c99eb5d4fcf04d5b257f2520d2b7d42499d4430a8b2bb191684

Encoding: `utf-8`. Original bytes: 110.

````````````text
...........
----------------------------------------------------------------------
Ran 11 tests in 0.027s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 4e46a4f25623190a5b6b98efbf7bf6da608b14e4adebeb63dd3e55f0a66e0247

Encoding: `utf-8`. Original bytes: 9467.

````````````text
"""Model-free final preparation checks; no terminal qualification is fabricated."""
from pathlib import Path
import copy
import importlib.util
import unittest
from contextlib import ExitStack
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('final_source_preparation_checks', HERE / 'prepare.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


class Checks(unittest.TestCase):
    def prepared(self):
        # Actual prior source hashes; no final-source qualification is implied.
        return {'build': {'identity': {'source': m.m.c.read(m.PRIOR / 'protocol.json')['candidate_source']}}}

    def test_actual_source_transform_is_exact_and_memory_only(self):
        before, after, changes = m.compose_overlay(self.prepared())
        self.assertEqual(len(before), 16)
        self.assertEqual(set(changes), {'Sources/Slotstream/Optimizations.swift',
                                      'Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift'})
        key = 'Sources/Slotstream/Optimizations.swift'
        selected = after[key].decode()
        addition = '        result.automaticReadScope = true\n        result.visionQueryTile = 256\n'
        self.assertEqual(selected.count(addition), 1)
        self.assertEqual(selected.replace(addition, ''), (m.OVERRIDES / 'after' / key).read_text())
        self.assertIn('public var automaticReadScope: Bool? = nil', selected)
        self.assertIn('public var visionQueryTile = 0', selected)
        for relative in set(before) - set(changes):
            self.assertEqual(before[relative], after[relative])
        self.assertFalse((HERE / 'after').exists())
        self.assertFalse((HERE / 'source-audit.json').exists())

    def test_wrong_candidate_source_is_rejected_before_output(self):
        value = self.prepared()
        value['build']['identity']['source']['Sources/Slotstream/Context.swift'] = '0' * 64
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            m.compose_overlay(value)
        self.assertFalse((HERE / 'after').exists())

    def test_changed_override_bytes_are_rejected_before_output(self):
        original = m.m.digest
        def changed(path):
            if Path(path) == m.OVERRIDES / 'after/Sources/Slotstream/Optimizations.swift':
                return '0' * 64
            return original(path)
        with patch.object(m.m, 'digest', side_effect=changed):
            with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                m.compose_overlay(self.prepared())
        self.assertFalse((HERE / 'after').exists())

    def profile_fixtures(self):
        # Deliberately synthetic completion envelopes for negative admission
        # tests. They are never written to a result or treated as model proof.
        qualifications, audits = {}, {}
        for name in m.m.PROFILES:
            qualifications[name] = dict(completed=True, qualified=True, proofs_unchanged=True,
                                        cleanup_complete=True, within_reservation=True, remaining_jobs=[])
            audits[name] = dict(assessment={'qualified': True},
                               all64_exact_prompt_output_text_and_equal_work=True,
                               all64_original_sampled_physical_caps_pass=True,
                               terminal_receipt_sha256='synthetic-receipt')
        return qualifications, audits

    def check_admission(self, qualifications, audits, *, jobs=None, assessment=True):
        def read(path):
            path = Path(path)
            if path.name == 'qualification.json': return qualifications[path.parent.parent.name]
            if path.name == 'audit.json': return audits[path.parent.name]
            raise AssertionError('unexpected evidence read')
        def digest(path):
            if Path(path).name == 'qualification.json': return 'synthetic-receipt'
            if Path(path).name == 'audit.json': return 'synthetic-audit'
            if Path(path).name == 'run.py': return 'synthetic-provider'
            if Path(path).name == '2026-09-09-optimization-vision-mechanism-complete-pass.md':
                return 'f1a93a712ffddf8e877bcc438dd4dcab7ef1c78df6b35e433303e0e797230554'
            raise AssertionError('unexpected evidence hash')
        with ExitStack() as stack:
            for provider in [m.m, m.n]:
                stack.enter_context(patch.object(provider, 'load', return_value=self.prepared()))
                stack.enter_context(patch.object(provider.c, 'read', side_effect=read))
                stack.enter_context(patch.object(provider, 'digest', side_effect=digest))
                stack.enter_context(patch.object(provider, 'assess', return_value={
                    'qualified': assessment, 'startup_swapin_entire_pair_exclusions_recomputed': True}))
            stack.enter_context(patch.object(m.m.old.native.scope, 'competing_jobs', return_value=jobs or []))
            return m.qualified_profiles()

    def test_every_original_profile_and_terminal_condition_required(self):
        for name in m.m.PROFILES:
            for key in ['completed', 'qualified', 'proofs_unchanged', 'cleanup_complete', 'within_reservation', 'remaining_jobs']:
                q, a = self.profile_fixtures()
                q[name][key] = ['synthetic-active-job'] if key == 'remaining_jobs' else False
                with self.subTest(name=name, key=key):
                    with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                        self.check_admission(q, a)
        self.assertFalse((HERE / 'after').exists())

    def test_every_original_audit_and_receipt_binding_required(self):
        for name in m.m.PROFILES:
            for key in ['assessment', 'all64_exact_prompt_output_text_and_equal_work',
                        'all64_original_sampled_physical_caps_pass', 'terminal_receipt_sha256']:
                q, a = self.profile_fixtures()
                a[name][key] = {'qualified': False} if key == 'assessment' else False
                with self.subTest(name=name, key=key):
                    with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                        self.check_admission(q, a)

    def test_original_assessor_failure_and_live_job_refuse(self):
        q, a = self.profile_fixtures()
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            self.check_admission(q, a, assessment=False)
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            self.check_admission(q, a, jobs=['synthetic-model-or-compiler'])

    def test_terminal_checks_preserve_all_three_proof_keys(self):
        q, a = self.profile_fixtures()
        _, proof, _ = self.check_admission(q, a)
        self.assertEqual(set(proof), set(m.m.PROFILES))
        self.assertTrue(all(p['qualification_sha256'] == 'synthetic-receipt' for p in proof.values()))
        self.assertFalse((HERE / 'after').exists())

    def test_build_executor_preserves_original_guards_and_restoration(self):
        old = (m.BASE / 'adaptive-scope-build-v492/run.py').read_text()
        new = (m.BASE / 'final-composition-build-v519/run.py').read_text()
        restored = new.replace('final-composition-build-v519', 'adaptive-scope-build-v492').replace('.v519-', '.v492-')
        self.assertEqual(restored, old)

    def test_profile_binding_uses_only_the_three_current_successor_identities(self):
        bindings = m.profile_bindings()
        self.assertEqual([name for name, _, _ in bindings], ['planner-256', 'planner-512', 'planner-1024'])
        self.assertEqual([provider.HERE.name for _, provider, _ in bindings], [
            'public-plan-observed-cohort-v515', 'public-planner-swapin-exclusion-cohort-v546',
            'public-planner-swapin-exclusion-cohort-v546'])
        self.assertEqual([path.parent.parent.name for _, _, path in bindings], [
            'public-planner-terminal-v513', 'public-planner-swapin-terminal-v547',
            'public-planner-swapin-terminal-v547'])

    def test_mixed_candidate_builds_are_rejected_before_evidence_read_or_source_output(self):
        other = copy.deepcopy(self.prepared())
        other['build']['identity']['source']['Sources/Slotstream/Plan.swift'] = '0' * 64
        with patch.object(m.m, 'load', return_value=self.prepared()), \
             patch.object(m.n, 'load', return_value=other):
            with self.assertRaisesRegex((ValueError, RuntimeError, AssertionError), 'different exact candidate'):
                m.qualified_profiles()
        self.assertFalse((HERE / 'after').exists())

    def test_declared_exclusion_recomputation_is_mandatory(self):
        original = m.profile_bindings
        def bind():
            bindings = original()
            # Keep providers and exact evidence identities; alter only this
            # explicitly synthetic assessor result inside the admission test.
            m.n.assess.return_value['startup_swapin_entire_pair_exclusions_recomputed'] = False
            return bindings
        q, a = self.profile_fixtures()
        with patch.object(m, 'profile_bindings', side_effect=bind):
            with self.assertRaisesRegex((ValueError, RuntimeError, AssertionError), 'independently recompute'):
                self.check_admission(q, a)
        self.assertFalse((HERE / 'after').exists())


if __name__ == '__main__': unittest.main()

````````````

## Artifact SHA-256 9ac640903b8495a84d3442be024269facc9a512d64e1c58f46fcdb17670fc86b

Encoding: `utf-8`. Original bytes: 2484.

````````````text
...F.....F.
======================================================================
FAIL: test_declared_exclusion_recomputation_is_mandatory (__main__.Checks)
----------------------------------------------------------------------
AssertionError: unexpected evidence read

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/checks.py", line 161, in test_declared_exclusion_recomputation_is_mandatory
    self.check_admission(q, a)
AssertionError: "independently recompute" does not match "unexpected evidence read"

======================================================================
FAIL: test_terminal_checks_preserve_all_three_proof_keys (__main__.Checks)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/checks.py", line 120, in test_terminal_checks_preserve_all_three_proof_keys
    _, proof, _ = self.check_admission(q, a)
  File "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/checks.py", line 83, in check_admission
    stack.enter_context(patch.object(provider, 'load', return_value=self.prepared()))
  File "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/checks.py", line 18, in prepared
    return {'build': {'identity': {'source': m.m.c.read(m.PRIOR / 'protocol.json')['candidate_source']}}}
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/unittest/mock.py", line 1093, in __call__
    return self._mock_call(*args, **kwargs)
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/unittest/mock.py", line 1097, in _mock_call
    return self._execute_mock_call(*args, **kwargs)
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/unittest/mock.py", line 1158, in _execute_mock_call
    result = effect(*args, **kwargs)
  File "/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/checks.py", line 73, in read
    raise AssertionError('unexpected evidence read')
AssertionError: unexpected evidence read

----------------------------------------------------------------------
Ran 11 tests in 0.020s

FAILED (failures=2)

````````````

## Artifact SHA-256 b3ee0f97cca4d5a7910227f3b6870d216809073542afc89820a6bf1126b07a06

Encoding: `utf-8`. Original bytes: 8292.

````````````text
"""Prepare selected final source only after all original planner profiles qualify."""
from pathlib import Path
from collections import Counter
import hashlib
import importlib.util
import json
import re

HERE = Path(__file__).resolve().parent
BASE = Path('/tmp/slotstream-optimization-execution')
PRIOR = BASE / 'adaptive-scope-build-v492'
OVERRIDES = BASE / 'selected-vision-overrides-v508'
spec = importlib.util.spec_from_file_location('final_original_profiles', BASE / 'public-plan-observed-cohort-v515/run.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


spec = importlib.util.spec_from_file_location('final_declared_profiles', BASE / 'public-planner-swapin-exclusion-cohort-v546/run.py')
n = importlib.util.module_from_spec(spec)
spec.loader.exec_module(n)


def profile_bindings():
    return [
        ('planner-256', m, BASE / 'public-planner-terminal-v513/planner-256/audit.json'),
        ('planner-512', n, BASE / 'public-planner-swapin-terminal-v547/planner-512/audit.json'),
        ('planner-1024', n, BASE / 'public-planner-swapin-terminal-v547/planner-1024/audit.json'),
    ]


def qualified_profiles():
    """Require the actual successful identity for each profile, without pooling."""
    prepared = m.load()
    declared = n.load()
    m.require(declared['build'] == prepared['build'], 'planner profiles use different exact candidate builds')
    proof = {}
    for name, provider, audit_path in profile_bindings():
        target = provider.HERE / name / 'execution'
        q = provider.c.read(target / 'qualification.json')
        audit = provider.c.read(audit_path)
        assessed = provider.assess(name)
        m.require(all(q.get(k) is True for k in ['completed','qualified','proofs_unchanged','cleanup_complete','within_reservation'])
                  and q.get('remaining_jobs') == [] and assessed['qualified'] is True,
                  'every original actual-planner cohort must qualify before selecting automatic defaults')
        if provider is n:
            m.require(assessed.get('startup_swapin_entire_pair_exclusions_recomputed') is True,
                      'declared startup exclusions must independently recompute before final source preparation')
        m.require(audit['assessment']['qualified'] is True
                  and audit['all64_exact_prompt_output_text_and_equal_work'] is True
                  and audit['all64_original_sampled_physical_caps_pass'] is True
                  and audit['terminal_receipt_sha256'] == provider.digest(target / 'qualification.json'),
                  'complete independent response/physical-cap audit missing')
        proof[name] = {'qualification_path': str(target / 'qualification.json'),
                       'qualification_sha256': provider.digest(target / 'qualification.json'),
                       'audit_path': str(audit_path), 'audit_sha256': provider.digest(audit_path),
                       'provider_path': str(Path(provider.__file__)),
                       'provider_sha256': provider.digest(Path(provider.__file__))}
    vision_source = Path('/Users/carlos/Projects/slotstream/db/sources/runs/2026/09/2026-09-09-optimization-vision-mechanism-complete-pass.md')
    m.require(m.digest(vision_source) == 'f1a93a712ffddf8e877bcc438dd4dcab7ef1c78df6b35e433303e0e797230554',
              'selected vision qualification source changed')
    m.require(not m.old.native.scope.competing_jobs(), 'all model and compiler work must drain before final source preparation')
    return prepared, proof, vision_source


def compose_overlay(prepared):
    """Construct source bytes in memory after validating every frozen preimage."""
    old_protocol = m.c.read(PRIOR / 'protocol.json')
    m.require(prepared['build']['identity']['source'] == old_protocol['candidate_source'], 'prior source family differs')
    override_proof = m.c.read(OVERRIDES / 'preparation.json')
    m.require(override_proof['defaults_changed'] is False and override_proof['current_v492_model_and_source_unchanged'] is True,
              'uncompiled override draft is not based on the current source')
    before, after = {}, {}
    for path in (PRIOR / 'after').rglob('*.swift'):
        relative = str(path.relative_to(PRIOR / 'after'))
        before[relative] = path.read_bytes()
        m.require(hashlib.sha256(before[relative]).hexdigest() == old_protocol['candidate_source'][relative],
                  'candidate source overlay changed')
        after[relative] = before[relative]
    m.require(len(before) == 16, 'original overlay inventory changed')
    for relative, hashes in override_proof['changes'].items():
        m.require(m.digest(OVERRIDES / 'before' / relative) == hashes['before'] == hashlib.sha256(before[relative]).hexdigest()
                  and m.digest(OVERRIDES / 'after' / relative) == hashes['after'], 'override patch preimage changed')
        after[relative] = (OVERRIDES / 'after' / relative).read_bytes()
    key = 'Sources/Slotstream/Optimizations.swift'
    source = after[key].decode()
    needle = '        result.compactNgramRows = true\n'
    m.require(source.count(needle) == 1, 'selected candidate initializer changed')
    source = source.replace(needle, needle + '        result.automaticReadScope = true\n        result.visionQueryTile = 256\n')
    m.require('public var automaticReadScope: Bool? = nil' in source and 'public var visionQueryTile = 0' in source,
              'public reference initializer must remain unchanged')
    after[key] = source.encode()
    changes = {}
    for relative in before:
        if before[relative] != after[relative]:
            changes[relative] = {'before_sha256':hashlib.sha256(before[relative]).hexdigest(),
                                 'after_sha256':hashlib.sha256(after[relative]).hexdigest()}
    m.require(set(changes) == {'Sources/Slotstream/Optimizations.swift','Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift'},
              'final default composition unexpectedly changes inference math')
    key = 'Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift'
    pattern = r'c\.(?:expect|equal|close)\("([^"\n]+)"'
    m.require(not (Counter(re.findall(pattern,before[key].decode())) - Counter(re.findall(pattern,after[key].decode()))),
              'original diagnostic assertion sites dropped')
    return before, after, changes


def main():
    m.require(not any((HERE / name).exists() for name in ['source-audit.json', 'before', 'after']), 'already prepared')
    m.require('Ran 11 tests' in (HERE / 'checks.stderr').read_text()
              and (HERE / 'checks.stderr').read_text().endswith('OK\n'), 'source preparation checks missing')
    prepared, proof, vision_source = qualified_profiles()
    before, after, changes = compose_overlay(prepared)
    for folder, values in [('before',before),('after',after)]:
        for relative, payload in values.items():
            path = HERE / folder / relative;path.parent.mkdir(parents=True,exist_ok=True)
            with path.open('xb') as output:output.write(payload)
    result = {'base_protocol_sha256':m.digest(PRIOR / 'protocol.json'), 'changed_files':changes,
              'all_three_original_public_planner_proofs':proof,
              'vision_qualification_source_sha256':m.digest(vision_source),
              'override_draft_sha256':m.digest(OVERRIDES / 'preparation.json'),
              'preparer_sha256':m.digest(Path(__file__)),
              'preparation_check_sha256': {name:m.digest(HERE / name) for name in ['checks.py','checks.stdout','checks.stderr']},
              'selected_defaults':{'automaticReadScope':True,'visionQueryTile':256,'compactNgramRows':True,'boundedDraftTail':False},
              'source_overlay_files':16, 'compiled':False, 'new_final_native_qualified':False,
              'shared_source_changed':False, 'activation_performed':False,
              'classification':'Final selected composition source only. Public reference initializer, mathematical implementations and all prior assertions remain. The new compiled defaults and explicit vision override compatibility require the complete original final qualification program before activation.'}
    m.c.write_new(HERE / 'source-audit.json',result)
    print(json.dumps(result,indent=2))


if __name__ == '__main__':main()

````````````
