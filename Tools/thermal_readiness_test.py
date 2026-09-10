"""Pre-launch thermal checks fail closed and never cache a prior ready result."""
import contextlib
import io
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).parent))
import thermal_readiness as thermal


class ThermalReadinessTests(unittest.TestCase):
    def test_every_known_state_and_power_mode(self):
        for state, name in thermal.THERMAL_STATES.items():
            for low_power in [False, True]:
                with self.subTest(state=name, low_power=low_power):
                    result = thermal.observe(lambda: (state, low_power))
                    self.assertEqual(result['conditions'],
                                     {'thermalState': name, 'lowPowerModeEnabled': low_power})
                    self.assertIs(result['ready'], state == 0 and not low_power)

    def test_unavailable_and_malformed_values_never_become_nominal(self):
        for values in [(4, False), (-1, False), (None, False), (True, False),
                       (0.0, False), ('0', False), (0, None), (0, 0), (0, 'false')]:
            with self.subTest(values=values), self.assertRaises(ValueError):
                thermal.observe(lambda: values)

    def test_next_observation_detects_changed_conditions(self):
        readings = iter([(0, False), (1, False), (0, True), (0, False)])
        self.assertEqual([thermal.observe(lambda: next(readings))['ready'] for _ in range(4)],
                         [True, False, False, True])

    def test_missing_provider_does_not_reuse_an_earlier_success(self):
        self.assertTrue(thermal.observe(lambda: (0, False))['ready'])
        with self.assertRaises(OSError):
            thermal.observe(lambda: (_ for _ in ()).throw(OSError('unavailable')))

    def test_unsupported_platform_refuses_before_loading_foundation(self):
        with patch.object(thermal.sys, 'platform', 'linux'), patch.object(thermal.ctypes, 'CDLL') as load:
            with self.assertRaises(RuntimeError):
                thermal.current_conditions()
            load.assert_not_called()

    def run_cli(self, args, reader):
        output = io.StringIO()
        with contextlib.redirect_stdout(output):
            status = thermal.main(args, reader=reader)
        return status, json.loads(output.getvalue())

    def test_required_check_only_accepts_nominal_normal_power(self):
        for reading, expected in [((0, False), 0), ((1, False), 2), ((2, False), 2),
                                  ((3, False), 2), ((0, True), 2)]:
            with self.subTest(reading=reading):
                status, result = self.run_cli(['--require-nominal'], lambda: reading)
                self.assertEqual(status, expected)
                self.assertIs(result['ready'], expected == 0)

    def test_observation_mode_reports_non_nominal_without_concealing_it(self):
        status, result = self.run_cli([], lambda: (1, False))
        self.assertEqual(status, 0)
        self.assertFalse(result['ready'])
        self.assertEqual(result['conditions']['thermalState'], 'fair')

    def test_provider_failure_and_unknown_values_have_nonzero_exit(self):
        for reader in [lambda: (99, False), lambda: (0, None),
                       lambda: (_ for _ in ()).throw(OSError('unavailable'))]:
            with self.subTest(reader=reader):
                status, result = self.run_cli(['--require-nominal'], reader)
                self.assertEqual(status, 1)
                self.assertFalse(result['ready'])
                self.assertIn('error', result)


if __name__ == '__main__':
    unittest.main()
