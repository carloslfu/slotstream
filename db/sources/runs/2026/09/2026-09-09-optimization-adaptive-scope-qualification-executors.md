---
type: run
id: 01m22nb183wmtr82002jn0g0hh
created: 2026-09-09T08:42:49.475424+00:00
updated: 2026-09-09T08:42:49.842874+00:00
summary: Prepared execution code for exact smaller-scope build, pure checks and all seven native cases
binary: /Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream
captured_at: 2026-09-09
command: Python syntax checks, exact original build-executor comparison and five model-free native-adapter checks; new build and native preparation not executed
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Prepared execution code for exact smaller-scope build, pure checks and all seven native cases
tool: Slotstream exact native and source qualification capture
---
These are executable scripts for qualifying V491 after V484 has drained, not a compiled or measured result. The cached-build executor differs from V436 only in fresh identity/output/restoration filenames and retains the original1250-second full reservation,1220-second lease ceiling and every original memory/source/restoration guard. Its preparation refuses while a model/compiler owns the Mac. Pure/CLI execution preserves all22840 prior named assertion multiplicities and116 CLI cases, adding actual sizing assertions. Native execution reuses the original V439/V444 run, guard and assessment function bodies with unchanged commands except candidate path, all seven original cases, original900/1800-second work plus30 cleanup and original resource policies. An additional assessor preserves every latest V436 assertion name/multiplicity and requires both actual intermediate process/device choices. Five model-free checks pass, including original-policy dispatch interception and refusal of old lifecycle evidence for new sizing. Initial test-fixture errors used the wrong exception class and tried to inspect generated-function source; their bytes are preserved beside corrected passing checks. No build, new binary, native preparation, model or performance claim exists yet. V484 continues unchanged.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-scope-build-v492/prepare.py",
    "bytes": 4647,
    "sha256": "c443e84a0751b20402afeef3f117557f2ec7d237bb46205f7aba602a722c8c35"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-scope-build-v492/run.py",
    "bytes": 10172,
    "sha256": "4249efb40ffa6286b262877bba0dc04abd2b563330122cdbd7a765f9c296684e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-scope-metadata-v495/run.py",
    "bytes": 6160,
    "sha256": "0bae4c9b7c4b2eef0b228630bd8a0ae7883eddcfac134451e9facb7261e2e3f1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/checks.py",
    "bytes": 4514,
    "sha256": "0fb35945836c1bf201c9be8c8f9f01a4cc0f06a0a411132dd8923e607ad87c1c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/checks.stderr",
    "bytes": 103,
    "sha256": "e7b106218234ce20024c04efc8fc28a1c396fadd7703e3e0a18a28b6821c90e8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/initial-checks.py",
    "bytes": 4546,
    "sha256": "12b785e2463fd2401c1a20aa0f5ecfecafe63dd7d63a57a81838eb9e4cd71bb9"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/initial-checks.stderr",
    "bytes": 4256,
    "sha256": "9a9d13e3e6b3d65f95ca11410a533806a1efe19b11ae994669dd372942b674a8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/initial-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/run.py",
    "bytes": 7611,
    "sha256": "cd287f95c4ef989a807ebfcffbd3c15b72563c4496e0dbd27411d130a700f937"
  }
]
```

## Artifact SHA-256 c443e84a0751b20402afeef3f117557f2ec7d237bb46205f7aba602a722c8c35

Encoding: `utf-8`. Original bytes: 4647.

````````````text
"""Prepare an exact source lease after the current model has fully drained."""
from pathlib import Path
import datetime
import fcntl
import hashlib
import json
import os
import shutil
import sys

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
ROOT = Path('/Users/carlos/Projects/slotstream')
DRAFT = BASE / 'adaptive-scope-choice-v491'
PRIOR = BASE / 'automatic-scope-build-v436'
sys.path.insert(0, str(ROOT / 'Tools'))
from build_identity import source_files
from prefill_bench import digest
from serve_bench import competing_jobs


def write(path, value):
    with path.open('x') as stream:
        stream.write(json.dumps(value, indent=2) + '\n')


def main():
    assert not (HERE / 'protocol.json').exists(), 'already prepared'
    assert not (ROOT / '.build/optimization/adaptive-scope-build-v492').exists(), 'already attempted'
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        assert not competing_jobs(), 'model/compiler must drain before preparation'
        previous = json.loads((PRIOR / 'before.json').read_text())
        old_protocol = json.loads((PRIOR / 'protocol.json').read_text())
        audit = json.loads((DRAFT / 'source-audit.json').read_text())
        assert digest(PRIOR / 'protocol.json') == audit['base_protocol_sha256']
        actual = {str(p.relative_to(ROOT)): digest(p) for p in source_files(ROOT)}
        assert actual == previous['root_source'], 'shared source changed; no lease'
        assert all(digest(ROOT / '.build/release' / n) == h for n, h in previous['release'].items())
        files, candidate = [], dict(actual)
        for entry in previous['source']:
            name = entry['path']
            before, after = DRAFT / 'before' / name, DRAFT / 'after' / name
            assert digest(before) == old_protocol['candidate_source'][name]
            expected = audit['changed_files'].get(name, {}).get('after_sha256', digest(before))
            assert digest(after) == expected
            path = ROOT / name
            assert (digest(path) if path.exists() else None) == entry['before_sha256']
            for source, destination in [(after, HERE / 'after' / name),
                                         (path, HERE / 'source-before' / name)]:
                if source.exists():
                    destination.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copy2(source, destination)
            files.append({'path': name, 'before_sha256': entry['before_sha256'], 'after_sha256': expected})
            candidate[name] = expected
        for name in previous['release']:
            target = HERE / 'release-before' / name
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(ROOT / '.build/release' / name, target)
        now = datetime.datetime.now(datetime.timezone.utc).isoformat()
        classification = ('Exact V436 plus bounded smaller-scope sizing V491. '
                          'All previous source/tests, numerical shapes, request/process guards and defaults remain. '
                          'New exact compilation and qualification required; no prior-source performance relabeling.')
        write(HERE / 'before.json', {'captured_at': now, 'source': files,
              'release': previous['release'], 'root_source': actual, 'state': classification})
        protocol = {k: old_protocol[k] for k in ['drivers', 'policy',
                    'maximum_whole_interval_seconds', 'required_complete_reservation_seconds', 'source_lease']}
        protocol.update({'classification': classification, 'frozen_at': now, 'candidate_source': candidate,
                         'wrapper_sha256': digest(HERE / 'run.py'),
                         'prior_build': {'protocol': str(PRIOR / 'protocol.json'),
                                         'sha256': digest(PRIOR / 'protocol.json')},
                         'source_audit': {'path': str(DRAFT / 'source-audit.json'),
                                          'sha256': digest(DRAFT / 'source-audit.json')},
                         'changes_from_v436': audit['changed_files'], 'prepared_without_model': True})
        assert protocol['required_complete_reservation_seconds'] == 1250
        assert protocol['maximum_whole_interval_seconds'] == 1220
        assert len(files) == 16 and len(candidate) == 150
        write(HERE / 'protocol.json', protocol)
    print(json.dumps({'prepared': True, 'model_launched': False, 'source_files': len(candidate),
                      'protocol_sha256': digest(HERE / 'protocol.json')}))


if __name__ == '__main__':
    main()

````````````

## Artifact SHA-256 4249efb40ffa6286b262877bba0dc04abd2b563330122cdbd7a765f9c296684e

Encoding: `utf-8`. Original bytes: 10172.

````````````text
from pathlib import Path
import datetime,fcntl,json,os,shutil,signal,stat,subprocess,sys,time,traceback
ROOT=Path("/Users/carlos/Projects/slotstream")
PACKET=Path(__file__).parent
sys.path.insert(0,str(ROOT/"Tools"))
from build_identity import source_files
from optimization_build import build
from optimization_serial_build import POLICY,guarded_run,check_whole_interval
from prefill_bench import digest,vm_snapshot
from serve_bench import competing_jobs
from optimization_readiness import pressure_snapshot,require_normal

def tree_state(path):
    if path.is_symlink(): return {"kind":"symlink","target":os.readlink(path),"mode":stat.S_IMODE(path.lstat().st_mode)}
    if not path.exists(): return {"kind":"absent"}
    if path.is_file(): return {"kind":"file","sha256":digest(path),"mode":stat.S_IMODE(path.stat().st_mode),"mtime_ns":path.stat().st_mtime_ns}
    return {"kind":"directory","mode":stat.S_IMODE(path.stat().st_mode),"entries":{str(p.relative_to(path)):tree_state(p) for p in sorted(path.iterdir())}}

def clone(path,destination):
    destination.parent.mkdir(parents=True,exist_ok=True)
    subprocess.run(["/bin/cp","-cRp",str(path),str(destination)],check=True,capture_output=True,text=True)

def snapshot(paths,backup):
    result={}
    for path in paths:
        relative=path.relative_to(ROOT)
        result[str(relative)]=tree_state(path)
        if path.exists() or path.is_symlink(): clone(path,backup/relative)
    return result

def restore(paths,backup,expected):
    for path in paths:
        if path.is_symlink() or path.is_file(): path.unlink()
        elif path.is_dir(): shutil.rmtree(path)
        original=backup/path.relative_to(ROOT)
        if original.exists() or original.is_symlink(): clone(original,path)
    actual={str(path.relative_to(ROOT)):tree_state(path) for path in paths}
    if actual!=expected: raise RuntimeError("leased build state was not restored exactly")

def restore_link(path,expected):
    if tree_state(path)==expected: return
    if path.is_symlink() or path.is_file(): path.unlink()
    elif path.exists():
        # Preserve any unexpected SwiftPM alias directory for diagnosis.
        quarantine=path.with_name(path.name+".v492-unexpected")
        if quarantine.exists() or quarantine.is_symlink(): raise RuntimeError("release-alias quarantine already exists")
        path.rename(quarantine)
    path.symlink_to(expected['target'])
    if tree_state(path)!=expected: raise RuntimeError("release alias was not restored exactly")

def observed_memory():
    state=vm_snapshot();require_normal(pressure_snapshot());return state

def main():
    deadline=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
    assert deadline-time.time()>=1250, 'complete lease must fit the explicitly granted interval'
    output=ROOT/".build/optimization/adaptive-scope-build-v492"
    receipt=PACKET/"lease-result.json"
    assert not output.exists() and not receipt.exists()
    protocol=json.loads((PACKET/"protocol.json").read_text())
    original=json.loads((PACKET/"before.json").read_text())
    files=original["source"]
    frozen={"source":original["root_source"]}
    for name,sha in protocol["drivers"].items(): assert digest(ROOT/"Tools"/name)==sha
    def interrupted(number,_frame): raise KeyboardInterrupt(f"lease interrupted by signal {number}")
    signal.signal(signal.SIGTERM,interrupted);signal.signal(signal.SIGINT,interrupted)
    record={"classification":"temporary cached build lease; no model or performance result", "started_at":datetime.datetime.now(datetime.timezone.utc).isoformat(),"protocol_sha256":digest(PACKET/"protocol.json"),"passed":False,"restored":False}
    started=time.monotonic();leased=False;result=None;state_paths=[];state_before=None;applied=[]
    release=ROOT/".build/arm64-apple-macosx/release"
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock","a") as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        record["before"]=vm_snapshot()
        record["before_pressure"]=pressure_snapshot();require_normal(record["before_pressure"])
        if record["before"]["reclaimable_bytes"]<POLICY["startup_reclaimable_bytes"]: raise RuntimeError("cached lease headroom unavailable; no mutation")
        assert not competing_jobs()
        assert (ROOT/".build/release").is_symlink()
        link_state=tree_state(ROOT/".build/release")
        link=link_state['target'];record["release_symlink_before"]=link_state
        assert {str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}==frozen["source"]
        for entry in files:
            path=ROOT/entry["path"];assert (digest(path) if path.exists() else None)==entry["before_sha256"]
        assert all(digest(ROOT/".build/release"/n)==h for n,h in original["release"].items())
        source_before={entry['path']:tree_state(ROOT/entry['path']) for entry in files}
        release_before={name:tree_state(ROOT/'.build/release'/name) for name in original['release']}
        state_paths=sorted([p for p in release.iterdir() if p.is_dir() and ("slotstream" in p.name.lower() or "cslotpack" in p.name.lower())])
        state_paths += [release/"Modules",ROOT/".build/build.db",ROOT/".build/build.db-wal",ROOT/".build/build.db-shm",ROOT/".build/release.yaml",ROOT/".build/workspace-state.json",release/"description.json"]
        state_before=snapshot(state_paths,PACKET/"build-state-before")
        (PACKET/"build-state-before.json").write_text(json.dumps(state_before,indent=2)+"\n")
        try:
            leased=True
            for entry in files:
                path=ROOT/entry["path"];after=PACKET/"after"/entry["path"]
                assert digest(after)==entry["after_sha256"]
                pending=path.with_suffix(path.suffix+".v492-pending");shutil.copy2(after,pending);pending.replace(path)
                applied.append(entry)
            actual={str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}
            assert actual==protocol["candidate_source"]
            record["source_applied"]=True
            result=build(ROOT,output,required_gb=9.5,jobs=1,lock_path=PACKET/"inner-build.lock",
                run=lambda command,**kwargs:guarded_run(command,**kwargs,record_path=output/"live-memory.json",snapshot=observed_memory))
            record["build_passed"]=result["passed"]
            live=json.loads((output/"live-memory.json").read_text()) if (output/"live-memory.json").exists() else {}
            check_whole_interval(result,record["before"],vm_snapshot(),time.monotonic()-started,live)
            record["passed"]=True
        except BaseException as error:
            record["error"]=f"{type(error).__name__}: {error}"
            record["traceback"]=traceback.format_exc()
        finally:
            try: record["before_restoration"]=vm_snapshot()
            except BaseException as error: record['before_restoration_error']=f'{type(error).__name__}: {error}';record['passed']=False
            try:
                if leased:
                    for entry in applied:
                        path=ROOT/entry["path"];assert path.exists() and digest(path)==entry["after_sha256"],"source changed outside the lease"
                    for entry in applied:
                        path=ROOT/entry["path"]
                        if entry["before_sha256"] is None: path.unlink()
                        else:
                            pending=path.with_suffix(path.suffix+".v492-restore");shutil.copy2(PACKET/"source-before"/entry["path"],pending);pending.replace(path)
                    restore(state_paths,PACKET/"build-state-before",state_before)
                    restore_link(ROOT/".build/release",link_state)
                    for name,sha in original["release"].items():
                        path=ROOT/".build/release"/name;pending=path.with_name(path.name+".v492-restore")
                        shutil.copy2(PACKET/"release-before"/name,pending);pending.replace(path);assert digest(path)==sha
                assert {entry['path']:tree_state(ROOT/entry['path']) for entry in files}==source_before
                assert {name:tree_state(ROOT/'.build/release'/name) for name in original['release']}==release_before
                assert tree_state(ROOT/".build/release")==link_state
                assert {str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}==frozen["source"]
                assert not (ROOT/"Sources/Slotstream/PlannerCostModel.swift").exists()
                record["restored"]=True
            except BaseException as error:
                record["restoration_error"]=f"{type(error).__name__}: {error}";record["passed"]=False
            try: record["after"]=vm_snapshot()
            except BaseException as error: record['after_error']=f'{type(error).__name__}: {error}';record['passed']=False
            record["elapsed_seconds"]=time.monotonic()-started
            if record["elapsed_seconds"]>1220: record["passed"]=False;record["interval_error"]="lease/build/restoration exceeded1220seconds"
            try:
                if competing_jobs(): record["passed"]=False;record["process_error"]="compiler/model jobs remain at handback"
            except BaseException as error:
                record["passed"]=False;record['process_error']=f'{type(error).__name__}: {error}'
            if 'after' not in record or record["after"]["swapouts"]!=record["before"]["swapouts"] or record["after"]["reclaimable_bytes"]<6e9:
                record["passed"]=False;record["resource_error"]="complete lease resource interval failed"
            if not record["passed"] and (output/"candidate").exists(): (output/"candidate").rename(output/"unqualified-candidate")
            record['deadline_utc']=sys.argv[1]
            record['within_reservation']=time.time()<=deadline
            record['passed']=record['passed'] and record['within_reservation']
            receipt.write_text(json.dumps(record,indent=2)+"\n")
    print(json.dumps({k:v for k,v in record.items() if k not in ["before","after","before_restoration"]}),flush=True)
    return 0 if record["passed"] and record["restored"] else 1

if __name__=="__main__": raise SystemExit(main())

````````````

## Artifact SHA-256 0bae4c9b7c4b2eef0b228630bd8a0ae7883eddcfac134451e9facb7261e2e3f1

Encoding: `utf-8`. Original bytes: 6160.

````````````text
from pathlib import Path
import datetime,fcntl,json,os,sys,time
from collections import Counter
ROOT=Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,run_child,vm_snapshot
from serve_bench import verified_build
P=Path(__file__).parent
OUT=ROOT/'.build/optimization/adaptive-scope-metadata-v495'
B=ROOT/'.build/optimization/adaptive-scope-build-v492/candidate/slotstream'
r={'classification':'V492 T0 pure Swift and CLI metadata/pre-allocation refusals only. No compiler, GPU test tier, Engine or model. Run after the build has restored and no model/compiler remains. Original300-second wall allowance plus30-second cleanup; no performance qualification.','candidate':verified_build(B),'checks_sha256':digest(B.parent/'slotstream-checks'),'driver_sha256':digest(Path(__file__)),'tool_sha256':{n:digest(ROOT/'Tools'/n) for n in ['context_gates.py','prefill_bench.py','serve_bench.py']},'required_reclaimable_gb':7,'rows':[],'passed':False}
deadline=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
if deadline-time.time()<330:raise RuntimeError('metadata needs its full300-second allowance plus30-second cleanup')
baseline=ROOT/'.build/optimization/automatic-scope-metadata-v438/t0/stdout.txt'
baseline_manifest=ROOT/'.build/optimization/automatic-scope-metadata-v438/manifest.json'
assert json.loads(baseline_manifest.read_text())['passed'] is True
old_report=json.loads(baseline.read_text())
old_coverage={check['name']:Counter(i['name'] for i in check['items']) for check in old_report['checks']}
r['baseline_t0_sha256']=digest(baseline)
r['baseline_manifest_sha256']=digest(baseline_manifest)
r['deadline_utc']=sys.argv[1]
start=time.monotonic()
OUT.mkdir(exist_ok=False)
env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
try:
    r['before']=preflight(7)
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        for name,command,timeout in [('t0',[str(B.parent/'slotstream-checks'),'--tier','t0','--json'],60),('context-cli',['python3',str(ROOT/'Tools/context_gates.py'),'--binary',str(B),'--report',str(OUT/'context-cli/report.json')],240)]:
            out=OUT/name;out.mkdir();row={'name':name,'command':command,'timeout_seconds':timeout,'passed':False};r['rows'].append(row)
            row['exit_code']=run_child(command,env,out,timeout)
            if name=='t0':
                report=json.loads((out/'stdout.txt').read_text());checks=report.get('checks',[])
                row['assertions']=sum(len(c.get('items',[])) for c in checks)
                row['passed']=row['exit_code']==0 and report.get('passed')==33 and report.get('failed')==0 and report.get('skipped')==0 and len(checks)==33 and row['assertions']>22840 and all(c.get('passed') is True and c.get('items') and all(i.get('passed') is True for i in c['items']) for c in checks)
                coverage={check['name']:Counter(i['name'] for i in check['items']) for check in checks}
                preserved=set(coverage)==set(old_coverage) and all(not (items-coverage[name]) for name,items in old_coverage.items())
                names={i['name'] for check in checks for i in check['items']}
                required={'adaptive scope enumerates all full-pass sizes/256',
                    'adaptive scope enumerates all full-pass sizes/512',
                    'adaptive scope enumerates all full-pass sizes/1024',
                    'concurrent multiple choices all fit without double spending',
                    'concurrent multiple choices allocate one largest scope',
                    'concurrent multiple choices allocate one smaller scope',
                    'concurrent multiple choices retain one ordinary fallback',
                    'concurrent multiple choices charge selected bytes once',
                    'concurrent multiple choices release every lease',
                    'multiple choices charge own and queued preparation before selecting',
                    'ordinary unsigned Mach footprint converts without truncation',
                    'unrepresentable Mach footprint cannot authorize an optional workspace',
                    'concurrent optional choices both complete',
                    'exactly one preferred workspace owns the available room',
                    'the other concurrent request atomically selects its fallback',
                    'optional scope fits the exact process boundary',
                    'one excess byte keeps the ordinary path',
                    '512-row planner preserves its own arithmetic',
                    '1024-row planner preserves its own arithmetic'}
                row['all_original_assertion_names_and_multiplicities_preserved']=preserved
                row['new_critical_assertions_present']=required<=names
                row['passed']=bool(row['passed'] and preserved and required<=names)
            else:
                report=json.loads((out/'report.json').read_text());items=report['assertions'];row['assertions']=len(items)
                row['passed']=row['exit_code']==0 and report.get('passed') is True and len(items)==116 and all(i.get('passed') is True for i in items)
            row['stdout_sha256']=digest(out/'stdout.txt');row['stderr_sha256']=digest(out/'stderr.txt')
            (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');print(json.dumps(row),flush=True)
            if not row['passed']:raise RuntimeError(name+' failed')
        r['passed']=len(r['rows'])==2 and all(row['passed'] for row in r['rows'])
except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
finally:
    r['after']=vm_snapshot();r['elapsed_seconds']=time.monotonic()-start
    r['within_reservation']=time.time()<=deadline
    r['passed']=bool(r['passed'] and r['within_reservation'] and verified_build(B)==r['candidate'])
    (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['candidate','before','after','rows']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)

````````````

## Artifact SHA-256 0fb35945836c1bf201c9be8c8f9f01a4cc0f06a0a411132dd8923e607ad87c1c

Encoding: `utf-8`. Original bytes: 4514.

````````````text
"""Model-free native-adapter contract checks; synthetic rows cannot qualify a run."""
from pathlib import Path
import copy
import datetime
import importlib.util
import inspect
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('v496_adapter_checks', HERE / 'run.py')
runner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(runner)


def current(name):
    return runner.c.read(runner.BASELINES[name] / 'stdout.txt')


def fixture(name):
    report = copy.deepcopy(current(name))
    if name == 'scope-lifecycle':
        report['measurements']['automatic_intermediate_memory_choices'] = 2
        for budget in ['process', 'device']:
            for label in ['actually rejects a larger candidate', 'commits four-pass groups',
                          'retains exact output', 'retains every compute shape', 'retains exact ordered routes',
                          'reduces actual expert reads', 'preserves the cold checkpoint',
                          'preserves the odd tail', 'teacher-forced continuation is exact']:
                report['items'].append({'name': f'smaller automatic scope {label}/{budget}', 'passed': True})
    return report


class Checks(unittest.TestCase):
    def test_original_execution_and_commands_preserved(self):
        for module, path in [(runner.scope, runner.SCOPE), (runner.integration, runner.INTEGRATION)]:
            original = runner.module('unmodified_' + path.parent.name, path)
            self.assertEqual(inspect.getsource(module.run), inspect.getsource(original.run))
            self.assertEqual(module.EXECUTE_SOURCE, original.EXECUTE_SOURCE)
            for name in module.NATIVE:
                self.assertEqual(module.policy(name), original.policy(name))
                self.assertEqual(module.seconds(name), original.seconds(name))
                expected = [part.replace(str(original.BINARY), str(runner.BINARY))
                            for part in original.commands()[name]]
                self.assertEqual(module.commands()[name], expected)

    def test_old_lifecycle_cannot_claim_new_sizing(self):
        with self.assertRaisesRegex(ValueError, 'actual intermediate memory choices absent'):
            runner.assess('scope-lifecycle', current('scope-lifecycle'))
        report = fixture('scope-lifecycle')
        self.assertTrue(runner.assess('scope-lifecycle', report)['qualified'])
        report['items'] = [item for item in report['items'] if item['name'] !=
                           'smaller automatic scope teacher-forced continuation is exact/device']
        with self.assertRaisesRegex(ValueError, 'bounded native sizing coverage absent'):
            runner.assess('scope-lifecycle', report)

    def test_all_seven_keep_every_prior_assertion(self):
        for name in runner.NATIVE:
            report = fixture(name)
            self.assertTrue(runner.assess(name, report)['qualified'])
            report['items'].pop(0)
            with self.assertRaises(ValueError):
                runner.assess(name, report)

    def test_short_reservation_refuses_before_source_or_model_access(self):
        deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(seconds=1)).isoformat()
        for name, owner in runner.OWNERS.items():
            with patch.object(owner, 'load', side_effect=AssertionError('must not inspect build')) as load:
                with self.assertRaises(ValueError):
                    owner.run(name, deadline)
                load.assert_not_called()

    def test_actual_dispatch_keeps_original_admission(self):
        deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(hours=2)).isoformat()
        for name, owner in runner.OWNERS.items():
            with patch.object(owner, 'load', return_value={}), \
                 patch.object(owner, 'readiness', side_effect=RuntimeError('intercepted original admission')) as ready, \
                 patch.object(owner, 'execute', side_effect=AssertionError('model must not launch')) as execute:
                with self.assertRaisesRegex(RuntimeError, 'intercepted original admission'):
                    owner.run(name, deadline)
                ready.assert_called_once_with(deadline, owner.seconds(name) + 30,
                                               20.112 if name.startswith('scope-') else 22.2)
                execute.assert_not_called()


if __name__ == '__main__':
    unittest.main()

````````````

## Artifact SHA-256 e7b106218234ce20024c04efc8fc28a1c396fadd7703e3e0a18a28b6821c90e8

Encoding: `utf-8`. Original bytes: 103.

````````````text
.....
----------------------------------------------------------------------
Ran 5 tests in 0.033s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 12b785e2463fd2401c1a20aa0f5ecfecafe63dd7d63a57a81838eb9e4cd71bb9

Encoding: `utf-8`. Original bytes: 4546.

````````````text
"""Model-free native-adapter contract checks; synthetic rows cannot qualify a run."""
from pathlib import Path
import copy
import datetime
import importlib.util
import inspect
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('v496_adapter_checks', HERE / 'run.py')
runner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(runner)


def current(name):
    return runner.c.read(runner.BASELINES[name] / 'stdout.txt')


def fixture(name):
    report = copy.deepcopy(current(name))
    if name == 'scope-lifecycle':
        report['measurements']['automatic_intermediate_memory_choices'] = 2
        for budget in ['process', 'device']:
            for label in ['actually rejects a larger candidate', 'commits four-pass groups',
                          'retains exact output', 'retains every compute shape', 'retains exact ordered routes',
                          'reduces actual expert reads', 'preserves the cold checkpoint',
                          'preserves the odd tail', 'teacher-forced continuation is exact']:
                report['items'].append({'name': f'smaller automatic scope {label}/{budget}', 'passed': True})
    return report


class Checks(unittest.TestCase):
    def test_original_execution_and_commands_preserved(self):
        for module, path in [(runner.scope, runner.SCOPE), (runner.integration, runner.INTEGRATION)]:
            original = runner.module('unmodified_' + path.parent.name, path)
            self.assertEqual(inspect.getsource(module.run), inspect.getsource(original.run))
            self.assertEqual(inspect.getsource(module.execute), inspect.getsource(original.execute))
            for name in module.NATIVE:
                self.assertEqual(module.policy(name), original.policy(name))
                self.assertEqual(module.seconds(name), original.seconds(name))
                expected = [part.replace(str(original.BINARY), str(runner.BINARY))
                            for part in original.commands()[name]]
                self.assertEqual(module.commands()[name], expected)

    def test_old_lifecycle_cannot_claim_new_sizing(self):
        with self.assertRaisesRegex(RuntimeError, 'actual intermediate memory choices absent'):
            runner.assess('scope-lifecycle', current('scope-lifecycle'))
        report = fixture('scope-lifecycle')
        self.assertTrue(runner.assess('scope-lifecycle', report)['qualified'])
        report['items'] = [item for item in report['items'] if item['name'] !=
                           'smaller automatic scope teacher-forced continuation is exact/device']
        with self.assertRaisesRegex(RuntimeError, 'bounded native sizing coverage absent'):
            runner.assess('scope-lifecycle', report)

    def test_all_seven_keep_every_prior_assertion(self):
        for name in runner.NATIVE:
            report = fixture(name)
            self.assertTrue(runner.assess(name, report)['qualified'])
            report['items'].pop(0)
            with self.assertRaises(RuntimeError):
                runner.assess(name, report)

    def test_short_reservation_refuses_before_source_or_model_access(self):
        deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(seconds=1)).isoformat()
        for name, owner in runner.OWNERS.items():
            with patch.object(owner, 'load', side_effect=AssertionError('must not inspect build')) as load:
                with self.assertRaises(RuntimeError):
                    owner.run(name, deadline)
                load.assert_not_called()

    def test_actual_dispatch_keeps_original_admission(self):
        deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(hours=2)).isoformat()
        for name, owner in runner.OWNERS.items():
            with patch.object(owner, 'load', return_value={}), \
                 patch.object(owner, 'readiness', side_effect=RuntimeError('intercepted original admission')) as ready, \
                 patch.object(owner, 'execute', side_effect=AssertionError('model must not launch')) as execute:
                with self.assertRaisesRegex(RuntimeError, 'intercepted original admission'):
                    owner.run(name, deadline)
                ready.assert_called_once_with(deadline, owner.seconds(name) + 30,
                                               20.112 if name.startswith('scope-') else 22.2)
                execute.assert_not_called()


if __name__ == '__main__':
    unittest.main()

````````````

## Artifact SHA-256 9a9d13e3e6b3d65f95ca11410a533806a1efe19b11ae994669dd372942b674a8

Encoding: `utf-8`. Original bytes: 4256.

````````````text
.EEEE
======================================================================
ERROR: test_all_seven_keep_every_prior_assertion (__main__.Checks)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/checks.py", line 62, in test_all_seven_keep_every_prior_assertion
    runner.assess(name, report)
  File "/private/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/run.py", line 95, in assess
    result = ORIGINAL_ASSESS[name](name, report)
  File "/private/tmp/slotstream-optimization-execution/automatic-scope-native-v439/run.py", line 76, in assess
    require(report.get('name')==NATIVE[name][1] and report.get('passed') is True and report.get('skipped') is None and len(items)>=NATIVE[name][2] and all(x.get('passed') is True for x in items),'complete native assertions absent or failing')
  File "/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py", line 41, in require
    raise ValueError(message)
ValueError: complete native assertions absent or failing

======================================================================
ERROR: test_old_lifecycle_cannot_claim_new_sizing (__main__.Checks)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/checks.py", line 48, in test_old_lifecycle_cannot_claim_new_sizing
    runner.assess('scope-lifecycle', current('scope-lifecycle'))
  File "/private/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/run.py", line 101, in assess
    require(report.get('measurements', {}).get('automatic_intermediate_memory_choices') == 2,
  File "/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py", line 41, in require
    raise ValueError(message)
ValueError: actual intermediate memory choices absent

======================================================================
ERROR: test_original_execution_and_commands_preserved (__main__.Checks)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/checks.py", line 38, in test_original_execution_and_commands_preserved
    self.assertEqual(inspect.getsource(module.execute), inspect.getsource(original.execute))
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/inspect.py", line 1024, in getsource
    lines, lnum = getsourcelines(object)
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/inspect.py", line 1006, in getsourcelines
    lines, lnum = findsource(object)
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/inspect.py", line 827, in findsource
    raise OSError('source code not available')
OSError: source code not available

======================================================================
ERROR: test_short_reservation_refuses_before_source_or_model_access (__main__.Checks)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/adaptive-scope-native-v496/checks.py", line 69, in test_short_reservation_refuses_before_source_or_model_access
    owner.run(name, deadline)
  File "/private/tmp/slotstream-optimization-execution/automatic-scope-native-v439/run.py", line 104, in run
    allowance(deadline,seconds(name)+30);value=load();target=OUT/name
  File "/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py", line 51, in allowance
    require(deadline.timestamp() - time.time() >= seconds, 'original work allowance and cleanup must fit; no attempt claimed')
  File "/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py", line 41, in require
    raise ValueError(message)
ValueError: original work allowance and cleanup must fit; no attempt claimed

----------------------------------------------------------------------
Ran 5 tests in 0.024s

FAILED (errors=4)

````````````

## Artifact SHA-256 cd287f95c4ef989a807ebfcffbd3c15b72563c4496e0dbd27411d130a700f937

Encoding: `utf-8`. Original bytes: 7611.

````````````text
"""Reuse all seven original native executions on the exact smaller-scope build."""
from pathlib import Path
from collections import Counter
import argparse
import fcntl
import importlib.util
import json

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
ROOT = Path('/Users/carlos/Projects/slotstream')
OUT = ROOT / '.build/optimization/adaptive-scope-native-v496'
BUILD = BASE / 'adaptive-scope-build-v492'
BINARY = ROOT / '.build/optimization/adaptive-scope-build-v492/candidate/slotstream'
PURE = ROOT / '.build/optimization/adaptive-scope-metadata-v495/manifest.json'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


SCOPE = BASE / 'automatic-scope-native-v439/run.py'
INTEGRATION = BASE / 'automatic-scope-integration-native-v444/run.py'
scope = module('v496_original_scope', SCOPE)
integration = module('v496_original_integration', INTEGRATION)
c, require, digest = scope.c, scope.require, scope.digest
NATIVE = dict(scope.NATIVE, **integration.NATIVE)
OWNERS = {name: scope if name in scope.NATIVE else integration for name in NATIVE}
ORIGINAL_ASSESS = {name: owner.assess for name, owner in OWNERS.items()}
BASELINES = {name: ROOT / '.build/optimization' / (
    'automatic-scope-resumed-native-v459' if name in ['scope-lifecycle', 'scope-mtp-vision']
    else 'automatic-scope-native-v439' if name.startswith('scope-')
    else 'automatic-scope-integration-native-v444') / name for name in NATIVE}


def dependencies():
    files = [Path(__file__), HERE / 'checks.py', HERE / 'checks.stderr', SCOPE, INTEGRATION,
             BASE / 'adaptive-scope-choice-v491/source-audit.json',
             BUILD / 'protocol.json', BUILD / 'lease-result.json', PURE,
             scope.CORE, BASE / 'pressure-footprint-v341/guard_with_footprint.py',
             BASE / 'pressure-footprint-v341/pressure_footprint.py']
    files += [ROOT / 'Tools' / name for name in c.DRIVERS + ('thermal_readiness.py',)]
    files += [folder / file for folder in BASELINES.values() for file in ['stdout.txt', 'qualification.json']]
    # The unchanged original scope assessor also requires the original V404
    # report as well as the newer V436 baseline checked here.
    files += [ROOT / '.build/optimization/scope-allocation-scope-native-v404' / name / file
              for name in scope.NATIVE for file in ['stdout.txt', 'qualification.json']]
    return {str(p): digest(p) for p in files}


def commands():
    return dict(scope.commands(), **integration.commands())


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'already prepared or attempted')
    require('Ran 5 tests' in (HERE / 'checks.stderr').read_text()
            and (HERE / 'checks.stderr').read_text().endswith('OK\n'), 'model-free adapter checks missing')
    build = scope.verified_build(BINARY)
    lease, protocol, pure = c.read(BUILD / 'lease-result.json'), c.read(BUILD / 'protocol.json'), c.read(PURE)
    require(lease.get('passed') is True and lease.get('restored') is True, 'exact build or restoration failed')
    require(pure.get('passed') is True and pure['candidate'] == build, 'current pure/CLI proof missing')
    require(protocol['candidate_source'] == build['identity']['source'], 'source differs from draft')
    for name, folder in BASELINES.items():
        require(c.read(folder / 'qualification.json').get('qualified') is True, 'prior current native proof missing')
    record = {'prepared_at': scope.now(), 'build': build, 'dependencies': dependencies(),
              'commands': commands(), 'native_specs': NATIVE,
              'policies': {name: owner.policy(name) for name, owner in OWNERS.items()},
              'seconds': {name: owner.seconds(name) for name, owner in OWNERS.items()},
              'environment': {}, 'classification':
              'Exact V492 smaller-scope refinement. Reuses unchanged V439 scope and V444 integration '
              'executor/guard/assessment functions with original work and safety envelopes. '
              'All seven V436 assertion-name multiplicities must remain; lifecycle additionally requires '
              'actual process- and shared-device-limited intermediate scope choices and exact continuation. '
              'Native correctness only; no serving or default activation claim.'}
    c.write_new(HERE / 'preparation.json', record)
    return {'prepared': True, 'cases': list(NATIVE), 'model_launched': False}


def load():
    value = c.read(HERE / 'preparation.json')
    require(value['dependencies'] == dependencies(), 'source, baseline or executor changed')
    require(value['build'] == scope.verified_build(BINARY), 'compiled identity changed')
    require(value['commands'] == commands() and value['environment'] == {}, 'native commands changed')
    require(value['native_specs'] == {k: list(v) for k, v in NATIVE.items()}, 'native scope changed')
    require(value['policies'] == {n: o.policy(n) for n, o in OWNERS.items()}
            and value['seconds'] == {n: o.seconds(n) for n, o in OWNERS.items()}, 'original resource/interval policy changed')
    return value


def assess(name, report):
    result = ORIGINAL_ASSESS[name](name, report)
    previous = c.read(BASELINES[name] / 'stdout.txt')
    before = Counter(item['name'] for item in previous['items'])
    after = Counter(item['name'] for item in report['items'])
    require(not before - after, 'V436 assertion names or multiplicities dropped')
    if name == 'scope-lifecycle':
        require(report.get('measurements', {}).get('automatic_intermediate_memory_choices') == 2,
                'actual intermediate memory choices absent')
        required = {f'smaller automatic scope {label}/{budget}'
                    for budget in ['process', 'device'] for label in [
                        'actually rejects a larger candidate', 'commits four-pass groups',
                        'retains exact output', 'retains every compute shape', 'retains exact ordered routes',
                        'reduces actual expert reads', 'preserves the cold checkpoint',
                        'preserves the odd tail', 'teacher-forced continuation is exact']}
        require(required <= set(after), 'bounded native sizing coverage absent')
    result['all_v436_assertion_names_and_multiplicities_preserved'] = True
    return result


for owner in [scope, integration]:
    owner.HERE, owner.OUT, owner.BINARY, owner.BUILD = HERE, OUT, BINARY, BUILD
    owner.load, owner.assess = load, assess


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=['prepare', 'check', 'native'])
    parser.add_argument('--name', choices=list(NATIVE))
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.action == 'prepare':
            result = prepare()
        elif args.action == 'check':
            load()
            result = {'passed': True, 'unrun': [n for n in NATIVE if not (OUT / n).exists()]}
        else:
            require(args.name is not None and args.deadline is not None, 'one case and full deadline required')
            result = OWNERS[args.name].run(args.name, args.deadline)
    print(json.dumps({k: v for k, v in result.items() if k not in ['before', 'after']}, indent=2), flush=True)
    return 0 if args.action != 'native' or result.get('qualified') else 1


if __name__ == '__main__':
    raise SystemExit(main())

````````````
