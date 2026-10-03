"""Single-variable keepalive diagnostic, prospectively declared mirror pairs, acceptance."""
import json, os, shutil, statistics, subprocess, sys, time
from pathlib import Path
ROOT=Path('/Volumes/llm/slotstream-occam')
OUT=Path('/Volumes/llm/slotstream-pr24-20261003-continuation')
os.chdir(ROOT); sys.path.insert(0,str(ROOT/'Tools'))
from context_qualification import quiet_preflight
from prefill_bench import vm_snapshot,run_child,digest,validate_metrics,host_conditions
from serve_bench import verified_build
BIN=OUT/'frozen/slotstream'
EXT=Path('/Volumes/llm/models/qwen38-flash-next-mlx-4bit')
INT=Path('/Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit')
PROMPT='请用中文解释什么是混合专家模型（Mixture of Experts），以及它在推理时为什么需要从存储中反复读取专家权重。请展开讲解，不要只写提纲。'

def settled(needed,dest):
    samples=[]; stable=0; start=time.monotonic()
    while time.monotonic()-start<900:
        state=vm_snapshot();samples.append({'time':time.time(),**state})
        if state['reclaimable_bytes']>=needed*1e9: stable+=1
        else:stable=0
        if stable>=3:
            try: quiet_preflight(needed)
            except RuntimeError: stable=0
            else:
                (dest/'admission.json').write_text(json.dumps(samples,indent=2)+'\n');return
        time.sleep(5)
    (dest/'admission.json').write_text(json.dumps(samples,indent=2)+'\n')
    raise RuntimeError('settled quiet headroom unavailable')

# Bash defers its TERM trap until the foreground model finishes. Preserve the
# old incomplete run; never signal its model child or a pre-existing service.
while not (OUT/'acceptance/verify.exit').exists():time.sleep(5)
original=OUT/'diagnostic/current/stats.json'
baseline=json.loads(original.read_text())
diag=OUT/'keepalive-diagnostic';diag.mkdir(exist_ok=False)
(diag/'protocol.json').write_text(json.dumps({'purpose':'same frozen executable, only public GPU keepalive control changes',
    'sequence':['existing-auto','off-1','auto-2','off-2'],'reply_tokens':12,
    'model':str(EXT),'prompt':PROMPT,'cache_slots_per_layer':118,'context':8192,'mtp':'on','build':verified_build(BIN)},indent=2)+'\n')
rows=[]
for label,policy in [('off-1','off'),('auto-2','auto'),('off-2','off')]:
    dest=diag/label;dest.mkdir();settled(28,dest)
    before=vm_snapshot();conditions=host_conditions()
    cmd=[str(BIN),'run','--model',str(EXT),'--experts-per-layer','118','--max-context','8192',
         '--mtp','on','--gpu-keepalive',policy,'--max-tokens','12','--greedy','--seed','1',
         '--stats-json',str(dest/'stats.json'),'--prompt',PROMPT]
    (dest/'command.json').write_text(json.dumps(cmd,ensure_ascii=False,indent=2)+'\n')
    code=run_child(cmd,os.environ.copy(),dest,300)
    after=vm_snapshot();d=json.loads((dest/'stats.json').read_text()) if code==0 else None
    eligible=code==0 and d['output_ids']==baseline['output_ids'] and d['prompt_ids']==baseline['prompt_ids']
    eligible=eligible and all(before[k]==after[k] for k in ['swapins','swapouts'])
    eligible=eligible and d['stats']['gpuKeptAwake']==(policy=='auto')
    row={'label':label,'policy':policy,'exit':code,'before':before,'after':after,'host':conditions,
         'eligible':eligible,'stats':d['stats'] if d else None}
    rows.append(row);(diag/'summary.json').write_text(json.dumps(rows,indent=2)+'\n')
    print('KEEPALIVE',label,eligible,d['stats']['decodeSeconds'] if d else None,flush=True)
    if not eligible:raise SystemExit('single-variable diagnosis failed or excluded')
off=statistics.median(r['stats']['decodeSeconds'] for r in rows if r['policy']=='off')
auto=rows[1]['stats']['decodeSeconds']
(diag/'comparison.json').write_text(json.dumps({'off_decode_seconds_median':off,'auto_repeat_decode_seconds':auto,
    'auto_over_off':auto/off,'all_token_ids_equal':True,'all_runs_no_observed_swap':True},indent=2)+'\n')
if auto/off<2:raise SystemExit('keepalive hypothesis not established; review before campaign')

pairs=OUT/'mirror-pairs-keepalive-off';pairs.mkdir(exist_ok=False)
protocol={'kind':'single/mirror current-source paired inference; explicit keepalive off on this Mac',
 'build':verified_build(BIN),'source_commit':'26b68c429fd7257289db42ed3bd0afb044484bc8',
 'model':str(EXT),'mirror':str(INT),'verified_copies':'../verified-copies (both exit 0, all 25 pinned files)',
 'prompt':PROMPT,'reply_tokens':200,'cache_experts_per_layer':118,'max_context':8192,'mtp':'on',
 'gpu_keepalive':'off','greedy':True,'seed':1,'rounds':3,'order':[['single','mirror'],['mirror','single'],['single','mirror']],
 'limits':'fresh process empties application caches; OS/SSD cache uncontrolled, not cold SSD; global swap excludes a pair; no replacement runs',
 'timeout_seconds_per_arm':1200,'admission':'28 GB reclaimable for three consecutive observations; quiet preflight and native model exclusion lock'}
(pairs/'protocol.json').write_text(json.dumps(protocol,ensure_ascii=False,indent=2)+'\n')
rows=[]
for r,order in enumerate(protocol['order'],1):
    for arm in order:
        dest=pairs/f'r{r}-{arm}';dest.mkdir();settled(28,dest)
        before=vm_snapshot();conditions=host_conditions()
        cmd=[str(BIN),'run','--model',str(EXT),'--experts-per-layer','118','--max-context','8192',
             '--mtp','on','--gpu-keepalive','off','--max-tokens','200','--greedy','--seed','1',
             '--sample-footprint','--stats-json',str(dest/'stats.json'),'--prompt',PROMPT]
        if arm=='mirror':cmd.extend(['--mirror',str(INT)])
        (dest/'command.json').write_text(json.dumps(cmd,ensure_ascii=False,indent=2)+'\n')
        code=run_child(cmd,os.environ.copy(),dest,protocol['timeout_seconds_per_arm'])
        after=vm_snapshot();d=json.loads((dest/'stats.json').read_text()) if code==0 else None
        error=None;eligible=code==0
        if d:
            try:
                s=validate_metrics(d)
                assert s['decodeTokens']==200 and not s.get('runtimeError') and not s.get('requestFailure')
                assert not s.get('memoryPressureCancelled') and s.get('gpuKeptAwake') is False
                assert s['lifetimeRSSPeakBytes']<=28e9
                assert d['effective_pool_slots']==118*48 and d['effective_mtp'] is True
            except (ValueError,AssertionError) as e:eligible=False;error=str(e)
        if any(before[k]!=after[k] for k in ['swapins','swapouts']):eligible=False;error='global swap observed'
        row={'round':r,'arm':arm,'exit':code,'eligible':eligible,'error':error,'before':before,'after':after,'host':conditions,
             'stats':d['stats'] if d else None,'output_ids':d['output_ids'] if d else None,
             'prompt_ids':d['prompt_ids'] if d else None,'stdout_sha256':digest(dest/'stdout.txt')}
        rows.append(row);(pairs/'rows.json').write_text(json.dumps(rows,indent=2)+'\n')
        print('PAIR',r,arm,eligible,d['stats']['decodeSeconds'] if d else None,flush=True)
        if not eligible:raise SystemExit('ineligible inference arm; raw results preserved, no retry')
summary=[]
for r in range(1,4):
    a=next(x for x in rows if x['round']==r and x['arm']=='single')
    b=next(x for x in rows if x['round']==r and x['arm']=='mirror')
    if a['output_ids']!=b['output_ids'] or a['prompt_ids']!=b['prompt_ids'] or a['stdout_sha256']!=b['stdout_sha256']:
        raise SystemExit('pair output identity differs; no performance qualification')
    summary.append({'round':r,'single_tok_s':200/a['stats']['decodeSeconds'],'mirror_tok_s':200/b['stats']['decodeSeconds'],
       'tok_s_ratio':a['stats']['decodeSeconds']/b['stats']['decodeSeconds'],
       'single_decode_io_s':a['stats']['decodeIOSeconds'],'mirror_decode_io_s':b['stats']['decodeIOSeconds']})
(pairs/'summary.json').write_text(json.dumps({'pairs':summary,'all_output_ids_equal':len({tuple(x['output_ids']) for x in rows})==1,
    'single_tok_s_median':statistics.median(x['single_tok_s'] for x in summary),
    'mirror_tok_s_median':statistics.median(x['mirror_tok_s'] for x in summary),
    'paired_tok_s_ratio_median':statistics.median(x['tok_s_ratio'] for x in summary)},indent=2)+'\n')
print('PAIRED_CAMPAIGN_COMPLETE',flush=True)

acceptance=OUT/'acceptance-keepalive-off';acceptance.mkdir(exist_ok=False)
for name in ['ssv_big.txt','ssv_small.txt','ssv_ngram.txt']:
    old=Path('/tmp')/name
    if old.exists():shutil.copy2(old,OUT/'acceptance'/name)
settled(22,acceptance)
env=os.environ.copy();env.update(SLOTSTREAM_TEST_BINARY=str(BIN),SLOTSTREAM_VERIFY_OUT=str(acceptance),
    SLOTSTREAM_REFERENCE_PYTHON='/opt/homebrew/Cellar/omlx/0.7.0rc1/libexec/bin/python3.11',SLOTSTREAM_GPU_KEEPALIVE='off')
(acceptance/'profile.json').write_text(json.dumps({'binary_sha256':digest(BIN),'gpu_keepalive':'off',
    'suite':'unmodified Tools/verify.sh','suite_sha256':digest(ROOT/'Tools/verify.sh'),
    'limits':'explicit public runtime override; does not qualify unmodified auto performance. Keepalive-specific gate still exercises both controls.'},indent=2)+'\n')
print('START ACCEPTANCE KEEPALIVE OFF',flush=True)
with (acceptance/'verify.out').open('w') as log:
    child=subprocess.Popen(['bash','Tools/verify.sh'],env=env,stdout=log,stderr=subprocess.STDOUT)
    (acceptance/'verify.pid').write_text(str(child.pid)+'\n');code=child.wait()
(acceptance/'verify.exit').write_text(str(code)+'\n')
print('ACCEPTANCE_KEEPALIVE_OFF_EXIT',code,flush=True)
raise SystemExit(code)
