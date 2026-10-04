"""Prospective paired binary-outcome analysis; never a model promotion gate.

Tango (1998), Statistics in Medicine 17:891-908, score inversion with a
constrained discordance MLE. Primary method and independent R documentation:
https://www.site.uottawa.ca/~nat/Courses/csi5388/Tango.paired.pdf
https://search.r-project.org/CRAN/refmans/PropCIs/html/scoreci.mp.html
Coverage is asymptotic, not an exact finite-sample certificate. Pairs are independent task units, not tokens or repeated outputs.
"""
import math
from statistics import NormalDist


def _counts(harm, gain, total):
    if any(type(x) is not int for x in (harm, gain, total)):
        raise ValueError('paired counts must be integers')
    if not 1 <= total <= 1_000_000 or min(harm, gain) < 0 or harm + gain > total:
        raise ValueError('invalid bounded paired counts')


def _alpha(alpha):
    if type(alpha) not in (int, float) or not math.isfinite(alpha) or not 1e-9 <= alpha < .5:
        raise ValueError('one-sided alpha must be finite in [1e-9, 0.5)')


def discordance_mle(harm, gain, total, loss):
    """MLE of Pr(harm)+Pr(gain), constrained to Pr(harm)-Pr(gain)=loss."""
    _counts(harm, gain, total)
    if type(loss) not in (int, float) or not math.isfinite(loss) or not -1 <= loss <= 1:
        raise ValueError('loss must be finite in [-1, 1]')
    discordant, difference = harm + gain, harm - gain
    q = discordant + difference * loss
    radicand = q*q + 4*total*((total-discordant)*loss*loss - difference*loss)
    # Cancellation can produce a tiny negative discriminant at a boundary.
    if radicand < -1e-12 * total*total:
        raise ArithmeticError('invalid constrained-likelihood discriminant')
    fitted = (q + math.sqrt(max(0., radicand))) / (2*total)
    return min(1., max(abs(loss), fitted))


def upper_loss(harm, gain, total, alpha):
    """One-sided upper bound on baseline success minus candidate success."""
    _counts(harm, gain, total); _alpha(alpha)
    observed = (harm-gain)/total
    if harm == total:
        return 1.
    critical = NormalDist().inv_cdf(1-alpha)
    lo, hi = observed, 1.
    for _ in range(80):
        mid = (lo+hi)/2
        if mid in (lo, hi):
            break
        variance = discordance_mle(harm, gain, total, mid) - mid*mid
        score = (mid-observed)*math.sqrt(total/variance) if variance > 0 else math.inf
        if score < critical:
            lo = mid
        else:
            hi = mid
    return hi


def interval(harm, gain, total, alpha):
    """Each endpoint has tail alpha; the two-sided confidence is 1-2*alpha."""
    return (-upper_loss(gain, harm, total, alpha), upper_loss(harm, gain, total, alpha))


def stratified_summary(rows, *, family_weights, family_margins, overall_margin, alpha):
    """Fixed-stratum design using simultaneous Bonferroni one-sided bounds.

    The weighted overall upper bound sums the simultaneous family bounds; no
    extra overall test or IID pooled-trial assumption is made. Conservative
    weighting costs power. Each stratum still needs independently selected
    task units and a prospective sample size. This function cannot verify
    corpus independence, provenance, grading, missing pairs or safety gates.
    It deliberately emits no qualification or promotion decision.
    """
    _alpha(alpha)
    if not isinstance(rows, list) or not rows or len(rows) > 1_000_000:
        raise ValueError('bounded nonempty paired task rows required')
    if not isinstance(family_weights, dict) or not 1 <= len(family_weights) <= 32:
        raise ValueError('bounded family weight mapping required')
    if set(family_weights) != set(family_margins):
        raise ValueError('family margins and weights must cover identical families')
    for family, weight in family_weights.items():
        if not isinstance(family, str) or not family or type(weight) not in (int, float) or not math.isfinite(weight) or not 0 < weight <= 1:
            raise ValueError('invalid family weight')
    if not math.isclose(math.fsum(family_weights.values()), 1., rel_tol=0, abs_tol=1e-12):
        raise ValueError('family weights must sum to one')
    for value in [overall_margin, *family_margins.values()]:
        if type(value) not in (int, float) or not math.isfinite(value) or not 0 < value < 1:
            raise ValueError('loss margins must be finite and inside (0, 1)')
    families = {family: {'total': 0, 'harm': 0, 'gain': 0, 'baseline_pass': 0, 'candidate_pass': 0} for family in family_weights}
    seen = set()
    for row in rows:
        if not isinstance(row, dict) or set(row) != {'id', 'family', 'baseline_pass', 'candidate_pass'}:
            raise ValueError('exact paired outcome fields required')
        name = row['id']
        if not isinstance(name, str) or not name or name in seen:
            raise ValueError('task IDs must be nonempty and unique')
        seen.add(name)
        if not isinstance(row['family'], str) or row['family'] not in families or type(row['baseline_pass']) is not bool or type(row['candidate_pass']) is not bool:
            raise ValueError('unknown family or nonbinary outcome')
        a, b = row['baseline_pass'], row['candidate_pass']; cell = families[row['family']]
        cell['total'] += 1; cell['harm'] += a and not b; cell['gain'] += b and not a
        cell['baseline_pass'] += a; cell['candidate_pass'] += b
    tail = alpha/len(families); _alpha(tail)
    for family, cell in families.items():
        if not cell['total']:
            raise ValueError('every prospective family requires paired evidence')
        cell['observed_loss'] = (cell['harm']-cell['gain'])/cell['total']
        cell['upper_loss'] = upper_loss(cell['harm'], cell['gain'], cell['total'], tail)
        cell['margin'] = family_margins[family]
        cell['inside_margin'] = cell['upper_loss'] < cell['margin']
    upper = math.fsum(family_weights[f]*cell['upper_loss'] for f, cell in families.items())
    return {'method': 'tango-score-bonferroni-strata-v1', 'qualification': False,
            'coverage': 'asymptotic simultaneous one-sided; not exact finite-sample coverage',
            'alpha': alpha, 'per_family_alpha': tail, 'family_weights': dict(family_weights),
            'families': families, 'overall': {'observed_loss': math.fsum(family_weights[f]*cell['observed_loss'] for f, cell in families.items()),
                'upper_loss': upper, 'margin': overall_margin, 'inside_margin': upper < overall_margin},
            'all_statistical_margins_met': upper < overall_margin and all(cell['inside_margin'] for cell in families.values())}


def stratified_mover_summary(rows, *, family_weights, family_margins, overall_margin, alpha):
    """Prospective fixed-weight paired strata, with a separate overall bound.

    Each independent task stratum supplies a Tango paired difference estimate
    and interval. Recover its upper variance from that interval, then add the
    squared fixed weights times those variances (MOVER additive variance).
    Pairing is handled *within* each stratum; baseline and candidate arms are
    never treated as independent. Unlike a common-effect estimator, fixed
    weights permit different true losses across task families.

    Tang, MOVER confidence intervals under stratified sampling, section 2.2:
    https://arxiv.org/html/2110.12636v1
    This is an application of its fixed-weight variance combination to the
    paired stratum estimators, not a claim that its independent-arm binary
    simulations validate this exact paired benchmark design.

    Bonferroni allocates alpha across every family AND the overall comparison.
    Coverage remains asymptotic. The existing conservative sum-of-bounds
    method remains unchanged for historical protocols. Select this method,
    all weights, sample sizes and margins before observing final outcomes.
    """
    _alpha(alpha)
    if not isinstance(family_weights, dict) or not 1 <= len(family_weights) <= 32:
        raise ValueError('bounded family weight mapping required')
    families = len(family_weights)
    # Reuse the exact outcome, identity and contract validation. This allocates
    # the desired alpha/(families+1) tail to each returned family interval.
    result = stratified_summary(rows, family_weights=family_weights,
        family_margins=family_margins, overall_margin=overall_margin,
        alpha=alpha*families/(families+1))
    observed = result['overall']['observed_loss']
    squared = math.fsum((family_weights[name]*(cell['upper_loss']-cell['observed_loss']))**2
                       for name, cell in result['families'].items())
    upper = observed+math.sqrt(squared)
    result.update(method='paired-tango-mover-av-bonferroni-v1', alpha=alpha,
        comparisons=families+1, per_comparison_alpha=alpha/(families+1),
        coverage='asymptotic paired stratum scores and fixed-weight MOVER; not exact finite-sample coverage')
    result['overall'].update(upper_loss=upper, inside_margin=upper < overall_margin,
        combination='observed weighted loss plus root sum of squared weighted upper score widths')
    result['all_statistical_margins_met'] = (upper < overall_margin
        and all(cell['inside_margin'] for cell in result['families'].values()))
    return result
