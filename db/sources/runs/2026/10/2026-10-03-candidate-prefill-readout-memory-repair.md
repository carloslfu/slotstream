---
type: run
created: 2026-10-03T21:55:43.718280+00:00
updated: 2026-10-03T21:55:43.718280+00:00
summary: Exact state-only intermediate prefill and bounded completed-task rerun
binary: b2767d52babde28a65f0e95a0d43ea8e62b0e39a4537a02fde20573fa1a0ef04
captured_at: 2026-10-03
command: Exact sequential commands are preserved in the driver and supervision identities below.
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Exact state-only intermediate prefill and bounded completed-task rerun
tool: bounded VQ research diagnostics
---

This source preserves a separately versioned response to the preceding full VQ task arm's process-memory failure. Intermediate prompt chunks now consume every target and draft position without computing a vocabulary readout that generation immediately discards. The final prompt chunk, recorded verification, ordinary forward observers and independent numerical fixtures keep the complete original readout. The implementation never substitutes partial or fabricated logits. The native generation control passes 2071 assertions, including the unchanged speculation tests and added 17/512-token comparisons of all target/head state tensors, complete next logits, next states, early cancellation and recorded-pass refusal. The source-bound binary then repeats both candidate arms once with the same frozen tokens, grading and ten-GB envelope. All fourteen previously completed full-VQ cases and all sixteen prior composite cases preserve every output token, finish reason, parsed answer and speculative detail. Both candidates now complete all sixteen tasks within the bound. Full VQ scores thirteen of sixteen; the composite scores fifteen of sixteen, matching the reused original-baseline pilot. The earlier full-VQ failure remains valid and is not erased or reclassified. This is calibration and exact state/continuation evidence, not held-out noninferiority, clean paired speed, arbitrary-context capacity, product serving or pack promotion. The predeclared budget, compiler input identity, raw control and task receipts, prior-output equality checks and complete grader result are retained. The prior full static pass is not claimed as rerun; this source additionally records a remote CI snapshot with engine and Mac jobs still in progress. Future parallel-prefill implementation present in the working tree is not part of this frozen binary or its evidence. No candidate changes the installed model or Auto registry.

Local home prefixes are replaced with <HOME>. Original byte lengths and hashes identify the unmodified local files. For large transcripts, the normalized UTF-8 bytes are stored losslessly as zlib-compressed base64 inside this Markdown source. Decode with `zlib.decompress(base64.b64decode(block))` and verify the listed normalized byte length and SHA-256. Every encoded block was round-trip checked before writing. This changes storage only, not the captured evidence. Small transcripts remain plain text. Raw tensor fixtures and source-bound executables remain in the bounded research directory; manifests bind their hashes. No model is installed or activated.

### capture-vq-prefill-readout-v1.py

Original bytes: 3193. SHA-256: `5202ebc0b79d45a73b1e2dd21287d49e8afce154d60cdbf8490560988dccb8f9`.

Normalized bytes: 3193. SHA-256: `5202ebc0b79d45a73b1e2dd21287d49e8afce154d60cdbf8490560988dccb8f9`.

````text
from pathlib import Path
import importlib.util, json
r=Path('.build/quantization-research')
spec=importlib.util.spec_from_file_location('capture',r/'capture-vq-kernel-cache-v1.py')
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
assert json.loads((r/'complete-task-pilot-v2/receipt.json').read_text())['complete']
assert json.loads((r/'vq-prefill-readout-functional-v1/receipt.json').read_text())['complete']
files=['capture-vq-prefill-readout-v1.py','build-vq-prefill-readout-v1.py','freeze-vq-prefill-readout-v1.py',
       'run-vq-prefill-readout-functional-v1.py','run-complete-task-pilot-v2.py',
       'vq-prefill-readout-resource-budget-v1.json','vq-prefill-readout-build-driver-v1.log',
       'vq-prefill-readout-functional-driver-v1.log','complete-task-pilot-driver-v2.log','baa0d04-ci-v1.json']
for folder in ['vq-prefill-readout-build-v1','vq-prefill-readout-functional-v1','complete-task-pilot-v2']:
    files += [str(p.relative_to(r)) for p in sorted((r/folder).rglob('*'))
              if p.is_file() and p.suffix in ('.json','.log','.txt')]
scope='''This source preserves a separately versioned response to the preceding full VQ task arm's process-memory failure. Intermediate prompt chunks now consume every target and draft position without computing a vocabulary readout that generation immediately discards. The final prompt chunk, recorded verification, ordinary forward observers and independent numerical fixtures keep the complete original readout. The implementation never substitutes partial or fabricated logits. The native generation control passes 2071 assertions, including the unchanged speculation tests and added 17/512-token comparisons of all target/head state tensors, complete next logits, next states, early cancellation and recorded-pass refusal. The source-bound binary then repeats both candidate arms once with the same frozen tokens, grading and ten-GB envelope. All fourteen previously completed full-VQ cases and all sixteen prior composite cases preserve every output token, finish reason, parsed answer and speculative detail. Both candidates now complete all sixteen tasks within the bound. Full VQ scores thirteen of sixteen; the composite scores fifteen of sixteen, matching the reused original-baseline pilot. The earlier full-VQ failure remains valid and is not erased or reclassified. This is calibration and exact state/continuation evidence, not held-out noninferiority, clean paired speed, arbitrary-context capacity, product serving or pack promotion. The predeclared budget, compiler input identity, raw control and task receipts, prior-output equality checks and complete grader result are retained. The prior full static pass is not claimed as rerun; this source additionally records a remote CI snapshot with engine and Mac jobs still in progress. Future parallel-prefill implementation present in the working tree is not part of this frozen binary or its evidence. No candidate changes the installed model or Auto registry.'''
module.capture('candidate-prefill-readout-memory-repair','Exact state-only intermediate prefill and bounded completed-task rerun',scope,files,'frozen-vq-prefill-readout-v1')
````

### build-vq-prefill-readout-v1.py

Original bytes: 3024. SHA-256: `75d2135ef58f982826ca1359c6285553b398017d9e5f237fc1b8d2b430ad022c`.

Normalized bytes: 3024. SHA-256: `75d2135ef58f982826ca1359c6285553b398017d9e5f237fc1b8d2b430ad022c`.

````text
from pathlib import Path
import ctypes,ctypes.util,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
out=Path('.build/quantization-research/vq-prefill-readout-build-v1');out.mkdir(exist_ok=False)
record={'kind':'bounded-single-worker-build','model_processes':0,'process_tree_ceiling_gb':6,'preflight_gb':9,'minimum_headroom_gb':3,'maximum_seconds':1800,'complete':False,'runs':[]}
def save(): (out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
lib=ctypes.CDLL(ctypes.util.find_library('proc'))
child=None
try:
 record['before']=quiet_preflight(9)
 before=subprocess.check_output(['python3','Tools/mac_build_inputs.py',os.path.expanduser('~/.dbmd/bin/dbmd')]);(out/'inputs-before.json').write_bytes(before)
 commands=[['swift','build','-c','release','--product','slotstream','-j','1'], ['swift','build','-c','release','--product','slotstream-checks','-j','1']]
 os.environ['SEVRA_UI_OUT']=str(out.absolute()/'screens')
 record['commands']=commands;save();began=time.monotonic()
 for idx,command in enumerate(commands):
  row={'command':command,'peak_tree_bytes':0,'samples':0};record['runs'].append(row);save()
  with (out/f'{idx}.log').open('w') as log:
   child=subprocess.Popen(command,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
   while child.poll() is None:
    processes=subprocess.check_output(['ps','-axo','pid=,ppid='],text=True,timeout=5)
    rows=[tuple(map(int,s.split())) for s in processes.splitlines()]
    pids={child.pid}
    while True:
     expanded=pids | {pid for pid,parent in rows if parent in pids}
     if expanded==pids: break
     pids=expanded
    total=0
    for pid in pids:
     buf=ctypes.create_string_buffer(296)
     if lib.proc_pid_rusage(pid,4,buf)==0: total+=max(int.from_bytes(buf.raw[72:80],'little'),int.from_bytes(buf.raw[240:248],'little'))
    row['peak_tree_bytes']=max(row['peak_tree_bytes'],total);row['samples']+=1
    if total>6e9: raise RuntimeError('compiler tree exceeded its 6 GB envelope')
    if vm_snapshot()['reclaimable_bytes']<3e9: raise RuntimeError('lost 3 GB real headroom')
    if subprocess.check_output(['sysctl','-n','kern.memorystatus_vm_pressure_level'],text=True,timeout=5).strip()!='1': raise RuntimeError('OS memory pressure')
    if time.monotonic()-began>1800: raise RuntimeError('build time bound')
    time.sleep(.25)
   row['exit_code']=child.returncode;save()
   if child.returncode: raise RuntimeError('compiler failed; see build log')
   child=None
 after=subprocess.check_output(['python3','Tools/mac_build_inputs.py',os.path.expanduser('~/.dbmd/bin/dbmd')]);(out/'inputs-after.json').write_bytes(after)
 if before!=after: raise RuntimeError('build inputs changed')
 record['complete']=True
except BaseException as e:
 record['failure']=type(e).__name__+': '+str(e)
 if child is not None and child.poll() is None: terminate_child_tree(child)
 save();raise
finally:
 save()
print(json.dumps(record))
````

### freeze-vq-prefill-readout-v1.py

Original bytes: 1210. SHA-256: `ec6df537a487688146cfd24540ef82464c7cb39ec08f6e69e0270ecd4ec04faf`.

Normalized bytes: 1210. SHA-256: `ec6df537a487688146cfd24540ef82464c7cb39ec08f6e69e0270ecd4ec04faf`.

````text
from pathlib import Path
import hashlib,json,shutil,subprocess,tarfile
r=Path('.build/quantization-research');build=r/'vq-prefill-readout-build-v1';out=r/'frozen-vq-prefill-readout-v1'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
assert json.loads((build/'receipt.json').read_text())['complete']
before=(build/'inputs-before.json').read_bytes();assert before==(build/'inputs-after.json').read_bytes()
assert before==subprocess.check_output(['python3','Tools/mac_build_inputs.py',str(Path.home()/'.dbmd/bin/dbmd')])
m=json.loads(before)
assert all(sha(p)==digest for p,digest in m['files'].items())
out.mkdir()
for name in ('slotstream','slotstream-checks','mlx.metallib'):shutil.copy2(Path('.build/release')/name,out/name)
with tarfile.open(out/'sources.tar.gz','w:gz') as archive:
 for p in sorted(m['files']):archive.add(p,arcname=p)
identity={'binary_sha256':sha(out/'slotstream'),'checks_sha256':sha(out/'slotstream-checks'),'metallib_sha256':sha(out/'mlx.metallib'),'source_archive_sha256':sha(out/'sources.tar.gz'),'build_inputs':m}
(out/'build-identity.json').write_text(json.dumps(identity,indent=2)+'\n')
print(json.dumps({k:v for k,v in identity.items() if k!='build_inputs'}))
````

### run-vq-prefill-readout-functional-v1.py

Original bytes: 4792. SHA-256: `261cb188cad422a248d0b42ae8fe25f092e1aa281d1ba10656780071653115c7`.

Normalized bytes: 4792. SHA-256: `261cb188cad422a248d0b42ae8fe25f092e1aa281d1ba10656780071653115c7`.

````text
from pathlib import Path
from datetime import datetime,timezone
import ctypes,ctypes.util,hashlib,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
r=Path('.build/quantization-research').absolute();out=r/'vq-prefill-readout-functional-v1'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
cli=Path('.build/release/slotstream').absolute();checks=Path('.build/release/slotstream-checks').absolute()
source=r/'candidate-3.2';inventory=r/'inventory-3.2/inventory.json'
state=[str(cli),'quantization-state-check','--source-directory',str(source),'--source-inventory',str(inventory)]
overlay=['--dense-overlay-baseline',str(Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit'),'--dense-overlay-manifest',str(r/'vq-dense-overlay-pilot-v1/composite.json')]
generation=[str(cli),'quantization-generation-check','--source-directory',str(source),'--source-inventory',str(inventory),'--generation-profile',str(Path('bench/quantization/greedy-v1.json').absolute()),'--output',str(out/'generation-output')]+overlay
cells=[('catalogue',[str(checks),'--tier','t0','--tier','t1','--json'],10,13,900),
 ('generation',generation,10,13,1800)]
out.mkdir()
record={'complete':False,'started_at':datetime.now(timezone.utc).isoformat(),'scope':'Functional acceptance only; no throughput qualification, hardware simulation or model activation.',
 'maximum_concurrent_model_processes':1,'minimum_real_headroom_gb':3,'maximum_total_seconds':10800,
 'pins':{str(p):sha(p) for p in [cli,checks,inventory,r/'vq-dense-overlay-pilot-v1/composite.json',Path(__file__),Path('Tools/lib/mlx-0.32.2.metallib'),Path('bench/quantization/greedy-v1.json')]},
 'protocol':[{'name':n,'command':c,'process_bound_gb':p,'preflight_gb':f,'timeout_seconds':t} for n,c,p,f,t in cells], 'runs':[]}
lib=ctypes.CDLL(ctypes.util.find_library('proc'));began=time.monotonic();child=None
def save():(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG','VQ_','VQLAB_'))}
# Research requires no ambient override; production-only pressure flag is not inherited.
record['explicit_environment']={};record['build_inputs']=json.loads((r/'vq-prefill-readout-build-v1/inputs-before.json').read_text());assert record['build_inputs']==json.loads((r/'vq-prefill-readout-build-v1/inputs-after.json').read_text());save()
try:
 for name,command,bound,preflight,timeout in cells:
  assert all(sha(p)==h for p,h in record['pins'].items())
  before=quiet_preflight(preflight);cell=out/name;cell.mkdir();row={'name':name,'before':before,'peak_physical_bytes':0,'samples':0,'passed':False};record['runs'].append(row);save();started=time.monotonic();lastcheck=0
  with (cell/'stdout.txt').open('w') as stdout,(cell/'stderr.txt').open('w') as stderr:
   child=subprocess.Popen(command,stdout=stdout,stderr=stderr,env=env,start_new_session=True)
   while child.poll() is None:
    buf=ctypes.create_string_buffer(296)
    if lib.proc_pid_rusage(child.pid,4,buf)==0:
     footprint=max(int.from_bytes(buf.raw[72:80],'little'),int.from_bytes(buf.raw[240:248],'little'))
     row['peak_physical_bytes']=max(row['peak_physical_bytes'],footprint);row['samples']+=1
     if footprint>bound*1e9: raise RuntimeError(name+': physical envelope exceeded')
    elif child.poll() is None: raise RuntimeError(name+': footprint observation failed')
    now=time.monotonic()
    if now-lastcheck>=1:
     if vm_snapshot()['reclaimable_bytes']<3e9: raise RuntimeError(name+': lost real headroom')
     if subprocess.check_output(['sysctl','-n','kern.memorystatus_vm_pressure_level'],text=True,timeout=5).strip()!='1':raise RuntimeError(name+': OS pressure')
     lastcheck=now
    if now-started>timeout or now-began>10800: raise RuntimeError(name+': deadline')
    time.sleep(.05)
   row['exit_code']=child.returncode;row['after']=vm_snapshot();row['seconds']=time.monotonic()-started;save()
   if child.returncode or not row['samples']: raise RuntimeError(name+': functional check failed')
   child=None
  text=(cell/'stdout.txt').read_text()
  if name.startswith('state-') or name=='generation':
   assert json.loads((out/(name+'-output')/'receipt.json').read_text())['report']['passed']
  if name=='draft-vision':assert 'MTP CHECK PASS' in text and 'SKIP' not in text
  if name=='draft-stream':assert 'DRAFT STREAM CHECK PASS' in text and 'FAIL' not in text
  row['passed']=True;save();print('PASS',name,row['peak_physical_bytes'],flush=True)
 record['complete']=True
except BaseException as e:
 record['failure']=type(e).__name__+': '+str(e)
 if child is not None and child.poll() is None:terminate_child_tree(child)
 save();raise
finally:save()
````

### run-complete-task-pilot-v2.py

Original bytes: 6165. SHA-256: `504dcaf13fecfd3899a05d31f1ed97fde1d8854dac93c909ce8a5af259dfb42b`.

Normalized bytes: 6165. SHA-256: `504dcaf13fecfd3899a05d31f1ed97fde1d8854dac93c909ce8a5af259dfb42b`.

````text
from pathlib import Path
from datetime import datetime,timezone
import ctypes,ctypes.util,hashlib,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
r=Path('.build/quantization-research').absolute();out=r/'complete-task-pilot-v2'
cli=r/'frozen-vq-prefill-readout-v1/slotstream'
profile=Path('bench/quantization/complete-task-pilot-v1.json').absolute()
baseline=Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
record={'schema':1,'complete':False,'started_at':datetime.now(timezone.utc).isoformat(),'scope':'Prospectively frozen calibration pilot. Not held-out, product qualification or clean paired timing.',
 'maximum_concurrent_model_processes':1,'minimum_real_headroom_bytes':3000000000,'runs':[],
 'budget':json.loads((r/'vq-prefill-readout-resource-budget-v1.json').read_text()),
 'pins':{str(p):sha(p) for p in [cli,cli.parent/'mlx.metallib',cli.parent/'build-identity.json',Path(__file__),profile,Path('Tools/quantization_tasks.py'),Path('Tools/quantization_tasks_test.py')]}}
assert sha(profile)=='339f5e53f26eb911d49994a3585522e7570003f21448073cc5e2ec2396de4a9b'
out.mkdir()
lib=ctypes.CDLL(ctypes.util.find_library('proc'));child=None
env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG','VQ_','VQLAB_'))}
def save():(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
def run(name,command,bound,timeout):
 global child
 assert all(sha(p)==h for p,h in record['pins'].items())
 before=quiet_preflight(13);cell=out/name;cell.mkdir();row={'name':name,'command':command,'bound_bytes':bound,'timeout':timeout,'before':before,'peak_physical_bytes':0,'samples':0,'passed':False};record['runs'].append(row);save();started=time.monotonic();lastcheck=0
 with (cell/'stdout.txt').open('w') as stdout,(cell/'stderr.txt').open('w') as stderr:
  child=subprocess.Popen(command,stdout=stdout,stderr=stderr,env=env,start_new_session=True)
  while child.poll() is None:
   buf=ctypes.create_string_buffer(296)
   if lib.proc_pid_rusage(child.pid,4,buf)==0:
    peak=max(int.from_bytes(buf.raw[72:80],'little'),int.from_bytes(buf.raw[240:248],'little'))
    row['peak_physical_bytes']=max(row['peak_physical_bytes'],peak);row['samples']+=1
    if peak>bound:raise RuntimeError(name+': physical envelope exceeded')
   elif child.poll() is None:raise RuntimeError(name+': footprint observation failed')
   now=time.monotonic()
   if now-lastcheck>=1:
    if vm_snapshot()['reclaimable_bytes']<3e9:raise RuntimeError(name+': lost real headroom')
    if subprocess.check_output(['sysctl','-n','kern.memorystatus_vm_pressure_level'],text=True,timeout=5).strip()!='1':raise RuntimeError(name+': OS pressure')
    lastcheck=now
   if now-started>timeout:raise RuntimeError(name+': deadline')
   time.sleep(.05)
  row['exit_code']=child.returncode;row['after']=vm_snapshot();row['seconds']=time.monotonic()-started;save()
  if child.returncode or not row['samples']:raise RuntimeError(name+': producer failed')
  child=None
 row['passed']=True;save();print('PASS',name,row['peak_physical_bytes'],flush=True)
prepared=r/'complete-task-pilot-v1/prepared/prepared.json'
assert sha(prepared)==record['budget']['prior_protocol_sha256']
record['prepared_sha256']=sha(prepared);record['pins'][str(prepared)]=sha(prepared)
record['scope']='Versioned calibration after omitting unused intermediate-prefill readouts. Prior outputs and the failed full-pack arm remain preserved. No held-out, promotion or clean timing claim.'
previous={'vq32':r/'complete-task-pilot-v1/vq32-output/receipt.json', 'composite':r/'complete-task-pilot-v1-composite/composite-output/receipt.json'}
for path in previous.values():record['pins'][str(path)]=sha(path)
base=[str(cli),'quantization-task-run','--protocol-file',str(prepared),'--protocol-sha256',sha(prepared),'--baseline',str(baseline)]
artifact=['--source-directory',str(r/'candidate-3.2'),'--source-inventory',str(r/'inventory-3.2/inventory.json'),'--table',str(r/'vq-extended-rotary-v1/rotary-output/angles-f32le.bin')]
record['failures']=[];save()
try:
 for name,args in [('vq32',artifact),('composite',artifact+['--dense-overlay-manifest',str(r/'vq-dense-overlay-pilot-v1/composite.json'),'--draft-depth','2'])]:
  previous_run_count=len(record['runs'])
  try:
   run(name,base+args+['--output',str(out/(name+'-output'))],10000000000,14400)
   receipt=json.loads((out/(name+'-output')/'receipt.json').read_text())
   assert receipt['complete'] and receipt['protocol_sha256']==record['prepared_sha256'] and len(receipt['cases'])==16
   prior=json.loads(previous[name].read_text())
   for before,after in zip(prior['cases'],receipt['cases']):
    assert before['id']==after['id'] and before['prompt_tokens']==after['prompt_tokens'] and before['output_tokens']==after['output_tokens'] and before['reason']==after['reason'],name+': a previously completed token stream changed'
    for key in ['text','prose','tool_calls','malformed_tool_call']:
     assert before[key]==after[key],name+': a previously completed parsed answer changed'
    assert before['detail']==after['detail'],name+': speculative details changed'
   record['runs'][-1]['identical_prior_complete_cases']=len(prior['cases']);save()
  except Exception as error:
   if child is not None and child.poll() is None:terminate_child_tree(child)
   if len(record['runs'])==previous_run_count:record['runs'].append({'name':name,'not_launched':True})
   row=record['runs'][-1];row['failure']=type(error).__name__+': '+str(error);row['passed']=False
   row['after_failure']=vm_snapshot();record['failures'].append({'arm':name,'failure':row['failure']});child=None;save()
   print('FAIL',name,row['failure'],flush=True)
 record['complete']=not record['failures'];save()
 if record['failures']:raise RuntimeError('one or more bounded candidate arms failed; no retries')
except BaseException as error:
 if child is not None and child.poll() is None:terminate_child_tree(child)
 record['failure']=type(error).__name__+': '+str(error);save();raise
finally:save()
````

### vq-prefill-readout-resource-budget-v1.json

Original bytes: 1936. SHA-256: `d06601bc1b83ce297da2b7415cb368ecd4993c59e619f5d0b413ba4c4bdaf571`.

Normalized bytes: 1936. SHA-256: `d06601bc1b83ce297da2b7415cb368ecd4993c59e619f5d0b413ba4c4bdaf571`.

````text
{
  "schema": 1,
  "scope": "Remove discarded intermediate-prefill vocabulary readouts without changing any consumed target or draft state, final readout arithmetic, prompt tokens or grading.",
  "parent_commit": "baa0d045181a9c77af25c9b799b74c03b6cd7362",
  "hypothesis": "The previous full VQ task arm crossed its ten-GB bound during retrieval. Its intermediate prompt readouts are unused; removing those allocations may reduce its peak. The cause and sufficiency of this change remain unproven until the new bounded campaign.",
  "prior_failure_receipt_sha256": "09ccf3a4d7f6db9c3b0bb29f681c4da77b8ca75e08983662a4d09c1b7884525c",
  "prior_protocol_sha256": "267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038",
  "build": {
    "maximum_tree_bytes": 6000000000,
    "preflight_bytes": 9000000000,
    "maximum_seconds": 1800,
    "workers": 1
  },
  "native_controls": {
    "maximum_runs": 2,
    "cases": [
      "T0/T1 catalogue",
      "existing speculative generation and added 17/512-token readout-omission state/logit parity with the original draft"
    ],
    "maximum_process_bytes": 10000000000,
    "preflight_bytes": 13000000000,
    "maximum_seconds_per_run": 1800
  },
  "candidate_task_repeats": {
    "maximum_batches": 2,
    "arms": [
      "full VQ3.2 without draft",
      "original-dense VQ3.2 composite with two original drafts"
    ],
    "cases_per_arm": 16,
    "maximum_process_bytes": 10000000000,
    "preflight_bytes": 13000000000,
    "maximum_seconds_per_batch": 14400,
    "retry": false,
    "scope": "Versioned calibration after a specific implementation change. The original failure and scores remain evidence; no held-out claim."
  },
  "maximum_model_processes": 1,
  "minimum_real_headroom_bytes": 3000000000,
  "raw_logit_bytes": 0,
  "new_weight_bytes": 0,
  "additional_output_budget_bytes": 32000000,
  "maximum_research_staging_bytes": 350000000000,
  "paid_compute_usd": 0
}
````

### vq-prefill-readout-build-driver-v1.log

Original bytes: 2716. SHA-256: `5d7bae5a730a04c9b8088687e6526c8ebf9e273c9915356d7dff5901dfc83755`.

Normalized bytes: 2716. SHA-256: `5d7bae5a730a04c9b8088687e6526c8ebf9e273c9915356d7dff5901dfc83755`.

````text
swift-driver version: 1.148.6 swift-driver version: 1.148.6 {"kind": "bounded-single-worker-build", "model_processes": 0, "process_tree_ceiling_gb": 6, "preflight_gb": 9, "minimum_headroom_gb": 3, "maximum_seconds": 1800, "complete": true, "runs": [{"command": ["swift", "build", "-c", "release", "--product", "slotstream", "-j", "1"], "peak_tree_bytes": 1688980600, "samples": 602, "exit_code": 0}, {"command": ["swift", "build", "-c", "release", "--product", "slotstream-checks", "-j", "1"], "peak_tree_bytes": 986417888, "samples": 14, "exit_code": 0}], "before": {"page_bytes": 16384, "reclaimable_bytes": 36779917312, "swapins": 52, "swapouts": 2908, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   380810.\nPages active:                                 485009.\nPages inactive:                              1646145.\nPages speculative:                             19728.\nPages throttled:                                   0.\nPages wired down:                             178024.\nPages purgeable:                               12627.\n\"Translation faults\":                     2291178607.\nPages copy-on-write:                       119369814.\nPages zero filled:                        3756676367.\nPages reactivated:                         191491824.\nPages purged:                               13287988.\nFile-backed pages:                           1851431.\nAnonymous pages:                              299451.\nPages stored in compressor:                   806045.\nPages occupied by compressor:                 374916.\nDecompressions:                            111760020.\nCompressions:                              126711021.\nPageins:                                  2667150198.\nPageouts:                                     513563.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 131173.\nPages tagged resident:                         94030.\nPages tagged compressed:                       37143.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5238.\nPages tag-storage free:                          994.\nPages tag-storage non-tag pageable:            92064.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5827712.\nTagged compressions:                          851498.\nTagged decompressions:                        718053.\n"}, "commands": [["swift", "build", "-c", "release", "--product", "slotstream", "-j", "1"], ["swift", "build", "-c", "release", "--product", "slotstream-checks", "-j", "1"]]}
````

### vq-prefill-readout-functional-driver-v1.log

Original bytes: 53. SHA-256: `487b9beb60e09f2fae3b1c10a6abf552a7c18e5cec360d45b63522f8674ec017`.

Normalized bytes: 53. SHA-256: `487b9beb60e09f2fae3b1c10a6abf552a7c18e5cec360d45b63522f8674ec017`.

````text
PASS catalogue 1334412656
PASS generation 8488327024
````

### complete-task-pilot-driver-v2.log

Original bytes: 47. SHA-256: `1c09fe0e78c7ab1591d6f5a7a24377ea15a5f00b78b8aa0fbefb442b4ed21cbf`.

Normalized bytes: 47. SHA-256: `1c09fe0e78c7ab1591d6f5a7a24377ea15a5f00b78b8aa0fbefb442b4ed21cbf`.

````text
PASS vq32 9365920248
PASS composite 8492242872
````

### baa0d04-ci-v1.json

Original bytes: 698. SHA-256: `e35068aa40c0d0a0b1a088a8f09ebffcbb195584852db39ef03cd01ddf7631f9`.

Normalized bytes: 698. SHA-256: `e35068aa40c0d0a0b1a088a8f09ebffcbb195584852db39ef03cd01ddf7631f9`.

````text
[{"conclusion":"success","databaseId":37155487562,"headSha":"baa0d045181a9c77af25c9b799b74c03b6cd7362","name":"docs","status":"completed","updatedAt":"2026-10-03T21:33:25Z"},{"conclusion":"","databaseId":37155487536,"headSha":"baa0d045181a9c77af25c9b799b74c03b6cd7362","name":"ci","status":"in_progress","updatedAt":"2026-10-03T21:35:17Z"},{"conclusion":"","databaseId":37155487523,"headSha":"baa0d045181a9c77af25c9b799b74c03b6cd7362","name":"sevra-mac","status":"in_progress","updatedAt":"2026-10-03T21:33:11Z"},{"conclusion":"success","databaseId":37155487526,"headSha":"baa0d045181a9c77af25c9b799b74c03b6cd7362","name":"context-proxies","status":"completed","updatedAt":"2026-10-03T21:35:07Z"}]
````

### vq-prefill-readout-build-v1/0.log

Original bytes: 11267. SHA-256: `31355d7dc9f7d9679c825dbfc490149b3dae82bb1d335f22d5ef8fc44cac16e5`.

Normalized bytes: 11148. SHA-256: `14bcac6bf8ae08a3c1ffb10e6d7a4b5ca046219da54fb5caeb3347fe8c31b509`.

````text
[0/1] Planning build
Building for production...
[0/4] Write swift-version--1AB21518FC5DEDBE.txt
[1/4] Write sources
[4/5] Compiling Slotstream AdaptiveSpeculation.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }

<HOME>/Projects/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
34 |         lock.lock()
35 |         defer { lock.unlock() }
36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
   |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
38 |         var small = [Int16](repeating: 0, count: ids.count)
[5/6] Compiling SlotstreamDiagnostics CheckReport.swift
<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:277:20: warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
275 |         }
276 |         defer { release.signal() }
277 |         guard held.wait(timeout: .now() + 5) == .success else { throw ModelError("queue holder did not start") }
    |                    `- warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
278 |         var queueChecks: UInt64 = 0
279 |         let queueConfig = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)

Dispatch.DispatchSemaphore.wait:2:13: note: 'wait(timeout:)' declared here
1 | class DispatchSemaphore {
2 | public func wait(timeout: DispatchTime) -> DispatchTimeoutResult}
  |             `- note: 'wait(timeout:)' declared here
3 | 

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:293:21: warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
291 |         }
292 |         release.signal()
293 |         guard ended.wait(timeout: .now() + 5) == .success else { throw ModelError("queue holder did not finish") }
    |                     `- warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
294 |         // Checked legacy mutation cannot enlarge an already allocated engine.
295 |         engine.maxContextTokens = ContextPolicy.modelLimit

Dispatch.DispatchSemaphore.wait:2:13: note: 'wait(timeout:)' declared here
1 | class DispatchSemaphore {
2 | public func wait(timeout: DispatchTime) -> DispatchTimeoutResult}
  |             `- note: 'wait(timeout:)' declared here
3 | 

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:35:38: warning: capture of 'server' with non-Sendable type 'Server' in a '@Sendable' closure [#SendableClosureCaptures]
 33 |             }
 34 |             let finished = DispatchSemaphore(value: 0)
 35 |             Thread.detachNewThread { server.handle(peer); finished.signal() }
    |                                      `- warning: capture of 'server' with non-Sendable type 'Server' in a '@Sendable' closure [#SendableClosureCaptures]
 36 |             defer { shutdown(client,SHUT_RDWR); close(client) }
 37 |             let method = object == nil ? "GET" : "POST"

<HOME>/Projects/slotstream/Sources/Slotstream/Server.swift:14:20: note: class 'Server' does not conform to the 'Sendable' protocol
  12 | }
  13 | 
  14 | public final class Server {
     |                    `- note: class 'Server' does not conform to the 'Sendable' protocol
  15 |     /// Explicit opt-in for local benchmark processes. Ordinary wire responses
  16 |     /// retain their existing schema and do not run the footprint sampler.

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:4:1: warning: add '@preconcurrency' to suppress 'Sendable'-related warnings from module 'Slotstream'
  2 | import Foundation
  3 | import MLX
  4 | import Slotstream
    | `- warning: add '@preconcurrency' to suppress 'Sendable'-related warnings from module 'Slotstream'
  5 | 
  6 | extension Diagnostics {

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:273:13: warning: capture of 'engine' with non-Sendable type 'Engine' in a '@Sendable' closure [#SendableClosureCaptures]
271 |         let held = DispatchSemaphore(value: 0), release = DispatchSemaphore(value: 0), ended = DispatchSemaphore(value: 0)
272 |         Thread.detachNewThread {
273 |             engine.withExclusive { held.signal(); release.wait() }
    |             `- warning: capture of 'engine' with non-Sendable type 'Engine' in a '@Sendable' closure [#SendableClosureCaptures]
274 |             ended.signal()
275 |         }

<HOME>/Projects/slotstream/Sources/Slotstream/Engine.swift:83:20: note: class 'Engine' does not conform to the 'Sendable' protocol
  81 | }
  82 | 
  83 | public final class Engine {
     |                    `- note: class 'Engine' does not conform to the 'Sendable' protocol
  84 |     public let modelDir: URL
  85 |     public let model: Qwen4ExpModel

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift:31:38: warning: capture of 'server' with non-Sendable type 'Server' in a '@Sendable' closure [#SendableClosureCaptures]
 29 |             }
 30 |             let finished = DispatchSemaphore(value: 0)
 31 |             Thread.detachNewThread { server.handle(peer); finished.signal() }
    |                                      `- warning: capture of 'server' with non-Sendable type 'Server' in a '@Sendable' closure [#SendableClosureCaptures]
 32 |             defer { shutdown(client,SHUT_RDWR); close(client) }
 33 |             let method = object == nil ? "GET" : "POST"

<HOME>/Projects/slotstream/Sources/Slotstream/Server.swift:14:20: note: class 'Server' does not conform to the 'Sendable' protocol
  12 | }
  13 | 
  14 | public final class Server {
     |                    `- note: class 'Server' does not conform to the 'Sendable' protocol
  15 |     /// Explicit opt-in for local benchmark processes. Ordinary wire responses
  16 |     /// retain their existing schema and do not run the footprint sampler.

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift:5:1: warning: add '@preconcurrency' to suppress 'Sendable'-related warnings from module 'Slotstream'
  3 | import Foundation
  4 | import MLX
  5 | import Slotstream
    | `- warning: add '@preconcurrency' to suppress 'Sendable'-related warnings from module 'Slotstream'
  6 | 
  7 | extension Diagnostics {

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift:8:18: warning: weak variable 'observedOwner' was never mutated; consider changing to 'let' constant [#WeakMutability]
 6 |         var c = CheckBuilder("optimization-read-handle-lifetime")
 7 |         var owner: CheckpointIndex? = try CheckpointIndex(dir: modelDir)
 8 |         weak var observedOwner = owner
   |                  `- warning: weak variable 'observedOwner' was never mutated; consider changing to 'let' constant [#WeakMutability]
 9 |         let ref = owner!.ref("model.layers.0.mlp.switch_mlp.gate_proj.weight")
10 |         var handle: TensorReadHandle? = owner!.readHandle(for: ref)

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift:110:21: warning: will never be executed
107 |             logits.append(last); traces.append(routes)
108 |         }
109 |         if terminalPrefill {
    |            `- note: condition always evaluates to false
110 |             c.equal("all undemanded terminal queries skipped", model.terminalQueryRowsSkipped,
    |                     `- warning: will never be executed
111 |                 terminalQuery ? tokens - min(64, (tokens - 1) % 256 + 1) : tokens - ((tokens - 1) % 256 + 1))
112 |             c.equal("all unused terminal MoE rows skipped", model.terminalMoERowsSkipped, tokens - 1)

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift:117:22: warning: will never be executed
114 |                 Array((traces[0][model.runLayers - 1] ?? []).suffix(model.cfg.topK)))
115 |         }
116 |         if selectedAttention {
    |            `- note: condition always evaluates to false
117 |             c.expect("selected attention actually executed", model.selectedAttentionTiles > 0)
    |                      `- warning: will never be executed
118 |             c.measure("selected_attention_tiles", Double(model.selectedAttentionTiles))
119 |         }

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift:184:29: warning: will never be executed
182 |         c.measure("routing.control", controlRoutes); c.measure("routing.candidate", candidateRoutes)
183 |         c.expect("route keep sets inside existing rechunk band", candidateRoutes <= max(3 * controlRoutes, 0.01))
184 |         if scoped { c.equal("exact ordered router traces", traces[2], traces[0]) }
    |            |                `- warning: will never be executed
    |            `- note: condition always evaluates to false
185 |         if terminalPrefill {
186 |             c.equal("all state-producing layers retain ordered routes", traces[2].filter { $0.key != model.runLayers - 1 },

<HOME>/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift:186:21: warning: will never be executed
183 |         c.expect("route keep sets inside existing rechunk band", candidateRoutes <= max(3 * controlRoutes, 0.01))
184 |         if scoped { c.equal("exact ordered router traces", traces[2], traces[0]) }
185 |         if terminalPrefill {
    |            `- note: condition always evaluates to false
186 |             c.equal("all state-producing layers retain ordered routes", traces[2].filter { $0.key != model.runLayers - 1 },
    |                     `- warning: will never be executed
187 |                 traces[0].filter { $0.key != model.runLayers - 1 })
188 |         }

[#SendableClosureCaptures]: <https://docs.swift.org/compiler/documentation/diagnostics/sendable-closure-captures>
[#WeakMutability]: <https://docs.swift.org/compiler/documentation/diagnostics/weak-mutability>
[6/8] Compiling slotstream_cli CheckRendering.swift
[6/8] Write Objects.LinkFileList
[7/8] Linking slotstream
Build of product 'slotstream' complete! (164.26s)
````

### vq-prefill-readout-build-v1/1.log

Original bytes: 195. SHA-256: `5d529dd4c60f7d8d403c3563053d9fecfa52b722a63129068aca8bb0783bfab9`.

Normalized bytes: 195. SHA-256: `5d529dd4c60f7d8d403c3563053d9fecfa52b722a63129068aca8bb0783bfab9`.

````text
Building for production...
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[1/3] Write Objects.LinkFileList
[2/3] Linking slotstream-checks
Build of product 'slotstream-checks' complete! (3.53s)
````

### vq-prefill-readout-build-v1/inputs-after.json

Original bytes: 39595. SHA-256: `1b56745cd76019bd4035f76a66793b90e66296033ca5921e1e4010e128b3da13`.

Normalized bytes: 39595. SHA-256: `1b56745cd76019bd4035f76a66793b90e66296033ca5921e1e4010e128b3da13`.

````text
{
  "dbmd_sha256": "3cc761c52629f220e5de40733d052884a3787885d696e26f07fdd1d1644d642b",
  "files": {
    "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
    "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
    "Sources/Slotstream/AppliedModelConfiguration.swift": "0042eecacbd2f4ddb136681c550237bb2ca1c4972035409a59bd4fddd1113aad",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
    "Sources/Slotstream/Checkpoint.swift": "361b54ab482ab1b08debf846148d16fb811ee3550cb8ca1ae7526dc9b825e04b",
    "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
    "Sources/Slotstream/ContextFeasibility.swift": "5e7d185542e5ef173683afd5e6999c7ec76c36bfa8e6d3356ec40d1b695edcfe",
    "Sources/Slotstream/ContextMemory.swift": "31da5a698303ec9898747052996996eeec2ac46d40b7c011791ea7b00e6bd23b",
    "Sources/Slotstream/ContextWindowPolicy.swift": "73b2321aae6a2c22fc7173467136770dbf45a1eca4a185293491472680a13a24",
    "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
    "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "24ca04e99cf4195e59bc08692b6bf62393872161c52f8b5eb1913c6282c9fb32",
    "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
    "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
    "Sources/Slotstream/ExpertPrefetch.swift": "46fb601813d05b788a3648139cbde2b88c94714a5e15f99456e4b2e7072f4b6a",
    "Sources/Slotstream/ExpertStore.swift": "4dae1ae2ff59f671ad4b6e0dbc6405fb198d2dc523ec9f2d9e00c9b2dfce7bcc",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
    "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
    "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
    "Sources/Slotstream/Generate.swift": "792159f8e9f11d1c98373c08e066b79908192d142d25a9f8bf2a6fbb22b48c82",
    "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
    "Sources/Slotstream/Governor.swift": "89310e4c1b2cef2b104122445a1ccdb118d4ea4c38ee7bd726d78261be74457b",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "d5d5b2fcc1a6012c25f0d2a8ff7e6d7ba4ca758d385c38220518e10176e7acc2",
    "Sources/Slotstream/MTP.swift": "a967ad702f6830d5862ab1f7b78dcf469645b9b9db70b55965d76af257b7ea40",
    "Sources/Slotstream/MTPExpertStream.swift": "391b13fed457ba61a7cb4e107472a699ba87adc9a57cfd14580faa2dfbe50fd7",
    "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "1048ad7bcd1c9f93f5316465ed38d7bd93046fe4bfbd0fc138d972e646ee12ab",
    "Sources/Slotstream/ModelPackRegistry.swift": "56c7e6930287d9e8495d90e88e61df4dd062e78afa2767f4047941e1bb67aa5b",
    "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
    "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
    "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
    "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
    "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
    "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
    "Sources/Slotstream/PersistentPrefixFormat.swift": "d03795ee46252fe5df904591289af41a69811f2a211f437764d3f80ddb0d20ad",
    "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
    "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
    "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
    "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "240766430e77e186107a2b3eea844b8876bb509f92e2fbcfcea9d989e1a37b54",
    "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
    "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
    "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
    "Sources/Slotstream/RequestControl.swift": "56c5e664aaf33454f5ef45efedb3849ee539fd91e844d58885bf304f5aab3c1d",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
    "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "8566a2a7734ae19f07aa3b4216b2c219687b52819b3ac86a2f79533d31ad03a5",
    "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
    "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
    "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
    "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
    "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
    "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
    "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
    "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
    "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
    "Sources/Slotstream/VQDraftWeights.swift": "232799bd52934647ea792473111ab1b671f1c6b563c7980c16036f2eeff10e72",
    "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
    "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
    "Sources/Slotstream/VQGenerationProbe.swift": "ae7bd4f10c8a71daa548d73298d74485d8f54de45ed0ff78e21194bdbe49fbf5",
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "84749552ead79c5cf83472fd6c1802050c72c7d22041c5ab8f0e1233b1d01f04",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryCoefficients.swift": "8aeda16d1f6f79296cd872dbb49eebff9dcef4ba6f8f4462acc5c001f62ce63f",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "6375ebfb23b05b7286c9d22b78fa8051dd85c5d6f160a52c6dcbb98a165bb2be",
    "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
    "Sources/Slotstream/Version.swift": "d68b6b9f343402041c33452b885eebce140773cc26379b4adaae996640427b40",
    "Sources/Slotstream/Vision.swift": "639b5c4bbe05654db411d587f31e7962d3db857aa4be38a2b54f982199d51eb5",
    "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
    "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
    "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
    "Sources/Slotstream/WeightStore.swift": "b7b9c43d6aaee926a6c13701e65cded306e9eb8483477b61ff81dcf212f39999",
    "Sources/Slotstream/Weights.swift": "01fb2c61390e6b7585eb80a34bf53a8c460fb6258908d57a3c1ed1fa77ec3ce8",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
    "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
    "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "25b469da9856405dd6421d6754d7caaeae378fc5e77ae1637a2552a139a810f7",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "b891dd485cafb3fc2bd4961fd4fd372e30cc496fb4c2bac414f4835ef51c0d3a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d1ac7938651c5b9db8e95706ab1f6802dbce55e3abcf9213df0407ddbfbe498c",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationTasks.swift": "f576e811b053d958aef413aac4d84b09ef241585a5bebf8146c6bd4d06bfb5f7",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b18979a76cb2112a2beb8fd3196c1d26e36c2626c2a8de732b6b4fc134be61c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "95c27157cb514ff744e70366bf4ac7a5b435279d7c8e232189dfb292e22c1f21",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQContext.swift": "75d660486eb83511b6c3bfc0614e1257d5578d68f42619c6312ae7e5cc296f31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "fcd2f234c893483618844cbd2296e74b27934dca28b06e24860c2b1212da135a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQState.swift": "655571a17a6e25833211de23de8b8c4f387ad2c7043e49da07c7b447babd2992",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "31de09d8efc8951692f60fc9f5c4ec4d14dbef5b67656da18bca519ab4bcbcee",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
    "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
    "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
    "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
    "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
    "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
    "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
    "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
    "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
    "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
    "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
    "Sources/SlotstreamTestKit/T0Checks.swift": "25bcf4ef6daeb29a31ebfacd2217bf12afb7788672f72c21d13ae7ac41aded97",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
    "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "d26e43367ba2d61d7afd9f5b175e95b714409b1717b86b9fe71f1306e36b6a81",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "3ba24ae3e24dd10214e3288f007952d9e2b06241c081e29313b42ac7aa7a31bb",
    "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
    "Sources/slotstream-cli/DraftStreamCommands.swift": "4fd131e2303fd4f2c9765fff9b2543011d565dd5c070b8b380910528c9026a33",
    "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "249274657b4f4f4c3e694a2b0db671b3af8b92a2148495647f3be9092f48f6b2",
    "Sources/slotstream-cli/LaunchCommand.swift": "a18212935aa5aa2c956593838ef181ccbf0aae2501b7a0071f4b4b44298ea0f9",
    "Sources/slotstream-cli/MTPCommands.swift": "04d06d66f29339b4d88dfbae7be18ef873c32c09320536ee7916e7d621816e08",
    "Sources/slotstream-cli/ModelPackCommand.swift": "daaa7bf13449090afb10d04c7ecc2a6bf9af5c0f9c182e758417aeb1a51408fa",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
    "Sources/slotstream-cli/PrefixExactCommands.swift": "b70f0a6f2536f0eb1fc00007260cc6dffe2592b1f32271225fe1304261346e28",
    "Sources/slotstream-cli/Pull.swift": "ca9f9e90ef959b194653945e29ebd3b9f1932ef3e46dfceaa7b09562fa2c9d7b",
    "Sources/slotstream-cli/QuantizationCommands.swift": "bd6fcf1328405c17c3d99748b2b6572e4b9520d297fcac4bdab1927c6520d0b1",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "8c42e20197cd7673fa8f37e57451f4f753204edf6a58e96de6ea7474c8c1dbd3",
    "Tools/build_sevra_mac.sh": "debb9110cd8e316bac4e153e9f7cfe07fe0437dbb8e781bb50bcf93b0488771d",
    "Tools/generate_sevra_icon.sh": "8228ccb8e4d707c2a73336f283ed599f72cbc2213589ca36191d675e737141b6",
    "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
    "Tools/mac_build_inputs.py": "1e406cea50efb4125d0d5fc45be838288ee440d90097dc508ce2b0d3ad68eb1a",
    "Tools/render_sevra_icon.swift": "cbcf593dec275773cc86118bc4d6aff423534d9df7e62ef0fb014733c9aa3095",
    "apps/macos/App/AppModel.swift": "aea5ef70be88b171a1932c3370909c044880177d6651f3b961f219036e29f3f6",
    "apps/macos/App/AppModelWork.swift": "76f3d80447c5b4a829ac4bc1e0f429ee3f1df76a53f06b3110c03b75e9e90d14",
    "apps/macos/App/ContentView.swift": "f64f31bc3cfe9ab8f8d1c207f1e137ebe1102927ec4e1f409c21fab3d0cc5745",
    "apps/macos/App/MacCommands.swift": "e85cc090add3bfd42cc259727fcc16c76f44307a5172e40a96dd7f74747674c6",
    "apps/macos/App/MiniAppHost.swift": "9720c739c4ef11b56e3cb3e30bcca6e17f3c97ba7cf4d3e26ad743d0e7e82bec",
    "apps/macos/App/NativeControls.swift": "a66a3219a431dc4523a1c8ec16e6372331123b7c43888e75c250047e60193729",
    "apps/macos/App/NativeText.swift": "bb471331e742b37bee04fea4db02c80506c91e95597faa12c23962aea8c7d614",
    "apps/macos/App/ObserverMark.swift": "93f172ecc0b360338bb09913071a6ba6644077576abf9b323bfa95ebd4c5b764",
    "apps/macos/App/ResponseDetails.swift": "fe85363dc19a3a767250df73cdb566a4e22117236b9137bfd5853e19ff437087",
    "apps/macos/App/SevraMain.swift": "7ae10c0cf10b4ffda3c54416db51f589eac0a8eb1f59b24a3e5ffa01da7cbd34",
    "apps/macos/App/WindowState.swift": "c3782b38d4ff1342587aef3e54688bc0fb6160f92388f8b4de1742780d09a96e",
    "apps/macos/App/WorkViews.swift": "27be9436faf7b6b56adc0892f13b911652bbc1960493765fb869a7b14edc8af9",
    "apps/macos/CSandbox/include/sevra_sandbox.h": "7885534cb39319e57ebe6dcf196447e2a50b31fdf31ca8c13fe2457f005477d9",
    "apps/macos/CSandbox/sevra_sandbox.c": "6172c4955a01baf46affb019f5f1be32b8d388371203ecd41802f5ba9bd5a3f8",
    "apps/macos/Extract/main.swift": "1892d923b140622e1698c1c0f1eaba5f9684921f4917cdec52003b26f89617f5",
    "apps/macos/Info.plist": "73cc83e91b2729b1ef576226fd95104e0bb763f874fe937d81d92d9785e8bdb6",
    "apps/macos/Package.resolved": "2d751ea715e77a0a7994c55a13e23b0327b9e6b42827ec7603cf740f44d53da4",
    "apps/macos/Package.swift": "2d9e44a7d3a5067d7eecb4f9a929b355943fcad7d91e56eabaa9a160a47bb201",
    "apps/macos/Presentation/ComposerSession.swift": "1e0ec10e4833da338b289e6b766b4d471924e47cd1f5cfb5d301cdbd4b719ef6",
    "apps/macos/Presentation/HistoryPage.swift": "576e721818d61bfd988b6f57b136aab6bbb8c847f8e8a2116ce76708f4f4f84d",
    "apps/macos/Presentation/MarkdownDocument.swift": "39fa604d4b09e8fdd61cd4b5be33c912fd748501c4aaeb7f2f420023b9fe6a45",
    "apps/macos/Presentation/Module.swift": "dda9b75f64b106eb544de201f599122d75abc483c5b156bba6c05c0f956dbc3c",
    "apps/macos/Resources/Fonts/Inter-OFL.txt": "5b9321a4298cfeb6b34354164a1c3afc3db114569984c502b9b35d988fd58c57",
    "apps/macos/Resources/Fonts/Inter.ttf": "29160a80ff49ddcab2c97711247e08b1fab27a484a329ce8b813d820dc559031",
    "apps/macos/Resources/Fonts/Poppins-Medium.ttf": "90373e7d838d32468438fc3e152dca0bdb12edcab99ea639f158790b1ba1fd05",
    "apps/macos/Resources/Fonts/Poppins-OFL.txt": "6be04893d770899a015649c7aa3b582f871b272f8747a92b78b17c3e5c8b2573",
    "apps/macos/Resources/Fonts/manifest.json": "1e79dfd278dbe9bfd8afbf7e5cbaee64dff1574fc1cc3aca8fdd903f4056677e",
    "apps/macos/Resources/Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
    "apps/macos/Resources/Licenses/VQLab-NOTICE.txt": "04d3fc0f5e2ddf3570b5895316cbee7a62d7d75bdd216c39b3aee95c8942941d",
    "apps/macos/Resources/Licenses/swift-cmark-COPYING": "c22e885f33b821bddb24cf007145e5540655b6c0f403e49e6c76a93c28e6d9a9",
    "apps/macos/Resources/Licenses/swift-markdown-LICENSE.txt": "167beb36f181bd163c93c6feb45c68e5f9462fe1af55b278f7bfd1df20e673a3",
    "apps/macos/Resources/Licenses/swift-markdown-NOTICE.txt": "ee7da43afcac4a52196a2141024573ec2ceb84b14e74dfed38522d94586fbc52",
    "apps/macos/Resources/Sevra.icns": "b28f2df8e40cafc2e89fb3ae5a0e361b5470851d833495df9b3dd4ca0395471d",
    "apps/macos/Runtime/Changes.swift": "17735c951b3bef2c2b30f6fe029b5e8f635364513a7669da770d934815411e7d",
    "apps/macos/Runtime/ConversationContext.swift": "89a1a6cfd9b3d879a53c40443e3c02bcef380f1599354fc386469bd4d39d81e7",
    "apps/macos/Runtime/Extensions.swift": "632ed6d2ec6d1704b24c79c5c71a1ce790a37a1fdbbb24ac5c1db32cb0ac9406",
    "apps/macos/Runtime/Extraction.swift": "5bc0b25ad3b29481bb2b92491cff976934d9f5f92ca3bf4dc83988b056be8955",
    "apps/macos/Runtime/HomeArchive.swift": "d43376db4e1d7bb6919bf3e332477fffa28ceefdc92d0b90ff6b206fe18fb169",
    "apps/macos/Runtime/HomeStore.swift": "0a4db7db75f1de1f3042a78af86e6057377b92deab4639326040a620e609a49b",
    "apps/macos/Runtime/HomeTemplate.swift": "e25b0a112abdea7d915c1f553fb3b62078b8ab35ab60dc5c3d80a82468caa7a2",
    "apps/macos/Runtime/HomeWriter.swift": "d61aa8ebc3ee627a5281100eb77cec4eaf633fcd97a792a5a4290136f499c303",
    "apps/macos/Runtime/Inference.swift": "a690583eddce6facd924e18622845f9a7e7ecdc33a255c52292f377f2e76873a",
    "apps/macos/Runtime/InferenceCache.swift": "48aa1f16913c2ac4f227b11e76131c2d5e4860403cbc6280de91946b19aba670",
    "apps/macos/Runtime/LocalIPC.swift": "2f9ca541d07687034f6808958e54397f017f260d394216ab71cd8221bb3d599e",
    "apps/macos/Runtime/ModelSetup.swift": "3080010ef569fbee93c372a61699ef13e4ac4066a1be40815e991ff647b16e62",
    "apps/macos/Runtime/ModelVerification.swift": "29564d5f03207e4286f6ab8ab286a22dac58de92bb459f3f765417a99ce38e53",
    "apps/macos/Runtime/Models.swift": "6ee898c4a2a092f30eb5696829235ab391d3e0290319a88e38b94ec1c63ab3f5",
    "apps/macos/Runtime/Performance.swift": "b377ed9652f1321db355daefc7371d8c048173b56a13a5c2d7ed484949895b78",
    "apps/macos/Runtime/ResponseMetrics.swift": "91db9f1ce48a14f16b5e9b516dfdf20e0354e475a170f6888c88018cff6ca737",
    "apps/macos/Runtime/Runtime.swift": "4ac3bda459c64c41d4bc5c4ce461e0c60889913c913873237c8bc7b3cfca9b48",
    "apps/macos/Runtime/RuntimeExtensions.swift": "8a03804b02763569d839359064fa22e0a50e88907a56dd5eeaf5f88b327ce311",
    "apps/macos/Runtime/SourceNavigation.swift": "c2286df52a8a3ec200a5adad3162c899c08e480b858a15e1fe5e0634202cbb3e",
    "apps/macos/Runtime/Sources.swift": "b458dc283490f833ad50e17079af849d644d27408c45b7f04e01dbb059e59267",
    "apps/macos/Runtime/Thinking.swift": "be477cb342ac1057a5fcd82842b498cbbb7ecfb91548e5ce49e4aef9fcbee420",
    "apps/macos/Runtime/Tools.swift": "6cd7577792d86d6a2d31ba24d0e4bdf55374a5b443954d3584e27404f725d52f",
    "apps/macos/Sevra.xcodeproj/project.pbxproj": "dc22426b24c2c8eafe143ad67c087f800a7708e2d7c6d43ba7f9e4a0abe3040c"
  },
  "scope": "Local development build inputs. Ad-hoc signing is not release qualification.",
  "sdk": "26.5",
  "swift": "Apple Swift version 6.3.3 (swiftlang-6.3.3.1.3 clang-2100.1.1.101)\nTarget: arm64-apple-macosx26.0"
}
````

### vq-prefill-readout-build-v1/inputs-before.json

Original bytes: 39595. SHA-256: `1b56745cd76019bd4035f76a66793b90e66296033ca5921e1e4010e128b3da13`.

Normalized bytes: 39595. SHA-256: `1b56745cd76019bd4035f76a66793b90e66296033ca5921e1e4010e128b3da13`.

````text
{
  "dbmd_sha256": "3cc761c52629f220e5de40733d052884a3787885d696e26f07fdd1d1644d642b",
  "files": {
    "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
    "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
    "Sources/Slotstream/AppliedModelConfiguration.swift": "0042eecacbd2f4ddb136681c550237bb2ca1c4972035409a59bd4fddd1113aad",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
    "Sources/Slotstream/Checkpoint.swift": "361b54ab482ab1b08debf846148d16fb811ee3550cb8ca1ae7526dc9b825e04b",
    "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
    "Sources/Slotstream/ContextFeasibility.swift": "5e7d185542e5ef173683afd5e6999c7ec76c36bfa8e6d3356ec40d1b695edcfe",
    "Sources/Slotstream/ContextMemory.swift": "31da5a698303ec9898747052996996eeec2ac46d40b7c011791ea7b00e6bd23b",
    "Sources/Slotstream/ContextWindowPolicy.swift": "73b2321aae6a2c22fc7173467136770dbf45a1eca4a185293491472680a13a24",
    "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
    "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "24ca04e99cf4195e59bc08692b6bf62393872161c52f8b5eb1913c6282c9fb32",
    "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
    "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
    "Sources/Slotstream/ExpertPrefetch.swift": "46fb601813d05b788a3648139cbde2b88c94714a5e15f99456e4b2e7072f4b6a",
    "Sources/Slotstream/ExpertStore.swift": "4dae1ae2ff59f671ad4b6e0dbc6405fb198d2dc523ec9f2d9e00c9b2dfce7bcc",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
    "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
    "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
    "Sources/Slotstream/Generate.swift": "792159f8e9f11d1c98373c08e066b79908192d142d25a9f8bf2a6fbb22b48c82",
    "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
    "Sources/Slotstream/Governor.swift": "89310e4c1b2cef2b104122445a1ccdb118d4ea4c38ee7bd726d78261be74457b",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "d5d5b2fcc1a6012c25f0d2a8ff7e6d7ba4ca758d385c38220518e10176e7acc2",
    "Sources/Slotstream/MTP.swift": "a967ad702f6830d5862ab1f7b78dcf469645b9b9db70b55965d76af257b7ea40",
    "Sources/Slotstream/MTPExpertStream.swift": "391b13fed457ba61a7cb4e107472a699ba87adc9a57cfd14580faa2dfbe50fd7",
    "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "1048ad7bcd1c9f93f5316465ed38d7bd93046fe4bfbd0fc138d972e646ee12ab",
    "Sources/Slotstream/ModelPackRegistry.swift": "56c7e6930287d9e8495d90e88e61df4dd062e78afa2767f4047941e1bb67aa5b",
    "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
    "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
    "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
    "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
    "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
    "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
    "Sources/Slotstream/PersistentPrefixFormat.swift": "d03795ee46252fe5df904591289af41a69811f2a211f437764d3f80ddb0d20ad",
    "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
    "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
    "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
    "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "240766430e77e186107a2b3eea844b8876bb509f92e2fbcfcea9d989e1a37b54",
    "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
    "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
    "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
    "Sources/Slotstream/RequestControl.swift": "56c5e664aaf33454f5ef45efedb3849ee539fd91e844d58885bf304f5aab3c1d",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
    "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "8566a2a7734ae19f07aa3b4216b2c219687b52819b3ac86a2f79533d31ad03a5",
    "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
    "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
    "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
    "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
    "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
    "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
    "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
    "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
    "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
    "Sources/Slotstream/VQDraftWeights.swift": "232799bd52934647ea792473111ab1b671f1c6b563c7980c16036f2eeff10e72",
    "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
    "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
    "Sources/Slotstream/VQGenerationProbe.swift": "ae7bd4f10c8a71daa548d73298d74485d8f54de45ed0ff78e21194bdbe49fbf5",
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "84749552ead79c5cf83472fd6c1802050c72c7d22041c5ab8f0e1233b1d01f04",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryCoefficients.swift": "8aeda16d1f6f79296cd872dbb49eebff9dcef4ba6f8f4462acc5c001f62ce63f",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "6375ebfb23b05b7286c9d22b78fa8051dd85c5d6f160a52c6dcbb98a165bb2be",
    "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
    "Sources/Slotstream/Version.swift": "d68b6b9f343402041c33452b885eebce140773cc26379b4adaae996640427b40",
    "Sources/Slotstream/Vision.swift": "639b5c4bbe05654db411d587f31e7962d3db857aa4be38a2b54f982199d51eb5",
    "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
    "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
    "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
    "Sources/Slotstream/WeightStore.swift": "b7b9c43d6aaee926a6c13701e65cded306e9eb8483477b61ff81dcf212f39999",
    "Sources/Slotstream/Weights.swift": "01fb2c61390e6b7585eb80a34bf53a8c460fb6258908d57a3c1ed1fa77ec3ce8",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
    "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
    "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "25b469da9856405dd6421d6754d7caaeae378fc5e77ae1637a2552a139a810f7",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "b891dd485cafb3fc2bd4961fd4fd372e30cc496fb4c2bac414f4835ef51c0d3a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d1ac7938651c5b9db8e95706ab1f6802dbce55e3abcf9213df0407ddbfbe498c",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationTasks.swift": "f576e811b053d958aef413aac4d84b09ef241585a5bebf8146c6bd4d06bfb5f7",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b18979a76cb2112a2beb8fd3196c1d26e36c2626c2a8de732b6b4fc134be61c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "95c27157cb514ff744e70366bf4ac7a5b435279d7c8e232189dfb292e22c1f21",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQContext.swift": "75d660486eb83511b6c3bfc0614e1257d5578d68f42619c6312ae7e5cc296f31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "fcd2f234c893483618844cbd2296e74b27934dca28b06e24860c2b1212da135a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQState.swift": "655571a17a6e25833211de23de8b8c4f387ad2c7043e49da07c7b447babd2992",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "31de09d8efc8951692f60fc9f5c4ec4d14dbef5b67656da18bca519ab4bcbcee",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
    "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
    "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
    "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
    "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
    "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
    "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
    "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
    "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
    "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
    "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
    "Sources/SlotstreamTestKit/T0Checks.swift": "25bcf4ef6daeb29a31ebfacd2217bf12afb7788672f72c21d13ae7ac41aded97",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
    "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "d26e43367ba2d61d7afd9f5b175e95b714409b1717b86b9fe71f1306e36b6a81",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "3ba24ae3e24dd10214e3288f007952d9e2b06241c081e29313b42ac7aa7a31bb",
    "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
    "Sources/slotstream-cli/DraftStreamCommands.swift": "4fd131e2303fd4f2c9765fff9b2543011d565dd5c070b8b380910528c9026a33",
    "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "249274657b4f4f4c3e694a2b0db671b3af8b92a2148495647f3be9092f48f6b2",
    "Sources/slotstream-cli/LaunchCommand.swift": "a18212935aa5aa2c956593838ef181ccbf0aae2501b7a0071f4b4b44298ea0f9",
    "Sources/slotstream-cli/MTPCommands.swift": "04d06d66f29339b4d88dfbae7be18ef873c32c09320536ee7916e7d621816e08",
    "Sources/slotstream-cli/ModelPackCommand.swift": "daaa7bf13449090afb10d04c7ecc2a6bf9af5c0f9c182e758417aeb1a51408fa",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
    "Sources/slotstream-cli/PrefixExactCommands.swift": "b70f0a6f2536f0eb1fc00007260cc6dffe2592b1f32271225fe1304261346e28",
    "Sources/slotstream-cli/Pull.swift": "ca9f9e90ef959b194653945e29ebd3b9f1932ef3e46dfceaa7b09562fa2c9d7b",
    "Sources/slotstream-cli/QuantizationCommands.swift": "bd6fcf1328405c17c3d99748b2b6572e4b9520d297fcac4bdab1927c6520d0b1",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "8c42e20197cd7673fa8f37e57451f4f753204edf6a58e96de6ea7474c8c1dbd3",
    "Tools/build_sevra_mac.sh": "debb9110cd8e316bac4e153e9f7cfe07fe0437dbb8e781bb50bcf93b0488771d",
    "Tools/generate_sevra_icon.sh": "8228ccb8e4d707c2a73336f283ed599f72cbc2213589ca36191d675e737141b6",
    "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
    "Tools/mac_build_inputs.py": "1e406cea50efb4125d0d5fc45be838288ee440d90097dc508ce2b0d3ad68eb1a",
    "Tools/render_sevra_icon.swift": "cbcf593dec275773cc86118bc4d6aff423534d9df7e62ef0fb014733c9aa3095",
    "apps/macos/App/AppModel.swift": "aea5ef70be88b171a1932c3370909c044880177d6651f3b961f219036e29f3f6",
    "apps/macos/App/AppModelWork.swift": "76f3d80447c5b4a829ac4bc1e0f429ee3f1df76a53f06b3110c03b75e9e90d14",
    "apps/macos/App/ContentView.swift": "f64f31bc3cfe9ab8f8d1c207f1e137ebe1102927ec4e1f409c21fab3d0cc5745",
    "apps/macos/App/MacCommands.swift": "e85cc090add3bfd42cc259727fcc16c76f44307a5172e40a96dd7f74747674c6",
    "apps/macos/App/MiniAppHost.swift": "9720c739c4ef11b56e3cb3e30bcca6e17f3c97ba7cf4d3e26ad743d0e7e82bec",
    "apps/macos/App/NativeControls.swift": "a66a3219a431dc4523a1c8ec16e6372331123b7c43888e75c250047e60193729",
    "apps/macos/App/NativeText.swift": "bb471331e742b37bee04fea4db02c80506c91e95597faa12c23962aea8c7d614",
    "apps/macos/App/ObserverMark.swift": "93f172ecc0b360338bb09913071a6ba6644077576abf9b323bfa95ebd4c5b764",
    "apps/macos/App/ResponseDetails.swift": "fe85363dc19a3a767250df73cdb566a4e22117236b9137bfd5853e19ff437087",
    "apps/macos/App/SevraMain.swift": "7ae10c0cf10b4ffda3c54416db51f589eac0a8eb1f59b24a3e5ffa01da7cbd34",
    "apps/macos/App/WindowState.swift": "c3782b38d4ff1342587aef3e54688bc0fb6160f92388f8b4de1742780d09a96e",
    "apps/macos/App/WorkViews.swift": "27be9436faf7b6b56adc0892f13b911652bbc1960493765fb869a7b14edc8af9",
    "apps/macos/CSandbox/include/sevra_sandbox.h": "7885534cb39319e57ebe6dcf196447e2a50b31fdf31ca8c13fe2457f005477d9",
    "apps/macos/CSandbox/sevra_sandbox.c": "6172c4955a01baf46affb019f5f1be32b8d388371203ecd41802f5ba9bd5a3f8",
    "apps/macos/Extract/main.swift": "1892d923b140622e1698c1c0f1eaba5f9684921f4917cdec52003b26f89617f5",
    "apps/macos/Info.plist": "73cc83e91b2729b1ef576226fd95104e0bb763f874fe937d81d92d9785e8bdb6",
    "apps/macos/Package.resolved": "2d751ea715e77a0a7994c55a13e23b0327b9e6b42827ec7603cf740f44d53da4",
    "apps/macos/Package.swift": "2d9e44a7d3a5067d7eecb4f9a929b355943fcad7d91e56eabaa9a160a47bb201",
    "apps/macos/Presentation/ComposerSession.swift": "1e0ec10e4833da338b289e6b766b4d471924e47cd1f5cfb5d301cdbd4b719ef6",
    "apps/macos/Presentation/HistoryPage.swift": "576e721818d61bfd988b6f57b136aab6bbb8c847f8e8a2116ce76708f4f4f84d",
    "apps/macos/Presentation/MarkdownDocument.swift": "39fa604d4b09e8fdd61cd4b5be33c912fd748501c4aaeb7f2f420023b9fe6a45",
    "apps/macos/Presentation/Module.swift": "dda9b75f64b106eb544de201f599122d75abc483c5b156bba6c05c0f956dbc3c",
    "apps/macos/Resources/Fonts/Inter-OFL.txt": "5b9321a4298cfeb6b34354164a1c3afc3db114569984c502b9b35d988fd58c57",
    "apps/macos/Resources/Fonts/Inter.ttf": "29160a80ff49ddcab2c97711247e08b1fab27a484a329ce8b813d820dc559031",
    "apps/macos/Resources/Fonts/Poppins-Medium.ttf": "90373e7d838d32468438fc3e152dca0bdb12edcab99ea639f158790b1ba1fd05",
    "apps/macos/Resources/Fonts/Poppins-OFL.txt": "6be04893d770899a015649c7aa3b582f871b272f8747a92b78b17c3e5c8b2573",
    "apps/macos/Resources/Fonts/manifest.json": "1e79dfd278dbe9bfd8afbf7e5cbaee64dff1574fc1cc3aca8fdd903f4056677e",
    "apps/macos/Resources/Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
    "apps/macos/Resources/Licenses/VQLab-NOTICE.txt": "04d3fc0f5e2ddf3570b5895316cbee7a62d7d75bdd216c39b3aee95c8942941d",
    "apps/macos/Resources/Licenses/swift-cmark-COPYING": "c22e885f33b821bddb24cf007145e5540655b6c0f403e49e6c76a93c28e6d9a9",
    "apps/macos/Resources/Licenses/swift-markdown-LICENSE.txt": "167beb36f181bd163c93c6feb45c68e5f9462fe1af55b278f7bfd1df20e673a3",
    "apps/macos/Resources/Licenses/swift-markdown-NOTICE.txt": "ee7da43afcac4a52196a2141024573ec2ceb84b14e74dfed38522d94586fbc52",
    "apps/macos/Resources/Sevra.icns": "b28f2df8e40cafc2e89fb3ae5a0e361b5470851d833495df9b3dd4ca0395471d",
    "apps/macos/Runtime/Changes.swift": "17735c951b3bef2c2b30f6fe029b5e8f635364513a7669da770d934815411e7d",
    "apps/macos/Runtime/ConversationContext.swift": "89a1a6cfd9b3d879a53c40443e3c02bcef380f1599354fc386469bd4d39d81e7",
    "apps/macos/Runtime/Extensions.swift": "632ed6d2ec6d1704b24c79c5c71a1ce790a37a1fdbbb24ac5c1db32cb0ac9406",
    "apps/macos/Runtime/Extraction.swift": "5bc0b25ad3b29481bb2b92491cff976934d9f5f92ca3bf4dc83988b056be8955",
    "apps/macos/Runtime/HomeArchive.swift": "d43376db4e1d7bb6919bf3e332477fffa28ceefdc92d0b90ff6b206fe18fb169",
    "apps/macos/Runtime/HomeStore.swift": "0a4db7db75f1de1f3042a78af86e6057377b92deab4639326040a620e609a49b",
    "apps/macos/Runtime/HomeTemplate.swift": "e25b0a112abdea7d915c1f553fb3b62078b8ab35ab60dc5c3d80a82468caa7a2",
    "apps/macos/Runtime/HomeWriter.swift": "d61aa8ebc3ee627a5281100eb77cec4eaf633fcd97a792a5a4290136f499c303",
    "apps/macos/Runtime/Inference.swift": "a690583eddce6facd924e18622845f9a7e7ecdc33a255c52292f377f2e76873a",
    "apps/macos/Runtime/InferenceCache.swift": "48aa1f16913c2ac4f227b11e76131c2d5e4860403cbc6280de91946b19aba670",
    "apps/macos/Runtime/LocalIPC.swift": "2f9ca541d07687034f6808958e54397f017f260d394216ab71cd8221bb3d599e",
    "apps/macos/Runtime/ModelSetup.swift": "3080010ef569fbee93c372a61699ef13e4ac4066a1be40815e991ff647b16e62",
    "apps/macos/Runtime/ModelVerification.swift": "29564d5f03207e4286f6ab8ab286a22dac58de92bb459f3f765417a99ce38e53",
    "apps/macos/Runtime/Models.swift": "6ee898c4a2a092f30eb5696829235ab391d3e0290319a88e38b94ec1c63ab3f5",
    "apps/macos/Runtime/Performance.swift": "b377ed9652f1321db355daefc7371d8c048173b56a13a5c2d7ed484949895b78",
    "apps/macos/Runtime/ResponseMetrics.swift": "91db9f1ce48a14f16b5e9b516dfdf20e0354e475a170f6888c88018cff6ca737",
    "apps/macos/Runtime/Runtime.swift": "4ac3bda459c64c41d4bc5c4ce461e0c60889913c913873237c8bc7b3cfca9b48",
    "apps/macos/Runtime/RuntimeExtensions.swift": "8a03804b02763569d839359064fa22e0a50e88907a56dd5eeaf5f88b327ce311",
    "apps/macos/Runtime/SourceNavigation.swift": "c2286df52a8a3ec200a5adad3162c899c08e480b858a15e1fe5e0634202cbb3e",
    "apps/macos/Runtime/Sources.swift": "b458dc283490f833ad50e17079af849d644d27408c45b7f04e01dbb059e59267",
    "apps/macos/Runtime/Thinking.swift": "be477cb342ac1057a5fcd82842b498cbbb7ecfb91548e5ce49e4aef9fcbee420",
    "apps/macos/Runtime/Tools.swift": "6cd7577792d86d6a2d31ba24d0e4bdf55374a5b443954d3584e27404f725d52f",
    "apps/macos/Sevra.xcodeproj/project.pbxproj": "dc22426b24c2c8eafe143ad67c087f800a7708e2d7c6d43ba7f9e4a0abe3040c"
  },
  "scope": "Local development build inputs. Ad-hoc signing is not release qualification.",
  "sdk": "26.5",
  "swift": "Apple Swift version 6.3.3 (swiftlang-6.3.3.1.3 clang-2100.1.1.101)\nTarget: arm64-apple-macosx26.0"
}
````

### vq-prefill-readout-build-v1/receipt.json

Original bytes: 3038. SHA-256: `33f4458f02ab16be17be0af889072459329bb8dc13320c244385a2b7b793d782`.

Normalized bytes: 3038. SHA-256: `33f4458f02ab16be17be0af889072459329bb8dc13320c244385a2b7b793d782`.

````text
{
  "kind": "bounded-single-worker-build",
  "model_processes": 0,
  "process_tree_ceiling_gb": 6,
  "preflight_gb": 9,
  "minimum_headroom_gb": 3,
  "maximum_seconds": 1800,
  "complete": true,
  "runs": [
    {
      "command": [
        "swift",
        "build",
        "-c",
        "release",
        "--product",
        "slotstream",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 1688980600,
      "samples": 602,
      "exit_code": 0
    },
    {
      "command": [
        "swift",
        "build",
        "-c",
        "release",
        "--product",
        "slotstream-checks",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 986417888,
      "samples": 14,
      "exit_code": 0
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36779917312,
    "swapins": 52,
    "swapouts": 2908,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   380810.\nPages active:                                 485009.\nPages inactive:                              1646145.\nPages speculative:                             19728.\nPages throttled:                                   0.\nPages wired down:                             178024.\nPages purgeable:                               12627.\n\"Translation faults\":                     2291178607.\nPages copy-on-write:                       119369814.\nPages zero filled:                        3756676367.\nPages reactivated:                         191491824.\nPages purged:                               13287988.\nFile-backed pages:                           1851431.\nAnonymous pages:                              299451.\nPages stored in compressor:                   806045.\nPages occupied by compressor:                 374916.\nDecompressions:                            111760020.\nCompressions:                              126711021.\nPageins:                                  2667150198.\nPageouts:                                     513563.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 131173.\nPages tagged resident:                         94030.\nPages tagged compressed:                       37143.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5238.\nPages tag-storage free:                          994.\nPages tag-storage non-tag pageable:            92064.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5827712.\nTagged compressions:                          851498.\nTagged decompressions:                        718053.\n"
  },
  "commands": [
    [
      "swift",
      "build",
      "-c",
      "release",
      "--product",
      "slotstream",
      "-j",
      "1"
    ],
    [
      "swift",
      "build",
      "-c",
      "release",
      "--product",
      "slotstream-checks",
      "-j",
      "1"
    ]
  ]
}
````

### vq-prefill-readout-functional-v1/catalogue/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### vq-prefill-readout-functional-v1/catalogue/stdout.txt

Original bytes: 3450856. SHA-256: `2dcfdddea8f83680f209c3e55f8b51dc73d2d604642980b93f43f8a88002e2a5`.

Normalized bytes: 3450856. SHA-256: `2dcfdddea8f83680f209c3e55f8b51dc73d2d604642980b93f43f8a88002e2a5`.

````zlib-base64
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
5SsJVmGSYOUvCVZBkmDlLQlWIZJgFSoJVj6SYBUmCVb+kmAVJAlW3pJgFSIJVqGSYOUjCVZhkmDl
LwlWQZJg5S0JViGSYBUqCVY+kmAVJglW/pNgluhEeJ+HmKPUAUD8r5jndPUCpg6B4vja2+Nve740
3A/MDQvqIAb4vP52guRrlTxegesJZ2qD7yvE/cDcsKAOYkAAX3V8lfiMv39f9XKd+Pjbvi8U9wNz
w4I6iAEBfNXxxeIz/v59NUiqKYOkmjJEqinDpJoyTKopg6Sa0mOqKcOkmtJfqimDpJoyWKopvaSa
MlCqKT2mmjJMqin9pZoySKopg6Wa0kuqKQOlmtJjqinDpJrSX6opg6SaMliqKb2kmjJQqikDpZoq
SKqpQqSaKkyqqcKkmipIqqk8ppoqTKqp/KWaKkiqqYKlmspLqqkCpZrKY6qpwqSayl+qqYKkmipY
qqm8pJoqUKqpPKaaKkyqqfylmipIqqmCpZrKS6qpAqWaIRroKYsV855qzlDqACD+V8x3qjmHqUOg
OA6Jx9/2nGr6gblhQR3EAJ8hcYLka5U8hkRPOFMbfKeafmBuWFAHMSCArzpONWf8/fuql1Rz/G3f
qaYfmBsW1EEMCOCrjlPNGX//vhok1UyCpJpJiFQzCZNqJmFSzSRIqpl4TDWTMKlm4i/VTIKkmkmw
VDPxkmomgVLNxGOqmYRJNRN/qWYSJNVMgqWaiZdUMwmUaiYeU80kTKqZ+Es1kyCpZhIs1Uy8pJpJ
oFQzCZRqpkFSzTREqpmGSTXTMKlmGiTVTD2mmmmYVDP1l2qmQVLNNFiqmXpJNdNAqWbqMdVMw6Sa
qb9UMw2SaqbBUs3US6qZBko1U4+pZhom1Uz9pZppkFQzDZZqpl5SzTRQqpn6TzUTmTDuPdWco9QB
QPyvmOdU8wKmDoESYNFkmEWTQRbNQ85z/G3POY8nmBsW1EEM8PgcmSL5WiV/zxFfOFMbPOc8nmBu
WFAHMSCAr7rNeeb8/ftqkJyHB8l5eIich4fJeXiYnIcHyXl4oJyHh8l5eJCch3vMeXiYnIf7y3l4
kJyHB8t5uJechwfKebjHnIeHyXm4v5yHB8l5eLCch3vJeXignMcDTvfWtPuoyHd9BK/Xnfn/92W9
r8yKVXW3L/N11GyigU1Vv0Zp8g+OkJvt17KN3vPv1fvhPcqLotztjWj5PjJZihuMuvy+j0agffOl
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
PHs+7W0d7fp51fnzgIfDnvYOL371vP7xsCe9oQteOw9yQOxJ7+pa16hjHBF72q/2sa5Qxxnwrn5K
7Env50BXqItPdwc5KPakd3W0K9RVh6hjnBUro0Rrh96DPvEt+mvU097QJS5ST3tH8ir1tHdyqT3o
097VxS6eT3tbF7t6Pu1tXery+cRVd53r5wEnvKe9w4tfPa8/4T3pDV3w2nmQCe9J7+pa16hjTHhP
+9W+0BXqzc3Hu1f/+Oz2H29ffPp4epnbh0/h1enF3748rfQXN+/NC97/gt7e3f9gpyves5/ffTpd
6e5e/f7V25vXzz69ff/Lrx9evTj9x5uXf3z14fS/+Lf+Yzz+p//x5b/8t29ub+7XwZvTFPHh/r/+
f/7mb/7iHf/5PZ4+859f/f7T3f0/ww+P/wBfX/afe8nHjC8/8d+++nj75uFV/vu/8ml8+OXd3cef
frz/mO/uPr3/ePqk725vXp4+jNNrvDm9/Okf5ObFx2e/+/XjuX4N7/Ofvb3/53328d2nF7+cPvmH
9MfbzN3t//p0++Hhjdy8/f3teV7zP/39f/lv//V+hrv/B3x28/H0L/vil/v4l89+fnX34ePp0v3h
1fkGuvvfpA+fXrw4Xfp+/vT64cf7/NOcXvt0KTz9i3749OYUfJ6f7R/+87NXH569PF3pX709/VP9
fPfuzbOb0/Xj5v5f7+70u36e1zlFnVbN53+k9zd3H1+dVsXLm4839y/+9t3HLz/weV7sxc3bF7ev
X3+eP77+dp4+vrfP/vxv+euz1+/evT/nC54+tXfvH35BPv5ye/p/r+5e/vnVz/br8ertH29ev3r8
BX/2Q/z0YxHBp4v5DyGCdym1zvK8jtXbnH09nz/9KF7pw+N14sX9grr/F7m/dtzenemV3pwW/YdX
99e4h0vS+7t3v78fVu5/n+9u/+dpKjjXCr198/7jr6f/m5u3H36+Xzy3dz+/u3tzv2qe/f1PP/7D
BW4o706/vW9e/e+H5fTDwxX9h/uf2dxTXrx78/71abt8ukr8+vrd6ZM9/RO++vnVuT7NbyIf9ye/
3Hx49u53D3fxl89enm6b51uqL2/ff/zl2fP/8Ozu3Z/u/7/3r25fnFbW3z3eFr9OCme8P/7zLxmX
f8ly+Zesl3/JdvmX7Jd/yXH5l5yXf8l1sZeMy18K4vKXgrj8pSAufymIy18K4vKXgrj8pSAufymI
y18KyuUvBeXyl4Jy+UtBufyloFz+UlAufykol78UlMtfCsrlLwX18peCevlLQb38paBe/lJQL38p
qJe/FNTLXwrq5S8F9YKXgrj8s4K4/LOCuPyzgrj8s4K4/LOCuPyzgrj8s4K4/LOCuPyzgrj8s4K4
/LOCuPyzgrj8s4K4/LOCuPyzgrj8s4K4/LOCuPyzgrj8s4K4/LOCuPyzgrj8s4K4/LOCuPyzgrj8
s4K4/LOCuPyzgrj8s4K4/LOCuPyzgrj8s4K4/LOCuPyzgrj8s4K4/LOCuPyzgnL5ZwXl8s8KyuWf
FZTLPysol39WUC7/rKBc/llBufyzgnL5ZwXl8s8KyuWfFZTLPysol39WUC7/rKBc/llBufyzgnL5
ZwXl8s8KyuWfFZTLPysol39WUC7/rKBc/llBufyzgnL5ZwXl8s8KyuWfFZTLPysol39WUC7/rKBc
/llBufyzgnL5ZwXl8s8KyuWfFZTLPyuoV3hYUK/wtKBe4XFBvcLzgnqFBwb1Ck8M6hUeGdQrPDOo
V3hoUK/w1KBe4bFBvcJzg3qFBwf1Ck8O6hUeHdQrPDuoV3h4UK/w9KBe4fFBvcLzg3qFBwj1Ck8Q
6hUeIdQrPEOoV3iIUK/wFKFe4TFCvcJzhHqFBwn1Ck8S6hUeJdQrPEuoV3iYUK/wNKFe4XFCvcLz
hCjrCk2F/+tF4xovWq7xovUaL9qu8aL9Gi86rvGi8xovesmLQ1zj4hDXuDjENS4OcY2LQ1zj4hDX
uDjENS4OcY2LQ1zj4lCucXEo17g4lGtcHMo1Lg7lGheHco2LQ7nGxaFc4+JQrnFxqNe4ONRrXBzq
NS4O9RoXh3qNi0O9xsWhXuPiUK9xcbjMM4d7NPrusy18uhy1i1wbPr/ERV/yX/gx4/I/ZlzhxyyX
/zHLFX7Mevkfs17hx2yX/zHbFX7Mfvkfs1/hxxyX/zHHFX7Mefkfc17hx1yX/zEvNh48/w/PLz0e
XOol/4UfMy7/Y8YVfsxy+R+zXOHHrJf/MesVfsx2+R+zXeHH7Jf/MfsVfsxx+R9zXOHHnJf/MecV
fsx1+R/zYuNB/Idy6fHgUi/5L/yYcfkfM67wY5bL/5jlCj9mvfyPWa/wY7bL/5jtCj9mv/yP2a/w
Y47L/5jjCj/mvPyPOa/wY67L/5iXesnPf7jrw7Obx9c9RX58/Mth9x8FfL23t7+/+fjqj7efX9i9
0NvTB/n+9u7jn3+01ze/vvv08fy/MX/+2U6v8PBH/8ALfvMj/vLu7btPdx++/qG3Zz/ffHp9/pd5
SL3/s4/n+oNk335m8mf49nXO/kN8+bt7f7j99acfP7y/eXvmv4GX+dfNv//zvq9/+vF/fbp5+/Hx
DwE+e/Xy/k/af/z12ZtXH97cfHzxy5lf8+E39X+++92z589ufvfu7nQp+Z/vXr29ffnsd/cvdp7X
+LwQnp9zKXz7Ju//WOObV6d3/uHT7z7c/2Xatx8ft75n/ohCf0Rx8Y8ozvwRVf0R1Yt/RPVMf2D0
Hx/++O/vn93/Wd6f78esFzdv7/8m7+9un93/ues/3b36+PH2TH8S8/2n373+8pc3725Od9XPf6P1
y+vc/43j00v/cvofvby9f1dn/Guc3770i3evX7/6cP+f/vwXvL9+Duc8LvPqwx9++PnT69dffvvu
/3rzKeLFGf/I6JeX+Lv7Pwn76u2f/4Dqn3/es7/S4+/nhxd3D7+hL0+/+S8+vrv79fSL+eb0b/ny
7C/4dfL/fKP7+qv66cP9nzk/11308W81u3+sry/B/7G+eaXL/GN984KX+Md6+MA+/OL+qR5fgP9D
fX2dy/wzfX25S/wjfThtZ17c/vDil4e//M3+qf7Jy/B/sL94tcv8s/3Fi17kH+/0U5x+sC9/h/u0
fXz8O/ZfB/37P3V//787z+ud/ttvT/9O37ykeZ3TqPFw539z8/bVz6ch48z7lt/fvntz+/H074/y
Pz+MQOHvHj6c/336yP+vFziNgz+ffiFOc9mL027wTD/L4z/0h1/fvH719g9n/mEeLzsvP93dT3X/
5I++n6a+P57m6A/gcv7uw8cfHsbzN58+3nyzXD4/1vl6WTrj/uMv9wVfXu/Dx5vX9/9ep0vTq/en
xfzlX/Dvf/rxH/5tr/z4n/7Hl//y3765vfnw6XRhu//s7v/r/+dv/uYv3uQ3v0uni8Wbx6cFP7y/
efGH25c//MXDv3/uhR+Tvvyof3vaFLx5eK3//m/bM929+9OH00fw8ebV/Sd/+lg+3P/yvrt7eXt3
puvUq9OP8vGbjcP93uzFzYvTv+7vb9/e3p3xl+m0EXtx+/r16f0/vujjzuzxJn7GLfJpdDv9gnz5
zbl/snN3/wzyw9meP756+3gZ+bxb/tPNh9PN6lwr/ea0wfr55tU3H9Sf3t394XQpe7w7n/Vf4/Oi
fnl3+gU7fVKny8qvz9796f437/Nr5mvla+Vr5Wvla+Vr5Wvla53hidrt4/e2H25v3tzPZrd3ZKQ5
bfjf34/O728fduH/6e//y3/7r5feJ7z9/d3Nmx9Os/XPt6f90Q+fpzmzX/jPf/+f/+Gevnjx7tNp
53Smr+S+hL5/9/5cX2H90/cZ53+fRbzPcv73WcX7rOd/n028z3b+99nF++znf59DvM9x/vc5xfuc
53+fS7zPdf73ucX73OA6/5xc6MUdydySwD0pyE0pwF0pyG0pwH0pyI0pwJ0pyK0pwL0pyM0pwN0p
yO0pwP0pyA0qwB0qyC0qwD2qkHtUAfeoQu5RReybzMYJ3KMKuUcVcI8q5B517tSHBz/njbx98/7j
r2f+2V/f3tz99OPd7acPt2dMnuKRyRTPN6Z4GDHFk4MptvlT7Mmn2EDP82+gp9hAz/NvoKfYQM/z
b6Cn2EBPsIGeZAM9wQZ6kg30BBvoSTbQE2ygJ9lAT7CBnmQDPcEGepIN9AQb6Ek20BNsoCfZQE+w
gZ5kAz3BBnqSDfQEG+hJNtATbKAn2UBPsIGeZAM9wQZ6kg30BBvoSTbQX94puUcVcI8q5B5VwD2q
kHtUAfeoQu5RBdyjCrlHFXCPquQeVcE9qpJ7VAX3qGqeHYF7VCX3qAruUZXcoyq4R1Vyj6rgHlXJ
PaqCe1Ql96gK7lGV3KMquEdVco+q4B7VyD2qgXtUI/eoBu5RjdyjGrhHNfOlCbhHNXKPauAe1cg9
qoF7VCP3qAbuUY3coxq4RzVyj2rgHtXIPaqBe1Qn96gO7lGd3KM6uEd1co/q4B7VyT2qg3tUN6cF
zpx67sMyGfkdRp77eNRkx6MqqZRVUgCrpK5VSbmqkipUJcWlSmpGlZSCKqnwVFK4qaYdU02VpZre
STUlkWoaHdXUL6rpSlRTbKimhVBNZaCa8/3VHMav5uR8NcfcqzmT/k2sWWXFrLJiVlkxq6yYVVbP
vcrO/g3rbysUfBn8TSyalKv4ZNt3Gwq+Ev4m1lxj6xCf7PxuQ8EXw9/EmltM3eCTbc+/21Dw9fA3
seYW04r4ZOt3Gwq+JP4m1txiWhef7PhuQ8FXxd/EmltMW+KT3d9tKPjC+JvHx+YW08WOq5fvNhR8
bfxNrLnFdLHj6v27DX38VFGsucV0sePq67sNffxUUay5xQyx4xrx3YY+fqoo1txihthxjfbdhj5+
qigWnSkQO64xv9vQx08VxZpbzBA7rvn8uw19PFeDYs0tZood16zfbejjp4pizS1mih3XHN9t6OOn
imLNLWaKHdfc323o46dqYpe5xSyx41rluw19/FRRrLnFLLHjWv27DX38VFGsucUsseNa67sNffxU
Uay5xWyx49rx3YY+fqoo1txitthx7fbdhj5+qijW3GK22HHt+d2GPn6qKBa1r8SOK54//45TvxTQ
VC6qoD0v5NOt33Hql09W5aIe3vNOPt3xHad++WRVLiojPl/k093fceqXTxblst6z2IlFlO849csn
q3LRXSca+XT7d5z65ZNVueiuE5N8uus7Tv3yyapcdNcpZGdW4jtO/fLJqlx01ylkZ1bad5z65ZNV
ueiuU8jOrMzvOPXLJ6ty0V2nkJ0ZUTF+K6lffCeVi+46lezMiI3xW0n98smqXHTXqWRnRoSM30rq
l09W5aK7TiU7s7q/49QvnyzKRVpGNLIzI1rGbyX1yyerchUwSXZmxMz4raR++WRVLrrrNLIzI3LG
byX1yyerctFdp5OdGfEzfiupXz5ZlYvuOp3szIii8VtJ/fLJqlx01+lkZ0Ysjd9K6pdPVuWiu04n
OzMiavxWUr/w6SoX3XUG2ZkRV+O3kvrlk1W56K4zyM6M6Bq/ldQvn6zKRXedQXZmY3/HqV8+WZSL
pI2YZGdGpI3fSuqXT1blorvO2cGNc/9Vs8zMzMzMzMzMzMzMzMz895N57j9X+zDXmr9XO9pz8Qdr
v4kNE1tMbDWxzcR2EztM7DSxy8RutBzUMkPrLNBCC7TSAi21QGst0GILtNoCLbdA662g9VbUfQ2t
t4LWW0HrraD1VtB6K2i9FbTeClpvFa23itZbVYMkWm8VrbeK1ltF662i9VbReqtovTW03hpabw2t
t6Z2bmi9NbTeGlpvDa23htZbQ+uto/XW0XrraL11tN66elSC1ltH662j9dbReutovQ203gZabwOt
t4HW20Drbahnk2i9DbTeBlpvA623idbbROttovU20XqbaL1NtN6m+jIArbeJ1ttE622h9bbQelto
vS203hZabwutt4XW21LfvqH1ttB622i9bbTeNlpvG623jdbbRutto/W20Xrb6utu9n23+sL7ufrG
+7n6yvu5+s77ufrS+7n61vu5+tr7ufre+7n64vu5WnnuqIlaeeywCTttwo6bsPMm7MAJO3HCjpyo
MyehDp1EYae81MpT505CHTwJdfIk1NGTUGdPQh0+CXX6JNTxk1DnT6KyA5Zq5akjKKHOoIQ6hBLq
FEqoYyihzqGEOogS6iRKqKMo0djZZrXy1GmUUMdRQp1HCXUgJdSJlFBHUkKdSQl1KCXUqZTorFag
Vp46mBLqZEqooymhzqaEOpwS6nRKqOMpoc6nhDqgEoM1etTKU2dUQh1SCXVKJdQxlVDnVEIdVAl1
UiXUUZVQZ1VisjKdWnnquEqo8yqhDqyEOrES6shKqDMroQ6thDq1EurYSizWY1UrT51cCXV0JdTZ
lVCHV0KdXgl1fCXU+ZVQB1hCnWCJzSrkrEOuSuTqDEtRZ1iKOsNS1BmWos6wFHWGpagzLEWdYSnq
DEsJxjeolafOsBR1hqWoMyxFnWEp6gxLUWdYijrDUpibwuAUJ6eolcfsFIanMD2F8SnMT2GAijrD
UtQZlqLOsJTK0CK18tQZlqLOsBR1hqWoMyxFnWEp6gxLUWdYijrDUtQZltKYF6ZWnjrDUtQZlqLO
sBR1hqWoMyxFnWEp6gxLUWdYijrDUjqj+tTKU2dYijrDUtQZlqLOsBR1hqWoMyxFnWEp6gxLUWdY
ymBKplp56gxLUWdYijrDUtQZlqLOsBR1hqWoMyxFnWEp6gxLmQyoVStPnWEp6gxLUWdYijrDUtQZ
lqLOsBR1hqWoMyxFnWEpi9nQauWpMyxFnWEp6gxLUWdYijrDUtQZlqLOsBR1hqWoMyxlM5aduewK
ZldnWKo6w1LVGZaqzrBUdYalqjMsVZ1hqeoMS1VnWGqwP4mgVp46w1LVGZaqzrBUdYalqjMsVZ1h
qeoMS1VnWKo6w1IL+2skauWpMyxVnWGp6gxLVWdYqjrDUtUZlsr+ChD7M0Ds7wC5PwSkVh77U0Ds
bwGxPwbE/hoQ+3NA6gxLVWdYqjrDUtUZltrY3+BSK0+dYanqDEtVZ1iqOsNS1RmWqs6wVHWGpaoz
LFWdYamd/fk7tfLUGZaqzrBUdYalqjMsVZ1hqeoMS1VnWKo6w1LVGZY62F+eVCtPnWGp6gxLVWdY
qjrDUtUZlqrOsFR1hqWqMyxVnWGpk/3RV7Xy1BmWqs6wVHWGpaozLFWdYanqDEtVZ1iqOsNS1RmW
utjfW1YrT51hqeoMS1VnWKo6w1LVGZaqzrBUdYalqjMsVZ1hqZv9qXP2t87VHztXZ1iaOsPS1BmW
ps6wNHWGpakzLE2dYWnqDEtTZ1iaOsPS1BmWps6wNHWGpakzLE2dYWnqDEtTZ1iaOsPS1BmWps6w
NHWGpakzLE2dYWnqDEtTZ1iaOsPS1BmWps6wNHWGpakzLE2dYWnqDEtTZ1iaOsPS1BmWps6wNHWG
pakzLE2dYWnqDEtTZ1iaOsPS1BmWps6wNHWGpakzLE2dYWnqDEtTZ1iaOsPS1BmWps6wNHWGpakz
LE2dYWnqDEtTZ1iaOsPS1BmWps6wNHWGpakzLE2dYWnqDEtTZ1iaOsPS1BmWps6wNHWGpakzLE2d
YWnqDEtTZ1iaOsPS1BmWps6wNHWGpakzLE2dYWnqDEtTZ1iaOsPS1BmWps6wNHWGpakzLE2dYWnq
DEtTZ1iaOsPS1BmWps6wNHWGpakzLE2dYWnqDEtTZ1iaOsPS1BmWrs6wdHWGpaszLF2dYenqDEtX
Z1i6OsPS1RmWrs6wdHWGpaszLF2dYenqDEtXZ1i6OsPS1RmWrs6wdHWGpaszLF2dYenqDEtXZ1i6
OsPS1RmWrs6wdHWGpaszLF2dYenqDEtXZ1i6OsPS1RmWrs6wdHWGpaszLF2dYenqDEtXZ1i6OsPS
1RmWrs6wdHWGpaszLF2dYenqDEtXZ1i6OsPS1RmWrs6wdHWGpaszLF2dYenqDEtXZ1i6OsPS1RmW
rs6wdHWGpaszLF2dYenqDEtXZ1i6OsPS1RmWrs6wdHWGpaszLF2dYenqDEtXZ1i6OsPS1RmWrs6w
dHWGpaszLF2dYenqDEtXZ1i6OsPS1RmWrs6wdHWGpaszLF2dYenqDEtXZ1i6OsPS1RmWrs6wdHWG
paszLF2dYenqDEtXZ1i6OsPS1RmWrs6wdHWGpaszLF2dYRnqDMtQZ1iGOsMy1BmWoc6wDHWGZagz
LEOdYRnqDMtQZ1iGOsMy1BmWoc6wDHWGZagzLEOdYRnqDMtQZ1iGOsMy1BmWoc6wDHWGZagzLEOd
YRnqDMtQZ1iGOsMy1BmWoc6wDHWGZagzLEOdYRnqDMtQZ1iGOsMy1BmWoc6wDHWGZagzLOP8Z1je
v3t//x8yNmMzNmMzNmMzNmMzNmMzNmMzNmMzNmMzNmMzNmMz9mCxjw+GXbD65kR1EIfqIA7VQRyq
gzhUB3GoDuJQHcShOohDdRCH6iAO1UEcqoM4VAdxqA7iUB3EoTqIQ3UQh+ogDtVBHKqDOFQHcagO
4lAdxKE6iEN1EIfqIA7VQRyqgzhUB3GoDuJQHcShOohDdRCH6iAO1UEcqoM4VAdxqA7iUB3EoTqI
Q3UQh+ogDtVBHKqDOFQHcagO4lAdxKE6iEN1EIfqIA7VQRyqgzhUB3GoDuJQHcShOohDdRCH6iBO
1UGcqoM4VQdxnr+DeP9Yep6/gZixGZuxGZuxGZuxGZuxGZuxGZuxGZuxGZuxGZuxGZuxZ3owzIK7
Ch4qeKrgpYLVNyfKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvK
kJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvKkJvq7yBO1UGcqoM4VQdxqg7i
VB3EqTqIU3UQp+ogTtVBnKqDOFUHcaoO4lQdxKk6iFN1EKfqIE7VQZyqgzhVB3GqDuJUHcSpOohT
dRCn6iBO1UGcqoM4VQdxnr+D+PBY+vwNxIzN2IzN2IzN2IzN2IzN2IzN2IzN2IzN2IzN2IzN2Iw9
04NhFqy+OVGG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG
3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FSG3FKG3FKG3FKG3HpeVXBTwV0F
DxU8VfBSwWrlqQ7iUh3EpTqIS3UQl+ogLtVBXKqDuFQHcakO4lIdxKU6iEt1EJfqIC7VQVyqg7hU
B3GpDuJSHcSlOohLdRCX6iCu83cQ7x9Lr/M3EDM2YzM2YzM2YzM2YzM2YzM2YzM2YzM2YzM2YzM2
YzP2TA+GWbD65kQZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZ
cksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcksZcmuolac6
iEt1EJfqIC7VQVyqg7hUB3GpDuJSHcSlOohLdRCX6iAu1UFcqoO4VAdxqQ7iUh3EpTqIS3UQl+og
LtVBXKqDuFQHcakO4lIdxKU6iEt1EJfqIK7zdxAfHkufv4GYsRmbsRmbsRmbsRmbsRmbsRmbsRmb
sRmbsRmbsRmbsWd6MMyC1TcnypBbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDb
ypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDbypDb
ypDbVa081UHcqoO4VQdxqw7iVh3ErTqIW3UQt+ogbtVB3KqDuFUHcasO4lYdxK06iFt1ELfqIG7V
Qdyqg7hVB3GrDuJWHcStOohbdRC36iBu1UHcqoO4VQdxn7+DeP9Yep+/gZixGZuxGZuxGZuxGZux
GZuxGZuxGZuxGZuxGZuxGZux53kw7ILVNyfKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvK
kNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvKkNvK
kNvKkNvKkNvKkNtbrTzVQdyqg7hVB3GrDmI8VyXEU3Kw5MKSK0tuLLmz5MGSJ0teLJmtwWBrMNga
DLYGg63BYGsw2BoMtgaDrcFgazDYGixsDRa2Bgtbg+fvJt4/rj7ltszN3MzN3MzN3MzN3MzN3MzN
3MzN3MzN3MzN3MzN3Mz995X79cmyS2bfwRT2HUxh38EU9h1MYd/BVPYdTGXfwVT2HUxl34NWtgYr
W4OVrcHK1mBla7CyNdjYGmxsDTa2Bhtbg42twcbWYGNrsLE12NgabGwNdrYGO1uDna3BztZgZ2uw
szXY2RrsbA12tgY7W4ODrcHB1uBga3CwNTjYGhxsDQ62Bgdbg4OtwcHW4GRrcLI1ONkanGwNTrYG
J1uDk63BydbgZGtwsjW42BpcbA0utgYXW4OLrcHF1uBia/D83cjPz7XPX43M3MzN3MzN3MzN3MzN
3MzN3MzN3MzN3MzN3MzN3MzN3Ovmfn2y7JLZdzCbfQez2Xcwm30Hs9l3MJt9B7PZdzCbfQez2feg
m61B5uQFc/KCOXnBnLxgTl4wJy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5
wZy8YE5eMCcvmJMXzMmLwtYg60kG60kG60kG60kG60kG60kG60kG60kG60kG60kG60kG60kG60kG
60kG60kG60kG60kG60kG60kG60kG60kG60kG60kG60kG60kG60kG60nG+XuSD8+14/wtyczN3MzN
3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3My9bu7XJ8sumX0Hw5y8YE5eMCcvmJMXzMkL5uQFc/KC
OXnBnLxgTl4wJy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5wZy8YE5eMCcv
mJMXzMkL5uQFc/KCOXnBnLxYbA2ynmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmRh
PcnCepKF9SQL60kW1pMsrCdZWE+ysJ5kYT3JwnqShfUkC+tJFtaTLKwnWVhPspy/J/nwXLucvyWZ
uZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbudfN/fpk2SWz72CYk1eYk1eYk1eYk1eYk1eY
k1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eY
k1eYk1eYk1eYk1eYk1eYk1eYk1eYk1eYk1c6W4OsJ1lYT7KwnmRhPcnCepKF9SQL60kW1pMsrCdZ
WE+ysJ5kYT3JwnqShfUkC+tJFtaTLKwnWVhPsrCeZGE9ycJ6koX1JAvrSRbWkyysJ1lYT7KwnmQ5
f0/y83Pt87ckMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzM/e6uV+eLMNk9h0Mc/IKc/IK
c/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/Iqc/Iqc/Iqc/Iq
c/Iqc/Iqc/Iqc/Iqc/Iqc/Iqc/Iqc/Iqc/Iqc/Iqc/Iqc/JqsDXIepKV9SQr60lW1pOsrCdZWU+y
sp5kZT3JynqSlfUkK+tJVtaTrKwnWVlPsrKeZGU9ycp6kpX1JCvrSVbWk6ysJ1lZT7KynmRlPcnK
epKV9SQr60nW8/ckH55r1/O3JDM3czM3czM3czM3czM3czM3czM3czM3czM3czM3czP3urlfnyy7
ZPYdDHPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPy
KnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPy6mRrkPUkK+tJVtaT
rKwnWVlPsrKeZGU9ycp6kpX1JCvrSVbWk6ysJ1lZT7KynmRlPcnKepKV9SQr60lW1pOsrCfZWE+y
sZ5kYz3JxnqSjfUkG+tJNtaTbOfvST48127nb0lmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZm
buZm7nVzvz5ZdsnsOxjm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm
5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5DXm5LXG
1iDrSTbWk2ysJ9lYT7KxnmRjPcnGepKN9SQb60k21pNsrCfZWE+ysZ5kYz3JxnqSjfUkG+tJNtaT
bKwn2VhPsrGeZGM9ycZ6ko31JBvrSTbWk2ysJ9nO35P8/Fz7/C3JzM3czM3czM3czM3czM3czM3c
zM3czM3czM3czM3czL1u7tcnyy6ZfQfDnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzG
nLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzGnLzOnLzOnLzOnLzOnLzO
nLzOnLzOnLz+fLLkxZLZGmQ9yc56kp31JDvrSXbWk+ysJ9lZT7KznmRnPcnOepKd9SQ760l21pPs
rCfZWU+ys55kZz3JznqSnfUkO+tJdtaT7Kwn2VlPsrOeZGc9yX7+nuTDc+1+/pZk5mZu5mZu5mZu
5mZu5mZu5mZu5mZu5mZu5mZu5mZu5l439+uTZZfMvoNhTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5n
Tl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5n
Tl5nTl5nTl5nTl5nTl5nTl6fbA2ynmRnPcnOepKd9SQ760l21pPsrCfZWU+ys55kZz3JznqSnfUk
O+tJdtaT7Kwn2VlPsrOeZGc9yc56kp31JDvrSXbWk+ysJ9lZT7KznmRnPcnOepL9/D3Jh+fa4/wt
yczN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3My9bu7jk2WZHCy5sOTKkhtL7ix5sOTJkhdL
Vt+DDubkDebkDebkDebkDebkDebkDebkDebkDebkDebkDebkDebkDebkDebkDebkDebkDebkDebk
DebkDebkDebkDebkDebkDebkDebkjcrWIOtJDtaTHKwnOVhPcrCe5GA9ycF6koP1JAfrSQ7Wkxys
JzlYT3KwnuRgPcnBepKD9SQH60kO1pMcrCc5WE9ysJ7kYD3JwXqSg/UkB+tJDtaTHKwnOc7fk/z8
XPv8LcnMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMvW7u1yfLLpl9B8OcvMGcvMGcvMGc
vMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGc
vMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvMGcvLHVGpysJzlZT3KynuRkPcnJepKT9SQn60lO
1pOcrCc5WU9ysp7kZD3JyXqSk/UkJ+tJTtaTnKwnOVlPcrKe5GQ9ycl6kpP1JCfrSU7Wk5ysJzlZ
T3KynuQ8f0/y4bn2PH9LMnMzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3Ovm/v1ybJLZt/B
MCdvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidv
MidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvMidvDrYGWU9ysp7kZD3JyXqS
k/UkJ+tJTtaTnKwnOVlPcrKe5GQ9ycl6kpP1JCfrSU7Wk5ysJzlZT3KynuRkPcnJepKT9SQn60lO
1pOcrCc5WU9ysp7kZD3Jef6e5Ofn2udvSWZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mbu
dXO/Pll2yew7GObkTebkTebkTebkTebkTebkLebkLebkLebkLebkLebkLebkLebkLebkLebkLebk
LebkLebkLebkLebkLebkLebkLebkLebkLebkLebkLebkLebkLebkLebkLebkLebkLebkrcLWIOtJ
LtaTXKwnuVhPcrGe5GI9ycV6kov1JBfrSS7Wk1ysJ7lYT3KxnuRiPcnFepKL9SQX60ku1pNcrCe5
WE9ysZ7kYj3JxXqSi/UkF+tJLtaTXKwnuc7fk3x4rr3O35LM3MzN3MzN3MzN3MzN3MzN3MzN3MzN
3MzN3MzN3MzN3Ovmfn2y7JLZdzDMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvM
yVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvMyVvM
yVvMyVubrUHWk1ysJ7lYT3KxnuRiPcnFepKL9SQX60lu1pPcrCe5WU9ys57kZj3JzXqSm/UkN+tJ
btaT3KwnuVlPcrOe5GY9yc16kpv1JDfrSW7Wk9ysJ7lZT3Kfvyf58Fx7n78lmbmZm7mZm7mZm7mZ
m7mZm7mZm7mZm7mZm7mZm7mZm7nXzf3yZBkms+9gmJO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3
mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3mZO3
mZO3mZO3mZO3mZO3mZO3O1uDrCe5WU9ys57kZj3JzXqSm/UkN+tJbtaT3KwnuVlPcrOe5GY9yc16
kpv1JDfrSW7Wk9ysJ7lZT3KznuRmPcnNepKb9SQ360lu1pPcrCe5WU9ys57kPn9P8vNz7fO3JDM3
czM3czM3czM3czM3czM3czM3czM3czM3czM3czP3urlfnyy7ZPYdDHPyNnPyNnPyNnPyNnPyNnPy
NnPyNnPyNnPyNnPyNnPyNnPyNnPytnLyynPl5J2SgyUXllxZcmPJnSUPljxZ8mLJbA0GW4PB1mCw
NRhsDQZbg8HWYLA1GGwNBluDwdZgYWuwsDVY2BosbA0WtgYLW4OFrcHC1mBha7CwNVjZGqxsDVa2
Bitbg5WtwcrWYGVrsLI1WNkarGwNNrYGG1uDja3BxtZgY2uwsTXY2Bo8f0/y/rn2KXdlbuZmbuZm
buZmbuZmbuZmbuZmbuZmbuZmbuZmbuZm7r+v3K9Pll0y+w6ms+9gOvsOprPvYDr7Dqaz72A6+w6m
s+9gOvsetLM12NkaHGwNDrYGB1uDg63BwdbgYGtwsDU42BocbA0OtgYnW4OTrcHJ1uBka3CyNTjZ
GpxsDU62Bidbg5OtwcXW4GJrcLE1uNgaXGwNLrYGF1uDi63BxdbgYmtwszW42RrcbA1utgY3W4Ob
rcHN1uBma3CzNch6ksF6ksF6ksF6ksF6ksF6ksF6ksF6ksF6ksF6ksF6ksF6knH+nuTDc+04f0sy
czM3czM3czM3czM3czM3czM3czM3czM3czM3czM3c6+b+/XJsktm38EwJy+YkxfMyQvm5AVz8oI5
ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5wZy8YE5eMCcvmJMXzMkL5uQFc/KCOXnBnLxgTl4wJy+Y
kxfMyQvm5AVz8oI5ecGcvGBOXjAnLxpbg6wnGawnGawnGawnGawnGawnGawnGawnGawnGawnGawn
GawnGawnGawnGawnGawnGawnGawnGawnGawnGawnGawnGawnGawnGawnGawnGawnGefvSX5+rn3+
lmTmZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mXjf365Nll8y+g2FOXjAnL5iTF8zJC+bk
BXPygjl5wZy8YE5eMCcvmJMXzMkL5uQFc/KCOXnBnLxgTl4wJy+YkxfMyQvm5AVz8gpz8gpz8gpz
8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8kqwNch6koX1JAvrSRbWkyysJ1lYT7KwnmRhPcnCepKF
9SQL60kW1pMsrCdZWE+ysJ5kYT3JwnqShfUkC+tJFtaTLKwnWVhPsrCeZGE9ycJ6koX1JAvrSZbz
9yQfnmuX87ckMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzM/e6uV+eLMNk9h0Mc/IKc/IK
c/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IK
c/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/IKc/LKZGuQ9SQL60kW1pMsrCdZWE+ysJ5k
YT3JwnqShfUkC+tJFtaTLKwnWVhPsrCeZGE9ycJ6koX1JAvrSRbWkyysJ1lYT7KwnmRhPcnCepKV
9SQr60lW1pOs5+9JPjzXrudvSWZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mbudXO/Pll2
yZ0lD5Y8WfJiyew7GObkVebkVebkVebkVebkVebkVebkVebkVebkVebkVebkVebkVebkVebkVebk
VebkVebkVebkVebkVebkVebkVebkVebkVebkVebkVebkVebkVebkVebk1crWIOtJVtaTrKwnWVlP
srKeZGU9ycp6kpX1JCvrSVbWk6ysJ1lZT7KynmRlPcnKepKV9SQr60lW1pOsrCdZWU+ysp5kZT3J
ynqSlfUkK+tJVtaTrKwnWc/fk/z8XPv8LcnMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzM
vW7u1yfLLpl9B8OcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqc
vMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMqcvMacvMacvMacvPa8suTG
kjtLHix5suTFktkaZD3JxnqSjfUkG+tJNtaTbKwn2VhPsrGeZGM9ycZ6ko31JBvrSTbWk2ysJ9lY
T7KxnmRjPcnGepKN9SQb60k21pNs5+9JPjzXbudvSWZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu
5mZu5mbudXO/Pll2yew7GObkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebk
NebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebkNebk
tcHWIOtJNtaTbKwn2VhPsrGeZGM9ycZ6ko31JBvrSTbWk2ysJ9lYT7KxnmRjPcnGepKN9SQb60k2
1pNsrCfZWE+ysZ5kYz3JxnqSjfUkG+tJNtaTbKwn2c7fk/z8XPv8LcnMzdzMzdzMzdzMzdzMzdzM
zdzMzdzMzdzMzdzMzdzMvW7u1yfLLpl9B8OcvMacvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6c
vM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6cvM6c
vM6cvM6cvM6cvF7ZGmQ9yc56kp31JDvrSXbWk+ysJ9lZT7KznmRnPcnOepKd9SQ760l21pPsrCfZ
WU+ys55kZz3JznqSnfUkO+tJdtaT7Kwn2VlPsrOeZGc9yc56kp31JPv5e5IPz7X7+VuSmZu5mZu5
mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mXvd3C9PlmEy+w6GOXmdOXmdOXmdOXmdOXmdOXmdOXmd
OXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmd
OXmdOXmdOXmdOXmdOXmdOXmdOXl9szXIepKd9SQ760l21pMcrCc5WE9ysJ7kYD3JwXqSg/UkB+tJ
DtaTHKwnOVhPcrCe5GA9ycF6koP1JAfrSQ7WkxysJzlYT3KwnuRgPcnBepKD9SQH60mO8/ckH55r
j/O3JDM3czM3czM3czM3czM3czM3czM3czM3czM3czM3czP3urlfnyy7ZPYdDHPyBnPyBnPyBnPy
BnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPy
BnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyRmdrkPUkB+tJDtaTHKwnOVhPcrCe5GA9ycF6
koP1JAfrSQ7WkxysJzlYT3KwnuRgPcnBepKD9SQH60kO1pMcrCc5WE9ysJ7kYD3JwXqSg/UkB+tJ
DtaTHOfvSX5+rn3+lmTmZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mXjf365Nll8y+g2FO
3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mRO3mRO3mRO3mRO3mRO3mRO3mRO3mRO3mRO3mRO
3mRO3mRO3mRO3mRO3mRO3mRO3mRO3mRO3mRO3mRO3mRO3mRO3mRO3ixsDbKe5GQ9ycl6kpP1JCfr
SU7Wk5ysJzlZT3KynuRkPcnJepKT9SQn60lO1pOcrCc5WU9ysp7kZD3JyXqSk/UkJ+tJTtaTnKwn
OVlPcrKe5GQ9ycl6kvP8PcmH59rz/C3JzM3czM3czM3czM3czM3czM3czM3czM3czM3czM3czL1u
7tcnyy6ZfQfDnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJ
nLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLzJnLy52BpkPcnJ
epKT9SQn60lO1pOcrCc5WU9ysp7kZD3JyXqSk/UkJ+tJLtaTXKwnuVhPcrGe5GI9ycV6kov1JBfr
SS7Wk1ysJ7lYT3KxnuRiPcnFepKL9STX+XuSD8+11/lbkpmbuZmbuZmbuZmbuZmbuZmbuZmbuZmb
uZmbuZmbuZl73dyvT5ZdMvsOhjl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5
izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5
izl5q7M1yHqSi/UkF+tJLtaTXKwnuVhPcrGe5GI9ycV6kov1JBfrSS7Wk1ysJ7lYT3KxnuRiPcnF
epKL9SQX60ku1pNcrCe5WE9ysZ7kYj3JxXqSi/UkF+tJrvP3JD8/1z5/SzJzMzdzMzdzMzdzMzdz
MzdzMzdzMzdzMzdzMzdzMzdzr5v75ckyTGbfwTAnbzEnbzEnbzEnbzEnbzEnbzEnbzEnbzEnbzEn
bzEnbzEnbzEnbzEnbzEnbzEnbzEnbzEnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMn
bzMnbzMnbzMnbzMnbwdbg6wnuVlPcrOe5GY9yc16kpv1JDfrSW7Wk9ysJ7lZT3KznuRmPcnNepKb
9SQ360lu1pPcrCe5WU9ys57kZj3JzXqSm/UkN+tJbtaT3KwnuVlPcrOe5D5/T/LhufY+f0syczM3
czM3czM3czM3czM3czM3czM3czM3czM3czM3c6+b+/XJsktm38EwJ28zJ28zJ28zJ28zJ28zJ28z
J28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28z
J28zJ28zJ28zJ28zJ28zJ28zJ28zJ29PtgZZT3KznuRmPcnNepKb9SQ360lu1pPcrCe5WU9ys57k
Zj3JzXqSm/UkN+tJbtaT3KwnuVlPcrOe5GY9ya16kvW56kmekoMlF5ZcWXJjyZ0lD5Y8xXPtU+7K
3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3H9fuV+fLLtk9h1MsO9ggn0HE+w7mGDfwQT7
DibYdzDBvoNRTt4pma3BYGuwsDVY2BosbA0WtgYLW4OFrcHC1mBha7CwNVjYGqxsDVa2Bitbg5Wt
wcrWYGVrsLI1WNkarGwNVrYGG1uDja3BxtZgY2uwsTXY2BpsbA02tgYbW4ONrcHO1mBna7CzNdjZ
GuxsDXa2Bjtbg52twc7WYGdrcLA1ONgaHGwNDrYGB1uDg63BwdbgYGtwsDU42BqcbA2evyf5+bn2
+VuSmZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mXvd3K9Pll0y+w5msu9gJvsOZrLvYCb7
Dmay72Am+w5mse9gFvsedLE1uNgaXGwNLrYGF1uDi63BxdbgYmtwszW42RrcbA1utgY3W4ObrcHN
1uBma3CzNcicvGBOXjAnL5iTF8zJC+bkBXPygjl58Xyy5MWS2RpkPclgPclgPclgPclgPclgPclg
PclgPclgPclgPclgPclgPclgPclgPclgPclgPclgPclgPclgPclgPclgPclgPclgPclgPclgPck4
f0/y4bl2nL8lmbmZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7nXzf36ZNkls+9gmJMXzMkL
5uQFc/KCOXnBnLxgTl4wJy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5wZy8
YE5eMCcvmJMXzMkL5uQFc/KCOXnBnLxgTl4wJy+YkxeTrUHWkwzWkwzWkwzWkwzWkwzWkwzWkwzW
kwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzW
k4zz9yQfnmuX87ckMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzM/e6uY9PlmVysOTCkitL
biy5s+TBkidLXixZfQ9amJNXmJNXmJNXmJNXmJNXmJNXmJNXmJNXmJNXzu/kvby7efU2QzM0QzM0
QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0
QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0
QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0
QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0
QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0QzM0
QzMUhd6+ef/x13OHvnh9e3P30493t58+3J4n+8Prdx+fvXr78vYfn53yn//043OUGyi3oNyKchvK
7Sh3iNxAv2eBfs8C/Z4F+j0L9HsW6Pcs0O9ZQb9nBf2eFfR7VtDvWUG/ZwX9nhX0e/ZDuBvnD+Q3
rbo3PM+eG2gyCTSZBJpMAk0mgSaTQJNJoMkk0GQSaDIJNJkEmkwCTSaBJpNAk0mgySTQZBJoMgk0
mQSaTAJNJoEmk1CTSajJJNBkEmgyKWgyKWgyKWgyKWgyKWgyKWgyKWgyKWgyKWgyKWgyKWgyKWgy
KWgyKWgyKWgyKWgyKWgyKWgyKWgyKWgyKWgyKWoyKWoyKWgyKWgyqWgyqWgyqWgyqWgyqWgyqWgy
qWgyqWgyqWgyqWgyqWgyqWgyqWgyqWgyqWgyqWgyqWgyqWgyqWgyqWgyqWgyqWoyqWoyqWgyqWgy
aWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgyaWgy
aWgyaWgyaWoyaWoyaWgyaWgy6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy
6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy6Wgy6Woy6Woy6Wgy6WgyGWgyGWgyGWgyGWgyGWgyGWgyGWgy
GWgyGWgyGWgyGWgyGWgyGWgyGWgyGWgyGWgyGWgyGWgyGWgyGWgyGWgyGWoyGWoyGWgyGWgymWgy
mWgymWgymWgymWgymWgymWgymWgymWgymWgymWgymWgymWgymWgymWgymWgymWgymWgymWgymWgy
mWgymWoymWoymWgymWgyWWgyWWgyWWgyWWgyWWgyWWgyWWgyWWgyWWgyWWgyWWgyWWgyWWgyWWgy
WWgyWWgyWWgyWWgyWWgyWWgyWWgyWWoyWWoyWWgyWWgy2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy
2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy2Wgy2Woy2Woy2Wgy2UpaUwhsKAU2
FAMbyoENBcGGkmBDUbChLNhQGGwoDTYUBxvKgw0FwoYSYUORsKFM2FAobCgVNhQLG8qFDQXDBpNh
g9GwoWzYYDgs02EZD8t8WAbEMiGWEbHMiGVILFNiGRPLnFgGxTIpllGxzIplWCzTYhkXy7xYBsYy
MdaRsc6MZWisUmNDsbGh3NhQcGwoOTYUHRvKjg2Fx4bSY0PxsaH82FCAbChBNhQhG8qQDYXIhlJk
QzGyoRzZUJBsKEk2FCUbzJINhsmG0mRDcbKhPNlQoGwoUTYUKRvKlA2FyoZSZUOxsqFc2VCwbChZ
NhQtG8qWDYXLhtJlQ/GyoXzZUMBsKGE2FDEbypgNhswGU2ZDMbOhnNlQ0GwoaTYUNRvKmg2FzYbS
ZkNxs6G82VDgbChxNhQ5G8qcDYXOhlJnQ7GzodzZUPBsKHk2FD0byp4Nhc8G02eD8bOh/NlQAG0o
gTYUQRvKoA2F0IZSaEMxtKEc2lAQbSiJNhRFG8qiDYXRhtJoQ3G0oTzaUCBtKJE2FEkbyqQNhdKG
UmmDsbTBXNpQMG0omTYUTRvKpg2F04bSaUPxtKF82lBAbSihNhRRG8qoDYXUhlJqQzG1oZzaUFBt
KKk2FFUbyqoNhdWG0mpDcbXBvNpgYG0osTYUWRvKrA2F1oZSa0OxtaHc2lBwbSi5NhRdG8quDYXX
htJrQ/G1ofzaUIBtKME2FGEbyrANhdiGUmxDMbahHNtgkG0wyTYUZRvKsg2F2YbSbENxtqE821Cg
bSjRNhRpG8q0DYXahlJtQ7G2oVzbULBtKNk2FG0byrYNhduG0m1D8bahfNtQwG0w4TYYcRvKuA2F
3IZSbkMxt6Gc21DQbSjpNhR1G8q6DYXdhtJuQ3G3obzbUOBtKPE2FHkbyrwNhd6GUm9Dsbeh3NtQ
8G0o+TYYfRvMvg2F34bSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vS
b4vSb4vSb4vSb4vSb4vSb4vSb4vSbwvTbwvTb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vS
b4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSbwvTbwvTb4vSb4vSb4vSb4vS
b4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vS
bwvTbwvTb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vS
b4vSb4vSb4vSb4vSb4vSb4vSbwvTbwvTb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vS
b4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSbwvTbwvTb4vSb4vSb4vSb4vSb4vS
b4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSbwvT
bwvTb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vS
b4vSb4vSb4vSb4vSb4vSbwvTbwvTb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vS
b4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSbwvTbwvTb4vSb4vSb4vSb4vSb4vSb4vS
b4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSbwvTbwvT
b4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vSb4vS
b4vSb4vSb4vSb4vSbwvTbwvTb4vSb4vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vS
b6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSbyvTbyvTb6vSb6vSb6vSb6vSb6vSb6vSb6vS
b6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSbyvTbyvTb6vS
b6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vS
b6vSb6vSb6vSbyvTbyvTb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vS
b6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSbyvTbyvTb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vS
b6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSbyvTbyvTb6vSb6vS
b6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vS
b6vSb6vSbyvTbyvTb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vS
b6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSbyvTbyvTb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vS
b6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSbyvTbyvTb6vSb6vSb6vS
b6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vS
b6vSbyvTbyvTb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vSb6vS
b6vSb6vSb6vSb6vSb6vSb6vSb6vSbyvTbyvTb6vSb6vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vS
b5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSbxvTbxvTb5vSb5vSb5vSb5vS
b5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vS
bxvTbxvTb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vS
b5vSb5vSb5vSb5vSb5vSb5vSbxvTbxvTb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vS
b5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSbxvTbxvTb5vSb5vSb5vSb5vSb5vS
b5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSbxvT
bxvTb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vS
b5vSb5vSb5vSb5vSb5vSbxvTbxvTb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vS
b5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSbxvTbxvTb5vSb5vSb5vSb5vSb5vSb5vS
b5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSbxvTbxvT
b5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vS
b5vSb5vSb5vSb5vSbxvTbxvTb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vS
b5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSb5vSbxvTbxvTb5vSb5vSb7vSb7vSb7vSb7vSb7vS
b7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSbzvTbzvTb7vS
b7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vS
b7vSb7vSb7vSbzvTbzvTb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vS
b7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSbzvTbzvTb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vS
b7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSbzvTbzvTb7vSb7vS
b7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vS
b7vSb7vSbzvTbzvTb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vS
b7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSbzvTbzvTb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vS
b7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSbzvTbzvTb7vSb7vSb7vS
b7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vS
b7vSbzvTbzvTb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vS
b7vSb7vSb7vSb7vSb7vSb7vSb7vSbzvTbzvTb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vS
b7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSb7vSbzvTbzvTb7vSb7vSb4fSb4fS
b4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fS
bwfTbwfTb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fS
b4fSb4fSb4fSb4fSb4fSb4fSbwfTbwfTb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fS
b4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSbwfTbwfTb4fSb4fSb4fSb4fSb4fS
b4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSbwfT
bwfTb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fS
b4fSb4fSb4fSb4fSb4fSbwfTbwfTb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fS
b4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSbwfTbwfTb4fSb4fSb4fSb4fSb4fSb4fS
b4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSbwfTbwfT
b4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fS
b4fSb4fSb4fSb4fSbwfTbwfTb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fS
b4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSbwfTbwfTb4fSb4fSb4fSb4fSb4fSb4fSb4fS
b4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSb4fSbwfTbwfTb4fS
b4fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fS
b6fSb6fSb6fSbyfTbyfTb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fS
b6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSbyfTbyfTb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fS
b6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSbyfTbyfTb6fSb6fS
b6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fS
b6fSb6fSbyfTbyfTb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fS
b6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSbyfTbyfTb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fS
b6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSbyfTbyfTb6fSb6fSb6fS
b6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fS
b6fSbyfTbyfTb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fS
b6fSb6fSb6fSb6fSb6fSb6fSb6fSbyfTbyfTb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fS
b6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSbyfTbyfTb6fSb6fSb6fSb6fS
b6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fSb6fS
byfTbyfTb6fSb6fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fS
b5fSb5fSb5fSb5fSb5fSb5fSbxfTbxfTb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fS
b5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSbxfTbxfTb5fSb5fSb5fSb5fSb5fS
b5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSbxfT
bxfTb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fS
b5fSb5fSb5fSb5fSb5fSbxfTbxfTb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fS
b5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSbxfTbxfTb5fSb5fSb5fSb5fSb5fSb5fS
b5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSbxfTbxfT
b5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fS
b5fSb5fSb5fSb5fSbxfTbxfTb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fS
b5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSbxfTbxfTb5fSb5fSb5fSb5fSb5fSb5fSb5fS
b5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSbxfTbxfTb5fS
b5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fSb5fS
b5fSb5fSb5fSbxfTbxfTb5fSb5fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fS
b7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSbzfTbzfTb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fS
b7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSbzfTbzfTb7fSb7fS
b7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fS
b7fSb7fSbzfTbzfTb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fS
b7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSbzfTbzfTb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fS
b7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSbzfTbzfTb7fSb7fSb7fS
b7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fS
b7fSbzfTbzfTb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fS
b7fSb7fSb7fSb7fSb7fSb7fSb7fSbzfTbzfTb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fS
b7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSbzfTbzfTb7fSb7fSb7fSb7fS
b7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fS
bzfTbzfTb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fSb7fS
b7fSb7fSb7fSb7fSb7fSb7fSbzfTbzfTb7fSb7fSb+O54m+/JAdLLiy5suTGkjtLHiY52G9dsN+6
YL91wX7rgv3WBfutC/ZbV9hvXWG/dYX91hX2W1fYb11hv3WF/db9EPIW+wP6vavyTYtZJtgsE2yW
CTbLBJtlgs0ywWaZYLNMsFkm2CwTbJYJNssEm2WCzTLBZplgs0ywWSbYLBNslgk2ywSbZYLNMuFm
mXCzTLBZJtgsU9gsU9gsU9gsU9gsU9gsU9gsU9gsU9gsU9gsU9gsU9gsU9gsU9gsU9gsU9gsU9gs
U9gsU9gsU9gsU9gsU9gsU9wsU9wsU9gsU9gsU9ksU9ksU9ksU9ksU9ksU9ksU9ksU9ksU9ksU9ks
U9ksU9ksU9ksU9ksU9ksU9ksU9ksU9ksU9ksU9ksU9ksU90sU90sU9ksU9ks09gs09gs09gs09gs
09gs09gs09gs09gs09gs09gs09gs09gs09gs09gs09gs09gs09gs09gs09gs09gs09gs09ws09ws
09gs09gs09ks09ks09ks09ks09ks09ks09ks09ks09ks09ks09ks09ks09ks09ks09ks09ks09ks
09ks09ks09ks09ks090s090s09ks09ksM9gsM9gsM9gsM9gsM9gsM9gsM9gsM9gsM9gsM9gsM9gs
M9gsM9gsM9gsM9gsM9gsM9gsM9gsM9gsM9gsM9gsM9wsM9wsM9gsM9gsM9ksM9ksM9ksM9ksM9ks
M9ksM9ksM9ksM9ksM9ksM9ksM9ksM9ksM9ksM9ksM9ksM9ksM9ksM9ksM9ksM9ksM90sM90sM9ks
M9kss9gss9gss9gss9gss9gss9gss9gss9gss9gss9gss9gss9gss9gss9gss9gss9gss9gss9gs
s9gss9gss9gss9wss9wss9gss9gss9kss9kss9kss9kss9kss9kss9kss9kss9kss9kss9kss9ks
s9kss9kss9kss9kss9kss9kss9kss9kss9kss90ss90ss9ksw9zfYO5vMPc3mPsbzP0N5v4Gc3+D
ub/B3N9g7m8w9zeY+/v/03YvKZYdaRZGpxIDKMH9n2Y2HFHyhkCPIKVq1OyLhMxGVjvWBA6m4KBv
u/u1dYO5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfcO5vOPc3mPsbzP0N5v4Gc3+Dub/B3N9g
7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vOPc3nPsbzP0N
5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzf
YO5vMPc3nPsbzv0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9
Deb+BnN/g7m/wdzfYO5vMPc3mPsbzv0N5/4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc
32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5/6Gc3+Dub/B3N9g7m8w9zeY+xvM
/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v6Gc3/Dub/B
3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsb
zP0N5v4Gc3/Dub/h3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/
wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/h3N9w7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7
G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9w7m849zeY+xvM/Q3m/gZzf4O5
v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m849zec
+xvM/Q3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+T
ub/J3N9k7m8y9zed+5vO/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3
mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vO/U3n/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/
k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3n/qZzf5O5v8nc32TubzL3
N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/qZz
f9O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y
9zeZ+5vM/U3m/iZzf9O5v+nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4m
c3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v+nc33TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5v
Mvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc33Tubzr3N5n7m8z9Teb+
JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32Tu
bzr3N537m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m
/iZzf5O5v8nc32TubzL3N537m879Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k
7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m879Tef+JnN/k7m/xdzfYu5vMfe3mPtbzP0t
5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Lef+lnN/i7m/xdzf
Yu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9
Leb+lnN/y7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc
32LubzH3t5j7W8z9Leb+FnN/y7m/5dzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM
/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/5dzfcu5vMfe3mPtbzP0t5v4Wc3+Lub/F
3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfcu5vOfe3mPtb
zP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/
xdzfYu5vOfe3nPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7
W8z9Leb+FnN/i7m/xdzfYu5vMfe3nPtbzv0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5
v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzv0t5/4Wc3+Lub/F3N9i7m8x97eY
+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5/6Wc3+L
ub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3
mPtbzP0t5v6Wc3/Lub/F3N9i7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/
m7m/zdzfZu5vM/e3mfvbzP1t5v42c3/bub/t3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3
t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/t3N927m8z97eZ+9vM/W3m/jZz
f5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N927m87
97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42
c3+bub/N3N9m7m8797ed+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5v
M/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97ed+9vO/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+
NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vO/W3n/jZzf5u5v83c32bu
bzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3n
/rZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m
7m8z97eZ+9vM/W3m/rZzf9u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t
5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf9u5v+3c32bubzP3t5n728z9beb+NnN/m7m/zdzf
Zu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v+3c33bubzP3t5n7O8z9
Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc
33Hu7zj3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM
/R3m/g5zf4e5v8Pc32Hu7zj3d5z7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D
3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5z7O879Heb+DnN/h7m/w9zfYe7vMPd3mPs7
zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O879Hef+DnN/h7m/
w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7
O8z9Hef+jnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5
v8Pc32Hu7zD3d5j7O8z9Heb+jnN/x7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY
+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/x7m/49zfYe7vMPd3mPs7zP0d5v4Oc3+H
ub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/49zfce7vMPd3
mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/
h7m/w9zfce7vOPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3
d5j7O8z9Heb+DnN/h7m/w9zfYe7vOPd3nPs7zP0d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5z
f5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3nfu7zv1d5v4uc3+Xub/L3N9l7u8y
93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zv1d5/4u
c3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7v
Mvd3mfu7zP1d5/6uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+
LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v6uc3/Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu
7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3/Xub/r3N9l7u8y93eZ+7vM/V3m
/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/r3N91
7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d
5v4uc3+Xub/L3N917u8693eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zf
Ze7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8693ed+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9
Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93ed+7vO/V3m/i5zf5e5v8vc
32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vO
/V3n/i5zf5e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5
v4e5v4e5v4e5v4e5v4e5v8e5v8e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5
v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v8e5v8e5v4e5v4e5v4e5v4e5v4e5v4e5
v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v8e5v8e5
v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5
v4e5v4e5v4e5v4e5v8e5v8e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5
v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v8e5v8e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5
v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v8e5v8e5v4e5
v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5
v4e5v4e5v4e5v8e5v8e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5
v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v8e5v8e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5
v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v8e5v8e5v4e5v4e5
v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5v4e5
v4e5v4e5v8e5v8e5v4e5v4e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5
v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v9e5v9e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5
v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v9e5v9e5v5e5v5e5v5e5
v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5
v5e5v9e5v9e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5
v5e5v5e5v5e5v5e5v5e5v5e5v5e5v9e5v9e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5
v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v9e5v9e5v5e5v5e5v5e5v5e5
v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5
v9e5v9e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5
v5e5v5e5v5e5v5e5v5e5v5e5v9e5v9e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5
v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v9e5v9e5v5e5v5e5v5e5v5e5v5e5
v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v9e5
v9e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5v5e5
v5e5v5e5v5e5v5e5v5e5v9e5v9e5v5e5v5e5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5
v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v8+5v8+5v4+5v4+5v4+5v4+5v4+5v4+5
v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v8+5v8+5
v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5
v4+5v4+5v4+5v4+5v8+5v8+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5
v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v8+5v8+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5
v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v8+5v8+5v4+5
v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5
v4+5v4+5v4+5v8+5v8+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5
v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v8+5v8+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5
v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v8+5v8+5v4+5v4+5
v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5
v4+5v4+5v8+5v8+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5
v4+5v4+5v4+5v4+5v4+5v4+5v4+5v4+5v8+5v8+5v4+5v0+5v/lR7u+/nxzsycmeXOzJzZ487Mlr
nhzsrQv21gV764K9dcHeumBvXbC3Ltlbl+ytS/bWJXvrkr11yd66ZG/dTyET+xN670oeWmyZYFsm
2JYJtmWCbZlgWybYlgm2ZYJtmWBbJtiWCbZlgm2ZYFsm2JYJtmWCbZlgWybYlgm2ZYJtmWBbJtyW
Cbdlgm2ZYFsm2ZZJtmWSbZlkWybZlkm2ZZJtmWRbJtmWSbZlkm2ZZFsm2ZZJtmWSbZlkWybZlkm2
ZZJtmWRbJtmWSbdl0m2ZZFsm2ZYptmWKbZliW6bYlim2ZYptmWJbptiWKbZlim2ZYlum2JYptmWK
bZliW6bYlim2ZYptmWJbptiWKbZlym2Zclum2JYptmWabZlmW6bZlmm2ZZptmWZbptmWabZlmm2Z
Zlum2ZZptmWabZlmW6bZlmm2ZZptmWZbptmWabZlmm2Zdlum3ZZptmWabZlhW2bYlhm2ZYZtmWFb
ZtiWGbZlhm2ZYVtm2JYZtmWGbZlhW2bYlhm2ZYZtmWFbZtiWGbZlhm2ZYVtm3JYZt2WGbZlhW2bZ
llm2ZZZtmWVbZtmWWbZllm2ZZVtm2ZZZtmWWbZllW2bZllm2ZZZtmWVbZtmWWbZllm2ZZVtm2ZZZ
t2XWbZllW2bZljlsyxy2ZQ7bModtmcO2zGFb5rAtc9iWOWzLHLZlDtsyh22Zw7bMYVvmsC1z2JY5
bMsctmUO2zKHbZnDtsxxW+a4LXPYljlsy1y2ZS7bMpdtmcu2zGVb5rItc9mWuWzLXLZlLtsyl22Z
y7bMZVvmsi1z2Za5bMtctmUu2zKXbZnLtsxlW+a6LXPdlrlsy1y2ZR7bMo9tmce2zGNb5rEt89iW
eWzLPLZlHtsyj22Zx7bMY1vmsS3z2JZ5bMs8tmUe2zKPbZnHtsxjW+axLfPclnluyzy2ZZj7G8z9
Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc
33Dubzj3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM
/Q3m/gZzf4O5v8Hc32Dubzj3N5z7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B
3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5z7G879Deb+BnN/g7m/wdzfYO5vMPc3mPsb
zP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G879Def+BnN/g7m/
wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7
G8z9Def+hnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5
v8Hc32DubzD3N5j7G8z9Deb+hnN/w7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY
+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/w7m/4dzfYO5vMPc3mPsbzP0N5v4Gc3+D
ub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/4dzfcO5vMPc3
mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/
g7m/wdzfcO5vOPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3
N5j7G8z9Deb+BnN/g7m/wdzfYO5vOPc3nPsbzP0N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZz
f5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3nfubzv1N5v4mc3+Tub/J3N9k7m8y
9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzv1N5/4m
c3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5v
Mvc3mfubzP1N5/6mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+
JnN/k7m/ydzfZO5vMvc3mfubzP1N5v6mc3/Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32Tu
bzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3/Tub/p3N9k7m8y9zeZ+5vM/U3m
/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/p3N90
7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N
5v4mc3+Tub/J3N907m869zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzf
ZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m869zed+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9
Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zed+5vO/U3m/iZzf5O5v8nc
32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vO
/U3n/iZzf5O5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F
3N9i7m8x97eY+1vM/S3n/pZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtb
zP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/pZzf8u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/
xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf8u5v+Xc32LubzH3t5j7
W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5
v+Xc33LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY
+1vM/S3m/hZzf4u5v8Xc33Lubzn3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+L
ub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32Lubzn3t5z7W8z9Leb+FnN/i7m/xdzfYu5vMfe3
mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5z7W879Leb+FnN/
i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3
t5j7W879Lef+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZz
f4u5v8Xc32LubzH3t5j7W8z9Lef+lnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x
97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+lnN/y7m/xdzfYu5vM/e3mfvbzP1t5v42
c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/27m/7dzfZu5v
M/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+
NnN/m7m/7dzfdu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bu
bzP3t5n728z9beb+NnN/m7m/zdzfdu5vO/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m
/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vO/e3nfvbzP1t5v42c3+bub/N3N9m
7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3nfvbzv1t
5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzf
Zu5vM/e3mfvbzv1t5/42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9
beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5/62c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c
32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v62c3/bub/N3N9m7m8z97eZ+9vM
/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3/bub/t
3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvb
zP1t5v42c3+bub/t3N927m8z97eZ+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/
w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9x7u8493eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7
O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8493ec+zvM/R3m/g5zf4e5
v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93ec
+zvO/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+H
ub/D3N9h7u8w93eY+zvO/R3n/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3
mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3n/o5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/
h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/o5zf8e5v8Pc32Hu7zD3
d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5z
f8e5v+Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w
93eY+zvM/R3m/g5zf4e5v+Pc33Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4O
c3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc33Hu7zj3d5j7O8z9Heb+DnN/h7m/w9zfYe7v
MPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zj3d5z7O8z9Heb+
LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu
7zL3d537u879Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m
/i5zf5e5v8vc32Xu7zL3d5n7u879Xef+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l
7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xef+rnN/l7m/y9zfZe7vMvd3mfu7zP1d
5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+rnN/17m/y9zf
Ze7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9
Xeb+LnN/17m/69zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc
32Xu7zL3d5n7u8z9Xeb+LnN/l7m/69zfde7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM
/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfde7vOvd3mfu7zP1d5v4uc3+Xub/L
3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vOvd3nfu7
zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/
y9zfZe7vMvd3nfu7zv1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7
u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zv1d5/4uc3+Xub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+H
ub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub/Hub/Hub+Hub+Hub+Hub+H
ub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+H
ub/Hub/Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+H
ub+Hub+Hub+Hub+Hub+Hub+Hub/Hub/Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+H
ub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub/Hub/Hub+Hub+Hub+Hub+Hub+H
ub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub/H
ub/Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+H
ub+Hub+Hub+Hub+Hub+Hub/Hub/Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+H
ub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub/Hub/Hub+Hub+Hub+Hub+Hub+Hub+H
ub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub/Hub/H
ub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+H
ub+Hub+Hub+Hub+Hub/Hub/Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+H
ub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub+Hub/Hub/Hub+Hub+Hub+Xub+Xub+Xub+Xub+X
ub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub/Xub/Xub+X
ub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+X
ub+Xub+Xub+Xub/Xub/Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+X
ub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub/Xub/Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+X
ub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub/Xub/Xub+Xub+X
ub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+X
ub+Xub+Xub/Xub/Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+X
ub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub/Xub/Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+X
ub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub/Xub/Xub+Xub+Xub+X
ub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+X
ub+Xub/Xub/Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+X
ub+Xub+Xub+Xub+Xub+Xub+Xub+Xub/Xub/Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+X
ub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub+Xub/Xub/Xub+Xub+Xub+Pub+P
ub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+P
ub/Pub/Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+P
ub+Pub+Pub+Pub+Pub+Pub+Pub/Pub/Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+P
ub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub/Pub/Pub+Pub+Pub+Pub+Pub+P
ub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub/P
ub/Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+P
ub+Pub+Pub+Pub+Pub+Pub/Pub/Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+P
ub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub/Pub/Pub+Pub+Pub+Pub+Pub+Pub+P
ub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub/Pub/P
ub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+P
ub+Pub+Pub+Pub+Pub/Pub/Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+P
ub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub/Pub/Pub+Pub+Pub+Pub+Pub+Pub+Pub+P
ub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub+Pub/Pub/Pub+P
ub9Pub/1Ue7vv58c7MnJnlzsyc2ePOzJa54c7K0L9tYFe+uCvXXB3rpgb12wty7ZW5fsrUv21iV7
65K9dcneumRv3U8hE/sTeu9KHlpsmWBbJtiWCbZlgm2ZYFsm2JYJtmWCbZlgWybYlgm2ZYJtmWBb
JtiWCbZlgm2ZYFsm2JYJtmWCbZlgWybclgm3ZYJtmWBbJtmWSbZlkm2ZZFsm2ZZJtmWSbZlkWybZ
lkm2ZZJtmWRbJtmWSbZlkm2ZZFsm2ZZJtmWSbZlkWybZlkm3ZdJtmWRbJtmWKbZlim2ZYlum2JYp
tmWKbZliW6bYlim2ZYptmWJbptiWKbZlim2ZYlum2JYptmWKbZliW6bYlim2ZcptmXJbptiWKbZl
mm2ZZlum2ZZptmWabZlmW6bZlmm2ZZptmWZbptmWabZlmm2ZZlum2ZZptmWabZlmW6bZlmm2ZZpt
mXZbpt2WabZlmm2ZYVtm2JYZtmWGbZlhW2bYlhm2ZYZtmWFbZtiWGbZlhm2ZYVtm2JYZtmWGbZlh
W2bYlhm2ZYZtmWFbZtyWGbdlhm2ZYVtm2ZZZtmWWbZllW2bZllm2ZZZtmWVbZtmWWbZllm2ZZVtm
2ZZZtmWWbZllW2bZllm2ZZZtmWVbZtmWWbdl1m2ZZVtm2ZY5bMsctmUO2zKHbZnDtsxhW+awLXPY
ljlsyxy2ZQ7bModtmcO2zGFb5rAtc9iWOWzLHLZlDtsyh22Zw7bMcVvmuC1z2JY5bMtctmUu2zKX
bZnLtsxlW+ayLXPZlrlsy1y2ZS7bMpdtmcu2zGVb5rItc9mWuWzLXLZlLtsyl22Zy7bMZVvmui1z
3Za5bMtctmUe2zKPbZnHtsxjW+axLfPYlnlsyzy2ZR7bMo9tmce2zGNb5rEt89iWeWzLPLZlHtsy
j22Zx7bMY1vmsS3z3JZ5bss8tmWY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/
wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9w7m849zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7
G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m849zec+xvM/Q3m/gZzf4O5
v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zec
+xvO/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+D
ub/B3N9g7m8w9zeY+xvO/Q3n/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3
mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3n/oZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/
g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/oZzf8O5v8Hc32DubzD3
N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZz
f8O5v+Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w
9zeY+xvM/Q3m/gZzf4O5v+Hc33DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4G
c3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc33Dubzj3N5j7G8z9Deb+BnN/g7m/wdzfYO5v
MPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32Dubzj3N5z7G8z9Deb+
JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32Tu
bzL3N537m879Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m
/iZzf5O5v8nc32TubzL3N5n7m879Tef+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k
7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Tef+pnN/k7m/ydzfZO5vMvc3mfubzP1N
5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+pnN/07m/ydzf
ZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9
Teb+JnN/07m/6dzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc
32TubzL3N5n7m8z9Teb+JnN/k7m/6dzfdO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM
/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfdO5vOvc3mfubzP1N5v4mc3+Tub/J
3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vOvc3nfub
zP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/
ydzfZO5vMvc3nfubzv1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7
m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzv1N5/4mc3+Tub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5
v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5/6Wc3+Lub/F3N9i7m8x97eY
+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v6Wc3/L
ub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3
mPtbzP0t5v4Wc3/Lub/l3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/
i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/l3N9y7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3
t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9y7m8597eY+1vM/S3m/hZz
f4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m85
97ec+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4W
c3+Lub/F3N9i7m8x97ec+1vO/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5v
Mfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vO/S3n/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+
FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3n/pZzf4u5v8Xc32Lu
bzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m
/pZzf8u5v8Xc32LubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m
7m8z97eZ+9vM/W3m/jZzf9u5v+3c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t
5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v+3c33bubzP3t5n728z9beb+NnN/m7m/zdzf
Zu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c33bubzv3t5n728z9
beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c
32bubzv3t53728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM
/W3m/jZzf5u5v83c32bubzP3t5372879beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N
3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n72879bef+NnN/m7m/zdzfZu5vM/e3mfvb
zP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9bef+tnN/m7m/
zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n7
28z9beb+tnN/27m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5
v83c32bubzP3t5n728z9beb+NnN/27m/7dzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ
+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/7dzfdu5vM/e3mfs7zP0d5v4Oc3+H
ub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfce7vOPd3
mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/
h7m/w9zfYe7vOPd3nPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3
d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3nPs7zv0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5z
f4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zv0d5/4Oc3+Hub/D3N9h7u8w
93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5/6O
c3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7v
MPd3mPs7zP0d5v6Oc3/Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+
DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3/Hub/j3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu
7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/j3N9x7u8w93eY+zvM/R3m
/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9x
7u8493eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d
5v4Oc3+Hub/D3N9h7u8493ec+zvM/R3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zf
Ze7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93ed+7vO/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9
Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vO/V3n/i5zf5e5v8vc
32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM
/V3n/q5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L
3N9l7u8y93eZ+7vM/V3m/q5zf9e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7
zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf9e5v+vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/
y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v+vc33Xu7zL3d5n7
u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5
v8vc33Xu7zr3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ
+7vM/V3m/i5zf5e5v8vc32Xu7zr3d537u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+X
ub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d537u879Xeb+LnN/l7m/y9zfZe7vMvd3
mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u879Xef+LnN/
l7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
x7m/x7m/h7m/h7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/
17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/17m/17m/l7m/l7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/74e6v798/fHX17fff/7+7fvP//vbnz//8qMf+4+v
375+/uvrxzz2+69/fPvvP//nj7+/xX99++vvr+/fPj/uwX99kcf+53nDnDfUedOcN9V5y5y31Hnb
nLfVececd9R515x31XmPOe9R573mvFed95nzPtYLFLhwhVOJY40LFLlglQuUuWCdCxS6YKULlLpg
rQsUu2C1C5S7YL0LFLxgxQuUvGDNS9S8ZM1L1Lx0P9epH+xY8xI1L1nzEjUvWfMSNS9Z8xI1L1nz
EjUvWfMSNS9Z8xI1L1nzCjWvWPMKNa9Y8wo1r9xvM9WvM1nzCjWvWPMKNa9Y8wo1r1jzCjWvWPMK
Na9Y8wo1r1jzGjWvWfMaNa9Z8xo1r1nzGjWv3d/w1B/xWPMaNa9Z8xo1r1nzGjWvWfMaNa9Z8xo1
r1nzBjVvWPMGNW9Y8wY1b1jzBjVvWPMGNW/cJ1fUR1dY8wY1b1jzBjVvWPMGNW9Y8wY1b1jzFjVv
WfMWNW9Z8xY1b1nzFjVvWfMWNW9Z8xY1b93nNdUHNlnzFjVvWfMWNW9Z8xY1b1nzDmreYc07qHmH
Ne+g5h3WvIOad1jzDmreYc07qHmHNe+g5h13S0FdU2DNO6h5hzXvoOYd1ryLmndZ8y5q3mXNu6h5
lzXvouZd1ryLmndZ8y5q3mXNu6h5lzXvouZddzdPXc5jzbuoeZc176HmPda8h5r3WPMeat5jzXuo
eY8176HmPda8h5r3WPMeat5jzXuoeY8176HmPXcjXV1Jh3fS2aV0dyv9o66lf9y99I+6mP5xN9M/
6mr6x91N/6jL6R93O/2jrqd/3P30j7qg/nE31D/qivrH3VH/qEvqH3dL/aOuqX9cBxnOInUWxrO4
DjKgBQotjGiBRgtDWqDSwpgW6LQwqAVKLYxqgVYLw1qg1sK4Fue1hAJbwoktociWSOiUMajMdVCx
LeHcllBwSzi5JRTdEs5uCYW3hNNbQvEt4fyWUIBLOMElFOESznAJhbiEU1xCMS7hHJdQkEsUFDsZ
2ek6qDCXcJpLKM4lnOcSCnQJJ7qEIl3CmS6hUJdwqkso1iWc6xIKdgknu4SiXcLZLqFwl3C6Syje
JRra1Qyvdh1UxEs44yUU8hJOeQnFvIRzXkJBL+Gkl1DUSzjrJRT2Ek57CcW9hPNeQoEv4cSXUORL
OPMlFPoSA7/FgX2Ng+uggl/CyS+h6Jdw9kso/CWc/hKKfwnnv4QCYMIJMKEImHAGTCgEJpwCE4qB
CefAhIJgwkkwoSiYWPh9RuwLjVwHFQcTzoMJBcKEE2FCkTDhTJhQKEw4FSYUCxPOhQkFw4STYULR
MOFsmFA4TDgdJhQPE86HCQXExIHf7Me+2s91UCEx4ZSYUExMOCcmFBQTTooJRcWEs2JCYTHhtJhQ
XEw4LyYUGBNOjAlFxoQzY0KhMeHUmFBsTFz4HbfsS25dBxUdE86OCYXHhNNjQvEx4fyYUIBMOEEm
FCETzpAJhciEU2RCMTLhHJlQkEw4SSYUJRPOkgmFycSD3/bOvu79R3bwt6+f//Ht17++/frL1+/f
//z765//BT/6n+T86+Q/OLLgsf953jDnZf++ac6b6rxlzlvqvG3O2+q8Y8476rxrzrvqvMec96jz
XnPeq877zHkf6wUKXLjCqcSxxgWKXLDKBcpcsM4FCl2w0gVKXbDWBYpdsNoFyl2w3gUKXrDiBUpe
sOYlal6y5iVqXrqf69QPdqx5iZqXrHmJmpeseYmal6x5iZqXrHmJmpeseYmal6x5iZqXrHmFmles
eYWaV6x5hZpX7reZ6teZrHmFmleseYWaV6x5hZpXrHmFmleseYWaV6x5hZpXrHmNmteseY2a16x5
jZrXrHmNmtfub3jqj3iseY2a16x5jZrXrHmNmteseY2a16x5jZrXrHmDmjeseYOaN6x5g5o3rHmD
mjeseYOaN+6TK+qjK6x5g5o3rHmDmjeseYOaN6x5g5o3rHmLmreseYuat6x5i5q3rHmLmreseYua
t6x5i5q37vOa6gObrHmLmreseYuat6x5i5q3rHkHNe+w5h3UvMOad1DzDmveQc07rHkHNe+w5h3U
vMOad1DzjruloK4psOYd1LzDmndQ8w5r3kXNu6x5FzXvsuZd1LzLmndR8y5r3kXNu6x5FzXvsuZd
1LzLmndR8667m6cu57HmXdS8y5r3UPMea95DzXuseQ8177HmPdS8x5r3UPMea95DzXuseQ8177Hm
PdS8x5r3UPOeu5GurqTDO+nsUrq7lf5R19I/7l76R11M/7ib6R91Nf3j7qZ/1OX0j7ud/lHX0z/u
fvpHXVD/uBvqH3VF/ePuqH/UJfWPu6X+UdfUP66DDGeROgvjWVwHGdAChRZGtECjhSEtUGlhTAt0
WhjUAqUWRrVAq4VhLVBrYVyL81pCgS3hxJZQZEskdMoYVOY6qNiWcG5LKLglnNwSim4JZ7eEwlvC
6S2h+JZwfksowCWc4BKKcAlnuIRCXMIpLqEYl3COSyjIJQqKnYzsdB1UmEs4zSUU5xLOcwkFuoQT
XUKRLuFMl1CoSzjVJRTrEs51CQW7hJNdQtEu4WyXULhLON0lFO8SDe1qhle7DiriJZzxEgp5Cae8
hGJewjkvoaCXcNJLKOolnPUSCnsJp72E4l7CeS+hwJdw4kso8iWc+RIKfYmB3+LAvsbBdVDBL+Hk
l1D0Szj7JRT+Ek5/CcW/hPNfQgEw4QSYUARMOAMmFAITToEJxcCEc2BCQTDhJJhQFEws/D4j9oVG
roOKgwnnwYQCYcKJMKFImHAmTCgUJpwKE4qFCefChIJhwskwoWiYcDZMKBwmnA4TiocJ58OEAmLi
wG/2Y1/t5zqokJhwSkwoJiacExMKigknxYSiYsJZMaGwmHBaTCguJpwXEwqMCSfGhCJjwpkxodCY
cGpMKDYmLvyOW/Ylt66Dio4JZ8eEwmPC6TGh+JhwfkwoQCacIBOKkAlnyIRCZMIpMqEYmXCOTChI
JpwkE4qSCWfJhMJk4sFve2df9/4jO/jb18//+PbrX99+/eXr9+9//v31z/+CH/1Psv3519l/cGbJ
g///mUOdOdyZU5053ZlLnbncmVudud2ZR5153JlXnXndmY86M/z/81Vnvu7MT535waawEIYsoUsh
bGGwGAasYbAcBuxhsCAGLGKwJAZsYrAoBqxisCwG7GKwMAYsY7A0BmxjsjYmbGOyNqb8OdH9oAjb
mKyNCduYrI0J25isjQnbmKyNCduYrI0J25isjQnbmKyNCdtYrI0F21isjQXbWKyNJX+L6n6NCttY
rI0F21isjQXbWKyNBdtYrI0F21isjQXbWKyNBdvYrI0N29isjQ3b2KyNDdvYrI0t/8bo/sgI29is
jQ3b2KyNDdvYrI0N29isjQ3b2KyNDds4rI0D2zisjQPbOKyNA9s4rI0D2zisjSM/geM+ggPbOKyN
A9s4rI0D2zisjQPbOKyNA9u4rI0L27isjQvbuKyNC9u4rI0L27isjQvbuKyNKz+f6j6gCtu4rI0L
27isjQvbuKyNC9t4WBsPbONhbTywjYe18cA2HtbGA9t4WBsPbONhbTywjYe18cjbG+76BmzjYW08
sI2HtfHANl7WxgvbeFkbL2zjZW28sI2XtfHCNl7WxgvbeFkbL2zjZW38P/bevslt5Erz/X8+BcIR
G7bjqtQ4hyRI6sZMRI+t7tFuu6Wrbs/sxPSEAkWiqmCBAA2QKpX3y988mYkXVpWkkvs8SHiDs7uz
UqkaJ1/PczLz5C9XQG1cwbRxhbzbiLvcCNTGFUwbV0BtXMO0cQ3UxjVMG9dAbVzDtHEN1MY1TBvX
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
07po/cVCrQhNtSIs1orQXCvCgq0ITbYiLNqK0GwrwsKtCE23IizeitB8K8ICrghNuCIs4orQjCvC
Qq4ITbkiLOaKVvC37cGP26P1F4u6IjTrirCwK0LTrgiLuyI074qwwCtCE68Ii7wiNPOKsNArQlOv
CIu9IjT3irDgK0KTrwiLviI0+4qw8CtC068Ii78iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0
/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+Ksfwr
RvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjL
v2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+K
sfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bz
rxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79i
NP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8
K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Y
y79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/
irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG
868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/
YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv4J8/lia
v12kRRFtiiytG20LfNJCsf7n+/aJsWUnZNkJW3ZGlp2xZZ8hyz7Dln2OLPscW/YFsuwLbNkTZNkT
bNmXyLIvsWVfIcu+wpZ9jSz7GqxNUGEltLJipRWsrQQVVwKrK0HllcD6SlCBJbDCElRiCayxBBVZ
AqssQWWWwDpLUKElsNISVGoJrLUM1VoGay1DtZbR61jsQhastQzVWgZrLUO1lsFay1CtZbDWMlRr
Gay1DNVaBmstQ7WWwVrLUK1lsNbOoFo7A2vtDKq1M7DWzqBaO0PvGmO3jcFaO4Nq7QystTOo1s7A
WjuDau0MrLUzqNbOwFo7g2rtDKy1M6jWzsBaO4dq7RystXOo1s7BWjuHau0crLVzqNbO0We02ENa
sNbOoVo7B2vtHKq1c7DWzqFaOwdr7RyqtXOw1s6hWjsHa+0CqrULsNYuoFq7AGvtAqq1C7DWLqBa
uwBr7QKqtQt0RhQ2JQqstQuo1i7AWruAau0CrLULqNYuwFq7gGrtAqy1CVRrE7DWJlCtTcBam0C1
NgFrbQLV2gSstQlUaxOw1iZQrU3Q+cfYBGSw1iZQrU3AWptAtTYBa20C1doErLVLqNYuwVq7hGrt
Eqy1S6jWLsFau4Rq7RKstUuo1i7BWruEau0SrLVLqNYu0bd9sNd9wFq7hGrtEqy1S6jWLsFau4Jq
7QqstSuo1q7AWruCau0KrLUrqNauwFq7gmrtCqy1K6jWrsBau4Jq7QqstSuo1q7Qd2uxl2vBWruC
au0KrLVrqNauwVq7hmrtGqy1a6jWrsFau4Zq7RqstWuo1q7BWruGau0arLVrqNauwVq7hmrtGqy1
a6jWrtEkCyzKAs6yAMMs0DSLGIuziNE8ixgLtIjRRIsYi7SI0UyLGAu1iNFUixiLtYjRXIsYC7aI
0WSLGIu2iNFsixgLt4jRdIsYi7eI0foLhknhaVJgnBRaf8FAKThRCoyUgjOlwFApOFUKjJWCc6XA
YCk4WQqMloKzpcBwKThdCoyXQvOlCAuYIjRhirCIKWI4zxEMdETrLxYzRWjOFGFBU4QmTREWNUVo
1hRhYVOEpk0RFjdFaN4UYYFThCZOERY5RWjmFGGhU4SmThEWO0Vo7hRhwVM0gxOVwUhltP5i4VOE
pk8RFj9FaP4UYQFUhCZQERZBRWgGFWEhVISmUBEWQ0VoDhVhQVSEJlERFkVFaBYVYWFUhKZRERZH
RXP4mwbgRw3Q+otFUhGaSUVYKBWhqVSExVIRmktFWDAVoclUhEVTEZpNRVg4FaHpVITFUxGaT0VY
QBWhCVWERVQRmlFFWEgVLeCvCoGfFULrLxZURWhSFWFRVYRmVREWVkVoWhVhcVWE5lURFlhFaGIV
YZFVhGZWERZaRWhqFWGxVYTmVhEWXEVochVh0VWUwN/1Az/sh9ZfLL6K0PwqwgKsCE2wIizCitAM
K8JCrAhNsSIsxorQHCvCgqwITbIiLMqK0CwrwsKsCE2zIizOitA8K8ICrWgJf1kX/LQuWn+xUCtC
U60Ii7UiNNeKsGArQpOtCIu2IjTbirBwK0LTrQiLtyI034qwgCtCE64Ii7giNOOKsJArQlOuCIu5
ohX8bXvw4/Zo/cWirgjNuiIs7IrQtCvC4q4IzbsiLPCK0MQrwiKvCM28Iiz0itDUK8JirwjNvSIs
+IrQ5CvCoq8Izb4iLPyK0PQrwuKvCM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8Yzb9iLP+K0fwr
xvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/itH8K8byrxjN
v2Is/4rR/CvG8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8Yzb9iLP+K
0fwrxvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/itH8K8by
rxjNv2Is/4rR/CvG8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8Yzb9i
LP+K0fwrxvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/itH8
K8byrxjNv2Is/4rR/CvG8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8Y
zb9iLP+K0fwrxvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/
itH8K8byrxjNv2Is/4rR/CvG8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG
8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8Yzb9iLP+K0fwrxvKvGM2/
Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR
/CvG8q8Yzb9iLP+K0fwrxvKvGM2/Yiz/itH8K8byrxjNv2Is/4rR/CvG8q8gnz+W5m8XaVFEmyJL
60bbwuykhWL9z/ftE2PLTsiyE7bsjCw7Y8s+Q5Z9hi37HFn2ObbsC2TZF9iyJ8iyJ9iyL5FlX2LL
vkKWfYUt+xpZ9jVYm6DCSmhlxUorWFsJKq4EVleCyiuB9ZWgAktghSWoxBJYYwkqsgRWWYLKLIF1
lqBCS2ClJajUElhrGaq1DNZahmoto9ex2IUsWGsZqrUM1lqGai2DtZahWstgrWWo1jJYaxmqtQzW
WoZqLYO1lqFay2CtnUG1dgbW2hlUa2dgrZ1BtXaG3jXGbhuDtXYG1doZWGtnUK2dgbV2BtXaGVhr
Z1CtnYG1dgbV2hlYa2dQrZ2BtXYO1do5WGvnUK2dg7V2DtXaOVhr51CtnaPPaLGHtGCtnUO1dg7W
2jlUa+dgrZ1DtXYO1to5VGvnYK2dQ7V2DtbaBVRrF2CtXUC1dgHW2gVUaxdgrV1AtXYB1toFVGsX
6IwobEoUWGsXUK1dgLV2AdXaBVhrF1CtXYC1dgHV2gVYaxOo1iZgrU2gWpuAtTaBam0C1toEqrUJ
WGsTqNYmYK1NoFqboPOPsQnIYK1NoFqbgLU2gWptAtbaBKq1CVhrl1CtXYK1dgnV2iVYa5dQrV2C
tXYJ1dolWGuXUK1dgrV2CdXaJVhrl1CtXaJv+2Cv+4C1dgnV2iVYa5dQrV2CtXYF1doVWGtXUK1d
gbV2BdXaFVhrV1CtXYG1dgXV2hVYa1dQrV2BtXYF1doVWGtXUK1doe/WYi/XgrV2BdXaFVhr11Ct
XYO1dg3V2jVYa9dQrV2DtXYN1do1WGvXUK1dg7V2DdXaNVhr11CtXYO1dg3V2jVYa9dQrV2jSRZY
lAWcZQGGWaBpFjEWZxGjeRYxFmgRo4kWMRZpEaOZFjEWahGjqRYxFmsRo7kWMRZsEaPJFjEWbRGj
2RYxFm4Ro+kWMRZvEaP1FwyTwtOkwDgptP6CgVJwohQYKQVnSoGhUnCqFBgrBedKgcFScLIUGC0F
Z0uB4VJwuhQYL4XmSxEWMEVowhRhEVPEcJ4jGOiI1l8sZorQnCnCgqYITZoiLGqK0KwpwsKmCE2b
IixuitC8KcICpwhNnCIscorQzCnCQqcITZ0iLHaK0NwpwoKnaAYnKoORymj9xcKnCE2fIix+itD8
KcICqAhNoCIsgorQDCrCQqgITaEiLIaK0BwqwoKoCE2iIiyKitAsKsLCqAhNoyIsjorm8DcNwI8a
oPUXi6QiNJOKsFAqQlOpCIulIjSXirBgKkKTqQiLpiI0m4qwcCpC06kIi6ciNJ+KsIAqQhOqCIuo
IjSjirCQKlrAXxUCPyuE1l8sqIrQpCrCoqoIzaoiLKyK0LQqwuKqCM2rIiywitDEKsIiqwjNrCIs
tIrQ1CrCYqsIza0iLLiK0OQqwqKrKIG/6wd+2A+tv1h8FaH5VYQFWBGaYEVYhBWhGVaEhVgRmmJF
WIwVoTlWhAVZEZpkRViUFaFZVoSFWRGaZkVYnBWheVaEBVrREv6yLvhpXbT+YqFWhKZaERZrRWiu
FWHBVoQmWxEWbUVothVh4VaEplsRFm9FaL4VYQFXhCZcERZxRWjGFWEhV4SmXBEWc0Ur+Nv24Mft
0fqLRV0RmnVFWNgVoWlXhMVdEZp3RVjgFaGJV4RFXhGaeUVY6BWhqVeExV4RmntFWPAVoclXhEVf
EZp9RVj4FaHpV4TFXxGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY
/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lX
jOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGa
f8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4V
o/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zl
XzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/F
WP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5
V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8x
mn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+
FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM
5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/
xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfQT5/LM3fLtKiiDZFltaNtoXFSQvF
+p/v2yfGlp2QZSds2RlZdsaWfYYs+wxb9jmy7HNs2RfIsi+wZU+QZU+wZV8iy77Eln2FLPsKW/Y1
suxrsDZBhZXQyoqVVrC2ElRcCayuBJVXAusrQQWWwApLUIklsMYSVGQJrLIElVkC6yxBhZbASktQ
qSWw1jJUaxmstQzVWkavY7ELWbDWMlRrGay1DNVaBmstQ7WWwVrLUK1lsNYyVGsZrLUM1VoGay1D
tZbBWjuDau0MrLUzqNbOwFo7g2rtDL1rjN02BmvtDKq1M7DWzqBaOwNr7QyqtTOw1s6gWjsDa+0M
qrUzsNbOoFo7A2vtHKq1c7DWzqFaOwdr7RyqtXOw1s6hWjtHn9FiD2nBWjuHau0crLVzqNbOwVo7
h2rtHKy1c6jWzsFaO4dq7RystQuo1i7AWruAau0CrLULqNYuwFq7gGrtAqy1C6jWLtAZUdiUKLDW
LqBauwBr7QKqtQuw1i6gWrsAa+0CqrULsNYmUK1NwFqbQLU2AWttAtXaBKy1CVRrE7DWJlCtTcBa
m0C1NkHnH2MTkMFam0C1NgFrbQLV2gSstQlUaxOw1i6hWrsEa+0SqrVLsNYuoVq7BGvtEqq1S7DW
LqFauwRr7RKqtUuw1i6hWrtE3/bBXvcBa+0SqrVLsNYuoVq7BGvtCqq1K7DWrqBauwJr7QqqtSuw
1q6gWrsCa+0KqrUrsNauoFq7AmvtCqq1K7DWrqBau0LfrcVergVr7QqqtSuw1q6hWrsGa+0aqrVr
sNauoVq7BmvtGqq1a7DWrqFauwZr7RqqtWuw1q6hWrsGa+0aqrVrsNauoVq7RpMssCgLOMsCDLNA
0yxiLM4iRvMsYizQIkYTLWIs0iJGMy1iLNQiRlMtYizWIkZzLWIs2CJGky1iLNoiRrMtYizcIkbT
LWIs3iJG6y8YJoWnSYFxUmj9BQOl4EQpMFIKzpQCQ6XgVCkwVgrOlQKDpeBkKTBaCs6WAsOl4HQp
MF4KzZciLGCK0IQpwiKmiOE8RzDQEa2/WMwUoTlThAVNEZo0RVjUFKFZU4SFTRGaNkVY3BSheVOE
BU4RmjhFWOQUoZlThIVOEZo6RVjsFKG5U4QFT9EMTlQGI5XR+ouFTxGaPkVY/BSh+VOEBVARmkBF
WAQVoRlUhIVQEZpCRVgMFaE5VIQFURGaREVYFBWhWVSEhVERmkZFWBwVzeFvGoAfNUDrLxZJRWgm
FWGhVISmUhEWS0VoLhVhwVSEJlMRFk1FaDYVYeFUhKZTERZPRWg+FWEBVYQmVBEWUUVoRhVhIVW0
gL8qBH5WCK2/WFAVoUlVhEVVEZpVRVhYFaFpVYTFVRGaV0VYYBWhiVWERVYRmllFWGgVoalVhMVW
EZpbRVhwFaHJVYRFV1ECf9cP/LAfWn+x+CpC86sIC7AiNMGKsAgrQjOsCAuxIjTFirAYK0JzrAgL
siI0yYqwKCtCs6wIC7MiNM2KsDgrQvOsCAu0oiX8ZV3w07po/cVCrQhNtSIs1orQXCvCgq0ITbYi
LNqK0GwrwsKtCE23IizeitB8K8ICrghNuCIs4orQjCvCQq4ITbkiLOaKVvC37cGP26P1F4u6IjTr
irCwK0LTrgiLuyI074qwwCtCE68Ii7wiNPOKsNArQlOvCIu9IjT3irDgK0KTrwiLviI0+4qw8CtC
068Ii78iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/
YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx
/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOv
GMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0
/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+Ksfwr
RvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjL
v2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+K
sfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bz
rxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79i
NP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8
K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Y
y79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv4J8/liav12kRRFtiiytGx0L7utVmUV1dsjrLMqb
3pKmic1NWl5n0fss2zdRkX/IImOkAViQz0bNsf4gNg63la/YLisPMHO+7aoyOtwYozd5vVUcANVt
eV2n2yzii38hM8T2pvezf75KiyZ7MWxQO8ID2L0q0utmLLt9b/p5MG61H5rPPmT1nW2DccuwjZqi
MqVIy+hSZq/578psO14Z5HfMrzRm1Bd31oNIecayn33cF/kmPzhnFWQoPF4E7HCYBfIAs0AeYBbW
A8wm4AFmE/AAs8AeYBbeA8wm4gEWgTzAIpAHWIT1AIsJeIDFBDzAIrAHWIT3AIuJeICTWEQ+FGAR
8MDsOGsAZzbUEuBT1kfv7qALgLYIgeJ/Zz5k+P+5EowYCo4382dhZv4s6MyfhZ/5s/AzfxZ25s+C
z/zZNGb+IszMX4SZ+YugM38RfuYvws/8RdiZvwg+8xeome//9N/tL/9ml6XNsT2hML/+f/7pn+6V
uC9jtT/ku/xv6SGvyotNurnJLi6r6r3MyrzsC/CYcf+1tu6/yQ/Zztr7ry+0S7o1Vs3Q22ZX6bE4
RNs6vTo09mzlUL3PtE5x0stGJlhlmrPOTQccm8wZcfZ0jOTlh7TIt+6bvS2znCua6DLdvP/lm9EM
xaNZ0uJBP8HUBY1myoyN0Wzx8/F6a/2J/9EpQOfE7pXAOKDUHZ3u91Vt5rsZNqNb5NEtzsZvVaXk
ko0ZR5e1VYLoYs08my05niWrxXy5XKzilbEU7etsk22NH7XFGioE2DSHMz0bw/RDy8uR2vtRyxzM
Mqy1XZbFTdpEaVRW5d+yuoqK6jaro0sT8m31jVzlpQmJzIzdVPXWVEPTzrAZ5yMNlPlIw2IOHwRz
Wf1YN1qZGLH+YO0atcyuqjozYekmb6QgcQCbFMCmkkiapdtt1BrOJYlpezR9GFV1tM2b9LLIVCcZ
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
CxDWD3NoP8yB/TCH9sMc2A9zaD8cckfC25+FboBZ4AaYh26ARegCJKELEFYHwm5MtCWgKZQg3EQM
uzfRlmA2hRKE7YR58CZYBC9BErwEYTxiMo/D5kicFmD8iTCwT6EbgAI3AIdugNkEChC0B+ahG2AR
ugBJ6AKE9cMc2g9zYD/Mof0wB/bDHNoPh9qhGNifhW6AWeAGmIdugEXoAiShCxBWB8LtUAxLQFMo
QbiJGG6HYliC2RRKELYT5sGbYBG8BEnwEgT0iMlsHXqPYlCEQJOhLQGFbwQK3ggcvhFmkyhC4H6Y
h2+ERfgiJOGLENo7c3jvzMG9M4f3zhzcO3N47xx0D6MtwSx8I8yCN8I8fCMswhchCV+E0PoQeEej
KwNNowwhp2XgfY2uDLNplCF0V8wn0AyLCZQhmUAZwnjJvPyQFvk22lbyYmiUy0uHf8lkvJmhdyWP
1udlszc/kPfk5XnB9Do7W56eZb3XHIv0LqsvimqTFhf3Rprqi455mR/ytCjuorISb7fJiiL1r9da
r6jT5P5j0tYf8kbmj853TVmzKN28L6vbItte24buHgRuojK7zWr7d+kFHZO79LC5kZFx3+ymyNK6
Uba2Pe6LfPNYLU1T3qT1rjDWdEw1x31Wm//STIPsg62QEz9br2hzrGv54XVWZrUdIWerZ6tnq2er
Z6tnq2erZ6tnq2erZ6tnq2erZ6tnq2erZ6tnq2erZ6tnq2erZ6tnq2erZ6tnq2erZ6uPW02jy2Nz
F+2rooiMITm/Ptxk3Xly9Ndjdsyi+liWqdr5eW9xm28jqaOpWVZbw7vjwWUCXFbHcpvWdzomu/rU
Wbq5MZXMD01UyKF6tD3WcrCu3bD5tsiia3uGvt2JtbSMso+b4tjkH/pqKtrqWi77mG2OT84a08se
adv44kHXqSaPtFkd//6naGMMmYFj2tb07K4yI6kq841u8ogxU2ebIs13MgGiy7tD5uylH9K80JsU
+7ramPaL9jd3Tb5Ji+iqqg57MzQPLlco3erb2lS7vem7y7zID3fRTX59c3GbykxUt1jkV5kZKln0
9qef5OtNtk/NbMuKO2VD77O6zIwra+0NWrE0k29rOq91pWkhmU6KDlzmX3PIN6YTj5dF3tz0pspt
X6TqUhKFrOFG33KdbVObQybe9JFmuMqzYhuZXxb3m22qrVbOUN68jw65GTyD0tTiCcyH8j3QyFVd
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
SzscX5ri+NIOx5emOL60w/GlKY4v7XB8aYrjSzscPzPF8TM7HD8zxfEzOxw/M8XxMzscPzPF8TM7
HD8zxfEzOxw/M8XxMzscPzPF8TM7HD8zxfEzOxw/N8XxczscPzfF8XM7HD83xfFzOxw/N8Xxczsc
PzfF8XM7HD83xfFzOxw/N8XxczscPzfF8XM7HL8wxfELOxy/MMXxCzscvzDF8Qs7HL8wxfELOxy/
MMXxCzscvzDF8Qs7HL8wxfELOxy/MMXxCzscvzTF8Us7HL80xfFLOxy/NMXxSzscvzTF8Us7HL80
xfFLOxy/NMXxSzscvzTF8Us7HL80xfFLOxy/MsXxKzscvzLF8Ss7HL8yxfErOxy/MsXxKzscvzLF
8Ss7HL8yxfErOxy/MsXxKzscvzLF8Ss7HL82xfFrOxy/NsXxazscvzbF8Ws7HL82xfFrOxy/NsXx
azscvzbF8Ws7HL82xfFrOxy/NsXxa8M8INuETmeY0elsUzqdYU6ns03qdIZZnc42rdMZ5nU628RO
Z5jZ6WxTO51hbqezTe50htmdzja901nmdxoneFpmeBqneFrmeBoneVpmeRqneVrmeRonelpmehqn
elrmehone1pmexqnexrmezrbhE9nmPHpbFM+nWHOp7NN+nSGWZ/ONu3TGeZ9OtvET2eY+elsUz+d
Ye6ns03+dIbZn842/dMZ5n862wRQZ5gB6mxTQJ1hDqizTQJ1hlmgzjYN1BnmgTrbRFBnmAnqbFNB
nWEuqLNNBnWG2aDONh3UGeaDOtuEUGeYEepsU0KdYU6os00KdYZZoc42LdQZ5oU628RQZ5gZ6mxT
Q51hbqizTQ51htmhzjY91BnmhzrbBFFnmCHqbFNEnWGOqLNNEnWGWaLONk3UGeaJOttEUWeYKeps
U0WdYa6os00WdYbZos42XdSp54ty/42xI2Fs+liFom43sfQ1de1TIkStEXz3IK2hscsjt5dsmzIo
k8jqCJuN7MxGPjUbeanVgaKLzYa7FUkboX6LTRzU+377sjzsDrUfsElIF/qALaCG+xAabqyieD/p
UaVeYUA37AdqObev41CsYSezdjs6FLELc2q91IWdx8fgixXMo4JjU+p/FmHO1CyWWjD4gZrhtmtZ
l/JxHVFbhXWLraSoT7zu3k3tB9PKyq7t+1lLHzXg2m99MzataqR7dk5Je03U20NW9LhtrGLrsbff
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
sDMJ
````

### vq-prefill-readout-functional-v1/generation/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### vq-prefill-readout-functional-v1/generation/stdout.txt

Original bytes: 468085. SHA-256: `c46d30ea675ddfe81839002c13ec077fb1fb09220fdf2a373ee41b64411acb03`.

Normalized bytes: 468085. SHA-256: `c46d30ea675ddfe81839002c13ec077fb1fb09220fdf2a373ee41b64411acb03`.

````zlib-base64
eNrsneuOZUd2nP/7KQbzWxTyftE7+AkEQ8irRJhD0mRrZEHwu/uL3VPVl1NTdbYMyLKRkmbEri6e
3DtzrVgRmSvy/Nt/+cMf/tjGWL9+WvMf5m9tf/r9j3/4uz+E8jfX3/z246d/+tP69OPQD//45//x
w29rr9/Wz2P98C/81Q+//fIvP/z485/5vfbzpx/+vH77cf842qcff/n5hz/bP16fMX7506+//P7j
p/UPv/9TczFdn7S93daYGfI2yY1go4t2VtfCsKHG1J13ZfnqXQ2tpmJWd73VYVMKO4X4+aOv5/36
Y0cxPZbd2gpprTZ6DXO1UOf0IfqY+KGJsebdpysjjxTyGqO7klzrOYTPH8sLrZ8//fLbv3790aby
L9S9mom12F6SDdGa2nIae/QWm3ODVwjZlzH9qtuY4XxbaZbIy67PH/1L/3399udrgq55/nt++Ic/
/Nv131+thP7K/M3LTwe//M9/+vzTWF9/fL3997/7c/vTup73H39ba/7rD7/+1H78+Y+vf/3bar//
8vP1Cz+tn//x0z999Vc//+M//P6pffr8rwf35W9ef/rynJ+f6c9/a65f7funX9onm/7u7+3f/MH/
zR+sccH8t7+Lzcxe8i4+zjj9rivs4FudrXTjts+lpTpT62vn4V0rebSyd2VRbA6rv47/Mpp9b7Th
Rq3dmGJdqNaH6nvL3fOPw2ZWxc3cdm1jWp95GtZmGdesLc6kPkd4GM29O1ru0Tjnp8uOz2KtA2tu
l8l2DrvdXCsGa8MwfrZJSOa9t98zxblt8e1htPDuTPoY+GTH85Y5vG/G9RmYzVJNnDa0VIjmWvpe
wxTfPRE3dtzOWO9Leny3+N5o1bIqzo9gmNKxFkNVFrKa7leKa/jVaqiM3BJhP+oObTP3TD4LWZJ5
GC29N5rGIb+d4zX6YBqnTz2N6LvtzS1ve3Vl15lrZa3qcNPNOvZ0m2ewZj2MVt4bzZrAUni/Arm/
hrPO9rh25OXM5g0mr8P7V2cXkbJb8WmVymz3XdLq9mG0+t5o06yYCXtfVvMjpW1nCj0RcWMaO3wq
oUUzV+iu1hZs4UcrCWVSDHGmxwx4N+EMYOMsiLR26dNHMsuG1YrxDD7WKJ2/a7yFKYa8a4U5nHnN
PEYGFsvjcO/mQDYEHI+f7FjJ51ly6av70HzOrQPEOVVXp118OG+81/J+h+RqA569f4xK698djiU3
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
lUlmvRGrH51ARAseTsgmgGi0V3Ad5Fde4Mp9+DbDbZ5ETg9Ke1p9kT+DBYUir/3GiB9FThJH8msm
6GUKZAUVEV0jHiH+EFvZS5t38KphCOA6jRslipZCPOrjiB+dQkQIBbFIsIy55gRSIuqlRBF7NGqT
UPONsLHJNrXPF+hGNHVbkxjbvjHiB5EzUSbjaiALfJyxqrr8V0XaNkslqDklNcZYyPhQY98ILldT
dXall//jXwb8X68ulS/Y/fevD5OT+fJk6iD98ief6pc/1BK/+hPh9dW/5Uz48ieXvv4DefrVB5av
x5L2++oTw9cfYt1Xf+Ntyl99iC1ffT5U4Ou/S3/5x//2X7568ze9Q/mGdyj/Ve/Q5PP+6Qd73EPH
PXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxDxz10
3EPHPXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxD
xz103EPHPXTcQ/+J3EP1hnvImg/sQ+7Yh4596NiHjn3o2IeOfejYh4596NiHjn3o2IeOfejYh459
6NiHjn3o2IeOfejYh4596NiHjn3o2IeOfejYh4596NiHjn3o2IeOfejYh4596NiHjn3o2IeOfejY
h4596NiHjn3o2IeOfejYh4596NiHjn3o2IeOfejYh4596NiH/hPZh6y94x/yH/iHwvEPHf/Q8Q8d
/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEPHf/Q
8Q8d/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEP
Hf/Q8Q/9J/IPmbftQ/Et+9Ab3z70e/vTrz+t+cOvP7Uff/53mIcAcdhRQnAXctAYZvf/1E20Ivwg
NZZeB39X05AaASxsUfsYRW25GQY1FEJePB+sQSi2unaLO9xzExlZhvjYLoNSAsFg0EmdiNrwduh8
mTpsNqSI5VULwgpAH9PwTHNHe89N1EEwuWnIuJAT7FD9dHEj90brazrnWtEGxkRLkC4u2OvUd7u2
iekx77mJmu9tGh3xjY34ZKYgg4xTOjMmGwIqehTADTYFc7wqPrxtxYBACybdcxMZwFEHpZSgKRZN
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
3hM74yIhQE2w9SKSxRzcULAjaPqJryUtksUu1bGoVu7LdF622kivOv4fuflI8hknB3J6v2pN1Vtx
Z02AAKQmp+bo2kgDtrkNsmv1vkzndc9CAmRHJATaW801bKoo3XgJbIPtakQza5BBHctudcQdww2i
jyvp9Py9TOf/vcrmHzUM562yeats3iqbt8rmrbJ5q2zeKpu3yuatsnmrbN4qm7fK5q2yeats3iqb
t8rmrbJ5q2zeKpu3yuatsnmrbN4qm7fK5q2yeats3iqbt8rmrbJ5q2zeKpu3yuatsnmrbN4qm7fK
5q2yeats3iqbt8rmrbJ5q2zeKpu3yuatsnmrbN4qm7fK5q2yeats/i+pbLJ/oLL5b/1v+1//YbNs
SlbxB3hsOU3w8itP4z/XIFQy3yRVwAiXrpD2sRxDAORvwH0NTWUOz1Q2xAlHWjUyLck9GvEFphIV
J8GgeUKlfQgnVIjNgHg3YvxK8cBFNR2qP1PZRE1Tzc4tl1TYHISL+oLU7rwcoW774jTHupCLO65O
aDFcQgX/hJoZn6ls1lJRRknFq+rdkYUSoYwVbMHDm0FiK7TDC5GSsiP5qpgb/LJDWKNl/0xl47JO
j0EjhQWDc4FxNSl8b1wO5jet+eGuU1qJbDoId1YA8MjFzdnzeKayWRskafAxAEoqLQXYkHckXHLN
iHZNtyMNFLBv0J1HsdM1V5AFPjzTPVPZYGq+Hsl4SDudYOWN/BaXCEtQ1eyM+4QBJXWx+6mKIU2F
7KHBu2u2ZyobAn2AgpS6NAEcMyHvRlPF41FgKaZqFx2wN43PDU5anq059sF0VeUeqmwy3IaVW/PY
sRIawGnwLNbNeXOZ9LpVFqyzCnJQqTElHAIQM4MGFvaHKhsRVe+OzxkMhiNhGXX5HveAoPgaNEwd
K7FQTk37qvxRUWLGGTXItj9V2ejksRwfZtdQwHyqAr7XPOKCR6wGppjbhb0gsWvJHNMMw6IzMkYr
D1U2oYJ8IMS58Dqqf60NKDY1jRgaEebwZ08SD1u4rU1dvJOJdQgUpOc7D1U2ZeioDkfDPhuOZhq/
eIBmwE8H9CPd9ghyzyfzjDkr6WiE7LKmTc8v3OB7lQ0UpEXoam28ZTap9UjTVq6B7ZCiFb0mQKaI
P5DfxTntxFXho10c6qHKRrN+3QaLtAmTgh/YSrqAXOSIPpOD1p1qwL0aJAxTLduOqtnAbYg5+6HK
RgVWFcBXfdEBj+ZRixHpeBrD8zoc8fkcVSQ78DToNsPXh24mlxujPVTZLNYIEpbPpd4M1xHqqKJa
A2SZCwQPytwkXdLY56VV3uZVlKJLn/BQZQP7FuDaVniGL3jhgXwkTRwnOlY4MrF6AtjJNyv0aln4
Redp1esY/aHKJhIReTVJGmbT9bbHlflU/GGqmm6pGKy06ucsLesQYWKg+MnmBccX9fDfq2wKvht7
CB2jcw53jhrwunTxKB4JAdQUe/J8TOBddjpoHqkNbUD3Iz1U2RxsGrC6NIlzVzETKJfObaLTCHJy
Dwn8qNK0y+O3TpUSIXSTEEuZ46HKpnWph1JW+S/05LqBmKDJOVWxDgs8msHdyT8TPpiu+l12VpWE
wNC8HqpsuqpQod5edeKg9ebgzrIISF7RkN+j4bx9Xyy3BtU2LxVDhXo6EXQ+VNnoEI5w3APsjRVz
PFt11PPEiW/la8T5gPpULzUW5qHqvcwLbnIiX/GhyiZjZqoojgJY2WvOtetxkgbnJgIThsGerPQ6
JcR4yt5sG3zQ+0Xy/b3M+YbKpo6gyzT5w9xk8Fil5rYBCmHRcEaBWZ6IZzvIT+LtjBdk+dvRGclD
lQ1EB1LnYBcAELeq6nR0OlBU3eLwsZEIotB0ayyERmIXB8McPWpctUsPVTZ762gPEumODlO86u/j
Zf5X5QYMenjAIEioJZUxmS/gsDo0Y91ZPA9VNuDX3FXaDIRwpIGqUmnih4qxQA29zwL0YsdUrLSg
RQSdoAKGK/t9IYT8XmVjJGyNuA5msDfPiuF7QWqJCqjQafIJG5v0mYXeKi/X3V8AUhenmsiHKptd
4xAFkeyfHWpFG5J4TRJdnTj4hI/UxssRtsgMSRXQeOORarGO81Bl01V6Iuyq8+k08sDnGwydbLMh
4ECgvlUgzO6qIpJw6tYGmYEBFuB7P1TZqMiLdAnNKOeIYWWWCtbMnxuMWzIzwMksBS4+eX6QpNfF
1ipP319I1b9X2XSFFcejHAaOrVSbtarYHou97vyIKQCm1qBzDbPpQYUavs+jcfE9PlTZSMXC7gis
yAe8ChmCYosEKE0V9xotfnCzMdYl/q9XG4VBOMM840OVzbRTnQ0MoWKWmTjlo0oGSpF6DXvJbu/C
xsHwdMkOz6unVfNHsobfRT1/qbLJ/jXxnjTth0qh5MXZNb54g80SMTNAAgSNxQDDdE9VIcYeVtsH
YZukF38fQP+XKpvX0xZMSsXmg/BeLOFqAf6ows61m/UlQsfaJk0flvaZx688+K0qSYmi91Q2r8f1
2YFChUgIUoVyQNChBxpeDjs90oGA1OAEjlhGzPIH0y9Rlc9bBQXnnsrm9Tjzlpp0qir1IjhbAZEs
oIML15zvrtNx3p1cwCqbw4SWQcpHh/+k30+K/1pl83qccNFo6hFySaVOAYvDNcA8AC7C4uLFdiV4
jFAlFiyJ9eTNffMTJHXuqWxej2t1tQgZ9zH5NcxSIK5AElRcD3nOPecKFSeYBL7IcDnqONpt3p1I
+3vd11+rbF6Pc3OOqy4dq866bgnOQYZt8oa74tu9RyDE8Bpxvme6LjJgE7sA3Zqzeyqbz7cjbngf
flVDEFl41drhem1Mz89EtOrUpPaRLi84LRqcRP7vTnP+nsrm0+0SaUUXJxlgvomE0t7qZk1liQ5K
SXR0Nhsc7GjXiKyseiQ5Qfss7Xsqm8+3Y3FgVKvMEit+F0H/hh9C546iWk6mv9DiKNkt9SpphNW+
VUcLJ/T3VDaffhf48vx7vGXHxYBI5lm1lsnTQ90UdlaF8yTXtUOsgRuQf4heliaoz99T2bwelwtB
savMP7bVMos1pE8g703V+DeWLUvxYvkAz8olWZ9sc1nAtxDWPZWNHncdB8MIiO/RD7Y+JRXmHV0k
N1w5gV8gegtqN7t0RERuQHoalqUinp0cbPdUNq/HFSBAM0fWLBH6BJI4p6lQx9l2V2Vzrzpj8WT8
5OKGLFWoWIe0E85zvqmyeT0vwhcbZJ9tk4y1BovD/wLrzvmi68nEuxl4KCnJgbiJPjuC84+ktDdV
Nq/nSQs+Mccosgi7PzAdVf4nNTCAChQVqQYoLhgbkO7A2OcSarQVCajxpsrm9Tx4VCO0BILiwunU
6kg2ynI53C4nZSiW0DsdEcNgQdRsL9Ao5yD9202Vzet5tZrqQr0H2ZI2i9c1Ol4ocydyEMDUcWaC
did/EImpwAkX8oxSsi9/U2Xz+TzdkOlGdAn4wPTD1o0TsVEVGORUr3qyPquLWURsgIJb602yYd2m
3lTZfNrLgXh7sHR1qsAfVZwyTL2NKZD1TIYCpGOycEnQUeDRO/NmR9pzf1Nl87l/oIZqI8Si017A
Cb4+DpgvlSzCQ2ozdajJB7ytgID3d3KV4pv3XzzvB3spbq7AutXSgSJWulrtrL4an1bNtUvnXSJE
Ky8lqeuQemfYcjzO/Z7Vv1HZvJ4Hf9XZXlnkMbhQJxan0JJOBHSYBJoYQPpqHbaX4UyEGTDt9oY1
T5DMTZXN63m6h4/YPqbSO6l1Oyd1Bqk8JwF0/G4qszZ8zkGtCUNJdyu57E5MW49VNn2qUMC5WsFc
cxxeZvlLDa/yTSe5vCPhTx2Ew8oi4JTcgV0RkEjF86bKJrtXNjoDDM8LbVXIwVqDNAi5qqaZjBTY
tJXFAj1402UBxuCa1zHPCjPdVdnogb8ShGhAFwjSGfTaLGsKG8CkTkidH0EAVXWcpxn2WjuRrkvw
00dIy7c7Khs3x+gD69YBQPE6ICZRVLBtP3AuIlbrOj6uWXelBBdsyqU2oUyj7VLvq2xer2VEltDz
cYGQNrLqmwRZXJs7knxB9QTOqBYRwM2o4tG9dQWF40NEf0+zX6lsPMxRolVyDPgOXlecS6OoIrbm
JjRRXRNfBblg57o1YyWhyBVUGn6/rfhRZUPAqKrWBAN0UtrSXWONM6nWKUu9tJapmglQC7nKPo0F
yFTlsbp89PFUZdNSgdjoUquRTAMUWQfnHVJXFlBCDkcubZhlhulFyYF9AGXDWaELwT1V2YDrQiGd
JjfFo4oOgZaaEzmxBV9wqxyybuSzmsrhyE4lgBnceYAa9lRlAzAFyOZQWDwXr9MoSfAmpj2j7mGj
+smRUQnRePLyy9d8ANjXlv8urL6jsklq1SB4hSliHRhePlmStbSJn0X5VFc1i9/nXbYRoB0JWBdG
V+XJU5UN2Wodp9YsDgKk0lrLoEgceEiWX1k8B7RUSWXjLT1soQJRVFopfZZ7qrJRRf2oU/2GDsuz
1CxHAkdA7ZrgvrbUFI8QXHUzyw5eB/LuZAj62S0/VdlIthpcaKArQHOuqplUGUzQuXO+bvXwAux2
T0IAbBkWaOoTpkaA0IenKpuwccAZVUG5+3aq6JAAHyoUXdClVz46IVYtc8RXWQsJ3gq+eNTsZD5W
2ajUz2OeYFR3TlDNIqZZh6mQXzVj084mhFpfgz90Z0cy/fZK+WbRHqtsVsKBCS3QezVDIr6Q1VfI
ccV6diXL4ntsscRwjliGw5uTuIcdruM/oLKZCcTlU7uOBCSAGYmMeemrk25GVbIMu+TZF4cXy2Md
kpphVtWOPVbZQEpI4SGfiYl6csQiaIc0vXT35LyEc3gI/JAGBDLBBm7ZmTRa4Jb8WGWT+Lp5KJ87
PnADh1aB72xyuG4H1UmHlb7OGHX6EPxeaYl/nayeP/6xykZVKp7oiDm0BREH1ZEG4i68b6yrwDhl
VKHmquZ/xakDHVRvh5RUpfBYZUM0aWxZIyh3UAuvIUH5bEkSCnedsWcdZ9WV8Uu1Ha2qIEk7xMhy
98cqm3KC6ul1Go6hA1dUxqWidvIT8aQYC81LqpqlNxF3MoR6LITJDo82HqtsooS3Hd9YjVcpQ6gk
S65rQImja9KjazU1mgJAtAmEscLfrmq5teJzlU0A7hybdelcI0DVJTMjwrmjvlCEmq1C1BBdNlLt
yIVtFPvDlgirIz9W2URj7wn5GAIwEjYp9QuuYFvFJO06XkxqwDPhgPjhTsWTV8i6Jxb35zLmH1U2
XSL1IaiSzFSYrUJQKRQhYs5UqsCTggfk9qSGjuSOCHPv0kuRMuNjlU31Uz1ta4u1SgbdB56Z43Uf
NqCDZyrYdOisgyiATvmhHShgzSmlGR6rbIo6o8bUIXoF/2u6u6j8SrLCvn0DzLDJ19vzmkPdDYak
tw18Fy0+V9nA3fgEkk+yBeWYQ01TWUnJTSIIbmxTLXpXIexgs9Vrp3n4S1DzgZofq2zC1D3NVm2Y
9KeRMJ66O9XxaY3UAXID/+61QjedoqfkwKTAAFUNlBgeq2yCO2GUiKerwZxJq04a5rMSqd6pfRNp
oW6LFwdV4yjdWRXvcIn0h+LUWyobK8pr3cP4Nji+kOZBDvyB6RQHvsBWqWp9Qwpd3zEVAS7BpyWi
Gx+rbApG1/qEw/nojawkjnzwOD5+2WBXVRUKtlIlhHDqdXhIggTURIzoscrGqgqWQfRqI5R7vPox
16A6bSJPaqVA/oihp+j7qEUFEdbxhr0W/4Wu9keVjc76pxTrIJgZdJuoJw6w45YEmuVu6RiJj3WA
vcUU8Eu+xUpqD/xned2PKhtSjYNuBl7GxZm7eaA3aPqMX51cdG0UVB80Er9ZYIxoBqGaANkey36s
snGJJB7EEQjIRz3QwTal7Caoq/DSwHOLrKi214UUfMiKRSYU5KL1scoGD+uZ3Qu1yT9UxKvmRoRS
g2VKbetwE6AAkbTnocJqMJ0AXSNB5/lYZQPx92BTrL1fQnbSX56YR408CoCtEwHSX18nHpfJyvCZ
cDaLoCq6VJ6rbIJSq1oqS8QKspFMw1yIuiXrDmYTDbbT0pLOL6iUCUCVQ5fa3sXxWGUzqvMHvrcO
1g+BPq3gYaZOR7x1Jo8MMIEvqlbXwTnIH5Pdm/gdYFrzscpGlxYQ6tpdLFWN5nk98NhU1SjpMQY2
ENQEHG3q3I4LwgPU1xxu2NZcP6ls5LV+hCNipL60qxdWScIldTQnCCT1cTg5s0twl6Bjeqlexww5
/0GC+Z3K5vNIcIyqskk+AvDCh1cwQ7ede2mTPJD6ODIZmEQq0N6OoeiEHk7aQ3fnrsrm84Ew6EAa
J5YAYGDPJ06roS/WKDS1AgknpcYrSjffy+w6A4r8peQ02uC2yubzVHezZKY+vPWqYFzqNwxO3GqL
HYmWDoS6dyHzzZSTWiOmmkHjhLbYfu8a863K5vXElXV3R3Qhy+ueGcpk6mlP4Fan7bwUvzfxUscU
/EEXktnBA2JO2pZuq2xeT1Qa1x1z8V5HElC0NGo5RZ2HY1SXAKFBwdzWpcdI8IgQfVN3UFh5vK2y
eT0xkzgT9g4fgWlKsmhHlIkHkBujqiawYt1Dq2hITaudelUFtQz2ruTbKpvXE/nCIOiUNx+TYQqJ
Z6mdfuRFd1e59syTLJESTK0tN9UDpgHwLRwj6NxW2byeuNsBEDrJzB0RmGSfpfMGxOjab+2lWCp5
gQrFp5qEglUNJwU+Eervq2w+LWd7Rwj28sY6oqk9kOU81SOoqa2yblh3knYwuEo0AAgPoXF1/k55
3FbZvJ6oFlAeClQIijv1SnYjMWYwP4SzDBermpd6lhUQyqsn1d2Rp/zV2Lym2yqbT1udruKPhcUt
BmKrKuiGzquwpuio2mvTQK0zEfyk3OBnMK2o/gI7pdsqm89rVWAuDiApMCnXbQBhi7yfA/3BS3m3
AaRKXjrDwwsWCB2EIMHRikazfK+y+fgyZPLPb+Z9Lp+/i6V9/qZZ/rvfmcW/+7eCS5+/IyrfVvCk
Bwqe8p2C5x81J+et4HkreN4KnreC563geSt43gqet4LnreB5K3jeCp63guet4HkreN4KnreC563g
eSt43gqet4LnreB5K3jeCp63guet4HkreN4KnreC563geSt43gqet4LnreB5K3jeCp63guet4Hkr
eN4KnreC563geSt43gqet4LnreB5K3jeCp63guet4HkreP6/U/C89Df/8t//+W9/2+uf/nX39S//
62//5D/ByX/6H/vf//af/9u//Jd//tt//rf/CgX4leEkg2AXoW6kXx1n6saZSFXDJjKxxVtZqBNL
8uAfFfieVO6Iq2F8f1fg/uvz/2OiHQOGgCVh6fIf6OPys1SdWEnnoiDhWapECN7rACw15mg5D0cC
IVlPz0Q7kBsyl6bytTFF7OCySSeqWSdWcZ0+MAuDaIJ1k8onnHO6ErDs85elzN89LR2wRo6a0gk0
1wUAfN3FPg+LThhWmRCOQEwE4i7opkp+S1fJGlYZ8jPRju7rQZK5ECemakfAJth5ID6mfhUta+Ib
QAEMCJTA1Ktn/4lSOpzZ7Zlop0Tl6X6AOFtQUvdRwIWtKn/4kCpB3ATd6foBDgvIY4FDm2B4x+r6
Z6Kd2Nk5JRI+B4DXe8Q0nSr+6nIsa9eJI19pajKv/tNznSpL3KourueZaIeorvnjulzQxb1tHo4F
+p7E/93uQYecAwgGA/G6wgFbqhi8NhDsCc9EO0TTrEHGjjA3iXtNZQGqKXEJhD7gwkcX9onM3S5C
RBaNKWYdufZp86FoB1vcOpQjlA7L4NaMSTadSs/hYyDMu8bbseBZ+VP6GSJ/dWFiVH6th6IdwC++
M8gnAdARr7tnVxIoJxRpZ9ilFUzjI1UyDfWIqUEddRS5dAT6ULSjecoHGGC4b1QdnKwDrqiiUdOk
82iQmu3yUP0CX6V6IQq+Qi4Q9v5QtHM0/1L1MviSTyTpsXuHrW5YYz44Pz/hEV7aQ38dTVgwA+V5
DfKc7qFoJ51kqqooDrKNydW2VLMTU8o1OadZhbGDo03nG7JOFl9DeS34BGpvD0U7SdNvC/ST0Nh0
iwZd40Pr8gE/BirDDdgkoN0mb7fc4amY5YSEgKp7fyjaqZlVJCJfh5rLDb56Jd0fHVcBTqDENSwp
C5LI1XFTF1OuaI40CNenh6KdFTbpZtRRIdr4QgoT4ujDUOUBVJGVTULoiwwALV4sA3y5E6TlqaE+
FO3AdifEprt0JI7BF3TQnqbUVpe645jLrsCLs1BKG5CUCtorpe+5V3wq2tnESonHSnA649rmu85t
JfTYQ2M783WLKV0p6Dhj+3HMpFOAAx/KT0U7/gzdczUSeAJcedVyBqLTqhJDjazyuGu0snR6mhB8
wO5jWCkVGO0finYMbuP0Jjld96QDOyR/5iuKAMhLtFVAkLo1YVVV3T90mgkNWBjXeSjaETgKvkJq
vIoODhlaczHzjlKput4cWTYCGCGy5NQKaT+LdFBgXzPm/FC0M9muAyrFuKMIfSQrCLCS4mAieXmx
YuyTONDDWn2tE/wJ/GUNJP/KVL5NQCoNibV3oB+8bQG6a9H9dw+eLBSypsn6NXcB/fU2OswVUAx3
hJRHV+tD0Q7cDSA3B4RKhwckB+JJiuRV76LDiMaQahQvIVFMc6GTFVILK7sKTS8PRTubzJobhqGJ
zTq5OLwlgEGlolAokMUSBKsqla6zwgly1MWYLk9BF+uhaAdCnIiTrm+J0K+7u+v2pHuLzbGDqkYd
uxFmTpOeO/Idyi5Kh7y4PRTtAC3ByxucAzRWeaTTBelSKTUxJGKTqtzs5eTKq8GiRktyGfBtLP7s
h6KdMY/xiTieZNS4tOlSL0MLCSVed2gLqAvRBvauvYMqRoduLiBSYQX3ULSDMbBXJOxBOM6g1kAO
xRAy5qiDIciJZcACQBA8JMFS1TxZA7hoHnl4KNppJM4E0WZpMhlFZ7AqvfChNvI4jLCGI6WHqvLi
8RJpZ/JFJGsA0858KNrRiUJ3a7uuI4QSJ8THsbAkJfKcJNoAStDLGW2nmTM0qUud0Y/rxMzyULRT
nPSt0+O0oepJKvtQcTHePWc0nT0nLxXs0TWNKgSXilqEKVzM7aFoh69JkhlE6kjcDILo8Jyjwd86
jK1D5QiqueANWV6JZ6WTWrOfqw7loWinSBs3+bIgPgADEZTkE6uDtR5ISCgA66bSoNiGdE8qpAZV
OFdnMTv1oWjnKEaPXvB1wtMqB1sIfUbfC4l+paUSBCI0CRci50WgJ8A9Y1HWQ38q2gGgAHQKSMVJ
O21jEDu7Cm51Q4HdWoQmAy79lP6l4uBpHcIOYaHEeG6JdvzrhjlDCJuD7qjTgjVQcwdAh4SnOV52
NgIcpKv3oBH1fEMFF4I4yHcSpG+Jdl5PU+Ty4P8FtVfgyjqA0QPqJEMIL4+CgQKhJYQaC5yCCZEK
lpKRD/dEO6/HtQKxWHUQVghQCYy5YCin4hKhsYA82KpBG2Csuu6Jiw2GRyhcw2TWPdHO63G8BJF/
++hyLKRv0miE2fUuQWrQiUvm1wnAYqT6yaIO3UYt1Rw24NQ90c7rceBLV6yNEY0UpztW2wYKU9E0
Dr3LUX2gB2MmA8kmI6fDRE7XhT7Z6Z5o53PvVm6etctSX+BrXgfLSQVNsP5CJANrqighTQ30doD3
rcnmI6hdSql2T7TzehxBZKZagWO6Ps86mTyQjnhwZmgVuSJedfDQ5BqADCyArhrwbyOupHxPtPP5
dvmkIjULwbewcxPoGCLBQ0aeKh7iG8BvzdZUnHdqUosBI37DRmY+90Q7/vN+F4xawVZN9axEKJUj
FMi/+MmC7DSpetflKIajYMN4Pqvbu0aL93uinU9HmAOSEI6g7cb/8KkT6shBV724HVYKPCc9kf5w
QmxT95Y4owpaWY57op2/MxUHcxR5JNgLOaeZgCaubQw1W6i6mCxHN1tNV2hJ7K6GAGeBmq90T7Tj
Py/pVJ/ZbOl+1yR85QVI3Hg3ULMEA97q+rGuwzJmXdoLqRSwNjGn+HuiHT3u1/0SmAQ/IjqFfkn6
IfgFwyGI9a26GCBtgoyoQjs7lddr3LtkGjXu8HvJyl+Ldl6P65jbdouoyPqQp3eW/jAOEKdMsPEn
++CDqQrkbaiSTj5lQizqSPGmaOf1vOA9UbETj3VP7HM6vsBIjuQlvV6D5UcgxKQE+zouCFsMXceY
8G6PN0U7r+d5XVc7G0EVaqDbcmnq3dm65CDxAdIWUIyoudsglpEcf/WdUOEDOf2maOfz/RZfn+DO
fqje3WEwp6jOcYAu++QnYBcAs+/wdJ02EL8CaYjYEnu9Ldp5PU9RE2iEdRR2bAO5gHzpqFx5LLVj
AT8k6LKKU6afxK8siTN7kFOAudwU7bye53Td51JjzYhZGyAbwAt1A7qkCGy6dAUnVNHppY4TXnyS
ADtZltjzTdHO63mgvNl5x1wlMZqhN9Zw1F0cVI6obYBnZ7tLMguxFrVLlTR1pqJsjDdFO6/n6XtC
qSIWsNMleVfda4Km83Qf4M6YxjJWLpJbgUutLdMJ9swNxFZuinZez2s4FyuzIF9O6t4IYBWBy75K
Tg/mwhh1gKR2E11drWKpQNHkiER/4EHfiHZez1tsXud1fDh9JdVlTBW8DHYpw5ALKb+q1BDCoP4I
RJazRtoSAhDH67wp2vn0P29YPs7MwpWxQQZDdZTzHOySJ/BrmEPPrQwL4CcHkoD7xYQRS0XzWLQD
9D8FX0o6z9RhQ9VdrupQDz5JZiRFdRWvRDUYASJ1IQ+tRSUrn3RTtOPrByxjM6biSxi4PqupC8ai
ziHequMDyetslxDb1W2n5K4XHFmV+LnXu6IdPfDX9eMpMWQg9I4+m9RiC/Ta2jz8VxkC+kz44W9B
Jjc/gKBJ6EIQTMCNcUe0E0mrvfhaRlYLsXpYS92uKvO4XQu5Qq2/DtEzuZyIKHX0izvHRShL90U7
r9cSfGBv6tkGSunVp5S1b6OoVmyKby0B+JqXNDorTreBbmp+wwqX/pNop15q2C3bIPeQs4/ORNUj
rVwLSpI4gi0NZyaAE+YGoILADYFXJ6RHop2s8kvndhTkc6QcUx8ZNcQJJ2DdMFRJV4vH6UKIqqUc
WNPOaqYV/1xZ+1P1Gd85D6BIx8wkxelTR5hdOsPI2nhgloobSgNyHR0IV57Cexku0oLbT0U74QIk
sCh3CMUgHbdUS++mTH5PNf8aoOeSwZzTVyK2QTmHSt5hIrM+Fu20DZ7D/gBeMx1RcLI4OSD3rX5p
YIYTwXhb3ZS0DN4XUKly7SHI2VPRDkCfOBWI5yGU3bVDw/ea+P74OWAkQ0QmdpL506GNnD4RsiX5
3MPlx6IdsnccE4LVTiUddPiOk9gX1JrUV4N8phAcqw71R9H1UJ0eRCqdUJ9PRTsVj8Jtdd1JhCq2
eLWxSmF3iptdp8BkCIDEwDMwIamDqqsZr+gJ030q2lGjKt3uAgkCeRPDKGRy1fIVHJtsl0kDaTld
wkb8Ax4b94KJdDU4W/OpaAdWTqgzbZtFguBUO4KpiqIuzeiSmj8NcoTECzOmPtWMsuMzWOxe7rFo
x4HUwVZ86OIpBW6ni2xQc4fnqfoLmCAVt4eRBzaZMDQktscnIUGnPRbtDDCeGsmEKoyu2jPTRrGs
OrRVxq4XoOgs4saKYF4ZRNpNR9flzxW1P4p2oteZZcMkI8Fr6BS9qqw1NvBlhrnqxEWCWV/kLMAI
ldoTSf2BocT2WLSzgXFeqrSmdnfH4w5EM5UqkiBiyqribTseN6OahLDZkPVUVktQljzOY9GO0+VE
DTx1xUDqlAq+RLVJ9aGV7HZWLEvSy+kASR1ohhg2/CLPvM9j0Q4vFWOBBRgJwOusu5iDkST1R4U+
y9l5+d4PfymziUvNIVVHWcl+lh6LdoibSgHjpCZdy4TPSTfDn+XpyxRzwUkB29IMxNwIO6dpNdcg
Y2T3WLQTCRysJZBBPWwOUG/upOp8SYTYJ0AZQOWog6rSMeasnlOpBR/hF7U9Fu3waUGbn6HsVXXX
JA0VP0cd3+pIUQUK4PhEANzAd4I1GYKEpW4Oee7Hoh0v+QP+7gEv12nnCteJGNRZZ+xsr/ThUyVG
QBW94iQTqxEhQHCf9Fi0o/jV1JZubr8kigCkkMN775C7VNwBRjTeMLpGzCZBqR0o8cG8+u+U9Fi0
w1NcVZtgr6rajotgLMN03q5ulITtESSpw0+JgMMDtPLBRxphfvLjx6IdWDN5vPerzUZok98udfGU
bqyqoNhUdSKQkUtuRr73AMKhm3tITWmPRTuxgShD6J5EHlnIrJi8GoQhbgdJBgny5wBgQJZkdCpj
4esEgq0DWK/Hop3mRNX5T49kJmI3QWY7N53KF9XRFzDXpWzNQ6ySnQa2BdbXGsu+42PRTm6AlXUK
UaWlCmAq+eoc7HQdjW2A2/dQ+U4YMDJppiAVXnVrqo5d/rFoB0xOanemdgGgF6h4X754QW3XJPmG
PKiFQyLMmc57eHOdRRpweRP/not21G5Pett0Kb6WV9mKObIhOZHECK6xaWpG49SmAg88Tu0MADkr
WX8u2tGXzse5oP4Q5gGaJQDd1Fl48yT83AfCnqRPYvJ2gfMdRmvg79XPY9EOVGyQ82Ys2S/fVCam
KIrPJfx+DjxQN6UqM/VpEtpqh23jPcQ7EOx8LNqx4nW6pMISdWC1WTIcWZK1zRKyuT2oml59m62T
Elv0173DJi97l+Jj0Y7OPaPQ4LADxBjk9or/W1VnrVWGw3yHelyd6cLAjF1prpJIEkHwD+fIt0Q7
0NsCUhO6HQBEtV6CykCQIMu+GzlDiR80JYK7wNywHan4/d6VLbTHop1zJnRrqUeeKBlcD9KiNmUB
FyHGHdhbd7h8gB3GEhKhXVdmUxXpybXHop1EZKkZhKHGiR2Q21XLFXQ8cJXMrF1B3pG8T5YEjai4
S+bcxdT22Y9FO9JtkWp9jQfyXII/84RgDs8MOGeeI27S8NLBxFZVCGTOVOkV1Cbmz374o2hHjX3V
/zPgWHxjB8ckB5AwqnoGqydGixVsmqTJlaC8iefwUJewpTAei3amLioXeI8cQVaECObZvJr4uClZ
oiUy44j8Jp1JaDlSfqvpENQcq7afRDs76UoGOuJWc1dUPlvkqWiTSIHZT2yGHBSH6nWWAGLaLp2R
YDy/N2X5TrTzOqLb2AJJaELMAly3qadIWQm2Vw/2oTbl0F6MwnXcDzozXVQH+2tGQT63RTuvB8Jc
JiBimkqia1MjFfaoreN1OANGHGFENfxsGO6s8Nuuht7EAOLtCfm2aOfzFHlLQ8bOqKgRHk2sJFp3
QkxLauuxgBBRPQFM6pKjXq2HlV4zSGta74t2Ps/l/SCD9whuVw1S8Z2tvICw62GGDTZTz+IaBtsc
BM42MUci3tzHrPu2aOfz4ih6vZZ14EpM2PpWY5V0Tm8SxGcoeIHRrzivF79Y08A34/Hq8RBui3b+
7i5gSZY7xoRBqB8lBpm7essZ30B3OcA3TJcVPB4jy2Rh+H4ZYqXr94z0rWjnc1WDxXkOPB3PUOEj
cKFNtTM97lT1BKmqL7YgCauGCiwsOYiJkzBAULdFO393fxQkCmyhSIKjdm7TR/Vr0ZGklTpn1mEe
QG5D1VaJkjvgFhMAVUlZt0U7nzcQQ402cQafvPpXQTr3iTaICeSeZlXWFHmQDq9TJ5TpTrBHb0Du
9XtV27einc87iDoCoWbu0zU14rrhBqHy7bsPoye+xfaF0HLCVPFlENLGUw8xvVhZt0U7rydWlSnl
zFeHXWAOXle1xJTD4qqwRf2FfPVrqb2d15EUG6BMAStYf4CH34p2PvdxQmgzyNN58ady4cSZHCim
eXWW7cuZFBU689WNUuZ/U47wGHXmGH8W7fzPf93nn//9PyxW6TyLJEI69BrRsOKGevDWh1/wlzBc
z0qAMU0DOLA89elW51JB+fNMrBJ45aWieUC3CNTFnYa64q9KTglbn626fK+WD2WVIxElENMfNf8s
z8QqKuDDz003vdLWjaVDUnzUxlQz/NahMUcFHrog7QXIuuCs6nB4qVGfiVXOBnfqJFMy6ikZPagm
q77WJONQz4yrS92BhxySF8bWi/Oa2HJIzeeZWAXMCbe4EpN0NipkDyln8fy4+NhcjgbNJAkY/Y4Y
V25bslv1zE/joViFqAwT8wHbLR5UWIivE9ykPgPJ9ZgJBc1424NpEBGitBCEqaixLPGLRur2/Twb
2FrbaZ+gMl47MJca2BaV9+HtQas41OW4dN7fqVVcGKGkuOE18aFYxTkg2QRpZkfOUI2bl/elRWbg
7dRnrMfg1YNlw3dm2xny5FUX59lWeyhWgZa0DUk5OkTr5CBnKog5fBSRRrfk56jAj6hQ7Op5MAZ/
tsJQV40vqti/F6sM9swCK1lBoGOudBakiBwsoAGN6MAR3VGbOkFaHvxjLeDXVEop/jwUq4RUatH8
nVivWy1joVQ/UUVzWWBLxa55M3WUAZdRrTC/UZc639pXI1++9TnQBRF0KBRN8sQ1EkiYVQ0etrrw
TNi/V3l3U4Vvkeh1JIgWMTyn1h5PmIHkqTs7vBaYpuNJNml4NZwTABcXdFHCtLZ3PKRNZbQ6Y1YH
2i+c7gexivQ0avolbWBP4I0urKYKAGCyU42UC9cBVQGbpkuwsCVxqsDkOP1DscpQ4+aqHoG6OYLL
yz51IU2OaP2SyYxLL28JjkbaheU3grOqbfuMTyfMDMvsOmuowhgNCjnwXIPgCnG0Qz5Uk8Gssmvh
cUAx5MxjX6z+l3K778Uq4MxaotpraKpT3jpcBuUf1YbkQD5Y6rUfg24i1cfmZHWOqSkmNc36os77
e7EKsPts3RDz8ZLKq86gmc55IMKq5Y7q4DmA3IFIN9qaQwW1J6h6cXwx3ex7scrVdlQ5u6sTvWra
ljoIquBNzV8LMFW9uNVgiWDqg3poz064swIknfZQrKKjlx78JEBJ1q3qG+nhdDVC/MdCBoQb2gnn
5SWTKjZhBC1t1Zz3LwQP34tVMsaM56klFMl08s2X6mbVmy4rCQT+z7aTYl0yPJL5UTfko5pM/9VQ
lO/FKl5nOT54NQUFcSX14Andqev2GnzwHoa3Sa+esg9A4uTjTCtUWfQfDppviFUi7Gf7QSipkhKJ
AlYHlr/IBNBkkAJXmUGD1+SgYCIJ2Q+BGhz2hcr1e7EKpLMmqLpu3uNS02gsDh8v4M4a1UlZCb15
A14flTbxvgTPqatf1nU/nTCD2ROqTFV6pxQ/khqYeVDtUatqCIb61Uo9aDy/qv2+Aws6EUOXTnoo
VtlWejpVzW5c1syHUQzsdc3cSjsfh82ooH1sf3UxqXXp3gv2PdVKdz0UqxjGbyrKDD1q2AuLBqwv
TfOxUs/Wonp+8+aO4ApXq23iDYKbbZzxBcT8XqzCAgWdgrA7urglOwBHNJ9LZ5EugClwQZLPCTib
BtaVjuPw8tnrGNEeilUq0cqCRgqmgvuBwZba4XoTTlbjat9UNxWwRRW8N+m6Cmmi9auPUnooVnEC
fVff/gqbV2uGNFRPN/MitDnpxdQmRhd2bHGUoF+d27FidSEv7aFYhYSqQWwai7hcn1un8OBLU6/s
q7+Jzrh99+zi6aPyJdTPJx1vI0IB80OxSj5FRSOhbNbKNefU01iyEMLvuFrAntmh0J34vCHwwEO3
1gRE5dXHF1O50g/Az4DJ5IWkvky2wa+X9gZ7PUWdB6JS4RCAHmpIV6L6Eg++5cELR34oVlmzDtLM
1Rhdel28N2Wdl4+uaaKjxPDrqQuMOVTNhcmopnDp9GI8njATCIemtrFjYm8aBVT28sRgctxSnyHo
PJtLOB661tqwM50V9J63m6M8FKuoa+cCVeXut7omrLqGrrEwytGaGhQEFZ+Z6h2ipIZJLdFqxogm
EGrfE6t8VPJpHM81psQJVLaxIXF+NFMnGk00WwPTGFdzv6SStC6pPhhaB+jB7XZPrPKqG+QtRBJW
x0xmq9h/VR3ayW2CvvpO1yyWDMPsPLFeAlhN69Ncm/aV4OFLscrH40L2eNuejqB7dUOKAZTZ1NMm
qD0m7qy5SLCiPtR1YQiuqXdB72S+nG6KVT4eF+sQDyZyAaZD0cGk2vqsOdXj7lf55fKkBk0ROQDZ
pFEY6qHJTjZfb4pV6qvdG4kbLtp0XKW69SzIpQOBsDwGAk/Jv/iYOqoP9e5WIwJY3pHEKt8Uq7z2
zksvtTqAiHh4XefXoNGgqWOj5DiFUPUar1YlDQdcqIAZztmv48ubYpX6an1qGkOcTwPMAuNmUldn
MDIfuLaK8dPQSBjwi1pAeTWcnSpb6fA9otpNscrH40iuHsgRNC0uSCPoiSSkAjXPJVWYjhfKCeA+
tYKy3MVHVE8mke3udlOs8mkqqrU8mhxbdk8XyVBnDCM8qshuw9y9usSziqZRBs0Lcrd5VFtkd8Uq
r71TxE+iWFHX+QqFLR/dgUD525WPCJ1H40uK+mSqXMvxxOlxn9PzTbHKx+NIJ74SG7snNHXYsl03
T/kASNY1AYwgUK7hAtgNFqkxzH1qchvE+uSbYpX6qg5pUanMYYUqWeoxkk1XM5BKVH2welhr5jHR
BwuWBCFsb9PFi9q2m2KVj6Jdvq5mbmlYnAvqn8qvMQ+1htZwhMmXgKXvrJE3pQRyLy6jAgDNoQjx
5oSZ1+OyutKH7BoJTY14B6ldiu4Rt6YU9AJD0F1qXHOp+9wSYwd8RswKPFbvilU+npeW36VebpR6
55t3lQSDxK6zSkCQxidoXpC3qIFVog0WdwXfgqvzbbHKazmnpr0oUaeLL7u81X9QRfPXSEjV3G0y
UdyCnYM3Pk1u04gy7PjdCTOfz8t56lohQUwlFXYnOqdZYweWZbpOlAnGYoTMJo3fUg9rYDRZS9Vc
d8UqH8/DwPfOZakZt4jiUhcaterQoT+oWvWauKE6dV5Kx65+I+AIOGbh3wh3xSr1dZVixJC4CZl9
ZE0GJZB4dVSp/AAiSwxIWRf85HbVHWzyflGX6TPHH7Dfd2KVj+f5BPSYUn2bmkqoOpC3lYIYwJ5K
bRoiXDVzXb37NANMp44gbAjMWXPeFau87DMVnJzo1PcmPE+dZ8QNYdWJRgxh1dSuAlFImKjdkMa9
KcxIX7LDXbHKy14qgTJevc1NEwMhXXMpckeNt4bczg1xz1d5vdpBxVYTjgjWsB6m63fFKh/Pi9f4
jqp7xLoI9hP8qbYuUIGtWRsYZXYgvUAIqE43Q5fS3YZpdHIvd8Uqr/dzKh8MfuHFTgpalYMClNSW
RzqfTCosk38W1d14/mIGEG8SoMvd/d7I5ZZYBXSMne8GWnFNt5bQlNUakHeveSppgjyYDZ/4NSBQ
JyD4BBEQyvmHXv/fiVXKR/JTTWKpqgTbgi9G8ukaBxRDVFloVa9s9YafoG2dJWunHeF8AHbH7wv6
rVilfFwRh6nBgZL8rTEkxVP7HfVQP1NtCtaC9oBXIty9q4Ocm/moWgPyq3LGO2IVlQQvuIbbWc3D
E5+q5KOz6KLekSVI2DGd6+A2NU8FZo4s/cMiY/1+9vCDWOXjtWJTSUud6hjjdWSThTXZu4KvOWtD
grEgferU2MYzzaCc/lx3J8Dhn8QqW709li6UitpGNF2kbfJ1yrNk2SHmCTKHfYmUBAil+mJnacMw
z9972f0oVhHmzkYUKlZHy+pLpmsdHc62QERUl3+Aq6ilzDBpwHLQQU4ERYHbn4pVwMS7KxASiuHZ
qr0HOGr6Me+oeSTGvgy1we/xqGMkUHPpiBXKtcq2p2IVPqUSptTwXVMmyJ0SKeroENagCdwqqduD
LVKtxkxqzHTp+5Ive/65JCn82JIdFNx1yrZrzir+rZr/DcNrGegOvZrXbCI12Zo6VrGmuXmSwA44
RH4qVoE0EoRrWBoAF5RLp2HntWlKFiwl6fgtQXu8jhvL1iC3AubsMIoyuj0Vq2zdZcIMfEkqc66a
v+o0maHGqzkAphMADpnUHXqucGVVerlRuld79vVYrKIdWl2Vobrw9PDKGE/rgL4lcKZRUhKKda++
CPwU5jrUoWPwmn+QgN4RqxSwjxQpODj8JkVN9TKxLt4yAPF4zymluZptl5iKLjjirNCmyw/rU7FK
T71dSlmiUhsEMACIiqg170wNTLoueLtXJ02IX0p+LePPKjYG6v1CvPXjiCfpnb0us0DFui2pIDz5
wlnXeUr1I/L+JLiKw3u4XQRvlmtUJDQiPRarQMVrtDWLExTPOlbQMPflVEBnBpYgMbm0VSxQbA5w
L5yvFXNSBX0xneSnauAmoKc5RJfS282Qupo4QNS9MKZexU/1H9Kt3dYgySQZW6qKiP7PhZ0/ilUK
fjWDD2pjWzJ+Dfyztq6a4KKReEN1Mwa4tgKe8TkBLTpgH9RGHHWPxSrX8W87MbNpOum/Zn9h9g3Y
GXWM4rJdnTs0x60FBTPQmVhSFQ+0x2IVMt7uVaNPVFkNSIrEZ/jcOYCxubNGlHdNbSTSAuAj/gGR
kcoXvNiGeyxWsXJ1E+2qPFwE5ZotxZMB7pgOu5QN0hM0kqlpZsJ1nvarPzxPLV/M7vjJLQBBPWrk
16wa8Q4lknARTOYkPeCfOj1a8CIQFCBY13olmCojJjB8h+cTZqJlPC+F4zI0ywjbRUOrdNWqYSsO
GAFHADos9U8Mg8QCFd3q5KbJyI/FKmo2tTQcHgzZ3NbKqgNV02HIXnyLeMZwhLZdut5dbdKHhEJe
XQbGfixW2SlBiEhPwIgFlsmaWj/V54p30myCgb9FXHIvr4kBYEIAvSc/jukgMY/FKgrEYPEAG/Yg
Mzxjl1S6SkiJ578QBbwsuGAzwPc03o2wFPxQ7el5LlbRICwCyFRj3FybpmbUTqoYkk7a8KofNeJM
ld7Hti4xWfeVgfyw0y9G2vwoVnFepaPeVUixZpUWXX0tVpCYStIL6jSpvoyAw6AuiUDSsdRo2wRU
92OxitXos3pLLEygaFypqDThZTqJDUuKBFQ1AdPol5GausZNtQgmZc70Zx3ezxNmRghJ93be4HYA
CdJSc+zYFhtJANBCriSWqTwXjD9UUKr2q7rd6G4+Fqv4LdYeg1pgaYx96E4hbR6NzFOJoyfzxQhB
zyLZWBPu0TX3EMy4Wn8sVtGc85p4LVXKq0Uonx3xNjigapL6NWmxqjPKkKq4qT2LxvptyUpj6Y/F
KlfzvtJHceokPXWRD1Rrapg74phS9x1yxNJKg2h2kNxJWo8qmOjbY7GK6gZ1cyfvmulqIwbYqIsE
yxILHpc4COLstNotG3BDh3Xq7wyZm/6xWEXpRxMqMcqmLpeeaLPJxhqHQI5ySogsJVFdo5EV6UGl
RFHjO2pNnk+YseWbElxTZw47o+6AedQsJCwdHrilBoKQ6rJhvVEnS2kf1qFp6uJzsQoRsZYhyz8s
ri/D6WQTzzb1iAvqBrnwh+QT4ayRkBOxQiMONELvz3KcH8UqV1mVh8WOeCkpIZ1FI7qEIK4JklMT
Gc6GvtioFfxTNFlTXVHz1ef+sVilSbnsp8ZFalo3/PxogLeXKNdOWWHmAgcdUFzwx0lRtwPmIwma
uP58wkwA3kIOS138T9AFHIE79zZVO5CgqStC25wHpaYl/ZYJumG0pEjgV3gsVlH1elVby6BRSK1e
JZUCHaT7qQx7CX9NJ05qBOuuBhVdyEZ3Iac/nzAzIEzSBPQzDh9KdtR1y1on6845ZbAaqMYUaVhT
dck3ncE4fiCC85NY5f9ko5BvxSqv7icEFFg6nEnHO02DwpWP+NYNf1+FDASiX1Jpu7I05impB9MI
0hzsuW6LVV53DrpNy3MXdRgCaTpW7RrxDiJztaqv+ylb44m85hMCDKPbOkiB8swd232xyuuUnDcK
OtAH6lWFqpIlPpjXBB8wVD95gRtxSN+PJhiAuKGQxBb4bgrpvljldY5MyAAgHZiLCpgJirodYn80
XlDdpq3yI97RaUatac5OlVysYqF4SLsvVvl4ouTWYDzVLas/Frluw3Sr5hGGoNjWYogSiU2nK4Kh
5uoAexCjqN3vVYjfi1VeZ8lebN2W6K50oSBFtqmtAJ6SbjEO9caP+KH+ry6YhHoHb7fHdmGl+2KV
l6nCE1pk4SR+G7oFkBkWGVKSzN/hGCtKyin9zJUy/JIKrrIE7qvZRD/dP6gdMrl8SqitflUqrlor
dg1IJ3qqLBj0DZirqY/A9hFExYf7XPzc+/tilVfXHp2Wa5JoP2pNbywjIBPYrelyV2vDfM1vrXEZ
GHHv3L1XHMBaq0t2X6zyumMh7JdrUg75KGoa5b66IcQAvtCkUUBV9Mq2QaNlpVpZkPEEN50arHxf
rPLxRIGI0bzatPk+TGfnJAuPvwR1mVWpZw9TUz+JtFfvHf4OOKAdxcGz74tVXraqOykNb1T1u7oI
LjUk7zvAEGc5NaY1Nfw0QPCjrl7VaNDpukwwi7T3IVZ5Nugl/10L1L+a9GLZq+Oty5Vsqfb1pobb
oyqPDmc6ivfJqeMpvzJV7hCxhlev0kCs/j8y6UVaFjCQj9AgIVoCewdjkuWUX9NxapdNGnCqpiRk
/2owrRGuya/WHk560XACDbLuTq39oq/L6+Z81k08Wd3lS0vk4lbZCXy3eNh6apr4TcqN/Zl4RhPg
jiY/4iakFMCq2vuXpaMrrPo6pVK/RGPPW8i2eGcCh0azXIM9nolnmia7HuL51ok3GNqRsrNFAJGb
bkNEpiRTzpNs+oFVm8PLp2AhO/9FpeH34pkgxjH8qr5pXhChHgtR8/Y2NTmJb3M07Wp2DFt4E1aE
EanyoynBPxPPGG+Vls+8HwHuzJisSB1jk/9vOZawNLwgxnGiGrjrzjlOHS4BZW3lZ+IZjbUNaql4
dNKda9KVDXhqk2SONLULq6xqwgjzkAMPp8GeLZehxjXtmXgmThs7Xj38L20HrCb2QYBwagwMi1Sz
FQ2iNFMdXuddHdSgq2kqeKE9FM8Ahz0omEDfFxROzXIljolqu60Kx6VuONd0YF2TbpIM5uuyiqPc
gCw8FM/41rN6KwQPQL2k2+ZBC3EudTbYuoAOKu0HNUMANINIc+b7uipL9wxPJ704XT2OfgkUvHSz
+Fi41NdAhd2Ox8lHMH80sD6pEFfca8DG1EjwqXhGzXKxes0o26BtPq2p7ELXW76onGqqpeaJS8gc
1wNOZ1D1cT1rglt9KJ4ByPelGz1iRFOfUVhUPX1Muxq5dpUcAWV3ucb81a3zcqfC7NBUpOceimeq
eoNqjB4Y3dRLAKqkFjymkURq8x/Use+AchqITG95dGkj1a7adz+d9HKgukcHQ1tJ3vNLRY2uC5mC
kVSNnJDtOLXg2Ff7fadGun1a9f4LJ/9ePMOGqEi/b/Bpgm/7c7LapkPkkm86wFzqb8biyUYgCRpJ
UjEsQlgIaT0Uz3Q2pk9whiagAKBgn1XzAXgfdUw4Gu+pBKuAUyMIZNSl0w38Vd1J60PxTFW/N/U7
1Pi8qssX9UkHzqksWuWLGuHhJwBTp1BYMbCuiTmq6RZ7+VA8A5xp0UgCEuWqy2h1wjqEk6iu21IL
EFCqjoIJo2SHqbYfm4zPU1cPD8UzR2VhanKsYkM1mfPeguY9Bvi1LYJohShL7ajpOZDz2IVXx24a
fBTdQ/FMV6pWFwGALsaOYaqDj+LigD+yhPhDYw1N46QCvHX2g002GJzGufWH4hmN4pnrECqd6Kea
hqsLS3dqNw4N1uyCqglEmtCj5kmaiTLUDRMHjV/MNftePHOu+RVbnT2EAaM2hvCopqNnQ8ejurVD
CyIc9mjeUQLABECR+8WfH4pnBO54rQRHwyCNvYlX38/dQfatay6chIzdpEgVryIBzevkqrcyn096
iVdpd8bK+ZTTdHauQa9xaXQUYFOdf7Od6+ALJOHUS0ld+FxhN3t+KJ5pHTxghWAc54iqop8ACDZv
ZScpl0vrml2jAXEaCIrL7aDopp5p8ws3/1480z1vpql+KW4CBXASW9TViPLo6VVK8xTUFUbSdPVK
VLGTJrNoJsQXiumfxDNZFNpLxF6HCr3ZppBDBAyegDsvFZx4lUCMnEsE3RM3VYincsr6VDyzneTr
Dvi11UhBg++Adp6PhklV/Vaz7gg8RE9p/tTnpKtfVFv8K6E8FM/kUMkBILhLREgIkQZb8wuymKh0
72ZELpJNjtn/+oXKz6uqGCyeh+KZDvkD3O1Nnt2S+3ivtj2QcG+pQxwCFHz2q0WoysGlSF8gMeIO
GW/Mh+IZnRWmBLlr6mIyvAQe7WoGox6hat21qlpDJDXQhYkmvDGomkc5b3v/UDyjhogeKqXht5Uw
BYVXI61rqif2MufGeLICp0Z3JHKUbvIIODof5fEPxTNZcotJakmXm5NaImBkqeCUrHe1PXWiJ/Bw
R/4uUEsTwlbFQB9fzEv8Xjwzqjoc1xqCDnvULlN1eFGsw3A68kxMCQJy+Gio2DI1y9W8EIPa2RdI
7HvxDMRwYet846MWvE0drHw/Orgg6YF9MugLtKROW8NVdRF1KsfqS1Ulv/d8+0vxTPbx43oiNU3y
kwatFymhVfCgXk+ailM1jZvUoxrNc9x179t7UxmBF1nfO9xSz3w+TpuWNR5E12N1gv8OQKt0zUEQ
o4Qa/O/ivq63biRZ8n1+hTDP2wBZmUWyfsA+78M+Li4W/Cj2CNeWfSV5MLOL/e8bQbUtt9uSzrEY
WX2BnjvdnopTrMzKTDIik/1S1sH4qpECDQotESOXfU0/tH16WT7zjMeXaIZyG947DkelikS359RV
7o9f89YyMnYjzUQ6hBIWJWvmh5humvotXaaf+W5/WGjc2PTAxvkYnIxsAqnRyv5dTNdtI/82syTh
bAjOXuE8Pr6F2X8Ywf2ygOYZjxzlzvMO3yWbPSNlOIa1JRavbOHFgiBVnCaPeGMrKk87bm3n1TKW
yxQ0z3icy8HGZjMK0oTcOaWV7+1XRvBj1DbbVRoHyuK4JvbERpz1zfZ9Xmue1sskNM94uSAbz2zk
vQxLD9sYjh6hW13YI3uaKX0dK+c1ohxf2R6ZTfmRcAyIXajNLtPQfOcOuH+t1m3meHbYCan6yF/x
j7njvpLnX3PGLbkWMiEKYiS726BImuduSZeJaJ7xJmQMZJ4WpOrTvm6Mom64bko+mhAuG/x6Qeq0
1wn/amJ7i3o0gtn3DQdwmYrmGW8cGU7Y1Bw5JrbCiqrjtBArhVPGqY/jiMidij22xCd7DNsbRkMi
uCyXyWie8crEEdO+Vb5/RL65kZCwsttS2lAZ41IbWG3yOkAa6hw1y7lgyN1Quo/LeJmO5rvnOW8z
x/LYwG5HbKzW0UrZtYjl0DSM3cbR8XwpMvHD60ZNGO2Ucvx1uUxIc+A9vdae+OaUhOthQqXSb/RC
VH38YJ+nnvJJbJZDuPaFslJ2R3GkKyNJ3GNvlylpnvFW3FRPAxo56rjPW893bWT/rDAPBFl491iO
ZtyMDR0Hw/a4zetwjLFbL5TSPAOipKz7oQFPqNbLPOM5sS+O4Zojo5kf7nCUfEfFrCyzhTYOrxyN
vuC5F2ppngGNSjnUcH0ato1TpNfCwQuTs1PWmOD9jpA1cmMrANmaCOBdQhlhyOzLhWKa73Y47AN7
NxUSUrtu4sdyVFsjyiAUlCsTzczeVgtzxX06XqeR44+SqEMCeama5hmQx8KRE+wyw54e1fgFhnPy
JtLKOOEQzslJcdQRcfIeEpeUV2TIHNFiF8ppngF3VCdTz5FEKInmjFweVuITk7+VoovF560MFXnS
urBbKC4jwzWKZ5+c88ku1NM8A1J7irPosLPCjiF9ZV9o5GwojxKxj94JHXvnFfwmSkIWOMZ+DPvp
PF8oqHkG7BBgfVxJZJqOF8i4ODMyMiRtdXGKXBAyYFeoBUnymFEcDk9zHtmVab9UUfPdI13ZcwKV
Tx1mlkjImnG15o2Tgyr5a5ktVnGlsO0jcjU4O+fo9cjYti2vfqGk5jtAChszLm/DQRWONmSPAbab
QF6zTIntnmGkO4f+GhJ+3DtImzbjdye+xrtQU/MMOJG2lAZ2/mPjLVTQTkoF6Qf8Qs83yEioOCkr
jxtHVPLV0kQ1ClWzfy5ZLpsAk0jwm7EfvvkfOLE4Ld3A+UR5wLVKFgTy/p1zTlf4BH8A+8pX8nmG
P/eAeUVUg5v+24SwgYeDxziXHYk834iNyGyHOa0Tzo+j19n6GAlkmpFZsLjvp1zYsr7bt3qpquZA
fLrbyMDhTFMUJQi6SIlwgPyuO7PZOa4dijDZMBi5E64i1E6UpHEoQreN+c/Z2kuyGhzVwDdWU4dV
4RPI33Nis1z8/m3CX9hMxZOE+a9Ujj99n8ocLon75q+7ellW87wvZLAJ+dDRRgDezt7wGyJFXobq
bAZD6tPElogLP+DPuNmRlBpfkYxrsj8f3c90NUvPZl5Yyta1sHNTvy24SwrnT6RcbC6oS6ZuwkWD
ErRf8DSPT8wbpc/5z31A39TVwKQRwPkGbKR0eRqQsCO2jCSqjRwmTFItFTDcXMfm9BXxoB84PgyF
9H6trubgefEjiZVxz5SVOLLNyviz2MaRa0eNWdk3YVjyNiHhQH0/TXPG7xyuHgLDpjk7MtyZ3Gs2
qyykEiLnYw9TRLu9L4X87H5GroHQyK7Aoxu/2lSOB7xWV4NKeco7SwJ2vR97Sog4/I60ox6XNS6R
nPmpauMgSWyX1jiSWAxnLLW7VlcDX8ajWZfxeHHDqnldqEBOc7J+pVQU20TGlxZDUc9ejhRP9RsJ
Ufin67W6msUQcjpnf1bcROu0lW6HP3BKFHu8bAjkKLwQanzAhTXwI8uATLuwWT2T3Wt1NWRqJUpA
klEtxG5HA6oCwA79CMNBDsgJsbDJSmY/IsJuHa7pHskZqvfuWl3NyniJy2fZZxQiKNon2CNfSqBc
wWViK5sk5/3QRqDmglXyHQWS+30Z/IcmvJfoarqBbftH5FzjssHkcZ2wC3aeJ1xP7DXeUfbeL5z8
xLe288531QvbjLIh/Xi1riavbOHZOZI+0sA44iFTrwTUAY+uZArLPCGXhqsgqiOPQHZmpNjyg9L1
Q2CGo2UHFUM7EMZpn0cqjXeU8HXiVwVsFGnmMuGZjzjYYRm7fTy6VpKoPV6tq4GteJ0TEiGElrQj
a8XNyA55Q5ro+flQ2uHkOJNyZ3e5tLPRIV8S0Niu1tV0O+7fjoP4fOVMVs5+GZEYHN3FZ45bxp4q
hSDbNpYdGRLn3sJPxq2gKpuu1tVMHL1KgcXCvACr83MtdoxT4oRDGM2cM7tp8WVnV3aOfhryjpRq
YzfA5WpdDeXMaSFXZJjYe6vbJw5wWzMHnK07RxviN0x4lD47p9Di7qHsDmEetYbVq3U1SFbSTqHo
jsIHefrM6LCsx2wutkTCA0aNUBc25e27QxPMWYHGyWVdX9ardTU9rJKNkxe+yGU3oqFHFsFbnI2E
OKGSo2b4Mg+lEPKZ6kxaOLuZDRhtuFpXU5ap6wpcDS6Quo1qQAS7HVXCum5srYiLGzcrQrAteO4j
PHIo/BSduw35fLpaV5NJC9j5znPd2D8hUyLF1y7WTZVC/Hk7vhaxpx2CNOoXVLaDjTOKW5jYfLWu
ZmdrvIylB9QAK55nKog8MzvNIxge83G3edqMbYwQVrq8ICgZBw8gDcBxX62rwY8siSPPCxujjOy8
CUcpBYWQ8yU8x5JQaDOOJBEh60b+wibfPXCRza9X62oQ1DnjqTo7wlN7jOS1VjZ+3Z/ap6IeIdum
Z7uyYRu7img/rwVGxnG9+WpdzY6UvNAPckqDUaFYsYFuh6MwId0RKtYto0yCcS59Ri5vK0kxLHzZ
heNqXc2KagiJmrHbv1PQf3QWdF5exwimboQ59qRKIQ7yZdA2IFTubLDAEQPj1boa7sDhjLi4UKug
OkjGsYTwe7ZHpyxkWRAbjtmLOxu4lzFNfOeKrI2fQa7W1WyolRP8EBHVupGvJ3BMI1U1RoVpYhNV
fq0bOBAGJcbMj0jrNnf7gujc71fraubCi8YyhSAcHIbq0TcqkRPHWuDfsk9FZSvtCTVpP8OM+NWf
7Thgpn8NwG/qapYuc+oRG4sebP7xoCCmunNbM/ybUxjXFWXMejyEnVPEcL2yvTE7yl6tq0FGxCRt
Y3upgWOfppTGrSLVoO+VPifOlmf3StQeVGH0Y2FGCetKM9LGq3U1G78PTzAPXM7IhXdqyseJo+Vr
l1EaLTuwgcgeztj9oU3Djqm0wYX+E23UW36YUSztFFaS3sJRMF5ICOcr5Yls8MoG2COCUebEcZw0
pXeoukdOEtzX7npdjbEvWi04nm1EqTuzaRDHi3NQM/OWflgRuXAlTKgCUKPN3eqFfZtWVPhDf7Wu
Zl6miW1at+O7P5C6aUQZSo0eu3qhih/h7vgvcApkIHxHz2uGQmIv41+lu2/qahJbOe5Hk62drySd
bWIQC3G/DGxKy8HQMEdc24VkxX1DUeG4ZisuBWozr9bVUBNfexjETm38RtbyMQAFj4zztaxSq9ex
H8NCVvOMcNixU9WCR47/VXe1rmahiJS+N5PNOld22uBX94FTbwx7x52e+X1zRFFfOXSudiQSbd26
sD381boaUl8qHtpCcsRIrSP+4ghqkstwd5EKSn0ErtShLJRIdhzxnBG3R1I73tLVIKjVmdPNElNR
FO4Lif0I7Mu+sk0rv/s5+9HC6ZaD5zr1XUUSM07jCs+7VFfz/JqOPYJI3MOlOFk+piMgJ2Qr5XHF
f80bX5V0CBAc2lNJKJ0G3mEzrrEy/Fle9pqw5rsXg3w3vKPEw8o9BzYv24qCiI2DNn4JzxzJWddu
76kRLAl3d8cus7QRZFr9xcqa717Rl2GenY2Caqm4tCgNREHG6e996uuCJJFc2pGfUNeZQ16HdfI9
bf3Mjs2Xz4F5hoQD82UTMpk8DQPOEvU6GzAZG58sdeAHzWXlh919Z9vCYUUag8QCLtGtPwiEX9XW
fPcSmy8nxh4RLTFtQRbB3vKoHRwJvS9HlbgM3WacVo2sf0RYKkaqALKfIV8+CeYZsvJ/nZZttIVf
HZGXogrc4VrsDl0ZnwyOWRLCf8K2CllT7ITNQQYkelysrvnuwfIjGe6XbWCiaEMpLNwyX1WaUyoE
L6GEaJ3ZIptNHth8h8POE2Kx7xfLa777aDatqH03FBXItBEMAc9YwSY9FA7tc0+BPcLJkLoR+TCL
ZOs52BeJTr/Zxfqa7yAppJk4dBgeua378WEcmScuFdSJM+LkYKl2uBD6Y9AEeznVdUAKW/qypeVi
gc0zJAW7VkmncHbq69jTrB7vktl2cV6wQQp72R0LRQa7KqFETUir9gk31pYuVth8Zz6FX+MRfZdj
/BE7LeAe8BE5y7yzOfC2sA8dh7SQGoY7Y0IsnNIyroeg+GKJzTMk0ia2bOeIECTzbNqG0o13eCoT
Z3fPeXMKMZHerwfxYqd+ZE/O6qAO68kDYUaUocPAJjkT5zR4j3NE4rbisut24xQ6JpjsC+n8BtWh
nrTR9o5t9EtdrtS0oJBhg9k0zAhI68YGG0CvjurfJlKG6oaAzfdEqMH5RcxmPmn28nVSnK/UtIw7
51ssmaN8OVFn4bxVtmkz9nWHDZM1sPvx5Ws6XpgxCRvgWOu4+5Walox6G6ZrjgubSeG0HLxJnLRx
zOQ0UMPAjgHOtw7YDdWGOxt9DhzgNF+nacGFk4ZpRok/k6yP+IX/zwxWOvCdPpwSSVDdqUiHdzBn
58TP0gHZcSkM12latkpy1srpXqR/Iz7OKJkyKY6oAgaOwkBWstSC7JSabQSzFckkQg9uy+En/PM3
GvIbBwiww6Wx4xhC2dh109RtqCmwyVJ6GOPERsnMD9KOVGTgS+mB3Xt+Ivt4lVKMxfFrSeKd5wVP
ldr6ccwTee+VBoh/jEwLFX/Hr8HIVDqqXnEf+jCMP7HJ1zUtqEs7Cr35GtHrwumOxm8T3eg0B/Yv
xSl1HeeaoByHh3QcmYISljShnwkVXte0rJzTzuG57mxciyCFGgpFNzs/jvz+s3Rsx7yy7e3iOKt9
Xw4phqPWy36lpqXnF1vOtZmQQXEOejfh/ia/0Tb2sejw7NivnxxODvZFSYNbJuOfwHt+eAV2gabl
aKhEOpANqNjYcGg8Bl0mbIOtVTjRHWUj240i20PBT2rHhJyhg4NuJV2paZnTsrJVGp5f4SgAKj0X
TmDzzfrKaU/Zp2mbO+yLHcm2hAeBG3xlfFxTvnYgDGJDj2KFIyRJ52LTRAoXFnJSx7wtbJ1LKnpF
3mhsW1U23gQ9JysgBbhS0zJNcOyOOhrc/rgkcAcuOC1qCvMA09wWTszdpp2z0ZB+7HjSC78+Z84I
9+FKTQsi/DJMPWePrwPST7j5gNsJIWf3gc2dKarK1NnCW5ANDzt5orNzBFUefbpS0zJQCDz2GwlU
K8M5wgq2yvaax9xTHFUl9QJRZ+iGlZrNhZ/VK+f62H6tpoWvezIbuaHoZTtIRM118GNaLo5qHYDF
7oxsCutsJLVgk/CHpdATUGldqWlJw8qeiT3SBkssMVYYOsmSBS6YUN4Px0T1ccYzTktJlLjsSJgT
grl1g1+pacGdtfDN2YTSkmMClw3VKK7leYW3IZ7OhU05kJlVWDDiHKxoIceYL6H72fsrNS2p4KZC
vm39nPKUSGHG/T9PT5TejnOy4dOFqqR59Yk9A1gYICkedtwC/ZWaFtaXx3vKaUZ8YzNiqnsXzkch
Fx0G4xviDZt/MUtjH4udo5fxNDiXO189EGZcth6he0D+uyEXKsV2NnxdSZ2GpW+wjVp3RvfEuRR9
GvudjUuNPTauHgjT9R0ey0wHnvjhHHcFx2R3la9Ce7bHQbKZpqVj6zNERUdFuuG5IoqkqWxXalrY
PIIVRB5nJAzIGI+mSrgiVzIPOe+qm/pCZug8jD0jRN6pBO7hfjDi5UpNy4zyczqaUY6J7CYmnHw7
Y5vBhvqx9shT9kIrhYHM/KrGDmvdQvLoOtUrNS1khSbK47vNKewyY6OcDudCrVDC0U1syt9xZjau
AuTwALIVjsEZiHt3paZlm7g+kjp2H+i3ypm4uI8XzpA8FAn7lNmYK6OMGtgbjw8X2TQ8hB35/EpN
y8rxTbhvFwp0KPYviKBp7mEbxn4He0+GrXO0UOFE3j2Vpd9X5Lzzxs6zV2pa5ung8JGdbDAIFEgr
G/47SaH8NMcYgORrYUs1xEYOS+vZrhvxj4Oprh0IM/s8s+8yToKX8oTraWQH5x6pEaISWztP5EyT
2VTYHK6upFUXylyQr5UrNS1DrvjdqI85C6hwbsFe4cn8cNxXDmxg71cK11AEltrPFKT0qedX84p0
fr9S04KyDgVyD7vEf3LA6Lgd/W5xV68IBwhpE127I0dgK5kz4zljkoI9QzWSrh0Iw6yV1RtsgPwo
Us+wR0QJ3DD8dL12M27QHvcc53SjEkKw4ExbS5X+cKWmpXfcuGxql2YOHMg1HdTdmTQ3lCMUg8M6
2a3mSKbZgge15T6P7Fg3zdcOhKkTDw5FwkQGEDvuWF1x+2Yk5ogxCDmomHfkn8u4DBnJ5VyQsLG7
0mZTqtuFmpavxL6VFPIRCcJY2IOe31l6tkeqxwSKxPdLw0pm2rhxUga/BvFVVMepW/gd24Walq9w
44waCxXwzPaZA9LzocDqnWOgamFHQbbQIAVhYPe7470hQtLmTCLGrZ8u1bR8xeM7HdwmM9t8Gdwb
6XFCPZRYLeLOZk9BRHQE8nVBmrQN3d71uM3XjV1lhm2/VNOSvjUOHijNLigDMvnXq3vpM9vwrCRQ
Gd8qJ+R+ueMrszFtNiyZp7d0nM2RLtW0fDu+mS9dN1yaNuAeKTB4Ulb4RYmDQ0acLc51GMgkLvx0
lXYKZHGnl4ks/ks1LV/xfOd8rkIR59bzNXbZqexgT6wpTbnw7dLEscYrMiR2Fh7TMrGTuNXqdciX
alq+PU+2WjHkIRl5OqpH9pjdl27I686x4ysbknOYAxKwkUyvAqfb2B0Sd9E0WH+ppuXZHXBncD7p
ctCQe9weme+Ry3QM/F5GpPHI0mG5K98+pMx2RFRB1YFzOy7WtHzD245Sm5MhVs6IZtcyVK018/5K
fGeEzMuXJR1DYgfPPSV2faWoAQl1vlTTkp6bpa0cBcOpzxt76eCkViogZ2SeaUEthBuzIG8zinRQ
TCM+FFx1ZU8UP3eXalq+8z82JEj7oQzf8lMjhGMaWp830myRm7H7NKkWI6oxirRQxXTMeLfFLtW0
pG9zhNgRcCW74CC87B3qKfaZS8wUVoKS9kPG7bilY+Bbx9ekxY+v9eVSTctXNm/HGREzm4jxDZQf
eQP7Zm64W1CbrIh/M3WUlQXZirQGyeAKs2JbYWT23aWalq94A7tb4WGVcePXcXhFt1Hru3XIqBF7
d2RtuFt73KAcybMMaWRjncIJ0kv5s3z0VU3LV0C+VkCxwFc37IaysacNB9Gv7EO6lb1SDTlS7UVR
65aGYaQgeaUSkSXfxZqWr4B8cvxqxfkGPlVnswJ4OeqUeUcEJk3afeJ4CpSfSMrWA7hnk/IdKdvl
mpZvRPMNtRaSsIH9pXBQHOxGAlnNFGHhxqwF9UTnlvnZkJo9pMHHkCHEyb4bL9a0fAWcyow7kqU5
PK6youSrm33YECj6eekLP/p0ZSjkvuaKB40LFda14w+P6ScimreMBhHU2DGgSwspeDMbAfWZ7QVx
tmQ3HBrgIRc8bUdFMfB9BeJU5lQVG9PFmpZnjjsiO/L5PRmdcCn8ANcjOhzTI2b8Mw55xGXTGVNc
PFSUauyi0+0wsrm/WNOSvknLEAITNodkL6NG6pEJomyYpnVg4+wtszHrCgfgLCBUuhsHnIycpomS
uuu7izUt34xmRxwaOVa7VMQFqpxmBx4S4K0jdQuhuE7UcrNLzNFSJPNtzLyQt13rxZqWb4DLxLlI
KG4zgnndV+Tw07xWWIjbxnf8I+oE3zZqGbA5uAjbIs9Iepj8+8Walm9GM+/cBN+RwShx68DsK+t4
Ko+Ppue4Ayry3Q73Ocq1Pi0jO4ZmvnHq/zwQ9CJNS+9YGBcHakhckDkvByMcyVrZqODmoEQfFr6w
cGbka8f+qDbgKbD9wJ+N5lVNS/+VQ2m8kWF4E1Ut1lXrkXEiwKMYouQQd3tlWwUkSpwmm5il5cTG
ivxQ1U+Xa1r6bzqhDVVIoaqLZD/kKubV+XrekETgVseyFLAcLx8zfGY87IW5xm5wzYs0LZyvkdi0
eeHrF2xi3/vKYQPJ19EGNtGl35e17pz8c0y0JVO6zAye0zWalq/7WhDZE4cbbuvTACrUJ7ioEhIw
ko6QaiI127xj14+eb11QwWfUFhuHRiNhfkvTMq4r0n8Y2174SbifBla1xwB44xvcNA2oKaaZE1w3
3zvkKsfcx2Wn0v/PfN43NS0bZcqFoyPYkBbVnPV9d+gGkKutsHWk8/xo0Q/0j8zIiP3CDZdhYi+o
azUtG7lXKHQm1KfmSFkQ01eK+pfjpKg7hJeTDmnk1eeE+gyXDt/1FBhUvlbTQg18z3d9HMdCaXjh
m5eCPWevyLzSwtnUHLpqfO+BXH/iRAs6+ejbX5udv8ng54CKjKR8mUiNYF9xPNKdvHpYR1eQaCMH
21lzoXiGf0+cj4QcdYNj2rBfq2nZt6GuKOP4JW/kAMQVF2KHOprdZHp+3ufk24M9yIEAhvsGNsl2
bgvO+a8TAN4iZpWCwFaQy2E/yHaHGckKZffzvqDeQrKyIcHFcxyZBiP2FkRUtu5HOELK5ulaTQtb
A6MeKRyrO45T7wzVXcfupoipaTRkUCsbgS+wUTgeLhGzOiGS565OOV89K2bhRB3UVJTIIWou4/Gp
i4xTz+zXxa+xVvsVqdGMK5rUcPbps7QioP+VTP8WaZg0bIeLO+VN/WCWDXkErin8CKpKqB3ryQ/h
3A/n2PbiTKg9U3+5r1drWuYjWUYqiRrLOfZ9xZNCigLLQSDoZ4TxPKNAH/n2YCORiKpBVEorQi0O
+GpNS4eqKw9k6azsMThT0IzsBea6+zqMnOu2zDs/dnNuSk9SKu4m/CJS//yvKqg3NS0oYXt2Ylj5
AWongX/kLAXcvR1FgCTNV/jH4nDVzIfOr/wV5cV8TC/vrta0jPVpFhUeH+7G49NTV/mVpEcOO28c
UL6NbMuJxBB7o6dwIjGMeUPdZ+lqTQslVySZYw/GWdgTah/sEZ6ZV+RqqC57xl6kRYldud2WisCD
Z0zKy76tV2takG76kHqc2chv7GwgOiPZnAd+jTremu3LwVhCamZIEdn5o4x15Pkiz1+unxXDaMBX
/Qtl3/s6TiNv0P5gEA4cCroZPXPAHikCmfacqRLsc83LUsvVmpaRlQ87ph7v/6ie5oif4ojow7gj
LcmIxEyKOF9vX/hpp2NqSOF97Ua7WtPCGcykQMFWu5LYzWpZfKvTuk9sNojEEH+VbibzZKoZF8+C
E+QwLBZlfx0Z8aamZYBfjYkN3XrUAxRtI8xtHCE+V8TizMFJfDGONL5DSbpx58uM/G8lQesnj/Qt
t2CLRPxsNoHo4H3sfFNXVBAJV+WOfzKxy1u2LiHvG3b240B2Mc980QPzmq6fFYNYnyjtMMTWssDY
J44amRGAUTBU50SRjkIJP97rdgZvpFDR8sQPLt5frWnJlYNEUE/upUxwRxLWOfx68A7xifMkSaDJ
Y8fb+vi+iphl5DNsKPaX/mpNCwWyiW358j7ysxsVa4jt1F2UBXCcXMuiwTn6COncxiTY9pWfj/rt
r3qItzUtHBk9VxSxKwIvYgVniticEwcpZZ/2jm2jcYevHD+COjizr9E8ThxbX3N/taaFk2jIiaCY
pDcq5DiijIKuGXafx2mqHMeFCxWpr3czp1P1td935Bll+avy6u1ZMSvpasO8GJ8pzN0Xth0c8pbg
75VzlBCWl4LHCpccbWI1mDm8odZ13rerNS3sILrhEG1AVsqN5I00PCQX++IIj+xyPeaZ/CXyzg41
Nzu02JTZZz5frWlh78i6cHFUEz46hf0rG/vMR7iFi/DFOWqHgYMHcNreozxkq0LnnOLlak0LC/8O
BlGQbg+cAcBqfZvhBqRD4rcg+VyP59k5U/6ZYwHmY2pVwlGXqzUtpCJTIICitvD7qLHz4pBqtoLC
DPUm6RRsJtRxftoE70TeP5PulmlZ18+KoZwK9UQdGNnXBfnZxp/fzQiAA/6GG5xk23nwwm9nGxOd
rZtxBxRUwX/Vlr2paSkrrg2+A1xmd6tlGHaykdnoY2bnWKT+KDcQ7nHR9JQYoEBbEbTZw4yU3qs1
LewSyDnp4zqtjtPBD9/4AWunL0zUjLP33cpmjywUB3avx58uVLhxOubVmpZhGKhcQ8BIuDphJCik
R0RhFtAMyxOHlqFuR2awbLwWYKg7Hvc44nJPP1F8vDnhD3XQvlYULeOKzK0OQ0efpKqTw5VzqZwA
gGQbj6KvsCw4xLAnts0G5Lhdr2nhybOLMduzsvkNG9XmHuUaW1GM/IadOR1v5FC8NPckvVM0jDRg
qb5dPysGJTV7r03OPtfDmNbdJtQpe78jTA6sk0bkHZnMvhkev1Mdgj+SV/b/Hv48O/5nmpYzG4q8
rmn5+pqOcw+ZZR6txJHJ+DgPxpmC48Smt91kDB2ceNW5wUiP4WxsAszWTN7VyzUt3xBxQmYDO2V2
/N44Ir5vRzsidllA/ovigqN74X3eU0hQqdxZ69DtSOqm7QpNS/r2fsnLMZJ13jiDYVnYPBL5yrpS
kYHHzYRl7XtOU9sQfPeU+GUZ/8f2Rj/b5JufIWxAWY+ISib11METSZ6fkPQV0sSR/i5jTxzioezv
kYTOSC44mzvjNJYrNC3fvu2gKuLE2Wka2CJ3MpSBCxUlO2tbBN6Nrx4pQkbaWOo0MwKTKpz4gava
FZqWr5DIF/aKYmnkNMGZvF2ynFH4knxqHL+ZN0TiGeln4ciTHjaaJjai2Ur5odnBG5qWbw/WberY
rxXJaJ0yOekJcQOlZsd3KPDrfsG/Hxc2UGGT166j1pQTxziMa7pC05K+tdg6BrlTDNtRvr7XjrIz
bBfrdiy+KWmFbR6DnycUPSjvp31eOLEBnnSFpuUrpLOrNvu2bJPh7uYLn71QHVhwiEh22c8ycawh
bIfvvY4xRIie7BgA57ErNC1fIetydAWbp5ljOpyzTClLBFw3Ogvd/WlcOJXCHCqIzZIas1GKYJbK
FZqWr5AjJ/YCky9mulJIi0nrZHXm+9F595WtQXFdICQXJMUotzduHwkWytflZ8qdNz9LDKiKpq1w
0h/8hMlLxsHCIbta5jXjDpyt5xdCMhUyZy6hiuLFzilPXb/+MDcGf/8P/oi/f67zf/7vz/ef1vrw
8L+Xfz/W42af4IyWODL36Q99/fefvtxtz38KYfPrX1//2H77oX4/VIYzFna+AUfRbn7MCZjZsm6m
OBD5CDlTzuZJu5FQUVGrITvjjEQ2A/2jF+Hf/+vL/OF2v13nx9tPd8e6X+4A9s969/Tv7+vnT/eP
z8Kcv98+1o/HT/xff2z7O8HOtxk5v9/Xuv37t88f5tu7m3X+8GGZ1/98uPk4P67/uLmvj1/u7+p2
80e4+/5N+vzwUDcu8Xj/pf6oFXoT6UOd/1kfbuab9dPHpyk9N9jd78Q6nu98/+9T0Lb6+fEfv/Uh
O/uKFbS3mwPvpn/aws3D432dP5668Prp7uHLR9XP3m/vbh94EvPDp7tTV36YP37+UO8Vj4QDo2BL
N4cIDluoH7YHIcAfujoxQC8H0G8hyRFMjuByhEGOMMoRJjWC3JSS3B2S3KWT/inJ3eHPQjkJgtzh
kt4dihrB5P5gcms1eXgwuT+Y3FpNHh5M7g/yY3C5O7g8PLjc4Vx/DvLw4HKHk29BvgO5PyvD2zeV
khwi6yH0DyqZHmKUQ+g3YXqDMr1Bmd6gXH8WrjcoJcIfOiAxQFYDFDGA9Gb6Q8ejBVBvwNRGZGoj
MrURufoMXG1EyvWfdUI6jGdpkBaDaiAtwh/qHy3Ik/xHh/Ek99Gt/yT30a3/pPDRrq/+/b18A0kN
YGoAVwMMaoBRDTCJAdRGlNRukNSOnOSPSO0G0u8xfygYxAByNyhiAFP7ganN1NThwNR+YGozNXU4
MLUfqI/A1W7g6nDgaj9z+Rmow4Gr/Uy9AfXvV3uxMpidR+x8AeCbfEEOkfUQRQ4hfYP6TX6ghtBv
wvQGZXqDMr1Buf4sXG9Q5yJ8vv/0+dNDfTif1p4CKfQpmEKfVBT6JKXQJxmFPuko9ElNoU9qCn1S
U+iTnEKf5BT6JKfQJzmFPskp9ElOoU9yCn1SU+iTnEKf5BT6JKfQJzmFPskp9ElOoU9yCn2SU+iT
nEKf5BT6JKfQJzmFPskp9ElOoU9yCn1SU+iTnEKf5BT6JKfQJzmFPskp9ElOoU9qCn1SU+iTmkKf
1BT6pKfQJz2FPukp9ElPoU96Cn2SU+iTnkKf9BT6pKfQJz2FPukp9ElOoU9qCn1SU+iTmkKf1BT6
pKbQJzGFPqkp9ElNoU9qCn1SU+iTmkKfxBT6FEChTwEU+iSn0KcICn0KoNAnMYU+iSn0SUyhT2IK
fVJT6JOaQp/UFPqkptAnNYU+qSn0SU2hT2IKfVJT6JOaQp/UFPqkptAnNYU+qSn0SU2hT2oKfVJT
6JOaQp/UFPqkptAnNYU+qSn0SU2hT2IKfVJT6JOaQp/UFPqkptAnNYU+qSn0SUyhT2IKfRJT6JOY
Qp/UFPqkp9AnPYU+6Sn0SU+hT3oKfZJT6JOeQp/0FPqkp9AnPYU+6Sn0SU6hT0IKvQdS6D2YQu8q
Cr1LKfQuo9C7jkLvagq9qyn0rqbQu5xC73IKvcsp9C6n0LucQu9yCr3LKfSuptC7nELvcgq9yyn0
LqfQu5xC73IKvcsp9C6n0LucQu9yCr3LKfQup9C7nELvcgq9yyn0rqbQu5xC73IKvcsp9C6n0Luc
Qu9yCr2rKfSuptC7mkLvagq96yn0rqfQu55C73oKvesp9C6n0LueQu96Cr3rKfSup9C7nkLvcgq9
qyn0rqbQu5pC72oKvasp9C6m0LuaQu9qCr2rKfSuptC7mkLvYgq9B1DoPYBC73IKvUdQ6D2AQu9i
Cr2LKfQuptC7mELvagq9qyn0rqbQu5pC72oKvasp9K6m0LuYQu9qCr2rKfSuptC7mkLvagq9qyn0
rqbQu5pC72oKvasp9K6m0LuaQu9qCr2rKfSuptC7mELvagq9qyn0rqbQu5pC72oKvasp9C6m0LuY
Qu9iCr2LKfSuptC7nkLvegq96yn0rqfQu55C73IKvesp9K6n0LueQu96Cr3rKfQup9D7uRT6Jxr1
9tvnD/PtnZZB/2coOYH+K1xIg/0fwaJ2J2ix/+PKJwsEflz+RIXAj0ufKRH4ce3zNQKvI5whErgA
odcjBGwi6SFMD+F6iEEPMeohJjmE3qCS3i2S3rlTwIPSu8V7X1FfAqH3vBTgFkUOYXq/ML3Rmj5c
mN4vTG+0pg8XpvcL/VG43i1cHy5c73kecBb6cOF6z9NvQr8HvWdLA945QoKLMHIARsCzShaAMeox
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
````

### vq-prefill-readout-functional-v1/generation-output/receipt.json

Original bytes: 468084. SHA-256: `3235b4e4c4d0a6955da23e53814e118f08b7de6955b2dc9a4d8ff221ebf40575`.

Normalized bytes: 468084. SHA-256: `3235b4e4c4d0a6955da23e53814e118f08b7de6955b2dc9a4d8ff221ebf40575`.

````zlib-base64
eNrsneuOZUd2nP/7KQbzWxTyftE7+AkEQ8irRJhD0mRrZEHwu/uL3VPVl1NTdbYMyLKRkmbEri6e
3DtzrVgRmSvy/Nt/+cMf/tjGWL9+WvMf5m9tf/r9j3/4uz+E8jfX3/z246d/+tP69OPQD//45//x
w29rr9/Wz2P98C/81Q+//fIvP/z485/5vfbzpx/+vH77cf842qcff/n5hz/bP16fMX7506+//P7j
p/UPv/9TczFdn7S93daYGfI2yY1go4t2VtfCsKHG1J13ZfnqXQ2tpmJWd73VYVMKO4X4+aOv5/36
Y0cxPZbd2gpprTZ6DXO1UOf0IfqY+KGJsebdpysjjxTyGqO7klzrOYTPH8sLrZ8//fLbv3790aby
L9S9mom12F6SDdGa2nIae/QWm3ODVwjZlzH9qtuY4XxbaZbIy67PH/1L/3399udrgq55/nt++Ic/
/Nv131+thP7K/M3LTwe//M9/+vzTWF9/fL3997/7c/vTup73H39ba/7rD7/+1H78+Y+vf/3bar//
8vP1Cz+tn//x0z999Vc//+M//P6pffr8rwf35W9ef/rynJ+f6c9/a65f7funX9onm/7u7+3f/MH/
zR+sccH8t7+Lzcxe8i4+zjj9rivs4FudrXTjts+lpTpT62vn4V0rebSyd2VRbA6rv47/Mpp9b7Th
Rq3dmGJdqNaH6nvL3fOPw2ZWxc3cdm1jWp95GtZmGdesLc6kPkd4GM29O1ru0Tjnp8uOz2KtA2tu
l8l2DrvdXCsGa8MwfrZJSOa9t98zxblt8e1htPDuTPoY+GTH85Y5vG/G9RmYzVJNnDa0VIjmWvpe
wxTfPRE3dtzOWO9Leny3+N5o1bIqzo9gmNKxFkNVFrKa7leKa/jVaqiM3BJhP+oObTP3TD4LWZJ5
GC29N5rGIb+d4zX6YBqnTz2N6LvtzS1ve3Vl15lrZa3qcNPNOvZ0m2ewZj2MVt4bzZrAUni/Arm/
hrPO9rh25OXM5g0mr8P7V2cXkbJb8WmVymz3XdLq9mG0+t5o06yYCXtfVvMjpW1nCj0RcWMaO3wq
oUUzV+iu1hZs4UcrCWVSDHGmxwx4N+EMYOMsiLR26dNHMsuG1YrxDD7WKJ2/a7yFKYa8a4U5nHnN
PEYGFsvjcO/mQDYEHI+f7FjJ51ly6av70HzOrQPEOVVXp118OG+81/J+h+RqA569f4xK698djiU3
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
lUlmvRGrH51ARAseTsgmgGi0V3Ad5Fde4Mp9+DbDbZ5ETg9Ke1p9kT+DBYUir/3GiB9FThJH8msm
6GUKZAUVEV0jHiH+EFvZS5t38KphCOA6jRslipZCPOrjiB+dQkQIBbFIsIy55gRSIuqlRBF7NGqT
UPONsLHJNrXPF+hGNHVbkxjbvjHiB5EzUSbjaiALfJyxqrr8V0XaNkslqDklNcZYyPhQY98ILldT
dXall//jXwb8X68ulS/Y/fevD5OT+fJk6iD98ief6pc/1BK/+hPh9dW/5Uz48ieXvv4DefrVB5av
x5L2++oTw9cfYt1Xf+Ntyl99iC1ffT5U4Ou/S3/5x//2X7568ze9Q/mGdyj/Ve/Q5PP+6Qd73EPH
PXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxDxz10
3EPHPXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxDxz103EPHPXTcQ8c9dNxD
xz103EPHPXTcQ/+J3EP1hnvImg/sQ+7Yh4596NiHjn3o2IeOfejYh4596NiHjn3o2IeOfejYh459
6NiHjn3o2IeOfejYh4596NiHjn3o2IeOfejYh4596NiHjn3o2IeOfejYh4596NiHjn3o2IeOfejY
h4596NiHjn3o2IeOfejYh4596NiHjn3o2IeOfejYh4596NiH/hPZh6y94x/yH/iHwvEPHf/Q8Q8d
/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEPHf/Q
8Q8d/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEPHf/Q8Q8d/9DxDx3/0PEP
Hf/Q8Q/9J/IPmbftQ/Et+9Ab3z70e/vTrz+t+cOvP7Uff/53mIcAcdhRQnAXctAYZvf/1E20Ivwg
NZZeB39X05AaASxsUfsYRW25GQY1FEJePB+sQSi2unaLO9xzExlZhvjYLoNSAsFg0EmdiNrwduh8
mTpsNqSI5VULwgpAH9PwTHNHe89N1EEwuWnIuJAT7FD9dHEj90brazrnWtEGxkRLkC4u2OvUd7u2
iekx77mJmu9tGh3xjY34ZKYgg4xTOjMmGwIqehTADTYFc7wqPrxtxYBACybdcxMZwFEHpZSgKRZN
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
3hM74yIhQE2w9SKSxRzcULAjaPqJryUtksUu1bGoVu7LdF622kivOv4fuflI8hknB3J6v2pN1Vtx
Z02AAKQmp+bo2kgDtrkNsmv1vkzndc9CAmRHJATaW801bKoo3XgJbIPtakQza5BBHctudcQdww2i
jyvp9Py9TOf/vcrmHzUM562yeats3iqbt8rmrbJ5q2zeKpu3yuatsnmrbN4qm7fK5q2yeats3iqb
t8rmrbJ5q2zeKpu3yuatsnmrbN4qm7fK5q2yeats3iqbt8rmrbJ5q2zeKpu3yuatsnmrbN4qm7fK
5q2yeats3iqbt8rmrbJ5q2zeKpu3yuatsnmrbN4qm7fK5q2yeats/i+pbLJ/oLL5b/1v+1//YbNs
SlbxB3hsOU3w8itP4z/XIFQy3yRVwAiXrpD2sRxDAORvwH0NTWUOz1Q2xAlHWjUyLck9GvEFphIV
J8GgeUKlfQgnVIjNgHg3YvxK8cBFNR2qP1PZRE1Tzc4tl1TYHISL+oLU7rwcoW774jTHupCLO65O
aDFcQgX/hJoZn6ls1lJRRknFq+rdkYUSoYwVbMHDm0FiK7TDC5GSsiP5qpgb/LJDWKNl/0xl47JO
j0EjhQWDc4FxNSl8b1wO5jet+eGuU1qJbDoId1YA8MjFzdnzeKayWRskafAxAEoqLQXYkHckXHLN
iHZNtyMNFLBv0J1HsdM1V5AFPjzTPVPZYGq+Hsl4SDudYOWN/BaXCEtQ1eyM+4QBJXWx+6mKIU2F
7KHBu2u2ZyobAn2AgpS6NAEcMyHvRlPF41FgKaZqFx2wN43PDU5anq059sF0VeUeqmwy3IaVW/PY
sRIawGnwLNbNeXOZ9LpVFqyzCnJQqTElHAIQM4MGFvaHKhsRVe+OzxkMhiNhGXX5HveAoPgaNEwd
K7FQTk37qvxRUWLGGTXItj9V2ejksRwfZtdQwHyqAr7XPOKCR6wGppjbhb0gsWvJHNMMw6IzMkYr
D1U2oYJ8IMS58Dqqf60NKDY1jRgaEebwZ08SD1u4rU1dvJOJdQgUpOc7D1U2ZeioDkfDPhuOZhq/
eIBmwE8H9CPd9ghyzyfzjDkr6WiE7LKmTc8v3OB7lQ0UpEXoam28ZTap9UjTVq6B7ZCiFb0mQKaI
P5DfxTntxFXho10c6qHKRrN+3QaLtAmTgh/YSrqAXOSIPpOD1p1qwL0aJAxTLduOqtnAbYg5+6HK
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
````

### vq-prefill-readout-functional-v1/receipt.json

Original bytes: 51534. SHA-256: `054748bf857adb19e2173b7924afcfe83e4e40d708aab6689beb86242757bb12`.

Normalized bytes: 51443. SHA-256: `dd6b16f5da6238bbc6514321a95296901034ffd444bb2b4657de1da6c5fb40f0`.

````text
{
  "complete": true,
  "started_at": "2026-10-03T21:40:35.121474+00:00",
  "scope": "Functional acceptance only; no throughput qualification, hardware simulation or model activation.",
  "maximum_concurrent_model_processes": 1,
  "minimum_real_headroom_gb": 3,
  "maximum_total_seconds": 10800,
  "pins": {
    "<HOME>/Projects/slotstream/.build/release/slotstream": "b2767d52babde28a65f0e95a0d43ea8e62b0e39a4537a02fde20573fa1a0ef04",
    "<HOME>/Projects/slotstream/.build/release/slotstream-checks": "96ac85f5e463601dc536c80f0dc9a882a265fbc418ad214d00cf7c268534024e",
    "<HOME>/Projects/slotstream/.build/quantization-research/inventory-3.2/inventory.json": "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
    "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-pilot-v1/composite.json": "4cdae0e9c26b9a0dd07659cd9d71dd025ed110b49161c152df09d5a7f75ac28b",
    "<HOME>/Projects/slotstream/.build/quantization-research/run-vq-prefill-readout-functional-v1.py": "261cb188cad422a248d0b42ae8fe25f092e1aa281d1ba10656780071653115c7",
    "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
    "bench/quantization/greedy-v1.json": "8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c"
  },
  "protocol": [
    {
      "name": "catalogue",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream-checks",
        "--tier",
        "t0",
        "--tier",
        "t1",
        "--json"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 900
    },
    {
      "name": "generation",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "quantization-generation-check",
        "--source-directory",
        "<HOME>/Projects/slotstream/.build/quantization-research/candidate-3.2",
        "--source-inventory",
        "<HOME>/Projects/slotstream/.build/quantization-research/inventory-3.2/inventory.json",
        "--generation-profile",
        "<HOME>/Projects/slotstream/bench/quantization/greedy-v1.json",
        "--output",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-prefill-readout-functional-v1/generation-output",
        "--dense-overlay-baseline",
        "<HOME>/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--dense-overlay-manifest",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-pilot-v1/composite.json"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 1800
    }
  ],
  "runs": [
    {
      "name": "catalogue",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36331454464,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   244162.\nPages active:                                 548379.\nPages inactive:                              1688036.\nPages speculative:                             57359.\nPages throttled:                                   0.\nPages wired down:                             176982.\nPages purgeable:                                7831.\n\"Translation faults\":                     2294016810.\nPages copy-on-write:                       119732962.\nPages zero filled:                        3758030159.\nPages reactivated:                         191492302.\nPages purged:                               13289502.\nFile-backed pages:                           1965503.\nAnonymous pages:                              328271.\nPages stored in compressor:                   794568.\nPages occupied by compressor:                 369511.\nDecompressions:                            111771225.\nCompressions:                              126711021.\nPageins:                                  2667216004.\nPageouts:                                     513563.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 131418.\nPages tagged resident:                         95038.\nPages tagged compressed:                       36380.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5247.\nPages tag-storage free:                         1206.\nPages tag-storage non-tag pageable:            91843.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5678016.\nTagged compressions:                          851498.\nTagged decompressions:                        718816.\n"
      },
      "peak_physical_bytes": 1334412656,
      "samples": 241,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36323131392,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   241936.\nPages active:                                 551972.\nPages inactive:                              1688032.\nPages speculative:                             58272.\nPages throttled:                                   0.\nPages wired down:                             174532.\nPages purgeable:                                7818.\n\"Translation faults\":                     2294100129.\nPages copy-on-write:                       119738605.\nPages zero filled:                        3758314252.\nPages reactivated:                         191492339.\nPages purged:                               13289508.\nFile-backed pages:                           1967234.\nAnonymous pages:                              331042.\nPages stored in compressor:                   794562.\nPages occupied by compressor:                 369508.\nDecompressions:                            111771231.\nCompressions:                              126711021.\nPageins:                                  2667217355.\nPageouts:                                     513563.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 131500.\nPages tagged resident:                         95121.\nPages tagged compressed:                       36379.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5247.\nPages tag-storage free:                         1223.\nPages tag-storage non-tag pageable:            91826.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5677760.\nTagged compressions:                          851498.\nTagged decompressions:                        718817.\n"
      },
      "seconds": 14.196121334
    },
    {
      "name": "generation",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36297195520,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   240352.\nPages active:                                 553530.\nPages inactive:                              1688290.\nPages speculative:                             58015.\nPages throttled:                                   0.\nPages wired down:                             174533.\nPages purgeable:                                7818.\n\"Translation faults\":                     2294121781.\nPages copy-on-write:                       119739046.\nPages zero filled:                        3758317021.\nPages reactivated:                         191492339.\nPages purged:                               13289508.\nFile-backed pages:                           1967235.\nAnonymous pages:                              332600.\nPages stored in compressor:                   794562.\nPages occupied by compressor:                 369508.\nDecompressions:                            111771231.\nCompressions:                              126711021.\nPageins:                                  2667217358.\nPageouts:                                     513563.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 131500.\nPages tagged resident:                         95121.\nPages tagged compressed:                       36379.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5247.\nPages tag-storage free:                         1225.\nPages tag-storage non-tag pageable:            91824.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5677760.\nTagged compressions:                          851498.\nTagged decompressions:                        718817.\n"
      },
      "peak_physical_bytes": 8488327024,
      "samples": 2349,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36505567232,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   473981.\nPages active:                                 457977.\nPages inactive:                              1470567.\nPages speculative:                            140560.\nPages throttled:                                   0.\nPages wired down:                             173664.\nPages purgeable:                                5296.\n\"Translation faults\":                     2297000087.\nPages copy-on-write:                       119816153.\nPages zero filled:                        3764006540.\nPages reactivated:                         191502576.\nPages purged:                               13302108.\nFile-backed pages:                           1748846.\nAnonymous pages:                              320258.\nPages stored in compressor:                   794369.\nPages occupied by compressor:                 366864.\nDecompressions:                            111771424.\nCompressions:                              126711021.\nPageins:                                  2678805348.\nPageouts:                                     514187.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 125919.\nPages tagged resident:                         89542.\nPages tagged compressed:                       36377.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5227.\nPages tag-storage free:                         2115.\nPages tag-storage non-tag pageable:            90954.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5677312.\nTagged compressions:                          851498.\nTagged decompressions:                        718819.\n"
      },
      "seconds": 135.298990958
    }
  ],
  "explicit_environment": {},
  "build_inputs": {
    "dbmd_sha256": "3cc761c52629f220e5de40733d052884a3787885d696e26f07fdd1d1644d642b",
    "files": {
      "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
      "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
      "Sources/Slotstream/AppliedModelConfiguration.swift": "0042eecacbd2f4ddb136681c550237bb2ca1c4972035409a59bd4fddd1113aad",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
      "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
      "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
      "Sources/Slotstream/Checkpoint.swift": "361b54ab482ab1b08debf846148d16fb811ee3550cb8ca1ae7526dc9b825e04b",
      "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
      "Sources/Slotstream/ContextFeasibility.swift": "5e7d185542e5ef173683afd5e6999c7ec76c36bfa8e6d3356ec40d1b695edcfe",
      "Sources/Slotstream/ContextMemory.swift": "31da5a698303ec9898747052996996eeec2ac46d40b7c011791ea7b00e6bd23b",
      "Sources/Slotstream/ContextWindowPolicy.swift": "73b2321aae6a2c22fc7173467136770dbf45a1eca4a185293491472680a13a24",
      "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
      "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "24ca04e99cf4195e59bc08692b6bf62393872161c52f8b5eb1913c6282c9fb32",
      "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
      "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
      "Sources/Slotstream/ExpertPrefetch.swift": "46fb601813d05b788a3648139cbde2b88c94714a5e15f99456e4b2e7072f4b6a",
      "Sources/Slotstream/ExpertStore.swift": "4dae1ae2ff59f671ad4b6e0dbc6405fb198d2dc523ec9f2d9e00c9b2dfce7bcc",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
      "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
      "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
      "Sources/Slotstream/Generate.swift": "792159f8e9f11d1c98373c08e066b79908192d142d25a9f8bf2a6fbb22b48c82",
      "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
      "Sources/Slotstream/Governor.swift": "89310e4c1b2cef2b104122445a1ccdb118d4ea4c38ee7bd726d78261be74457b",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "d5d5b2fcc1a6012c25f0d2a8ff7e6d7ba4ca758d385c38220518e10176e7acc2",
      "Sources/Slotstream/MTP.swift": "a967ad702f6830d5862ab1f7b78dcf469645b9b9db70b55965d76af257b7ea40",
      "Sources/Slotstream/MTPExpertStream.swift": "391b13fed457ba61a7cb4e107472a699ba87adc9a57cfd14580faa2dfbe50fd7",
      "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "1048ad7bcd1c9f93f5316465ed38d7bd93046fe4bfbd0fc138d972e646ee12ab",
      "Sources/Slotstream/ModelPackRegistry.swift": "56c7e6930287d9e8495d90e88e61df4dd062e78afa2767f4047941e1bb67aa5b",
      "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
      "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
      "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
      "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
      "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
      "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
      "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
      "Sources/Slotstream/PersistentPrefixFormat.swift": "d03795ee46252fe5df904591289af41a69811f2a211f437764d3f80ddb0d20ad",
      "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
      "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
      "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
      "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/Plan.swift": "240766430e77e186107a2b3eea844b8876bb509f92e2fbcfcea9d989e1a37b54",
      "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
      "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
      "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
      "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
      "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
      "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
      "Sources/Slotstream/RequestControl.swift": "56c5e664aaf33454f5ef45efedb3849ee539fd91e844d58885bf304f5aab3c1d",
      "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
      "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "8566a2a7734ae19f07aa3b4216b2c219687b52819b3ac86a2f79533d31ad03a5",
      "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
      "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
      "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
      "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
      "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
      "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
      "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
      "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
      "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
      "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
      "Sources/Slotstream/VQDraftWeights.swift": "232799bd52934647ea792473111ab1b671f1c6b563c7980c16036f2eeff10e72",
      "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
      "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
      "Sources/Slotstream/VQGenerationProbe.swift": "ae7bd4f10c8a71daa548d73298d74485d8f54de45ed0ff78e21194bdbe49fbf5",
      "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
      "Sources/Slotstream/VQModelProbe.swift": "84749552ead79c5cf83472fd6c1802050c72c7d22041c5ab8f0e1233b1d01f04",
      "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
      "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
      "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
      "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
      "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
      "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
      "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
      "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
      "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
      "Sources/Slotstream/VQRotaryCoefficients.swift": "8aeda16d1f6f79296cd872dbb49eebff9dcef4ba6f8f4462acc5c001f62ce63f",
      "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
      "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
      "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
      "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "6375ebfb23b05b7286c9d22b78fa8051dd85c5d6f160a52c6dcbb98a165bb2be",
      "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
      "Sources/Slotstream/Version.swift": "d68b6b9f343402041c33452b885eebce140773cc26379b4adaae996640427b40",
      "Sources/Slotstream/Vision.swift": "639b5c4bbe05654db411d587f31e7962d3db857aa4be38a2b54f982199d51eb5",
      "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
      "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
      "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
      "Sources/Slotstream/WeightStore.swift": "b7b9c43d6aaee926a6c13701e65cded306e9eb8483477b61ff81dcf212f39999",
      "Sources/Slotstream/Weights.swift": "01fb2c61390e6b7585eb80a34bf53a8c460fb6258908d57a3c1ed1fa77ec3ce8",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
      "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
      "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
      "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
      "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "25b469da9856405dd6421d6754d7caaeae378fc5e77ae1637a2552a139a810f7",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
      "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "b891dd485cafb3fc2bd4961fd4fd372e30cc496fb4c2bac414f4835ef51c0d3a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d1ac7938651c5b9db8e95706ab1f6802dbce55e3abcf9213df0407ddbfbe498c",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationTasks.swift": "f576e811b053d958aef413aac4d84b09ef241585a5bebf8146c6bd4d06bfb5f7",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
      "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
      "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b18979a76cb2112a2beb8fd3196c1d26e36c2626c2a8de732b6b4fc134be61c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
      "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "95c27157cb514ff744e70366bf4ac7a5b435279d7c8e232189dfb292e22c1f21",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQContext.swift": "75d660486eb83511b6c3bfc0614e1257d5578d68f42619c6312ae7e5cc296f31",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "fcd2f234c893483618844cbd2296e74b27934dca28b06e24860c2b1212da135a",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQState.swift": "655571a17a6e25833211de23de8b8c4f387ad2c7043e49da07c7b447babd2992",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "31de09d8efc8951692f60fc9f5c4ec4d14dbef5b67656da18bca519ab4bcbcee",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
      "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
      "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
      "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
      "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
      "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
      "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
      "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
      "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
      "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
      "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
      "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
      "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
      "Sources/SlotstreamTestKit/T0Checks.swift": "25bcf4ef6daeb29a31ebfacd2217bf12afb7788672f72c21d13ae7ac41aded97",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
      "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "d26e43367ba2d61d7afd9f5b175e95b714409b1717b86b9fe71f1306e36b6a81",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "3ba24ae3e24dd10214e3288f007952d9e2b06241c081e29313b42ac7aa7a31bb",
      "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
      "Sources/slotstream-cli/DraftStreamCommands.swift": "4fd131e2303fd4f2c9765fff9b2543011d565dd5c070b8b380910528c9026a33",
      "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "249274657b4f4f4c3e694a2b0db671b3af8b92a2148495647f3be9092f48f6b2",
      "Sources/slotstream-cli/LaunchCommand.swift": "a18212935aa5aa2c956593838ef181ccbf0aae2501b7a0071f4b4b44298ea0f9",
      "Sources/slotstream-cli/MTPCommands.swift": "04d06d66f29339b4d88dfbae7be18ef873c32c09320536ee7916e7d621816e08",
      "Sources/slotstream-cli/ModelPackCommand.swift": "daaa7bf13449090afb10d04c7ecc2a6bf9af5c0f9c182e758417aeb1a51408fa",
      "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
      "Sources/slotstream-cli/PrefixExactCommands.swift": "b70f0a6f2536f0eb1fc00007260cc6dffe2592b1f32271225fe1304261346e28",
      "Sources/slotstream-cli/Pull.swift": "ca9f9e90ef959b194653945e29ebd3b9f1932ef3e46dfceaa7b09562fa2c9d7b",
      "Sources/slotstream-cli/QuantizationCommands.swift": "bd6fcf1328405c17c3d99748b2b6572e4b9520d297fcac4bdab1927c6520d0b1",
      "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
      "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
      "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
      "Sources/slotstream-cli/main.swift": "8c42e20197cd7673fa8f37e57451f4f753204edf6a58e96de6ea7474c8c1dbd3",
      "Tools/build_sevra_mac.sh": "debb9110cd8e316bac4e153e9f7cfe07fe0437dbb8e781bb50bcf93b0488771d",
      "Tools/generate_sevra_icon.sh": "8228ccb8e4d707c2a73336f283ed599f72cbc2213589ca36191d675e737141b6",
      "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
      "Tools/mac_build_inputs.py": "1e406cea50efb4125d0d5fc45be838288ee440d90097dc508ce2b0d3ad68eb1a",
      "Tools/render_sevra_icon.swift": "cbcf593dec275773cc86118bc4d6aff423534d9df7e62ef0fb014733c9aa3095",
      "apps/macos/App/AppModel.swift": "aea5ef70be88b171a1932c3370909c044880177d6651f3b961f219036e29f3f6",
      "apps/macos/App/AppModelWork.swift": "76f3d80447c5b4a829ac4bc1e0f429ee3f1df76a53f06b3110c03b75e9e90d14",
      "apps/macos/App/ContentView.swift": "f64f31bc3cfe9ab8f8d1c207f1e137ebe1102927ec4e1f409c21fab3d0cc5745",
      "apps/macos/App/MacCommands.swift": "e85cc090add3bfd42cc259727fcc16c76f44307a5172e40a96dd7f74747674c6",
      "apps/macos/App/MiniAppHost.swift": "9720c739c4ef11b56e3cb3e30bcca6e17f3c97ba7cf4d3e26ad743d0e7e82bec",
      "apps/macos/App/NativeControls.swift": "a66a3219a431dc4523a1c8ec16e6372331123b7c43888e75c250047e60193729",
      "apps/macos/App/NativeText.swift": "bb471331e742b37bee04fea4db02c80506c91e95597faa12c23962aea8c7d614",
      "apps/macos/App/ObserverMark.swift": "93f172ecc0b360338bb09913071a6ba6644077576abf9b323bfa95ebd4c5b764",
      "apps/macos/App/ResponseDetails.swift": "fe85363dc19a3a767250df73cdb566a4e22117236b9137bfd5853e19ff437087",
      "apps/macos/App/SevraMain.swift": "7ae10c0cf10b4ffda3c54416db51f589eac0a8eb1f59b24a3e5ffa01da7cbd34",
      "apps/macos/App/WindowState.swift": "c3782b38d4ff1342587aef3e54688bc0fb6160f92388f8b4de1742780d09a96e",
      "apps/macos/App/WorkViews.swift": "27be9436faf7b6b56adc0892f13b911652bbc1960493765fb869a7b14edc8af9",
      "apps/macos/CSandbox/include/sevra_sandbox.h": "7885534cb39319e57ebe6dcf196447e2a50b31fdf31ca8c13fe2457f005477d9",
      "apps/macos/CSandbox/sevra_sandbox.c": "6172c4955a01baf46affb019f5f1be32b8d388371203ecd41802f5ba9bd5a3f8",
      "apps/macos/Extract/main.swift": "1892d923b140622e1698c1c0f1eaba5f9684921f4917cdec52003b26f89617f5",
      "apps/macos/Info.plist": "73cc83e91b2729b1ef576226fd95104e0bb763f874fe937d81d92d9785e8bdb6",
      "apps/macos/Package.resolved": "2d751ea715e77a0a7994c55a13e23b0327b9e6b42827ec7603cf740f44d53da4",
      "apps/macos/Package.swift": "2d9e44a7d3a5067d7eecb4f9a929b355943fcad7d91e56eabaa9a160a47bb201",
      "apps/macos/Presentation/ComposerSession.swift": "1e0ec10e4833da338b289e6b766b4d471924e47cd1f5cfb5d301cdbd4b719ef6",
      "apps/macos/Presentation/HistoryPage.swift": "576e721818d61bfd988b6f57b136aab6bbb8c847f8e8a2116ce76708f4f4f84d",
      "apps/macos/Presentation/MarkdownDocument.swift": "39fa604d4b09e8fdd61cd4b5be33c912fd748501c4aaeb7f2f420023b9fe6a45",
      "apps/macos/Presentation/Module.swift": "dda9b75f64b106eb544de201f599122d75abc483c5b156bba6c05c0f956dbc3c",
      "apps/macos/Resources/Fonts/Inter-OFL.txt": "5b9321a4298cfeb6b34354164a1c3afc3db114569984c502b9b35d988fd58c57",
      "apps/macos/Resources/Fonts/Inter.ttf": "29160a80ff49ddcab2c97711247e08b1fab27a484a329ce8b813d820dc559031",
      "apps/macos/Resources/Fonts/Poppins-Medium.ttf": "90373e7d838d32468438fc3e152dca0bdb12edcab99ea639f158790b1ba1fd05",
      "apps/macos/Resources/Fonts/Poppins-OFL.txt": "6be04893d770899a015649c7aa3b582f871b272f8747a92b78b17c3e5c8b2573",
      "apps/macos/Resources/Fonts/manifest.json": "1e79dfd278dbe9bfd8afbf7e5cbaee64dff1574fc1cc3aca8fdd903f4056677e",
      "apps/macos/Resources/Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
      "apps/macos/Resources/Licenses/VQLab-NOTICE.txt": "04d3fc0f5e2ddf3570b5895316cbee7a62d7d75bdd216c39b3aee95c8942941d",
      "apps/macos/Resources/Licenses/swift-cmark-COPYING": "c22e885f33b821bddb24cf007145e5540655b6c0f403e49e6c76a93c28e6d9a9",
      "apps/macos/Resources/Licenses/swift-markdown-LICENSE.txt": "167beb36f181bd163c93c6feb45c68e5f9462fe1af55b278f7bfd1df20e673a3",
      "apps/macos/Resources/Licenses/swift-markdown-NOTICE.txt": "ee7da43afcac4a52196a2141024573ec2ceb84b14e74dfed38522d94586fbc52",
      "apps/macos/Resources/Sevra.icns": "b28f2df8e40cafc2e89fb3ae5a0e361b5470851d833495df9b3dd4ca0395471d",
      "apps/macos/Runtime/Changes.swift": "17735c951b3bef2c2b30f6fe029b5e8f635364513a7669da770d934815411e7d",
      "apps/macos/Runtime/ConversationContext.swift": "89a1a6cfd9b3d879a53c40443e3c02bcef380f1599354fc386469bd4d39d81e7",
      "apps/macos/Runtime/Extensions.swift": "632ed6d2ec6d1704b24c79c5c71a1ce790a37a1fdbbb24ac5c1db32cb0ac9406",
      "apps/macos/Runtime/Extraction.swift": "5bc0b25ad3b29481bb2b92491cff976934d9f5f92ca3bf4dc83988b056be8955",
      "apps/macos/Runtime/HomeArchive.swift": "d43376db4e1d7bb6919bf3e332477fffa28ceefdc92d0b90ff6b206fe18fb169",
      "apps/macos/Runtime/HomeStore.swift": "0a4db7db75f1de1f3042a78af86e6057377b92deab4639326040a620e609a49b",
      "apps/macos/Runtime/HomeTemplate.swift": "e25b0a112abdea7d915c1f553fb3b62078b8ab35ab60dc5c3d80a82468caa7a2",
      "apps/macos/Runtime/HomeWriter.swift": "d61aa8ebc3ee627a5281100eb77cec4eaf633fcd97a792a5a4290136f499c303",
      "apps/macos/Runtime/Inference.swift": "a690583eddce6facd924e18622845f9a7e7ecdc33a255c52292f377f2e76873a",
      "apps/macos/Runtime/InferenceCache.swift": "48aa1f16913c2ac4f227b11e76131c2d5e4860403cbc6280de91946b19aba670",
      "apps/macos/Runtime/LocalIPC.swift": "2f9ca541d07687034f6808958e54397f017f260d394216ab71cd8221bb3d599e",
      "apps/macos/Runtime/ModelSetup.swift": "3080010ef569fbee93c372a61699ef13e4ac4066a1be40815e991ff647b16e62",
      "apps/macos/Runtime/ModelVerification.swift": "29564d5f03207e4286f6ab8ab286a22dac58de92bb459f3f765417a99ce38e53",
      "apps/macos/Runtime/Models.swift": "6ee898c4a2a092f30eb5696829235ab391d3e0290319a88e38b94ec1c63ab3f5",
      "apps/macos/Runtime/Performance.swift": "b377ed9652f1321db355daefc7371d8c048173b56a13a5c2d7ed484949895b78",
      "apps/macos/Runtime/ResponseMetrics.swift": "91db9f1ce48a14f16b5e9b516dfdf20e0354e475a170f6888c88018cff6ca737",
      "apps/macos/Runtime/Runtime.swift": "4ac3bda459c64c41d4bc5c4ce461e0c60889913c913873237c8bc7b3cfca9b48",
      "apps/macos/Runtime/RuntimeExtensions.swift": "8a03804b02763569d839359064fa22e0a50e88907a56dd5eeaf5f88b327ce311",
      "apps/macos/Runtime/SourceNavigation.swift": "c2286df52a8a3ec200a5adad3162c899c08e480b858a15e1fe5e0634202cbb3e",
      "apps/macos/Runtime/Sources.swift": "b458dc283490f833ad50e17079af849d644d27408c45b7f04e01dbb059e59267",
      "apps/macos/Runtime/Thinking.swift": "be477cb342ac1057a5fcd82842b498cbbb7ecfb91548e5ce49e4aef9fcbee420",
      "apps/macos/Runtime/Tools.swift": "6cd7577792d86d6a2d31ba24d0e4bdf55374a5b443954d3584e27404f725d52f",
      "apps/macos/Sevra.xcodeproj/project.pbxproj": "dc22426b24c2c8eafe143ad67c087f800a7708e2d7c6d43ba7f9e4a0abe3040c"
    },
    "scope": "Local development build inputs. Ad-hoc signing is not release qualification.",
    "sdk": "26.5",
    "swift": "Apple Swift version 6.3.3 (swiftlang-6.3.3.1.3 clang-2100.1.1.101)\nTarget: arm64-apple-macosx26.0"
  }
}
````

### complete-task-pilot-v2/composite/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### complete-task-pilot-v2/composite/stdout.txt

Original bytes: 137617. SHA-256: `24c06f169e20fb0610e6c5474fdffde2b45c78d66ccfd6110f85ce925b768053`.

Normalized bytes: 137617. SHA-256: `24c06f169e20fb0610e6c5474fdffde2b45c78d66ccfd6110f85ce925b768053`.

````zlib-base64
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
F5sFzLCvfv3q/wPhqvYN
````

### complete-task-pilot-v2/composite-output/protocol.json

Original bytes: 132909. SHA-256: `267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038`.

Normalized bytes: 132909. SHA-256: `267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038`.

````zlib-base64
eNrtfV9vJMmR3/t+igKfJIscV/7PXFkwzpIPp4MsrSX5DzwzGBS7i2TvNLuoquqZ5S4WOOnBJ8A2
/GLZwMGAccCsYRuHO8GADd+LD7C+yHwUZ0WT7IxmJpk1WcXu3a2FoCGZVZkZUZGZv/xlZMQXH2XZ
0axoyuYo+zh7bn/Lsi/g/+3fz4rLxfK6KzharJq2Xs/aRbU6Or4tP6+LedkV375h//Z6sZrDG582
zqO24E2xXJfbRm7++kerwnnI/uEn68/xH352WdT4L/+oLI7ufn9589OXd71abNpvqro9qctZVc+b
bZfr8lfrsml3On1ZNk1x7upg898Xzs+dnqpVW67g5aOfl+26XmXVanmdFdmf/uJnP82Kui6us+os
ay/KbFXYSrOuE+U8O73O5mUzK1fzxeo8a2yfyu9np3VZvM7ahX2sWF5dFKdlu5gVy+W17cMXL466
Cl4cffwCFPDi6PjFEbxn/0TUl8fuA1aHqJwyXG5V+mC51ScqN1++fIY03umtWsLHO1o3ZX3klH25
/RLOx24vFqvX3fNnxbIp732itnpdrna0TbnOudjWobnc/kKM3v4iOGVOEWF0+xuVfPsLF9Ktg2q1
/Y0R50GqjPOWVk4RyVmeO20z90kipdO2oNqt022auU0TQwlzH9RuKRVaur859Rup3K4YgsRx6nBV
JzhzayfUuLoz2mlASVevbi8cKZmQuYrqhVI6Fx/UtKss/SFNc6c2kSMDecJeMEad7+VaZnwvqPOW
ceQwuft9urETGi67A0txLsQDz0r3d0V2Cg0q/MidhG/G9zDLR1t+1nqXjyOYLD/OuHmxslOm/Ylw
/mJ1Xlxe2p/zo9B6UH5WzNqT5WJVjrEc/It60ZYZtGEXBLsANKX9/7osM2jxOLMPvynrtpv/YXlY
X56WddZW2aK1y8Sv1kVdPst+an9dtXU136jqODtdL5elfaCqbQXzMjsrV7Py2YvVjQ7UnQqoo4ED
nrqVYo49S6kd8yLcnVspFc7Y4Ua6JuuOOMqoDszkdmXg7tjM3So4cQeTcAe7O/woQ3Miy3WgH8S4
Y4Ojlce48za1iwHzt4Z0JY0767gLAXWnFXduRu8TLbiJqMCd6NGc51bGCBEkpjLxjZ6VokDtCXNH
4IlGv5HHkevZYtmW9cl6tbCT01NC1+6hYrG6naM2HchW5XnRLt6U3dRUnpd1k53V1WX2nB5bQe3/
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
6SL+jw==
````

### complete-task-pilot-v2/composite-output/receipt.json

Original bytes: 137616. SHA-256: `5c2fa82b5eb8793fa389aa8f58f1e354bdd11f6b22420b3785d8c964488f070c`.

Normalized bytes: 137616. SHA-256: `5c2fa82b5eb8793fa389aa8f58f1e354bdd11f6b22420b3785d8c964488f070c`.

````zlib-base64
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
F5sFzLCvfv3/6472Aw==
````

### complete-task-pilot-v2/grades.json

Original bytes: 14199. SHA-256: `bb198f6ea3abfba439d22abab655ab06241006a2c8cf66ccb59f7b8c2497fbde`.

Normalized bytes: 14199. SHA-256: `bb198f6ea3abfba439d22abab655ab06241006a2c8cf66ccb59f7b8c2497fbde`.

````text
{
  "schema": 1,
  "scope": "pilot",
  "qualification": false,
  "protocol_sha256": "267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038",
  "grader_sha256": "7e969da03c80a204dc24a7476a55f1f6dd3f554308f2fc166a9308671fd7a13f",
  "arms": [
    {
      "receipt_sha256": "004bc35be330e33e4fa8d74b3ded16f7075c0a76c90d80989eab182c26cec693",
      "identity": {
        "arithmetic": "native-deployed-defaults",
        "baseline_revision": "aa7c790e804bbf9d491ddb109c3d61bc4a555f7c",
        "manifest_sha256": "8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082",
        "plan": {
          "availability_clamped": false,
          "context_qualification": false,
          "decode_estimate_cache_in_measured_range": true,
          "decode_lookahead": true,
          "device_available_gb": 35.1,
          "device_ram_gb": 51.5,
          "device_working_set_gb": 40.2,
          "est_prefill_s_at_max_context": 96.37647058823536,
          "est_prefill_tok_s": 85,
          "est_warm_tok_s": 3.6291666666666664,
          "expected_peak_gb": 9,
          "expected_peak_semantics": "planned_full_workload_envelope_not_measured_usage",
          "experts_per_layer_cached": 18,
          "fully_resident": false,
          "implementation_context_limit": 262144,
          "lookahead_reserve_bytes": 391118848,
          "max_context_tokens": 8192,
          "max_prefill_wait_minutes": 30,
          "max_ram_percent": 70,
          "memory_ledger": {
            "active_capacity_bytes": 226492416,
            "additional_active_bytes": 0,
            "expected_peak_bytes": 8998290688,
            "fixed_bytes": 5300000000,
            "long_context_reserve_bytes": 0,
            "lookahead_reserve_bytes": 391118848,
            "mtp_resident_bytes": 0,
            "planning_margin_bytes": 1000000000,
            "pool_bytes": 2408140800,
            "prefill_bytes": 332800000,
            "retained_capacity_bytes": 226492416,
            "retained_recurrent_bytes": 339738624,
            "version": 1,
            "vision_resident_bytes": 0
          },
          "memory_target_semantics": "process_budget_not_allocation_goal",
          "model_context_limit": 262144,
          "mtp": false,
          "mtp_context_limit": 262144,
          "mtp_streamed_experts": false,
          "non_cache_allowance_bytes": 6590149888,
          "planned_headroom_gb": 1,
          "pool_gb": 2.4,
          "pool_slots": 871,
          "prefill_chunk": 256,
          "prefill_wait_scope": "accepted_request_to_first_model_token",
          "prefix_cache_max_tokens": 8192,
          "source": "--memory-gb",
          "target_gb": 10,
          "vision": false,
          "vision_charged_gb": 0,
          "vision_context_limit": 65536,
          "vision_resident_gb": 0,
          "vision_resident_reserved": false
        }
      },
      "scores": [
        {
          "id": "sort-records",
          "family": "instruction",
          "passed": false
        },
        {
          "id": "exact-lines",
          "family": "instruction",
          "passed": true
        },
        {
          "id": "filter-unique",
          "family": "instruction",
          "passed": true
        },
        {
          "id": "contradictory-source",
          "family": "instruction",
          "passed": true
        },
        {
          "id": "tool-sum",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": 26
        },
        {
          "id": "tool-empty",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": 0
        },
        {
          "id": "tool-lookup",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": {
            "id": "café-42",
            "stock": 17
          }
        },
        {
          "id": "tool-filter",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": [
            "r2",
            "r4"
          ]
        },
        {
          "id": "merge-intervals",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "unique-order",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "page-range",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "average-windows",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "spanish-structured",
          "family": "multilingual",
          "passed": true
        },
        {
          "id": "hindi-structured",
          "family": "multilingual",
          "passed": true
        },
        {
          "id": "retrieve-middle",
          "family": "context",
          "passed": true
        },
        {
          "id": "retrieve-late",
          "family": "context",
          "passed": true
        }
      ],
      "passed": 15,
      "total": 16
    },
    {
      "receipt_sha256": "58369894b434029d1f39d6c2498b37dc14d110e1b502cc21bbbd645a586ed1c8",
      "identity": {
        "arithmetic": "vq-reference-with-row-invariant-verification-v1",
        "baseline_revision": "aa7c790e804bbf9d491ddb109c3d61bc4a555f7c",
        "inventory_sha256": "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
        "rotary_sha256": "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a"
      },
      "scores": [
        {
          "id": "sort-records",
          "family": "instruction",
          "passed": false
        },
        {
          "id": "exact-lines",
          "family": "instruction",
          "passed": true
        },
        {
          "id": "filter-unique",
          "family": "instruction",
          "passed": false,
          "reason": "JSONDecodeError: Expecting value: line 1 column 1 (char 0)"
        },
        {
          "id": "contradictory-source",
          "family": "instruction",
          "passed": true
        },
        {
          "id": "tool-sum",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": 26
        },
        {
          "id": "tool-empty",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": 0
        },
        {
          "id": "tool-lookup",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": {
            "id": "café-42",
            "stock": 17
          }
        },
        {
          "id": "tool-filter",
          "family": "tools",
          "passed": false,
          "reason": "tool arguments differ from the task"
        },
        {
          "id": "merge-intervals",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "unique-order",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "page-range",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "average-windows",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "spanish-structured",
          "family": "multilingual",
          "passed": true
        },
        {
          "id": "hindi-structured",
          "family": "multilingual",
          "passed": true
        },
        {
          "id": "retrieve-middle",
          "family": "context",
          "passed": true
        },
        {
          "id": "retrieve-late",
          "family": "context",
          "passed": true
        }
      ],
      "passed": 13,
      "total": 16
    },
    {
      "receipt_sha256": "5c2fa82b5eb8793fa389aa8f58f1e354bdd11f6b22420b3785d8c964488f070c",
      "identity": {
        "arithmetic": "vq-reference-with-row-invariant-verification-v1",
        "baseline_revision": "aa7c790e804bbf9d491ddb109c3d61bc4a555f7c",
        "composite_sha256": "f31f100d47f062c415251d92a4c14956b2328e393294a9680eb2ba9c1664f645",
        "inventory_sha256": "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
        "rotary_sha256": "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a"
      },
      "scores": [
        {
          "id": "sort-records",
          "family": "instruction",
          "passed": false
        },
        {
          "id": "exact-lines",
          "family": "instruction",
          "passed": true
        },
        {
          "id": "filter-unique",
          "family": "instruction",
          "passed": true
        },
        {
          "id": "contradictory-source",
          "family": "instruction",
          "passed": true
        },
        {
          "id": "tool-sum",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": 26
        },
        {
          "id": "tool-empty",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": 0
        },
        {
          "id": "tool-lookup",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": {
            "id": "café-42",
            "stock": 17
          }
        },
        {
          "id": "tool-filter",
          "family": "tools",
          "passed": true,
          "executed_fixture_result": [
            "r2",
            "r4"
          ]
        },
        {
          "id": "merge-intervals",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "unique-order",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "page-range",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "average-windows",
          "family": "coding",
          "passed": true,
          "tests": [
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            },
            {
              "passed": true,
              "input_unchanged": true
            }
          ]
        },
        {
          "id": "spanish-structured",
          "family": "multilingual",
          "passed": true
        },
        {
          "id": "hindi-structured",
          "family": "multilingual",
          "passed": true
        },
        {
          "id": "retrieve-middle",
          "family": "context",
          "passed": true
        },
        {
          "id": "retrieve-late",
          "family": "context",
          "passed": true
        }
      ],
      "passed": 15,
      "total": 16
    }
  ]
}
````

### complete-task-pilot-v2/receipt.json

Original bytes: 15212. SHA-256: `88766f45dc0846bf801057c10ebf3d65471045b68e197127bd07b5fbbeb4d11d`.

Normalized bytes: 15051. SHA-256: `52d5a669dfeaf753a0f10062eb5fd8a23e25ba22f54385479741f43fb5581807`.

````text
{
  "schema": 1,
  "complete": true,
  "started_at": "2026-10-03T21:44:12.400973+00:00",
  "scope": "Versioned calibration after omitting unused intermediate-prefill readouts. Prior outputs and the failed full-pack arm remain preserved. No held-out, promotion or clean timing claim.",
  "maximum_concurrent_model_processes": 1,
  "minimum_real_headroom_bytes": 3000000000,
  "runs": [
    {
      "name": "vq32",
      "command": [
        "<HOME>/Projects/slotstream/.build/quantization-research/frozen-vq-prefill-readout-v1/slotstream",
        "quantization-task-run",
        "--protocol-file",
        "<HOME>/Projects/slotstream/.build/quantization-research/complete-task-pilot-v1/prepared/prepared.json",
        "--protocol-sha256",
        "267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038",
        "--baseline",
        "<HOME>/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--source-directory",
        "<HOME>/Projects/slotstream/.build/quantization-research/candidate-3.2",
        "--source-inventory",
        "<HOME>/Projects/slotstream/.build/quantization-research/inventory-3.2/inventory.json",
        "--table",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-extended-rotary-v1/rotary-output/angles-f32le.bin",
        "--output",
        "<HOME>/Projects/slotstream/.build/quantization-research/complete-task-pilot-v2/vq32-output"
      ],
      "bound_bytes": 10000000000,
      "timeout": 14400,
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36601970688,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   467671.\nPages active:                                 449047.\nPages inactive:                              1485338.\nPages speculative:                            141637.\nPages throttled:                                   0.\nPages wired down:                             173540.\nPages purgeable:                                1635.\n\"Translation faults\":                     2297096710.\nPages copy-on-write:                       119832672.\nPages zero filled:                        3764060201.\nPages reactivated:                         191502664.\nPages purged:                               13302782.\nFile-backed pages:                           1764701.\nAnonymous pages:                              311321.\nPages stored in compressor:                   794321.\nPages occupied by compressor:                 366851.\nDecompressions:                            111771472.\nCompressions:                              126711021.\nPageins:                                  2678819942.\nPageouts:                                     514187.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 125824.\nPages tagged resident:                         89457.\nPages tagged compressed:                       36367.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5224.\nPages tag-storage free:                         1498.\nPages tag-storage non-tag pageable:            91574.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5675904.\nTagged compressions:                          851498.\nTagged decompressions:                        718829.\n"
      },
      "peak_physical_bytes": 9365920248,
      "samples": 5288,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36495228928,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   517455.\nPages active:                                 486083.\nPages inactive:                              1445062.\nPages speculative:                             96803.\nPages throttled:                                   0.\nPages wired down:                             172082.\nPages purgeable:                                4105.\n\"Translation faults\":                     2309958111.\nPages copy-on-write:                       119967830.\nPages zero filled:                        3792500045.\nPages reactivated:                         191680578.\nPages purged:                               13313157.\nFile-backed pages:                           1705932.\nAnonymous pages:                              322016.\nPages stored in compressor:                   791986.\nPages occupied by compressor:                 366191.\nDecompressions:                            111773768.\nCompressions:                              126711021.\nPageins:                                  2690853198.\nPageouts:                                     515245.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 126191.\nPages tagged resident:                         90054.\nPages tagged compressed:                       36137.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5222.\nPages tag-storage free:                         2098.\nPages tag-storage non-tag pageable:            90976.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5631104.\nTagged compressions:                          851498.\nTagged decompressions:                        719059.\n"
      },
      "seconds": 306.399743125,
      "identical_prior_complete_cases": 14
    },
    {
      "name": "composite",
      "command": [
        "<HOME>/Projects/slotstream/.build/quantization-research/frozen-vq-prefill-readout-v1/slotstream",
        "quantization-task-run",
        "--protocol-file",
        "<HOME>/Projects/slotstream/.build/quantization-research/complete-task-pilot-v1/prepared/prepared.json",
        "--protocol-sha256",
        "267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038",
        "--baseline",
        "<HOME>/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--source-directory",
        "<HOME>/Projects/slotstream/.build/quantization-research/candidate-3.2",
        "--source-inventory",
        "<HOME>/Projects/slotstream/.build/quantization-research/inventory-3.2/inventory.json",
        "--table",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-extended-rotary-v1/rotary-output/angles-f32le.bin",
        "--dense-overlay-manifest",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-pilot-v1/composite.json",
        "--draft-depth",
        "2",
        "--output",
        "<HOME>/Projects/slotstream/.build/quantization-research/complete-task-pilot-v2/composite-output"
      ],
      "bound_bytes": 10000000000,
      "timeout": 14400,
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36496113664,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   506338.\nPages active:                                 481272.\nPages inactive:                              1459386.\nPages speculative:                             96845.\nPages throttled:                                   0.\nPages wired down:                             173740.\nPages purgeable:                                4105.\n\"Translation faults\":                     2309975066.\nPages copy-on-write:                       119968278.\nPages zero filled:                        3792501153.\nPages reactivated:                         191680578.\nPages purged:                               13313157.\nFile-backed pages:                           1717103.\nAnonymous pages:                              320400.\nPages stored in compressor:                   791986.\nPages occupied by compressor:                 366191.\nDecompressions:                            111773768.\nCompressions:                              126711021.\nPageins:                                  2690864318.\nPageouts:                                     515245.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 126188.\nPages tagged resident:                         90051.\nPages tagged compressed:                       36137.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5222.\nPages tag-storage free:                         2017.\nPages tag-storage non-tag pageable:            91057.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5631104.\nTagged compressions:                          851498.\nTagged decompressions:                        719059.\n"
      },
      "peak_physical_bytes": 8492242872,
      "samples": 4896,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36285431808,
        "swapins": 164,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   474741.\nPages active:                                 489577.\nPages inactive:                              1478944.\nPages speculative:                             96168.\nPages throttled:                                   0.\nPages wired down:                             178830.\nPages purgeable:                                1274.\n\"Translation faults\":                     2322206868.\nPages copy-on-write:                       120119182.\nPages zero filled:                        3821921962.\nPages reactivated:                         191804408.\nPages purged:                               13322746.\nFile-backed pages:                           1738672.\nAnonymous pages:                              326017.\nPages stored in compressor:                   785661.\nPages occupied by compressor:                 364895.\nDecompressions:                            111780135.\nCompressions:                              126711072.\nPageins:                                  2706911797.\nPageouts:                                     516351.\nSwapins:                                         164.\nSwapouts:                                       2908.\nPages tagged:                                 126889.\nPages tagged resident:                         91453.\nPages tagged compressed:                       35436.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5221.\nPages tag-storage free:                         2220.\nPages tag-storage non-tag pageable:            90855.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5492672.\nTagged compressions:                          851499.\nTagged decompressions:                        719761.\n"
      },
      "seconds": 283.80961508300004,
      "identical_prior_complete_cases": 16
    }
  ],
  "budget": {
    "schema": 1,
    "scope": "Remove discarded intermediate-prefill vocabulary readouts without changing any consumed target or draft state, final readout arithmetic, prompt tokens or grading.",
    "parent_commit": "baa0d045181a9c77af25c9b799b74c03b6cd7362",
    "hypothesis": "The previous full VQ task arm crossed its ten-GB bound during retrieval. Its intermediate prompt readouts are unused; removing those allocations may reduce its peak. The cause and sufficiency of this change remain unproven until the new bounded campaign.",
    "prior_failure_receipt_sha256": "09ccf3a4d7f6db9c3b0bb29f681c4da77b8ca75e08983662a4d09c1b7884525c",
    "prior_protocol_sha256": "267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038",
    "build": {
      "maximum_tree_bytes": 6000000000,
      "preflight_bytes": 9000000000,
      "maximum_seconds": 1800,
      "workers": 1
    },
    "native_controls": {
      "maximum_runs": 2,
      "cases": [
        "T0/T1 catalogue",
        "existing speculative generation and added 17/512-token readout-omission state/logit parity with the original draft"
      ],
      "maximum_process_bytes": 10000000000,
      "preflight_bytes": 13000000000,
      "maximum_seconds_per_run": 1800
    },
    "candidate_task_repeats": {
      "maximum_batches": 2,
      "arms": [
        "full VQ3.2 without draft",
        "original-dense VQ3.2 composite with two original drafts"
      ],
      "cases_per_arm": 16,
      "maximum_process_bytes": 10000000000,
      "preflight_bytes": 13000000000,
      "maximum_seconds_per_batch": 14400,
      "retry": false,
      "scope": "Versioned calibration after a specific implementation change. The original failure and scores remain evidence; no held-out claim."
    },
    "maximum_model_processes": 1,
    "minimum_real_headroom_bytes": 3000000000,
    "raw_logit_bytes": 0,
    "new_weight_bytes": 0,
    "additional_output_budget_bytes": 32000000,
    "maximum_research_staging_bytes": 350000000000,
    "paid_compute_usd": 0
  },
  "pins": {
    "<HOME>/Projects/slotstream/.build/quantization-research/frozen-vq-prefill-readout-v1/slotstream": "b2767d52babde28a65f0e95a0d43ea8e62b0e39a4537a02fde20573fa1a0ef04",
    "<HOME>/Projects/slotstream/.build/quantization-research/frozen-vq-prefill-readout-v1/mlx.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
    "<HOME>/Projects/slotstream/.build/quantization-research/frozen-vq-prefill-readout-v1/build-identity.json": "15b60c8d2adee9fc91774c78480461170755c95ff9a87eb817e87474c6df2a62",
    "<HOME>/Projects/slotstream/.build/quantization-research/run-complete-task-pilot-v2.py": "504dcaf13fecfd3899a05d31f1ed97fde1d8854dac93c909ce8a5af259dfb42b",
    "<HOME>/Projects/slotstream/bench/quantization/complete-task-pilot-v1.json": "339f5e53f26eb911d49994a3585522e7570003f21448073cc5e2ec2396de4a9b",
    "Tools/quantization_tasks.py": "7e969da03c80a204dc24a7476a55f1f6dd3f554308f2fc166a9308671fd7a13f",
    "Tools/quantization_tasks_test.py": "d5bc0e07e7badd93e2d50288d5e0d0b28971c4e6f31c95dc99e939efa4a1cedc",
    "<HOME>/Projects/slotstream/.build/quantization-research/complete-task-pilot-v1/prepared/prepared.json": "267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038",
    "<HOME>/Projects/slotstream/.build/quantization-research/complete-task-pilot-v1/vq32-output/receipt.json": "66da48c4d508128502f81f831c5776cfd2aa98b7babef9a0e5e5a32d6d998483",
    "<HOME>/Projects/slotstream/.build/quantization-research/complete-task-pilot-v1-composite/composite-output/receipt.json": "be2903c709d50559b0165d6dbed848dc82325dd2fa12fb343baf336cd421f750"
  },
  "prepared_sha256": "267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038",
  "failures": []
}
````

### complete-task-pilot-v2/vq32/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### complete-task-pilot-v2/vq32/stdout.txt

Original bytes: 139514. SHA-256: `8b68ee652cc68c5d1a43a2436d99c5fb58a93358325fdc728113f97510c0904e`.

Normalized bytes: 139514. SHA-256: `8b68ee652cc68c5d1a43a2436d99c5fb58a93358325fdc728113f97510c0904e`.

````zlib-base64
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
vmz4y9PqcfvucXV5t7l65Cuk0IP1Smsadeeoz587crFd/XVbe8X27u7m3eXy5iY95JsvPnUw/f9P
X+y6Snfe3t+stqmn24en1e7HDT/63c36dp1eEGT+rBdXD8vr7bur1f32e/49jfzF+mq12a63H/mX
H9PzL5YP6+33t6vt+jL178Nf3jysrlcPq83l6s0P1PTm4e6HN+vNB7puudm++bB6WF+vL5fb9d3m
zQe5k+Li/fJxdbPerN49rD6sH9e7EVsu/aWPYkUf8/3763hlory6ek8z71JfOfn+0iyttdf+8tNT
6DXUv7uHj+8ev18q69JDRAz0kOvVUtgY5PvgpLH0iKV3l9eX75d2qdSllVfG63B5pVfxWohLpZcr
dxWslterTw9/uNsu8cnXwvtLc7UKdO97Z8zyermy7+N11JG6qVZeXF1eXV8F75b0YGGuqBvCChmu
pdZXcXlBD/4pjevd0/b+qfgKNq/gi/vV8s/vaH5drh4f373/uF2lTxy1s1EJmpv5ok/td0+bq+er
pPj859Nl27tLmiqFBMr5lVHGX7tLEQwNBQ0QPXgZqLvORxlCEP7KLcV7dS1XUi2Xq/c0PVeG5qYW
OqSxufjL0/Lm80dNz33a0NvoW+T2xyXNvPXmu9T03cNqdfVx13D5/ep2mTq7+/fdfV5J9+ubu22+
aEuDsvnu3XPb9dPmkt+0vFlsl49/XtCMueLptrjb3Hz8z4v75fphdbXIty1oVn23fr++oUm7WD8u
Hlf3y4clLYIvfvri/wPdZyK4
````

### complete-task-pilot-v2/vq32-output/protocol.json

Original bytes: 132909. SHA-256: `267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038`.

Normalized bytes: 132909. SHA-256: `267e4247f6c0845a281b202a83e0679188807d6a0b2f1e12aaeb334e44413038`.

````zlib-base64
eNrtfV9vJMmR3/t+igKfJIscV/7PXFkwzpIPp4MsrSX5DzwzGBS7i2TvNLuoquqZ5S4WOOnBJ8A2
/GLZwMGAccCsYRuHO8GADd+LD7C+yHwUZ0WT7IxmJpk1WcXu3a2FoCGZVZkZUZGZv/xlZMQXH2XZ
0axoyuYo+zh7bn/Lsi/g/+3fz4rLxfK6KzharJq2Xs/aRbU6Or4tP6+LedkV375h//Z6sZrDG582
zqO24E2xXJfbRm7++kerwnnI/uEn68/xH352WdT4L/+oLI7ufn9589OXd71abNpvqro9qctZVc+b
bZfr8lfrsml3On1ZNk1x7upg898Xzs+dnqpVW67g5aOfl+26XmXVanmdFdmf/uJnP82Kui6us+os
ay/KbFXYSrOuE+U8O73O5mUzK1fzxeo8a2yfyu9np3VZvM7ahX2sWF5dFKdlu5gVy+W17cMXL466
Cl4cffwCFPDi6PjFEbxn/0TUl8fuA1aHqJwyXG5V+mC51ScqN1++fIY03umtWsLHO1o3ZX3klH25
/RLOx24vFqvX3fNnxbIp732itnpdrna0TbnOudjWobnc/kKM3v4iOGVOEWF0+xuVfPsLF9Ktg2q1
/Y0R50GqjPOWVk4RyVmeO20z90kipdO2oNqt022auU0TQwlzH9RuKRVaur859Rup3K4YgsRx6nBV
JzhzayfUuLoz2mlASVevbi8cKZmQuYrqhVI6Fx/UtKss/SFNc6c2kSMDecJeMEad7+VaZnwvqPOW
ceQwuft9urETGi67A0txLsQDz0r3d0V2Cg0q/MidhG/G9zDLR1t+1nqXjyOYLD/OuHmxslOm/Ylw
/mJ1Xlxe2p/zo9B6UH5WzNqT5WJVjrEc/It60ZYZtGEXBLsANKX9/7osM2jxOLMPvynrtpv/YXlY
X56WddZW2aK1y8Sv1kVdPst+an9dtXU136jqODtdL5elfaCqbQXzMjsrV7Py2YvVjQ7UnQqoo4ED
nrqVYo49S6kd8yLcnVspFc7Y4Ua6JuuOOMqoDszkdmXg7tjM3So4cQeTcAe7O/woQ3Miy3WgH8S4
Y4Ojlce48za1iwHzt4Z0JY0767gLAXWnFXduRu8TLbiJqMCd6NGc51bGCBEkpjLxjZ6VokDtCXNH
4IlGv5HHkevZYtmW9cl6tbCT01NC1+6hYrG6naM2HchW5XnRLt6U3dRUnpd1k53V1WX2nB5bQe3/
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
6SL+jw==
````

### complete-task-pilot-v2/vq32-output/receipt.json

Original bytes: 139513. SHA-256: `58369894b434029d1f39d6c2498b37dc14d110e1b502cc21bbbd645a586ed1c8`.

Normalized bytes: 139513. SHA-256: `58369894b434029d1f39d6c2498b37dc14d110e1b502cc21bbbd645a586ed1c8`.

````zlib-base64
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
ZcOfn1aP23ePq8u7zdUjXyGFHqxXWtOoO0d9/tyRi+3qL9vaK7Z3dzfvLpc3N+kh3/7mUwfT///0
m11X6c7b+5vVNvV0+/C02v244Ue/u1nfrtMLgsyf9eLqYXm9fXe1ut/+wL+nkb9YX6022/X2I//y
1/T8i+XDevvD7Wq7vkz9+/DnNw+r69XDanO5evMjNb15uPvxzXrzga5bbrZvPqwe1tfry+V2fbd5
80HupLh4v3xc3aw3q3cPqw/rx/VuxJZLf+mjWNHHfP/+Ol6ZKK+u3tPMu9RXTr6/NEtr7bW//PQU
eg317+7h47vHH5bKuvQQEQM95Hq1FDYG+T44aSw9Yund5fXl+6VdKnVp5ZXxOlxe6VW8FuJS6eXK
XQWr5fXq08Mf7rZLfPK18P7SXK0C3fveGbO8Xq7s+3gddaRuqpUXV5dX11fBuyU9WJgr6oawQoZr
qfVVXF7Qg39K43r3tL1/Kr6CzSv44n61/NM7ml+Xq8fHd+8/blfpE0ftbFSC5ma+6FP73dPm6vkq
KT7/+XTZ9u6SpkohgXJ+ZZTx1+5SBENDQQNED14G6q7zUYYQhL9yS/FeXcuVVMvl6j1Nz5WhuamF
DmlsLv78tLz5/FHTc5829Db6Frn9cUkzb735PjV9/7BaXX3cNVz+sLpdps7u/n13n1fS/frmbpsv
2tKgbL5/99x2/bS55Dctbxbb5eOfFjRjrni6Le42Nx//8+J+uX5YXS3ybQuaVd+v369vaNIu1o+L
x9X98mFJi+A3P/1/uq8irg==
````

### frozen-vq-prefill-readout-v1/build-identity.json

Original bytes: 40635. SHA-256: `15b60c8d2adee9fc91774c78480461170755c95ff9a87eb817e87474c6df2a62`.

Normalized bytes: 40635. SHA-256: `15b60c8d2adee9fc91774c78480461170755c95ff9a87eb817e87474c6df2a62`.

````text
{
  "binary_sha256": "b2767d52babde28a65f0e95a0d43ea8e62b0e39a4537a02fde20573fa1a0ef04",
  "checks_sha256": "96ac85f5e463601dc536c80f0dc9a882a265fbc418ad214d00cf7c268534024e",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "source_archive_sha256": "a4c9a7a1366dfaf4c4c1cb365773990de25502be9d975b257c3a09a860571add",
  "build_inputs": {
    "dbmd_sha256": "3cc761c52629f220e5de40733d052884a3787885d696e26f07fdd1d1644d642b",
    "files": {
      "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
      "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
      "Sources/Slotstream/AppliedModelConfiguration.swift": "0042eecacbd2f4ddb136681c550237bb2ca1c4972035409a59bd4fddd1113aad",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
      "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
      "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
      "Sources/Slotstream/Checkpoint.swift": "361b54ab482ab1b08debf846148d16fb811ee3550cb8ca1ae7526dc9b825e04b",
      "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
      "Sources/Slotstream/ContextFeasibility.swift": "5e7d185542e5ef173683afd5e6999c7ec76c36bfa8e6d3356ec40d1b695edcfe",
      "Sources/Slotstream/ContextMemory.swift": "31da5a698303ec9898747052996996eeec2ac46d40b7c011791ea7b00e6bd23b",
      "Sources/Slotstream/ContextWindowPolicy.swift": "73b2321aae6a2c22fc7173467136770dbf45a1eca4a185293491472680a13a24",
      "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
      "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "24ca04e99cf4195e59bc08692b6bf62393872161c52f8b5eb1913c6282c9fb32",
      "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
      "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
      "Sources/Slotstream/ExpertPrefetch.swift": "46fb601813d05b788a3648139cbde2b88c94714a5e15f99456e4b2e7072f4b6a",
      "Sources/Slotstream/ExpertStore.swift": "4dae1ae2ff59f671ad4b6e0dbc6405fb198d2dc523ec9f2d9e00c9b2dfce7bcc",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
      "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
      "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
      "Sources/Slotstream/Generate.swift": "792159f8e9f11d1c98373c08e066b79908192d142d25a9f8bf2a6fbb22b48c82",
      "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
      "Sources/Slotstream/Governor.swift": "89310e4c1b2cef2b104122445a1ccdb118d4ea4c38ee7bd726d78261be74457b",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "d5d5b2fcc1a6012c25f0d2a8ff7e6d7ba4ca758d385c38220518e10176e7acc2",
      "Sources/Slotstream/MTP.swift": "a967ad702f6830d5862ab1f7b78dcf469645b9b9db70b55965d76af257b7ea40",
      "Sources/Slotstream/MTPExpertStream.swift": "391b13fed457ba61a7cb4e107472a699ba87adc9a57cfd14580faa2dfbe50fd7",
      "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "1048ad7bcd1c9f93f5316465ed38d7bd93046fe4bfbd0fc138d972e646ee12ab",
      "Sources/Slotstream/ModelPackRegistry.swift": "56c7e6930287d9e8495d90e88e61df4dd062e78afa2767f4047941e1bb67aa5b",
      "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
      "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
      "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
      "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
      "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
      "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
      "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
      "Sources/Slotstream/PersistentPrefixFormat.swift": "d03795ee46252fe5df904591289af41a69811f2a211f437764d3f80ddb0d20ad",
      "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
      "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
      "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
      "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/Plan.swift": "240766430e77e186107a2b3eea844b8876bb509f92e2fbcfcea9d989e1a37b54",
      "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
      "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
      "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
      "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
      "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
      "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
      "Sources/Slotstream/RequestControl.swift": "56c5e664aaf33454f5ef45efedb3849ee539fd91e844d58885bf304f5aab3c1d",
      "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
      "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "8566a2a7734ae19f07aa3b4216b2c219687b52819b3ac86a2f79533d31ad03a5",
      "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
      "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
      "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
      "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
      "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
      "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
      "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
      "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
      "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
      "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
      "Sources/Slotstream/VQDraftWeights.swift": "232799bd52934647ea792473111ab1b671f1c6b563c7980c16036f2eeff10e72",
      "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
      "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
      "Sources/Slotstream/VQGenerationProbe.swift": "ae7bd4f10c8a71daa548d73298d74485d8f54de45ed0ff78e21194bdbe49fbf5",
      "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
      "Sources/Slotstream/VQModelProbe.swift": "84749552ead79c5cf83472fd6c1802050c72c7d22041c5ab8f0e1233b1d01f04",
      "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
      "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
      "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
      "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
      "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
      "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
      "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
      "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
      "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
      "Sources/Slotstream/VQRotaryCoefficients.swift": "8aeda16d1f6f79296cd872dbb49eebff9dcef4ba6f8f4462acc5c001f62ce63f",
      "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
      "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
      "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
      "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "6375ebfb23b05b7286c9d22b78fa8051dd85c5d6f160a52c6dcbb98a165bb2be",
      "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
      "Sources/Slotstream/Version.swift": "d68b6b9f343402041c33452b885eebce140773cc26379b4adaae996640427b40",
      "Sources/Slotstream/Vision.swift": "639b5c4bbe05654db411d587f31e7962d3db857aa4be38a2b54f982199d51eb5",
      "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
      "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
      "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
      "Sources/Slotstream/WeightStore.swift": "b7b9c43d6aaee926a6c13701e65cded306e9eb8483477b61ff81dcf212f39999",
      "Sources/Slotstream/Weights.swift": "01fb2c61390e6b7585eb80a34bf53a8c460fb6258908d57a3c1ed1fa77ec3ce8",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
      "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
      "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
      "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
      "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "25b469da9856405dd6421d6754d7caaeae378fc5e77ae1637a2552a139a810f7",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
      "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "b891dd485cafb3fc2bd4961fd4fd372e30cc496fb4c2bac414f4835ef51c0d3a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d1ac7938651c5b9db8e95706ab1f6802dbce55e3abcf9213df0407ddbfbe498c",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationTasks.swift": "f576e811b053d958aef413aac4d84b09ef241585a5bebf8146c6bd4d06bfb5f7",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
      "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
      "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b18979a76cb2112a2beb8fd3196c1d26e36c2626c2a8de732b6b4fc134be61c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
      "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "95c27157cb514ff744e70366bf4ac7a5b435279d7c8e232189dfb292e22c1f21",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQContext.swift": "75d660486eb83511b6c3bfc0614e1257d5578d68f42619c6312ae7e5cc296f31",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "fcd2f234c893483618844cbd2296e74b27934dca28b06e24860c2b1212da135a",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQState.swift": "655571a17a6e25833211de23de8b8c4f387ad2c7043e49da07c7b447babd2992",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "31de09d8efc8951692f60fc9f5c4ec4d14dbef5b67656da18bca519ab4bcbcee",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
      "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
      "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
      "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
      "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
      "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
      "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
      "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
      "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
      "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
      "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
      "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
      "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
      "Sources/SlotstreamTestKit/T0Checks.swift": "25bcf4ef6daeb29a31ebfacd2217bf12afb7788672f72c21d13ae7ac41aded97",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
      "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "d26e43367ba2d61d7afd9f5b175e95b714409b1717b86b9fe71f1306e36b6a81",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "3ba24ae3e24dd10214e3288f007952d9e2b06241c081e29313b42ac7aa7a31bb",
      "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
      "Sources/slotstream-cli/DraftStreamCommands.swift": "4fd131e2303fd4f2c9765fff9b2543011d565dd5c070b8b380910528c9026a33",
      "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "249274657b4f4f4c3e694a2b0db671b3af8b92a2148495647f3be9092f48f6b2",
      "Sources/slotstream-cli/LaunchCommand.swift": "a18212935aa5aa2c956593838ef181ccbf0aae2501b7a0071f4b4b44298ea0f9",
      "Sources/slotstream-cli/MTPCommands.swift": "04d06d66f29339b4d88dfbae7be18ef873c32c09320536ee7916e7d621816e08",
      "Sources/slotstream-cli/ModelPackCommand.swift": "daaa7bf13449090afb10d04c7ecc2a6bf9af5c0f9c182e758417aeb1a51408fa",
      "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
      "Sources/slotstream-cli/PrefixExactCommands.swift": "b70f0a6f2536f0eb1fc00007260cc6dffe2592b1f32271225fe1304261346e28",
      "Sources/slotstream-cli/Pull.swift": "ca9f9e90ef959b194653945e29ebd3b9f1932ef3e46dfceaa7b09562fa2c9d7b",
      "Sources/slotstream-cli/QuantizationCommands.swift": "bd6fcf1328405c17c3d99748b2b6572e4b9520d297fcac4bdab1927c6520d0b1",
      "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
      "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
      "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
      "Sources/slotstream-cli/main.swift": "8c42e20197cd7673fa8f37e57451f4f753204edf6a58e96de6ea7474c8c1dbd3",
      "Tools/build_sevra_mac.sh": "debb9110cd8e316bac4e153e9f7cfe07fe0437dbb8e781bb50bcf93b0488771d",
      "Tools/generate_sevra_icon.sh": "8228ccb8e4d707c2a73336f283ed599f72cbc2213589ca36191d675e737141b6",
      "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
      "Tools/mac_build_inputs.py": "1e406cea50efb4125d0d5fc45be838288ee440d90097dc508ce2b0d3ad68eb1a",
      "Tools/render_sevra_icon.swift": "cbcf593dec275773cc86118bc4d6aff423534d9df7e62ef0fb014733c9aa3095",
      "apps/macos/App/AppModel.swift": "aea5ef70be88b171a1932c3370909c044880177d6651f3b961f219036e29f3f6",
      "apps/macos/App/AppModelWork.swift": "76f3d80447c5b4a829ac4bc1e0f429ee3f1df76a53f06b3110c03b75e9e90d14",
      "apps/macos/App/ContentView.swift": "f64f31bc3cfe9ab8f8d1c207f1e137ebe1102927ec4e1f409c21fab3d0cc5745",
      "apps/macos/App/MacCommands.swift": "e85cc090add3bfd42cc259727fcc16c76f44307a5172e40a96dd7f74747674c6",
      "apps/macos/App/MiniAppHost.swift": "9720c739c4ef11b56e3cb3e30bcca6e17f3c97ba7cf4d3e26ad743d0e7e82bec",
      "apps/macos/App/NativeControls.swift": "a66a3219a431dc4523a1c8ec16e6372331123b7c43888e75c250047e60193729",
      "apps/macos/App/NativeText.swift": "bb471331e742b37bee04fea4db02c80506c91e95597faa12c23962aea8c7d614",
      "apps/macos/App/ObserverMark.swift": "93f172ecc0b360338bb09913071a6ba6644077576abf9b323bfa95ebd4c5b764",
      "apps/macos/App/ResponseDetails.swift": "fe85363dc19a3a767250df73cdb566a4e22117236b9137bfd5853e19ff437087",
      "apps/macos/App/SevraMain.swift": "7ae10c0cf10b4ffda3c54416db51f589eac0a8eb1f59b24a3e5ffa01da7cbd34",
      "apps/macos/App/WindowState.swift": "c3782b38d4ff1342587aef3e54688bc0fb6160f92388f8b4de1742780d09a96e",
      "apps/macos/App/WorkViews.swift": "27be9436faf7b6b56adc0892f13b911652bbc1960493765fb869a7b14edc8af9",
      "apps/macos/CSandbox/include/sevra_sandbox.h": "7885534cb39319e57ebe6dcf196447e2a50b31fdf31ca8c13fe2457f005477d9",
      "apps/macos/CSandbox/sevra_sandbox.c": "6172c4955a01baf46affb019f5f1be32b8d388371203ecd41802f5ba9bd5a3f8",
      "apps/macos/Extract/main.swift": "1892d923b140622e1698c1c0f1eaba5f9684921f4917cdec52003b26f89617f5",
      "apps/macos/Info.plist": "73cc83e91b2729b1ef576226fd95104e0bb763f874fe937d81d92d9785e8bdb6",
      "apps/macos/Package.resolved": "2d751ea715e77a0a7994c55a13e23b0327b9e6b42827ec7603cf740f44d53da4",
      "apps/macos/Package.swift": "2d9e44a7d3a5067d7eecb4f9a929b355943fcad7d91e56eabaa9a160a47bb201",
      "apps/macos/Presentation/ComposerSession.swift": "1e0ec10e4833da338b289e6b766b4d471924e47cd1f5cfb5d301cdbd4b719ef6",
      "apps/macos/Presentation/HistoryPage.swift": "576e721818d61bfd988b6f57b136aab6bbb8c847f8e8a2116ce76708f4f4f84d",
      "apps/macos/Presentation/MarkdownDocument.swift": "39fa604d4b09e8fdd61cd4b5be33c912fd748501c4aaeb7f2f420023b9fe6a45",
      "apps/macos/Presentation/Module.swift": "dda9b75f64b106eb544de201f599122d75abc483c5b156bba6c05c0f956dbc3c",
      "apps/macos/Resources/Fonts/Inter-OFL.txt": "5b9321a4298cfeb6b34354164a1c3afc3db114569984c502b9b35d988fd58c57",
      "apps/macos/Resources/Fonts/Inter.ttf": "29160a80ff49ddcab2c97711247e08b1fab27a484a329ce8b813d820dc559031",
      "apps/macos/Resources/Fonts/Poppins-Medium.ttf": "90373e7d838d32468438fc3e152dca0bdb12edcab99ea639f158790b1ba1fd05",
      "apps/macos/Resources/Fonts/Poppins-OFL.txt": "6be04893d770899a015649c7aa3b582f871b272f8747a92b78b17c3e5c8b2573",
      "apps/macos/Resources/Fonts/manifest.json": "1e79dfd278dbe9bfd8afbf7e5cbaee64dff1574fc1cc3aca8fdd903f4056677e",
      "apps/macos/Resources/Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
      "apps/macos/Resources/Licenses/VQLab-NOTICE.txt": "04d3fc0f5e2ddf3570b5895316cbee7a62d7d75bdd216c39b3aee95c8942941d",
      "apps/macos/Resources/Licenses/swift-cmark-COPYING": "c22e885f33b821bddb24cf007145e5540655b6c0f403e49e6c76a93c28e6d9a9",
      "apps/macos/Resources/Licenses/swift-markdown-LICENSE.txt": "167beb36f181bd163c93c6feb45c68e5f9462fe1af55b278f7bfd1df20e673a3",
      "apps/macos/Resources/Licenses/swift-markdown-NOTICE.txt": "ee7da43afcac4a52196a2141024573ec2ceb84b14e74dfed38522d94586fbc52",
      "apps/macos/Resources/Sevra.icns": "b28f2df8e40cafc2e89fb3ae5a0e361b5470851d833495df9b3dd4ca0395471d",
      "apps/macos/Runtime/Changes.swift": "17735c951b3bef2c2b30f6fe029b5e8f635364513a7669da770d934815411e7d",
      "apps/macos/Runtime/ConversationContext.swift": "89a1a6cfd9b3d879a53c40443e3c02bcef380f1599354fc386469bd4d39d81e7",
      "apps/macos/Runtime/Extensions.swift": "632ed6d2ec6d1704b24c79c5c71a1ce790a37a1fdbbb24ac5c1db32cb0ac9406",
      "apps/macos/Runtime/Extraction.swift": "5bc0b25ad3b29481bb2b92491cff976934d9f5f92ca3bf4dc83988b056be8955",
      "apps/macos/Runtime/HomeArchive.swift": "d43376db4e1d7bb6919bf3e332477fffa28ceefdc92d0b90ff6b206fe18fb169",
      "apps/macos/Runtime/HomeStore.swift": "0a4db7db75f1de1f3042a78af86e6057377b92deab4639326040a620e609a49b",
      "apps/macos/Runtime/HomeTemplate.swift": "e25b0a112abdea7d915c1f553fb3b62078b8ab35ab60dc5c3d80a82468caa7a2",
      "apps/macos/Runtime/HomeWriter.swift": "d61aa8ebc3ee627a5281100eb77cec4eaf633fcd97a792a5a4290136f499c303",
      "apps/macos/Runtime/Inference.swift": "a690583eddce6facd924e18622845f9a7e7ecdc33a255c52292f377f2e76873a",
      "apps/macos/Runtime/InferenceCache.swift": "48aa1f16913c2ac4f227b11e76131c2d5e4860403cbc6280de91946b19aba670",
      "apps/macos/Runtime/LocalIPC.swift": "2f9ca541d07687034f6808958e54397f017f260d394216ab71cd8221bb3d599e",
      "apps/macos/Runtime/ModelSetup.swift": "3080010ef569fbee93c372a61699ef13e4ac4066a1be40815e991ff647b16e62",
      "apps/macos/Runtime/ModelVerification.swift": "29564d5f03207e4286f6ab8ab286a22dac58de92bb459f3f765417a99ce38e53",
      "apps/macos/Runtime/Models.swift": "6ee898c4a2a092f30eb5696829235ab391d3e0290319a88e38b94ec1c63ab3f5",
      "apps/macos/Runtime/Performance.swift": "b377ed9652f1321db355daefc7371d8c048173b56a13a5c2d7ed484949895b78",
      "apps/macos/Runtime/ResponseMetrics.swift": "91db9f1ce48a14f16b5e9b516dfdf20e0354e475a170f6888c88018cff6ca737",
      "apps/macos/Runtime/Runtime.swift": "4ac3bda459c64c41d4bc5c4ce461e0c60889913c913873237c8bc7b3cfca9b48",
      "apps/macos/Runtime/RuntimeExtensions.swift": "8a03804b02763569d839359064fa22e0a50e88907a56dd5eeaf5f88b327ce311",
      "apps/macos/Runtime/SourceNavigation.swift": "c2286df52a8a3ec200a5adad3162c899c08e480b858a15e1fe5e0634202cbb3e",
      "apps/macos/Runtime/Sources.swift": "b458dc283490f833ad50e17079af849d644d27408c45b7f04e01dbb059e59267",
      "apps/macos/Runtime/Thinking.swift": "be477cb342ac1057a5fcd82842b498cbbb7ecfb91548e5ce49e4aef9fcbee420",
      "apps/macos/Runtime/Tools.swift": "6cd7577792d86d6a2d31ba24d0e4bdf55374a5b443954d3584e27404f725d52f",
      "apps/macos/Sevra.xcodeproj/project.pbxproj": "dc22426b24c2c8eafe143ad67c087f800a7708e2d7c6d43ba7f9e4a0abe3040c"
    },
    "scope": "Local development build inputs. Ad-hoc signing is not release qualification.",
    "sdk": "26.5",
    "swift": "Apple Swift version 6.3.3 (swiftlang-6.3.3.1.3 clang-2100.1.1.101)\nTarget: arm64-apple-macosx26.0"
  }
}
````
