#!/usr/bin/env python3
"""Independent replay checks for the benchmark's saved wire and result files."""
import argparse, hashlib, json, sys
from pathlib import Path

def check_result(path):
    result=json.loads(path.read_text())
    if 'metrics' not in result: return None
    response=path.with_name(path.name.replace('-result.json','-response.ndjson'))
    frames=[json.loads(line) for line in response.read_text().splitlines() if line.strip()]
    finals=[f for f in frames if f.get('done')]
    assert len(finals)==1 and frames[-1] is finals[0], (path,'terminal frame')
    assert not any(f.get('error') for f in frames), (path,'response error')
    text=''.join(f.get('response',f.get('message',{}).get('content','')) for f in frames)
    assert text==result['text'], (path,'wire text mismatch')
    native={'schema_version':1,**finals[0]['slotstream_benchmark']}
    assert native==result['metrics'], (path,'native metrics mismatch')
    stats=native['stats']
    assert len(native['prompt_ids'])==stats['promptTokens'], (path,'input count')
    assert len(native['output_ids'])==stats['decodeTokens'], (path,'output count')
    assert result['decode_tps']==stats['decodeTokens']/stats['decodeSeconds'], (path,'throughput')
    assert result['client_seconds']>=stats['requestSeconds'], (path,'client/native timing order')
    assert stats['prefillTokens']+stats['reusedPrefixTokens']==stats['promptTokens'], (path,'prefill accounting')
    assert result['environment_eligible']==(not result['exclusions']), (path,'eligibility flag')
    # These are narrow output checks, never filters for the timing population.
    quality=None
    if result['stage']=='measured' and result['done_reason']=='stop':
        rid=result['fixture']
        if rid=='r0092': quality={'check':'budget final values','pass':'Answer: 304.6, 1218.4' in text}
        if rid=='r0132': quality={'check':'geometry final values','pass':'Answer: 54, 30, 26' in text}
        if rid=='r0265':
            try:
                d=json.loads(text)
                expected=[('rice',400,'g'),('chicken thighs',600,'g'),('onion',1,'piece'),('saffron',.5,'g'),('olive oil',3,'tbsp')]
                ok=isinstance(d,dict) and all(k in d for k in ('name','servings','ingredients','steps')) and isinstance(d['steps'],list) and all(isinstance(s,str) for s in d['steps']) and [(x['item'],x['amount'],x['unit']) for x in d['ingredients']]==expected
            except (ValueError,KeyError,TypeError):ok=False
            quality={'check':'JSON shape and source ingredients','pass':ok}
    return {'path':str(path),'capture_pass':True,'quality':quality}

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('root',type=Path);a=p.parse_args();results=[];errors=[]
    for f in sorted(a.root.glob('**/*-result.json')):
        if 'smoke' in f.parts:continue
        try:
            row=check_result(f)
            if row:results.append(row)
        except Exception as e:errors.append({'path':str(f),'error':str(e)})
    output={'checked':len(results),'errors':errors,'quality_checks':[r for r in results if r['quality']]}
    (a.root/'capture-check.json').write_text(json.dumps(output,indent=2)+'\n')
    print(json.dumps({'checked':len(results),'errors':errors,'narrow_quality_checks':len(output['quality_checks']),'narrow_quality_failures':sum(not r['quality']['pass'] for r in output['quality_checks'])}))
    sys.exit(bool(errors))
