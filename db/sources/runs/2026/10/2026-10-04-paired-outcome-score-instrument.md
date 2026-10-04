---
type: run
created: 2026-10-04T09:44:41.003532+00:00
updated: 2026-10-04T09:44:41.003532+00:00
summary: Paired binary outcome score instrument
binary: Python source hashes recorded below; no model executable used
captured_at: 2026-10-04
command: python3 Tools/quantization_paired_test.py and independent likelihood witness generation.
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Paired binary outcome score instrument
tool: paired score instrument and independent numerical witnesses
---

This is an analysis-instrument check, with zero model runs, no sampled held-out corpus, no adopted model-qualification margins and no model promotion. Tools/quantization_paired.py implements the paired binary score interval from Tango (1998), Statistics in Medicine 17:891-908, with the discordance nuisance parameter fit under each proposed loss. Primary method: https://www.site.uottawa.ca/~nat/Courses/csi5388/Tango.paired.pdf . Independent implementation documentation: https://search.r-project.org/CRAN/refmans/PropCIs/html/scoreci.mp.html . The Python implementation was derived from the method; no R source was copied.

For a predeclared fixed-stratum design, the helper uses simultaneous family bounds with Bonferroni tail allocation and sums them using fixed family weights. It does not pool heterogeneous strata as independent identically distributed binomial trials. Coverage is asymptotic and is not an exact finite-sample guarantee. Task independence, corpus provenance and coverage, sample size, honest grading, safety and prospective multiplicity control remain independent obligations. The helper always emits qualification false, even when a proposed set of statistical margins is met.

All nine unit-test groups pass. They cover nine published Table I witnesses, the zero-discordance closed form, the McNemar null, extreme/count/monotonic boundaries, fifty-six independently optimized concave-likelihood witnesses, invalid probabilities and counts, fixed-stratum weighting, harm/gain accounting and incomplete/duplicate task protocols. The exact tests, local primary-method derivation and independent likelihood witnesses are retained below. Their synthetic successes are not model-quality evidence. No final held-out task has been run.

Local home prefixes are replaced with <HOME>. Original lengths and SHA-256 identify the unmodified files. Large or whitespace-bearing normalized UTF-8 transcripts are losslessly zlib-compressed and base64 encoded. Decode with `zlib.decompress(base64.b64decode(block))` and check the normalized digest. Every encoded block is verified before writing. Frozen binaries, source archives and weights remain in bounded local staging; the receipts bind their exact bytes.

### .build/quantization-research/capture-paired-score-v1.py

Original bytes: 4123. SHA-256: `2d516c03b033d807259c33d706881b9bef4e443268ef24b61eb6b11c398a8b91`.

Normalized bytes: 4123. SHA-256: `2d516c03b033d807259c33d706881b9bef4e443268ef24b61eb6b11c398a8b91`.

````zlib-base64
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
````

### .build/quantization-research/paired-score-tests-v1.log

Original bytes: 107. SHA-256: `71fd6d87ed46bd4b806f485c9310eb0381665caed28fc608fc46908705d560c3`.

Normalized bytes: 107. SHA-256: `71fd6d87ed46bd4b806f485c9310eb0381665caed28fc608fc46908705d560c3`.

````text
.........
----------------------------------------------------------------------
Ran 9 tests in 0.121s

OK
````

### .build/quantization-research/paired-score-independent-likelihood-v1.json

Original bytes: 9239. SHA-256: `dea7a749025026cf73a6e8da8d5711dea8de90671ba1c65c3bfa2d55cb9e371e`.

Normalized bytes: 9239. SHA-256: `dea7a749025026cf73a6e8da8d5711dea8de90671ba1c65c3bfa2d55cb9e371e`.

````text
{
  "complete": true,
  "method": "independent bounded ternary likelihood maximum, endpoints included",
  "checks": [
    {
      "n": 1,
      "harm": 0,
      "gain": 0,
      "loss": -0.93,
      "fitted_discordance": 0.93,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 0,
      "loss": -0.3,
      "fitted_discordance": 0.3,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 0,
      "loss": -0.01,
      "fitted_discordance": 0.01,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 0,
      "loss": 0.0,
      "fitted_discordance": 0.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 0,
      "loss": 0.03,
      "fitted_discordance": 0.03,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 0,
      "loss": 0.7,
      "fitted_discordance": 0.7,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 0,
      "loss": 0.99,
      "fitted_discordance": 0.99,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 1,
      "gain": 0,
      "loss": -0.93,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 1,
      "gain": 0,
      "loss": -0.3,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 1,
      "gain": 0,
      "loss": -0.01,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 1,
      "gain": 0,
      "loss": 0.0,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 1,
      "gain": 0,
      "loss": 0.03,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 1,
      "gain": 0,
      "loss": 0.7,
      "fitted_discordance": 0.9999999999999999,
      "log_likelihood_error": -1.3877787807814457e-16
    },
    {
      "n": 1,
      "harm": 1,
      "gain": 0,
      "loss": 0.99,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 1,
      "loss": -0.93,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 1,
      "loss": -0.3,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 1,
      "loss": -0.01,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 1,
      "loss": 0.0,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 1,
      "loss": 0.03,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 1,
      "loss": 0.7,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1,
      "harm": 0,
      "gain": 1,
      "loss": 0.99,
      "fitted_discordance": 1.0,
      "log_likelihood_error": 0.0
    },
    {
      "n": 9,
      "harm": 2,
      "gain": 3,
      "loss": -0.93,
      "fitted_discordance": 0.9536241530556546,
      "log_likelihood_error": 0.0
    },
    {
      "n": 9,
      "harm": 2,
      "gain": 3,
      "loss": -0.3,
      "fitted_discordance": 0.6000000000000001,
      "log_likelihood_error": 0.0
    },
    {
      "n": 9,
      "harm": 2,
      "gain": 3,
      "loss": -0.01,
      "fitted_discordance": 0.5547438573330135,
      "log_likelihood_error": 0.0
    },
    {
      "n": 9,
      "harm": 2,
      "gain": 3,
      "loss": 0.0,
      "fitted_discordance": 0.5555555555555556,
      "log_likelihood_error": 0.0
    },
    {
      "n": 9,
      "harm": 2,
      "gain": 3,
      "loss": 0.03,
      "fitted_discordance": 0.5589019861625273,
      "log_likelihood_error": 0.0
    },
    {
      "n": 9,
      "harm": 2,
      "gain": 3,
      "loss": 0.7,
      "fitted_discordance": 0.8327099535119985,
      "log_likelihood_error": 1.7763568394002505e-15
    },
    {
      "n": 9,
      "harm": 2,
      "gain": 3,
      "loss": 0.99,
      "fitted_discordance": 0.9942892412516557,
      "log_likelihood_error": -7.105427357601002e-15
    },
    {
      "n": 10,
      "harm": 0,
      "gain": 6,
      "loss": -0.93,
      "fitted_discordance": 0.93,
      "log_likelihood_error": 0.0
    },
    {
      "n": 10,
      "harm": 0,
      "gain": 6,
      "loss": -0.3,
      "fitted_discordance": 0.48,
      "log_likelihood_error": 1.7763568394002505e-15
    },
    {
      "n": 10,
      "harm": 0,
      "gain": 6,
      "loss": -0.01,
      "fitted_discordance": 0.5959999999999999,
      "log_likelihood_error": 0.0
    },
    {
      "n": 10,
      "harm": 0,
      "gain": 6,
      "loss": 0.0,
      "fitted_discordance": 0.6,
      "log_likelihood_error": -1.7763568394002505e-15
    },
    {
      "n": 10,
      "harm": 0,
      "gain": 6,
      "loss": 0.03,
      "fitted_discordance": 0.6120000000000001,
      "log_likelihood_error": 1.7763568394002505e-15
    },
    {
      "n": 10,
      "harm": 0,
      "gain": 6,
      "loss": 0.7,
      "fitted_discordance": 0.8800000000000001,
      "log_likelihood_error": 7.105427357601002e-15
    },
    {
      "n": 10,
      "harm": 0,
      "gain": 6,
      "loss": 0.99,
      "fitted_discordance": 0.9960000000000001,
      "log_likelihood_error": 7.105427357601002e-15
    },
    {
      "n": 37,
      "harm": 14,
      "gain": 9,
      "loss": -0.93,
      "fitted_discordance": 0.9652077535435961,
      "log_likelihood_error": -1.4210854715202004e-14
    },
    {
      "n": 37,
      "harm": 14,
      "gain": 9,
      "loss": -0.3,
      "fitted_discordance": 0.6892991144824485,
      "log_likelihood_error": 0.0
    },
    {
      "n": 37,
      "harm": 14,
      "gain": 9,
      "loss": -0.01,
      "fitted_discordance": 0.622501892704627,
      "log_likelihood_error": -7.105427357601002e-15
    },
    {
      "n": 37,
      "harm": 14,
      "gain": 9,
      "loss": 0.0,
      "fitted_discordance": 0.6216216216216216,
      "log_likelihood_error": 0.0
    },
    {
      "n": 37,
      "harm": 14,
      "gain": 9,
      "loss": 0.03,
      "fitted_discordance": 0.619683074511865,
      "log_likelihood_error": 7.105427357601002e-15
    },
    {
      "n": 37,
      "harm": 14,
      "gain": 9,
      "loss": 0.7,
      "fitted_discordance": 0.8261382651531207,
      "log_likelihood_error": 7.105427357601002e-15
    },
    {
      "n": 37,
      "harm": 14,
      "gain": 9,
      "loss": 0.99,
      "fitted_discordance": 0.9939203562097984,
      "log_likelihood_error": 0.0
    },
    {
      "n": 200,
      "harm": 1,
      "gain": 0,
      "loss": -0.93,
      "fitted_discordance": 0.9303500000000001,
      "log_likelihood_error": 0.0
    },
    {
      "n": 200,
      "harm": 1,
      "gain": 0,
      "loss": -0.3,
      "fitted_discordance": 0.3035,
      "log_likelihood_error": 0.0
    },
    {
      "n": 200,
      "harm": 1,
      "gain": 0,
      "loss": -0.01,
      "fitted_discordance": 0.014950000000000001,
      "log_likelihood_error": -1.4210854715202004e-14
    },
    {
      "n": 200,
      "harm": 1,
      "gain": 0,
      "loss": 0.0,
      "fitted_discordance": 0.005,
      "log_likelihood_error": -1.0658141036401503e-14
    },
    {
      "n": 200,
      "harm": 1,
      "gain": 0,
      "loss": 0.03,
      "fitted_discordance": 0.03,
      "log_likelihood_error": 0.0
    },
    {
      "n": 200,
      "harm": 1,
      "gain": 0,
      "loss": 0.7,
      "fitted_discordance": 0.7,
      "log_likelihood_error": 0.0
    },
    {
      "n": 200,
      "harm": 1,
      "gain": 0,
      "loss": 0.99,
      "fitted_discordance": 0.99,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1000,
      "harm": 200,
      "gain": 200,
      "loss": -0.93,
      "fitted_discordance": 0.9476228995957788,
      "log_likelihood_error": 4.547473508864641e-13
    },
    {
      "n": 1000,
      "harm": 200,
      "gain": 200,
      "loss": -0.3,
      "fitted_discordance": 0.5065941943351179,
      "log_likelihood_error": -2.2737367544323206e-13
    },
    {
      "n": 1000,
      "harm": 200,
      "gain": 200,
      "loss": -0.01,
      "fitted_discordance": 0.40014994379214797,
      "log_likelihood_error": 2.2737367544323206e-13
    },
    {
      "n": 1000,
      "harm": 200,
      "gain": 200,
      "loss": 0.0,
      "fitted_discordance": 0.4,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1000,
      "harm": 200,
      "gain": 200,
      "loss": 0.03,
      "fitted_discordance": 0.40134547424762246,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1000,
      "harm": 200,
      "gain": 200,
      "loss": 0.7,
      "fitted_discordance": 0.7779273310719956,
      "log_likelihood_error": 0.0
    },
    {
      "n": 1000,
      "harm": 200,
      "gain": 200,
      "loss": 0.99,
      "fitted_discordance": 0.9925023659270678,
      "log_likelihood_error": 0.0
    }
  ]
}
````

### .build/quantization-research/paired_noninferiority_draft.py

Original bytes: 6356. SHA-256: `693c527ba7e3ad9aaab4aa111e6b1d09188d6b47c4dfbfce421090699b5b6ac0`.

Normalized bytes: 6356. SHA-256: `693c527ba7e3ad9aaab4aa111e6b1d09188d6b47c4dfbfce421090699b5b6ac0`.

````text
"""Prospective paired binary-outcome analysis; never a model promotion gate.

Tango (1998), Statistics in Medicine 17:891-908, score inversion with a
constrained discordance MLE. Coverage is asymptotic, not an exact finite-sample
certificate. Pairs are independent task units, not tokens or repeated outputs.
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
        if row['family'] not in families or type(row['baseline_pass']) is not bool or type(row['candidate_pass']) is not bool:
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
````

### .build/quantization-research/paired_noninferiority_test_draft.py

Original bytes: 5450. SHA-256: `702c904f81becbe11972cf4b5682878174d4b6fff922e50f8fa3d5cbff22bbe8`.

Normalized bytes: 5450. SHA-256: `702c904f81becbe11972cf4b5682878174d4b6fff922e50f8fa3d5cbff22bbe8`.

````zlib-base64
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
````

### Tools/quantization_paired.py

Original bytes: 6579. SHA-256: `87b7cf4e1145c6edaaab379dfc9193eb54131806fea1def5eb84147d455cba9e`.

Normalized bytes: 6579. SHA-256: `87b7cf4e1145c6edaaab379dfc9193eb54131806fea1def5eb84147d455cba9e`.

````text
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
````

### Tools/quantization_paired_test.py

Original bytes: 5255. SHA-256: `dbd281de815364fc2198974bdc6ff91662dcd84cb145ef980fbbcafc9f2d6b4e`.

Normalized bytes: 5255. SHA-256: `dbd281de815364fc2198974bdc6ff91662dcd84cb145ef980fbbcafc9f2d6b4e`.

````zlib-base64
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
/gTECQj0n55tI6s=
````
