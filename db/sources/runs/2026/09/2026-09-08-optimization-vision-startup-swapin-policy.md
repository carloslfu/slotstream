---
type: run
id: 01m21a36mzksptghd4v83snjj1
created: 2026-09-08T20:07:04.095379+00:00
updated: 2026-09-08T20:07:04.566118+00:00
summary: Prospective startup swap-in pair exclusion with stronger live swap-out stop
binary: /Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream
captured_at: 2026-09-08
command: Model-free V381 driver transformation and11 policy tests; V382 preparation and six binding tests; V383 additive live swap-out correction and six passing binding tests; fresh24-cell protocol freeze
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Prospective startup swap-in pair exclusion with stronger live swap-out stop
tool: Slotstream exact native and source qualification capture
---
The original V369 mechanism study is preserved incomplete after a global swap-in-only startup event. This successor separates unusable timing data from a whole-cohort stop. A new explicit startup_swapin_policy=exclude_pair is restricted to the original12GB large-image envelope. Only monotonically increasing swap-ins with unchanged swap-outs across host and generator intervals, complete output, nominal power/thermal state and valid original physical-footprint observations may take this path. Both first and measured requests still complete, but the entire affected pair is excluded from timing and memory-benefit qualification. Missing/malformed counters, new swap-outs, thermal/power or physical-limit failures retain stops. Every measured client and generator interval still requires unchanged global swap counters. The fixed24-cell workload, zero replacement cells, minimum5 clean pairs, exact outputs/work,200MB every-clean-pair sampled peak saving and5percent maximum median response regression remain unchanged. No old timing row is reused or rescored. The isolated driver restores the original shared serve_bench.py bytes exactly after reversing its four bounded edits; shared runtime and driver source remain unchanged. Eleven policy methods pass. The V382 binding tests then catch that the inherited NATIVE_POLICY has stop_on_new_swapouts=false; V382 remains frozen/unrun with its failed test preserved. V383 explicitly enables the stronger outer live swap-out stop, retains all other original limits and gains all six binding-test passes. Its distinct complete cohort is frozen but unrun. This is a prospective protocol amendment and harness qualification, not an original-study pass or an optimization performance result. No default selection or activation occurs.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/checks.py",
    "bytes": 3706,
    "sha256": "037c885ba6ad51a9b5b7b79f89e614f415f1ace124f0fd5739297121da732f75"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/checks.stderr",
    "bytes": 1124,
    "sha256": "ef3419d9ca9afbc082c3332dfe1410922c2a3adb03cf72019d42f484303ab644"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/mechanism/binding.json",
    "bytes": 8893,
    "sha256": "68f59e82e9e696ace8ed8ec14292b8387892c0d14321686f3edb9b7376d7e526"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/mechanism/protocol.json",
    "bytes": 13833,
    "sha256": "c1f23ee4477ce3fb23bb25056b6fc8feb1f5ab8b574bc0b0298fb96e971da17b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/preparation.json",
    "bytes": 38720,
    "sha256": "9ea4ed6523a79fa9769661f1a111b98eaf2309de05867e6c44e7e1f72aca8b36"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/run.py",
    "bytes": 7112,
    "sha256": "f9f619f2e23c97b085fe643ae23e687e6d1e6c309e4471e9855c3c1ce67a4ab9"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v383/checks.py",
    "bytes": 3733,
    "sha256": "067aae8a97f1c197891a186e31458ee15a8f51a6722f874c8e2a79fd0f4aac91"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v383/checks.stderr",
    "bytes": 583,
    "sha256": "4236db46ba46fdefe7254f9ca9e4cfd1a671ab5ef3e92eeb6d8e7e728b880630"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v383/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v383/mechanism/binding.json",
    "bytes": 8893,
    "sha256": "d94fb092335f8ca6d7383bb28d31fa51d291218515700d3d517a41eddbfdaadc"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v383/mechanism/protocol.json",
    "bytes": 13879,
    "sha256": "c16526e30248ebacf15b737f51c077cd888fdb84919023ca3b4939b4f86a6a65"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v383/preparation.json",
    "bytes": 39803,
    "sha256": "e3bb125256b6860982b22e341a6cd1617683a3379a2e3585053d2265126a826b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v383/run.py",
    "bytes": 7464,
    "sha256": "4c08723d8dc52b4b442cadaff87b0e9f27bbd4dfde36d67241674b5b58db1a21"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/build_driver.py",
    "bytes": 2625,
    "sha256": "159b644dccc77d45ddce64886ebc0052171134535c1003a02216517c1e20f4c7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/checks.py",
    "bytes": 5225,
    "sha256": "c62b37ab369df185ca3d147031ee258a3b903bc29ddc377c21a5a2d1166c38c2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/checks.stderr",
    "bytes": 934,
    "sha256": "e762d53741adba6d35727bef9185b743e80ee3669e6ab497abd9ef27f9588326"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/driver-transformation.json",
    "bytes": 1592,
    "sha256": "871132209f684139590ee6d4057df664e35489c340750ca99b621faaa79c25ab"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/serve_bench.py",
    "bytes": 60567,
    "sha256": "cd9b42730c9b2b32fd285fe059da093a70a379fff4c905510e46e1efb8db9272"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/startup_policy.py",
    "bytes": 1797,
    "sha256": "8cf6d5805ce5fee2338a6feb962172018cdbb566b61e2ea1470349f2fa6ce2ec"
  }
]
```

## Artifact SHA-256 037c885ba6ad51a9b5b7b79f89e614f415f1ace124f0fd5739297121da732f75

Encoding: `utf-8`. Original bytes: 3706.

````````````text
import copy
import inspect
import tempfile
import unittest
from pathlib import Path
from unittest import mock

import run


class BindingTests(unittest.TestCase):
    def test_only_explicit_startup_policy_and_provenance_change(self):
        value = run.load()
        old = run.original.materialize(run.NAME, value)
        current = run.materialize(run.NAME, value)
        self.assertEqual(current.pop('startup_swapin_policy'), 'exclude_pair')
        for key in ['label', 'classification', 'current_prerequisite_binding']:
            current[key] = old[key]
        self.assertEqual(current, old)

    def test_original_assessment_and_all_work_limits_unchanged(self):
        self.assertEqual(inspect.getsource(run.execution.assess_serving), inspect.getsource(run.original.assess_serving))
        self.assertEqual(run.original.LIMITS[run.NAME],
                         {'seconds': 5400, 'cleanup_seconds': 60, 'startup_gb': 18, 'owned_bytes': 14_000_000_000})

    def test_original_protocol_has_no_amendment(self):
        _, protocol = run.original.load_serving(run.NAME)
        self.assertNotIn('startup_swapin_policy', protocol)
        self.assertNotEqual(run.HERE, run.original.HERE)
        self.assertNotEqual(run.OUT, run.original.OUT)

    def test_changed_driver_or_prior_results_refused(self):
        with mock.patch.object(run, 'dependencies', return_value={'changed': 'bytes'}):
            with self.assertRaisesRegex(ValueError, 'binding or preserved evidence'): run.load()
        with mock.patch.object(run, 'preserved', return_value={'changed': 'bytes'}):
            with self.assertRaisesRegex(ValueError, 'binding or preserved evidence'): run.load()

    def test_prelaunch_failure_creates_no_attempt(self):
        value = run.load()
        with tempfile.TemporaryDirectory() as directory:
            here = Path(directory)
            with mock.patch.object(run, 'HERE', here), mock.patch.object(run, 'OUT', here / 'raw'), \
                 mock.patch.object(run.execution, 'load_serving', return_value=(value, run.materialize(run.NAME, value))), \
                 mock.patch.object(run.core, 'allowance', return_value=0), \
                 mock.patch.object(run.core, 'readiness', side_effect=ValueError('prelaunch refusal')):
                with self.assertRaisesRegex(ValueError, 'prelaunch refusal'): run.run('test')
            self.assertEqual(list(here.iterdir()), [])

    def test_isolated_driver_and_original_live_guard_are_dispatched(self):
        captured = {}
        class Inspected(Exception): pass
        def inspect_dispatch(command, target, seconds, policy, assess, limit, attempt, progress):
            captured.update(command=command, policy=policy, seconds=seconds, attempt=attempt)
            raise Inspected()
        with mock.patch.object(run.core, 'allowance', return_value=0), \
             mock.patch.object(run.core, 'readiness', return_value=(0, {}, {})), \
             mock.patch.object(run.core, 'execute', side_effect=inspect_dispatch):
            with self.assertRaises(Inspected): run.run('test')
        self.assertEqual(captured['command'][1], str(run.DRIVER))
        expected = dict(run.c.NATIVE_POLICY, startup_reclaimable_bytes=18_000_000_000,
                        maximum_owned_rss_bytes=14_000_000_000, maximum_build_seconds=5400)
        self.assertEqual(captured['policy'], expected)
        self.assertTrue(expected['stop_on_new_swapouts'])
        self.assertEqual(captured['seconds'], 5400)
        self.assertEqual(captured['attempt']['driver_sha256'], run.digest(run.DRIVER))
        self.assertFalse((run.HERE / run.NAME / 'execution').exists())


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 ef3419d9ca9afbc082c3332dfe1410922c2a3adb03cf72019d42f484303ab644

Encoding: `utf-8`. Original bytes: 1124.

````````````text
test_changed_driver_or_prior_results_refused (__main__.BindingTests) ... ok
test_isolated_driver_and_original_live_guard_are_dispatched (__main__.BindingTests) ... FAIL
test_only_explicit_startup_policy_and_provenance_change (__main__.BindingTests) ... ok
test_original_assessment_and_all_work_limits_unchanged (__main__.BindingTests) ... ok
test_original_protocol_has_no_amendment (__main__.BindingTests) ... ok
test_prelaunch_failure_creates_no_attempt (__main__.BindingTests) ... ok

======================================================================
FAIL: test_isolated_driver_and_original_live_guard_are_dispatched (__main__.BindingTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/checks.py", line 63, in test_isolated_driver_and_original_live_guard_are_dispatched
    self.assertTrue(expected['stop_on_new_swapouts'])
AssertionError: False is not true

----------------------------------------------------------------------
Ran 6 tests in 12.949s

FAILED (failures=1)

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 68f59e82e9e696ace8ed8ec14292b8387892c0d14321686f3edb9b7376d7e526

Encoding: `utf-8`. Original bytes: 8893.

````````````text
{
  "frozen_at": "2026-09-08T20:02:32.234724+00:00",
  "native_proof": {
    "image-reuse": {
      "assertions": 76,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse",
        "sha256": {
          "attempt.json": "771b5f6417dc0771b979fb606fa981ca9cc27100391aef6471ee8832c96246e8",
          "receipt.json": "b7013145b09f9639d0f08e8e72331f1dee4ae4d5f28b2fbb3cfb38fca1be8073",
          "stdout.txt": "e651d90a731a3f5d3ff48022247f967966c87e84cf80267d507643bff23b940a",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-capacity": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 104,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity",
        "sha256": {
          "attempt.json": "1f59fdb9f8f71471b741ab5da1dea7a620d0d55ad957c58cf2e8832571eecc84",
          "receipt.json": "ac41c79129a25b6d3c924cca0ff5d413c075f44500abf1579cbecf7233873a9a",
          "qualification.json": "1b05fca1bcc0e6e1d5280d76d763cdd86993159d1ef6ca4bce258f6d28c4be31",
          "stdout.txt": "2c901927e46b6cedaf1f41021c7dc3eeabec810b769d84f62ea599127bbad839",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-tower": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 47,
        "exact_tower_comparisons": 7
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower",
        "sha256": {
          "attempt.json": "c6c072174bd22437a9cfff5d6b1cdba560fe76fd7df831c8a2ea39b04c986e2f",
          "receipt.json": "def1a0f16113d865befb4a9ae9e7664ea1de9702a4ec4d6e917bd067a70b4f64",
          "qualification.json": "9881e16798d2d582fabe4b5b1dc4a574b0d7bd6e1a7ce1255f1007b416a989cd",
          "stdout.txt": "3d9d10f6e14592429833ce860fba18f93c0636562e11b7a1a5ef4e474f501219",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-maximum-reference": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 6,
        "exact_tower_comparisons": 1
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference",
        "sha256": {
          "attempt.json": "c854592080741f1b89cdd13e8a53f28a367acbc555b31269f10c53803c895564",
          "receipt.json": "7124977d30243802983d5b12fee13d8d57ad8c61114f672bb1e6a13a31dd019d",
          "qualification.json": "e63cea8cf10b1a66bfbd4ee1d43bed303352d2d3931273e47775b83bf4e53096",
          "stdout.txt": "fe745e31aca98b9279ff62bf9dca77c0f5bdff29331bc5119c03f35ec9aab21b",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "integrated-vision-query": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 270,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query",
        "sha256": {
          "attempt.json": "cb51513371bf901354ee7a5c18a915bc9803b43e1f88e32556535d8f781b3a26",
          "receipt.json": "78c48da1dda732f5d587fae8f2431ffed4de0c73ab4968857f4caa16fe21aebf",
          "qualification.json": "c3ae2a413e324bd8ee434171a376bbbf22a5968b18a42cf16ef05310b606353d",
          "stdout.txt": "ba0b480159626402785581bd32d99f3acb9058e8869c6f3f25e5468fda1182c5",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    },
    "integrated-vision-query-mtp": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 284,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query-mtp",
        "sha256": {
          "attempt.json": "8e6f53852c5233500f685cae6deb05634412ccc51fc3b38fbf08afc11193b25e",
          "receipt.json": "b8ff7f337bebef3ee60e3cf352f84911ac61e74929f1c01aa97fae3eac21ae9f",
          "qualification.json": "838dd35622c6c678b68e62c0a4da8ac16410a3c5d546303d007e5cc773188398",
          "stdout.txt": "93d96fe6910d93c8aafc70e56209b77348c9042ed9ebf922fa2cfe44275f5ec3",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    }
  },
  "full_photo_proof": {
    "assessment": {
      "completed": true,
      "passed": true,
      "qualified": true,
      "assertions": 25,
      "observed_query_tile_calls": 3699,
      "classification": "Current full-photo correctness only; no speed or capacity claim."
    },
    "execution": {
      "artifact-sha256.json": "a9f5a3accff494feb8be87726e193dc5a0f3af3182480a6a83e0cf1eb771b1e4",
      "attempt.json": "f7cf21242d28d909a719262ff2ba78aa9e193577631076d9d369f4dff65e4730",
      "memory.json": "b2c444364e5cdd242c05d728f69102e1ee8e48ec7962944487ad7099c00db6db",
      "memory.samples.jsonl": "0eef4f7352739ab5c4fb355659597b0ecada8506bb98b45b449c3f781c254183",
      "qualification.json": "ff110df04526a5b6ab85255a12a9d60cdc8d404b370e3f5db1f5b26fb48973f1",
      "receipt.json": "88f573eaa9e7d88d26814a2b39a7f5829655f154eb600092d39f64345b38bcd2",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "d4bbe6022cf576e58bdebca95699a3ef6057de1d0e6906af2857373d5b9604f5"
    },
    "responses": {
      "manifest.json": "b828e751a57e7cc873f4b1b2acf5e4de658071f59c1e20c5bd0bfbc46abbeda0",
      "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
      "responses/01.json": "ab7208066b2343ff2b96fd55a9ec12bdd2e3fbd7618d79592b6f8ab49b443f93",
      "responses/02.json": "d26fafed4905736921e7502eaafdcaad215d031963ce9e2925e49f0550ee1064",
      "responses/03.json": "2d107ffcb1498a67314a45eb2472d654ca39c011c0503ab0c33de1ab49e82d6f",
      "responses/04.json": "76b0ed9b8237e3eccc4aa241c4a5eb1421314e50cb446dffdb14a5be04ca1a5d",
      "responses/05.json": "6f9b2c9b60f3412d37153bfb6c025c86f60151b0d791fde58918e3a379e3966f",
      "responses/06.json": "859bb1b5c8c5667337ffefcc8f4638b699bcaf524d56a3443daddc495c8d8494",
      "responses/07.json": "3ed447c98fcf3c4c6606de82f7843d8d39d8d1769cb728880a6c64cffd94eade",
      "responses/08.json": "f253d697de09c98cc5fa238ea1f4fd290855877436c61c7f326f776d1aadadba",
      "responses/09.json": "883db051bdf30cec4eea1f3269983c4d66e439ffd84d2ef1de8d89c03c5f0870",
      "responses/10.json": "a54b6f1f40d1d395f680b5953fe2ccac9949a35fe8b4925c398b89e82aff1a42",
      "responses/11.json": "2deae304b73b9f1ed19540ea585876d4f8e88710f7dbf0719a4066f05ab7cc55",
      "responses/12.json": "f42e1c0f6b27b98021af11510f46c8f9f1292e52d52fe6e80a5a139b9f3c4893",
      "responses/13.json": "547cef490afe3bd61ad49877b9a9124be566b2d0e6db7792286b5eff13415cc2",
      "responses/14.json": "d196eda955d948557527e5172ee034671de90057c33a3be6bdd89be2eef1f638",
      "responses/15.json": "5140ab4324a64598672cbd42e9e341e489be03d544b6bf97666fe4f18afdb792",
      "responses/16.json": "385925c5dbdb012f72d65820da7b22430251e6ea33965ed092968631bb69d1e1",
      "responses/17.json": "16a806b64065ddf71055003297dd475d392a02b872618229ea881333628eb9c0",
      "responses/18.json": "3062ed5963fa6040a90e301c9d36138fc81e8cc377794ac6360da6ffb8e6a4e5",
      "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
      "server.stderr": "d87c78adff25b41b0c08409155b0d7c4368de79096765553ef548bd9e0925212",
      "server.stdout": "78206fe9a84122ee0c950cc409e57d7a496db3d49e4bf37102d50a8ac809dfb9",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "c0e0d887ea60228205da65de366ff981976ff1759c75103f3d5c1c448dad0ee0",
      "vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
      "vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
    }
  },
  "preparation_sha256": "9ea4ed6523a79fa9769661f1a111b98eaf2309de05867e6c44e7e1f72aca8b36",
  "protocol_sha256": "c1f23ee4477ce3fb23bb25056b6fc8feb1f5ab8b574bc0b0298fb96e971da17b"
}

````````````

## Artifact SHA-256 c1f23ee4477ce3fb23bb25056b6fc8feb1f5ab8b574bc0b0298fb96e971da17b

Encoding: `utf-8`. Original bytes: 13833.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
  "memory_gb": 12,
  "mtp": "off",
  "raw": false,
  "seed": 7,
  "rounds": 12,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 12000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    },
    "query": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "256",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "vision-mechanism-fixed-cohort-v382",
  "classification": "New complete fixed24-cell cohort. Isolated V381 driver records startup swap-in-only contamination and excludes that entire pair, then continues the original fixed cells without replacements. Physical/thermal/work/pressure/swap-out stops and original acceptance remain. No V369 rows are reused.",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt",
  "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "conditions": "Twelve fixed alternating fresh-server pairs,exactly640slots/native --pool-gb1.769472,one1536square image/9216patches,one output, MTP/prefix/elastic off. The NEWmeasured whole-request ceiling is12GBand host preflight requires18GBreclaimable. Both earlier10GBreference attempts already used640slots and remain excluded; the earlier assumption of more reference slots is corrected. Holding640slots under12GBdoes not validate a target-driven12GBplan or a10GBproduct request. Same current V304binary, image bytes, ordinary base, exact output/work/mechanism,200MBpeak saving in every clean pair,at most5percent median client regression,min5clean of12fixed pairs,nominal power/zeroVM,180second quiet/60second cooldown/immediate resource stop/no replacements. No prior result is pooled.",
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0,
    "minimum_sampled_peak_savings_bytes": 200000000
  },
  "frozen_binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
  "stop_on_workspace_contention": true,
  "think": false,
  "abort_on_resource_failure": true,
  "images": [
    {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-1536.png",
      "sha256": "03484e0f55cda3a29eef4bd35e1e2c086a943911c940a26100fbaddce07d7bbb"
    }
  ],
  "work_constraints": {
    "reference": {
      "encodedImages": {
        "min": 1,
        "max": 1
      },
      "reusedImageFeatures": {
        "min": 0,
        "max": 0
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 0,
        "max": 0
      },
      "visionQueryTileCalls": {
        "min": 0,
        "max": 0
      }
    },
    "query": {
      "encodedImages": {
        "min": 1,
        "max": 1
      },
      "reusedImageFeatures": {
        "min": 0,
        "max": 0
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 256,
        "max": 256
      },
      "visionQueryTileCalls": {
        "min": 972,
        "max": 972
      }
    }
  },
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeForwardPasses",
    "decodeModelTokens",
    "draftedTokens",
    "verifyPasses"
  ],
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "primary_metric": "Bounded mechanism/resource benefit at explicit640slots and12GBmeasured ceiling: min5clean pairs,at least200MBwhole-request sampled-peak saving each,at most5percent median client regression,exact IDs/text and required work. Report actual peaks and latency. Separate10GBcandidate-only capacity, target-driven accounting, combined and compatibility gates are still required before adopting query tiling.",
  "successor_basis": "New maximum-size hypothesis: at9216patches an unfused dense score domain has16*9216*9216elements, whereas256query tiles have16*256*9216elements. This logical domain reduction is not a measured allocation or saving. At1024pixels generation dominated the observed whole-request peak and the200MB gate failed. The max-size native tower is byte-exact and the previous max candidate-only serving run was swap-excluded; neither establishes paired resource savings. This study keeps the same gates and tests the supported maximum independently.",
  "predecessor_protocol": {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1024-protocol-v132.json",
    "sha256": "25941bca411884439b583915b592e9535e3ec8b2a1254f0f6d0bd91dd01a6fc8",
    "disposition": "V132 resource gate failed; preserved without rescoring or pooling"
  },
  "fixed_pool_slots": 640,
  "predecessor": {
    "runs": [
      "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-paired-serving-v157",
      "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-fixed-pool-serving-v158"
    ],
    "disposition": "Both reference cells actually640slots, over10GBand swap-excluded; no candidate or pair. Previous claimed pool reduction was incorrect and is explicitly superseded."
  },
  "large_vision_measurement": {
    "purpose": "Both reference and query256 can be compared with640slots under a newly declared12GBphysical ceiling after reference maxima exceeded10GB. No pool increase or target-planner claim."
  },
  "historical_conditions": "Twelve fixed alternating fresh-server pairs,exactly640slots/native --pool-gb1.769472,one1536square image/9216patches,one output, MTP/prefix/elastic off. The NEWmeasured whole-request ceiling is12GBand host preflight requires18GBreclaimable. Both earlier10GBreference attempts already used640slots and remain excluded; the earlier assumption of more reference slots is corrected. Holding640slots under12GBdoes not validate a target-driven12GBplan or a10GBproduct request. Same V125binary, image bytes, ordinary base, exact output/work/mechanism,200MBpeak saving in every clean pair,at most5percent median client regression,min5clean of12fixed pairs,nominal power/zeroVM,180second quiet/60second cooldown/immediate resource stop/no replacements. No prior result is pooled.",
  "historical_native_prerequisites": {
    "vision-query-tile-capacity": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-tile-capacity-v125/manifest.json",
      "sha256": "bf5748bee98d1e858e895b0b7ff92c1a0d853fe34ec0be40a96f859db9d66faf",
      "assertions": 104,
      "passed": true
    },
    "vision-query-tile-tower": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-tile-tower-v125/manifest.json",
      "sha256": "0d5a3d126384ed86cd333ff9f92024421b04de77445dcc953bf07c1a900a30db",
      "assertions": 47,
      "passed": true
    },
    "vision-query-maximum-reference": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-maximum-reference-v125/manifest.json",
      "sha256": "eb47718061d653f491d4fe60a9f2b6f56762920eb141642570b1279c0777b552",
      "assertions": 6,
      "passed": true
    },
    "image-reuse": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/image-reuse-v125/manifest.json",
      "sha256": "ee115fe202aa2e4a2fd8ed7919e522630693cb163564188241dffd09860a68ea",
      "assertions": 76,
      "passed": true
    },
    "integrated-vision-query": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/integrated-vision-query-v125/manifest.json",
      "sha256": "d1dca396f8809346508f80bc4d15e6f43b3aec94d389360a81d67bd1ba22306f",
      "assertions": 195,
      "passed": true
    },
    "integrated-vision-query-mtp": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/integrated-vision-query-mtp-v125/manifest.json",
      "sha256": "bc47daaf7f44a359a7493001c483e7b4594637f2fea9b959f41c5f4d63df6b88",
      "assertions": 209,
      "passed": true
    },
    "known-content-serving": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-serving-quality-v125/manifest.json",
      "sha256": "763b59bd8ed3b9cbed76e5b1f62173a09cfb6635f74c979e94d6ee9e1b92f0af",
      "assertions": 25,
      "passed": true
    }
  },
  "current_prerequisite_binding": "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/mechanism/binding.json",
  "startup_swapin_policy": "exclude_pair"
}

````````````

## Artifact SHA-256 9ea4ed6523a79fa9769661f1a111b98eaf2309de05867e6c44e7e1f72aca8b36

Encoding: `utf-8`. Original bytes: 38720.

````````````text
{
  "prepared_at": "2026-09-08T20:01:25.276544+00:00",
  "dependencies": {
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/run.py": "f9f619f2e23c97b085fe643ae23e687e6d1e6c309e4471e9855c3c1ce67a4ab9",
    "/private/tmp/slotstream-optimization-execution/resumed-vision-serving-v369/run.py": "7d772a3a994012d3e15a9b41de0f0e61e83a4ee28591eb24bd5f25fa4fd78024",
    "/private/tmp/slotstream-optimization-execution/resumed-vision-serving-v369/preparation.json": "cf9a4ff1ec57cdd597f63c1d09e1c91ebb7899eec5d66177b95d79d2aa1a655a",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/startup_policy.py": "8cf6d5805ce5fee2338a6feb962172018cdbb566b61e2ea1470349f2fa6ce2ec",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/build_driver.py": "159b644dccc77d45ddce64886ebc0052171134535c1003a02216517c1e20f4c7",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/serve_bench.py": "cd9b42730c9b2b32fd285fe059da093a70a379fff4c905510e46e1efb8db9272",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/driver-transformation.json": "871132209f684139590ee6d4057df664e35489c340750ca99b621faaa79c25ab",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/checks.py": "c62b37ab369df185ca3d147031ee258a3b903bc29ddc377c21a5a2d1166c38c2",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/checks.stderr": "e762d53741adba6d35727bef9185b743e80ee3669e6ab497abd9ef27f9588326"
  },
  "preserved": {
    "raw": {
      "1-query/response.ndjson": "8686508dd3117fd3af9c1b82f225936b1ff00e30dd5f4ce6f870a913368857d0",
      "1-query/result.json": "6ae6118c6702dacd5fa2cba40d3061697d6721ce0c8267aea5a560ca084b8698",
      "1-query/server.stderr": "9bd3bf999decb97ab9717b98c8b023738073749df0999835bbfce3fd3fbfdb4f",
      "1-query/server.stdout": "8cf94c4519062d28b5d95c93d4ff5b3da49199a673b93c2f8858de7a41b97bb6",
      "1-query/warmup.json": "e851296ea14ffa1844037d470bc37f13f4d499f5eaf39539931b2773bcd50828",
      "1-query/warmup.ndjson": "32e66d6c8b434e67f7dbc2665d2adc822aced26e00e852601f1863a365647172",
      "1-reference/response.ndjson": "99e8ada1e29b4d11af42eaea93c7a5ec18dd1be026a05cc31bd38710161e3a50",
      "1-reference/result.json": "fce64b28f51fd873a0b6b8c626fdbd9451b54733160d1f67e28eeed864189e61",
      "1-reference/server.stderr": "af73ab3a0d0d7c5adcdcc6d60afa2887ecf049f75bb4d71ff5e78cd0dc16fcb2",
      "1-reference/server.stdout": "5307c293f6cf2ac7caaf84a06cb6e744bb45d3b09ea4abbaeecffe98cad43e0c",
      "1-reference/warmup.json": "6b24be012d87dda3f8bce41efe88b28070b4c81dd6dc26b5a7fcde64f8ca7ed7",
      "1-reference/warmup.ndjson": "6bb696a99a96f6f1b3e7473d1393e38126be4f92ab28ce7d3ed622fc20d10acd",
      "2-query/result.json": "5e0117d60c97a46e1f712c704d1eb5b74e66de39fa790eb20d50899ec33c7999",
      "2-query/server.stderr": "9d55324a56e1ac2213bc36919e873c0656afabe560a993f5edcae533c6fcc67e",
      "2-query/server.stdout": "20e8779f540436816a9c392552c6419ade4b551bbc46baae147ab7317a556d11",
      "2-query/warmup.json": "fc150da2dc6b82679bce51c99cfcebfab21a7e6696a740a68b367c2e178635e3",
      "2-query/warmup.ndjson": "6f016570fbdbfbb3c44dbe19fe92e877296d0916da1115d9c189344fdd1085e8",
      "build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "completion.json": "9bed2bc0b3ff324c35c6bf410f407146ba1803b46a0ce3129ed3ca583ea44452",
      "fixture.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
      "image-0.png": "03484e0f55cda3a29eef4bd35e1e2c086a943911c940a26100fbaddce07d7bbb",
      "initial-workspace-quiet.json": "64b45b90151fd2d43b20764da0f0943ccd5bf43f8e0e99f31db967f232d9b9fb",
      "manifest.json": "c21793284e13ee4715a0f4bf3cf37b1d371fc2dd55cc1fc7dbd43a73859e1763",
      "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
      "query-build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "reference-build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "request.json": "216f21df78c999613ff8cc13b23c464c0a898840de04c8fabbf1d8747c0bb4d0",
      "results.jsonl": "b1ea5665152615fc32fdaafd669086cd4887f70daaf89ad6d735db9e02911932",
      "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
      "startup-summary.json": "3c84d6c0a542cf443b51948d9951df7dae06cba85f3c1d03e14b4be29a09afed",
      "summary.json": "d402c18ebb58c15bebc4b7a2d4b6ff8351f374c04a6c7b1a4c7b3335512404a2"
    },
    "execution": {
      "binding.json": "bbc40b8879c562ba3fc9c3a4e09591dffd3a1f96d6887f5b0594b0d610571366",
      "execution/artifact-sha256.json": "d75a10a5d5a04736fac18ae8a7f97de7cc7e65ef871247622552614d57eac2f1",
      "execution/attempt.json": "f76adf0807e6b368da553ca76e4d12c5d0360d07150b962f39d8653187fafc55",
      "execution/memory.json": "79b005e6cf7978d8e58b182a5684fd815b4b7d27dba2390943876906db24c2b2",
      "execution/memory.samples.jsonl": "d8a286871d4333a9a3f8655d357c1ce5bb5fffededa0b6bfa666459aea339b09",
      "execution/qualification.json": "a210fab684c41bf09f0d536319a0a705815c21487f001be23019e96d8d31bafe",
      "execution/receipt.json": "61a5076b97e06435c1e49aed1bb78578c21f2b62fc65628e82db6f61e9bf6e23",
      "execution/stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "execution/stdout.txt": "07f80f8a7e8b9a698f89b5ed595df2383a0b0f4963a7241d8aeb8450fc9dc311",
      "protocol.json": "627167064e916d904445efd628289037597bef9d4fa064c3605558a470445788"
    }
  },
  "identity": {
    "build": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "identity": {
        "source": {
          "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
          "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
          "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
          "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
          "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
          "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
          "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
          "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
          "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
          "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
          "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
          "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
          "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
          "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
          "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
          "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
          "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
          "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
          "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
          "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
          "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
          "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
          "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
          "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
          "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
          "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
          "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
          "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
          "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
          "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
          "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
          "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
          "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
          "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
          "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
          "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
          "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
          "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
          "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
          "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
          "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
          "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
          "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
          "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
          "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
          "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
          "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
          "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
          "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
          "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
          "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
          "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
          "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
          "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
          "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
          "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
          "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
          "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
          "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
          "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
          "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
          "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
          "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
          "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
          "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
          "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
          "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
          "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
          "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
          "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
          "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
          "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
          "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
          "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
          "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
          "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
          "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
          "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
          "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
          "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
          "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
          "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
          "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
          "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
          "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
          "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
          "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
          "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
          "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
          "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
          "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
          "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
          "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
          "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
          "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
          "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
          "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
          "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
          "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
          "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
          "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
          "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
          "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
          "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
          "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
          "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
          "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
          "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
          "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
          "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
          "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
          "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
          "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
          "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
          "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
          "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
          "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
          "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
          "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
          "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
          "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
          "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
          "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
          "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
          "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
          "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
          "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
          "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
          "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
          "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
          "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
          "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
          "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
          "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
          "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
          "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
          "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
          "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
          "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
          "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
          "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
          "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
        },
        "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
        "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
        "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
      }
    },
    "shared_proof": {
      "native": {
        "combined-plain": {
          "assertions": 242
        },
        "combined-mtp": {
          "assertions": 256
        },
        "read-failure-serving": {
          "assertions": 522
        }
      },
      "contract_sha256": "dd1bada1296a7e69a034e7c674a92779b7d0f362dcd3dcfdb2cd2308baf8dbd0",
      "artifacts": {
        "combined-plain": {
          "attempt.json": "7b1e711fa6ac8ec6fbc645ca94fe31732fced532878346ac734900fde76aa347",
          "evidence/manifest.json": "453557bf65cc56bc5856c6429ae254334c66755be32aa68a118ba6cd896e24d8",
          "evidence/memory.json": "2ce21c1ee8727c738601e2f0102ee2776339aca07423dfd4c9f9e116dba69400",
          "evidence/memory.samples.jsonl": "72176921e73519090bc7199de8053c4e2d3784e0ee041affd4a9763b46b3f3bb",
          "evidence/stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6",
          "evidence/stdout.txt": "8a0a9c741b2f596ad116e676c5117dd2b371055f8adc6364be409baca291e799",
          "receipt.json": "28a8f56d18448e48349b940149f52003bdc1ded4825c7c0863e81bb15ea02b00"
        },
        "combined-mtp": {
          "attempt.json": "2f71f158d1926a34f7aadb080daecc0505202b310986343f096241b8a31d9a80",
          "evidence/manifest.json": "b65d67d4111131a43a8d8009c2401ea120524030bcd46607d78690a19e5e2f68",
          "evidence/memory.json": "f5cdbd70ab3d9005489a3002fef1a2717a2c9013878eeb52d1a68cbcd4e3c237",
          "evidence/memory.samples.jsonl": "f2743063298d4394cbf22cacd07f562fbfee7760d712be76d3aa8e813a15e257",
          "evidence/stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6",
          "evidence/stdout.txt": "0e553341f8c0644b29f8018bfdc4c53d29dd91858f1f1745c2af5973da6f09b6",
          "receipt.json": "459d6dfd9b3bce20fd9c0f71ad1e14605f276a1667a2b1a1ef916d605571ae4c"
        },
        "read-failure-serving": {
          "attempt.json": "c6c91c72707e6a1b1d883b4036f29ebd01af37c681becf59f366bbdf480c1c1b",
          "evidence/manifest.json": "348eac2b9399dca5d7d321a8056d0da67b3df1d0aa802f786722eba7603575ad",
          "evidence/memory.json": "9221cbdf26d3e69b9276043fb8384066749eb7c5fbf6ac3652e9f722f95ad296",
          "evidence/memory.samples.jsonl": "3fe98e3969483d4863f049448d1f02c7f378367b14fdbb1229b55554e899cee8",
          "evidence/stderr.txt": "e4836406b1037cc8e75db6dd0c37940f44fe387423be5d44e1d0e78a606d2094",
          "evidence/stdout.txt": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
          "receipt.json": "13cf575020da6f2547ea668de284f6fc8aef908987b160e6dfa984d6eef386d1"
        }
      }
    },
    "native_helper_sha256": "e75dce5e5635bdd3cfee834045743b80d65e7f1d73e174cb69d4016945a9523f",
    "native_preparation_sha256": "1b1939f23e1fc8628ab71ff2cd1078a0daa0636d0ab445215cd14ac6c070af8f",
    "core_helper_sha256": "5793aa8bcb3af55fb99c9da698475ee54272ee791ccef30141c94ba6c405b95f",
    "core_preparation_sha256": "3479e62de5ffbe569b3bd0f9c63953a3cfec0bbaea197ba8b6237b1e43b5f974",
    "original_protocol_sha256": {
      "mechanism": "c7dcbf0dc06a700d7fb772fd115493c4919bea3e567ee94049fcbb7f9277c8d7",
      "capacity": "249763ff5d17a05382545b33fc840e01855599229d955bee150ba7a2133e5325"
    },
    "drivers": {
      "vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
      "vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb",
      "vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040"
    },
    "fixture_sha256": {
      "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
      "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-1536.png": "03484e0f55cda3a29eef4bd35e1e2c086a943911c940a26100fbaddce07d7bbb",
      "/Users/carlos/Projects/slotstream/Tools/assets/vision_test/secret1.jpg": "427250bd24a93e98cac3d4ae83619040aa167dde63fa6e7272117bd9a1a17e7d",
      "/Users/carlos/Projects/slotstream/Tools/assets/vision_test/secret2.jpg": "41802c151fbfc248f0af72790fe0eeba00cbbd6632c3ccd5200fef5421d2610f"
    }
  },
  "native_proof": {
    "image-reuse": {
      "assertions": 76,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse",
        "sha256": {
          "attempt.json": "771b5f6417dc0771b979fb606fa981ca9cc27100391aef6471ee8832c96246e8",
          "receipt.json": "b7013145b09f9639d0f08e8e72331f1dee4ae4d5f28b2fbb3cfb38fca1be8073",
          "stdout.txt": "e651d90a731a3f5d3ff48022247f967966c87e84cf80267d507643bff23b940a",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-capacity": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 104,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity",
        "sha256": {
          "attempt.json": "1f59fdb9f8f71471b741ab5da1dea7a620d0d55ad957c58cf2e8832571eecc84",
          "receipt.json": "ac41c79129a25b6d3c924cca0ff5d413c075f44500abf1579cbecf7233873a9a",
          "qualification.json": "1b05fca1bcc0e6e1d5280d76d763cdd86993159d1ef6ca4bce258f6d28c4be31",
          "stdout.txt": "2c901927e46b6cedaf1f41021c7dc3eeabec810b769d84f62ea599127bbad839",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-tower": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 47,
        "exact_tower_comparisons": 7
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower",
        "sha256": {
          "attempt.json": "c6c072174bd22437a9cfff5d6b1cdba560fe76fd7df831c8a2ea39b04c986e2f",
          "receipt.json": "def1a0f16113d865befb4a9ae9e7664ea1de9702a4ec4d6e917bd067a70b4f64",
          "qualification.json": "9881e16798d2d582fabe4b5b1dc4a574b0d7bd6e1a7ce1255f1007b416a989cd",
          "stdout.txt": "3d9d10f6e14592429833ce860fba18f93c0636562e11b7a1a5ef4e474f501219",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-maximum-reference": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 6,
        "exact_tower_comparisons": 1
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference",
        "sha256": {
          "attempt.json": "c854592080741f1b89cdd13e8a53f28a367acbc555b31269f10c53803c895564",
          "receipt.json": "7124977d30243802983d5b12fee13d8d57ad8c61114f672bb1e6a13a31dd019d",
          "qualification.json": "e63cea8cf10b1a66bfbd4ee1d43bed303352d2d3931273e47775b83bf4e53096",
          "stdout.txt": "fe745e31aca98b9279ff62bf9dca77c0f5bdff29331bc5119c03f35ec9aab21b",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "integrated-vision-query": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 270,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query",
        "sha256": {
          "attempt.json": "cb51513371bf901354ee7a5c18a915bc9803b43e1f88e32556535d8f781b3a26",
          "receipt.json": "78c48da1dda732f5d587fae8f2431ffed4de0c73ab4968857f4caa16fe21aebf",
          "qualification.json": "c3ae2a413e324bd8ee434171a376bbbf22a5968b18a42cf16ef05310b606353d",
          "stdout.txt": "ba0b480159626402785581bd32d99f3acb9058e8869c6f3f25e5468fda1182c5",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    },
    "integrated-vision-query-mtp": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 284,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query-mtp",
        "sha256": {
          "attempt.json": "8e6f53852c5233500f685cae6deb05634412ccc51fc3b38fbf08afc11193b25e",
          "receipt.json": "b8ff7f337bebef3ee60e3cf352f84911ac61e74929f1c01aa97fae3eac21ae9f",
          "qualification.json": "838dd35622c6c678b68e62c0a4da8ac16410a3c5d546303d007e5cc773188398",
          "stdout.txt": "93d96fe6910d93c8aafc70e56209b77348c9042ed9ebf922fa2cfe44275f5ec3",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    }
  },
  "photo_proof": {
    "assessment": {
      "completed": true,
      "passed": true,
      "qualified": true,
      "assertions": 25,
      "observed_query_tile_calls": 3699,
      "classification": "Current full-photo correctness only; no speed or capacity claim."
    },
    "execution": {
      "artifact-sha256.json": "a9f5a3accff494feb8be87726e193dc5a0f3af3182480a6a83e0cf1eb771b1e4",
      "attempt.json": "f7cf21242d28d909a719262ff2ba78aa9e193577631076d9d369f4dff65e4730",
      "memory.json": "b2c444364e5cdd242c05d728f69102e1ee8e48ec7962944487ad7099c00db6db",
      "memory.samples.jsonl": "0eef4f7352739ab5c4fb355659597b0ecada8506bb98b45b449c3f781c254183",
      "qualification.json": "ff110df04526a5b6ab85255a12a9d60cdc8d404b370e3f5db1f5b26fb48973f1",
      "receipt.json": "88f573eaa9e7d88d26814a2b39a7f5829655f154eb600092d39f64345b38bcd2",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "d4bbe6022cf576e58bdebca95699a3ef6057de1d0e6906af2857373d5b9604f5"
    },
    "responses": {
      "manifest.json": "b828e751a57e7cc873f4b1b2acf5e4de658071f59c1e20c5bd0bfbc46abbeda0",
      "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
      "responses/01.json": "ab7208066b2343ff2b96fd55a9ec12bdd2e3fbd7618d79592b6f8ab49b443f93",
      "responses/02.json": "d26fafed4905736921e7502eaafdcaad215d031963ce9e2925e49f0550ee1064",
      "responses/03.json": "2d107ffcb1498a67314a45eb2472d654ca39c011c0503ab0c33de1ab49e82d6f",
      "responses/04.json": "76b0ed9b8237e3eccc4aa241c4a5eb1421314e50cb446dffdb14a5be04ca1a5d",
      "responses/05.json": "6f9b2c9b60f3412d37153bfb6c025c86f60151b0d791fde58918e3a379e3966f",
      "responses/06.json": "859bb1b5c8c5667337ffefcc8f4638b699bcaf524d56a3443daddc495c8d8494",
      "responses/07.json": "3ed447c98fcf3c4c6606de82f7843d8d39d8d1769cb728880a6c64cffd94eade",
      "responses/08.json": "f253d697de09c98cc5fa238ea1f4fd290855877436c61c7f326f776d1aadadba",
      "responses/09.json": "883db051bdf30cec4eea1f3269983c4d66e439ffd84d2ef1de8d89c03c5f0870",
      "responses/10.json": "a54b6f1f40d1d395f680b5953fe2ccac9949a35fe8b4925c398b89e82aff1a42",
      "responses/11.json": "2deae304b73b9f1ed19540ea585876d4f8e88710f7dbf0719a4066f05ab7cc55",
      "responses/12.json": "f42e1c0f6b27b98021af11510f46c8f9f1292e52d52fe6e80a5a139b9f3c4893",
      "responses/13.json": "547cef490afe3bd61ad49877b9a9124be566b2d0e6db7792286b5eff13415cc2",
      "responses/14.json": "d196eda955d948557527e5172ee034671de90057c33a3be6bdd89be2eef1f638",
      "responses/15.json": "5140ab4324a64598672cbd42e9e341e489be03d544b6bf97666fe4f18afdb792",
      "responses/16.json": "385925c5dbdb012f72d65820da7b22430251e6ea33965ed092968631bb69d1e1",
      "responses/17.json": "16a806b64065ddf71055003297dd475d392a02b872618229ea881333628eb9c0",
      "responses/18.json": "3062ed5963fa6040a90e301c9d36138fc81e8cc377794ac6360da6ffb8e6a4e5",
      "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
      "server.stderr": "d87c78adff25b41b0c08409155b0d7c4368de79096765553ef548bd9e0925212",
      "server.stdout": "78206fe9a84122ee0c950cc409e57d7a496db3d49e4bf37102d50a8ac809dfb9",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "c0e0d887ea60228205da65de366ff981976ff1759c75103f3d5c1c448dad0ee0",
      "vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
      "vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
    }
  },
  "limits": {
    "seconds": 5400,
    "cleanup_seconds": 60,
    "startup_gb": 18,
    "owned_bytes": 14000000000
  },
  "classification": "New complete fixed24-cell cohort. Isolated V381 driver records startup swap-in-only contamination and excludes that entire pair, then continues the original fixed cells without replacements. Physical/thermal/work/pressure/swap-out stops and original acceptance remain. No V369 rows are reused.",
  "model_executed": false
}

````````````

## Artifact SHA-256 f9f619f2e23c97b085fe643ae23e687e6d1e6c309e4471e9855c3c1ce67a4ab9

Encoding: `utf-8`. Original bytes: 7112.

````````````text
"""New fixed cohort with explicit startup swap-in pair exclusion.

No prior measurements are reused. All numerical, workload, timing acceptance,
capacity, pressure, swap-out and cleanup checks retain their original values.
"""
import argparse
import copy
import fcntl
import importlib.util
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
ORIGINAL = BASE / 'resumed-vision-serving-v369/run.py'
POLICY = BASE / 'vision-startup-swapin-policy-v381'
DRIVER = POLICY / 'serve_bench.py'


def module(name):
    spec = importlib.util.spec_from_file_location(name, ORIGINAL)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


original = module('vision_v369_preserved')
execution = module('vision_v382_assessment')
c, core, digest, require = original.c, original.core, original.digest, original.require
OUT = original.ROOT / '.build/optimization/vision-mechanism-fixed-cohort-v382'
NAME = 'mechanism'


def dependencies():
    files = [Path(__file__), ORIGINAL, original.HERE / 'preparation.json',
             POLICY / 'startup_policy.py', POLICY / 'build_driver.py', DRIVER,
             POLICY / 'driver-transformation.json', POLICY / 'checks.py', POLICY / 'checks.stderr']
    return {str(p.resolve()): digest(p) for p in files}


def preserved():
    completion = c.read(original.OUT / NAME / 'completion.json')
    receipt = c.read(original.HERE / NAME / 'execution/qualification.json')
    require(completion.get('recorded_cells') == 3 and completion.get('stopped_early') is True
            and receipt.get('completed') is False and receipt.get('qualified') is False
            and receipt.get('cleanup_complete') is True, 'original stopped cohort changed or did not drain')
    return {'raw': c.artifact_hashes(original.OUT / NAME),
            'execution': c.artifact_hashes(original.HERE / NAME)}


def materialize(name, value):
    require(name == NAME, 'only the large-image mechanism study is authorized by this binding')
    p = original.materialize(name, value)
    p['label'] = 'vision-mechanism-fixed-cohort-v382'
    p['classification'] = ('New complete fixed24-cell cohort. Isolated V381 driver records startup swap-in-only '
        'contamination and excludes that entire pair, then continues the original fixed cells without replacements. '
        'Physical/thermal/work/pressure/swap-out stops and original acceptance remain. No V369 rows are reused.')
    p['startup_swapin_policy'] = 'exclude_pair'
    p['current_prerequisite_binding'] = str(HERE / NAME / 'binding.json')
    return p


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'already prepared or attempted')
    value = original.load()
    old = original.materialize(NAME, value)
    new = materialize(NAME, value)
    restored = copy.deepcopy(new); restored.pop('startup_swapin_policy')
    for key in ('label', 'classification', 'current_prerequisite_binding'): restored[key] = old[key]
    require(restored == old, 'original workload, controls or acceptance differs')
    require('Ran 11 tests' in (POLICY / 'checks.stderr').read_text()
            and (POLICY / 'checks.stderr').read_text().endswith('OK\n'), 'policy checks have not passed')
    record = {'prepared_at': core.now(), 'dependencies': dependencies(), 'preserved': preserved(),
              'identity': value['identity'], 'native_proof': original.native_proofs(),
              'photo_proof': original.quality_proof(), 'limits': original.LIMITS[NAME],
              'classification': new['classification'], 'model_executed': False}
    c.write_new(HERE / 'preparation.json', record)
    return {'prepared': True, 'fixed_cells': 24, 'original_acceptance_unchanged': True, 'model_executed': False}


def load():
    record, value = c.read(HERE / 'preparation.json'), original.load()
    require(record['dependencies'] == dependencies() and record['preserved'] == preserved()
            and record['identity'] == value['identity'] and record['native_proof'] == original.native_proofs()
            and record['photo_proof'] == original.quality_proof()
            and record['limits'] == original.LIMITS[NAME], 'new binding or preserved evidence changed')
    return value


execution.HERE, execution.OUT = HERE, OUT
execution.load = load
execution.materialize = materialize
execution.native_proofs = original.native_proofs
execution.quality_proof = original.quality_proof


def run(deadline):
    lim = original.LIMITS[NAME]
    core.allowance(deadline, lim['seconds'] + lim['cleanup_seconds'])
    value, protocol = execution.load_serving(NAME)
    target, output = HERE / NAME / 'execution', OUT / NAME
    require(not target.exists() and not output.exists(), 'attempted cohort cannot retry')
    limit, before, thermal = core.readiness(deadline, lim['seconds'] + lim['cleanup_seconds'], lim['startup_gb'])
    policy = dict(c.NATIVE_POLICY, startup_reclaimable_bytes=int(lim['startup_gb'] * 1e9),
                  maximum_owned_rss_bytes=lim['owned_bytes'], maximum_build_seconds=lim['seconds'])
    command = [sys.executable, str(DRIVER), '--protocol',
               str(HERE / NAME / 'protocol.json'), '--out', str(output)]
    attempt = {'started_at': core.now(), 'deadline_utc': deadline, 'command': command, 'environment': {},
               'build': value['identity']['build'], 'native_proof': original.native_proofs(),
               'before': before, 'thermal_prelaunch': thermal, 'policy': policy,
               'protocol_sha256': digest(HERE / NAME / 'protocol.json'), 'driver_sha256': digest(DRIVER),
               'preparation_sha256': digest(HERE / 'preparation.json'), 'classification': protocol['classification']}
    def assess(code):
        require(code in (0, 1), 'large-image driver failed')
        return execution.assess_serving(NAME)
    result = execution.finalize(target, core.execute(command, target, lim['seconds'], policy,
                                assess, limit, attempt, output / 'results.jsonl'))
    if output.exists(): c.write_new(target / 'artifact-sha256.json', c.artifact_hashes(output))
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=['prepare', 'status', 'freeze', 'run'])
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.action == 'prepare': result = prepare()
        elif args.action == 'freeze': result = execution.freeze_serving(NAME)
        elif args.action == 'status':
            load(); result = {'frozen': (HERE / NAME / 'protocol.json').exists(), 'attempted': (OUT / NAME).exists()}
        else:
            require(args.deadline is not None, 'full user-authorized interval required')
            result = run(args.deadline)
    print(json.dumps(result, indent=2), flush=True)
    return 1 if args.action == 'run' and result.get('qualified') is not True else 0


if __name__ == '__main__':
    raise SystemExit(main())

````````````

## Artifact SHA-256 067aae8a97f1c197891a186e31458ee15a8f51a6722f874c8e2a79fd0f4aac91

Encoding: `utf-8`. Original bytes: 3733.

````````````text
import copy
import inspect
import tempfile
import unittest
from pathlib import Path
from unittest import mock

import run


class BindingTests(unittest.TestCase):
    def test_only_explicit_startup_policy_and_provenance_change(self):
        value = run.load()
        old = run.original.materialize(run.NAME, value)
        current = run.materialize(run.NAME, value)
        self.assertEqual(current.pop('startup_swapin_policy'), 'exclude_pair')
        for key in ['label', 'classification', 'current_prerequisite_binding']:
            current[key] = old[key]
        self.assertEqual(current, old)

    def test_original_assessment_and_all_work_limits_unchanged(self):
        self.assertEqual(inspect.getsource(run.execution.assess_serving), inspect.getsource(run.original.assess_serving))
        self.assertEqual(run.original.LIMITS[run.NAME],
                         {'seconds': 5400, 'cleanup_seconds': 60, 'startup_gb': 18, 'owned_bytes': 14_000_000_000})

    def test_original_protocol_has_no_amendment(self):
        _, protocol = run.original.load_serving(run.NAME)
        self.assertNotIn('startup_swapin_policy', protocol)
        self.assertNotEqual(run.HERE, run.original.HERE)
        self.assertNotEqual(run.OUT, run.original.OUT)

    def test_changed_driver_or_prior_results_refused(self):
        with mock.patch.object(run, 'dependencies', return_value={'changed': 'bytes'}):
            with self.assertRaisesRegex(ValueError, 'binding or preserved evidence'): run.load()
        with mock.patch.object(run, 'preserved', return_value={'changed': 'bytes'}):
            with self.assertRaisesRegex(ValueError, 'binding or preserved evidence'): run.load()

    def test_prelaunch_failure_creates_no_attempt(self):
        value = run.load()
        with tempfile.TemporaryDirectory() as directory:
            here = Path(directory)
            with mock.patch.object(run, 'HERE', here), mock.patch.object(run, 'OUT', here / 'raw'), \
                 mock.patch.object(run.execution, 'load_serving', return_value=(value, run.materialize(run.NAME, value))), \
                 mock.patch.object(run.core, 'allowance', return_value=0), \
                 mock.patch.object(run.core, 'readiness', side_effect=ValueError('prelaunch refusal')):
                with self.assertRaisesRegex(ValueError, 'prelaunch refusal'): run.run('test')
            self.assertEqual(list(here.iterdir()), [])

    def test_isolated_driver_and_original_live_guard_are_dispatched(self):
        captured = {}
        class Inspected(Exception): pass
        def inspect_dispatch(command, target, seconds, policy, assess, limit, attempt, progress):
            captured.update(command=command, policy=policy, seconds=seconds, attempt=attempt)
            raise Inspected()
        with mock.patch.object(run.core, 'allowance', return_value=0), \
             mock.patch.object(run.core, 'readiness', return_value=(0, {}, {})), \
             mock.patch.object(run.core, 'execute', side_effect=inspect_dispatch):
            with self.assertRaises(Inspected): run.run('test')
        self.assertEqual(captured['command'][1], str(run.DRIVER))
        expected = dict(run.c.NATIVE_POLICY, startup_reclaimable_bytes=18_000_000_000,
                        maximum_owned_rss_bytes=14_000_000_000, maximum_build_seconds=5400, stop_on_new_swapouts=True)
        self.assertEqual(captured['policy'], expected)
        self.assertTrue(expected['stop_on_new_swapouts'])
        self.assertEqual(captured['seconds'], 5400)
        self.assertEqual(captured['attempt']['driver_sha256'], run.digest(run.DRIVER))
        self.assertFalse((run.HERE / run.NAME / 'execution').exists())


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 4236db46ba46fdefe7254f9ca9e4cfd1a671ab5ef3e92eeb6d8e7e728b880630

Encoding: `utf-8`. Original bytes: 583.

````````````text
test_changed_driver_or_prior_results_refused (__main__.BindingTests) ... ok
test_isolated_driver_and_original_live_guard_are_dispatched (__main__.BindingTests) ... ok
test_only_explicit_startup_policy_and_provenance_change (__main__.BindingTests) ... ok
test_original_assessment_and_all_work_limits_unchanged (__main__.BindingTests) ... ok
test_original_protocol_has_no_amendment (__main__.BindingTests) ... ok
test_prelaunch_failure_creates_no_attempt (__main__.BindingTests) ... ok

----------------------------------------------------------------------
Ran 6 tests in 13.031s

OK

````````````

## Artifact SHA-256 d94fb092335f8ca6d7383bb28d31fa51d291218515700d3d517a41eddbfdaadc

Encoding: `utf-8`. Original bytes: 8893.

````````````text
{
  "frozen_at": "2026-09-08T20:04:58.875821+00:00",
  "native_proof": {
    "image-reuse": {
      "assertions": 76,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse",
        "sha256": {
          "attempt.json": "771b5f6417dc0771b979fb606fa981ca9cc27100391aef6471ee8832c96246e8",
          "receipt.json": "b7013145b09f9639d0f08e8e72331f1dee4ae4d5f28b2fbb3cfb38fca1be8073",
          "stdout.txt": "e651d90a731a3f5d3ff48022247f967966c87e84cf80267d507643bff23b940a",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-capacity": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 104,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity",
        "sha256": {
          "attempt.json": "1f59fdb9f8f71471b741ab5da1dea7a620d0d55ad957c58cf2e8832571eecc84",
          "receipt.json": "ac41c79129a25b6d3c924cca0ff5d413c075f44500abf1579cbecf7233873a9a",
          "qualification.json": "1b05fca1bcc0e6e1d5280d76d763cdd86993159d1ef6ca4bce258f6d28c4be31",
          "stdout.txt": "2c901927e46b6cedaf1f41021c7dc3eeabec810b769d84f62ea599127bbad839",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-tower": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 47,
        "exact_tower_comparisons": 7
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower",
        "sha256": {
          "attempt.json": "c6c072174bd22437a9cfff5d6b1cdba560fe76fd7df831c8a2ea39b04c986e2f",
          "receipt.json": "def1a0f16113d865befb4a9ae9e7664ea1de9702a4ec4d6e917bd067a70b4f64",
          "qualification.json": "9881e16798d2d582fabe4b5b1dc4a574b0d7bd6e1a7ce1255f1007b416a989cd",
          "stdout.txt": "3d9d10f6e14592429833ce860fba18f93c0636562e11b7a1a5ef4e474f501219",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-maximum-reference": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 6,
        "exact_tower_comparisons": 1
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference",
        "sha256": {
          "attempt.json": "c854592080741f1b89cdd13e8a53f28a367acbc555b31269f10c53803c895564",
          "receipt.json": "7124977d30243802983d5b12fee13d8d57ad8c61114f672bb1e6a13a31dd019d",
          "qualification.json": "e63cea8cf10b1a66bfbd4ee1d43bed303352d2d3931273e47775b83bf4e53096",
          "stdout.txt": "fe745e31aca98b9279ff62bf9dca77c0f5bdff29331bc5119c03f35ec9aab21b",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "integrated-vision-query": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 270,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query",
        "sha256": {
          "attempt.json": "cb51513371bf901354ee7a5c18a915bc9803b43e1f88e32556535d8f781b3a26",
          "receipt.json": "78c48da1dda732f5d587fae8f2431ffed4de0c73ab4968857f4caa16fe21aebf",
          "qualification.json": "c3ae2a413e324bd8ee434171a376bbbf22a5968b18a42cf16ef05310b606353d",
          "stdout.txt": "ba0b480159626402785581bd32d99f3acb9058e8869c6f3f25e5468fda1182c5",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    },
    "integrated-vision-query-mtp": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 284,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query-mtp",
        "sha256": {
          "attempt.json": "8e6f53852c5233500f685cae6deb05634412ccc51fc3b38fbf08afc11193b25e",
          "receipt.json": "b8ff7f337bebef3ee60e3cf352f84911ac61e74929f1c01aa97fae3eac21ae9f",
          "qualification.json": "838dd35622c6c678b68e62c0a4da8ac16410a3c5d546303d007e5cc773188398",
          "stdout.txt": "93d96fe6910d93c8aafc70e56209b77348c9042ed9ebf922fa2cfe44275f5ec3",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    }
  },
  "full_photo_proof": {
    "assessment": {
      "completed": true,
      "passed": true,
      "qualified": true,
      "assertions": 25,
      "observed_query_tile_calls": 3699,
      "classification": "Current full-photo correctness only; no speed or capacity claim."
    },
    "execution": {
      "artifact-sha256.json": "a9f5a3accff494feb8be87726e193dc5a0f3af3182480a6a83e0cf1eb771b1e4",
      "attempt.json": "f7cf21242d28d909a719262ff2ba78aa9e193577631076d9d369f4dff65e4730",
      "memory.json": "b2c444364e5cdd242c05d728f69102e1ee8e48ec7962944487ad7099c00db6db",
      "memory.samples.jsonl": "0eef4f7352739ab5c4fb355659597b0ecada8506bb98b45b449c3f781c254183",
      "qualification.json": "ff110df04526a5b6ab85255a12a9d60cdc8d404b370e3f5db1f5b26fb48973f1",
      "receipt.json": "88f573eaa9e7d88d26814a2b39a7f5829655f154eb600092d39f64345b38bcd2",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "d4bbe6022cf576e58bdebca95699a3ef6057de1d0e6906af2857373d5b9604f5"
    },
    "responses": {
      "manifest.json": "b828e751a57e7cc873f4b1b2acf5e4de658071f59c1e20c5bd0bfbc46abbeda0",
      "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
      "responses/01.json": "ab7208066b2343ff2b96fd55a9ec12bdd2e3fbd7618d79592b6f8ab49b443f93",
      "responses/02.json": "d26fafed4905736921e7502eaafdcaad215d031963ce9e2925e49f0550ee1064",
      "responses/03.json": "2d107ffcb1498a67314a45eb2472d654ca39c011c0503ab0c33de1ab49e82d6f",
      "responses/04.json": "76b0ed9b8237e3eccc4aa241c4a5eb1421314e50cb446dffdb14a5be04ca1a5d",
      "responses/05.json": "6f9b2c9b60f3412d37153bfb6c025c86f60151b0d791fde58918e3a379e3966f",
      "responses/06.json": "859bb1b5c8c5667337ffefcc8f4638b699bcaf524d56a3443daddc495c8d8494",
      "responses/07.json": "3ed447c98fcf3c4c6606de82f7843d8d39d8d1769cb728880a6c64cffd94eade",
      "responses/08.json": "f253d697de09c98cc5fa238ea1f4fd290855877436c61c7f326f776d1aadadba",
      "responses/09.json": "883db051bdf30cec4eea1f3269983c4d66e439ffd84d2ef1de8d89c03c5f0870",
      "responses/10.json": "a54b6f1f40d1d395f680b5953fe2ccac9949a35fe8b4925c398b89e82aff1a42",
      "responses/11.json": "2deae304b73b9f1ed19540ea585876d4f8e88710f7dbf0719a4066f05ab7cc55",
      "responses/12.json": "f42e1c0f6b27b98021af11510f46c8f9f1292e52d52fe6e80a5a139b9f3c4893",
      "responses/13.json": "547cef490afe3bd61ad49877b9a9124be566b2d0e6db7792286b5eff13415cc2",
      "responses/14.json": "d196eda955d948557527e5172ee034671de90057c33a3be6bdd89be2eef1f638",
      "responses/15.json": "5140ab4324a64598672cbd42e9e341e489be03d544b6bf97666fe4f18afdb792",
      "responses/16.json": "385925c5dbdb012f72d65820da7b22430251e6ea33965ed092968631bb69d1e1",
      "responses/17.json": "16a806b64065ddf71055003297dd475d392a02b872618229ea881333628eb9c0",
      "responses/18.json": "3062ed5963fa6040a90e301c9d36138fc81e8cc377794ac6360da6ffb8e6a4e5",
      "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
      "server.stderr": "d87c78adff25b41b0c08409155b0d7c4368de79096765553ef548bd9e0925212",
      "server.stdout": "78206fe9a84122ee0c950cc409e57d7a496db3d49e4bf37102d50a8ac809dfb9",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "c0e0d887ea60228205da65de366ff981976ff1759c75103f3d5c1c448dad0ee0",
      "vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
      "vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
    }
  },
  "preparation_sha256": "e3bb125256b6860982b22e341a6cd1617683a3379a2e3585053d2265126a826b",
  "protocol_sha256": "c16526e30248ebacf15b737f51c077cd888fdb84919023ca3b4939b4f86a6a65"
}

````````````

## Artifact SHA-256 c16526e30248ebacf15b737f51c077cd888fdb84919023ca3b4939b4f86a6a65

Encoding: `utf-8`. Original bytes: 13879.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
  "memory_gb": 12,
  "mtp": "off",
  "raw": false,
  "seed": 7,
  "rounds": 12,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 12000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    },
    "query": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "256",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "vision-mechanism-fixed-cohort-v383",
  "classification": "New complete fixed24-cell cohort. Isolated V381 driver records startup swap-in-only contamination and excludes that entire pair, then continues the original fixed cells without replacements. Physical/thermal/work/pressure limits and original acceptance remain; the outer live swap-out stop is additionally enabled. No V369 rows are reused.",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt",
  "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "conditions": "Twelve fixed alternating fresh-server pairs,exactly640slots/native --pool-gb1.769472,one1536square image/9216patches,one output, MTP/prefix/elastic off. The NEWmeasured whole-request ceiling is12GBand host preflight requires18GBreclaimable. Both earlier10GBreference attempts already used640slots and remain excluded; the earlier assumption of more reference slots is corrected. Holding640slots under12GBdoes not validate a target-driven12GBplan or a10GBproduct request. Same current V304binary, image bytes, ordinary base, exact output/work/mechanism,200MBpeak saving in every clean pair,at most5percent median client regression,min5clean of12fixed pairs,nominal power/zeroVM,180second quiet/60second cooldown/immediate resource stop/no replacements. No prior result is pooled.",
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0,
    "minimum_sampled_peak_savings_bytes": 200000000
  },
  "frozen_binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
  "stop_on_workspace_contention": true,
  "think": false,
  "abort_on_resource_failure": true,
  "images": [
    {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-1536.png",
      "sha256": "03484e0f55cda3a29eef4bd35e1e2c086a943911c940a26100fbaddce07d7bbb"
    }
  ],
  "work_constraints": {
    "reference": {
      "encodedImages": {
        "min": 1,
        "max": 1
      },
      "reusedImageFeatures": {
        "min": 0,
        "max": 0
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 0,
        "max": 0
      },
      "visionQueryTileCalls": {
        "min": 0,
        "max": 0
      }
    },
    "query": {
      "encodedImages": {
        "min": 1,
        "max": 1
      },
      "reusedImageFeatures": {
        "min": 0,
        "max": 0
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 256,
        "max": 256
      },
      "visionQueryTileCalls": {
        "min": 972,
        "max": 972
      }
    }
  },
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeForwardPasses",
    "decodeModelTokens",
    "draftedTokens",
    "verifyPasses"
  ],
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "primary_metric": "Bounded mechanism/resource benefit at explicit640slots and12GBmeasured ceiling: min5clean pairs,at least200MBwhole-request sampled-peak saving each,at most5percent median client regression,exact IDs/text and required work. Report actual peaks and latency. Separate10GBcandidate-only capacity, target-driven accounting, combined and compatibility gates are still required before adopting query tiling.",
  "successor_basis": "New maximum-size hypothesis: at9216patches an unfused dense score domain has16*9216*9216elements, whereas256query tiles have16*256*9216elements. This logical domain reduction is not a measured allocation or saving. At1024pixels generation dominated the observed whole-request peak and the200MB gate failed. The max-size native tower is byte-exact and the previous max candidate-only serving run was swap-excluded; neither establishes paired resource savings. This study keeps the same gates and tests the supported maximum independently.",
  "predecessor_protocol": {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1024-protocol-v132.json",
    "sha256": "25941bca411884439b583915b592e9535e3ec8b2a1254f0f6d0bd91dd01a6fc8",
    "disposition": "V132 resource gate failed; preserved without rescoring or pooling"
  },
  "fixed_pool_slots": 640,
  "predecessor": {
    "runs": [
      "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-paired-serving-v157",
      "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-fixed-pool-serving-v158"
    ],
    "disposition": "Both reference cells actually640slots, over10GBand swap-excluded; no candidate or pair. Previous claimed pool reduction was incorrect and is explicitly superseded."
  },
  "large_vision_measurement": {
    "purpose": "Both reference and query256 can be compared with640slots under a newly declared12GBphysical ceiling after reference maxima exceeded10GB. No pool increase or target-planner claim."
  },
  "historical_conditions": "Twelve fixed alternating fresh-server pairs,exactly640slots/native --pool-gb1.769472,one1536square image/9216patches,one output, MTP/prefix/elastic off. The NEWmeasured whole-request ceiling is12GBand host preflight requires18GBreclaimable. Both earlier10GBreference attempts already used640slots and remain excluded; the earlier assumption of more reference slots is corrected. Holding640slots under12GBdoes not validate a target-driven12GBplan or a10GBproduct request. Same V125binary, image bytes, ordinary base, exact output/work/mechanism,200MBpeak saving in every clean pair,at most5percent median client regression,min5clean of12fixed pairs,nominal power/zeroVM,180second quiet/60second cooldown/immediate resource stop/no replacements. No prior result is pooled.",
  "historical_native_prerequisites": {
    "vision-query-tile-capacity": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-tile-capacity-v125/manifest.json",
      "sha256": "bf5748bee98d1e858e895b0b7ff92c1a0d853fe34ec0be40a96f859db9d66faf",
      "assertions": 104,
      "passed": true
    },
    "vision-query-tile-tower": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-tile-tower-v125/manifest.json",
      "sha256": "0d5a3d126384ed86cd333ff9f92024421b04de77445dcc953bf07c1a900a30db",
      "assertions": 47,
      "passed": true
    },
    "vision-query-maximum-reference": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-maximum-reference-v125/manifest.json",
      "sha256": "eb47718061d653f491d4fe60a9f2b6f56762920eb141642570b1279c0777b552",
      "assertions": 6,
      "passed": true
    },
    "image-reuse": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/image-reuse-v125/manifest.json",
      "sha256": "ee115fe202aa2e4a2fd8ed7919e522630693cb163564188241dffd09860a68ea",
      "assertions": 76,
      "passed": true
    },
    "integrated-vision-query": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/integrated-vision-query-v125/manifest.json",
      "sha256": "d1dca396f8809346508f80bc4d15e6f43b3aec94d389360a81d67bd1ba22306f",
      "assertions": 195,
      "passed": true
    },
    "integrated-vision-query-mtp": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/integrated-vision-query-mtp-v125/manifest.json",
      "sha256": "bc47daaf7f44a359a7493001c483e7b4594637f2fea9b959f41c5f4d63df6b88",
      "assertions": 209,
      "passed": true
    },
    "known-content-serving": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-serving-quality-v125/manifest.json",
      "sha256": "763b59bd8ed3b9cbed76e5b1f62173a09cfb6635f74c979e94d6ee9e1b92f0af",
      "assertions": 25,
      "passed": true
    }
  },
  "current_prerequisite_binding": "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v383/mechanism/binding.json",
  "startup_swapin_policy": "exclude_pair"
}

````````````

## Artifact SHA-256 e3bb125256b6860982b22e341a6cd1617683a3379a2e3585053d2265126a826b

Encoding: `utf-8`. Original bytes: 39803.

````````````text
{
  "prepared_at": "2026-09-08T20:04:22.320365+00:00",
  "dependencies": {
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v383/run.py": "4c08723d8dc52b4b442cadaff87b0e9f27bbd4dfde36d67241674b5b58db1a21",
    "/private/tmp/slotstream-optimization-execution/resumed-vision-serving-v369/run.py": "7d772a3a994012d3e15a9b41de0f0e61e83a4ee28591eb24bd5f25fa4fd78024",
    "/private/tmp/slotstream-optimization-execution/resumed-vision-serving-v369/preparation.json": "cf9a4ff1ec57cdd597f63c1d09e1c91ebb7899eec5d66177b95d79d2aa1a655a",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/startup_policy.py": "8cf6d5805ce5fee2338a6feb962172018cdbb566b61e2ea1470349f2fa6ce2ec",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/build_driver.py": "159b644dccc77d45ddce64886ebc0052171134535c1003a02216517c1e20f4c7",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/serve_bench.py": "cd9b42730c9b2b32fd285fe059da093a70a379fff4c905510e46e1efb8db9272",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/driver-transformation.json": "871132209f684139590ee6d4057df664e35489c340750ca99b621faaa79c25ab",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/checks.py": "c62b37ab369df185ca3d147031ee258a3b903bc29ddc377c21a5a2d1166c38c2",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/checks.stderr": "e762d53741adba6d35727bef9185b743e80ee3669e6ab497abd9ef27f9588326",
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/run.py": "f9f619f2e23c97b085fe643ae23e687e6d1e6c309e4471e9855c3c1ce67a4ab9",
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/preparation.json": "9ea4ed6523a79fa9769661f1a111b98eaf2309de05867e6c44e7e1f72aca8b36",
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/checks.py": "037c885ba6ad51a9b5b7b79f89e614f415f1ace124f0fd5739297121da732f75",
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/checks.stderr": "ef3419d9ca9afbc082c3332dfe1410922c2a3adb03cf72019d42f484303ab644",
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/mechanism/protocol.json": "c1f23ee4477ce3fb23bb25056b6fc8feb1f5ab8b574bc0b0298fb96e971da17b",
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v382/mechanism/binding.json": "68f59e82e9e696ace8ed8ec14292b8387892c0d14321686f3edb9b7376d7e526"
  },
  "preserved": {
    "raw": {
      "1-query/response.ndjson": "8686508dd3117fd3af9c1b82f225936b1ff00e30dd5f4ce6f870a913368857d0",
      "1-query/result.json": "6ae6118c6702dacd5fa2cba40d3061697d6721ce0c8267aea5a560ca084b8698",
      "1-query/server.stderr": "9bd3bf999decb97ab9717b98c8b023738073749df0999835bbfce3fd3fbfdb4f",
      "1-query/server.stdout": "8cf94c4519062d28b5d95c93d4ff5b3da49199a673b93c2f8858de7a41b97bb6",
      "1-query/warmup.json": "e851296ea14ffa1844037d470bc37f13f4d499f5eaf39539931b2773bcd50828",
      "1-query/warmup.ndjson": "32e66d6c8b434e67f7dbc2665d2adc822aced26e00e852601f1863a365647172",
      "1-reference/response.ndjson": "99e8ada1e29b4d11af42eaea93c7a5ec18dd1be026a05cc31bd38710161e3a50",
      "1-reference/result.json": "fce64b28f51fd873a0b6b8c626fdbd9451b54733160d1f67e28eeed864189e61",
      "1-reference/server.stderr": "af73ab3a0d0d7c5adcdcc6d60afa2887ecf049f75bb4d71ff5e78cd0dc16fcb2",
      "1-reference/server.stdout": "5307c293f6cf2ac7caaf84a06cb6e744bb45d3b09ea4abbaeecffe98cad43e0c",
      "1-reference/warmup.json": "6b24be012d87dda3f8bce41efe88b28070b4c81dd6dc26b5a7fcde64f8ca7ed7",
      "1-reference/warmup.ndjson": "6bb696a99a96f6f1b3e7473d1393e38126be4f92ab28ce7d3ed622fc20d10acd",
      "2-query/result.json": "5e0117d60c97a46e1f712c704d1eb5b74e66de39fa790eb20d50899ec33c7999",
      "2-query/server.stderr": "9d55324a56e1ac2213bc36919e873c0656afabe560a993f5edcae533c6fcc67e",
      "2-query/server.stdout": "20e8779f540436816a9c392552c6419ade4b551bbc46baae147ab7317a556d11",
      "2-query/warmup.json": "fc150da2dc6b82679bce51c99cfcebfab21a7e6696a740a68b367c2e178635e3",
      "2-query/warmup.ndjson": "6f016570fbdbfbb3c44dbe19fe92e877296d0916da1115d9c189344fdd1085e8",
      "build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "completion.json": "9bed2bc0b3ff324c35c6bf410f407146ba1803b46a0ce3129ed3ca583ea44452",
      "fixture.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
      "image-0.png": "03484e0f55cda3a29eef4bd35e1e2c086a943911c940a26100fbaddce07d7bbb",
      "initial-workspace-quiet.json": "64b45b90151fd2d43b20764da0f0943ccd5bf43f8e0e99f31db967f232d9b9fb",
      "manifest.json": "c21793284e13ee4715a0f4bf3cf37b1d371fc2dd55cc1fc7dbd43a73859e1763",
      "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
      "query-build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "reference-build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "request.json": "216f21df78c999613ff8cc13b23c464c0a898840de04c8fabbf1d8747c0bb4d0",
      "results.jsonl": "b1ea5665152615fc32fdaafd669086cd4887f70daaf89ad6d735db9e02911932",
      "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
      "startup-summary.json": "3c84d6c0a542cf443b51948d9951df7dae06cba85f3c1d03e14b4be29a09afed",
      "summary.json": "d402c18ebb58c15bebc4b7a2d4b6ff8351f374c04a6c7b1a4c7b3335512404a2"
    },
    "execution": {
      "binding.json": "bbc40b8879c562ba3fc9c3a4e09591dffd3a1f96d6887f5b0594b0d610571366",
      "execution/artifact-sha256.json": "d75a10a5d5a04736fac18ae8a7f97de7cc7e65ef871247622552614d57eac2f1",
      "execution/attempt.json": "f76adf0807e6b368da553ca76e4d12c5d0360d07150b962f39d8653187fafc55",
      "execution/memory.json": "79b005e6cf7978d8e58b182a5684fd815b4b7d27dba2390943876906db24c2b2",
      "execution/memory.samples.jsonl": "d8a286871d4333a9a3f8655d357c1ce5bb5fffededa0b6bfa666459aea339b09",
      "execution/qualification.json": "a210fab684c41bf09f0d536319a0a705815c21487f001be23019e96d8d31bafe",
      "execution/receipt.json": "61a5076b97e06435c1e49aed1bb78578c21f2b62fc65628e82db6f61e9bf6e23",
      "execution/stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "execution/stdout.txt": "07f80f8a7e8b9a698f89b5ed595df2383a0b0f4963a7241d8aeb8450fc9dc311",
      "protocol.json": "627167064e916d904445efd628289037597bef9d4fa064c3605558a470445788"
    }
  },
  "identity": {
    "build": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "identity": {
        "source": {
          "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
          "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
          "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
          "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
          "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
          "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
          "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
          "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
          "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
          "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
          "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
          "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
          "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
          "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
          "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
          "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
          "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
          "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
          "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
          "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
          "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
          "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
          "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
          "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
          "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
          "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
          "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
          "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
          "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
          "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
          "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
          "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
          "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
          "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
          "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
          "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
          "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
          "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
          "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
          "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
          "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
          "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
          "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
          "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
          "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
          "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
          "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
          "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
          "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
          "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
          "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
          "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
          "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
          "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
          "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
          "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
          "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
          "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
          "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
          "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
          "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
          "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
          "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
          "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
          "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
          "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
          "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
          "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
          "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
          "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
          "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
          "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
          "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
          "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
          "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
          "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
          "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
          "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
          "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
          "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
          "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
          "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
          "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
          "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
          "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
          "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
          "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
          "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
          "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
          "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
          "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
          "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
          "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
          "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
          "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
          "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
          "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
          "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
          "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
          "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
          "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
          "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
          "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
          "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
          "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
          "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
          "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
          "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
          "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
          "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
          "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
          "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
          "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
          "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
          "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
          "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
          "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
          "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
          "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
          "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
          "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
          "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
          "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
          "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
          "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
          "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
          "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
          "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
          "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
          "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
          "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
          "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
          "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
          "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
          "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
          "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
          "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
          "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
          "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
          "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
          "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
          "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
        },
        "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
        "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
        "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
      }
    },
    "shared_proof": {
      "native": {
        "combined-plain": {
          "assertions": 242
        },
        "combined-mtp": {
          "assertions": 256
        },
        "read-failure-serving": {
          "assertions": 522
        }
      },
      "contract_sha256": "dd1bada1296a7e69a034e7c674a92779b7d0f362dcd3dcfdb2cd2308baf8dbd0",
      "artifacts": {
        "combined-plain": {
          "attempt.json": "7b1e711fa6ac8ec6fbc645ca94fe31732fced532878346ac734900fde76aa347",
          "evidence/manifest.json": "453557bf65cc56bc5856c6429ae254334c66755be32aa68a118ba6cd896e24d8",
          "evidence/memory.json": "2ce21c1ee8727c738601e2f0102ee2776339aca07423dfd4c9f9e116dba69400",
          "evidence/memory.samples.jsonl": "72176921e73519090bc7199de8053c4e2d3784e0ee041affd4a9763b46b3f3bb",
          "evidence/stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6",
          "evidence/stdout.txt": "8a0a9c741b2f596ad116e676c5117dd2b371055f8adc6364be409baca291e799",
          "receipt.json": "28a8f56d18448e48349b940149f52003bdc1ded4825c7c0863e81bb15ea02b00"
        },
        "combined-mtp": {
          "attempt.json": "2f71f158d1926a34f7aadb080daecc0505202b310986343f096241b8a31d9a80",
          "evidence/manifest.json": "b65d67d4111131a43a8d8009c2401ea120524030bcd46607d78690a19e5e2f68",
          "evidence/memory.json": "f5cdbd70ab3d9005489a3002fef1a2717a2c9013878eeb52d1a68cbcd4e3c237",
          "evidence/memory.samples.jsonl": "f2743063298d4394cbf22cacd07f562fbfee7760d712be76d3aa8e813a15e257",
          "evidence/stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6",
          "evidence/stdout.txt": "0e553341f8c0644b29f8018bfdc4c53d29dd91858f1f1745c2af5973da6f09b6",
          "receipt.json": "459d6dfd9b3bce20fd9c0f71ad1e14605f276a1667a2b1a1ef916d605571ae4c"
        },
        "read-failure-serving": {
          "attempt.json": "c6c91c72707e6a1b1d883b4036f29ebd01af37c681becf59f366bbdf480c1c1b",
          "evidence/manifest.json": "348eac2b9399dca5d7d321a8056d0da67b3df1d0aa802f786722eba7603575ad",
          "evidence/memory.json": "9221cbdf26d3e69b9276043fb8384066749eb7c5fbf6ac3652e9f722f95ad296",
          "evidence/memory.samples.jsonl": "3fe98e3969483d4863f049448d1f02c7f378367b14fdbb1229b55554e899cee8",
          "evidence/stderr.txt": "e4836406b1037cc8e75db6dd0c37940f44fe387423be5d44e1d0e78a606d2094",
          "evidence/stdout.txt": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
          "receipt.json": "13cf575020da6f2547ea668de284f6fc8aef908987b160e6dfa984d6eef386d1"
        }
      }
    },
    "native_helper_sha256": "e75dce5e5635bdd3cfee834045743b80d65e7f1d73e174cb69d4016945a9523f",
    "native_preparation_sha256": "1b1939f23e1fc8628ab71ff2cd1078a0daa0636d0ab445215cd14ac6c070af8f",
    "core_helper_sha256": "5793aa8bcb3af55fb99c9da698475ee54272ee791ccef30141c94ba6c405b95f",
    "core_preparation_sha256": "3479e62de5ffbe569b3bd0f9c63953a3cfec0bbaea197ba8b6237b1e43b5f974",
    "original_protocol_sha256": {
      "mechanism": "c7dcbf0dc06a700d7fb772fd115493c4919bea3e567ee94049fcbb7f9277c8d7",
      "capacity": "249763ff5d17a05382545b33fc840e01855599229d955bee150ba7a2133e5325"
    },
    "drivers": {
      "vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
      "vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb",
      "vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040"
    },
    "fixture_sha256": {
      "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
      "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-1536.png": "03484e0f55cda3a29eef4bd35e1e2c086a943911c940a26100fbaddce07d7bbb",
      "/Users/carlos/Projects/slotstream/Tools/assets/vision_test/secret1.jpg": "427250bd24a93e98cac3d4ae83619040aa167dde63fa6e7272117bd9a1a17e7d",
      "/Users/carlos/Projects/slotstream/Tools/assets/vision_test/secret2.jpg": "41802c151fbfc248f0af72790fe0eeba00cbbd6632c3ccd5200fef5421d2610f"
    }
  },
  "native_proof": {
    "image-reuse": {
      "assertions": 76,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse",
        "sha256": {
          "attempt.json": "771b5f6417dc0771b979fb606fa981ca9cc27100391aef6471ee8832c96246e8",
          "receipt.json": "b7013145b09f9639d0f08e8e72331f1dee4ae4d5f28b2fbb3cfb38fca1be8073",
          "stdout.txt": "e651d90a731a3f5d3ff48022247f967966c87e84cf80267d507643bff23b940a",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-capacity": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 104,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity",
        "sha256": {
          "attempt.json": "1f59fdb9f8f71471b741ab5da1dea7a620d0d55ad957c58cf2e8832571eecc84",
          "receipt.json": "ac41c79129a25b6d3c924cca0ff5d413c075f44500abf1579cbecf7233873a9a",
          "qualification.json": "1b05fca1bcc0e6e1d5280d76d763cdd86993159d1ef6ca4bce258f6d28c4be31",
          "stdout.txt": "2c901927e46b6cedaf1f41021c7dc3eeabec810b769d84f62ea599127bbad839",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-tower": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 47,
        "exact_tower_comparisons": 7
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower",
        "sha256": {
          "attempt.json": "c6c072174bd22437a9cfff5d6b1cdba560fe76fd7df831c8a2ea39b04c986e2f",
          "receipt.json": "def1a0f16113d865befb4a9ae9e7664ea1de9702a4ec4d6e917bd067a70b4f64",
          "qualification.json": "9881e16798d2d582fabe4b5b1dc4a574b0d7bd6e1a7ce1255f1007b416a989cd",
          "stdout.txt": "3d9d10f6e14592429833ce860fba18f93c0636562e11b7a1a5ef4e474f501219",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-maximum-reference": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 6,
        "exact_tower_comparisons": 1
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference",
        "sha256": {
          "attempt.json": "c854592080741f1b89cdd13e8a53f28a367acbc555b31269f10c53803c895564",
          "receipt.json": "7124977d30243802983d5b12fee13d8d57ad8c61114f672bb1e6a13a31dd019d",
          "qualification.json": "e63cea8cf10b1a66bfbd4ee1d43bed303352d2d3931273e47775b83bf4e53096",
          "stdout.txt": "fe745e31aca98b9279ff62bf9dca77c0f5bdff29331bc5119c03f35ec9aab21b",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "integrated-vision-query": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 270,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query",
        "sha256": {
          "attempt.json": "cb51513371bf901354ee7a5c18a915bc9803b43e1f88e32556535d8f781b3a26",
          "receipt.json": "78c48da1dda732f5d587fae8f2431ffed4de0c73ab4968857f4caa16fe21aebf",
          "qualification.json": "c3ae2a413e324bd8ee434171a376bbbf22a5968b18a42cf16ef05310b606353d",
          "stdout.txt": "ba0b480159626402785581bd32d99f3acb9058e8869c6f3f25e5468fda1182c5",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    },
    "integrated-vision-query-mtp": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 284,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query-mtp",
        "sha256": {
          "attempt.json": "8e6f53852c5233500f685cae6deb05634412ccc51fc3b38fbf08afc11193b25e",
          "receipt.json": "b8ff7f337bebef3ee60e3cf352f84911ac61e74929f1c01aa97fae3eac21ae9f",
          "qualification.json": "838dd35622c6c678b68e62c0a4da8ac16410a3c5d546303d007e5cc773188398",
          "stdout.txt": "93d96fe6910d93c8aafc70e56209b77348c9042ed9ebf922fa2cfe44275f5ec3",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    }
  },
  "photo_proof": {
    "assessment": {
      "completed": true,
      "passed": true,
      "qualified": true,
      "assertions": 25,
      "observed_query_tile_calls": 3699,
      "classification": "Current full-photo correctness only; no speed or capacity claim."
    },
    "execution": {
      "artifact-sha256.json": "a9f5a3accff494feb8be87726e193dc5a0f3af3182480a6a83e0cf1eb771b1e4",
      "attempt.json": "f7cf21242d28d909a719262ff2ba78aa9e193577631076d9d369f4dff65e4730",
      "memory.json": "b2c444364e5cdd242c05d728f69102e1ee8e48ec7962944487ad7099c00db6db",
      "memory.samples.jsonl": "0eef4f7352739ab5c4fb355659597b0ecada8506bb98b45b449c3f781c254183",
      "qualification.json": "ff110df04526a5b6ab85255a12a9d60cdc8d404b370e3f5db1f5b26fb48973f1",
      "receipt.json": "88f573eaa9e7d88d26814a2b39a7f5829655f154eb600092d39f64345b38bcd2",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "d4bbe6022cf576e58bdebca95699a3ef6057de1d0e6906af2857373d5b9604f5"
    },
    "responses": {
      "manifest.json": "b828e751a57e7cc873f4b1b2acf5e4de658071f59c1e20c5bd0bfbc46abbeda0",
      "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
      "responses/01.json": "ab7208066b2343ff2b96fd55a9ec12bdd2e3fbd7618d79592b6f8ab49b443f93",
      "responses/02.json": "d26fafed4905736921e7502eaafdcaad215d031963ce9e2925e49f0550ee1064",
      "responses/03.json": "2d107ffcb1498a67314a45eb2472d654ca39c011c0503ab0c33de1ab49e82d6f",
      "responses/04.json": "76b0ed9b8237e3eccc4aa241c4a5eb1421314e50cb446dffdb14a5be04ca1a5d",
      "responses/05.json": "6f9b2c9b60f3412d37153bfb6c025c86f60151b0d791fde58918e3a379e3966f",
      "responses/06.json": "859bb1b5c8c5667337ffefcc8f4638b699bcaf524d56a3443daddc495c8d8494",
      "responses/07.json": "3ed447c98fcf3c4c6606de82f7843d8d39d8d1769cb728880a6c64cffd94eade",
      "responses/08.json": "f253d697de09c98cc5fa238ea1f4fd290855877436c61c7f326f776d1aadadba",
      "responses/09.json": "883db051bdf30cec4eea1f3269983c4d66e439ffd84d2ef1de8d89c03c5f0870",
      "responses/10.json": "a54b6f1f40d1d395f680b5953fe2ccac9949a35fe8b4925c398b89e82aff1a42",
      "responses/11.json": "2deae304b73b9f1ed19540ea585876d4f8e88710f7dbf0719a4066f05ab7cc55",
      "responses/12.json": "f42e1c0f6b27b98021af11510f46c8f9f1292e52d52fe6e80a5a139b9f3c4893",
      "responses/13.json": "547cef490afe3bd61ad49877b9a9124be566b2d0e6db7792286b5eff13415cc2",
      "responses/14.json": "d196eda955d948557527e5172ee034671de90057c33a3be6bdd89be2eef1f638",
      "responses/15.json": "5140ab4324a64598672cbd42e9e341e489be03d544b6bf97666fe4f18afdb792",
      "responses/16.json": "385925c5dbdb012f72d65820da7b22430251e6ea33965ed092968631bb69d1e1",
      "responses/17.json": "16a806b64065ddf71055003297dd475d392a02b872618229ea881333628eb9c0",
      "responses/18.json": "3062ed5963fa6040a90e301c9d36138fc81e8cc377794ac6360da6ffb8e6a4e5",
      "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
      "server.stderr": "d87c78adff25b41b0c08409155b0d7c4368de79096765553ef548bd9e0925212",
      "server.stdout": "78206fe9a84122ee0c950cc409e57d7a496db3d49e4bf37102d50a8ac809dfb9",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "c0e0d887ea60228205da65de366ff981976ff1759c75103f3d5c1c448dad0ee0",
      "vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
      "vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
    }
  },
  "limits": {
    "seconds": 5400,
    "cleanup_seconds": 60,
    "startup_gb": 18,
    "owned_bytes": 14000000000
  },
  "classification": "New complete fixed24-cell cohort. Isolated V381 driver records startup swap-in-only contamination and excludes that entire pair, then continues the original fixed cells without replacements. Physical/thermal/work/pressure limits and original acceptance remain; the outer live swap-out stop is additionally enabled. No V369 rows are reused.",
  "model_executed": false
}

````````````

## Artifact SHA-256 4c08723d8dc52b4b442cadaff87b0e9f27bbd4dfde36d67241674b5b58db1a21

Encoding: `utf-8`. Original bytes: 7464.

````````````text
"""New fixed cohort with explicit startup swap-in pair exclusion.

No prior measurements are reused. All numerical, workload, timing acceptance,
capacity, pressure and cleanup bounds retain their original values. The outer
guard additionally stops immediately on new swap-outs.
"""
import argparse
import copy
import fcntl
import importlib.util
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
ORIGINAL = BASE / 'resumed-vision-serving-v369/run.py'
POLICY = BASE / 'vision-startup-swapin-policy-v381'
DRIVER = POLICY / 'serve_bench.py'


def module(name):
    spec = importlib.util.spec_from_file_location(name, ORIGINAL)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


original = module('vision_v369_preserved')
execution = module('vision_v383_assessment')
c, core, digest, require = original.c, original.core, original.digest, original.require
OUT = original.ROOT / '.build/optimization/vision-mechanism-fixed-cohort-v383'
NAME = 'mechanism'


def dependencies():
    files = [Path(__file__), ORIGINAL, original.HERE / 'preparation.json',
             POLICY / 'startup_policy.py', POLICY / 'build_driver.py', DRIVER,
             POLICY / 'driver-transformation.json', POLICY / 'checks.py', POLICY / 'checks.stderr']
    failed = BASE / 'vision-mechanism-fixed-cohort-v382'
    files += [failed / p for p in ('run.py', 'preparation.json', 'checks.py', 'checks.stderr', 'mechanism/protocol.json', 'mechanism/binding.json')]
    return {str(p.resolve()): digest(p) for p in files}


def preserved():
    completion = c.read(original.OUT / NAME / 'completion.json')
    receipt = c.read(original.HERE / NAME / 'execution/qualification.json')
    require(completion.get('recorded_cells') == 3 and completion.get('stopped_early') is True
            and receipt.get('completed') is False and receipt.get('qualified') is False
            and receipt.get('cleanup_complete') is True, 'original stopped cohort changed or did not drain')
    return {'raw': c.artifact_hashes(original.OUT / NAME),
            'execution': c.artifact_hashes(original.HERE / NAME)}


def materialize(name, value):
    require(name == NAME, 'only the large-image mechanism study is authorized by this binding')
    p = original.materialize(name, value)
    p['label'] = 'vision-mechanism-fixed-cohort-v383'
    p['classification'] = ('New complete fixed24-cell cohort. Isolated V381 driver records startup swap-in-only '
        'contamination and excludes that entire pair, then continues the original fixed cells without replacements. '
        'Physical/thermal/work/pressure limits and original acceptance remain; the outer live swap-out stop is additionally enabled. No V369 rows are reused.')
    p['startup_swapin_policy'] = 'exclude_pair'
    p['current_prerequisite_binding'] = str(HERE / NAME / 'binding.json')
    return p


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'already prepared or attempted')
    value = original.load()
    old = original.materialize(NAME, value)
    new = materialize(NAME, value)
    restored = copy.deepcopy(new); restored.pop('startup_swapin_policy')
    for key in ('label', 'classification', 'current_prerequisite_binding'): restored[key] = old[key]
    require(restored == old, 'original workload, controls or acceptance differs')
    require('Ran 11 tests' in (POLICY / 'checks.stderr').read_text()
            and (POLICY / 'checks.stderr').read_text().endswith('OK\n'), 'policy checks have not passed')
    record = {'prepared_at': core.now(), 'dependencies': dependencies(), 'preserved': preserved(),
              'identity': value['identity'], 'native_proof': original.native_proofs(),
              'photo_proof': original.quality_proof(), 'limits': original.LIMITS[NAME],
              'classification': new['classification'], 'model_executed': False}
    c.write_new(HERE / 'preparation.json', record)
    return {'prepared': True, 'fixed_cells': 24, 'original_acceptance_unchanged': True, 'model_executed': False}


def load():
    record, value = c.read(HERE / 'preparation.json'), original.load()
    require(record['dependencies'] == dependencies() and record['preserved'] == preserved()
            and record['identity'] == value['identity'] and record['native_proof'] == original.native_proofs()
            and record['photo_proof'] == original.quality_proof()
            and record['limits'] == original.LIMITS[NAME], 'new binding or preserved evidence changed')
    return value


execution.HERE, execution.OUT = HERE, OUT
execution.load = load
execution.materialize = materialize
execution.native_proofs = original.native_proofs
execution.quality_proof = original.quality_proof


def run(deadline):
    lim = original.LIMITS[NAME]
    core.allowance(deadline, lim['seconds'] + lim['cleanup_seconds'])
    value, protocol = execution.load_serving(NAME)
    target, output = HERE / NAME / 'execution', OUT / NAME
    require(not target.exists() and not output.exists(), 'attempted cohort cannot retry')
    limit, before, thermal = core.readiness(deadline, lim['seconds'] + lim['cleanup_seconds'], lim['startup_gb'])
    policy = dict(c.NATIVE_POLICY, startup_reclaimable_bytes=int(lim['startup_gb'] * 1e9),
                  maximum_owned_rss_bytes=lim['owned_bytes'], maximum_build_seconds=lim['seconds'],
                  stop_on_new_swapouts=True)
    command = [sys.executable, str(DRIVER), '--protocol',
               str(HERE / NAME / 'protocol.json'), '--out', str(output)]
    attempt = {'started_at': core.now(), 'deadline_utc': deadline, 'command': command, 'environment': {},
               'build': value['identity']['build'], 'native_proof': original.native_proofs(),
               'before': before, 'thermal_prelaunch': thermal, 'policy': policy,
               'protocol_sha256': digest(HERE / NAME / 'protocol.json'), 'driver_sha256': digest(DRIVER),
               'preparation_sha256': digest(HERE / 'preparation.json'), 'classification': protocol['classification']}
    def assess(code):
        require(code in (0, 1), 'large-image driver failed')
        return execution.assess_serving(NAME)
    result = execution.finalize(target, core.execute(command, target, lim['seconds'], policy,
                                assess, limit, attempt, output / 'results.jsonl'))
    if output.exists(): c.write_new(target / 'artifact-sha256.json', c.artifact_hashes(output))
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=['prepare', 'status', 'freeze', 'run'])
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.action == 'prepare': result = prepare()
        elif args.action == 'freeze': result = execution.freeze_serving(NAME)
        elif args.action == 'status':
            load(); result = {'frozen': (HERE / NAME / 'protocol.json').exists(), 'attempted': (OUT / NAME).exists()}
        else:
            require(args.deadline is not None, 'full user-authorized interval required')
            result = run(args.deadline)
    print(json.dumps(result, indent=2), flush=True)
    return 1 if args.action == 'run' and result.get('qualified') is not True else 0


if __name__ == '__main__':
    raise SystemExit(main())

````````````

## Artifact SHA-256 159b644dccc77d45ddce64886ebc0052171134535c1003a02216517c1e20f4c7

Encoding: `utf-8`. Original bytes: 2625.

````````````text
"""Generate an isolated driver; the shared and frozen original stay exact."""
from pathlib import Path
import hashlib
import json

HERE = Path(__file__).resolve().parent
ORIGINAL = Path('/Users/carlos/Projects/slotstream/Tools/serve_bench.py')
TARGET = HERE / 'serve_bench.py'

CHANGES = [
    ('import argparse\n', 'import sys\nsys.path.insert(0, "/Users/carlos/Projects/slotstream/Tools")\nfrom startup_policy import validate_policy, swapin_only, exclude_contaminated_startup\nimport argparse\n'),
    ("    validate_arms(protocol.get('arms'))\n", "    validate_arms(protocol.get('arms'))\n    validate_policy(protocol)\n"),
    ("                                warm_exclusions.append('swap activity during large-pool startup/warmup')\n",
     "                                if swapin_only(protocol, row['before_startup'], row['after_warmup_vm'], warm['metrics']['stats'], resource_exclusions):\n"
     "                                    row['startup_swapin_contamination'] = True\n"
     "                                else:\n"
     "                                    warm_exclusions.append('swap activity during large-pool startup/warmup')\n"),
    ("                    row['valid']=not exclusions\n", "                    exclude_contaminated_startup(row, exclusions)\n                    row['valid']=not exclusions\n"),
]


def transform(source):
    for before, after in CHANGES:
        if source.count(before) != 1:
            raise ValueError('original driver patch coordinate differs')
        source = source.replace(before, after, 1)
    return source


def restore(source):
    for before, after in reversed(CHANGES):
        if source.count(after) != 1:
            raise ValueError('isolated driver patch coordinate differs')
        source = source.replace(after, before, 1)
    return source


if __name__ == '__main__':
    source = ORIGINAL.read_bytes()
    changed = transform(source.decode()).encode()
    assert restore(changed.decode()).encode() == source
    with TARGET.open('xb') as f:
        f.write(changed)
    record = {'original_path': str(ORIGINAL), 'original_sha256': hashlib.sha256(source).hexdigest(),
              'isolated_driver': str(TARGET), 'isolated_sha256': hashlib.sha256(changed).hexdigest(),
              'reconstructs_original_exactly': True, 'shared_source_unchanged': ORIGINAL.read_bytes() == source,
              'changes': CHANGES, 'model_executed': False}
    with (HERE / 'driver-transformation.json').open('x') as f:
        json.dump(record, f, indent=2); f.write('\n')
    print(json.dumps({k:v for k,v in record.items() if k != 'changes'}, indent=2))

````````````

## Artifact SHA-256 c62b37ab369df185ca3d147031ee258a3b903bc29ddc377c21a5a2d1166c38c2

Encoding: `utf-8`. Original bytes: 5225.

````````````text
import copy
import importlib.util
import inspect
import json
from pathlib import Path
import sys
import unittest

import build_driver
import startup_policy as policy

TOOLS = Path('/Users/carlos/Projects/slotstream/Tools')
sys.path.insert(0, str(TOOLS))
import serve_bench as original

spec = importlib.util.spec_from_file_location('isolated_vision_driver', build_driver.TARGET)
driver = importlib.util.module_from_spec(spec)
spec.loader.exec_module(driver)
PRIOR = Path('/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-serving-v369/mechanism')
PROTO = Path('/tmp/slotstream-optimization-execution/resumed-vision-serving-v369/mechanism/protocol.json')


class PolicyTests(unittest.TestCase):
    def setUp(self):
        self.protocol = json.loads(PROTO.read_text())
        self.protocol['startup_swapin_policy'] = 'exclude_pair'
        self.stats = json.loads((PRIOR / '1-reference/warmup.json').read_text())['metrics']['stats']
        self.before = {'swapins': 10, 'swapouts': 2}
        self.after = {'swapins': 12, 'swapouts': 2}
        self.stats['generatorVMBefore'] = {'swapins': 10, 'swapouts': 2}
        self.stats['generatorVMAfter'] = {'swapins': 11, 'swapouts': 2}

    def classify(self):
        return policy.swapin_only(self.protocol, self.before, self.after, self.stats, original.resource_exclusions)

    def test_original_source_restores_exactly(self):
        self.assertEqual(build_driver.restore(build_driver.TARGET.read_text()).encode(), build_driver.ORIGINAL.read_bytes())

    def test_acceptance_and_memory_rules_are_unchanged(self):
        for name in ['measurement_memory', 'resource_exclusions', 'summaries', 'acceptance_results',
                     'startup_summaries', 'startup_acceptance_results', 'validate_work_observation']:
            self.assertEqual(inspect.getsource(getattr(original, name)), inspect.getsource(getattr(driver, name)))

    def test_legacy_policy_keeps_aborting(self):
        del self.protocol['startup_swapin_policy']
        self.assertFalse(self.classify())

    def test_explicit_valid_swapin_only_can_be_excluded(self):
        self.assertTrue(self.classify())

    def test_invalid_policy_and_unsafe_envelopes_refused(self):
        for key, values in {'startup_swapin_policy': [True, 'ignore', 1],
                            'memory_gb': [10, 14], 'abort_on_resource_failure': [False],
                            'require_nominal_power_state': [False],
                            'maximum_sampled_footprint_bytes': [13_000_000_000]}.items():
            for value in values:
                with self.subTest(key=key, value=value):
                    changed = copy.deepcopy(self.protocol); changed[key] = value
                    with self.assertRaises(ValueError): policy.validate_policy(changed)

    def test_swapouts_in_any_interval_still_abort(self):
        for item in [self.before, self.stats['generatorVMBefore'], self.stats['generatorVMAfter'], self.after]:
            item['swapouts'] = 3
            self.assertFalse(self.classify())
            item['swapouts'] = 2

    def test_missing_malformed_or_nonmonotonic_counters_abort(self):
        for value in [None, True, -1, 9, 13]:
            with self.subTest(value=value):
                self.stats['generatorVMAfter']['swapins'] = value
                self.assertFalse(self.classify())

    def test_no_swap_activity_is_not_a_contamination_exception(self):
        self.after['swapins'] = 10
        self.stats['generatorVMAfter']['swapins'] = 10
        self.assertFalse(self.classify())

    def test_thermal_power_or_memory_failure_still_aborts(self):
        saved = copy.deepcopy(self.stats)
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            for field, value in [('thermalState', 'fair'), ('lowPowerModeEnabled', True)]:
                self.stats = copy.deepcopy(saved); self.stats[key][field] = value
                self.assertFalse(self.classify())
        self.stats = copy.deepcopy(saved)
        self.stats['sampledFootprint']['peakBytes'] = 12_000_000_001
        self.assertFalse(self.classify())

    def test_incomplete_work_is_not_excused(self):
        self.stats['decodeTokens'] = 0
        self.assertFalse(self.classify())

    def test_entire_pair_is_excluded_from_original_assessor(self):
        rows = [json.loads(s) for s in (PRIOR / 'results.jsonl').read_text().splitlines()][:2]
        reference = original.summaries(rows, 'reference', self.protocol['comparison_basis'], self.protocol['required_equal_work'])
        self.assertEqual(len(reference[0]['pairs']), 1)
        row = rows[1]; row['startup_swapin_contamination'] = True
        row['startup_and_warmup_valid'] = False
        exclusions = []
        policy.exclude_contaminated_startup(row, exclusions)
        row['valid'] = not exclusions; row['exclusion'] = '; '.join(exclusions)
        rejected = original.summaries(rows, 'reference', self.protocol['comparison_basis'], self.protocol['required_equal_work'])
        self.assertEqual(len(rejected[0]['pairs']), 0)
        self.assertFalse(original.acceptance_results(rejected, self.protocol['acceptance'])[0]['passed'])


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 e762d53741adba6d35727bef9185b743e80ee3669e6ab497abd9ef27f9588326

Encoding: `utf-8`. Original bytes: 934.

````````````text
test_acceptance_and_memory_rules_are_unchanged (__main__.PolicyTests) ... ok
test_entire_pair_is_excluded_from_original_assessor (__main__.PolicyTests) ... ok
test_explicit_valid_swapin_only_can_be_excluded (__main__.PolicyTests) ... ok
test_incomplete_work_is_not_excused (__main__.PolicyTests) ... ok
test_invalid_policy_and_unsafe_envelopes_refused (__main__.PolicyTests) ... ok
test_legacy_policy_keeps_aborting (__main__.PolicyTests) ... ok
test_missing_malformed_or_nonmonotonic_counters_abort (__main__.PolicyTests) ... ok
test_no_swap_activity_is_not_a_contamination_exception (__main__.PolicyTests) ... ok
test_original_source_restores_exactly (__main__.PolicyTests) ... ok
test_swapouts_in_any_interval_still_abort (__main__.PolicyTests) ... ok
test_thermal_power_or_memory_failure_still_aborts (__main__.PolicyTests) ... ok

----------------------------------------------------------------------
Ran 11 tests in 0.014s

OK

````````````

## Artifact SHA-256 871132209f684139590ee6d4057df664e35489c340750ca99b621faaa79c25ab

Encoding: `utf-8`. Original bytes: 1592.

````````````text
{
  "original_path": "/Users/carlos/Projects/slotstream/Tools/serve_bench.py",
  "original_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "isolated_driver": "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/serve_bench.py",
  "isolated_sha256": "cd9b42730c9b2b32fd285fe059da093a70a379fff4c905510e46e1efb8db9272",
  "reconstructs_original_exactly": true,
  "shared_source_unchanged": true,
  "changes": [
    [
      "import argparse\n",
      "import sys\nsys.path.insert(0, \"/Users/carlos/Projects/slotstream/Tools\")\nfrom startup_policy import validate_policy, swapin_only, exclude_contaminated_startup\nimport argparse\n"
    ],
    [
      "    validate_arms(protocol.get('arms'))\n",
      "    validate_arms(protocol.get('arms'))\n    validate_policy(protocol)\n"
    ],
    [
      "                                warm_exclusions.append('swap activity during large-pool startup/warmup')\n",
      "                                if swapin_only(protocol, row['before_startup'], row['after_warmup_vm'], warm['metrics']['stats'], resource_exclusions):\n                                    row['startup_swapin_contamination'] = True\n                                else:\n                                    warm_exclusions.append('swap activity during large-pool startup/warmup')\n"
    ],
    [
      "                    row['valid']=not exclusions\n",
      "                    exclude_contaminated_startup(row, exclusions)\n                    row['valid']=not exclusions\n"
    ]
  ],
  "model_executed": false
}

````````````

## Artifact SHA-256 cd9b42730c9b2b32fd285fe059da093a70a379fff4c905510e46e1efb8db9272

Encoding: `utf-8`. Original bytes: 60567.

````````````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import sys
sys.path.insert(0, "/Users/carlos/Projects/slotstream/Tools")
from startup_policy import validate_policy, swapin_only, exclude_contaminated_startup
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix',
                             'expected_warmup_checkpoint_stores'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    stores = study.get('expected_warmup_checkpoint_stores')
    if 'expected_warmup_checkpoint_stores' in study:
        if (not study.get('complete_prompt', False) or type(stores) is not dict
            or set(stores) != set(protocol['arms'])
            or any(type(n) is not int or n not in [0, 1] for n in stores.values())
            or stores.get('reference') != 0):
            raise ValueError('combined complete-prompt warmup stores require exact zero/one counts for every arm')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'ngramCachedRows', 'ngramCachePayloadBytes', 'ngramRowHits', 'ngramRowMisses',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False,
                                partial_prefix=False, warmup_checkpoint_stores=None):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    stores = (warmup_checkpoint_stores[name] if warmup_checkpoint_stores is not None
              else int(want > 0 and not full))
    if warm['stats'].get('prefixCheckpointStores') != stores:
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses',
               'ngramCachedRows', 'ngramRowHits', 'ngramRowMisses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    validate_policy(protocol)
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    warmup_checkpoint_stores = (protocol.get('prefix_cache') or {}).get('expected_warmup_checkpoint_stores')
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                if swapin_only(protocol, row['before_startup'], row['after_warmup_vm'], warm['metrics']['stats'], resource_exclusions):
                                    row['startup_swapin_contamination'] = True
                                else:
                                    warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix,
                        warmup_checkpoint_stores=warmup_checkpoint_stores)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    exclude_contaminated_startup(row, exclusions)
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

````````````

## Artifact SHA-256 8cf6d5805ce5fee2338a6feb962172018cdbb566b61e2ea1470349f2fa6ce2ec

Encoding: `utf-8`. Original bytes: 1797.

````````````text
"""Prospective classification only; contaminated pairs never qualify."""


def validate_policy(protocol):
    value = protocol.get('startup_swapin_policy')
    if value is None:
        return False
    if (value != 'exclude_pair' or type(value) is not str
            or not isinstance(protocol.get('large_vision_measurement'), dict)
            or protocol.get('memory_gb') != 12
            or protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or protocol.get('maximum_sampled_footprint_bytes') != 12_000_000_000):
        raise ValueError('startup swap-in exclusion requires the explicit original large-image safety envelope')
    return True


def swapin_only(protocol, before, after, stats, resource_exclusions):
    if not validate_policy(protocol):
        return False
    if resource_exclusions(stats, protocol):
        return False
    if type(stats.get('decodeTokens')) is not int or stats['decodeTokens'] < protocol.get('minimum_output_tokens', 1):
        return False
    generator_before = stats.get('generatorVMBefore')
    generator_after = stats.get('generatorVMAfter')
    snapshots = (before, generator_before, generator_after, after)
    if any(not isinstance(s, dict) or any(type(s.get(k)) is not int or s[k] < 0
            for k in ('swapins', 'swapouts')) for s in snapshots):
        return False
    if any(s['swapouts'] != before['swapouts'] for s in snapshots):
        return False
    reads = [s['swapins'] for s in snapshots]
    return reads == sorted(reads) and reads[-1] > reads[0]


def exclude_contaminated_startup(row, exclusions):
    if row.get('startup_swapin_contamination') is True:
        exclusions.append('swap-ins during startup/warmup; entire pair excluded')

````````````
