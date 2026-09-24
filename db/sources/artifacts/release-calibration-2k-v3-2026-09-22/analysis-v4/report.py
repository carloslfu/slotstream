#!/usr/bin/env python3
"""Recompute descriptive summaries from captured native metrics.

No fitted coefficient here changes the production planner. Timings are shown
by effective plan and actual reuse, so cache misses cannot masquerade as hits.
"""
import argparse, collections, csv, hashlib, json, math, statistics
from pathlib import Path
from population_policy import adjudicate, request_history

def median(values):
    return statistics.median(values) if values else None

def cache_class(stats):
    reused, prompt = stats['reusedPrefixTokens'], stats['promptTokens']
    return 'complete' if reused == prompt else ('partial' if reused else 'miss')

def load_rows(root):
    rows = []
    policies=json.loads((root/'population-policies.json').read_text()) if (root/'population-policies.json').exists() else {}
    for path in sorted(root.glob('**/*-result.json')):
        if 'smoke' in path.parts: continue
        data = json.loads(path.read_text())
        if not isinstance(data, dict) or 'metrics' not in data: continue
        data = adjudicate(data, str(path.relative_to(root)), policies)
        doctor = data.get('runtime_plan') or json.loads((path.parent.parent / 'doctor.json').read_text())
        m, s = data['metrics'], data['metrics']['stats']
        row = {k:data[k] for k in ('profile','fixture','kind','stage','round','environment_eligible','strict_global_swap_eligible','done_reason','client_seconds','first_visible_seconds','decode_tps')}
        population=path.relative_to(root).parts[0]
        row.update(population=population,idle_calibration_eligible=policies.get(population,{}).get('idle_calibration_eligible',False))
        row.update(request_history(path,data))
        row.update(path=str(path.relative_to(root)),
            target_gb=doctor['target_gb'], context=doctor['max_context_tokens'],
            slots=m['effective_pool_slots'], mtp=m['effective_mtp'],
            chunk=m['effective_prefill_chunk'], cache=cache_class(s),
            prompt_tokens=s['promptTokens'], reused_tokens=s['reusedPrefixTokens'],
            prefill_tokens=s['prefillTokens'], prefill_seconds=s['prefillSeconds'],
            output_tokens=s['decodeTokens'], decode_seconds=s['decodeSeconds'],
            native_request_seconds=s['requestSeconds'], peak_gb=s['peakMemoryGB'],
            pagein_delta=data['own_after']['pageins']-data['own_before']['pageins'],
            swapin_delta=data['after']['swapins']-data['before']['swapins'],
            swapout_delta=data['after']['swapouts']-data['before']['swapouts'],
            estimator_decode_tps=doctor['est_warm_tok_s'],
            estimator_prefill_tps=doctor['est_prefill_tok_s'],
            output_sha256=hashlib.sha256(json.dumps(m['output_ids'],separators=(',',':')).encode()).hexdigest(),
            exclusions=data['exclusions'],
            read_passes=s['prefillPasses'], compute_passes=s['prefillComputePasses'],
            checkpoint_refusals=s['prefixCheckpointRefusals'])
        # Positive means that the current estimated wait is longer than reality.
        row['prefill_estimate_error_pct'] = (100*(s['prefillTokens']/doctor['est_prefill_tok_s']/s['prefillSeconds']-1)
            if s['prefillTokens'] and s['prefillSeconds']>0 else None)
        row['decode_estimate_error_pct'] = 100*(doctor['est_warm_tok_s']/data['decode_tps']-1)
        rows.append(row)
    return rows

def report(rows):
    groups=collections.defaultdict(list)
    for r in rows:
        if r['environment_eligible']:
            groups[(r['population'],r['profile'],r['fixture'],r['stage'],r['server_history'],r['cache'],r['slots'],r['mtp'],r['chunk'],r['context'])].append(r)
    summary=[]
    for key, values in sorted(groups.items()):
        fields=('population','profile','fixture','stage','server_history','cache','slots','mtp','chunk','context')
        item=dict(zip(fields,key)); item['n']=len(values)
        item['strict_n']=sum(r['strict_global_swap_eligible'] for r in values)
        item['same_output']=len({r['output_sha256'] for r in values})==1
        for field in ('decode_tps','client_seconds','first_visible_seconds','prefill_seconds','peak_gb',
                      'prefill_estimate_error_pct','decode_estimate_error_pct'):
            item['median_'+field]=median([r[field] for r in values if r[field] is not None])
        item['reused_tokens']=sorted({r['reused_tokens'] for r in values})
        item['output_tokens']=sorted({r['output_tokens'] for r in values})
        summary.append(item)
    return {'requests':len(rows),'environment_eligible':sum(r['environment_eligible'] for r in rows),
            'strict_global_eligible':sum(r['strict_global_swap_eligible'] for r in rows),
            'exclusions':dict(collections.Counter(e for r in rows for e in r['exclusions'])),
            'groups':summary}

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('root',type=Path);a=p.parse_args()
    rows=load_rows(a.root)
    (a.root/'descriptive-summary.json').write_text(json.dumps(report(rows),indent=2)+'\n')
    with (a.root/'requests.csv').open('w',newline='') as f:
        if rows:
            writer=csv.DictWriter(f,fieldnames=list(rows[0]),lineterminator='\n');writer.writeheader();writer.writerows(rows)
    print(json.dumps({k:v for k,v in report(rows).items() if k!='groups'},indent=2))
