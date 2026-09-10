---
type: run
id: 01m230hx2x0n2srdt8hfmpck17
created: 2026-09-09T11:58:48.925057+00:00
updated: 2026-09-09T11:58:49.230485+00:00
summary: Final static lease and external consumer preparation preserve original checks and guards
binary: No final binary compiled or invoked
captured_at: 2026-09-09
command: V528 six source-lease checks; V529 four source-archive and binding checks
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Final static lease and external consumer preparation preserve original checks and guards
tool: Slotstream exact native and source qualification capture
---
Prospective final-source delivery preparation only. Six intercepted static-lease tests preserve the original suite, guard and complete interval, including exact byte/mode/mtime/environment restoration, interruption, partial copy and foreign-edit preservation. Four external-consumer preparation tests reconstruct all150 actual V492 archive inputs in memory, reject wrong archive/member hashes or missing inventory, and retain the original consumer/executor/policy byte-for-byte. No final source archive is extracted, no final protocol is prepared, and no compiler, model or static suite is launched. Actual future execution requires exact verified final source; these tests do not substitute for it. Existing final gates and source evidence remain intact.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/checks.py",
    "bytes": 2259,
    "sha256": "8698d6efabd7efcfeceb89bc925e78ad3b85ffc4d009b6cb043cc5d77a5e4b88"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/checks.stderr",
    "bytes": 102,
    "sha256": "e0d9723408580ec4ea0058882d5d24bc509d89bc5b9b8d2442e52e48a89a5c36"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/prepare.py",
    "bytes": 4070,
    "sha256": "3c71bb64dae92930dae7f212c1999f8852be3cdb94caaf352552b361c854d833"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/run.py",
    "bytes": 4100,
    "sha256": "e691c3b178ee95317d2be9da272c316a9df3db90422070ec1d4bf63419580cae"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-static-v528/checks.py",
    "bytes": 5275,
    "sha256": "4042942ec4037633a801d6903aab320293044f862932c179150d01b3fceec631"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-static-v528/checks.stderr",
    "bytes": 832,
    "sha256": "b4203da567a25d28d25d98e37a1b81c95946d245034060ab82f6dd9b846b61c3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-static-v528/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-static-v528/run.py",
    "bytes": 7718,
    "sha256": "7b70bc5bbcb5c06236ae0311125a1f3101afd5bab4fbfce82d96c04ec8cbde13"
  }
]
```

## Artifact SHA-256 8698d6efabd7efcfeceb89bc925e78ad3b85ffc4d009b6cb043cc5d77a5e4b88

Encoding: `utf-8`. Original bytes: 2259.

````````````text
"""Model-free archive/binding checks; no final source is prepared or compiled."""
from pathlib import Path
import copy
import hashlib
import importlib.util
import unittest

HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('final_consumer_preparation',HERE/'prepare.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)


class Checks(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.build=m.c.bench.verified_build('/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream')

    def test_actual_prior_archive_reconstructs_all150_inputs_in_memory(self):
        files=m.archive_bytes(self.build)
        self.assertEqual(len(files),150)
        self.assertEqual({name:hashlib.sha256(data).hexdigest() for name,data in files.items()},self.build['identity']['source'])
        self.assertFalse((HERE/'source').exists())
        self.assertFalse((HERE/'template.json').exists())

    def test_wrong_archive_or_member_hash_cannot_prepare(self):
        build=copy.deepcopy(self.build);build['identity']['source_archive_sha256']='0'*64
        with self.assertRaises(ValueError):m.archive_bytes(build)
        build=copy.deepcopy(self.build);key=next(iter(build['identity']['source']));build['identity']['source'][key]='0'*64
        with self.assertRaises(ValueError):m.archive_bytes(build)

    def test_missing_inventory_entry_is_rejected(self):
        build=copy.deepcopy(self.build);build['identity']['source'].pop(next(iter(build['identity']['source'])))
        with self.assertRaises(ValueError):m.archive_bytes(build)

    def test_original_executor_consumer_and_policy_are_unchanged(self):
        self.assertEqual((HERE/'run.py').read_bytes(),(m.PRIOR/'run.py').read_bytes())
        original=m.c.read(m.PRIOR/'template.json')
        self.assertEqual(m.digest(m.PRIOR/'source/Tools/consumer_smoke.sh'),original['consumer_script_sha256'])
        self.assertEqual(original['policy'],{'startup_reclaimable_bytes':9500000000,'minimum_live_reclaimable_bytes':6000000000,'maximum_owned_rss_bytes':3000000000,'sample_interval_seconds':0.2,'maximum_build_seconds':600,'stop_on_new_swapouts':True})


if __name__=='__main__':unittest.main()

````````````

## Artifact SHA-256 e0d9723408580ec4ea0058882d5d24bc509d89bc5b9b8d2442e52e48a89a5c36

Encoding: `utf-8`. Original bytes: 102.

````````````text
....
----------------------------------------------------------------------
Ran 4 tests in 0.070s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 3c71bb64dae92930dae7f212c1999f8852be3cdb94caaf352552b361c854d833

Encoding: `utf-8`. Original bytes: 4070.

````````````text
"""Prepare the original external consumer from every exact final source byte."""
from pathlib import Path, PurePosixPath
import copy
import hashlib
import importlib.util
import json
import tarfile

HERE=Path(__file__).resolve().parent
BASE=Path('/tmp/slotstream-optimization-execution')
PRIOR=BASE/'automatic-scope-external-consumer-v451'
spec=importlib.util.spec_from_file_location('final_consumer_controls',BASE/'final-composition-controls-v524/controls.py')
controls=importlib.util.module_from_spec(spec);spec.loader.exec_module(controls)
require,digest,c=controls.require,controls.digest,controls.c


def archive_bytes(build):
    archive=Path(build['binary']).parent/'build-source.tar.gz'
    require(digest(archive)==build['identity']['source_archive_sha256'],'source archive changed')
    expected=build['identity']['source'];result={}
    with tarfile.open(archive,'r:gz') as source:
        for member in source:
            name=member.name;path=PurePosixPath(name)
            require(member.isfile() and name in expected and name not in result
                    and not path.is_absolute() and '..' not in path.parts
                    and str(path)==name,'source archive member differs from exact source inventory')
            payload=source.extractfile(member).read()
            require(hashlib.sha256(payload).hexdigest()==expected[name],'source archive payload changed')
            result[name]=payload
    require(set(result)==set(expected),'source archive is incomplete')
    return result


def main():
    require(not (HERE/'template.json').exists() and not (HERE/'source').exists(),'already prepared')
    build=controls.final_build()
    require(not c.bench.competing_jobs(),'model and compiler must drain before source preparation')
    files=archive_bytes(build)
    require(len(files)==150,'final source input inventory changed')
    old=c.read(PRIOR/'template.json')
    consumer=(PRIOR/'source/Tools/consumer_smoke.sh').read_bytes()
    require(hashlib.sha256(consumer).hexdigest()==old['consumer_script_sha256'],'original consumer changed')
    require((HERE/'run.py').read_bytes()==(PRIOR/'run.py').read_bytes(),'original consumer executor changed')
    source=HERE/'source'
    value=copy.deepcopy(old)
    value.update(classification='Actual external public-library consumer from all150 exact V519 final source inputs. All original public API/diagnostic and planner-lifetime preflight checks and four automatic-control/Codable assertions are unchanged. No Engine/model, empirical capacity, performance or activation.',
                 source_root=str(source),base_candidate=build,source_sha256=build['identity']['source'],
                 command=['bash',str(source/'Tools/consumer_smoke.sh')],
                 environment={'SLOTSTREAM_BUILD_JOBS':'1','SLOTSTREAM_LIFETIME_PLAN_RECEIPT':str(HERE/'planner-lifetime-preflight.json')})
    restored=copy.deepcopy(value)
    for key in ['classification','source_root','base_candidate','source_sha256','command','environment']:restored[key]=old[key]
    require(restored==old,'original consumer policy, driver or interval changed')
    for name,payload in files.items():
        path=source/name;path.parent.mkdir(parents=True,exist_ok=True)
        with path.open('xb') as output:output.write(payload)
    (source/'Tools/consumer_smoke.sh').write_bytes(consumer)
    require(all(digest(source/name)==sha for name,sha in value['source_sha256'].items()),'extracted source differs')
    c.write_new(HERE/'template.json',value)
    c.write_new(HERE/'preparation.json',{'source_only':True,'model_launched':False,'compiler_launched':False,
        'source_files':len(files),'template_sha256':digest(HERE/'template.json'),
        'preparer_sha256':digest(Path(__file__)),'original_template_sha256':digest(PRIOR/'template.json'),
        'original_consumer_sha256':old['consumer_script_sha256'],'source_audit_sha256':digest(controls.SOURCE)})
    print(json.dumps({'prepared':True,'source_files':len(files),'model_launched':False,'compiler_launched':False}))


if __name__=='__main__':main()

````````````

## Artifact SHA-256 e691c3b178ee95317d2be9da272c316a9df3db90422070ec1d4bf63419580cae

Encoding: `utf-8`. Original bytes: 4100.

````````````text
import datetime,fcntl,json,os,signal,sys,time
from pathlib import Path
ROOT=Path('/Users/carlos/Projects/slotstream');sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
P=Path(__file__).parent;S=json.loads((P/'template.json').read_text());source=Path(S['source_root']);start=time.monotonic()
deadline=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(deadline-time.time()-30)
if remaining<360:raise RuntimeError('external consumer needs at least six reserved minutes including its guard')
S['deadline_utc']=sys.argv[1];S['frozen_at']=datetime.datetime.now(datetime.timezone.utc).isoformat()
S['policy']['maximum_build_seconds']=min(600,remaining)
S['maximum_interval_seconds']=S['policy']['maximum_build_seconds']+20
S['wrapper_sha256']=digest(Path(__file__))
with (P/'protocol.json').open('x') as out:out.write(json.dumps(S,indent=2)+'\n')
r={'classification':S['classification'],'protocol_sha256':digest(P/'protocol.json'),'passed':False,'launched':False,'model_loaded':False}
def interrupted(number,_frame):raise KeyboardInterrupt(f'external consumer interrupted by signal {number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
def memory():
 s=vm_snapshot();require_normal(pressure_snapshot());return s
try:
 assert not (P/'manifest.json').exists()
 assert digest(Path(__file__))==S['wrapper_sha256']
 assert all(digest(ROOT/'Tools'/n)==h for n,h in S['drivers'].items())
 assert verified_build(S['base_candidate']['binary'])==S['base_candidate']
 assert all(digest(source/n)==h for n,h in S['source_sha256'].items())
 assert digest(source/'Tools/consumer_smoke.sh')==S['consumer_script_sha256']
 r['before']=preflight(9.5);require_normal(pressure_snapshot())
 if competing_jobs():raise RuntimeError('competing compiler/storage work; no consumer launched')
 with open(f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
  saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
  for k in saved:os.environ.pop(k)
  os.environ.update(S['environment'])
  try:
   r['launched']=True
   print('Starting isolated external-consumer compilation (-j1).',flush=True)
   with (P/'stdout.txt').open('w') as out,(P/'stderr.txt').open('w') as err:
    result=guarded_run(S['command'],cwd=source,stdout=out,stderr=err,record_path=P/'memory.json',snapshot=memory,policy=S['policy'],classification=S['classification'])
   r['exit_code']=result.returncode
   assert result.returncode==0 and json.loads((P/'memory.json').read_text())['passed'] is True
   output=(P/'stdout.txt').read_text()
   assert output.startswith('consumer ok: ') and output.rstrip().endswith('assertions')
   assert all(digest(source/n)==h for n,h in S['source_sha256'].items())
   r['passed']=True
  finally:
   os.environ.pop('SLOTSTREAM_BUILD_JOBS',None);os.environ.update(saved)
except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
finally:
 r['elapsed_seconds']=time.monotonic()-start
 (P/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
 for name,fn in [('after',vm_snapshot),('jobs',competing_jobs),('model_lock_free',lambda:bool(preflight(0))),
                 ('source_unchanged',lambda:all(digest(source/n)==h for n,h in S['source_sha256'].items()))]:
  try:r[name]=fn()
  except BaseException as e:r.setdefault('cleanup_errors',{})[name]=f'{type(e).__name__}: {e}'
 r['within_reservation']=time.time()<=deadline
 r['passed']=bool(r['passed'] and r['within_reservation'] and not r.get('cleanup_errors') and not r.get('jobs') and r.get('model_lock_free') and r.get('source_unchanged') and r['elapsed_seconds']<=S['maximum_interval_seconds'])
 (P/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)

````````````

## Artifact SHA-256 4042942ec4037633a801d6903aab320293044f862932c179150d01b3fceec631

Encoding: `utf-8`. Original bytes: 5275.

````````````text
"""Source-lease failure tests using tiny files and an intercepted static runner."""
import contextlib,datetime,fcntl,hashlib,importlib.util,io,json,os,signal,sys,tempfile,types,unittest
from pathlib import Path
from unittest.mock import patch
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('static_lease_under_test',HERE/'run.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
class Checks(unittest.TestCase):
 def exercise(self,mode):
  with tempfile.TemporaryDirectory() as temp:
   base=Path(temp);root=base/'root';packet=base/'static';build=base/'build'
   for p in [root/'Sources',root/'Tools',root/'.build/release',packet,build/'after/Sources']:p.mkdir(parents=True,exist_ok=True)
   (root/'Sources/A.swift').write_text('original A');(root/'Sources/B.swift').write_text('unrelated B');(root/'.build/release/slotstream').write_text('original executable')
   os.chmod(root/'Sources/A.swift',0o640);os.utime(root/'Sources/A.swift',ns=(1_000_000_000,2_000_000_000))
   for name in ['A','New']:(build/f'after/Sources/{name}.swift').write_text('candidate '+name)
   def graph():return {str(p.relative_to(root)):m.digest(p) for p in sorted((root/'Sources').glob('*.swift'))}
   old=graph();selected=dict(old);selected.update({f'Sources/{n}.swift':m.digest(build/f'after/Sources/{n}.swift') for n in ['A','New']})
   entries=[{'path':f'Sources/{n}.swift','before_sha256':old.get(f'Sources/{n}.swift'),'after_sha256':selected[f'Sources/{n}.swift']} for n in ['A','New']]
   (build/'before.json').write_text(json.dumps({'root_source':old,'source':entries,'release':{'slotstream':m.digest(root/'.build/release/slotstream')}}))
   (build/'protocol.json').write_text(json.dumps({'candidate_source':selected}));(build/'run.py').write_text('synthetic helper binding only')
   identity={'binary':str(root/'candidate/slotstream'),'identity':{'source':selected}}
   original_tree=m.lease.tree_state(root/'Sources/A.swift');calls=[]
   def run(command,**kw):
    calls.append(command);self.assertEqual(graph(),selected)
    if mode=='raise':raise RuntimeError('synthetic static failure')
    if mode=='interrupt':raise KeyboardInterrupt('synthetic interruption')
    if mode=='foreign':(root/'Sources/A.swift').write_text('foreign user edit')
    kw['stdout'].write('STATIC GATES PASS\n')
    return types.SimpleNamespace(returncode=1 if mode=='suite-failure' else 0)
   copy=m.shutil.copy2
   def copy_maybe_fail(src,dst,*args,**kwargs):
    if mode=='copy-failure' and str(dst).endswith('.v528-pending'):
     Path(dst).write_text('partial staged bytes');raise OSError('synthetic copy failure')
    return copy(src,dst,*args,**kwargs)
   deadline=(datetime.datetime.now(datetime.timezone.utc)+datetime.timedelta(hours=1)).isoformat()
   old_handlers={sig:signal.getsignal(sig) for sig in [signal.SIGINT,signal.SIGTERM]}
   existing={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
   try:
    with patch.object(m,'ROOT',root),patch.object(m,'HERE',packet),patch.object(m,'BUILD',build),patch.object(m,'LOCK_PATH',base/'model.lock'),patch.object(m.lease,'ROOT',root),patch.object(m,'source_files',side_effect=lambda _:sorted((root/'Sources').glob('*.swift'))),patch.object(m,'verified_build',return_value=identity),patch.object(m,'preflight',return_value={'reclaimable_bytes':9_500_000_000}),patch.object(m,'memory',return_value={}),patch.object(m,'vm_snapshot',return_value={}),patch.object(m,'competing_jobs',return_value=[]),patch.object(m,'guarded_run',side_effect=run),patch.object(m.shutil,'copy2',side_effect=copy_maybe_fail),patch.object(sys,'argv',[str(HERE/'run.py'),deadline]),contextlib.redirect_stdout(io.StringIO()):
     code=m.main()
   finally:
    for sig,handler in old_handlers.items():signal.signal(sig,handler)
   result=json.loads((packet/'manifest.json').read_text())
   self.assertEqual(code,0 if mode=='pass' else 1)
   self.assertEqual(result['passed'],mode=='pass')
   self.assertEqual((root/'Sources/B.swift').read_text(),'unrelated B')
   self.assertFalse((root/'Sources/New.swift').exists())
   self.assertFalse(list((root/'Sources').glob('*.v528-pending')))
   if mode=='foreign':
    self.assertEqual((root/'Sources/A.swift').read_text(),'foreign user edit');self.assertFalse(result['source_restored'])
   else:
    self.assertEqual(m.lease.tree_state(root/'Sources/A.swift'),original_tree);self.assertTrue(result['source_restored'])
   self.assertEqual(existing,{k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))})
   self.assertEqual(len(calls),0 if mode=='copy-failure' else 1)
   with (base/'model.lock').open('a') as lock:fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
 def test_success_restores_exact_bytes_mode_mtime_and_environment(self):self.exercise('pass')
 def test_failed_suite_restores_sources(self):self.exercise('suite-failure')
 def test_runner_exception_restores_sources(self):self.exercise('raise')
 def test_interruption_restores_sources(self):self.exercise('interrupt')
 def test_partial_copy_cannot_leave_candidate_or_temporary_source(self):self.exercise('copy-failure')
 def test_foreign_edit_is_preserved_while_other_preimages_restore(self):self.exercise('foreign')
if __name__=='__main__':unittest.main(verbosity=2)

````````````

## Artifact SHA-256 b4203da567a25d28d25d98e37a1b81c95946d245034060ab82f6dd9b846b61c3

Encoding: `utf-8`. Original bytes: 832.

````````````text
test_failed_suite_restores_sources (__main__.Checks.test_failed_suite_restores_sources) ... ok
test_foreign_edit_is_preserved_while_other_preimages_restore (__main__.Checks.test_foreign_edit_is_preserved_while_other_preimages_restore) ... ok
test_interruption_restores_sources (__main__.Checks.test_interruption_restores_sources) ... ok
test_partial_copy_cannot_leave_candidate_or_temporary_source (__main__.Checks.test_partial_copy_cannot_leave_candidate_or_temporary_source) ... ok
test_runner_exception_restores_sources (__main__.Checks.test_runner_exception_restores_sources) ... ok
test_success_restores_exact_bytes_mode_mtime_and_environment (__main__.Checks.test_success_restores_exact_bytes_mode_mtime_and_environment) ... ok

----------------------------------------------------------------------
Ran 6 tests in 0.051s

OK

````````````

## Artifact SHA-256 7b70bc5bbcb5c06236ae0311125a1f3101afd5bab4fbfce82d96c04ec8cbde13

Encoding: `utf-8`. Original bytes: 7718.

````````````text
"""Full original static suite on exact V519 binary AND temporarily leased sources.

The original V356 checked the selected binary but source-reading gates still
saw the shared reference checkout. This lease makes that scope explicit and
restores all source preimages/modes/mtimes before handback. No model runs.
"""
from pathlib import Path
import datetime,fcntl,importlib.util,json,os,shutil,signal,sys,time,traceback
ROOT=Path('/Users/carlos/Projects/slotstream');HERE=Path(__file__).resolve().parent
BASE=HERE.parent;BUILD=BASE/'final-composition-build-v519'
LOCK_PATH=Path(f'/tmp/slotstream-model-{os.getuid()}.lock')
sys.path.insert(0,str(ROOT/'Tools'))
from build_identity import source_files
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_serial_build import guarded_run
from optimization_readiness import pressure_snapshot,require_normal
spec=importlib.util.spec_from_file_location('verified_source_lease_helpers',BUILD/'run.py')
lease=importlib.util.module_from_spec(spec);spec.loader.exec_module(lease)
POLICY={'startup_reclaimable_bytes':7_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':3_000_000_000,'maximum_build_seconds':600,
 'sample_interval_seconds':.2,'stop_on_new_swapouts':False}

def sources():return {str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}
def memory():
 value=vm_snapshot();require_normal(pressure_snapshot());return value

def main():
 deadline=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
 if deadline-time.time()<620:raise RuntimeError('full600-second static work plus20-second cleanup must fit')
 if (HERE/'protocol.json').exists() or (HERE/'manifest.json').exists():raise RuntimeError('static identity already attempted')
 original=json.loads((BUILD/'before.json').read_text());declared=json.loads((BUILD/'protocol.json').read_text())
 build=verified_build(ROOT/'.build/optimization/final-composition-build-v519/candidate/slotstream')
 assert build['identity']['source']==declared['candidate_source']
 assert sources()==original['root_source']
 assert all(digest(ROOT/'.build/release'/n)==sha for n,sha in original['release'].items())
 protocol={'classification':'Original complete static suite against exact V519 binary and all150 candidate source inputs under a reversible16-file source lease. Original600-second work/620-second whole interval and7/3/3GBstatic envelope. No Engine/model/performance/default activation.',
  'build':build,'source_inputs':declared['candidate_source'],'shared_preimages':original['root_source'],
  'lease_files':original['source'],'shared_release':original['release'],'executor_sha256':digest(Path(__file__)),
  'lease_helper_sha256':digest(BUILD/'run.py'),'command':['bash',str(ROOT/'Tools/static_gates.sh')],
  'environment':{'SLOTSTREAM_TEST_BINARY':str(build['binary'])},'policy':POLICY,'deadline_utc':sys.argv[1],
  'maximum_whole_interval_seconds':620,'drivers':{str(p.relative_to(ROOT)):digest(p) for p in sorted((ROOT/'Tools').rglob('*')) if p.is_file() and p.suffix in ['.py','.sh','.mjs','.json'] and '__pycache__' not in p.parts}}
 (HERE/'protocol.json').write_text(json.dumps(protocol,indent=2)+'\n')
 result={'classification':protocol['classification'],'started_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'protocol_sha256':digest(HERE/'protocol.json'),'passed':False,'source_restored':False,'model_loaded':False}
 started=time.monotonic();applied=[];pending_files=[];before=None
 def interrupted(number,_frame):raise KeyboardInterrupt(f'static lease interrupted by signal{number}')
 signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
 saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
 paths=[ROOT/e['path'] for e in original['source']]
 try:
  result['before']=preflight(7);memory();assert not competing_jobs()
  with open(LOCK_PATH,'a') as lock:
   fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
   assert sources()==original['root_source']
   before=lease.snapshot(paths,HERE/'source-before')
   (HERE/'source-before.json').write_text(json.dumps(before,indent=2)+'\n')
   try:
    for entry in original['source']:
     source=BUILD/'after'/entry['path'];assert digest(source)==entry['after_sha256']
     path=ROOT/entry['path'];pending=path.with_suffix(path.suffix+'.v528-pending')
     assert not pending.exists(),'temporary source path already exists'
     pending_files.append(pending)
     shutil.copy2(source,pending);pending.replace(path);applied.append(entry)
    assert sources()==declared['candidate_source'];result['exact_candidate_sources_applied']=True
    for key in saved:os.environ.pop(key,None)
    os.environ.update(protocol['environment'])
    with (HERE/'stdout.txt').open('w') as stdout,(HERE/'stderr.txt').open('w') as stderr:
     status=guarded_run(protocol['command'],cwd=ROOT,stdout=stdout,stderr=stderr,record_path=HERE/'memory.json',snapshot=memory,policy=POLICY,classification=protocol['classification'])
    result['exit_code']=status.returncode
    result['suite_passed']=status.returncode==0 and (HERE/'stdout.txt').read_text().rstrip().endswith('STATIC GATES PASS')
    result['passed']=result['suite_passed']
   finally:
    for key in list(os.environ):
     if key.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(key,None)
    os.environ.update(saved)
    for pending in pending_files:
     if pending.exists():pending.unlink()
    applied_paths={e['path']:e['after_sha256'] for e in applied}
    safe=[];changed=[]
    for path in paths:
     relative=str(path.relative_to(ROOT))
     matches=(path.is_file() and digest(path)==applied_paths[relative]) if relative in applied_paths else lease.tree_state(path)==before[relative]
     (safe if matches else changed).append(path)
    lease.restore(safe,HERE/'source-before',{str(path.relative_to(ROOT)):before[str(path.relative_to(ROOT))] for path in safe})
    assert not changed,'source changed outside lease; foreign edits preserved, other preimages restored'
    assert sources()==original['root_source'];result['source_restored']=True
 except BaseException as error:
  result['passed']=False;result['error']=f'{type(error).__name__}: {error}';result['traceback']=traceback.format_exc()
 finally:
  result['elapsed_seconds']=time.monotonic()-started
  for key,fn in {'after':vm_snapshot,'candidate_unchanged':lambda:verified_build(build['binary'])==build,
    'sources_restored_exactly':lambda:sources()==original['root_source'],
    'release_unchanged':lambda:all(digest(ROOT/'.build/release'/n)==sha for n,sha in original['release'].items()),
    'drivers_unchanged':lambda:all(digest(ROOT/n)==sha for n,sha in protocol['drivers'].items()),
    'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
   try:result[key]=fn()
   except BaseException as error:result.setdefault('cleanup_errors',{})[key]=f'{type(error).__name__}: {error}'
  result['within_reservation']=time.time()<=deadline
  result['passed']=bool(result['passed'] and result.get('source_restored') and result.get('sources_restored_exactly') and result.get('release_unchanged') and result.get('candidate_unchanged') and result.get('drivers_unchanged') and not result.get('remaining_jobs') and result.get('model_lock_free') and not result.get('cleanup_errors') and result['within_reservation'] and result['elapsed_seconds']<=620)
  (HERE/'manifest.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps({k:v for k,v in result.items() if k not in ['before','after']},indent=2),flush=True)
 return 0 if result['passed'] else 1
if __name__=='__main__':raise SystemExit(main())

````````````
