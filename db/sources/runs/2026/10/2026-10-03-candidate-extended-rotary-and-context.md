---
type: run
created: 2026-10-03T20:59:36.118042+00:00
updated: 2026-10-03T20:59:36.118042+00:00
summary: Authenticated candidate rotary coefficients and bounded native context recovery
binary: 15180800df52a63c802969c4af69118ad7f220b134a656d8d66bed2b329adabd
captured_at: 2026-10-03
command: Exact sequential commands are preserved in the driver and supervision identities below.
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Authenticated candidate rotary coefficients and bounded native context recovery
tool: bounded VQ research diagnostics
---

The independent Python coefficient producer covers all 262144 model positions, authenticates every existing embedded coefficient, and preserves the complete earlier 2054-position prefix exactly. This component coverage alone is not context qualification. The native loader owns a fully authenticated regular-file snapshot with exact extent, digest, stable descriptor metadata, cancellation and real-headroom admission. The component diagnostic matches all duplicated cosine/sine bytes, mixed batch indexing and original prefix; refused files and cancelled reads do not change retained values. A separate bounded native campaign tests explicit 4096, 8192 and 32768 windows on the original-dense VQ3.2 composite with the separately authenticated original draft head. Each case reads the full prefix in 512-token passes, checks committed draft alignment, restores provisional head state, compares target-verification logits, reuses recorded target prefixes, proves exact target/head continuation, consumes the full admitted window, and refuses the next token without mutation. All candidate context cases retain the ten-GB process bound, thirteen-GB preflight and three-GB real-headroom rule. Global paging remains diagnostic; these runs are not clean speed evidence. The embedded-table path still defaults to its original finite window. No product Auto selection, supported pack, vision claim, full 262144-token native run, held-out task quality or speed target is qualified. The source also closes remote CI for the earlier state-recovery commit, not this new context binary.

Local home prefixes are replaced with <HOME>. Original byte lengths and hashes identify the unmodified local files. For large transcripts, the normalized UTF-8 bytes are stored losslessly as zlib-compressed base64 inside this Markdown source. Decode with `zlib.decompress(base64.b64decode(block))` and verify the listed normalized byte length and SHA-256. Every encoded block was round-trip checked before writing. This changes storage only, not the captured evidence. Small transcripts remain plain text. Raw tensor fixtures and source-bound executables remain in the bounded research directory; manifests bind their hashes. No model is installed or activated.

### capture-vq-context-v1.py

Original bytes: 3474. SHA-256: `f862a840d3b4e4c4b3417346823bc5b332a690db790b62545f673047100220ce`.

Normalized bytes: 3474. SHA-256: `f862a840d3b4e4c4b3417346823bc5b332a690db790b62545f673047100220ce`.

````text
from pathlib import Path
import importlib.util,json
r=Path('.build/quantization-research')
spec=importlib.util.spec_from_file_location('capture',r/'capture-vq-kernel-cache-v1.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
run=json.loads((r/'vq-context-functional-v1/receipt.json').read_text());assert run['complete']
files=['capture-vq-context-v1.py','build-vq-context-v1.py','freeze-vq-context-v1.py','run-vq-context-functional-v1.py','vq-context-functional-driver-v1.log','vq-context-functional-v1/receipt.json',
       'vq-context-build-v1/receipt.json','vq-context-build-v1/inputs-before.json','vq-context-build-v1/inputs-after.json','vq-context-build-v1/0.log','vq-context-build-v1/1.log',
       'run-vq-extended-rotary-v1.py','vq-extended-rotary-resource-budget-v1.json','vq-extended-rotary-v1/receipt.json','vq-extended-rotary-v1/rotary/stdout.txt','vq-extended-rotary-v1/rotary/stderr.txt','vq-extended-rotary-v1/rotary-output/table.json','143b575-complete-ci-v1.json']
summary=[]
for row in run['runs']:
 name=row['name'];files += ['vq-context-functional-v1/'+name+'/stdout.txt','vq-context-functional-v1/'+name+'/stderr.txt']
 item={k:row.get(k) for k in ('name','passed','seconds','peak_physical_bytes')}
 path=r/'vq-context-functional-v1'/(name+'-output')/'receipt.json'
 if path.exists():
  files.append(str(path.relative_to(r)));v=json.loads(path.read_text());item['assertions']=len(v['report']['items']);item['failures']=sum(not x['passed'] for x in v['report']['items']);item['native_peak_bytes']=v['peak_process_bytes']
 summary.append(item)
(r/'vq-context-summary-v1.json').write_text(json.dumps(summary,indent=2)+'\n');files += ['vq-context-summary-v1.json']
scope="""The independent Python coefficient producer covers all 262144 model positions, authenticates every existing embedded coefficient, and preserves the complete earlier 2054-position prefix exactly. This component coverage alone is not context qualification. The native loader owns a fully authenticated regular-file snapshot with exact extent, digest, stable descriptor metadata, cancellation and real-headroom admission. The component diagnostic matches all duplicated cosine/sine bytes, mixed batch indexing and original prefix; refused files and cancelled reads do not change retained values. A separate bounded native campaign tests explicit 4096, 8192 and 32768 windows on the original-dense VQ3.2 composite with the separately authenticated original draft head. Each case reads the full prefix in 512-token passes, checks committed draft alignment, restores provisional head state, compares target-verification logits, reuses recorded target prefixes, proves exact target/head continuation, consumes the full admitted window, and refuses the next token without mutation. All candidate context cases retain the ten-GB process bound, thirteen-GB preflight and three-GB real-headroom rule. Global paging remains diagnostic; these runs are not clean speed evidence. The embedded-table path still defaults to its original finite window. No product Auto selection, supported pack, vision claim, full 262144-token native run, held-out task quality or speed target is qualified. The source also closes remote CI for the earlier state-recovery commit, not this new context binary."""
module.capture('candidate-extended-rotary-and-context','Authenticated candidate rotary coefficients and bounded native context recovery',scope,files,'frozen-vq-context-v1')
````

### build-vq-context-v1.py

Original bytes: 3016. SHA-256: `53a298833c21532734d02d58f4f8a11f7439d75d9479e77e12e1ec3586a03752`.

Normalized bytes: 3016. SHA-256: `53a298833c21532734d02d58f4f8a11f7439d75d9479e77e12e1ec3586a03752`.

````text
from pathlib import Path
import ctypes,ctypes.util,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
out=Path('.build/quantization-research/vq-context-build-v1');out.mkdir(exist_ok=False)
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

### freeze-vq-context-v1.py

Original bytes: 1194. SHA-256: `d76c91f6a86df7ca029d3a60e1ba5c72737b239080993baf045e9db2e18d06f8`.

Normalized bytes: 1194. SHA-256: `d76c91f6a86df7ca029d3a60e1ba5c72737b239080993baf045e9db2e18d06f8`.

````text
from pathlib import Path
import hashlib,json,shutil,subprocess,tarfile
r=Path('.build/quantization-research');build=r/'vq-context-build-v1';out=r/'frozen-vq-context-v1'
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

### run-vq-context-functional-v1.py

Original bytes: 5066. SHA-256: `97fe11d49d8ee0b42e92082bb754c2b854bb49a0b0fde02453e2070baff819fb`.

Normalized bytes: 5066. SHA-256: `97fe11d49d8ee0b42e92082bb754c2b854bb49a0b0fde02453e2070baff819fb`.

````text
from pathlib import Path
from datetime import datetime,timezone
import ctypes,ctypes.util,hashlib,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
r=Path('.build/quantization-research').absolute();out=r/'vq-context-functional-v1'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
cli=Path('.build/release/slotstream').absolute();checks=Path('.build/release/slotstream-checks').absolute()
source=r/'candidate-3.2';inventory=r/'inventory-3.2/inventory.json'
state=[str(cli),'quantization-state-check','--source-directory',str(source),'--source-inventory',str(inventory)]
overlay=['--dense-overlay-baseline',str(Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit'),'--dense-overlay-manifest',str(r/'vq-dense-overlay-pilot-v1/composite.json')]
generation=[str(cli),'quantization-generation-check','--source-directory',str(source),'--source-inventory',str(inventory),'--generation-profile',str(Path('bench/quantization/greedy-v1.json').absolute()),'--output',str(out/'generation-output')]+overlay
table=r/'vq-extended-rotary-v1/rotary-output/angles-f32le.bin'
cells=[('catalogue',[str(checks),'--tier','t0','--tier','t1','--json'],10,13,900),
       ('rotary',[str(cli),'quantization-rotary-check','--table',str(table)],2,13,300)]
for limit in (4096,8192,32768):
 name='context-'+str(limit)
 command=[str(cli),'quantization-context-check','--source-directory',str(source),'--source-inventory',str(inventory),
          '--table',str(table),'--limit',str(limit),'--output',str(out/(name+'-output'))]+overlay
 cells.append((name,command,10,13,3600))
out.mkdir()
record={'complete':False,'started_at':datetime.now(timezone.utc).isoformat(),'scope':'Functional acceptance only; no throughput qualification, hardware simulation or model activation.',
 'maximum_concurrent_model_processes':1,'minimum_real_headroom_gb':3,'maximum_total_seconds':10800,
 'pins':{str(p):sha(p) for p in [cli,checks,inventory,r/'vq-dense-overlay-pilot-v1/composite.json',Path(__file__),Path('Tools/lib/mlx-0.32.2.metallib'),Path('bench/quantization/greedy-v1.json'),table]},
 'protocol':[{'name':n,'command':c,'process_bound_gb':p,'preflight_gb':f,'timeout_seconds':t} for n,c,p,f,t in cells], 'runs':[]}
lib=ctypes.CDLL(ctypes.util.find_library('proc'));began=time.monotonic();child=None
def save():(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG','VQ_','VQLAB_'))}
# Research requires no ambient override; production-only pressure flag is not inherited.
record['explicit_environment']={};record['build_inputs']=json.loads((r/'vq-context-build-v1/inputs-before.json').read_text());assert record['build_inputs']==json.loads((r/'vq-context-build-v1/inputs-after.json').read_text());save()
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
  if name.startswith('context-'):
   assert json.loads((out/(name+'-output')/'receipt.json').read_text())['report']['passed']
  if name=='rotary':assert json.loads(text)['passed']
  row['passed']=True;save();print('PASS',name,row['peak_physical_bytes'],flush=True)
 record['complete']=True
except BaseException as e:
 record['failure']=type(e).__name__+': '+str(e)
 if child is not None and child.poll() is None:terminate_child_tree(child)
 save();raise
finally:save()
````

### vq-context-functional-driver-v1.log

Original bytes: 136. SHA-256: `e4ed68aa61bc4110802d2ce0ba7a099a874231fd8df1f93f022f120fe9705d73`.

Normalized bytes: 136. SHA-256: `e4ed68aa61bc4110802d2ce0ba7a099a874231fd8df1f93f022f120fe9705d73`.

````text
PASS catalogue 1446757768
PASS rotary 405865432
PASS context-4096 8437568408
PASS context-8192 8498680704
PASS context-32768 9389527888
````

### vq-context-functional-v1/receipt.json

Original bytes: 67042. SHA-256: `0188c77eb735f79b8728eef763aea559e138f0f739af364a557c723553cb3bca`.

Normalized bytes: 66832. SHA-256: `4e854793d6a6484cce6ea1ade1e5567b1fde5e3e3ddd5eb073b4366cf7150cbf`.

````text
{
  "complete": true,
  "started_at": "2026-10-03T20:33:04.919773+00:00",
  "scope": "Functional acceptance only; no throughput qualification, hardware simulation or model activation.",
  "maximum_concurrent_model_processes": 1,
  "minimum_real_headroom_gb": 3,
  "maximum_total_seconds": 10800,
  "pins": {
    "<HOME>/Projects/slotstream/.build/release/slotstream": "15180800df52a63c802969c4af69118ad7f220b134a656d8d66bed2b329adabd",
    "<HOME>/Projects/slotstream/.build/release/slotstream-checks": "92b145f371eaaebaf8e433a1d3e88da211a6945843d8cfb003017dd700fe8de7",
    "<HOME>/Projects/slotstream/.build/quantization-research/inventory-3.2/inventory.json": "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
    "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-pilot-v1/composite.json": "4cdae0e9c26b9a0dd07659cd9d71dd025ed110b49161c152df09d5a7f75ac28b",
    "<HOME>/Projects/slotstream/.build/quantization-research/run-vq-context-functional-v1.py": "97fe11d49d8ee0b42e92082bb754c2b854bb49a0b0fde02453e2070baff819fb",
    "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
    "bench/quantization/greedy-v1.json": "8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c",
    "<HOME>/Projects/slotstream/.build/quantization-research/vq-extended-rotary-v1/rotary-output/angles-f32le.bin": "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a"
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
      "name": "rotary",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "quantization-rotary-check",
        "--table",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-extended-rotary-v1/rotary-output/angles-f32le.bin"
      ],
      "process_bound_gb": 2,
      "preflight_gb": 13,
      "timeout_seconds": 300
    },
    {
      "name": "context-4096",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "quantization-context-check",
        "--source-directory",
        "<HOME>/Projects/slotstream/.build/quantization-research/candidate-3.2",
        "--source-inventory",
        "<HOME>/Projects/slotstream/.build/quantization-research/inventory-3.2/inventory.json",
        "--table",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-extended-rotary-v1/rotary-output/angles-f32le.bin",
        "--limit",
        "4096",
        "--output",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-context-functional-v1/context-4096-output",
        "--dense-overlay-baseline",
        "<HOME>/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--dense-overlay-manifest",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-pilot-v1/composite.json"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 3600
    },
    {
      "name": "context-8192",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "quantization-context-check",
        "--source-directory",
        "<HOME>/Projects/slotstream/.build/quantization-research/candidate-3.2",
        "--source-inventory",
        "<HOME>/Projects/slotstream/.build/quantization-research/inventory-3.2/inventory.json",
        "--table",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-extended-rotary-v1/rotary-output/angles-f32le.bin",
        "--limit",
        "8192",
        "--output",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-context-functional-v1/context-8192-output",
        "--dense-overlay-baseline",
        "<HOME>/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--dense-overlay-manifest",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-pilot-v1/composite.json"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 3600
    },
    {
      "name": "context-32768",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "quantization-context-check",
        "--source-directory",
        "<HOME>/Projects/slotstream/.build/quantization-research/candidate-3.2",
        "--source-inventory",
        "<HOME>/Projects/slotstream/.build/quantization-research/inventory-3.2/inventory.json",
        "--table",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-extended-rotary-v1/rotary-output/angles-f32le.bin",
        "--limit",
        "32768",
        "--output",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-context-functional-v1/context-32768-output",
        "--dense-overlay-baseline",
        "<HOME>/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--dense-overlay-manifest",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-pilot-v1/composite.json"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 3600
    }
  ],
  "runs": [
    {
      "name": "catalogue",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36256284672,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    26902.\nPages active:                                1236667.\nPages inactive:                              1076304.\nPages speculative:                            189345.\nPages throttled:                                   0.\nPages wired down:                             180723.\nPages purgeable:                               11759.\n\"Translation faults\":                     2149013035.\nPages copy-on-write:                       114685024.\nPages zero filled:                        3443599889.\nPages reactivated:                         185952529.\nPages purged:                               13169003.\nFile-backed pages:                           2174247.\nAnonymous pages:                              328069.\nPages stored in compressor:                   798476.\nPages occupied by compressor:                 373137.\nDecompressions:                            110313562.\nCompressions:                              125212397.\nPageins:                                  2521209136.\nPageouts:                                     502929.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 129947.\nPages tagged resident:                         91433.\nPages tagged compressed:                       38514.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5553.\nPages tag-storage free:                         2468.\nPages tag-storage non-tag pageable:            90275.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6130944.\nTagged compressions:                          829064.\nTagged decompressions:                        694569.\n"
      },
      "peak_physical_bytes": 1446757768,
      "samples": 229,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36254105600,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    91016.\nPages active:                                1219858.\nPages inactive:                              1090018.\nPages speculative:                            129323.\nPages throttled:                                   0.\nPages wired down:                             180646.\nPages purgeable:                                7549.\n\"Translation faults\":                     2149196953.\nPages copy-on-write:                       114709573.\nPages zero filled:                        3444217734.\nPages reactivated:                         185952586.\nPages purged:                               13169294.\nFile-backed pages:                           2114210.\nAnonymous pages:                              324989.\nPages stored in compressor:                   798347.\nPages occupied by compressor:                 373064.\nDecompressions:                            110313689.\nCompressions:                              125212397.\nPageins:                                  2521209422.\nPageouts:                                     502929.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 129752.\nPages tagged resident:                         91245.\nPages tagged compressed:                       38507.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5550.\nPages tag-storage free:                         1340.\nPages tag-storage non-tag pageable:            91406.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6130880.\nTagged compressions:                          829064.\nTagged decompressions:                        694574.\n"
      },
      "seconds": 13.346650292000001
    },
    {
      "name": "rotary",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36239638528,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    90131.\nPages active:                                1220418.\nPages inactive:                              1090720.\nPages speculative:                            129067.\nPages throttled:                                   0.\nPages wired down:                             180647.\nPages purgeable:                                7549.\n\"Translation faults\":                     2149222711.\nPages copy-on-write:                       114713591.\nPages zero filled:                        3444220087.\nPages reactivated:                         185952586.\nPages purged:                               13169294.\nFile-backed pages:                           2114212.\nAnonymous pages:                              325993.\nPages stored in compressor:                   798347.\nPages occupied by compressor:                 373064.\nDecompressions:                            110313689.\nCompressions:                              125212397.\nPageins:                                  2521209425.\nPageouts:                                     502929.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 129752.\nPages tagged resident:                         91245.\nPages tagged compressed:                       38507.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5550.\nPages tag-storage free:                         1299.\nPages tag-storage non-tag pageable:            91447.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6130880.\nTagged compressions:                          829064.\nTagged decompressions:                        694574.\n"
      },
      "peak_physical_bytes": 405865432,
      "samples": 13,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36239392768,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    89846.\nPages active:                                1220634.\nPages inactive:                              1091584.\nPages speculative:                            129384.\nPages throttled:                                   0.\nPages wired down:                             179589.\nPages purgeable:                                7548.\n\"Translation faults\":                     2149250085.\nPages copy-on-write:                       114714275.\nPages zero filled:                        3444254309.\nPages reactivated:                         185952586.\nPages purged:                               13169294.\nFile-backed pages:                           2114483.\nAnonymous pages:                              327119.\nPages stored in compressor:                   798342.\nPages occupied by compressor:                 373063.\nDecompressions:                            110313694.\nCompressions:                              125212397.\nPageins:                                  2521213571.\nPageouts:                                     502929.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 129803.\nPages tagged resident:                         91296.\nPages tagged compressed:                       38507.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5550.\nPages tag-storage free:                         1277.\nPages tag-storage non-tag pageable:            91469.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6130880.\nTagged compressions:                          829064.\nTagged decompressions:                        694574.\n"
      },
      "seconds": 0.7594402910000007
    },
    {
      "name": "context-4096",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36237574144,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    89735.\nPages active:                                1220664.\nPages inactive:                              1091594.\nPages speculative:                            129337.\nPages throttled:                                   0.\nPages wired down:                             179589.\nPages purgeable:                                7548.\n\"Translation faults\":                     2149274193.\nPages copy-on-write:                       114714708.\nPages zero filled:                        3444255371.\nPages reactivated:                         185952586.\nPages purged:                               13169294.\nFile-backed pages:                           2114483.\nAnonymous pages:                              327112.\nPages stored in compressor:                   798342.\nPages occupied by compressor:                 373063.\nDecompressions:                            110313694.\nCompressions:                              125212397.\nPageins:                                  2521213574.\nPageouts:                                     502929.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 129803.\nPages tagged resident:                         91296.\nPages tagged compressed:                       38507.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5550.\nPages tag-storage free:                         1274.\nPages tag-storage non-tag pageable:            91472.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6130880.\nTagged compressions:                          829064.\nTagged decompressions:                        694574.\n"
      },
      "peak_physical_bytes": 8437568408,
      "samples": 2826,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 35684990976,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   475204.\nPages active:                                 494415.\nPages inactive:                              1439921.\nPages speculative:                            108989.\nPages throttled:                                   0.\nPages wired down:                             196039.\nPages purgeable:                                7851.\n\"Translation faults\":                     2157772422.\nPages copy-on-write:                       114933627.\nPages zero filled:                        3461322883.\nPages reactivated:                         186158829.\nPages purged:                               13181255.\nFile-backed pages:                           1694984.\nAnonymous pages:                              348341.\nPages stored in compressor:                   786120.\nPages occupied by compressor:                 369800.\nDecompressions:                            110324753.\nCompressions:                              125212540.\nPageins:                                  2534776921.\nPageouts:                                     503860.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 126368.\nPages tagged resident:                         87947.\nPages tagged compressed:                       38421.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5533.\nPages tag-storage free:                         1273.\nPages tag-storage non-tag pageable:            91490.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6117824.\nTagged compressions:                          829065.\nTagged decompressions:                        694655.\n"
      },
      "seconds": 164.70119458399998
    },
    {
      "name": "context-8192",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 35631284224,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   453570.\nPages active:                                 491521.\nPages inactive:                              1461390.\nPages speculative:                            109066.\nPages throttled:                                   0.\nPages wired down:                             198968.\nPages purgeable:                                7851.\n\"Translation faults\":                     2157796596.\nPages copy-on-write:                       114934072.\nPages zero filled:                        3461327185.\nPages reactivated:                         186158829.\nPages purged:                               13181255.\nFile-backed pages:                           1713340.\nAnonymous pages:                              348637.\nPages stored in compressor:                   786120.\nPages occupied by compressor:                 369800.\nDecompressions:                            110324753.\nCompressions:                              125212540.\nPageins:                                  2534795195.\nPageouts:                                     503860.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 126356.\nPages tagged resident:                         87935.\nPages tagged compressed:                       38421.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5533.\nPages tag-storage free:                         1278.\nPages tag-storage non-tag pageable:            91485.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6117824.\nTagged compressions:                          829065.\nTagged decompressions:                        694655.\n"
      },
      "peak_physical_bytes": 8498680704,
      "samples": 4654,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 35275685888,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   473913.\nPages active:                                 547722.\nPages inactive:                              1384403.\nPages speculative:                            120747.\nPages throttled:                                   0.\nPages wired down:                             197188.\nPages purgeable:                                3458.\n\"Translation faults\":                     2174735527.\nPages copy-on-write:                       115141857.\nPages zero filled:                        3500862213.\nPages reactivated:                         186261305.\nPages purged:                               13201768.\nFile-backed pages:                           1675686.\nAnonymous pages:                              377186.\nPages stored in compressor:                   767008.\nPages occupied by compressor:                 360422.\nDecompressions:                            110343767.\nCompressions:                              125212540.\nPageins:                                  2552277795.\nPageouts:                                     505699.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 125987.\nPages tagged resident:                         88356.\nPages tagged compressed:                       37631.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5497.\nPages tag-storage free:                         1081.\nPages tag-storage non-tag pageable:            91718.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5954048.\nTagged compressions:                          829065.\nTagged decompressions:                        695444.\n"
      },
      "seconds": 271.64836720799997
    },
    {
      "name": "context-32768",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 35276685312,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   455739.\nPages active:                                 543371.\nPages inactive:                              1405879.\nPages speculative:                            120838.\nPages throttled:                                   0.\nPages wired down:                             198382.\nPages purgeable:                                3315.\n\"Translation faults\":                     2174759858.\nPages copy-on-write:                       115142303.\nPages zero filled:                        3500869814.\nPages reactivated:                         186261305.\nPages purged:                               13201768.\nFile-backed pages:                           1694064.\nAnonymous pages:                              376024.\nPages stored in compressor:                   767002.\nPages occupied by compressor:                 360422.\nDecompressions:                            110343773.\nCompressions:                              125212540.\nPageins:                                  2552296069.\nPageouts:                                     505699.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 125963.\nPages tagged resident:                         88338.\nPages tagged compressed:                       37625.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5497.\nPages tag-storage free:                         1033.\nPages tag-storage non-tag pageable:            91766.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5953408.\nTagged compressions:                          829065.\nTagged decompressions:                        695450.\n"
      },
      "peak_physical_bytes": 9389527888,
      "samples": 18314,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 35142516736,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   528049.\nPages active:                                 562100.\nPages inactive:                              1375347.\nPages speculative:                             91319.\nPages throttled:                                   0.\nPages wired down:                             176237.\nPages purgeable:                                1099.\n\"Translation faults\":                     2249734890.\nPages copy-on-write:                       115975716.\nPages zero filled:                        3678301119.\nPages reactivated:                         186877842.\nPages purged:                               13245162.\nFile-backed pages:                           1615781.\nAnonymous pages:                              412985.\nPages stored in compressor:                   745191.\nPages occupied by compressor:                 351014.\nDecompressions:                            110369199.\nCompressions:                              125216189.\nPageins:                                  2622800493.\nPageouts:                                     510555.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 128565.\nPages tagged resident:                         93302.\nPages tagged compressed:                       35263.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5489.\nPages tag-storage free:                         1411.\nPages tag-storage non-tag pageable:            91396.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5459712.\nTagged compressions:                          829952.\nTagged decompressions:                        698698.\n"
      },
      "seconds": 1066.176365667
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
      "Sources/Slotstream/VQGenerationProbe.swift": "b4e8ca1a5b866822b027bec394965a4de8c79bb20b7f878e583f994f01b86d97",
      "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
      "Sources/Slotstream/VQModelProbe.swift": "f9dd7ab191bcd43bc911e5eb713ee76db8be4e5d7eb9a75b07d577f194561ad3",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "c3651ed472ed0eed0f84000086f7dc113093ed7e1e474585c2654399e8d9e30f",
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
      "Sources/slotstream-cli/QuantizationCommands.swift": "ef9a6d3fdef85ca130bbec054aab9ec55e341e92cfd9c114af485d305b49813f",
      "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
      "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
      "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
      "Sources/slotstream-cli/main.swift": "7daa19223c6d295fbca43a109048956b58fa7871685250155ad6048c59034a41",
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

### vq-context-build-v1/receipt.json

Original bytes: 3039. SHA-256: `eb037271c7052edb1fed11b4c7cc274ef7e7d0ac2ef4a8b25269930787cf4826`.

Normalized bytes: 3039. SHA-256: `eb037271c7052edb1fed11b4c7cc274ef7e7d0ac2ef4a8b25269930787cf4826`.

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
      "peak_tree_bytes": 1678724240,
      "samples": 605,
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
      "peak_tree_bytes": 1063783208,
      "samples": 88,
      "exit_code": 0
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36567515136,
    "swapins": 52,
    "swapouts": 2908,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   125847.\nPages active:                                1181031.\nPages inactive:                              1033237.\nPages speculative:                            182948.\nPages throttled:                                   0.\nPages wired down:                             180589.\nPages purgeable:                               14254.\n\"Translation faults\":                     2145370729.\nPages copy-on-write:                       114142466.\nPages zero filled:                        3442009376.\nPages reactivated:                         185952120.\nPages purged:                               13167676.\nFile-backed pages:                           2091803.\nAnonymous pages:                              305413.\nPages stored in compressor:                   814194.\nPages occupied by compressor:                 378927.\nDecompressions:                            110301110.\nCompressions:                              125212397.\nPageins:                                  2521148954.\nPageouts:                                     502929.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 129180.\nPages tagged resident:                         90238.\nPages tagged compressed:                       38942.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5513.\nPages tag-storage free:                         3052.\nPages tag-storage non-tag pageable:            89731.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6198592.\nTagged compressions:                          829064.\nTagged decompressions:                        694156.\n"
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

### vq-context-build-v1/inputs-before.json

Original bytes: 39454. SHA-256: `1f4b2d18475ca489f063b734e4d4591baf7740dc12fd7eb1790bd65a0dca7570`.

Normalized bytes: 39454. SHA-256: `1f4b2d18475ca489f063b734e4d4591baf7740dc12fd7eb1790bd65a0dca7570`.

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
    "Sources/Slotstream/VQGenerationProbe.swift": "b4e8ca1a5b866822b027bec394965a4de8c79bb20b7f878e583f994f01b86d97",
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "f9dd7ab191bcd43bc911e5eb713ee76db8be4e5d7eb9a75b07d577f194561ad3",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "c3651ed472ed0eed0f84000086f7dc113093ed7e1e474585c2654399e8d9e30f",
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
    "Sources/slotstream-cli/QuantizationCommands.swift": "ef9a6d3fdef85ca130bbec054aab9ec55e341e92cfd9c114af485d305b49813f",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "7daa19223c6d295fbca43a109048956b58fa7871685250155ad6048c59034a41",
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

### vq-context-build-v1/inputs-after.json

Original bytes: 39454. SHA-256: `1f4b2d18475ca489f063b734e4d4591baf7740dc12fd7eb1790bd65a0dca7570`.

Normalized bytes: 39454. SHA-256: `1f4b2d18475ca489f063b734e4d4591baf7740dc12fd7eb1790bd65a0dca7570`.

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
    "Sources/Slotstream/VQGenerationProbe.swift": "b4e8ca1a5b866822b027bec394965a4de8c79bb20b7f878e583f994f01b86d97",
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "f9dd7ab191bcd43bc911e5eb713ee76db8be4e5d7eb9a75b07d577f194561ad3",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "c3651ed472ed0eed0f84000086f7dc113093ed7e1e474585c2654399e8d9e30f",
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
    "Sources/slotstream-cli/QuantizationCommands.swift": "ef9a6d3fdef85ca130bbec054aab9ec55e341e92cfd9c114af485d305b49813f",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "7daa19223c6d295fbca43a109048956b58fa7871685250155ad6048c59034a41",
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

### vq-context-build-v1/0.log

Original bytes: 11267. SHA-256: `5eb98e0c31c134ae7b0d8a221d2183527ecdad0f8f7d4825034fbced5f8a3936`.

Normalized bytes: 11148. SHA-256: `ca72e7da41b6f54ad299172a3a068804684d20d52458b876faff57cd398f3e11`.

````text
[0/1] Planning build
Building for production...
[0/6] Write swift-version--1AB21518FC5DEDBE.txt
[1/6] Write sources
[5/7] Compiling Slotstream AdaptiveSpeculation.swift
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
[6/8] Compiling SlotstreamDiagnostics CheckReport.swift
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
[7/9] Compiling slotstream_cli CheckRendering.swift
[7/9] Write Objects.LinkFileList
[8/9] Linking slotstream
Build of product 'slotstream' complete! (165.25s)
````

### vq-context-build-v1/1.log

Original bytes: 252. SHA-256: `5384cd61c88d5d2235aff260a023aa1569b312b3d9196bf7009b57fb205c3684`.

Normalized bytes: 252. SHA-256: `5384cd61c88d5d2235aff260a023aa1569b312b3d9196bf7009b57fb205c3684`.

````text
Building for production...
[0/3] Write swift-version--1AB21518FC5DEDBE.txt
[2/4] Compiling SlotstreamTestKit AnthropicChecks.swift
[2/4] Write Objects.LinkFileList
[3/4] Linking slotstream-checks
Build of product 'slotstream-checks' complete! (23.92s)
````

### run-vq-extended-rotary-v1.py

Original bytes: 4062. SHA-256: `f9780e08fcd0a80f54182d0254df22473bffda053f758595251cdec783ef586a`.

Normalized bytes: 4062. SHA-256: `f9780e08fcd0a80f54182d0254df22473bffda053f758595251cdec783ef586a`.

````text
from pathlib import Path
from datetime import datetime,timezone
import ctypes,ctypes.util,hashlib,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
r=Path('.build/quantization-research').absolute();out=r/'vq-extended-rotary-v1'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
command=[str(Path('.venv/bin/python').absolute()),'Tools/vq_rotary_extended_reference.py','--architecture',str(r/'qwen4_exp-pr1788.py'),'--runtime',str(r/'candidate-3.2/model.py'),'--out',str(out/'rotary-output')]
cells=[('rotary',command,2,13,300)]
out.mkdir()
record={'complete':False,'started_at':datetime.now(timezone.utc).isoformat(),'scope':'Functional acceptance only; no throughput qualification, hardware simulation or model activation.',
 'maximum_concurrent_model_processes':1,'minimum_real_headroom_gb':3,'maximum_total_seconds':10800,
 'pins':{str(p):sha(p) for p in [Path(__file__),Path('Tools/vq_rotary_extended_reference.py'),Path('Tools/context_qualification.py'),Path('Tools/vq_model_reference.py'),Path('Tools/vq_rope_reference.py'),r/'qwen4_exp-pr1788.py',r/'candidate-3.2/model.py',Path('.venv/bin/python').absolute()]},
 'protocol':[{'name':n,'command':c,'process_bound_gb':p,'preflight_gb':f,'timeout_seconds':t} for n,c,p,f,t in cells], 'runs':[]}
lib=ctypes.CDLL(ctypes.util.find_library('proc'));began=time.monotonic();child=None
def save():(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG','VQ_','VQLAB_'))}
# Research requires no ambient override; production-only pressure flag is not inherited.
record['explicit_environment']={};record['resource_budget']=json.loads((r/'vq-extended-rotary-resource-budget-v1.json').read_text());save()
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
  table=out/'rotary-output';value=json.loads((table/'table.json').read_text())
  assert value['rows']==262144 and value['bytes']==67108864
  assert value['table_sha256']==sha(table/'angles-f32le.bin')
  row['passed']=True;save();print('PASS',name,row['peak_physical_bytes'],flush=True)
 record['complete']=True
except BaseException as e:
 record['failure']=type(e).__name__+': '+str(e)
 if child is not None and child.poll() is None:terminate_child_tree(child)
 save();raise
finally:save()
````

### vq-extended-rotary-resource-budget-v1.json

Original bytes: 819. SHA-256: `86b320fc1884ce8e3ae11311ac4197177e7735c34d372661e75ca4b108370b55`.

Normalized bytes: 819. SHA-256: `86b320fc1884ce8e3ae11311ac4197177e7735c34d372661e75ca4b108370b55`.

````text
{
  "scope": "Next extended-rotary component only, scheduled after the current model campaign completes.",
  "maximum_concurrent_model_processes": 1,
  "preflight_gb": 13,
  "process_bound_gb": 2,
  "minimum_real_headroom_gb": 3,
  "maximum_seconds": 300,
  "new_table_bytes": 67108864,
  "prior_recorded_raw_f32_bytes": 1903124480,
  "raw_f32_after_bytes": 1970233344,
  "raw_f32_budget_bytes": 2000000000,
  "staging_budget_bytes": 350000000000,
  "staging_allocated_bytes": 304680742912,
  "filesystem_free_bytes": 434432188416,
  "paid_compute_usd": 0,
  "producer_sha256": "bdd9c469d58e8b1a41c711672f91a5aff8c61a1d4add67166c3eb4215dad9c19",
  "notes": "No model or context is admitted by coefficient generation. Prior finite prefix must remain byte-identical. Current native process is allowed to finish first."
}
````

### vq-extended-rotary-v1/receipt.json

Original bytes: 7175. SHA-256: `7e685c8558b632faf9ab40637b3540437e7646fd552895c5b57a00e3bf312305`.

Normalized bytes: 7119. SHA-256: `252982f3809f1aa683ac2e75db38a08ba465b5daacd09efa469bf4182f75ae37`.

````text
{
  "complete": true,
  "started_at": "2026-10-03T20:20:24.043697+00:00",
  "scope": "Functional acceptance only; no throughput qualification, hardware simulation or model activation.",
  "maximum_concurrent_model_processes": 1,
  "minimum_real_headroom_gb": 3,
  "maximum_total_seconds": 10800,
  "pins": {
    "<HOME>/Projects/slotstream/.build/quantization-research/run-vq-extended-rotary-v1.py": "f9780e08fcd0a80f54182d0254df22473bffda053f758595251cdec783ef586a",
    "Tools/vq_rotary_extended_reference.py": "bdd9c469d58e8b1a41c711672f91a5aff8c61a1d4add67166c3eb4215dad9c19",
    "Tools/context_qualification.py": "ee929fe7433fe6287af2b5591dafc960315f2ed5d31902882cfd7d0c9a9f15e8",
    "Tools/vq_model_reference.py": "315dfb1b2ae098f35b68b074a29c1dc0e0e7986c806012cdc16cea00794ac506",
    "Tools/vq_rope_reference.py": "749964ffbb5f4304b8216e31411d175dfe0aee02d628c9a87f57693a5a49f363",
    "<HOME>/Projects/slotstream/.build/quantization-research/qwen4_exp-pr1788.py": "d6470a2131a64ff37024dfffd2b5bc8c3f4db625f0f3b1ceec7fe346852c1a87",
    "<HOME>/Projects/slotstream/.build/quantization-research/candidate-3.2/model.py": "1685ec90feb24e421c379ae4e3594f659478905d2c1393617990d84d3f514ee8",
    "<HOME>/Projects/slotstream/.venv/bin/python": "e878533ce71a6e91b0fae5e8bbe8baebbb6194dad84fead52e9b42f0620ad011"
  },
  "protocol": [
    {
      "name": "rotary",
      "command": [
        "<HOME>/Projects/slotstream/.venv/bin/python",
        "Tools/vq_rotary_extended_reference.py",
        "--architecture",
        "<HOME>/Projects/slotstream/.build/quantization-research/qwen4_exp-pr1788.py",
        "--runtime",
        "<HOME>/Projects/slotstream/.build/quantization-research/candidate-3.2/model.py",
        "--out",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-extended-rotary-v1/rotary-output"
      ],
      "process_bound_gb": 2,
      "preflight_gb": 13,
      "timeout_seconds": 300
    }
  ],
  "runs": [
    {
      "name": "rotary",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 38037159936,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   383125.\nPages active:                                1008209.\nPages inactive:                               952704.\nPages speculative:                            123358.\nPages throttled:                                   0.\nPages wired down:                             178922.\nPages purgeable:                                2311.\n\"Translation faults\":                     2143792978.\nPages copy-on-write:                       113933275.\nPages zero filled:                        3441334093.\nPages reactivated:                         185949357.\nPages purged:                               13165257.\nFile-backed pages:                           1936168.\nAnonymous pages:                              148103.\nPages stored in compressor:                   927968.\nPages occupied by compressor:                 437549.\nDecompressions:                            110214600.\nCompressions:                              125212397.\nPageins:                                  2521105894.\nPageouts:                                     502929.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 124529.\nPages tagged resident:                         78994.\nPages tagged compressed:                       45535.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5192.\nPages tag-storage free:                         1802.\nPages tag-storage non-tag pageable:            91302.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7450176.\nTagged compressions:                          829064.\nTagged decompressions:                        687727.\n"
      },
      "peak_physical_bytes": 657572872,
      "samples": 26,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 37970280448,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   354834.\nPages active:                                1013158.\nPages inactive:                               969913.\nPages speculative:                            129505.\nPages throttled:                                   0.\nPages wired down:                             179243.\nPages purgeable:                                2319.\n\"Translation faults\":                     2143845369.\nPages copy-on-write:                       113935815.\nPages zero filled:                        3441381388.\nPages reactivated:                         185949358.\nPages purged:                               13165257.\nFile-backed pages:                           1960369.\nAnonymous pages:                              152207.\nPages stored in compressor:                   927451.\nPages occupied by compressor:                 437452.\nDecompressions:                            110215113.\nCompressions:                              125212397.\nPageins:                                  2521120112.\nPageouts:                                     502929.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 125737.\nPages tagged resident:                         80231.\nPages tagged compressed:                       45506.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5214.\nPages tag-storage free:                         1768.\nPages tag-storage non-tag pageable:            91314.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7443456.\nTagged compressions:                          829064.\nTagged decompressions:                        687756.\n"
      },
      "seconds": 1.5016815000000001
    }
  ],
  "explicit_environment": {},
  "resource_budget": {
    "scope": "Next extended-rotary component only, scheduled after the current model campaign completes.",
    "maximum_concurrent_model_processes": 1,
    "preflight_gb": 13,
    "process_bound_gb": 2,
    "minimum_real_headroom_gb": 3,
    "maximum_seconds": 300,
    "new_table_bytes": 67108864,
    "prior_recorded_raw_f32_bytes": 1903124480,
    "raw_f32_after_bytes": 1970233344,
    "raw_f32_budget_bytes": 2000000000,
    "staging_budget_bytes": 350000000000,
    "staging_allocated_bytes": 304680742912,
    "filesystem_free_bytes": 434432188416,
    "paid_compute_usd": 0,
    "producer_sha256": "bdd9c469d58e8b1a41c711672f91a5aff8c61a1d4add67166c3eb4215dad9c19",
    "notes": "No model or context is admitted by coefficient generation. Prior finite prefix must remain byte-identical. Current native process is allowed to finish first."
  }
}
````

### vq-extended-rotary-v1/rotary/stdout.txt

Original bytes: 149. SHA-256: `50ed8f222e519054c8be970d40a4116bca063f76a5788c8c161537a23fe931ae`.

Normalized bytes: 149. SHA-256: `50ed8f222e519054c8be970d40a4116bca063f76a5788c8c161537a23fe931ae`.

````text
{"rows": 262144, "bytes": 67108864, "table_sha256": "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a", "qualification": "unproven"}
````

### vq-extended-rotary-v1/rotary/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### vq-extended-rotary-v1/rotary-output/table.json

Original bytes: 74866. SHA-256: `17133fd520e69cb557f0c5422ac3440a3e41908ecd932b157147edd3068041e6`.

Normalized bytes: 74866. SHA-256: `17133fd520e69cb557f0c5422ac3440a3e41908ecd932b157147edd3068041e6`.

````text
{
  "schema": 1,
  "producer_sha256": "bdd9c469d58e8b1a41c711672f91a5aff8c61a1d4add67166c3eb4215dad9c19",
  "architecture_sha256": "d6470a2131a64ff37024dfffd2b5bc8c3f4db625f0f3b1ceec7fe346852c1a87",
  "runtime_sha256": "1685ec90feb24e421c379ae4e3594f659478905d2c1393617990d84d3f514ee8",
  "instrument": {
    "scripts": {
      "vq_model_reference.py": "315dfb1b2ae098f35b68b074a29c1dc0e0e7986c806012cdc16cea00794ac506",
      "vq_execution_profile.py": "0e298b9a73df41d55e1191ffdcbf5cc778112e7dae309e6a3b647080c1f4ce91",
      "vq_ple_stream.py": "8e784edda032ac88dd8771e3e6337f8a59e78e14c5b8845c6e7808642f5ce33e",
      "vq_fused_reference.py": "0b7c71fbead91611460a5466f3082ca576301e95766dcee69bb82476feb85749",
      "vq_kernel_sources.py": "30929f4be32dd352a957a81deb22f7120dedce11ecd78fc3cdff4bb714ff4b0e",
      "quantization_inventory.py": "af0220f7dde0b783fd5800ed2f0ee5545ed30bd855cf6d34d6a79820c9ef47cb",
      "quantization_quality.py": "99c99d16ee7bbb8576156fe5e8971a74ce243642bff240f855613c3ec0d135f8",
      "context_qualification.py": "ee929fe7433fe6287af2b5591dafc960315f2ed5d31902882cfd7d0c9a9f15e8",
      "prefill_bench.py": "000868d66f82cd1eba5973c0fa9b4259831a6bdbc5bcf7d4c4f858d86c71d472",
      "memory_gate.py": "fed53adbbc761457f94e11ded179915d538b515d448dc029ff3f0604f7faf6fc"
    },
    "packages": {
      "mlx": {
        "version": "0.32.2",
        "files": {
          "mlx/__array_api_info.py": "67bd1bf52f853f2ea96fd6d4f0c64435899f36292290e3d528327a799f863912",
          "mlx/__main__.py": "957f513bd1c40f9b8d6cf51d676aa66618bf59b40fa1278ba339a87799c318de",
          "mlx/_distributed_utils/common.py": "407793d67635491c16bd37ce2928a0ba8ff11c0478110878adae79a3fd406e29",
          "mlx/_distributed_utils/config.py": "82e17f9c0322b2875ee975196399c7c4ef662694ea7bff39af0484cbef3023a2",
          "mlx/_distributed_utils/launch.py": "6a85d23ed3e505cb1d410d18139ae61599f6805f6ee2b98a1030a28d8a5a7f66",
          "mlx/_reprlib_fix.py": "f748ea4f10995bf30ed6ba76ed3539f23c18cdf541031e1c0968dd60dc98f723",
          "mlx/core.cpython-312-darwin.so": "5ff77c777a73864d2af86defd61b141467746636f0047b76b66a7ae645fa12fb",
          "mlx/extension.py": "ccab3caf8660bf6b43ec949f147c64bac95e914ab8cab6a8afac090d69aebd27",
          "mlx/nn/__init__.py": "6d578784bfe696a3ba6eca2a559c87e9fd1ec5eaa5e6d4e199e6e959ebe0a492",
          "mlx/nn/init.py": "c6ef640bf114039d5c6c5f2d0d9e53675c171ba1456beba20278c9cc12922831",
          "mlx/nn/layers/__init__.py": "1eb646e38a87579eb63201100c3f9b038e2466d7fbad509c2f32841bc1f2a007",
          "mlx/nn/layers/activations.py": "153660ac19d4fe93d6ca15f67ad8527ed03b0e860e36192f3815e1d3daf73ed1",
          "mlx/nn/layers/base.py": "ec749e1d50fd1a5e57e0aedc8e6eb13fc697e630f59333a0e24aee62a8dc7f0f",
          "mlx/nn/layers/containers.py": "29ef203c13d9bebb6b8cad6aadb44d1ad495e2bbc19184ca5415b6a505eb36f6",
          "mlx/nn/layers/convolution.py": "d79473462d907735740352bbecd74b961049b55831be4d4369966a68ed325cee",
          "mlx/nn/layers/convolution_transpose.py": "a47cbf2bffebce18a9858d7850a313504fb02fe452591ff5ae4f8e3d2d464f7b",
          "mlx/nn/layers/distributed.py": "67e4048ce29b4caf8df9c5ea8ee758e05ac682ee1582e2004c7d9557f6c89969",
          "mlx/nn/layers/dropout.py": "a79c13d31c61163587d83c58f4e4cb81bf24f32923994abd3d98d9dfdd59148f",
          "mlx/nn/layers/embedding.py": "f77b039903294c6e880c503a953ea86b43aac36661b724cc9c38e3ed1969e3a8",
          "mlx/nn/layers/linear.py": "07ce0d9ac6a1499a0d0f01971bf195305424b6d91a20f77488f7d8116c0a2e23",
          "mlx/nn/layers/normalization.py": "0873ca425d5de6dd462d336ff45a2563f945abeebef3f5146bfc7c83af54be83",
          "mlx/nn/layers/pooling.py": "01e25b975ea6c8c962a8d13f748596a3390a94e9a6d1d5e9d973347697d1509c",
          "mlx/nn/layers/positional_encoding.py": "613835daf6977ec6e0c34159349d68ddcc234958e82d18adb159d7a8bf9d0c77",
          "mlx/nn/layers/quantized.py": "1797a3571484ad3134224354b7f130c0931f495691aa8e54eb55329d674bb00b",
          "mlx/nn/layers/recurrent.py": "553738db5ffede77d4d97a6b431ac82475b99c34902a9a32e05b940a95f34ae7",
          "mlx/nn/layers/transformer.py": "4d1b35213d4895e86a3f124d2f0c2d99b64ce7f3c208b884cc13edff0997e77b",
          "mlx/nn/layers/upsample.py": "8ea1fadaf6101899d30e18b3f05b0f8618048c835c42d972cb43a334bc57b1dc",
          "mlx/nn/losses.py": "10b5439bf1a9ebbb6e5f0dc115efc01a17bf1edac0e746ba564a09ada15be849",
          "mlx/nn/utils.py": "55aab8b6d6cad221f7f6f4c400b65e9f82cb84fe5cb17b82fff0219718dd6247",
          "mlx/optimizers/__init__.py": "289a7bcf845366d2f823be75cb25cd8745ad9d8b2692ba1fd7b72a084f71dd42",
          "mlx/optimizers/optimizers.py": "57501691b4cf5e16cc4edd738f2dd358305e6c54bcd4bb93c7d10144d09e2c3a",
          "mlx/optimizers/schedulers.py": "4276bf0907e24701bc22464a73620fd30d27bd63eb6c9ccb3168a621c9ecd9ae",
          "mlx/utils.py": "c33a787a429a2736eb10783b087931cdfd0bab9edcf0ad57d48bcbc33b9e49a2"
        }
      },
      "mlx-metal": {
        "version": "0.32.2",
        "files": {
          "mlx/include/metal_cpp/SingleHeader/MakeSingleHeader.py": "5b87e3f4aebe564025f5e4120258a797ea77fdc92c0b5a2d7bf84e835769ad5a",
          "mlx/lib/libjaccl.dylib": "9cfd72679ff35c593a1d46fd30d995cc4a131eed15733617efb1118001e74084",
          "mlx/lib/libmlx.dylib": "d24c7a9b9d55a76bfd3bbcd1d042251a185cbadcb6340c3244a6ffa3dcb7c7e8",
          "mlx/lib/mlx.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed"
        }
      },
      "mlx-lm": {
        "version": "0.31.3",
        "files": {
          "mlx_lm/__init__.py": "f9ffa88772d26e537a98aa39ab16488a7a0d13cc1fac5d665376132c94b49608",
          "mlx_lm/__main__.py": "cc0a2e7be2522fa62570799088414b6da673369cfc6ebc75d1fb387f29a24834",
          "mlx_lm/_version.py": "f0da9bc5c5c1bf21d576f7aa67b4eda887f1c7f0666746187b493e6831c4af6c",
          "mlx_lm/benchmark.py": "31ee1bfff33bc7b87adc94f746eab8f3a6c537a286a7eacf66748875eabd1553",
          "mlx_lm/cache_prompt.py": "b2f561f47e177367499be07aa92214a70d30220a84a126a5460ab51ebab25cd8",
          "mlx_lm/chat.py": "f3d9ef0cc6dd5c2ce308f7f1b1617a4ce616bd65849de27a6792cdc25a465ff7",
          "mlx_lm/chat_templates/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "mlx_lm/chat_templates/deepseek_v32.py": "4df892725d65d936044d70d365e9a78eb0e10f201059120c7b0b965e66f669b7",
          "mlx_lm/cli.py": "88212797d36748052adc7a7104fe51d0b45ed322c78075e6bc1b10064ee37ac5",
          "mlx_lm/convert.py": "dc60df164c2d51ee2f05f5f9f3324bc3a44a59dd2ccddb75dde680e854ce5e9a",
          "mlx_lm/evaluate.py": "15b2ad60db63f49c4f4300dad4cf5658652fe57cff94c94606ffa9d669a4f5c1",
          "mlx_lm/fuse.py": "610321cd10016ee76fcc1617bd25d753b9a66a8980d0e296ee9d18f5f901ba39",
          "mlx_lm/generate.py": "270778ad53eaca55a8533d82e6752660fe5d2605c4aa0879b48a50a91f69345f",
          "mlx_lm/gguf.py": "56b35b6f5942ff184ce9e756c94cb0e6a1d85e094f5f52ed6232d8c48cb2247b",
          "mlx_lm/lora.py": "3f188fc6aef80efcb9938678af0548588122ed25845053cc555aece0ad2da5e7",
          "mlx_lm/manage.py": "fcf74fca1b5ee12827c1104a28dfdf11204e1672ab2fdc10ed7cce51a3fdbed5",
          "mlx_lm/models/Klear.py": "ace3e8656ec00d25b89f1fbce69e7cdd4fce4629fbae01dfe7bb945c13b611c9",
          "mlx_lm/models/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "mlx_lm/models/activations.py": "dbca5bae41ba0a8380a53903c3e98da37c1e15b46383bc2edb5806ba94fafe72",
          "mlx_lm/models/afm7.py": "04aa5558f761b7ab29798c64286e1cdd6f6580f88301cbf920c0a6b2fe1fd9f5",
          "mlx_lm/models/afmoe.py": "614473752ff0f341cbb5ebef90bcd3b8845f61125e860e4b081c6ae4454edc82",
          "mlx_lm/models/apertus.py": "b2e01af3c9a413fc3eecd44b417858cf9f7f19ab7258559df01aed1983ac126f",
          "mlx_lm/models/baichuan_m1.py": "720fbfbd794f8ae4196a76d58acbaa3174e91ab52ac830962a709dfa458eebeb",
          "mlx_lm/models/bailing_moe.py": "7ec47d3be0c4dea8c808b08dbf0cbfeaf6e407c156f453f281e702e43b7b359d",
          "mlx_lm/models/bailing_moe_linear.py": "ed69bdb69655f3160c21611d498b3a76f3c5da63aac16cfc2519d342f74887e7",
          "mlx_lm/models/base.py": "61330e1c065739cd712bfeb09d673f33797cde7e613e95bf6d9ebbee9006f373",
          "mlx_lm/models/bitlinear_layers.py": "fe64bfff02b300d965a560e33792dfd93ba4f86a121d18679f5f8550d86cf5d5",
          "mlx_lm/models/bitnet.py": "7326a010bdbb749b07d21b1ed102ea8481187ad540b3f3fcf28673f2dfcdb7f8",
          "mlx_lm/models/cache.py": "819ed95dcbf755652363cfdb15a639890447abb534a06dcefd52c7fff5055750",
          "mlx_lm/models/cohere.py": "34f3a144e830a1b177d5883e2443bcc8f517c8ef5f3ada512f42fa3e64393b5a",
          "mlx_lm/models/cohere2.py": "8d3f343f1bb7b8ab0056c30154fe35bf3545151693c1aeff409f6903f4efe610",
          "mlx_lm/models/dbrx.py": "b6f61442ae508f555f19c96116b0d5798fe0366b2c2c1f9fcb66444d25e69a70",
          "mlx_lm/models/deepseek.py": "4345ee533236ca9b92c655e4e1b77f969380cefbeafdafcfa2279c58e2101b66",
          "mlx_lm/models/deepseek_v2.py": "08b944cbc3398b4b4c8798ad33804fa8dcff630b2858eda73d071295b839e095",
          "mlx_lm/models/deepseek_v3.py": "7d1c6cad01368c3f5e26d5907fb2910145cbeaf867991f91a136d16572b8e98d",
          "mlx_lm/models/deepseek_v32.py": "a829f0a505d9fc56c54fd95c93bcd08e011ef2fd75b11fb00941abc2f34183a9",
          "mlx_lm/models/dots1.py": "682ef8f43b4b1d5c4c196263b311b7cdd68b2a209fc0202bcc442cd0c8050ef7",
          "mlx_lm/models/ernie4_5.py": "34df71212f9ec0978bf685a90cb6c63107f1a1ec958f4acdac0d3867c2c34f91",
          "mlx_lm/models/ernie4_5_moe.py": "4bab223f3d8f8b09bb15cd4aaf0bcffd07ca3556eb4bb771f268377ad83b81db",
          "mlx_lm/models/exaone.py": "d4902d790ed42c6edd1fe7494e9800869470ee95bc93024536f688fcc88a2cb1",
          "mlx_lm/models/exaone4.py": "fb7f62b3f2c6e5519e5d90e40506d81c030042bdf2e90d040ecd3b9626f34914",
          "mlx_lm/models/exaone_moe.py": "0df4f9b87ecf8ceb4fb202de5c285eba50a1a9c6363ce13cc9c893d6b298513e",
          "mlx_lm/models/falcon_h1.py": "b888a9795a36d4b92868f7a2bb1e8850f877c45bb81e65fcb0e6e271a640fd96",
          "mlx_lm/models/gated_delta.py": "79c8376a51c694b03e54d2f996ced6ea6c8c42868b8571529f97334db165a3e1",
          "mlx_lm/models/gemma.py": "8bd836c39701aaaaf615e7089e46965a41346cb415a8f32b02bcf5ce2496bf3c",
          "mlx_lm/models/gemma2.py": "64b0935b06fe2c4d5d4ed23a9cf62deb6218c55a88b9403a657afe9e2be8f251",
          "mlx_lm/models/gemma3.py": "69d321648629b0f22e8cd9f3c3b597af6f34b5405c761ce089e825deebb2939a",
          "mlx_lm/models/gemma3_text.py": "884bb398288beda5e90caf3de60a15f5d17b8e383d28c85cca07de1e0aeafa38",
          "mlx_lm/models/gemma3n.py": "5278b3075e5d07db69bb5c0db52fe4e2ce9d345524aa97496040803db6d8b0d6",
          "mlx_lm/models/gemma4.py": "4671e4a63cb9849582abac566599a0a85370a46d410f4ad69d81a88788d00fd8",
          "mlx_lm/models/gemma4_text.py": "77f46bc3f162a0b9513157dade4be2c381d4df3295262c69034a53d46111370f",
          "mlx_lm/models/glm.py": "a122242c74beabed8ab1ed7cfc60f8b7891f71d69e1ecd9a25206f4493751fa2",
          "mlx_lm/models/glm4.py": "d0971768b6cd3a3a9b7d54b0244ef2fa92c1d511124fe8547e6f51f3ddd96cb2",
          "mlx_lm/models/glm4_moe.py": "f0d9a42dff8413730d9fbce375e158c791210339a383935da8afd58758aa4c05",
          "mlx_lm/models/glm4_moe_lite.py": "6d4011ff91837c5f29bf4207bad6665d981d8b0fcbd159289b6cd2b96fa72643",
          "mlx_lm/models/glm_moe_dsa.py": "bfe16d1ef63f919b47c96a4f7cb2359afb46127769c75f62e65339510c0c936e",
          "mlx_lm/models/gpt2.py": "ca20a95bf371428b78c5f8a959a41b8fe85acfbf2e5424acbc88590a9f2053ec",
          "mlx_lm/models/gpt_bigcode.py": "08d2e98fe4c4b43340d40f6496cae23fee9e295ce293b7ac746c9432951f3fa9",
          "mlx_lm/models/gpt_neox.py": "e23b59ef46431c3e8244c12a774c35633704f5495687dda017b156aa039043cd",
          "mlx_lm/models/gpt_oss.py": "a71c0402bcdf9495291ff1efdba02dca2dfc9c4c821d81df460ba4bd6cca3443",
          "mlx_lm/models/granite.py": "a12410cea370422007b54115bb0000442d5a60b0697aa55b1979ec30a80d97ba",
          "mlx_lm/models/granitemoe.py": "26186a3e66429f38900164764a9da8f0d9a32e7ca30941607bf65b69d36415af",
          "mlx_lm/models/granitemoehybrid.py": "a9d4214a84d2ecb998d3ea00c6ff6de82c2b5d0a08680149739405f4466e0a19",
          "mlx_lm/models/helium.py": "a8607988de77c5f51e6a02e6532ea28b600529a0be804003c2cc605b9fefc332",
          "mlx_lm/models/hunyuan.py": "dbd7ee128dd4ce28d40d301ee4744f303e47c0443ab17885a1b08bf3745b8197",
          "mlx_lm/models/hunyuan_v1_dense.py": "8303eb6467e43263e557199c13df69986c24e4917d91b0acab18a5076e6327db",
          "mlx_lm/models/internlm2.py": "070a55600e9503e04750b6204b09e2823d59c723787a22f5eabf8416c99dfe6f",
          "mlx_lm/models/internlm3.py": "fcc962ce1b3d4b93c08e9b728ce4e4c26679b60492ca6ec388001b36d00e3b19",
          "mlx_lm/models/iquestloopcoder.py": "c2bba6a7a7f224aa2acf5d812a44484ec10fcb6bffcaf0ef1929cda846d1cd9d",
          "mlx_lm/models/jamba.py": "f0d5e5551127179b79f10dff764aeaa70ab3c1fc06e71487a25ad414561f28bd",
          "mlx_lm/models/kimi_k25.py": "5388e4355775549b2bacb47ac57c2e4e523673ec789fe524859e26790421d305",
          "mlx_lm/models/kimi_linear.py": "37bed1dc098c455ebb6e0eceedf9374ef6314a78b7f25b0b2c87828fc3fb2c8d",
          "mlx_lm/models/kimi_vl.py": "2d4bdfbb6303828b42264039038f9500a9aae1f7f6a040d1b8c48891f79cc4e0",
          "mlx_lm/models/lfm2-vl.py": "1ec76d720051d56b186bf1703ade5497eb29796fcd3f3682a68d4968556a7ec8",
          "mlx_lm/models/lfm2.py": "5ce16a8231800fdbb842ea7e603754572d5608cda0f3ef8c61c862840d18806c",
          "mlx_lm/models/lfm2_moe.py": "4cb248cd8d1c8ff279efb77b6fa3ef93dce96771850933f41b0f3669a6377395",
          "mlx_lm/models/lille-130m.py": "971390eaf6d5d4761460e1b5852ec3351da27248aa4b18442cbae6792c1accca",
          "mlx_lm/models/llama.py": "8b46ac7f11c7134c1d83f12ec6e05b3d64a30f18aa7468798437b2e413f80cdb",
          "mlx_lm/models/llama4.py": "6386b73f86adf88de756c1198623235119d9c10af32c6ed9a676f341ad55654c",
          "mlx_lm/models/llama4_text.py": "f6ce3838b18bb6d281de84694639f483209019b1da4bdeb82848909d6af84ad8",
          "mlx_lm/models/longcat_flash.py": "9d801bccfc1081fd34d32b5467b1cf4eb0356ea3563d4e7b87a5530f1ac54e0f",
          "mlx_lm/models/longcat_flash_ngram.py": "9fbda1eb9787f4f03d99bb788e6f171922ff6da1a469a060fcc68286844277e8",
          "mlx_lm/models/mamba.py": "3de6e1dafb147bfc346205df07a298f1623f843ff0e06835cb21d38360ec7da4",
          "mlx_lm/models/mamba2.py": "36d6841678e32dbd132cb1ea94d068f88779287350c58d4b2de34b1317af0fdf",
          "mlx_lm/models/mimo.py": "1ec3ceda0da736880f7879fa1b9bc3a82982d48d6502d807bc3a1bd59b67d6e7",
          "mlx_lm/models/mimo_v2_flash.py": "1c0cff7c66fe6cf90b569f787b1f8f25fa8fce582b74de77f13b854c246407bd",
          "mlx_lm/models/minicpm.py": "444c3c1606cf0f590e661505cdbad4e56a81c769275b16c67ba9471333db9c13",
          "mlx_lm/models/minicpm3.py": "b63fa19d1219ab877e4ab104082f8dc2fc7117ced45abf036c90b19121f34306",
          "mlx_lm/models/minimax.py": "23596bc95ea66c88a79f3e72d220cdd156df7a549f0ed29f917deab8941ae145",
          "mlx_lm/models/ministral3.py": "658de236349540794672fa5526049222d0877edffc43783a9208f483f4fa5dca",
          "mlx_lm/models/mistral3.py": "38b9603ea56130614593a30eabd87d32816b7aa05443af817c1439174786551d",
          "mlx_lm/models/mixtral.py": "a7d15990aa42b81b659c8679089b6f1571225466825c71d9350eace1964c3b5c",
          "mlx_lm/models/mla.py": "22877b336255e58d949d982b6ac4730bd0ca1a1a6f40479f736570b3c9f35057",
          "mlx_lm/models/nanochat.py": "989d414c4c8c3f1ae0d2d9b06c06d45b7dc5fc0bd8b796f585e318586b27dfe4",
          "mlx_lm/models/nemotron-nas.py": "05b40ddd35fd5b829172b2e40ce9674a787623e5bbb26c55d45ed31f5734a855",
          "mlx_lm/models/nemotron.py": "1ca8e8bd88d450fb03ba1723b0376a3199f2a92db2e8a3ccdc512b6cea492bae",
          "mlx_lm/models/nemotron_h.py": "47143633f5ad663aa6834a18be69520ae4d588371e392bcdfdfad898b2571b1f",
          "mlx_lm/models/olmo.py": "cc4cc1097d73449ae22ee2dcf637d6e68b5f11c0482e75261f563b46c41bd40e",
          "mlx_lm/models/olmo2.py": "f14a7484ebf584fdd92faefcc394b1064ffe1828b3b7fd75267de38b1b50b4a9",
          "mlx_lm/models/olmo3.py": "ede2b37d41cff6f73877e8ab4174e9eac10dc37b49962f03c297fe41d9a27393",
          "mlx_lm/models/olmoe.py": "4f8f78d368666ad0bf396963cd094bdf48caeec45d7a188c299bee7fc4bfea90",
          "mlx_lm/models/openelm.py": "5e188106d087d4bae2c009c00cc965ff74a5d6d84e1c1b0cc2aebb145708eea1",
          "mlx_lm/models/phi.py": "93fe4a0f016a55ce225023c703ae34af3e184e3241cafe7140eb688c340a6fb4",
          "mlx_lm/models/phi3.py": "55824e3cc8ddf3e092be202b455bfa423c6abfe43199b24df39d089abf83964b",
          "mlx_lm/models/phi3small.py": "97e71c9a3b879f5892056cd0ff59613f645c8a883df738b63cb41a8787adbfd9",
          "mlx_lm/models/phimoe.py": "8d1ccfadd2ccd81cd259d7bfe5cd218a8652d77ba2d76f45a596406248c0c2f5",
          "mlx_lm/models/phixtral.py": "8987cd1716e7ed32ea7a617dbad7a7a82d7ee63ed865cff0e45948848553dd2e",
          "mlx_lm/models/pipeline.py": "b2bf11a2990f75243f1964d5f8c9aad5842dc69bc99c9028fe87e60788ef0bdd",
          "mlx_lm/models/pixtral.py": "cbccd51a330e724ecc9e98399006b965db5ae7f8fce0698ab03354c6ad119f28",
          "mlx_lm/models/plamo.py": "a3fc5fc6d5648afc8db21cb28ebe1885e69ef8b32edf044e636dc4a4a4dda46b",
          "mlx_lm/models/plamo2.py": "b698b92ec4497ddcb4ab2ce29d54332e30ba76665276ff0681dfc01622d8e582",
          "mlx_lm/models/qwen.py": "27ca9aac6c6d1819c51f7c0f49f352d03b2e508e0ab42200b5a14d514320d02e",
          "mlx_lm/models/qwen2.py": "30d38786f3c598bf58c1dafcdffbeac6f3c507442bde768944350c57222cf391",
          "mlx_lm/models/qwen2_moe.py": "ebd2e5ea63804ad4279073da6d2a6ff3919af2c36a4e1586a7de23cd390fa306",
          "mlx_lm/models/qwen2_vl.py": "c6338e4dc1135cd2a5b07a4496aa6d2ef72fff32ecc58cdfd91872fe073d2a41",
          "mlx_lm/models/qwen3.py": "2284df96ecb669109b281df4534470b18f285aa9a5e41735ad682f601f93c639",
          "mlx_lm/models/qwen3_5.py": "f0daa30bba5cb521c8bdfa7093101a544c6a37bbba09bca582288219cb04ae3a",
          "mlx_lm/models/qwen3_5_moe.py": "ef9e8e1f6a5c097b29587c8330e8eb9c9cbdc52fbb4597fbc2362606c1996619",
          "mlx_lm/models/qwen3_moe.py": "539a201316616d2296a15a0998859e8bc0af36d8433d6f78ab0c46beed51b005",
          "mlx_lm/models/qwen3_next.py": "3c572fe3fbb36721efab4d80d1bb6af11beb4ad1caae18deefc9fc84cbcd9b79",
          "mlx_lm/models/qwen3_vl.py": "d4344d0a3681be91e59a8c0823a0ae58e9bed16da531565c360389976a62bb3e",
          "mlx_lm/models/qwen3_vl_moe.py": "aed222b12c86aa0472288db6d13e0536a6bd06b61dae5850afd7abb8c2613aa9",
          "mlx_lm/models/recurrent_gemma.py": "7446b3cfb9f77c30aa056a4f4449f48991f84c32ba97ed370fc25c3499052edc",
          "mlx_lm/models/rope_utils.py": "9f68c938c040fa111d13f2ed95c70e8261515fb3b54f8a0a474c096baf4e087a",
          "mlx_lm/models/rwkv7.py": "be2b710ed17a417e1f80d4b6f28cb6a61d2cbaa917a348803105902df72cc29e",
          "mlx_lm/models/seed_oss.py": "451a32421feaae71e6508b0ecb6dc8fecdcaf2e1f9ce7347a56ffea95c871832",
          "mlx_lm/models/smollm3.py": "89bb60ff0fc8bc5e04dbde5375dd2475aae8e75e5c792b93f85217b99f594179",
          "mlx_lm/models/solar_open.py": "fbf6c1c57de579e3322978464aebb8cddce77718a396cb18f916efa999328125",
          "mlx_lm/models/ssm.py": "404adb47453e176d1561f1efa5eb09c1c0e58e78defb15c25cb40f6d7aa7890a",
          "mlx_lm/models/stablelm.py": "7788eaa5dcd78d174a4229076af2cba0a0e37657712d62487e4f28932e26d64a",
          "mlx_lm/models/starcoder2.py": "c18e1c679ba5d16910600bc2c6eddcdcb91811bb38216bfa5de8a7daf076f64a",
          "mlx_lm/models/step3p5.py": "ced87a3562463f8a4657b51106fa97fcebce0b5b23c80ae0430ec9edfb7e6169",
          "mlx_lm/models/switch_layers.py": "073a6a808d5c90bb699a2ecca0e559b06727ae96dbc1f0253e4c7e77e4ee1ef2",
          "mlx_lm/models/telechat3.py": "14ce1bf6a19044265873233edd65e37586704c85310cfcb756a109b679e6e427",
          "mlx_lm/models/youtu_llm.py": "cc31f3bde475530f0388d18e99bb50b7fc54248cbaea9d0720f7983d38cd444a",
          "mlx_lm/perplexity.py": "8146c8da1bd6df6b2edeea6c1dab20ee8570c0f13e095479b1a16e85528b3faa",
          "mlx_lm/quant/awq.py": "04834a6d2447626557ca3c05d82140eae9480564abdfb1507a600b76e8ca84aa",
          "mlx_lm/quant/dwq.py": "9a70448d4e5f3d20efc4e70bbbc91ab311fa42479f703077d55d3af75231c72a",
          "mlx_lm/quant/dynamic_quant.py": "c1031bd9b2046a93fe3ffaa991001055a7b591f29b549cc1ed5959ad0bc87020",
          "mlx_lm/quant/gptq.py": "8ba42877f45e86262146c6c962691c19a819478b561f55f04371d28ae3a74c9e",
          "mlx_lm/quant/utils.py": "fbae54a7e39b9ae999bedfebf833e865e6912bada29f4c3fe53383b9d8655e58",
          "mlx_lm/sample_utils.py": "c0ce439f8dbf0d4e6d0f37f728a324f3f72878e6a9123df41be520804c596d67",
          "mlx_lm/server.py": "cdfcb4ac848636f9927851a0ec7a951584526530cb7832ba58049e4a9144db8b",
          "mlx_lm/share.py": "3c25e46d4b413d67cf5bde546f47d09fbcea9ccc446e878721543af43cf91c19",
          "mlx_lm/tokenizer_utils.py": "25784bb03c922d0d7832ce6c66a6cd4eb3a4820b6c5a8e583dedb63a018fb56a",
          "mlx_lm/tool_parsers/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "mlx_lm/tool_parsers/function_gemma.py": "b8531d412cb87d1ceaecd5e2d15b162ff8036e093a4daa9e3f872d005191defc",
          "mlx_lm/tool_parsers/gemma4.py": "8806c0593a9ababb7f8617a2ffcb9c50f19a0cebdf659124691adba6e09c826c",
          "mlx_lm/tool_parsers/glm47.py": "4007036f3b6440aea56cac6cd2f5ab590b9be941dacd630ba9c01e5f67475b66",
          "mlx_lm/tool_parsers/json_tools.py": "398c044ebd6bbb5578131d57817753d70b43803da509c14d12a2591e01d9cdb1",
          "mlx_lm/tool_parsers/kimi_k2.py": "7d02c9fef2b43d18b5b74261e774943d0ad85a05ea50b92764fb1ee821976206",
          "mlx_lm/tool_parsers/longcat.py": "dcf25a84edd35b92b7df8dceef424e12930828159ad315a67dd997d90f2fc531",
          "mlx_lm/tool_parsers/minimax_m2.py": "db2bd5cd0286ca66881bf363612f65c2a42d0d681d8f1a5e9b442f847066e60f",
          "mlx_lm/tool_parsers/mistral.py": "df143d4bcadadb22291b0d634f485c714065d973aae129f0b6ba789e81fc92b0",
          "mlx_lm/tool_parsers/pythonic.py": "14cf949cac8ba3ce7366fa9f692213f300c1103db5642b4c56af67ca8f0ef13d",
          "mlx_lm/tool_parsers/qwen3_coder.py": "32de6d9f7472a1f00a2acfaacaf13e0e0864cfc19adebbff688ac5004b8ecc25",
          "mlx_lm/tuner/__init__.py": "a03c637c7952112a09906b6e77caf5dadf3aceeb1c2716fd10b01afd318673a3",
          "mlx_lm/tuner/callbacks.py": "dd1e5e7641c3271ae33cdd53bcebb99b67c3d1471a4294b68afd6014dda77ed3",
          "mlx_lm/tuner/datasets.py": "fa112840e6ea98a4ff18428792fe2ab023999c2da51ea64b3ebdf8657a152f17",
          "mlx_lm/tuner/dora.py": "b2f2d80bc5091efcb56916157b0166210aca9333fd20a621ed04ea53bc45ba10",
          "mlx_lm/tuner/lora.py": "4d3a8edab111d4ddba33398ba8700203db7b61621c39e9c348fdd50e57278b45",
          "mlx_lm/tuner/losses.py": "f5a039f681a8727f47ef3a7f073b5a0813182d6b1feaa22e2d697eba6a9f4375",
          "mlx_lm/tuner/trainer.py": "ee33ebdbd20a184108541cb490d08085485e71a82ffd6d68d7d216029ecd28fe",
          "mlx_lm/tuner/utils.py": "166eaf5e5f923113bed43614a5fb7319795fa0cac5a7fa319ea54e5f0045b553",
          "mlx_lm/upload.py": "d25c543f54c58bdcf755ceeea9d9dda36169a704e2754ea1075fac119038eb3d",
          "mlx_lm/utils.py": "ba0371e9c88d52b34d71271945c2394005fbcb2bfb2ee9f6f82d627a33b72422"
        }
      },
      "numpy": {
        "version": "2.5.2",
        "files": {
          "numpy/__config__.py": "902479a9549d83acadad6179810f40f79630a6a7b82801e79b306dba34648c0b",
          "numpy/__init__.py": "09295a80660f17925ae23765ce8cbd7ff7ceae968d5f2f89349f1cb74c0b9e11",
          "numpy/_array_api_info.py": "4332889405b9c5b4f946d761086346f58c0acb82bbfb5f9180b30d5520b5c972",
          "numpy/_configtool.py": "105449de96b34f162113da29fa8716c8a4cb66bae91617e6992fed5ababc0b1a",
          "numpy/_core/__init__.py": "837ce8aec8693095d2e1c7c306d385d1785a50be97a009935c64cae04e3555d2",
          "numpy/_core/_add_newdocs.py": "2fc06f2d919b16afc1e1f1abdb161bdce9eedafe3e07f127bb0f45b0841964c6",
          "numpy/_core/_add_newdocs_scalars.py": "db6f2b889f9dcfd7d5df64ef3a430f532b3fdbfc279c3b94f8451b1757a16efb",
          "numpy/_core/_asarray.py": "f5aa779032cd51c8ca49039fae454fcebd2d64647513576d0884ff61e68525d2",
          "numpy/_core/_dtype.py": "59a285cabfcef070f8c3e6eaa15c1d4fde4791983e374e275944fd638c11f926",
          "numpy/_core/_dtype_ctypes.py": "28f3e56a40ec3e4b938523abe6a1705b48c9f559e36ef5b811684e6c21d81881",
          "numpy/_core/_exceptions.py": "5fc120d61ab5b94f0bf7088ec05a368d1aba4b4be78c27606051e3de1016f42a",
          "numpy/_core/_internal.py": "497f1ce325bcc6ffc2ccf013e2cdd2ff2e32c55106a0a07997213d45d6c777a0",
          "numpy/_core/_methods.py": "724facf7e63c5b8fcc2fac14bf31a02cb048d9e28f516d86502ba5077a425476",
          "numpy/_core/_multiarray_tests.cpython-312-darwin.so": "20c3c985bc0bd6bd8a0bee5198083aa6be418f7994471f83a5cb7ee2119c6fee",
          "numpy/_core/_multiarray_umath.cpython-312-darwin.so": "359e4f56a73e02b63b00e9d8e0b4190e1a8cf2a1dc6351c83c7eb2f76c4e16af",
          "numpy/_core/_operand_flag_tests.cpython-312-darwin.so": "e910e6642301f2f28a986d819a3249d5d1013b2ee6ce4e5e9a95082ecc4d3627",
          "numpy/_core/_rational_tests.cpython-312-darwin.so": "73d0f8c90654dd97fa2b0ed6c45882eb8fe83a8c4256e38bfc31713e5e07841b",
          "numpy/_core/_simd.cpython-312-darwin.so": "e1323e4eb0f2ae78cc1c47d7ff374f7ac39b6e06b5490ae54bfa639816181f7c",
          "numpy/_core/_string_helpers.py": "e929a0a22ea80f60ae9e3c014abf41676d079029ef5ba9d33db953394de95a78",
          "numpy/_core/_struct_ufunc_tests.cpython-312-darwin.so": "24218eec682f48246b450903e270be19eca1c6c2d828235ddef29949f2cc8950",
          "numpy/_core/_type_aliases.py": "fd576d1516aca4b752b374a3b448f03a9acc6b748243dd72f89619f7b300344d",
          "numpy/_core/_ufunc_config.py": "0e938bb63600619bfe9028e8f285f9ddcd925b62d0220690ec4a650a48ac45a5",
          "numpy/_core/_umath_tests.cpython-312-darwin.so": "1c55454c29a1a5f500fc22cf095e862b0af0f17e14c2a1fbe7140832c21a0d66",
          "numpy/_core/arrayprint.py": "ea1e7577acc4048383d842a628827e33dc544f06842ab5848b3ee3bb298eaea2",
          "numpy/_core/cversions.py": "1ff88d229c7dfa1635710371aa34f677fe525d98496cca3f71aab8feae8b07b2",
          "numpy/_core/defchararray.py": "a174cd2354ef6fd8851d51c6f5b43f3fc836a344d1a37fa9600060387858d395",
          "numpy/_core/einsumfunc.py": "4b4fc2d54ebe6b533f680fde2fa468d30449c2d44afc73041b6debb6e302dedf",
          "numpy/_core/fromnumeric.py": "ed6b3fe56e1921ed140c9d8ddd26393faaaa9304846084ae3ce78146bcabe605",
          "numpy/_core/function_base.py": "97925f5f2a271088cbff838a149a6312335d8dac80ac0314f0c85a31b442c1b5",
          "numpy/_core/getlimits.py": "ec0927f602302ef9b449f2773151deaab480cb5ad8eff4c8bbba59e489daf106",
          "numpy/_core/memmap.py": "9f79da21b64da6722a66cc86e126061b33371ad66139314580de483a0ebc254c",
          "numpy/_core/multiarray.py": "afd14181b927aa10800a0c5dab5f456f52e219726847dbef379e313419029d49",
          "numpy/_core/numeric.py": "feb150554b4879d4df7bd0a4ab7b1a6b818de7ba994ed0c73583fee177533417",
          "numpy/_core/numerictypes.py": "de7be532bd85cff56ad4e29786d76ec5bf2d511f7e364919bdd7cb0ad93ad3a8",
          "numpy/_core/overrides.py": "88cf63f86be1eba2a303d221f011af2077194d819c06a10c725f01c939afe4ca",
          "numpy/_core/printoptions.py": "345a6fcb96e78dbbea9ca7aa42dd2f784131a400180153688865c7de98255807",
          "numpy/_core/records.py": "bf0ffa47a868c210494dd351ebe9d58bea06bde6730e8224ca39979b12ba351b",
          "numpy/_core/shape_base.py": "1d6e897dfdb7edf2d71e8ed75254a6e7106b1a947592f88d91af96d1ad2c469e",
          "numpy/_core/strings.py": "725c16c3218fb3441b56465b94f08d5a84eea24669d3b9189ae45a6ab9aee332",
          "numpy/_core/tests/_locales.py": "96f1ea50954cb2b13b261dcdfcaa4ee5f181660203fa5dd9af8fbf46b1f564d3",
          "numpy/_core/tests/_natype.py": "93a0e3d9ef621fc988077d8e5bd148d851b1884fc50c2ee621a222e19810e957",
          "numpy/_core/tests/examples/cython/setup.py": "3b3f154b2d028de51ed79d7a1d0b607c1250213934628fe613d15c415805eef2",
          "numpy/_core/tests/examples/limited_api/setup.py": "63ab60b0e179f2a7bb786d909914071b6c1a71959fa5b24b4fcbbee4e6a68ea0",
          "numpy/_core/tests/test__exceptions.py": "96e313eaf3c875fe8bbb014d1b24fec4b31968a644618385cc5a4c69eb288e81",
          "numpy/_core/tests/test_abc.py": "f72d92b097643de574a16e9db1138f64e710ef6fe65e27b5b94db23cdf77c33a",
          "numpy/_core/tests/test_api.py": "8a8de65e7d39b3aa98c7d406f49fb998a6fb31e3b0c9bf2b46068795c3fba5ea",
          "numpy/_core/tests/test_argparse.py": "0d12d00f94f186e76b419efd866e5db3778ab1787f51bed0b2f118cec743497d",
          "numpy/_core/tests/test_array_api_info.py": "0ea5da065100fa5eb8512be2a65f69feecf463bbd22d5fd1c7352f3f79b7a159",
          "numpy/_core/tests/test_array_coercion.py": "dc4262a56f842b233400ef70d1053bae3c2c34657ad0df0f551480bae07b5582",
          "numpy/_core/tests/test_array_interface.py": "977f55b95e2709d21e575454bccb638cfa2102022f24ff95dc643931a3eb54af",
          "numpy/_core/tests/test_arraymethod.py": "67ccb0c9a462ec65ed5f2a690f9e86df47f39ce2a82d0daccd565116d86bc77c",
          "numpy/_core/tests/test_arrayobject.py": "b9165206e41aa5f911e567da0d5d114b741ea1152612c46f539ab37ade1632f2",
          "numpy/_core/tests/test_arrayprint.py": "d96991880c806a50529c991e339b59ead5ba16a8d2db23dae877c41373f7d64d",
          "numpy/_core/tests/test_casting_floatingpoint_errors.py": "431ab06b96ba03efacbaef26e33c1170a510037e7cda8cc59fd5907026c08224",
          "numpy/_core/tests/test_casting_unittests.py": "46cc4ce0866d18c1cda2e82f8598845a6d95845b53afbfb01590ff35c2f396ec",
          "numpy/_core/tests/test_conversion_utils.py": "e2db425fb76703ff294cc13cee86d48f2f0a0e4c37a8bc12661ad5a4b400db9a",
          "numpy/_core/tests/test_cpu_dispatcher.py": "0bd96f2d7e01e5de63d81186794fffffdf75f6efc7930c0f83af463ff19e7489",
          "numpy/_core/tests/test_cpu_features.py": "0b858a4cbf6998dc221dcfb75c889aaf63ef30ed5bfe3a493a2c2516cbdfae67",
          "numpy/_core/tests/test_custom_dtypes.py": "f68f7986b57c925bb8cee3eafdb60bd8535b80b5a3560096067ff63e2fff357a",
          "numpy/_core/tests/test_cython.py": "8220e498e61166e03802ad1ed7774aa22fde3bb98d494c2f8964dd6b239e1143",
          "numpy/_core/tests/test_datetime.py": "126ff9471a7ea11cd87927ab34540b7785d5043fdf9aa8efa5742e52e434f47a",
          "numpy/_core/tests/test_defchararray.py": "03a67d60f73134c440dec222b079e9973c5f6fc345b4a2ebbd56421ac91c9b31",
          "numpy/_core/tests/test_deprecations.py": "781fdb14d594e37aa9bcf9cb1ba0e346fba5bafbe1cd4a2fa2e187be636adb0d",
          "numpy/_core/tests/test_dlpack.py": "2730cca80cc56597f228f3c9bd6b883a457be7d0c81c343f380288455c4ad847",
          "numpy/_core/tests/test_dtype.py": "c516913ddb1513488076cccf6fe9a061c8d5552e31ef994c627561fcc457379f",
          "numpy/_core/tests/test_einsum.py": "a93befd3c9d981456bd7f0859bb447ac067a38e6d5ddcd6946744c47d790b73f",
          "numpy/_core/tests/test_errstate.py": "e1e86f96786243acded63bf5163ed2bd7c78e0e40ac9d215b3b36d3678ca647b",
          "numpy/_core/tests/test_extint128.py": "a281ce5ef6148392b6251b94bfd69eee65a5deaa035c562cf4881bf9acb9e0b0",
          "numpy/_core/tests/test_finfo.py": "3973c51228fe88cc63351539ee4f366a8fe3f62f848a97e4b4526d2f6f14c2bf",
          "numpy/_core/tests/test_function_base.py": "545558cbc18c944cf790fd3315b170426c221fb2e6d37fb148245c847b4e5477",
          "numpy/_core/tests/test_getlimits.py": "41efc0b7dca7a164039f21297458e8a8431d2c0122cce84747e0b3ace39c2bb2",
          "numpy/_core/tests/test_half.py": "47401dac9e81285fa243105560f1904ca1ef573b080559a81694c584806f0650",
          "numpy/_core/tests/test_hashtable.py": "3b69065299eb8ebb2fddca2b750b9a56c3a99a934f11ead3718c0311403533e1",
          "numpy/_core/tests/test_indexerrors.py": "d019c705a6b4dbf1fe8c7217db0fcdb6382ece19db83c38881bcf6098d5984cd",
          "numpy/_core/tests/test_indexing.py": "9d1a04348bd6d7cc5148e2bf92c09eed43db0d94b5a3d67d0b54e835ee8f7e7a",
          "numpy/_core/tests/test_item_selection.py": "cb2753d5ae899fe55c68eb5804e8db7891494969c2da256035f9350a40a238e4",
          "numpy/_core/tests/test_limited_api.py": "c61623695c5f239ae9f2d88ddf8f1c3b5c98ea13c6c9b55f82d2cdc1bdf0ccbc",
          "numpy/_core/tests/test_longdouble.py": "01315ff3d538502cf63fec1233e6feb8d04f475bafdbdd739eeb5c487c5c2c41",
          "numpy/_core/tests/test_mem_overlap.py": "038d16358b2f9c66cfc32ad9a09136a88a91ac67ad4176f21dfd0e982380c111",
          "numpy/_core/tests/test_mem_policy.py": "64a8eb408697f95c54db9691aaf387ecd8e975163e2215de9e45928583c60008",
          "numpy/_core/tests/test_memmap.py": "7a02d9c8543802b456e431b94313327099b52d72a241e9047d535dfe2d3da56d",
          "numpy/_core/tests/test_multiarray.py": "964e120033b517b0edb810f009b9be37e17706041a8a21ef77efecdd969fed8a",
          "numpy/_core/tests/test_multiprocessing.py": "2712b996209a173d669d1a6971f52167d3cd247c1e23954ce2ffe41764624c19",
          "numpy/_core/tests/test_multithreading.py": "b8df17f46fa0bc90648be0806a66279c852f50e39026a92f7ea7661be192d068",
          "numpy/_core/tests/test_nditer.py": "be1eb1d9ff487fc7c754c2ea0dc3f0245d3e6035082462725115a03bb56b5b72",
          "numpy/_core/tests/test_nep50_promotions.py": "48136d08733607f2c32b4e264958e263652c816b064eb31b57dfbbe2ece1eb01",
          "numpy/_core/tests/test_numeric.py": "301adc5258511108eb3d9ea47d14c3aa41b9e6644a0eb3e4f5f6397fd2d4424c",
          "numpy/_core/tests/test_numerictypes.py": "bed0d807cf81c3f41835f8068447163aa873b1c2b07cea833f8a721250f3d43c",
          "numpy/_core/tests/test_overrides.py": "1391dbce08fd891b99d8dc9094ec33ac97c574dbfb25202449fe9ec1e90ea099",
          "numpy/_core/tests/test_print.py": "58098ddd212cf5ebc1153ec27a41ef294cf3c522268329eda4aec8c7bb6a8ba0",
          "numpy/_core/tests/test_protocols.py": "a5b7ee9a844d9cf8433fa3c03cd2202c750f3e598275a982a386a490ef1a7e3a",
          "numpy/_core/tests/test_records.py": "03adf83cf934ece531dc2a12acb3177d98b545ab4776affbe3ab747dc95a1761",
          "numpy/_core/tests/test_regression.py": "527abff2e69f971b1d7154346419affc52ce418a07f9312c508e5f014d3e32ca",
          "numpy/_core/tests/test_scalar_ctors.py": "8d0615129de7382610d3ff32cc5cd0ede43afd150dceb4d511e6df2d610eae7e",
          "numpy/_core/tests/test_scalar_methods.py": "9d8aec8cd904d4c22f41171fe7fb18fd64cd4a9fe94014fb61aee082033dedb6",
          "numpy/_core/tests/test_scalarbuffer.py": "a442401574224a17e483d7ea7a063338f514c5f55c03365b95c72e873df18cdc",
          "numpy/_core/tests/test_scalarinherit.py": "388bd28eb96d74d4923f67391ef0d0ea9cdadda29f99f82d8b1bb565b6a1a5c8",
          "numpy/_core/tests/test_scalarmath.py": "a77ef1285dad35cb7e9c1a84540b3c2666ecef8df52b9a57c9e5aa19da7c1446",
          "numpy/_core/tests/test_scalarprint.py": "365029ff1ad4e580dcc36e3ed9b92459b928bf8a1bfe79c82ed01d0979183cfe",
          "numpy/_core/tests/test_shape_base.py": "97ec4e9f4e976672650a7a8e1044a2c7a8f7069b5392f62b33de0a57c937ebbc",
          "numpy/_core/tests/test_simd.py": "6f7f22312fb4ee881b17af2704f4093b4b7db28e5414df088d3497ca3d72ecd9",
          "numpy/_core/tests/test_simd_module.py": "14515e0b090c73b8df681c81e0c1876887c88699c1c5f3d22195baf713197fca",
          "numpy/_core/tests/test_stringdtype.py": "6c50f0167846d72e03cb4e178bd362aa52dc1d3b83561592868baffb27b34288",
          "numpy/_core/tests/test_strings.py": "746e8caf91c9ffcf67aaf7bbbc6f7ce036860b22275f8e899560a19ac65c7c76",
          "numpy/_core/tests/test_ufunc.py": "c9f4dbecbbb3192faa4ac7ba0ae309c7e987fdb8b8aa84fe44bcc08a430ceae0",
          "numpy/_core/tests/test_umath.py": "f076f371edcd8c36efb636e7a428a25f51079caeccb53743fdaeb8e3ff7e2ad4",
          "numpy/_core/tests/test_umath_accuracy.py": "7d45d72c1e380eb822bd0cc91553bd56c41e85c5927173f9d6625364fdc66c76",
          "numpy/_core/tests/test_umath_complex.py": "48f02853939105905697d250d3af1ecf306196ab7468d740a34c42f6342b8669",
          "numpy/_core/tests/test_unicode.py": "802b0821b8dbd702d7dd95c9cd4c6e2b940e180b007837968cac788f04aad808",
          "numpy/_core/umath.py": "fabc529bdfcc632ae82bcaaa5539494802757e5a52c492999e2ebfe10f396987",
          "numpy/_distributor_init.py": "14148976054795071ae41ad011560fa059ba2924c98481675ad59b1241214d2a",
          "numpy/_expired_attrs_2_0.py": "a6cf0f96202d89f172abe6ad706fe252ba7672ee35091722bd70870c83a0426f",
          "numpy/_globals.py": "fe13921c6f4a00bd12891da7d800f2a42f878c067d8ed881ddf0af3fbace3a36",
          "numpy/_pyinstaller/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/_pyinstaller/hook-numpy.py": "718e49402d6d0726ad3300413cce136164fb888ee4a6525218620bfb81ea4fb2",
          "numpy/_pyinstaller/tests/__init__.py": "a5d3db093470a4225a9a5caf222f4765396a02f2b91cf6c6bb7a0c03472ed91b",
          "numpy/_pyinstaller/tests/pyinstaller-smoke.py": "ea22fe787310686debc674b912072fac2a84966f5a28bd3b0a3af51592525e5b",
          "numpy/_pyinstaller/tests/test_pyinstaller.py": "f0afbb43199fa17086d0dc11d1b84880236b0e31a5ad3cd69eb475b11f1bb605",
          "numpy/_pytesttester.py": "cc2729e50688028a9aeedb131b2a12c0480f3477cc1c0e84be7f5d4177164002",
          "numpy/_typing/__init__.py": "23712a130b95f1134c0e93988ee72abe6c1015180277768ac13bae4fe1c8f59b",
          "numpy/_typing/_add_docstring.py": "89f41e376a028bae35ecfb597475cc2acbd4e4955cbb9b0f8b9eadd08a8b9b33",
          "numpy/_typing/_array_like.py": "5c9d8a290c4d76fe7e85f4367f21fdc33f40eed80b44f66d6378629fb4271bf8",
          "numpy/_typing/_char_codes.py": "c1ad22e8a3fb2405b257e8bdb303a07ff0a923ab23f7175bf5af3b6b62316bd1",
          "numpy/_typing/_dtype_like.py": "060ecb1f4c35793a8a3b4fe200cb1151b51b7d17fc2e53ac7699da4271752bc7",
          "numpy/_typing/_extended_precision.py": "a649d4aa06a4d0504d33eb0444fa96fa91461fbd7f2be89e84549e7b9a108aa1",
          "numpy/_typing/_nbit.py": "9a353bc8328b57ad47a79fbe36eae4c48272b136a7307df7b70e5ae2e725a284",
          "numpy/_typing/_nbit_base.py": "496ed60d5b3b711b201c21e1608c9f2e3f4757f0173f85ffd83d7187e54da43c",
          "numpy/_typing/_nested_sequence.py": "3bc45b3564a962a54c203adede2390a7c852ba48349a4c9332a5e7abfe3f2c24",
          "numpy/_typing/_scalars.py": "02ee1deaaea050040b408b9613fe4f1de80b45290a5c1bb38d5d70a76a6eb7f5",
          "numpy/_typing/_shape.py": "8086f11c19de0c82c78caa3617e4d4f0834ae82afd843befb0f88e9700137a3e",
          "numpy/_typing/_ufunc.py": "1ce91a13eeb05747dddeb9876460b7f580072087fcb72be5cde903e32e064310",
          "numpy/_utils/__init__.py": "4a9a9d941150a1648e017b1efcd2ebb8ffdde730f9c0366f1d826121eb099caf",
          "numpy/_utils/_conversions.py": "d3133175e2cece20e61ec44cffc96e121e12fa441d328320e86c4d0c36acebd9",
          "numpy/_utils/_inspect.py": "cc5b890011f4f03d4a82afde79c6240f53a0834397a75b78a2a8d9c4cd2474b9",
          "numpy/_utils/_pep440.py": "8adf4fe3fa075d6c37071768573ec93ccba3e64c45e4ceff049f19d66f67bb4c",
          "numpy/char/__init__.py": "93ff0019e949b734526cfd53c96a25923f8445fdae6c91ec3d400363de3ce94a",
          "numpy/conftest.py": "c18dedb095cbd8e6944ba7a2140b0b36c62d0c520637efd8b8a32602497f5c27",
          "numpy/core/__init__.py": "c0935a445d5414e9d92aa881aecb2158b8d31a2119f6bbd695c8add318fb634c",
          "numpy/core/_dtype.py": "1870617d5b6c56b3fbbf5dc8ba3133f5a18810d91821d6dfb91bbe35ec355275",
          "numpy/core/_dtype_ctypes.py": "c17e26dfb6f4cd08319734f93a313fba3d84e42a625fd13b1cb1693ba87f9436",
          "numpy/core/_internal.py": "ab1a472442d735471826426dd4b92d42e666e01c18bb86d79ccb8110ea7a3ce5",
          "numpy/core/_multiarray_umath.py": "4fcf07660143e550ae5d109278b6cfa23f7d9ca512760cb0f315b27fa7aa8714",
          "numpy/core/_utils.py": "e5f935f09378dd183a607bda9fa42376b39e3ae2ed4652d598fe8c69d0442550",
          "numpy/core/arrayprint.py": "2db7b8b26597605cddf6c3bd2cb2793d94b80b76d2bcbb7a1d1b70484e7ac4df",
          "numpy/core/defchararray.py": "6bd96ebef9e2f2046b19574a3bb53fc70b0516f9339719d58312fbe632d19822",
          "numpy/core/einsumfunc.py": "08db9c20d81422ba622d09f8c4f23f9a88308df2a5140de1ee0c00bd15706f93",
          "numpy/core/fromnumeric.py": "e536a89c956e0b5d74aafddfddca93b668dac935f4066a89020a00267e47dd92",
          "numpy/core/function_base.py": "be18e1cec1330ddd7544783aa6295f3093b75fa93de1a9f944026a8fe9e5ce6b",
          "numpy/core/getlimits.py": "ea70a4e13c342e35bb8e85aca6b2392e23338ded60b0e8ceda5490fcec0107c2",
          "numpy/core/multiarray.py": "6e374f2dbbc9ba3eb533a4d991b0793573823661f841b52aea0dde3e428fe930",
          "numpy/core/numeric.py": "0ad93f42293207698cd31234941781f184d47d3c104977d576920c46dba76cca",
          "numpy/core/numerictypes.py": "6d7c13c3351a8736c7ac51a14b946424ebdbe93604b109d00b9c30f6637ed55c",
          "numpy/core/overrides.py": "d456726f453a249bb2a23b7116f43b1d2276ae97e159e73417e5f499aa428dcf",
          "numpy/core/records.py": "f727c50f1c8e73af255ea7db6a8b2044d970d5d6d63fc0911f320f12d12d4a07",
          "numpy/core/shape_base.py": "dacadd42d17577c2e951b0e318c5d3f93ab3d8ad8d6933be6440b8be2098b306",
          "numpy/core/umath.py": "84c56636b20276a5d18a2446ed4315d06afef7162a2469a438d1909f6d222bdf",
          "numpy/ctypeslib/__init__.py": "585c0c8695762c93fe2103aca5a227855f1ce973ca670aa9a44f9cbed229aaf5",
          "numpy/ctypeslib/_ctypeslib.py": "739bd4529aa07a4f02f59a3464aad2f537dec1d4c9ce99d52f7be6845c1a0142",
          "numpy/doc/ufuncs.py": "98e9217609c568aa5f5495296787e17c1d24fbbfa85a51b0530cb0e212eb5406",
          "numpy/dtypes.py": "29ba7455e6125e2986d6e1149cd4ae9d699b208ad23edf1cd7482fdac29bda4a",
          "numpy/exceptions.py": "df16e967d97b1779a1c2dca6be5d2fa84e346a237c6e471e6a8f1a5df66c9795",
          "numpy/f2py/__init__.py": "7df877d7f533f3523a2871b265299c9e09188c7413147a391ddaf7436a80f1ab",
          "numpy/f2py/__main__.py": "ea2da3547d9f3eb895d5aa1c4d8fdd505bd62b5f2a6bece3a6721203e3a9177c",
          "numpy/f2py/__version__.py": "f7d4ba9927afba1c0698ef64bbefbb55425e921374a2de3e2747192a21dcaa9c",
          "numpy/f2py/_backends/__init__.py": "30813c4a5e37d4195b9fc9b463d4539fad899767747caf2792501109f5f67bc8",
          "numpy/f2py/_backends/_backend.py": "a055d9f3e57071049b96d97cfe98162cfa82399f18fe9c7ba1e4e4fc19712537",
          "numpy/f2py/_backends/_meson.py": "398d3089f27dddd148e357c1aba0ddb2f9d0fdeac0e6aba2c6fa7ad1eb5a888e",
          "numpy/f2py/_isocbind.py": "cda060a5f3cd466c551b776850895b6488b207df7432c5e2c0369bad28fd1e74",
          "numpy/f2py/_src_pyf.py": "3c7a68f43dbc2aadeaff7f8a157f03dec143f5e5fc0357372ee2cdcd7cc1c8ec",
          "numpy/f2py/auxfuncs.py": "32eec0653dc31d69707d3f409a4485a47f81399d13bb7202cef480e85c16f3f0",
          "numpy/f2py/capi_maps.py": "3cab905335d8a7af56eba8dc274c92bb05b3a849cf8176f7eed1e97ba694f6c7",
          "numpy/f2py/cb_rules.py": "008ce50f611508264a333f904c38082c25dc5cadad30cc579972671fe850249a",
          "numpy/f2py/cfuncs.py": "c6f0e44d6644416fe5a182b860541e2e1eee3f586413df14f39edb40e71097e0",
          "numpy/f2py/common_rules.py": "4c63644e918d20864d9d7f848f966304725891c6a230afe4feb9faf4f7e1c89d",
          "numpy/f2py/crackfortran.py": "a5ac64c74111262a521bc359963dc4907200d9dce0e3beaa31dcc0620136b822",
          "numpy/f2py/diagnose.py": "dd4233884349083f2f9daa6386996ca927736697ee01fa3bb69edcc79cb6f2a8",
          "numpy/f2py/f2py2e.py": "e01b3861161235c6f003aa774bff70afd211cf421465311abd5386f626f4d137",
          "numpy/f2py/f90mod_rules.py": "d2c33f315e2722d29635bcaef2838d08225ae5925f9a474cbf6f2f844619ad37",
          "numpy/f2py/func2subr.py": "a68999da32155a64e39fb9a8573afc3695862095192914ce349035245410a3b3",
          "numpy/f2py/rules.py": "a030a2cced2c5c25358c30d4877d50c5937312542ffdf464382ab19ad1deb576",
          "numpy/f2py/symbolic.py": "a83d5d2d5d592ecb881814f794736c91abdbdfd866c2ee0311a934916928e681",
          "numpy/f2py/tests/__init__.py": "a5d3db093470a4225a9a5caf222f4765396a02f2b91cf6c6bb7a0c03472ed91b",
          "numpy/f2py/tests/test_abstract_interface.py": "3d73500740d9766759cb2b09901f1ff46634fe103784692685af1a4015dcd529",
          "numpy/f2py/tests/test_array_from_pyobj.py": "df3605604d7caaa268fc5157c55a17e35e14fd39eadd0ae89756b34df351f491",
          "numpy/f2py/tests/test_assumed_shape.py": "791baf04573658be959fd6a046e2d423f4d71b01a666c258998a737ce1a77bf6",
          "numpy/f2py/tests/test_block_docstring.py": "5fbd9f44ac5f33640654dec3331db6791664122bb3cb4a4fbef314c81ca61873",
          "numpy/f2py/tests/test_callback.py": "ad462a269170f86ca7ab9a7f2fd434daca52987a11b2af1a237234e09f9802d4",
          "numpy/f2py/tests/test_capi_maps.py": "f6c842098b3ae8024ab1b3f1e13f962927c73c2488e3bec990fb80d42e5a69a4",
          "numpy/f2py/tests/test_character.py": "a9c9eb98ea7e1a6e2e4fac0cb3521f82aa2340d6aa97a820a81c464b3d0cd281",
          "numpy/f2py/tests/test_common.py": "255c08ccc131f99f6291cfb41087bab28058a6ffd923df47ad3006f3831c8547",
          "numpy/f2py/tests/test_crackfortran.py": "585b4db94707eff2ae786b0a778fc3d966feb42f49f4cde71205bbd60b4347f0",
          "numpy/f2py/tests/test_data.py": "2b287a11db951bfe214e64be092e7affe97af18ec6c27817721493a0f5897b09",
          "numpy/f2py/tests/test_docs.py": "81a47adafa456889dafb9d115e0788f6137c850d8b9fe0939e03229daea3f63f",
          "numpy/f2py/tests/test_f2cmap.py": "a75ff9bc4557b65c3e1dce82ada3edd321bbc9e2d621c2bd6392e1c4da1f220d",
          "numpy/f2py/tests/test_f2py2e.py": "886623fc8d54c87c9682894c3f4dca4f5ba5db9aafccb894be1132d61cca84f4",
          "numpy/f2py/tests/test_inplace.py": "432adca0893b21f0cb819c18953831e913b085a736fda79452f381bb764834d7",
          "numpy/f2py/tests/test_isoc.py": "2b136940ad4b3ecf12cfdd07dfca1d5eb3ef820738b90303bc985b6d163b8bbc",
          "numpy/f2py/tests/test_kind.py": "e2a0a1c0b7f6af9a6b9a91031ae81dcdc429fe8553bdc0c846efaae276f895e3",
          "numpy/f2py/tests/test_mixed.py": "171aa3a3767fc7bed09661551794a34e00d5fb4602a90f1349dee5baf3ed42d9",
          "numpy/f2py/tests/test_modules.py": "5580903ed8ddf5c7ed8ba96ede316d18849d139e3135d5759037dae941699c1e",
          "numpy/f2py/tests/test_parameter.py": "21d8a36002cab28930d170c23b8b46fb995cf894e6c24804bd6d3689995cbf6e",
          "numpy/f2py/tests/test_pyf_src.py": "c55f358518867b2b4514a7959e9fba3b63ab19577327279c3046a50904a80e82",
          "numpy/f2py/tests/test_quoted_character.py": "032def640ca1c48340d299bf98de8721f4a0a516073d2a2b3e4b45b4cb08387f",
          "numpy/f2py/tests/test_regression.py": "e2cde7ada18027cb7d0b07a09c2289835689f443acedb4ca182ed7d7220be2f7",
          "numpy/f2py/tests/test_return_character.py": "b7c7313bc2dab670577f6114f8791f99dc6f7473180e4f432f1de43544c0ac2e",
          "numpy/f2py/tests/test_return_complex.py": "fee5ab9d287e2032fc99e9fc5ffff9b2b3f8c0cd119080abe16549828360af36",
          "numpy/f2py/tests/test_return_integer.py": "c3da47bbea35adca75e3cb404e0152aae7ebf6702743121e30aa3ece8c313cd6",
          "numpy/f2py/tests/test_return_logical.py": "66dc61ac32ba631d08dfa8ca57d04eecf2d5b0b3c16f850691ff9b57c295397d",
          "numpy/f2py/tests/test_return_real.py": "7a78035f33d8801bd44cb2dd279bda2221b0b7a03bcce9f89643355ba9925026",
          "numpy/f2py/tests/test_routines.py": "7fda51f0534980ab815adcc28e57e789654725e7295ba8123641836f6b7af777",
          "numpy/f2py/tests/test_semicolon_split.py": "839fc53e6051a22427cfb27bab4d19768bb030f3c141bbb6cce0161bcfa28386",
          "numpy/f2py/tests/test_size.py": "4c49fc3aad3226a018f8c2035afb9eac604dd296c4d7750734adb9ee83de4bdb",
          "numpy/f2py/tests/test_string.py": "b2e17c745242d05447a5ff0399ea620b05cfdca980ee12424cdcbf935d246599",
          "numpy/f2py/tests/test_symbolic.py": "526dc7b71a4861589fdffde2734277c2c2e9eb470cb70eaf0b503de5346f9d07",
          "numpy/f2py/tests/test_value_attrspec.py": "c0497989a4730c640ee25b82d174a9adc524e0b7bfb476a04ec150c69ceb87fa",
          "numpy/f2py/tests/util.py": "4202f71db9d86874fb2b00ad4af7b2538d894945513ea54dfebebf098f922f8b",
          "numpy/f2py/use_rules.py": "0e8c25823ca3af6eb78520946f2f73f7b7b807f0ca5b3f2bf5b94a63c0108b4f",
          "numpy/fft/__init__.py": "251bd35d9a814b98e076ab2e0da2a5a7eabbfb11427a7e873ae127d5a26137c0",
          "numpy/fft/_helper.py": "337367a7a4e1068feb9538fb951f44fe1ee232ef4d74342e49699d486d8a9e72",
          "numpy/fft/_pocketfft.py": "b3afd951a4e60bf79b012b671683cd2df6f0d32d52d62036d7a25e756ac5362b",
          "numpy/fft/_pocketfft_umath.cpython-312-darwin.so": "51add49e0b523ae7b20a10a879a77e0998afb795d6d233ef8936f0a58ce4e36f",
          "numpy/fft/tests/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/fft/tests/test_helper.py": "2de543082747cc5866090e41c8cb55c80db61a98604d04b976ea6ec6b2c4f17d",
          "numpy/fft/tests/test_pocketfft.py": "0530e76ed387693f3246a0a5f401f79208b49766d24c559069f7c340d7910f2b",
          "numpy/lib/__init__.py": "9983bd3542d050794af5c33999f9d6caedb36fc2c4c3184442b842fef757d92d",
          "numpy/lib/_array_utils_impl.py": "4644b9438e60d2a4cc38e0fb70d2a36b0887e0ae2251b37a1a9bb6b4da0a7b6e",
          "numpy/lib/_arraypad_impl.py": "69f17907431860505f879f7ac0f69be927464119e4068583b5f84f11fee63131",
          "numpy/lib/_arraysetops_impl.py": "9f896cc0ddc2f4f94ed7cf0b28fa5dba777ec77df3c44788afcd6448d55416b4",
          "numpy/lib/_arrayterator_impl.py": "1ed3800c81ee1bd0036db3138268783ff9ae91ed55fbc13e14d10eddb54e18f0",
          "numpy/lib/_datasource.py": "9ead7eb599f6ed893aae85ddf9a8316502b4efd0595cea2b9ddf7af1ab097460",
          "numpy/lib/_format_impl.py": "b34d4671a88964e22002effe2cb376263156babbe37237594311dda05dd85771",
          "numpy/lib/_function_base_impl.py": "000d045b739c89974bfd9bae66beaa35bfd97ea7a06d13378aa234153a3b6116",
          "numpy/lib/_histograms_impl.py": "3f4f1940f437fe139d852031afe1c2b9f85e32a2c32f8d90c0125445af9f16cd",
          "numpy/lib/_index_tricks_impl.py": "e168b1ab86f91c9c8ab64e97b2fdc7eb3fe0559c8432d33c9b267b68b4eb407e",
          "numpy/lib/_iotools.py": "04e6c05a9fe7ebd9a92d888524bf15512926b9272b453ae5c4ac5c63ab816b48",
          "numpy/lib/_nanfunctions_impl.py": "d923a746bdfc4cbc254cd932c03670a9f7566827002b2cf5dc40db8bc81bb5fb",
          "numpy/lib/_npyio_impl.py": "51eb4572baad1e8198f71b3488a3cbcdb81ac85aa3c15cc2708cd907198a1fb5",
          "numpy/lib/_polynomial_impl.py": "530f29b1db6a1610bd02291c94196e100a3dd7b80f3a278fb6173e29dd297545",
          "numpy/lib/_scimath_impl.py": "6f9ffec91cd62483bc75afd9e01f2a41eebc8fc9693bc82db4696f18da65cadc",
          "numpy/lib/_shape_base_impl.py": "b550d0cc5e7efe46dc1c77f0286330fcb4100fcbbeb98f41aa9127c2c44e01ec",
          "numpy/lib/_stride_tricks_impl.py": "0db57f30a81b00919e7922828cc23c4c32759c07a647639b76d1e157871fe862",
          "numpy/lib/_twodim_base_impl.py": "0b31bb9f23700e5bf20ab94648afc1357b175fb96b6e1fb80d248fbb461fcebb",
          "numpy/lib/_type_check_impl.py": "53a091170f8fe5fafb13e7b241f8d04c352185c1253125c389aba52ee37e4939",
          "numpy/lib/_ufunclike_impl.py": "f468fbb02ccb1038be6194044b04d3f873604c130f59841612109b0e1718feea",
          "numpy/lib/_user_array_impl.py": "65c91b14c34cdbc1136e97b5d9a6262780b58917a2a1233e4ded8dde217f5195",
          "numpy/lib/_utils_impl.py": "4cb745a05e5cef826bc6c38c55d62cd02113a61d4531b26098c7d86ff2ae2435",
          "numpy/lib/_version.py": "0affabe9bf73540e9b0febf2158f2d09746ef5de4eb069e3a976a57d8d9194e0",
          "numpy/lib/array_utils.py": "5db732849f52d0894d9cff4dcbacb280b30400259650f34e53cbdebe3d531292",
          "numpy/lib/format.py": "9e9274789853eee28d2b96b49423067e226ff91e23c8d86220f7996c970d5c1b",
          "numpy/lib/introspect.py": "e97a1b86c7a928352ff339a83e47d53391206421afeb53f63ca97f6916c49074",
          "numpy/lib/mixins.py": "cd047e8888c2492796c5ea4ae62fbbba34967f0163ad467fab18deac88a4c3a6",
          "numpy/lib/npyio.py": "79a3ef7c7192cd413bd132471cb3823c85fd1b98a132e0447b1cbafcf36127d4",
          "numpy/lib/recfunctions.py": "763ae03d31c71bd8802161dae859b82c647e7a4d23adcb4c62ca9101bb444874",
          "numpy/lib/scimath.py": "aa315a41eab4cc4225ee02aa3a16a3fef9820bf29a15dc9398774b514912a792",
          "numpy/lib/stride_tricks.py": "c74fc17f097270102547706fa714e775e3fde9d1c14ff7c049b9134d3cc16202",
          "numpy/lib/tests/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/lib/tests/test__datasource.py": "aae16cb323008efa343210fde5df35b9900e57002a1f91b921dacde686416292",
          "numpy/lib/tests/test__iotools.py": "18515e26a8345da61090931bab85705aab9aef2f0104f499c6853cb25962147c",
          "numpy/lib/tests/test__version.py": "4b05e812a31aa7ad377368ddece36877464e550797e93fb302b31fd373821dbc",
          "numpy/lib/tests/test_array_utils.py": "84f5ed0a3a0129ee8c3fdd6c83fd38101a51620ecc213565080803d4049c8f1f",
          "numpy/lib/tests/test_arraypad.py": "951fca963be4dcff213db3436fb8fad3475771a4cbc1569da8fce9135a669b9b",
          "numpy/lib/tests/test_arraysetops.py": "3dccaf565c8d1bd58488503fd2ec883e310b3452ff07ed33b02f9f6dc5cb225c",
          "numpy/lib/tests/test_arrayterator.py": "ba4088f1588ac14826725b80e58ae88604b2540d2d822b908c36e6e1a7e12f79",
          "numpy/lib/tests/test_format.py": "32c5f1c75989d5986a394ea45daa50a8395064725e30535f1eeb79a4c28913b4",
          "numpy/lib/tests/test_function_base.py": "2e30d2947f624b672c13f34d29bc9d70105802f0b3d41fa7a6fbb9d4ece4c43a",
          "numpy/lib/tests/test_histograms.py": "6d9c00935d0a37cb82abc958360d1aabb9e9b1e86532ffd434e0614e8aac93af",
          "numpy/lib/tests/test_index_tricks.py": "dce215ce105935233ecf4cfee1f7ba77fdde1062197fa2afdde1852b14d6b324",
          "numpy/lib/tests/test_io.py": "241ac332374da2f05191969ff24054cf7ff029dea39b7dfc71fb75d75bd00c46",
          "numpy/lib/tests/test_loadtxt.py": "3d8cbe26a69314b39d41288b15cf094f16fb2f04bf60acae2a9ab205c8a9d780",
          "numpy/lib/tests/test_mixins.py": "f6bead80fe166fabc20e7e7dd0f90798797e18102800bebffa6c29db06e268ed",
          "numpy/lib/tests/test_nanfunctions.py": "4a34474ad3f8afc08b1f497b70b23178af7433b46a82e638609dd63e20b6baab",
          "numpy/lib/tests/test_packbits.py": "b331a342542dbbb54234a5b6bccf5903d3ad2b78980b061c39b78c7d2f85699c",
          "numpy/lib/tests/test_polynomial.py": "0b5b26b653fcfe0c838df62835975b8f338878ec01ab5bd72b30973520914fa5",
          "numpy/lib/tests/test_recfunctions.py": "e2e70bf15f9e98ebd5343c2cf1347186fbfd0f39794241110169d4613541ab6e",
          "numpy/lib/tests/test_regression.py": "51446d9adc1faf1303177518d5930d6e020939adfc8d4cd82829a96180fc7b74",
          "numpy/lib/tests/test_shape_base.py": "6561de582b3dc74b03f8bd3787a9139947511efc47542fbc28ebbc2a89a1c8a4",
          "numpy/lib/tests/test_stride_tricks.py": "b3e3fa0649b9be51e6adbba4b08bcd536b42161629db310329d144a1015f8d4f",
          "numpy/lib/tests/test_twodim_base.py": "c2842b7beff23d5673ccaa69e02432969f89d4d3f9f326c25d952b95de295f98",
          "numpy/lib/tests/test_type_check.py": "d8ceaec8b488f823f5dc2032967067de46d3ea7acaeb06165be49cc35defb004",
          "numpy/lib/tests/test_ufunclike.py": "f6996e304db3c86991cf1e97052ace7b90f10252a5ba45a7ad0a137a8dc582c3",
          "numpy/lib/tests/test_utils.py": "1d16711fc46cf8fc42a4c02181b34ead37c1aec03c07679338aca963451d733c",
          "numpy/lib/user_array.py": "ceceaee93017a00c9218065cd6a13a7ca0f800dfadeaead909a89968a9878aca",
          "numpy/linalg/__init__.py": "3b50094af1bb3530254d3bcb19349c612d5db6f859707320a466c7f71499abc2",
          "numpy/linalg/_linalg.py": "fb51e084cbb05b72a571a088299222055f3f176792ea9ea66186327a31ec787f",
          "numpy/linalg/_umath_linalg.cpython-312-darwin.so": "dbaefc13a7379c877dee2618ea6f96d69560743d3ad392d57f3a866f1378728d",
          "numpy/linalg/lapack_lite.cpython-312-darwin.so": "a7895a9c0d4afdf3fbbdc2456e016590aa0fbd8d7e203079debee39bd0269b5c",
          "numpy/linalg/tests/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/linalg/tests/test_deprecations.py": "1bbf8088181863e16a54e82ef5ba3428edb78aaa0638ca13d79f0bc174cd1781",
          "numpy/linalg/tests/test_linalg.py": "6f515492be3dd4b0d1a44b8286b0c058f8c6259309808c7fb2df24648201d953",
          "numpy/linalg/tests/test_regression.py": "f436e9a83c0c63d5d1e44be2143d9a310457b10e98edcd6a2421a9e02062db5e",
          "numpy/ma/__init__.py": "5e90d6617c1ab83738f7e20db24e39e43d37530e29eb115db1d58e9f6aedf3b5",
          "numpy/ma/core.py": "f7a05895d83965d6f48f9f858f59f7793c30e1ebcc98ce5a88f80de7a484c828",
          "numpy/ma/extras.py": "ffe5314b5364a723057ecf51d1da2ee21e0473eec10a982e03bf6bef70539417",
          "numpy/ma/mrecords.py": "dde45906ac048640d42df62d51c07c520b5b7161d36b2172b350e484ca3fe425",
          "numpy/ma/tests/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/ma/tests/test_arrayobject.py": "312bc473196c56de1867b9955d4f2afe193033423bc6cc567a312a9d4431ea11",
          "numpy/ma/tests/test_core.py": "dccb4bdc1e2e2a147983147536bd00d568fc442f826dc162ab8824f37f9aded2",
          "numpy/ma/tests/test_deprecations.py": "a842094c9aeffadbc04ad07f46e411967b7b0efaf69f4df8c30f067a45066642",
          "numpy/ma/tests/test_extras.py": "e25c3f3e366a40f0e2f9e7b5d0e80ad533575170b8318d94ad4aa9fbc5002ff6",
          "numpy/ma/tests/test_mrecords.py": "1bd469f1ba0f6b25be5fd17fc31c621d4572a5f9d7b0768b9db69fbecf9271d5",
          "numpy/ma/tests/test_old_ma.py": "2799916c33dcbd8fd954faa180f13273113d38e7cc00e77bba83139396226718",
          "numpy/ma/tests/test_regression.py": "fcebc0baf7033dc77d3cceec75c9c51ac4a6b48cca84f630220e985abd8e4c16",
          "numpy/ma/tests/test_subclassing.py": "97c202e4565f190c9c5f60cb5196605b7a4cc9276a8359e4b2ad00c6c63e3782",
          "numpy/ma/testutils.py": "1d69f3dacc7244e58aedfadcd5a4768183cc36c4d4004e5e4e0b1c8d3268361c",
          "numpy/matlib.py": "e45c9bae995b8123aa7447583e5230d0e40e7b324341fdf00036e687d457b1c5",
          "numpy/matrixlib/__init__.py": "52de88a9f8ee03e930c28e8704e6008058d75c2fe1ed857fdc7c83b0a33bd9d9",
          "numpy/matrixlib/defmatrix.py": "8ce552b26458ede8773335bba3835e1c6793f28d5c83ef29dcaa535a8f645c53",
          "numpy/matrixlib/tests/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/matrixlib/tests/test_defmatrix.py": "f9c8032747bb44ca26691398c26390ff6b35682a650eaf790a3c453caf0de709",
          "numpy/matrixlib/tests/test_interaction.py": "04ca5a008786389e441075aea330627cdf25dc0bf944eea31a868f81dcd38aa4",
          "numpy/matrixlib/tests/test_masked_matrix.py": "ddc3cc6c50ead3e7d414d6823a1ab8c7b81ff9e2ea3bf000f3992fe152339d47",
          "numpy/matrixlib/tests/test_matrix_linalg.py": "93ab686d71478ea6db86cde84e90ae09cc7cee2949c74fb394ea69382cef8fca",
          "numpy/matrixlib/tests/test_multiarray.py": "4b9923cec411d98813d2a206acd3b59540e5de8fa1d0421d83f8375370a7b917",
          "numpy/matrixlib/tests/test_numeric.py": "859fabf76d560c6f0293c2a64faba58329231d4d5068663a829ac2d8e3e8faf8",
          "numpy/matrixlib/tests/test_regression.py": "5e77d9e11a134b8f57314c9494754c73ac1c58898d4636bb0d3d704dd124e36f",
          "numpy/polynomial/__init__.py": "8064b02cda4f0a95df3e08894ac815a15b09d004b573efcc5a518e7a21b9e6c2",
          "numpy/polynomial/_polybase.py": "6f49028938149bc0f9402fcb5929bac8dbf00bbf67a4301e92c2b4bd03dc8824",
          "numpy/polynomial/chebyshev.py": "7689f5b2d3f2413a150889711e988287bc2db7a66cca655acb2d12c56349667d",
          "numpy/polynomial/hermite.py": "9fc3c280cf8cb9e3a154161a878a718e838a18109e2592cb487b00d8c7494fe3",
          "numpy/polynomial/hermite_e.py": "6e8a61a907c03f284d6f0c7436d6eccff8d539aaef935c2d5d7c6a0057e80396",
          "numpy/polynomial/laguerre.py": "eef829ae2523aaba2dbc27130623b68f9e8f7547b0e1ad78e770ccdef810ca25",
          "numpy/polynomial/legendre.py": "d8ca00bf07de32dafb567b8cf134451c0acd15f20bdb0d5044c72b88829cc9af",
          "numpy/polynomial/polynomial.py": "752e5feebd565edbe05d57c803bd8044673671810507bcca922c82778a7e607d",
          "numpy/polynomial/polyutils.py": "68064957a6f465962e2b520a0cf1e188981299757f7948a48d7714a132c7c3b6",
          "numpy/polynomial/tests/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/polynomial/tests/test_chebyshev.py": "1d8e61512fe5729148d0c54df3a6b8d3a35e18c256dd083dc1a2ebbb490a6033",
          "numpy/polynomial/tests/test_classes.py": "eadb9e0004dfc87c01bd0d784e4cc19578491e9b65804d00afce4998fa8b0418",
          "numpy/polynomial/tests/test_hermite.py": "c2f6ab1e3b034bb1ae3147a771a2ea256f34bace8e6642dafb7d8decb01c6f84",
          "numpy/polynomial/tests/test_hermite_e.py": "80e5b7c28e2de60781599ba0c4dd7b108978c140139b4bb255499cf58e489352",
          "numpy/polynomial/tests/test_laguerre.py": "4309d138fdad039ce4745c18d4b1ce83695853b05a1a887e709dff3c45503b99",
          "numpy/polynomial/tests/test_legendre.py": "e7299740487044298f3445ae038ec9fc1a82144ef13716e941d53aaed3e80228",
          "numpy/polynomial/tests/test_polynomial.py": "df44a45dc7b881efc0b9f77bfb1040ba3fad5a5b35777f7ac0b7140fa97b9dca",
          "numpy/polynomial/tests/test_polyutils.py": "01d079423562086d8e725f46ab850b847d4a8fb71e41d911f431cb83ca8eda82",
          "numpy/polynomial/tests/test_printing.py": "1e8c71a0f2586154ffd4378b8c0625369e27e798c6ce63a0a1edf9e91454da78",
          "numpy/polynomial/tests/test_symbol.py": "4a105d360f5cbd8cb7d5f427ae7e20a6b654483d2c873e6bf33946f0212aee0b",
          "numpy/random/__init__.py": "585ce7b73b5454d6a25c2a50967f2dc322fc1d214d4bb5c0589949b105e06ea9",
          "numpy/random/_bounded_integers.cpython-312-darwin.so": "98824c15dbb99837be5f5184c9527881d82cf8c3c2637b46153915df5c6620f0",
          "numpy/random/_common.cpython-312-darwin.so": "8e178d437002b05a0b6ac401eae2dd21b4e76238521e83b504016350081682e5",
          "numpy/random/_examples/cffi/extending.py": "9c60ebc71d04f0bfd8fc28ad63dfe4846213ffe978e382b278d2e011b333b801",
          "numpy/random/_examples/cffi/parse.py": "3caf6f754c709af76716f1f7acea609e7a484b09e277bae2e573a606b316a49c",
          "numpy/random/_examples/numba/extending.py": "67b67f5e9ec73c4e0ae4167b030a59dbdaafb9fb45024be132d357e77b6530cc",
          "numpy/random/_examples/numba/extending_distributions.py": "7dd78f5de523e3ac972b430ad5cb33c541d088e4e236e36cadb66a3f0e00746b",
          "numpy/random/_generator.cpython-312-darwin.so": "82901230f84418c143328f74ce4ec9716044ad43f8a7ea6b146667bccf103f8b",
          "numpy/random/_mt19937.cpython-312-darwin.so": "1d03fcba1629253346ab44b8dcddb2d5a1dc540dd5d1dd5bd4c09de5f01633b3",
          "numpy/random/_pcg64.cpython-312-darwin.so": "79f75456a336b149bfcdd5ee4249ed4aec40c34938c0aabf682e2de48af21639",
          "numpy/random/_philox.cpython-312-darwin.so": "38165d856ef21850a3742bd438d9b990e1ad1784e7c4e381b8fa642729a08b0e",
          "numpy/random/_pickle.py": "2ede3b99afef9e72477674257398d9fc3a811ec74a8b442250d68890c7fde6a0",
          "numpy/random/_sfc64.cpython-312-darwin.so": "0a66ab6722069911b13548318daa4295a20d75a9fc31aee8c1eb135fd5b39fa5",
          "numpy/random/bit_generator.cpython-312-darwin.so": "55ec70de8b9331a9cc154aa202df236b93e8d76eff18f33fcda61790670af945",
          "numpy/random/mtrand.cpython-312-darwin.so": "5c7fe2992282d3917162a8a2e551748d3ff88f39a1e7ace868e5ff181c52928b",
          "numpy/random/tests/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/random/tests/data/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/random/tests/test_direct.py": "179f4a5d033f2079c4cdb8873c4c523e6d608d0d07067044a742dff56f15ff4f",
          "numpy/random/tests/test_extending.py": "d9d4ba1a2cc824a20919e91af45f8e566c0aaa6ce857c1c2c966172b64a64b45",
          "numpy/random/tests/test_generator_mt19937.py": "853efa839354a0358e2d157c953e23e19ca4d4a452730b644c9d38ccad2f9931",
          "numpy/random/tests/test_generator_mt19937_regressions.py": "8e3caec68bcb737757c17f08d3b267d485e68d61869453b974996d8df8925ca3",
          "numpy/random/tests/test_random.py": "91696cad0285f57d9491208a7e8f9120693767e63a001f2792f2efba18db497c",
          "numpy/random/tests/test_randomstate.py": "27973623ecaafa5d2a77b6c336ecf24dccfaa16dc7c35d24a3227a2307211213",
          "numpy/random/tests/test_randomstate_regression.py": "4bdc5733ceed86475af44514af2cb868047a439683534f08e31f45e32480eaa5",
          "numpy/random/tests/test_regression.py": "0000a9c84a80c2e19677493928eecef94773288da3517e837e76ee75d97ffdd9",
          "numpy/random/tests/test_seed_sequence.py": "4ebe1aef37dc7bcc31a1e6d9343fce5751cf063395dc58f0af563fe81c9beaf2",
          "numpy/random/tests/test_smoke.py": "047275f9a9d82939e9371dc7037f59f116489197846125945504bf1414b219c4",
          "numpy/rec/__init__.py": "90d0186284800348b3a545516fed7cb09c3e88ab45ab6465d94e52387de91d13",
          "numpy/strings/__init__.py": "a36ef01d6f2319a51f6c3a294b2126603e918dea37dc0ce4181053816ae5187e",
          "numpy/testing/__init__.py": "12a7be3b1fb7252aa4e904679cf3c52c25bd224aaff4eb890e19e6dae18cdf37",
          "numpy/testing/_private/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/testing/_private/extbuild.py": "a45bbc8e1e26134835cd45a91e03edf2367e2b8178f5e09030ef72b630510557",
          "numpy/testing/_private/utils.py": "b55731515d2b64349472e88dbefbf18b7791e14fb5234c7d0b10f9ece07cbfcc",
          "numpy/testing/overrides.py": "07c63c3e5a6f2bbd48712ba8b9b5d68f82f935598b5529fb58c8352fbc593bc9",
          "numpy/testing/print_coercion_tables.py": "49ba0d9822dce45c95f9447c80a8c97363c8a233755d04ef1f45b30eaef93363",
          "numpy/testing/tests/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/testing/tests/test_utils.py": "adba8f20093d2dfdc1b5ccc891999bd6a367d83d2c79dd333064280442342e3a",
          "numpy/tests/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/tests/test__all__.py": "0176d3f5599149362af5b79b6b87751289bf57d4955d712da6405d116d970aa5",
          "numpy/tests/test_configtool.py": "556d23e06cfce6de7d0c63b0a64918f480f4c923cb918eacf472c20e511fbc32",
          "numpy/tests/test_ctypeslib.py": "9b7265f3ede31613aaee88a81fa61076f9bc09775d4b9ec82a3ca7a666357498",
          "numpy/tests/test_lazyloading.py": "759f87ee3fccef639349f021de5247a6fbdbe64480e943c3c92af1857daea049",
          "numpy/tests/test_matlib.py": "44c76e4861c126e5459a4fff520fe155e183e3e6377f6f06d2d943b7c17b93b7",
          "numpy/tests/test_numpy_config.py": "e8710a0e60e251b4740d0819a1a7b138edf252f0e17344513ec238ea18dc52f4",
          "numpy/tests/test_numpy_version.py": "e8f21e212c7dfc7825a71737cba2ae81e02007878192e642f831655ede0ba1c0",
          "numpy/tests/test_public_api.py": "523ab20ef015e53761f5cbbdaac6fa4ce4f4506fdfa697001aeb58d55cf131cc",
          "numpy/tests/test_reloading.py": "1d4e90b68c6c91dd93749a2012dbff476e46aa4c25c09dd0d43bdf9fde09c166",
          "numpy/tests/test_scripts.py": "95e3d1d12b06e6c4313ef1e61313c798c861740e15b9976d5984c637042b3682",
          "numpy/tests/test_warnings.py": "ceae4bf7a8d36440e56af7eac44db442188cfd72e9f7b68e8741455a2550f482",
          "numpy/typing/__init__.py": "6e4a28e8b4a221250cb6f4c6423f568c439da1c1a236e7563dff818675b0f82a",
          "numpy/typing/mypy_plugin.py": "efe6277d69ebd6b47e48440c42f188b3bdd9e410cf7282af3f2d89a80f50411e",
          "numpy/typing/tests/__init__.py": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "numpy/typing/tests/data/pass/arithmetic.py": "9d9a0cb388e2cfc241b4ea129bdfc5dddc2c35d856e3a092b3b4773116bb3196",
          "numpy/typing/tests/data/pass/array_constructors.py": "4cd70c920f5be437b39e6eaae88830eeb0e9c195c80e4bff9a396d2e72382bed",
          "numpy/typing/tests/data/pass/array_like.py": "3b611860e7c16b938036e6b0ae30ba189f6badebbcf847be41233b3ae779f29a",
          "numpy/typing/tests/data/pass/arrayprint.py": "cbf2a4b8bcf5b8cee9bf9dea7eaec640ebae7782e85c4ddaa4ad70b4045d5723",
          "numpy/typing/tests/data/pass/arrayterator.py": "1ba0dd34451d24640d262bcf8a67296712477ecd24a34849d2b5cbe180f9db14",
          "numpy/typing/tests/data/pass/bitwise_ops.py": "f9fde6c9e248b548e83b40895c1c080f0620e2160286c0cd2bbad256970ca4c5",
          "numpy/typing/tests/data/pass/comparisons.py": "ad95d91ea062a5fd77b663a51fb4950a70e3a101ac9284e89c3c585a7e9659b2",
          "numpy/typing/tests/data/pass/dtype.py": "603b9801bd282a825cf5e3a7289ba83df2db20a3a011d134e3f098c514b85392",
          "numpy/typing/tests/data/pass/einsumfunc.py": "7978f92f93163ed40782b1cfb09dfaaaaae6047a9cb7d528ba38c90af1e71759",
          "numpy/typing/tests/data/pass/flatiter.py": "e857625daade8a3b3ebbb453e6211630364a1b6f48ec39e5de94ebd313010cee",
          "numpy/typing/tests/data/pass/fromnumeric.py": "77f8552f2ad50c53d5c77ddaa8b23200661843c5c0245233ac0b04f100a8a1fe",
          "numpy/typing/tests/data/pass/index_tricks.py": "2047759dd5e6c0f092dc46b332570fec5a9cd1fb28e1227756e93b77f51e7cbd",
          "numpy/typing/tests/data/pass/lib_user_array.py": "88f7a448def9fec56130f35928e9452d6d61f0cb3699803eb3277f91e5aeb3fe",
          "numpy/typing/tests/data/pass/lib_utils.py": "6e3d6c100e20b267b3a9b61da8a9d5b4acd8fdf6fae30ecf12867036f69a51d0",
          "numpy/typing/tests/data/pass/lib_version.py": "1e7b863b1eed400fdb731148277751a0c011d1fa1c931838946a90e20ecb188c",
          "numpy/typing/tests/data/pass/literal.py": "37555548a60e053a4ed48a3bf3f3e3cbd7b752971fc2ef830ff70d7f59b26ef4",
          "numpy/typing/tests/data/pass/ma.py": "cbdd1e782bcecdce0986bc0cdce3c1bf63ecf847311cbccb3acc7f4042ea8e94",
          "numpy/typing/tests/data/pass/mod.py": "3c08ed41a054b10b7eec778b66d7dd99749f2e8a2d70b391e04f99c2d19b9147",
          "numpy/typing/tests/data/pass/modules.py": "83d3e1c8b3baadf9581d9b66af2c755564ee6e984de1300f5127e8898ae24ea1",
          "numpy/typing/tests/data/pass/multiarray.py": "70e6cc286f4239fb3657d6f605edb9357f2cd00e99e85935a5e3c01637b27d4c",
          "numpy/typing/tests/data/pass/ndarray_conversion.py": "628e2a64e5ecf59907c4ea840e76ec0e8d955c5e04d84fd1645b9ddadf7e4665",
          "numpy/typing/tests/data/pass/ndarray_misc.py": "584c82c8a0636c3e2aa5aa091801e9d6d8612c290765310fd330b02da0960b5b",
          "numpy/typing/tests/data/pass/ndarray_shape_manipulation.py": "b2bfcab9e1c58e0f5a3be2723b759bef6d86b3f3ae5d5b0bd5ae47931d776c02",
          "numpy/typing/tests/data/pass/nditer.py": "9d83b8e4bc3764d6d0abbe5586df3acf32d9e1c5b33f79a5d2bc433e562df3ff",
          "numpy/typing/tests/data/pass/numeric.py": "8316f301067ff37a1cf42690a2ed836906471d6545242ab4a095f012f6b3ec67",
          "numpy/typing/tests/data/pass/numerictypes.py": "eb1e9e37dfb936c49051273aadfddf622792da9a18118d2dfee8dbc2017d4b94",
          "numpy/typing/tests/data/pass/random.py": "20c1c5194cb618bcc9706933e80e9b60d6273b9c9f2ebd0866a97e7043573ec0",
          "numpy/typing/tests/data/pass/recfunctions.py": "59202eacc00b5afcfce79f6312f180678a05cf78acae06eaec076e9721ea6fa0",
          "numpy/typing/tests/data/pass/scalars.py": "a0191df4817c472a35c64ef49b1e6aec5aef369d3bc07695abd2459307272509",
          "numpy/typing/tests/data/pass/shape.py": "183bf5ebf19372f8610cc4c1ac616f786aa9abd1caa3ec9b1a8d1bff1734ddda",
          "numpy/typing/tests/data/pass/simple.py": "df82747cd198bd947a582ac29c222aeafd70df9edde7e91f632a23e792c9d5b0",
          "numpy/typing/tests/data/pass/ufunc_config.py": "bb35ce84297d3782cf57d855d88aa0fec92090a31b04f045d065cf53d10c7ae1",
          "numpy/typing/tests/data/pass/ufunclike.py": "dc11ed2711b286ac749a09413f2c287c2dcf62c293b87861ac663d66bbf04796",
          "numpy/typing/tests/data/pass/ufuncs.py": "d517a6fe07849b8ab20f75da440d4d00f2b0af762346aebccdb2250bf5e18bd3",
          "numpy/typing/tests/data/pass/warnings_and_errors.py": "1132d99034c6a59b29bf08d56006659c0d601f83c9e1b498e4f916cb14e3bac5",
          "numpy/typing/tests/test_isfile.py": "f414d37643a906fbdea52fcd5a11de8e7bface9ac06fe62844cac4ee43885c14",
          "numpy/typing/tests/test_runtime.py": "b38929505b6cb64becb248604c3cbf4cc5c935c3b72a05027c151b1596b44297",
          "numpy/typing/tests/test_typing.py": "a9dd97f56f4319577c42660e2fa2e27a85afa9d6b70b508308f73d2422979e54",
          "numpy/version.py": "2a6201cf5d41c1ddefd7d267a6499a268770a3addb258945fa06b793621028e6"
        }
      }
    },
    "python": "3.12.9 (main, Feb 12 2025, 15:09:19) [Clang 19.1.6 ]",
    "sha256": "29a5611e903ad0d0630c647b5eede33125c3c24b190f8e8a6ef6cbc699b08b19"
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 38013812736,
    "swapins": 52,
    "swapouts": 2908,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   366576.\nPages active:                                1010091.\nPages inactive:                               965512.\nPages speculative:                            125125.\nPages throttled:                                   0.\nPages wired down:                             178944.\nPages purgeable:                                2295.\n\"Translation faults\":                     2143798403.\nPages copy-on-write:                       113934007.\nPages zero filled:                        3441336355.\nPages reactivated:                         185949357.\nPages purged:                               13165257.\nFile-backed pages:                           1951308.\nAnonymous pages:                              149420.\nPages stored in compressor:                   927958.\nPages occupied by compressor:                 437541.\nDecompressions:                            110214610.\nCompressions:                              125212397.\nPageins:                                  2521119388.\nPageouts:                                     502929.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 124521.\nPages tagged resident:                         78986.\nPages tagged compressed:                       45535.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5192.\nPages tag-storage free:                         1808.\nPages tag-storage non-tag pageable:            91296.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7450176.\nTagged compressions:                          829064.\nTagged decompressions:                        687727.\n"
  },
  "memory": {
    "current_bytes": 656245768,
    "lifetime_peak_bytes": 656245768,
    "rss_peak_bytes": 519766016
  },
  "rows": 262144,
  "shape": [
    262144,
    2,
    32
  ],
  "dtype": "F32LE",
  "bytes": 67108864,
  "prefix_rows": 2054,
  "prefix_sha256": "8914caa7d89a1f8a0038fc6c74933c46a3d56424767d3c30057dd4f5e61431b7",
  "table_sha256": "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a",
  "full_duplicated_fp32_sha256": {
    "cosine": "546b64f8e1800f128ccc02056430c0eca4e540a84591531d42ee05a7b7d09b27",
    "sine": "d3f305e44f0a0abd5c54b6c7096a59544c5b30b9e59f6680de1d90459c2e3f8c"
  },
  "qualification": "unproven",
  "scope": "Pinned coefficient component only; native contexts remain independently bounded and unqualified."
}
````

### 143b575-complete-ci-v1.json

Original bytes: 905. SHA-256: `a483a6964f0cc556e16407723b8a6ab0902359165390d64f7de5687d19ef2c37`.

Normalized bytes: 905. SHA-256: `a483a6964f0cc556e16407723b8a6ab0902359165390d64f7de5687d19ef2c37`.

````text
[
  {
    "conclusion": "success",
    "headSha": "143b575870ae2a1580beda2e70f0f3a72f75f5f7",
    "name": "ci",
    "status": "completed",
    "url": "https://github.com/carloslfu/slotstream/actions/runs/37149689995"
  },
  {
    "conclusion": "success",
    "headSha": "143b575870ae2a1580beda2e70f0f3a72f75f5f7",
    "name": "sevra-mac",
    "status": "completed",
    "url": "https://github.com/carloslfu/slotstream/actions/runs/37149689936"
  },
  {
    "conclusion": "success",
    "headSha": "143b575870ae2a1580beda2e70f0f3a72f75f5f7",
    "name": "context-proxies",
    "status": "completed",
    "url": "https://github.com/carloslfu/slotstream/actions/runs/37149689976"
  },
  {
    "conclusion": "success",
    "headSha": "143b575870ae2a1580beda2e70f0f3a72f75f5f7",
    "name": "docs",
    "status": "completed",
    "url": "https://github.com/carloslfu/slotstream/actions/runs/37149689930"
  }
]
````

### vq-context-functional-v1/catalogue/stdout.txt

Original bytes: 3450838. SHA-256: `cb02701ef9bb9f8f0de9372bf230ddd73ded7743fadca68470b40b017813124f`.

Normalized bytes: 3450838. SHA-256: `cb02701ef9bb9f8f0de9372bf230ddd73ded7743fadca68470b40b017813124f`.

````zlib-base64
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
KWkKhXN8tXWfffQvpFwUN8acuncip29zmL95sbMmVwTsMbg9OWr0lrWuxrbGq9M21kX71xhdn4vP
CJ7CRvvxviurLx6o/93f/90/nbQ/Xob2LSs7OyFqPCH61pizn6NNvCmbIjdb0/Eh+1tTG7JvQziy
fuM4PTpNR40QF1vFfTo/4qwukcZHnvkjL3gsMF4cGC8JjMcD44nAeDIwnvKNN77ltLexb/ht5xcx
5BbD5sPzx66vh+umybad+adqWzoe+J/98vH55A/h155TLuHOuthXd4cE7P3QWh5GuKgwf/mIsqbJ
PpwaeWj6+wBHh66KYtOas9PpLdeeUl7vP0LXiwdCLzbv8FMvts1Ue0DU0e/i6B9iIaP/aP6yiorv
Wd6Zh/luG61LVy84DonC0BjZdB97x7lUf1luEke/09E/MJlo/pdgCx9VkfwvwJAV138Jmpidwlbx
M7vXcCuq3Si9c7HnNuPkWk9uR/zkclzv9We15PhYZHKy25/VmPEqV95faj/Wg9027GYIwyBH3z3t
3g+7aJiHcAqUeDclCWVK7N2U2Lspw3cFhpvit/WhGe75N9vDVvzsLfjl3gNSUb6+df6gLm/AN3+X
Na+H9+HF2eHipH1T1k3ZfXhBfG3qw943pv3Iw0s/sNHuzeKZ4/6fjlXv/qiX5U3dtuOFIN/KTffm
KOb989//4+/6T0wMSJPLmrbZe7n7OJdyHU2Z9eZs4p9/+mKfsXm9O7xXrc2q91nZtOwY2s15t+0y
ewNL3QVBjsmQE9/ITWEv3G6PH/cYL5fppzvaT/e9V8o+GaHx35vQMR30pwc/nQdzsgDMyQIw/wzA
f1Hua4+2RP57Czqmg/704KfzYG0fpn11PLwL/zJ2TIj96cTPfozr6/A057gzdEwH/enBT3+SC+3C
t7FjQuxPJ372w1xIH+Z0YZh/huG/2PNccBe+iR0TYn868fMf6UJ68a+Ax5TgfwF+/KVoquJ4acER
7lCdXrSeezcuprt5yIFd62cWchguHa9v6G+uGVrzxu6mGvayq6tmrqHa8vW9LjfWjWxUssjv9hpO
Ezv2ZWXfm/n9R/dmYth//v3/4+ozEMM9FTNgV9/EsbugrF5f+u1gX04cLwRq37K9u+n0orETB/1N
KlVemqW6vWR/9/skdjiuI1j80r/DWXfWsrxu7ZgFBXQ44HHw+hgF9sbm4bPpx/fFbq9CaBYBOLRd
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
aQyTmiCGKU4awxQniGF6RRrD9IoghmnSmr47+CU2p6Q1fXfwC2zWK9Kavjv4RTaT1vTdwS+xmZHW
9N3BL7KZtKbvDn6JzTFpTd8d/BKbE9Kavjv4RTaT1vTdwS+xmZPW9N3BL7FZkNb0tSCo6WtBWtPX
gqCmryVpTV9Lgpq+VqQ1fa0Iavpakdb0tSKo6WtNWtPXmqCmrzVpTV9rgpq+Tklr+jolqOmnK9Ka
froiqOmnK9KafroiqOmnjLSmnzKCmn4ak9b005igpp/GpDX9NCao6acJaU0/TQhq+iknremnnKCm
n3LSmn7KCWr6qSCt6aeCoKafStKafioJavqpJK3pp5Kgpp8q0pp+qghq+qkiremniqCmn2rSmn6q
CWr6aUpa009Tgpp+mpLW9NM0fE1frlaUNX2H8EtsZpQ1fYfwi2ymrOk7hF9ic0xZ03cIv8TmhLKm
7xB+kc2SNIYlkiCG8YQ0hvGEIIbxlDSG8ZQghglJGsOEJIhhMiaNYTImiGFSk8YwqQlimBKkMUwJ
ghimGWkM04wghmlNGsO0JohhKSeNYWn4mr5kK8qavkP4RTZT1vQdwi+xmVHW9B3CL7E5pqzpO4Rf
ZDNlTd8h/BKbk5g0hiUxQQxLUtIYlqQEMYwL0hjGBUEMEzFpDBMxQQwTmjSGCYKaPpOkNX0mCWr6
TJHW9JkiqOkzRVrTZ4qgps80aU2faYKaPktJa/osJajps5S0ps9Sgpp+vCKt6TuG/6XrcYPGjGS1
WjHaO3I9UFhqO9m9sR4oLLad6gzrgcJS28nukfVAYbHtKfl+D3yn7BmY7F5ZDxSW2k52v6wHCott
1+SxLvBds2dgsvtmPVBYajvZvbMeKCy2XZHHusB30J6A6e6h9UBhqe1k99F6oLDYdpmS2y5pYh3d
/bQeKCy2PVXktqdEsY7svloPFJbaTnZvrQcKi23X5LEu8B22Z2Cye2w9UFhqO9l9th4oLLZdk8e6
wHfbnoHJ7rf1QGGp7WT33HqgsNh28vp86Dtvz8Bk9956oLDQdrr7bz1QWGw7eW8i9F24Z2BG3psI
fSfuBJi8NxH6btwzcEzemwh9R+4ZOCHvTYS+K3cCTN6bCH1n7hmYk/cmQt+dewYW5L2J0HfoToDJ
exOh79I9A0vy3kToO3XPwIq8NxH6bt0JMHlvIvQdu2dgTd6bCH3X7gSYvDcR+s7dM3BK3psIfffu
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
5S8F5fKXgnL5S0G5/KWgXP5SUC5/KSiXvxSUy18KyuUvBeXyl4J6+UtBvfyloF7+UlAvfymol78U
1MtfCurlLwX18peCesFLQVz+WUFc/llBXP5ZQVz+WUFc/llBXP5ZQVz+WUFc/llBXP5ZQVz+WUFc
/llBXP5ZQVz+WUFc/llBXP5ZQVz+WUFc/llBXP5ZQVz+WUFc/llBXP5ZQVz+WUFc/llBXP5ZQVz+
WUFc/llBXP5ZQVz+WUFc/llBXP5ZQVz+WUFc/llBXP5ZQVz+WUFc/llBXP5ZQbn8s4Jy+WcF5fLP
CsrlnxWUyz8rKJd/VlAu/6ygXP5ZQbn8s4Jy+WcF5fLPCsrlnxWUyz8rKJd/VlAu/6ygXP5ZQbn8
s4Jy+WcF5fLPCsrlnxWUyz8rKJd/VlAu/6ygXP5ZQbn8s4Jy+WcF5fLPCsrlnxWUyz8rKJd/VlAu
/6ygXP5ZQbn8s4Jy+WcF5fLPCsrlnxXUKzwsqFd4WlCv8LigXuF5Qb3CA4N6hScG9QqPDOoVnhnU
Kzw0qFd4alCv8NigXuG5Qb3Cg4N6hScH9QqPDuoVnh3UKzw8qFd4elCv8PigXuH5Qb3CA4R6hScI
9QqPEOoVniHUKzxEqFd4ilCv8BihXuE5Qr3Cg4R6hScJ9QqPEuoVniXUKzxMqFd4mlCv8DihXuF5
QpR1habC//WicY0XLdd40XqNF23XeNF+jRcd13jReY0XveTFIa5xcYhrXBziGheHuMbFIa5xcYhr
XBziGheHuMbFIa5xcSjXuDiUa1wcyjUuDuUaF4dyjYtDucbFoVzj4lCucXEo17g41GtcHOo1Lg71
GheHeo2LQ73GxaFe4+JQr3FxqNe4OFzmmcM9Gn332RY+XY7aRa4Nn1/ioi/5L/yYcfkfM67wY5bL
/5jlCj9mvfyPWa/wY7bL/5jtCj9mv/yP2a/wY47L/5jjCj/mvPyPOa/wY67L/5gXGw+e/4fnlx4P
LvWS/8KPGZf/MeMKP2a5/I9ZrvBj1sv/mPUKP2a7/I/ZrvBj9sv/mP0KP+a4/I85rvBjzsv/mPMK
P+a6/I95sfEg/kO59HhwqZf8F37MuPyPGVf4Mcvlf8xyhR+zXv7HrFf4Mdvlf8x2hR+zX/7H7Ff4
Mcflf8xxhR9zXv7HnFf4Mdflf8xLveTnP9z14dnN4+ueIj8+/uWw+48Cvt7b29/ffHz1x9vPL+xe
6O3pg3x/e/fxzz/a65tf3336eP7fmD//bKdXePijf+AFv/kRf3n39t2nuw9f/9Dbs59vPr0+/8s8
pN7/2cdz/UGybz8z+TN8+zpn/yG+/N29P9z++tOPH97fvD3z38DL/Ovm3/9539c//fi/Pt28/fj4
hwCfvXp5/yftP/767M2rD29uPr745cyv+fCb+j/f/e7Z82c3v3t3d7qU/M93r97evnz2u/sXO89r
fF4Iz8+5FL59k/d/rPHNq9M7//Dpdx/u/zLt24+PW98zf0ShP6K4+EcUZ/6Iqv6I6sU/onqmPzD6
jw9//Pf3z+7/LO/P92PWi5u393+T93e3z+7/3PWf7l59/Hh7pj+J+f7T715/+cubdzenu+rnv9H6
5XXu/8bx6aV/Of2PXt7ev6sz/jXOb1/6xbvXr199uP9Pf/4L3l8/h3Mel3n14Q8//Pzp9esvv333
f735FPHijH9k9MtL/N39n4R99fbPf0D1zz/v2V/p8ffzw4u7h9/Ql6ff/Bcf3939evrFfHP6t3x5
9hf8Ovl/vtF9/VX99OH+z5yf6y76+Lea3T/W15fg/1jfvNJl/rG+ecFL/GM9fGAffnH/VI8vwP+h
vr7OZf6Zvr7cJf6RPpy2My9uf3jxy8Nf/mb/VP/kZfg/2F+82mX+2f7iRS/yj3f6KU4/2Je/w33a
Pj7+Hfuvg/79n7q//9+d5/VO/+23p3+nb17SvM5p1Hi487+5efvq59OQceZ9y+9v3725/Xj690f5
nx9GoPB3Dx/O/z595P/XC5zGwZ9PvxCnuezFaTd4pp/l8R/6w69vXr96+4cz/zCPl52Xn+7up7p/
8kffT1PfH09z9AdwOX/34eMPD+P5m08fb75ZLp8f63y9LJ1x//GX+4Ivr/fh483r+3+v06Xp1fvT
Yv7yL/j3P/34D/+2V378T//jy3/5b9/c3nz4dLqw3X929//1//M3f/MXb/Kb36XTxeLN49OCH97f
vPjD7csf/uLh3z/3wo9JX37Uvz1tCt48vNZ//7ftme7e/enD6SP4ePPq/pM/fSwf7n953929vL07
03Xq1elH+fjNxuF+b/bi5sXpX/f3t29v7874y3TaiL24ff369P4fX/RxZ/Z4Ez/jFvk0up1+Qb78
5tw/2bm7fwb54WzPH1+9fbyMfN4t/+nmw+lmda6VfnPaYP188+qbD+pP7+7+cLqUPd6dz/qv8XlR
v7w7/YKdPqnTZeXXZ+/+dP+b9/k187XytfK18rXytfK18rXytc7wRO328XvbD7c3b+5ns9s7MtKc
Nvzv70fn97cPu/D/9Pf/5b/910vvE97+/u7mzQ+n2frn29P+6IfP05zZL/znv//P/3BPX7x49+m0
czrTV3JfQt+/e3+ur7D+6fuM87/PIt5nOf/7rOJ91vO/zybeZzv/++ziffbzv88h3uc4//uc4n3O
87/PJd7nOv/73OJ9bnCdf04u9OKOZG5J4J4U5KYU4K4U5LYU4L4U5MYU4M4U5NYU4N4U5OYU4O4U
5PYU4P4U5AYV4A4V5BYV4B5VyD2qgHtUIfeoIvZNZuME7lGF3KMKuEcVco86d+rDg5/zRt6+ef/x
1zP/7K9vb+5++vHu9tOH2zMmT/HIZIrnG1M8jJjiycEU2/wp9uRTbKDn+TfQU2yg5/k30FNsoOf5
N9BTbKAn2EBPsoGeYAM9yQZ6gg30JBvoCTbQk2ygJ9hAT7KBnmADPckGeoIN9CQb6Ak20JNsoCfY
QE+ygZ5gAz3JBnqCDfQkG+gJNtCTbKAn2EBPsoGeYAM9yQZ6gg30JBvoL++U3KMKuEcVco8q4B5V
yD2qgHtUIfeoAu5RhdyjCrhHVXKPquAeVck9qoJ7VDXPjsA9qpJ7VAX3qEruURXcoyq5R1Vwj6rk
HlXBPaqSe1QF96hK7lEV3KMquUdVcI9q5B7VwD2qkXtUA/eoRu5RDdyjmvnSBNyjGrlHNXCPauQe
1cA9qpF7VAP3qEbuUQ3coxq5RzVwj2rkHtXAPaqTe1QH96hO7lEd3KM6uUd1cI/q5B7VwT2qm9MC
Z04992GZjPwOI899PGqy41GVVMoqKYBVUteqpFxVSRWqkuJSJTWjSkpBlVR4KincVNOOqabKUk3v
pJqSSDWNjmrqF9V0JaopNlTTQqimMlDN+f5qDuNXc3K+mmPu1ZxJ/ybWrLJiVlkxq6yYVVbMKqvn
XmVn/4b1txUKvgz+JhZNylV8su27DQVfCX8Ta66xdYhPdn63oeCL4W9izS2mbvDJtuffbSj4evib
WHOLaUV8svW7DQVfEn8Ta24xrYtPdny3oeCr4m9izS2mLfHJ7u82FHxh/M3jY3OL6WLH1ct3Gwq+
Nv4m1txiuthx9f7dhj5+qijW3GK62HH19d2GPn6qKNbcYobYcY34bkMfP1UUa24xQ+y4RvtuQx8/
VRSLzhSIHdeY323o46eKYs0tZogd13z+3YY+nqtBseYWM8WOa9bvNvTxU0Wx5hYzxY5rju829PFT
RbHmFjPFjmvu7zb08VM1scvcYpbYca3y3YY+fqoo1txilthxrf7dhj5+qijW3GKW2HGt9d2GPn6q
KNbcYrbYce34bkMfP1UUa24xW+y4dvtuQx8/VRRrbjFb7Lj2/G5DHz9VFIvaV2LHFc+ff8epXwpo
KhdV0J4X8unW7zj1yyerclEP73knn+74jlO/fLIqF5URny/y6e7vOPXLJ4tyWe9Z7MQiynec+uWT
VbnorhONfLr9O0798smqXHTXiUk+3fUdp375ZFUuuusUsjMr8R2nfvlkVS666xSyMyvtO0798smq
XHTXKWRnVuZ3nPrlk1W56K5TyM6MqBi/ldQvvpPKRXedSnZmxMb4raR++WRVLrrrVLIzI0LGbyX1
yyerctFdp5KdWd3fceqXTxblIi0jGtmZES3jt5L65ZNVuQqYJDszYmb8VlK/fLIqF911GtmZETnj
t5L65ZNVueiu08nOjPgZv5XUL5+sykV3nU52ZkTR+K2kfvlkVS6663SyMyOWxm8l9csnq3LRXaeT
nRkRNX4rqV/4dJWL7jqD7MyIq/FbSf3yyapcdNcZZGdGdI3fSuqXT1blorvOIDuzsb/j1C+fLMpF
0kZMsjMj0sZvJfXLJ6ty0V3n7ODGuf+qWWZmZmZmZmZmZmZmZmb++8k895+rfZhrzd+rHe25+IO1
38SGiS0mtprYZmK7iR0mdprYZWI3Wg5qmaF1FmihBVppgZZaoLUWaLEFWm2Bllug9VbQeivqvobW
W0HrraD1VtB6K2i9FbTeClpvBa23itZbReutqkESrbeK1ltF662i9VbReqtovVW03hpabw2tt4bW
W1M7N7TeGlpvDa23htZbQ+utofXW0XrraL11tN46Wm9dPSpB662j9dbReutovXW03gZabwOtt4HW
20DrbaD1NtSzSbTeBlpvA623gdbbROttovU20XqbaL1NtN4mWm9TfRmA1ttE622i9bbQeltovS20
3hZabwutt4XW20Lrbalv39B6W2i9bbTeNlpvG623jdbbRutto/W20XrbaL1t9XU3+75bfeH9XH3j
/Vx95f1cfef9XH3p/Vx96/1cfe39XH3v/Vx98f1crTx31EStPHbYhJ02YcdN2HkTduCEnThhR07U
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
cagO4lAdxKE6iEN1EIfqIA7VQRyqgzhUB3GoDuJQHcShOohDdRCH6iAO1UEcqoM4VAdxqA7iUB3E
oTqIQ3UQh+ogDtVBHKqDOFQHcagO4lAdxKE6iEN1EIfqIA7VQRyqgzhUB3GoDuJQHcShOohDdRCn
6iBO1UGcqoM4z99BvH8sPc/fQMzYjM3YjM3YjM3YjM3YjM3YjM3YjM3YjM3YjM3YjM3YMz0YZsFd
BQ8VPFXwUsHqmxNlyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1l
yE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE31dxCn6iBO1UGcqoM4VQdx
qg7iVB3EqTqIU3UQp+ogTtVBnKqDOFUHcaoO4lQdxKk6iFN1EKfqIE7VQZyqgzhVB3GqDuJUHcSp
OohTdRCn6iBO1UGcqoM4z99BfHgsff4GYsZmbMZmbMZmbMZmbMZmbMZmbMZmbMZmbMZmbMZmbMae
6cEwC1bfnChDbipDbipDbipDbipDbipDbipDbipDbipDbipDbipDbipDbipDbipDbipDbipDbipD
bipDbipDbipDbipDbipDbipDbipDbipDbipDbipDbipDbipDbipDbilDbilDbilDbj2vKrip4K6C
hwqeKnipYLXyVAdxqQ7iUh3EpTqIS3UQl+ogLtVBXKqDuFQHcakO4lIdxKU6iEt1EJfqIC7VQVyq
g7hUB3GpDuJSHcSlOohLdRDX+TuI94+l1/kbiBmbsRmbsRmbsRmbsRmbsRmbsRmbsRmbsRmbsRmb
sRl7pgfDLFh9c6IMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUM
uaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuaUMuTXUylMd
xKU6iEt1EJfqIC7VQVyqg7hUB3GpDuJSHcSlOohLdRCX6iAu1UFcqoO4VAdxqQ7iUh3EpTqIS3UQ
l+ogLtVBXKqDuFQHcakO4lIdxKU6iEt1ENf5O4gPj6XP30DM2IzN2IzN2IzN2IzN2IzN2IzN2IzN
2IzN2IzN2IzN2DM9GGbB6psTZcgtZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZcht
ZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZchtZcht
Zcjtqlae6iBu1UHcqoO4VQdxqw7iVh3ErTqIW3UQt+ogbtVB3KqDuFUHcasO4lYdxK06iFt1ELfq
IG7VQdyqg7hVB3GrDuJWHcStOohbdRC36iBu1UHcqoO4z99BvH8svc/fQMzYjM3YjM3YjM3YjM3Y
jM3YjM3YjM3YjM3YjM3YjM3Y8zwYdsHqmxNlyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1l
yG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1lyG1l
yG1lyG1lyG1lyO2tVp7qIG7VQdyqg7hVBzGeqxLiKTlYcmHJlSU3ltxZ8mDJkyUvlszWYLA1GGwN
BluDwdZgsDUYbA0GW4PB1mCwNRhsDRa2Bgtbg4WtwfN3E+8fV59yW+ZmbuZmbuZmbuZmbuZmbuZm
buZmbuZmbuZmbuZmbub++8r9+mTZJbPvYAr7Dqaw72AK+w6msO9gKvsOprLvYCr7Dqay70ErW4OV
rcHK1mBla7CyNVjZGmxsDTa2Bhtbg42twcbWYGNrsLE12NgabGwNNrYGO1uDna3BztZgZ2uwszXY
2RrsbA12tgY7W4OdrcHB1uBga3CwNTjYGhxsDQ62Bgdbg4OtwcHW4GBrcLI1ONkanGwNTrYGJ1uD
k63BydbgZGtwsjU42RpcbA0utgYXW4OLrcHF1uBia3CxNXj+buTn59rnr0ZmbuZmbuZmbuZmbuZm
buZmbuZmbuZmbuZmbuZmbuZm7nVzvz5ZdsnsO5jNvoPZ7DuYzb6D2ew7mM2+g9nsO5jNvoPZ7HvQ
zdYgc/KCOXnBnLxgTl4wJy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5wZy8
YE5eMCcvmJMXzMkL5uRFYWuQ9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD
9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9SSD9STj/D3Jh+facf6WZOZmbuZm
buZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZeN/frk2WXzL6DYU5eMCcvmJMXzMkL5uQFc/KCOXnB
nLxgTl4wJy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5wZy8YE5eMCcvmJMX
zMkL5uQFc/KCOXnBnLxgTl4stgZZTzJYTzJYTzJYTzJYTzJYTzJYTzJYTzJYTzJYTzJYTzJYT7Kw
nmRhPcnCepKF9SQL60kW1pMsrCdZWE+ysJ5kYT3JwnqShfUkC+tJFtaTLKwnWc7fk3x4rl3O35LM
3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3Ovmfn2y7JLZdzDMySvMySvMySvMySvMySvM
ySvMySvMySvMySvMySvMySvMySvMySvMySvMySvMySvMySvMySvMySvMySvMySvMySvMySvMySvM
ySvMySvMySvMySvMySvMySvMySvMySvMySudrUHWkyysJ1lYT7KwnmRhPcnCepKF9SQL60kW1pMs
rCdZWE+ysJ5kYT3JwnqShfUkC+tJFtaTLKwnWVhPsrCeZGE9ycJ6koX1JAvrSRbWkyysJ1lYT7Kc
vyf5+bn2+VuSmZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mXvd3C9PlmEy+w6GOXmFOXmF
OXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmVOXmVOXmVOXmV
OXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXk12BpkPcnKepKV9SQr60lW1pOsrCdZ
WU+ysp5kZT3JynqSlfUkK+tJVtaTrKwnWVlPsrKeZGU9ycp6kpX1JCvrSVbWk6ysJ1lZT7KynmRl
PcnKepKV9STr+XuSD8+16/lbkpmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZl73dyvT5Zd
MvsOhjl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5
lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5dbI1yHqSlfUkK+tJ
VtaTrKwnWVlPsrKeZGU9ycp6kpX1JCvrSVbWk6ysJ1lZT7KynmRlPcnKepKV9SQr60lW1pNsrCfZ
WE+ysZ5kYz3JxnqSjfUkG+tJtvP3JB+ea7fztyQzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3Mz
N3Mz97q5X58su2T2HQxz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz
8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8hpz8lpj
a5D1JBvrSTbWk2ysJ9lYT7KxnmRjPcnGepKN9SQb60k21pNsrCfZWE+ysZ5kYz3JxnqSjfUkG+tJ
NtaTbKwn2VhPsrGeZGM9ycZ6ko31JBvrSTbWk2zn70l+fq59/pZk5mZu5mZu5mZu5mZu5mZu5mZu
5mZu5mZu5mZu5mZu5l439+uTZZfMvoNhTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5j
Tl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5nTl5nTl5nTl5nTl5n
Tl5nTl5nTl5/PlnyYslsDbKeZGc9yc56kp31JDvrSXbWk+ysJ9lZT7KznmRnPcnOepKd9SQ760l2
1pPsrCfZWU+ys55kZz3JznqSnfUkO+tJdtaT7Kwn2VlPsrOeZD9/T/LhuXY/f0syczM3czM3czM3
czM3czM3czM3czM3czM3czM3czM3c6+b+/XJsktm38EwJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68z
J68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68zJ68z
J68zJ68zJ68zJ68zJ68zJ69PtgZZT7KznmRnPcnOepKd9SQ760l21pPsrCfZWU+ys55kZz3JznqS
nfUkO+tJdtaT7Kwn2VlPsrOeZGc9yc56kp31JDvrSXbWk+ysJ9lZT7KznmRnPcl+/p7kw3Ptcf6W
ZOZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZeN/fxybJMDpZcWHJlyY0ld5Y8WPJkyYsl
q+9BB3PyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPyBnPy
BnPyBnPyBnPyBnPyBnPyBnPyBnPyRmVrkPUkB+tJDtaTHKwnOVhPcrCe5GA9ycF6koP1JAfrSQ7W
kxysJzlYT3KwnuRgPcnBepKD9SQH60kO1pMcrCc5WE9ysJ7kYD3JwXqSg/UkB+tJDtaTHOfvSX5+
rn3+lmTmZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mXjf365Nll8y+g2FO3mBO3mBO3mBO
3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO
3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3mBO3thqDU7Wk5ysJzlZT3KynuRkPcnJepKT9SQn
60lO1pOcrCc5WU9ysp7kZD3JyXqSk/UkJ+tJTtaTnKwnOVlPcrKe5GQ9ycl6kpP1JCfrSU7Wk5ys
JzlZT3Kevyf58Fx7nr8lmbmZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7nXzf36ZNkls+9g
mJM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3
mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3mZM3B1uDrCc5WU9ysp7kZD3J
yXqSk/UkJ+tJTtaTnKwnOVlPcrKe5GQ9ycl6kpP1JCfrSU7Wk5ysJzlZT3KynuRkPcnJepKT9SQn
60lO1pOcrCc5WU9ysp7kPH9P8vNz7fO3JDM3czM3czM3czM3czM3czM3czM3czM3czM3czM3czP3
urlfnyy7ZPYdDHPyJnPyJnPyJnPyJnPyJnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPy
FnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyFnPyVmFrkPUk
F+tJLtaTXKwnuVhPcrGe5GI9ycV6kov1JBfrSS7Wk1ysJ7lYT3KxnuRiPcnFepKL9SQX60ku1pNc
rCe5WE9ysZ7kYj3JxXqSi/UkF+tJLtaTXOfvST48117nb0lmbuZmbuZmbuZmbuZmbuZmbuZmbuZm
buZmbuZmbuZm7nVzvz5ZdsnsOxjm5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m
5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m5C3m
5C3m5K3N1iDrSS7Wk1ysJ7lYT3KxnuRiPcnFepKL9SQ360lu1pPcrCe5WU9ys57kZj3JzXqSm/Uk
N+tJbtaT3KwnuVlPcrOe5GY9yc16kpv1JDfrSW7Wk9ysJ7nP35N8eK69z9+SzNzMzdzMzdzMzdzM
zdzMzdzMzdzMzdzMzdzMzdzMzdzr5n55sgyT2XcwzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnb
zMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnbzMnb
zMnbzMnbzMnbzMnbzMnbna1B1pPcrCe5WU9ys57kZj3JzXqSm/UkN+tJbtaT3KwnuVlPcrOe5GY9
yc16kpv1JDfrSW7Wk9ysJ7lZT3KznuRmPcnNepKb9SQ360lu1pPcrCe5WU9yn78n+fm59vlbkpmb
uZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZl73dyvT5ZdMvsOhjl5mzl5mzl5mzl5mzl5mzl5
mzl5mzl5mzl5mzl5mzl5mzl5mzl5Wzl55bly8k7JwZILS64subHkzpIHS54sebFktgaDrcFgazDY
Ggy2BoOtwWBrMNgaDLYGg63BYGuwsDVY2BosbA0WtgYLW4OFrcHC1mBha7CwNVjYGqxsDVa2Bitb
g5WtwcrWYGVrsLI1WNkarGwNVrYGG1uDja3BxtZgY2uwsTXY2BpsbA2evyd5/1z7lLsyN3MzN3Mz
N3MzN3MzN3MzN3MzN3MzN3MzN3MzN3Mz999X7tcnyy6ZfQfT2XcwnX0H09l3MJ19B9PZdzCdfQfT
2XcwnX0P2tka7GwNDrYGB1uDg63BwdbgYGtwsDU42BocbA0OtgYHW4OTrcHJ1uBka3CyNTjZGpxs
DU62Bidbg5OtwcnW4GJrcLE1uNgaXGwNLrYGF1uDi63BxdbgYmtwsTW42RrcbA1utgY3W4ObrcHN
1uBma3CzNbjZGmQ9yWA9yWA9yWA9yWA9yWA9yWA9yWA9yWA9yWA9yWA9yWA9yTh/T/LhuXacvyWZ
uZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbudfN/fpk2SWz72CYkxfMyQvm5AVz8oI5ecGc
vGBOXjAnL5iTF8zJC+bkBXPygjl5wZy8YE5eMCcvmJMXzMkL5uQFc/KCOXnBnLxgTl4wJy+YkxfM
yQvm5AVz8oI5ecGcvGBOXjAnL5iTF42tQdaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaT
DNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTDNaTjPP3JD8/1z5/
SzJzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzr5v79cmyS2bfwTAnL5iTF8zJC+bkBXPy
gjl5wZy8YE5eMCcvmJMXzMkL5uQFc/KCOXnBnLxgTl4wJy+YkxfMyQvm5AVz8oI5eYU5eYU5eYU5
eYU5eYU5eYU5eYU5eYU5eYU5eYU5eYU5eSXYGmQ9ycJ6koX1JAvrSRbWkyysJ1lYT7KwnmRhPcnC
epKF9SQL60kW1pMsrCdZWE+ysJ5kYT3JwnqShfUkC+tJFtaTLKwnWVhPsrCeZGE9ycJ6koX1JMv5
e5IPz7XL+VuSmZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mXvd3C9PlmEy+w6GOXmFOXmF
OXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmF
OXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXmFOXllsjXIepKF9SQL60kW1pMsrCdZWE+y
sJ5kYT3JwnqShfUkC+tJFtaTLKwnWVhPsrCeZGE9ycJ6koX1JAvrSRbWkyysJ1lYT7KwnmRhPcnK
epKV9SQr60nW8/ckH55r1/O3JDM3czM3czM3czM3czM3czM3czM3czM3czM3czM3czP3urlfnyy7
5M6SB0ueLHmxZPYdDHPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPy
KnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyKnPyamVrkPUkK+tJVtaTrKwn
WVlPsrKeZGU9ycp6kpX1JCvrSVbWk6ysJ1lZT7KynmRlPcnKepKV9SQr60lW1pOsrCdZWU+ysp5k
ZT3JynqSlfUkK+tJVtaTrOfvSX5+rn3+lmTmZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7m
Xjf365Nll8y+g2FOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVO
XmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmVOXmNOXmNOXmNOXnteWXJj
yZ0lD5Y8WfJiyWwNsp5kYz3JxnqSjfUkG+tJNtaTbKwn2VhPsrGeZGM9ycZ6ko31JBvrSTbWk2ys
J9lYT7KxnmRjPcnGepKN9SQb60m28/ckH55rt/O3JDM3czM3czM3czM3czM3czM3czM3czM3czM3
czM3czP3urlfnyy7ZPYdDHPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPy
GnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPyGnPy
2mBrkPUkG+tJNtaTbKwn2VhPsrGeZGM9ycZ6ko31JBvrSTbWk2ysJ9lYT7KxnmRjPcnGepKN9SQb
60k21pNsrCfZWE+ysZ5kYz3JxnqSjfUkG+tJNtaTbOfvSX5+rn3+lmTmZm7mZm7mZm7mZm7mZm7m
Zm7mZm7mZm7mZm7mZm7mXjf365Nll8y+g2FOXmNOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdO
XmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdOXmdO
XmdOXmdOXmdOXq9sDbKeZGc9yc56kp31JDvrSXbWk+ysJ9lZT7KznmRnPcnOepKd9SQ760l21pPs
rCfZWU+ys55kZz3JznqSnfUkO+tJdtaT7Kwn2VlPsrOeZGc9yc56kv38PcmH59r9/C3JzM3czM3c
zM3czM3czM3czM3czM3czM3czM3czM3czL1u7pcnyzCZfQfDnLzOnLzOnLzOnLzOnLzOnLzOnLzO
nLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzOnLzO
nLzOnLzOnLzOnLzOnLzOnLzOnLy+2RpkPcnOepKd9SQ760kO1pMcrCc5WE9ysJ7kYD3JwXqSg/Uk
B+tJDtaTHKwnOVhPcrCe5GA9ycF6koP1JAfrSQ7WkxysJzlYT3KwnuRgPcnBepKD9STH+XuSD8+1
x/lbkpmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZl73dyvT5ZdMvsOhjl5gzl5gzl5gzl5
gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5
gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5gzl5o7M1yHqSg/UkB+tJDtaTHKwnOVhPcrCe5GA9
ycF6koP1JAfrSQ7WkxysJzlYT3KwnuRgPcnBepKD9SQH60kO1pMcrCc5WE9ysJ7kYD3JwXqSg/Uk
B+tJjvP3JD8/1z5/SzJzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzr5v79cmyS2bfwTAn
bzAnbzAnbzAnbzAnbzAnbzAnbzAnbzAnbzAnbzInbzInbzInbzInbzInbzInbzInbzInbzInbzIn
bzInbzInbzInbzInbzInbzInbzInbzInbzInbzInbzInbzInbzInbxa2BllPcrKe5GQ9ycl6kpP1
JCfrSU7Wk5ysJzlZT3KynuRkPcnJepKT9SQn60lO1pOcrCc5WU9ysp7kZD3JyXqSk/UkJ+tJTtaT
nKwnOVlPcrKe5GQ9yXn+nuTDc+15/pZk5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5l43
9+uTZZfMvoNhTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5k
Tt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5kTt5cbA2ynuRk
PcnJepKT9SQn60lO1pOcrCc5WU9ysp7kZD3JyXqSk/UkF+tJLtaTXKwnuVhPcrGe5GI9ycV6kov1
JBfrSS7Wk1ysJ7lYT3KxnuRiPcnFepLr/D3Jh+fa6/wtyczN3MzN3MzN3MzN3MzN3MzN3MzN3MzN
3MzN3MzN3My9bu7XJ8sumX0Hw5y8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8
xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8xZy8
xZy81dkaZD3JxXqSi/UkF+tJLtaTXKwnuVhPcrGe5GI9ycV6kov1JBfrSS7Wk1ysJ7lYT3KxnuRi
PcnFepKL9SQX60ku1pNcrCe5WE9ysZ7kYj3JxXqSi/Uk1/l7kp+fa5+/JZm5mZu5mZu5mZu5mZu5
mZu5mZu5mZu5mZu5mZu5mZu518398mQZJrPvYJiTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iT
t5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5mTt5mTt5mTt5mTt5mTt5mTt5mTt5mTt5mTt5mTt5mT
t5mTt5mTt5mTt5mTt4OtQdaT3KwnuVlPcrOe5GY9yc16kpv1JDfrSW7Wk9ysJ7lZT3KznuRmPcnN
epKb9SQ360lu1pPcrCe5WU9ys57kZj3JzXqSm/UkN+tJbtaT3KwnuVlPcp+/J/nwXHufvyWZuZmb
uZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbudfN/fpk2SWz72CYk7eZk7eZk7eZk7eZk7eZk7eZ
k7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZ
k7eZk7eZk7eZk7eZk7eZk7eZk7eZk7cnW4OsJ7lZT3KznuRmPcnNepKb9SQ360lu1pPcrCe5WU9y
s57kZj3JzXqSm/UkN+tJbtaT3KwnuVlPcrOe5FY9yfpc9SRPycGSC0uuLLmx5M6SB0ue4rn2KXdl
buZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZm7r+v3K9Pll0y+w4m2Hcwwb6DCfYdTLDvYIJ9
BxPsO5hg38EoJ++UzNZgsDVY2BosbA0WtgYLW4OFrcHC1mBha7CwNVjYGixsDVa2Bitbg5WtwcrW
YGVrsLI1WNkarGwNVrYGK1uDja3BxtZgY2uwsTXY2BpsbA02tgYbW4ONrcHG1mBna7CzNdjZGuxs
DXa2Bjtbg52twc7WYGdrsLM1ONgaHGwNDrYGB1uDg63BwdbgYGtwsDU42BocbA1OtgbP35P8/Fz7
/C3JzM3czM3czM3czM3czM3czM3czM3czM3czM3czM3czL1u7tcnyy6ZfQcz2Xcwk30HM9l3MJN9
BzPZdzCTfQez2Hcwi30PutgaXGwNLrYGF1uDi63BxdbgYmtwsTW42RrcbA1utgY3W4ObrcHN1uBm
a3CzNbjZGmROXjAnL5iTF8zJC+bkBXPygjl5wZy8eD5Z8mLJbA2ynmSwnmSwnmSwnmSwnmSwnmSw
nmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSc
vyf58Fw7zt+SzNzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzr5n59suyS2XcwzMkL5uQF
c/KCOXnBnLxgTl4wJy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5wZy8YE5e
MCcvmJMXzMkL5uQFc/KCOXnBnLxgTl4wJy+YkxfMyYvJ1iDrSQbrSQbrSQbrSQbrSQbrSQbrSQbr
SQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbrSQbr
Scb5e5IPz7XL+VuSmZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mXvd3McnyzI5WHJhyZUl
N5bcWfJgyZMlL5asvgctzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkr53fyXt7dvHqboRmaoRma
oRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRma
oRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRma
oRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRma
oRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRma
oRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRmaoRma
oRmKQm/fvP/467lDX7y+vbn76ce7208fbs+T/eH1u4/PXr19efuPz075z3/68TnKDZRbUG5FuQ3l
dpQ7RG6g37NAv2eBfs8C/Z4F+j0L9HsW6PesoN+zgn7PCvo9K+j3rKDfs4J+zwr6Pfsh3I3zB/Kb
Vt0bnmfPDTSZBJpMAk0mgSaTQJNJoMkk0GQSaDIJNJkEmkwCTSaBJpNAk0mgySTQZBJoMgk0mQSa
TAJNJoEmk0CTSajJJNRkEmgyCTSZFDSZFDSZFDSZFDSZFDSZFDSZFDSZFDSZFDSZFDSZFDSZFDSZ
FDSZFDSZFDSZFDSZFDSZFDSZFDSZFDSZFDSZFDWZFDWZFDSZFDSZVDSZVDSZVDSZVDSZVDSZVDSZ
VDSZVDSZVDSZVDSZVDSZVDSZVDSZVDSZVDSZVDSZVDSZVDSZVDSZVDSZVDSZVDWZVDWZVDSZVDSZ
NDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZNDSZ
NDSZNDSZNDWZNDWZNDSZNDSZdDSZdDSZdDSZdDSZdDSZdDSZdDSZdDSZdDSZdDSZdDSZdDSZdDSZ
dDSZdDSZdDSZdDSZdDSZdDSZdDSZdDSZdDWZdDWZdDSZdDSZDDSZDDSZDDSZDDSZDDSZDDSZDDSZ
DDSZDDSZDDSZDDSZDDSZDDSZDDSZDDSZDDSZDDSZDDSZDDSZDDSZDDSZDDWZDDWZDDSZDDSZTDSZ
TDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZTDSZ
TDSZTDWZTDWZTDSZTDSZLDSZLDSZLDSZLDSZLDSZLDSZLDSZLDSZLDSZLDSZLDSZLDSZLDSZLDSZ
LDSZLDSZLDSZLDSZLDSZLDSZLDSZLDWZLDWZLDSZLDSZbDSZbDSZbDSZbDSZbDSZbDSZbDSZbDSZ
bDSZbDSZbDSZbDSZbDSZbDSZbDSZbDSZbDSZbDSZbDSZbDSZbDSZbDWZbDWZbDSZbCWtKQQ2lAIb
ioEN5cCGgmBDSbChKNhQFmwoDDaUBhuKgw3lwYYCYUOJsKFI2FAmbCgUNpQKG4qFDeXChoJhg8mw
wWjYUDZsMByW6bCMh2U+LANimRDLiFhmxDIklimxjIllTiyDYpkUy6hYZsUyLJZpsYyLZV4sA2OZ
GOvIWGfGMjRWqbGh2NhQbmwoODaUHBuKjg1lx4bCY0PpsaH42FB+bChANpQgG4qQDWXIhkJkQymy
oRjZUI5sKEg2lCQbipINZskGw2RDabKhONlQnmwoUDaUKBuKlA1lyoZCZUOpsqFY2VCubChYNpQs
G4qWDWXLhsJlQ+myoXjZUL5sKGA2lDAbipgNZcwGQ2aDKbOhmNlQzmwoaDaUNBuKmg1lzYbCZkNp
s6G42VDebChwNpQ4G4qcDWXOhkJnQ6mzodjZUO5sKHg2lDwbip4NZc+GwmeD6bPB+NlQ/mwogDaU
QBuKoA1l0IZCaEMptKEY2lAObSiINpREG4qiDWXRhsJoQ2m0oTjaUB5tKJA2lEgbiqQNZdKGQmlD
qbTBWNpgLm0omDaUTBuKpg1l04bCaUPptKF42lA+bSigNpRQG4qoDWXUhkJqQym1oZjaUE5tKKg2
lFQbiqoNZdWGwmpDabWhuNpgXm0wsDaUWBuKrA1l1oZCa0OptaHY2lBubSi4NpRcG4quDWXXhsJr
Q+m1ofjaUH5tKMA2lGAbirANZdiGQmxDKbahGNtQjm0wyDaYZBuKsg1l2YbCbENptqE421CebSjQ
NpRoG4q0DWXahkJtQ6m2oVjbUK5tKNg2lGwbirYNZduGwm1D6baheNtQvm0o4DaYcBuMuA1l3IZC
bkMpt6GY21DObSjoNpR0G4q6DWXdhsJuQ2m3objbUN5tKPA2lHgbirwNZd6GQm9Dqbeh2NtQ7m0o
+DaUfBuMvg1m34bCb0Ppt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xp
t0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt4Xpt4Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xp
t0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt4Xpt4Xpt0Xpt0Xpt0Xpt0Xp
t0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xp
t4Xpt4Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xp
t0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt4Xpt4Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xp
t0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt4Xpt4Xpt0Xpt0Xpt0Xpt0Xpt0Xp
t0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt4Xp
t4Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xp
t0Xpt0Xpt0Xpt0Xpt0Xpt4Xpt4Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xp
t0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt4Xpt4Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xp
t0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt4Xpt4Xp
t0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xpt0Xp
t0Xpt0Xpt0Xpt0Xpt4Xpt4Xpt0Xpt0Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xp
t1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt5Xpt5Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xp
t1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt5Xpt5Xpt1Xp
t1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xp
t1Xpt1Xpt1Xpt5Xpt5Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xp
t1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt5Xpt5Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xp
t1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt5Xpt5Xpt1Xpt1Xp
t1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xp
t1Xpt1Xpt5Xpt5Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xp
t1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt5Xpt5Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xp
t1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt5Xpt5Xpt1Xpt1Xpt1Xp
t1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xp
t1Xpt5Xpt5Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xp
t1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt1Xpt5Xpt5Xpt1Xpt1Xpt03pt03pt03pt03pt03pt03pt03pt03p
t03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt43pt43pt03pt03pt03pt03p
t03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03p
t43pt43pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03p
t03pt03pt03pt03pt03pt03pt43pt43pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03p
t03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt43pt43pt03pt03pt03pt03pt03p
t03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt43p
t43pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03p
t03pt03pt03pt03pt03pt43pt43pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03p
t03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt43pt43pt03pt03pt03pt03pt03pt03p
t03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt43pt43p
t03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03p
t03pt03pt03pt03pt43pt43pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt03p
t03pt03pt03pt03pt03pt03pt03pt03pt03pt03pt43pt43pt03pt03pt13pt13pt13pt13pt13p
t13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt53pt53pt13p
t13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13p
t13pt13pt13pt53pt53pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13p
t13pt13pt13pt13pt13pt13pt13pt13pt13pt53pt53pt13pt13pt13pt13pt13pt13pt13pt13p
t13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt53pt53pt13pt13p
t13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13p
t13pt13pt53pt53pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13p
t13pt13pt13pt13pt13pt13pt13pt13pt53pt53pt13pt13pt13pt13pt13pt13pt13pt13pt13p
t13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt53pt53pt13pt13pt13p
t13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13p
t13pt53pt53pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13p
t13pt13pt13pt13pt13pt13pt13pt53pt53pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13p
t13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt13pt53pt53pt13pt13pt0Ppt0Pp
t0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Pp
t4Ppt4Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Pp
t0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt4Ppt4Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Pp
t0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt4Ppt4Ppt0Ppt0Ppt0Ppt0Ppt0Pp
t0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt4Pp
t4Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Pp
t0Ppt0Ppt0Ppt0Ppt0Ppt4Ppt4Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Pp
t0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt4Ppt4Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Pp
t0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt4Ppt4Pp
t0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Pp
t0Ppt0Ppt0Ppt0Ppt4Ppt4Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Pp
t0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt4Ppt4Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Pp
t0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt0Ppt4Ppt4Ppt0Pp
t0Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Pp
t1Ppt1Ppt1Ppt5Ppt5Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Pp
t1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt5Ppt5Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Pp
t1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt5Ppt5Ppt1Ppt1Pp
t1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Pp
t1Ppt1Ppt5Ppt5Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Pp
t1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt5Ppt5Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Pp
t1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt5Ppt5Ppt1Ppt1Ppt1Pp
t1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Pp
t1Ppt5Ppt5Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Pp
t1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt5Ppt5Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Pp
t1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt5Ppt5Ppt1Ppt1Ppt1Ppt1Pp
t1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Ppt1Pp
t5Ppt5Ppt1Ppt1Ppt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vp
t0vpt0vpt0vpt0vpt0vpt0vpt4vpt4vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vp
t0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt4vpt4vpt0vpt0vpt0vpt0vpt0vp
t0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt4vp
t4vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vp
t0vpt0vpt0vpt0vpt0vpt4vpt4vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vp
t0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt4vpt4vpt0vpt0vpt0vpt0vpt0vpt0vp
t0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt4vpt4vp
t0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vp
t0vpt0vpt0vpt0vpt4vpt4vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vp
t0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt4vpt4vpt0vpt0vpt0vpt0vpt0vpt0vpt0vp
t0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt4vpt4vpt0vp
t0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vpt0vp
t0vpt0vpt0vpt4vpt4vpt0vpt0vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vp
t1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt5vpt5vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vp
t1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt5vpt5vpt1vpt1vp
t1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vp
t1vpt1vpt5vpt5vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vp
t1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt5vpt5vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vp
t1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt5vpt5vpt1vpt1vpt1vp
t1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vp
t1vpt5vpt5vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vp
t1vpt1vpt1vpt1vpt1vpt1vpt1vpt5vpt5vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vp
t1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt5vpt5vpt1vpt1vpt1vpt1vp
t1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vp
t5vpt5vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vpt1vp
t1vpt1vpt1vpt1vpt1vpt1vpt5vpt5vpt1vpt1vpt/Fc8bdfkoMlF5ZcWXJjyZ0lD5Mc7Lcu2G9d
sN+6YL91wX7rgv3WBfutK+y3rrDfusJ+6wr7rSvst66w37rCfut+CHmL/QH93lX5psUsE2yWCTbL
BJtlgs0ywWaZYLNMsFkm2CwTbJYJNssEm2WCzTLBZplgs0ywWSbYLBNslgk2ywSbZYLNMsFmmXCz
TLhZJtgsE2yWKWyWKWyWKWyWKWyWKWyWKWyWKWyWKWyWKWyWKWyWKWyWKWyWKWyWKWyWKWyWKWyW
KWyWKWyWKWyWKWyWKWyWKW6WKW6WKWyWKWyWqWyWqWyWqWyWqWyWqWyWqWyWqWyWqWyWqWyWqWyW
qWyWqWyWqWyWqWyWqWyWqWyWqWyWqWyWqWyWqWyWqWyWqW6WqW6WqWyWqWyWaWyWaWyWaWyWaWyW
aWyWaWyWaWyWaWyWaWyWaWyWaWyWaWyWaWyWaWyWaWyWaWyWaWyWaWyWaWyWaWyWaWyWaW6WaW6W
aWyWaWyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW6WyW
6WyW6WyW6WyW6WyW6W6W6W6W6WyW6WyWGWyWGWyWGWyWGWyWGWyWGWyWGWyWGWyWGWyWGWyWGWyW
GWyWGWyWGWyWGWyWGWyWGWyWGWyWGWyWGWyWGWyWGW6WGW6WGWyWGWyWmWyWmWyWmWyWmWyWmWyW
mWyWmWyWmWyWmWyWmWyWmWyWmWyWmWyWmWyWmWyWmWyWmWyWmWyWmWyWmWyWmWyWmW6WmW6WmWyW
mWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyWWWyW
WWyWWWyWWWyWWW6WWW6WWWyWWWyW2WyW2WyW2WyW2WyW2WyW2WyW2WyW2WyW2WyW2WyW2WyW2WyW
2WyW2WyW2WyW2WyW2WyW2WyW2WyW2WyW2WyW2W6W2W6W2WyWYe5vMPc3mPsbzP0N5v4Gc3+Dub/B
3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v/H/03YvKZYdaRZGpxIDKMH9n2Y2HFHyhkCPIKVq1OyLhMxG
VjvWBA6m4KBvu/u1dZn7G8z9Deb+BnN/g7m/wdzfYO5vOPc3nPsbzP0N5v4Gc3+Dub/B3N9g7m8w
9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3nPsbzv0N5v4G
c3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5v
MPc3mPsbzv0N5/4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+
BnN/g7m/wdzfYO5vMPc3mPsbzP0N5/6Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32Du
bzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v6Gc3/Dub/B3N9g7m8w9zeY+xvM/Q3m
/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3/Dub/h3N9g
7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N
5v4Gc3+Dub/h3N9w7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzf
YO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9w7m849zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9
Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m849zec+xvM/Q3m/gZzf4O5v8Hc
32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zec+xvO
/Q3m/gZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J
3N9k7m8y9zeZ+5vO/U3n/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfub
zP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3n/qZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/
ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/qZzf9O5v8nc32TubzL3N5n7
m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf9O5
v+nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ
+5vM/U3m/iZzf5O5v+nc33TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+T
ub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc33Tubzr3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3
mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32Tubzr3N537m8z9Teb+JnN/
k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3
N537m879Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZz
f5O5v8nc32TubzL3N5n7m879Tef+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y
9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Tef+pnN/k7m/ydzfYu5vMfe3mPtbzP0t5v4W
c3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+lnN/y7m/xdzfYu5v
Mfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+
FnN/y7m/5dzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32Lu
bzH3t5j7W8z9Leb+FnN/i7m/5dzfcu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m
/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfcu5vOfe3mPtbzP0t5v4Wc3+Lub/F3N9i
7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vOfe3nPtbzP0t
5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzf
Yu5vMfe3nPtbzv0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9
Leb+FnN/i7m/xdzfYu5vMfe3mPtbzv0t5/4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc
32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5/6Wc3+Lub/F3N9i7m8x97eY+1vM
/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v6Wc3/Lub/F
3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtb
zP0t5v4Wc3/Lub/l3N9i7m8x97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/
zdzfZu5vM/e3mfvbzP1t5v42c3+bub/t3N927m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n7
28z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N927m8797eZ+9vM/W3m/jZzf5u5
v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8797ed
+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+b
ub/N3N9m7m8z97ed+9vO/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3
mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vO/W3n/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/
m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3n/rZzf5u5v83c32bubzP3
t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/rZz
f9u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z
97eZ+9vM/W3m/jZzf9u5v+3c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42
c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v+3c33bubzP3t5n728z9beb+NnN/m7m/zdzfZu5v
M/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c33bubzv3t5n728z9Heb+
DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu
7zj3d5z7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m
/g5zf4e5v8Pc32Hu7zD3d5z7O879Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h
7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O879Hef+DnN/h7m/w9zfYe7vMPd3mPs7zP0d
5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Hef+jnN/h7m/w9zf
Ye7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9
Heb+jnN/x7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc
32Hu7zD3d5j7O8z9Heb+DnN/x7m/49zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM
/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/49zfce7vMPd3mPs7zP0d5v4Oc3+Hub/D
3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfce7vOPd3mPs7
zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/
w9zfYe7vOPd3nPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7
O8z9Heb+DnN/h7m/w9zfYe7vMPd3nPs7zv0d5v4Oc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5
v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zv1d5/4uc3+Xub/L3N9l7u8y93eZ
+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5/6uc3+X
ub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3
mfu7zP1d5v6uc3/Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/
l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3/Xub/r3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3
d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/r3N917u8y93eZ+7vM/V3m/i5z
f5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N917u86
93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4u
c3+Xub/L3N9l7u8693ed+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7v
Mvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93ed+7vO/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+
LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vO/V3n/i5zf5e5v8vc32Xu
7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3n
/q5zf5e5v8vc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc
38Pc38Pc38Pc38Pc38Pc3+Pc3+Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc
38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc3+Pc3+Pc38Pc38Pc38Pc38Pc38Pc38Pc
38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc3+Pc3+Pc
38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc
38Pc38Pc38Pc38Pc3+Pc3+Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc
38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc3+Pc3+Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc
38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc3+Pc3+Pc38Pc
38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc
38Pc38Pc38Pc3+Pc3+Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc
38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc3+Pc3+Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc
38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc3+Pc3+Pc38Pc38Pc
38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc38Pc
38Pc38Pc3+Pc3+Pc38Pc38Pc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc
38vc38vc38vc38vc38vc38vc38vc38vc3+vc3+vc38vc38vc38vc38vc38vc38vc38vc38vc38vc
38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc3+vc3+vc38vc38vc38vc
38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc
38vc3+vc3+vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc
38vc38vc38vc38vc38vc38vc38vc3+vc3+vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc
38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc3+vc3+vc38vc38vc38vc38vc
38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc
3+vc3+vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc
38vc38vc38vc38vc38vc38vc3+vc3+vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc
38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc3+vc3+vc38vc38vc38vc38vc38vc
38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc3+vc
3+vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc38vc
38vc38vc38vc38vc38vc3+vc3+vc38vc38vc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc
38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc3+fc3+fc38fc38fc38fc38fc38fc38fc
38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc3+fc3+fc
38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc
38fc38fc38fc38fc3+fc3+fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc
38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc3+fc3+fc38fc38fc38fc38fc38fc38fc38fc
38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc3+fc3+fc38fc
38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc
38fc38fc38fc3+fc3+fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc
38fc38fc38fc38fc38fc38fc38fc38fc38fc3+fc3+fc38fc38fc38fc38fc38fc38fc38fc38fc
38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc3+fc3+fc38fc38fc
38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc
38fc38fc3+fc3+fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc38fc
38fc38fc38fc38fc38fc38fc38fc38fc3+fc3+fc38fc36fc3/wo9/ffTw725GRPLvbkZk8e9uQ1
Tw721gV764K9dcHeumBvXbC3Lthbl+ytS/bWJXvrkr11yd66ZG9dsrfup5CJ/Qm9dyUPLbZMsC0T
bMsE2zLBtkywLRNsywTbMsG2TLAtE2zLBNsywbZMsC0TbMsE2zLBtkywLRNsywTbMsG2TLAtE27L
hNsywbZMsC2TbMsk2zLJtkyyLZNsyyTbMsm2TLItk2zLJNsyybZMsi2TbMsk2zLJtkyyLZNsyyTb
Msm2TLItk2zLpNsy6bZMsi2TbMsU2zLFtkyxLVNsyxTbMsW2TLEtU2zLFNsyxbZMsS1TbMsU2zLF
tkyxLVNsyxTbMsW2TLEtU2zLFNsy5bZMuS1TbMsU2zLNtkyzLdNsyzTbMs22TLMt02zLNNsyzbZM
sy3TbMs02zLNtkyzLdNsyzTbMs22TLMt02zLNNsyzbZMuy3Tbss02zLNtsywLTNsywzbMsO2zLAt
M2zLDNsyw7bMsC0zbMsM2zLDtsywLTNsywzbMsO2zLAtM2zLDNsyw7bMsC0zbsuM2zLDtsywLbNs
yyzbMsu2zLIts2zLLNsyy7bMsi2zbMss2zLLtsyyLbNsyyzbMsu2zLIts2zLLNsyy7bMsi2zbMus
2zLrtsyyLbNsyxy2ZQ7bModtmcO2zGFb5rAtc9iWOWzLHLZlDtsyh22Zw7bMYVvmsC1z2JY5bMsc
tmUO2zKHbZnDtsxhW+a4LXPcljlsyxy2ZS7bMpdtmcu2zGVb5rItc9mWuWzLXLZlLtsyl22Zy7bM
ZVvmsi1z2Za5bMtctmUu2zKXbZnLtsxlW+ayLXPdlrluy1y2ZS7bMo9tmce2zGNb5rEt89iWeWzL
PLZlHtsyj22Zx7bMY1vmsS3z2JZ5bMs8tmUe2zKPbZnHtsxjW+axLfPYlnluyzy3ZR7bMsz9Deb+
BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32Du
bzj3N5z7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m
/gZzf4O5v8Hc32DubzD3N5z7G879Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g
7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G879Def+BnN/g7m/wdzfYO5vMPc3mPsbzP0N
5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Def+hnN/g7m/wdzf
YO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9
Deb+hnN/w7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc
32DubzD3N5j7G8z9Deb+BnN/w7m/4dzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM
/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/4dzfcO5vMPc3mPsbzP0N5v4Gc3+Dub/B
3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfcO5vOPc3mPsb
zP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/
wdzfYO5vOPc3nPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7
G8z9Deb+BnN/g7m/wdzfYO5vMPc3nPsbzv0N5v4Gc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5
v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzv1N5/4mc3+Tub/J3N9k7m8y9zeZ
+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5/6mc3+T
ub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3
mfubzP1N5v6mc3/Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/
k7m/ydzfZO5vMvc3mfubzP1N5v4mc3/Tub/p3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3
N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/p3N907m8y9zeZ+5vM/U3m/iZz
f5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N907m86
9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4m
c3+Tub/J3N9k7m869zed+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5v
Mvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zed+5vO/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+
JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vO/U3n/iZzf5O5v8nc32Tu
bzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3n
/qZzf5O5v8nc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i
7m8x97eY+1vM/S3m/pZzf8u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t
5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf8u5v+Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzf
Yu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v+Xc33LubzH3t5j7W8z9
Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc
33Lubzn3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM
/S3m/hZzf4u5v8Xc32Lubzn3t5z7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F
3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5z7W879Leb+FnN/i7m/xdzfYu5vMfe3mPtb
zP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W879Lef+FnN/i7m/
xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7
W8z9Lef+lnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5
v8Xc32LubzH3t5j7W8z9Leb+lnN/y7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY
+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/y7m/5dzfYu5vMfe3mfvbzP1t5v42c3+b
ub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/7dzfdu5vM/e3
mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/
m7m/zdzfdu5vO/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3
t5n728z9beb+NnN/m7m/zdzfZu5vO/e3nfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZz
f5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3nfvbzv1t5v42c3+bub/N3N9m7m8z
97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzv1t5/42
c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5v
M/e3mfvbzP1t5/62c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+
NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v62c3/bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bu
bzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3/bub/t3N9m7m8z97eZ+9vM/W3m
/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/t3N92
7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t
5v42c3+bub/N3N927m8797eZ+9vM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zf
Ye7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8493ec+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9
Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93ec+zvO/R3m/g5zf4e5v8Pc
32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvO
/R3n/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D
3N9h7u8w93eY+zvM/R3n/o5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7
zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/o5zf8e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/
w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf8e5v+Pc32Hu7zD3d5j7
O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5
v+Pc33Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY
+zvM/R3m/g5zf4e5v8Pc33Hu7zj3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+H
ub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zj3d5z7O8z9Heb+DnN/h7m/w9zfYe7vMPd3
mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5z7O879Heb+DnN/
l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3
d5n7u879Xef+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5z
f5e5v8vc32Xu7zL3d5n7u8z9Xef+rnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y
93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+rnN/17m/y9zfZe7vMvd3mfu7zP1d5v4u
c3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/17m/69zfZe7v
Mvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+
LnN/l7m/69zfde7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu
7zL3d5n7u8z9Xeb+LnN/l7m/y9zfde7vOvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m
/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vOvd3nfu7zP1d5v4uc3+Xub/L3N9l
7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3nfu7zv1d
5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zf
Ze7vMvd3mfu7zv1d5/4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9
Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5/6uc3+Xub/L3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D
3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/j3N/j3N/D3N/D3N/D3N/D
3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D
3N/j3N/j3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D
3N/D3N/D3N/D3N/D3N/D3N/D3N/j3N/j3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D
3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/j3N/j3N/D3N/D3N/D3N/D3N/D
3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/j
3N/j3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D
3N/D3N/D3N/D3N/D3N/D3N/j3N/j3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D
3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/j3N/j3N/D3N/D3N/D3N/D3N/D3N/D
3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/j3N/j
3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D
3N/D3N/D3N/D3N/D3N/j3N/j3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D
3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/D3N/j3N/j3N/D3N/D3N/L3N/L3N/L3N/L3N/L
3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/r3N/r3N/L
3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L
3N/L3N/L3N/L3N/r3N/r3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L
3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/r3N/r3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L
3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/r3N/r3N/L3N/L
3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L
3N/L3N/L3N/r3N/r3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L
3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/r3N/r3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L
3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/r3N/r3N/L3N/L3N/L
3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L
3N/L3N/r3N/r3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L
3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/r3N/r3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L
3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/L3N/r3N/r3N/L3N/L3N/H3N/H
3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H
3N/n3N/n3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H
3N/H3N/H3N/H3N/H3N/H3N/H3N/n3N/n3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H
3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/n3N/n3N/H3N/H3N/H3N/H3N/H
3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/n
3N/n3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H
3N/H3N/H3N/H3N/H3N/H3N/n3N/n3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H
3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/n3N/n3N/H3N/H3N/H3N/H3N/H3N/H
3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/n3N/n
3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H
3N/H3N/H3N/H3N/H3N/n3N/n3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H
3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/n3N/n3N/H3N/H3N/H3N/H3N/H3N/H3N/H
3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/H3N/n3N/n3N/H
3N+n3N/6KPf3308O9uRkTy725GZPHvbkNU8O9tYFe+uCvXXB3rpgb12wty7YW5fsrUv21iV765K9
dcneumRvXbK37qeQif0JvXclDy22TLAtE2zLBNsywbZMsC0TbMsE2zLBtkywLRNsywTbMsG2TLAt
E2zLBNsywbZMsC0TbMsE2zLBtkywLRNuy4TbMsG2TLAtk2zLJNsyybZMsi2TbMsk2zLJtkyyLZNs
yyTbMsm2TLItk2zLJNsyybZMsi2TbMsk2zLJtkyyLZNsy6TbMum2TLItk2zLFNsyxbZMsS1TbMsU
2zLFtkyxLVNsyxTbMsW2TLEtU2zLFNsyxbZMsS1TbMsU2zLFtkyxLVNsyxTbMuW2TLktU2zLFNsy
zbZMsy3TbMs02zLNtkyzLdNsyzTbMs22TLMt02zLNNsyzbZMsy3TbMs02zLNtkyzLdNsyzTbMs22
TLst027LNNsyzbbMsC0zbMsM2zLDtsywLTNsywzbMsO2zLAtM2zLDNsyw7bMsC0zbMsM2zLDtsyw
LTNsywzbMsO2zLAtM27LjNsyw7bMsC2zbMss2zLLtsyyLbNsyyzbMsu2zLIts2zLLNsyy7bMsi2z
bMss2zLLtsyyLbNsyyzbMsu2zLIts2zLrNsy67bMsi2zbMsctmUO2zKHbZnDtsxhW+awLXPYljls
yxy2ZQ7bModtmcO2zGFb5rAtc9iWOWzLHLZlDtsyh22Zw7bMYVvmuC1z3JY5bMsctmUu2zKXbZnL
tsxlW+ayLXPZlrlsy1y2ZS7bMpdtmcu2zGVb5rItc9mWuWzLXLZlLtsyl22Zy7bMZVvmsi1z3Za5
bstctmUu2zKPbZnHtsxjW+axLfPYlnlsyzy2ZR7bMo9tmce2zGNb5rEt89iWeWzLPLZlHtsyj22Z
x7bMY1vmsS3z2JZ5bss8t2Ue2zLM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzf
YO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m849zec+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9
Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zec+xvO/Q3m/gZzf4O5v8Hc
32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvO
/Q3n/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B
3N9g7m8w9zeY+xvM/Q3n/oZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsb
zP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/oZzf8O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/
wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf8O5v+Hc32DubzD3N5j7
G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5
v+Hc33DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY
+xvM/Q3m/gZzf4O5v8Hc33Dubzj3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+D
ub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32Dubzj3N5z7G8z9Deb+BnN/g7m/wdzfYO5vMPc3
mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5z7G879Deb+BnN/
k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3
N5n7m879Tef+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZz
f5O5v8nc32TubzL3N5n7m8z9Tef+pnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y
9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+pnN/07m/ydzfZO5vMvc3mfubzP1N5v4m
c3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/07m/6dzfZO5v
Mvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+
JnN/k7m/6dzfdO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32Tu
bzL3N5n7m8z9Teb+JnN/k7m/ydzfdO5vOvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m
/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vOvc3nfubzP1N5v4mc3+Tub/J3N9k
7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3nfubzv1N
5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzf
ZO5vMvc3mfubzv1N5/4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9
Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5/6mc3+Tub/J3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc
32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v6Wc3/Lub/F3N9i7m8x97eY+1vM
/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3/Lub/l
3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtb
zP0t5v4Wc3+Lub/l3N9y7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/
xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9y7m8597eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7
W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8597ec+1vM/S3m/hZzf4u5
v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97ec
+1vO/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+L
ub/F3N9i7m8x97eY+1vO/S3n/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3
mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3n/pZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/
i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/pZzf8u5v8Xc32LubzH3
t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZz
f8u5v+Xc32LubzH3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z
97eZ+9vM/W3m/jZzf5u5v+3c33bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42
c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c33bubzv3t5n728z9beb+NnN/m7m/zdzfZu5v
M/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzv3t53728z9beb+
NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bu
bzP3t5372879beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m
/jZzf5u5v83c32bubzP3t5n72879bef+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m
7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9bef+tnN/m7m/zdzfZu5vM/e3mfvbzP1t
5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+tnN/27m/zdzf
Zu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9
beb+NnN/27m/7dzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c
32bubzP3t5n728z9beb+NnN/m7m/7dzfdu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM
/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfdu5vO/e3mfvbzP0d5v4Oc3+Hub/D
3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vOPd3nPs7
zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/
w9zfYe7vMPd3nPs7zv0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7
O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zv0d5/4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5
v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5/6Oc3+Hub/D3N9h7u8w93eY
+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v6Oc3/H
ub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3
mPs7zP0d5v4Oc3/Hub/j3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/
h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/j3N9x7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3
d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9x7u8493eY+zvM/R3m/g5z
f4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u84
93ec+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4O
c3+Hub/D3N9h7u8w93ec+zvO/R3m/g5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7v
Mvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vO/V3n/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+
LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3n/q5zf5e5v8vc32Xu
7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m
/q5zf9e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l
7u8y93eZ+7vM/V3m/i5zf9e5v+vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d
5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v+vc33Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zf
Ze7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc33Xu7zr3d5n7u8z9
Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc
32Xu7zr3d537u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM
/V3m/i5zf5e5v8vc32Xu7zL3d537u879Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L
3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u879Xef+LnN/l7m/y9zfZe7vMvd3mfu7
zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xef+rnN/l7m/
y9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf
w9zfw9zfw9zf49zf49zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf
w9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf49zf49zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf
w9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf49zf49zfw9zfw9zf
w9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf
w9zfw9zf49zf49zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf
w9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf49zf49zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf
w9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf49zf49zfw9zfw9zfw9zf
w9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf
w9zf49zf49zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf
w9zfw9zfw9zfw9zfw9zfw9zfw9zf49zf49zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf
w9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf49zf49zfw9zfw9zfw9zfw9zf
w9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zfw9zf
49zf49zfw9zfw9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf
y9zfy9zfy9zfy9zfy9zfy9zf69zf69zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf
y9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf69zf69zfy9zfy9zfy9zfy9zfy9zf
y9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf69zf
69zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf
y9zfy9zfy9zfy9zfy9zf69zf69zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf
y9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf69zf69zfy9zfy9zfy9zfy9zfy9zfy9zf
y9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf69zf69zf
y9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf
y9zfy9zfy9zfy9zf69zf69zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf
y9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf69zf69zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf
y9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf69zf69zfy9zf
y9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zfy9zf
y9zfy9zfy9zf69zf69zfy9zfy9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf
x9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf59zf59zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf
x9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf59zf59zfx9zfx9zf
x9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf
x9zfx9zf59zf59zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf
x9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf59zf59zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf
x9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf59zf59zfx9zfx9zfx9zf
x9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf
x9zf59zf59zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf
x9zfx9zfx9zfx9zfx9zfx9zfx9zf59zf59zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf
x9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf59zf59zfx9zfx9zfx9zfx9zf
x9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf
59zf59zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zfx9zf
x9zfx9zfx9zfx9zfx9zfx9zf59zf59zfx9zf90Pd31++/vjr69vvP3//9v3n//3tz59/+dGP/cfX
b18///X1Yx77/dc/vv33n//zx9/f4r++/fX31/dvnx/34L++yGP/87xhzhvqvGnOm+q8Zc5b6rxt
ztvqvGPOO+q8a8676rzHnPeo815z3qvO+8x5H+sFCly4wqnEscYFilywygXKXLDOBQpdsNIFSl2w
1gWKXbDaBcpdsN4FCl6w4gVKXrDmJWpesuYlal66n+vUD3aseYmal6x5iZqXrHmJmpeseYmal6x5
iZqXrHmJmpeseYmal6x5hZpXrHmFmleseYWaV+63merXmax5hZpXrHmFmleseYWaV6x5hZpXrHmF
mleseYWaV6x5jZrXrHmNmteseY2a16x5jZrX7m946o94rHmNmteseY2a16x5jZrXrHmNmteseY2a
16x5g5o3rHmDmjeseYOaN6x5g5o3rHmDmjfukyvqoyuseYOaN6x5g5o3rHmDmjeseYOaN6x5i5q3
rHmLmreseYuat6x5i5q3rHmLmreseYuat+7zmuoDm6x5i5q3rHmLmreseYuat6x5BzXvsOYd1LzD
mndQ8w5r3kHNO6x5BzXvsOYd1LzDmndQ8467paCuKbDmHdS8w5p3UPMOa95FzbuseRc177LmXdS8
y5p3UfMua95FzbuseRc177LmXdS8y5p3UfOuu5unLuex5l3UvMua91DzHmveQ817rHkPNe+x5j3U
vMea91DzHmveQ817rHkPNe+x5j3UvMea91DznruRrq6kwzvp7FK6u5X+UdfSP+5e+kddTP+4m+kf
dTX94+6mf9Tl9I+7nf5R19M/7n76R11Q/7gb6h91Rf3j7qh/1CX1j7ul/lHX1D+ugwxnkToL41lc
BxnQAoUWRrRAo4UhLVBpYUwLdFoY1AKlFka1QKuFYS1Qa2Fci/NaQoEt4cSWUGRLJHTKGFTmOqjY
lnBuSyi4JZzcEopuCWe3hMJbwuktofiWcH5LKMAlnOASinAJZ7iEQlzCKS6hGJdwjksoyCUKip2M
7HQdVJhLOM0lFOcSznMJBbqEE11CkS7hTJdQqEs41SUU6xLOdQkFu4STXULRLuFsl1C4SzjdJRTv
Eg3taoZXuw4q4iWc8RIKeQmnvIRiXsI5L6Ggl3DSSyjqJZz1Egp7Cae9hOJewnkvocCXcOJLKPIl
nPkSCn2Jgd/iwL7GwXVQwS/h5JdQ9Es4+yUU/hJOfwnFv4TzX0IBMOEEmFAETDgDJhQCE06BCcXA
hHNgQkEw4SSYUBRMLPw+I/aFRq6DioMJ58GEAmHCiTChSJhwJkwoFCacChOKhQnnwoSCYcLJMKFo
mHA2TCgcJpwOE4qHCefDhAJi4sBv9mNf7ec6qJCYcEpMKCYmnBMTCooJJ8WEomLCWTGhsJhwWkwo
LiacFxMKjAknxoQiY8KZMaHQmHBqTCg2Ji78jlv2Jbeug4qOCWfHhMJjwukxofiYcH5MKEAmnCAT
ipAJZ8iEQmTCKTKhGJlwjkwoSCacJBOKkglnyYTCZOLBb3tnX/f+Izv429fP//j261/ffv3l6/fv
f/799c//gh/9T3L+dfIfHFnw2P88b5jzsn/fNOdNdd4y5y113jbnbXXeMecddd4151113mPOe9R5
rznvVed95ryP9QIFLlzhVOJY4wJFLljlAmUuWOcChS5Y6QKlLljrAsUuWO0C5S5Y7wIFL1jxAiUv
WPMSNS9Z8xI1L93PdeoHO9a8RM1L1rxEzUvWvETNS9a8RM1L1rxEzUvWvETNS9a8RM1L1rxCzSvW
vELNK9a8Qs0r99tM9etM1rxCzSvWvELNK9a8Qs0r1rxCzSvWvELNK9a8Qs0r1rxGzWvWvEbNa9a8
Rs1r1rxGzWv3Nzz1RzzWvEbNa9a8Rs1r1rxGzWvWvEbNa9a8Rs1r1rxBzRvWvEHNG9a8Qc0b1rxB
zRvWvEHNG/fJFfXRFda8Qc0b1rxBzRvWvEHNG9a8Qc0b1rxFzVvWvEXNW9a8Rc1b1rxFzVvWvEXN
W9a8Rc1b93lN9YFN1rxFzVvWvEXNW9a8Rc1b1ryDmndY8w5q3mHNO6h5hzXvoOYd1ryDmndY8w5q
3mHNO6h5x91SUNcUWPMOat5hzTuoeYc176LmXda8i5p3WfMuat5lzbuoeZc176LmXda8i5p3WfMu
at5lzbuoedfdzVOX81jzLmreZc17qHmPNe+h5j3WvIea91jzHmreY817qHmPNe+h5j3WvIea91jz
HmreY817qHnP3UhXV9LhnXR2Kd3dSv+oa+kfdy/9oy6mf9zN9I+6mv5xd9M/6nL6x91O/6jr6R93
P/2jLqh/3A31j7qi/nF31D/qkvrH3VL/qGvqH9dBhrNInYXxLK6DDGiBQgsjWqDRwpAWqLQwpgU6
LQxqgVILo1qg1cKwFqi1MK7FeS2hwJZwYksosiUSOmUMKnMdVGxLOLclFNwSTm4JRbeEs1tC4S3h
9JZQfEs4vyUU4BJOcAlFuIQzXEIhLuEUl1CMSzjHJRTkEgXFTkZ2ug4qzCWc5hKKcwnnuYQCXcKJ
LqFIl3CmSyjUJZzqEop1Cee6hIJdwskuoWiXcLZLKNwlnO4SineJhnY1w6tdBxXxEs54CYW8hFNe
QjEv4ZyXUNBLOOklFPUSznoJhb2E015CcS/hvJdQ4Es48SUU+RLOfAmFvsTAb3FgX+PgOqjgl3Dy
Syj6JZz9Egp/Cae/hOJfwvkvoQCYcAJMKAImnAETCoEJp8CEYmDCOTChIJhwEkwoCiYWfp8R+0Ij
10HFwYTzYEKBMOFEmFAkTDgTJhQKE06FCcXChHNhQsEw4WSYUDRMOBsmFA4TTocJxcOE82FCATFx
4Df7sa/2cx1USEw4JSYUExPOiQkFxYSTYkJRMeGsmFBYTDgtJhQXE86LCQXGhBNjQpEx4cyYUGhM
ODUmFBsTF37HLfuSW9dBRceEs2NC4THh9JhQfEw4PyYUIBNOkAlFyIQzZEIhMuEUmVCMTDhHJhQk
E06SCUXJhLNkQmEy8eC3vbOve/+RHfzt6+d/fPv1r2+//vL1+/c///7653/Bj/4n2f786+w/OLPk
wf//zKHOHO7Mqc6c7sylzlzuzK3O3O7Mo8487syrzrzuzEedGf7/+aozX3fmp878YFNYCEOW0KUQ
tjBYDAPWMFgOA/YwWBADFjFYEgM2MVgUA1YxWBYDdjFYGAOWMVgaA7YxWRsTtjFZG1P+nOh+UIRt
TNbGhG1M1saEbUzWxoRtTNbGhG1M1saEbUzWxoRtTNbGhG0s1saCbSzWxoJtLNbGkr9Fdb9GhW0s
1saCbSzWxoJtLNbGgm0s1saCbSzWxoJtLNbGgm1s1saGbWzWxoZtbNbGhm1s1saWf2N0f2SEbWzW
xoZtbNbGhm1s1saGbWzWxoZtbNbGhm0c1saBbRzWxoFtHNbGgW0c1saBbRzWxpGfwHEfwYFtHNbG
gW0c1saBbRzWxoFtHNbGgW1c1saFbVzWxoVtXNbGhW1c1saFbVzWxoVtXNbGlZ9PdR9QhW1c1saF
bVzWxoVtXNbGhW08rI0HtvGwNh7YxsPaeGAbD2vjgW08rI0HtvGwNh7YxsPaeOTtDXd9A7bxsDYe
2MbD2nhgGy9r44VtvKyNF7bxsjZe2MbL2nhhGy9r44VtvKyNF7bxsjZe2MbL2njl3UZ3ufH/2HvX
5riRJE33+/wKWJutdbcdUQX3vOvYjFlNt6pGu9UlHVX1zI5NjcnATJBECwlkA0hR7P3zJzwicEmS
kqgufxHotZzdnZUoFjyu/npEeDwB1MY1TBvXQG3cwLRxA9TGDUwbN0Bt3MC0cQPUxg1MGzdAbdzA
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
i9ZfLNSK0FQrwmKtCM21IizYitBkK8KirQjNtiIs3IrQdCvC4q0IzbciLOCK0IQrwiKuCM24Iizk
itCUK8JirmgNf9se/Lg9Wn+xqCtCs64IC7siNO2KsLgrQvOuCAu8IjTxirDIK0IzrwgLvSI09Yqw
2CtCc68IC74iNPmKsOgrQrOvCAu/IjT9irD4K0LzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOv
GMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0
/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+Ksfwr
RvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjL
v2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+K
sfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bz
rxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79i
NP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8
K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Y
y79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/
irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG
868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwryOePhfnb
RZLn0TZPk6rWtsAnLRTrf75vnxhbdkKWnbBlZ2TZGVv2GbLsM2zZ58iyz7FlXyDLvsCWfYks+xJb
9hWy7Cts2dfIsq+xZd8gy74BaxNUWAmtrFhpBWsrQcWVwOpKUHklsL4SVGAJrLAElVgCayxBRZbA
KktQmSWwzhJUaAmstASVWgJrLUO1lsFay1CtZfQ6FruQBWstQ7WWwVrLUK1lsNYyVGsZrLUM1VoG
ay1DtZbBWstQrWWw1jJUaxmstTOo1s7AWjuDau0MrLUzqNbO0LvG2G1jsNbOoFo7A2vtDKq1M7DW
zqBaOwNr7QyqtTOw1s6gWjsDa+0MqrUzsNbOoVo7B2vtHKq1c7DWzqFaOwdr7RyqtXP0GS32kBas
tXOo1s7BWjuHau0crLVzqNbOwVo7h2rtHKy1c6jWzsFau4Bq7QKstQuo1i7AWruAau0CrLULqNYu
wFq7gGrtAp0RhU2JAmvtAqq1C7DWLqBauwBr7QKqtQuw1i6gWrsAa+0SqrVLsNYuoVq7BGvtEqq1
S7DWLqFauwRr7RKqtUuw1i6hWrtE5x9jE5DBWruEau0SrLVLqNYuwVq7hGrtEqy1K6jWrsBau4Jq
7QqstSuo1q7AWruCau0KrLUrqNauwFq7gmrtCqy1K6jWrtC3fbDXfcBau4Jq7QqstSuo1q7AWruG
au0arLVrqNauwVq7hmrtGqy1a6jWrsFau4Zq7RqstWuo1q7BWruGau0arLVrqNau0XdrsZdrwVq7
hmrtGqy1G6jWbsBau4Fq7QastRuo1m7AWruBau0GrLUbqNZuwFq7gWrtBqy1G6jWbsBau4Fq7Qas
tRuo1m7QJAssygLOsgDDLNA0ixiLs4jRPIsYC7SI0USLGIu0iNFMixgLtYjRVIsYi7WI0VyLGAu2
iNFkixiLtojRbIsYC7eI0XSLGIu3iNH6C4ZJ4WlSYJwUWn/BQCk4UQqMlIIzpcBQKThVCoyVgnOl
wGApOFkKjJaCs6XAcCk4XQqMl0LzpQgLmCI0YYqwiCliOM8RDHRE6y8WM0VozhRhQVOEJk0RFjVF
aNYUYWFThKZNERY3RWjeFGGBU4QmThEWOUVo5hRhoVOEpk4RFjtFaO4UYcFTNIMTlcFIZbT+YuFT
hKZPERY/RWj+FGEBVIQmUBEWQUVoBhVhIVSEplARFkNFaA4VYUFUhCZRERZFRWgWFWFhVISmUREW
R0Vz+JsG4EcN0PqLRVIRmklFWCgVoalUhMVSEZpLRVgwFaHJVIRFUxGaTUVYOBWh6VSExVMRmk9F
WEAVoQlVhEVUEZpRRVhIFS3grwqBnxVC6y8WVEVoUhVhUVWEZlURFlZFaFoVYXFVhOZVERZYRWhi
FWGRVYRmVhEWWkVoahVhsVWE5lYRFlxFaHIVYdFVtIS/6wd+2A+tv1h8FaH5VYQFWBGaYEVYhBWh
GVaEhVgRmmJFWIwVoTlWhAVZEZpkRViUFaFZVoSFWRGaZkVYnBWheVaEBVrRCv6yLvhpXbT+YqFW
hKZaERZrRWiuFWHBVoQmWxEWbUVothVh4VaEplsRFm9FaL4VYQFXhCZcERZxRWjGFWEhV4SmXBEW
c0Vr+Nv24Mft0fqLRV0RmnVFWNgVoWlXhMVdEZp3RVjgFaGJV4RFXhGaeUVY6BWhqVeExV4RmntF
WPAVoclXhEVfEZp9RVj4FaHpV4TFXxGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5
V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8x
mn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+
FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM
5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/
xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj
+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVf
MZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY
/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lX
jOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGa
f8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4V
o/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfQT5/LMzfLpI8j7Z5
mlS1toXZSQvF+p/v2yfGlp2QZSds2RlZdsaWfYYs+wxb9jmy7HNs2RfIsi+wZV8iy77Eln2FLPsK
W/Y1suxrbNk3yLJvwNoEFVZCKytWWsHaSlBxJbC6ElReCayvBBVYAissQSWWwBpLUJElsMoSVGYJ
rLMEFVoCKy1BpZbAWstQrWWw1jJUaxm9jsUuZMFay1CtZbDWMlRrGay1DNVaBmstQ7WWwVrLUK1l
sNYyVGsZrLUM1VoGa+0MqrUzsNbOoFo7A2vtDKq1M/SuMXbbGKy1M6jWzsBaO4Nq7QystTOo1s7A
WjuDau0MrLUzqNbOwFo7g2rtDKy1c6jWzsFaO4dq7RystXOo1s7BWjuHau0cfUaLPaQFa+0cqrVz
sNbOoVo7B2vtHKq1c7DWzqFaOwdr7RyqtXOw1i6gWrsAa+0CqrULsNYuoFq7AGvtAqq1C7DWLqBa
u0BnRGFTosBau4Bq7QKstQuo1i7AWruAau0CrLULqNYuwFq7hGrtEqy1S6jWLsFau4Rq7RKstUuo
1i7BWruEau0SrLVLqNYu0fnH2ARksNYuoVq7BGvtEqq1S7DWLqFauwRr7QqqtSuw1q6gWrsCa+0K
qrUrsNauoFq7AmvtCqq1K7DWrqBauwJr7QqqtSv0bR/sdR+w1q6gWrsCa+0KqrUrsNauoVq7Bmvt
Gqq1a7DWrqFauwZr7RqqtWuw1q6hWrsGa+0aqrVrsNauoVq7BmvtGqq1a/TdWuzlWrDWrqFauwZr
7QaqtRuw1m6gWrsBa+0GqrUbsNZuoFq7AWvtBqq1G7DWbqBauwFr7QaqtRuw1m6gWrsBa+0GqrUb
NMkCi7KAsyzAMAs0zSLG4ixiNM8ixgItYjTRIsYiLWI00yLGQi1iNNUixmItYjTXIsaCLWI02SLG
oi1iNNsixsItYjTdIsbiLWK0/oJhUniaFBgnhdZfMFAKTpQCI6XgTCkwVApOlQJjpeBcKTBYCk6W
AqOl4GwpMFwKTpcC46XQfCnCAqYITZgiLGKKGM5zBAMd0fqLxUwRmjNFWNAUoUlThEVNEZo1RVjY
FKFpU4TFTRGaN0VY4BShiVOERU4RmjlFWOgUoalThMVOEZo7RVjwFM3gRGUwUhmtv1j4FKHpU4TF
TxGaP0VYABWhCVSERVARmkFFWAgVoSlUhMVQEZpDRVgQFaFJVIRFURGaRUVYGBWhaVSExVHRHP6m
AfhRA7T+YpFUhGZSERZKRWgqFWGxVITmUhEWTEVoMhVh0VSEZlMRFk5FaDoVYfFUhOZTERZQRWhC
FWERVYRmVBEWUkUL+KtC4GeF0PqLBVURmlRFWFQVoVlVhIVVEZpWRVhcFaF5VYQFVhGaWEVYZBWh
mVWEhVYRmlpFWGwVoblVhAVXEZpcRVh0FS3h7/qBH/ZD6y8WX0VofhVhAVaEJlgRFmFFaIYVYSFW
hKZYERZjRWiOFWFBVoQmWREWZUVolhVhYVaEplkRFmdFaJ4VYYFWtIK/rAt+Whetv1ioFaGpVoTF
WhGaa0VYsBWhyVaERVsRmm1FWLgVoelWhMVbEZpvRVjAFaEJV4RFXBGacUVYyBWhKVeExVzRGv62
Pfhxe7T+YlFXhGZdERZ2RWjaFWFxV4TmXREWeEVo4hVhkVeEZl4RFnpFaOoVYbFXhOZeERZ8RWjy
FWHRV4RmXxEWfkVo+hVh8VeE5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM
5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/
xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj
+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZf
MZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo
/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lX
jOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGW
f8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4V
Y/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zm
XzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/F
aP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5
V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V5DPHwvzt4skz6NtniZVrW1h
cdJCsf7n+/aJsWUnZNkJW3ZGlp2xZZ8hyz7Dln2OLPscW/YFsuwLbNmXyLIvsWVfIcu+wpZ9jSz7
Glv2DbLsG7A2QYWV0MqKlVawthJUXAmsrgSVVwLrK0EFlsAKS1CJJbDGElRkCayyBJVZAussQYWW
wEpLUKklsNYyVGsZrLUM1VpGr2OxC1mw1jJUaxmstQzVWgZrLUO1lsFay1CtZbDWMlRrGay1DNVa
BmstQ7WWwVo7g2rtDKy1M6jWzsBaO4Nq7Qy9a4zdNgZr7QyqtTOw1s6gWjsDa+0MqrUzsNbOoFo7
A2vtDKq1M7DWzqBaOwNr7RyqtXOw1s6hWjsHa+0cqrVzsNbOoVo7R5/RYg9pwVo7h2rtHKy1c6jW
zsFaO4dq7RystXOo1s7BWjuHau0crLULqNYuwFq7gGrtAqy1C6jWLsBau4Bq7QKstQuo1i7QGVHY
lCiw1i6gWrsAa+0CqrULsNYuoFq7AGvtAqq1C7DWLqFauwRr7RKqtUuw1i6hWrsEa+0SqrVLsNYu
oVq7BGvtEqq1S3T+MTYBGay1S6jWLsFau4Rq7RKstUuo1i7BWruCau0KrLUrqNauwFq7gmrtCqy1
K6jWrsBau4Jq7QqstSuo1q7AWruCau0KfdsHe90HrLUrqNauwFq7gmrtCqy1a6jWrsFau4Zq7Rqs
tWuo1q7BWruGau0arLVrqNauwVq7hmrtGqy1a6jWrsFau4Zq7Rp9txZ7uRastWuo1q7BWruBau0G
rLUbqNZuwFq7gWrtBqy1G6jWbsBau4Fq7QastRuo1m7AWruBau0GrLUbqNZuwFq7gWrtBk2ywKIs
4CwLMMwCTbOIsTiLGM2ziLFAixhNtIixSIsYzbSIsVCLGE21iLFYixjNtYixYIsYTbaIsWiLGM22
iLFwixhNt4ixeIsYrb9gmBSeJgXGSaH1FwyUghOlwEgpOFMKDJWCU6XAWCk4VwoMloKTpcBoKThb
CgyXgtOlwHgpNF+KsIApQhOmCIuYIobzHMFAR7T+YjFThOZMERY0RWjSFGFRU4RmTREWNkVo2hRh
cVOE5k0RFjhFaOIUYZFThGZOERY6RWjqFGGxU4TmThEWPEUzOFEZjFRG6y8WPkVo+hRh8VOE5k8R
FkBFaAIVYRFUhGZQERZCRWgKFWExVITmUBEWREVoEhVhUVSEZlERFkZFaBoVYXFUNIe/aQB+1ACt
v1gkFaGZVISFUhGaSkVYLBWhuVSEBVMRmkxFWDQVodlUhIVTEZpORVg8FaH5VIQFVBGaUEVYRBWh
GVWEhVTRAv6qEPhZIbT+YkFVhCZVERZVRWhWFWFhVYSmVREWV0VoXhVhgVWEJlYRFllFaGYVYaFV
hKZWERZbRWhuFWHBVYQmVxEWXUVL+Lt+4If90PqLxVcRml9FWIAVoQlWhEVYEZphRViIFaEpVoTF
WBGaY0VYkBWhSVaERVkRmmVFWJgVoWlWhMVZEZpnRVigFa3gL+uCn9ZF6y8WakVoqhVhsVaE5loR
FmxFaLIVYdFWhGZbERZuRWi6FWHxVoTmWxEWcEVowhVhEVeEZlwRFnJFaMoVYTFXtIa/bQ9+3B6t
v1jUFaFZV4SFXRGadkVY3BWheVeEBV4RmnhFWOQVoZlXhIVeEZp6RVjsFaG5V4QFXxGafEVY9BWh
2VeEhV8Rmn5FWPwVoflXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVf
MZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY
/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lX
jOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGa
f8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4V
o/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zl
XzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/F
WP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5
V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8x
mn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+
FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM
5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hXk88fC/O0iyfNom6dJVetYcF8vizSq
0iar0iire0uaJrY3SXGdRu/T9FBHefYhjYyRGmBBPhvVx+qD2GhuS1+xfVo0MHO+7coiam6M0Zus
2ikOgPK2uK6SXRrxxb+QGWIH0/vpP18leZ2+GDaoHeEB7F7lyXU9lt2+N/08GLfaD82nH9LqzrbB
uGXYRXVemlIkRXQps9f8d0W6G68M8jvmV2oz6vM760GkPGPZTz8e8mybNc5ZBRkKjxcBOxxmgTzA
LJAHmIX1ALMJeIDZBDzALLAHmIX3ALOJeIBFIA+wCOQBFmE9wGICHmAxAQ+wCOwBFuE9wGIiHuAk
FpEPBVgEPDA7zhrAmQ21BPiU9dG7O+gCoC1CoPjfmQ8Z/n+uBCOGguPN/FmYmT8LOvNn4Wf+LPzM
n4Wd+bPgM382jZm/CDPzF2Fm/iLozF+En/mL8DN/EXbmL4LP/AVq5vs//Xf7y7/Zp0l9bE8ozK//
n3/6p3sl7stYHppsn/0tabKyuNgm25v04rIs38uszIq+AI8Z919r6/6brEn31t5/faFdkp2xaobe
Lr1KjnkT7arkqqnt2UpTvk+1TnGSy1omWGmas8pMBxzr1Blx9nSMZMWHJM927pu9LbOcy+voMtm+
/+Wb0QzFo1nS4kE/wdQFjWbKjI3RbPHz8Xpr84n/0SlA58TulcA4oMQdnR4OZWXmuxk2o1vk0S3O
xm9VpeSSrRlHl5VVguhiwzybrTieLdeL+Wq1WMdrYyk6VOk23Rk/aos1VAiwaQ5nejaG6YeWVyO1
96OWOZhlWGu7LIubpI6SqCiLv6VVGeXlbVpFlybk2+kbucoKExKZGbstq52phqadYTPORxoo85GG
xRw+COay+rFutDQxYvXB2jVqmV6VVWrC0m1WS0HiADYpgE0lkTRLt9uoNZxJEtPuaPowKqtol9XJ
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
E3HgnYk48MZEHHhfIg68LREH3pWIw25KxIH3JOKwWxJx4B2JOOyGRBx4PyIOux0RB96NiANvRsSB
9yLiwFsRceidiDj0RkQceB8iDr0NEYfehYgDb0LEofcg4tBbEHHoHYigKRLLuYT/s03APYj7RRh/
IpyUgMI3AgVvBA7fCLNJFCFwP8zDN8IifBGW4YsQ2jtzeO/Mwb0zh/fOHNw7c3jvHGrP4qQEs/CN
MAveCPPwjbAIX4Rl+CKE1odwGxmnZaBplCHktAy3o3Fahtk0yhC6K+YTaIbFBMqwnEAZAnrJOPQO
Rxx4fyMOvbsRB97biEPvbMSh9zXiwLsaceg9jTj0jkYcej8jDr2bEYfey4gD72TEofcx4sC7GHHo
PYw48A5GHHr/Ig68exGH3ruIQ+9cxKH3LeLQuxZx8D2LOPiORRx6vyIOvlsRB9+riEPvVMTB9yni
4LsUcfA9iqBZGFnxIcmzXbQr5cXQKJOXDv+SyjgzQ+5KHq3PivpgfiDvycvzgsl1erY8Pct6rznm
yV1aXeTlNskv7o001RcdsyJrsiTP76KiFC+3TfM88a/XWm+o0+T+Y9LWH7Ja5o/Od01Z0yjZvi/K
2zzdXduG7h4ErqMivU0r+3fpBR2T+6TZ3sjIuG92m6dJVStb2x0PebZ9rJamKW+Sap8bazqm6uMh
rcx/aaZB+sFWyImerVe0PVaV/PA6LdLKjpCz1bPVs9Wz1bPVs9Wz1bPVs9Wz1bPVs9Wz1bPVs9Wz
1bPVs9Wz1bPVs9Wz1bPVs9Wz1bPVs9Wz1bPVx60m0eWxvosOZZ5HxpCcXzc3aXeeHP31mB7TqDoW
RaJ2ft5b3GW7SOpoapZW1vD+2LhMgMvyWOyS6k7HZFefKk22N6aSWVNHuRyqR7tjJQfr2g2b7fI0
urZn6Lu9WEuKKP24zY919qGvpqKtruXSj+n2+ORsMb3skbaNLx50nWrySJvV8e9/irbGkBk4pm1N
z+5LM5LKItvqJo8YM1W6zZNsLxMgurxrUmcv+ZBkud6kOFTl1rRfdLi5q7NtkkdXZdkczNBsXK5Q
stO3tS33B9N3l1meNXfRTXZ9c3GbyExUt5hnV6kZKmn09qef5Ot1ekjMbEvzO2VD79OqSI0ra+0N
WrEwk29nOq91pUkumU6KDlzmX91kW9OJx8s8q296U8WuL1J5KYlC1nCtb7lKd4nNIRNv+kgzXGVp
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
I7w3I3u5fS8gihhhlB3sSIPswEcbYwfPM8TB+39RAKgm8fvvcNlV0JmPQwsM9fEGiAz38SaIDrmA
Yx9FHm/ABd37aAuYh3sKkCoIxvDwvdCSA763AbIjvrcJokMu6eH7kMcb8DE8fF8LWIb7x+D9vKx1
F6oP/ZNLtFe3gvyZBQhiJgDFrIDiViBkViDkViBlViDlVmDKqwCeoBwuDnV3FNtHevGZ5d+ZTpdu
0+/aNJUp6a8LPpomvrfT/8vGlHbj57JU+G3/ve8HSZwEiUqm/jRIptPdC2iPS2zM3DSmysw+qSpK
gyScpNNEhVGcpPEJYlH1Y+1MoiBWEz+OokBN4/RUiUfbGU2jMAwUCE2TZKLCvUL3kPLhduKNTVMV
+Kkfh9No6icnizzeoXEKMtNgAt0Q+0qdIvZ4h4ZJkIbQY9FUQSujdHKqxKPtnEwn6WQKoxVEfhRN
di+UPrw0cWTU4ziBHk3C6TSdRFF8mrinenIawOikfhgEURiHT8l8yi7DaQwmrsLAj6eRPzlJ3NEW
hjDMU7CdRIEdgVz11Kpef2H8xeM7gklX9PC2ZbuivWpqvIW0f7yxvKN68jwv5rZbOgeUN/q23f6S
CseVm6Bwe4N7hU/Z2dqLmzrTs3Wpmzu6N9X7u5xBG0gmZ0AJ9bzXC3JrfFeeinyuGuiyO6+4quwm
CmJjJ5IKd5kpvtNpXMEU0f7Curuo5xcN7td611U9a/vtaewoNoi8ti+3ZnVZ6hXW/tR9ERjVFaqV
53Y3raXZq8tx62TdVPbJ2AXZreU3ulwbl1t0Cxj7RV3mH7wq8K4Db+W/D6iMuRft/f67f6YXn5ub
IrMFKbdswlkavtkq5Wn6RjxL458wnZTXdFJO00kZTSflNZ2U1XRSAdMJ3vucpkMmfp/pUAtnafh+
06EXz9L4w6ajeAlLcRKWYiQsxUtYipWwlAhhKV7CUpyEpRgJS/ESlmIlLCVCWIqXsBQnYSlGwlK8
hKVYCUvJEJbPzFg+K2X5nJzlM5OWz8tavgxt+cy85bMSl8/JXD4zdfm83OXLkJfPzF4+K335nPzl
MxOYz8tgvgiFMTMYK4Fx8hczffGylwx5MXMXK3VxMhczcfHylgxtMbMWK2lxchYzZfEylgxhve1q
ve1qve1qve1qve1qve1qffm7WikvYaWchJUyElbKS1gpK2GlIoSV8hJWyklYKSNhpbyElbISVipC
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
eMrM4lMZFp8ys/hUhsWnzCw+lWHxKTOLT2VYfMrM4lMZFp8ys/hUhsWnzCw+lWHxKTOLT2VYfMrM
4lMZFp9y3/kidOkL+60vUte+cN/74gtd/OJz3/ziC1394nPf/eILXf7ic9/+4gtd/+Jz3//iC10A
43PfAOMLXQHjc98B4wtdAuNz3wLjC10D43PfA+MLXQTjczO71IVu/De6SV3pxs3sUpe6sd/qJnWt
G/u9blIXu7Hf7CZ1tRv73W5Sl7ux3+4mdb0b+/1uUhe8sd/wJnXFG/cdb4HQJW8B9y1vgdA1b4Fi
v61V6rpWbmYXuuot4L7rLRC67C3gvu0tELruLeC+7y0QuvAt4L7xLRC68i3gvvMtELr0LeC+9S0Q
uvYt4L73LRC6+C3gvvktELr6LeC++y0QuvwtCNlvYpe6ip2b2YUugAu4b4ALhK6AC7jvgAuELoEL
uG+BC4SugQu474ELhC6CC7hvgguEroILuO+CC4Qugwu4b4MLhK6DC7jvgwuELoQLuG+EC4SuhAsi
9ldWpJ5Z4WZ2oWvhAu574QKhi+EC7pvhAqGr4QLuu+ECocvhAu7b4QKh6+EC7vvhAqEL4gLuG+IC
oSviyHDaTJe6+eDBP662GnnusenWm5l5DZoWoGNW1i2+ftvpK1ro/j1o0HEDb6q89W6LbuGVprrq
FsS6Wple0dqHiLXXmgafuTZNUzce/M98Mtm607PSeFm9XJUG36rm0tla0qoxthGthw9u30H3W3QY
Bezx2V1naOCrdVlaybq6+34+yqg/bILY6D/SfTwrONwH41hDd7dCK2j03bgmsdsOebu41wtfgHHs
7w1xC/HmRdN2X4KN7GmJqJXs64lx7eRoj4haymydX5luMIHG/LQG9NwDuiuxd9qugD9QDkgPaD4t
9LrFXh0GoavrEhowX7e6pIFaV7nJwOZBn1VT3xQtoOnSw78fQFuwPBqw3qIyXaHcBeSBwBLeThNQ
v9Og+j/9afjwN0uj23VjbM6KH//3v/mbB63atqNemUoXF4h2Ua+71Xqr3z7AXsKg0zdFZ5YW449P
jaMp69uLn9a66cBxoH+vwGJb7FfsaLBVmm795R9+7q1bcIMW4MA8MgwVVlhLAzDX4IjrVQ6u13p5
ba1iXtZ17pX1FRFGC3+4aIu/gBU0pgNvRueGaGtKvQKBHvz9iqrDbD+1i7rpEKWr0fTa9XxefHr2
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
t8PxuSmOz+1wfG6K43M7HJ+b4vjcDsfnpjg+t8PxuSmOz+1wfG6K43M7HL8wxfELOxy/MMXxCzsc
vzDF8Qs7HL8wxfELOxy/MMXxCzscvzDF8Qs7HL8wxfELOxy/MMXxCzscvzTF8Us7HL80xfFLOxy/
NMXxSzscvzTF8Us7HL80xfFLOxy/NMXxSzscvzTF8Us7HL80xfFLOxy/MsXxKzscvzLF8Ss7HL8y
xfErOxy/MsXxKzscvzLF8Ss7HL8yxfErOxy/MsXxKzscvzLF8Ss7HL82xfFrOxy/NsXxazscvzbF
8Ws7HL82xfFrOxy/NsXxazscvzbF8Ws7HL82xfFrOxy/NsXxazscvzHF8Rs7HL8xxfEbOxy/McXx
GzscvzHF8Rs7HL8xxfEbOxy/McXxGzscvzHF8Rs7HL8xxfEbOxy/NcXxWzscvzXF8Vs7HL81xfFb
Oxy/NcXxWzscvzXF8Vs7HL81xfFbOxy/NcXxWzscvzXF8VvDPCDbhE5nmNHpbFM6nWFOp7NN6nSG
WZ3ONq3TGeZ1OtvETmeY2elsUzudYW6ns03udIbZnc42vdNZ5ncaJ3haZngap3ha5ngaJ3laZnka
p3la5nkaJ3paZnoap3pa5noaJ3taZnsap3sa5ns624RPZ5jx6WxTPp1hzqezTfp0hlmfzjbt0xnm
fTrbxE9nmPnpbFM/nWHup7NN/nSG2Z/ONv3TGeZ/OtsEUGeYAepsU0CdYQ6os00CdYZZoM42DdQZ
5oE620RQZ5gJ6mxTQZ1hLqizTQZ1htmgzjYd1BnmgzrbhFBnmBHqbFNCnWFOqLNNCnWGWaHONi3U
GeaFOtvEUGeYGepsU0OdYW6os00OdYbZoc42PdQZ5oc62wRRZ5gh6mxTRJ1hjqizTRJ1hlmizjZN
1BnmiTrbRFFnmCnqbFNFnWGuqLNNFnWG2aLONl3UqeeLcv+NoSNhrLtYhqJq1nHpK+rap0SIWiP4
9lFaQ2OXR24v2dTLoEwiqyNsNrIzG/ncbOS5VgeKNtZr7lYkbYS6DTZxUO/77ZfL/XZf+R6bhLSh
C9gCqj+EUHNjFcX7SY8q9QoDumHXU8u5XRX7YgU7mbXb0aGIXZhT66U2bD0+Bl8sYB4lHJtS/7MI
c6ZmsdSCwffUDLdZybqUj+uI2iKsGmwlRX3idfdubD+YVrZsm66btPRRA67dxtdD06paumfnlLTX
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
QXcfdzv5jd/9/Xf/C/ADMB8=
````

### vq-context-functional-v1/catalogue/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### vq-context-functional-v1/rotary/stdout.txt

Original bytes: 1233. SHA-256: `c9c6bae2934623b703f4d090663e0dad13d52662f2880570792f673094a47b96`.

Normalized bytes: 1233. SHA-256: `c9c6bae2934623b703f4d090663e0dad13d52662f2880570792f673094a47b96`.

````text
{"items":[{"passed":true,"name":"all reference cosine coefficients"},{"passed":true,"name":"all reference sine coefficients"},{"name":"every existing cosine bit","passed":true},{"name":"every existing sine bit","passed":true},{"name":"noncontiguous positions and batch shape","passed":true},{"name":"noncontiguous sine positions","passed":true},{"name":"refuse invalid positions []","passed":true},{"name":"refuse invalid positions [-1]","passed":true},{"name":"refuse invalid positions [262144]","passed":true},{"name":"refuse invalid positions [0, -1]","passed":true},{"name":"refuse invalid positions [2147483647]","passed":true},{"name":"symlink refused","passed":true},{"name":"directory refused","passed":true},{"name":"missing file refused","passed":true},{"name":"truncated component refused","passed":true},{"name":"complete wrong digest refused","passed":true},{"name":"early cancellation refused","passed":true},{"name":"mid-read cancellation refused","passed":true},{"name":"cancellation reached an active read","passed":true},{"name":"refused loads preserve owned coefficients","passed":true},{"name":"coefficient checks fit two GB","passed":true}],"name":"quantization-extended-rotary","passed":true,"measurements":{}}
````

### vq-context-functional-v1/rotary/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### vq-context-functional-v1/context-4096/stdout.txt

Original bytes: 50657. SHA-256: `15c63a32a5d8f7f674ddaf347036ef774a808778b6b2f40e0607137c75af50fc`.

Normalized bytes: 50657. SHA-256: `15c63a32a5d8f7f674ddaf347036ef774a808778b6b2f40e0607137c75af50fc`.

````text
{
  "composite_sha256" : "f31f100d47f062c415251d92a4c14956b2328e393294a9680eb2ba9c1664f645",
  "context_limit" : 4096,
  "draft_sha256" : "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744",
  "inventory_sha256" : "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
  "minimum_headroom_bytes" : 3000000000,
  "observations" : [
    {
      "consumed" : 512,
      "peak_process_bytes" : 8305791752
    },
    {
      "consumed" : 1024,
      "peak_process_bytes" : 8312755048
    },
    {
      "consumed" : 1536,
      "peak_process_bytes" : 8437568408
    },
    {
      "consumed" : 2048,
      "peak_process_bytes" : 8437568408
    },
    {
      "consumed" : 2560,
      "peak_process_bytes" : 8437568408
    },
    {
      "consumed" : 3072,
      "peak_process_bytes" : 8437568408
    },
    {
      "consumed" : 3584,
      "peak_process_bytes" : 8437568408
    },
    {
      "consumed" : 4088,
      "peak_process_bytes" : 8437568408
    }
  ],
  "peak_process_bytes" : 8437568408,
  "process_bound_bytes" : 10000000000,
  "qualification" : "unproven",
  "report" : {
    "items" : [
      {
        "name" : "prefill boundary 0",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 0",
        "passed" : true
      },
      {
        "name" : "prefill boundary 512",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 512",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1024",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1024",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1536",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1536",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2048",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2048",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2560",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2560",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3072",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3072",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3584",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3584",
        "passed" : true
      },
      {
        "name" : "draft discard at long context fields",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context lastMulti",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.index",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.key",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.offset",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.value",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ngram",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ple.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context tokens",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.7",
        "passed" : true
      },
      {
        "name" : "draft proposals survive exact restore",
        "passed" : true
      },
      {
        "name" : "kept target logits at long context",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback fields",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ngram",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ple.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback tokens",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation fields",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context continuation logits",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context continuation multi",
        "passed" : true
      },
      {
        "name" : "long-context continuation ngram",
        "passed" : true
      },
      {
        "name" : "long-context continuation ple.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation tokens",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.7",
        "passed" : true
      },
      {
        "name" : "complete context consumed",
        "passed" : true
      },
      {
        "name" : "over-limit refused",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state fields",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state lastMulti",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.index",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.key",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.offset",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.value",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ngram",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ple.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state tokens",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.7",
        "passed" : true
      },
      {
        "name" : "final target and head committed",
        "passed" : true
      },
      {
        "name" : "no leaked expert pins",
        "passed" : true
      },
      {
        "name" : "context fits process envelope",
        "passed" : true
      }
    ],
    "measurements" : {

    },
    "name" : "quantization-context-4096",
    "passed" : true
  },
  "rotary_sha256" : "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a",
  "schema" : 1,
  "scope" : "native staged context, exact continuation and draft recovery; no held-out quality or speed qualification"
}
````

### vq-context-functional-v1/context-4096/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### vq-context-functional-v1/context-4096-output/receipt.json

Original bytes: 50656. SHA-256: `c250d36d99ec475f150b5069f156b8741c21cd234cb02f4fbabe2542a6c73890`.

Normalized bytes: 50656. SHA-256: `c250d36d99ec475f150b5069f156b8741c21cd234cb02f4fbabe2542a6c73890`.

````text
{
  "composite_sha256" : "f31f100d47f062c415251d92a4c14956b2328e393294a9680eb2ba9c1664f645",
  "context_limit" : 4096,
  "draft_sha256" : "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744",
  "inventory_sha256" : "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
  "minimum_headroom_bytes" : 3000000000,
  "observations" : [
    {
      "consumed" : 512,
      "peak_process_bytes" : 8305791752
    },
    {
      "consumed" : 1024,
      "peak_process_bytes" : 8312755048
    },
    {
      "consumed" : 1536,
      "peak_process_bytes" : 8437568408
    },
    {
      "consumed" : 2048,
      "peak_process_bytes" : 8437568408
    },
    {
      "consumed" : 2560,
      "peak_process_bytes" : 8437568408
    },
    {
      "consumed" : 3072,
      "peak_process_bytes" : 8437568408
    },
    {
      "consumed" : 3584,
      "peak_process_bytes" : 8437568408
    },
    {
      "consumed" : 4088,
      "peak_process_bytes" : 8437568408
    }
  ],
  "peak_process_bytes" : 8437568408,
  "process_bound_bytes" : 10000000000,
  "qualification" : "unproven",
  "report" : {
    "items" : [
      {
        "name" : "prefill boundary 0",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 0",
        "passed" : true
      },
      {
        "name" : "prefill boundary 512",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 512",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1024",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1024",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1536",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1536",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2048",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2048",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2560",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2560",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3072",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3072",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3584",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3584",
        "passed" : true
      },
      {
        "name" : "draft discard at long context fields",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context lastMulti",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.index",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.key",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.offset",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.value",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ngram",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ple.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context tokens",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.7",
        "passed" : true
      },
      {
        "name" : "draft proposals survive exact restore",
        "passed" : true
      },
      {
        "name" : "kept target logits at long context",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback fields",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ngram",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ple.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback tokens",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation fields",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context continuation logits",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context continuation multi",
        "passed" : true
      },
      {
        "name" : "long-context continuation ngram",
        "passed" : true
      },
      {
        "name" : "long-context continuation ple.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation tokens",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.7",
        "passed" : true
      },
      {
        "name" : "complete context consumed",
        "passed" : true
      },
      {
        "name" : "over-limit refused",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state fields",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state lastMulti",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.index",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.key",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.offset",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.value",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ngram",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ple.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state tokens",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.7",
        "passed" : true
      },
      {
        "name" : "final target and head committed",
        "passed" : true
      },
      {
        "name" : "no leaked expert pins",
        "passed" : true
      },
      {
        "name" : "context fits process envelope",
        "passed" : true
      }
    ],
    "measurements" : {

    },
    "name" : "quantization-context-4096",
    "passed" : true
  },
  "rotary_sha256" : "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a",
  "schema" : 1,
  "scope" : "native staged context, exact continuation and draft recovery; no held-out quality or speed qualification"
}
````

### vq-context-functional-v1/context-8192/stdout.txt

Original bytes: 52697. SHA-256: `2c467e7d6ec2724638bf4c045ed4e68f0b2623f6d700733b8bc856058a9676d1`.

Normalized bytes: 52697. SHA-256: `2c467e7d6ec2724638bf4c045ed4e68f0b2623f6d700733b8bc856058a9676d1`.

````text
{
  "composite_sha256" : "f31f100d47f062c415251d92a4c14956b2328e393294a9680eb2ba9c1664f645",
  "context_limit" : 8192,
  "draft_sha256" : "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744",
  "inventory_sha256" : "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
  "minimum_headroom_bytes" : 3000000000,
  "observations" : [
    {
      "consumed" : 512,
      "peak_process_bytes" : 8289702712
    },
    {
      "consumed" : 1024,
      "peak_process_bytes" : 8301171536
    },
    {
      "consumed" : 1536,
      "peak_process_bytes" : 8347964312
    },
    {
      "consumed" : 2048,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 2560,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 3072,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 3584,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 4096,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 4608,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 5120,
      "peak_process_bytes" : 8416334672
    },
    {
      "consumed" : 5632,
      "peak_process_bytes" : 8444236624
    },
    {
      "consumed" : 6144,
      "peak_process_bytes" : 8486736720
    },
    {
      "consumed" : 6656,
      "peak_process_bytes" : 8486736720
    },
    {
      "consumed" : 7168,
      "peak_process_bytes" : 8486736720
    },
    {
      "consumed" : 7680,
      "peak_process_bytes" : 8486736720
    },
    {
      "consumed" : 8184,
      "peak_process_bytes" : 8498680704
    }
  ],
  "peak_process_bytes" : 8498680704,
  "process_bound_bytes" : 10000000000,
  "qualification" : "unproven",
  "report" : {
    "items" : [
      {
        "name" : "prefill boundary 0",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 0",
        "passed" : true
      },
      {
        "name" : "prefill boundary 512",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 512",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1024",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1024",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1536",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1536",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2048",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2048",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2560",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2560",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3072",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3072",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3584",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3584",
        "passed" : true
      },
      {
        "name" : "prefill boundary 4096",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 4096",
        "passed" : true
      },
      {
        "name" : "prefill boundary 4608",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 4608",
        "passed" : true
      },
      {
        "name" : "prefill boundary 5120",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 5120",
        "passed" : true
      },
      {
        "name" : "prefill boundary 5632",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 5632",
        "passed" : true
      },
      {
        "name" : "prefill boundary 6144",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 6144",
        "passed" : true
      },
      {
        "name" : "prefill boundary 6656",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 6656",
        "passed" : true
      },
      {
        "name" : "prefill boundary 7168",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 7168",
        "passed" : true
      },
      {
        "name" : "prefill boundary 7680",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 7680",
        "passed" : true
      },
      {
        "name" : "draft discard at long context fields",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context lastMulti",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.index",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.key",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.offset",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.value",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ngram",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ple.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context tokens",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.7",
        "passed" : true
      },
      {
        "name" : "draft proposals survive exact restore",
        "passed" : true
      },
      {
        "name" : "kept target logits at long context",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback fields",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ngram",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ple.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback tokens",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation fields",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context continuation logits",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context continuation multi",
        "passed" : true
      },
      {
        "name" : "long-context continuation ngram",
        "passed" : true
      },
      {
        "name" : "long-context continuation ple.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation tokens",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.7",
        "passed" : true
      },
      {
        "name" : "complete context consumed",
        "passed" : true
      },
      {
        "name" : "over-limit refused",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state fields",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state lastMulti",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.index",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.key",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.offset",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.value",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ngram",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ple.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state tokens",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.7",
        "passed" : true
      },
      {
        "name" : "final target and head committed",
        "passed" : true
      },
      {
        "name" : "no leaked expert pins",
        "passed" : true
      },
      {
        "name" : "context fits process envelope",
        "passed" : true
      }
    ],
    "measurements" : {

    },
    "name" : "quantization-context-8192",
    "passed" : true
  },
  "rotary_sha256" : "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a",
  "schema" : 1,
  "scope" : "native staged context, exact continuation and draft recovery; no held-out quality or speed qualification"
}
````

### vq-context-functional-v1/context-8192/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### vq-context-functional-v1/context-8192-output/receipt.json

Original bytes: 52696. SHA-256: `c78202c157827bac1ff1f861432c5764beae53763372b0a964b6d49d2dbe70ad`.

Normalized bytes: 52696. SHA-256: `c78202c157827bac1ff1f861432c5764beae53763372b0a964b6d49d2dbe70ad`.

````text
{
  "composite_sha256" : "f31f100d47f062c415251d92a4c14956b2328e393294a9680eb2ba9c1664f645",
  "context_limit" : 8192,
  "draft_sha256" : "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744",
  "inventory_sha256" : "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
  "minimum_headroom_bytes" : 3000000000,
  "observations" : [
    {
      "consumed" : 512,
      "peak_process_bytes" : 8289702712
    },
    {
      "consumed" : 1024,
      "peak_process_bytes" : 8301171536
    },
    {
      "consumed" : 1536,
      "peak_process_bytes" : 8347964312
    },
    {
      "consumed" : 2048,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 2560,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 3072,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 3584,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 4096,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 4608,
      "peak_process_bytes" : 8415941456
    },
    {
      "consumed" : 5120,
      "peak_process_bytes" : 8416334672
    },
    {
      "consumed" : 5632,
      "peak_process_bytes" : 8444236624
    },
    {
      "consumed" : 6144,
      "peak_process_bytes" : 8486736720
    },
    {
      "consumed" : 6656,
      "peak_process_bytes" : 8486736720
    },
    {
      "consumed" : 7168,
      "peak_process_bytes" : 8486736720
    },
    {
      "consumed" : 7680,
      "peak_process_bytes" : 8486736720
    },
    {
      "consumed" : 8184,
      "peak_process_bytes" : 8498680704
    }
  ],
  "peak_process_bytes" : 8498680704,
  "process_bound_bytes" : 10000000000,
  "qualification" : "unproven",
  "report" : {
    "items" : [
      {
        "name" : "prefill boundary 0",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 0",
        "passed" : true
      },
      {
        "name" : "prefill boundary 512",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 512",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1024",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1024",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1536",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1536",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2048",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2048",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2560",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2560",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3072",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3072",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3584",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3584",
        "passed" : true
      },
      {
        "name" : "prefill boundary 4096",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 4096",
        "passed" : true
      },
      {
        "name" : "prefill boundary 4608",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 4608",
        "passed" : true
      },
      {
        "name" : "prefill boundary 5120",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 5120",
        "passed" : true
      },
      {
        "name" : "prefill boundary 5632",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 5632",
        "passed" : true
      },
      {
        "name" : "prefill boundary 6144",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 6144",
        "passed" : true
      },
      {
        "name" : "prefill boundary 6656",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 6656",
        "passed" : true
      },
      {
        "name" : "prefill boundary 7168",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 7168",
        "passed" : true
      },
      {
        "name" : "prefill boundary 7680",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 7680",
        "passed" : true
      },
      {
        "name" : "draft discard at long context fields",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context lastMulti",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.index",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.key",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.offset",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.value",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ngram",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ple.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context tokens",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.7",
        "passed" : true
      },
      {
        "name" : "draft proposals survive exact restore",
        "passed" : true
      },
      {
        "name" : "kept target logits at long context",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback fields",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ngram",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ple.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback tokens",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation fields",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context continuation logits",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context continuation multi",
        "passed" : true
      },
      {
        "name" : "long-context continuation ngram",
        "passed" : true
      },
      {
        "name" : "long-context continuation ple.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation tokens",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.7",
        "passed" : true
      },
      {
        "name" : "complete context consumed",
        "passed" : true
      },
      {
        "name" : "over-limit refused",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state fields",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state lastMulti",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.index",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.key",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.offset",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.value",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ngram",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ple.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state tokens",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.7",
        "passed" : true
      },
      {
        "name" : "final target and head committed",
        "passed" : true
      },
      {
        "name" : "no leaked expert pins",
        "passed" : true
      },
      {
        "name" : "context fits process envelope",
        "passed" : true
      }
    ],
    "measurements" : {

    },
    "name" : "quantization-context-8192",
    "passed" : true
  },
  "rotary_sha256" : "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a",
  "schema" : 1,
  "scope" : "native staged context, exact continuation and draft recovery; no held-out quality or speed qualification"
}
````

### vq-context-functional-v1/context-32768/stdout.txt

Original bytes: 65072. SHA-256: `883642b0dfaedd585de96de6287d876b79a6cace4c4b6b10d60c800dc1e96d42`.

Normalized bytes: 65072. SHA-256: `883642b0dfaedd585de96de6287d876b79a6cace4c4b6b10d60c800dc1e96d42`.

````text
{
  "composite_sha256" : "f31f100d47f062c415251d92a4c14956b2328e393294a9680eb2ba9c1664f645",
  "context_limit" : 32768,
  "draft_sha256" : "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744",
  "inventory_sha256" : "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
  "minimum_headroom_bytes" : 3000000000,
  "observations" : [
    {
      "consumed" : 512,
      "peak_process_bytes" : 8265519880
    },
    {
      "consumed" : 1024,
      "peak_process_bytes" : 8322569040
    },
    {
      "consumed" : 1536,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 2048,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 2560,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 3072,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 3584,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 4096,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 4608,
      "peak_process_bytes" : 8417137488
    },
    {
      "consumed" : 5120,
      "peak_process_bytes" : 8417137488
    },
    {
      "consumed" : 5632,
      "peak_process_bytes" : 8422937424
    },
    {
      "consumed" : 6144,
      "peak_process_bytes" : 8422937424
    },
    {
      "consumed" : 6656,
      "peak_process_bytes" : 8432472912
    },
    {
      "consumed" : 7168,
      "peak_process_bytes" : 8463291216
    },
    {
      "consumed" : 7680,
      "peak_process_bytes" : 8463291216
    },
    {
      "consumed" : 8192,
      "peak_process_bytes" : 8491062096
    },
    {
      "consumed" : 8704,
      "peak_process_bytes" : 8491062096
    },
    {
      "consumed" : 9216,
      "peak_process_bytes" : 8557744976
    },
    {
      "consumed" : 9728,
      "peak_process_bytes" : 8557744976
    },
    {
      "consumed" : 10240,
      "peak_process_bytes" : 8557744976
    },
    {
      "consumed" : 10752,
      "peak_process_bytes" : 8557744976
    },
    {
      "consumed" : 11264,
      "peak_process_bytes" : 8602997584
    },
    {
      "consumed" : 11776,
      "peak_process_bytes" : 8604930896
    },
    {
      "consumed" : 12288,
      "peak_process_bytes" : 8634897280
    },
    {
      "consumed" : 12800,
      "peak_process_bytes" : 8634897280
    },
    {
      "consumed" : 13312,
      "peak_process_bytes" : 8634897280
    },
    {
      "consumed" : 13824,
      "peak_process_bytes" : 8634897280
    },
    {
      "consumed" : 14336,
      "peak_process_bytes" : 8647775056
    },
    {
      "consumed" : 14848,
      "peak_process_bytes" : 8685212520
    },
    {
      "consumed" : 15360,
      "peak_process_bytes" : 8685212520
    },
    {
      "consumed" : 15872,
      "peak_process_bytes" : 8692814672
    },
    {
      "consumed" : 16384,
      "peak_process_bytes" : 8718472016
    },
    {
      "consumed" : 16896,
      "peak_process_bytes" : 8801588048
    },
    {
      "consumed" : 17408,
      "peak_process_bytes" : 8801588048
    },
    {
      "consumed" : 17920,
      "peak_process_bytes" : 8801588048
    },
    {
      "consumed" : 18432,
      "peak_process_bytes" : 8801588048
    },
    {
      "consumed" : 18944,
      "peak_process_bytes" : 8801588048
    },
    {
      "consumed" : 19456,
      "peak_process_bytes" : 8831751040
    },
    {
      "consumed" : 19968,
      "peak_process_bytes" : 8831751040
    },
    {
      "consumed" : 20480,
      "peak_process_bytes" : 8834372456
    },
    {
      "consumed" : 20992,
      "peak_process_bytes" : 8922125160
    },
    {
      "consumed" : 21504,
      "peak_process_bytes" : 8922125160
    },
    {
      "consumed" : 22016,
      "peak_process_bytes" : 8922125160
    },
    {
      "consumed" : 22528,
      "peak_process_bytes" : 8922125160
    },
    {
      "consumed" : 23040,
      "peak_process_bytes" : 8990561104
    },
    {
      "consumed" : 23552,
      "peak_process_bytes" : 8990561104
    },
    {
      "consumed" : 24064,
      "peak_process_bytes" : 8990561104
    },
    {
      "consumed" : 24576,
      "peak_process_bytes" : 8990561104
    },
    {
      "consumed" : 25088,
      "peak_process_bytes" : 8990561104
    },
    {
      "consumed" : 25600,
      "peak_process_bytes" : 9060537336
    },
    {
      "consumed" : 26112,
      "peak_process_bytes" : 9060537336
    },
    {
      "consumed" : 26624,
      "peak_process_bytes" : 9060537336
    },
    {
      "consumed" : 27136,
      "peak_process_bytes" : 9060537336
    },
    {
      "consumed" : 27648,
      "peak_process_bytes" : 9094058832
    },
    {
      "consumed" : 28160,
      "peak_process_bytes" : 9094058832
    },
    {
      "consumed" : 28672,
      "peak_process_bytes" : 9137755056
    },
    {
      "consumed" : 29184,
      "peak_process_bytes" : 9140900808
    },
    {
      "consumed" : 29696,
      "peak_process_bytes" : 9192444896
    },
    {
      "consumed" : 30208,
      "peak_process_bytes" : 9247331152
    },
    {
      "consumed" : 30720,
      "peak_process_bytes" : 9261798224
    },
    {
      "consumed" : 31232,
      "peak_process_bytes" : 9301513040
    },
    {
      "consumed" : 31744,
      "peak_process_bytes" : 9306559408
    },
    {
      "consumed" : 32256,
      "peak_process_bytes" : 9389527888
    },
    {
      "consumed" : 32760,
      "peak_process_bytes" : 9389527888
    }
  ],
  "peak_process_bytes" : 9389527888,
  "process_bound_bytes" : 10000000000,
  "qualification" : "unproven",
  "report" : {
    "items" : [
      {
        "name" : "prefill boundary 0",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 0",
        "passed" : true
      },
      {
        "name" : "prefill boundary 512",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 512",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1024",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1024",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1536",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1536",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2048",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2048",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2560",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2560",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3072",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3072",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3584",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3584",
        "passed" : true
      },
      {
        "name" : "prefill boundary 4096",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 4096",
        "passed" : true
      },
      {
        "name" : "prefill boundary 4608",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 4608",
        "passed" : true
      },
      {
        "name" : "prefill boundary 5120",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 5120",
        "passed" : true
      },
      {
        "name" : "prefill boundary 5632",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 5632",
        "passed" : true
      },
      {
        "name" : "prefill boundary 6144",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 6144",
        "passed" : true
      },
      {
        "name" : "prefill boundary 6656",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 6656",
        "passed" : true
      },
      {
        "name" : "prefill boundary 7168",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 7168",
        "passed" : true
      },
      {
        "name" : "prefill boundary 7680",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 7680",
        "passed" : true
      },
      {
        "name" : "prefill boundary 8192",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 8192",
        "passed" : true
      },
      {
        "name" : "prefill boundary 8704",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 8704",
        "passed" : true
      },
      {
        "name" : "prefill boundary 9216",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 9216",
        "passed" : true
      },
      {
        "name" : "prefill boundary 9728",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 9728",
        "passed" : true
      },
      {
        "name" : "prefill boundary 10240",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 10240",
        "passed" : true
      },
      {
        "name" : "prefill boundary 10752",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 10752",
        "passed" : true
      },
      {
        "name" : "prefill boundary 11264",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 11264",
        "passed" : true
      },
      {
        "name" : "prefill boundary 11776",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 11776",
        "passed" : true
      },
      {
        "name" : "prefill boundary 12288",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 12288",
        "passed" : true
      },
      {
        "name" : "prefill boundary 12800",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 12800",
        "passed" : true
      },
      {
        "name" : "prefill boundary 13312",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 13312",
        "passed" : true
      },
      {
        "name" : "prefill boundary 13824",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 13824",
        "passed" : true
      },
      {
        "name" : "prefill boundary 14336",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 14336",
        "passed" : true
      },
      {
        "name" : "prefill boundary 14848",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 14848",
        "passed" : true
      },
      {
        "name" : "prefill boundary 15360",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 15360",
        "passed" : true
      },
      {
        "name" : "prefill boundary 15872",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 15872",
        "passed" : true
      },
      {
        "name" : "prefill boundary 16384",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 16384",
        "passed" : true
      },
      {
        "name" : "prefill boundary 16896",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 16896",
        "passed" : true
      },
      {
        "name" : "prefill boundary 17408",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 17408",
        "passed" : true
      },
      {
        "name" : "prefill boundary 17920",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 17920",
        "passed" : true
      },
      {
        "name" : "prefill boundary 18432",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 18432",
        "passed" : true
      },
      {
        "name" : "prefill boundary 18944",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 18944",
        "passed" : true
      },
      {
        "name" : "prefill boundary 19456",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 19456",
        "passed" : true
      },
      {
        "name" : "prefill boundary 19968",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 19968",
        "passed" : true
      },
      {
        "name" : "prefill boundary 20480",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 20480",
        "passed" : true
      },
      {
        "name" : "prefill boundary 20992",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 20992",
        "passed" : true
      },
      {
        "name" : "prefill boundary 21504",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 21504",
        "passed" : true
      },
      {
        "name" : "prefill boundary 22016",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 22016",
        "passed" : true
      },
      {
        "name" : "prefill boundary 22528",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 22528",
        "passed" : true
      },
      {
        "name" : "prefill boundary 23040",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 23040",
        "passed" : true
      },
      {
        "name" : "prefill boundary 23552",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 23552",
        "passed" : true
      },
      {
        "name" : "prefill boundary 24064",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 24064",
        "passed" : true
      },
      {
        "name" : "prefill boundary 24576",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 24576",
        "passed" : true
      },
      {
        "name" : "prefill boundary 25088",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 25088",
        "passed" : true
      },
      {
        "name" : "prefill boundary 25600",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 25600",
        "passed" : true
      },
      {
        "name" : "prefill boundary 26112",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 26112",
        "passed" : true
      },
      {
        "name" : "prefill boundary 26624",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 26624",
        "passed" : true
      },
      {
        "name" : "prefill boundary 27136",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 27136",
        "passed" : true
      },
      {
        "name" : "prefill boundary 27648",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 27648",
        "passed" : true
      },
      {
        "name" : "prefill boundary 28160",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 28160",
        "passed" : true
      },
      {
        "name" : "prefill boundary 28672",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 28672",
        "passed" : true
      },
      {
        "name" : "prefill boundary 29184",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 29184",
        "passed" : true
      },
      {
        "name" : "prefill boundary 29696",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 29696",
        "passed" : true
      },
      {
        "name" : "prefill boundary 30208",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 30208",
        "passed" : true
      },
      {
        "name" : "prefill boundary 30720",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 30720",
        "passed" : true
      },
      {
        "name" : "prefill boundary 31232",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 31232",
        "passed" : true
      },
      {
        "name" : "prefill boundary 31744",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 31744",
        "passed" : true
      },
      {
        "name" : "prefill boundary 32256",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 32256",
        "passed" : true
      },
      {
        "name" : "draft discard at long context fields",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context lastMulti",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.index",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.key",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.offset",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.value",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ngram",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ple.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context tokens",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.7",
        "passed" : true
      },
      {
        "name" : "draft proposals survive exact restore",
        "passed" : true
      },
      {
        "name" : "kept target logits at long context",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback fields",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ngram",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ple.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback tokens",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation fields",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context continuation logits",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context continuation multi",
        "passed" : true
      },
      {
        "name" : "long-context continuation ngram",
        "passed" : true
      },
      {
        "name" : "long-context continuation ple.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation tokens",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.7",
        "passed" : true
      },
      {
        "name" : "complete context consumed",
        "passed" : true
      },
      {
        "name" : "over-limit refused",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state fields",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state lastMulti",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.index",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.key",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.offset",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.value",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ngram",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ple.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state tokens",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.7",
        "passed" : true
      },
      {
        "name" : "final target and head committed",
        "passed" : true
      },
      {
        "name" : "no leaked expert pins",
        "passed" : true
      },
      {
        "name" : "context fits process envelope",
        "passed" : true
      }
    ],
    "measurements" : {

    },
    "name" : "quantization-context-32768",
    "passed" : true
  },
  "rotary_sha256" : "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a",
  "schema" : 1,
  "scope" : "native staged context, exact continuation and draft recovery; no held-out quality or speed qualification"
}
````

### vq-context-functional-v1/context-32768/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### vq-context-functional-v1/context-32768-output/receipt.json

Original bytes: 65071. SHA-256: `6e7dab839ed1ed53ec8c51c854486072c54336c33a792145654e31cff279c675`.

Normalized bytes: 65071. SHA-256: `6e7dab839ed1ed53ec8c51c854486072c54336c33a792145654e31cff279c675`.

````text
{
  "composite_sha256" : "f31f100d47f062c415251d92a4c14956b2328e393294a9680eb2ba9c1664f645",
  "context_limit" : 32768,
  "draft_sha256" : "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744",
  "inventory_sha256" : "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe",
  "minimum_headroom_bytes" : 3000000000,
  "observations" : [
    {
      "consumed" : 512,
      "peak_process_bytes" : 8265519880
    },
    {
      "consumed" : 1024,
      "peak_process_bytes" : 8322569040
    },
    {
      "consumed" : 1536,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 2048,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 2560,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 3072,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 3584,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 4096,
      "peak_process_bytes" : 8392037200
    },
    {
      "consumed" : 4608,
      "peak_process_bytes" : 8417137488
    },
    {
      "consumed" : 5120,
      "peak_process_bytes" : 8417137488
    },
    {
      "consumed" : 5632,
      "peak_process_bytes" : 8422937424
    },
    {
      "consumed" : 6144,
      "peak_process_bytes" : 8422937424
    },
    {
      "consumed" : 6656,
      "peak_process_bytes" : 8432472912
    },
    {
      "consumed" : 7168,
      "peak_process_bytes" : 8463291216
    },
    {
      "consumed" : 7680,
      "peak_process_bytes" : 8463291216
    },
    {
      "consumed" : 8192,
      "peak_process_bytes" : 8491062096
    },
    {
      "consumed" : 8704,
      "peak_process_bytes" : 8491062096
    },
    {
      "consumed" : 9216,
      "peak_process_bytes" : 8557744976
    },
    {
      "consumed" : 9728,
      "peak_process_bytes" : 8557744976
    },
    {
      "consumed" : 10240,
      "peak_process_bytes" : 8557744976
    },
    {
      "consumed" : 10752,
      "peak_process_bytes" : 8557744976
    },
    {
      "consumed" : 11264,
      "peak_process_bytes" : 8602997584
    },
    {
      "consumed" : 11776,
      "peak_process_bytes" : 8604930896
    },
    {
      "consumed" : 12288,
      "peak_process_bytes" : 8634897280
    },
    {
      "consumed" : 12800,
      "peak_process_bytes" : 8634897280
    },
    {
      "consumed" : 13312,
      "peak_process_bytes" : 8634897280
    },
    {
      "consumed" : 13824,
      "peak_process_bytes" : 8634897280
    },
    {
      "consumed" : 14336,
      "peak_process_bytes" : 8647775056
    },
    {
      "consumed" : 14848,
      "peak_process_bytes" : 8685212520
    },
    {
      "consumed" : 15360,
      "peak_process_bytes" : 8685212520
    },
    {
      "consumed" : 15872,
      "peak_process_bytes" : 8692814672
    },
    {
      "consumed" : 16384,
      "peak_process_bytes" : 8718472016
    },
    {
      "consumed" : 16896,
      "peak_process_bytes" : 8801588048
    },
    {
      "consumed" : 17408,
      "peak_process_bytes" : 8801588048
    },
    {
      "consumed" : 17920,
      "peak_process_bytes" : 8801588048
    },
    {
      "consumed" : 18432,
      "peak_process_bytes" : 8801588048
    },
    {
      "consumed" : 18944,
      "peak_process_bytes" : 8801588048
    },
    {
      "consumed" : 19456,
      "peak_process_bytes" : 8831751040
    },
    {
      "consumed" : 19968,
      "peak_process_bytes" : 8831751040
    },
    {
      "consumed" : 20480,
      "peak_process_bytes" : 8834372456
    },
    {
      "consumed" : 20992,
      "peak_process_bytes" : 8922125160
    },
    {
      "consumed" : 21504,
      "peak_process_bytes" : 8922125160
    },
    {
      "consumed" : 22016,
      "peak_process_bytes" : 8922125160
    },
    {
      "consumed" : 22528,
      "peak_process_bytes" : 8922125160
    },
    {
      "consumed" : 23040,
      "peak_process_bytes" : 8990561104
    },
    {
      "consumed" : 23552,
      "peak_process_bytes" : 8990561104
    },
    {
      "consumed" : 24064,
      "peak_process_bytes" : 8990561104
    },
    {
      "consumed" : 24576,
      "peak_process_bytes" : 8990561104
    },
    {
      "consumed" : 25088,
      "peak_process_bytes" : 8990561104
    },
    {
      "consumed" : 25600,
      "peak_process_bytes" : 9060537336
    },
    {
      "consumed" : 26112,
      "peak_process_bytes" : 9060537336
    },
    {
      "consumed" : 26624,
      "peak_process_bytes" : 9060537336
    },
    {
      "consumed" : 27136,
      "peak_process_bytes" : 9060537336
    },
    {
      "consumed" : 27648,
      "peak_process_bytes" : 9094058832
    },
    {
      "consumed" : 28160,
      "peak_process_bytes" : 9094058832
    },
    {
      "consumed" : 28672,
      "peak_process_bytes" : 9137755056
    },
    {
      "consumed" : 29184,
      "peak_process_bytes" : 9140900808
    },
    {
      "consumed" : 29696,
      "peak_process_bytes" : 9192444896
    },
    {
      "consumed" : 30208,
      "peak_process_bytes" : 9247331152
    },
    {
      "consumed" : 30720,
      "peak_process_bytes" : 9261798224
    },
    {
      "consumed" : 31232,
      "peak_process_bytes" : 9301513040
    },
    {
      "consumed" : 31744,
      "peak_process_bytes" : 9306559408
    },
    {
      "consumed" : 32256,
      "peak_process_bytes" : 9389527888
    },
    {
      "consumed" : 32760,
      "peak_process_bytes" : 9389527888
    }
  ],
  "peak_process_bytes" : 9389527888,
  "process_bound_bytes" : 10000000000,
  "qualification" : "unproven",
  "report" : {
    "items" : [
      {
        "name" : "prefill boundary 0",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 0",
        "passed" : true
      },
      {
        "name" : "prefill boundary 512",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 512",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1024",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1024",
        "passed" : true
      },
      {
        "name" : "prefill boundary 1536",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 1536",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2048",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2048",
        "passed" : true
      },
      {
        "name" : "prefill boundary 2560",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 2560",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3072",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3072",
        "passed" : true
      },
      {
        "name" : "prefill boundary 3584",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 3584",
        "passed" : true
      },
      {
        "name" : "prefill boundary 4096",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 4096",
        "passed" : true
      },
      {
        "name" : "prefill boundary 4608",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 4608",
        "passed" : true
      },
      {
        "name" : "prefill boundary 5120",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 5120",
        "passed" : true
      },
      {
        "name" : "prefill boundary 5632",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 5632",
        "passed" : true
      },
      {
        "name" : "prefill boundary 6144",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 6144",
        "passed" : true
      },
      {
        "name" : "prefill boundary 6656",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 6656",
        "passed" : true
      },
      {
        "name" : "prefill boundary 7168",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 7168",
        "passed" : true
      },
      {
        "name" : "prefill boundary 7680",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 7680",
        "passed" : true
      },
      {
        "name" : "prefill boundary 8192",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 8192",
        "passed" : true
      },
      {
        "name" : "prefill boundary 8704",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 8704",
        "passed" : true
      },
      {
        "name" : "prefill boundary 9216",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 9216",
        "passed" : true
      },
      {
        "name" : "prefill boundary 9728",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 9728",
        "passed" : true
      },
      {
        "name" : "prefill boundary 10240",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 10240",
        "passed" : true
      },
      {
        "name" : "prefill boundary 10752",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 10752",
        "passed" : true
      },
      {
        "name" : "prefill boundary 11264",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 11264",
        "passed" : true
      },
      {
        "name" : "prefill boundary 11776",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 11776",
        "passed" : true
      },
      {
        "name" : "prefill boundary 12288",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 12288",
        "passed" : true
      },
      {
        "name" : "prefill boundary 12800",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 12800",
        "passed" : true
      },
      {
        "name" : "prefill boundary 13312",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 13312",
        "passed" : true
      },
      {
        "name" : "prefill boundary 13824",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 13824",
        "passed" : true
      },
      {
        "name" : "prefill boundary 14336",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 14336",
        "passed" : true
      },
      {
        "name" : "prefill boundary 14848",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 14848",
        "passed" : true
      },
      {
        "name" : "prefill boundary 15360",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 15360",
        "passed" : true
      },
      {
        "name" : "prefill boundary 15872",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 15872",
        "passed" : true
      },
      {
        "name" : "prefill boundary 16384",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 16384",
        "passed" : true
      },
      {
        "name" : "prefill boundary 16896",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 16896",
        "passed" : true
      },
      {
        "name" : "prefill boundary 17408",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 17408",
        "passed" : true
      },
      {
        "name" : "prefill boundary 17920",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 17920",
        "passed" : true
      },
      {
        "name" : "prefill boundary 18432",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 18432",
        "passed" : true
      },
      {
        "name" : "prefill boundary 18944",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 18944",
        "passed" : true
      },
      {
        "name" : "prefill boundary 19456",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 19456",
        "passed" : true
      },
      {
        "name" : "prefill boundary 19968",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 19968",
        "passed" : true
      },
      {
        "name" : "prefill boundary 20480",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 20480",
        "passed" : true
      },
      {
        "name" : "prefill boundary 20992",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 20992",
        "passed" : true
      },
      {
        "name" : "prefill boundary 21504",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 21504",
        "passed" : true
      },
      {
        "name" : "prefill boundary 22016",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 22016",
        "passed" : true
      },
      {
        "name" : "prefill boundary 22528",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 22528",
        "passed" : true
      },
      {
        "name" : "prefill boundary 23040",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 23040",
        "passed" : true
      },
      {
        "name" : "prefill boundary 23552",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 23552",
        "passed" : true
      },
      {
        "name" : "prefill boundary 24064",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 24064",
        "passed" : true
      },
      {
        "name" : "prefill boundary 24576",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 24576",
        "passed" : true
      },
      {
        "name" : "prefill boundary 25088",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 25088",
        "passed" : true
      },
      {
        "name" : "prefill boundary 25600",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 25600",
        "passed" : true
      },
      {
        "name" : "prefill boundary 26112",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 26112",
        "passed" : true
      },
      {
        "name" : "prefill boundary 26624",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 26624",
        "passed" : true
      },
      {
        "name" : "prefill boundary 27136",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 27136",
        "passed" : true
      },
      {
        "name" : "prefill boundary 27648",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 27648",
        "passed" : true
      },
      {
        "name" : "prefill boundary 28160",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 28160",
        "passed" : true
      },
      {
        "name" : "prefill boundary 28672",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 28672",
        "passed" : true
      },
      {
        "name" : "prefill boundary 29184",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 29184",
        "passed" : true
      },
      {
        "name" : "prefill boundary 29696",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 29696",
        "passed" : true
      },
      {
        "name" : "prefill boundary 30208",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 30208",
        "passed" : true
      },
      {
        "name" : "prefill boundary 30720",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 30720",
        "passed" : true
      },
      {
        "name" : "prefill boundary 31232",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 31232",
        "passed" : true
      },
      {
        "name" : "prefill boundary 31744",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 31744",
        "passed" : true
      },
      {
        "name" : "prefill boundary 32256",
        "passed" : true
      },
      {
        "name" : "draft aligned after prefill 32256",
        "passed" : true
      },
      {
        "name" : "draft discard at long context fields",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context conv.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context index.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context key.7",
        "passed" : true
      },
      {
        "name" : "draft discard at long context lastMulti",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.index",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.key",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.offset",
        "passed" : true
      },
      {
        "name" : "draft discard at long context mtp.value",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ngram",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ple.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.0",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.1",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.10",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.12",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.13",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.14",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.16",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.17",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.18",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.2",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.20",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.21",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.22",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.24",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.25",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.26",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.28",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.29",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.30",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.32",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.33",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.34",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.36",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.37",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.38",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.4",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.40",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.41",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.42",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.44",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.45",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.46",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.5",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.6",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.8",
        "passed" : true
      },
      {
        "name" : "draft discard at long context ssm.9",
        "passed" : true
      },
      {
        "name" : "draft discard at long context tokens",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.11",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.15",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.19",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.23",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.27",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.3",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.31",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.35",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.39",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.43",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.47",
        "passed" : true
      },
      {
        "name" : "draft discard at long context value.7",
        "passed" : true
      },
      {
        "name" : "draft proposals survive exact restore",
        "passed" : true
      },
      {
        "name" : "kept target logits at long context",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback fields",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback conv.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback index.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback key.7",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ngram",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ple.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback tokens",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.11",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.15",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.19",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.23",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.27",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.3",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.31",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.35",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.39",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.43",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.47",
        "passed" : true
      },
      {
        "name" : "long-context target and head rollback value.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation fields",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation conv.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation index.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation key.7",
        "passed" : true
      },
      {
        "name" : "long-context continuation lastMulti",
        "passed" : true
      },
      {
        "name" : "long-context continuation logits",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.index",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.key",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.offset",
        "passed" : true
      },
      {
        "name" : "long-context continuation mtp.value",
        "passed" : true
      },
      {
        "name" : "long-context continuation multi",
        "passed" : true
      },
      {
        "name" : "long-context continuation ngram",
        "passed" : true
      },
      {
        "name" : "long-context continuation ple.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.0",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.1",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.10",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.12",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.13",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.14",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.16",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.17",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.18",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.2",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.20",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.21",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.22",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.24",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.25",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.26",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.28",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.29",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.30",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.32",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.33",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.34",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.36",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.37",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.38",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.4",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.40",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.41",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.42",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.44",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.45",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.46",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.5",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.6",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.8",
        "passed" : true
      },
      {
        "name" : "long-context continuation ssm.9",
        "passed" : true
      },
      {
        "name" : "long-context continuation tokens",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.11",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.15",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.19",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.23",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.27",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.3",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.31",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.35",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.39",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.43",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.47",
        "passed" : true
      },
      {
        "name" : "long-context continuation value.7",
        "passed" : true
      },
      {
        "name" : "complete context consumed",
        "passed" : true
      },
      {
        "name" : "over-limit refused",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state fields",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state conv.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state index.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state key.7",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state lastMulti",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.index",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.key",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.offset",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state mtp.value",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ngram",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ple.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.0",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.1",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.10",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.12",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.13",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.14",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.16",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.17",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.18",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.2",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.20",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.21",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.22",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.24",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.25",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.26",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.28",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.29",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.30",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.32",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.33",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.34",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.36",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.37",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.38",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.4",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.40",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.41",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.42",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.44",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.45",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.46",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.5",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.6",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.8",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state ssm.9",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state tokens",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.11",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.15",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.19",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.23",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.27",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.3",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.31",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.35",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.39",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.43",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.47",
        "passed" : true
      },
      {
        "name" : "over-limit does not mutate state value.7",
        "passed" : true
      },
      {
        "name" : "final target and head committed",
        "passed" : true
      },
      {
        "name" : "no leaked expert pins",
        "passed" : true
      },
      {
        "name" : "context fits process envelope",
        "passed" : true
      }
    ],
    "measurements" : {

    },
    "name" : "quantization-context-32768",
    "passed" : true
  },
  "rotary_sha256" : "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a",
  "schema" : 1,
  "scope" : "native staged context, exact continuation and draft recovery; no held-out quality or speed qualification"
}
````

### vq-context-summary-v1.json

Original bytes: 877. SHA-256: `463a2c473c135e3247b79bc1138454112a5a68e995663ae0989102e313ea9117`.

Normalized bytes: 877. SHA-256: `463a2c473c135e3247b79bc1138454112a5a68e995663ae0989102e313ea9117`.

````text
[
  {
    "name": "catalogue",
    "passed": true,
    "seconds": 13.346650292000001,
    "peak_physical_bytes": 1446757768
  },
  {
    "name": "rotary",
    "passed": true,
    "seconds": 0.7594402910000007,
    "peak_physical_bytes": 405865432
  },
  {
    "name": "context-4096",
    "passed": true,
    "seconds": 164.70119458399998,
    "peak_physical_bytes": 8437568408,
    "assertions": 493,
    "failures": 0,
    "native_peak_bytes": 8437568408
  },
  {
    "name": "context-8192",
    "passed": true,
    "seconds": 271.64836720799997,
    "peak_physical_bytes": 8498680704,
    "assertions": 509,
    "failures": 0,
    "native_peak_bytes": 8498680704
  },
  {
    "name": "context-32768",
    "passed": true,
    "seconds": 1066.176365667,
    "peak_physical_bytes": 9389527888,
    "assertions": 605,
    "failures": 0,
    "native_peak_bytes": 9389527888
  }
]
````

### frozen-vq-context-v1/build-identity.json

Original bytes: 40492. SHA-256: `c98cf89e1ba09e5625b2120288135935c1b91dd76dcff6ad0308f3c12f6bab86`.

Normalized bytes: 40492. SHA-256: `c98cf89e1ba09e5625b2120288135935c1b91dd76dcff6ad0308f3c12f6bab86`.

````text
{
  "binary_sha256": "15180800df52a63c802969c4af69118ad7f220b134a656d8d66bed2b329adabd",
  "checks_sha256": "92b145f371eaaebaf8e433a1d3e88da211a6945843d8cfb003017dd700fe8de7",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "source_archive_sha256": "de5a6c0d5eedf2916ecc935e70514f5d41120bf254899481c8378f498c00dd10",
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
      "Sources/Slotstream/VQGenerationProbe.swift": "b4e8ca1a5b866822b027bec394965a4de8c79bb20b7f878e583f994f01b86d97",
      "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
      "Sources/Slotstream/VQModelProbe.swift": "f9dd7ab191bcd43bc911e5eb713ee76db8be4e5d7eb9a75b07d577f194561ad3",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "c3651ed472ed0eed0f84000086f7dc113093ed7e1e474585c2654399e8d9e30f",
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
      "Sources/slotstream-cli/QuantizationCommands.swift": "ef9a6d3fdef85ca130bbec054aab9ec55e341e92cfd9c114af485d305b49813f",
      "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
      "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
      "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
      "Sources/slotstream-cli/main.swift": "7daa19223c6d295fbca43a109048956b58fa7871685250155ad6048c59034a41",
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
