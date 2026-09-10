#!/usr/bin/env python3
"""Check sampled process memory from structured generation observations."""
import argparse
from decimal import Decimal, InvalidOperation
import json


def check_memory(payload, limit_gb):
    limit = Decimal(str(limit_gb)) * 1_000_000_000
    if not limit.is_finite() or limit <= 0: raise ValueError('memory limit must be finite and positive')
    stats = payload['stats']
    sample = stats['sampledFootprint']
    def integer(value, name, positive=False):
        if type(value) is not int or value < (1 if positive else 0):
            raise ValueError(name + ' must be a valid integer observation')
        return value
    sampled = integer(sample['peakBytes'], 'sampled peak', True)
    integer(sample['samples'], 'sample count', True)
    integer(sample['intervalMilliseconds'], 'sample interval', True)
    rss = integer(stats['lifetimeRSSPeakBytes'], 'lifetime RSS', True)
    end = integer(stats['physicalFootprintEndBytes'], 'end footprint', True)
    for name in ['swapins', 'swapouts']:
        before = integer(stats['generatorVMBefore'][name], 'VM before ' + name)
        after = integer(stats['generatorVMAfter'][name], 'VM after ' + name)
        if before != after: raise ValueError('swap activity during generator interval')
    preparation_peak = 0
    preparation = stats.get('imagePreparation')
    image_work = sum(integer(stats.get(name, 0), name) for name in
                     ['encodedImages', 'reusedImageFeatures', 'prefixSkippedImages'])
    if image_work and preparation is None:
        raise ValueError('image request is missing its preparation memory interval')
    if preparation is not None:
        prep_sample = preparation['sampledFootprint']
        preparation_peak = integer(prep_sample['peakBytes'], 'image preparation peak', True)
        integer(prep_sample['samples'], 'image preparation samples', True)
        integer(prep_sample['intervalMilliseconds'], 'image preparation interval', True)
        for name in ['swapins', 'swapouts']:
            before = integer(preparation['vmBefore'][name], 'image VM before ' + name)
            after = integer(preparation['vmAfter'][name], 'image VM after ' + name)
            if before != after: raise ValueError('swap activity during image preparation')
    peak = max(sampled, rss, end, preparation_peak)
    if peak > limit: raise ValueError(f'observed {peak} bytes exceeds {limit} byte target')
    return {'passed': True, 'maximum_observed_bytes': peak,
            'sampled_footprint_bytes': sampled, 'image_preparation_peak_bytes': preparation_peak, 'lifetime_rss_bytes': rss,
            'physical_footprint_end_bytes': end, 'sampling_interval_ms': sample['intervalMilliseconds']}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('input'); p.add_argument('--limit-gb', required=True)
    args = p.parse_args()
    try:
        with open(args.input) as f: payload = json.load(f)
        result = check_memory(payload, args.limit_gb)
    except (ValueError, TypeError, KeyError, OSError, InvalidOperation) as e:
        print(json.dumps({'passed': False, 'error': str(e)})); return 1
    print(json.dumps(result)); return 0


if __name__ == '__main__': raise SystemExit(main())
