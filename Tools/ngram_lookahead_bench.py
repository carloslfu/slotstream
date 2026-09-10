#!/usr/bin/env python3
"""Prospective fresh-process prefill qualification for bounded n-gram lookahead."""
import argparse
import copy
import json
import math
import statistics
import subprocess
import sys
from pathlib import Path
import shutil
from prefill_bench import digest, paired_summary
from serve_bench import resource_exclusions


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary',type=Path,required=True)
    p.add_argument('--model',type=Path,required=True)
    p.add_argument('--out',type=Path,required=True)
    a = p.parse_args(); out = a.out.resolve(); out.mkdir(parents=True,exist_ok=False)
    binary = a.binary.resolve(); root = Path(__file__).resolve().parent.parent
    common = {'SLOTSTREAM_OPT_COMPACT_STATE':'1','SLOTSTREAM_OPT_FINAL_FORWARD':'1'}
    command = [sys.executable,str(root/'Tools/prefill_bench.py'),'--arm',f'reference={binary}',
        '--arm',f'lookahead={binary}','--arm-env','reference='+json.dumps(common),
        '--arm-env','lookahead='+json.dumps(common|{'SLOTSTREAM_OPT_NGRAM_LOOKAHEAD':'1'}),
        '--rounds','7','--chunks','256','--prompts','prose','--memory-gb','8.1','--max-tokens','1',
        '--seed','7','--mtp','off','--sample-footprint','--model',str(a.model.resolve()),
        '--out',str(out/'cells'),'--timeout','600','--label','ngram-lookahead-fresh-prefill']
    protocol = {'command':command,'binary_identity':json.loads((binary.parent/'build-identity.json').read_text()),
        'fixture_sha256':digest(root/'Tools/fixtures/optimization/prose.txt'),
        'classification':'Prospective same-binary fresh-process prefill: empty expert/ngram/prefix caches; filesystem uncontrolled; no warmup or cache purge',
        'workload':'440 raw prose tokens, bounded chronological 256-row passes, one greedy output; fixed 8.1 GB / 640-slot plan; MTP off; compact state and final-forward controls common',
        'minimum_pairs':5,'minimum_median_request_reduction':.05,'minimum_positive_fraction':.8,'replacement_rounds':0,
        'maximum_sampled_footprint_bytes':8_100_000_000,'require_nominal_power_state':True,
        'exclusions':'Any whole-cell global swap excludes its entire pair. Require sampled process memory within target, nominal generator power state, exact prompt/output IDs, same expert reads and actual lookahead consumption. Preserve all failures; no replacements.',
        'mechanism_metrics':'Whole-request ngramPrefetchSeconds is exposed synchronous cache/read/join time; ngramLookaheadWaitSeconds is its join subset, not additive. Report paired values with total request latency. Timing may not be described as net benefit unless the frozen request-speed criterion passes.'}
    for name in ['ngram_lookahead_bench.py','prefill_bench.py','serve_bench.py']:
        shutil.copy2(root/'Tools'/name,out/name)
    protocol['driver_hashes']={f.name:digest(f) for f in out.glob('*.py')}
    (out/'protocol.json').write_text(json.dumps(protocol,indent=2)+'\n')
    code = subprocess.run(command,cwd=root).returncode
    rows=[json.loads(line) for line in (out/'cells/results.jsonl').read_text().splitlines()]
    qualified=copy.deepcopy(rows)
    for row in qualified:
        reasons=[]; metrics=row.get('metrics',{}); stats=metrics.get('stats',{})
        reasons += resource_exclusions(stats,protocol)
        if len(metrics.get('prompt_ids',[])) != 440 or len(metrics.get('output_ids',[])) != 1:
            reasons.append('incomplete declared work')
        if metrics.get('effective_pool_slots') != 640: reasons.append('incorrect fixed pool')
        for key in ['ngramPrefetchSeconds','ngramLookaheadWaitSeconds']:
            value=stats.get(key)
            if type(value) not in [int,float] or not math.isfinite(value) or value < 0: reasons.append('missing/invalid '+key)
        if row['arm']=='lookahead' and not (type(stats.get('ngramLookaheadRows')) is int and stats['ngramLookaheadRows']>0):
            reasons.append('lookahead did not consume rows')
        if row['arm']=='reference' and stats.get('ngramLookaheadRows') != 0:
            reasons.append('reference unexpectedly used lookahead')
        if reasons: row['valid']=False
        row['qualification_exclusions']=reasons
    summary=paired_summary(qualified,'reference')
    pairs=summary[0]['pairs'] if summary else []
    mechanisms=[]
    for pair in pairs:
        r=next(x for x in qualified if x['round']==pair['round'] and x['arm']=='reference')
        n=next(x for x in qualified if x['round']==pair['round'] and x['arm']=='lookahead')
        rs,ns=r['metrics']['stats'],n['metrics']['stats']
        pair['expert_reads_equal']=all(rs[k]==ns[k] for k in ['prefillRecords','decodeRecords'])
        mechanisms.append({'round':pair['round'],'reference_request_seconds':rs['requestSeconds'],
            'candidate_request_seconds':ns['requestSeconds'],'reference_exposed_prefetch_seconds':rs['ngramPrefetchSeconds'],
            'candidate_exposed_prefetch_seconds':ns['ngramPrefetchSeconds'],'candidate_join_seconds':ns['ngramLookaheadWaitSeconds'],
            'candidate_rows_consumed':ns['ngramLookaheadRows'],
            'reference_prefetch_fraction_of_request':rs['ngramPrefetchSeconds']/rs['requestSeconds']})
    checks={'minimum_pairs':len(pairs)>=5,
        'median_request_gain':bool(pairs) and statistics.median(x['request_reduction_fraction'] for x in pairs)>=.05,
        'positive_fraction':bool(pairs) and sum(x['request_reduction_fraction']>0 for x in pairs)/len(pairs)>=.8,
        'exact_work':bool(pairs) and all(x['output_ids_equal'] and x['expert_reads_equal'] for x in pairs),
        'all_cells_preserved':len(rows)==14}
    result={'child_exit':code,'summary':summary,'mechanism':mechanisms,'checks':checks,'passed':all(checks.values())}
    (out/'qualified-cells.json').write_text(json.dumps(qualified,indent=2)+'\n')
    (out/'qualification.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2),flush=True)
    return 0 if result['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())
