#!/usr/bin/env python3
"""Check process-memory bounds; report host-wide paging separately."""
import argparse
from decimal import Decimal, InvalidOperation
import json


def swap_deltas(before, after):
    """Optional host telemetry, never a process-memory or correctness verdict."""
    if before is None or after is None:
        return None
    result = {}
    for name in ('swapins', 'swapouts'):
        start, end = before[name], after[name]
        if type(start) is not int or start < 0 or type(end) is not int or end < start:
            raise ValueError('invalid or non-monotonic global VM observation')
        result[name] = end - start
    return result


def check_memory(payload, limit_gb):
    limit = Decimal(str(limit_gb)) * 1_000_000_000
    if not limit.is_finite() or limit <= 0: raise ValueError('memory limit must be finite and positive')
    stats = payload['stats']
    if stats.get('runtimeError') or stats.get('requestFailure') or stats.get('memoryPressureCancelled'):
        raise ValueError('request failed or was cancelled under memory pressure')
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
    # Older observations predate the native lifetime footprint counter. When
    # supplied, it catches peaks between timer samples and before generation.
    # It includes earlier requests, so this is a process-wide acceptance bound.
    lifetime_footprint = stats.get('lifetimePhysicalFootprintPeakBytes')
    if lifetime_footprint is not None:
        lifetime_footprint = integer(lifetime_footprint, 'lifetime footprint peak', True)
    global_swap = {'generator': swap_deltas(stats.get('generatorVMBefore'), stats.get('generatorVMAfter'))}
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
        global_swap['image_preparation'] = swap_deltas(preparation.get('vmBefore'), preparation.get('vmAfter'))
    peak = max(sampled, rss, end, preparation_peak, lifetime_footprint or 0)
    if peak > limit: raise ValueError(f'observed {peak} bytes exceeds {limit} byte target')
    return {'passed': True, 'maximum_observed_bytes': peak,
            'sampled_footprint_bytes': sampled, 'image_preparation_peak_bytes': preparation_peak, 'lifetime_rss_bytes': rss,
            'physical_footprint_end_bytes': end, 'lifetime_footprint_peak_bytes': lifetime_footprint,
            'sampling_interval_ms': sample['intervalMilliseconds'], 'global_swap_deltas': global_swap}


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
