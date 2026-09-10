---
type: run
id: 01m1vj7jgsppgs2bw427kap3g6
created: 2026-09-06T14:33:49.337930+00:00
updated: 2026-09-06T14:34:12.066475+00:00
summary: Frozen vision capacity post-run gate V162
binary: No model or build; pure evidence assessment
captured_at: 2026-09-06
command: python3 -m unittest discover -s Tools -p vision_capacity_gate_test.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Frozen vision capacity post-run gate V162
tool: python3
---
V162 implements the separately declared V160 one-arm capacity assessment as a reproducible post-run tool. It reads the captured manifest, rows and completion and applies the unchanged fixed seven-cell/minimum five-clean-cell contract, exact output IDs and wire text, physical footprint, nominal power/thermal, unchanged VM intervals and query-tile mechanism constraints. It requires completion of the fixed study and prohibits duplicate, extra or foreign cells. A valid flag cannot replace physical or mechanism evidence; wrong outputs in otherwise clean cells fail the gate rather than being discarded to obtain a pass. Invalid cells stay excluded. No paired performance or memory-saving claim follows from this tool.

All five focused tests pass, including insufficient clean cells, wrong text/IDs, preparation/generation peak overflow, missing preparation evidence, swap, non-nominal state, missing query work, early stop, duplicate/replacement cells and malformed contracts. V160 remains unrun. This tool automates the already frozen post-run assessment and changes neither its protocol bytes nor any model source or optimization default. The context task retains the build/model interval for its bounded component gates.

Artifact `/Users/carlos/Projects/slotstream/Tools/vision_capacity_gate.py` — 5681 bytes, SHA-256 `851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040`.

````text
#!/usr/bin/env python3
"""Assess a prospectively frozen one-arm image capacity study from saved evidence."""
import argparse
import json
from pathlib import Path

from serve_bench import (resource_exclusions, sampled_request_peak,
                         validate_work_observation, work_constraints)


def assess(protocol, rows, completion):
    contract = protocol.get('capacity_gate')
    keys = {'minimum_clean_cells', 'fixed_cells', 'replacement_cells', 'expected_output_ids',
            'expected_wire_text', 'maximum_sampled_footprint_bytes', 'classification'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('capacity_gate must contain the complete frozen capacity contract')
    count, fixed = contract['minimum_clean_cells'], contract['fixed_cells']
    if (type(count) is not int or type(fixed) is not int or not 1 <= count <= fixed
            or type(protocol.get('rounds')) is not int or protocol['rounds'] != fixed
            or type(contract['replacement_cells']) is not int or contract['replacement_cells'] != 0):
        raise ValueError('capacity study requires bounded fixed cells with no replacements')
    ids, text = contract['expected_output_ids'], contract['expected_wire_text']
    if (type(ids) is not list or not ids or any(type(n) is not int or not 0 <= n < 248320 for n in ids)
            or type(text) is not str or not text):
        raise ValueError('capacity study requires exact nonempty output IDs and wire text')
    limit = contract['maximum_sampled_footprint_bytes']
    if (type(limit) is not int or limit <= 0 or limit != protocol.get('maximum_sampled_footprint_bytes')
            or not isinstance(protocol.get('arms'), dict) or len(protocol['arms']) != 1
            or not protocol.get('images') or protocol.get('acceptance') is not None):
        raise ValueError('capacity study requires one image arm and the same declared footprint ceiling')
    arm = next(iter(protocol['arms']))
    constraints = work_constraints(protocol)
    if not constraints:
        raise ValueError('capacity study requires explicit mechanism observations')
    if not isinstance(rows, list) or not isinstance(completion, dict):
        raise ValueError('capacity observations and completion must be structured')
    rounds = []
    for row in rows:
        n = row.get('round')
        if type(n) is not int or not 1 <= n <= fixed or row.get('arm') != arm or n in rounds:
            raise ValueError('duplicate, extra or foreign capacity cell')
        rounds.append(n)
    clean, excluded, details = [], [], []
    for row in rows:
        number = row['round']
        if row.get('valid') is not True:
            excluded.append(number)
            continue
        # Recheck physical evidence and mechanism; do not trust a Boolean or
        # rounded memory number copied out of a benchmark log.
        metrics = row.get('metrics') or {}
        stats = metrics.get('stats') or {}
        failures = resource_exclusions(stats, protocol)
        peak = sampled_request_peak(stats)
        if type(peak) is not int or peak > limit:
            failures.append('missing or excessive whole-request sampled footprint')
        for before_key, after_key, owner in [('before', 'after', row),
                                             ('generatorVMBefore', 'generatorVMAfter', stats)]:
            before, after = owner.get(before_key) or {}, owner.get(after_key) or {}
            if any(type(before.get(key)) is not int or type(after.get(key)) is not int
                   or before[key] != after[key] for key in ['swapins', 'swapouts']):
                failures.append('missing or changed VM interval')
        try:
            validate_work_observation(constraints, arm, stats)
        except (ValueError, TypeError, KeyError) as error:
            failures.append(str(error))
        if failures:
            excluded.append(number)
        else:
            clean.append(number)
        details.append({'round': number, 'evidence_errors': failures,
                        'exact_output': metrics.get('output_ids') == ids and row.get('text') == text,
                        'sampled_peak_bytes': peak})
    checks = {
        'fixed_study_completed': (sorted(rounds) == list(range(1, fixed + 1))
                                 and completion.get('stopped_early') is False
                                 and completion.get('interrupted') is False
                                 and completion.get('recorded_cells') == fixed
                                 and completion.get('planned_cells') == fixed),
        'minimum_clean_cells': len(clean) >= count,
        'clean_outputs_exact': bool(clean) and all(d['exact_output'] for d in details if d['round'] in clean),
        'valid_cells_have_complete_evidence': all(not d['evidence_errors'] for d in details),
    }
    return {'classification': 'Capacity only; no paired speed or memory-saving claim',
            'passed': all(checks.values()), 'checks': checks,
            'clean_rounds': clean, 'excluded_rounds': excluded, 'details': details}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('run', type=Path)
    args = parser.parse_args()
    protocol = json.loads((args.run / 'manifest.json').read_text())['protocol']
    rows = [json.loads(line) for line in (args.run / 'results.jsonl').read_text().splitlines() if line.strip()]
    completion = json.loads((args.run / 'completion.json').read_text())
    report = assess(protocol, rows, completion)
    print(json.dumps(report, indent=2))
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())

````

Artifact `/Users/carlos/Projects/slotstream/Tools/vision_capacity_gate_test.py` — 5006 bytes, SHA-256 `4cb266cbc6859ba053529f0ddb792199dc2a4e35af798a4d9cd636a123122412`.

````text
#!/usr/bin/env python3
import copy
import unittest

from vision_capacity_gate import assess


class CapacityGateTests(unittest.TestCase):
    def setUp(self):
        self.protocol = {
            'rounds': 7, 'arms': {'reference': {'chunk': 256, 'env': {}}},
            'images': [{'path': 'pinned.png'}], 'maximum_sampled_footprint_bytes': 10_000_000_000,
            'require_nominal_power_state': True,
            'work_constraints': {'reference': {'visionQueryTileCalls': {'min': 972, 'max': 972}}},
            'capacity_gate': {'minimum_clean_cells': 5, 'fixed_cells': 7, 'replacement_cells': 0,
                              'expected_output_ids': [3605], 'expected_wire_text': ' Red',
                              'maximum_sampled_footprint_bytes': 10_000_000_000,
                              'classification': 'Frozen one-arm capacity contract'},
        }
        vm = {'swapins': 19, 'swapouts': 7}
        system = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        stats = {'sampledFootprint': {'peakBytes': 7_000_000_000},
                 'imagePreparation': {'sampledFootprint': {'peakBytes': 6_900_000_000, 'samples': 3},
                                      'seconds': 1., 'sourceDecodeSeconds': .1, 'towerReadySeconds': .9},
                 'generatorSystemBefore': system, 'generatorSystemAfter': system,
                 'generatorVMBefore': vm, 'generatorVMAfter': vm, 'visionQueryTileCalls': 972}
        base = {'arm': 'reference', 'valid': True, 'text': ' Red', 'before': vm, 'after': vm,
                'metrics': {'output_ids': [3605], 'stats': stats}}
        self.rows = [copy.deepcopy(base) | {'round': n} for n in range(1, 8)]
        self.completion = {'stopped_early': False, 'interrupted': False,
                           'recorded_cells': 7, 'planned_cells': 7}

    def run_gate(self, rows=None):
        return assess(self.protocol, self.rows if rows is None else rows, self.completion)

    def test_five_clean_cells_suffice_without_promoting_excluded_rows(self):
        self.rows[1]['valid'] = False
        self.rows[5]['valid'] = False
        self.rows[1]['text'] = 'not usable'
        result = self.run_gate()
        self.assertTrue(result['passed'])
        self.assertEqual(result['clean_rounds'], [1, 3, 4, 5, 7])
        self.assertEqual(result['excluded_rounds'], [2, 6])
        self.rows[4]['valid'] = False
        self.assertFalse(self.run_gate()['passed'])

    def test_wrong_output_cannot_be_excluded_to_make_remaining_cells_pass(self):
        for field, value in [('text', 'Red'), ('output_ids', [9])]:
            rows = copy.deepcopy(self.rows)
            owner = rows[0] if field == 'text' else rows[0]['metrics']
            owner[field] = value
            result = self.run_gate(rows)
            self.assertFalse(result['passed'])
            self.assertEqual(len(result['clean_rounds']), 7)

    def test_valid_flag_does_not_replace_resource_or_mechanism_evidence(self):
        for mutate in [
            lambda row: row['metrics']['stats']['sampledFootprint'].update(peakBytes=10_000_000_001),
            lambda row: row['metrics']['stats']['imagePreparation']['sampledFootprint'].update(peakBytes=10_000_000_001),
            lambda row: row['metrics']['stats'].update(visionQueryTileCalls=0),
            lambda row: row['metrics']['stats'].pop('imagePreparation'),
            lambda row: row['metrics']['stats'].update(generatorVMAfter={'swapins': 20, 'swapouts': 7}),
            lambda row: row.update(after={'swapins': 19, 'swapouts': 8}),
            lambda row: row['metrics']['stats'].update(generatorSystemAfter={'thermalState': 'fair', 'lowPowerModeEnabled': False}),
        ]:
            rows = copy.deepcopy(self.rows)
            mutate(rows[0])
            self.assertFalse(self.run_gate(rows)['passed'])

    def test_fixed_count_duplicate_and_stopped_study_are_not_successes(self):
        self.assertFalse(self.run_gate(self.rows[:5])['passed'])
        for row in [self.rows[0], self.rows[0] | {'round': 8}, self.rows[0] | {'arm': 'other'}]:
            with self.assertRaises(ValueError): self.run_gate(self.rows + [row])
        self.completion['stopped_early'] = True
        self.assertFalse(self.run_gate()['passed'])

    def test_contract_must_be_fixed_explicit_and_single_arm(self):
        original = copy.deepcopy(self.protocol)
        for key, value in [('replacement_cells', 1), ('minimum_clean_cells', True),
                           ('fixed_cells', 8), ('expected_output_ids', [True]),
                           ('expected_wire_text', ''), ('maximum_sampled_footprint_bytes', 11_000_000_000)]:
            self.protocol = copy.deepcopy(original)
            self.protocol['capacity_gate'][key] = value
            with self.assertRaises(ValueError): self.run_gate()
        self.protocol = copy.deepcopy(original)
        self.protocol['arms']['other'] = {}
        with self.assertRaises(ValueError): self.run_gate()


if __name__ == '__main__':
    unittest.main()

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/vision-capacity-gate-v162.txt` — 103 bytes, SHA-256 `d03ce458f2a6cd2b4f27522f3aacad03ce1872c028853507c3ad02ca621bdcad`.

````text
.....
----------------------------------------------------------------------
Ran 5 tests in 0.002s

OK

````
