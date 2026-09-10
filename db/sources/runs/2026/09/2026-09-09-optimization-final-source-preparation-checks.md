---
type: run
id: 01m22x0gwnd7rthfe27kz4pcsm
created: 2026-09-09T10:56:53.653602+00:00
updated: 2026-09-09T10:56:54.158549+00:00
summary: Final composition source and original build lease preparation pass eight model-free checks
binary: No final binary built; current V492 remains unchanged
captured_at: 2026-09-09
command: python3 /tmp/slotstream-optimization-execution/final-composition-source-v518/checks.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Final composition source and original build lease preparation pass eight model-free checks
tool: Slotstream exact native and source qualification capture
---
Prospective source and build preparation only. Eight model-free checks pass against actual V492 source preimages and the exact preserved V508 override delta. The in-memory composition changes only Optimizations.swift and Diagnostics+Runtime.swift, retaining fourteen other source overlays byte-for-byte and the public reference initializer. Synthetic terminal envelopes are used only to verify refusal of every missing profile/gate, failed original assessment, stale receipt and live competing job; none are saved as execution evidence. One initial fixture omitted the synthetic audit digest and is retained alongside the corrected test. The final lease executor reconstructs the original V492 executor byte-for-byte after reversing only output and temporary-path names, preserving every resource guard, full interval and restoration operation. No final source output, protocol, compiler or model is launched. Actual preparation remains dependent on all three completed and qualified V515 original profiles and their independent full-response audits. Current V515 is still running and is not captured here. All final pure/native/serving/lifetime/client/resource/sustained-TPS/delivery gates remain required before activation.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-build-v519/prepare.py",
    "bytes": 4751,
    "sha256": "ee74dfd255af3f092e0fd2cad435b8a37f00019c5b836cc613265cae423238a5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-build-v519/run.py",
    "bytes": 10175,
    "sha256": "4d90a6ec9b65910cafbea862d9518c4c52da378009382742beb147342372b308"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-source-v518/checks.py",
    "bytes": 7081,
    "sha256": "32aa1e8811cf6f5f0d84e6d528334e19f42f70ef05a0e61f4da77ff2b5a6abd9"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-source-v518/checks.stderr",
    "bytes": 106,
    "sha256": "8642a1ac72c63530bbaa2c1f2526767cc3b14a928c117e4bff18cd4c4a88ad42"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-source-v518/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-source-v518/initial-checks.py",
    "bytes": 7008,
    "sha256": "834c4ede84a5731658a05b96087e5ed512409dfae3bf98ce108171e2b707e84a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-source-v518/initial-checks.stderr",
    "bytes": 1851,
    "sha256": "d1cb515a85519a4ce9af8816405a5c411281a65e44df1570bf5214e22a1479ae"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-source-v518/initial-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-source-v518/prepare.py",
    "bytes": 7084,
    "sha256": "e89bf16676d621907966786d6361b41df12fe8bd87456891a53596ac421e69cc"
  }
]
```

## Artifact SHA-256 ee74dfd255af3f092e0fd2cad435b8a37f00019c5b836cc613265cae423238a5

Encoding: `utf-8`. Original bytes: 4751.

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
DRAFT = BASE / 'final-composition-source-v518'
PRIOR = BASE / 'adaptive-scope-build-v492'
sys.path.insert(0, str(ROOT / 'Tools'))
from build_identity import source_files
from prefill_bench import digest
from serve_bench import competing_jobs


def write(path, value):
    with path.open('x') as stream:
        stream.write(json.dumps(value, indent=2) + '\n')


def main():
    assert not (HERE / 'protocol.json').exists(), 'already prepared'
    assert not (ROOT / '.build/optimization/final-composition-build-v519').exists(), 'already attempted'
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
        classification = ('Exact V492 plus qualified scope/vision default selection and explicit vision override compatibility V508/V518. '
                          'All previous inference math, source tests, numerical shapes and request/process guards remain. '
                          'New exact compilation and complete final qualification required before activation; no prior-source performance relabeling.')
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
                         'changes_from_v492': audit['changed_files'], 'prepared_without_model': True})
        assert protocol['required_complete_reservation_seconds'] == 1250
        assert protocol['maximum_whole_interval_seconds'] == 1220
        assert len(files) == 16 and len(candidate) == 150
        write(HERE / 'protocol.json', protocol)
    print(json.dumps({'prepared': True, 'model_launched': False, 'source_files': len(candidate),
                      'protocol_sha256': digest(HERE / 'protocol.json')}))


if __name__ == '__main__':
    main()

````````````

## Artifact SHA-256 4d90a6ec9b65910cafbea862d9518c4c52da378009382742beb147342372b308

Encoding: `utf-8`. Original bytes: 10175.

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
        quarantine=path.with_name(path.name+".v519-unexpected")
        if quarantine.exists() or quarantine.is_symlink(): raise RuntimeError("release-alias quarantine already exists")
        path.rename(quarantine)
    path.symlink_to(expected['target'])
    if tree_state(path)!=expected: raise RuntimeError("release alias was not restored exactly")

def observed_memory():
    state=vm_snapshot();require_normal(pressure_snapshot());return state

def main():
    deadline=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
    assert deadline-time.time()>=1250, 'complete lease must fit the explicitly granted interval'
    output=ROOT/".build/optimization/final-composition-build-v519"
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
                pending=path.with_suffix(path.suffix+".v519-pending");shutil.copy2(after,pending);pending.replace(path)
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
                            pending=path.with_suffix(path.suffix+".v519-restore");shutil.copy2(PACKET/"source-before"/entry["path"],pending);pending.replace(path)
                    restore(state_paths,PACKET/"build-state-before",state_before)
                    restore_link(ROOT/".build/release",link_state)
                    for name,sha in original["release"].items():
                        path=ROOT/".build/release"/name;pending=path.with_name(path.name+".v519-restore")
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

## Artifact SHA-256 32aa1e8811cf6f5f0d84e6d528334e19f42f70ef05a0e61f4da77ff2b5a6abd9

Encoding: `utf-8`. Original bytes: 7081.

````````````text
"""Model-free final preparation checks; no terminal qualification is fabricated."""
from pathlib import Path
import copy
import importlib.util
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('final_source_preparation_checks', HERE / 'prepare.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


class Checks(unittest.TestCase):
    def prepared(self):
        # Actual prior source hashes; no final-source qualification is implied.
        return {'build': {'identity': {'source': m.m.c.read(m.PRIOR / 'protocol.json')['candidate_source']}}}

    def test_actual_source_transform_is_exact_and_memory_only(self):
        before, after, changes = m.compose_overlay(self.prepared())
        self.assertEqual(len(before), 16)
        self.assertEqual(set(changes), {'Sources/Slotstream/Optimizations.swift',
                                      'Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift'})
        key = 'Sources/Slotstream/Optimizations.swift'
        selected = after[key].decode()
        addition = '        result.automaticReadScope = true\n        result.visionQueryTile = 256\n'
        self.assertEqual(selected.count(addition), 1)
        self.assertEqual(selected.replace(addition, ''), (m.OVERRIDES / 'after' / key).read_text())
        self.assertIn('public var automaticReadScope: Bool? = nil', selected)
        self.assertIn('public var visionQueryTile = 0', selected)
        for relative in set(before) - set(changes):
            self.assertEqual(before[relative], after[relative])
        self.assertFalse((HERE / 'after').exists())
        self.assertFalse((HERE / 'source-audit.json').exists())

    def test_wrong_candidate_source_is_rejected_before_output(self):
        value = self.prepared()
        value['build']['identity']['source']['Sources/Slotstream/Context.swift'] = '0' * 64
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            m.compose_overlay(value)
        self.assertFalse((HERE / 'after').exists())

    def test_changed_override_bytes_are_rejected_before_output(self):
        original = m.m.digest
        def changed(path):
            if Path(path) == m.OVERRIDES / 'after/Sources/Slotstream/Optimizations.swift':
                return '0' * 64
            return original(path)
        with patch.object(m.m, 'digest', side_effect=changed):
            with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                m.compose_overlay(self.prepared())
        self.assertFalse((HERE / 'after').exists())

    def profile_fixtures(self):
        # Deliberately synthetic completion envelopes for negative admission
        # tests. They are never written to a result or treated as model proof.
        qualifications, audits = {}, {}
        for name in m.m.PROFILES:
            qualifications[name] = dict(completed=True, qualified=True, proofs_unchanged=True,
                                        cleanup_complete=True, within_reservation=True, remaining_jobs=[])
            audits[name] = dict(assessment={'qualified': True},
                               all64_exact_prompt_output_text_and_equal_work=True,
                               all64_original_sampled_physical_caps_pass=True,
                               terminal_receipt_sha256='synthetic-receipt')
        return qualifications, audits

    def check_admission(self, qualifications, audits, *, jobs=None, assessment=True):
        def read(path):
            path = Path(path)
            if path.name == 'qualification.json': return qualifications[path.parent.parent.name]
            if path.name == 'audit.json': return audits[path.parent.name]
            raise AssertionError('unexpected evidence read')
        def digest(path):
            if Path(path).name == 'qualification.json': return 'synthetic-receipt'
            if Path(path).name == 'audit.json': return 'synthetic-audit'
            if Path(path).name == '2026-09-09-optimization-vision-mechanism-complete-pass.md':
                return 'f1a93a712ffddf8e877bcc438dd4dcab7ef1c78df6b35e433303e0e797230554'
            raise AssertionError('unexpected evidence hash')
        with patch.object(m.m, 'load', return_value=self.prepared()), \
             patch.object(m.m.c, 'read', side_effect=read), \
             patch.object(m.m, 'digest', side_effect=digest), \
             patch.object(m.m, 'assess', return_value={'qualified': assessment}), \
             patch.object(m.m.old.native.scope, 'competing_jobs', return_value=jobs or []):
            return m.qualified_profiles()

    def test_every_original_profile_and_terminal_condition_required(self):
        for name in m.m.PROFILES:
            for key in ['completed', 'qualified', 'proofs_unchanged', 'cleanup_complete', 'within_reservation', 'remaining_jobs']:
                q, a = self.profile_fixtures()
                q[name][key] = ['synthetic-active-job'] if key == 'remaining_jobs' else False
                with self.subTest(name=name, key=key):
                    with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                        self.check_admission(q, a)
        self.assertFalse((HERE / 'after').exists())

    def test_every_original_audit_and_receipt_binding_required(self):
        for name in m.m.PROFILES:
            for key in ['assessment', 'all64_exact_prompt_output_text_and_equal_work',
                        'all64_original_sampled_physical_caps_pass', 'terminal_receipt_sha256']:
                q, a = self.profile_fixtures()
                a[name][key] = {'qualified': False} if key == 'assessment' else False
                with self.subTest(name=name, key=key):
                    with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                        self.check_admission(q, a)

    def test_original_assessor_failure_and_live_job_refuse(self):
        q, a = self.profile_fixtures()
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            self.check_admission(q, a, assessment=False)
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            self.check_admission(q, a, jobs=['synthetic-model-or-compiler'])

    def test_terminal_checks_preserve_all_three_proof_keys(self):
        q, a = self.profile_fixtures()
        _, proof, _ = self.check_admission(q, a)
        self.assertEqual(set(proof), set(m.m.PROFILES))
        self.assertTrue(all(p['qualification_sha256'] == 'synthetic-receipt' for p in proof.values()))
        self.assertFalse((HERE / 'after').exists())

    def test_build_executor_preserves_original_guards_and_restoration(self):
        old = (m.BASE / 'adaptive-scope-build-v492/run.py').read_text()
        new = (m.BASE / 'final-composition-build-v519/run.py').read_text()
        restored = new.replace('final-composition-build-v519', 'adaptive-scope-build-v492').replace('.v519-', '.v492-')
        self.assertEqual(restored, old)


if __name__ == '__main__': unittest.main()

````````````

## Artifact SHA-256 8642a1ac72c63530bbaa2c1f2526767cc3b14a928c117e4bff18cd4c4a88ad42

Encoding: `utf-8`. Original bytes: 106.

````````````text
........
----------------------------------------------------------------------
Ran 8 tests in 0.012s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 834c4ede84a5731658a05b96087e5ed512409dfae3bf98ce108171e2b707e84a

Encoding: `utf-8`. Original bytes: 7008.

````````````text
"""Model-free final preparation checks; no terminal qualification is fabricated."""
from pathlib import Path
import copy
import importlib.util
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('final_source_preparation_checks', HERE / 'prepare.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


class Checks(unittest.TestCase):
    def prepared(self):
        # Actual prior source hashes; no final-source qualification is implied.
        return {'build': {'identity': {'source': m.m.c.read(m.PRIOR / 'protocol.json')['candidate_source']}}}

    def test_actual_source_transform_is_exact_and_memory_only(self):
        before, after, changes = m.compose_overlay(self.prepared())
        self.assertEqual(len(before), 16)
        self.assertEqual(set(changes), {'Sources/Slotstream/Optimizations.swift',
                                      'Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift'})
        key = 'Sources/Slotstream/Optimizations.swift'
        selected = after[key].decode()
        addition = '        result.automaticReadScope = true\n        result.visionQueryTile = 256\n'
        self.assertEqual(selected.count(addition), 1)
        self.assertEqual(selected.replace(addition, ''), (m.OVERRIDES / 'after' / key).read_text())
        self.assertIn('public var automaticReadScope: Bool? = nil', selected)
        self.assertIn('public var visionQueryTile = 0', selected)
        for relative in set(before) - set(changes):
            self.assertEqual(before[relative], after[relative])
        self.assertFalse((HERE / 'after').exists())
        self.assertFalse((HERE / 'source-audit.json').exists())

    def test_wrong_candidate_source_is_rejected_before_output(self):
        value = self.prepared()
        value['build']['identity']['source']['Sources/Slotstream/Context.swift'] = '0' * 64
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            m.compose_overlay(value)
        self.assertFalse((HERE / 'after').exists())

    def test_changed_override_bytes_are_rejected_before_output(self):
        original = m.m.digest
        def changed(path):
            if Path(path) == m.OVERRIDES / 'after/Sources/Slotstream/Optimizations.swift':
                return '0' * 64
            return original(path)
        with patch.object(m.m, 'digest', side_effect=changed):
            with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                m.compose_overlay(self.prepared())
        self.assertFalse((HERE / 'after').exists())

    def profile_fixtures(self):
        # Deliberately synthetic completion envelopes for negative admission
        # tests. They are never written to a result or treated as model proof.
        qualifications, audits = {}, {}
        for name in m.m.PROFILES:
            qualifications[name] = dict(completed=True, qualified=True, proofs_unchanged=True,
                                        cleanup_complete=True, within_reservation=True, remaining_jobs=[])
            audits[name] = dict(assessment={'qualified': True},
                               all64_exact_prompt_output_text_and_equal_work=True,
                               all64_original_sampled_physical_caps_pass=True,
                               terminal_receipt_sha256='synthetic-receipt')
        return qualifications, audits

    def check_admission(self, qualifications, audits, *, jobs=None, assessment=True):
        def read(path):
            path = Path(path)
            if path.name == 'qualification.json': return qualifications[path.parent.parent.name]
            if path.name == 'audit.json': return audits[path.parent.name]
            raise AssertionError('unexpected evidence read')
        def digest(path):
            if Path(path).name == 'qualification.json': return 'synthetic-receipt'
            if Path(path).name == '2026-09-09-optimization-vision-mechanism-complete-pass.md':
                return 'f1a93a712ffddf8e877bcc438dd4dcab7ef1c78df6b35e433303e0e797230554'
            raise AssertionError('unexpected evidence hash')
        with patch.object(m.m, 'load', return_value=self.prepared()), \
             patch.object(m.m.c, 'read', side_effect=read), \
             patch.object(m.m, 'digest', side_effect=digest), \
             patch.object(m.m, 'assess', return_value={'qualified': assessment}), \
             patch.object(m.m.old.native.scope, 'competing_jobs', return_value=jobs or []):
            return m.qualified_profiles()

    def test_every_original_profile_and_terminal_condition_required(self):
        for name in m.m.PROFILES:
            for key in ['completed', 'qualified', 'proofs_unchanged', 'cleanup_complete', 'within_reservation', 'remaining_jobs']:
                q, a = self.profile_fixtures()
                q[name][key] = ['synthetic-active-job'] if key == 'remaining_jobs' else False
                with self.subTest(name=name, key=key):
                    with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                        self.check_admission(q, a)
        self.assertFalse((HERE / 'after').exists())

    def test_every_original_audit_and_receipt_binding_required(self):
        for name in m.m.PROFILES:
            for key in ['assessment', 'all64_exact_prompt_output_text_and_equal_work',
                        'all64_original_sampled_physical_caps_pass', 'terminal_receipt_sha256']:
                q, a = self.profile_fixtures()
                a[name][key] = {'qualified': False} if key == 'assessment' else False
                with self.subTest(name=name, key=key):
                    with self.assertRaises((ValueError, RuntimeError, AssertionError)):
                        self.check_admission(q, a)

    def test_original_assessor_failure_and_live_job_refuse(self):
        q, a = self.profile_fixtures()
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            self.check_admission(q, a, assessment=False)
        with self.assertRaises((ValueError, RuntimeError, AssertionError)):
            self.check_admission(q, a, jobs=['synthetic-model-or-compiler'])

    def test_terminal_checks_preserve_all_three_proof_keys(self):
        q, a = self.profile_fixtures()
        _, proof, _ = self.check_admission(q, a)
        self.assertEqual(set(proof), set(m.m.PROFILES))
        self.assertTrue(all(p['qualification_sha256'] == 'synthetic-receipt' for p in proof.values()))
        self.assertFalse((HERE / 'after').exists())

    def test_build_executor_preserves_original_guards_and_restoration(self):
        old = (m.BASE / 'adaptive-scope-build-v492/run.py').read_text()
        new = (m.BASE / 'final-composition-build-v519/run.py').read_text()
        restored = new.replace('final-composition-build-v519', 'adaptive-scope-build-v492').replace('.v519-', '.v492-')
        self.assertEqual(restored, old)


if __name__ == '__main__': unittest.main()

````````````

## Artifact SHA-256 d1cb515a85519a4ce9af8816405a5c411281a65e44df1570bf5214e22a1479ae

Encoding: `utf-8`. Original bytes: 1851.

````````````text
......F.
======================================================================
FAIL: test_terminal_checks_preserve_all_three_proof_keys (__main__.Checks.test_terminal_checks_preserve_all_three_proof_keys)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/final-composition-source-v518/checks.py", line 114, in test_terminal_checks_preserve_all_three_proof_keys
    _, proof, _ = self.check_admission(q, a)
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/tmp/slotstream-optimization-execution/final-composition-source-v518/checks.py", line 83, in check_admission
    return m.qualified_profiles()
           ^^^^^^^^^^^^^^^^^^^^^^
  File "/private/tmp/slotstream-optimization-execution/final-composition-source-v518/prepare.py", line 36, in qualified_profiles
    'audit_sha256':m.digest(audit_path)}
                   ^^^^^^^^^^^^^^^^^^^^
  File "/Users/carlos/.pyenv/versions/3.12.9/lib/python3.12/unittest/mock.py", line 1139, in __call__
    return self._mock_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/carlos/.pyenv/versions/3.12.9/lib/python3.12/unittest/mock.py", line 1143, in _mock_call
    return self._execute_mock_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/carlos/.pyenv/versions/3.12.9/lib/python3.12/unittest/mock.py", line 1204, in _execute_mock_call
    result = effect(*args, **kwargs)
             ^^^^^^^^^^^^^^^^^^^^^^^
  File "/tmp/slotstream-optimization-execution/final-composition-source-v518/checks.py", line 77, in digest
    raise AssertionError('unexpected evidence hash')
AssertionError: unexpected evidence hash

----------------------------------------------------------------------
Ran 8 tests in 0.015s

FAILED (failures=1)

````````````

## Artifact SHA-256 e89bf16676d621907966786d6361b41df12fe8bd87456891a53596ac421e69cc

Encoding: `utf-8`. Original bytes: 7084.

````````````text
"""Prepare selected final source only after all original planner profiles qualify."""
from pathlib import Path
from collections import Counter
import hashlib
import importlib.util
import json
import re

HERE = Path(__file__).resolve().parent
BASE = Path('/tmp/slotstream-optimization-execution')
PRIOR = BASE / 'adaptive-scope-build-v492'
OVERRIDES = BASE / 'selected-vision-overrides-v508'
spec = importlib.util.spec_from_file_location('final_original_profiles', BASE / 'public-plan-observed-cohort-v515/run.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


def qualified_profiles():
    """Read terminal evidence only; never create a source or launch a job."""
    prepared = m.load()
    proof = {}
    for name in m.PROFILES:
        target = m.HERE / name / 'execution'
        q = m.c.read(target / 'qualification.json')
        audit_path = BASE / 'public-planner-terminal-v513' / name / 'audit.json'
        audit = m.c.read(audit_path)
        m.require(all(q.get(k) is True for k in ['completed','qualified','proofs_unchanged','cleanup_complete','within_reservation'])
                  and q.get('remaining_jobs') == [] and m.assess(name)['qualified'] is True,
                  'every original actual-planner cohort must qualify before selecting automatic defaults')
        m.require(audit['assessment']['qualified'] is True
                  and audit['all64_exact_prompt_output_text_and_equal_work'] is True
                  and audit['all64_original_sampled_physical_caps_pass'] is True
                  and audit['terminal_receipt_sha256'] == m.digest(target / 'qualification.json'),
                  'complete independent response/physical-cap audit missing')
        proof[name] = {'qualification_sha256':m.digest(target / 'qualification.json'),
                       'audit_sha256':m.digest(audit_path)}
    vision_source = Path('/Users/carlos/Projects/slotstream/db/sources/runs/2026/09/2026-09-09-optimization-vision-mechanism-complete-pass.md')
    m.require(m.digest(vision_source) == 'f1a93a712ffddf8e877bcc438dd4dcab7ef1c78df6b35e433303e0e797230554',
              'selected vision qualification source changed')
    m.require(not m.old.native.scope.competing_jobs(), 'all model and compiler work must drain before final source preparation')
    return prepared, proof, vision_source


def compose_overlay(prepared):
    """Construct source bytes in memory after validating every frozen preimage."""
    old_protocol = m.c.read(PRIOR / 'protocol.json')
    m.require(prepared['build']['identity']['source'] == old_protocol['candidate_source'], 'prior source family differs')
    override_proof = m.c.read(OVERRIDES / 'preparation.json')
    m.require(override_proof['defaults_changed'] is False and override_proof['current_v492_model_and_source_unchanged'] is True,
              'uncompiled override draft is not based on the current source')
    before, after = {}, {}
    for path in (PRIOR / 'after').rglob('*.swift'):
        relative = str(path.relative_to(PRIOR / 'after'))
        before[relative] = path.read_bytes()
        m.require(hashlib.sha256(before[relative]).hexdigest() == old_protocol['candidate_source'][relative],
                  'candidate source overlay changed')
        after[relative] = before[relative]
    m.require(len(before) == 16, 'original overlay inventory changed')
    for relative, hashes in override_proof['changes'].items():
        m.require(m.digest(OVERRIDES / 'before' / relative) == hashes['before'] == hashlib.sha256(before[relative]).hexdigest()
                  and m.digest(OVERRIDES / 'after' / relative) == hashes['after'], 'override patch preimage changed')
        after[relative] = (OVERRIDES / 'after' / relative).read_bytes()
    key = 'Sources/Slotstream/Optimizations.swift'
    source = after[key].decode()
    needle = '        result.compactNgramRows = true\n'
    m.require(source.count(needle) == 1, 'selected candidate initializer changed')
    source = source.replace(needle, needle + '        result.automaticReadScope = true\n        result.visionQueryTile = 256\n')
    m.require('public var automaticReadScope: Bool? = nil' in source and 'public var visionQueryTile = 0' in source,
              'public reference initializer must remain unchanged')
    after[key] = source.encode()
    changes = {}
    for relative in before:
        if before[relative] != after[relative]:
            changes[relative] = {'before_sha256':hashlib.sha256(before[relative]).hexdigest(),
                                 'after_sha256':hashlib.sha256(after[relative]).hexdigest()}
    m.require(set(changes) == {'Sources/Slotstream/Optimizations.swift','Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift'},
              'final default composition unexpectedly changes inference math')
    key = 'Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift'
    pattern = r'c\.(?:expect|equal|close)\("([^"\n]+)"'
    m.require(not (Counter(re.findall(pattern,before[key].decode())) - Counter(re.findall(pattern,after[key].decode()))),
              'original diagnostic assertion sites dropped')
    return before, after, changes


def main():
    m.require(not any((HERE / name).exists() for name in ['source-audit.json', 'before', 'after']), 'already prepared')
    m.require('Ran 8 tests' in (HERE / 'checks.stderr').read_text()
              and (HERE / 'checks.stderr').read_text().endswith('OK\n'), 'source preparation checks missing')
    prepared, proof, vision_source = qualified_profiles()
    before, after, changes = compose_overlay(prepared)
    for folder, values in [('before',before),('after',after)]:
        for relative, payload in values.items():
            path = HERE / folder / relative;path.parent.mkdir(parents=True,exist_ok=True)
            with path.open('xb') as output:output.write(payload)
    result = {'base_protocol_sha256':m.digest(PRIOR / 'protocol.json'), 'changed_files':changes,
              'all_three_original_public_planner_proofs':proof,
              'vision_qualification_source_sha256':m.digest(vision_source),
              'override_draft_sha256':m.digest(OVERRIDES / 'preparation.json'),
              'preparer_sha256':m.digest(Path(__file__)),
              'preparation_check_sha256': {name:m.digest(HERE / name) for name in ['checks.py','checks.stdout','checks.stderr']},
              'selected_defaults':{'automaticReadScope':True,'visionQueryTile':256,'compactNgramRows':True,'boundedDraftTail':False},
              'source_overlay_files':16, 'compiled':False, 'new_final_native_qualified':False,
              'shared_source_changed':False, 'activation_performed':False,
              'classification':'Final selected composition source only. Public reference initializer, mathematical implementations and all prior assertions remain. The new compiled defaults and explicit vision override compatibility require the complete original final qualification program before activation.'}
    m.c.write_new(HERE / 'source-audit.json',result)
    print(json.dumps(result,indent=2))


if __name__ == '__main__':main()

````````````
