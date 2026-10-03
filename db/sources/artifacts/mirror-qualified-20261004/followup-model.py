"""Single-variable keepalive diagnostic, prospectively declared mirror pairs, acceptance."""
import json, os, shutil, statistics, subprocess, sys, time
from pathlib import Path
ROOT=Path('/Volumes/llm/slotstream-pr24-followup')
OUT=Path('/Volumes/llm/slotstream-pr24-20261003-followup')
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

while not (OUT/'physical-disk/probe.exit').exists(): time.sleep(5)
if (OUT/'physical-disk/probe.exit').read_text().strip() != '0': raise SystemExit('disk probe incomplete')
frozen = OUT/'frozen'
frozen.mkdir(exist_ok=False)
for name in ['slotstream','mlx.metallib','build-identity.json','build-source.tar.gz']:
    shutil.copy2(ROOT/'.build/release'/name, frozen/name)
(OUT/'environment-model.json').write_text(json.dumps({'build':verified_build(BIN),'host':host_conditions(),
    'commit':subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip(), 'vm':vm_snapshot()},indent=2)+'\n')
copies=OUT/'verified-copies'; copies.mkdir(exist_ok=False)
from context_qualification import verification_lock
for label, model in [('external', EXT), ('internal', INT)]:
    dest=copies/label; dest.mkdir(); settled(13,dest)
    with verification_lock():
        code=run_child([str(BIN),'pull','--verify','--dir',str(model)],os.environ.copy(),dest,900)
    (dest/'verify.exit').write_text(str(code)+'\n')
    if code:raise SystemExit(f'{label} verification failed')
pairs=OUT/'mirror-pairs-keepalive-off';pairs.mkdir(exist_ok=False)
protocol={'kind':'single/mirror current-source paired inference; explicit keepalive off on this Mac',
 'build':verified_build(BIN),'source_commit':subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip(),
 'model':str(EXT),'mirror':str(INT),'verified_copies':'../verified-copies (both exit 0, all 25 pinned files on this executable)' ,
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
