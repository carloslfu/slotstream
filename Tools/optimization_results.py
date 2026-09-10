#!/usr/bin/env python3
"""Report paired latency, active emission rate and memory from campaign evidence.

Read-only analysis. Workloads stay separate and percentages are medians of
paired ratios, never ratios of medians or sums of independent improvements.
"""
import argparse
import json
import math
from pathlib import Path
import statistics

import optimization_campaign as campaign
from prefill_bench import digest


def field(row, *path):
    value = row
    for key in path:
        if not isinstance(value, dict):
            return None
        value = value.get(key)
    return value


def number(value, *, zero=False):
    try:
        return type(value) in (int, float) and math.isfinite(value) and (value >= 0 if zero else value > 0)
    except OverflowError:
        return False


def active_emission_tps(row):
    """N-1 emission intervals exclude prefill and work after the last token."""
    ids = field(row, 'metrics', 'output_ids')
    count = field(row, 'metrics', 'stats', 'decodeTokens')
    intervals = field(row, 'metrics', 'stats', 'interTokenSeconds')
    if (not isinstance(ids, list) or type(count) is not int or count != len(ids) or count < 2
            or not isinstance(intervals, list) or len(intervals) != count - 1
            or any(not number(value, zero=True) for value in intervals)):
        return None
    try:
        seconds = math.fsum(intervals)
    except OverflowError:
        return None
    value = (count - 1) / seconds if number(seconds) else None
    return value if number(value) else None


def decode_phase_tps(row):
    # With one emitted token, this timer can contain only post-prefill
    # bookkeeping. Dividing by it does not measure generation throughput.
    ids = field(row, 'metrics', 'output_ids')
    count = field(row, 'metrics', 'stats', 'decodeTokens')
    seconds = field(row, 'metrics', 'stats', 'decodeSeconds')
    if (not isinstance(ids, list) or type(count) is not int or count != len(ids)
            or count < 2 or not number(seconds)):
        return None
    value = count / seconds
    return value if number(value) else None


METRICS = {
    'request_seconds': ('seconds', 'lower', lambda r: r.get('client_seconds'), 'valid'),
    'first_protocol_delta_seconds': ('seconds', 'lower', lambda r: r.get('first_protocol_delta_seconds'), 'valid'),
    'first_visible_text_seconds': ('seconds', 'lower', lambda r: r.get('first_visible_text_seconds'), 'valid'),
    'fresh_process_first_job_seconds': ('seconds', 'lower', lambda r: field(r, 'first_request', 'complete_seconds_from_launch'), 'valid'),
    'prefill_seconds': ('seconds', 'lower', lambda r: field(r, 'metrics', 'stats', 'prefillSeconds'), 'valid'),
    'active_emission_tokens_per_second': ('tokens/second', 'higher', active_emission_tps, 'valid'),
    'decode_phase_tokens_per_second': ('tokens/second', 'higher', decode_phase_tps, 'valid'),
    'sampled_process_peak_bytes': ('bytes', 'lower', lambda r: campaign.bench.sampled_request_peak(field(r, 'metrics', 'stats') or {}), 'valid'),
    'active_tensor_bytes': ('bytes', 'lower', lambda r: field(r, 'metrics', 'stats', 'mlxActiveEndBytes'), 'valid'),
}


def summarize_metric(rows, name):
    unit, direction, extract, eligible = METRICS[name]
    grouped = {}
    for row in rows:
        arms = grouped.setdefault(row['round'], {})
        if row['arm'] in arms:
            raise ValueError('duplicate measurement coordinate')
        arms[row['arm']] = row
    # Use the acceptance engine's exact first-job cohort: both request and
    # warmup eligibility, identical first-job outputs/configuration, and all
    # required timings. A clean warmup alone cannot qualify a startup pair.
    startup_rounds = None
    if name == 'fresh_process_first_job_seconds':
        startup_rounds = {pair['round']
                          for summary in campaign.bench.startup_summaries(rows, 'reference')
                          if summary['candidate'] == 'combined'
                          for pair in summary['pairs']}
    samples, excluded = [], []
    for number_of_round, arms in sorted(grouped.items()):
        a, b = arms.get('reference'), arms.get('combined')
        if (a is None or b is None or a.get(eligible) is not True or b.get(eligible) is not True
                or startup_rounds is not None and number_of_round not in startup_rounds):
            excluded.append(number_of_round)
            continue
        av, bv = extract(a), extract(b)
        if not number(av) or not number(bv, zero=direction == 'lower'):
            excluded.append(number_of_round)
            continue
        ratio = bv / av
        improvement = 100 * ((1 - ratio) if direction == 'lower' else (ratio - 1))
        if not math.isfinite(improvement):
            excluded.append(number_of_round)
            continue
        samples.append({'round': number_of_round, 'reference': av, 'combined': bv,
                        'improvement_percent': improvement})
    enough = len(samples) >= 5
    return {'unit': unit, 'better': direction, 'clean_pairs': len(samples), 'minimum_pairs': 5,
            'measured': enough, 'excluded_or_unavailable_rounds': excluded,
            'median_reference': statistics.median(s['reference'] for s in samples) if enough else None,
            'median_combined': statistics.median(s['combined'] for s in samples) if enough else None,
            'median_improvement_percent': statistics.median(s['improvement_percent'] for s in samples) if enough else None,
            'samples': samples}


def report(directory):
    directory, packet, contract = campaign.load_packet(directory)
    state = campaign.status(directory)
    workloads = {}
    for row in state['stages']:
        if not row['stage'].startswith('paired/') or row['status'] != 'passed':
            continue
        name = row['stage'].split('/')[1]
        path = directory / row['stage'] / 'evidence/results.jsonl'
        rows = [json.loads(line) for line in path.read_text().splitlines()]
        protocol = contract['paired_protocols'][name]
        workloads[name] = {'results_sha256': digest(path), 'output_tokens': protocol['max_tokens'],
            'memory_target_gb': protocol['memory_gb'], 'mtp': protocol['mtp'],
            'metrics': {name: summarize_metric(rows, name) for name in METRICS}}
    return {'classification': 'Descriptive paired measurements within individually qualified workloads',
        'build_identity': contract['build_identity'], 'contract_sha256': packet['contract_sha256'],
        'reporter_sha256': digest(Path(__file__)), 'qualification_complete': state['qualification_complete'],
        'activation_performed': False, 'workloads': workloads,
        'percentage_method': 'Median of per-pair percentage improvements; positive means faster or less memory. No cross-workload aggregation.',
        'active_emission_method': '(output tokens - 1) / sum(interTokenSeconds), between the first and last sampled emissions. No rate for one-token requests.',
        'decode_phase_method': 'output tokens / decodeSeconds for at least two emitted tokens, including any terminal work and retention bookkeeping. One-token requests have no reported throughput.',
        'limits': 'Active emission rates cover these short fixed workloads; they do not establish longer-run equilibrium throughput. Tensor allocation and sampled process footprint are distinct.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--packet', type=Path, required=True)
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    result = report(args.packet)
    if args.out:
        campaign.write_new(args.out, result)
    print(json.dumps(result, indent=2, allow_nan=False))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
