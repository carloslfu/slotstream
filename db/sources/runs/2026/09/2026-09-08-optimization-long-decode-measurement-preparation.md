---
type: run
id: 01m1z89stq54gjqxv3v88zxwrn
created: 2026-09-08T00:57:14.327452+00:00
updated: 2026-09-08T00:57:14.601403+00:00
summary: Bounded long-decode timing and eligibility reporter prepared and tested
binary: None executed; timer source checked against exact V304 binary af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d
captured_at: 2026-09-08
command: python3 -m unittest -v long_decode_test; source timer inspection; model-free preparation
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Bounded long-decode timing and eligibility reporter prepared and tested
tool: python3
---
# Longer active-decoding measurement is prepared, not executed

The short current prose result does not answer sustained decoding throughput. Source inspection of the exact V304 Generate.swift confirms that interTokenSeconds records monotonic intervals between sampled-token callback arrivals. It excludes prefill and work after the last sampled token, while retaining previous callback stalls and speculative emission bursts. Dividing decodeTokens by decodeSeconds can credit a removed terminal forward even when active arrival speed is unchanged.

V340 adds a model-free reporter, a longer prose fixture, and a final-protocol materializer. Each of two separate future modes uses 512 outputs, 16 interleaved process pairs, one full first job and one measured job per process, and at least eight clean pairs. Plain mode uses an explicit 10 GB target and fixed-depth-one MTP uses 12 GB. Both require complete prompt prefill, disabled prefix reuse and adaptive policy, exact complete outputs in every recorded pair, nominal thermal/power conditions, unchanged VM counters and sampled physical footprint within the target. Early EOS, missing or replacement cells, input/output mismatches and interrupted execution do not become speed evidence.

The primary rate is 511 divided by the sum of all 511 emission intervals. The later rate is 384 divided by intervals 127 through 510, covering sampled output128 to512. Four predeclared token windows describe within-request variation; they are not independent samples. Percentages are medians of per-process-pair changes, kept separate by mode and metric. Preview, total client time and physical footprint are reported separately. This is bounded 512-output throughput at the declared targets, never unlimited equilibrium or performance at an automatic machine budget. No synthetic test value is an inference result.

Thirteen model-free methods pass, including exact timer/window boundaries, speculative zero intervals, nonfinite and overflow inputs, incomplete output, wrong token types, paired arithmetic, exclusion counts, original warmup validation, mismatch on an otherwise excluded cell, explicit disabled-adaptive observations and immutable raw evidence. The source, exact test command and output are captured below.

Both model studies remain unrun. Their exact final binary, controls, current native proofs, guarded executor and reservation still need binding after the optional dispositions and final composition resolve. The materializer preserves supplied final controls instead of silently substituting an earlier candidate. The prospective safety envelope retains normal OS pressure, 3 GB live reserve and 0.2-second sampling; startup headroom is 13 GB plain and15 GB MTP. Each bounded study reserves at most12600 seconds of work plus60 seconds of cleanup and does not replace excluded cells. Existing acceptance studies and their criteria remain unchanged. No runtime/default/installation change, model launch or application closure occurred.

Current qualification and pressure boundaries: [[sources/runs/2026/09/2026-09-08-optimization-current-vision-mtp-static-gates]] and [[sources/runs/2026/09/2026-09-08-optimization-image-serving-pressure-stop]].

## Evidence inventory

````json
[
  {
    "path": "/tmp/slotstream-optimization-execution/long-decode-measurement-v340/long_decode.py",
    "bytes": 13629,
    "sha256": "0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-decode-measurement-v340/long_decode_test.py",
    "bytes": 10597,
    "sha256": "b44b8de8f9c6e1798a9e01871ac5b83b64ea7fdb0d7bf4fb909017e2ab7573c5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-decode-measurement-v340/preparation.json",
    "bytes": 4123,
    "sha256": "50fd0a48020d19429c9f168bf42762e420a309458628334bf27b7b04570f0933"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-decode-measurement-v340/prompt.txt",
    "bytes": 2783,
    "sha256": "735497f5024129f9ebcf41af981eae6ec38035f24df4248c277d413e5c71b2c2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-decode-measurement-v340/tests.stderr.txt",
    "bytes": 1408,
    "sha256": "0a649482f8f75fb13e44456ac7098c12541c3b1f5a573abdbb22210bfe6456ab"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-decode-measurement-v340/tests.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-decode-measurement-v340/validation.json",
    "bytes": 778,
    "sha256": "84226ff790c8ce5f9d86ab047fd18daf75f39cc2693703a6364dd0327c5c39db"
  }
]
````

## long_decode.py

SHA-256 `0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820`.

````text
"""Prospective, model-free analysis for a bounded 512-output decode study.

This does not launch a model, select runtime controls, or qualify activation.
The executing build, final controls, resource guard and evidence must be bound
before use. Token windows are descriptions inside a run, never replications.
"""
import argparse
import copy
import hashlib
import json
import math
from pathlib import Path
import statistics
import sys

ROOT = Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0, str(ROOT / 'Tools'))
import optimization_results as short_results
import serve_bench as bench

OUTPUTS = 512
ROUNDS = 16
MINIMUM_PAIRS = 8
WINDOWS = ((1, 128), (128, 256), (256, 384), (384, 512))
HERE = Path(__file__).resolve().parent


def materialize(final_protocol, mode):
    """Reuse final qualified controls, without asserting their qualification.

    The external executor must bind their actual native proofs and exact build.
    In particular this must not silently reuse V304 after the final controls move.
    """
    require(mode in ('off', 'on') and final_protocol.get('mtp') == mode,
            'a same-mode final composition is required')
    require(set(final_protocol.get('arms', {})) == {'reference', 'combined'},
            'both final arms are required')
    for arm in final_protocol['arms'].values():
        require(arm.get('binary') == final_protocol.get('binary')
                and arm.get('chunk') == 256
                and arm.get('env', {}).get('SLOTSTREAM_OPT_ADAPTIVE_MTP') == '0',
                'fixed final build, 256-row pass and disabled adaptive policy required')
        if mode == 'on':
            require(arm['env'].get('SLOTSTREAM_DRAFT_DEPTH') == '1',
                    'MTP study requires explicitly fixed depth one')
    for field in ('binary', 'model', 'frozen_binary_sha256'):
        require(isinstance(final_protocol.get(field), str) and final_protocol[field],
                'final build and model binding required')
    prompt = HERE / 'prompt.txt'
    target = 10 if mode == 'off' else 12
    return {'label': 'long-decode-' + mode, 'classification': 'Prospective bounded 512-output study; final composition proofs and guarded executor required',
            **{k: final_protocol[k] for k in ('binary', 'model', 'frozen_binary_sha256')},
            'arms': copy.deepcopy(final_protocol['arms']), 'mtp': mode, 'memory_gb': target,
            'raw': False, 'think': False, 'seed': 7, 'rounds': ROUNDS,
            'max_tokens': OUTPUTS, 'minimum_output_tokens': OUTPUTS,
            'fixture': str(prompt), 'fixture_sha256': hashlib.sha256(prompt.read_bytes()).hexdigest(),
            'comparison_basis': 'fixed-total-memory', 'require_nominal_power_state': True,
            'maximum_sampled_footprint_bytes': target * 1_000_000_000,
            'abort_on_resource_failure': True, 'stop_on_workspace_contention': True,
            'initial_workspace_quiet': {'stable_seconds': 180, 'maximum_wait_seconds': 1800},
            'between_cells_seconds': 60, 'model_reservation_wait_seconds': 1800,
            'timeout_seconds': 600,
            'acceptance': {'minimum_pairs': MINIMUM_PAIRS, 'maximum_median_client_regression': .05,
                           'minimum_positive_fraction': 0, 'all_outputs_exact': True, 'replacement_rounds': 0}}


def require(ok, message):
    if not ok:
        raise ValueError(message)


def ids(value):
    return isinstance(value, list) and all(type(x) is int and x >= 0 for x in value)


def rate(values):
    require(isinstance(values, list) and values
            and all(short_results.number(x, zero=True) for x in values),
            'missing or invalid emission intervals')
    try:
        seconds = math.fsum(values)
    except OverflowError as error:
        raise ValueError('emission duration overflow') from error
    require(short_results.number(seconds), 'emission duration must be positive and finite')
    result = len(values) / seconds
    require(short_results.number(result), 'emission rate must be finite')
    return {'intervals': len(values), 'seconds': seconds, 'tokens_per_second': result}


def emission(row):
    m = row.get('metrics') or {}
    s = m.get('stats') or {}
    output = m.get('output_ids')
    require(ids(output) and len(output) == OUTPUTS
            and type(s.get('decodeTokens')) is int and s['decodeTokens'] == OUTPUTS
            and s.get('finishReason') == 'length',
            'every execution must complete the fixed 512-output workload')
    intervals = s.get('interTokenSeconds')
    require(isinstance(intervals, list) and len(intervals) == OUTPUTS - 1,
            '512 outputs require exactly 511 emission intervals')
    all_tokens = rate(intervals)
    # Index 127 is the interval from sampled output 128 to output 129.
    # No time is subtracted from decodeSeconds, and no post-final-token work
    # can improve either of these two rates.
    late = rate(intervals[127:])
    windows = [{'from_output': start, 'to_output': end,
                **rate(intervals[start - 1:end - 1])} for start, end in WINDOWS]
    return {'active': all_tokens, 'after_output_128': late, 'windows': windows}


def observed_work(row, mtp):
    m = row['metrics']
    s = m['stats']
    require(ids(m.get('prompt_ids')) and m['prompt_ids'], 'prompt IDs are required')
    prompt_count = len(m['prompt_ids'])
    require(type(s.get('prefillTokens')) is int and s['prefillTokens'] == prompt_count
            and type(s.get('promptTokens')) is int and s['promptTokens'] == prompt_count
            and type(s.get('reusedPrefixTokens')) is int and s['reusedPrefixTokens'] == 0,
            'the full prompt must actually prefill, without retained-prefix reuse')
    require(m.get('effective_mtp') is mtp
            and type(m.get('effective_pool_slots')) is int and m['effective_pool_slots'] > 0,
            'effective mode or pool observation differs')
    require(s.get('adaptiveDraftDepths') == []
            and type(s.get('adaptivePlainTokens')) is int and s['adaptivePlainTokens'] == 0
            and s.get('adaptiveDisabledAtOutput') is None,
            'rejected adaptive policy cannot enter the measurement')
    require(isinstance(row.get('text'), str) and row['text'].strip(), 'visible output is required')


def clean(row, protocol):
    s = row['metrics']['stats']
    reasons = []
    if row.get('valid') is not True or row.get('startup_and_warmup_valid') is not True:
        reasons.append('request or first-job resource eligibility failed')
    reasons.extend(bench.resource_exclusions(s, protocol))
    for first, last in ((row.get('before'), row.get('after')),
                        (row.get('before_startup'), row.get('after_warmup_vm')),
                        (s.get('generatorVMBefore'), s.get('generatorVMAfter'))):
        if (not isinstance(first, dict) or not isinstance(last, dict)
                or any(type(first.get(k)) is not int or first[k] < 0
                       or type(last.get(k)) is not int or last[k] != first[k]
                       for k in ('swapins', 'swapouts'))):
            reasons.append('missing, changed or invalid VM counters')
    return reasons


def ratios(samples, field, higher):
    paired = []
    for sample in samples:
        a, b = sample['reference'][field], sample['combined'][field]
        require(short_results.number(a) and short_results.number(b, zero=not higher),
                'paired metric must be finite and measurable')
        ratio = b / a
        gain = 100 * (ratio - 1 if higher else 1 - ratio)
        require(math.isfinite(gain), 'paired ratio overflow')
        paired.append({'round': sample['round'], 'reference': a, 'combined': b,
                       'improvement_percent': gain})
    enough = len(paired) >= MINIMUM_PAIRS
    return {'clean_pairs': len(paired), 'measured': enough,
            'median_reference': statistics.median(x['reference'] for x in paired) if enough else None,
            'median_combined': statistics.median(x['combined'] for x in paired) if enough else None,
            'median_improvement_percent': statistics.median(x['improvement_percent'] for x in paired) if enough else None,
            'positive_pair_fraction': sum(x['improvement_percent'] > 0 for x in paired) / len(paired) if enough else None,
            'samples': paired}


def analyze(rows, warmups, protocol, completion):
    require(protocol.get('rounds') == ROUNDS and protocol.get('max_tokens') == OUTPUTS
            and protocol.get('minimum_output_tokens') == OUTPUTS
            and protocol.get('mtp') in ('off', 'on')
            and set(protocol.get('arms', {})) == {'reference', 'combined'}
            and protocol.get('comparison_basis') == 'fixed-total-memory'
            and protocol.get('memory_gb') == (10 if protocol.get('mtp') == 'off' else 12)
            and protocol.get('maximum_sampled_footprint_bytes') == protocol['memory_gb'] * 1_000_000_000
            and protocol.get('require_nominal_power_state') is True,
            'not the declared long-decode study')
    expected = [(n, arm) for n in range(1, ROUNDS + 1)
                for arm in (('reference', 'combined') if n % 2 else ('combined', 'reference'))]
    require([(x.get('round'), x.get('arm')) for x in rows] == expected,
            'the complete interleaved cohort is required; no duplicate or replacement cells')
    require(set(warmups) == set(expected), 'every original first job is required')
    require(completion.get('interrupted') is False and completion.get('stopped_early') is False
            and completion.get('planned_cells') == len(expected)
            and completion.get('recorded_cells') == len(expected) and not completion.get('error'),
            'partial or interrupted study cannot report a comparison')
    observations, exclusions = {}, {}
    for row in rows:
        coordinate = (row['round'], row['arm'])
        require(not row.get('error') and not row.get('interrupted'), 'execution error is not an exclusion')
        e = emission(row)
        observed_work(row, protocol['mtp'] == 'on')
        warm = warmups[coordinate]
        emission(warm)
        observed_work(warm, protocol['mtp'] == 'on')
        reasons = clean(row, protocol)
        reasons.extend(bench.resource_exclusions(warm['metrics']['stats'], protocol))
        observations[coordinate] = {
            'active_tps': e['active']['tokens_per_second'],
            'late_tps': e['after_output_128']['tokens_per_second'],
            'client_seconds': row.get('client_seconds'),
            'preview_seconds': row.get('first_visible_text_seconds'),
            'sampled_process_peak_bytes': bench.sampled_request_peak(row['metrics']['stats']),
            'emission': e,
        }
        exclusions[coordinate] = reasons
    pairs, excluded = [], []
    lookup = {(r['round'], r['arm']): r for r in rows}
    for n in range(1, ROUNDS + 1):
        a, b = lookup[n, 'reference'], lookup[n, 'combined']
        for left, right in ((a, b), (warmups[n, 'reference'], warmups[n, 'combined'])):
            require(left['metrics']['prompt_ids'] == right['metrics']['prompt_ids']
                    and left['metrics']['output_ids'] == right['metrics']['output_ids']
                    and left['text'] == right['text'],
                    'output or input mismatch anywhere in the cohort invalidates the comparison')
        reasons = {arm: exclusions[n, arm] for arm in ('reference', 'combined') if exclusions[n, arm]}
        if reasons:
            excluded.append({'round': n, 'reasons': reasons})
        else:
            pairs.append({'round': n, **{arm: observations[n, arm] for arm in ('reference', 'combined')}})
    metrics = {field: ratios(pairs, field, higher) for field, higher in (
        ('active_tps', True), ('late_tps', True), ('client_seconds', False),
        ('preview_seconds', False), ('sampled_process_peak_bytes', False))}
    return {'classification': 'Bounded 512-output active decoding after complete prefill',
            'minimum_pairs': MINIMUM_PAIRS, 'metrics': metrics, 'excluded_rounds': excluded,
            'per_pair_observations': pairs,
            'active_method': '511 / sum(all 511 interTokenSeconds)',
            'late_method': '384 / sum(interTokenSeconds[127:511]), output 128 through output 512',
            'replication_unit': 'One interleaved reference/combined process pair; token windows are not independent samples.',
            'percentage_method': 'Median of paired percent changes; no ratio of medians or cross-mode pooling.',
            'limits': 'Server sampled-token emission includes prior callback stalls and speculative bursts. It excludes prefill and work after the final sampled token. No unbounded equilibrium or other-budget/chip inference.',
            'activation_qualified': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--evidence', type=Path, required=True)
    args = parser.parse_args()
    raw = args.evidence
    read = lambda name: json.loads((raw / name).read_text())
    manifest = read('manifest.json')
    protocol = manifest['protocol']
    rows = [json.loads(line) for line in (raw / 'results.jsonl').read_text().splitlines()]
    warmups = {(n, arm): read(f'{n}-{arm}/warmup.json') for n in range(1, ROUNDS + 1)
               for arm in ('reference', 'combined')}
    result = analyze(rows, warmups, protocol, read('completion.json'))
    result['classification'] += '; descriptive raw-data analysis; outer build/resource/cleanup qualification required'
    print(json.dumps(result, indent=2, allow_nan=False))


if __name__ == '__main__':
    main()

````

## long_decode_test.py

SHA-256 `b44b8de8f9c6e1798a9e01871ac5b83b64ea7fdb0d7bf4fb909017e2ab7573c5`.

````text
import copy
import math
import unittest

import long_decode as study


def fixture():
    protocol = {'rounds': 16, 'max_tokens': 512, 'minimum_output_tokens': 512,
                'memory_gb': 10,
                'mtp': 'off', 'arms': {'reference': {}, 'combined': {}},
                'comparison_basis': 'fixed-total-memory',
                'maximum_sampled_footprint_bytes': 10_000_000_000,
                'require_nominal_power_state': True}
    rows, warmups = [], {}
    for n in range(1, 17):
        for arm in (('reference', 'combined') if n % 2 else ('combined', 'reference')):
            interval = .1 if arm == 'reference' else .08
            vm = {'swapins': 7, 'swapouts': 3}
            power = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
            stats = {'decodeTokens': 512, 'finishReason': 'length',
                     'interTokenSeconds': [interval] * 511,
                     'prefillTokens': 2, 'promptTokens': 2, 'reusedPrefixTokens': 0,
                     'adaptiveDraftDepths': [], 'adaptivePlainTokens': 0,
                     'sampledFootprint': {'peakBytes': 8_000_000_000 if arm == 'reference' else 7_000_000_000},
                     'generatorVMBefore': vm.copy(), 'generatorVMAfter': vm.copy(),
                     'generatorSystemBefore': power.copy(), 'generatorSystemAfter': power.copy()}
            row = {'round': n, 'arm': arm, 'valid': True, 'startup_and_warmup_valid': True,
                   'before': vm.copy(), 'after': vm.copy(), 'before_startup': vm.copy(),
                   'after_warmup_vm': vm.copy(), 'text': 'measured prose',
                   'client_seconds': 60 if arm == 'reference' else 50,
                   'first_visible_text_seconds': 3 if arm == 'reference' else 2,
                   'metrics': {'prompt_ids': [1, 2], 'output_ids': list(range(512)),
                               'effective_mtp': False, 'effective_pool_slots': 100 if arm == 'reference' else 105,
                               'stats': stats}}
            rows.append(row)
            warmups[n, arm] = copy.deepcopy(row)
    completion = {'interrupted': False, 'stopped_early': False,
                  'planned_cells': 32, 'recorded_cells': 32}
    return rows, warmups, protocol, completion


class LongDecodeTests(unittest.TestCase):
    def test_final_protocol_materialization_preserves_controls_and_binds_fixture(self):
        original = {'mtp': 'on', 'model': '/fake/model', 'binary': '/fake/slotstream',
                    'frozen_binary_sha256': 'a' * 64,
                    'arms': {arm: {'binary': '/fake/slotstream', 'chunk': 256,
                                  'env': {'SLOTSTREAM_OPT_ADAPTIVE_MTP': '0',
                                          'SLOTSTREAM_DRAFT_DEPTH': '1', 'EXAMPLE_FINAL_CONTROL': arm}}
                             for arm in ('reference', 'combined')}}
        before = copy.deepcopy(original)
        protocol = study.materialize(original, 'on')
        self.assertEqual(original, before)
        self.assertEqual(protocol['arms'], original['arms'])
        self.assertEqual(protocol['memory_gb'], 12)
        self.assertEqual(protocol['minimum_output_tokens'], 512)
        self.assertEqual(protocol['acceptance']['replacement_rounds'], 0)
        self.assertEqual(protocol['acceptance']['minimum_pairs'], 8)
        for broken in ('mode', 'adaptive', 'depth', 'build'):
            modified = copy.deepcopy(original)
            if broken == 'mode': modified['mtp'] = 'off'
            elif broken == 'adaptive': modified['arms']['combined']['env']['SLOTSTREAM_OPT_ADAPTIVE_MTP'] = '1'
            elif broken == 'depth': modified['arms']['combined']['env']['SLOTSTREAM_DRAFT_DEPTH'] = '2'
            else: modified['arms']['combined']['binary'] = '/fake/other'
            with self.subTest(broken=broken), self.assertRaises(ValueError):
                study.materialize(modified, 'on')

    def test_exact_intervals_and_late_window_boundaries(self):
        row = fixture()[0][0]
        row['metrics']['stats']['interTokenSeconds'] = [1.] * 127 + [.5] * 128 + [.25] * 128 + [.125] * 128
        result = study.emission(row)
        self.assertEqual(result['active']['intervals'], 511)
        self.assertEqual(result['after_output_128']['intervals'], 384)
        self.assertEqual(result['active']['seconds'], 239)
        self.assertEqual(result['after_output_128']['seconds'], 112)
        self.assertEqual([x['tokens_per_second'] for x in result['windows']], [1, 2, 4, 8])

    def test_prefill_and_terminal_timers_do_not_change_active_speed(self):
        row = fixture()[0][0]
        before = study.emission(row)
        row['metrics']['stats'].update(prefillSeconds=1000, decodeSeconds=.001, reconciliationSeconds=900)
        self.assertEqual(study.emission(row), before)

    def test_speculative_zero_intervals_use_total_elapsed_not_mean_reciprocal(self):
        row = fixture()[0][0]
        row['metrics']['stats']['interTokenSeconds'] = [0., .2] * 255 + [.1]
        self.assertAlmostEqual(study.emission(row)['active']['tokens_per_second'], 10)

    def test_short_eos_and_invalid_intervals_are_not_eligible(self):
        for value in (None, [], [.1] * 510, [0.] * 511, [math.nan] * 511,
                      [math.inf] * 511, [-1.] * 511, [True] * 511,
                      [1e308] * 511, [1e-320] * 511, [10**1000] * 511):
            row = fixture()[0][0]
            row['metrics']['stats']['interTokenSeconds'] = value
            with self.subTest(value=str(value)[:40]), self.assertRaises(ValueError):
                study.emission(row)
        row = fixture()[0][0]
        row['metrics']['stats']['finishReason'] = 'stop'
        with self.assertRaisesRegex(ValueError, 'fixed 512'):
            study.emission(row)

    def test_counts_and_token_id_types_must_be_real_integers(self):
        for key in ('output_ids', 'prompt_ids'):
            rows, warmups, protocol, completion = fixture()
            rows[0]['metrics'][key][0] = True
            with self.assertRaises(ValueError):
                study.analyze(rows, warmups, protocol, completion)
        row = fixture()[0][0]
        row['metrics']['stats']['decodeTokens'] = 512.
        with self.assertRaises(ValueError):
            study.emission(row)

    def test_descriptive_rates_and_memory_keep_different_units(self):
        report = study.analyze(*fixture())
        metrics = report['metrics']
        self.assertEqual(metrics['active_tps']['clean_pairs'], 16)
        self.assertAlmostEqual(metrics['active_tps']['median_improvement_percent'], 25)
        self.assertAlmostEqual(metrics['late_tps']['median_improvement_percent'], 25)
        self.assertAlmostEqual(metrics['sampled_process_peak_bytes']['median_improvement_percent'], 12.5)
        self.assertFalse(report['activation_qualified'])

    def test_percentages_are_paired_not_ratio_of_medians(self):
        data = [{'round': i, 'reference': {'value': a}, 'combined': {'value': b}}
                for i, (a, b) in enumerate([(1, .9), (2, .2), (3, 2.7), (100, 50), (200, 100)] * 2)]
        self.assertAlmostEqual(study.ratios(data, 'value', False)['median_improvement_percent'], 50)

    def test_missing_cells_duplicates_order_and_partial_execution_fail_closed(self):
        for mutation in ('missing', 'duplicate', 'order', 'interrupted', 'stopped_early', 'error', 'warmup'):
            rows, warmups, protocol, completion = fixture()
            if mutation == 'missing': rows.pop()
            elif mutation == 'duplicate': rows.append(copy.deepcopy(rows[0]))
            elif mutation == 'order': rows.reverse()
            elif mutation == 'warmup': warmups.pop((1, 'reference'))
            else: completion[mutation] = True
            with self.subTest(mutation=mutation), self.assertRaises(ValueError):
                study.analyze(rows, warmups, protocol, completion)

    def test_any_output_mismatch_invalidates_even_a_timing_excluded_cell(self):
        for location in ('measured', 'warmup'):
            rows, warmups, protocol, completion = fixture()
            row = rows[0] if location == 'measured' else warmups[1, 'reference']
            row['metrics']['output_ids'][-1] += 1
            rows[0]['valid'] = False
            with self.assertRaisesRegex(ValueError, 'mismatch anywhere'):
                study.analyze(rows, warmups, protocol, completion)

    def test_swapping_or_hot_or_unobserved_runs_cannot_supply_minimum_pairs(self):
        for error in ('swap', 'warmup_swap', 'warmup_invalid', 'hot', 'footprint', 'missing_vm'):
            rows, warmups, protocol, completion = fixture()
            for row in rows:
                if row['round'] <= 9 and row['arm'] == 'reference':
                    if error == 'swap': row['after']['swapins'] += 1
                    elif error == 'warmup_swap': row['after_warmup_vm']['swapouts'] += 1
                    elif error == 'warmup_invalid': row['startup_and_warmup_valid'] = False
                    elif error == 'hot': row['metrics']['stats']['generatorSystemAfter']['thermalState'] = 'fair'
                    elif error == 'footprint': row['metrics']['stats']['sampledFootprint']['peakBytes'] = 10_000_000_001
                    else: del row['before']
            report = study.analyze(rows, warmups, protocol, completion)
            with self.subTest(error=error):
                self.assertEqual(report['metrics']['active_tps']['clean_pairs'], 7)
                self.assertFalse(report['metrics']['active_tps']['measured'])
                self.assertIsNone(report['metrics']['active_tps']['median_improvement_percent'])

    def test_reuse_adaptive_or_wrong_mode_cannot_claim_long_decode(self):
        for key, value in (('reusedPrefixTokens', 1), ('prefillTokens', 0),
                           ('adaptiveDraftDepths', [1]), ('adaptivePlainTokens', 1),
                           ('adaptiveDisabledAtOutput', 7)):
            rows, warmups, protocol, completion = fixture()
            rows[0]['metrics']['stats'][key] = value
            with self.assertRaises(ValueError):
                study.analyze(rows, warmups, protocol, completion)
        rows, warmups, protocol, completion = fixture()
        rows[0]['metrics']['effective_mtp'] = True
        with self.assertRaises(ValueError):
            study.analyze(rows, warmups, protocol, completion)

    def test_report_never_mutates_raw_evidence(self):
        arguments = fixture()
        before = copy.deepcopy(arguments)
        study.analyze(*arguments)
        self.assertEqual(arguments, before)


if __name__ == '__main__':
    unittest.main()

````

## preparation.json

SHA-256 `50fd0a48020d19429c9f168bf42762e420a309458628334bf27b7b04570f0933`.

````text
{
  "format": "slotstream-long-decode-preparation-v1",
  "classification": "Model-free preparation. No inference launched, no final composition bound, no resource interval reserved, no performance result.",
  "purpose": "Measure the user-requested active token rate after complete prefill on longer fixed outputs, separately from preview and post-final-token bookkeeping.",
  "final_binding_required": [
    "Exact qualified final binary/source/Metal identity and same-mode native prerequisites",
    "Explicit final reference and combined controls; both adaptive policies disabled, MTP depth one",
    "A guarded executor binding this reporter, fixture, serving driver and final protocol before any model observation",
    "Meaningful memory-availability change and an explicit coordinated execution interval"
  ],
  "workloads": [
    {
      "name": "plain-long-decode",
      "mtp": "off",
      "memory_gb": 10,
      "startup_reclaimable_gb": 13,
      "maximum_owned_rss_gb": 12
    },
    {
      "name": "fixed-mtp-long-decode",
      "mtp": "on",
      "memory_gb": 12,
      "startup_reclaimable_gb": 15,
      "maximum_owned_rss_gb": 14
    }
  ],
  "fixed_execution": {
    "output_tokens": 512,
    "minimum_output_tokens": 512,
    "rounds": 16,
    "process_cells": 32,
    "fresh_first_jobs": 32,
    "measured_jobs": 32,
    "minimum_clean_pairs": 8,
    "replacement_rounds": 0,
    "alternating_reference_combined_order": true,
    "full_prompt_prefill_required": true,
    "prefix_cache": false,
    "images": false,
    "elastic": false,
    "raw": false,
    "think": false,
    "seed": 7,
    "prefill_chunk": 256,
    "between_cells_seconds": 60,
    "initial_quiet_seconds": 180,
    "minimum_live_reclaimable_gb": 3,
    "sample_interval_seconds": 0.2,
    "maximum_work_seconds": 12600,
    "cleanup_allowance_seconds": 60,
    "stop_on_os_pressure": true,
    "stop_on_new_swapouts": true,
    "maximum_sampled_request_footprint": "Actual mode target, including each first job",
    "early_EOS": "Fails fixed-length workload; preserve outcome without replacing prompt or cells"
  },
  "measures": {
    "active_emission_tps": "511 / sum(interTokenSeconds)",
    "late_emission_tps": "384 / sum(interTokenSeconds[127:511])",
    "windows": "1\u2192128 (127 intervals), 128\u2192256, 256\u2192384, 384\u2192512 (128 each); descriptive within each request, not independent samples",
    "aggregation": "Median of per-process-pair percentages, separate for each mode and metric",
    "other": "Client first visible text, total request latency and sampled physical process footprint, not tensor bytes",
    "scope": "Bounded 512-output throughput at explicit 10/12 GB targets, not unlimited steady state or a claim at the machine automatic budget"
  },
  "source_observation": {
    "source": "/Users/carlos/Projects/slotstream/Sources/Slotstream/Generate.swift",
    "sha256": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
    "build_binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
    "timer_lines": [
      948,
      960,
      998,
      1004
    ],
    "finding": "Token callback arrivals use monotonic RuntimeClock before the callback. Intervals exclude prefill and work after the last sampled token; prior callback stalls and speculative bursts remain included."
  },
  "artifacts_sha256": {
    "long_decode.py": "0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820",
    "long_decode_test.py": "b44b8de8f9c6e1798a9e01871ac5b83b64ea7fdb0d7bf4fb909017e2ab7573c5",
    "prompt.txt": "735497f5024129f9ebcf41af981eae6ec38035f24df4248c277d413e5c71b2c2",
    "tests.stderr.txt": "0a649482f8f75fb13e44456ac7098c12541c3b1f5a573abdbb22210bfe6456ab",
    "tests.stdout.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "validation.json": "84226ff790c8ce5f9d86ab047fd18daf75f39cc2693703a6364dd0327c5c39db"
  },
  "validation": "Thirteen model-free methods pass. Synthetic numbers verify arithmetic only and are never inference evidence.",
  "activation_performed": false,
  "studies_executed": false
}

````

## prompt.txt

SHA-256 `735497f5024129f9ebcf41af981eae6ec38035f24df4248c277d413e5c71b2c2`.

````text
The observatory stood above a coastal valley. Its oldest instrument was a brass telescope, assembled by a watchmaker who had never seen the sea. Every spring the staff compared its readings with the electronic instruments in the newer dome. They expected the older device to drift, yet the largest errors usually came from software that treated a missing observation as zero.

Mara kept a paper ledger beside the weather station. She recorded the time, the temperature, the wind direction, and whether a measurement had been taken at all. A blank cell was deliberately different from a calm wind. When the computer reported six hours without a breeze, she checked the ledger and found that a cable had disconnected during a storm. The distinction between absence and zero changed their estimate of the season's prevailing winds.

The next project involved two cameras watching the same patch of sky. Their clocks agreed at noon, but diverged as the equipment cooled overnight. Rather than subtracting two wall-clock timestamps, the team measured intervals with a monotonic counter. They preserved the original exposures, calibration frames, and exact processing settings. An attractive picture could now be traced back to the raw sensor data that produced it.

Storage became the next constraint. The cameras created more images than the workstation could hold in memory. An assistant suggested loading each image again for every analysis. Mara instead arranged the work so that one loaded image served several independent measurements. The arithmetic stayed the same. The order of disk access changed, and the team measured whether the reduced reading actually shortened the nightly job.

They tried a second optimization that combined arithmetic operations. Its isolated benchmark ran faster, but faint stars near the detection threshold moved in and out of the catalogue. The team retained the experiment as evidence and restored the original path. Their report distinguished the result they had hoped for from the result they had observed.

At the end of the season, the observatory published the complete record: successful changes, failed trials, uncertainty, and the remaining limitations. Another station could repeat the work using different equipment. Reproducibility depended on preserving those details, not on choosing the most impressive single night.

Write a detailed engineering design review of this account, targeting 1,500 to 2,000 words. Explain data representation, missing observations, monotonic timing, I/O scheduling, numerical equivalence, cache ownership, resource limits, and reproducible experiments. For each topic give a concrete example, a failure mode, and a verification procedure. Begin directly with the review and develop each topic thoroughly.

````

## tests.stderr.txt

SHA-256 `0a649482f8f75fb13e44456ac7098c12541c3b1f5a573abdbb22210bfe6456ab`.

````text
test_any_output_mismatch_invalidates_even_a_timing_excluded_cell (long_decode_test.LongDecodeTests) ... ok
test_counts_and_token_id_types_must_be_real_integers (long_decode_test.LongDecodeTests) ... ok
test_descriptive_rates_and_memory_keep_different_units (long_decode_test.LongDecodeTests) ... ok
test_exact_intervals_and_late_window_boundaries (long_decode_test.LongDecodeTests) ... ok
test_final_protocol_materialization_preserves_controls_and_binds_fixture (long_decode_test.LongDecodeTests) ... ok
test_missing_cells_duplicates_order_and_partial_execution_fail_closed (long_decode_test.LongDecodeTests) ... ok
test_percentages_are_paired_not_ratio_of_medians (long_decode_test.LongDecodeTests) ... ok
test_prefill_and_terminal_timers_do_not_change_active_speed (long_decode_test.LongDecodeTests) ... ok
test_report_never_mutates_raw_evidence (long_decode_test.LongDecodeTests) ... ok
test_reuse_adaptive_or_wrong_mode_cannot_claim_long_decode (long_decode_test.LongDecodeTests) ... ok
test_short_eos_and_invalid_intervals_are_not_eligible (long_decode_test.LongDecodeTests) ... ok
test_speculative_zero_intervals_use_total_elapsed_not_mean_reciprocal (long_decode_test.LongDecodeTests) ... ok
test_swapping_or_hot_or_unobserved_runs_cannot_supply_minimum_pairs (long_decode_test.LongDecodeTests) ... ok

----------------------------------------------------------------------
Ran 13 tests in 0.363s

OK

````

## tests.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## validation.json

SHA-256 `84226ff790c8ce5f9d86ab047fd18daf75f39cc2693703a6364dd0327c5c39db`.

````text
{
  "command": [
    "python3",
    "-m",
    "unittest",
    "-v",
    "long_decode_test"
  ],
  "exit_code": 0,
  "passed": true,
  "seconds": 0.41281395800000004,
  "model_launched": false,
  "tests_kind": "Synthetic timing/eligibility/control materialization only; no inference measurements",
  "source_sha256": {
    "prompt.txt": "735497f5024129f9ebcf41af981eae6ec38035f24df4248c277d413e5c71b2c2",
    "tests.stdout.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "long_decode_test.py": "b44b8de8f9c6e1798a9e01871ac5b83b64ea7fdb0d7bf4fb909017e2ab7573c5",
    "long_decode.py": "0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820",
    "tests.stderr.txt": "0a649482f8f75fb13e44456ac7098c12541c3b1f5a573abdbb22210bfe6456ab"
  }
}

````

