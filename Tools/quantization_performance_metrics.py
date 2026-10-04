"""Read-only complete-configuration timing and median-bound primitives.

These functions do not select observations, qualify a pack or define a study.
A prospective owner must freeze all scenarios, repetitions, exclusions and
the simultaneous comparison count before collecting its final observations.
"""
from fractions import Fraction
import math
import statistics


def number(value, *, zero=False):
    try:
        return type(value) in (int, float) and math.isfinite(value) and (value >= 0 if zero else value > 0)
    except OverflowError:
        return False


def metrics(row):
    """Keep token production, decoded-text delivery and full latency distinct.

    The conservative gate rate drops the first token (whose logits came from
    prefill) while retaining the entire decode timer, including EOS detection,
    callbacks and final state bookkeeping. This can understate throughput; it
    never gets a free first token or subtracts work after the last emission.
    """
    stats = row['stats']; ids = row['output_tokens']; count = stats['decodeTokens']
    if (type(ids) is not list or not ids or type(count) is not int or count != len(ids)
            or any(type(token) is not int or not 0 <= token < 248320 for token in ids)
            or stats.get('runtimeError') is not None or stats.get('requestFailure') is not None
            or stats.get('memoryPressureCancelled', False) is not False
            or stats.get('finishReason') not in ('stop', 'length')):
        raise ValueError('timing requires complete, counted, committed target output')
    intervals = stats['interTokenSeconds']; decode = stats['decodeSeconds']; wall = row['request_wall_seconds']
    if (type(intervals) is not list or len(intervals) != count - 1
            or any(not number(x, zero=True) for x in intervals)
            or not number(decode) or not number(wall) or decode > wall + 0.000001):
        raise ValueError('token intervals and complete decode/request timers disagree')
    try: active = math.fsum(intervals)
    except OverflowError as error: raise ValueError('token interval sum overflow') from error
    if active > decode + 0.000001 or (count > 1 and not number(active)):
        raise ValueError('emission span must fit inside complete decode time')
    first_token = stats.get('firstTokenSeconds'); first_text = stats.get('firstTextSeconds')
    if (not number(first_token, zero=True) or first_token > wall + 0.000001
            or first_text is not None and (not number(first_text, zero=True) or first_text > wall + 0.000001)):
        raise ValueError('first-token or first-text timing is unavailable or outside its request')
    visible = row['visible_text_retokenized_tokens']
    if type(visible) is not int or visible < 0: raise ValueError('visible text must carry its separate retokenized count')
    emissions = row['text_emissions']; previous = 0.0
    if type(emissions) is not list: raise ValueError('decoded text delivery evidence required')
    for emission in emissions:
        seconds, size = emission['seconds'], emission['utf8_bytes']
        if (not number(seconds, zero=True) or seconds < previous or seconds > wall + 0.000001
                or type(size) is not int or size <= 0):
            raise ValueError('decoded text delivery evidence is inconsistent')
        previous = seconds
    if ((first_text is None) != (len(emissions) == 0)
            or emissions and emissions[0]['seconds'] + 0.000001 < first_text):
        raise ValueError('outer decoded-text callback cannot precede its inner native observation')
    ordered = sorted(intervals)
    return {'committed_output_tokens': count,
            'conservative_generation_tps': (count - 1) / decode if count > 1 else None,
            'active_emission_tps': (count - 1) / active if count > 1 else None,
            'decode_phase_tps': count / decode if count > 1 else None,
            'request_seconds': wall, 'first_token_seconds': first_token,
            'first_token_timer_origin': 'Generator entry; excludes Engine setup and queue.',
            'first_text_seconds': emissions[0]['seconds'] if emissions else None,
            'engine_first_text_seconds': first_text,
            'visible_text_retokenized_tokens': visible, 'visible_text_tokens_per_request_second': visible / wall,
            'inter_token_p95_seconds': ordered[math.ceil(0.95 * len(ordered)) - 1] if ordered else None,
            'inter_token_max_seconds': max(intervals) if intervals else None,
            'inter_token_stalls_over_one_second': sum(x > 1 for x in intervals),
            'token_timing_scope': 'Generator committed tokens; text callbacks may contain multiple tokens.'}


def median_lower_bound(values, *, comparisons=1):
    """One-sided order-statistic bound, with an explicit Bonferroni family.

    NIST describes the Binomial(n, 1/2) rank basis of median confidence limits:
    https://itl.nist.gov/div898/software/dataplot/refman1/auxillar/mediancl.htm
    This uses the un-interpolated, conservative ONE-sided form. For rank r,
    failure probability is P[Binomial(n, 1/2) < r]. Choose the largest r whose
    exact rational tail is <= 1/(20 * comparisons), then report X_(r).
    Repeated runs must be independent, identically distributed samples of the
    declared operating condition; token intervals are not independent trials.
    """
    if (type(values) is not list or not 1 <= len(values) <= 1024 or any(not number(v) for v in values)
            or type(comparisons) is not int or not 1 <= comparisons <= 256):
        raise ValueError('bounded positive run-level measurements and a frozen comparison count required')
    samples = sorted(values); n = len(samples); alpha = Fraction(1, 20 * comparisons)
    cumulative = 0; selected = None; selected_tail = None
    for rank in range(1, n + 1):
        cumulative += math.comb(n, rank - 1)
        tail = Fraction(cumulative, 2 ** n)
        if tail > alpha: break
        selected, selected_tail = rank, tail
    return {'method': 'one-sided-binomial-order-statistic-median-v1', 'samples': n,
            'median': statistics.median(samples), 'lower_bound': samples[selected - 1] if selected is not None else None,
            'one_based_rank': selected, 'family_comparisons': comparisons,
            'family_alpha': '1/20', 'per_comparison_alpha': str(alpha),
            'achieved_failure_probability': str(selected_tail) if selected_tail is not None else None,
            'assumption': 'Independent identically distributed run-level observations of the declared operating condition.',
            'qualification': False}


def speed_gate(scenarios):
    """Every predeclared scenario must pass; never drop missing/short runs.

    The caller must supply the complete frozen scenario family. Artifact,
    execution, timing eligibility, quality and study-custody validation happen
    outside this primitive. This result cannot promote a model on its own.
    """
    if type(scenarios) is not dict or not 1 <= len(scenarios) <= 256:
        raise ValueError('complete predeclared scenario family required')
    result = {name: median_lower_bound(values, comparisons=len(scenarios)) for name, values in scenarios.items()}
    return {'target_tps': 20, 'gate_metric': 'conservative_generation_tps', 'scenarios': result,
            'speed_gate_passed': all(r['lower_bound'] is not None and r['lower_bound'] >= 20 for r in result.values()),
            'qualification': False}
