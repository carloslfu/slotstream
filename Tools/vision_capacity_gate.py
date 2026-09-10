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
