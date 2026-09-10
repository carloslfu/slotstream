"""Pressure readiness refuses bad observations without launching a model."""
import subprocess
import unittest

from optimization_readiness import pressure_snapshot, require_normal


class PressureReadiness(unittest.TestCase):
    def observe(self, stdout, code=0):
        calls = []
        def run(command, **kwargs):
            calls.append((command, kwargs))
            return subprocess.CompletedProcess(command, code, stdout, '')
        result = pressure_snapshot(run)
        self.assertEqual(calls[0][0], ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'])
        self.assertEqual(calls[0][1]['timeout'], 2)
        return result

    def test_only_normal_pressure_is_eligible(self):
        require_normal(self.observe('1\n'))
        for value in ['2\n', '4\n']:
            with self.subTest(value=value), self.assertRaises(RuntimeError):
                require_normal(self.observe(value))

    def test_bad_or_failed_kernel_reading_is_refused(self):
        for value, code in [('', 0), ('0', 0), ('3', 0), ('5', 0), ('true', 0),
                            ('1.0', 0), ('1\n2', 0), ('1', 1)]:
            with self.subTest(value=value, code=code), self.assertRaises(RuntimeError):
                self.observe(value, code)

    def test_untyped_or_unknown_pressure_cannot_pass(self):
        for value in [None, True, 1.0, '1', -1, 0, 2, 4]:
            with self.subTest(value=value), self.assertRaises(RuntimeError):
                require_normal({'level': value})

    def test_timeout_cannot_turn_into_normal(self):
        def run(command, **kwargs):
            raise subprocess.TimeoutExpired(command, kwargs['timeout'])
        with self.assertRaises(subprocess.TimeoutExpired):
            pressure_snapshot(run)


if __name__ == '__main__':
    unittest.main()
