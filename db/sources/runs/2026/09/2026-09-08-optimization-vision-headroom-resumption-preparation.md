---
type: run
id: 01m21pa74apfch2nvn88c6gvn4
created: 2026-09-08T23:40:36.874053+00:00
updated: 2026-09-08T23:40:37.363735+00:00
summary: Fresh full24-cell V413vision identity preserves both stopped cohorts;9model-free checks pass
binary: /Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream
captured_at: 2026-09-08
command: V413prepare/freeze and original9model-free checks; no model launch
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Fresh full24-cell V413vision identity preserves both stopped cohorts;9model-free checks pass
tool: Slotstream exact native and source qualification capture
---
After the V395 pre-model headroom stop and subsequent resource recovery, V413 creates a fresh prospective full24-cell mechanism identity. It preserves both the five-cell V385thermal stop and the one-invalid-cell/no-model V395stop exactly; no old rows, replacement cells or performance outcomes are reused. Actual driver bytes and all helpers remain identical to V395, SHA18c48beec6792bf6824368b3e0d8170e39b40d681e89ba118f0c2b4a6f26d149, including the original startup-swap-in pair exclusion and all work/cap/acceptance rules. The protocol retains12pairs/24first requests, the original12GBmechanism cap,200MBper-clean-pair saving,5percentmedianregressionlimit, and60samplednominalprelaunchseconds with at most300addedseconds percell. Full allowance12600seconds work plus60cleanup; original18GBstartup/14GBowned/3GBlive/new-swap-out stop preserved. Protocol1ca5b6deaa7ea02c63ea6cafa78a09736e6456979de80de01e889836fd14a801. Nine original model-free checks pass in29.873seconds, including actual driver entrypoint with model Popen intercepted. This identity is frozen and unrun; it must wait until the active V409scope cohort drains and original resource/time admission passes. It is an isolated V304 vision mechanism study, not final V402composition qualification or activation.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/prepare-vision-headroom-resume-v413.py",
    "bytes": 2299,
    "sha256": "5f1c384d8f6c0ad1c2e605b0b6b05a23d40de6c8328ad257f162b743b0203822"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/build_driver.py",
    "bytes": 1354,
    "sha256": "3fa46bcc04731d4b44129818d98ece18f4cc323b42950fda0052c5ed2eef06c2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/checks.py",
    "bytes": 5518,
    "sha256": "3e649cc2226145acc1259d6b6cb2cb2628b84930d0cd1b85644e048d3dc5d277"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/checks.stderr",
    "bytes": 762,
    "sha256": "b769c804fc4fe9ec5effef7165c4493c45d2f8a1a1c401b1387b7992d7441b52"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/driver/prefill_bench.py",
    "bytes": 19176,
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/driver/serve_bench.py",
    "bytes": 61080,
    "sha256": "18c48beec6792bf6824368b3e0d8170e39b40d681e89ba118f0c2b4a6f26d149"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/driver/startup_policy.py",
    "bytes": 1797,
    "sha256": "8cf6d5805ce5fee2338a6feb962172018cdbb566b61e2ea1470349f2fa6ce2ec"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/driver/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/driver-transformation.json",
    "bytes": 1894,
    "sha256": "be9199fbfcf1fcd89f59ced6ed013f678ba314f8413fb8cb3b3f58bb7f6b7210"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/mechanism/binding.json",
    "bytes": 8893,
    "sha256": "08af8671ca9751c3d29dc465fdb0e39de9dfca12f2fff054c443e3e691c2d481"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/mechanism/protocol.json",
    "bytes": 14196,
    "sha256": "1ca5b6deaa7ea02c63ea6cafa78a09736e6456979de80de01e889836fd14a801"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/preparation.json",
    "bytes": 44769,
    "sha256": "5d6bd47faeec6294b5325464925543c34acb09c3ae94eafd6aebd69c59dd91f5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/run.py",
    "bytes": 10560,
    "sha256": "1830fa7005111405c7557d98afefb2c31d601b794cd999d9ad802b2edf01647a"
  }
]
```

## Artifact SHA-256 5f1c384d8f6c0ad1c2e605b0b6b05a23d40de6c8328ad257f162b743b0203822

Encoding: `utf-8`. Original bytes: 2299.

````````````text
from pathlib import Path
B=Path('/tmp/slotstream-optimization-execution');OLD=B/'thermally-settled-vision-v395';P=B/'vision-headroom-resume-v413';P.mkdir(exist_ok=False)
s=(OLD/'run.py').read_text().replace('thermally-settled-vision-v395','vision-headroom-resume-v413').replace('vision_v395_assessor','vision_v413_assessor')
s=s.replace("files=[Path(__file__),PREVIOUS,", "files=[Path(__file__),BASE/'thermally-settled-vision-v395/preparation.json',BASE/'thermally-settled-vision-v395/mechanism/protocol.json',PREVIOUS,")
old=" return {'raw':c.artifact_hashes(raw),'execution':c.artifact_hashes(p),'all_observed_first_measured_work_and_output_exact':True,'no_rows_reused':True}\n"
new=""" latest=BASE/'thermally-settled-vision-v395';latest_raw=execution.ROOT/'.build/optimization/thermally-settled-vision-v395/mechanism'
 latest_receipt=c.read(latest/NAME/'execution/qualification.json')
 latest_rows=[json.loads(x) for x in (latest_raw/'results.jsonl').read_text().splitlines()]
 require(latest_receipt.get('qualified') is False and latest_receipt.get('cleanup_complete') is True and latest_receipt.get('remaining_jobs')==[] and len(latest_rows)==1 and 'original startup memory requirement no longer fits' in latest_rows[0].get('error','') and latest_rows[0].get('server_pid') is None and 'metrics' not in latest_rows[0] and 'first_request' not in latest_rows[0], 'V395 pre-model headroom stop differs')
 return {'raw':c.artifact_hashes(raw),'execution':c.artifact_hashes(p),'all_observed_first_measured_work_and_output_exact':True,'no_rows_reused':True,'latest_headroom_stop':{'raw':c.artifact_hashes(latest_raw),'execution':c.artifact_hashes(latest/NAME/'execution'),'completed_requests':0,'model_launched':False}}
"""
assert s.count(old)==1;s=s.replace(old,new)
s=s.replace('New full24-cell mechanism cohort after V385 thermal stop.', 'New full24-cell mechanism cohort after preserved V385 thermal stop and V395 pre-model headroom stop. Colima is stopped and subsequent native preflights observe sufficient headroom; live original admission remains mandatory.')
(P/'run.py').write_text(s)
for name in ['build_driver.py','checks.py']:(P/name).write_bytes((OLD/name).read_bytes())
print('Prepared new source identity, preserving both previous stopped cohorts and all original24-cell conditions.')

````````````

## Artifact SHA-256 3fa46bcc04731d4b44129818d98ece18f4cc323b42950fda0052c5ed2eef06c2

Encoding: `utf-8`. Original bytes: 1354.

````````````text
from pathlib import Path
import hashlib,json
H=Path(__file__).resolve().parent;B=H.parent;SOURCE=B/'vision-startup-swapin-policy-v381/serve_bench.py';THERMAL=B/'thermal-settle-preparation-v388'
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
original=SOURCE.read_text();changed=original;edits=json.loads((THERMAL/'driver-transformation.json').read_text())['edits']
for e in edits:
 assert changed.count(e['old'])==1;changed=changed.replace(e['old'],e['new'])
restored=changed
for e in reversed(edits):
 assert restored.count(e['new'])==1;restored=restored.replace(e['new'],e['old'])
assert restored==original
out=H/'driver';out.mkdir(exist_ok=False);(out/'serve_bench.py').write_text(changed);compile(changed,str(out/'serve_bench.py'),'exec')
helpers=[B/'vision-startup-swapin-policy-v381/startup_policy.py',B/'vision-startup-swapin-policy-v381/prefill_bench.py',THERMAL/'thermal_settle.py']
for p in helpers:(out/p.name).write_bytes(p.read_bytes())
v={'input':str(SOURCE),'input_sha256':digest(SOURCE),'driver_sha256':digest(out/'serve_bench.py'),'helpers':{str(p):digest(p) for p in helpers},'edits':edits,'reconstructs_V381_exactly':True,'model_launched':False}
(H/'driver-transformation.json').write_text(json.dumps(v,indent=2)+'\n');print(json.dumps({k:v[k] for k in ['driver_sha256','reconstructs_V381_exactly','model_launched']}))

````````````

## Artifact SHA-256 3e649cc2226145acc1259d6b6cb2cb2628b84930d0cd1b85644e048d3dc5d277

Encoding: `utf-8`. Original bytes: 5518.

````````````text
import contextlib,copy,importlib.util,inspect,io,json,sys,tempfile,types,unittest
from pathlib import Path
from unittest.mock import patch
import run
sys.path.insert(0,str(run.HERE/'driver'))
spec=importlib.util.spec_from_file_location('combined_vision_driver',run.DRIVER);driver=importlib.util.module_from_spec(spec);spec.loader.exec_module(driver)
class Checks(unittest.TestCase):
 def test_bound_driver_source_and_helpers(self):self.assertTrue(run.dependencies())
 def test_exact_original_acceptance_and_workload(self):
  value=run.load();old=run.previous.materialize(run.NAME,value);new=run.materialize(run.NAME,value)
  self.assertEqual(new.pop('before_cell_thermal_settle'),{'stable_seconds':60,'maximum_wait_seconds':300,'poll_seconds':2})
  for key in ['label','classification','current_prerequisite_binding']:new[key]=old[key]
  self.assertEqual(new,old);self.assertEqual(old['rounds']*len(old['arms']),24)
  self.assertEqual(old['acceptance']['minimum_sampled_peak_savings_bytes'],200_000_000)
  self.assertEqual(old['maximum_sampled_footprint_bytes'],12_000_000_000)
 def test_every_request_and_resource_assessor_unchanged(self):
  for name in ['measurement_memory','resource_exclusions','summaries','acceptance_results','startup_summaries','startup_acceptance_results','validate_work_observation']:
   self.assertEqual(inspect.getsource(getattr(driver,name)),inspect.getsource(getattr(run.c.bench,name)))
  self.assertEqual(inspect.getsource(run.execution.assess_serving),inspect.getsource(run.previous.original.assess_serving))
 def test_full_future_waits_are_counted(self):
  self.assertEqual(run.WORK_SECONDS,5400+24*300);self.assertEqual(run.CLEANUP_SECONDS,60)
 def test_original_failure_is_preserved_without_rows_reused(self):
  value=run.preserved();self.assertTrue(value['all_observed_first_measured_work_and_output_exact']);self.assertTrue(value['no_rows_reused'])
 def test_source_or_prior_evidence_drift_refuses(self):
  for name in ['dependencies','preserved']:
   with patch.object(run,name,return_value={'changed':'digest'}),self.assertRaises(ValueError):run.load()
 def test_prelaunch_refusal_creates_no_attempt(self):
  value=run.load();p=run.materialize(run.NAME,value)
  with tempfile.TemporaryDirectory() as d,patch.object(run,'HERE',Path(d)),patch.object(run,'OUT',Path(d)/'raw'),patch.object(run.execution,'load_serving',return_value=(value,p)),patch.object(run.core,'allowance',return_value=0),patch.object(run.core,'readiness',side_effect=ValueError('prelaunch')):
   with self.assertRaisesRegex(ValueError,'prelaunch'):run.run('synthetic')
   self.assertEqual(list(Path(d).iterdir()),[])
 def test_dispatch_keeps_live_guards_and_all_wait_budget(self):
  value=run.load();p=run.materialize(run.NAME,value);captured={}
  class Intercept(Exception):pass
  def execute(command,target,seconds,policy,assessment,limit,attempt):
   captured.update(command=command,seconds=seconds,policy=policy);raise Intercept()
  with patch.object(run.execution,'load_serving',return_value=(value,p)),patch.object(run.core,'allowance',return_value=0),patch.object(run.core,'readiness',return_value=(0,{},{})),patch.object(run.core,'execute',side_effect=execute):
   with self.assertRaises(Intercept):run.run('synthetic')
  self.assertEqual(captured['command'][1],str(run.DRIVER));self.assertEqual(captured['seconds'],12600)
  self.assertEqual(captured['policy'],dict(run.c.NATIVE_POLICY,startup_reclaimable_bytes=18_000_000_000,maximum_owned_rss_bytes=14_000_000_000,maximum_build_seconds=12600,stop_on_new_swapouts=True))
 def test_actual_vision_driver_entrypoint_packages_helpers_and_waits_before_launch(self):
  protocol=run.materialize(run.NAME,run.load());protocol['rounds']=1 # Synthetic delivery fixture only.
  build=driver.verified_build(protocol['binary'])
  for fail in [False,True]:
   with self.subTest(fail=fail),tempfile.TemporaryDirectory() as d:
    root=Path(d);p=root/'protocol.json';out=root/'raw';p.write_text(json.dumps(protocol));launches=[];settled=[]
    def settle(requirement,gb):
     self.assertEqual(requirement,run.SETTLE);self.assertEqual(gb,18);settled.append(gb)
     if fail:raise TimeoutError('SYNTHETIC_THERMAL_TIMEOUT')
     return {'enabled':True,'synthetic':True}
    def launch(command,**kwargs):
     self.assertEqual(len(settled),len(launches)+1);launches.append(command);raise RuntimeError('MODEL_LAUNCH_INTERCEPTED')
    with patch.object(sys,'argv',['test','--protocol',str(p),'--out',str(out)]),patch.object(driver,'verified_build',return_value=build),patch.object(driver,'model_identity',return_value={'loaded':False}),patch.object(driver,'wait_for_quiet_workspace',return_value={}),patch.object(driver,'competing_jobs',return_value=[]),patch.object(driver,'reserved_cooldown',return_value={}),patch.object(driver,'wait_thermal_settle',side_effect=settle),patch.object(driver,'wait_for_headroom',return_value=({'swapins':0,'swapouts':0},{})),patch.object(driver,'subprocess',types.SimpleNamespace(Popen=launch)),contextlib.redirect_stdout(io.StringIO()):code=driver.main()
    self.assertEqual(code,1);self.assertEqual(len(launches),0 if fail else 2)
    self.assertEqual((out/'prefill_bench.py').read_bytes(),(run.HERE/'driver/prefill_bench.py').read_bytes())
    rows=[json.loads(x) for x in (out/'results.jsonl').read_text().splitlines()]
    self.assertTrue(all('metrics' not in r for r in rows))
    self.assertIn('SYNTHETIC_THERMAL_TIMEOUT' if fail else 'MODEL_LAUNCH_INTERCEPTED',rows[0]['error'])
if __name__=='__main__':unittest.main(verbosity=2)

````````````

## Artifact SHA-256 b769c804fc4fe9ec5effef7165c4493c45d2f8a1a1c401b1387b7992d7441b52

Encoding: `utf-8`. Original bytes: 762.

````````````text
test_actual_vision_driver_entrypoint_packages_helpers_and_waits_before_launch (__main__.Checks) ... ok
test_bound_driver_source_and_helpers (__main__.Checks) ... ok
test_dispatch_keeps_live_guards_and_all_wait_budget (__main__.Checks) ... ok
test_every_request_and_resource_assessor_unchanged (__main__.Checks) ... ok
test_exact_original_acceptance_and_workload (__main__.Checks) ... ok
test_full_future_waits_are_counted (__main__.Checks) ... ok
test_original_failure_is_preserved_without_rows_reused (__main__.Checks) ... ok
test_prelaunch_refusal_creates_no_attempt (__main__.Checks) ... ok
test_source_or_prior_evidence_drift_refuses (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 9 tests in 29.873s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036

Encoding: `utf-8`. Original bytes: 19176.

````````````text
#!/usr/bin/env python3
"""Paired inference experiments with raw results and exact token identities.

Repeat --arm NAME=EXECUTABLE for AB/BA order. A fresh process means empty
expert/prefix caches, not cold SSD: OS file cache is explicitly uncontrolled.
Failed, incomplete, and swapping runs are preserved and excluded.
"""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import statistics
import struct
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "Tools/fixtures/optimization"


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""): h.update(part)
    return h.hexdigest()


def vm_snapshot(raw=None):
    raw = raw if raw is not None else subprocess.check_output(["vm_stat"], text=True)
    size = re.search(r"page size of (\d+) bytes", raw)
    if not size: raise ValueError("vm_stat page size missing")
    pages = {k.strip('"'): int(v) for k, v in re.findall(r'^([^:\n]+):\s+(\d+)\.', raw, re.M)}
    required = ("Pages free", "Pages purgeable", "File-backed pages", "Swapins", "Swapouts")
    if any(k not in pages for k in required): raise ValueError("vm_stat counters missing")
    return {"page_bytes": int(size[1]), "reclaimable_bytes": sum(pages[k] for k in required[:3]) * int(size[1]),
            "swapins": pages["Swapins"], "swapouts": pages["Swapouts"], "raw": raw}


class InsufficientHeadroom(RuntimeError):
    pass


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise InsufficientHeadroom(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    return state


def host_conditions():
    """Read-only observations outside timed intervals; unavailable is explicit.

    pmset's warning history is not an instantaneous thermal sensor. Preserve
    that distinction and do not infer energy or thermal headroom from it.
    """
    result = {"load_average_1_5_15_minutes": list(os.getloadavg()),
              "observed_at_unix_seconds": time.time(),
              "thermal_limit": "pmset warning/status history, not continuous temperature",
              "energy_joules": None}
    for key, command in [("power_source", ["pmset", "-g", "batt"]),
                         ("power_configuration", ["pmset", "-g", "custom"]),
                         ("thermal_status", ["pmset", "-g", "therm"])]:
        try:
            output = subprocess.run(command, capture_output=True, text=True, timeout=5)
            result[key] = {"exit_code": output.returncode, "stdout": output.stdout, "stderr": output.stderr}
        except (OSError, subprocess.TimeoutExpired) as e:
            result[key] = {"unavailable": f"{type(e).__name__}: {e}"}
    return result


def validate_metrics(d, *, allow_complete_prompt=False):
    if type(allow_complete_prompt) is not bool: raise ValueError("complete prompt permission must be Boolean")
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if type(s.get(k)) not in (int, float) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] == 0:
        if not allow_complete_prompt: raise ValueError("no completed prefill")
        if (type(s.get('promptTokens')) is not int or s['promptTokens'] <= 0
            or type(s.get('reusedPrefixTokens')) is not int or s['reusedPrefixTokens'] != s['promptTokens']
            or type(s.get('completePromptHits')) is not int or s['completePromptHits'] != 1
            or s['prefillRecords'] != 0 or s.get('prefillPasses') != []
            or s.get('prefillComputePasses') != []
            or type(s.get('prefillReadBytes')) is not int or s['prefillReadBytes'] != 0):
            raise ValueError("zero-prefill request lacks an exact complete-prompt hit and zero work")
    elif s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
    if sum(s["prefillPasses"]) != s["prefillTokens"]: raise ValueError("pass/token mismatch")
    if len(d["prompt_ids"]) != s["promptTokens"] or len(d["output_ids"]) != s["decodeTokens"]:
        raise ValueError("token identity/count mismatch")
    return s


def capture_sources(dest):
    files = sorted([*ROOT.glob("Sources/**/*.swift"), ROOT/"Package.swift", ROOT/"Package.resolved", ROOT/"Makefile"])
    with tarfile.open(dest/"source.tar.gz", "w:gz") as archive:
        for p in files: archive.add(p, arcname=str(p.relative_to(ROOT)))
    return {str(p.relative_to(ROOT)): digest(p) for p in files}


def model_identity(model):
    # This identifies headers/stat metadata, NOT full payload verification.
    result = {}
    for p in sorted(model.iterdir()):
        if p.suffix not in (".json", ".jinja", ".safetensors"): continue
        info = {"bytes": p.stat().st_size, "mtime_ns": p.stat().st_mtime_ns}
        if p.suffix == ".safetensors":
            with p.open("rb") as f:
                n = struct.unpack("<Q", f.read(8))[0]
                if n > 64*1024*1024 or n+8 > info["bytes"]: raise ValueError(f"invalid header: {p.name}")
                info["header_sha256"] = hashlib.sha256(f.read(n)).hexdigest()
        else: info["sha256"] = digest(p)
        result[p.name] = info
    if "config.json" not in result: raise ValueError("model config missing")
    return result


def terminate_child_tree(child):
    """Drain a timed-out child and the independently grouped descendants we
    can prove it owns. Never signal the caller's inherited process group."""
    groups = {child.pid}  # run_child starts a new session before exec.
    snapshot_error = None
    try:
        # Capture parent links before terminating the root. SwiftPM may put
        # Git/compiler descendants in independent sessions/process groups.
        rows = [tuple(map(int, line.split())) for line in subprocess.check_output(
            ['ps', '-axo', 'pid=,ppid=,pgid='], text=True, timeout=5).splitlines() if line.strip()]
        owned = {child.pid}
        while True:
            expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
            if expanded == owned: break
            owned = expanded
        groups.update(group for pid, _, group in rows if pid in owned and group in owned)
    except (OSError, subprocess.SubprocessError, ValueError) as error:
        snapshot_error = error
    finally:
        def signal_owned(sig):
            for group in groups:
                try: os.killpg(group, sig)
                except ProcessLookupError: pass
        signal_owned(signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired: pass
        finally:
            # The root can exit while an independently grouped descendant
            # ignores TERM. Enumeration failure must not skip root cleanup.
            signal_owned(signal.SIGKILL)
            child.wait(timeout=5)
    if snapshot_error is not None:
        raise RuntimeError('child root drained, but descendant enumeration failed; full cleanup is unverified') from snapshot_error


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None: terminate_child_tree(child)


def paired_summary(rows, reference):
    groups = {}
    for row in rows:
        groups.setdefault((row["prompt"], row["chunk"], row["round"]), {})[row["arm"]] = row
    by_arm = {}
    for (prompt, chunk, round_number), arms in groups.items():
        for name, candidate in arms.items():
            if name == reference: continue
            result = by_arm.setdefault((prompt, chunk, name), {"pairs": [], "excluded_rounds": []})
            control = arms.get(reference)
            if not control or not control["valid"] or not candidate["valid"]:
                result["excluded_rounds"].append(round_number); continue
            a, b = control["metrics"], candidate["metrics"]
            if a["prompt_ids"] != b["prompt_ids"] or a["effective_pool_slots"] != b["effective_pool_slots"] or a.get("effective_mtp") != b.get("effective_mtp"):
                result["excluded_rounds"].append(round_number); continue
            result["pairs"].append({"round": round_number,
                "request_reduction_fraction": 1 - b["stats"]["requestSeconds"] / a["stats"]["requestSeconds"],
                "request_saved_seconds": a["stats"]["requestSeconds"] - b["stats"]["requestSeconds"],
                "output_ids_equal": a["output_ids"] == b["output_ids"]})
    result = []
    for (prompt, chunk, name), entry in sorted(by_arm.items()):
        pairs = entry["pairs"]
        result.append({"prompt": prompt, "chunk": chunk, "reference": reference, "candidate": name, **entry,
            "median_request_reduction_fraction": statistics.median(p["request_reduction_fraction"] for p in pairs) if pairs else None})
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--arm", action="append", help="NAME=EXECUTABLE (repeatable)")
    p.add_argument("--arm-env", action="append", default=[], help='NAME={"SLOTSTREAM_...":"value"}')
    p.add_argument("--arm-chunk", action="append", default=[], help="NAME=256..4096, explicit per-arm compute-pass override")
    p.add_argument("--label", default="baseline")
    p.add_argument("--mtp", choices=("off", "on"), default="off")
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--chunks", default="256")
    p.add_argument("--prompts", default="short,prose")
    p.add_argument("--memory-gb", type=float, default=8.1)
    p.add_argument("--max-tokens", type=int, default=16)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--sampled", action="store_true")
    p.add_argument("--sample-footprint", action="store_true")
    p.add_argument("--observe-arm", action="append", default=[], help="Enable footprint sampling only for this arm")
    p.add_argument("--model", type=Path, default=Path.home()/".slotstream/models/qwen38-flash-next-mlx-4bit")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--timeout", type=int, default=1800)
    p.add_argument("--prepare-only", action="store_true")
    a = p.parse_args()
    if not (8.1 <= a.memory_gb <= 10 and a.rounds > 0 and a.max_tokens > 0 and a.timeout > 0):
        p.error("use an 8.1–10 GB target and positive rounds/output/timeout")
    chunks = [int(c) for c in a.chunks.split(",")]
    if any(c < 256 or c > 4096 for c in chunks): p.error("chunks must be within 256..4096")
    if len(chunks) != len(set(chunks)): p.error("chunks must be unique")
    arms = {}
    for arm in a.arm or [f"{a.label}=.build/release/slotstream"]:
        name, path = arm.split("=", 1)
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name) or name in arms: p.error("unique safe arm names required")
        arms[name] = Path(path).resolve()
    if any(name not in arms for name in a.observe_arm): p.error("observe-arm must name an arm")
    arm_chunks = {}
    for item in a.arm_chunk:
        name, value = item.split("=", 1)
        if name not in arms or name in arm_chunks or not value.isdecimal() or not 256 <= int(value) <= 4096:
            p.error("arm-chunk requires a unique arm and a 256..4096 integer")
        arm_chunks[name] = int(value)
    envs = {n: {} for n in arms}
    for item in a.arm_env:
        name, value = item.split("=", 1); values = json.loads(value)
        if name not in arms or not isinstance(values, dict) or any(not k.startswith("SLOTSTREAM_") or not isinstance(v, str) for k,v in values.items()):
            p.error("arm-env requires an arm and string SLOTSTREAM_ overrides")
        envs[name].update(values)
    prompts = {}
    for name in a.prompts.split(","):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name): p.error("invalid fixture name")
        prompts[name] = FIXTURES/f"{name}.txt"
        if not prompts[name].is_file(): p.error(f"missing immutable fixture {name}")
    a.out = a.out.resolve(); a.out.mkdir(parents=True, exist_ok=False)
    # Preserve fixture bytes as well as hashes; a future source edit must not
    # make an old benchmark impossible to reconstruct.
    (a.out / "fixtures").mkdir()
    import shutil
    for name, fixture in list(prompts.items()):
        shutil.copyfile(fixture, a.out / "fixtures" / fixture.name)
        prompts[name] = a.out / "fixtures" / fixture.name
    identities = {}
    for name, binary in arms.items():
        identity_file = binary.parent / "build-identity.json"
        source_file = binary.parent / "build-source.tar.gz"
        identity = json.loads(identity_file.read_text())
        if identity["binary_sha256"] != digest(binary) or identity["metallib_sha256"] != digest(binary.parent / "mlx.metallib"):
            raise ValueError(f"{name}: executable/metallib does not match build identity")
        if identity["source_archive_sha256"] != digest(source_file):
            raise ValueError(f"{name}: source archive does not match build identity")
        shutil.copyfile(source_file, a.out / f"{name}-source.tar.gz")
        identities[name] = identity
    base_env = {k:v for k,v in os.environ.items() if not k.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
    manifest = {"schema_version": 1, "head": subprocess.check_output(["git","rev-parse","HEAD"], cwd=ROOT, text=True).strip(),
                "worktree_source": capture_sources(a.out), "build_identities": identities, "model": model_identity(a.model),
                "arms": {n:{"binary":str(b),"sha256":digest(b),"metallib_sha256":digest(b.parent/"mlx.metallib"),"env":envs[n]} for n,b in arms.items()},
                "fixtures": {n:{"path":str(f),"sha256":digest(f)} for n,f in prompts.items()},
                "conditions": {"filesystem_cache":"uncontrolled; no purge","expert_cache":"empty per process","prefix_cache":"empty per process","mtp":a.mtp == "on"},
                "arguments": {k:str(v) if isinstance(v,Path) else v for k,v in vars(a).items()}}
    (a.out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    if a.prepare_only: print(json.dumps({"prepared":str(a.out)})); return
    rows = []
    for ri in range(a.rounds):
        order = list(arms) if ri%2 == 0 else list(reversed(arms))
        for pname,fixture in prompts.items():
            for chunk in chunks:
                for name in order:
                    cell = a.out/f"{ri+1}-{pname}-{chunk}-{name}"; cell.mkdir()
                    row = {"round":ri+1,"prompt":pname,"chunk":chunk,"arm":name,"valid":False}
                    effective_chunk = arm_chunks.get(name, chunk)
                    row["requested_effective_chunk"] = effective_chunk
                    env = base_env | envs[name] | {"SLOTSTREAM_PREFILL_CHUNK":str(effective_chunk)}
                    command = [str(arms[name]),"run","--raw","--prompt-file",str(fixture),"--model",str(a.model),
                               "--memory-gb",str(a.memory_gb),"--mtp",a.mtp,"--seed",str(a.seed),
                               "--max-tokens",str(a.max_tokens),"--stats-json",str(cell/"metrics.json")]
                    if not a.sampled: command.append("--greedy")
                    if a.sample_footprint or name in a.observe_arm: command.append("--sample-footprint")
                    row["command"] = command
                    row["environment"] = {k:v for k,v in env.items() if k.startswith("SLOTSTREAM_")}
                    try:
                        extra = max(0, (effective_chunk - 256) * 1.30e-3)
                        if env.get("SLOTSTREAM_OPT_LAYER_WORKSPACE") == "1": extra += 2.0
                        scope = int(env.get("SLOTSTREAM_OPT_READ_SCOPE", "0"))
                        if scope > 0: extra += max(0, scope - effective_chunk) * 1.30e-3 + 0.12
                        row["override_extra_allowance_gb"] = extra
                        row["host_before"] = host_conditions()
                        row["before"] = preflight(a.memory_gb+extra+3)
                        start = time.monotonic()
                        row["exit_code"] = run_child(command,env,cell,a.timeout)
                        row["wall_seconds"] = time.monotonic()-start; row["after"] = vm_snapshot()
                        row["host_after"] = host_conditions()
                        if row["exit_code"] != 0: raise ValueError(f"child exit {row['exit_code']}")
                        d = json.loads((cell/"metrics.json").read_text()); validate_metrics(d)
                        if d["effective_prefill_chunk"] != effective_chunk or d["effective_mtp"] != (a.mtp == "on"): raise ValueError("effective configuration differs")
                        row["metrics"] = d
                        if any(row["after"][k] != row["before"][k] for k in ("swapins","swapouts")):
                            raise ValueError("swap activity during cell; timing excluded")
                        row["valid"] = True
                    except (OSError,ValueError,KeyError,RuntimeError,subprocess.TimeoutExpired) as e: row["exclusion"] = str(e)
                    (cell/"result.json").write_text(json.dumps(row,indent=2)+"\n")
                    with (a.out/"results.jsonl").open("a") as f: f.write(json.dumps(row)+"\n")
                    rows.append(row)
                    print(json.dumps({k:v for k,v in row.items() if k not in ("metrics","before","after","command","environment","host_before","host_after")}),flush=True)
    groups = {}
    for row in rows:
        if row["valid"]: groups.setdefault((row["prompt"],row["chunk"],row["arm"]),[]).append(row)
    summary = [{"prompt":k[0],"chunk":k[1],"arm":k[2],"valid_rounds":len(rs),
                "median_prefill_seconds":statistics.median(r["metrics"]["stats"]["prefillSeconds"] for r in rs),
                "median_request_seconds":statistics.median(r["metrics"]["stats"]["requestSeconds"] for r in rs),
                "prefill_records":[r["metrics"]["stats"]["prefillRecords"] for r in rs]} for k,rs in sorted(groups.items())]
    (a.out/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    (a.out/"paired-summary.json").write_text(json.dumps(paired_summary(rows, next(iter(arms))), indent=2)+"\n")
    if not all(r["valid"] for r in rows): raise SystemExit(1)


if __name__ == "__main__": main()

````````````

## Artifact SHA-256 18c48beec6792bf6824368b3e0d8170e39b40d681e89ba118f0c2b4a6f26d149

Encoding: `utf-8`. Original bytes: 61080.

````````````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import sys
sys.path.insert(0, "/Users/carlos/Projects/slotstream/Tools")
from startup_policy import validate_policy, swapin_only, exclude_contaminated_startup
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
import sys
sys.path.insert(0, '/Users/carlos/Projects/slotstream/Tools')
from thermal_settle import validate as validate_thermal_settle, wait as wait_thermal_settle
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix',
                             'expected_warmup_checkpoint_stores'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    stores = study.get('expected_warmup_checkpoint_stores')
    if 'expected_warmup_checkpoint_stores' in study:
        if (not study.get('complete_prompt', False) or type(stores) is not dict
            or set(stores) != set(protocol['arms'])
            or any(type(n) is not int or n not in [0, 1] for n in stores.values())
            or stores.get('reference') != 0):
            raise ValueError('combined complete-prompt warmup stores require exact zero/one counts for every arm')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'ngramCachedRows', 'ngramCachePayloadBytes', 'ngramRowHits', 'ngramRowMisses',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False,
                                partial_prefix=False, warmup_checkpoint_stores=None):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    stores = (warmup_checkpoint_stores[name] if warmup_checkpoint_stores is not None
              else int(want > 0 and not full))
    if warm['stats'].get('prefixCheckpointStores') != stores:
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses',
               'ngramCachedRows', 'ngramRowHits', 'ngramRowMisses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    thermal_settle = validate_thermal_settle(protocol)
    validate_policy(protocol)
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    warmup_checkpoint_stores = (protocol.get('prefix_cache') or {}).get('expected_warmup_checkpoint_stores')
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if thermal_settle is not None:
                    try:
                        row['thermal_settle'] = wait_thermal_settle(thermal_settle, required_memory+extra)
                    except Exception:
                        stop_requested = True
                        raise
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                if swapin_only(protocol, row['before_startup'], row['after_warmup_vm'], warm['metrics']['stats'], resource_exclusions):
                                    row['startup_swapin_contamination'] = True
                                else:
                                    warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix,
                        warmup_checkpoint_stores=warmup_checkpoint_stores)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    exclude_contaminated_startup(row, exclusions)
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

````````````

## Artifact SHA-256 8cf6d5805ce5fee2338a6feb962172018cdbb566b61e2ea1470349f2fa6ce2ec

Encoding: `utf-8`. Original bytes: 1797.

````````````text
"""Prospective classification only; contaminated pairs never qualify."""


def validate_policy(protocol):
    value = protocol.get('startup_swapin_policy')
    if value is None:
        return False
    if (value != 'exclude_pair' or type(value) is not str
            or not isinstance(protocol.get('large_vision_measurement'), dict)
            or protocol.get('memory_gb') != 12
            or protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or protocol.get('maximum_sampled_footprint_bytes') != 12_000_000_000):
        raise ValueError('startup swap-in exclusion requires the explicit original large-image safety envelope')
    return True


def swapin_only(protocol, before, after, stats, resource_exclusions):
    if not validate_policy(protocol):
        return False
    if resource_exclusions(stats, protocol):
        return False
    if type(stats.get('decodeTokens')) is not int or stats['decodeTokens'] < protocol.get('minimum_output_tokens', 1):
        return False
    generator_before = stats.get('generatorVMBefore')
    generator_after = stats.get('generatorVMAfter')
    snapshots = (before, generator_before, generator_after, after)
    if any(not isinstance(s, dict) or any(type(s.get(k)) is not int or s[k] < 0
            for k in ('swapins', 'swapouts')) for s in snapshots):
        return False
    if any(s['swapouts'] != before['swapouts'] for s in snapshots):
        return False
    reads = [s['swapins'] for s in snapshots]
    return reads == sorted(reads) and reads[-1] > reads[0]


def exclude_contaminated_startup(row, exclusions):
    if row.get('startup_swapin_contamination') is True:
        exclusions.append('swap-ins during startup/warmup; entire pair excluded')

````````````

## Artifact SHA-256 13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad

Encoding: `utf-8`. Original bytes: 6912.

````````````text
"""Optional sampled thermal readiness before a future benchmark model launch.

No inference, timed request, historical result or acceptance rule is changed.
The model lock is held while waiting and released before ordinary preflight.
Nominal samples do not promise that a subsequent request stays nominal.
"""
import fcntl
import json
import math
import os
from pathlib import Path
import time


def validate(protocol):
    value = protocol.get('before_cell_thermal_settle')
    if value is None:
        return None
    if (type(value) is not dict
        or set(value) != {'stable_seconds', 'maximum_wait_seconds', 'poll_seconds'}
        or type(value['stable_seconds']) is not int or not 30 <= value['stable_seconds'] <= 120
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 600
        or type(value['poll_seconds']) is not int or not 1 <= value['poll_seconds'] <= 5
        or protocol.get('require_nominal_power_state') is not True
        or protocol.get('stop_on_workspace_contention') is not True):
        raise ValueError('thermal settling requires explicit bounded durations and original strict resource/thermal/contention guards')
    return dict(value)


def wait(requirement, required_gb, *, observe=None, vm=None, pressure=None, jobs=None,
         now=time.monotonic, sleep=time.sleep, lock_path=None, record=None):
    if requirement is None:
        return {'enabled': False}
    validate({'before_cell_thermal_settle': requirement, 'require_nominal_power_state': True,
              'stop_on_workspace_contention': True})
    if type(required_gb) not in (int, float) or not math.isfinite(required_gb) or required_gb < 0:
        raise ValueError('invalid original admission requirement')
    if observe is None:
        from thermal_readiness import observe
    if vm is None:
        from prefill_bench import vm_snapshot as vm
    if pressure is None:
        from optimization_readiness import pressure_snapshot as pressure
    if jobs is None:
        from serve_bench import competing_jobs as jobs
    if record is None:
        record = lambda value: print(json.dumps({'thermal_settle': value}), flush=True)
    started = now()
    nominal_since = previous_time = swapouts = previous_swapins = None
    samples = 0
    minimum = required_gb * 1e9
    path = lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock'
    with open(path, 'a') as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as error:
            raise RuntimeError('another model owns the lock; no thermal settling or launch') from error
        while True:
            current = now()
            elapsed = current - started
            if elapsed < 0 or (previous_time is not None and current < previous_time):
                raise RuntimeError('monotonic clock moved backwards')
            if elapsed > requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired; no model launched')
            state, memory, pressure_state, competing = observe(), vm(), pressure(), jobs()
            after_observation = now()
            if after_observation < current:
                raise RuntimeError('monotonic clock moved backwards')
            current = after_observation
            elapsed = current - started
            if elapsed > requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired during observation; no model launched')
            samples += 1
            record({'seconds': elapsed, 'conditions': state.get('conditions'),
                    'reclaimable_bytes': memory.get('reclaimable_bytes'),
                    'swapins': memory.get('swapins'), 'swapouts': memory.get('swapouts'),
                    'pressure_level': pressure_state.get('level'), 'competing_jobs': competing})
            if competing:
                raise RuntimeError('competing storage/build work during thermal settling')
            if type(pressure_state.get('level')) is not int or pressure_state['level'] != 1:
                raise RuntimeError('memory pressure is not normal during thermal settling')
            if type(memory.get('reclaimable_bytes')) is not int or memory['reclaimable_bytes'] < minimum:
                raise RuntimeError('original startup memory requirement no longer fits')
            for key in ('swapins', 'swapouts'):
                if type(memory.get(key)) is not int or memory[key] < 0:
                    raise RuntimeError('VM counters are unavailable during thermal settling')
            if swapouts is not None and memory['swapouts'] != swapouts:
                raise RuntimeError('swap-out counter changed during thermal settling')
            if previous_swapins is not None and memory['swapins'] < previous_swapins:
                raise RuntimeError('swap-in counter moved backwards during thermal settling')
            swapouts = memory['swapouts']
            previous_swapins = memory['swapins']
            conditions = state.get('conditions')
            if (type(conditions) is not dict or set(conditions) != {'thermalState', 'lowPowerModeEnabled'}
                or conditions['thermalState'] not in ('nominal', 'fair', 'serious', 'critical')
                or type(conditions['lowPowerModeEnabled']) is not bool
                or type(state.get('ready')) is not bool
                or state['ready'] != (conditions['thermalState'] == 'nominal' and not conditions['lowPowerModeEnabled'])):
                raise RuntimeError('thermal/power observation is malformed or unavailable')
            if conditions['lowPowerModeEnabled'] or conditions['thermalState'] in ('serious', 'critical'):
                raise RuntimeError('thermal/power condition requires stopping before a model launch')
            # A scheduling gap cannot supply an unobserved stability interval.
            gap = previous_time is not None and current - previous_time > 2 * requirement['poll_seconds']
            if conditions['thermalState'] != 'nominal' or gap:
                nominal_since = None
            elif nominal_since is None:
                nominal_since = current
            previous_time = current
            stable = 0 if nominal_since is None else current - nominal_since
            if stable >= requirement['stable_seconds']:
                return {'enabled': True, 'reserved': True, 'seconds': elapsed,
                        'sampled_nominal_seconds': stable, 'samples': samples,
                        'before_launch_only': True, 'request_acceptance_unchanged': True}
            if elapsed >= requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired; no model launched')
            sleep(min(requirement['poll_seconds'], requirement['maximum_wait_seconds'] - elapsed))

````````````

## Artifact SHA-256 be9199fbfcf1fcd89f59ced6ed013f678ba314f8413fb8cb3b3f58bb7f6b7210

Encoding: `utf-8`. Original bytes: 1894.

````````````text
{
  "input": "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/serve_bench.py",
  "input_sha256": "cd9b42730c9b2b32fd285fe059da093a70a379fff4c905510e46e1efb8db9272",
  "driver_sha256": "18c48beec6792bf6824368b3e0d8170e39b40d681e89ba118f0c2b4a6f26d149",
  "helpers": {
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/startup_policy.py": "8cf6d5805ce5fee2338a6feb962172018cdbb566b61e2ea1470349f2fa6ce2ec",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/thermal_settle.py": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  "edits": [
    {
      "old": "from prefill_bench import ROOT,",
      "new": "import sys\nsys.path.insert(0, '/Users/carlos/Projects/slotstream/Tools')\nfrom thermal_settle import validate as validate_thermal_settle, wait as wait_thermal_settle\nfrom prefill_bench import ROOT,"
    },
    {
      "old": "    validate_arms(protocol.get('arms'))\n",
      "new": "    validate_arms(protocol.get('arms'))\n    thermal_settle = validate_thermal_settle(protocol)\n"
    },
    {
      "old": "                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)\n",
      "new": "                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)\n                if thermal_settle is not None:\n                    try:\n                        row['thermal_settle'] = wait_thermal_settle(thermal_settle, required_memory+extra)\n                    except Exception:\n                        stop_requested = True\n                        raise\n"
    }
  ],
  "reconstructs_V381_exactly": true,
  "model_launched": false
}

````````````

## Artifact SHA-256 08af8671ca9751c3d29dc465fdb0e39de9dfca12f2fff054c443e3e691c2d481

Encoding: `utf-8`. Original bytes: 8893.

````````````text
{
  "frozen_at": "2026-09-08T23:38:15.775603+00:00",
  "native_proof": {
    "image-reuse": {
      "assertions": 76,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse",
        "sha256": {
          "attempt.json": "771b5f6417dc0771b979fb606fa981ca9cc27100391aef6471ee8832c96246e8",
          "receipt.json": "b7013145b09f9639d0f08e8e72331f1dee4ae4d5f28b2fbb3cfb38fca1be8073",
          "stdout.txt": "e651d90a731a3f5d3ff48022247f967966c87e84cf80267d507643bff23b940a",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-capacity": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 104,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity",
        "sha256": {
          "attempt.json": "1f59fdb9f8f71471b741ab5da1dea7a620d0d55ad957c58cf2e8832571eecc84",
          "receipt.json": "ac41c79129a25b6d3c924cca0ff5d413c075f44500abf1579cbecf7233873a9a",
          "qualification.json": "1b05fca1bcc0e6e1d5280d76d763cdd86993159d1ef6ca4bce258f6d28c4be31",
          "stdout.txt": "2c901927e46b6cedaf1f41021c7dc3eeabec810b769d84f62ea599127bbad839",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-tower": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 47,
        "exact_tower_comparisons": 7
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower",
        "sha256": {
          "attempt.json": "c6c072174bd22437a9cfff5d6b1cdba560fe76fd7df831c8a2ea39b04c986e2f",
          "receipt.json": "def1a0f16113d865befb4a9ae9e7664ea1de9702a4ec4d6e917bd067a70b4f64",
          "qualification.json": "9881e16798d2d582fabe4b5b1dc4a574b0d7bd6e1a7ce1255f1007b416a989cd",
          "stdout.txt": "3d9d10f6e14592429833ce860fba18f93c0636562e11b7a1a5ef4e474f501219",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-maximum-reference": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 6,
        "exact_tower_comparisons": 1
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference",
        "sha256": {
          "attempt.json": "c854592080741f1b89cdd13e8a53f28a367acbc555b31269f10c53803c895564",
          "receipt.json": "7124977d30243802983d5b12fee13d8d57ad8c61114f672bb1e6a13a31dd019d",
          "qualification.json": "e63cea8cf10b1a66bfbd4ee1d43bed303352d2d3931273e47775b83bf4e53096",
          "stdout.txt": "fe745e31aca98b9279ff62bf9dca77c0f5bdff29331bc5119c03f35ec9aab21b",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "integrated-vision-query": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 270,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query",
        "sha256": {
          "attempt.json": "cb51513371bf901354ee7a5c18a915bc9803b43e1f88e32556535d8f781b3a26",
          "receipt.json": "78c48da1dda732f5d587fae8f2431ffed4de0c73ab4968857f4caa16fe21aebf",
          "qualification.json": "c3ae2a413e324bd8ee434171a376bbbf22a5968b18a42cf16ef05310b606353d",
          "stdout.txt": "ba0b480159626402785581bd32d99f3acb9058e8869c6f3f25e5468fda1182c5",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    },
    "integrated-vision-query-mtp": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 284,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query-mtp",
        "sha256": {
          "attempt.json": "8e6f53852c5233500f685cae6deb05634412ccc51fc3b38fbf08afc11193b25e",
          "receipt.json": "b8ff7f337bebef3ee60e3cf352f84911ac61e74929f1c01aa97fae3eac21ae9f",
          "qualification.json": "838dd35622c6c678b68e62c0a4da8ac16410a3c5d546303d007e5cc773188398",
          "stdout.txt": "93d96fe6910d93c8aafc70e56209b77348c9042ed9ebf922fa2cfe44275f5ec3",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    }
  },
  "full_photo_proof": {
    "assessment": {
      "completed": true,
      "passed": true,
      "qualified": true,
      "assertions": 25,
      "observed_query_tile_calls": 3699,
      "classification": "Current full-photo correctness only; no speed or capacity claim."
    },
    "execution": {
      "artifact-sha256.json": "a9f5a3accff494feb8be87726e193dc5a0f3af3182480a6a83e0cf1eb771b1e4",
      "attempt.json": "f7cf21242d28d909a719262ff2ba78aa9e193577631076d9d369f4dff65e4730",
      "memory.json": "b2c444364e5cdd242c05d728f69102e1ee8e48ec7962944487ad7099c00db6db",
      "memory.samples.jsonl": "0eef4f7352739ab5c4fb355659597b0ecada8506bb98b45b449c3f781c254183",
      "qualification.json": "ff110df04526a5b6ab85255a12a9d60cdc8d404b370e3f5db1f5b26fb48973f1",
      "receipt.json": "88f573eaa9e7d88d26814a2b39a7f5829655f154eb600092d39f64345b38bcd2",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "d4bbe6022cf576e58bdebca95699a3ef6057de1d0e6906af2857373d5b9604f5"
    },
    "responses": {
      "manifest.json": "b828e751a57e7cc873f4b1b2acf5e4de658071f59c1e20c5bd0bfbc46abbeda0",
      "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
      "responses/01.json": "ab7208066b2343ff2b96fd55a9ec12bdd2e3fbd7618d79592b6f8ab49b443f93",
      "responses/02.json": "d26fafed4905736921e7502eaafdcaad215d031963ce9e2925e49f0550ee1064",
      "responses/03.json": "2d107ffcb1498a67314a45eb2472d654ca39c011c0503ab0c33de1ab49e82d6f",
      "responses/04.json": "76b0ed9b8237e3eccc4aa241c4a5eb1421314e50cb446dffdb14a5be04ca1a5d",
      "responses/05.json": "6f9b2c9b60f3412d37153bfb6c025c86f60151b0d791fde58918e3a379e3966f",
      "responses/06.json": "859bb1b5c8c5667337ffefcc8f4638b699bcaf524d56a3443daddc495c8d8494",
      "responses/07.json": "3ed447c98fcf3c4c6606de82f7843d8d39d8d1769cb728880a6c64cffd94eade",
      "responses/08.json": "f253d697de09c98cc5fa238ea1f4fd290855877436c61c7f326f776d1aadadba",
      "responses/09.json": "883db051bdf30cec4eea1f3269983c4d66e439ffd84d2ef1de8d89c03c5f0870",
      "responses/10.json": "a54b6f1f40d1d395f680b5953fe2ccac9949a35fe8b4925c398b89e82aff1a42",
      "responses/11.json": "2deae304b73b9f1ed19540ea585876d4f8e88710f7dbf0719a4066f05ab7cc55",
      "responses/12.json": "f42e1c0f6b27b98021af11510f46c8f9f1292e52d52fe6e80a5a139b9f3c4893",
      "responses/13.json": "547cef490afe3bd61ad49877b9a9124be566b2d0e6db7792286b5eff13415cc2",
      "responses/14.json": "d196eda955d948557527e5172ee034671de90057c33a3be6bdd89be2eef1f638",
      "responses/15.json": "5140ab4324a64598672cbd42e9e341e489be03d544b6bf97666fe4f18afdb792",
      "responses/16.json": "385925c5dbdb012f72d65820da7b22430251e6ea33965ed092968631bb69d1e1",
      "responses/17.json": "16a806b64065ddf71055003297dd475d392a02b872618229ea881333628eb9c0",
      "responses/18.json": "3062ed5963fa6040a90e301c9d36138fc81e8cc377794ac6360da6ffb8e6a4e5",
      "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
      "server.stderr": "d87c78adff25b41b0c08409155b0d7c4368de79096765553ef548bd9e0925212",
      "server.stdout": "78206fe9a84122ee0c950cc409e57d7a496db3d49e4bf37102d50a8ac809dfb9",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "c0e0d887ea60228205da65de366ff981976ff1759c75103f3d5c1c448dad0ee0",
      "vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
      "vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
    }
  },
  "preparation_sha256": "5d6bd47faeec6294b5325464925543c34acb09c3ae94eafd6aebd69c59dd91f5",
  "protocol_sha256": "1ca5b6deaa7ea02c63ea6cafa78a09736e6456979de80de01e889836fd14a801"
}

````````````

## Artifact SHA-256 1ca5b6deaa7ea02c63ea6cafa78a09736e6456979de80de01e889836fd14a801

Encoding: `utf-8`. Original bytes: 14196.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
  "memory_gb": 12,
  "mtp": "off",
  "raw": false,
  "seed": 7,
  "rounds": 12,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 12000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    },
    "query": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "256",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "vision-headroom-resume-v413",
  "classification": "New full24-cell mechanism cohort after preserved V385 thermal stop and V395 pre-model headroom stop. Colima is stopped and subsequent native preflights observe sufficient headroom; live original admission remains mandatory. Original startup-swap-in pair exclusion and all workload/physical/exact-work/request acceptance remain. Each model launch additionally requires60 sampled nominal seconds, at most300 extra seconds after the original60-second cooldown. Full added waiting allowance is reserved; no old rows, replacements or threshold relaxation.",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt",
  "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "conditions": "Twelve fixed alternating fresh-server pairs,exactly640slots/native --pool-gb1.769472,one1536square image/9216patches,one output, MTP/prefix/elastic off. The NEWmeasured whole-request ceiling is12GBand host preflight requires18GBreclaimable. Both earlier10GBreference attempts already used640slots and remain excluded; the earlier assumption of more reference slots is corrected. Holding640slots under12GBdoes not validate a target-driven12GBplan or a10GBproduct request. Same current V304binary, image bytes, ordinary base, exact output/work/mechanism,200MBpeak saving in every clean pair,at most5percent median client regression,min5clean of12fixed pairs,nominal power/zeroVM,180second quiet/60second cooldown/immediate resource stop/no replacements. No prior result is pooled.",
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0,
    "minimum_sampled_peak_savings_bytes": 200000000
  },
  "frozen_binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
  "stop_on_workspace_contention": true,
  "think": false,
  "abort_on_resource_failure": true,
  "images": [
    {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-1536.png",
      "sha256": "03484e0f55cda3a29eef4bd35e1e2c086a943911c940a26100fbaddce07d7bbb"
    }
  ],
  "work_constraints": {
    "reference": {
      "encodedImages": {
        "min": 1,
        "max": 1
      },
      "reusedImageFeatures": {
        "min": 0,
        "max": 0
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 0,
        "max": 0
      },
      "visionQueryTileCalls": {
        "min": 0,
        "max": 0
      }
    },
    "query": {
      "encodedImages": {
        "min": 1,
        "max": 1
      },
      "reusedImageFeatures": {
        "min": 0,
        "max": 0
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 256,
        "max": 256
      },
      "visionQueryTileCalls": {
        "min": 972,
        "max": 972
      }
    }
  },
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeForwardPasses",
    "decodeModelTokens",
    "draftedTokens",
    "verifyPasses"
  ],
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "primary_metric": "Bounded mechanism/resource benefit at explicit640slots and12GBmeasured ceiling: min5clean pairs,at least200MBwhole-request sampled-peak saving each,at most5percent median client regression,exact IDs/text and required work. Report actual peaks and latency. Separate10GBcandidate-only capacity, target-driven accounting, combined and compatibility gates are still required before adopting query tiling.",
  "successor_basis": "New maximum-size hypothesis: at9216patches an unfused dense score domain has16*9216*9216elements, whereas256query tiles have16*256*9216elements. This logical domain reduction is not a measured allocation or saving. At1024pixels generation dominated the observed whole-request peak and the200MB gate failed. The max-size native tower is byte-exact and the previous max candidate-only serving run was swap-excluded; neither establishes paired resource savings. This study keeps the same gates and tests the supported maximum independently.",
  "predecessor_protocol": {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1024-protocol-v132.json",
    "sha256": "25941bca411884439b583915b592e9535e3ec8b2a1254f0f6d0bd91dd01a6fc8",
    "disposition": "V132 resource gate failed; preserved without rescoring or pooling"
  },
  "fixed_pool_slots": 640,
  "predecessor": {
    "runs": [
      "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-paired-serving-v157",
      "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-fixed-pool-serving-v158"
    ],
    "disposition": "Both reference cells actually640slots, over10GBand swap-excluded; no candidate or pair. Previous claimed pool reduction was incorrect and is explicitly superseded."
  },
  "large_vision_measurement": {
    "purpose": "Both reference and query256 can be compared with640slots under a newly declared12GBphysical ceiling after reference maxima exceeded10GB. No pool increase or target-planner claim."
  },
  "historical_conditions": "Twelve fixed alternating fresh-server pairs,exactly640slots/native --pool-gb1.769472,one1536square image/9216patches,one output, MTP/prefix/elastic off. The NEWmeasured whole-request ceiling is12GBand host preflight requires18GBreclaimable. Both earlier10GBreference attempts already used640slots and remain excluded; the earlier assumption of more reference slots is corrected. Holding640slots under12GBdoes not validate a target-driven12GBplan or a10GBproduct request. Same V125binary, image bytes, ordinary base, exact output/work/mechanism,200MBpeak saving in every clean pair,at most5percent median client regression,min5clean of12fixed pairs,nominal power/zeroVM,180second quiet/60second cooldown/immediate resource stop/no replacements. No prior result is pooled.",
  "historical_native_prerequisites": {
    "vision-query-tile-capacity": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-tile-capacity-v125/manifest.json",
      "sha256": "bf5748bee98d1e858e895b0b7ff92c1a0d853fe34ec0be40a96f859db9d66faf",
      "assertions": 104,
      "passed": true
    },
    "vision-query-tile-tower": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-tile-tower-v125/manifest.json",
      "sha256": "0d5a3d126384ed86cd333ff9f92024421b04de77445dcc953bf07c1a900a30db",
      "assertions": 47,
      "passed": true
    },
    "vision-query-maximum-reference": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-maximum-reference-v125/manifest.json",
      "sha256": "eb47718061d653f491d4fe60a9f2b6f56762920eb141642570b1279c0777b552",
      "assertions": 6,
      "passed": true
    },
    "image-reuse": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/image-reuse-v125/manifest.json",
      "sha256": "ee115fe202aa2e4a2fd8ed7919e522630693cb163564188241dffd09860a68ea",
      "assertions": 76,
      "passed": true
    },
    "integrated-vision-query": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/integrated-vision-query-v125/manifest.json",
      "sha256": "d1dca396f8809346508f80bc4d15e6f43b3aec94d389360a81d67bd1ba22306f",
      "assertions": 195,
      "passed": true
    },
    "integrated-vision-query-mtp": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/integrated-vision-query-mtp-v125/manifest.json",
      "sha256": "bc47daaf7f44a359a7493001c483e7b4594637f2fea9b959f41c5f4d63df6b88",
      "assertions": 209,
      "passed": true
    },
    "known-content-serving": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-serving-quality-v125/manifest.json",
      "sha256": "763b59bd8ed3b9cbed76e5b1f62173a09cfb6635f74c979e94d6ee9e1b92f0af",
      "assertions": 25,
      "passed": true
    }
  },
  "current_prerequisite_binding": "/private/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/mechanism/binding.json",
  "startup_swapin_policy": "exclude_pair",
  "before_cell_thermal_settle": {
    "stable_seconds": 60,
    "maximum_wait_seconds": 300,
    "poll_seconds": 2
  }
}

````````````

## Artifact SHA-256 5d6bd47faeec6294b5325464925543c34acb09c3ae94eafd6aebd69c59dd91f5

Encoding: `utf-8`. Original bytes: 44769.

````````````text
{
  "prepared_at": "2026-09-08T23:38:03.940331+00:00",
  "dependencies": {
    "/private/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/run.py": "1830fa7005111405c7557d98afefb2c31d601b794cd999d9ad802b2edf01647a",
    "/private/tmp/slotstream-optimization-execution/thermally-settled-vision-v395/preparation.json": "c3fca2b504a257f5494ad8fad9a2afe8e063932a101161df42a0cef541b25168",
    "/private/tmp/slotstream-optimization-execution/thermally-settled-vision-v395/mechanism/protocol.json": "cdc2e9ccd822c2060266e0a1a158551d60808f1543f7342bcb29710cbf3a68c4",
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v385/run.py": "e9b35bdd54d65f65389d93444fdb303366ec5a50cb99b1da8130f5ecbfd47d9e",
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v385/preparation.json": "6f1734e4bdf78755796b2bc916e9d81d90880f043a69b09c4a9e97ad0995b9bf",
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v385/mechanism/protocol.json": "4c1d5616f6ba4a9f1b7b3f73a5d1e089e370379bdb16b0b6697ec375769e322c",
    "/private/tmp/slotstream-optimization-execution/vision-mechanism-fixed-cohort-v385/mechanism/binding.json": "5c8b3e623dc8521e9f2e12b112ed1de1e01472b98628a5c77d2fe561c79617c9",
    "/private/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/build_driver.py": "3fa46bcc04731d4b44129818d98ece18f4cc323b42950fda0052c5ed2eef06c2",
    "/private/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/driver-transformation.json": "be9199fbfcf1fcd89f59ced6ed013f678ba314f8413fb8cb3b3f58bb7f6b7210",
    "/private/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/driver/serve_bench.py": "18c48beec6792bf6824368b3e0d8170e39b40d681e89ba118f0c2b4a6f26d149",
    "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/driver-transformation.json": "6a87ec5ea890dc30d4f8ac564036c4a508023063fd37a5d64575b612b6fd0972",
    "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/checks.py": "27b43360c2e809003cc5ecd0b95701939d85c84cbcba9fbe3d7d09bde7b09085",
    "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/checks.stderr": "eeab02abe9b92e7c152c32b1cc7001c9ce940d8aa68d7a1f819249dbe80aaa6e",
    "/Users/carlos/Projects/slotstream/Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048",
    "/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/startup_policy.py": "8cf6d5805ce5fee2338a6feb962172018cdbb566b61e2ea1470349f2fa6ce2ec",
    "/private/tmp/slotstream-optimization-execution/vision-startup-swapin-policy-v381/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/thermal_settle.py": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad",
    "/private/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/driver/startup_policy.py": "8cf6d5805ce5fee2338a6feb962172018cdbb566b61e2ea1470349f2fa6ce2ec",
    "/private/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/driver/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/private/tmp/slotstream-optimization-execution/vision-headroom-resume-v413/driver/thermal_settle.py": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  "preserved": {
    "raw": {
      "1-query/response.ndjson": "7f43f95b8ad8bab34d05de7ee23fcdcdf89490e250b9d6752329817974f5a913",
      "1-query/result.json": "b29ae25d7bf4978739ee4bdc61a8ce04a98c34b101c6c2bcccd9dd212501fb8c",
      "1-query/server.stderr": "bc01e3f61c0126986e810d9c2e828b61835355a022532cf291eb1ec4dbc7e2f3",
      "1-query/server.stdout": "74f68558881cf189639dcbb82dbb31c47efaee93c96734b19fee04a823541aa0",
      "1-query/warmup.json": "80c9b8ac6f3681d9fda0300a71a933c477e36e2e286f35bc49dcacb5fef62e06",
      "1-query/warmup.ndjson": "63d90cef0435d4934449262f69160101edd85f7bb4b07413a87ea0ad1ecfba23",
      "1-reference/response.ndjson": "db13e8ef7e65ae0f457ee4664f40862b2ecf0b7840f4ef83f6709c10328b020d",
      "1-reference/result.json": "1b8dd2414288480e2be28ebb1f55a50c085cf0d984cdbf5877a522e5550832bd",
      "1-reference/server.stderr": "95a58972192fe381471a728abba1609a4aa7fee905e98cdeecb7ed302f1d381a",
      "1-reference/server.stdout": "5c9c6b0bf2837d96b7fef72044894e6b980717d650290964dfc004a29c0e2558",
      "1-reference/warmup.json": "50a4661e92e9ef6df68f29dfddc2572141e43e4600f454ee14512a0952dae5f0",
      "1-reference/warmup.ndjson": "b3c39faf52307992b50317f7791d7365d3dde15caba8cd4d4016b3f2bace0aac",
      "2-query/response.ndjson": "bd580212f6c0ed4668fc351c7b16120228f24ef0dfd608b5ad03696a9c124746",
      "2-query/result.json": "3ca149d25ee7252a5ed9b6bcbfb5e6d720483214e24e17a5891582f20e5caf7e",
      "2-query/server.stderr": "ec79280953d2f576c79123c3d38df5fa9a2dc784a7f0cc20e97d75804d259ad6",
      "2-query/server.stdout": "4f7e0750ed1f9c8a5de12a3d29753e21c0aedf95916b72e68a467e978f35aad6",
      "2-query/warmup.json": "d5cc06d0aab8bea9278f0a72332175224437d29beaeeb642776169cb26df51f4",
      "2-query/warmup.ndjson": "a30439914344a134e2932e7ebb5d21559123e83e96ed91adb540f299c742a229",
      "2-reference/response.ndjson": "cd1177c8782650b250102e8c94e63a5df2dc5d29e61c46a750aa8a6d68ca3e4a",
      "2-reference/result.json": "b63c62e1f31ebf3b73c697dca42fbb846b49d87f367d66add7b4e91fa5a4d242",
      "2-reference/server.stderr": "17c4720c119fe6185dc484cf28120c1eb3df353c3607b24ab92bed3544e50433",
      "2-reference/server.stdout": "2f92a10125d41aaf583a71c1b9d8007189151cb15a7ff9b31c0615d7e63673ef",
      "2-reference/warmup.json": "9c2aeef36c13737bdec74baffd76ec814216836154612819c9857b2c8af268f0",
      "2-reference/warmup.ndjson": "fd366eaa335f41acb6b736ed6d6283e0dd752a6286eb0e97ca7936461e80d725",
      "3-reference/response.ndjson": "6b3aab5bcd8199c9120e8f827b9ad08c651d674ff8248b32668e9e08814480b7",
      "3-reference/result.json": "3a84e88061552c57f28f4fc734e4160c1294c6611b65792809f91c772bf0fa26",
      "3-reference/server.stderr": "9697e7471aeed97fded56ec1bcb86fba839e3e5d35b367754a64b1bb1dc0b73e",
      "3-reference/server.stdout": "145f7ea2426b6dd4aa4de235880700095997faa1f612229b113ab92d60d39f0c",
      "3-reference/warmup.json": "c75c65e5a0f5977432ee8386c5d81af082ba4561b74af6e3823848cc3b9ccbe9",
      "3-reference/warmup.ndjson": "3d5d669e47a9bcb0ca907d526257f104d55f5034a1104145e81344abbfd1167c",
      "build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "completion.json": "859c795784c3afcf11b4d31376ebc9c85bfe4c79e4c2ccb3370f58715b20bbc3",
      "fixture.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
      "image-0.png": "03484e0f55cda3a29eef4bd35e1e2c086a943911c940a26100fbaddce07d7bbb",
      "initial-workspace-quiet.json": "398afbed24736ddaf998747fe0482537ba856b7c2b02808f812e6b027dd44179",
      "manifest.json": "a411493814f872bdd02242b586a825bd2d3e0bd324c313d87cb30e3b460cbb91",
      "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
      "query-build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "reference-build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "request.json": "216f21df78c999613ff8cc13b23c464c0a898840de04c8fabbf1d8747c0bb4d0",
      "results.jsonl": "6644973a2d9d454c98d19a646a2db8abce4f35fa23fddcfd0b42c89744c1e221",
      "serve_bench.py": "cd9b42730c9b2b32fd285fe059da093a70a379fff4c905510e46e1efb8db9272",
      "startup-summary.json": "0a052d29ccbcf0493d3fa4b461825f34a8a669d255ad90a03c05bce60bae3496",
      "summary.json": "cb455037b089ebf76ba794199cbf7ec0b5f67e6bdbfc9506c39f89fe326bbab6"
    },
    "execution": {
      "artifact-sha256.json": "b8b557d83078c7d590470b1a1a9da2310bdd6f9c1665ed8ab4e61b20e2b0381d",
      "attempt.json": "bc47494dd40d6e5b16a69da2e95d035b7dcf7c09890bd96526148c62cbbe8402",
      "memory.json": "5717d979f6dbb27efac2abb459e7aa97ac19be1ecbb9377396f577f895878300",
      "memory.samples.jsonl": "0ca65880edf2c46ae383123bad45386f6d107de41534ef136ac2b037bd5bf46b",
      "qualification.json": "bb8bdfd1cc7bbfcd624cc57d39fe70f35e5a6a1ac226d4d3cdd32412bf319fda",
      "receipt.json": "826aa64eefdbaec53170a3ef09c93bf24e3cd129411ef5b878845b2ca1cb0d3b",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "567f0d041cce9747525b0b8269f16d19f186cc759a83e71555d710dc2da5ae8f"
    },
    "all_observed_first_measured_work_and_output_exact": true,
    "no_rows_reused": true,
    "latest_headroom_stop": {
      "raw": {
        "1-reference/result.json": "b20926a97cd29fc2015081f01c86114ccdb8c370494bc998d6df0cbd5613ceae",
        "build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
        "completion.json": "f0b3bda8f114e552f65f20c0b407a05c6e04b86ac26a2d6d1e3ff8cd49a6fe2f",
        "fixture.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
        "image-0.png": "03484e0f55cda3a29eef4bd35e1e2c086a943911c940a26100fbaddce07d7bbb",
        "initial-workspace-quiet.json": "4180528addcb844084ed33d8ffbe332fb9554ddacf0754f13fab6acb40569b9a",
        "manifest.json": "035ebeb5093ba6215461a77184cade97dbc940da25250be49fb5ba0416899d3d",
        "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
        "query-build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
        "reference-build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
        "request.json": "216f21df78c999613ff8cc13b23c464c0a898840de04c8fabbf1d8747c0bb4d0",
        "results.jsonl": "3638e615039a4f701274d8eb384f540e0041f76010ebaa042b59e4b5b073e6b8",
        "serve_bench.py": "18c48beec6792bf6824368b3e0d8170e39b40d681e89ba118f0c2b4a6f26d149",
        "startup-summary.json": "37517e5f3dc66819f61f5a7bb8ace1921282415f10551d2defa5c3eb0985b570",
        "summary.json": "37517e5f3dc66819f61f5a7bb8ace1921282415f10551d2defa5c3eb0985b570"
      },
      "execution": {
        "artifact-sha256.json": "0af87b7e6b7278bd501ea3ca5ef701f792dd45b1bf638b4bf12d7800e8bca0d5",
        "attempt.json": "8101fea2d5a427d7418fc5bdfce8bc24c0f1a9ec9eb3fd0d0e691c8eeae41efc",
        "memory.json": "bcc19f79f27e58c968586b0dc3e3b6903db4baf3e25f53a87b47647543e25724",
        "memory.samples.jsonl": "30f19cc2fbc617973b48a54e3cc382cb033f5c6a4dcec16e02a9e83b4d3cf1fd",
        "qualification.json": "0fbc29a2147bae4da3b14ba96a7bb99a069e71fa63f85964f93adcacbe7f116e",
        "receipt.json": "f9e3bd75ff2e68f688e3b5d29b84fb692e7f8a9194b3105b1c9e9a60a38a760d",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
        "stdout.txt": "0d657f7734668ec40a62ef5a31625e3a9cd0dfaa1f721e6f173136ef582ab5b1"
      },
      "completed_requests": 0,
      "model_launched": false
    }
  },
  "identity": {
    "build": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "identity": {
        "source": {
          "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
          "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
          "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
          "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
          "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
          "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
          "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
          "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
          "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
          "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
          "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
          "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
          "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
          "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
          "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
          "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
          "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
          "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
          "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
          "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
          "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
          "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
          "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
          "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
          "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
          "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
          "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
          "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
          "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
          "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
          "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
          "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
          "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
          "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
          "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
          "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
          "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
          "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
          "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
          "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
          "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
          "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
          "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
          "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
          "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
          "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
          "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
          "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
          "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
          "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
          "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
          "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
          "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
          "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
          "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
          "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
          "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
          "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
          "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
          "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
          "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
          "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
          "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
          "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
          "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
          "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
          "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
          "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
          "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
          "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
          "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
          "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
          "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
          "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
          "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
          "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
          "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
          "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
          "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
          "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
          "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
          "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
          "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
          "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
          "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
          "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
          "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
          "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
          "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
          "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
          "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
          "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
          "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
          "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
          "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
          "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
          "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
          "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
          "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
          "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
          "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
          "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
          "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
          "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
          "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
          "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
          "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
          "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
          "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
          "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
          "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
          "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
          "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
          "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
          "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
          "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
          "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
          "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
          "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
          "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
          "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
          "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
          "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
          "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
          "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
          "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
          "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
          "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
          "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
          "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
          "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
          "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
          "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
          "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
          "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
          "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
          "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
          "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
          "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
          "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
          "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
          "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
        },
        "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
        "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
        "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
      }
    },
    "shared_proof": {
      "native": {
        "combined-plain": {
          "assertions": 242
        },
        "combined-mtp": {
          "assertions": 256
        },
        "read-failure-serving": {
          "assertions": 522
        }
      },
      "contract_sha256": "dd1bada1296a7e69a034e7c674a92779b7d0f362dcd3dcfdb2cd2308baf8dbd0",
      "artifacts": {
        "combined-plain": {
          "attempt.json": "7b1e711fa6ac8ec6fbc645ca94fe31732fced532878346ac734900fde76aa347",
          "evidence/manifest.json": "453557bf65cc56bc5856c6429ae254334c66755be32aa68a118ba6cd896e24d8",
          "evidence/memory.json": "2ce21c1ee8727c738601e2f0102ee2776339aca07423dfd4c9f9e116dba69400",
          "evidence/memory.samples.jsonl": "72176921e73519090bc7199de8053c4e2d3784e0ee041affd4a9763b46b3f3bb",
          "evidence/stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6",
          "evidence/stdout.txt": "8a0a9c741b2f596ad116e676c5117dd2b371055f8adc6364be409baca291e799",
          "receipt.json": "28a8f56d18448e48349b940149f52003bdc1ded4825c7c0863e81bb15ea02b00"
        },
        "combined-mtp": {
          "attempt.json": "2f71f158d1926a34f7aadb080daecc0505202b310986343f096241b8a31d9a80",
          "evidence/manifest.json": "b65d67d4111131a43a8d8009c2401ea120524030bcd46607d78690a19e5e2f68",
          "evidence/memory.json": "f5cdbd70ab3d9005489a3002fef1a2717a2c9013878eeb52d1a68cbcd4e3c237",
          "evidence/memory.samples.jsonl": "f2743063298d4394cbf22cacd07f562fbfee7760d712be76d3aa8e813a15e257",
          "evidence/stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6",
          "evidence/stdout.txt": "0e553341f8c0644b29f8018bfdc4c53d29dd91858f1f1745c2af5973da6f09b6",
          "receipt.json": "459d6dfd9b3bce20fd9c0f71ad1e14605f276a1667a2b1a1ef916d605571ae4c"
        },
        "read-failure-serving": {
          "attempt.json": "c6c91c72707e6a1b1d883b4036f29ebd01af37c681becf59f366bbdf480c1c1b",
          "evidence/manifest.json": "348eac2b9399dca5d7d321a8056d0da67b3df1d0aa802f786722eba7603575ad",
          "evidence/memory.json": "9221cbdf26d3e69b9276043fb8384066749eb7c5fbf6ac3652e9f722f95ad296",
          "evidence/memory.samples.jsonl": "3fe98e3969483d4863f049448d1f02c7f378367b14fdbb1229b55554e899cee8",
          "evidence/stderr.txt": "e4836406b1037cc8e75db6dd0c37940f44fe387423be5d44e1d0e78a606d2094",
          "evidence/stdout.txt": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
          "receipt.json": "13cf575020da6f2547ea668de284f6fc8aef908987b160e6dfa984d6eef386d1"
        }
      }
    },
    "native_helper_sha256": "e75dce5e5635bdd3cfee834045743b80d65e7f1d73e174cb69d4016945a9523f",
    "native_preparation_sha256": "1b1939f23e1fc8628ab71ff2cd1078a0daa0636d0ab445215cd14ac6c070af8f",
    "core_helper_sha256": "5793aa8bcb3af55fb99c9da698475ee54272ee791ccef30141c94ba6c405b95f",
    "core_preparation_sha256": "3479e62de5ffbe569b3bd0f9c63953a3cfec0bbaea197ba8b6237b1e43b5f974",
    "original_protocol_sha256": {
      "mechanism": "c7dcbf0dc06a700d7fb772fd115493c4919bea3e567ee94049fcbb7f9277c8d7",
      "capacity": "249763ff5d17a05382545b33fc840e01855599229d955bee150ba7a2133e5325"
    },
    "drivers": {
      "vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
      "vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb",
      "vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040"
    },
    "fixture_sha256": {
      "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
      "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-1536.png": "03484e0f55cda3a29eef4bd35e1e2c086a943911c940a26100fbaddce07d7bbb",
      "/Users/carlos/Projects/slotstream/Tools/assets/vision_test/secret1.jpg": "427250bd24a93e98cac3d4ae83619040aa167dde63fa6e7272117bd9a1a17e7d",
      "/Users/carlos/Projects/slotstream/Tools/assets/vision_test/secret2.jpg": "41802c151fbfc248f0af72790fe0eeba00cbbd6632c3ccd5200fef5421d2610f"
    }
  },
  "native_proof": {
    "image-reuse": {
      "assertions": 76,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse",
        "sha256": {
          "attempt.json": "771b5f6417dc0771b979fb606fa981ca9cc27100391aef6471ee8832c96246e8",
          "receipt.json": "b7013145b09f9639d0f08e8e72331f1dee4ae4d5f28b2fbb3cfb38fca1be8073",
          "stdout.txt": "e651d90a731a3f5d3ff48022247f967966c87e84cf80267d507643bff23b940a",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-capacity": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 104,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity",
        "sha256": {
          "attempt.json": "1f59fdb9f8f71471b741ab5da1dea7a620d0d55ad957c58cf2e8832571eecc84",
          "receipt.json": "ac41c79129a25b6d3c924cca0ff5d413c075f44500abf1579cbecf7233873a9a",
          "qualification.json": "1b05fca1bcc0e6e1d5280d76d763cdd86993159d1ef6ca4bce258f6d28c4be31",
          "stdout.txt": "2c901927e46b6cedaf1f41021c7dc3eeabec810b769d84f62ea599127bbad839",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-tile-tower": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 47,
        "exact_tower_comparisons": 7
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower",
        "sha256": {
          "attempt.json": "c6c072174bd22437a9cfff5d6b1cdba560fe76fd7df831c8a2ea39b04c986e2f",
          "receipt.json": "def1a0f16113d865befb4a9ae9e7664ea1de9702a4ec4d6e917bd067a70b4f64",
          "qualification.json": "9881e16798d2d582fabe4b5b1dc4a574b0d7bd6e1a7ce1255f1007b416a989cd",
          "stdout.txt": "3d9d10f6e14592429833ce860fba18f93c0636562e11b7a1a5ef4e474f501219",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "vision-query-maximum-reference": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 6,
        "exact_tower_comparisons": 1
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference",
        "sha256": {
          "attempt.json": "c854592080741f1b89cdd13e8a53f28a367acbc555b31269f10c53803c895564",
          "receipt.json": "7124977d30243802983d5b12fee13d8d57ad8c61114f672bb1e6a13a31dd019d",
          "qualification.json": "e63cea8cf10b1a66bfbd4ee1d43bed303352d2d3931273e47775b83bf4e53096",
          "stdout.txt": "fe745e31aca98b9279ff62bf9dca77c0f5bdff29331bc5119c03f35ec9aab21b",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "integrated-vision-query": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 270,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query",
        "sha256": {
          "attempt.json": "cb51513371bf901354ee7a5c18a915bc9803b43e1f88e32556535d8f781b3a26",
          "receipt.json": "78c48da1dda732f5d587fae8f2431ffed4de0c73ab4968857f4caa16fe21aebf",
          "qualification.json": "c3ae2a413e324bd8ee434171a376bbbf22a5968b18a42cf16ef05310b606353d",
          "stdout.txt": "ba0b480159626402785581bd32d99f3acb9058e8869c6f3f25e5468fda1182c5",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    },
    "integrated-vision-query-mtp": {
      "assessment": {
        "completed": true,
        "passed": true,
        "qualified": true,
        "assertions": 284,
        "exact_tower_comparisons": 0
      },
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resumed-vision-prerequisites-v368/integrated-vision-query-mtp",
        "sha256": {
          "attempt.json": "8e6f53852c5233500f685cae6deb05634412ccc51fc3b38fbf08afc11193b25e",
          "receipt.json": "b8ff7f337bebef3ee60e3cf352f84911ac61e74929f1c01aa97fae3eac21ae9f",
          "qualification.json": "838dd35622c6c678b68e62c0a4da8ac16410a3c5d546303d007e5cc773188398",
          "stdout.txt": "93d96fe6910d93c8aafc70e56209b77348c9042ed9ebf922fa2cfe44275f5ec3",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    }
  },
  "photo_proof": {
    "assessment": {
      "completed": true,
      "passed": true,
      "qualified": true,
      "assertions": 25,
      "observed_query_tile_calls": 3699,
      "classification": "Current full-photo correctness only; no speed or capacity claim."
    },
    "execution": {
      "artifact-sha256.json": "a9f5a3accff494feb8be87726e193dc5a0f3af3182480a6a83e0cf1eb771b1e4",
      "attempt.json": "f7cf21242d28d909a719262ff2ba78aa9e193577631076d9d369f4dff65e4730",
      "memory.json": "b2c444364e5cdd242c05d728f69102e1ee8e48ec7962944487ad7099c00db6db",
      "memory.samples.jsonl": "0eef4f7352739ab5c4fb355659597b0ecada8506bb98b45b449c3f781c254183",
      "qualification.json": "ff110df04526a5b6ab85255a12a9d60cdc8d404b370e3f5db1f5b26fb48973f1",
      "receipt.json": "88f573eaa9e7d88d26814a2b39a7f5829655f154eb600092d39f64345b38bcd2",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "d4bbe6022cf576e58bdebca95699a3ef6057de1d0e6906af2857373d5b9604f5"
    },
    "responses": {
      "manifest.json": "b828e751a57e7cc873f4b1b2acf5e4de658071f59c1e20c5bd0bfbc46abbeda0",
      "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
      "responses/01.json": "ab7208066b2343ff2b96fd55a9ec12bdd2e3fbd7618d79592b6f8ab49b443f93",
      "responses/02.json": "d26fafed4905736921e7502eaafdcaad215d031963ce9e2925e49f0550ee1064",
      "responses/03.json": "2d107ffcb1498a67314a45eb2472d654ca39c011c0503ab0c33de1ab49e82d6f",
      "responses/04.json": "76b0ed9b8237e3eccc4aa241c4a5eb1421314e50cb446dffdb14a5be04ca1a5d",
      "responses/05.json": "6f9b2c9b60f3412d37153bfb6c025c86f60151b0d791fde58918e3a379e3966f",
      "responses/06.json": "859bb1b5c8c5667337ffefcc8f4638b699bcaf524d56a3443daddc495c8d8494",
      "responses/07.json": "3ed447c98fcf3c4c6606de82f7843d8d39d8d1769cb728880a6c64cffd94eade",
      "responses/08.json": "f253d697de09c98cc5fa238ea1f4fd290855877436c61c7f326f776d1aadadba",
      "responses/09.json": "883db051bdf30cec4eea1f3269983c4d66e439ffd84d2ef1de8d89c03c5f0870",
      "responses/10.json": "a54b6f1f40d1d395f680b5953fe2ccac9949a35fe8b4925c398b89e82aff1a42",
      "responses/11.json": "2deae304b73b9f1ed19540ea585876d4f8e88710f7dbf0719a4066f05ab7cc55",
      "responses/12.json": "f42e1c0f6b27b98021af11510f46c8f9f1292e52d52fe6e80a5a139b9f3c4893",
      "responses/13.json": "547cef490afe3bd61ad49877b9a9124be566b2d0e6db7792286b5eff13415cc2",
      "responses/14.json": "d196eda955d948557527e5172ee034671de90057c33a3be6bdd89be2eef1f638",
      "responses/15.json": "5140ab4324a64598672cbd42e9e341e489be03d544b6bf97666fe4f18afdb792",
      "responses/16.json": "385925c5dbdb012f72d65820da7b22430251e6ea33965ed092968631bb69d1e1",
      "responses/17.json": "16a806b64065ddf71055003297dd475d392a02b872618229ea881333628eb9c0",
      "responses/18.json": "3062ed5963fa6040a90e301c9d36138fc81e8cc377794ac6360da6ffb8e6a4e5",
      "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
      "server.stderr": "d87c78adff25b41b0c08409155b0d7c4368de79096765553ef548bd9e0925212",
      "server.stdout": "78206fe9a84122ee0c950cc409e57d7a496db3d49e4bf37102d50a8ac809dfb9",
      "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "stdout.txt": "c0e0d887ea60228205da65de366ff981976ff1759c75103f3d5c1c448dad0ee0",
      "vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
      "vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
    }
  },
  "original_limits": {
    "seconds": 5400,
    "cleanup_seconds": 60,
    "startup_gb": 18,
    "owned_bytes": 14000000000
  },
  "original_work_seconds": 5400,
  "additional_wait_seconds": 7200,
  "whole_work_seconds": 12600,
  "cleanup_seconds": 60,
  "settle_policy": {
    "stable_seconds": 60,
    "maximum_wait_seconds": 300,
    "poll_seconds": 2
  },
  "classification": "New full24-cell mechanism cohort after preserved V385 thermal stop and V395 pre-model headroom stop. Colima is stopped and subsequent native preflights observe sufficient headroom; live original admission remains mandatory. Original startup-swap-in pair exclusion and all workload/physical/exact-work/request acceptance remain. Each model launch additionally requires60 sampled nominal seconds, at most300 extra seconds after the original60-second cooldown. Full added waiting allowance is reserved; no old rows, replacements or threshold relaxation.",
  "model_executed": false
}

````````````

## Artifact SHA-256 1830fa7005111405c7557d98afefb2c31d601b794cd999d9ad802b2edf01647a

Encoding: `utf-8`. Original bytes: 10560.

````````````text
"""Complete prospective vision mechanism cohort with sampled thermal settling."""
import argparse,copy,fcntl,importlib.util,json,sys,threading
from pathlib import Path
HERE=Path(__file__).resolve().parent;BASE=HERE.parent
PREVIOUS=BASE/'vision-mechanism-fixed-cohort-v385/run.py'
THERMAL=BASE/'thermal-settle-preparation-v388'
DRIVER=HERE/'driver/serve_bench.py';NAME='mechanism'
SETTLE={'stable_seconds':60,'maximum_wait_seconds':300,'poll_seconds':2}
ORIGINAL_SECONDS=5400;ADDED_WAIT_SECONDS=24*SETTLE['maximum_wait_seconds'];WORK_SECONDS=ORIGINAL_SECONDS+ADDED_WAIT_SECONDS;CLEANUP_SECONDS=60

def module(name,path):
 spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
previous=module('vision_v385_preserved',PREVIOUS)
execution=module('vision_v413_assessor',previous.ORIGINAL)
c,core,digest,require=execution.c,execution.core,execution.digest,execution.require
OUT=execution.ROOT/'.build/optimization/vision-headroom-resume-v413'

def dependencies():
 transform=c.read(HERE/'driver-transformation.json');source=Path(transform['input'])
 require(digest(source)==transform['input_sha256'] and digest(DRIVER)==transform['driver_sha256'],'combined driver differs')
 restored=DRIVER.read_text()
 for edit in reversed(transform['edits']):
  require(restored.count(edit['new'])==1,'thermal edit differs');restored=restored.replace(edit['new'],edit['old'])
 require(restored.encode()==source.read_bytes(),'thermal edits do not reconstruct prior startup-policy driver')
 for name,sha in transform['helpers'].items():
  require(digest(Path(name))==sha and (HERE/'driver'/Path(name).name).read_bytes()==Path(name).read_bytes(),'driver helper changed')
 files=[Path(__file__),BASE/'thermally-settled-vision-v395/preparation.json',BASE/'thermally-settled-vision-v395/mechanism/protocol.json',PREVIOUS,previous.HERE/'preparation.json',previous.HERE/NAME/'protocol.json',previous.HERE/NAME/'binding.json',HERE/'build_driver.py',HERE/'driver-transformation.json',DRIVER,THERMAL/'driver-transformation.json',THERMAL/'checks.py',THERMAL/'checks.stderr',execution.ROOT/'Tools/thermal_readiness.py',execution.ROOT/'Tools/optimization_readiness.py']
 files += [Path(n) for n in transform['helpers']]+[HERE/'driver'/Path(n).name for n in transform['helpers']]
 return {str(p.resolve()):digest(p) for p in files}

def preserved():
 p=previous.HERE/NAME/'execution';raw=previous.OUT/NAME;receipt=c.read(p/'qualification.json');completion=c.read(raw/'completion.json')
 require(receipt.get('qualified') is False and receipt.get('cleanup_complete') is True and receipt.get('remaining_jobs')==[] and completion.get('stopped_early') is True and completion.get('recorded_cells')==5 and completion.get('planned_cells')==24,'prior thermal-stopped cohort must be exact and drained')
 protocol=c.read(previous.HERE/NAME/'protocol.json');rows=[json.loads(x) for x in (raw/'results.jsonl').read_text().splitlines()]
 warmups={(r['round'],r['arm']):c.read(raw/f"{r['round']}-{r['arm']}"/'warmup.json') for r in rows}
 c.soak.validate_paired_execution('vision-v385-preserved',protocol,rows,warmups)
 for r in rows:
  for data in [r['metrics'],warmups[(r['round'],r['arm'])]['metrics']]:c.bench.validate_work_observation(protocol['work_constraints'],r['arm'],data['stats'])
 require('thermal/power' in rows[-1].get('exclusion',''),'prior stop was not the identified thermal failure')
 latest=BASE/'thermally-settled-vision-v395';latest_raw=execution.ROOT/'.build/optimization/thermally-settled-vision-v395/mechanism'
 latest_receipt=c.read(latest/NAME/'execution/qualification.json')
 latest_rows=[json.loads(x) for x in (latest_raw/'results.jsonl').read_text().splitlines()]
 require(latest_receipt.get('qualified') is False and latest_receipt.get('cleanup_complete') is True and latest_receipt.get('remaining_jobs')==[] and len(latest_rows)==1 and 'original startup memory requirement no longer fits' in latest_rows[0].get('error','') and latest_rows[0].get('server_pid') is None and 'metrics' not in latest_rows[0] and 'first_request' not in latest_rows[0], 'V395 pre-model headroom stop differs')
 return {'raw':c.artifact_hashes(raw),'execution':c.artifact_hashes(p),'all_observed_first_measured_work_and_output_exact':True,'no_rows_reused':True,'latest_headroom_stop':{'raw':c.artifact_hashes(latest_raw),'execution':c.artifact_hashes(latest/NAME/'execution'),'completed_requests':0,'model_launched':False}}

def materialize(name,value):
 require(name==NAME,'only original mechanism study');old=previous.materialize(name,value);new=copy.deepcopy(old)
 new.update(label='vision-headroom-resume-v413',classification='New full24-cell mechanism cohort after preserved V385 thermal stop and V395 pre-model headroom stop. Colima is stopped and subsequent native preflights observe sufficient headroom; live original admission remains mandatory. Original startup-swap-in pair exclusion and all workload/physical/exact-work/request acceptance remain. Each model launch additionally requires60 sampled nominal seconds, at most300 extra seconds after the original60-second cooldown. Full added waiting allowance is reserved; no old rows, replacements or threshold relaxation.',current_prerequisite_binding=str(HERE/NAME/'binding.json'))
 new['before_cell_thermal_settle']=SETTLE
 restored=copy.deepcopy(new);restored.pop('before_cell_thermal_settle')
 for k in ['label','classification','current_prerequisite_binding']:restored[k]=old[k]
 require(restored==old,'original workload or acceptance changed')
 return new

def prepare():
 require(not (HERE/'preparation.json').exists() and not OUT.exists(),'already prepared/attempted')
 value=previous.load();p=materialize(NAME,value)
 record={'prepared_at':core.now(),'dependencies':dependencies(),'preserved':preserved(),'identity':value['identity'],'native_proof':previous.original.native_proofs(),'photo_proof':previous.original.quality_proof(),'original_limits':previous.original.LIMITS[NAME],'original_work_seconds':ORIGINAL_SECONDS,'additional_wait_seconds':ADDED_WAIT_SECONDS,'whole_work_seconds':WORK_SECONDS,'cleanup_seconds':CLEANUP_SECONDS,'settle_policy':SETTLE,'classification':p['classification'],'model_executed':False}
 c.write_new(HERE/'preparation.json',record);return {'prepared':True,'fixed_cells':24,'whole_work_seconds':WORK_SECONDS,'model_executed':False}

def load():
 r=c.read(HERE/'preparation.json');value=previous.load()
 require(r['dependencies']==dependencies() and r['preserved']==preserved() and r['identity']==value['identity'] and r['native_proof']==previous.original.native_proofs() and r['photo_proof']==previous.original.quality_proof(),'new binding or preserved evidence changed')
 require(r['original_limits']==previous.original.LIMITS[NAME] and r['original_work_seconds']==5400 and r['additional_wait_seconds']==7200 and r['whole_work_seconds']==WORK_SECONDS and r['cleanup_seconds']==60 and r['settle_policy']==SETTLE,'original/new explicit allowance differs')
 return value
execution.HERE,execution.OUT=HERE,OUT
execution.load=load;execution.materialize=materialize
execution.native_proofs=previous.original.native_proofs;execution.quality_proof=previous.original.quality_proof

def assess():
 result=execution.assess_serving(NAME);raw=OUT/NAME;manifest=c.read(raw/'manifest.json')
 require(manifest['harness_sources']['serve_bench.py']==digest(DRIVER) and manifest['harness_sources']['prefill_bench.py']==digest(HERE/'driver/prefill_bench.py'),'executed driver/helper differs')
 for line in (raw/'results.jsonl').read_text().splitlines():
  observed=json.loads(line).get('thermal_settle',{})
  require(all(observed.get(k) is True for k in ['enabled','reserved','before_launch_only','request_acceptance_unchanged']) and 0<=observed.get('seconds',-1)<=300 and observed.get('sampled_nominal_seconds',0)>=60 and observed.get('samples',0)>=31,'completed cell lacks prospective thermal precondition')
 return result

def run(deadline):
 core.allowance(deadline,WORK_SECONDS+CLEANUP_SECONDS);value,protocol=execution.load_serving(NAME)
 target,output=HERE/NAME/'execution',OUT/NAME;require(not target.exists() and not output.exists(),'attempted cohort cannot retry')
 limit,before,thermal=core.readiness(deadline,WORK_SECONDS+CLEANUP_SECONDS,18)
 policy=dict(c.NATIVE_POLICY,startup_reclaimable_bytes=18_000_000_000,maximum_owned_rss_bytes=14_000_000_000,maximum_build_seconds=WORK_SECONDS,stop_on_new_swapouts=True)
 command=[sys.executable,str(DRIVER),'--protocol',str(HERE/NAME/'protocol.json'),'--out',str(output)]
 attempt={'started_at':core.now(),'deadline_utc':deadline,'command':command,'environment':{},'build':value['identity']['build'],'native_proof':previous.original.native_proofs(),'before':before,'thermal_prelaunch':thermal,'policy':policy,'protocol_sha256':digest(HERE/NAME/'protocol.json'),'driver_sha256':digest(DRIVER),'preparation_sha256':digest(HERE/'preparation.json'),'classification':protocol['classification']}
 stop=threading.Event()
 def progress():
  seen=0
  while not stop.wait(10):
   try:
    rows=[json.loads(x) for x in (output/'results.jsonl').read_text().splitlines()]
    if len(rows)>seen:
     seen=len(rows);print(json.dumps({'study':'vision','completed_cells':seen,'fixed_total_cells':24,'eligible_cells':sum(r.get('valid') is True for r in rows)}),flush=True)
   except (OSError,json.JSONDecodeError):pass
 observer=threading.Thread(target=progress,daemon=True);observer.start()
 def assessment(code):require(code in (0,1),'driver failed');return assess()
 try:result=execution.finalize(target,core.execute(command,target,WORK_SECONDS,policy,assessment,limit,attempt))
 finally:stop.set();observer.join(timeout=1)
 if output.exists():c.write_new(target/'artifact-sha256.json',c.artifact_hashes(output))
 return result

def main():
 parser=argparse.ArgumentParser();parser.add_argument('action',choices=['prepare','status','freeze','run']);parser.add_argument('--deadline');args=parser.parse_args()
 with (HERE/'.run.lock').open('a') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
  if args.action=='prepare':result=prepare()
  elif args.action=='freeze':result=execution.freeze_serving(NAME)
  elif args.action=='status':load();result={'frozen':(HERE/NAME/'protocol.json').exists(),'attempted':(OUT/NAME).exists()}
  else:require(args.deadline is not None,'whole interval required');result=run(args.deadline)
 print(json.dumps(result,indent=2),flush=True);return 1 if args.action=='run' and result.get('qualified') is not True else 0
if __name__=='__main__':raise SystemExit(main())

````````````
