---
type: run
created: 2026-10-03T18:21:32.771547+00:00
updated: 2026-10-03T18:21:32.771547+00:00
summary: Baseline Auto controls and independent live memory management with native lifecycle acceptance
binary: e066b7a195ef50d8138062c5c24431af68c621a23b14f20b3e579b117d0a5b31
captured_at: 2026-10-03
command: Exact sequential commands are preserved in the driver and supervision identities below.
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Baseline Auto controls and independent live memory management with native lifecycle acceptance
tool: native library and Mac product acceptance
---

This is the baseline product selection and lifecycle implementation, not completion of the quantization program. The compile-time allowlist retains only the original supported pack. Its manifest binds all pinned files, including tokenizer, template, license and optional draft. Automatic selection and an explicit original-pack override are independent of the saved memory ceiling and live adjustment mode. No hardware profile is newly qualified and no alternative is offered for activation.

The app preserves old preferences with automatic defaults for the new fields, preserves unavailable explicit pack IDs, and refuses them before activation. The independent CLI gains model-packs inspection and an opt-in quantization selector; omitting it preserves legacy model-path behavior. Explicit pack selection against a custom directory requires complete pinned verification and refuses mismatching files without repairing or replacing them. The captured negative directory fixture remains byte-identical.

An applied configuration binds the registered manifest, actual engine arithmetic identity, context/features and allocation plan to a fresh load generation. Response metrics retain all contributing generations. Load publication occurs only after initialization and identity construction succeed. The owner blocks new admission across asynchronous release/configuration drains. The shared background verification proof now has explicit synchronization. Fixed live cache capacity preserves startup sizing and the saved ceiling, continues pressure cancellation and admission checks, drops optional prefix/allocator cache under pressure, and never borrows the feasibility of a smaller proposed cache.

The first single-worker build observer counted only process groups and missed independently grouped compiler children. The task stopped its own build tree and preserved that incomplete attempt and correction. The repaired observer walks transitive parent links, enforces a six-GB compiler-tree envelope and three-GB real headroom after a nine-GB build preflight. This is a bounded compiler policy, not a lowered model-test preflight. Complete subsequent builds bind unchanged inputs. Native UI checks render all six settings states plus response-budget details in Light, Dark and System. The root catalogue reports 96 passing groups with no failures or skips. The full static suite and full Mac runtime suite pass.

Real existing-pack tests exercise fixed-cache pressure cancellation in ordinary and draft decoding, refusal until memory recovers, unchanged cache capacity and exact retry output. The app completes cold/warm requests, defers a ceiling and live-mode change, releases/reloads, records the original generation for the in-flight response and a new generation afterward, refuses an invalid saved ceiling, releases idle memory and preserves the draft. These are completed functional checks on the development Mac, not other-Mac or speed qualifications.

The first combined campaign then refuses the research draft before loading because it inherited the production pressure-test environment flag. The failure is preserved. A fresh continuation removes that flag and passes the exact research draft fixture, current public draft reference, resident/streamed draft equivalence, draft/vision interaction and row equivalence. It does not rerun the already-passing production cells or relax any numerical tolerance. Every model cell keeps its declared physical-footprint, live-headroom and time bounds; explicit larger existing draft/image cases retain their documented budgets. Global paging remains diagnostic. This closes the earlier unlaunched regression gap on the successor native build, whose MTP implementation is unchanged.

Production VQ serving/speculation, dynamic candidate allocation costs, multiple-pack transactional distribution/rollback, held-out quality, paired complete-configuration speed and real-hardware qualification remain unfinished. Research numerical parity and baseline product controls do not establish the twenty-token target. No public model, default artifact, installed app or CLI is replaced.

Local home prefixes are replaced with <HOME>. Original byte lengths and hashes identify the unmodified local files. For large transcripts, the normalized UTF-8 bytes are stored losslessly as zlib-compressed base64 inside this Markdown source. Decode with `zlib.decompress(base64.b64decode(block))` and verify the listed normalized byte length and SHA-256. Every encoded block was round-trip checked before writing. This changes storage only, not the captured evidence. Small transcripts remain plain text. Raw tensor fixtures and source-bound executables remain in the bounded research directory; manifests bind their hashes. No model is installed or activated.

### capture-product-selection-v1.py

Original bytes: 7265. SHA-256: `b544edabbe9e6f65695b4eeacad34b875bee50e6c692298e5dda90a42a4f5eee`.

Normalized bytes: 7265. SHA-256: `b544edabbe9e6f65695b4eeacad34b875bee50e6c692298e5dda90a42a4f5eee`.

````text
from pathlib import Path
import json,hashlib,runpy
r=Path('.build/quantization-research')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
build=json.loads((r/'product-selection-build-v2/inputs-before.json').read_text())
final=json.loads((r/'product-selection-final-build-v1/inputs-before.json').read_text())
assert final==json.loads((r/'product-selection-final-build-v1/inputs-after.json').read_text())
root={p:h for p,h in build['files'].items() if p.startswith('Sources/') or p in ('Package.swift','Package.resolved','Tools/lib/mlx-0.32.2.metallib')}
assert all(sha(p)==h for p,h in root.items())
assert all(sha(p)==h for p,h in final['files'].items())
producer=r/'product-selection-producer-v1';producer.mkdir()
identity={'binary_sha256':sha('.build/release/slotstream'),'checks_binary_sha256':sha('.build/release/slotstream-checks'),
 'mac_checks_sha256':sha('apps/macos/.build/release/sevra-mac-checks'),'mac_app_sha256':sha('apps/macos/.build/release/Sevra'),
 'source':root,'mac_build_inputs':final,'test_sources_at_capture':{str(p):sha(p) for base in ['apps/macos/Checks','apps/macos/NativeChecks'] for p in sorted(Path(base).glob('*.swift'))},
 'scope':'Root sources match the completed second build. Final Mac production inputs match before/after its completed rebuild; check sources are separately identified at capture. No install, activation or release.'}
(producer/'build-identity.json').write_text(json.dumps(identity,indent=2)+'\n')
a=json.loads((r/'product-selection-models-v1/receipt.json').read_text());b=json.loads((r/'product-selection-models-v2/receipt.json').read_text())
assert all(x['passed'] for x in a['runs'][:3]) and not a['runs'][3]['passed']
assert b['complete'] and len(b['runs'])==5 and all(x['passed'] for x in b['runs'])
assert 'STATIC GATES PASS' in (r/'product-selection-static-v1.log').read_text()
files=['capture-product-selection-v1.py','build-product-selection-v1.py','build-product-selection-v2.py','build-product-selection-final-v1.py','run-product-selection-ui-v1.py','run-product-selection-models-v1.py','run-product-selection-models-v2.py','product-selection-static-v1.log','product-selection-mac-checks-v1.log']
for folder in ['product-selection-build-v1','product-selection-build-v2','product-selection-ui-v1','product-selection-final-build-v1','product-selection-checks-v1','product-selection-cli-v1','product-selection-models-v1','product-selection-models-v2']:
 files += [str(p.relative_to(r)) for p in sorted((r/folder).rglob('*')) if p.is_file() and p.suffix in ('.json','.log','.txt','.stdout','.stderr') and 'disposable-home' not in p.parts and 'screens' not in p.parts]
scope='''This is the baseline product selection and lifecycle implementation, not completion of the quantization program. The compile-time allowlist retains only the original supported pack. Its manifest binds all pinned files, including tokenizer, template, license and optional draft. Automatic selection and an explicit original-pack override are independent of the saved memory ceiling and live adjustment mode. No hardware profile is newly qualified and no alternative is offered for activation.

The app preserves old preferences with automatic defaults for the new fields, preserves unavailable explicit pack IDs, and refuses them before activation. The independent CLI gains model-packs inspection and an opt-in quantization selector; omitting it preserves legacy model-path behavior. Explicit pack selection against a custom directory requires complete pinned verification and refuses mismatching files without repairing or replacing them. The captured negative directory fixture remains byte-identical.

An applied configuration binds the registered manifest, actual engine arithmetic identity, context/features and allocation plan to a fresh load generation. Response metrics retain all contributing generations. Load publication occurs only after initialization and identity construction succeed. The owner blocks new admission across asynchronous release/configuration drains. The shared background verification proof now has explicit synchronization. Fixed live cache capacity preserves startup sizing and the saved ceiling, continues pressure cancellation and admission checks, drops optional prefix/allocator cache under pressure, and never borrows the feasibility of a smaller proposed cache.

The first single-worker build observer counted only process groups and missed independently grouped compiler children. The task stopped its own build tree and preserved that incomplete attempt and correction. The repaired observer walks transitive parent links, enforces a six-GB compiler-tree envelope and three-GB real headroom after a nine-GB build preflight. This is a bounded compiler policy, not a lowered model-test preflight. Complete subsequent builds bind unchanged inputs. Native UI checks render all six settings states plus response-budget details in Light, Dark and System. The root catalogue reports 96 passing groups with no failures or skips. The full static suite and full Mac runtime suite pass.

Real existing-pack tests exercise fixed-cache pressure cancellation in ordinary and draft decoding, refusal until memory recovers, unchanged cache capacity and exact retry output. The app completes cold/warm requests, defers a ceiling and live-mode change, releases/reloads, records the original generation for the in-flight response and a new generation afterward, refuses an invalid saved ceiling, releases idle memory and preserves the draft. These are completed functional checks on the development Mac, not other-Mac or speed qualifications.

The first combined campaign then refuses the research draft before loading because it inherited the production pressure-test environment flag. The failure is preserved. A fresh continuation removes that flag and passes the exact research draft fixture, current public draft reference, resident/streamed draft equivalence, draft/vision interaction and row equivalence. It does not rerun the already-passing production cells or relax any numerical tolerance. Every model cell keeps its declared physical-footprint, live-headroom and time bounds; explicit larger existing draft/image cases retain their documented budgets. Global paging remains diagnostic. This closes the earlier unlaunched regression gap on the successor native build, whose MTP implementation is unchanged.

Production VQ serving/speculation, dynamic candidate allocation costs, multiple-pack transactional distribution/rollback, held-out quality, paired complete-configuration speed and real-hardware qualification remain unfinished. Research numerical parity and baseline product controls do not establish the twenty-token target. No public model, default artifact, installed app or CLI is replaced.'''
h=runpy.run_path(str(r/'capture-vq-kernel-cache-v1.py'))
h['capture']('baseline-auto-selection-and-live-memory','Baseline Auto controls and independent live memory management with native lifecycle acceptance',scope,files,'product-selection-producer-v1')
p=Path('db/sources/runs/2026/10/2026-10-03-baseline-auto-selection-and-live-memory.md')
s=p.read_text().replace('tool: native library and Mac product acceptance','tool: native library and Mac product acceptance')
p.write_text(s)
````

### build-product-selection-v1.py

Original bytes: 3010. SHA-256: `d90e614754a1e5437cdef2f79418bc8f7efd41a3ef7cb6807e185d1cfa4f9cc6`.

Normalized bytes: 3010. SHA-256: `d90e614754a1e5437cdef2f79418bc8f7efd41a3ef7cb6807e185d1cfa4f9cc6`.

````text
from pathlib import Path
import ctypes,ctypes.util,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
out=Path('.build/quantization-research/product-selection-build-v1');out.mkdir(exist_ok=False)
record={'kind':'bounded-single-worker-build','model_processes':0,'process_tree_ceiling_gb':6,'preflight_gb':9,'minimum_headroom_gb':3,'maximum_seconds':1800,'complete':False,'runs':[]}
def save(): (out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
lib=ctypes.CDLL(ctypes.util.find_library('proc'))
child=None
try:
 record['before']=quiet_preflight(9)
 before=subprocess.check_output(['python3','Tools/mac_build_inputs.py',os.path.expanduser('~/.dbmd/bin/dbmd')]);(out/'inputs-before.json').write_bytes(before)
 commands=[['swift','build','--package-path','apps/macos','-c','release','--product','sevra-mac-checks','-j','1'], ['swift','build','--package-path','apps/macos','-c','release','--product','Sevra','-j','1'], ['swift','build','-c','release','--product','slotstream','-j','1'], ['swift','build','-c','release','--product','slotstream-checks','-j','1']]
 record['commands']=commands;save();began=time.monotonic()
 for idx,command in enumerate(commands):
  row={'command':command,'peak_tree_bytes':0,'samples':0};record['runs'].append(row);save()
  with (out/f'{idx}.log').open('w') as log:
   child=subprocess.Popen(command,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
   while child.poll() is None:
    processes=subprocess.check_output(['ps','-axo','pid=,pgid='],text=True,timeout=5)
    pids=[int(s.split()[0]) for s in processes.splitlines() if int(s.split()[1])==child.pid]
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
 record['failure']=str(e)
 if child is not None and child.poll() is None: terminate_child_tree(child)
 save();raise
finally:
 save()
print(json.dumps(record))
````

### build-product-selection-v2.py

Original bytes: 3162. SHA-256: `17d5fada29885a3e110edcf8b4d81fdcd5859dfe240f6ee4938c2d9f7dffdd86`.

Normalized bytes: 3162. SHA-256: `17d5fada29885a3e110edcf8b4d81fdcd5859dfe240f6ee4938c2d9f7dffdd86`.

````text
from pathlib import Path
import ctypes,ctypes.util,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
out=Path('.build/quantization-research/product-selection-build-v2');out.mkdir(exist_ok=False)
record={'kind':'bounded-single-worker-build','model_processes':0,'process_tree_ceiling_gb':6,'preflight_gb':9,'minimum_headroom_gb':3,'maximum_seconds':1800,'complete':False,'runs':[]}
def save(): (out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
lib=ctypes.CDLL(ctypes.util.find_library('proc'))
child=None
try:
 record['before']=quiet_preflight(9)
 before=subprocess.check_output(['python3','Tools/mac_build_inputs.py',os.path.expanduser('~/.dbmd/bin/dbmd')]);(out/'inputs-before.json').write_bytes(before)
 commands=[['swift','build','--package-path','apps/macos','-c','release','--product','sevra-mac-checks','-j','1'], ['swift','build','--package-path','apps/macos','-c','release','--product','Sevra','-j','1'], ['swift','build','-c','release','--product','slotstream','-j','1'], ['swift','build','-c','release','--product','slotstream-checks','-j','1']]
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

### build-product-selection-final-v1.py

Original bytes: 3204. SHA-256: `cffe2d4d153d47c2324580808c116bdaa37f41448ab6b1c8d01a7432d4f10123`.

Normalized bytes: 3204. SHA-256: `cffe2d4d153d47c2324580808c116bdaa37f41448ab6b1c8d01a7432d4f10123`.

````text
from pathlib import Path
import ctypes,ctypes.util,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
out=Path('.build/quantization-research/product-selection-final-build-v1');out.mkdir(exist_ok=False)
record={'kind':'bounded-single-worker-build','model_processes':0,'process_tree_ceiling_gb':6,'preflight_gb':9,'minimum_headroom_gb':3,'maximum_seconds':1800,'complete':False,'runs':[]}
def save(): (out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
lib=ctypes.CDLL(ctypes.util.find_library('proc'))
child=None
try:
 record['before']=quiet_preflight(9)
 before=subprocess.check_output(['python3','Tools/mac_build_inputs.py',os.path.expanduser('~/.dbmd/bin/dbmd')]);(out/'inputs-before.json').write_bytes(before)
 commands=[['swift','build','--package-path','apps/macos','-c','release','--product','sevra-mac-checks','-j','1'], ['swift','build','--package-path','apps/macos','-c','release','--product','Sevra','-j','1'], ['swift','build','--package-path','apps/macos','--product','Sevra','-j','1'], ['bash','Tools/check_sevra_memory_ui.sh']]
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

### run-product-selection-ui-v1.py

Original bytes: 3099. SHA-256: `72ce2b03694bde860bae717666bb385e64ed455fb02e42cb73492d61857036e2`.

Normalized bytes: 3099. SHA-256: `72ce2b03694bde860bae717666bb385e64ed455fb02e42cb73492d61857036e2`.

````text
from pathlib import Path
import ctypes,ctypes.util,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
out=Path('.build/quantization-research/product-selection-ui-v1');out.mkdir(exist_ok=False)
record={'kind':'bounded-single-worker-build','model_processes':0,'process_tree_ceiling_gb':6,'preflight_gb':9,'minimum_headroom_gb':3,'maximum_seconds':1800,'complete':False,'runs':[]}
def save(): (out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
lib=ctypes.CDLL(ctypes.util.find_library('proc'))
child=None
try:
 record['before']=quiet_preflight(9)
 before=subprocess.check_output(['python3','Tools/mac_build_inputs.py',os.path.expanduser('~/.dbmd/bin/dbmd')]);(out/'inputs-before.json').write_bytes(before)
 commands=[['swift','build','--package-path','apps/macos','--product','Sevra','-j','1'], ['swift','build','--package-path','apps/macos','-c','release','--product','sevra-extract','-j','1'], ['bash','Tools/check_sevra_memory_ui.sh']]
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

### run-product-selection-models-v1.py

Original bytes: 5163. SHA-256: `9ee1272e5680e4cb0667513865bc32a16eacd98ef150ad853bf1fc167688193a`.

Normalized bytes: 5163. SHA-256: `9ee1272e5680e4cb0667513865bc32a16eacd98ef150ad853bf1fc167688193a`.

````text
from pathlib import Path
from datetime import datetime,timezone
import ctypes,ctypes.util,hashlib,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
r=Path('.build/quantization-research').absolute();out=r/'product-selection-models-v1'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
cli=Path('.build/release/slotstream').absolute();app=Path('apps/macos/.build/release/sevra-mac-checks').absolute()
fixture=r/'vq-composite-draft-v1/reference/comparison.safetensors'
legacy=r/'vq-dense-overlay-reference-repair-v1/mtp-reference/comparison.safetensors'
cells=[
 ('governor-fixed-plain',[str(cli),'optimization-state-check','--variant','governor-boundary','--memory-gb','10','--json'],10,13,900),
 ('governor-fixed-draft',[str(cli),'optimization-state-check','--variant','governor-boundary-mtp','--memory-gb','10','--json'],10,13,900),
 ('app-reload',[str(app),'--performance-real','--home',str(out/'disposable-home')],13,16,1800),
 ('research-draft',[str(cli),'quantization-draft-check','--baseline',str(Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit'),'--fixture',str(fixture),'--output',str(out/'research-output'),'--reference-arithmetic'],10,13,300),
 ('public-draft',[str(cli),'mtp-parity','--fixture',str(legacy)],10,13,300),
 ('draft-stream',[str(cli),'draft-stream-check'],12,15,1800),
 ('draft-vision',[str(cli),'mtp-check','--memory-gb','12','--mtp','on','--vision','on','--image','Tools/assets/vision_test/secret1.jpg'],12,15,1800),
 ('draft-rows',[str(cli),'mtp-rowcheck','--memory-gb','10'],10,13,1800)]
out.mkdir()
record={'complete':False,'started_at':datetime.now(timezone.utc).isoformat(),'scope':'Functional acceptance only; no throughput qualification, hardware simulation or model activation.',
 'maximum_concurrent_model_processes':1,'minimum_real_headroom_gb':3,'maximum_total_seconds':10800,
 'pins':{str(p):sha(p) for p in [cli,app,fixture,legacy,Path(__file__),Path('Tools/lib/mlx-0.32.2.metallib')]},
 'protocol':[{'name':n,'command':c,'process_bound_gb':p,'preflight_gb':f,'timeout_seconds':t} for n,c,p,f,t in cells], 'runs':[]}
lib=ctypes.CDLL(ctypes.util.find_library('proc'));began=time.monotonic();child=None
def save():(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG','VQ_','VQLAB_'))}
env['SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR']='1'
record['explicit_environment']={'SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR':'1'};save()
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
  if name.startswith('governor-'):
   value=json.loads(text);assert value.get('passed') is True and not value.get('skipped'),value
  if name=='research-draft':assert json.loads((out/'research-output/receipt.json').read_text())['passed']
  if name=='public-draft':assert 'MTP PARITY PASS' in text
  if name=='draft-stream':assert 'DRAFT STREAM CHECK PASS' in text and 'FAIL' not in text
  if name=='draft-vision':assert 'MTP CHECK PASS' in text and 'SKIP' not in text
  if name=='draft-rows':assert 'MTP ROWCHECK PASS' in text
  if name=='app-reload':assert 'PASS: real lazy load' in text
  row['passed']=True;save();print('PASS',name,row['peak_physical_bytes'],flush=True)
 record['complete']=True
except BaseException as e:
 record['failure']=type(e).__name__+': '+str(e)
 if child is not None and child.poll() is None:terminate_child_tree(child)
 save();raise
finally:save()
````

### run-product-selection-models-v2.py

Original bytes: 5478. SHA-256: `27a87b30ec5ca06256fdefc508630855d59b21bccf9a5d9cdcbdf1211658a039`.

Normalized bytes: 5478. SHA-256: `27a87b30ec5ca06256fdefc508630855d59b21bccf9a5d9cdcbdf1211658a039`.

````text
from pathlib import Path
from datetime import datetime,timezone
import ctypes,ctypes.util,hashlib,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
r=Path('.build/quantization-research').absolute();out=r/'product-selection-models-v2'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
cli=Path('.build/release/slotstream').absolute();app=Path('apps/macos/.build/release/sevra-mac-checks').absolute()
fixture=r/'vq-composite-draft-v1/reference/comparison.safetensors'
legacy=r/'vq-dense-overlay-reference-repair-v1/mtp-reference/comparison.safetensors'
cells=[
 ('governor-fixed-plain',[str(cli),'optimization-state-check','--variant','governor-boundary','--memory-gb','10','--json'],10,13,900),
 ('governor-fixed-draft',[str(cli),'optimization-state-check','--variant','governor-boundary-mtp','--memory-gb','10','--json'],10,13,900),
 ('app-reload',[str(app),'--performance-real','--home',str(out/'disposable-home')],13,16,1800),
 ('research-draft',[str(cli),'quantization-draft-check','--baseline',str(Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit'),'--fixture',str(fixture),'--output',str(out/'research-output'),'--reference-arithmetic'],10,13,300),
 ('public-draft',[str(cli),'mtp-parity','--fixture',str(legacy)],10,13,300),
 ('draft-stream',[str(cli),'draft-stream-check'],12,15,1800),
 ('draft-vision',[str(cli),'mtp-check','--memory-gb','12','--mtp','on','--vision','on','--image','Tools/assets/vision_test/secret1.jpg'],12,15,1800),
 ('draft-rows',[str(cli),'mtp-rowcheck','--memory-gb','10'],10,13,1800)]
cells=cells[3:]
out.mkdir()
record={'complete':False,'started_at':datetime.now(timezone.utc).isoformat(),'scope':'Functional acceptance only; no throughput qualification, hardware simulation or model activation.',
 'maximum_concurrent_model_processes':1,'minimum_real_headroom_gb':3,'maximum_total_seconds':10800,
 'pins':{str(p):sha(p) for p in [cli,app,fixture,legacy,Path(__file__),Path('Tools/lib/mlx-0.32.2.metallib')]},
 'protocol':[{'name':n,'command':c,'process_bound_gb':p,'preflight_gb':f,'timeout_seconds':t} for n,c,p,f,t in cells], 'runs':[]}
lib=ctypes.CDLL(ctypes.util.find_library('proc'));began=time.monotonic();child=None
def save():(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG','VQ_','VQLAB_'))}
# Research requires no ambient override; production-only pressure flag is not inherited.
record['explicit_environment']={};record['prior_run']={'path':'product-selection-models-v1/receipt.json','sha256':sha(r/'product-selection-models-v1/receipt.json'),'reason':'Production pressure and app checks passed. Research refused the production-only ambient flag before loading; remaining cases now use a clean environment.'};save()
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
  if name.startswith('governor-'):
   value=json.loads(text);assert value.get('passed') is True and not value.get('skipped'),value
  if name=='research-draft':assert json.loads((out/'research-output/receipt.json').read_text())['passed']
  if name=='public-draft':assert 'MTP PARITY PASS' in text
  if name=='draft-stream':assert 'DRAFT STREAM CHECK PASS' in text and 'FAIL' not in text
  if name=='draft-vision':assert 'MTP CHECK PASS' in text and 'SKIP' not in text
  if name=='draft-rows':assert 'MTP ROWCHECK PASS' in text
  if name=='app-reload':assert 'PASS: real lazy load' in text
  row['passed']=True;save();print('PASS',name,row['peak_physical_bytes'],flush=True)
 record['complete']=True
except BaseException as e:
 record['failure']=type(e).__name__+': '+str(e)
 if child is not None and child.poll() is None:terminate_child_tree(child)
 save();raise
finally:save()
````

### product-selection-static-v1.log

Original bytes: 34169. SHA-256: `dce02f4726b28cb78a8e42aa2c250230f37c4efc5be69cee3917ae2a3f0523bd`.

Normalized bytes: 34169. SHA-256: `dce02f4726b28cb78a8e42aa2c250230f37c4efc5be69cee3917ae2a3f0523bd`.

````text
................................
----------------------------------------------------------------------
Ran 32 tests in 25.495s

OK
..........
----------------------------------------------------------------------
Ran 10 tests in 7.100s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 1.080s

OK
........................
----------------------------------------------------------------------
Ran 24 tests in 9.003s

OK
...
----------------------------------------------------------------------
Ran 3 tests in 0.624s

OK
........
----------------------------------------------------------------------
Ran 8 tests in 8.140s

OK
.......
----------------------------------------------------------------------
Ran 7 tests in 4.498s

OK
.........
----------------------------------------------------------------------
Ran 9 tests in 7.400s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.920s

OK
............................
----------------------------------------------------------------------
Ran 28 tests in 35.201s

OK
coverage comparison and report failure checks pass
..{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}
..........
----------------------------------------------------------------------
Ran 12 tests in 0.026s

OK
...
----------------------------------------------------------------------
Ran 3 tests in 3.131s

OK
test_fast_response_remains_complete (__main__.RequestDeadlines) ... ok
test_idle_peer_returns_no_answer (__main__.RequestDeadlines) ... ok
test_incomplete_body_is_not_reported_as_success (__main__.RequestDeadlines) ... ok
test_redirect_remains_supported (__main__.RequestDeadlines) ... ok
test_slow_progress_cannot_extend_the_total_deadline (__main__.RequestDeadlines) ... ok
test_successful_empty_response_is_preserved (__main__.RequestDeadlines) ... ok

----------------------------------------------------------------------
Ran 6 tests in 2.649s

OK
test_gaps_overlaps_and_wrong_spans_stay_rejected (__main__.EmptyTensors) ... ok
test_valid_empty_layouts_are_independent_of_dictionary_order (__main__.EmptyTensors) ... ok

----------------------------------------------------------------------
Ran 2 tests in 0.554s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.501s

OK
.....{"phase": "waiting for build reservation", "seconds": 0.0}
.
----------------------------------------------------------------------
Ran 6 tests in 0.004s

OK
..............
----------------------------------------------------------------------
Ran 14 tests in 1.349s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
........
----------------------------------------------------------------------
Ran 8 tests in 0.001s

OK
...................................................
----------------------------------------------------------------------
Ran 51 tests in 0.015s

OK
......
----------------------------------------------------------------------
Ran 6 tests in 0.018s

OK
......
----------------------------------------------------------------------
Ran 6 tests in 0.004s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.000s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.002s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.009s

OK
..............................
----------------------------------------------------------------------
Ran 30 tests in 2.128s

OK
...........
----------------------------------------------------------------------
Ran 11 tests in 0.076s

OK
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
.{"starting": "native/combined-plain"}
..{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "paired/sampled-short"}
{"starting": "paired/mtp-resource"}
{"starting": "paired/distinct-tail"}
{"starting": "paired/complete-repeat"}
{"starting": "paired/unique-with-retention"}
{"starting": "paired/actual-default-one-token"}
{"starting": "soak/off"}
{"starting": "soak/on"}
....{"starting": "native/combined-plain"}
.{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
.{"starting": "native/combined-plain"}
..{"starting": "native/combined-plain"}
..
----------------------------------------------------------------------
Ran 13 tests in 1.203s

OK
..........{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
.
----------------------------------------------------------------------
Ran 11 tests in 0.079s

OK
...
----------------------------------------------------------------------
Ran 3 tests in 0.001s

OK
...
----------------------------------------------------------------------
Ran 3 tests in 0.000s

OK
..
----------------------------------------------------------------------
Ran 2 tests in 0.137s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.004s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.001s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.003s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.005s

OK
...
----------------------------------------------------------------------
Ran 3 tests in 0.002s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.004s

OK
.{"verified_overlay": "tensor.safetensors"}
....
----------------------------------------------------------------------
Ran 5 tests in 0.002s

OK
..
----------------------------------------------------------------------
Ran 2 tests in 0.001s

OK
..
----------------------------------------------------------------------
Ran 2 tests in 0.001s

OK
..
----------------------------------------------------------------------
Ran 2 tests in 0.001s

OK
...
----------------------------------------------------------------------
Ran 3 tests in 0.002s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
...
----------------------------------------------------------------------
Ran 3 tests in 0.002s

OK
..
----------------------------------------------------------------------
Ran 2 tests in 0.005s

OK
llms-full.txt is current
0 issue(s): 0 error(s), 0 warning(s), 0 info
MEASUREMENTS.md is current
PLAN.md is current
claims gate: 349 needle checks, 0 failures
BRAIN GATES PASS
dequant_row.txt: OK
layer_0.bin: OK
layer_1.bin: OK
layer_2.bin: OK
layer_3.bin: OK
ngram_ids.txt: OK
tokens.txt: OK
MTP PROCESS GUARD PASS (standalone and research)
PASS  request VM counters are monotonic
PASS  request VM reclaimable bytes are available
PASS  process physical footprint is readable
PASS  process compatibility high-water is readable
PASS  lifetime RSS is separately readable
PASS  kernel lifetime footprint includes current allocation
PASS  statistics publish current and lifetime observations
PASS  statistics predating the lifetime footprint field still decode
PASS  disk tier statistics round trip
PASS  disk tier statistics from 0.2.18 to 0.2.20, without shared prefixes, still decode
PASS  monotonic duration is nonnegative
PASS  footprint sampler includes endpoints
PASS  automatic platform-qualified optimization defaults
PASS  qualified platform adds independently qualified fused prefill
PASS  unqualified platform 0 keeps portable work and original rotation
PASS  unqualified platform 1 keeps portable work and original rotation
PASS  unqualified platform 2 keeps portable work and original rotation
PASS  unqualified platform 3 keeps portable work and original rotation
PASS  unqualified platform 4 keeps portable work and original rotation
PASS  unqualified platform 5 keeps portable work and original rotation
PASS  unqualified platform 6 keeps portable work and original rotation
PASS  unqualified platform 7 keeps portable work and original rotation
PASS  unqualified platform 8 keeps portable work and original rotation
PASS  unqualified platform 9 keeps portable work and original rotation
PASS  unqualified platform 10 keeps portable work and original rotation
PASS  unqualified platform 11 keeps portable work and original rotation
PASS  unqualified platform 12 keeps portable work and original rotation
PASS  platform selection is deterministic
PASS  explicit kernel qualification remains available
PASS  explicit kernel fallback remains available
PASS  explicit fused attention fallback remains available
PASS  explicit fused attention qualification remains available
PASS  fused capability applegpu_g17s/26.2
PASS  fused capability applegpu_g17s/26.1
PASS  fused capability applegpu_g17p/26.2
PASS  fused capability applegpu_g18p/26.2
PASS  fused capability applegpu_g16s/26.3
PASS  fused capability applegpu_g17s/15.9
PASS  fused capability Unknown/26.2
PASS  fused capability applegpu_g17x/26.2
PASS  backend arithmetic overrides separate cache identity
PASS  unrelated environment does not invalidate arithmetic
PASS  legacy control encoding omits unset fused prefill
PASS  reference control encoding omits unset automatic policy
PASS  old control JSON remains decodable
PASS  automatic policy survives saved control round trip
PASS  absent overrides preserve an inherited automatic policy
PASS  explicit automatic zero restores the chronological policy
PASS  explicit automatic one enables only that policy
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_READ_SCOPE
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_LAYER_WORKSPACE
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_INDEXER_TILES
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_PLE_TILES
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_WORKSPACE_TILE
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_SCOPE_FRONTIER
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_WORKSPACE_PIECES
PASS  malformed automatic policy refuses/true
PASS  malformed automatic policy refuses/-1
PASS  malformed automatic policy refuses/2
PASS  malformed automatic policy refuses/
PASS  absent vision overrides retain inherited tiling
PASS  explicit zero padding leaves inherited tiling enabled
PASS  explicit zero query tile selects original vision attention
PASS  explicit padding overrides inherited tiling/80
PASS  explicit tiling overrides inherited padding/80
PASS  explicit query zero retains inherited padding/80
PASS  explicit padding with query zero remains valid/80
PASS  explicit query tile with padding zero remains valid/80
PASS  two explicit vision alternatives refuse/80
PASS  two explicit vision alternatives refuse/80
PASS  two explicit vision alternatives refuse/80
PASS  explicit padding overrides inherited tiling/128
PASS  explicit tiling overrides inherited padding/128
PASS  explicit query zero retains inherited padding/128
PASS  explicit padding with query zero remains valid/128
PASS  explicit query tile with padding zero remains valid/128
PASS  two explicit vision alternatives refuse/128
PASS  two explicit vision alternatives refuse/128
PASS  two explicit vision alternatives refuse/128
PASS  inherited vision defaults still reject malformed override/SLOTSTREAM_OPT_VISION_PADDING/bad
PASS  inherited vision defaults still reject malformed override/SLOTSTREAM_OPT_VISION_PADDING/256
PASS  inherited vision defaults still reject malformed override/SLOTSTREAM_OPT_VISION_QUERY_TILE/bad
PASS  inherited vision defaults still reject malformed override/SLOTSTREAM_OPT_VISION_QUERY_TILE/128
PASS  combined candidate preserves the original MTP verification shape
PASS  absent overrides retain the selected default family
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPACT_STATE
PASS  explicit one restores only SLOTSTREAM_OPT_COMPACT_STATE
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPACT_MTP
PASS  explicit one restores only SLOTSTREAM_OPT_COMPACT_MTP
PASS  explicit zero disables only SLOTSTREAM_OPT_NGRAM_ROWS
PASS  explicit one restores only SLOTSTREAM_OPT_NGRAM_ROWS
PASS  explicit zero disables only SLOTSTREAM_OPT_FINAL_FORWARD
PASS  explicit one restores only SLOTSTREAM_OPT_FINAL_FORWARD
PASS  explicit zero disables only SLOTSTREAM_OPT_SAMPLER_THRESHOLD
PASS  explicit one restores only SLOTSTREAM_OPT_SAMPLER_THRESHOLD
PASS  explicit zero disables only SLOTSTREAM_OPT_SAMPLER_DRAW
PASS  explicit one restores only SLOTSTREAM_OPT_SAMPLER_DRAW
PASS  explicit zero disables only SLOTSTREAM_OPT_OUTPUT_QUEUE
PASS  explicit one restores only SLOTSTREAM_OPT_OUTPUT_QUEUE
PASS  explicit zero disables only SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR
PASS  explicit one restores only SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPLETE_PROMPT
PASS  explicit one restores only SLOTSTREAM_OPT_COMPLETE_PROMPT
PASS  explicit zero disables only SLOTSTREAM_OPT_SHARED_ROPE
PASS  explicit one restores only SLOTSTREAM_OPT_SHARED_ROPE
PASS  explicit zero disables only SLOTSTREAM_OPT_FUSED_ROPE
PASS  explicit one restores only SLOTSTREAM_OPT_FUSED_ROPE
PASS  explicit zero keeps demand reads staged
PASS  explicit one restores direct demand reads
PASS  explicit zeros restore the complete reference inference family
PASS  explicit numeric zero disables inherited prefix retention
PASS  non-optimization environment leaves the family intact
PASS  selected defaults still reject invalid override ["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"]
PASS  selected defaults still reject invalid override ["SLOTSTREAM_OPT_TYPO": "0"]
PASS  valid inherited read scope retains its prerequisites
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_COMPACT_STATE
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_COMPACT_MTP
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_LAYER_WORKSPACE
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_INDEXER_TILES
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_PLE_TILES
PASS  scope can be disabled while retaining its other independent work
PASS  public environment function value keeps its signature and automatic default
PASS  typed override enables compaction
PASS  combined candidate splits the speculative verify attention
PASS  explicit zero disables only SLOTSTREAM_OPT_VERIFY_SPLIT
PASS  explicit one restores only SLOTSTREAM_OPT_VERIFY_SPLIT
PASS  the verify split threshold override leaves the family intact
PASS  reference leaves the verify-pass controls unset
PASS  explicit verify split threshold is read
PASS  verify split threshold rejects -1
PASS  verify split threshold rejects x
PASS  verify split threshold rejects 1.5
PASS  verify split threshold rejects an empty value
PASS  explicit one enables row-invariant projections
PASS  explicit zero returns row-invariant projections to unset
PASS  row-invariant projections stay off unless selected
PASS  verify split engages from 6,144 keys by default
PASS  exact mode promises passes of up to five rows
PASS  no split control selects the stock verify attention
PASS  the split control alone selects the split
PASS  the split with row-invariant projections selects the exact mode
PASS  stock never engages
PASS  the split engages for three to eight rows from its threshold
PASS  the exact mode engages from two rows, never for one
PASS  malformed override refused
PASS  unknown optimization refused
PASS  invalid read scope -1 refused
PASS  invalid read scope 1 refused
PASS  invalid read scope 16384 refused
PASS  invalid read scope bad refused
PASS  unbounded read scope refused
PASS  explicit workspace tile is recorded
PASS  unbounded workspace tile refused
PASS  terminal output needs no speculative draft
PASS  draft count fits remaining output
PASS  public depth cannot exceed recording cap
PASS  negative remaining output cannot underflow
PASS  prefix cache reaches its four-entry bound
PASS  an identical history replaces instead of duplicating an entry
PASS  a miss evicts before allocating a fifth state
PASS  a smaller live token ceiling evicts immediately
PASS  held GB includes fixed recurrent state
PASS  growing hit still reuses its state
PASS  growing hit reserves future state before allocation
PASS  huge reservation safely misses
PASS  huge reservation releases held state
PASS  capacity reservation still hits
PASS  capacity growth reserves bytes before reuse
PASS  saturated byte reservation evicts safely
PASS  identical bytes hash alike
PASS  different bytes do not
PASS  the same image at the same offset matches
PASS  a swapped image does not
PASS  an entry ending inside a run still matches that run
PASS  a text-only entry rejects a prompt with an image inside its range
PASS  an image beyond the entry's range is irrelevant to the match
PASS  a vision conversation is held, not discarded
PASS  the same ids with a different picture miss
PASS  the text-only splice never sees a vision entry
PASS  prefix splice chooses the longest retained extension
PASS  prefix splice is strict, not an identical-history match
PASS  prefix splice lookup does not consume the retained state
PASS  a disabled prefix cache offers no splice
PASS  shard listing works through a symlinked model dir
PASS  8.1 GB plan stays inside its target
PASS  10.0 GB plan stays inside its target
PASS  16.0 GB plan stays inside its target
PASS  30.0 GB plan stays inside its target
RUNTIME CHECK PASS
{
  "device": "Apple M5 Pro",
  "exit_code": 0,
  "failures": [],
  "maximum_live_gpu_buffer_bytes": 201326592,
  "model_loaded": false,
  "observations": [
    {
      "lifetime_rss_peak_bytes": 12877824,
      "phase": "baseline",
      "physical_footprint_bytes": 4047328,
      "reported_peak_bytes": 12861440,
      "sampled_peak_bytes": 4047328
    },
    {
      "lifetime_rss_peak_bytes": 18530304,
      "phase": "transient_128_mib",
      "physical_footprint_bytes": 202343000,
      "reported_peak_bytes": 202343000,
      "sampled_peak_bytes": 202343000
    },
    {
      "lifetime_rss_peak_bytes": 18530304,
      "phase": "transient_freed",
      "physical_footprint_bytes": 68125272,
      "reported_peak_bytes": 202343000,
      "sampled_peak_bytes": 202343000
    },
    {
      "lifetime_rss_peak_bytes": 18661376,
      "phase": "persistent_64_mib",
      "physical_footprint_bytes": 135381616,
      "reported_peak_bytes": 202343000,
      "sampled_peak_bytes": 202343000
    },
    {
      "lifetime_rss_peak_bytes": 18661376,
      "phase": "persistent_plus_transient",
      "physical_footprint_bytes": 269599344,
      "reported_peak_bytes": 269599344,
      "sampled_peak_bytes": 269599344
    },
    {
      "lifetime_rss_peak_bytes": 18661376,
      "phase": "persistent_after_transient_freed",
      "physical_footprint_bytes": 135381616,
      "reported_peak_bytes": 269599344,
      "sampled_peak_bytes": 269599344
    },
    {
      "lifetime_rss_peak_bytes": 18661376,
      "phase": "all_gpu_buffers_freed",
      "physical_footprint_bytes": 68272752,
      "reported_peak_bytes": 269599344,
      "sampled_peak_bytes": 269599344
    },
    {
      "lifetime_rss_peak_bytes": 27049984,
      "phase": "cpu_allocation_after_gpu_peak",
      "physical_footprint_bytes": 76677768,
      "reported_peak_bytes": 269599344,
      "sampled_peak_bytes": 269599344
    },
    {
      "lifetime_rss_peak_bytes": 27049984,
      "phase": "after_concurrent_reads",
      "physical_footprint_bytes": 68338312,
      "reported_peak_bytes": 269599344,
      "sampled_peak_bytes": 269599344
    }
  ],
  "passed": true,
  "source_sha256": {
    "Sources/Slotstream/Checkpoint.swift": "361b54ab482ab1b08debf846148d16fb811ee3550cb8ca1ae7526dc9b825e04b",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
    "Tools/process_memory_check.swift": "17c4ee5dfdff19b1bc467ad896047f6cc8c35d27850d1a62b88f39ea59ff704b",
    "Tools/process_memory_gate.py": "4c53de73f03cbd0a9483eab0a089cdd7e661db96300ade8ae1ca218d9c29d88a"
  }
}
PASS  matching file is accepted
PASS  same-size corruption is rejected
PASS  exact Content-Range is accepted
PASS  wrong range start is rejected
PASS  wrong range total is rejected
PASS  unknown range total is rejected
PASS  every pinned file has a digest
PASS  the draft head is pinned as the one optional file
PASS  an absent optional file is not a repair; an absent required one is
PASS  an empty directory reads as missing
PASS  missing needs the required model
PASS  status carries free disk
PASS  bytesToFetch agrees with required files
PASS  a missing copy is not ready
PULL CHECK PASS
[
  {
    "case": "success",
    "passed": true,
    "exit": 0,
    "output": "READY_SUCCESS\n"
  },
  {
    "case": "failure",
    "passed": true,
    "exit": 1,
    "output": "ORDINARY_FAILURE\n"
  },
  {
    "case": "cancel-throw",
    "passed": true,
    "exit": 130,
    "output": "download interrupted; rerun to resume verified chunks\n"
  },
  {
    "case": "cancel-return",
    "passed": true,
    "exit": 130,
    "output": "download interrupted; rerun to resume verified chunks\n"
  },
  {
    "case": "SIGINT",
    "passed": true,
    "exit": 130,
    "output": "WAITING\ndownload interrupted; rerun to resume verified chunks\n"
  },
  {
    "case": "SIGTERM",
    "passed": true,
    "exit": 130,
    "output": "WAITING\ndownload interrupted; rerun to resume verified chunks\n"
  }
]
.......
----------------------------------------------------------------------
Ran 7 tests in 0.007s

OK
{"bf16_predictions":16711680,"centers":1000000,"roundtrips":60,"malformed_inputs":39583,"pass":true}
MANIFEST CHECKS PASS
{"name": "normal", "pass_": true, "seconds": 0.25, "returncode": 0}
{"name": "cache-miss-reporting", "pass_": true, "seconds": 0.03, "returncode": 0}
{"name": "redirect", "pass_": true, "seconds": 0.031, "returncode": 0}
{"name": "bad-object-fallback", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.03, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "optional-absent", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "bad-object-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "retry-after", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "hugging-face-rate-limit", "pass_": true, "seconds": 5.541, "returncode": 0}
{"name": "cancel-during-hugging-face-rate-limit", "pass_": true, "seconds": 0.494, "returncode": 1}
{"name": "transient-retry", "pass_": true, "seconds": 5.377, "returncode": 0}
{"name": "wrong-length-fallback", "pass_": true, "seconds": 11.462, "returncode": 0}
{"name": "short-body-fallback", "pass_": true, "seconds": 36.448, "returncode": 0}
{"name": "content-encoding-fallback", "pass_": true, "seconds": 36.499, "returncode": 0}
{"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.483, "returncode": 1}
{"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.037, "returncode": 1}
{"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.031, "returncode": 0}
{"name": "resume", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "already-installed", "pass_": true, "seconds": 0.014, "returncode": 0}
{"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.014, "returncode": 0}
{"name": "corruption-seed", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "same-size-final-repair", "pass_": true, "seconds": 0.018, "returncode": 0}
{"name": "invalid-resume-map", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "part-symlink-rejected", "pass_": true, "seconds": 0.006, "returncode": 1}
{"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "part-fifo-rejected", "pass_": true, "seconds": 0.004, "returncode": 1}
{"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.01, "returncode": 1}
ALL HTTP CHECKS PASS
{"name": "raw-inflight-peer-failure", "pass_": true, "seconds": 0.562, "timed_out": false, "request_counts": {"slow.bin": 1, "peer.bin": 1}, "returncode": 1}
{"name": "raw-inflight-peer-hash-failure", "pass_": true, "seconds": 0.136, "timed_out": false, "request_counts": {"slow.bin": 1, "peer.bin": 1}, "returncode": 1}
{"name": "raw-inflight-user-cancel", "pass_": true, "seconds": 0.339, "timed_out": false, "request_counts": {"slow.bin": 1, "peer.bin": 1}, "returncode": 1}
{"name": "raw-inflight-success", "pass_": true, "seconds": 0.319, "timed_out": false, "request_counts": {"slow.bin": 1, "peer.bin": 1}, "returncode": 0}
{"name": "raw-inflight-optional-failure", "pass_": true, "seconds": 0.339, "timed_out": false, "request_counts": {"slow.bin": 1, "peer.bin": 1}, "returncode": 0}
{"name": "raw-retry-after-429", "pass_": true, "seconds": 3.135, "request_offsets": [0.0, 3.1], "returncode": 0}
{"name": "raw-retry-after-503", "pass_": true, "seconds": 3.116, "request_offsets": [0.0, 3.084], "returncode": 0}
{"name": "raw-ratelimit-429", "pass_": true, "seconds": 3.139, "request_offsets": [0.0, 3.11], "returncode": 0}
{"name": "raw-headerless-429-cancel", "pass_": true, "seconds": 3.448, "request_offsets": [0.0], "returncode": 1}
{"name": "raw-long-retry-cancel", "pass_": true, "seconds": 3.4, "request_offsets": [0.0], "returncode": 1}
{"name": "raw-short-retry-cancel", "pass_": true, "seconds": 0.347, "request_offsets": [0.0], "returncode": 1}
{"name": "raw-404-retry-header-fallback", "pass_": true, "seconds": 0.014, "request_offsets": [0.0], "returncode": 0, "fallback_request_offsets": [0.002]}
{"name": "raw-protocol-retry-header-fallback", "pass_": true, "seconds": 0.014, "request_offsets": [0.0], "returncode": 0, "fallback_request_offsets": [0.001]}
{"name": "raw-retry-peer-failure", "pass_": true, "seconds": 0.331, "request_offsets": [0.0], "returncode": 1}
{"name": "raw-retry-optional-skip", "pass_": true, "seconds": 0.352, "request_offsets": [0.0], "returncode": 0, "optional_request_counts": [1, 1]}
{"name": "raw-multichunk", "pass_": true, "seconds": 0.333, "returncode": 0}
{"name": "raw-installed-no-http", "pass_": true, "seconds": 0.259, "returncode": 0}
{"name": "raw-source-fallback-missing", "pass_": true, "seconds": 0.353, "returncode": 0}
{"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 0.334, "returncode": 0}
{"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 40.75, "returncode": 0}
{"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 0.335, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.024, "returncode": 1}
{"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.164, "returncode": 1}
{"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.208, "returncode": 0}
{"name": "raw-cancel", "pass_": true, "seconds": 3.34, "returncode": 1}
{"name": "raw-resume", "pass_": true, "seconds": 0.332, "returncode": 0}
{"name": "raw-same-size-repair", "pass_": true, "seconds": 0.457, "returncode": 0}
ALL RAW HTTP CHECKS PASS
SUSTAINED MEMORY PASS 293486592 bytes peak RSS
SLOTPACK GATES PASS
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: refuses an unphysical minimum allocation
PASS  8GB Mac: refuses an unphysical minimum allocation
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the measured basis for its default
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 refuses physical overcommit without trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
PASS  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  a big cache keeps the head's experts resident
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto on at --memory-gb 22 (resident: 76/layer after the charge)
PASS  decode lookahead rides the head at --memory-gb 22
PASS  32 GB Mac: auto runs the head and the lookahead
PASS  24 GB Mac: auto streams the head's experts and runs the lookahead
PASS  32 GB Mac at 65,536 tokens keeps the head by streaming its experts
PASS  36 GB Mac at 65,536 tokens keeps the head and the lookahead
PASS  --memory-gb 16: below 76/layer the head streams its experts, with the lookahead
PASS  streamed head charge visible in json
PASS  --memory-gb 12: the streamed head reaches its 28/layer floor
PASS  --memory-gb 11: below the head's floor, plain decode with the lookahead
PASS  SLOTSTREAM_MTP_EXPERTS=resident keeps the resident head's floor
PASS  SLOTSTREAM_MTP_EXPERTS gibberish refused
PASS  SLOTSTREAM_OPT_EXPERT_PREFETCH=0 keeps the head without the lookahead
PASS  decode lookahead charge visible in json
PASS  --mtp on forces the head onto a small machine
PASS  a head forced below the floor runs without the lookahead
PASS  --mtp off suppresses it everywhere
PASS  --mtp off runs the lookahead in plain decode
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target plus the streamed head
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
PASS  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
PASS  --model with a corrupt safetensors header
PASS  safetensors dtype/shape byte mismatch rejected
PASS  safetensors header over 100MB rejected before allocation
PASS  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  16 GB Mac: automatic window is 32,768
PASS  24 GB Mac: automatic window is 32,768
PASS  32 GB Mac: automatic window is 32,768 (65,536 would stream the head)
PASS  36 GB Mac: automatic window is 65,536
PASS  48 GB Mac: auto preserves cache with unmeasured benefit
PASS  64 GB Mac: automatic window is 131,072
PASS  96 GB Mac: automatic window is 262,144
PASS  128 GB Mac: automatic window is 262,144
PASS  --max-context auto is the default
PASS  a fixed cache size keeps the default window
PASS  an explicit window is reported as explicit
PASS  128 GB: the window rides above the knee and doctor marks the choice
PASS  a busy big Mac lowers the automatic window and keeps the head
PASS  an explicit window too large to retain says how much follow-ups reuse
PASS  automatic window JSON lists every candidate and retains the chosen window
PASS  serve --max-context auto is accepted by the parser
PASS  an unparseable --max-context is refused
PASS  prefill-schedule: full model window obeys the product without exemptions
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 97, failed 0
{
  "passed": true,
  "model_loaded": false,
  "hardware_qualified": false,
  "binary_sha256": "e066b7a195ef50d8138062c5c24431af68c621a23b14f20b3e579b117d0a5b31",
  "cases": 420,
  "failures": []
}

######################################################################## 100.0%

######################################################################## 100.0%

######################################################################## 100.0%
INSTALLER GATES PASS
STATIC GATES PASS
````

### product-selection-mac-checks-v1.log

Original bytes: 6553. SHA-256: `8790532cad8b6a70a6ee785b45eb5b30d3d4cb228814e4c90a5c71c065ce3e67`.

Normalized bytes: 6553. SHA-256: `8790532cad8b6a70a6ee785b45eb5b30d3d4cb228814e4c90a5c71c065ce3e67`.

````text
PASS: saved document preview, symlink refusal and read budget
PASS: owner exclusion, real dbmd persistence, duplicate submit, bounded tool loop, exact approval, artifact publication, restart, draft, incognito
PASS: terminal gating, undeclared tools, single-file scope, sibling refusal, source symlink substitution
PASS: fresh-URL Home restart, macOS system-alias IPC binding and user-symlink refusal
PASS: historical documents and citations, journal atomic acceptance and restart, duplicate/revision refusal and closed-owner guards
PASS: idempotent memory admission and complete eligible memory text in AI context
PASS: malformed termination, undeclared mixed calls and multiple proposals fail before execution
PASS: one bounded tool-schema correction, no partial execution, preserved review, exhausted-retry and unavailable-tool refusal
PASS: observed artifact=propose spelling correction without alias execution; rejection and stale approval refusal
PASS: invalid artifact and duplicate identities do not poison durable recovery
PASS: source Unicode boundaries and skipped symbolic links
PASS: model verification hash parity and mid-read cancellation without model allocation
PASS: coherent Home backup, complete manifest, exact drafts, pending review, inert restore, explicit activation, monotonic Forget, unknown epochs, corruption/missing/symlink/path/collision/closure refusal and create-only publication
PASS: external draft inspection, exact review race refusal, preserved versions, revision adoption, restart review, no implicit inference, malformed record refusal and normal work after reconciliation
PASS: long Home recent windows, exact retained history, inspectable partial excerpts, matching-memory ranking, bounded full-memory text, suppression lineage and thread-only read/write scope
PASS: Home promotion selection, visible quotations, exact model context, idempotence, drafts, permissions, scope, restart, Forget, active-run refusal and external edits
PASS: session model verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=true
PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
PASS: context overflow preserves messages and refuses instead of silently trimming history
PASS: clicks apply at once, saves merge in the background, a saved draft waits for disk, nothing is lost (2 saves)
PASS: cooperative cancellation, FIFO cross-thread scheduling, durable nonce registry
PASS: real process termination after intent, documents, artifact and root record; idempotent restart
PASS: per-thread external edits pause writes and preserve user bytes
PASS: authenticated Unix IPC, long Home paths, invalid capability refusal, Incognito isolation, idempotent client submission and detached completion
PASS: draft revision races, submit/autosave ordering, shared/thread-only/incognito recall, correction provenance and Forget
PASS: thinking off by default, sticky switch, live thought, receipt, answer now, tool turns think within their budget, restart, no thought on disk
PASS: incognito thought stays in memory and leaves with its thread; local endpoint thinking intents
PASS: response numbers add up across rounds, the reply line and copied details state them, receipts merge, the thought preview flows
PASS: a thinking job records exact per-round numbers, a refused round counts, thoughts keep one step per round, numbers persist without text, older runs still decode, live speed while thinking and writing, notes for the eight most recent runs
PASS: document helper sandbox denies file reads, folder listing, writes, loopback network, process launch, window server and home access; its memory limit counts the whole process group
PASS: multi-source attach, hidden and dependency folders skipped, PDF pages, word search fallback, image and scan recognition, RTF, Word, locked/damaged/oversized refusals, detach
PASS: tool groups follow access; cancelled document reading stops its helper
PASS: documented limits: eight attachments, 8 MB text files, 64 MB documents, 40 recognized pages per request, live folder navigation
PASS: tool-round narration stays out of answers and leads its activity
PASS: the model is told which files are attached, so "what is this?" has a referent
PASS: a refused proposal is corrected once, and a job that keeps being refused still stops
PASS: change tools follow access, read-before-edit, exact diff review, digest-bound approval, exact writes preserving mode and tags, undo with Trash recovery
PASS: external edits win, discard, hard-link refusal, symbolic-link swap refusal, review across restart with re-attached folder, Incognito read-only
PASS: process death while writing is reported after restart, never replayed, and undoable
PASS: knowledge base search and query, record-only tools, protected frontmatter/contract/paths, db.md writes, index and validation, undo with index rebuild, mid-write record edits kept
PASS: /skill proposal, reserved names, exact publication, /name use, no implied tools, tamper refusal, deactivation, restart
PASS: app review, exact publication, grants, host document, create/get/update/archive/restore, revision conflicts, scope and version refusals, malformed and nested data, db.md validation
PASS: app revision with shared data, version switching, tamper refusal, removal keeps data, Incognito, restart, write budget, inert restore, outside-edit pause
PASS: immediate folder grant, directory browsing, live creation/edit/rename/deletion, direct reads, stale-edit refusal
PASS: root confinement, hidden files, symlink boundaries, scoped dependency traversal, file-only grants, multi-source identity and detach
OBSERVATION: 12001-file attachment accepted in 6.287501309998333e-05 seconds (functional observation, not a benchmark)
PASS: large folder acceptance, gap-free listing and search, changed-directory refusal, cancellation and descriptor cleanup
PASS: within-file pagination, UTF-8 offsets, query binding, content mutation and explicit word matching
PASS: global stream ceiling, honest cursor eviction and complete restart
PASS: explicit depth coverage, direct deep navigation, accurate capability context and owner tool-loop integration
````

### product-selection-build-v1/0.log

Original bytes: 3639. SHA-256: `af4b3d9c703e53e8940f211fb1a6a776aa265ab2d940c41e997053bb8005ac2c`.

Normalized bytes: 3611. SHA-256: `295a604f9d6536d4ed5e2f6fb791eb4c44c9b503bc03cf39c40274786332163a`.

````text
[0/1] Planning build
Building for production...
[0/6] Write swift-version--1AB21518FC5DEDBE.txt
[1/6] Write sources
[3/7] Compiling RealModule AlgebraicField.swift
[4/8] Compiling InternalCollectionsUtilities Debugging.swift
[5/9] Compiling EventSource AsyncEventsSequence.swift
[6/10] Compiling OrderedCollections _HashTable+Bucket.swift
[7/11] Compiling Crypto AES-GCM.swift
[8/12] Compiling Jinja AST.swift
[9/13] Compiling HuggingFace AccessRequest.swift
[10/14] Compiling ComplexModule Complex+AdditiveArithmetic.swift
[11/15] Compiling Hub BinaryDistinct.swift
[12/16] Compiling Numerics Numerics.swift
[13/17] Compiling Tokenizers BPETokenizer.swift
[14/18] Compiling MLX ArrayAt.swift
[15/19] Compiling Generation Decoders.swift
[16/20] Compiling MLXNN Activations.swift
[17/21] Compiling Models LanguageModel.swift
[18/22] Compiling MLXFast MLXFast.swift
[18/22] Write sources
[20/23] Compiling Slotstream AdaptiveSpeculation.swift
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
[20/23] Write sources
[22/24] Compiling SevraRuntime Changes.swift
<HOME>/Projects/slotstream/apps/macos/Runtime/Inference.swift:442:22: warning: capture of 'cache' with non-Sendable type 'ModelVerificationCache' in a '@Sendable' closure [#SendableClosureCaptures]
440 |         DispatchQueue.global(qos: .utility).async {
441 |             let store = WeightStore(modelDirectory: model)
442 |             _ = try? cache.check(files: files, shouldContinue: { !ahead.cancelled }) {
    |                      `- warning: capture of 'cache' with non-Sendable type 'ModelVerificationCache' in a '@Sendable' closure [#SendableClosureCaptures]
443 |                 try store.status(shouldContinue: { !ahead.cancelled }).isReady
444 |             }

<HOME>/Projects/slotstream/apps/macos/Runtime/ModelVerification.swift:8:21: note: class 'ModelVerificationCache' does not conform to the 'Sendable' protocol
 6 | /// writes, replacement, symlink retargeting, or optional-file arrival/removal.
 7 | /// Other filesystems keep full verification on every load.
 8 | package final class ModelVerificationCache {
   |                     `- note: class 'ModelVerificationCache' does not conform to the 'Sendable' protocol
 9 |     private struct Version: Equatable {
10 |         var path: String

[#SendableClosureCaptures]: <https://docs.swift.org/compiler/documentation/diagnostics/sendable-closure-captures>
[23/25] Compiling SevraMacChecks AdverseChecks.swift
[23/25] Write Objects.LinkFileList
[24/25] Linking sevra-mac-checks
Build of product 'sevra-mac-checks' complete! (129.45s)
````

### product-selection-build-v1/1.log

Original bytes: 334. SHA-256: `a47676580051838d68d523dd1bc862534e36e73cd39cda57751eddec2a503b31`.

Normalized bytes: 334. SHA-256: `a47676580051838d68d523dd1bc862534e36e73cd39cda57751eddec2a503b31`.

````text
Building for production...
[0/4] Write swift-version--1AB21518FC5DEDBE.txt
[1/4] Write sources
[3/5] Compiling Markdown ChildIndexPath.swift
[4/6] Compiling SevraPresentation ComposerSession.swift
[5/7] Compiling SevraMac AppModel.swift
[5/7] Write Objects.LinkFileList
[6/7] Linking Sevra
Build of product 'Sevra' complete! (24.05s)
````

### product-selection-build-v1/2.log

Original bytes: 2189. SHA-256: `c2d58452fbf2bdbe43cb48312d22151bef1e0fee0bcd55e3fd3091ee9a1462eb`.

Normalized bytes: 2175. SHA-256: `34faf1c0028f89a250ba97082fca3ae58fcc0dc00fbcf02cb79b7d338d363d86`.

````text
[0/1] Planning build
Building for production...
[0/6] Write swift-version--1AB21518FC5DEDBE.txt
[1/6] Write sources
[3/7] Compiling RealModule AlgebraicField.swift
[4/8] Compiling InternalCollectionsUtilities Debugging.swift
[5/9] Compiling EventSource AsyncEventsSequence.swift
[6/10] Compiling OrderedCollections _HashTable+Bucket.swift
[7/11] Compiling Crypto AES-GCM.swift
[8/12] Compiling Jinja AST.swift
[9/13] Compiling HuggingFace AccessRequest.swift
[10/14] Compiling ComplexModule Complex+AdditiveArithmetic.swift
[11/15] Compiling Hub BinaryDistinct.swift
[12/16] Compiling Numerics Numerics.swift
[13/17] Compiling Tokenizers BPETokenizer.swift
[14/18] Compiling MLX ArrayAt.swift
[15/19] Compiling Generation Decoders.swift
[16/20] Compiling MLXNN Activations.swift
[17/21] Compiling Models LanguageModel.swift
[18/22] Compiling MLXFast MLXFast.swift
[19/23] Compiling ArgumentParserToolInfo ToolInfo.swift
[19/23] Write sources
[21/24] Compiling ArgumentParser BashCompletionsGenerator.swift
[21/24] Write sources
[23/25] Compiling Slotstream AdaptiveSpeculation.swift
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
````

### product-selection-build-v1/inputs-before.json

Original bytes: 38814. SHA-256: `112f44db7c9b514fafa637f5fad62ca301e8ac97d5d2845e3db5d5b41eb6adbd`.

Normalized bytes: 38814. SHA-256: `112f44db7c9b514fafa637f5fad62ca301e8ac97d5d2845e3db5d5b41eb6adbd`.

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
    "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
    "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
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
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "4b4157ef099e54ce4dff34f1bdc4c610df9356b4c48ac41f2c0fcc9b5ea93876",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
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
    "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
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
    "apps/macos/Runtime/Inference.swift": "8e145b72458a0a29e1cd4dee6cb03b65f38a9e13e8fcc06d4e8decbefbd7a531",
    "apps/macos/Runtime/InferenceCache.swift": "48aa1f16913c2ac4f227b11e76131c2d5e4860403cbc6280de91946b19aba670",
    "apps/macos/Runtime/LocalIPC.swift": "2f9ca541d07687034f6808958e54397f017f260d394216ab71cd8221bb3d599e",
    "apps/macos/Runtime/ModelSetup.swift": "3080010ef569fbee93c372a61699ef13e4ac4066a1be40815e991ff647b16e62",
    "apps/macos/Runtime/ModelVerification.swift": "6f07f49b04e4aeb7559aed01151f6b519eae9fa584b8f4b1525444068557f199",
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

### product-selection-build-v1/receipt.json

Original bytes: 3731. SHA-256: `c9f78f358bbc193795425f9647de5460464f545c59fa7588359ec0b6c1ced17c`.

Normalized bytes: 3731. SHA-256: `c9f78f358bbc193795425f9647de5460464f545c59fa7588359ec0b6c1ced17c`.

````text
{
  "kind": "bounded-single-worker-build",
  "model_processes": 0,
  "process_tree_ceiling_gb": 6,
  "preflight_gb": 9,
  "minimum_headroom_gb": 3,
  "maximum_seconds": 1800,
  "complete": false,
  "runs": [
    {
      "command": [
        "swift",
        "build",
        "--package-path",
        "apps/macos",
        "-c",
        "release",
        "--product",
        "sevra-mac-checks",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 64504552,
      "samples": 470,
      "exit_code": 0
    },
    {
      "command": [
        "swift",
        "build",
        "--package-path",
        "apps/macos",
        "-c",
        "release",
        "--product",
        "Sevra",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 48186088,
      "samples": 88,
      "exit_code": 0
    },
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
      "peak_tree_bytes": 54690488,
      "samples": 352
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11667750912,
    "swapins": 52,
    "swapouts": 2908,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    34758.\nPages active:                                1120223.\nPages inactive:                              1120044.\nPages speculative:                              1702.\nPages throttled:                                   0.\nPages wired down:                             197053.\nPages purgeable:                               21029.\n\"Translation faults\":                     2038782750.\nPages copy-on-write:                       103845364.\nPages zero filled:                        3337718708.\nPages reactivated:                         175364519.\nPages purged:                               12974107.\nFile-backed pages:                            656356.\nAnonymous pages:                             1585613.\nPages stored in compressor:                  1102746.\nPages occupied by compressor:                 611615.\nDecompressions:                            105736781.\nCompressions:                              119992903.\nPageins:                                  2385463984.\nPageouts:                                     495936.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 147600.\nPages tagged resident:                        112223.\nPages tagged compressed:                       35377.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5847.\nPages tag-storage free:                          152.\nPages tag-storage non-tag pageable:            92297.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5247488.\nTagged compressions:                          771341.\nTagged decompressions:                        645928.\n"
  },
  "commands": [
    [
      "swift",
      "build",
      "--package-path",
      "apps/macos",
      "-c",
      "release",
      "--product",
      "sevra-mac-checks",
      "-j",
      "1"
    ],
    [
      "swift",
      "build",
      "--package-path",
      "apps/macos",
      "-c",
      "release",
      "--product",
      "Sevra",
      "-j",
      "1"
    ],
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
  ],
  "failure": ""
}
````

### product-selection-build-v1/supervision-correction.json

Original bytes: 308. SHA-256: `66ea54594307ad21fb733dcf70c441df43e8a714a48298034c20d977e5af58fb`.

Normalized bytes: 308. SHA-256: `66ea54594307ad21fb733dcf70c441df43e8a714a48298034c20d977e5af58fb`.

````text
{"verdict":"incomplete","reason":"Process-group-only observation missed independently grouped Swift compiler children. Stopped the task-owned build tree. Successful compilation rows remain compilation evidence, not full compiler-tree memory evidence. V2 enumerates transitive parent links before sampling."}
````

### product-selection-build-v2/0.log

Original bytes: 328. SHA-256: `8db674f1fb79acee8bdbc512cf5082637eb70d181b2b2ed0df229ccf39e1a601`.

Normalized bytes: 328. SHA-256: `8db674f1fb79acee8bdbc512cf5082637eb70d181b2b2ed0df229ccf39e1a601`.

````text
Building for production...
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[1/3] Write sources
[3/4] Compiling SevraRuntime Changes.swift
[3/6] Write sources
[5/7] Compiling SevraMacChecks AdverseChecks.swift
[5/7] Write Objects.LinkFileList
[6/7] Linking sevra-mac-checks
Build of product 'sevra-mac-checks' complete! (30.59s)
````

### product-selection-build-v2/1.log

Original bytes: 212. SHA-256: `cb1e8bdf03d5b5d2e95d438d5199606b9b123121a1c74265b6dc2f6831026bbd`.

Normalized bytes: 212. SHA-256: `cb1e8bdf03d5b5d2e95d438d5199606b9b123121a1c74265b6dc2f6831026bbd`.

````text
Building for production...
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[2/4] Compiling SevraMac AppModel.swift
[2/4] Write Objects.LinkFileList
[3/4] Linking Sevra
Build of product 'Sevra' complete! (16.08s)
````

### product-selection-build-v2/2.log

Original bytes: 12126. SHA-256: `139a22a4b68133755c2cd141c78949d07f69843d255aaa816907c454f62618ab`.

Normalized bytes: 12007. SHA-256: `f71d914a4977041be920cd7393a44c97f3ee87b478e8257e383438308d069a2a`.

````text
Building for production...
[0/6] Write swift-version--1AB21518FC5DEDBE.txt
[1/6] Write sources
[5/7] Compiling RealModule AlgebraicField.swift
[6/8] Compiling InternalCollectionsUtilities Debugging.swift
[7/9] Compiling EventSource AsyncEventsSequence.swift
[8/10] Compiling OrderedCollections _HashTable+Bucket.swift
[9/11] Compiling Crypto AES-GCM.swift
[10/12] Compiling Jinja AST.swift
[11/13] Compiling HuggingFace AccessRequest.swift
[12/14] Compiling ComplexModule Complex+AdditiveArithmetic.swift
[13/15] Compiling Hub BinaryDistinct.swift
[14/16] Compiling Numerics Numerics.swift
[15/17] Compiling Tokenizers BPETokenizer.swift
[16/18] Compiling MLX ArrayAt.swift
[17/19] Compiling Generation Decoders.swift
[18/20] Compiling MLXNN Activations.swift
[19/21] Compiling Models LanguageModel.swift
[20/22] Compiling MLXFast MLXFast.swift
[21/23] Compiling ArgumentParserToolInfo ToolInfo.swift
[22/24] Compiling Slotstream AdaptiveSpeculation.swift
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
[23/25] Compiling ArgumentParser BashCompletionsGenerator.swift
[24/26] Compiling SlotstreamDiagnostics CheckReport.swift
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
[25/27] Compiling slotstream_cli CheckRendering.swift
[25/27] Write Objects.LinkFileList
[26/27] Linking slotstream
Build of product 'slotstream' complete! (197.13s)
````

### product-selection-build-v2/3.log

Original bytes: 297. SHA-256: `1df6abd6ed03617b50a43a148cd1c6b9b31f221062b7175190b873c00a9bcd58`.

Normalized bytes: 297. SHA-256: `1df6abd6ed03617b50a43a148cd1c6b9b31f221062b7175190b873c00a9bcd58`.

````text
Building for production...
[0/3] Write swift-version--1AB21518FC5DEDBE.txt
[2/4] Compiling SlotstreamTestKit AnthropicChecks.swift
[3/5] Compiling slotstream_checks main.swift
[3/5] Write Objects.LinkFileList
[4/5] Linking slotstream-checks
Build of product 'slotstream-checks' complete! (24.78s)
````

### product-selection-build-v2/inputs-after.json

Original bytes: 38814. SHA-256: `ee0575bea4b967e69d5f4328e0e5a7aa5995695e53300b41da8d026da717515f`.

Normalized bytes: 38814. SHA-256: `ee0575bea4b967e69d5f4328e0e5a7aa5995695e53300b41da8d026da717515f`.

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
    "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
    "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
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
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
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
    "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
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
    "apps/macos/Runtime/Inference.swift": "8e145b72458a0a29e1cd4dee6cb03b65f38a9e13e8fcc06d4e8decbefbd7a531",
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

### product-selection-build-v2/inputs-before.json

Original bytes: 38814. SHA-256: `ee0575bea4b967e69d5f4328e0e5a7aa5995695e53300b41da8d026da717515f`.

Normalized bytes: 38814. SHA-256: `ee0575bea4b967e69d5f4328e0e5a7aa5995695e53300b41da8d026da717515f`.

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
    "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
    "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
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
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
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
    "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
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
    "apps/macos/Runtime/Inference.swift": "8e145b72458a0a29e1cd4dee6cb03b65f38a9e13e8fcc06d4e8decbefbd7a531",
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

### product-selection-build-v2/receipt.json

Original bytes: 4002. SHA-256: `852c0701d659d3e74aa4ce433ed07f17f26d03977dd3e7fe6fc5a1eb0de5f039`.

Normalized bytes: 4002. SHA-256: `852c0701d659d3e74aa4ce433ed07f17f26d03977dd3e7fe6fc5a1eb0de5f039`.

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
        "--package-path",
        "apps/macos",
        "-c",
        "release",
        "--product",
        "sevra-mac-checks",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 990448472,
      "samples": 112,
      "exit_code": 0
    },
    {
      "command": [
        "swift",
        "build",
        "--package-path",
        "apps/macos",
        "-c",
        "release",
        "--product",
        "Sevra",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 1105857560,
      "samples": 59,
      "exit_code": 0
    },
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
      "peak_tree_bytes": 1683835928,
      "samples": 713,
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
      "peak_tree_bytes": 995494720,
      "samples": 91,
      "exit_code": 0
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 19219365888,
    "swapins": 52,
    "swapouts": 2908,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   454435.\nPages active:                                 951465.\nPages inactive:                               903642.\nPages speculative:                             46955.\nPages throttled:                                   0.\nPages wired down:                             213117.\nPages purgeable:                               15659.\n\"Translation faults\":                     2045161836.\nPages copy-on-write:                       104550221.\nPages zero filled:                        3341496042.\nPages reactivated:                         175366906.\nPages purged:                               12983297.\nFile-backed pages:                            702963.\nAnonymous pages:                             1199099.\nPages stored in compressor:                   928481.\nPages occupied by compressor:                 507670.\nDecompressions:                            105772994.\nCompressions:                              119993818.\nPageins:                                  2385570105.\nPageouts:                                     496073.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 147467.\nPages tagged resident:                        112409.\nPages tagged compressed:                       35058.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5847.\nPages tag-storage free:                         8197.\nPages tag-storage non-tag pageable:            84252.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5190720.\nTagged compressions:                          771723.\nTagged decompressions:                        646623.\n"
  },
  "commands": [
    [
      "swift",
      "build",
      "--package-path",
      "apps/macos",
      "-c",
      "release",
      "--product",
      "sevra-mac-checks",
      "-j",
      "1"
    ],
    [
      "swift",
      "build",
      "--package-path",
      "apps/macos",
      "-c",
      "release",
      "--product",
      "Sevra",
      "-j",
      "1"
    ],
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

### product-selection-ui-v1/0.log

Original bytes: 13579. SHA-256: `5693cd9c409fff4742ea475751a4604f7d04873bf35d62786f2cca16582f81bc`.

Normalized bytes: 13474. SHA-256: `0cf1ea78f9649d0d8e6997fcfd9d92d50a35d16a3365cbfed80311b5116b61cc`.

````text
[0/1] Planning build
Building for debugging...
[0/7] Write swift-version--1AB21518FC5DEDBE.txt
[1/7] Write sources
[5/8] Emitting module Slotstream
[6/24] Compiling Slotstream AppliedModelConfiguration.swift
[7/24] Compiling Slotstream Checkpoint.swift
[8/24] Compiling Slotstream Governor.swift
[9/24] Compiling Slotstream Layers.swift
[10/24] Compiling Slotstream MTP.swift
[11/24] Compiling Slotstream ModelPackRegistry.swift
[12/24] Compiling Slotstream NgramHash.swift
[13/24] Compiling Slotstream NgramStore.swift
[14/24] Compiling Slotstream VQArithmetic.swift
[15/24] Compiling Slotstream VQBankAdmission.swift
[16/24] Compiling Slotstream VQCheckpoint.swift
[17/24] Compiling Slotstream VQDenseOverlay.swift
[18/24] Compiling Slotstream VQDraftWeights.swift
[19/24] Compiling Slotstream VQExpert.swift
[20/24] Compiling Slotstream VQExpertKernels.swift
[21/24] Compiling Slotstream VQKernelSources.swift
[22/40] Compiling Slotstream VQModelProbe.swift
[23/40] Compiling Slotstream VQPLERows.swift
[24/40] Compiling Slotstream VQPackedExperts.swift
[25/40] Compiling Slotstream VQPrefillStream.swift
[26/40] Compiling Slotstream VQRecord.swift
[27/40] Compiling Slotstream VQRecordBank.swift
[28/40] Compiling Slotstream VQRecordCache.swift
[29/40] Compiling Slotstream VQRecordReadBatch.swift
[30/40] Compiling Slotstream VQRecordReadPlan.swift
[31/40] Compiling Slotstream VQResidentText.swift
[32/40] Compiling Slotstream VQRotaryTable.swift
[33/40] Compiling Slotstream VQRouteStream.swift
[34/40] Compiling Slotstream VQTensorFile.swift
[35/40] Compiling Slotstream VQTrunkProbe.swift
[36/40] Compiling Slotstream GatedDelta.swift
[37/40] Compiling Slotstream Weights.swift
[38/55] Compiling Slotstream Context.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[39/55] Compiling Slotstream EmbeddingRows.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[40/55] Compiling Slotstream Engine.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[41/55] Compiling Slotstream ExpertPredictor.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[42/55] Compiling Slotstream ExpertPrefetch.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[43/55] Compiling Slotstream ExpertStore.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[44/55] Compiling Slotstream FusedPrefillAttention.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[45/55] Compiling Slotstream Generate.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[46/55] Compiling Slotstream Model.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[47/55] Compiling Slotstream PartialRotation.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[48/55] Compiling Slotstream PersistentPrefixCache.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[49/55] Compiling Slotstream PersistentPrefixFormat.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[50/55] Compiling Slotstream PersistentPrefixGenerator.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[51/55] Compiling Slotstream PersistentPrefixPolicy.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[52/55] Compiling Slotstream PersistentPrefixRestore.swift
<HOME>/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }
[53/69] Compiling Slotstream PersistentPrefixSave.swift
[54/69] Compiling Slotstream Plan.swift
[55/69] Compiling Slotstream PrefixCache.swift
[56/69] Compiling Slotstream QuantizationLayout.swift
[57/69] Compiling Slotstream ResidentExpertOverlap.swift
[58/69] Compiling Slotstream RouterProjection.swift
[59/69] Compiling Slotstream SelectedAttention.swift
[60/69] Compiling Slotstream Server.swift
[61/69] Compiling Slotstream StatePrefixFork.swift
[62/69] Compiling Slotstream StateRecovery.swift
[63/69] Compiling Slotstream VQDecode.swift
[64/69] Compiling Slotstream VerifyPassSelfCheck.swift
[65/69] Compiling Slotstream Vision.swift
[66/69] Compiling Slotstream VisionPrompt.swift
[67/70] Emitting module SevraRuntime
[68/91] Compiling SevraRuntime Changes.swift
[69/91] Compiling SevraRuntime ConversationContext.swift
[70/91] Compiling SevraRuntime Extensions.swift
[71/91] Compiling SevraRuntime Extraction.swift
[72/91] Compiling SevraRuntime HomeArchive.swift
[73/91] Compiling SevraRuntime HomeStore.swift
[74/91] Compiling SevraRuntime HomeWriter.swift
[75/91] Compiling SevraRuntime Inference.swift
[76/91] Compiling SevraRuntime InferenceCache.swift
[77/91] Compiling SevraRuntime LocalIPC.swift
[78/91] Compiling SevraRuntime ModelSetup.swift
[79/91] Compiling SevraRuntime ModelVerification.swift
[80/91] Compiling SevraRuntime Models.swift
[81/91] Compiling SevraRuntime Performance.swift
[82/91] Compiling SevraRuntime ResponseMetrics.swift
[83/91] Compiling SevraRuntime Runtime.swift
[84/91] Compiling SevraRuntime RuntimeExtensions.swift
[85/91] Compiling SevraRuntime SourceNavigation.swift
[86/91] Compiling SevraRuntime Sources.swift
[87/91] Compiling SevraRuntime Thinking.swift
[88/91] Compiling SevraRuntime Tools.swift
[89/92] Emitting module SevraMac
[90/103] Compiling SevraMac AppModel.swift
[91/103] Compiling SevraMac AppModelWork.swift
[92/103] Compiling SevraMac ContentView.swift
[93/103] Compiling SevraMac MacCommands.swift
[94/103] Compiling SevraMac MiniAppHost.swift
[95/103] Compiling SevraMac NativeControls.swift
[96/103] Compiling SevraMac NativeText.swift
[97/103] Compiling SevraMac ResponseDetails.swift
[98/103] Compiling SevraMac SevraMain.swift
[99/103] Compiling SevraMac WindowState.swift
[100/103] Compiling SevraMac WorkViews.swift
[101/104] Compiling SevraMac ObserverMark.swift
[101/104] Write Objects.LinkFileList
[102/104] Linking Sevra
[103/104] Applying Sevra
Build of product 'Sevra' complete! (42.01s)
````

### product-selection-ui-v1/1.log

Original bytes: 187. SHA-256: `a8af00668050ed8897706f366d3fc861c21b120a2459c01699180decb6a5f708`.

Normalized bytes: 187. SHA-256: `a8af00668050ed8897706f366d3fc861c21b120a2459c01699180decb6a5f708`.

````text
[0/1] Planning build
Building for production...
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[2/3] Compiling SevraExtract main.swift
Build of product 'sevra-extract' complete! (2.96s)
````

### product-selection-ui-v1/2.log

Original bytes: 2169. SHA-256: `55c87a6bf7bc2564f916046fef62c37000495ce0c26c9dc0802a8d02f2443091`.

Normalized bytes: 2169. SHA-256: `55c87a6bf7bc2564f916046fef62c37000495ce0c26c9dc0802a8d02f2443091`.

````text
[0/1] Planning build
Building for debugging...
[0/3] Write swift-version--1AB21518FC5DEDBE.txt
[2/4] Emitting module Slotstream
[3/5] Emitting module SevraRuntime
[4/6] Emitting module SevraMac
Build of product 'Sevra' complete! (7.36s)
PASS: light-automatic, rendered controls, current budget, supported range and pending state
PASS: light-custom, rendered controls, current budget, supported range and pending state
PASS: light-saved-above-range, rendered controls, current budget, supported range and pending state
PASS: light-failed-settings, rendered controls, current budget, supported range and pending state
PASS: light-fixed, rendered controls, current budget, supported range and pending state
PASS: light-unavailable-pack, rendered controls, current budget, supported range and pending state
PASS: light-response-budget, reduced budget and saved ceiling remain readable
PASS: dark-automatic, rendered controls, current budget, supported range and pending state
PASS: dark-custom, rendered controls, current budget, supported range and pending state
PASS: dark-saved-above-range, rendered controls, current budget, supported range and pending state
PASS: dark-failed-settings, rendered controls, current budget, supported range and pending state
PASS: dark-fixed, rendered controls, current budget, supported range and pending state
PASS: dark-unavailable-pack, rendered controls, current budget, supported range and pending state
PASS: dark-response-budget, reduced budget and saved ceiling remain readable
PASS: system-automatic, rendered controls, current budget, supported range and pending state
PASS: system-custom, rendered controls, current budget, supported range and pending state
PASS: system-saved-above-range, rendered controls, current budget, supported range and pending state
PASS: system-failed-settings, rendered controls, current budget, supported range and pending state
PASS: system-fixed, rendered controls, current budget, supported range and pending state
PASS: system-unavailable-pack, rendered controls, current budget, supported range and pending state
PASS: system-response-budget, reduced budget and saved ceiling remain readable
````

### product-selection-ui-v1/inputs-after.json

Original bytes: 38814. SHA-256: `ee0575bea4b967e69d5f4328e0e5a7aa5995695e53300b41da8d026da717515f`.

Normalized bytes: 38814. SHA-256: `ee0575bea4b967e69d5f4328e0e5a7aa5995695e53300b41da8d026da717515f`.

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
    "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
    "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
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
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
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
    "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
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
    "apps/macos/Runtime/Inference.swift": "8e145b72458a0a29e1cd4dee6cb03b65f38a9e13e8fcc06d4e8decbefbd7a531",
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

### product-selection-ui-v1/inputs-before.json

Original bytes: 38814. SHA-256: `ee0575bea4b967e69d5f4328e0e5a7aa5995695e53300b41da8d026da717515f`.

Normalized bytes: 38814. SHA-256: `ee0575bea4b967e69d5f4328e0e5a7aa5995695e53300b41da8d026da717515f`.

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
    "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
    "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
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
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
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
    "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
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
    "apps/macos/Runtime/Inference.swift": "8e145b72458a0a29e1cd4dee6cb03b65f38a9e13e8fcc06d4e8decbefbd7a531",
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

### product-selection-ui-v1/receipt.json

Original bytes: 3384. SHA-256: `75fbc49b0315749ea62f22a332ad00d9789bcbca36481c7d492afe55cd78ea38`.

Normalized bytes: 3384. SHA-256: `75fbc49b0315749ea62f22a332ad00d9789bcbca36481c7d492afe55cd78ea38`.

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
        "--package-path",
        "apps/macos",
        "--product",
        "Sevra",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 707201616,
      "samples": 155,
      "exit_code": 0
    },
    {
      "command": [
        "swift",
        "build",
        "--package-path",
        "apps/macos",
        "-c",
        "release",
        "--product",
        "sevra-extract",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 244402168,
      "samples": 12,
      "exit_code": 0
    },
    {
      "command": [
        "bash",
        "Tools/check_sevra_memory_ui.sh"
      ],
      "peak_tree_bytes": 653215928,
      "samples": 120,
      "exit_code": 0
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 19496435712,
    "swapins": 52,
    "swapouts": 2908,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   394848.\nPages active:                                 988852.\nPages inactive:                               922291.\nPages speculative:                             72736.\nPages throttled:                                   0.\nPages wired down:                             189166.\nPages purgeable:                               17017.\n\"Translation faults\":                     2052669281.\nPages copy-on-write:                       105429330.\nPages zero filled:                        3345780744.\nPages reactivated:                         175369241.\nPages purged:                               12985885.\nFile-backed pages:                            778103.\nAnonymous pages:                             1205776.\nPages stored in compressor:                   927866.\nPages occupied by compressor:                 507511.\nDecompressions:                            105773572.\nCompressions:                              119993818.\nPageins:                                  2385630168.\nPageouts:                                     496073.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 146520.\nPages tagged resident:                        111542.\nPages tagged compressed:                       34978.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5847.\nPages tag-storage free:                        10245.\nPages tag-storage non-tag pageable:            82204.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5174080.\nTagged compressions:                          771723.\nTagged decompressions:                        646703.\n"
  },
  "commands": [
    [
      "swift",
      "build",
      "--package-path",
      "apps/macos",
      "--product",
      "Sevra",
      "-j",
      "1"
    ],
    [
      "swift",
      "build",
      "--package-path",
      "apps/macos",
      "-c",
      "release",
      "--product",
      "sevra-extract",
      "-j",
      "1"
    ],
    [
      "bash",
      "Tools/check_sevra_memory_ui.sh"
    ]
  ]
}
````

### product-selection-final-build-v1/0.log

Original bytes: 349. SHA-256: `9bd203934b8f5574fc62222c631b660fc9814cbfcbb0267856e46388743fd6c1`.

Normalized bytes: 349. SHA-256: `9bd203934b8f5574fc62222c631b660fc9814cbfcbb0267856e46388743fd6c1`.

````text
[0/1] Planning build
Building for production...
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[1/3] Write sources
[3/4] Compiling SevraRuntime Changes.swift
[3/6] Write sources
[5/7] Compiling SevraMacChecks AdverseChecks.swift
[5/7] Write Objects.LinkFileList
[6/7] Linking sevra-mac-checks
Build of product 'sevra-mac-checks' complete! (33.65s)
````

### product-selection-final-build-v1/1.log

Original bytes: 212. SHA-256: `6461aad969c8e44cd9ce088a79e508f6b37ccb9e7011c1014c3c1c8eb2819708`.

Normalized bytes: 212. SHA-256: `6461aad969c8e44cd9ce088a79e508f6b37ccb9e7011c1014c3c1c8eb2819708`.

````text
Building for production...
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[2/4] Compiling SevraMac AppModel.swift
[2/4] Write Objects.LinkFileList
[3/4] Linking Sevra
Build of product 'Sevra' complete! (15.86s)
````

### product-selection-final-build-v1/2.log

Original bytes: 420. SHA-256: `0ac7f6c9acec9970b3e849522faa28bde257ef4de1d89ab82e4caac0a29bba38`.

Normalized bytes: 420. SHA-256: `0ac7f6c9acec9970b3e849522faa28bde257ef4de1d89ab82e4caac0a29bba38`.

````text
[0/1] Planning build
Building for debugging...
[0/3] Write swift-version--1AB21518FC5DEDBE.txt
[2/4] Emitting module Slotstream
[2/5] Write sources
[4/6] Emitting module SevraRuntime
[5/7] Compiling SevraRuntime Inference.swift
[6/9] Emitting module SevraMac
[7/10] Compiling SevraMac AppModel.swift
[7/10] Write Objects.LinkFileList
[8/10] Linking Sevra
[9/10] Applying Sevra
Build of product 'Sevra' complete! (8.62s)
````

### product-selection-final-build-v1/3.log

Original bytes: 2169. SHA-256: `7ba86f86d02eeee3d2dcd445da877517365a287451b52e9f847cdfc05fbacd1b`.

Normalized bytes: 2169. SHA-256: `7ba86f86d02eeee3d2dcd445da877517365a287451b52e9f847cdfc05fbacd1b`.

````text
[0/1] Planning build
Building for debugging...
[0/3] Write swift-version--1AB21518FC5DEDBE.txt
[2/4] Emitting module Slotstream
[3/5] Emitting module SevraRuntime
[4/6] Emitting module SevraMac
Build of product 'Sevra' complete! (7.68s)
PASS: light-automatic, rendered controls, current budget, supported range and pending state
PASS: light-custom, rendered controls, current budget, supported range and pending state
PASS: light-saved-above-range, rendered controls, current budget, supported range and pending state
PASS: light-failed-settings, rendered controls, current budget, supported range and pending state
PASS: light-fixed, rendered controls, current budget, supported range and pending state
PASS: light-unavailable-pack, rendered controls, current budget, supported range and pending state
PASS: light-response-budget, reduced budget and saved ceiling remain readable
PASS: dark-automatic, rendered controls, current budget, supported range and pending state
PASS: dark-custom, rendered controls, current budget, supported range and pending state
PASS: dark-saved-above-range, rendered controls, current budget, supported range and pending state
PASS: dark-failed-settings, rendered controls, current budget, supported range and pending state
PASS: dark-fixed, rendered controls, current budget, supported range and pending state
PASS: dark-unavailable-pack, rendered controls, current budget, supported range and pending state
PASS: dark-response-budget, reduced budget and saved ceiling remain readable
PASS: system-automatic, rendered controls, current budget, supported range and pending state
PASS: system-custom, rendered controls, current budget, supported range and pending state
PASS: system-saved-above-range, rendered controls, current budget, supported range and pending state
PASS: system-failed-settings, rendered controls, current budget, supported range and pending state
PASS: system-fixed, rendered controls, current budget, supported range and pending state
PASS: system-unavailable-pack, rendered controls, current budget, supported range and pending state
PASS: system-response-budget, reduced budget and saved ceiling remain readable
````

### product-selection-final-build-v1/inputs-after.json

Original bytes: 38814. SHA-256: `8e7e6da1a2ecebb54e228781c85e45cf963e69e524026ee4d3b65cec892cc6c2`.

Normalized bytes: 38814. SHA-256: `8e7e6da1a2ecebb54e228781c85e45cf963e69e524026ee4d3b65cec892cc6c2`.

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
    "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
    "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
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
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
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
    "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
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
    "apps/macos/Runtime/Inference.swift": "2030fd256295a202eeb192ab6dde89bb74eadca6f0b80a27394816ca471ef75a",
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

### product-selection-final-build-v1/inputs-before.json

Original bytes: 38814. SHA-256: `8e7e6da1a2ecebb54e228781c85e45cf963e69e524026ee4d3b65cec892cc6c2`.

Normalized bytes: 38814. SHA-256: `8e7e6da1a2ecebb54e228781c85e45cf963e69e524026ee4d3b65cec892cc6c2`.

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
    "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
    "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
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
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
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
    "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
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
    "apps/macos/Runtime/Inference.swift": "2030fd256295a202eeb192ab6dde89bb74eadca6f0b80a27394816ca471ef75a",
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

### product-selection-final-build-v1/receipt.json

Original bytes: 3862. SHA-256: `99cf2eee813caa68276edbd899a37532334dcb8e7f3e052404e2189d7dc38326`.

Normalized bytes: 3862. SHA-256: `99cf2eee813caa68276edbd899a37532334dcb8e7f3e052404e2189d7dc38326`.

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
        "--package-path",
        "apps/macos",
        "-c",
        "release",
        "--product",
        "sevra-mac-checks",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 1007487832,
      "samples": 125,
      "exit_code": 0
    },
    {
      "command": [
        "swift",
        "build",
        "--package-path",
        "apps/macos",
        "-c",
        "release",
        "--product",
        "Sevra",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 1060178896,
      "samples": 59,
      "exit_code": 0
    },
    {
      "command": [
        "swift",
        "build",
        "--package-path",
        "apps/macos",
        "--product",
        "Sevra",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 725846608,
      "samples": 33,
      "exit_code": 0
    },
    {
      "command": [
        "bash",
        "Tools/check_sevra_memory_ui.sh"
      ],
      "peak_tree_bytes": 693618896,
      "samples": 118,
      "exit_code": 0
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 19393314816,
    "swapins": 52,
    "swapouts": 2908,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   336883.\nPages active:                                1022707.\nPages inactive:                               932278.\nPages speculative:                             89175.\nPages throttled:                                   0.\nPages wired down:                             189456.\nPages purgeable:                               18968.\n\"Translation faults\":                     2056188261.\nPages copy-on-write:                       105827744.\nPages zero filled:                        3347158858.\nPages reactivated:                         175370356.\nPages purged:                               12987126.\nFile-backed pages:                            827823.\nAnonymous pages:                             1216337.\nPages stored in compressor:                   927635.\nPages occupied by compressor:                 507439.\nDecompressions:                            105773799.\nCompressions:                              119993818.\nPageins:                                  2385684665.\nPageouts:                                     496073.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 149123.\nPages tagged resident:                        114203.\nPages tagged compressed:                       34920.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5847.\nPages tag-storage free:                         7393.\nPages tag-storage non-tag pageable:            85056.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5163968.\nTagged compressions:                          771723.\nTagged decompressions:                        646760.\n"
  },
  "commands": [
    [
      "swift",
      "build",
      "--package-path",
      "apps/macos",
      "-c",
      "release",
      "--product",
      "sevra-mac-checks",
      "-j",
      "1"
    ],
    [
      "swift",
      "build",
      "--package-path",
      "apps/macos",
      "-c",
      "release",
      "--product",
      "Sevra",
      "-j",
      "1"
    ],
    [
      "swift",
      "build",
      "--package-path",
      "apps/macos",
      "--product",
      "Sevra",
      "-j",
      "1"
    ],
    [
      "bash",
      "Tools/check_sevra_memory_ui.sh"
    ]
  ]
}
````

### product-selection-checks-v1/0.stderr

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### product-selection-checks-v1/0.stdout

Original bytes: 870. SHA-256: `57f92b290c1faeedc3215425ca050b61b502d881c40669ee7a0e0b4d83c2942a`.

Normalized bytes: 870. SHA-256: `57f92b290c1faeedc3215425ca050b61b502d881c40669ee7a0e0b4d83c2942a`.

````text
{
  "automatic" : true,
  "packs" : [
    {
      "checkpoint_revision" : "de4b8e4d43b917e7706784d8bb445c9af86a3540",
      "compatibility" : "slotstream-affine-v1",
      "conversion_revision" : "aa7c790e804bbf9d491ddb109c3d61bc4a555f7c",
      "id" : "qwen3.8-flash-next:4bit",
      "layout" : "affine-4-group64-ple-group32",
      "manifest_sha256" : "8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082",
      "qualified_automatic_profiles" : [

      ],
      "required_bytes" : 103793508077,
      "support_evidence" : [
        "db\/records\/plan\/same-model-quantization-and-automatic-memory-2026-10-02.md"
      ],
      "title" : "Original 4-bit",
      "total_bytes" : 105264463248
    }
  ],
  "reason" : "Uses the original pack while alternative quantizations are being qualified.",
  "schema" : 1,
  "selected" : "qwen3.8-flash-next:4bit"
}
````

### product-selection-checks-v1/1.stderr

Original bytes: 137. SHA-256: `65b75bfaf75ccf5b3b9eb8cda676f75aadebaece032926b92cc68e83abc04941`.

Normalized bytes: 137. SHA-256: `65b75bfaf75ccf5b3b9eb8cda676f75aadebaece032926b92cc68e83abc04941`.

````text
Error: The selected model pack is unavailable in this build. Choose Automatic or a supported pack. Your saved choice has been preserved.
````

### product-selection-checks-v1/1.stdout

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### product-selection-checks-v1/2.stderr

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### product-selection-checks-v1/2.stdout

Original bytes: 3445317. SHA-256: `e41acd07e68183362ade905b607bea35246d174ebccfeab00c9c72e0341e812f`.

Normalized bytes: 3445317. SHA-256: `e41acd07e68183362ade905b607bea35246d174ebccfeab00c9c72e0341e812f`.

````zlib-base64
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
e0qaQuEcX23dZx/9CykXxY0xp+6dyOnbHOZvXuysyRUBewxuT44avWWtq7Gt8eq0jXXR/jVG1+fi
M4KnsNF+vO/K6osH6n//D3//zyftj5ehfcvKzk6IGk+IvjXm7OdoE2/KpsjN1nR8yP7W1Ibs2xCO
rN84To9O01EjxMVWcZ/OjzirS6TxkWf+yAseC4wXB8ZLAuPxwHgiMJ4MjKd8441vOe1t7Bt+2/lF
DLnFsPnw/LHr6+G6abJtZ/6p2paOB/5nv3x8PvlD+LXnlEu4sy721d0hAXs/tJaHES4qzF8+oqxp
sg+nRh6a/j7A0aGroti05ux0esu1p5TX+4/Q9eKB0IvNO/zUi20z1R4QdfS7OPrHWMjoP5u/rKLi
e5Z35mG+20br0tULjkOiMDRGNt3H3nEu1V+Wm8TR73T0j0wmmv8l2MJHVST/CzBkxfVfgiZmp7BV
/MzuNdyKajdK71zsuc04udaT2xE/uRzXe/1ZLTk+Fpmc7PZnNWa8ypX3l9qP9WC3DbsZwjDI0XdP
u/fDLhrmIZwCJd5NSUKZEns3JfZuyvBdgeGm+G19aIZ7/s32sBU/ewt+ufeAVJSvb50/qMsb8M3f
Zc3r4X14cXa4OGnflHVTdh9eEF+b+rD3jWk/8vDSD2y0e7N45rj/p2PVuz/qZXlTt+14Ici3ctO9
OYp5//IP//S7/hMTA9LksqZt9l7uPs6lXEdTZr05m/jnn77YZ2xe7w7vVWuz6n1WNi07hnZz3m27
zN7AUndBkGMy5MQ3clPYC7fb48c9xstl+umO9tN975WyT0Zo/PcmdEwH/enBT+fBnCwAc7IAzD8D
8F+U+9qjLZH/3oKO6aA/PfjpPFjbh2lfHQ/vwr+MHRNifzrxsx/j+jo8zTnuDB3TQX968NOf5EK7
8G3smBD704mf/TAX0oc5XRjmn2H4L/Y8F9yFb2LHhNifTvz8R7qQXvwr4DEl+F+AH38pmqo4Xlpw
hDtUpxet596Ni+luHnJg1/qZhRyGS8frG/qba4bWvLG7qYa97OqqmWuotnx9r8uNdSMblSzyu72G
08SOfVnZ92Z+/9G9mRj2X3//f7v6DMRwT8UM2NU3cewuKKvXl3472JcTxwuB2rds7246vWjsxEF/
k0qVl2apbi/Z3/8+iR2O6wgWv/TvcNadtSyvWztmQQEdDngcvD5Ggb2xefhs+vF9sdurEJpFAA5t
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
p5y0pp9ygpp+Kkhr+qkgqOmnkrSmn0qCmn4qSWv6qSSo6aeKtKafKoKafqpIa/qpIqjpp5q0pp9q
gpp+mpLW9NOUoKafpqQ1/TQNX9OXqxVlTd8h/BKbGWVN3yH8Ipspa/oO4ZfYHFPW9B3CL7E5oazp
O4RfZLMkjWGJJIhhPCGNYTwhiGE8JY1hPCWIYUKSxjAhCWKYjEljmIwJYpjUpDFMaoIYpgRpDFOC
IIZpRhrDNCOIYVqTxjCtCWJYykljWBq+pi/ZirKm7xB+kc2UNX2H8EtsZpQ1fYfwS2yOKWv6DuEX
2UxZ03cIv8TmJCaNYUlMEMOSlDSGJSlBDOOCNIZxQRDDREwaw0RMEMOEJo1hgqCmzyRpTZ9Jgpo+
U6Q1faYIavpMkdb0mSKo6TNNWtNnmqCmz1LSmj5LCWr6LCWt6bOUoKYfr0hr+o7hf+l63KAxI1mt
Voz2jlwPFJbaTnZvrAcKi22nOsN6oLDUdrJ7ZD1QWGx7Sr7fA98pewYmu1fWA4WltpPdL+uBwmLb
NXmsC3zX7BmY7L5ZDxSW2k5276wHCottV+SxLvAdtCdguntoPVBYajvZfbQeKCy2XabktkuaWEd3
P60HCottTxW57SlRrCO7r9YDhaW2k91b64HCYts1eawLfIftGZjsHlsPFJbaTnafrQcKi23X5LEu
8N22Z2Cy+209UFhqO9k9tx4oLLadvD4f+s7bMzDZvbceKCy0ne7+Ww8UFttO3psIfRfuGZiR9yZC
34k7ASbvTYS+G/cMHJP3JkLfkXsGTsh7E6Hvyp0Ak/cmQt+Zewbm5L2J0HfnnoEFeW8i9B26E2Dy
3kTou3TPwJK8NxH6Tt0zsCLvTYS+W3cCTN6bCH3H7hlYk/cmQt+1OwEm702EvnP3DJyS9yZC3717
Aqa7f9cDhcW2k/cmQt/FewZm5L2J0HfynoFj8t5E6Lt5J8DkvYnQd/SegRPy3kTou3rPwJy8NxH6
zt4JMHlvIvTdvWdgQd6bCH2H7xlYkvcmQt/lOwEm702EvtP3DKzIexOh7/adAJP3JkLf8XsG1uS9
idB3/Z6BU/LeROg7fyfA5L2J0Hf/HoEJ7//1QGGp7Yy6NxH8LuAJMHVvIvidwGfgmLo3Efxu4DNw
Qt2bCH5H8ARYkse6RBLFOp6QxzqeEMU6npLHOp4SxTohyWOdkESxTsbksU7GRLFOavJYJzVRrFOC
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
4uXsO/Fyrp14OdlOvJxkJ15OuBMvZ9yJlzPuxMsJd+LlJDvx+4xTdyb++hs8R2Xir7/HszUm/t2f
6I0KE3/x/Z3k2dC/8f4Ovn3/9Xdz+N37r7+dw27ef/1t3OY++dff021uk3/9Pd3kLvlv/EKf6ia5
Tn5FWqe6Iq1zXZHWOa5I64RXpHXCK9I63xVpne6KdJZnHP/G+zvJFelGTzj++tu5+RXpls8S/vp7
OtcV6YZPEv6NX+gbX5Hi5Lu2ONWuLc61a4tz7NrihLu2OOGuLc63a4vz7dri5Lu2ONWuLc61a4tz
7NrihLu2OOGuLc63a4vz7dri5Lu2ONWuLc61a4tz7NrihLu2OOGuLc63a4vz7drKyXdt5VS7tnKu
XVs5x66tnHCHVM63Qyrn2yGVk++Qyql2SOVcO6Ryjh1SOeEOqZxwh1TOt0Mq59shlZPvkMqpdkjl
XDukco4dUjnhDqmccIdUzrdDuuEB2VrmWOdmxR/1Fm92SPZR7/IEx2T/fz/V4w7K/nvf4e227497
h/6G+aj3c8Qt81FvSN40H/VGjqq7POpNHXYvf9S7Ouxu/qh3ddT9/HHr7WR39HX6y+Y62WVzne2y
uc5y2VxnvGyuU1421ykvm+uMl811wsvmDR/OPO4dnuayedwDmke9oRNcNo8tVz/qTZ3tsnnws6NH
vauTXTbP8vwoTr9Jj5Nt0uNsm/Q4yyY9zrhJj1Nu0uOUm/Q44yY9zrhJj9Nv0uNkm/Q42yY9zrJJ
jzNu0uOUm/Q45SY9zrhJjzNu0uP0m/Q42SY9zrZJj7Ns0uOMm/Q45SY9TrlJjzNu0uOMm/Ry+k16
OdkmvZxtk17OskkvZ9ykl1Nu0sspN+nljJv0csZNejn9Jr2cbJNezrZJL2fZpJczbtLLKTfp5ZSb
9HLGTXo54ya9nH6TXk62SS9n26SXs2zSyxk36eWUm/Ryyk16OeMm/TRNjDNa5Y95hyfpYZxeK///
/Exv1cI4oVf+qDd49L389mL5Y97PcXfyk5jlj3lTN7plnkMtf9Rv9blumOvsV6Z1rivTOtmVaZ3k
yrTOeGVaZ7wyrRNemdb5rkyneQByc8D8MW/nPFemo59+nMQwf8ybOtmV6ZZPGc7BmP/F9xRn383F
uXZzcbLdXJxkNxdn3M3FGXdzccLdXJxwNxdn383FuXZzcbLdXJxkNxdn3M3FGXdzccLdXJxwNxdn
383FuXZzcbLdXJxkNxdn3M3FGXdzccLdXJxwN1fOvpsr59rNlZPt5spJdnPljBuncsKNUznhxqmc
feNUzrVxKifbOJWTbJzKGTdO5Ywbp3LCjVM54capnH3jVM61cSon2ziVk2ycyhk3TuWMG6dywo3T
Dc/ajt7rOLWR+rh36K9Nj3o/R1ycHvWG5NXpUW/kqIrCo97UYdfMR72rwy6aj3pXR101H7feznXZ
vOFE97h3eJrL5nEz3aPe0Akum8c2ux71ps522Tx41nzUuzrZZfMs02acftqMk02bcbZpM84ybcYZ
p8045bQZp5w244zTZpxx2ozTT5txsmkzzjZtxlmmzTjjtBmnnDbjlNNmnHHajDNOm+X002Y52bRZ
zjZtlrNMm+WM02Y55bRZTjltljNOm+WM02Y5/bRZTjZtlrNNm+Us02Y547RZTjltllNOm+WM0+Zp
vkk/IcLxqDd49EXz9gjHY97PcZfMkyAcj3lTN7o2nQPheNRv9amuTKeZ526OcDzm7ZznynT0MHcS
hOMxb+pkV6ZbDk3nQDj+4nuKs89Mca6ZKU42M8VJZqY448wUZ5yZ4oQzU5xwZoqzz0xxrpkpTjYz
xUlmpjjjzBRnnJnihDNTnHBmKmefmcq5ZqZyspmpnGRmKmecmcoZZ6ZywpmpnHBmKmefmcq5ZqZy
spmpnGRmKmecmcoZZ6Zywpnpht/NRY2ns5y65vrIt+ivTo97Q0dcnx73juQV6nHv5KhzDY97V4dd
OR/3tg67dj7ubR119XzkqjvZ9fOGs90j3+J5rp/HzXePe0dnuH4eey7sce/qdNfPg2fPx72ts10/
bzp/nvBw2OPe4eFXz9sfD3vUGzrw2nmSA2KPele3ukad44jY4361z3WFOs+Ad/NTYo96Pye6Qh0+
3Z3koNij3tXZrlA3HaLOcVasjBKtnXoP+si36K9Rj3tDR1ykHveO5FXqce/kqD3o497VYRfPx72t
w66ej3tbR10+H7nqbnP9POGE97h3ePjV8/YT3qPe0IHXzpNMeI96V7e6Rp1jwnvcr/ZBV6hXzz68
e/HPT+7++e75xw+Xl7n79Cm8uLz46x8vK/35s7fmBe9/Qe/e3f9glyvek5/efLxc6d69+P2L189e
Pvn4+u3Pv7x/8fzyH5/9+E8v3l/+F//ef4yH//Q/v/yX//bV3bP7dfDqMkW8v/+v/5+/+Zs/e8d/
eo+Xz/ynF7//+O7+n+GHh3+Ary/7r73kQ8aXn/hvX3y4e/XpVf7Hv/FpvP/5zbsPv/3N/cf87t3H
tx8un/S7u2c/Xj6My2u8urz85R/k2fMPT373y4dr/Rre5z95ff/P++TDm4/Pf7588p/SH24z7+7+
18e795/eyLPXv7+7zmv+57//r//9v93PcPf/gE+efbj8yz7/+T7+xyc/vXj3/sPl0v3+xfUGuvvf
pPcfnz+/XPp++vjy04/3+ae5vPblUnj5F33/8dUl+Do/2z/8lycv3j/58XKlf/H68k/107s3r548
u1w/nt3/6727/K5f53UuUZdV8/kf6e2zdx9eXFbFj88+PLt/8ddvPnz5ga/zYs+fvX5+9/Ll5/nj
62/n5eN7/eRP/5a/PHn55s3ba77g5VN78/bTL8iHn+8u/+/Fux//9OpX+/V48fqfnr188fAL/uSH
+O1vigi+XMx/CBG8S6l1lqd1rN7m7Ovp/O1vxCu9f7hOPL9fUPf/IvfXjrt3V3qlV5dF//7F/TXu
0yXp7bs3v78fVu5/n9/d/eNlKrjWCr179fbDL5f/m2ev3/90v3ju3v305t2r+1Xz5O9/+5t/OOCG
8uby2/vqxf/+tJx++HRF/+H+Zzb3lOdvXr19edkuX64Sv7x8c/lkL/+EL356ca1P85vIh/3Jz8/e
P3nzu0938R+f/Hi5bV5vqf549/bDz0+e/t2Td2/+eP//vX1x9/yysv7Tw23x66Rwxfvjv/6ScfxL
luNfsh7/ku34l+zHv+Q4/iXn8S+5DnvJOP5SEMdfCuL4S0EcfymI4y8FcfylII6/FMTxl4I4/lJQ
jr8UlOMvBeX4S0E5/lJQjr8UlOMvBeX4S0E5/lJQjr8U1OMvBfX4S0E9/lJQj78U1OMvBfX4S0E9
/lJQj78U1AMvBXH8s4I4/llBHP+sII5/VhDHPyuI458VxPHPCuL4ZwVx/LOCOP5ZQRz/rCCOf1YQ
xz8riOOfFcTxzwri+GcFcfyzgjj+WUEc/6wgjn9WEMc/K4jjnxXE8c8K4vhnBXH8s4I4/llBHP+s
II5/VhDHPyuI458VxPHPCuL4ZwVx/LOCOP5ZQRz/rCCOf1ZQjn9WUI5/VlCOf1ZQjn9WUI5/VlCO
f1ZQjn9WUI5/VlCOf1ZQjn9WUI5/VlCOf1ZQjn9WUI5/VlCOf1ZQjn9WUI5/VlCOf1ZQjn9WUI5/
VlCOf1ZQjn9WUI5/VlCOf1ZQjn9WUI5/VlCOf1ZQjn9WUI5/VlCOf1ZQjn9WUI5/VlCOf1ZQjn9W
UI5/VlCOf1ZQb/CwoN7gaUG9weOCeoPnBfUGDwzqDZ4Y1Bs8Mqg3eGZQb/DQoN7gqUG9wWODeoPn
BvUGDw7qDZ4c1Bs8Oqg3eHZQb/DwoN7g6UG9weODeoPnB/UGDxDqDZ4g1Bs8Qqg3eIZQb/AQod7g
KUK9wWOEeoPnCPUGDxLqDZ4k1Bs8Sqg3eJZQb/Awod7gaUK9weOEeoPnCVHWDZoK/8+Lxi1etNzi
RestXrTd4kX7LV503OJF5y1e9MiLQ9zi4hC3uDjELS4OcYuLQ9zi4hC3uDjELS4OcYuLQ9zi4lBu
cXEot7g4lFtcHMotLg7lFheHcouLQ7nFxaHc4uJQbnFxqLe4ONRbXBzqLS4O9RYXh3qLi0O9xcWh
3uLiUG9xcTjmmcM9Gv3usy18uRy1Q64Nn1/i0Jf8Cz9mHP9jxg1+zHL8j1lu8GPW43/MeoMfsx3/
Y7Yb/Jj9+B+z3+DHHMf/mOMGP+Y8/secN/gx1/E/5mHjwdO/e3r0eHDUS/6FHzOO/zHjBj9mOf7H
LDf4MevxP2a9wY/Zjv8x2w1+zH78j9lv8GOO43/McYMfcx7/Y84b/Jjr+B/zsPEg/q4cPR4c9ZJ/
4ceM43/MuMGPWY7/McsNfsx6/I9Zb/BjtuN/zHaDH7Mf/2P2G/yY4/gfc9zgx5zH/5jzBj/mOv7H
POolP//hrvdPnj287iXyw8NfDrv/KODrvb77/bMPL/7p7vMLuxd6ffkg3969+/CnH+3ls1/efPxw
/d+YP/1sl1f49Ef/wAt+8yP+/Ob1m4/v3n/9Q29Pfnr28eX1X+ZT6v2ffbzWHyT79jOTP8O3r3P1
H+LL3937w90vv/3N+7fPXl/5b+Bl/m3z7/+878vf/uZ/fXz2+sPDHwJ88uLH+z9p/+GXJ69evH/1
7MPzn6/8mp9+U//xze+ePH3y7Hdv3l0uJf/45sXrux+f/O7+xa7zGp8XwtNrLoVv3+T9H2t89eLy
zt9//N37+79M+/rDw9b3yh9R6I8oDv+I4sofUdUfUT38I6pX+gOj//zpj//+/sn9n+X96X7Mev7s
9f3f5P3d3ZP7P3f9x3cvPny4u9KfxHz78Xcvv/zlzXfPLnfVz3+j9cvr3P+N48tL/3z5H/14d/+u
rvjXOL996edvXr588f7+P/3pL3h//RyueVzmxfs//PDTx5cvv/z23f/15kvE8yv+kdEvL/Gf7v8k
7IvXf/oDqn/6ea/+Sg+/n++fv/v0G/rj5Tf/+Yc37365/GK+uvxb/nj1F/w6+X++0X39Vf34/v7P
nF/rLvrwt5rdP9bXl+D/WN+80jH/WN+84BH/WJ8+sPc/u3+qhxfg/1BfX+eYf6avL3fEP9L7y3bm
+d0Pz3/+9Je/2T/Vv3gZ/g/2Z692zD/bn73oIf94l5/i8oN9+Tvcl+3jw9+x/zro3/+p+/v/3XVe
7/Lffn35d/rmJc3rXEaNT3f+V89ev/jpMmRced/y+7s3r+4+XP79Uf7nhxEo/M2nD+d/Xz7y/+cF
LuPgT5dfiMtc9vyyG7zSz/LwD/3+l1cvX7z+w5V/mIfLzo8f391Pdf/ij75fpr5/uszR78Hl/M37
Dz98Gs9fffzw7Jvl8vmxztfL0hX3H3++L/jyeu8/PHt5/+91uTS9eHtZzF/+Bf/+t7/5h3/fKz/8
p//55b/8t6/unr3/eLmw3X929//1//M3f/Nnb/Kb36XLxeLVw9OCH94+e/6Hux9/+LOHf//aCz8k
fflR//ayKXj16bX+x79vz/TuzR/fXz6CD89e3H/yl4/l/f0v75t3P969u9J16sXlR/nwzcbhfm/2
/Nnzy7/u7+9e37274i/TZSP2/O7ly8v7f3jRh53Zw038ilvky+h2+QX58ptz/2Tn3f0zyPdXe/74
4vXDZeTzbvmPz95fblbXWunPLhusn569+OaD+uObd3+4XMoe7s5X/df4vKh/fHf5Bbt8UpfLyi9P
3vzx/jfv82vma+Vr5Wvla+Vr5Wvla+VrXeGJ2t3D97bv7569up/N7t6Rkeay4X97Pzq/vfu0C//P
f/9f//t/O3qf8Pr37569+uEyW/90d9kf/fB5mjP7hf/y9//lH+7pi+dvPl52Tlf6Su5L6Ns3b6/1
Fda/fJ9x/fdZxPss13+fVbzPev332cT7bNd/n128z3799znE+xzXf59TvM95/fe5xPtc13+fW7zP
Da7zT8mFXtyRzC0J3JOC3JQC3JWC3JYC3JeC3JgC3JmC3JoC3JuC3JwC3J2C3J4C3J+C3KAC3KGC
3KIC3KMKuUcVcI8q5B5VxL7JbJzAPaqQe1QB96hC7lHXTv304Oe6kXev3n745co/+8u7Z+9++5t3
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
caoO4lQdxKk6iFN1EKfqIE7VQZyqgzhVB3GqDuJUHcSpOohTdRCn6iBO1UGcqoM4VQdxqg7iVB3E
qTqI8/odxE+Ppa/fQMzYjM3YjM3YjM3YjM3YjM3YjM3YjM3YjM3YjM3YjM3YKz0YZsHqmxNlyE1l
yE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1l
yE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyE1lyC1lyC1lyC1lyK2nVQU3FdxV8FDBUwUvFaxWnuog
LtVBXKqDuFQHcakO4lIdxKU6iEt1EJfqIC7VQVyqg7hUB3GpDuJSHcSlOohLdRCX6iAu1UFcqoO4
VAdxqQ7iun4H8f6x9Lp+AzFjMzZjMzZjMzZjMzZjMzZjMzZjMzZjMzZjMzZjMzZjr/RgmAWrb06U
IbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeU
IbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeUIbeGWnmqg7hUB3GpDuJSHcSl
OohLdRCX6iAu1UFcqoO4VAdxqQ7iUh3EpTqIS3UQl+ogLtVBXKqDuFQHcakO4lIdxKU6iEt1EJfq
IC7VQVyqg7hUB3GpDuK6fgfx02Pp6zcQMzZjMzZjMzZjMzZjMzZjMzZjMzZjMzZjMzZjMzZjM/ZK
D4ZZsPrmRBlySxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxly
WxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyWxlyu6qVpzqIW3UQ
t+ogbtVB3KqDuFUHcasO4lYdxK06iFt1ELfqIG7VQdyqg7hVB3GrDuJWHcStOohbdRC36iBu1UHc
qoO4VQdxqw7iVh3ErTqIW3UQt+og7ut3EO8fS+/rNxAzNmMzNmMzNmMzNmMzNmMzNmMzNmMzNmMz
NmMzNmMz9joPhl2w+uZEGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJb
GXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJbGXJ7
q5WnOohbdRC36iBu1UGMp6qEeEkOllxYcmXJjSV3ljxY8mTJiyWzNRhsDQZbg8HWYLA1GGwNBluD
wdZgsDUYbA0GW4OFrcHC1mBha/D63cT7x9WX3Ja5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5
mZu5/7Fyvz5ZdsnsO5jCvoMp7DuYwr6DKew7mMq+g6nsO5jKvoOp7HvQytZgZWuwsjVY2RqsbA1W
tgYbW4ONrcHG1mBja7CxNdjYGmxsDTa2Bhtbg42twc7WYGdrsLM12Nka7GwNdrYGO1uDna3BztZg
Z2twsDU42BocbA0OtgYHW4ODrcHB1uBga3CwNTjYGpxsDU62Bidbg5OtwcnW4GRrcLI1ONkanGwN
TrYGF1uDi63BxdbgYmtwsTW42BpcbA1evxv5+bn29auRmZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5
mZu5mZu5mXvb3K9Pll0y+w5ms+9gNvsOZrPvYDb7Dmaz72A2+w5ms+9gNvsedLM1yJy8YE5eMCcv
mJMXzMkL5uQFc/KCOXnBnLxgTl4wJy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPy
gjl5UdgaZD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3J
YD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JYD3JuH5P8tNz7bh+SzJzMzdzMzdzMzdzMzdzMzdz
MzdzMzdzMzdzMzdzMzdzb5v79cmyS2bfwTAnL5iTF8zJC+bkBXPygjl5wZy8YE5eMCcvmJMXzMkL
5uQFc/KCOXnBnLxgTl4wJy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5wZy8
YE5eMCcvFluDrCcZrCcZrCcZrCcZrCcZrCcZrCcZrCcZrCcZrCcZrCcZrCdZWE+ysJ5kYT3JwnqS
hfUkC+tJFtaTLKwnWVhPsrCeZGE9ycJ6koX1JAvrSRbWkyzX70l+eq5drt+SzNzMzdzMzdzMzdzM
zdzMzdzMzdzMzdzMzdzMzdzMzdzb5n59suyS2XcwzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkr
zMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkrzMkr
zMkrzMkrzMkrzMkrzMkrna1B1pMsrCdZWE+ysJ5kYT3JwnqShfUkC+tJFtaTLKwnWVhPsrCeZGE9
ycJ6koX1JAvrSRbWkyysJ1lYT7KwnmRhPcnCepKF9SQL60kW1pMsrCdZWE+yXL8n+fm59vVbkpmb
uZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZl729wvT5ZhMvsOhjl5hTl5hTl5hTl5hTl5hTl5
hTl5hTl5hTl5hTl5hTl5hTl5hTl5hTl5hTl5hTl5hTl5hTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5
lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5NdgaZD3JynqSlfUkK+tJVtaTrKwnWVlPsrKeZGU9ycp6
kpX1JCvrSVbWk6ysJ1lZT7KynmRlPcnKepKV9SQr60lW1pOsrCdZWU+ysp5kZT3JynqSlfUk6/V7
kp+ea9frtyQzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3Mz97a5X58su2T2HQxz8ipz8ipz
8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz
8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8ipz8upka5D1JCvrSVbWk6ysJ1lZT7KynmRl
PcnKepKV9SQr60lW1pOsrCdZWU+ysp5kZT3JynqSlfUkK+tJVtaTrKwn2VhPsrGeZGM9ycZ6ko31
JBvrSTbWk2zX70l+eq7drt+SzNzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzb5n59suyS
2XcwzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlr
zMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrzMlrja1B1pNsrCfZWE+y
sZ5kYz3JxnqSjfUkG+tJNtaTbKwn2VhPsrGeZGM9ycZ6ko31JBvrSTbWk2ysJ9lYT7KxnmRjPcnG
epKN9SQb60k21pNsrCfZWE+yXb8n+fm59vVbkpmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmb
uZl729yvT5ZdMvsOhjl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5
jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5jTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5/elk
yYslszXIepKd9SQ760l21pPsrCfZWU+ys55kZz3JznqSnfUkO+tJdtaT7Kwn2VlPsrOeZGc9yc56
kp31JDvrSXbWk+ysJ9lZT7KznmRnPcnOepL9+j3JT8+1+/VbkpmbuZmbuZmbuZmbuZmbuZmbuZmb
uZmbuZmbuZmbuZl729yvT5ZdMvsOhjl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5
nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5nTl5
nTl5nTl5fbI1yHqSnfUkO+tJdtaT7Kwn2VlPsrOeZGc9yc56kp31JDvrSXbWk+ysJ9lZT7KznmRn
PcnOepKd9SQ760l21pPsrCfZWU+ys55kZz3JznqSnfUkO+tJ9uv3JD891x7Xb0lmbuZmbuZmbuZm
buZmbuZmbuZmbuZmbuZmbuZmbuZm7m1zH54sy+RgyYUlV5bcWHJnyYMlT5a8WLL6HnQwJ28wJ28w
J28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28wJ28w
J28wJ28wJ28wJ29UtgZZT3KwnuRgPcnBepKD9SQH60kO1pMcrCc5WE9ysJ7kYD3JwXqSg/UkB+tJ
DtaTHKwnOVhPcrCe5GA9ycF6koP1JAfrSQ7WkxysJzlYT3KwnuRgPclx/Z7k5+fa129JZm7mZm7m
Zm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZu5tc78+WXbJ7DsY5uQN5uQN5uQN5uQN5uQN5uQN5uQN
5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN5uQN
5uQN5uQN5uQN5uQN5uQN5uQN5uSNrdbgZD3JyXqSk/UkJ+tJTtaTnKwnOVlPcrKe5GQ9ycl6kpP1
JCfrSU7Wk5ysJzlZT3KynuRkPcnJepKT9SQn60lO1pOcrCc5WU9ysp7kZD3JyXqSk/Uk5/V7kp+e
a8/rtyQzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3Mz97a5X58su2T2HQxz8iZz8iZz8iZz
8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz
8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8iZz8uZga5D1JCfrSU7Wk5ysJzlZT3KynuRkPcnJ
epKT9SQn60lO1pOcrCc5WU9ysp7kZD3JyXqSk/UkJ+tJTtaTnKwnOVlPcrKe5GQ9ycl6kpP1JCfr
SU7Wk5zX70l+fq59/ZZk5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5t429+uTZZfMvoNh
Tt5kTt5kTt5kTt5kTt5kTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5i
Tt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt5iTt4qbA2ynuRiPcnFepKL9SQX
60ku1pNcrCe5WE9ysZ7kYj3JxXqSi/UkF+tJLtaTXKwnuVhPcrGe5GI9ycV6kov1JBfrSS7Wk1ys
J7lYT3KxnuRiPcnFepLr+j3JT8+11/VbkpmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZl7
29yvT5ZdMvsOhjl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5
izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5izl5a7M1yHqS
i/UkF+tJLtaTXKwnuVhPcrGe5GI9yc16kpv1JDfrSW7Wk9ysJ7lZT3KznuRmPcnNepKb9SQ360lu
1pPcrCe5WU9ys57kZj3JzXqSm/UkN+tJ7uv3JD89197Xb0lmbuZmbuZmbuZmbuZmbuZmbuZmbuZm
buZmbuZmbuZm7m1zvzxZhsnsOxjm5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m
5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m5G3m
5G3m5O3O1iDrSW7Wk9ysJ7lZT3KznuRmPcnNepKb9SQ360lu1pPcrCe5WU9ys57kZj3JzXqSm/Uk
N+tJbtaT3KwnuVlPcrOe5GY9yc16kpv1JDfrSW7Wk9ysJ7mv35P8/Fz7+i3JzM3czM3czM3czM3c
zM3czM3czM3czM3czM3czM3czL1t7tcnyy6ZfQfDnLzNnLzNnLzNnLzNnLzNnLzNnLzNnLzNnLzN
nLzNnLzNnLzNnLytnLzyVDl5l+RgyYUlV5bcWHJnyYMlT5a8WDJbg8HWYLA1GGwNBluDwdZgsDUY
bA0GW4PB1mCwNVjYGixsDRa2Bgtbg4WtwcLWYGFrsLA1WNgaLGwNVrYGK1uDla3BytZgZWuwsjVY
2RqsbA1WtgYrW4ONrcHG1mBja7CxNdjYGmxsDTa2Bq/fk7x/rn3JXZmbuZmbuZmbuZmbuZmbuZmb
uZmbuZmbuZmbuZmbuZn7Hyv365Nll8y+g+nsO5jOvoPp7DuYzr6D6ew7mM6+g+nsO5jOvgftbA12
tgYHW4ODrcHB1uBga3CwNTjYGhxsDQ62Bgdbg4OtwcnW4GRrcLI1ONkanGwNTrYGJ1uDk63Bydbg
ZGtwsTW42BpcbA0utgYXW4OLrcHF1uBia3CxNbjYGtxsDW62Bjdbg5utwc3W4GZrcLM1uNka3GwN
sp5ksJ5ksJ5ksJ5ksJ5ksJ5ksJ5ksJ5ksJ5ksJ5ksJ5ksJ5kXL8n+em5dly/JZm5mZu5mZu5mZu5
mZu5mZu5mZu5mZu5mZu5mZu5mZu5t839+mTZJbPvYJiTF8zJC+bkBXPygjl5wZy8YE5eMCcvmJMX
zMkL5uQFc/KCOXnBnLxgTl4wJy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5
wZy8YE5eMCcvmJMXja1B1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM
1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pMM1pOM6/ckPz/Xvn5LMnMzN3MzN3Mz
N3MzN3MzN3MzN3MzN3MzN3MzN3MzN3Nvm/v1ybJLZt/BMCcvmJMXzMkL5uQFc/KCOXnBnLxgTl4w
Jy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5hTl5hTl5hTl5hTl5hTl5hTl5
hTl5hTl5hTl5hTl5hTl5JdgaZD3JwnqShfUkC+tJFtaTLKwnWVhPsrCeZGE9ycJ6koX1JAvrSRbW
kyysJ1lYT7KwnmRhPcnCepKF9SQL60kW1pMsrCdZWE+ysJ5kYT3JwnqShfUky/V7kp+ea5frtyQz
N3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3Mz97a5X54sw2T2HQxz8gpz8gpz8gpz8gpz8gpz
8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz
8gpz8gpz8gpz8gpz8gpz8gpz8gpz8gpz8spka5D1JAvrSRbWkyysJ1lYT7KwnmRhPcnCepKF9SQL
60kW1pMsrCdZWE+ysJ5kYT3JwnqShfUkC+tJFtaTLKwnWVhPsrCeZGE9ycJ6kpX1JCvrSVbWk6zX
70l+eq5dr9+SzNzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzMzdzb5n59suySO0seLHmy5MWS
2XcwzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmr
zMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrzMmrla1B1pOsrCdZWU+ysp5kZT3JynqSlfUk
K+tJVtaTrKwnWVlPsrKeZGU9ycp6kpX1JCvrSVbWk6ysJ1lZT7KynmRlPcnKepKV9SQr60lW1pOs
rCdZWU+yXr8n+fm59vVbkpmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZl729yvT5ZdMvsO
hjl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5
lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5lTl5jTl5jTl5jTl57WllyY0ld5Y8WPJkyYsl
szXIepKN9SQb60k21pNsrCfZWE+ysZ5kYz3JxnqSjfUkG+tJNtaTbKwn2VhPsrGeZGM9ycZ6ko31
JBvrSTbWk2ysJ9mu35P89Fy7Xb8lmbmZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7m3zf36
ZNkls+9gmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPX
mJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXmJPXBluDrCfZWE+y
sZ5kYz3JxnqSjfUkG+tJNtaTbKwn2VhPsrGeZGM9ycZ6ko31JBvrSTbWk2ysJ9lYT7KxnmRjPcnG
epKN9SQb60k21pNsrCfZWE+ysZ5ku35P8vNz7eu3JDM3czM3czM3czM3czM3czM3czM3czM3czM3
czM3czP3trlfnyy7ZPYdDHPyGnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPy
OnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPyOnPy
emVrkPUkO+tJdtaT7Kwn2VlPsrOeZGc9yc56kp31JDvrSXbWk+ysJ9lZT7KznmRnPcnOepKd9SQ7
60l21pPsrCfZWU+ys55kZz3JznqSnfUkO+tJdtaT7NfvSX56rt2v35LM3MzN3MzN3MzN3MzN3MzN
3MzN3MzN3MzN3MzN3MzN3NvmfnmyDJPZdzDMyevMyevMyevMyevMyevMyevMyevMyevMyevMyevM
yevMyevMyevMyevMyevMyevMyevMyevMyevMyevMyevMyevMyevMyevMyevMyevMyevMyevMyevM
yevMyevMyevMyeubrUHWk+ysJ9lZT7KznuRgPcnBepKD9SQH60kO1pMcrCc5WE9ysJ7kYD3JwXqS
g/UkB+tJDtaTHKwnOVhPcrCe5GA9ycF6koP1JAfrSQ7WkxysJzlYT3Jcvyf56bn2uH5LMnMzN3Mz
N3MzN3MzN3MzN3MzN3MzN3MzN3MzN3MzN3Nvm/v1ybJLZt/BMCdvMCdvMCdvMCdvMCdvMCdvMCdv
MCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdvMCdv
MCdvMCdvMCdvMCdvMCdvMCdvMCdvdLYGWU9ysJ7kYD3JwXqSg/UkB+tJDtaTHKwnOVhPcrCe5GA9
ycF6koP1JAfrSQ7WkxysJzlYT3KwnuRgPcnBepKD9SQH60kO1pMcrCc5WE9ysJ7kYD3Jcf2e5Ofn
2tdvSWZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mZu5mbubXO/Pll2yew7GObkDebkDebkDebk
DebkDebkDebkDebkDebkDebkTebkTebkTebkTebkTebkTebkTebkTebkTebkTebkTebkTebkTebk
TebkTebkTebkTebkTebkTebkTebkTebkTebkTebkzcLWIOtJTtaTnKwnOVlPcrKe5GQ9ycl6kpP1
JCfrSU7Wk5ysJzlZT3KynuRkPcnJepKT9SQn60lO1pOcrCc5WU9ysp7kZD3JyXqSk/UkJ+tJTtaT
nKwnOa/fk/z0XHtevyWZuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbubfN/fpk2SWz72CY
kzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZ
kzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzeZkzcXW4OsJzlZT3KynuRkPcnJ
epKT9SQn60lO1pOcrCc5WU9ysp7kZD3JxXqSi/UkF+tJLtaTXKwnuVhPcrGe5GI9ycV6kov1JBfr
SS7Wk1ysJ7lYT3KxnuS6fk/y03Ptdf2WZOZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbuZmbube
Nvfrk2WXzL6DYU7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7e
Yk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7eYk7e6mwNsp7k
Yj3JxXqSi/UkF+tJLtaTXKwnuVhPcrGe5GI9ycV6kov1JBfrSS7Wk1ysJ7lYT3KxnuRiPcnFepKL
9SQX60ku1pNcrCe5WE9ysZ7kYj3JxXqS6/o9yc/Pta/fkszczM3czM3czM3czM3czM3czM3czM3c
zM3czM3czM3c2+Z+ebIMk9l3MMzJW8zJW8zJW8zJW8zJW8zJW8zJW8zJW8zJW8zJW8zJW8zJW8zJ
W8zJW8zJW8zJW8zJW8zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ28zJ
28zJ28HWIOtJbtaT3KwnuVlPcrOe5GY9yc16kpv1JDfrSW7Wk9ysJ7lZT3KznuRmPcnNepKb9SQ3
60lu1pPcrCe5WU9ys57kZj3JzXqSm/UkN+tJbtaT3Kwnua/fk/z0XHtfvyWZuZmbuZmbuZmbuZmb
uZmbuZmbuZmbuZmbuZmbuZmbubfN/fpk2SWz72CYk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZ
k7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZk7eZ
k7eZk7eZk7eZk7eZk7cnW4OsJ7lZT3KznuRmPcnNepKb9SQ360lu1pPcrCe5WU9ys57kZj3JzXqS
m/UkN+tJbtaT3KwnuVlPcrOe5FY9yfpU9SQvycGSC0uuLLmx5M6SB0ue4rn2JXdlbuZmbuZmbuZm
buZmbuZmbuZmbuZmbuZmbuZmbuZm7n+s3K9Pll0y+w4m2Hcwwb6DCfYdTLDvYIJ9BxPsO5hg38Eo
J++SzNZgsDVY2BosbA0WtgYLW4OFrcHC1mBha7CwNVjYGixsDVa2Bitbg5WtwcrWYGVrsLI1WNka
rGwNVrYGK1uDja3BxtZgY2uwsTXY2BpsbA02tgYbW4ONrcHG1mBna7CzNdjZGuxsDXa2Bjtbg52t
wc7WYGdrsLM1ONgaHGwNDrYGB1uDg63BwdbgYGtwsDU42BocbA1Otgav35P8/Fz7+i3JzM3czM3c
zM3czM3czM3czM3czM3czM3czM3czM3czL1t7tcnyy6ZfQcz2Xcwk30HM9l3MJN9BzPZdzCTfQez
2Hcwi30PutgaXGwNLrYGF1uDi63BxdbgYmtwsTW42RrcbA1utgY3W4ObrcHN1uBma3CzNbjZGmRO
XjAnL5iTF8zJC+bkBXPygjl5wZy8eDpZ8mLJbA2ynmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSw
nmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmSwnmRcvyf56bl2XL8l
mbmZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7m3zf36ZNkls+9gmJMXzMkL5uQFc/KCOXnB
nLxgTl4wJy+YkxfMyQvm5AVz8oI5ecGcvGBOXjAnL5iTF8zJC+bkBXPygjl5wZy8YE5eMCcvmJMX
zMkL5uQFc/KCOXnBnLxgTl4wJy+YkxeTrUHWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzW
kwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWkwzWk4zr9yQ/Pdcu
129JZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZm7mZu5tcx+eLMvkYMmFJVeW3FhyZ8mDJU+W
vFiy+h60MCevMCevMCevMCevMCevMCevMCevMCevMCevXN/J+/HdsxevMzRDMzRDMzRDMzRDMzRD
MzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRD
MzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRD
MzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRD
MzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRD
MzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDMzRDUejdq7cf
frl26POXd8/e/fY37+4+vr+7Tvb7l28+PHnx+se7f35yyX/62988RbmBcgvKrSi3odyOcofIDfR7
Fuj3LNDvWaDfs0C/Z4F+zwL9nhX0e1bQ71lBv2cF/Z4V9HtW0O9ZQb9nP4S7cf5AftOqe8Pz6rmB
JpNAk0mgySTQZBJoMgk0mQSaTAJNJoEmk0CTSaDJJNBkEmgyCTSZBJpMAk0mgSaTQJNJoMkk0GQS
aDIJNZmEmkwCTSaBJpOCJpOCJpOCJpOCJpOCJpOCJpOCJpOCJpOCJpOCJpOCJpOCJpOCJpOCJpOC
JpOCJpOCJpOCJpOCJpOCJpOCJpOiJpOiJpOCJpOCJpOKJpOKJpOKJpOKJpOKJpOKJpOKJpOKJpOK
JpOKJpOKJpOKJpOKJpOKJpOKJpOKJpOKJpOKJpOKJpOKJpOKJpOqJpOqJpOKJpOKJpOGJpOGJpOG
JpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOGJpOm
JpOmJpOGJpOGJpOOJpOOJpOOJpOOJpOOJpOOJpOOJpOOJpOOJpOOJpOOJpOOJpOOJpOOJpOOJpOO
JpOOJpOOJpOOJpOOJpOOJpOuJpOuJpOOJpOOJpOBJpOBJpOBJpOBJpOBJpOBJpOBJpOBJpOBJpOB
JpOBJpOBJpOBJpOBJpOBJpOBJpOBJpOBJpOBJpOBJpOBJpOhJpOhJpOBJpOBJpOJJpOJJpOJJpOJ
JpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOJJpOpJpOp
JpOJJpOJJpOFJpOFJpOFJpOFJpOFJpOFJpOFJpOFJpOFJpOFJpOFJpOFJpOFJpOFJpOFJpOFJpOF
JpOFJpOFJpOFJpOFJpOlJpOlJpOFJpOFJpONJpONJpONJpONJpONJpONJpONJpONJpONJpONJpON
JpONJpONJpONJpONJpONJpONJpONJpONJpONJpONJpOtJpOtJpONJpOtpDWFwIZSYEMxsKEc2FAQ
bCgJNhQFG8qCDYXBhtJgQ3GwoTzYUCBsKBE2FAkbyoQNhcKGUmFDsbChXNhQMGwwGTYYDRvKhg2G
wzIdlvGwzIdlQCwTYhkRy4xYhsQyJZYxscyJZVAsk2IZFcusWIbFMi2WcbHMi2VgLBNjHRnrzFiG
xio1NhQbG8qNDQXHhpJjQ9GxoezYUHhsKD02FB8byo8NBciGEmRDEbKhDNlQiGwoRTYUIxvKkQ0F
yYaSZENRssEs2WCYbChNNhQnG8qTDQXKhhJlQ5GyoUzZUKhsKFU2FCsbypUNBcuGkmVD0bKhbNlQ
uGwoXTYULxvKlw0FzIYSZkMRs6GM2WDIbDBlNhQzG8qZDQXNhpJmQ1GzoazZUNhsKG02FDcbypsN
Bc6GEmdDkbOhzNlQ6GwodTYUOxvKnQ0Fz4aSZ0PRs6Hs2VD4bDB9Nhg/G8qfDQXQhhJoQxG0oQza
UAhtKIU2FEMbyqENBdGGkmhDUbShLNpQGG0ojTYURxvKow0F0oYSaUORtKFM2lAobSiVNhhLG8yl
DQXThpJpQ9G0oWzaUDhtKJ02FE8byqcNBdSGEmpDEbWhjNpQSG0opTYUUxvKqQ0F1YaSakNRtaGs
2lBYbSitNhRXG8yrDQbWhhJrQ5G1oczaUGhtKLU2FFsbyq0NBdeGkmtD0bWh7NpQeG0ovTYUXxvK
rw0F2IYSbEMRtqEM21CIbSjFNhRjG8qxDQbZBpNsQ1G2oSzbUJhtKM02FGcbyrMNBdqGEm1Dkbah
TNtQqG0o1TYUaxvKtQ0F24aSbUPRtqFs21C4bSjdNhRvG8q3DQXcBhNugxG3oYzbUMhtKOU2FHMb
yrkNBd2Gkm5DUbehrNtQ2G0o7TYUdxvKuw0F3oYSb0ORt6HM21DobSj1NhR7G8q9DQXfhpJvg9G3
wezbUPhtKP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22
KP22KP22KP22KP22KP22MP22MP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22
KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22MP22MP22KP22KP22KP22KP22KP22KP22
KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22MP22MP22
KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22
KP22KP22KP22KP22MP22MP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22
KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22MP22MP22KP22KP22KP22KP22KP22KP22KP22
KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22MP22MP22KP22
KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22
KP22KP22KP22MP22MP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22
KP22KP22KP22KP22KP22KP22KP22KP22KP22MP22MP22KP22KP22KP22KP22KP22KP22KP22KP22
KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22MP22MP22KP22KP22
KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22KP22
KP22KP22MP22MP22KP22KP22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22
Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Mv22Mv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22
Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Mv22Mv22Kv22Kv22Kv22
Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22
Kv22Mv22Mv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22
Kv22Kv22Kv22Kv22Kv22Kv22Kv22Mv22Mv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22
Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Mv22Mv22Kv22Kv22Kv22Kv22
Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22
Mv22Mv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22
Kv22Kv22Kv22Kv22Kv22Kv22Mv22Mv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22
Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Mv22Mv22Kv22Kv22Kv22Kv22Kv22
Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Mv22
Mv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22Kv22
Kv22Kv22Kv22Kv22Kv22Mv22Mv22Kv22Kv22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22
Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Mf22Mf22Kf22Kf22Kf22Kf22Kf22Kf22
Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Mf22Mf22
Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22
Kf22Kf22Kf22Kf22Mf22Mf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22
Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Mf22Mf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22
Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Mf22Mf22Kf22
Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22
Kf22Kf22Kf22Mf22Mf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22
Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Mf22Mf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22
Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Mf22Mf22Kf22Kf22
Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22
Kf22Kf22Mf22Mf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22
Kf22Kf22Kf22Kf22Kf22Kf22Kf22Kf22Mf22Mf22Kf22Kf22K/22K/22K/22K/22K/22K/22K/22
K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22M/22M/22K/22K/22K/22
K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22
K/22M/22M/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22
K/22K/22K/22K/22K/22K/22K/22M/22M/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22
K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22M/22M/22K/22K/22K/22K/22
K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22
M/22M/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22
K/22K/22K/22K/22K/22K/22M/22M/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22
K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22M/22M/22K/22K/22K/22K/22K/22
K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22M/22
M/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22
K/22K/22K/22K/22K/22M/22M/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22
K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22K/22M/22M/22K/22K/12KP12KP12KP12KP12
KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12MP12MP12
KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12
KP12KP12KP12KP12MP12MP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12
KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12MP12MP12KP12KP12KP12KP12KP12KP12KP12
KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12MP12MP12KP12
KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12
KP12KP12KP12MP12MP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12
KP12KP12KP12KP12KP12KP12KP12KP12KP12MP12MP12KP12KP12KP12KP12KP12KP12KP12KP12
KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12MP12MP12KP12KP12
KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12
KP12KP12MP12MP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12
KP12KP12KP12KP12KP12KP12KP12KP12MP12MP12KP12KP12KP12KP12KP12KP12KP12KP12KP12
KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12KP12MP12MP12KP12KP12Kv12
Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12
Kv12Mv12Mv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12
Kv12Kv12Kv12Kv12Kv12Kv12Kv12Mv12Mv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12
Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Mv12Mv12Kv12Kv12Kv12Kv12
Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12
Mv12Mv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12
Kv12Kv12Kv12Kv12Kv12Kv12Mv12Mv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12
Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Mv12Mv12Kv12Kv12Kv12Kv12Kv12
Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Mv12
Mv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12
Kv12Kv12Kv12Kv12Kv12Mv12Mv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12
Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Mv12Mv12Kv12Kv12Kv12Kv12Kv12Kv12
Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Kv12Mv12Mv12
Kv12Kv12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12
Kf12Kf12Kf12Kf12Mf12Mf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12
Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Mf12Mf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12
Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Mf12Mf12Kf12
Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12
Kf12Kf12Kf12Mf12Mf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12
Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Mf12Mf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12
Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Mf12Mf12Kf12Kf12
Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12
Kf12Kf12Mf12Mf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12
Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Mf12Mf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12
Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Mf12Mf12Kf12Kf12Kf12
Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12Kf12
Kf12Mf12Mf12Kf12Kf12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12
K/12K/12K/12K/12K/12K/12K/12M/12M/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12
K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12M/12M/12K/12K/12K/12K/12
K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12
M/12M/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12
K/12K/12K/12K/12K/12K/12M/12M/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12
K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12M/12M/12K/12K/12K/12K/12K/12
K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12M/12
M/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12
K/12K/12K/12K/12K/12M/12M/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12
K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12M/12M/12K/12K/12K/12K/12K/12K/12
K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12M/12M/12
K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12K/12
K/12K/12K/12K/12M/12M/12K/12K/02nir+9ktysOTCkitLbiy5s+RhkoP91gX7rQv2Wxfsty7Y
b12w37pgv3WF/dYV9ltX2G9dYb91hf3WFfZbV9hv3Q8hb7E/oN+7Kt+0mGWCzTLBZplgs0ywWSbY
LBNslgk2ywSbZYLNMsFmmWCzTLBZJtgsE2yWCTbLBJtlgs0ywWaZYLNMsFkm2CwTbpYJN8sEm2WC
zTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKFzTKF
zTKFzTKFzTLFzTLFzTKFzTKFzTKVzTKVzTKVzTKVzTKVzTKVzTKVzTKVzTKVzTKVzTKVzTKVzTKV
zTKVzTKVzTKVzTKVzTKVzTKVzTKVzTKVzTLVzTLVzTKVzTKVzTKNzTKNzTKNzTKNzTKNzTKNzTKN
zTKNzTKNzTKNzTKNzTKNzTKNzTKNzTKNzTKNzTKNzTKNzTKNzTKNzTKNzTLNzTLNzTKNzTKNzTKd
zTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKdzTKd
zTKdzTLdzTLdzTKdzTKdzTKDzTKDzTKDzTKDzTKDzTKDzTKDzTKDzTKDzTKDzTKDzTKDzTKDzTKD
zTKDzTKDzTKDzTKDzTKDzTKDzTKDzTLDzTLDzTKDzTKDzTKTzTKTzTKTzTKTzTKTzTKTzTKTzTKT
zTKTzTKTzTKTzTKTzTKTzTKTzTKTzTKTzTKTzTKTzTKTzTKTzTKTzTLTzTLTzTKTzTKTzTKLzTKL
zTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKLzTKL
zTLLzTLLzTKLzTKLzTKbzTKbzTKbzTKbzTKbzTKbzTKbzTKbzTKbzTKbzTKbzTKbzTKbzTKbzTKb
zTKbzTKbzTKbzTKbzTKbzTKbzTLbzTLbzTKbzTLM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+
BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m849zec+xvM/Q3m/gZzf4O5v8Hc32Du
bzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zec+xvO/Q3m
/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g
7m8w9zeY+xvO/Q3n/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N
5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3n/v5f2u4lx7IjvdLoVGIAlcD5n2Y2HKIyGgTyQSRTDc2+
IEBqqNqxJnBgDBzw2+5+bd1w7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/
g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9w7m849zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3
N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m849zec+xvM/Q3m/gZz
f4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w
9zec+xvO/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4G
c3+Dub/B3N9g7m8w9zeY+xvO/Q3n/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5v
MPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3n/oZzf4O5v8Hc32DubzD3N5j7G8z9Deb+
BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/oZzf8O5v8Hc32Du
bzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m
/iZzf9O5v+nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k
7m8y9zeZ+5vM/U3m/iZzf5O5v+nc33TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N
5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc33Tubzr3N5n7m8z9Teb+JnN/k7m/ydzf
ZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32Tubzr3N537m8z9
Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc
32TubzL3N537m879Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM
/U3m/iZzf5O5v8nc32TubzL3N5n7m879Tef+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J
3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Tef+pnN/k7m/ydzfZO5vMvc3mfub
zP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+pnN/07m/
ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7
m8z9Teb+JnN/07m/6dzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5
v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/6dzfdO5vMvc3mftbzP0t5v4Wc3+Lub/F3N9i7m8x97eY
+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfcu5vOfe3mPtbzP0t5v4Wc3+L
ub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vOfe3
nPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/
i7m/xdzfYu5vMfe3nPtbzv0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3
t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzv0t5/4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZz
f4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5/6Wc3+Lub/F3N9i7m8x
97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v6W
c3/Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5v
Mfe3mPtbzP0t5v4Wc3/Lub/l3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+
FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/l3N9y7m8x97eY+1vM/S3m/hZzf4u5v8Xc32Lu
bzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9y7m8597eY+1vM/S3m
/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i
7m8597ec+1vM/S3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t
5v42c3+bub/N3N9m7m8z97ed+9vO/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzf
Zu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vO/W3n/jZzf5u5v83c32bubzP3t5n728z9
beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3n/rZzf5u5v83c
32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM
/W3m/rZzf9u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N
3N9m7m8z97eZ+9vM/W3m/jZzf9u5v+3c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvb
zP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v+3c33bubzP3t5n728z9beb+NnN/m7m/
zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c33bubzv3t5n7
28z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5
v83c32bubzv3t53728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ
+9vM/W3m/jZzf5u5v83c32bubzP3t5372879beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+b
ub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n72879bef+NnN/m7m/w9zfYe7vMPd3
mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Hef+jnN/
h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3
d5j7O8z9Heb+jnN/x7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5z
f4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/x7m/49zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w
93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/49zfce7vMPd3mPs7zP0d5v4O
c3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfce7v
OPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+
DnN/h7m/w9zfYe7vOPd3nPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu
7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3nPs7zv0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m
/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zv0d5/4Oc3+Hub/D3N9h
7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d
5/6Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zf
Ye7vMPd3mPs7zP0d5v6Oc3/Hub/D3N9h7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9
Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3/Xub/r3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc
32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/r3N917u8y93eZ+7vM
/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L
3N917u8693eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7
zP1d5v4uc3+Xub/L3N9l7u8693ed+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/
y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93ed+7vO/V3m/i5zf5e5v8vc32Xu7zL3d5n7
u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vO/V3n/i5zf5e5
v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ
+7vM/V3n/q5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+X
ub/L3N9l7u8y93eZ+7vM/V3m/q5zf9e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3
mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf9e5v+vc32Xu7zL3d5n7u8z9Xeb+LnN/
l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v+vc33Xu7zL3
d5n7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7
e5j7e5j7e5j7e5z7e5z7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7
e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5z7e5z7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7
e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5z7e5z7e5j7e5j7
e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7
e5j7e5j7e5z7e5z7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7
e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5z7e5z7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7
e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5z7e5z7e5j7e5j7e5j7
e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7
e5j7e5z7e5z7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7
e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5z7e5z7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7
e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5z7e5z7e5j7e5j7e5j7e5j7
e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7e5j7
e5z7e5z7e5j7e5j7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7
e5n7e5n7e5n7e5n7e5n7e5n7e537e537e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7
e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e537e537e5n7e5n7e5n7e5n7e5n7
e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e537
e537e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7
e5n7e5n7e5n7e5n7e5n7e537e537e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7
e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e537e537e5n7e5n7e5n7e5n7e5n7e5n7
e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e537e537
e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7
e5n7e5n7e5n7e5n7e537e537e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7
e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e537e537e5n7e5n7e5n7e5n7e5n7e5n7e5n7
e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e537e537e5n7
e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7e5n7
e5n7e5n7e5n7e537e537e5n7e5n7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7
+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5z7+5z7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7
+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5z7+5z7+5j7+5j7
+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7
+5j7+5j7+5z7+5z7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7
+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5z7+5z7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7
+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5z7+5z7+5j7+5j7+5j7
+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7
+5j7+5z7+5z7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7
+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5z7+5z7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7
+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5z7+5z7+5j7+5j7+5j7+5j7
+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7
+5z7+5z7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7+5j7
+5j7+5j7+5j7+5j7+5j7+5j7+5z7+5z7+5j7+5T7m59yf//nycGenOzJxZ7c7MnDnrzmycHeumBv
XbC3LthbF+ytC/bWBXvrkr11yd66ZG9dsrcu2VuX7K1L9tb9JWRi/4Leu5KHFlsm2JYJtmWCbZlg
WybYlgm2ZYJtmWBbJtiWCbZlgm2ZYFsm2JYJtmWCbZlgWybYlgm2ZYJtmWBbJtiWCbdlwm2ZYFsm
2JZJtmWSbZlkWybZlkm2ZZJtmWRbJtmWSbZlkm2ZZFsm2ZZJtmWSbZlkWybZlkm2ZZJtmWRbJtmW
SbZl0m2ZdFsm2ZZJtmWKbZliW6bYlim2ZYptmWJbptiWKbZlim2ZYlum2JYptmWKbZliW6bYlim2
ZYptmWJbptiWKbZlim2Zclum3JYptmWKbZlmW6bZlmm2ZZptmWZbptmWabZlmm2ZZlum2ZZptmWa
bZlmW6bZlmm2ZZptmWZbptmWabZlmm2ZZlum3ZZpt2WabZlmW2bYlhm2ZYZtmWFbZtiWGbZlhm2Z
YVtm2JYZtmWGbZlhW2bYlhm2ZYZtmWFbZtiWGbZlhm2ZYVtm2JYZt2XGbZlhW2bYllm2ZZZtmWVb
ZtmWWbZllm2ZZVtm2ZZZtmWWbZllW2bZllm2ZZZtmWVbZtmWWbZllm2ZZVtm2ZZZtmXWbZl1W2bZ
llm2ZQ7bModtmcO2zGFb5rAtc9iWOWzLHLZlDtsyh22Zw7bMYVvmsC1z2JY5bMsctmUO2zKHbZnD
tsxhW+awLXPcljluyxy2ZQ7bMpdtmcu2zGVb5rItc9mWuWzLXLZlLtsyl22Zy7bMZVvmsi1z2Za5
bMtctmUu2zKXbZnLtsxlW+ayLXPZlrluy1y3ZS7bMpdtmce2zGNb5rEt89iWeWzLPLZlHtsyj22Z
x7bMY1vmsS3z2JZ5bMs8tmUe2zKPbZnHtsxjW+axLfPYlnlsyzy3ZZ7bMo9tGeb+BnN/g7m/wdzf
YO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5z7G879
Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc
32DubzD3N5j7G879Def+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM
/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Def+hnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B
3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+hnN/w7m/wdzfYO5vMPc3mPsb
zP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/w7m/
4dzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7
G8z9Deb+BnN/g7m/4dzfcO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5
v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfcO5vOPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY
+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vOPc3nPsbzP0N5v4Gc3+D
ub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3
nPsbzv0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/
g7m/wdzfYO5vMPc3mPsbzv0N5/4Gc3+Dub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3
N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5/6mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZz
f5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v6mc3/Tub/J3N9k7m8y
9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4m
c3/Tub/p3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5v
Mvc3mfubzP1N5v4mc3+Tub/p3N907m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+
JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N907m869zeZ+5vM/U3m/iZzf5O5v8nc32Tu
bzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m869zed+5vM/U3m
/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k
7m8y9zed+5vO/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N
5v4mc3+Tub/J3N9k7m8y9zeZ+5vO/U3n/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzf
ZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3n/qZzf5O5v8nc32TubzL3N5n7m8z9
Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/qZzf9O5v8nc
32TubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM
/S3m/hZzf8u5v+Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F
3N9i7m8x97eY+1vM/S3m/hZzf4u5v+Xc33LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtb
zP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc33Lubzn3t5j7W8z9Leb+FnN/i7m/
xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32Lubzn3t5z7
W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5
v8Xc32LubzH3t5z7W879Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY
+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W879Lef+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+L
ub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Lef+lnN/i7m/xdzfYu5vMfe3
mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+lnN/
y7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3
t5j7W8z9Leb+FnN/y7m/5dzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/hZz
f4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/5dzfcu5vMfe3mPvbzP1t5v42c3+bub/N3N9m7m8z
97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfdu5vO/e3mfvbzP1t5v42
c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5v
O/e3nfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+
NnN/m7m/zdzfZu5vM/e3nfvbzv1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bu
bzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzv1t5/42c3+bub/N3N9m7m8z97eZ+9vM/W3m
/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5/62c3+bub/N3N9m
7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t
5v62c3/bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzf
Zu5vM/e3mfvbzP1t5v42c3/bub/t3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9
beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/t3N927m8z97eZ+9vM/W3m/jZzf5u5v83c
32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N927m8797eZ+9vM
/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N
3N9m7m8797ed+9vM/W3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7
zP0d5v4Oc3+Hub/D3N9h7u8w93ec+zvO/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/
w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvO/R3n/g5zf4e5v8Pc32Hu7zD3d5j7
O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3n/o5zf4e5
v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY
+zvM/R3m/o5zf8e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+H
ub/D3N9h7u8w93eY+zvM/R3m/g5zf8e5v+Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3
mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v+Pc33Hu7zD3d5j7O8z9Heb+DnN/
h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc33Hu7zj3
d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5z
f4e5v8Pc32Hu7zj3d5z7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9h7u8w
93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5z7O879Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4O
c3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O879Hef+DnN/h7m/y9zfZe7v
Mvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xef+
rnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu
7zL3d5n7u8z9Xeb+rnN/17m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m
/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/17m/69zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l
7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/69zfde7vMvd3mfu7zP1d
5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zf
de7vOvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9
Xeb+LnN/l7m/y9zfZe7vOvd3nfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc
32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3nfu7zv1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM
/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zv1d5/4uc3+Xub/L
3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7
zP1d5/6uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/
y9zfZe7vMvd3mfu7zP1d5v6uc3/Xub/L3N9l7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h
7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9x7u9x7u9h7u9h7u9h7u9h7u9h7u9h
7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9x7u9x
7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h
7u9h7u9h7u9h7u9h7u9x7u9x7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h
7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9x7u9x7u9h7u9h7u9h7u9h7u9h7u9h7u9h
7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9x7u9x7u9h
7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h
7u9h7u9h7u9h7u9x7u9x7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h
7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9x7u9x7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h
7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9x7u9x7u9h7u9h
7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h
7u9h7u9h7u9x7u9x7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h
7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9h7u9x7u9x7u9h7u9h7u9l7u9l7u9l7u9l7u9l7u9l7u9l
7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u917u917u9l7u9l7u9l
7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l
7u9l7u917u917u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l
7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u917u917u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l
7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u917u917u9l7u9l7u9l7u9l
7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l
7u917u917u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l
7u9l7u9l7u9l7u9l7u9l7u9l7u917u917u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l
7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u917u917u9l7u9l7u9l7u9l7u9l
7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u91
7u917u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l
7u9l7u9l7u9l7u9l7u9l7u917u917u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l
7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u9l7u917u917u9l7u9l7u9j7u9j7u9j7u9j
7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9z7u9z
7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j
7u9j7u9j7u9j7u9j7u9z7u9z7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j
7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9z7u9z7u9j7u9j7u9j7u9j7u9j7u9j7u9j
7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9z7u9z7u9j
7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j
7u9j7u9j7u9j7u9z7u9z7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j
7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9z7u9z7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j
7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9z7u9z7u9j7u9j
7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j
7u9j7u9j7u9z7u9z7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j
7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9z7u9z7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j
7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9j7u9z7u9z7u9j7u9T7m99
yv39nycHe3KyJxd7crMnD3vymicHe+uCvXXB3rpgb12wty7YWxfsrUv21iV765K9dcneumRvXbK3
Ltlb95eQif0Leu9KHlpsmWBbJtiWCbZlgm2ZYFsm2JYJtmWCbZlgWybYlgm2ZYJtmWBbJtiWCbZl
gm2ZYFsm2JYJtmWCbZlgWybclgm3ZYJtmWBbJtmWSbZlkm2ZZFsm2ZZJtmWSbZlkWybZlkm2ZZJt
mWRbJtmWSbZlkm2ZZFsm2ZZJtmWSbZlkWybZlkm3ZdJtmWRbJtmWKbZlim2ZYlum2JYptmWKbZli
W6bYlim2ZYptmWJbptiWKbZlim2ZYlum2JYptmWKbZliW6bYlim2ZcptmXJbptiWKbZlmm2ZZlum
2ZZptmWabZlmW6bZlmm2ZZptmWZbptmWabZlmm2ZZlum2ZZptmWabZlmW6bZlmm2ZZptmXZbpt2W
abZlmm2ZYVtm2JYZtmWGbZlhW2bYlhm2ZYZtmWFbZtiWGbZlhm2ZYVtm2JYZtmWGbZlhW2bYlhm2
ZYZtmWFbZtyWGbdlhm2ZYVtm2ZZZtmWWbZllW2bZllm2ZZZtmWVbZtmWWbZllm2ZZVtm2ZZZtmWW
bZllW2bZllm2ZZZtmWVbZtmWWbdl1m2ZZVtm2ZY5bMsctmUO2zKHbZnDtsxhW+awLXPYljlsyxy2
ZQ7bModtmcO2zGFb5rAtc9iWOWzLHLZlDtsyh22Zw7bMcVvmuC1z2JY5bMtctmUu2zKXbZnLtsxl
W+ayLXPZlrlsy1y2ZS7bMpdtmcu2zGVb5rItc9mWuWzLXLZlLtsyl22Zy7bMZVvmui1z3Za5bMtc
tmUe2zKPbZnHtsxjW+axLfPYlnlsyzy2ZR7bMo9tmce2zGNb5rEt89iWeWzLPLZlHtsyj22Zx7bM
Y1vmsS3z3JZ5bss8tmWY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5v
MPc3mPsbzP0N5v4Gc3+Dub/B3N9w7m849zeY+xvM/Q3m/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+
BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m849zec+xvM/Q3m/gZzf4O5v8Hc32Du
bzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zec+xvO/Q3m
/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g
7m8w9zeY+xvO/Q3n/gZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N
5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3n/oZzf4O5v8Hc32DubzD3N5j7G8z9Deb+BnN/g7m/wdzf
YO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/oZzf8O5v8Hc32DubzD3N5j7G8z9
Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf8O5v+Hc
32DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM
/Q3m/gZzf4O5v+Hc33DubzD3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsbzP0N5v4Gc3+Dub/B
3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc33Dubzj3N5j7G8z9Deb+BnN/g7m/wdzfYO5vMPc3mPsb
zP0N5v4Gc3+Dub/B3N9g7m8w9zeY+xvM/Q3m/gZzf4O5v8Hc32Dubzj3N5z7G8z9Deb+JnN/k7m/
ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N537
m879Teb+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5
v8nc32TubzL3N5n7m879Tef+JnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ
+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Tef+pnN/k7m/ydzfZO5vMvc3mfubzP1N5v4mc3+T
ub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+pnN/07m/ydzfZO5vMvc3
mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/
07m/6dzfZO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3
N5n7m8z9Teb+JnN/k7m/6dzfdO5vMvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZz
f5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfdO5vOvc3mfubzP1N5v4mc3+Tub/J3N9k7m8y
9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5vOvc3nfubzP1N5v4m
c3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+JnN/k7m/ydzfZO5v
Mvc3nfubzv1N5v4mc3+Tub/J3N9k7m8y9zeZ+5vM/U3m/iZzf5O5v8nc32TubzL3N5n7m8z9Teb+
JnN/k7m/ydzfZO5vMvc3mfubzv1N5/4mc3+Tub/F3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32Lu
bzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5/6Wc3+Lub/F3N9i7m8x97eY+1vM/S3m
/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v6Wc3/Lub/F3N9i
7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t
5v4Wc3/Lub/l3N9i7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzf
Yu5vMfe3mPtbzP0t5v4Wc3+Lub/l3N9y7m8x97eY+1vM/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9
Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9y7m8597eY+1vM/S3m/hZzf4u5v8Xc
32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8597ec+1vM
/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F
3N9i7m8x97ec+1vO/S3m/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtb
zP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vO/S3n/hZzf4u5v8Xc32LubzH3t5j7W8z9Leb+FnN/i7m/
xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3n/pZzf4u5v8Xc32LubzH3t5j7
W8z9Leb+FnN/i7m/xdzfYu5vMfe3mPtbzP0t5v4Wc3+Lub/F3N9i7m8x97eY+1vM/S3m/pZzf8u5
v8Xc32LubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ
+9vM/W3m/jZzf9u5v+3c32bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+b
ub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v+3c33bubzP3t5n728z9beb+NnN/m7m/zdzfZu5vM/e3
mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c33bubzv3t5n728z9beb+NnN/
m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzv3
t53728z9beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZz
f5u5v83c32bubzP3t5372879beb+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z
97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n72879bef+NnN/m7m/zdzfZu5vM/e3mfvbzP1t5v42
c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9bef+tnN/m7m/zdzfZu5v
M/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bubzP3t5n728z9beb+
tnN/27m/zdzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m/jZzf5u5v83c32bu
bzP3t5n728z9beb+NnN/27m/7dzfZu5vM/e3mfvbzP1t5v42c3+bub/N3N9m7m8z97eZ+9vM/W3m
/jZzf5u5v83c32bubzP3t5n728z9beb+NnN/m7m/7dzfdu5vM/e3mfs7zP0d5v4Oc3+Hub/D3N9h
7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfce7vOPd3mPs7zP0d
5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zf
Ye7vOPd3nPs7zP0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9
Heb+DnN/h7m/w9zfYe7vMPd3nPs7zv0d5v4Oc3+Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc
32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zv0d5/4Oc3+Hub/D3N9h7u8w93eY+zvM
/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5/6Oc3+Hub/D
3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7
zP0d5v6Oc3/Hub/D3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/
w9zfYe7vMPd3mPs7zP0d5v4Oc3/Hub/j3N9h7u8w93eY+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7
O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/j3N9x7u8w93eY+zvM/R3m/g5zf4e5
v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+Hub/D3N9x7u8493eY
+zvM/R3m/g5zf4e5v8Pc32Hu7zD3d5j7O8z9Heb+DnN/h7m/w9zfYe7vMPd3mPs7zP0d5v4Oc3+H
ub/D3N9h7u8493ec+zvM/R3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3
mfu7zP1d5v4uc3+Xub/L3N9l7u8y93ed+7vO/V3m/i5zf5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/
l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vO/V3n/i5zf5e5v8vc32Xu7zL3
d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3n/q5z
f5e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y
93eZ+7vM/V3m/q5zf9e5v8vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4u
c3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf9e5v+vc32Xu7zL3d5n7u8z9Xeb+LnN/l7m/y9zfZe7v
Mvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v+vc33Xu7zL3d5n7u8z9Xeb+
LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc33Xu
7zr3d5n7u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m
/i5zf5e5v8vc32Xu7zr3d537u8z9Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d5v4uc3+Xub/L3N9l
7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d537u879Xeb+LnN/l7m/y9zfZe7vMvd3mfu7zP1d
5v4uc3+Xub/L3N9l7u8y93eZ+7vM/V3m/i5zf5e5v8vc32Xu7zL3d5n7u879Xef+LnN/l7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/
x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/h7m/h7m/h7m/h7m/h7m/h7m/
h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/h7m/x7m/x7m/
h7m/h7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/17m/17m/l7m/l7m/l7m/
l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/l7m/
l7m/17m/17m/l7m/l7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/
z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/z7m/z7m/
j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/j7m/
j7m/j7m/j7m/j7m/z7m/z7m/j7m/75e6v3/9+Y8/f/74+29//Pjjt//82z9/++uvfuy/fv7t529/
/vw1j/3j93/8+L///I9//PtH/J8ff/775x8/vl/34D9/ksf+7/OGOW+o86Y5b6rzljlvqfO2OW+r
844576jzrjnvqvMec96jznvNea867zPnfawXKHDhCqcSxxoXKHLBKhcoc8E6Fyh0wUoXKHXBWhco
dsFqFyh3wXoXKHjBihcoecGal6h5yZqXqHnpfq5TP9ix5iVqXrLmJWpesuYlal6y5iVqXrLmJWpe
suYlal6y5iVqXrLmFWpeseYVal6x5hVqXrnfZqpfZ7LmFWpeseYVal6x5hVqXrHmFWpeseYVal6x
5hVqXrHmNWpes+Y1al6z5jVqXrPmNWpeu7/hqT/iseY1al6z5jVqXrPmNWpes+Y1al6z5jVqXrPm
DWresOYNat6w5g1q3rDmDWresOYNat64T66oj66w5g1q3rDmDWresOYNat6w5g1q3rDmLWresuYt
at6y5i1q3rLmLWresuYtat6y5i1q3rrPa6oPbLLmLWresuYtat6y5i1q3rLmHdS8w5p3UPMOa95B
zTuseQc177DmHdS8w5p3UPMOa95BzTvuloK6psCad1DzDmveQc07rHkXNe+y5l3UvMuad1HzLmve
Rc27rHkXNe+y5l3UvMuad1HzLmveRc277m6eupzHmndR8y5r3kPNe6x5DzXvseY91LzHmvdQ8x5r
3kPNe6x5DzXvseY91LzHmvdQ8x5r3kPNe+5GurqSDu+ks0vp7lb6p66lf+5e+qcupn/uZvqnrqZ/
7m76py6nf+52+qeup3/ufvqnLqh/7ob6p66of+6O+qcuqX/ulvqnrql/roMMZ5E6C+NZXAcZ0AKF
Fka0QKOFIS1QaWFMC3RaGNQCpRZGtUCrhWEtUGthXIvzWkKBLeHEllBkSyR0yhhU5jqo2JZwbkso
uCWc3BKKbglnt4TCW8LpLaH4lnB+SyjAJZzgEopwCWe4hEJcwikuoRiXcI5LKMglCoqdjOx0HVSY
SzjNJRTnEs5zCQW6hBNdQpEu4UyXUKhLONUlFOsSznUJBbuEk11C0S7hbJdQuEs43SUU7xIN7WqG
V7sOKuIlnPESCnkJp7yEYl7COS+hoJdw0kso6iWc9RIKewmnvYTiXsJ5L6HAl3DiSyjyJZz5Egp9
iYHf4sC+xsF1UMEv4eSXUPRLOPslFP4STn8Jxb+E819CATDhBJhQBEw4AyYUAhNOgQnFwIRzYEJB
MOEkmFAUTCz8PiP2hUaug4qDCefBhAJhwokwoUiYcCZMKBQmnAoTioUJ58KEgmHCyTChaJhwNkwo
HCacDhOKhwnnw4QCYuLAb/ZjX+3nOqiQmHBKTCgmJpwTEwqKCSfFhKJiwlkxobCYcFpMKC4mnBcT
CowJJ8aEImPCmTGh0JhwakwoNiYu/I5b9iW3roOKjglnx4TCY8LpMaH4mHB+TChAJpwgE4qQCWfI
hEJkwikyoRiZcI5MKEgmnCQTipIJZ8mEwmTiwW97Z1/3/is7+Lefv/3rx+9//vj9rz///sc///3z
v/4LfvU/yfnvk//iyILH/u/zhjkv+/dNc95U5y1z3lLnbXPeVucdc95R511z3lXnPea8R533mvNe
dd5nzvtYL1DgwhVOJY41LlDkglUuUOaCdS5Q6IKVLlDqgrUuUOyC1S5Q7oL1LlDwghUvUPKCNS9R
85I1L1Hz0v1cp36wY81L1LxkzUvUvGTNS9S8ZM1L1LxkzUvUvGTNS9S8ZM1L1LxkzSvUvGLNK9S8
Ys0r1Lxyv81Uv85kzSvUvGLNK9S8Ys0r1LxizSvUvGLNK9S8Ys0r1LxizWvUvGbNa9S8Zs1r1Lxm
zWvUvHZ/w1N/xGPNa9S8Zs1r1LxmzWvUvGbNa9S8Zs1r1LxmzRvUvGHNG9S8Yc0b1LxhzRvUvGHN
G9S8cZ9cUR9dYc0b1LxhzRvUvGHNG9S8Yc0b1LxhzVvUvGXNW9S8Zc1b1LxlzVvUvGXNW9S8Zc1b
1Lx1n9dUH9hkzVvUvGXNW9S8Zc1b1LxlzTuoeYc176DmHda8g5p3WPMOat5hzTuoeYc176DmHda8
g5p33C0FdU2BNe+g5h3WvIOad1jzLmreZc27qHmXNe+i5l3WvIuad1nzLmreZc27qHmXNe+i5l3W
vIuad93dPHU5jzXvouZd1ryHmvdY8x5q3mPNe6h5jzXvoeY91ryHmvdY8x5q3mPNe6h5jzXvoeY9
1ryHmvfcjXR1JR3eSWeX0t2t9E9dS//cvfRPXUz/3M30T11N/9zd9E9dTv/c7fRPXU//3P30T11Q
/9wN9U9dUf/cHfVPXVL/3C31T11T/1wHGc4idRbGs7gOMqAFCi2MaIFGC0NaoNLCmBbotDCoBUot
jGqBVgvDWqDWwrgW57WEAlvCiS2hyJZI6JQxqMx1ULEt4dyWUHBLOLklFN0Szm4JhbeE01tC8S3h
/JZQgEs4wSUU4RLOcAmFuIRTXEIxLuEcl1CQSxQUOxnZ6TqoMJdwmksoziWc5xIKdAknuoQiXcKZ
LqFQl3CqSyjWJZzrEgp2CSe7hKJdwtkuoXCXcLpLKN4lGtrVDK92HVTESzjjJRTyEk55CcW8hHNe
QkEv4aSXUNRLOOslFPYSTnsJxb2E815CgS/hxJdQ5Es48yUU+hIDv8WBfY2D66CCX8LJL6Hol3D2
Syj8JZz+Eop/Cee/hAJgwgkwoQiYcAZMKAQmnAITioEJ58CEgmDCSTChKJhY+H1G7AuNXAcVBxPO
gwkFwoQTYUKRMOFMmFAoTDgVJhQLE86FCQXDhJNhQtEw4WyYUDhMOB0mFA8TzocJBcTEgd/sx77a
z3VQITHhlJhQTEw4JyYUFBNOiglFxYSzYkJhMeG0mFBcTDgvJhQYE06MCUXGhDNjQqEx4dSYUGxM
XPgdt+xLbl0HFR0Tzo4JhceE02NC8THh/JhQgEw4QSYUIRPOkAmFyIRTZEIxMuEcmVCQTDhJJhQl
E86SCYXJxIPf9s6+7v1XdvBvP3/714/f//zx+19//v2Pf/7753/9F/zqf5Lt77/P/oszSx78/585
1JnDnTnVmdOdudSZy5251ZnbnXnUmcededWZ1535qDPD/z9fdebrzvzUmR9sCgthyBK6FMIWBoth
wBoGy2HAHgYLYsAiBktiwCYGi2LAKgbLYsAuBgtjwDIGS2PANiZrY8I2Jmtjyp8T3Q+KsI3J2piw
jcnamLCNydqYsI3J2piwjcnamLCNydqYsI3J2piwjcXaWLCNxdpYsI3F2ljyt6ju16iwjcXaWLCN
xdpYsI3F2liwjcXaWLCNxdpYsI3F2liwjc3a2LCNzdrYsI3N2tiwjc3a2PJvjO6PjLCNzdrYsI3N
2tiwjc3a2LCNzdrYsI3N2tiwjcPaOLCNw9o4sI3D2jiwjcPaOLCNw9o48hM47iM4sI3D2jiwjcPa
OLCNw9o4sI3D2jiwjcvauLCNy9q4sI3L2riwjcvauLCNy9q4sI3L2rjy86nuA6qwjcvauLCNy9q4
sI3L2riwjYe18cA2HtbGA9t4WBsPbONhbTywjYe18cA2HtbGA9t4WBuPvL3hrm/ANh7WxgPbeFgb
D2zjZW28sI2XtfHCNl7WxgvbeFkbL2zjZW28sI2XtfHCNl7WxgvbeFkbr7zb6C43wjZe1sYL2/hY
Gx9s42NtfLCNj7XxwTY+1sYH2/hYGx9s42NtfLCNj7XxwTY+1sYH2/hYG5+8+e+u/tO7//Dyv7z9
/7nr/5+8//85AOCTAsDnCIBPGgCfQwA+qQB8jgH4pAPwOQjgkxLA5yiAT1oAn8MAPqkBfI4D+GQv
IZZjtRzI5cheQjCHijmQzKFmDkRzqJoD2Rzq5kA4h8o5kM6hdg7Ec6ieA/kc6eeEA3RCCjrhCJ1I
6stBYE720jE6IR2dcJBOSEknHKUT0tIJh+mE1HTCcTohPZ1woE5IUSccqRPS1AmH6oRUdcKxOiFd
nXCwThQVWSHJKnvpcJ2Quk44XiekrxMO2Akp7Pw/9t6/yW3kyPP+f18FwhEXtuNRa5gJEiT1xF7E
rK2Z1d54pEcz3r2NnQ0FmkR3wwIBGgDVat+bfyqrCiDY3ZJanvyi4Avu3e1JrR5k/cxvVlXWpwiH
2CEkY4dwkB1CUnYIh9khJGeHcKAdQpJ2CIfaISRrh3CwHULSdgiH26E5lGEOhJgj9RKH3CEkc4dw
0B1CUncIh90hJHeHcOAdQpJ3CIfeISR7h3DwHULSdwiH3yEkf4dwAB5CEngIh+AhJIOHcBAeWkBf
/QA++4HUSxyIh5AkHsKheAjJ4iEcjIeQNB7C4XgIyeMhHJCHkEQewiF5CMnkIRyUh5BUHsJheQjJ
5SEcmIeQZB7CoXkogb6TBXwoC6mXODwPIfk8hAP0EJLQQzhEDyEZPYSD9BCS0kM4TA8hOT2EA/UQ
ktRDOFQPIVk9hIP1EJLWQzhcDyF5PYQD9tAS+rIk8GlJpF7ioD2EpPYQDttDSG4P4cA9hCT3EA7d
Q0h2D+HgPYSk9xAO30NIfg/hAD6EJPgQDuFDSIYP4SA+hKT4EA7jQyvoW8zAx5iReolD+RCS5UM4
mA8haT6Ew/kQkudDOKAPIYk+hEP6EJLpQzioDyGpPoTD+hCS60M4sA8hyT6EQ/sQku1DOLgPIek+
hMP7qH56U2RpHeVNlG+z3b5qM1cLPQPbbN/eROQayNcA8HnTRLiPD8tOyLITtuyMLDtjyx4jyx5j
yz5Hln2OLfsCWfYFtuwJsuwJtuxLZNmX2LKvkGVfYcu+RpZ9DdYmqLASWlmx0grWVoKKK4HVlaDy
SmB9JajAElhhCSqxBNZYgoosgVWWoDJLYJ0lqNASWGkJKrUE1lqGai2DtZahWsvodSx2IQvWWoZq
LYO1lqFay2CtZajWMlhrGaq1DNZahmotg7WWoVrLYK1lqNYyWGtjqNbGYK2NoVobg7U2hmptjN41
xm4bg7U2hmptDNbaGKq1MVhrY6jWxmCtjaFaG4O1NoZqbQzW2hiqtTFYa+dQrUWfLM+hWjsHa+0c
qrVzsNbOoVo7R5/RYg9pwVo7h2rtHKy1c6jWzsFaO4dq7RystXOo1s7BWjuHau0crLULqNYuwFq7
gGrtAqy1C6jWLsBau4Bq7QKstQuo1i7QGVHYlCiw1i6gWrsAa+0CqrULsNYuoFq7AGvtAqq1C7DW
JlCtTcBam0C1NgFrbQLV2gSstQlUaxOw1iZQrU3AWptAtTZB5x9jE5DBWptAtTYBa20C1doErLUJ
VGsTsNYuoVq7BGvtEqq1S7DWLqFauwRr7RKqtUuw1i6hWrsEa+0SqrVLsNYuoVq7RN/2wV73AWvt
Eqq1S7DWLqFauwRr7QqqtSuw1q6gWrsCa+0KqrUrsNauoFq7AmvtCqq1K7DWrqBauwJr7QqqtSuw
1q6gWrtC363FXq4Fa+0KqrUrsNauoVq7BmvtGqq1a7DWrqFauwZr7RqqtWuw1q6hWrsGa+0aqrVr
sNauoVq7BmvtGqq1a7DWrqFau0aTLLAoCzjLAgyzQNMsZlicxQzNs5hhgRYzNNFihkVazNBMixkW
ajFDUy1mWKzFDM21mGHBFjM02WKGRVvM0GyLGRZuMUPTLWZYvMUMrb9gmBSeJgXGSaH1FwyUghOl
wEgpOFMKDJWCU6XAWCk4VwoMloKTpcBoKThbCgyXgtOlwHgpNF+KsIApQhOmCIuYIobzHMFAR7T+
YjFThOZMERY0RWjSFGFRU4RmTREWNkVo2hRhcVOE5k0RFjhFaOIUYZFThGZOERY6RWjqFGGxU4Tm
ThEWPEUxnKgMRiqj9RcLnyI0fYqw+ClC86cIC6AiNIGKsAgqQjOoCAuhIjSFirAYKkJzqAgLoiI0
iYqwKCpCs6gIC6MiNI2KsDgqmsPfNAA/aoDWXyySitBMKsJCqQhNpSIslorQXCrCgqkITaYiLJqK
0GwqwsKpCE2nIiyeitB8KsICqghNqCIsoorQjCrCQqpoAX9VCPysEFp/saAqQpOqCIuqIjSrirCw
KkLTqgiLqyI0r4qwwCpCE6sIi6wiNLOKsNAqQlOrCIutIjS3irDgKkKTqwiLrqIE/q4f+GE/tP5i
8VWE5lcRFmBFaIIVYRFWhGZYERZiRWiKFWExVoTmWBEWZEVokhVhUVaEZlkRFmZFaJoVYXFWhOZZ
ERZoRUv4y7rgp3XR+ouFWhGaakVYrBWhuVaEBVsRmmxFWLQVodlWhIVbEZpuRVi8FaH5VoQFXBGa
cEVYxBWhGVeEhVwRmnJFWMwVreBv24Mft0frLxZ1RWjWFWFhV4SmXREWd0Vo3hVhgVeEJl4RFnlF
aOYVYaFXhKZeERZ7RWjuFWHBV4QmXxEWfUVo9hVh4VeEpl8RFn9FaP4VY/lXjOZfMZZ/xWj+FWP5
V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8x
ln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+
FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM
5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/
xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj
+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZf
MZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo
/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lX
jOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGW
f8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4V
Y/lXjOZfMZZ/xWj+FWP5V4zmXzGWf8Vo/hVj+VeM5l8xln/FaP4VY/lXjOZfMZZ/xWj+FWP5V4zm
XzGWfwX5/KE0f7tIiyLaFFlaN9oW+KSFZvqfP7bPDFt2QpadsGVnZNkZW/YYWfYYW/Y5suxzbNkX
yLIvsGVPkGVPsGVfIsu+xJZ9hSz7Clv2NbLsa7A2QYWV0MqKlVawthJUXAmsrgSVVwLrK0EFlsAK
S1CJJbDGElRkCayyBJVZAussQYWWwEpLUKklsNYyVGsZrLUM1VpGr2OxC1mw1jJUaxmstQzVWgZr
LUO1lsFay1CtZbDWMlRrGay1DNVaBmstQ7WWwVobQ7U2BmttDNXaGKy1MVRrY/SuMXbbGKy1MVRr
Y7DWxlCtjcFaG0O1NgZrbQzV2histTFUa2Ow1sZQrY3BWjuHau0crLVzqNbOwVo7h2rtHKy1c6jW
ztFntNhDWrDWzqFaOwdr7RyqtXOw1s6hWjsHa+0cqrVzsNbOoVo7B2vtAqq1C7DWLqBauwBr7QKq
tQuw1i6gWrsAa+0CqrULdEYUNiUKrLULqNYuwFq7gGrtAqy1C6jWLsBau4Bq7QKstQlUaxOw1iZQ
rU3AWptAtTYBa20C1doErLUJVGsTsNYmUK1N0PnH2ARksNYmUK1NwFqbQLU2AWttAtXaBKy1S6jW
LsFau4Rq7RKstUuo1i7BWruEau0SrLVLqNYuwVq7hGrtEqy1S6jWLtG3fbDXfcBau4Rq7RKstUuo
1i7BWruCau0KrLUrqNauwFq7gmrtCqy1K6jWrsBau4Jq7QqstSuo1q7AWruCau0KrLUrqNau0Hdr
sZdrwVq7gmrtCqy1a6jWrsFau4Zq7RqstWuo1q7BWruGau0arLVrqNauwVq7hmrtGqy1a6jWrsFa
u4Zq7RqstWuo1q7RJAssygLOsgDDLNA0ixkWZzFD8yxmWKDFDE20mGGRFjM002KGhVrM0FSLGRZr
MUNzLWZYsMUMTbaYYdEWMzTbYoaFW8zQdIsZFm8xQ+svGCaFp0mBcVJo/QUDpeBEKTBSCs6UAkOl
4FQpMFYKzpUCg6XgZCkwWgrOlgLDpeB0KTBeCs2XIixgitCEKcIipojhPEcw0BGtv1jMFKE5U4QF
TRGaNEVY1BShWVOEhU0RmjZFWNwUoXlThAVOEZo4RVjkFKGZU4SFThGaOkVY7BShuVOEBU9RDCcq
g5HKaP3FwqcITZ8iLH6K0PwpwgKoCE2gIiyCitAMKsJCqAhNoSIshorQHCrCgqgITaIiLIqK0Cwq
wsKoCE2jIiyOiubwNw3Ajxqg9ReLpCI0k4qwUCpCU6kIi6UiNJeKsGAqQpOpCIumIjSbirBwKkLT
qQiLpyI0n4qwgCpCE6oIi6giNKOKsJAqWsBfFQI/K4TWXyyoitCkKsKiqgjNqiIsrIrQtCrC4qoI
zasiLLCK0MQqwiKrCM2sIiy0itDUKsJiqwjNrSIsuIrQ5CrCoqsogb/rB37YD62/WHwVoflVhAVY
EZpgRViEFaEZVoSFWBGaYkVYjBWhOVaEBVkRmmRFWJQVoVlWhIVZEZpmRVicFaF5VoQFWtES/rIu
+GldtP5ioVaEploRFmtFaK4VYcFWhCZbERZtRWi2FWHhVoSmWxEWb0VovhVhAVeEJlwRFnFFaMYV
YSFXhKZcERZzRSv42/bgx+3R+otFXRGadUVY2BWhaVeExV0RmndFWOAVoYlXhEVeEZp5RVjoFaGp
V4TFXhGae0VY8BWhyVeERV8Rmn1FWPgVoelXhMVfEZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8x
mn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+
FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM
5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/
xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj
+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVf
MZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY
/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lX
jOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGa
f8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4V
o/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zl
XzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V9BPn8o
zd8u0qKINkWW1o22hfikhWb6nz+2zwxbdkKWnbBlZ2TZGVv2GFn2GFv2ObLsc2zZF8iyL7BlT5Bl
T7BlXyLLvsSWfYUs+wpb9jWy7GuwNkGFldDKipVWsLYSVFwJrK4ElVcC6ytBBZbACktQiSWwxhJU
ZAmssgSVWQLrLEGFlsBKS1CpJbDWMlRrGay1DNVaRq9jsQtZsNYyVGsZrLUM1VoGay1DtZbBWstQ
rWWw1jJUaxmstQzVWgZrLUO1lsFaG0O1NgZrbQzV2histTFUa2P0rjF22xistTFUa2Ow1sZQrY3B
WhtDtTYGa20M1doYrLUxVGtjsNbGUK2NwVo7h2rtHKy1c6jWzsFaO4dq7RystXOo1s7RZ7TYQ1qw
1s6hWjsHa+0cqrVzsNbOoVo7B2vtHKq1c7DWzqFaOwdr7QKqtQuw1i6gWrsAa+0CqrULsNYuoFq7
AGvtAqq1C3RGFDYlCqy1C6jWLsBau4Bq7QKstQuo1i7AWruAau0CrLUJVGsTsNYmUK1NwFqbQLU2
AWttAtXaBKy1CVRrE7DWJlCtTdD5x9gEZLDWJlCtTcBam0C1NgFrbQLV2gSstUuo1i7BWruEau0S
rLVLqNYuwVq7hGrtEqy1S6jWLsFau4Rq7RKstUuo1i7Rt32w133AWruEau0SrLVLqNYuwVq7gmrt
Cqy1K6jWrsBau4Jq7QqstSuo1q7AWruCau0KrLUrqNauwFq7gmrtCqy1K6jWrtB3a7GXa8Fau4Jq
7QqstWuo1q7BWruGau0arLVrqNauwVq7hmrtGqy1a6jWrsFau4Zq7RqstWuo1q7BWruGau0arLVr
qNau0SQLLMoCzrIAwyzQNIsZFmcxQ/MsZligxQxNtJhhkRYzNNNihoVazNBUixkWazFDcy1mWLDF
DE22mGHRFjM022KGhVvM0HSLGRZvMUPrLxgmhadJgXFSaP0FA6XgRCkwUgrOlAJDpeBUKTBWCs6V
AoOl4GQpMFoKzpYCw6XgdCkwXgrNlyIsYIrQhCnCIqaI4TxHMNARrb9YzBShOVOEBU0RmjRFWNQU
oVlThIVNEZo2RVjcFKF5U4QFThGaOEVY5BShmVOEhU4RmjpFWOwUoblThAVPUQwnKoORymj9xcKn
CE2fIix+itD8KcICqAhNoCIsgorQDCrCQqgITaEiLIaK0BwqwoKoCE2iIiyKitAsKsLCqAhNoyIs
jorm8DcNwI8aoPUXi6QiNJOKsFAqQlOpCIulIjSXirBgKkKTqQiLpiI0m4qwcCpC06kIi6ciNJ+K
sIAqQhOqCIuoIjSjirCQKlrAXxUCPyuE1l8sqIrQpCrCoqoIzaoiLKyK0LQqwuKqCM2rIiywitDE
KsIiqwjNrCIstIrQ1CrCYqsIza0iLLiK0OQqwqKrKIG/6wd+2A+tv1h8FaH5VYQFWBGaYEVYhBWh
GVaEhVgRmmJFWIwVoTlWhAVZEZpkRViUFaFZVoSFWRGaZkVYnBWheVaEBVrREv6yLvhpXbT+YqFW
hKZaERZrRWiuFWHBVoQmWxEWbUVothVh4VaEplsRFm9FaL4VYQFXhCZcERZxRWjGFWEhV4SmXBEW
c0Ur+Nv24Mft0fqLRV0RmnVFWNgVoWlXhMVdEZp3RVjgFaGJV4RFXhGaeUVY6BWhqVeExV4RmntF
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
o/lXjOVfMZp/xVj+FaP5V4zlXzGaf8VY/hWj+VeM5V8xmn/FWP4Vo/lXjOVfQT5/KM3fLtKiiDZF
ltaNtoXFSQvN9D9/bJ8ZtuyELDthy87IsjO27DGy7DG27HNk2efYsi+QZV9gy54gy55gy75Eln2J
LfsKWfYVtuxrZNnXYG2CCiuhlRUrrWBtJai4ElhdCSqvBNZXggosgRWWoBJLYI0lqMgSWGUJKrME
1lmCCi2BlZagUktgrWWo1jJYaxmqtYxex2IXsmCtZajWMlhrGaq1DNZahmotg7WWoVrLYK1lqNYy
WGsZqrUM1lqGai2DtTaGam0M1toYqrUxWGtjqNbG6F1j7LYxWGtjqNbGYK2NoVobg7U2hmptDNba
GKq1MVhrY6jWxmCtjaFaG4O1dg7V2jlYa+dQrZ2DtXYO1do5WGvnUK2do89osYe0YK2dQ7V2Dtba
OVRr52CtnUO1dg7W2jlUa+dgrZ1DtXYO1toFVGsXYK1dQLV2AdbaBVRrF2CtXUC1dgHW2gVUaxfo
jChsShRYaxdQrV2AtXYB1doFWGsXUK1dgLV2AdXaBVhrE6jWJmCtTaBam4C1NoFqbQLW2gSqtQlY
axOo1iZgrU2gWpug84+xCchgrU2gWpuAtTaBam0C1toEqrUJWGuXUK1dgrV2CdXaJVhrl1CtXYK1
dgnV2iVYa5dQrV2CtXYJ1dolWGuXUK1dom/7YK/7gLV2CdXaJVhrl1CtXYK1dgXV2hVYa1dQrV2B
tXYF1doVWGtXUK1dgbV2BdXaFVhrV1CtXYG1dgXV2hVYa1dQrV2h79ZiL9eCtXYF1doVWGvXUK1d
g7V2DdXaNVhr11CtXYO1dg3V2jVYa9dQrV2DtXYN1do1WGvXUK1dg7V2DdXaNVhr11CtXaNJFliU
BZxlAYZZoGkWMyzOYobmWcywQIsZmmgxwyItZmimxQwLtZihqRYzLNZihuZazLBgixmabDHDoi1m
aLbFDAu3mKHpFjMs3mKG1l8wTApPkwLjpND6CwZKwYlSYKQUnCkFhkrBqVJgrBScKwUGS8HJUmC0
FJwtBYZLwelSYLwUmi9FWMAUoQlThEVMEcN5jmCgI1p/sZgpQnOmCAuaIjRpirCoKUKzpggLmyI0
bYqwuClC86YIC5wiNHGKsMgpQjOnCAudIjR1irDYKUJzpwgLnqIYTlQGI5XR+ouFTxGaPkVY/BSh
+VOEBVARmkBFWAQVoRlUhIVQEZpCRVgMFaE5VIQFURGaREVYFBWhWVSEhVERmkZFWBwVzeFvGoAf
NUDrLxZJRWgmFWGhVISmUhEWS0VoLhVhwVSEJlMRFk1FaDYVYeFUhKZTERZPRWg+FWEBVYQmVBEW
UUVoRhVhIVW0gL8qBH5WCK2/WFAVoUlVhEVVEZpVRVhYFaFpVYTFVRGaV0VYYBWhiVWERVYRmllF
WGgVoalVhMVWEZpbRVhwFaHJVYRFV1ECf9cP/LAfWn+x+CpC86sIC7AiNMGKsAgrQjOsCAuxIjTF
irAYK0JzrAgLsiI0yYqwKCtCs6wIC7MiNM2KsDgrQvOsCAu0oiX8ZV3w07po/cVCrQhNtSIs1orQ
XCvCgq0ITbYiLNqK0GwrwsKtCE23IizeitB8K8ICrghNuCIs4orQjCvCQq4ITbkiLOaKVvC37cGP
26P1F4u6IjTrirCwK0LTrgiLuyI074qwwCtCE68Ii7wiNPOKsNArQlOvCIu9IjT3irDgK0KTrwiL
viI0+4qw8CtC068Ii78iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+K
sfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bz
rxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79i
NP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8
K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Y
y79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/
irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG
868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/
YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx
/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOv
GMu/YjT/irH8K0bzrxjLv2I0/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv2I0
/4qx/CtG868Yy79iNP+KsfwrRvOvGMu/YjT/irH8K0bzrxjLv4J8/lCav12kRRFtiiytGx0L7utV
mUV11uZ1FuXN0ZKmic1NWl5n0fss2zdRkX/IImOkAViQz0bNof4gNtrbyldsl5UtzJxvu6qM2htj
9Cavt4oDoLotr+t0m0V88T/JDLG96f3sn6/SosleDBvUjvAAdq+K9LoZy+6xN/08GLfaD81nH7L6
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
0sSRUY/jBHo0CafTdBJF8WninurJaQCjk/phEERhHD4l8ym7DKcxmLgKAz+eRv7kJHFHWxjCME/B
dhIFdgRy1VOrev2F8ReP7wgmXdHD25btivaqqfEW0v7xxvKO6snzvJjbbukcUN7o23b7SyocV26C
wu0N7hU+ZWdrL27qTM/WpW7u6N5U7+9yBm0gmZwBJdTzXi/IrfFdeSryuWqgy+684qqymyiIjZ1I
KtxlpvhOp3EFU0T7C+vuop5fNLhf611X9aztt6exo9gg8tq+3JrVZalXWPtT90VgVFeoVp7b3bSW
Zq8ux62TdVPZJ2MXZLeW3+hybVxu0S1g7Bd1mX/wqsC7DryV/z6gMuZetPf77/6JXnxuborMFqTc
sglnafhmq5Sn6RvxLI1/wnRSXtNJOU0nZTSdlNd0UlbTSQVMJ3jvc5oOmfh9pkMtnKXh+02HXjxL
4w+bjuIlLMVJWIqRsBQvYSlWwlIihKV4CUtxEpZiJCzFS1iKlbCUCGEpXsJSnISlGAlL8RKWYiUs
JUNYPjNj+ayU5XNyls9MWj4va/kytOUz85bPSlw+J3P5zNTl83KXL0NePjN7+az05XPyl89MYD4v
g/kiFMbMYKwExslfzPTFy14y5MXMXazUxclczMTFy1sytMXMWqykxclZzJTFy1gyhPW2q/W2q/W2
q/W2q/W2q/W2q/Xl72qlvISVchJWykhYKS9hpayElYoQVspLWCknYaWMhJXyElbKSlipCGGlvISV
chJWykhYKS9hpayElUoRluIlLMVJWIqRsBQvYSlWwlIihKV4CUtxEpZiJCzFS1iKlbCUCGEpXsJS
nISlGAlL8RKWYiUsJUNYPjNj+ayU5XNyls9MWj4va/kytOUz85bPSlw+J3P5zNTl83KXL0NePjN7
+az05XPyl89MYD4vg/kiFJbwMljCSWAJI38lvPSVsLJXIkJeCS93JZzUlTAyV8JLXAkrbyUitJXw
slbCSVoJI2clvJSVsDJWIkJYKS9hpZyElTISVspLWCkrYaUihJXyElbKSVgpI2GlvISVshJWKkJY
KS9hpZyElTISVspLWCkrYaX8hBXxlmFEnGUYEWMZRsRbhhGxlmFEImUYEW8ZRsRZhhExlmFEvGUY
EWsZRiRShhHxlmFEnGUYEWMZRsRbhhGxlmFEImUYEW8ZRsRZhhExlmFEvGUYEWsZRiRShhHxlmFE
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
nNfwHM+5avyKp/xneS7nNTygdK4aP+GLvopknJEM6Kg3Mr/JxA52qn0yQL9aQxHYB5J9u4sf+9Xa
itRm0AjPnwk14PWGGckdobGekZNsxau1JMltoZFe4xNsxOtNkCX2hqRfM5RAf9UWI5z9jLNDxNaA
12w657dLdO4PeJ6jtq89eJ/hVtGreHX1bFV+3QsCZ7lf9Cqeyj1blR855MNHgbn8kQfngTs+BOHc
LuLGOv0dZ/bNoldhIyw7Rexgz7cSvn2iV2EmfJtEMojPNxjmLaLXEVx494cEYV8QcAR2h16FEfFu
DcmhPt+EBDaGXkcezLMrJAD3gmyYcU/o1RiLbKYjtR8kg/9qreYc9oLOUL0X+cPZ7AS9ppB9FttA
56rji2npfDaBXs+U/0x2gM5VxxcuZpzx/k8o5IuhhC+Ggvs/4Wj7P6H0/s952ojE/k843v5PKL7/
c55mIrb/E468/xOOs/9zpsFFdP8n/BL2f8IR93/O04hE93/CL2D/Jxxv/+dM82CR/Z9wzP2fcIT9
n/M1FtlMZ6T9n3Cc/Z+ztZoz3P8JX9P+T/gK9n/OOmSf4/5P+Or2f8LXsv9zxlP+89z/CV/d/k/4
as7/8N3fyIX0xH4s77tB/Gin71EKvB30iqxF5DyQ6BtCAuCv2WDkTgbJvyYk1YJXHXBkzwiN9K6Q
aDNesznJnhYa54UhyVa86sxZ5tyQ8FtDIvCv3WykM6KxzhCJvTv0uuznHM8Snfn7Q2ep7lsYP89T
Ra/hJaLz1fnVLxec6fmi1/Am0fnq/KRXMl77yAb1hF8yv00kAHe6pUq8T/S6TEZkr0n2nSIJ9Fdu
NXIbTiO8WCTWhNceemR3ncZ6u0i2Ha/cpmS3nkZ6xUi0Ga89pZbZf5J+z0gG/812lHiWNNYulNzb
Rq/OiM5xJ+rc3zg6T33ffPFst6NexWtHZ6z022LC2e5JvYp3j75ipfs//Wn48DdLo9t1Y5am6lr8
+L//zd886J9tj9SrrlgWf9FdUVcXqPAFenK7Qd6H2osZuvibojNLC/THJ7q/rozXrCvo/VWpMzA1
a3blnVd0rVffVl670hXNSOsq97qF6SMEdMdNcWNaGtndbY1qtJ5ujGc1yb2i8ur5vDWdB91nmnfe
7UJ35gZszP6MbbmDzzfQCvgskY62M7MaUIrqyqp7u6hL42WLdXXtlUaDyl5Vdwv863puP2GWM5Pn
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
eaKY+JqA4bakzW3adZXRX0ZwSIlARImAVwklooTiVSIUUSLkVSISUSLiVWIiosSEV4lYRImYV4lE
RImEV4lURImUV4mpiBJTZrKToeyAm7OFSJuZtQMZ2g6YeTuQIe6AmbkDGeoOmLk7kCHvgJm9Axn6
Dpj5O5Ah8ICZwQMZCg+YOTyQIfGAmcWVDIsrZhZXMiyuuOfeQpNvZhZXMiyumFlcybC4YmZxJcPi
ipnFlQyLK2YWVzIsrphZXMmwuGJmcSXD4oqZxUMZFg+ZWTyUYfGQmcVDGRYPudfQhRbRmVk8lGHx
kJnFQxkWD5lZPJRh8ZCZxUMZFg+ZWTyUYfGQmcVDGRYPmVk8kmHxiJnFIxkWj5hZPJJh8YiZxSMZ
Fo+498KFNsOZWTySYfGImcUjGRaPmFk8kmHxiJnFIxkWj5hZPJJh8YiZxScyLD5hZvGJDItPmFl8
IsPiE2YWn8iw+ISZxScyLD7hrmkTKmpjZvGJDItPmFl8IsPiE2YWn8iw+ISZxScyLD5hZvFYhsVj
ZhaPZVg8ZmbxWIbFY2YWj2VYPGZm8ViGxWNmFo9lWDzmrk0XKk5nZvFYhsVjZhaPZVg8ZmbxWIbF
Y2YWT2RYPGFm8USGxRNmFk9kWDxhZvFEhsUTZhZPZFg8YWbxRIbFE2YWT2RYPOE+YyZ0yIyZxRMZ
Fk+YWTyRYfGEmcVTGRZPmVk8lWHxlJnFUxkWT5lZPJVh8ZSZxVMZFk+ZWTyVYfGUmcVTGRZPmVk8
lWHxlPusuNBhcWYWT2VYPGVm8akMi0+ZWXwqw+JTZhafyrD4lJnFpzIsPmVm8akMi0+ZWXwqw+JT
ZhafyrD4lJnFpzIsPmVm8akMi0+573wRuvSF/dYXqWtfuO998YUufvG5b37xha5+8bnvfvGFLn/x
uW9/8YWuf/G573/xhS6A8blvgPGFroDxue+A8YUugfG5b4Hxha6B8bnvgfGFLoLxuZld6kI3/hvd
pK5042Z2qUvd2G91k7rWjf1eN6mL3dhvdpO62o39bjepy93Yb3eTut6N/X43qQve2G94k7rijfuO
t0DokreA+5a3QOiat0Cx39YqdV0rN7MLXfUWcN/1Fghd9hZw3/YWCF33FnDf9xYIXfgWcN/4Fghd
+RZw3/kWCF36FnDf+hYIXfsWcN/7Fghd/BZw3/wWCF39FnDf/RYIXf4WhOw3sUtdxc7N7EIXwAXc
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
````

### product-selection-checks-v1/3.stderr

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### product-selection-checks-v1/3.stdout

Original bytes: 649. SHA-256: `db062fdf37786d7e000fb96605c6e362015ba432a8454d316e7eea32c50f4099`.

Normalized bytes: 649. SHA-256: `db062fdf37786d7e000fb96605c6e362015ba432a8454d316e7eea32c50f4099`.

````text
PASS: session model verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=true
PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
PASS: context overflow preserves messages and refuses instead of silently trimming history
````

### product-selection-checks-v1/receipt.json

Original bytes: 921. SHA-256: `f5e287d184d6cf47add32cf2b51d8e9aedcb148d6ce7086d095a4933968a829a`.

Normalized bytes: 921. SHA-256: `f5e287d184d6cf47add32cf2b51d8e9aedcb148d6ce7086d095a4933968a829a`.

````text
[
  {
    "command": [
      ".build/release/slotstream",
      "model-packs",
      "--json"
    ],
    "binary_sha256": "e066b7a195ef50d8138062c5c24431af68c621a23b14f20b3e579b117d0a5b31",
    "returncode": 0
  },
  {
    "command": [
      ".build/release/slotstream",
      "model-packs",
      "--selection",
      "vq-3.2"
    ],
    "binary_sha256": "e066b7a195ef50d8138062c5c24431af68c621a23b14f20b3e579b117d0a5b31",
    "returncode": 1
  },
  {
    "command": [
      ".build/release/slotstream-checks",
      "--tier",
      "t0",
      "--tier",
      "t1",
      "--json"
    ],
    "binary_sha256": "3485de4cc498894edf5ffe2b010232461502921817bc94d0b2c41d0c903fe24e",
    "returncode": 0
  },
  {
    "command": [
      "apps/macos/.build/release/sevra-mac-checks",
      "--performance"
    ],
    "binary_sha256": "29fe280aae94cd1aed9aae4aec66137c62bf7fed908323a154de03a284809d53",
    "returncode": 0
  }
]
````

### product-selection-cli-v1/0.stderr

Original bytes: 137. SHA-256: `65b75bfaf75ccf5b3b9eb8cda676f75aadebaece032926b92cc68e83abc04941`.

Normalized bytes: 137. SHA-256: `65b75bfaf75ccf5b3b9eb8cda676f75aadebaece032926b92cc68e83abc04941`.

````text
Error: The selected model pack is unavailable in this build. Choose Automatic or a supported pack. Your saved choice has been preserved.
````

### product-selection-cli-v1/0.stdout

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### product-selection-cli-v1/1.stderr

Original bytes: 136. SHA-256: `7d4b4a1e0b8fbf5c7ef2a0a6da7fe95f1ccc3c76af479b114e6ec8429acc8c3f`.

Normalized bytes: 136. SHA-256: `7d4b4a1e0b8fbf5c7ef2a0a6da7fe95f1ccc3c76af479b114e6ec8429acc8c3f`.

````text
Error: this directory does not contain the selected verified pack; use slotstream pull with an explicit destination before selecting it
````

### product-selection-cli-v1/1.stdout

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### product-selection-cli-v1/2.stderr

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### product-selection-cli-v1/2.stdout

Original bytes: 5404. SHA-256: `33bfc6fc74750f16d48e6b0fefb9b82089c8078d93bf8bb743a5ee9b9575a064`.

Normalized bytes: 5404. SHA-256: `33bfc6fc74750f16d48e6b0fefb9b82089c8078d93bf8bb743a5ee9b9575a064`.

````text
{
  "automatic_context_window" : {
    "candidate_windows" : [
      32768,
      65536,
      131072,
      262144
    ],
    "candidates" : [
      {
        "accepted" : true,
        "decode_lookahead" : true,
        "est_prefill_s_at_window" : 385.50588235294038,
        "expected_peak_gb" : 8.998410496,
        "experts_per_layer_cached" : 17.104166666666668,
        "mtp" : false,
        "prefill_chunk" : 256,
        "prefix_cache_max_tokens" : 11831,
        "reason" : "default window",
        "relative_request_cost" : 0,
        "request_cost_calibrated" : true,
        "request_seconds" : 140.45998423730026,
        "target_gb" : 10,
        "window" : 32768
      },
      {
        "accepted" : false,
        "reason" : "does not fit with one complete conversation retained",
        "refusal" : "insufficient_memory: context, resident components, minimum pool and prefill workspace exceed the total-memory target",
        "request_cost_calibrated" : false,
        "window" : 65536
      },
      {
        "accepted" : false,
        "reason" : "does not fit with one complete conversation retained",
        "refusal" : "insufficient_memory: context, resident components, minimum pool and prefill workspace exceed the total-memory target",
        "request_cost_calibrated" : false,
        "window" : 131072
      },
      {
        "accepted" : false,
        "reason" : "does not fit with one complete conversation retained",
        "refusal" : "insufficient_memory: context, resident components, minimum pool and prefill workspace exceed the total-memory target",
        "request_cost_calibrated" : false,
        "window" : 262144
      }
    ],
    "representative_request" : {
      "prompt_tokens" : 2000,
      "reply_tokens" : 400
    },
    "request_time_tolerance" : 0.10000000000000001,
    "tier_inputs" : "RAM, Metal working set and memory knobs; current availability can only lower the window at startup",
    "window" : 32768
  },
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "memory_or_required_components",
    "maximum_feasible_window" : 70656,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1953497088,
      "additional_active_bytes" : 1047527424,
      "expected_peak_bytes" : 9997534464,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 1047527424,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 160468992,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 640,
    "maximum_prefill_chunk" : 256,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 8998410496,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 428867584,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 2269900800,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 327103488,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "context_window_source" : "automatic",
  "decode_estimate_cache_in_measured_range" : true,
  "decode_lookahead" : true,
  "device_available_gb" : 15,
  "device_ram_gb" : 16,
  "device_working_set_gb" : 12,
  "est_prefill_s_at_max_context" : 385.50588235294038,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 3.4208333333333338,
  "expected_peak_gb" : 9,
  "expected_peak_semantics" : "planned_full_workload_envelope_not_measured_usage",
  "experts_per_layer_cached" : 17,
  "fully_resident" : false,
  "implementation_context_limit" : 262144,
  "lookahead_reserve_bytes" : 428867584,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 905969664,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 8998410496,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "lookahead_reserve_bytes" : 428867584,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 2269900800,
    "prefill_bytes" : 332800000,
    "retained_capacity_bytes" : 327103488,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "memory_target_semantics" : "process_budget_not_allocation_goal",
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 262144,
  "mtp_streamed_experts" : false,
  "non_cache_allowance_bytes" : 6728509696,
  "planned_headroom_gb" : 1,
  "pool_gb" : 2.2999999999999998,
  "pool_slots" : 821,
  "prefill_chunk" : 256,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 11831,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 10,
  "vision" : false,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0,
  "vision_resident_reserved" : false
}
````

### product-selection-cli-v1/receipt.json

Original bytes: 964. SHA-256: `ecc1e8758f6243577c096adc6947c4e458d1bd482a0a919b44eb2bf4f009e554`.

Normalized bytes: 964. SHA-256: `ecc1e8758f6243577c096adc6947c4e458d1bd482a0a919b44eb2bf4f009e554`.

````text
{
  "passed": true,
  "custom_directory_unchanged": true,
  "binary_sha256": "e066b7a195ef50d8138062c5c24431af68c621a23b14f20b3e579b117d0a5b31",
  "runs": [
    {
      "command": [
        ".build/release/slotstream",
        "run",
        "--quantization",
        "vq-3.2",
        "--prompt",
        "Hi"
      ],
      "exit_code": 1
    },
    {
      "command": [
        ".build/release/slotstream",
        "run",
        "--quantization",
        "auto",
        "--model",
        "/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/pack-selection-_cfff086",
        "--prompt",
        "Hi"
      ],
      "exit_code": 1
    },
    {
      "command": [
        ".build/release/slotstream",
        "doctor",
        "--quantization",
        "auto",
        "--sim-ram",
        "16",
        "--sim-available",
        "15",
        "--vision",
        "off",
        "--mtp",
        "off",
        "--json"
      ],
      "exit_code": 0
    }
  ]
}
````

### product-selection-models-v1/app-reload/stderr.txt

Original bytes: 540. SHA-256: `eb7c97f5cd7ec57a5f2e10e033ad3e2a14ed5860911955e7bf09e398eeaed0e6`.

Normalized bytes: 540. SHA-256: `eb7c97f5cd7ec57a5f2e10e033ad3e2a14ed5860911955e7bf09e398eeaed0e6`.

````text
[expert-lookahead] corrected attention forecast: measured correction 37b00d3a32d1e188 at lookahead/tap-correction-attention-rank128-v1.safetensors
engine ready in 0.8s: expert cache ~17/512 per layer (821 global slots = 2.3 GB), eos [248044, 248046]
elastic: on — cache auto-resizes with memory availability between requests (--no-elastic to pin)
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
elastic: fixed cache capacity; pressure cancellation and admission checks remain active
````

### product-selection-models-v1/app-reload/stdout.txt

Original bytes: 675. SHA-256: `15c4de456debbbb2a0da6545bc10a66138d8142a4347fd2930a2779339c4c4be`.

Normalized bytes: 675. SHA-256: `15c4de456debbbb2a0da6545bc10a66138d8142a4347fd2930a2779339c4c4be`.

````text
REAL_TURN cold seconds=12.332637458341196 status=completed
REAL_TURN warm-change seconds=6.874777999997605 status=completed
REAL_TURN reloaded seconds=6.138890291680582 status=completed
REAL_MEMORY peak_sampled_gb=6.62205732 released_gb=0.549816168 maximum_metadata_seconds=0.0008527916797902435
GLOBAL_VM before=Optional(Slotstream.ProcessMemory.VMActivity(swapins: 52, swapouts: 2908, reclaimableBytes: 34736537600)) after=Optional(Slotstream.ProcessMemory.VMActivity(swapins: 52, swapouts: 2908, reclaimableBytes: 32287703040))
PASS: real lazy load, warm follow-up, deferred custom change, drained release/reload, lower ceiling, automatic idle release and preserved draft
````

### product-selection-models-v1/governor-fixed-draft/stderr.txt

Original bytes: 243. SHA-256: `bb59a17aad95328e86808bfaa53dbf85836a8d976233930757d051ed7685d2e5`.

Normalized bytes: 243. SHA-256: `bb59a17aad95328e86808bfaa53dbf85836a8d976233930757d051ed7685d2e5`.

````text
engine ready in 0.6s: expert cache ~17/512 per layer (834 global slots = 2.3 GB), mtp draft head on, eos [248044, 248046]
elastic: memory pressure (critical) — cache ~17 → ~13 experts/layer (2.3 → 1.8 GB pool, cold — refills from SSD)
````

### product-selection-models-v1/governor-fixed-draft/stdout.txt

Original bytes: 10310. SHA-256: `d5f63832f006925e80fdfaeba307b4b235943d0e58321ee7a23f40af860c8cc0`.

Normalized bytes: 10310. SHA-256: `d5f63832f006925e80fdfaeba307b4b235943d0e58321ee7a23f40af860c8cc0`.

````text
{
  "items" : [
    {
      "name" : "baseline delivers the bounded output",
      "passed" : true
    },
    {
      "name" : "explicit plans never receive a pressure cancellation",
      "passed" : true
    },
    {
      "name" : "explicit plans never donate capacity",
      "passed" : true
    },
    {
      "name" : "busy polling skips resizing",
      "passed" : true
    },
    {
      "name" : "queued request observes pending pressure before work",
      "passed" : true
    },
    {
      "name" : "queued refusal reports a runtime error",
      "passed" : true
    },
    {
      "name" : "queued refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "queued refusal takes no retained state",
      "passed" : true
    },
    {
      "name" : "queued pressure has an explicit image refusal",
      "passed" : true
    },
    {
      "name" : "queued pressure never loads the tower",
      "passed" : true
    },
    {
      "name" : "fixed: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "fixed: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "fixed: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "fixed: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "fixed: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "fixed: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "decode emits a coherent prefix before cancellation",
      "passed" : true
    },
    {
      "name" : "fixed: pressure respects selected cache management",
      "passed" : true
    },
    {
      "name" : "fixed: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "fixed: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "fixed: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "fixed: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "fixed: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "fixed: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "fixed: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "fixed: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "fixed: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "scope: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "scope: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "scope: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "scope: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "scope: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "scope: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "cancelled scope retains only its prior commit",
      "passed" : true
    },
    {
      "name" : "scope cancellation actually interrupts a read scope",
      "passed" : true
    },
    {
      "name" : "scope cancellation emits no token",
      "passed" : true
    },
    {
      "name" : "scope: pressure respects selected cache management",
      "passed" : true
    },
    {
      "name" : "scope: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "scope: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "scope: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "scope: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "scope: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "scope: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "scope: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "scope: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "scope: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "prefill: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "prefill: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "prefill: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "prefill: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "prefill: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "prefill: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "prefill stops at one complete chronological pass",
      "passed" : true
    },
    {
      "name" : "prefill cancellation emits no token",
      "passed" : true
    },
    {
      "name" : "prefill: pressure respects selected cache management",
      "passed" : true
    },
    {
      "name" : "prefill: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "prefill: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "prefill: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "prefill: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "prefill: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "prefill: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "prefill: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "prefill: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "prefill: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "decode: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "decode: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "decode: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "decode: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "decode: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "decode: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "decode emits a coherent prefix before cancellation",
      "passed" : true
    },
    {
      "name" : "decode: pressure respects selected cache management",
      "passed" : true
    },
    {
      "name" : "decode: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "decode: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "decode: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "decode: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "decode: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "decode: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "decode: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "decode: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "decode: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "nonstream: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "nonstream: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "nonstream: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "nonstream: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "nonstream: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "nonstream: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "decode emits a coherent prefix before cancellation",
      "passed" : true
    },
    {
      "name" : "nonstream: pressure respects selected cache management",
      "passed" : true
    },
    {
      "name" : "nonstream: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "nonstream: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "nonstream: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "nonstream: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "nonstream: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "nonstream: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "nonstream: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "nonstream: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "nonstream: retry is not spuriously cancelled",
      "passed" : true
    }
  ],
  "measurements" : {
    "decode.pressure_to_boundary_seconds" : 5.208e-06,
    "fixed.pressure_to_boundary_seconds" : 5.458e-06,
    "nonstream.pressure_to_boundary_seconds" : 0.000110958,
    "prefill.pressure_to_boundary_seconds" : 0.001156833,
    "scope.pressure_to_boundary_seconds" : 0.046799375
  },
  "name" : "optimization-governor-boundary-mtp",
  "passed" : true
}
````

### product-selection-models-v1/governor-fixed-plain/stderr.txt

Original bytes: 371. SHA-256: `96b031790459da5f22984d6fb5afa74b7adb0c8b17a1a395d1b15393f6395234`.

Normalized bytes: 371. SHA-256: `96b031790459da5f22984d6fb5afa74b7adb0c8b17a1a395d1b15393f6395234`.

````text
[expert-lookahead] corrected attention forecast: measured correction 37b00d3a32d1e188 at lookahead/tap-correction-attention-rank128-v1.safetensors
engine ready in 0.8s: expert cache ~17/512 per layer (833 global slots = 2.3 GB), eos [248044, 248046]
elastic: memory pressure (critical) — cache ~17 → ~13 experts/layer (2.3 → 1.8 GB pool, cold — refills from SSD)
````

### product-selection-models-v1/governor-fixed-plain/stdout.txt

Original bytes: 10312. SHA-256: `10747f5413b958bd72e41cdeb0c75de027e7860508d78871cdf7315a56e41c08`.

Normalized bytes: 10312. SHA-256: `10747f5413b958bd72e41cdeb0c75de027e7860508d78871cdf7315a56e41c08`.

````text
{
  "items" : [
    {
      "name" : "baseline delivers the bounded output",
      "passed" : true
    },
    {
      "name" : "explicit plans never receive a pressure cancellation",
      "passed" : true
    },
    {
      "name" : "explicit plans never donate capacity",
      "passed" : true
    },
    {
      "name" : "busy polling skips resizing",
      "passed" : true
    },
    {
      "name" : "queued request observes pending pressure before work",
      "passed" : true
    },
    {
      "name" : "queued refusal reports a runtime error",
      "passed" : true
    },
    {
      "name" : "queued refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "queued refusal takes no retained state",
      "passed" : true
    },
    {
      "name" : "queued pressure has an explicit image refusal",
      "passed" : true
    },
    {
      "name" : "queued pressure never loads the tower",
      "passed" : true
    },
    {
      "name" : "fixed: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "fixed: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "fixed: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "fixed: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "fixed: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "fixed: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "decode emits a coherent prefix before cancellation",
      "passed" : true
    },
    {
      "name" : "fixed: pressure respects selected cache management",
      "passed" : true
    },
    {
      "name" : "fixed: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "fixed: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "fixed: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "fixed: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "fixed: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "fixed: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "fixed: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "fixed: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "fixed: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "scope: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "scope: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "scope: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "scope: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "scope: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "scope: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "cancelled scope retains only its prior commit",
      "passed" : true
    },
    {
      "name" : "scope cancellation actually interrupts a read scope",
      "passed" : true
    },
    {
      "name" : "scope cancellation emits no token",
      "passed" : true
    },
    {
      "name" : "scope: pressure respects selected cache management",
      "passed" : true
    },
    {
      "name" : "scope: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "scope: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "scope: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "scope: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "scope: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "scope: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "scope: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "scope: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "scope: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "prefill: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "prefill: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "prefill: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "prefill: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "prefill: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "prefill: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "prefill stops at one complete chronological pass",
      "passed" : true
    },
    {
      "name" : "prefill cancellation emits no token",
      "passed" : true
    },
    {
      "name" : "prefill: pressure respects selected cache management",
      "passed" : true
    },
    {
      "name" : "prefill: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "prefill: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "prefill: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "prefill: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "prefill: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "prefill: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "prefill: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "prefill: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "prefill: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "decode: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "decode: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "decode: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "decode: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "decode: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "decode: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "decode emits a coherent prefix before cancellation",
      "passed" : true
    },
    {
      "name" : "decode: pressure respects selected cache management",
      "passed" : true
    },
    {
      "name" : "decode: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "decode: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "decode: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "decode: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "decode: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "decode: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "decode: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "decode: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "decode: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "nonstream: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "nonstream: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "nonstream: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "nonstream: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "nonstream: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "nonstream: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "decode emits a coherent prefix before cancellation",
      "passed" : true
    },
    {
      "name" : "nonstream: pressure respects selected cache management",
      "passed" : true
    },
    {
      "name" : "nonstream: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "nonstream: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "nonstream: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "nonstream: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "nonstream: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "nonstream: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "nonstream: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "nonstream: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "nonstream: retry is not spuriously cancelled",
      "passed" : true
    }
  ],
  "measurements" : {
    "decode.pressure_to_boundary_seconds" : 5.125e-06,
    "fixed.pressure_to_boundary_seconds" : 5.834e-06,
    "nonstream.pressure_to_boundary_seconds" : 0.000105792,
    "prefill.pressure_to_boundary_seconds" : 0.001056375,
    "scope.pressure_to_boundary_seconds" : 0.045138292
  },
  "name" : "optimization-governor-boundary-plain",
  "passed" : true
}
````

### product-selection-models-v1/receipt.json

Original bytes: 21762. SHA-256: `2b730edc4b0644de10a5b056eb7fc880ae62ef228187833546a72deabc75402c`.

Normalized bytes: 21636. SHA-256: `58d0f5d3f855f072ed0922cf245b4eca79510edec6b723b3b00f5c266b29758f`.

````text
{
  "complete": false,
  "started_at": "2026-10-03T18:09:42.334472+00:00",
  "scope": "Functional acceptance only; no throughput qualification, hardware simulation or model activation.",
  "maximum_concurrent_model_processes": 1,
  "minimum_real_headroom_gb": 3,
  "maximum_total_seconds": 10800,
  "pins": {
    "<HOME>/Projects/slotstream/.build/release/slotstream": "e066b7a195ef50d8138062c5c24431af68c621a23b14f20b3e579b117d0a5b31",
    "<HOME>/Projects/slotstream/apps/macos/.build/release/sevra-mac-checks": "46f44a7e7dc077b6648af8b2ad3bbe583748009c407cc6cd59221c330ac2618d",
    "<HOME>/Projects/slotstream/.build/quantization-research/vq-composite-draft-v1/reference/comparison.safetensors": "75061cdf20bf1221448ef07e5a07442bd0f26a101bfc788b78717a93feb8c032",
    "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-reference-repair-v1/mtp-reference/comparison.safetensors": "b754211cb78ab072dc8204e375df727df0bbfa4aa606c087c138c2d49f8362c4",
    "<HOME>/Projects/slotstream/.build/quantization-research/run-product-selection-models-v1.py": "9ee1272e5680e4cb0667513865bc32a16eacd98ef150ad853bf1fc167688193a",
    "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed"
  },
  "protocol": [
    {
      "name": "governor-fixed-plain",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "optimization-state-check",
        "--variant",
        "governor-boundary",
        "--memory-gb",
        "10",
        "--json"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 900
    },
    {
      "name": "governor-fixed-draft",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "optimization-state-check",
        "--variant",
        "governor-boundary-mtp",
        "--memory-gb",
        "10",
        "--json"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 900
    },
    {
      "name": "app-reload",
      "command": [
        "<HOME>/Projects/slotstream/apps/macos/.build/release/sevra-mac-checks",
        "--performance-real",
        "--home",
        "<HOME>/Projects/slotstream/.build/quantization-research/product-selection-models-v1/disposable-home"
      ],
      "process_bound_gb": 13,
      "preflight_gb": 16,
      "timeout_seconds": 1800
    },
    {
      "name": "research-draft",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "quantization-draft-check",
        "--baseline",
        "<HOME>/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--fixture",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-composite-draft-v1/reference/comparison.safetensors",
        "--output",
        "<HOME>/Projects/slotstream/.build/quantization-research/product-selection-models-v1/research-output",
        "--reference-arithmetic"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 300
    },
    {
      "name": "public-draft",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "mtp-parity",
        "--fixture",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-reference-repair-v1/mtp-reference/comparison.safetensors"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 300
    },
    {
      "name": "draft-stream",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "draft-stream-check"
      ],
      "process_bound_gb": 12,
      "preflight_gb": 15,
      "timeout_seconds": 1800
    },
    {
      "name": "draft-vision",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "mtp-check",
        "--memory-gb",
        "12",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--image",
        "Tools/assets/vision_test/secret1.jpg"
      ],
      "process_bound_gb": 12,
      "preflight_gb": 15,
      "timeout_seconds": 1800
    },
    {
      "name": "draft-rows",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "mtp-rowcheck",
        "--memory-gb",
        "10"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 1800
    }
  ],
  "runs": [
    {
      "name": "governor-fixed-plain",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 30044979200,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   881707.\nPages active:                                 770279.\nPages inactive:                               862923.\nPages speculative:                            108239.\nPages throttled:                                   0.\nPages wired down:                             190039.\nPages purgeable:                               16997.\n\"Translation faults\":                     2078096848.\nPages copy-on-write:                       108221611.\nPages zero filled:                        3355849131.\nPages reactivated:                         175374431.\nPages purged:                               12996454.\nFile-backed pages:                            935096.\nAnonymous pages:                              806345.\nPages stored in compressor:                   513573.\nPages occupied by compressor:                 233995.\nDecompressions:                            105805989.\nCompressions:                              119993818.\nPageins:                                  2385963251.\nPageouts:                                     496073.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 140052.\nPages tagged resident:                        110757.\nPages tagged compressed:                       29295.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5845.\nPages tag-storage free:                        38489.\nPages tag-storage non-tag pageable:            53962.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4547520.\nTagged compressions:                          771723.\nTagged decompressions:                        648215.\n"
      },
      "peak_physical_bytes": 7103238872,
      "samples": 297,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 30064951296,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   563155.\nPages active:                                 768470.\nPages inactive:                              1002533.\nPages speculative:                            288224.\nPages throttled:                                   0.\nPages wired down:                             190124.\nPages purgeable:                               17013.\n\"Translation faults\":                     2078571834.\nPages copy-on-write:                       108227730.\nPages zero filled:                        3357141498.\nPages reactivated:                         175374486.\nPages purged:                               12996456.\nFile-backed pages:                           1254851.\nAnonymous pages:                              804376.\nPages stored in compressor:                   513571.\nPages occupied by compressor:                 233994.\nDecompressions:                            105805991.\nCompressions:                              119993818.\nPageins:                                  2386264130.\nPageouts:                                     496073.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 140160.\nPages tagged resident:                        110865.\nPages tagged compressed:                       29295.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5845.\nPages tag-storage free:                        39145.\nPages tag-storage non-tag pageable:            53306.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4547520.\nTagged compressions:                          771723.\nTagged decompressions:                        648215.\n"
      },
      "seconds": 16.465624332999997
    },
    {
      "name": "governor-fixed-draft",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 30065541120,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   563191.\nPages active:                                 768352.\nPages inactive:                              1002583.\nPages speculative:                            288174.\nPages throttled:                                   0.\nPages wired down:                             190124.\nPages purgeable:                               17013.\n\"Translation faults\":                     2078593317.\nPages copy-on-write:                       108228196.\nPages zero filled:                        3357143801.\nPages reactivated:                         175374486.\nPages purged:                               12996456.\nFile-backed pages:                           1254851.\nAnonymous pages:                              804258.\nPages stored in compressor:                   513571.\nPages occupied by compressor:                 233994.\nDecompressions:                            105805991.\nCompressions:                              119993818.\nPageins:                                  2386264135.\nPageouts:                                     496073.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 140120.\nPages tagged resident:                        110825.\nPages tagged compressed:                       29295.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5845.\nPages tag-storage free:                        39142.\nPages tag-storage non-tag pageable:            53309.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4547520.\nTagged compressions:                          771723.\nTagged decompressions:                        648215.\n"
      },
      "peak_physical_bytes": 7047467784,
      "samples": 326,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 30352162816,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   562776.\nPages active:                                 754020.\nPages inactive:                              1023329.\nPages speculative:                            282068.\nPages throttled:                                   0.\nPages wired down:                             190093.\nPages purgeable:                               20129.\n\"Translation faults\":                     2079081215.\nPages copy-on-write:                       108234901.\nPages zero filled:                        3358664475.\nPages reactivated:                         175374560.\nPages purged:                               12996729.\nFile-backed pages:                           1269644.\nAnonymous pages:                              789773.\nPages stored in compressor:                   513570.\nPages occupied by compressor:                 233993.\nDecompressions:                            105805992.\nCompressions:                              119993818.\nPageins:                                  2386278689.\nPageouts:                                     496073.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 140126.\nPages tagged resident:                        110831.\nPages tagged compressed:                       29295.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5845.\nPages tag-storage free:                        39146.\nPages tag-storage non-tag pageable:            53305.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4547520.\nTagged compressions:                          771723.\nTagged decompressions:                        648215.\n"
      },
      "seconds": 17.947074708
    },
    {
      "name": "app-reload",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 30115528704,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   548333.\nPages active:                                 768469.\nPages inactive:                              1023379.\nPages speculative:                            282018.\nPages throttled:                                   0.\nPages wired down:                             190100.\nPages purgeable:                               20129.\n\"Translation faults\":                     2079098222.\nPages copy-on-write:                       108235323.\nPages zero filled:                        3358680001.\nPages reactivated:                         175374560.\nPages purged:                               12996729.\nFile-backed pages:                           1269644.\nAnonymous pages:                              804222.\nPages stored in compressor:                   513570.\nPages occupied by compressor:                 233993.\nDecompressions:                            105805992.\nCompressions:                              119993818.\nPageins:                                  2386278692.\nPageouts:                                     496073.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 140126.\nPages tagged resident:                        110831.\nPages tagged compressed:                       29295.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5845.\nPages tag-storage free:                        39130.\nPages tag-storage non-tag pageable:            53321.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4547520.\nTagged compressions:                          771723.\nTagged decompressions:                        648215.\n"
      },
      "peak_physical_bytes": 6622188392,
      "samples": 463,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36527243264,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   342512.\nPages active:                                1067108.\nPages inactive:                               985318.\nPages speculative:                             81148.\nPages throttled:                                   0.\nPages wired down:                             189475.\nPages purgeable:                                 125.\n\"Translation faults\":                     2079763475.\nPages copy-on-write:                       108248602.\nPages zero filled:                        3359597618.\nPages reactivated:                         176539733.\nPages purged:                               13016010.\nFile-backed pages:                           1886809.\nAnonymous pages:                              246765.\nPages stored in compressor:                   865231.\nPages occupied by compressor:                 408160.\nDecompressions:                            105990327.\nCompressions:                              120544573.\nPageins:                                  2393495151.\nPageouts:                                     496304.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 132609.\nPages tagged resident:                         91223.\nPages tagged compressed:                       41386.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5509.\nPages tag-storage free:                        11559.\nPages tag-storage non-tag pageable:            81228.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6941824.\nTagged compressions:                          785031.\nTagged decompressions:                        648596.\n"
      },
      "seconds": 26.34819425
    },
    {
      "name": "research-draft",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36442554368,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   322880.\nPages active:                                1084682.\nPages inactive:                              1001730.\nPages speculative:                             81212.\nPages throttled:                                   0.\nPages wired down:                             189469.\nPages purgeable:                                 125.\n\"Translation faults\":                     2079787439.\nPages copy-on-write:                       108249064.\nPages zero filled:                        3359603002.\nPages reactivated:                         176539733.\nPages purged:                               13016010.\nFile-backed pages:                           1901272.\nAnonymous pages:                              266352.\nPages stored in compressor:                   848845.\nPages occupied by compressor:                 394080.\nDecompressions:                            106006755.\nCompressions:                              120544573.\nPageins:                                  2393509548.\nPageouts:                                     496304.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 132618.\nPages tagged resident:                         91245.\nPages tagged compressed:                       41373.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5509.\nPages tag-storage free:                        11220.\nPages tag-storage non-tag pageable:            81567.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6940096.\nTagged compressions:                          785031.\nTagged decompressions:                        648609.\n"
      },
      "peak_physical_bytes": 180296,
      "samples": 1,
      "passed": false,
      "exit_code": 1,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36444602368,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   322965.\nPages active:                                1084705.\nPages inactive:                              1001692.\nPages speculative:                             81272.\nPages throttled:                                   0.\nPages wired down:                             189469.\nPages purgeable:                                 125.\n\"Translation faults\":                     2079790649.\nPages copy-on-write:                       108249661.\nPages zero filled:                        3359603309.\nPages reactivated:                         176539733.\nPages purged:                               13016010.\nFile-backed pages:                           1901312.\nAnonymous pages:                              266357.\nPages stored in compressor:                   848842.\nPages occupied by compressor:                 394079.\nDecompressions:                            106006778.\nCompressions:                              120544573.\nPageins:                                  2393509615.\nPageouts:                                     496304.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 132615.\nPages tagged resident:                         91245.\nPages tagged compressed:                       41370.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5509.\nPages tag-storage free:                        11223.\nPages tag-storage non-tag pageable:            81564.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6939904.\nTagged compressions:                          785031.\nTagged decompressions:                        648612.\n"
      },
      "seconds": 0.06743866600000104
    }
  ],
  "explicit_environment": {
    "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1"
  },
  "failure": "RuntimeError: research-draft: functional check failed"
}
````

### product-selection-models-v1/research-draft/stderr.txt

Original bytes: 56. SHA-256: `e91cc243a82503379b32cbbc4efc577ee290f3061c9beb341dd86fea5da6aeac`.

Normalized bytes: 56. SHA-256: `e91cc243a82503379b32cbbc4efc577ee290f3061c9beb341dd86fea5da6aeac`.

````text
Error: draft research refuses ambient runtime overrides
````

### product-selection-models-v1/research-draft/stdout.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### product-selection-models-v2/draft-rows/stderr.txt

Original bytes: 1434. SHA-256: `2f3a8cbbee239074920d95fc0685c1e476a7801e7f061768cb38e3ea4f1aa904`.

Normalized bytes: 1434. SHA-256: `2f3a8cbbee239074920d95fc0685c1e476a7801e7f061768cb38e3ea4f1aa904`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (38.3 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total process budget, not a RAM usage goal
  cache:  ~17 of 512 experts per layer  (834 global slots = 2.3 GB pool)
  plan:   ~9.0 GB full-workload envelope, ~3 tok/s warm decode (est. from M5 Pro anchors)
  memory: 2.3 GB expert cache at load; 6.7 GB allowed for runtime, context and workspace; 1.0 GB budget headroom. Short requests can use less.
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  mtp:    draft head on — speculative decode; its experts stream through a 64-expert cache (0.4 GB resident, charged above)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 11975 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~17/512 per layer (834 global slots = 2.3 GB), mtp draft head on, eos [248044, 248046]
````

### product-selection-models-v2/draft-rows/stdout.txt

Original bytes: 1990. SHA-256: `a0afee33f49fc501c74a31a4aa0a5c57381ba706980e92fbc998a898712650ca`.

Normalized bytes: 1990. SHA-256: `a0afee33f49fc501c74a31a4aa0a5c57381ba706980e92fbc998a898712650ca`.

````text
prompt: 973-token prompt, below the indexer budget, rows across 1024 keys (2048); positions from 1019 every 1 tokens; context window 32768
PASS  973-token prompt, below the indexer budget, rows across 1024 keys: exact verify attention engaged (180 layer passes)
PASS  973-token prompt, below the indexer budget, rows across 1024 keys: row-invariant projections engaged (11040 matmuls)
PASS  973-token prompt, below the indexer budget, rows across 1024 keys: k=2, every row equals the one-row pass at its position over 4 positions (max deviation 0 of the logit spread, 0 top-1 flips; stock 0.0141, 0 flips)
PASS  973-token prompt, below the indexer budget, rows across 1024 keys: k=3, every row equals the one-row pass at its position over 4 positions (max deviation 0 of the logit spread, 0 top-1 flips; stock 0.0173, 0 flips)
PASS  973-token prompt, below the indexer budget, rows across 1024 keys: the state after a 3-row pass equals the state after 3 one-row passes, through the next token's logits (max deviation 0, 0 flips; stock 0.0156, 0 flips)
prompt: 2826-token prompt, above the indexer budget (2048); positions from 2826 every 4 tokens; context window 32768
PASS  2826-token prompt, above the indexer budget: exact verify attention engaged (180 layer passes)
PASS  2826-token prompt, above the indexer budget: row-invariant projections engaged (11040 matmuls)
PASS  2826-token prompt, above the indexer budget: k=2, every row equals the one-row pass at its position over 4 positions (max deviation 0 of the logit spread, 0 top-1 flips; stock 0.0208, 0 flips)
PASS  2826-token prompt, above the indexer budget: k=3, every row equals the one-row pass at its position over 4 positions (max deviation 0 of the logit spread, 0 top-1 flips; stock 0.0241, 0 flips)
PASS  2826-token prompt, above the indexer budget: the state after a 3-row pass equals the state after 3 one-row passes, through the next token's logits (max deviation 0, 0 flips; stock 0.0253, 0 flips)
MTP ROWCHECK PASS
````

### product-selection-models-v2/draft-stream/stderr.txt

Original bytes: 599. SHA-256: `a74dc6b213fec5ada88e4d26c4959b17f31f947e790b9ec5b1875b87db2f481a`.

Normalized bytes: 599. SHA-256: `a74dc6b213fec5ada88e4d26c4959b17f31f947e790b9ec5b1875b87db2f481a`.

````text
engine ready in 1.2s: expert cache ~23/512 per layer (1091 global slots = 3.0 GB), mtp draft head on, eos [248044, 248046]
engine ready in 0.7s: expert cache ~28/512 per layer (1365 global slots = 3.8 GB), mtp draft head on, eos [248044, 248046]
engine ready in 0.6s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
[expert-lookahead] corrected attention forecast: measured correction 37b00d3a32d1e188 at lookahead/tap-correction-attention-rank128-v1.safetensors
engine ready in 0.6s: expert cache ~17/512 per layer (821 global slots = 2.3 GB), eos [248044, 248046]
````

### product-selection-models-v2/draft-stream/stdout.txt

Original bytes: 1478. SHA-256: `d9e27644c320bb26dbab57def671d23f5f90fe749761baf230bb1f082b875d09`.

Normalized bytes: 1478. SHA-256: `d9e27644c320bb26dbab57def671d23f5f90fe749761baf230bb1f082b875d09`.

````text
PASS  draft-stream-head: the resident plan keeps the experts resident
PASS  draft-stream-head: resident run succeeds
PASS  draft-stream-head: resident run verified drafts
PASS  draft-stream-head: resident run reports no draft cache
PASS  draft-stream-head: resident run generated every token
PASS  draft-stream-head: the streamed plan streams the experts
PASS  draft-stream-head: streamed run succeeds
PASS  draft-stream-head: streamed experts leave the ids unchanged
PASS  draft-stream-head: streamed run generated every token
PASS  draft-stream-head: the streamed head read experts on demand
PASS  draft-stream-head: the streamed head reused cached experts
PASS  draft-stream-head: a failed draft read ends the request with an error
PASS  draft-stream-head: the failure was consumed
PASS  draft-stream-head: the next request succeeds
PASS  draft-stream-head: the next request decodes the same ids
PASS  draft-stream-plain-lookahead: the reference plan runs no lookahead
PASS  draft-stream-plain-lookahead: plain run succeeds
PASS  draft-stream-plain-lookahead: plain run generated every token
PASS  draft-stream-plain-lookahead: the plan runs the lookahead without the head
PASS  draft-stream-plain-lookahead: lookahead run succeeds
PASS  draft-stream-plain-lookahead: the lookahead leaves plain decode's ids unchanged
PASS  draft-stream-plain-lookahead: plain decode passes were forecast
PASS  draft-stream-plain-lookahead: the lookahead issued reads
DRAFT STREAM CHECK PASS
````

### product-selection-models-v2/draft-vision/stderr.txt

Original bytes: 1710. SHA-256: `4bbbc17b65e0ac0e1f59aa28a17dc2c37e89654ed68d6bc1a532fd89e1eae827`.

Normalized bytes: 1710. SHA-256: `4bbbc17b65e0ac0e1f59aa28a17dc2c37e89654ed68d6bc1a532fd89e1eae827`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (37.7 GB reclaimable now), 40.2 GB Metal working set
  target: 12.0 GB total process budget, not a RAM usage goal
  cache:  ~26 of 512 experts per layer  (1225 global slots = 3.4 GB pool)
  plan:   ~11.0 GB full-workload envelope, ~5 tok/s warm decode (est. from M5 Pro anchors)
  memory: 3.4 GB expert cache at load; 7.6 GB allowed for runtime, context and workspace; 1.0 GB budget headroom. Short requests can use less.
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 512 tokens per pass (~125 tok/s here; costs ~0.7 GB of the target)
  mtp:    draft head on — speculative decode; its experts stream through a 64-expert cache (0.4 GB resident, charged above)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~4.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 17658 tokens across 4 conversations (~0.8 GB), so a follow-up turn re-prefills only what is new
  lookahead: on, expert prefetch with the draft head, router cache and a GPU barrier every 4 layers (409 MiB, charged above)
[expert-lookahead] corrected attention forecast: measured correction 37b00d3a32d1e188 at lookahead/tap-correction-attention-rank128-v1.safetensors
engine ready in 0.8s: expert cache ~26/512 per layer (1225 global slots = 3.4 GB), mtp draft head on, eos [248044, 248046]
````

### product-selection-models-v2/draft-vision/stdout.txt

Original bytes: 1889. SHA-256: `c8bafd9d015b79830a431870f59f82e91be7fd556c17d2da8d56fcab47b9f0c9`.

Normalized bytes: 1889. SHA-256: `c8bafd9d015b79830a431870f59f82e91be7fd556c17d2da8d56fcab47b9f0c9`.

````text
PASS  determinism p1 (48 tokens)
PASS  speculation ran p1
  info  p1: plain vs spec shared prefix 48/48 (identical)
PASS  determinism p2 (48 tokens)
PASS  speculation ran p2
  info  p2: plain vs spec shared prefix 48/48 (identical)
PASS  determinism p3 (48 tokens)
PASS  speculation ran p3
  info  p3: plain vs spec shared prefix 6/48
  info  vision+mtp prompt: 721 tokens, 1 image(s), placeholder id 248056
PASS  vision speculation deterministic (48 tokens)
PASS  vision speculation ran
  info  vision plain vs spec shared prefix 48/48 (identical)
  info  overall accept rate 81.2%
PASS  accept rate is not degenerate (>5%)
  info  recording pass vs batched: 0.0000% of spread (top-1 same); rollback state vs plain: ssm 2.09e-02, conv 3.10e-02, ple 4.48e-03 relative (re-chunk control: ssm 9.11e-02, conv 6.83e-02, ple 1.79e-02); one more step: 1.270% vs control 2.312% (bound 6.935%, top-1 same)
PASS  recording verify pass matches the batched pass (<= 0.1% of spread)
PASS  rollback state stays inside 3x the re-chunk band (ssm, conv, ple)
PASS  rollback then one step stays inside the prefill-rechunk band
PASS  turn-2 reused the speculative turn-1 state
  info  turn-2 logits from the reused speculative state: 4.333% of spread vs a cold rebuild (prefill-rechunk control 4.655%, bound 13.964%), top-1 same; reused 64 of 71 tokens after a 48-token turn 1 (20 verify passes)
PASS  reused speculative state stays inside the prefill-rechunk band
PASS  turn-1 speculation ran
PASS  whole MTP check process memory fits the priced target
MTP CHECK PASS
MTP CHECK MEMORY {"lifetime_physical_footprint_peak_bytes":9821837120,"lifetime_rss_peak_bytes":6559105024,"memory_validated":true,"physical_footprint_end_bytes":9502710672,"sampled_peak_bytes":9773193024,"samples":5689,"swap_clean":true,"swapins_after":52,"swapins_before":52,"swapouts_after":2908,"swapouts_before":2908,"target_gb":12}
````

### product-selection-models-v2/public-draft/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### product-selection-models-v2/public-draft/stdout.txt

Original bytes: 208. SHA-256: `6baff6abfec4abcd9c1eef27f79e5c7faa4128be16bf78fc4b1a590a47329f7f`.

Normalized bytes: 208. SHA-256: `6baff6abfec4abcd9c1eef27f79e5c7faa4128be16bf78fc4b1a590a47329f7f`.

````text
prefill sample: max abs 0.00000  rel 0.00000  OK
prefill multi: max abs 0.00000  rel 0.00000  OK
decode sample: max abs 0.00000  rel 0.00000  OK
decode multi: max abs 0.00000  rel 0.00000  OK
MTP PARITY PASS
````

### product-selection-models-v2/receipt.json

Original bytes: 25069. SHA-256: `0a0d521393eaa636e41719ae01b22424369fc23c185cfdb9819674dc0255fe95`.

Normalized bytes: 24971. SHA-256: `53ec0ab697e06de345e546166da200a2e0bc23b99cfbdda3ef7a0174a2964bdd`.

````text
{
  "complete": true,
  "started_at": "2026-10-03T18:12:26.752841+00:00",
  "scope": "Functional acceptance only; no throughput qualification, hardware simulation or model activation.",
  "maximum_concurrent_model_processes": 1,
  "minimum_real_headroom_gb": 3,
  "maximum_total_seconds": 10800,
  "pins": {
    "<HOME>/Projects/slotstream/.build/release/slotstream": "e066b7a195ef50d8138062c5c24431af68c621a23b14f20b3e579b117d0a5b31",
    "<HOME>/Projects/slotstream/apps/macos/.build/release/sevra-mac-checks": "46f44a7e7dc077b6648af8b2ad3bbe583748009c407cc6cd59221c330ac2618d",
    "<HOME>/Projects/slotstream/.build/quantization-research/vq-composite-draft-v1/reference/comparison.safetensors": "75061cdf20bf1221448ef07e5a07442bd0f26a101bfc788b78717a93feb8c032",
    "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-reference-repair-v1/mtp-reference/comparison.safetensors": "b754211cb78ab072dc8204e375df727df0bbfa4aa606c087c138c2d49f8362c4",
    "<HOME>/Projects/slotstream/.build/quantization-research/run-product-selection-models-v2.py": "27a87b30ec5ca06256fdefc508630855d59b21bccf9a5d9cdcbdf1211658a039",
    "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed"
  },
  "protocol": [
    {
      "name": "research-draft",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "quantization-draft-check",
        "--baseline",
        "<HOME>/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--fixture",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-composite-draft-v1/reference/comparison.safetensors",
        "--output",
        "<HOME>/Projects/slotstream/.build/quantization-research/product-selection-models-v2/research-output",
        "--reference-arithmetic"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 300
    },
    {
      "name": "public-draft",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "mtp-parity",
        "--fixture",
        "<HOME>/Projects/slotstream/.build/quantization-research/vq-dense-overlay-reference-repair-v1/mtp-reference/comparison.safetensors"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 300
    },
    {
      "name": "draft-stream",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "draft-stream-check"
      ],
      "process_bound_gb": 12,
      "preflight_gb": 15,
      "timeout_seconds": 1800
    },
    {
      "name": "draft-vision",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "mtp-check",
        "--memory-gb",
        "12",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--image",
        "Tools/assets/vision_test/secret1.jpg"
      ],
      "process_bound_gb": 12,
      "preflight_gb": 15,
      "timeout_seconds": 1800
    },
    {
      "name": "draft-rows",
      "command": [
        "<HOME>/Projects/slotstream/.build/release/slotstream",
        "mtp-rowcheck",
        "--memory-gb",
        "10"
      ],
      "process_bound_gb": 10,
      "preflight_gb": 13,
      "timeout_seconds": 1800
    }
  ],
  "runs": [
    {
      "name": "research-draft",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36521213952,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   324620.\nPages active:                                1100896.\nPages inactive:                              1017027.\nPages speculative:                             82689.\nPages throttled:                                   0.\nPages wired down:                             186957.\nPages purgeable:                                1234.\n\"Translation faults\":                     2080015935.\nPages copy-on-write:                       108276725.\nPages zero filled:                        3359680115.\nPages reactivated:                         176539912.\nPages purged:                               13016560.\nFile-backed pages:                           1903224.\nAnonymous pages:                              297388.\nPages stored in compressor:                   794839.\nPages occupied by compressor:                 369575.\nDecompressions:                            106047783.\nCompressions:                              120544573.\nPageins:                                  2393510383.\nPageouts:                                     496304.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 132694.\nPages tagged resident:                         94154.\nPages tagged compressed:                       38540.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5508.\nPages tag-storage free:                         3651.\nPages tag-storage non-tag pageable:            89137.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6290432.\nTagged compressions:                          785031.\nTagged decompressions:                        651438.\n"
      },
      "peak_physical_bytes": 2059667688,
      "samples": 15,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36515430400,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   234320.\nPages active:                                1101575.\nPages inactive:                              1105645.\nPages speculative:                             83353.\nPages throttled:                                   0.\nPages wired down:                             187254.\nPages purgeable:                                1091.\n\"Translation faults\":                     2080140723.\nPages copy-on-write:                       108277407.\nPages zero filled:                        3359806977.\nPages reactivated:                         176539912.\nPages purged:                               13016560.\nFile-backed pages:                           1993314.\nAnonymous pages:                              297259.\nPages stored in compressor:                   794816.\nPages occupied by compressor:                 369566.\nDecompressions:                            106047806.\nCompressions:                              120544573.\nPageins:                                  2393600089.\nPageouts:                                     496304.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 132755.\nPages tagged resident:                         94216.\nPages tagged compressed:                       38539.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5508.\nPages tag-storage free:                         3643.\nPages tag-storage non-tag pageable:            89145.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6289920.\nTagged compressions:                          785031.\nTagged decompressions:                        651439.\n"
      },
      "seconds": 0.8994291659999999
    },
    {
      "name": "public-draft",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36517756928,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   234462.\nPages active:                                1101454.\nPages inactive:                              1105706.\nPages speculative:                             83303.\nPages throttled:                                   0.\nPages wired down:                             187254.\nPages purgeable:                                1091.\n\"Translation faults\":                     2080162094.\nPages copy-on-write:                       108277869.\nPages zero filled:                        3359809158.\nPages reactivated:                         176539912.\nPages purged:                               13016560.\nFile-backed pages:                           1993314.\nAnonymous pages:                              297149.\nPages stored in compressor:                   794810.\nPages occupied by compressor:                 369564.\nDecompressions:                            106047812.\nCompressions:                              120544573.\nPageins:                                  2393600094.\nPageouts:                                     496304.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 132718.\nPages tagged resident:                         94181.\nPages tagged compressed:                       38537.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5508.\nPages tag-storage free:                         3638.\nPages tag-storage non-tag pageable:            89150.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6289792.\nTagged compressions:                          785031.\nTagged decompressions:                        651441.\n"
      },
      "peak_physical_bytes": 1067484552,
      "samples": 2,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 35178414080,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   152714.\nPages active:                                1120243.\nPages inactive:                              1105642.\nPages speculative:                             83349.\nPages throttled:                                   0.\nPages wired down:                             250389.\nPages purgeable:                                1091.\n\"Translation faults\":                     2080258196.\nPages copy-on-write:                       108278505.\nPages zero filled:                        3359906876.\nPages reactivated:                         176539912.\nPages purged:                               13016560.\nFile-backed pages:                           1993315.\nAnonymous pages:                              315908.\nPages stored in compressor:                   794807.\nPages occupied by compressor:                 369562.\nDecompressions:                            106047815.\nCompressions:                              120544573.\nPageins:                                  2393600145.\nPageouts:                                     496304.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 132742.\nPages tagged resident:                         94205.\nPages tagged compressed:                       38537.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5508.\nPages tag-storage free:                         3639.\nPages tag-storage non-tag pageable:            89149.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6289792.\nTagged compressions:                          785031.\nTagged decompressions:                        651441.\n"
      },
      "seconds": 0.12744516699999986
    },
    {
      "name": "draft-stream",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 36520378368,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   234621.\nPages active:                                1101463.\nPages inactive:                              1105691.\nPages speculative:                             83300.\nPages throttled:                                   0.\nPages wired down:                             187268.\nPages purgeable:                                1091.\n\"Translation faults\":                     2080278230.\nPages copy-on-write:                       108278924.\nPages zero filled:                        3359907963.\nPages reactivated:                         176539912.\nPages purged:                               13016560.\nFile-backed pages:                           1993315.\nAnonymous pages:                              297139.\nPages stored in compressor:                   794807.\nPages occupied by compressor:                 369562.\nDecompressions:                            106047815.\nCompressions:                              120544573.\nPageins:                                  2393600148.\nPageouts:                                     496304.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 132714.\nPages tagged resident:                         94177.\nPages tagged compressed:                       38537.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5508.\nPages tag-storage free:                         3640.\nPages tag-storage non-tag pageable:            89148.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6289792.\nTagged compressions:                          785031.\nTagged decompressions:                        651441.\n"
      },
      "peak_physical_bytes": 7859574784,
      "samples": 498,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 37772869632,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   472257.\nPages active:                                 999652.\nPages inactive:                              1005627.\nPages speculative:                             14961.\nPages throttled:                                   0.\nPages wired down:                             187216.\nPages purgeable:                                 703.\n\"Translation faults\":                     2081842722.\nPages copy-on-write:                       108291126.\nPages zero filled:                        3362120085.\nPages reactivated:                         176567902.\nPages purged:                               13016574.\nFile-backed pages:                           1832513.\nAnonymous pages:                              187727.\nPages stored in compressor:                   890909.\nPages occupied by compressor:                 404376.\nDecompressions:                            106269550.\nCompressions:                              120874872.\nPageins:                                  2393609236.\nPageouts:                                     496490.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 134590.\nPages tagged resident:                         88561.\nPages tagged compressed:                       46029.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5493.\nPages tag-storage free:                         1630.\nPages tag-storage non-tag pageable:            91173.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7542336.\nTagged compressions:                          793408.\nTagged decompressions:                        652323.\n"
      },
      "seconds": 27.812324042
    },
    {
      "name": "draft-vision",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 37541822464,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   458108.\nPages active:                                1014181.\nPages inactive:                              1005670.\nPages speculative:                             14964.\nPages throttled:                                   0.\nPages wired down:                             187223.\nPages purgeable:                                 703.\n\"Translation faults\":                     2081859803.\nPages copy-on-write:                       108291544.\nPages zero filled:                        3362135640.\nPages reactivated:                         176567902.\nPages purged:                               13016574.\nFile-backed pages:                           1832560.\nAnonymous pages:                              202255.\nPages stored in compressor:                   890841.\nPages occupied by compressor:                 404343.\nDecompressions:                            106269624.\nCompressions:                              120874872.\nPageins:                                  2393609278.\nPageouts:                                     496490.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 134590.\nPages tagged resident:                         88561.\nPages tagged compressed:                       46029.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5493.\nPages tag-storage free:                         1333.\nPages tag-storage non-tag pageable:            91470.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7542336.\nTagged compressions:                          793408.\nTagged decompressions:                        652323.\n"
      },
      "peak_physical_bytes": 9821837120,
      "samples": 2175,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 38082330624,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   578563.\nPages active:                                 918496.\nPages inactive:                               696399.\nPages speculative:                            221367.\nPages throttled:                                   0.\nPages wired down:                             188316.\nPages purgeable:                                 426.\n\"Translation faults\":                     2083446784.\nPages copy-on-write:                       108388658.\nPages zero filled:                        3364789416.\nPages reactivated:                         179777513.\nPages purged:                               13022085.\nFile-backed pages:                           1745372.\nAnonymous pages:                               90890.\nPages stored in compressor:                   994150.\nPages occupied by compressor:                 477129.\nDecompressions:                            107636107.\nCompressions:                              122406071.\nPageins:                                  2401957682.\nPageouts:                                     497103.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 131281.\nPages tagged resident:                         82597.\nPages tagged compressed:                       48684.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5475.\nPages tag-storage free:                         5225.\nPages tag-storage non-tag pageable:            87596.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8099648.\nTagged compressions:                          802500.\nTagged decompressions:                        658755.\n"
      },
      "seconds": 121.011222417
    },
    {
      "name": "draft-rows",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 37845155840,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   547744.\nPages active:                                 933209.\nPages inactive:                               712678.\nPages speculative:                            221430.\nPages throttled:                                   0.\nPages wired down:                             188323.\nPages purgeable:                                 439.\n\"Translation faults\":                     2083465383.\nPages copy-on-write:                       108389119.\nPages zero filled:                        3364806094.\nPages reactivated:                         179777513.\nPages purged:                               13022085.\nFile-backed pages:                           1761702.\nAnonymous pages:                              105615.\nPages stored in compressor:                   993904.\nPages occupied by compressor:                 477019.\nDecompressions:                            107636362.\nCompressions:                              122406071.\nPageins:                                  2401973949.\nPageouts:                                     497103.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 131246.\nPages tagged resident:                         82562.\nPages tagged compressed:                       48684.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5475.\nPages tag-storage free:                         4824.\nPages tag-storage non-tag pageable:            87997.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8099648.\nTagged compressions:                          802500.\nTagged decompressions:                        658755.\n"
      },
      "peak_physical_bytes": 9039909976,
      "samples": 1981,
      "passed": true,
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 38126862336,
        "swapins": 52,
        "swapouts": 2908,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   511385.\nPages active:                                 952707.\nPages inactive:                               793486.\nPages speculative:                            159218.\nPages throttled:                                   0.\nPages wired down:                             177672.\nPages purgeable:                                 326.\n\"Translation faults\":                     2084466744.\nPages copy-on-write:                       108433746.\nPages zero filled:                        3374348020.\nPages reactivated:                         182989948.\nPages purged:                               13033025.\nFile-backed pages:                           1815368.\nAnonymous pages:                               90043.\nPages stored in compressor:                  1004640.\nPages occupied by compressor:                 484879.\nDecompressions:                            108883391.\nCompressions:                              123820102.\nPageins:                                  2410099992.\nPageouts:                                     497520.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 124914.\nPages tagged resident:                         75352.\nPages tagged compressed:                       49562.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5363.\nPages tag-storage free:                         6097.\nPages tag-storage non-tag pageable:            86836.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8258240.\nTagged compressions:                          806994.\nTagged decompressions:                        662364.\n"
      },
      "seconds": 109.83698516600003
    }
  ],
  "explicit_environment": {},
  "prior_run": {
    "path": "product-selection-models-v1/receipt.json",
    "sha256": "2b730edc4b0644de10a5b056eb7fc880ae62ef228187833546a72deabc75402c",
    "reason": "Production pressure and app checks passed. Research refused the production-only ambient flag before loading; remaining cases now use a clean environment."
  }
}
````

### product-selection-models-v2/research-draft/stderr.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### product-selection-models-v2/research-draft/stdout.txt

Original bytes: 9388. SHA-256: `52f469b9d4196cab8d1c83fbe4a456af8047f76af3903c980088720447292482`.

Normalized bytes: 9388. SHA-256: `52f469b9d4196cab8d1c83fbe4a456af8047f76af3903c980088720447292482`.

````text
{
  "arithmetic" : "explicit-python-reference",
  "cache_offsets" : [
    43,
    44
  ],
  "comparisons" : [
    {
      "exact" : true,
      "finite" : true,
      "max_abs" : 0,
      "name" : "out1",
      "passed" : true,
      "relative_max" : 0
    },
    {
      "exact" : true,
      "finite" : true,
      "max_abs" : 0,
      "name" : "multi1",
      "passed" : true,
      "relative_max" : 0
    },
    {
      "exact" : true,
      "finite" : true,
      "max_abs" : 0,
      "name" : "out2",
      "passed" : true,
      "relative_max" : 0
    },
    {
      "exact" : true,
      "finite" : true,
      "max_abs" : 0,
      "name" : "multi2",
      "passed" : true,
      "relative_max" : 0
    }
  ],
  "config_sha256" : "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
  "draft_bits" : 4,
  "draft_group_size" : 64,
  "draft_sha256" : "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744",
  "fixture_sha256" : "75061cdf20bf1221448ef07e5a07442bd0f26a101bfc788b78717a93feb8c032",
  "largest_load_copy_bytes" : 419430400,
  "passed" : true,
  "payload_bytes" : 1470946816,
  "peak_process_bytes" : 2065271040,
  "qualification" : "unproven",
  "relative_tolerance" : 0.02,
  "schema" : 1,
  "scope" : "Fixed original-four-bit draft component on independently frozen composite inputs only",
  "trace" : [
    {
      "bytes" : 880640,
      "dtype" : "BF16",
      "file" : "s0_fuse.bin",
      "name" : "fuse",
      "sha256" : "abc2305169eb1d4f4f688b876f3f0005ace9b95d89d45436ce13877c6b6bdef6",
      "shape" : [
        1,
        43,
        10240
      ],
      "stage" : 0
    },
    {
      "bytes" : 220160,
      "dtype" : "BF16",
      "file" : "s0_x1.bin",
      "name" : "x1",
      "sha256" : "dd532e1a0bc5962fe6d59954ff3836c75761ffd5ae4cf9dd92d7f20080747e85",
      "shape" : [
        1,
        43,
        2560
      ],
      "stage" : 0
    },
    {
      "bytes" : 1056768,
      "dtype" : "BF16",
      "file" : "s0_qgRaw.bin",
      "name" : "qgRaw",
      "sha256" : "33bbbb09cb2306325876265037dfe0f367c842e5f208106f69f3afd9ac774a7d",
      "shape" : [
        1,
        43,
        24,
        512
      ],
      "stage" : 0
    },
    {
      "bytes" : 528384,
      "dtype" : "BF16",
      "file" : "s0_qNormed.bin",
      "name" : "qNormed",
      "sha256" : "04748c797633a28602d0d7a701da48a91b8fb96c0d153d1f9577cab800ff3e33",
      "shape" : [
        1,
        24,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 44032,
      "dtype" : "BF16",
      "file" : "s0_kNormed.bin",
      "name" : "kNormed",
      "sha256" : "6d38e2fe2999a9ac4aff658231e4ecfc321e6de2611998cec64e7616e023a5e7",
      "shape" : [
        1,
        2,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 44032,
      "dtype" : "BF16",
      "file" : "s0_v.bin",
      "name" : "v",
      "sha256" : "1c450fe2e488e88826291aa99c95a9a7bb13e2ed51df5c696bbafdb267021d9a",
      "shape" : [
        1,
        2,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 528384,
      "dtype" : "BF16",
      "file" : "s0_qRoped.bin",
      "name" : "qRoped",
      "sha256" : "f3d0a4f40df3b1b3bbb23c3f45b2f2414e999377e481a824568b6815aadd8a1a",
      "shape" : [
        1,
        24,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 44032,
      "dtype" : "BF16",
      "file" : "s0_kRoped.bin",
      "name" : "kRoped",
      "sha256" : "b9be65aa4abec95a15a08230bcd46715c36be9b0c377d20d99ba5add6dc22418",
      "shape" : [
        1,
        2,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 528384,
      "dtype" : "BF16",
      "file" : "s0_sdpaOut.bin",
      "name" : "sdpaOut",
      "sha256" : "306f6bc45ec8ef6eda797cf4e9164e5e43a36e08720d69343dbdb10250f13c9b",
      "shape" : [
        1,
        24,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 220160,
      "dtype" : "BF16",
      "file" : "s0_attnOut.bin",
      "name" : "attnOut",
      "sha256" : "56440708129235931a79c5bf68c9275bda1b086596461cf6f225e6e99a28e472",
      "shape" : [
        1,
        43,
        2560
      ],
      "stage" : 0
    },
    {
      "bytes" : 220160,
      "dtype" : "BF16",
      "file" : "s0_x2.bin",
      "name" : "x2",
      "sha256" : "13e0ce092ddb5953ea6d1a8d430f587b5125c0b71732950e9edf7b04ac27845b",
      "shape" : [
        1,
        43,
        2560
      ],
      "stage" : 0
    },
    {
      "bytes" : 220160,
      "dtype" : "BF16",
      "file" : "s0_moeOut.bin",
      "name" : "moeOut",
      "sha256" : "4428e7e3346fb6e8bdc73d3d0138c3f28a66ef7faa7ae0d008404b63d25455e1",
      "shape" : [
        1,
        43,
        2560
      ],
      "stage" : 0
    },
    {
      "bytes" : 220160,
      "dtype" : "BF16",
      "file" : "s0_out.bin",
      "name" : "out",
      "sha256" : "7c52736d785425d1c5606b45360e2c0105a2f9ab3c496d8584df7afcbca25656",
      "shape" : [
        1,
        43,
        2560
      ],
      "stage" : 0
    },
    {
      "bytes" : 880640,
      "dtype" : "BF16",
      "file" : "s0_multi.bin",
      "name" : "multi",
      "sha256" : "e1896fd48f8cab45500f6694ab1393720f642139c6a848f80f91b2b9b48f5473",
      "shape" : [
        1,
        43,
        10240
      ],
      "stage" : 0
    },
    {
      "bytes" : 20480,
      "dtype" : "BF16",
      "file" : "s1_fuse.bin",
      "name" : "fuse",
      "sha256" : "fc18434330255a3b58bd20ad8a60e7b39688df17f666737019530e9f9c9c3860",
      "shape" : [
        1,
        1,
        10240
      ],
      "stage" : 1
    },
    {
      "bytes" : 5120,
      "dtype" : "BF16",
      "file" : "s1_x1.bin",
      "name" : "x1",
      "sha256" : "5ad31264bf4f166ebd06d5a00b7e8af6bf4d35137a0a452e943e3426dd5bc074",
      "shape" : [
        1,
        1,
        2560
      ],
      "stage" : 1
    },
    {
      "bytes" : 24576,
      "dtype" : "BF16",
      "file" : "s1_qgRaw.bin",
      "name" : "qgRaw",
      "sha256" : "db79afddca80d9564a284d83caf5c5462c21c74ae416a7ced5eb55c3e1f22ca2",
      "shape" : [
        1,
        1,
        24,
        512
      ],
      "stage" : 1
    },
    {
      "bytes" : 12288,
      "dtype" : "BF16",
      "file" : "s1_qNormed.bin",
      "name" : "qNormed",
      "sha256" : "f7e09a33fd6cc9b5d817df2cd2c3d1a4319069bab028bd992b4e3c2f4761e49d",
      "shape" : [
        1,
        24,
        1,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 1024,
      "dtype" : "BF16",
      "file" : "s1_kNormed.bin",
      "name" : "kNormed",
      "sha256" : "3572a51987eddf79a8a8b5daa3a6d56f1c7eb63f4fb095838fc8627c132b4bbe",
      "shape" : [
        1,
        2,
        1,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 1024,
      "dtype" : "BF16",
      "file" : "s1_v.bin",
      "name" : "v",
      "sha256" : "5c464d7e2f4923e7b8b76476e1dd992196a437b067abc994ad9f640809b24765",
      "shape" : [
        1,
        2,
        1,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 12288,
      "dtype" : "BF16",
      "file" : "s1_qRoped.bin",
      "name" : "qRoped",
      "sha256" : "c3110dc947e49ceded4f3fac9ebb8e2bf94a662516ff76c008a67aa6048c94ca",
      "shape" : [
        1,
        24,
        1,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 45056,
      "dtype" : "BF16",
      "file" : "s1_kRoped.bin",
      "name" : "kRoped",
      "sha256" : "562c83aeff99b317203651a46a91a28fe88019e8164cbab3ba9e84faee586a68",
      "shape" : [
        1,
        2,
        44,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 12288,
      "dtype" : "BF16",
      "file" : "s1_sdpaOut.bin",
      "name" : "sdpaOut",
      "sha256" : "d63a92c32447244896f556bd8f33ebf02663fa9972ca9faca5ce46845a28b2a4",
      "shape" : [
        1,
        24,
        1,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 5120,
      "dtype" : "BF16",
      "file" : "s1_attnOut.bin",
      "name" : "attnOut",
      "sha256" : "49cac1d1646ca6ed02ffd2b45da88e3ea28e84243e18042eac1e3f49d42d3488",
      "shape" : [
        1,
        1,
        2560
      ],
      "stage" : 1
    },
    {
      "bytes" : 5120,
      "dtype" : "BF16",
      "file" : "s1_x2.bin",
      "name" : "x2",
      "sha256" : "5851758e9c456bf84248a53c7570e9ecdf35246e3adc1476c4e559dc12b40130",
      "shape" : [
        1,
        1,
        2560
      ],
      "stage" : 1
    },
    {
      "bytes" : 5120,
      "dtype" : "BF16",
      "file" : "s1_moeOut.bin",
      "name" : "moeOut",
      "sha256" : "f0b89852a0b06d00c914fe0270720bf06f6853f5b4f4635cf1bc87f6523a85bd",
      "shape" : [
        1,
        1,
        2560
      ],
      "stage" : 1
    },
    {
      "bytes" : 5120,
      "dtype" : "BF16",
      "file" : "s1_out.bin",
      "name" : "out",
      "sha256" : "f3d4935381e263da29ba79f5653176e7a245187a4763402c4a44bb608bd76d06",
      "shape" : [
        1,
        1,
        2560
      ],
      "stage" : 1
    },
    {
      "bytes" : 20480,
      "dtype" : "BF16",
      "file" : "s1_multi.bin",
      "name" : "multi",
      "sha256" : "689af368724ac81032a5810d3f4bd5fdff9a684d3fb88562305ffc203977088d",
      "shape" : [
        1,
        1,
        10240
      ],
      "stage" : 1
    }
  ],
  "trace_bytes" : 5811200
}
````

### product-selection-models-v2/research-output/receipt.json

Original bytes: 9387. SHA-256: `be1bfef0bb5eb971a3463dcc2789326626c4cd86d1f84019180e0db2c9258851`.

Normalized bytes: 9387. SHA-256: `be1bfef0bb5eb971a3463dcc2789326626c4cd86d1f84019180e0db2c9258851`.

````text
{
  "arithmetic" : "explicit-python-reference",
  "cache_offsets" : [
    43,
    44
  ],
  "comparisons" : [
    {
      "exact" : true,
      "finite" : true,
      "max_abs" : 0,
      "name" : "out1",
      "passed" : true,
      "relative_max" : 0
    },
    {
      "exact" : true,
      "finite" : true,
      "max_abs" : 0,
      "name" : "multi1",
      "passed" : true,
      "relative_max" : 0
    },
    {
      "exact" : true,
      "finite" : true,
      "max_abs" : 0,
      "name" : "out2",
      "passed" : true,
      "relative_max" : 0
    },
    {
      "exact" : true,
      "finite" : true,
      "max_abs" : 0,
      "name" : "multi2",
      "passed" : true,
      "relative_max" : 0
    }
  ],
  "config_sha256" : "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
  "draft_bits" : 4,
  "draft_group_size" : 64,
  "draft_sha256" : "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744",
  "fixture_sha256" : "75061cdf20bf1221448ef07e5a07442bd0f26a101bfc788b78717a93feb8c032",
  "largest_load_copy_bytes" : 419430400,
  "passed" : true,
  "payload_bytes" : 1470946816,
  "peak_process_bytes" : 2065271040,
  "qualification" : "unproven",
  "relative_tolerance" : 0.02,
  "schema" : 1,
  "scope" : "Fixed original-four-bit draft component on independently frozen composite inputs only",
  "trace" : [
    {
      "bytes" : 880640,
      "dtype" : "BF16",
      "file" : "s0_fuse.bin",
      "name" : "fuse",
      "sha256" : "abc2305169eb1d4f4f688b876f3f0005ace9b95d89d45436ce13877c6b6bdef6",
      "shape" : [
        1,
        43,
        10240
      ],
      "stage" : 0
    },
    {
      "bytes" : 220160,
      "dtype" : "BF16",
      "file" : "s0_x1.bin",
      "name" : "x1",
      "sha256" : "dd532e1a0bc5962fe6d59954ff3836c75761ffd5ae4cf9dd92d7f20080747e85",
      "shape" : [
        1,
        43,
        2560
      ],
      "stage" : 0
    },
    {
      "bytes" : 1056768,
      "dtype" : "BF16",
      "file" : "s0_qgRaw.bin",
      "name" : "qgRaw",
      "sha256" : "33bbbb09cb2306325876265037dfe0f367c842e5f208106f69f3afd9ac774a7d",
      "shape" : [
        1,
        43,
        24,
        512
      ],
      "stage" : 0
    },
    {
      "bytes" : 528384,
      "dtype" : "BF16",
      "file" : "s0_qNormed.bin",
      "name" : "qNormed",
      "sha256" : "04748c797633a28602d0d7a701da48a91b8fb96c0d153d1f9577cab800ff3e33",
      "shape" : [
        1,
        24,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 44032,
      "dtype" : "BF16",
      "file" : "s0_kNormed.bin",
      "name" : "kNormed",
      "sha256" : "6d38e2fe2999a9ac4aff658231e4ecfc321e6de2611998cec64e7616e023a5e7",
      "shape" : [
        1,
        2,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 44032,
      "dtype" : "BF16",
      "file" : "s0_v.bin",
      "name" : "v",
      "sha256" : "1c450fe2e488e88826291aa99c95a9a7bb13e2ed51df5c696bbafdb267021d9a",
      "shape" : [
        1,
        2,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 528384,
      "dtype" : "BF16",
      "file" : "s0_qRoped.bin",
      "name" : "qRoped",
      "sha256" : "f3d0a4f40df3b1b3bbb23c3f45b2f2414e999377e481a824568b6815aadd8a1a",
      "shape" : [
        1,
        24,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 44032,
      "dtype" : "BF16",
      "file" : "s0_kRoped.bin",
      "name" : "kRoped",
      "sha256" : "b9be65aa4abec95a15a08230bcd46715c36be9b0c377d20d99ba5add6dc22418",
      "shape" : [
        1,
        2,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 528384,
      "dtype" : "BF16",
      "file" : "s0_sdpaOut.bin",
      "name" : "sdpaOut",
      "sha256" : "306f6bc45ec8ef6eda797cf4e9164e5e43a36e08720d69343dbdb10250f13c9b",
      "shape" : [
        1,
        24,
        43,
        256
      ],
      "stage" : 0
    },
    {
      "bytes" : 220160,
      "dtype" : "BF16",
      "file" : "s0_attnOut.bin",
      "name" : "attnOut",
      "sha256" : "56440708129235931a79c5bf68c9275bda1b086596461cf6f225e6e99a28e472",
      "shape" : [
        1,
        43,
        2560
      ],
      "stage" : 0
    },
    {
      "bytes" : 220160,
      "dtype" : "BF16",
      "file" : "s0_x2.bin",
      "name" : "x2",
      "sha256" : "13e0ce092ddb5953ea6d1a8d430f587b5125c0b71732950e9edf7b04ac27845b",
      "shape" : [
        1,
        43,
        2560
      ],
      "stage" : 0
    },
    {
      "bytes" : 220160,
      "dtype" : "BF16",
      "file" : "s0_moeOut.bin",
      "name" : "moeOut",
      "sha256" : "4428e7e3346fb6e8bdc73d3d0138c3f28a66ef7faa7ae0d008404b63d25455e1",
      "shape" : [
        1,
        43,
        2560
      ],
      "stage" : 0
    },
    {
      "bytes" : 220160,
      "dtype" : "BF16",
      "file" : "s0_out.bin",
      "name" : "out",
      "sha256" : "7c52736d785425d1c5606b45360e2c0105a2f9ab3c496d8584df7afcbca25656",
      "shape" : [
        1,
        43,
        2560
      ],
      "stage" : 0
    },
    {
      "bytes" : 880640,
      "dtype" : "BF16",
      "file" : "s0_multi.bin",
      "name" : "multi",
      "sha256" : "e1896fd48f8cab45500f6694ab1393720f642139c6a848f80f91b2b9b48f5473",
      "shape" : [
        1,
        43,
        10240
      ],
      "stage" : 0
    },
    {
      "bytes" : 20480,
      "dtype" : "BF16",
      "file" : "s1_fuse.bin",
      "name" : "fuse",
      "sha256" : "fc18434330255a3b58bd20ad8a60e7b39688df17f666737019530e9f9c9c3860",
      "shape" : [
        1,
        1,
        10240
      ],
      "stage" : 1
    },
    {
      "bytes" : 5120,
      "dtype" : "BF16",
      "file" : "s1_x1.bin",
      "name" : "x1",
      "sha256" : "5ad31264bf4f166ebd06d5a00b7e8af6bf4d35137a0a452e943e3426dd5bc074",
      "shape" : [
        1,
        1,
        2560
      ],
      "stage" : 1
    },
    {
      "bytes" : 24576,
      "dtype" : "BF16",
      "file" : "s1_qgRaw.bin",
      "name" : "qgRaw",
      "sha256" : "db79afddca80d9564a284d83caf5c5462c21c74ae416a7ced5eb55c3e1f22ca2",
      "shape" : [
        1,
        1,
        24,
        512
      ],
      "stage" : 1
    },
    {
      "bytes" : 12288,
      "dtype" : "BF16",
      "file" : "s1_qNormed.bin",
      "name" : "qNormed",
      "sha256" : "f7e09a33fd6cc9b5d817df2cd2c3d1a4319069bab028bd992b4e3c2f4761e49d",
      "shape" : [
        1,
        24,
        1,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 1024,
      "dtype" : "BF16",
      "file" : "s1_kNormed.bin",
      "name" : "kNormed",
      "sha256" : "3572a51987eddf79a8a8b5daa3a6d56f1c7eb63f4fb095838fc8627c132b4bbe",
      "shape" : [
        1,
        2,
        1,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 1024,
      "dtype" : "BF16",
      "file" : "s1_v.bin",
      "name" : "v",
      "sha256" : "5c464d7e2f4923e7b8b76476e1dd992196a437b067abc994ad9f640809b24765",
      "shape" : [
        1,
        2,
        1,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 12288,
      "dtype" : "BF16",
      "file" : "s1_qRoped.bin",
      "name" : "qRoped",
      "sha256" : "c3110dc947e49ceded4f3fac9ebb8e2bf94a662516ff76c008a67aa6048c94ca",
      "shape" : [
        1,
        24,
        1,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 45056,
      "dtype" : "BF16",
      "file" : "s1_kRoped.bin",
      "name" : "kRoped",
      "sha256" : "562c83aeff99b317203651a46a91a28fe88019e8164cbab3ba9e84faee586a68",
      "shape" : [
        1,
        2,
        44,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 12288,
      "dtype" : "BF16",
      "file" : "s1_sdpaOut.bin",
      "name" : "sdpaOut",
      "sha256" : "d63a92c32447244896f556bd8f33ebf02663fa9972ca9faca5ce46845a28b2a4",
      "shape" : [
        1,
        24,
        1,
        256
      ],
      "stage" : 1
    },
    {
      "bytes" : 5120,
      "dtype" : "BF16",
      "file" : "s1_attnOut.bin",
      "name" : "attnOut",
      "sha256" : "49cac1d1646ca6ed02ffd2b45da88e3ea28e84243e18042eac1e3f49d42d3488",
      "shape" : [
        1,
        1,
        2560
      ],
      "stage" : 1
    },
    {
      "bytes" : 5120,
      "dtype" : "BF16",
      "file" : "s1_x2.bin",
      "name" : "x2",
      "sha256" : "5851758e9c456bf84248a53c7570e9ecdf35246e3adc1476c4e559dc12b40130",
      "shape" : [
        1,
        1,
        2560
      ],
      "stage" : 1
    },
    {
      "bytes" : 5120,
      "dtype" : "BF16",
      "file" : "s1_moeOut.bin",
      "name" : "moeOut",
      "sha256" : "f0b89852a0b06d00c914fe0270720bf06f6853f5b4f4635cf1bc87f6523a85bd",
      "shape" : [
        1,
        1,
        2560
      ],
      "stage" : 1
    },
    {
      "bytes" : 5120,
      "dtype" : "BF16",
      "file" : "s1_out.bin",
      "name" : "out",
      "sha256" : "f3d4935381e263da29ba79f5653176e7a245187a4763402c4a44bb608bd76d06",
      "shape" : [
        1,
        1,
        2560
      ],
      "stage" : 1
    },
    {
      "bytes" : 20480,
      "dtype" : "BF16",
      "file" : "s1_multi.bin",
      "name" : "multi",
      "sha256" : "689af368724ac81032a5810d3f4bd5fdff9a684d3fb88562305ffc203977088d",
      "shape" : [
        1,
        1,
        10240
      ],
      "stage" : 1
    }
  ],
  "trace_bytes" : 5811200
}
````

### product-selection-producer-v1/build-identity.json

Original bytes: 74780. SHA-256: `e6bc8f00f17792d691d41488d16de20e46114947954083eb0336ee651a58abbd`.

Normalized bytes: 74780. SHA-256: `e6bc8f00f17792d691d41488d16de20e46114947954083eb0336ee651a58abbd`.

````text
{
  "binary_sha256": "e066b7a195ef50d8138062c5c24431af68c621a23b14f20b3e579b117d0a5b31",
  "checks_binary_sha256": "3485de4cc498894edf5ffe2b010232461502921817bc94d0b2c41d0c903fe24e",
  "mac_checks_sha256": "46f44a7e7dc077b6648af8b2ad3bbe583748009c407cc6cd59221c330ac2618d",
  "mac_app_sha256": "caeecac68b07d8c8d31e0f2fa9dc681ed6dba48b584833e13ff9ded70f9d6130",
  "source": {
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
    "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
    "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
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
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
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
    "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
    "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed"
  },
  "mac_build_inputs": {
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
      "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
      "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
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
      "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
      "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
      "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
      "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
      "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
      "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
      "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
      "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
      "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
      "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
      "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
      "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
      "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
      "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
      "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
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
      "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
      "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
      "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
      "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
      "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
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
      "apps/macos/Runtime/Inference.swift": "2030fd256295a202eeb192ab6dde89bb74eadca6f0b80a27394816ca471ef75a",
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
  },
  "test_sources_at_capture": {
    "apps/macos/Checks/AdverseChecks.swift": "b43ed2105b4c06e044501ebf3dbc467a1ceed169d9059e368891bc7ce2b909c6",
    "apps/macos/Checks/ArchiveChecks.swift": "ed0e4983dfc4930139e4d94207c693ad188bb9bdafe03fe0b68a8b5d65d49bdd",
    "apps/macos/Checks/AuditChecks.swift": "75118f5371e511d0d6c4ec18dfe56c313692aa517c3b35b463a5ab88d265b440",
    "apps/macos/Checks/BasicsChecks.swift": "fef7089a40b3de4d5f7d0d780839f010bed1eaac25c88064f202974e6af26850",
    "apps/macos/Checks/ContextChecks.swift": "cc56cc84f2225130609f5b3504c61696ec5f19e845b59df692b9ae7c15caebbc",
    "apps/macos/Checks/ModelVerificationChecks.swift": "aa99d4301f158a88442da562e9790c81c8abe6dedeeb71bd1274378b20f813df",
    "apps/macos/Checks/PerformanceChecks.swift": "080552498a9144f7a24ef3719c594e2adec3b121375e18fb069dbbe739c3f0ea",
    "apps/macos/Checks/PromotionChecks.swift": "aaac8edc75cf7ba6ceb00323a24e97f9b50a56d2117b196a6fc8de8af3f51da6",
    "apps/macos/Checks/RealBasicsChecks.swift": "2aacd24f2f6d571a6ffe2cec40dce5dda5bee919656d97633f7a913a63a0105d",
    "apps/macos/Checks/RealCacheChecks.swift": "e9427829bf26227d661a9bda2cbbfe6612fe306362b860e3298eb561a15e10cd",
    "apps/macos/Checks/RealChecks.swift": "53a5cbbd65f1c5742bf5cd756197ff352b65320200be7c95cb2e10132034f07a",
    "apps/macos/Checks/RealMetricsChecks.swift": "2ef1a5cfd35c9d2c36b66f565bfa070022770fd5897cde749bdb315cf0adfaa5",
    "apps/macos/Checks/RealSourceChecks.swift": "d1aef8736d57506dfcd39ec630cf3abcc66175b06a56b6746f07f93529b38f25",
    "apps/macos/Checks/RealSpeedChecks.swift": "7fea611dbd2385f90e533feba77de8fa0c46bed991531baabc86bb75d3fd50a2",
    "apps/macos/Checks/ReconciliationChecks.swift": "51da73ed1940ca3d84a82076e17e0df5fcb1b8f4df6c0139c70cbf9f2352692f",
    "apps/macos/Checks/ResponseDetailsChecks.swift": "3de8eeda08a9da5c28d12097b02e0975c07be3c36ee569b0a52b04a16f6019d0",
    "apps/macos/Checks/SourceNavigationChecks.swift": "355b27cb6bba7a279a0445fdf3acf59a21bc46d01e85e16a66069e0ced685a2d",
    "apps/macos/Checks/ThinkingChecks.swift": "acefaf9250d67fd23939b887027a1b8299c237dd0f69cca54c8883998f92c199",
    "apps/macos/Checks/UIFixture.swift": "8053b2249b1d3b1af92599ff1b0966135625c3b2bf9e4847079dfe0182735b96",
    "apps/macos/Checks/WriteBehindChecks.swift": "1ba9a0f1b8dfac22bf8694d6f0a57c0c93607263b5c0815ff84ec0fb3e73d7c0",
    "apps/macos/Checks/main.swift": "1b5c3bee05e6230737eedc03df2d9888bd1b5633b2e8702c3c835f45f0ead15c",
    "apps/macos/NativeChecks/AppsUIChecks.swift": "e260e795b776fd130c02e9d66c83bec66e86865dc8d8eed3bbc21a7ebe971442",
    "apps/macos/NativeChecks/MemoryUIChecks.swift": "0225cc55f15bcc59670a722271447ca1197966d241dca8e5e5fab7b09d910a07",
    "apps/macos/NativeChecks/ScrollChecks.swift": "ed06836429b2dc202ba02a0e8fa85b6ca9d276552444d485f19442239c6bf123",
    "apps/macos/NativeChecks/ThinkingUIChecks.swift": "5449489a7da18aec040388c3140b344f321259f0284124099b6b00a48450ab2e"
  },
  "scope": "Root sources match the completed second build. Final Mac production inputs match before/after its completed rebuild; check sources are separately identified at capture. No install, activation or release."
}
````
