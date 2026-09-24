#!/usr/bin/env python3
"""Compare current estimates with family-held-out corrections, without tuning runtime.

The candidate is deliberately limited: one multiplicative correction per
measured profile. It is an error diagnostic, not permission to extrapolate
across hardware, MTP settings, context lengths, or memory targets.
"""
import argparse, collections, json, math, statistics
from pathlib import Path
from report import load_rows

def geometric(values): return math.exp(statistics.mean(math.log(x) for x in values))

def evaluate(rows):
    cells=collections.defaultdict(list)
    for r in rows:
        if r['environment_eligible'] and r.get('idle_calibration_eligible',False) and r['stage']=='measured' and r['output_tokens']>=32:
            cells[(r['profile'],r['fixture'])].append(r)
    eligible=[]
    for (profile,fixture),values in sorted(cells.items()):
        signatures={(r['slots'],r['mtp'],r['chunk'],r['context'],r['target_gb']) for r in values}
        if len(values)<3 or len(signatures)!=1 or len({r['output_sha256'] for r in values})!=1:continue
        eligible.append({'profile':profile,'fixture':fixture,'kind':values[0]['kind'],
                         'measured':statistics.median(r['decode_tps'] for r in values),
                         'predicted':statistics.median(r['estimator_decode_tps'] for r in values)})
    output=[]
    for profile in sorted({r['profile'] for r in eligible}):
        group=[r for r in eligible if r['profile']==profile]
        for family in sorted({r['kind'] for r in group}):
            train=[r for r in group if r['kind']!=family];test=[r for r in group if r['kind']==family]
            if not train:continue
            # Give each training prompt family equal weight before fitting.
            factors=collections.defaultdict(list)
            for r in train:factors[r['kind']].append(r['measured']/r['predicted'])
            correction=geometric([geometric(v) for v in factors.values()])
            for r in test:
                output.append({**r,'training_families':sorted(factors),'held_out_kind':family,
                    'training_correction':correction,
                    'original_error_pct':100*(r['predicted']/r['measured']-1),
                    'held_out_error_pct':100*(correction*r['predicted']/r['measured']-1)})
    return {'scope':'Descriptive family-held-out correction diagnostic; no proposed planner replacement.',
            'qualified_fixture_cells':eligible,'held_out_checks':output}

def evaluate_prefill(rows):
    """Full-prefill misses only; never let cached tokens train an ETA correction."""
    cells=collections.defaultdict(list)
    for r in rows:
        if (r['environment_eligible'] and r.get('idle_calibration_eligible',False)
            and r['stage']=='prefill_miss' and r['reused_tokens']==0
            and r['prefill_tokens']>0 and r['prefill_seconds']>0):
            cells[(r['profile'],r['fixture'])].append(r)
    eligible=[]
    for (profile,fixture),values in sorted(cells.items()):
        signatures={(r['slots'],r['mtp'],r['chunk'],r['context'],r['target_gb']) for r in values}
        if len(values)<3 or len(signatures)!=1 or len({r['output_sha256'] for r in values})!=1:continue
        eligible.append({'profile':profile,'fixture':fixture,'kind':values[0]['kind'],
            'signature':list(next(iter(signatures))),
            'measured':statistics.median(r['prefill_tokens']/r['prefill_seconds'] for r in values),
            'predicted':statistics.median(r['estimator_prefill_tps'] for r in values)})
    output=[]
    for item in eligible:
        train=[r for r in eligible if r['profile']==item['profile'] and r['signature']==item['signature'] and r['kind']!=item['kind']]
        if not train:continue
        families=collections.defaultdict(list)
        for r in train:families[r['kind']].append(r['measured']/r['predicted'])
        correction=geometric([geometric(v) for v in families.values()])
        output.append({**item,'training_families':sorted(families),'held_out_kind':item['kind'],
            'training_correction':correction,
            'original_wait_error_pct':100*(item['measured']/item['predicted']-1),
            'held_out_wait_error_pct':100*(item['measured']/(correction*item['predicted'])-1)})
    return {'scope':'Exploratory family-held-out prefill diagnostic within one realized plan; not a production fit or cross-length validation. Positive error means estimated wait exceeds measured wait.',
            'qualified_fixture_cells':eligible,'held_out_checks':output}

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('root',type=Path);a=p.parse_args()
    rows=load_rows(a.root);result=evaluate(rows);result['prefill']=evaluate_prefill(rows)
    (a.root/'calibration-analysis.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'qualified_fixture_cells':len(result['qualified_fixture_cells']),'held_out_checks':len(result['held_out_checks'])}))
