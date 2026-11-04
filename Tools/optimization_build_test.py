import fcntl
import json
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
import unittest
from unittest.mock import Mock, patch

from optimization_build import build


class BuildTests(unittest.TestCase):
    def test_final_observation_failure_preserves_primary_failure_and_manifest(self):
        good = {'reclaimable_bytes': 13_000_000_000}
        cases = [
            ('observation', PermissionError('initial observation unavailable'), Mock(), 'initial observation unavailable'),
            ('headroom', {'reclaimable_bytes': 1}, Mock(), 'insufficient reclaimable'),
            ('make exit', good, Mock(return_value=SimpleNamespace(returncode=2)), 'make failed with exit code 2'),
            ('make launch', good, Mock(side_effect=OSError('make launch unavailable')), 'make launch unavailable'),
            ('identity', good, Mock(return_value=SimpleNamespace(returncode=0)), 'identity unavailable'),
        ]
        for name, first, run, primary in cases:
            with self.subTest(case=name), TemporaryDirectory() as directory, \
                    patch('optimization_build.verified_build', side_effect=ValueError('identity unavailable')), \
                    patch('optimization_build.shutil.copy2') as copy:
                root = Path(directory)
                snapshot = Mock(side_effect=[first, OSError('final observation unavailable')])
                result = build(root, root / 'out', snapshot=snapshot, run=run, lock_path=root / 'lock')
                self.assertFalse(result['passed'])
                self.assertIn(primary, result['error'])
                self.assertEqual(result['after_error'], 'OSError: final observation unavailable')
                self.assertNotIn('after', result)
                self.assertEqual(json.loads((root / 'out/manifest.json').read_text()), result)
                self.assertEqual(snapshot.call_count, 2)
                self.assertFalse((root / 'out/candidate').exists())
                copy.assert_not_called()
                if name in ('observation', 'headroom'):
                    run.assert_not_called()
                else:
                    run.assert_called_once()
                with (root / 'lock').open('a') as released:
                    fcntl.flock(released, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_final_observation_failure_after_freezing_keeps_artifacts_but_fails(self):
        with TemporaryDirectory() as directory, \
                patch('optimization_build.verified_build', return_value={'fixture_identity': True}) as verify:
            root = Path(directory)
            release = root / '.build/release'; release.mkdir(parents=True)
            names = ['slotstream', 'slotstream-checks', 'mlx.metallib', 'build-identity.json', 'build-source.tar.gz']
            for name in names:
                (release / name).write_bytes(('inert fixture ' + name).encode())
            run = Mock(return_value=SimpleNamespace(returncode=0))
            snapshot = Mock(side_effect=[{'reclaimable_bytes': 13_000_000_000}, OSError('final observation unavailable')])
            result = build(root, root / 'out', snapshot=snapshot, run=run, lock_path=root / 'lock')
            self.assertFalse(result['passed'])
            self.assertIn('final observation unavailable', result['error'])
            self.assertEqual(result['after_error'], 'OSError: final observation unavailable')
            self.assertNotIn('after', result)
            self.assertEqual(result['exit_code'], 0)
            self.assertEqual(result['frozen'], {'fixture_identity': True})
            self.assertEqual(json.loads((root / 'out/manifest.json').read_text()), result)
            self.assertEqual(verify.call_count, 2)
            run.assert_called_once()
            self.assertEqual(snapshot.call_count, 2)
            for name in names:
                self.assertEqual((root / 'out/candidate' / name).read_bytes(), (release / name).read_bytes())
            with (root / 'lock').open('a') as released:
                fcntl.flock(released, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_successful_final_observation_keeps_build_success(self):
        with TemporaryDirectory() as directory, \
                patch('optimization_build.verified_build', return_value={'fixture_identity': True}):
            root = Path(directory)
            release = root / '.build/release'; release.mkdir(parents=True)
            for name in ['slotstream', 'slotstream-checks', 'mlx.metallib', 'build-identity.json', 'build-source.tar.gz']:
                (release / name).write_bytes(b'inert fixture')
            after = {'reclaimable_bytes': 12_000_000_000}
            result = build(root, root / 'out', snapshot=Mock(side_effect=[{'reclaimable_bytes': 13_000_000_000}, after]),
                           run=Mock(return_value=SimpleNamespace(returncode=0)), lock_path=root / 'lock')
            self.assertTrue(result['passed'])
            self.assertEqual(result['after'], after)
            self.assertNotIn('after_error', result)
            self.assertNotIn('error', result)
            self.assertEqual(json.loads((root / 'out/manifest.json').read_text()), result)

    def test_explicit_job_bound_is_validated_and_recorded_in_actual_make_command(self):
        for value in [True, 0, -1, 9, 2.0, '2', '2; false']:
            with self.assertRaises(ValueError): build('/unused', '/unused', jobs=value)
        with TemporaryDirectory() as d:
            run = Mock(return_value=SimpleNamespace(returncode=2))
            result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 13_000_000_000},
                           run=run, lock_path=Path(d)/'lock', jobs=2)
            self.assertEqual(result['build_jobs'], 2)
            self.assertEqual(result['command'], ['make', 'build', 'SLOTSTREAM_BUILD_JOBS=2'])
            self.assertEqual(run.call_args.args[0], result['command'])
            self.assertFalse(result['passed'])

    def test_waiting_never_builds_until_reservation_is_owned(self):
        with TemporaryDirectory() as d:
            path=Path(d)/'lock'
            with path.open('a') as holder:
                fcntl.flock(holder,fcntl.LOCK_EX | fcntl.LOCK_NB)
                run=Mock(return_value=SimpleNamespace(returncode=2))
                def release(seconds):
                    run.assert_not_called()
                    fcntl.flock(holder,fcntl.LOCK_UN)
                with patch('optimization_build.time.sleep',side_effect=release):
                    result=build(d,Path(d)/'out',snapshot=lambda:{'reclaimable_bytes':20_000_000_000},
                        run=run,lock_path=path,wait_seconds=1)
                run.assert_called_once()
                self.assertEqual(result['reservation_wait']['attempts'],2)
                self.assertTrue(result['model_lock_held_during_build'])
                self.assertFalse(result['passed'])
        for value in [True,-1,1801,1.5,None]:
            with self.assertRaises(ValueError): build('/unused','/unused',wait_seconds=value)

    def test_locked_model_prevents_make(self):
        with TemporaryDirectory() as d:
            path = Path(d)/'lock'
            with path.open('w') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                run = Mock()
                result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 20_000_000_000}, run=run, lock_path=path)
                self.assertFalse(result['passed']); run.assert_not_called()
                self.assertIn('make was not invoked', result['error'])

    def test_headroom_refuses_before_make(self):
        with TemporaryDirectory() as d:
            run = Mock()
            result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 12_999_999_999}, run=run, lock_path=Path(d)/'lock')
            self.assertFalse(result['passed']); run.assert_not_called()
            self.assertTrue(result['model_lock_held_during_build'])

    def test_lock_stays_held_through_make_and_failure_never_freezes(self):
        with TemporaryDirectory() as d:
            path = Path(d)/'lock'
            def run(*args, **kwargs):
                with path.open('a') as second:
                    with self.assertRaises(BlockingIOError): fcntl.flock(second, fcntl.LOCK_EX | fcntl.LOCK_NB)
                return SimpleNamespace(returncode=2)
            result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 13_000_000_000}, run=run, lock_path=path)
            self.assertFalse(result['passed']); self.assertEqual(result['exit_code'], 2)
            self.assertFalse((Path(d)/'out/candidate').exists())
            with path.open('a') as released: fcntl.flock(released, fcntl.LOCK_EX | fcntl.LOCK_NB)
            self.assertEqual(json.loads((Path(d)/'out/manifest.json').read_text()), result)

    def test_invalid_identity_never_freezes(self):
        with TemporaryDirectory() as d, patch('optimization_build.verified_build', side_effect=ValueError('identity mismatch')):
            result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 13_000_000_000},
                           run=lambda *a, **kw: SimpleNamespace(returncode=0), lock_path=Path(d)/'lock')
            self.assertFalse(result['passed']); self.assertFalse((Path(d)/'out/candidate').exists())


if __name__ == '__main__': unittest.main()
