---
type: run
id: 01m21cajkq3hmsctctv3ndrkx4
created: 2026-09-08T20:46:02.870999+00:00
updated: 2026-09-08T20:46:03.790607+00:00
summary: Model-free final candidate binding for original resource and real-client gates
binary: No model or compiler launched; future build is explicitly bound to its native-qualified campaign
captured_at: 2026-09-08
command: python3 final-resource-client-preparation-v387/checks.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Model-free final candidate binding for original resource and real-client gates
tool: Slotstream exact native and source qualification capture
---
V387 prepares the missing reusable binding of the original four resource families and actual Hermes/Ollama client extensions to a selected candidate. Preparation requires the candidate campaign's exact source/build and all three original recomputed native proofs; execution revalidates that closure. Original resource commands, seven assertions, workloads, capacities, time allowances, acceptance expressions and client behavior remain byte-identical after reversing only declared candidate, output and prerequisite bindings. The original unrun V323/V307 preparations remain unchanged. All seven model-free tests pass, including changed binary/native-source and changed generated-worker refusal before model launch. The actual client worker startup reaches one intercepted model-launch call using its bound binary; no model launches or client measurements occur. The first test run's sole failure was a synthetic fixture comparing /var and /private/var path spellings. Its exact code and failure remain preserved; resolving that fixture path fixes the test without changing the preparer or original workloads. The real final resource/client packet is not materialized or executed yet: optional feature dispositions, final exact-composition native qualification and current admission still precede real runs. No final resource or client pass, performance claim, default change, installation or activation follows from these preparation tests.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/extensions/run.py",
    "bytes": 6234,
    "sha256": "fcf211288d9548cf3306ff74f7cecf4dfb6c13f7f7d1e1ac6e55966c6af4096b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/extensions/worker.py",
    "bytes": 6193,
    "sha256": "a2b4bf51c978220539b7b1b0d462a576992e300b6b56654c4dd5954f8f869574"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-resource-client-preparation-v387/checks.py",
    "bytes": 8648,
    "sha256": "91677812469851873147389211cfa63833e2ec23bceebd5ccf535077dd8ad5d3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-resource-client-preparation-v387/checks.stderr",
    "bytes": 781,
    "sha256": "881d6d88a53678e73c8d94b9a1d447fdbd29654a8099ce178721247ac7cc36f5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-resource-client-preparation-v387/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-resource-client-preparation-v387/initial-checks.py",
    "bytes": 8618,
    "sha256": "d79daec02d55530c0e3fc06db821c963221887a1050e66a1e922402af8c01edb"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-resource-client-preparation-v387/initial-checks.stderr",
    "bytes": 1539,
    "sha256": "765de1b86d44f78e7b02e50c1ae262843a48c7b26722b06fb977883996cfe31a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-resource-client-preparation-v387/initial-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-resource-client-preparation-v387/prepare.py",
    "bytes": 10007,
    "sha256": "c2d921f68797cf4e9c1a7f731e3bdc729b19c8a4b64aaac3b341887ab19cf923"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/resource-verification-subset-v323/preparation.json",
    "bytes": 1635,
    "sha256": "d5f713c7a79b8a9b2a8ef213f5fefd0233a2eb32f5a019218e1b90fa6fdaa83d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/resource-verification-subset-v323/run.py",
    "bytes": 8434,
    "sha256": "c3f560cd887f177cabf13baf9b3016ee197b7196826cd86731c36eb32a383f5b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/resource-verification-subset-v323/verify-resource-subset.sh",
    "bytes": 6586,
    "sha256": "23105b7e908dda2783986a1f38b1347131ec500674c876cad8b6606b21d51a89"
  }
]
```

## Artifact SHA-256 fcf211288d9548cf3306ff74f7cecf4dfb6c13f7f7d1e1ac6e55966c6af4096b

Encoding: `utf-8`. Original bytes: 6234.

````````````text
from pathlib import Path
import datetime,json,os,re,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
import optimization_campaign as campaign
B=ROOT/'.build/optimization/joined-state-eval-build-v304/candidate/slotstream'
OUT=ROOT/'.build/optimization/current-candidate-gates-v307/extensions'
# The reservation must be granted by the peer before invocation; the argument
# binds a concrete handback deadline and never authorizes extending it.
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(DEADLINE-time.time()-30)
if remaining<1800:raise RuntimeError('Hermes extensions require at least thirty reserved minutes')
POLICY={'startup_reclaimable_bytes':17_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':13_000_000_000,'sample_interval_seconds':.2,
 'maximum_build_seconds':min(3600,remaining),'stop_on_new_swapouts':False}
NATIVE_PACKET=ROOT/'.build/optimization/joined-state-eval-campaign-v305'
native=campaign.status(NATIVE_PACKET)['stages'][:3]
assert [r['stage'] for r in native]==['native/'+n for n in campaign.NATIVE] and all(r['status']=='passed' for r in native)
DEPENDENCIES=json.loads((P.parent/'clients/dependencies.json').read_text())
assert all(digest(Path(n))==h for n,h in DEPENDENCIES['files'].items())
S={'model':'/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit','image_sha256':digest(ROOT/'Tools/assets/vision_test/secret1.jpg'),'dependency_closure':DEPENDENCIES,'classification':'Actual pinned Hermes CLI, local-model compression, image discovery/tool/follow-up and actual Ollama image request on the same V304 candidate at the existing65536 window; no hosted provider or real credential, compiler, higher-context capacity claim or activation.',
 'frozen_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'deadline_utc':sys.argv[1],
 'build':verified_build(B),'native_prerequisites':native,'native_contract_sha256':digest(NATIVE_PACKET/'qualification-contract.json'),'wrapper_sha256':digest(Path(__file__)),'policy':POLICY,
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B),'SLOTSTREAM_VERIFY_OUT':str(OUT/'verification')},
 'command':['python3',str(P/'worker.py')],
 'worker_sha256':digest(P/'worker.py'),
 'source_verification_sha256':digest(ROOT/'Tools/verify.sh'),
 'historical_counterexample':str(ROOT/'.build/optimization/full-verification-v283/manifest.json'),
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.sh','.py','.mjs','.json','.swift','.txt'] and '__pycache__' not in f.parts},
 'limits':'No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit.'}
with (P/'protocol.json').open('x') as f:f.write(json.dumps(S,indent=2)+'\n')
OUT.mkdir(exist_ok=False);started=time.monotonic();r={'passed':False,'protocol_sha256':digest(P/'protocol.json')}
def interrupted(number,_frame):raise KeyboardInterrupt(f'full qualification interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
with (OUT/'pressure.samples.jsonl').open('x') as observations:
 def snapshot():
  state=vm_snapshot();pressure=pressure_snapshot();observations.write(json.dumps({'seconds':time.monotonic()-started,'vm':state,'pressure':pressure})+'\n');observations.flush();require_normal(pressure);return state
 try:
  r['before']=preflight(17);snapshot();assert not competing_jobs()
  assert (ROOT/'.venv31/bin/python').exists()
  for k in saved:os.environ.pop(k,None)
  os.environ.update(S['environment'])
  with (OUT/'stdout.txt').open('w') as stdout,(OUT/'stderr.txt').open('w') as stderr:
   result=guarded_run(S['command'],cwd=ROOT,stdout=stdout,stderr=stderr,record_path=OUT/'memory.json',snapshot=snapshot,policy=POLICY,classification=S['classification'])
  r['exit_code']=result.returncode
  report=json.loads((OUT/'clients/manifest.json').read_text())
  r['client_report']=report
  expected={'text':['hermes-cli','hermes-compression'],'vision':['hermes-image','ollama-image']}
  r['passed']=result.returncode==0 and report.get('passed') is True and [x['mode'] for x in report['cases']]==list(expected) and all(row['passed'] is True and row['context']==65536 and [c['name'] for c in row['clients']]==expected[row['mode']] and all(c['passed'] is True for c in row['clients']) for row in report['cases'])
 except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
 finally:
  for k in list(os.environ):
   if k.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(k,None)
  os.environ.update(saved)
  r['elapsed_seconds']=time.monotonic()-started
  # Primary result is durable before independent restoration checks.
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
  for n,f in {'after':vm_snapshot,'pressure':pressure_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
   'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()) and digest(P/'worker.py')==S['worker_sha256'] and all(digest(Path(n))==h for n,h in DEPENDENCIES['files'].items()),
   'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
   try:r[n]=f()
   except BaseException as e:r.setdefault('cleanup_errors',{})[n]=f'{type(e).__name__}: {e}'
  r['within_reservation']=time.time()<=DEADLINE
  r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and r.get('candidate_unchanged') and r.get('drivers_unchanged')
   and not r.get('remaining_jobs') and r.get('model_lock_free') and r.get('pressure',{}).get('level')==1 and r['within_reservation'])
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)

````````````

## Artifact SHA-256 a2b4bf51c978220539b7b1b0d462a576992e300b6b56654c4dd5954f8f869574

Encoding: `utf-8`. Original bytes: 6193.

````````````text
from pathlib import Path
import json
import os
import socket
import subprocess
import sys
import time

ROOT = Path('/Users/carlos/Projects/slotstream')
P = Path(__file__).parent
sys.path.insert(0, str(ROOT / 'Tools'))
from prefill_bench import digest, preflight, run_child, terminate_child_tree, vm_snapshot
from serve_bench import wait_ready

S = json.loads((P / 'protocol.json').read_text())
BINARY = Path(S['build']['binary'])
BASE = ROOT / '.build/optimization/current-candidate-gates-v307/extensions/clients'
BASE.mkdir(exist_ok=False)
HERMES = '/tmp/slotstream-context-implementation-20260906/hermes-clean-29112bef'
PYTHON = '/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release/.venv/bin/python'
IMAGE = ROOT / 'Tools/assets/vision_test/secret1.jpg'
ENV = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))
    and k not in ('OPENAI_API_KEY', 'ANTHROPIC_API_KEY', 'AI_GATEWAY_API_KEY',
                 'VERCEL_OIDC_TOKEN', 'PYTHONPATH', 'PYTHONHOME')}
ENV.update(NO_PROXY='*', OLLAMA_NOHISTORY='1')
r = {'passed': False, 'classification': 'Actual pinned Hermes CLI, forced local-model compression, image discovery/tool/follow-up and actual Ollama image request at the existing65536 window. Correctness only; no throughput or maximum-context capacity claim.', 'cases': []}
started = time.monotonic()


def save():
    r['elapsed_seconds'] = time.monotonic() - started
    (BASE / 'manifest.json').write_text(json.dumps(r, indent=2) + '\n')


def client(row, name, command, limit, environment=None):
    cell = BASE / row['mode'] / name
    cell.mkdir()
    remaining = int(1800 - (time.monotonic() - started))
    if remaining < 60:
        raise RuntimeError('batch deadline before ' + name)
    detail = {'name': name, 'command': command, 'passed': False}
    row['clients'].append(detail)
    print(json.dumps({'phase': name, 'mode': row['mode']}), flush=True)
    try:
        detail['exit_code'] = run_child(command, {**ENV, **(environment or {})}, cell, min(limit, remaining))
        assert detail['exit_code'] == 0, name + ' exited nonzero'
        if name == 'ollama-image':
            assert (cell / 'stdout.txt').read_text().strip().lower().rstrip('.') == 'dog'
        else:
            result = json.loads((cell / 'report/result.json').read_text())
            assert result['passed'] is True and result['expected_context'] == 65536
            assert not result['blocked_nonlocal_connections']
            if name == 'hermes-cli':
                assert any(answer.strip() == 'OK' for answer in result['cli_answers'])
                assert not result['executions']
            else:
                assert result['context_length'] == 65536 and len(result['executions']) == 1
            if name == 'hermes-image':
                assert result['vision_discovered'] is True
                assert result['image_turn']['completed'] and 'dog' in result['image_turn']['final_response'].lower()
            if name == 'hermes-compression':
                compression = result['compression']
                assert compression['http_requests'] > 0
                assert compression['after_chars'] < compression['before_chars']
                assert compression['finish_reasons'] and set(compression['finish_reasons']) == {'stop'}
                assert result['after_compression']['completed']
                assert 'HERMES_SLOTSTREAM_INTEGRATION_42' in result['after_compression']['final_response']
        detail['passed'] = True
    finally:
        for n in ['stdout.txt', 'stderr.txt']:
            if (cell / n).exists(): detail[n + '_sha256'] = digest(cell / n)
        save()


try:
    assert digest(IMAGE) == S['image_sha256']
    for mode, port, memory in [('text', 11644, 10), ('vision', 11645, 11)]:
        if time.monotonic() - started >= 1200:
            raise RuntimeError('insufficient batch time before next server')
        with socket.socket() as available:
            available.bind(('127.0.0.1', port))
        cell = BASE / mode
        cell.mkdir()
        row = {'mode': mode, 'memory_target_gb': memory, 'context': 65536,
               'before': preflight(13 if mode == 'text' else 17), 'clients': [], 'passed': False}
        r['cases'].append(row)
        command = [str(BINARY), 'serve', '--model', S['model'], '--port', str(port),
            '--memory-gb', str(memory), '--mtp', 'off', '--vision', 'on' if mode == 'vision' else 'off',
            '--max-context', '65536', '--max-prefill-wait', '0', '--no-elastic']
        row['command'] = command
        with (cell / 'server.stdout.txt').open('w') as out, (cell / 'server.stderr.txt').open('w') as err:
            server = subprocess.Popen(command, cwd=ROOT, env=ENV, stdout=out, stderr=err, start_new_session=True)
            try:
                wait_ready(server, port)
                names = [('hermes-cli', '--cli', 300), ('hermes-compression', '--compress', 650)] if mode == 'text' else [('hermes-image', '--image', 500)]
                for name, option, limit in names:
                    command = [PYTHON, str(ROOT / 'Tools/hermes_integration_gate.py'), HERMES,
                        str(cell / name / 'report'), '--port', str(port), '--context', '65536', option]
                    if option == '--image': command.append(str(IMAGE))
                    client(row, name, command, limit)
                if mode == 'vision':
                    client(row, 'ollama-image', ['/opt/homebrew/bin/ollama', 'run',
                        'qwen3.8-flash-next:4bit', 'Name the animal in this image in one word. ' + str(IMAGE)],
                        200, {'OLLAMA_HOST': f'http://127.0.0.1:{port}'})
                row['passed'] = True
            finally:
                if server.poll() is None: terminate_child_tree(server)
                row['server_exit_code'] = server.returncode
                row['after'] = vm_snapshot()
                save()
    r['passed'] = True
except BaseException as e:
    r['error'] = f'{type(e).__name__}: {e}'
finally:
    save()
print(json.dumps({'passed': r['passed'], 'error': r.get('error'), 'elapsed_seconds': r['elapsed_seconds']}), flush=True)
raise SystemExit(0 if r['passed'] else 1)

````````````

## Artifact SHA-256 91677812469851873147389211cfa63833e2ec23bceebd5ccf535077dd8ad5d3

Encoding: `utf-8`. Original bytes: 8648.

````````````text
import contextlib
import importlib.util
import io
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import types
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('preparation', HERE / 'prepare.py')
p = importlib.util.module_from_spec(spec)
spec.loader.exec_module(p)
sys.path.insert(0, str(p.ROOT / 'Tools'))
import prefill_bench


class PreparationChecks(unittest.TestCase):
    def proof(self, root):
        root = root.resolve()
        adapter = root / 'adapter.py'
        adapter.write_text('# Synthetic native-proof fixture. No model.\n')
        packet = root / 'packet'
        packet.mkdir()
        (packet / 'qualification-contract.json').write_text('{"synthetic":true}\n')
        build = {'binary': str(root / 'candidate/slotstream'), 'identity': {'synthetic': True}}
        (packet / 'packet.json').write_text(json.dumps({'build': build}))
        return {'adapter': str(adapter), 'adapter_sha256': p.digest(adapter), 'packet': str(packet),
                'build': build, 'contract_sha256': p.digest(packet / 'qualification-contract.json'),
                'native_proof': {'ordinary': 'synthetic', 'mtp': 'synthetic', 'recovery': 'synthetic'}}

    def prepared(self, root):
        proof = self.proof(root)
        source, raw = root / 'prepared', root / 'raw'
        with patch.object(p, 'inspect_campaign', return_value=proof):
            result = p.prepare(proof['adapter'], source, raw)
        return proof, source, raw, result

    def test_original_resource_sections_and_all_other_source_bytes_preserved(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            proof, source, raw, result = self.prepared(root)
            self.assertFalse(raw.exists())
            self.assertFalse(result['model_launched'])
            self.assertEqual((source / 'resource/verify-resource-subset.sh').read_bytes(),
                             (p.RESOURCE / 'verify-resource-subset.sh').read_bytes())
            subprocess.run(['bash', '-n', str(source / 'resource/verify-resource-subset.sh')], check=True)
            for name, data in result['transformations'].items():
                current = (source / name).read_text()
                for edit in reversed(data['changes']):
                    self.assertEqual(current.count(edit['new']), 1)
                    current = current.replace(edit['new'], edit['old'])
                self.assertEqual(current.encode(), Path(data['source']).read_bytes())
            self.assertEqual(result['original_resource_assertions'], 7)
            self.assertEqual(result['original_client_cases'],
                             ['hermes-cli', 'hermes-compression', 'hermes-image', 'ollama-image'])

    def test_unqualified_native_proof_creates_no_output(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with patch.object(p, 'inspect_campaign', side_effect=ValueError('native failed')):
                with self.assertRaisesRegex(ValueError, 'native failed'):
                    p.prepare(root / 'adapter.py', root / 'prepared', root / 'raw')
            self.assertFalse((root / 'prepared').exists())
            self.assertFalse((root / 'raw').exists())

    def test_current_adapter_must_revalidate_all_three_native_stages(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            proof = self.proof(root)
            fake = types.SimpleNamespace(
                load=lambda: None,
                status=lambda: {'stages': [{'stage': 'native/' + n, 'status': 'passed'}
                                           for n in ('ordinary', 'mtp', 'recovery')]},
                native_proof=lambda: proof['native_proof'],
                controls=types.SimpleNamespace(BINARY=proof['build']['binary']),
                c=types.SimpleNamespace(NATIVE={'ordinary': 1, 'mtp': 2, 'recovery': 3},
                    bench=types.SimpleNamespace(verified_build=lambda _: proof['build'])),
                PACKET=Path(proof['packet']))
            with patch.object(p, 'module', return_value=fake):
                self.assertEqual(p.inspect_campaign(proof['adapter']), proof)
                fake.status = lambda: {'stages': [{'stage': 'native/' + n, 'status': 'unrun' if n == 'mtp' else 'passed'}
                                                 for n in ('ordinary', 'mtp', 'recovery')]}
                with self.assertRaisesRegex(ValueError, 'all three'):
                    p.inspect_campaign(proof['adapter'])

    def test_changed_build_and_native_source_are_refused(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            proof = self.proof(root)
            fake = types.SimpleNamespace(
                load=lambda: None, status=lambda: {'stages': [{'stage': 'native/' + n, 'status': 'passed'} for n in ('a','b','c')]},
                native_proof=lambda: proof['native_proof'],
                controls=types.SimpleNamespace(BINARY=proof['build']['binary']),
                c=types.SimpleNamespace(NATIVE={'a': 1, 'b': 2, 'c': 3},
                    bench=types.SimpleNamespace(verified_build=lambda _: {'binary': 'different'})),
                PACKET=Path(proof['packet']))
            with patch.object(p, 'module', return_value=fake):
                with self.assertRaisesRegex(ValueError, 'binary differ'):
                    p.inspect_campaign(proof['adapter'])
                fake.load = lambda: (_ for _ in ()).throw(ValueError('changed native source'))
                with self.assertRaisesRegex(ValueError, 'changed native source'):
                    p.inspect_campaign(proof['adapter'])

    def test_existing_attempt_and_overlapping_directories_are_refused(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / 'raw').mkdir()
            with self.assertRaisesRegex(ValueError, 'attempted'):
                p.prepare('unused', root / 'prepared', root / 'raw')
            with self.assertRaisesRegex(ValueError, 'separate'):
                p.prepare('unused', root / 'new', root / 'new/raw')

    def test_changed_generated_worker_refused_before_native_import_or_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            proof, source, raw, result = self.prepared(Path(directory))
            worker = source / 'client/worker.py'
            worker.write_text(worker.read_text() + '\n# changed after binding\n')
            namespace = {'__file__': str(source / 'client/binding.py')}
            exec(compile(p.BINDING, namespace['__file__'], 'exec'), namespace)
            with patch.object(subprocess, 'Popen') as launches:
                with self.assertRaisesRegex(ValueError, 'bound gate source changed'):
                    namespace['bind_native']()
                launches.assert_not_called()

    def test_actual_client_worker_startup_uses_bound_binary_without_model_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            proof, source, raw, result = self.prepared(Path(directory))
            (raw / 'client').mkdir(parents=True)
            protocol = {'build': proof['build'], 'model': 'synthetic-test-model-never-opened',
                        'image_sha256': p.digest(p.ROOT / 'Tools/assets/vision_test/secret1.jpg')}
            (source / 'client/protocol.json').write_text(json.dumps(protocol))
            worker = source / 'client/worker.py'
            namespace = {'__file__': str(worker), '__name__': '__main__'}
            with patch.object(prefill_bench, 'preflight', return_value={'synthetic': True}), \
                 patch('socket.socket'), \
                 patch.object(subprocess, 'Popen', side_effect=RuntimeError('INTERCEPTED_MODEL_LAUNCH')) as launches, \
                 contextlib.redirect_stdout(io.StringIO()):
                with self.assertRaises(SystemExit) as stopped:
                    exec(compile(worker.read_text(), str(worker), 'exec'), namespace)
                self.assertEqual(stopped.exception.code, 1)
            launches.assert_called_once()
            self.assertEqual(launches.call_args.args[0][0], proof['build']['binary'])
            report = p.read(raw / 'client/clients/manifest.json')
            self.assertFalse(report['passed'])
            self.assertIn('INTERCEPTED_MODEL_LAUNCH', report['error'])
            self.assertEqual(report['cases'][0]['clients'], [])


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 881d6d88a53678e73c8d94b9a1d447fdbd29654a8099ce178721247ac7cc36f5

Encoding: `utf-8`. Original bytes: 781.

````````````text
test_actual_client_worker_startup_uses_bound_binary_without_model_launch (__main__.PreparationChecks) ... ok
test_changed_build_and_native_source_are_refused (__main__.PreparationChecks) ... ok
test_changed_generated_worker_refused_before_native_import_or_launch (__main__.PreparationChecks) ... ok
test_current_adapter_must_revalidate_all_three_native_stages (__main__.PreparationChecks) ... ok
test_existing_attempt_and_overlapping_directories_are_refused (__main__.PreparationChecks) ... ok
test_original_resource_sections_and_all_other_source_bytes_preserved (__main__.PreparationChecks) ... ok
test_unqualified_native_proof_creates_no_output (__main__.PreparationChecks) ... ok

----------------------------------------------------------------------
Ran 7 tests in 0.040s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 d79daec02d55530c0e3fc06db821c963221887a1050e66a1e922402af8c01edb

Encoding: `utf-8`. Original bytes: 8618.

````````````text
import contextlib
import importlib.util
import io
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import types
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('preparation', HERE / 'prepare.py')
p = importlib.util.module_from_spec(spec)
spec.loader.exec_module(p)
sys.path.insert(0, str(p.ROOT / 'Tools'))
import prefill_bench


class PreparationChecks(unittest.TestCase):
    def proof(self, root):
        adapter = root / 'adapter.py'
        adapter.write_text('# Synthetic native-proof fixture. No model.\n')
        packet = root / 'packet'
        packet.mkdir()
        (packet / 'qualification-contract.json').write_text('{"synthetic":true}\n')
        build = {'binary': str(root / 'candidate/slotstream'), 'identity': {'synthetic': True}}
        (packet / 'packet.json').write_text(json.dumps({'build': build}))
        return {'adapter': str(adapter), 'adapter_sha256': p.digest(adapter), 'packet': str(packet),
                'build': build, 'contract_sha256': p.digest(packet / 'qualification-contract.json'),
                'native_proof': {'ordinary': 'synthetic', 'mtp': 'synthetic', 'recovery': 'synthetic'}}

    def prepared(self, root):
        proof = self.proof(root)
        source, raw = root / 'prepared', root / 'raw'
        with patch.object(p, 'inspect_campaign', return_value=proof):
            result = p.prepare(proof['adapter'], source, raw)
        return proof, source, raw, result

    def test_original_resource_sections_and_all_other_source_bytes_preserved(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            proof, source, raw, result = self.prepared(root)
            self.assertFalse(raw.exists())
            self.assertFalse(result['model_launched'])
            self.assertEqual((source / 'resource/verify-resource-subset.sh').read_bytes(),
                             (p.RESOURCE / 'verify-resource-subset.sh').read_bytes())
            subprocess.run(['bash', '-n', str(source / 'resource/verify-resource-subset.sh')], check=True)
            for name, data in result['transformations'].items():
                current = (source / name).read_text()
                for edit in reversed(data['changes']):
                    self.assertEqual(current.count(edit['new']), 1)
                    current = current.replace(edit['new'], edit['old'])
                self.assertEqual(current.encode(), Path(data['source']).read_bytes())
            self.assertEqual(result['original_resource_assertions'], 7)
            self.assertEqual(result['original_client_cases'],
                             ['hermes-cli', 'hermes-compression', 'hermes-image', 'ollama-image'])

    def test_unqualified_native_proof_creates_no_output(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with patch.object(p, 'inspect_campaign', side_effect=ValueError('native failed')):
                with self.assertRaisesRegex(ValueError, 'native failed'):
                    p.prepare(root / 'adapter.py', root / 'prepared', root / 'raw')
            self.assertFalse((root / 'prepared').exists())
            self.assertFalse((root / 'raw').exists())

    def test_current_adapter_must_revalidate_all_three_native_stages(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            proof = self.proof(root)
            fake = types.SimpleNamespace(
                load=lambda: None,
                status=lambda: {'stages': [{'stage': 'native/' + n, 'status': 'passed'}
                                           for n in ('ordinary', 'mtp', 'recovery')]},
                native_proof=lambda: proof['native_proof'],
                controls=types.SimpleNamespace(BINARY=proof['build']['binary']),
                c=types.SimpleNamespace(NATIVE={'ordinary': 1, 'mtp': 2, 'recovery': 3},
                    bench=types.SimpleNamespace(verified_build=lambda _: proof['build'])),
                PACKET=Path(proof['packet']))
            with patch.object(p, 'module', return_value=fake):
                self.assertEqual(p.inspect_campaign(proof['adapter']), proof)
                fake.status = lambda: {'stages': [{'stage': 'native/' + n, 'status': 'unrun' if n == 'mtp' else 'passed'}
                                                 for n in ('ordinary', 'mtp', 'recovery')]}
                with self.assertRaisesRegex(ValueError, 'all three'):
                    p.inspect_campaign(proof['adapter'])

    def test_changed_build_and_native_source_are_refused(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            proof = self.proof(root)
            fake = types.SimpleNamespace(
                load=lambda: None, status=lambda: {'stages': [{'stage': 'native/' + n, 'status': 'passed'} for n in ('a','b','c')]},
                native_proof=lambda: proof['native_proof'],
                controls=types.SimpleNamespace(BINARY=proof['build']['binary']),
                c=types.SimpleNamespace(NATIVE={'a': 1, 'b': 2, 'c': 3},
                    bench=types.SimpleNamespace(verified_build=lambda _: {'binary': 'different'})),
                PACKET=Path(proof['packet']))
            with patch.object(p, 'module', return_value=fake):
                with self.assertRaisesRegex(ValueError, 'binary differ'):
                    p.inspect_campaign(proof['adapter'])
                fake.load = lambda: (_ for _ in ()).throw(ValueError('changed native source'))
                with self.assertRaisesRegex(ValueError, 'changed native source'):
                    p.inspect_campaign(proof['adapter'])

    def test_existing_attempt_and_overlapping_directories_are_refused(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / 'raw').mkdir()
            with self.assertRaisesRegex(ValueError, 'attempted'):
                p.prepare('unused', root / 'prepared', root / 'raw')
            with self.assertRaisesRegex(ValueError, 'separate'):
                p.prepare('unused', root / 'new', root / 'new/raw')

    def test_changed_generated_worker_refused_before_native_import_or_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            proof, source, raw, result = self.prepared(Path(directory))
            worker = source / 'client/worker.py'
            worker.write_text(worker.read_text() + '\n# changed after binding\n')
            namespace = {'__file__': str(source / 'client/binding.py')}
            exec(compile(p.BINDING, namespace['__file__'], 'exec'), namespace)
            with patch.object(subprocess, 'Popen') as launches:
                with self.assertRaisesRegex(ValueError, 'bound gate source changed'):
                    namespace['bind_native']()
                launches.assert_not_called()

    def test_actual_client_worker_startup_uses_bound_binary_without_model_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            proof, source, raw, result = self.prepared(Path(directory))
            (raw / 'client').mkdir(parents=True)
            protocol = {'build': proof['build'], 'model': 'synthetic-test-model-never-opened',
                        'image_sha256': p.digest(p.ROOT / 'Tools/assets/vision_test/secret1.jpg')}
            (source / 'client/protocol.json').write_text(json.dumps(protocol))
            worker = source / 'client/worker.py'
            namespace = {'__file__': str(worker), '__name__': '__main__'}
            with patch.object(prefill_bench, 'preflight', return_value={'synthetic': True}), \
                 patch('socket.socket'), \
                 patch.object(subprocess, 'Popen', side_effect=RuntimeError('INTERCEPTED_MODEL_LAUNCH')) as launches, \
                 contextlib.redirect_stdout(io.StringIO()):
                with self.assertRaises(SystemExit) as stopped:
                    exec(compile(worker.read_text(), str(worker), 'exec'), namespace)
                self.assertEqual(stopped.exception.code, 1)
            launches.assert_called_once()
            self.assertEqual(launches.call_args.args[0][0], proof['build']['binary'])
            report = p.read(raw / 'client/clients/manifest.json')
            self.assertFalse(report['passed'])
            self.assertIn('INTERCEPTED_MODEL_LAUNCH', report['error'])
            self.assertEqual(report['cases'][0]['clients'], [])


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 765de1b86d44f78e7b02e50c1ae262843a48c7b26722b06fb977883996cfe31a

Encoding: `utf-8`. Original bytes: 1539.

````````````text
test_actual_client_worker_startup_uses_bound_binary_without_model_launch (__main__.PreparationChecks) ... ok
test_changed_build_and_native_source_are_refused (__main__.PreparationChecks) ... ok
test_changed_generated_worker_refused_before_native_import_or_launch (__main__.PreparationChecks) ... ok
test_current_adapter_must_revalidate_all_three_native_stages (__main__.PreparationChecks) ... FAIL
test_existing_attempt_and_overlapping_directories_are_refused (__main__.PreparationChecks) ... ok
test_original_resource_sections_and_all_other_source_bytes_preserved (__main__.PreparationChecks) ... ok
test_unqualified_native_proof_creates_no_output (__main__.PreparationChecks) ... ok

======================================================================
FAIL: test_current_adapter_must_revalidate_all_three_native_stages (__main__.PreparationChecks)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/final-resource-client-preparation-v387/checks.py", line 83, in test_current_adapter_must_revalidate_all_three_native_stages
    self.assertEqual(p.inspect_campaign(proof['adapter']), proof)
AssertionError: {'adapter': '/private/var/folders/d4/t1c8ltbx5s3_11cs9y[523 chars]ic'}} != {'adapter': '/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m00[507 chars]ic'}}
Diff is 876 characters long. Set self.maxDiff to None to see it.

----------------------------------------------------------------------
Ran 7 tests in 0.044s

FAILED (failures=1)

````````````

## Artifact SHA-256 c2d921f68797cf4e9c1a7f731e3bdc729b19c8a4b64aaac3b341887ab19cf923

Encoding: `utf-8`. Original bytes: 10007.

````````````text
"""Prepare original resource/client gates for an exact, native-qualified build.

This command never launches a compiler, model or server. The existing workloads,
limits, assessors and client behavior are preserved. Only candidate, output and
prerequisite bindings change. The old unrun preparations stay untouched.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = Path('/tmp/slotstream-optimization-execution')
RESOURCE = BASE / 'resource-verification-subset-v323'
CLIENT = BASE / 'current-candidate-gates-v307/extensions'
OLD_BINARY = ROOT / '.build/optimization/joined-state-eval-build-v304/candidate/slotstream'
OLD_PACKET = ROOT / '.build/optimization/joined-state-eval-campaign-v305'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def read(path):
    return json.loads(Path(path).read_text())


def write_new(path, value):
    with Path(path).open('x') as f:
        f.write(json.dumps(value, indent=2) + '\n')


def module(path):
    spec = importlib.util.spec_from_file_location('qualified_resource_client_campaign', path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def inspect_campaign(path):
    path = Path(path).resolve()
    adapter = module(path)
    # load/status revalidate the adapter's full source and original evidence
    # closure. native_proof additionally recomputes every required assertion.
    adapter.load()
    status = adapter.status()
    native = adapter.native_proof()
    expected = ['native/' + name for name in adapter.c.NATIVE]
    require([row['stage'] for row in status['stages'][:3]] == expected
            and all(row['status'] == 'passed' for row in status['stages'][:3]),
            'all three original native stages must qualify')
    build = adapter.c.bench.verified_build(adapter.controls.BINARY)
    require(read(adapter.PACKET / 'packet.json')['build'] == build,
            'campaign and executed binary differ')
    return {'adapter': str(path), 'adapter_sha256': digest(path),
            'packet': str(adapter.PACKET.resolve()), 'build': build,
            'contract_sha256': digest(adapter.PACKET / 'qualification-contract.json'),
            'native_proof': native}


def checked_replace(text, old, new, changes):
    require(text.count(old) == 1, 'expected one source binding: ' + old)
    changes.append({'old': old, 'new': new})
    return text.replace(old, new)


def transformed(kind, original, proof, raw_output):
    text, changes = original, []
    def change(old, new):
        nonlocal text
        text = checked_replace(text, old, new, changes)
    if kind in ('resource', 'client'):
        change('import optimization_campaign as campaign',
               'from binding import bind_native\nadapter, bound = bind_native()\ncampaign = adapter.c')
        change("B=ROOT/'.build/optimization/joined-state-eval-build-v304/candidate/slotstream'",
               'B=Path(bound[\'build\'][\'binary\'])')
        old_out = '.build/optimization/resource-verification-subset-v323' if kind == 'resource' else '.build/optimization/current-candidate-gates-v307/extensions'
        change('OUT=ROOT/' + repr(old_out), 'OUT=Path(' + repr(str(raw_output)) + ')')
        change("NATIVE_PACKET=ROOT/'.build/optimization/joined-state-eval-campaign-v305'",
               "NATIVE_PACKET=Path(bound['packet'])")
        change("native=campaign.status(NATIVE_PACKET)['stages'][:3]",
               "native=adapter.status()['stages'][:3]")
        change('# The reservation must be granted by the peer before invocation; the argument\n# binds a concrete handback deadline and never authorizes extending it.',
               '# The user-authorized interval must fit this entire original workload.\n# The argument binds its deadline; one guarded model process runs at a time.')
        if kind == 'client':
            change("DEPENDENCIES=json.loads((P.parent/'clients/dependencies.json').read_text())",
                   'DEPENDENCIES=json.loads(Path(' + repr(str(CLIENT.parent / 'clients/dependencies.json')) + ').read_text())')
            change('on the same V304 candidate at the existing65536 window',
                   'on the exact native-qualified bound candidate at the existing65536 window')
    elif kind == 'worker':
        change("BASE = ROOT / '.build/optimization/current-candidate-gates-v307/extensions/clients'",
               'BASE = Path(' + repr(str(raw_output / 'clients')) + ')')
    else:
        raise ValueError('unknown original gate')
    restored = text
    for item in reversed(changes):
        require(restored.count(item['new']) == 1, 'ambiguous reverse source binding')
        restored = restored.replace(item['new'], item['old'])
    require(restored == original, 'workload or acceptance changed beyond declared bindings')
    compile(text, kind, 'exec')
    return text, changes


BINDING = '''"""Revalidate the exact build and original native evidence before execution."""
import hashlib
import importlib.util
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent

def bind_native():
    root = HERE.parent
    value = json.loads((root / 'binding.json').read_text())
    if hashlib.sha256(Path(value['preparer']).read_bytes()).hexdigest() != value['preparer_sha256']:
        raise ValueError('preparer changed')
    spec = importlib.util.spec_from_file_location('final_gate_preparation', value['preparer'])
    preparer = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(preparer)
    preparer.require(preparer.digest(value['preparer']) == value['preparer_sha256'], 'preparer changed')
    for path, expected in value['source_closure'].items():
        preparer.require(preparer.digest(path) == expected, 'bound gate source changed: ' + path)
    current = preparer.inspect_campaign(value['proof']['adapter'])
    preparer.require(current == value['proof'], 'candidate or native prerequisites changed')
    return preparer.module(current['adapter']), current
'''


def prepare(adapter_path, destination, raw_output):
    destination, raw_output = Path(destination).resolve(), Path(raw_output).resolve()
    require(not destination.exists() and not raw_output.exists(), 'already prepared or attempted')
    require(destination != raw_output and destination not in raw_output.parents
            and raw_output not in destination.parents, 'source and measurement directories must be separate')
    old = read(RESOURCE / 'preparation.json')
    require(digest(RESOURCE / 'run.py') == old['wrapper_sha256']
            and digest(RESOURCE / 'verify-resource-subset.sh') == old['selected_script_sha256']
            and digest(ROOT / 'Tools/verify.sh') == old['original_verify_sha256'],
            'the original resource source or selected sections changed')
    proof = inspect_campaign(adapter_path)
    outputs = {}
    for name, kind, source, folder in [('resource/run.py', 'resource', RESOURCE / 'run.py', 'resource'),
                                     ('client/run.py', 'client', CLIENT / 'run.py', 'client'),
                                     ('client/worker.py', 'worker', CLIENT / 'worker.py', 'client')]:
        text, changes = transformed(kind, source.read_text(), proof, raw_output / folder)
        outputs[name] = {'text': text, 'source': str(source), 'source_sha256': digest(source), 'changes': changes}
    destination.mkdir(parents=True)
    for name, data in outputs.items():
        path = destination / name
        path.parent.mkdir(exist_ok=True)
        with path.open('x') as f:
            f.write(data['text'])
    for name in ('resource', 'client'):
        with (destination / name / 'binding.py').open('x') as f:
            f.write(BINDING)
    (destination / 'resource/verify-resource-subset.sh').write_bytes((RESOURCE / 'verify-resource-subset.sh').read_bytes())
    selected = dict(old, wrapper_sha256=digest(destination / 'resource/run.py'),
                    classification='Original full resource subset with exact new candidate and native-proof binding; original workloads and limits retained.',
                    model_launched=False)
    write_new(destination / 'resource/preparation.json', selected)
    closure = [Path(__file__).resolve(), RESOURCE / 'preparation.json', ROOT / 'Tools/verify.sh',
               CLIENT.parent / 'clients/dependencies.json']
    closure += [Path(d['source']) for d in outputs.values()]
    closure += [p for p in destination.rglob('*') if p.is_file()]
    result = {'classification': 'Prepared only. No model, compiler, server, benchmark, final-composition selection or activation.',
              'preparer': str(Path(__file__).resolve()), 'preparer_sha256': digest(__file__),
              'proof': proof, 'raw_output': str(raw_output),
              'source_closure': {str(p.resolve()): digest(p) for p in closure},
              'transformations': {n: {k: v for k, v in d.items() if k != 'text'} for n, d in outputs.items()},
              'original_resource_assertions': 7, 'original_client_modes': ['text', 'vision'],
              'original_client_cases': ['hermes-cli', 'hermes-compression', 'hermes-image', 'ollama-image'],
              'model_launched': False, 'activation_performed': False}
    write_new(destination / 'binding.json', result)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adapter', required=True)
    parser.add_argument('--out', required=True)
    parser.add_argument('--raw-out', required=True)
    args = parser.parse_args()
    result = prepare(args.adapter, args.out, args.raw_out)
    print(json.dumps({'prepared': args.out, 'binary': result['proof']['build']['binary'],
                      'model_launched': False, 'activation_performed': False}, indent=2))


if __name__ == '__main__':
    main()

````````````

## Artifact SHA-256 d5f713c7a79b8a9b2a8ef213f5fefd0233a2eb32f5a019218e1b90fa6fdaa83d

Encoding: `utf-8`. Original bytes: 1635.

````````````text
{
  "prepared_at": "2026-09-07T18:49:35.055576+00:00",
  "classification": "Unrun exact four-resource subset after preserved V307 resource exclusions. Header and elastic/MTP/long/context sections are byte-identical to current verify.sh, including the V313 context-status correction and all original acceptance rules. Includes already-passed MTP parity as its original prerequisite, producing seven required assertions total. Only subset composition and a final summary are new. No model, compiler, server or default activation.",
  "original_verify_sha256": "4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4",
  "selected_script_sha256": "23105b7e908dda2783986a1f38b1347131ec500674c876cad8b6606b21d51a89",
  "wrapper_sha256": "c3f560cd887f177cabf13baf9b3016ee197b7196826cd86731c36eb32a383f5b",
  "minimum_reserved_seconds": 1230,
  "outer_timeout_seconds": 1200,
  "original_resource_failures": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/manifest.json",
  "original_resource_manifest_sha256": "0cdec6c09d8cbd9edb612c561901cf1159126f9891b14b7b5469a80e3829be58",
  "expected_assertions": 7,
  "section_sha256": {
    "elastic": "c2bc0458ec989bc58303dce718f3cfa5ca6c94c0118fa48c778f8fb9e9401a1b",
    "mtp": "d92837533f318fcdf7c5f88edd4047e9e7f143c6ac3d1f43c9f7db1ea1b8b70b",
    "long-and-context": "b238e367d7fec13b88f213ce559fe4a511fcac508279ea5c8b7c82405cec1732"
  },
  "thermal_helper_sha256": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048",
  "reservation": "Not granted; do not invoke until a concrete interval exists.",
  "model_launched": false
}

````````````

## Artifact SHA-256 c3f560cd887f177cabf13baf9b3016ee197b7196826cd86731c36eb32a383f5b

Encoding: `utf-8`. Original bytes: 8434.

````````````text
from pathlib import Path
import datetime,json,os,re,shutil,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
import thermal_readiness
import threading
from optimization_serial_build import guarded_run
import optimization_campaign as campaign
B=ROOT/'.build/optimization/joined-state-eval-build-v304/candidate/slotstream'
OUT=ROOT/'.build/optimization/resource-verification-subset-v323'
# The reservation must be granted by the peer before invocation; the argument
# binds a concrete handback deadline and never authorizes extending it.
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(DEADLINE-time.time()-30)
PREP=json.loads((P/'preparation.json').read_text())
assert digest(Path(__file__))==PREP['wrapper_sha256'] and digest(P/'verify-resource-subset.sh')==PREP['selected_script_sha256'] and digest(ROOT/'Tools/verify.sh')==PREP['original_verify_sha256']
if remaining<1200:raise RuntimeError('the original four resource families require at least20minutes plus cleanup within the granted interval')
POLICY={'startup_reclaimable_bytes':21_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':17_500_000_000,'sample_interval_seconds':.2,
 'maximum_build_seconds':min(1200,remaining),'stop_on_new_swapouts':False}
NATIVE_PACKET=ROOT/'.build/optimization/joined-state-eval-campaign-v305'
native=campaign.status(NATIVE_PACKET)['stages'][:3]
assert [r['stage'] for r in native]==['native/'+n for n in campaign.NATIVE] and all(r['status']=='passed' for r in native)
S={'classification':'One separate current-build execution of the original four unresolved resource families: elastic governor, full MTP plus original image, long recall/memory, and2Kcontext. Exact original commands, workloads, capacities and acceptance expressions; the original MTP parity prerequisite remains included. Preserve all V307 swap-excluded evidence. This subset cannot supply a full historical battery pass or inference speedup. No skipped or resource-excluded assertion can pass.',
 'frozen_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'deadline_utc':sys.argv[1],
 'build':verified_build(B),'native_prerequisites':native,'native_contract_sha256':digest(NATIVE_PACKET/'qualification-contract.json'),'wrapper_sha256':digest(Path(__file__)),'policy':POLICY,
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B),'SLOTSTREAM_VERIFY_OUT':str(OUT/'verification')},
 'command':['bash',str(P/'verify-resource-subset.sh')], 'selected_script_sha256':digest(P/'verify-resource-subset.sh'), 'preparation_sha256':digest(P/'preparation.json'), 'thermal_helper_sha256':digest(ROOT/'Tools/thermal_readiness.py'), 'verify_source_sha256':digest(ROOT/'Tools/verify.sh'), 'predecessor_manifest_sha256':digest(ROOT/'.build/optimization/current-candidate-gates-v307/full/manifest.json'),
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.sh','.py','.mjs','.json','.swift','.txt'] and '__pycache__' not in f.parts},
 'limits':'No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit.'}
with (P/'protocol.json').open('x') as protocol:protocol.write(json.dumps(S,indent=2)+'\n')
OUT.mkdir(parents=True,exist_ok=False);started=time.monotonic();r={'passed':False,'protocol_sha256':digest(P/'protocol.json')}
def interrupted(number,_frame):raise KeyboardInterrupt(f'full qualification interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
# Capture legacy fixed output files on both sides of this exact run. An
# unchanged/stale output is retained as history, never asserted to be new evidence.
legacy_names=sorted(set(re.findall(r'/tmp/(ssv[\w.-]+)',(ROOT/'Tools/verify.sh').read_text())))
def capture_legacy(phase):
 folder=P/('legacy-output-'+phase);folder.mkdir(exist_ok=False);rows=[]
 for name in legacy_names:
  path=Path('/tmp')/name
  if path.is_symlink():
   rows.append({'path':str(path),'kind':'symlink','target':os.readlink(path)});continue
  if not path.is_file():continue
  stat=path.stat();sha=digest(path);shutil.copy2(path,folder/name)
  rows.append({'path':str(path),'sha256':sha,'bytes':stat.st_size,'mtime_ns':stat.st_mtime_ns,
               'observed_after_run_start':stat.st_mtime_ns>=int(legacy_started_wall*1e9)})
 (folder/'inventory.json').write_text(json.dumps(rows,indent=2)+'\n');return rows
legacy_started_wall=time.time()
r['legacy_output_before']=capture_legacy('before')
saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
progress_stop=threading.Event()
def progress():
 seen=set()
 while not progress_stop.wait(10):
  try:
   for line in (OUT/'stdout.txt').read_text().splitlines():
    if line.startswith(('==','PASS  ','FAIL  ','SKIP  ','passed ')) and line not in seen:
     print(json.dumps({'resource_progress':line}),flush=True);seen.add(line)
  except OSError:continue
progress_thread=threading.Thread(target=progress,daemon=True)
with (OUT/'pressure.samples.jsonl').open('x') as observations:
 def snapshot():
  state=vm_snapshot();pressure=pressure_snapshot();observations.write(json.dumps({'seconds':time.monotonic()-started,'vm':state,'pressure':pressure})+'\n');observations.flush();require_normal(pressure);return state
 try:
  r['before']=preflight(21);snapshot();assert not competing_jobs()
  r['thermal_prelaunch']=thermal_readiness.observe()
  assert r['thermal_prelaunch']['ready'] is True and r['thermal_prelaunch']['conditions']=={'thermalState':'nominal','lowPowerModeEnabled':False}, 'non-nominal operating conditions; no model launched'
  assert (ROOT/'.venv31/bin/python').exists()
  for k in saved:os.environ.pop(k,None)
  os.environ.update(S['environment'])
  progress_thread.start()
  with (OUT/'stdout.txt').open('w') as stdout,(OUT/'stderr.txt').open('w') as stderr:
   result=guarded_run(S['command'],cwd=ROOT,stdout=stdout,stderr=stderr,record_path=OUT/'memory.json',snapshot=snapshot,policy=POLICY,classification=S['classification'])
  r['exit_code']=result.returncode
  report=(OUT/'stdout.txt').read_text();summary=re.findall(r'^passed (\d+), failed (\d+)$',report,re.M)
  r['summary']=summary;r['skips']=re.findall(r'^SKIP.*$',report,re.M);r['failures']=re.findall(r'^FAIL.*$',report,re.M)
  r['passed']=result.returncode==0 and len(summary)==1 and int(summary[0][0])==7 and summary[0][1]=='0' and not r['skips'] and not r['failures']
 except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
 finally:
  progress_stop.set()
  if progress_thread.is_alive():progress_thread.join(timeout=1)
  for k in list(os.environ):
   if k.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(k,None)
  os.environ.update(saved)
  r['elapsed_seconds']=time.monotonic()-started
  # Preserve exact fixed outputs, including failed-check artifacts.
  try:r['legacy_output_after']=capture_legacy('after')
  except BaseException as error:r.setdefault('cleanup_errors',{})['legacy_output_capture']=str(error)
  # Primary result is durable before independent restoration checks.
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
  for n,f in {'after':vm_snapshot,'pressure':pressure_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
   'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()) and digest(P/'verify-resource-subset.sh')==S['selected_script_sha256'],
   'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
   try:r[n]=f()
   except BaseException as e:r.setdefault('cleanup_errors',{})[n]=f'{type(e).__name__}: {e}'
  r['within_reservation']=time.time()<=DEADLINE
  r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and r.get('candidate_unchanged') and r.get('drivers_unchanged')
   and not r.get('remaining_jobs') and r.get('model_lock_free') and r.get('pressure',{}).get('level')==1 and r['within_reservation'])
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)

````````````

## Artifact SHA-256 23105b7e908dda2783986a1f38b1347131ec500674c876cad8b6606b21d51a89

Encoding: `utf-8`. Original bytes: 6586.

````````````text
#!/bin/bash
set -eo pipefail
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}
QPID=""
cleanup() {
  if [ -n "$QPID" ]; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

# Use a reconstructible frozen binary when supplied; otherwise build normally.
# Check the real process lock and reclaimable memory before heavy work.
safety_before 13
if [ -n "${SLOTSTREAM_TEST_BINARY:-}" ] && [ "$BIN" != .build/release/slotstream ]; then
  python3 - "$BIN" <<'PYBUILD'
import sys
sys.path.insert(0, 'Tools')
from serve_bench import verified_build
verified_build(sys.argv[1])
PYBUILD
  echo "== frozen build: $BIN =="
else
  echo "== build =="
  safety_before 7
  make build >"$VERIFY_OUT/build.txt" 2>&1
fi

# Ordinary equality gates use 8–10 GB. The live governor drill separately
# declares a 13 GB ceiling: its unchanged 1/2 GB deadbands require a larger
# starting arena. It checks its derived target and real headroom before load,
# every explicit poll and generation, and samples its whole memory interval.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== elastic governor: shrinks, honors the cooldown, grows back =="
safety_before 16
DRILL_LOG="$VERIFY_OUT/elastic-drill.txt"
DRILL_STATUS=0
"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
DRILL=$(sed -nE '/^ELASTIC DRILL (PASS|FAIL|SKIP)(:|$)/p' "$DRILL_LOG")
if [ "$DRILL_STATUS" -ne 0 ]; then
  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
elif [[ "$DRILL" == *$'\n'* ]]; then
  DRILL="ELASTIC DRILL FAIL: multiple final statuses (details: $DRILL_LOG)"
elif [ -z "$DRILL" ]; then
  DRILL="ELASTIC DRILL FAIL: missing final status (details: $DRILL_LOG)"
fi
case "$DRILL" in
  "ELASTIC DRILL PASS:"*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  "ELASTIC DRILL SKIP:"*) echo "FAIL  required full gate skipped: $DRILL"; FAIL=$((FAIL+1)) ;;
  *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
esac


echo "== MTP draft head: parity with the Python reference + speculative gates =="
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
if [ -f "$MTPFILE" ]; then
  check "mtp head bit-parity vs Python reference (mtp-parity)" "run_binary mtp-parity"
  # MTP is priced at startup; the combined vision leg needs its own explicit
  # 12 GB target. It must not add a draft head outside an MTP-off plan.
  safety_before 15
  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
import json,sys
from pathlib import Path
text=Path(sys.argv[1]).read_text()
assert 'PASS  vision speculation deterministic' in text
assert 'PASS  vision speculation ran' in text
assert 'SKIP' not in text and 'MTP CHECK PASS' in text
rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
assert len(rows)==1 and rows[0]['memory_validated'] is True
PYMTP
  then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"
fi


python3 - <<'PYEOF' > /tmp/ssv_long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /tmp/ssv_long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /tmp/ssv_longmem.json \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /tmp/ssv_longmem.json /tmp/ssv_longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"

# context-check is the tool that earns any future move of the 32k ceiling; the
# battery runs one small rung so the command itself stays proven (a 2k prompt
# at the small target reads in about a minute).
CONTEXT_STATUS=0
# A resource exclusion is a failed gate, not permission to omit the rest of
# the battery. Preserve both process status and diagnostics under set -e.
run_model "$BIN" context-check --tokens 2048 --memory-gb $BIG_MEMORY --sample-footprint --json \
  2>"$VERIFY_OUT/context-check.stderr.txt" > /tmp/ssv_ctx.json || CONTEXT_STATUS=$?
printf '%s\n' "$CONTEXT_STATUS" > "$VERIFY_OUT/context-check.exit-status.txt"
check "context-check: 2k rung reads inside the plan and reports it" \
      "[ \"\$CONTEXT_STATUS\" -eq 0 ] && python3 -c 'import json; d=json.loads(open(\"/tmp/ssv_ctx.json\").read().strip().splitlines()[-1]); assert d[\"fits\"] and d[\"aborted\"] is None and d[\"prefill_tokens\"]==2048, d'"

check "context-check: sampled memory remains under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_ctx.json --limit-gb $BIG_MEMORY"


echo "passed $PASS, failed $FAIL"
[ "$FAIL" -eq 0 ]

````````````
