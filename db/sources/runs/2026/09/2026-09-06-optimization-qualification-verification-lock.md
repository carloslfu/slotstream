---
type: run
id: 01m1w7sgtwfv87t9hrpdp34rf8
created: 2026-09-06T20:50:37.531691+00:00
updated: 2026-09-06T20:50:56.007911+00:00
summary: Qualification verification owns model exclusion — V190
binary: No native source or model execution change
captured_at: 2026-09-06
command: python3 Tools/context_qualification_checks.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Qualification verification owns model exclusion — V190
tool: Source integration and provider-free lock tests
---
V190 applies the qualification verification lock at both reviewed preimages. Full checkpoint verification performs sustained payload reads without constructing an Engine; it now owns the same per-user nonblocking advisory lock for the entire child lifetime and releases it before inference acquires its own reservation. All nine provider-free groups pass, including a real competing descriptor, release to a successor, and failed-launch evidence when the lock is already held. No native source, model execution, performance or capacity result changed.

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/qualification-verification-lock-v190/manifest.json` — 578 bytes; SHA-256 `52aeed8b511e7beecf60f427b19bc295d9b693851bafa826cdc76f0541787623`.

````text
{
  "files": [
    {
      "path": "Tools/context_qualification.py",
      "before_sha256": "e9f9cf2f82b89fb64418f918966ca5c62ca303212723bf32457b9d65729e4807",
      "after_sha256": "4eaba157c5f1dc3b56f10f63d8c81d01476e430d0d982f764f9e6c9be2d9a74c"
    },
    {
      "path": "Tools/context_qualification_checks.py",
      "before_sha256": "398c4d8bf9d98d77c0cb76873cd1a6c62e26f53839a1edde83080f1bc789d3b4",
      "after_sha256": "570b1e0fc0f52a91de4d3b8e45cea74e3f4d2aeeb0658fb522b77e56867615c3"
    }
  ],
  "native_sources_changed": false,
  "provider_free_test_groups": 9
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/qualification-verification-lock-v190/fix.patch` — 4945 bytes; SHA-256 `38c4bfe575dfc8da48763fe94483d908b729c906f2a6c598c953cda1a9694f51`.

````text
--- a/Tools/context_qualification.py
+++ b/Tools/context_qualification.py
@@ -6,6 +6,8 @@
 protocol, retries a rung, or refreshes a baseline.
 """
 import argparse
+from contextlib import contextmanager
+import fcntl
 import hashlib
 import json
 import os
@@ -20,6 +22,20 @@
 
 ROOT = Path(__file__).resolve().parent.parent
 DRIVERS = ['Tools/context_qualification.py', 'Tools/prefill_bench.py', 'Tools/memory_gate.py']
+MODEL_LOCK = Path(f'/tmp/slotstream-model-{os.getuid()}.lock')
+
+
+@contextmanager
+def verification_lock():
+    # `pull --verify` reads every payload but does not construct an Engine,
+    # so it must hold the same exclusion lock as model-bearing commands.
+    # Release before inference: the child Engine acquires its own lock.
+    with MODEL_LOCK.open('a') as lock:
+        try:
+            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
+        except BlockingIOError as error:
+            raise RuntimeError('another model or verification process holds the lock') from error
+        yield
 
 
 def observed_model(directory):
@@ -204,7 +220,8 @@
     receipt = {'command':command, 'passed':False}
     try:
         receipt['before'] = quiet_preflight(protocol['memory_gb']+3)
-        receipt['exit_code'] = run_child(command,env,verification,600)
+        with verification_lock():
+            receipt['exit_code'] = run_child(command,env,verification,600)
         if receipt['exit_code']: raise ValueError('full model verification failed')
         receipt['passed'] = True
     except Exception as error:
--- a/Tools/context_qualification_checks.py
+++ b/Tools/context_qualification_checks.py
@@ -1,6 +1,7 @@
 #!/usr/bin/env python3
 """Weight-free rejection tests for the capacity evidence boundary."""
 import copy
+import fcntl
 import json
 from pathlib import Path
 import tempfile
@@ -135,6 +136,7 @@
                 return 0
             snapshot = {'reclaimable_bytes': 20_000_000_000, 'swapins': 3, 'swapouts': 4}
             with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
+                 patch.object(gate, 'MODEL_LOCK', Path(directory)/'model.lock'), \
                  patch.object(gate, 'quiet_preflight', return_value=copy.deepcopy(snapshot)), \
                  patch.object(gate, 'vm_snapshot', return_value=copy.deepcopy(snapshot)), \
                  patch.object(gate, 'run_child', side_effect=child):
@@ -153,6 +155,7 @@
             out = Path(directory)/'run'
             protocol = {**self.protocol, 'prompt_tokens': [16], 'wall_seconds': 30, 'model_dir': directory}
             with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
+                 patch.object(gate, 'MODEL_LOCK', Path(directory)/'model.lock'), \
                  patch.object(gate, 'quiet_preflight', side_effect=RuntimeError('competing build')), \
                  patch.object(gate, 'vm_snapshot', return_value={}), \
                  patch.object(gate, 'run_child') as child:
@@ -165,5 +168,33 @@
             self.assertIn('competing build', result['error'])
             self.assertTrue((out/'model-verification/manifest.json').exists())
 
+    def test_full_verification_holds_and_releases_the_model_lock(self):
+        with tempfile.TemporaryDirectory() as directory:
+            path = Path(directory)/'model.lock'
+            with patch.object(gate, 'MODEL_LOCK', path):
+                with gate.verification_lock(), path.open('a') as competitor:
+                    with self.assertRaises(BlockingIOError):
+                        fcntl.flock(competitor, fcntl.LOCK_EX | fcntl.LOCK_NB)
+                with path.open('a') as successor:
+                    fcntl.flock(successor, fcntl.LOCK_EX | fcntl.LOCK_NB)
+
+    def test_busy_verification_lock_preserves_failure_without_launch(self):
+        with tempfile.TemporaryDirectory() as directory:
+            out = Path(directory)/'run'; path = Path(directory)/'model.lock'
+            protocol = {**self.protocol, 'prompt_tokens': [16], 'wall_seconds': 30, 'model_dir': directory}
+            with path.open('a') as owner:
+                fcntl.flock(owner, fcntl.LOCK_EX | fcntl.LOCK_NB)
+                with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
+                     patch.object(gate, 'MODEL_LOCK', path), \
+                     patch.object(gate, 'quiet_preflight', return_value={}), \
+                     patch.object(gate, 'vm_snapshot', return_value={}), \
+                     patch.object(gate, 'run_child') as child:
+                    self.assertEqual(gate.run(protocol, out), 1)
+                    child.assert_not_called()
+            result = json.loads((out/'manifest.json').read_text())
+            self.assertFalse(result['passed'])
+            self.assertEqual(result['results'], [])
+            self.assertIn('holds the lock', result['error'])
+
 
 if __name__ == '__main__': unittest.main()

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/qualification-verification-lock-v190/receipt.json` — 94 bytes; SHA-256 `c3ba0eb2591a0f4fb82bc23ef4d078e31c61242c77a16c81131c8def11fd480b`.

````text
{
  "applied": true,
  "test_exit": 0,
  "source_changed": false,
  "at": 1788727697.711242
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/qualification-verification-lock-v190/checks.txt` — 292 bytes; SHA-256 `f88bd5e3490dee57cdbcec45e0f0ad2ec971fd3a713db91c422c2dadefb69158`.

````text
..{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}
.......
----------------------------------------------------------------------
Ran 9 tests in 0.012s

OK

````

Artifact `/Users/carlos/Projects/slotstream/Tools/context_qualification.py` — 17435 bytes; SHA-256 `4eaba157c5f1dc3b56f10f63d8c81d01476e430d0d982f764f9e6c9be2d9a74c`.

````text
#!/usr/bin/env python3
"""Execute a frozen, incremental capacity protocol; stop on the first failed rung.

This gate is capacity and completion evidence. Numerical parity, real-client
behavior and answer quality remain separate gates. Never loosens a failed
protocol, retries a rung, or refreshes a baseline.
"""
import argparse
from contextlib import contextmanager
import fcntl
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tarfile
import time

from prefill_bench import digest, model_identity, preflight, run_child, vm_snapshot
from memory_gate import check_memory as memory_check

ROOT = Path(__file__).resolve().parent.parent
DRIVERS = ['Tools/context_qualification.py', 'Tools/prefill_bench.py', 'Tools/memory_gate.py']
MODEL_LOCK = Path(f'/tmp/slotstream-model-{os.getuid()}.lock')


@contextmanager
def verification_lock():
    # `pull --verify` reads every payload but does not construct an Engine,
    # so it must hold the same exclusion lock as model-bearing commands.
    # Release before inference: the child Engine acquires its own lock.
    with MODEL_LOCK.open('a') as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as error:
            raise RuntimeError('another model or verification process holds the lock') from error
        yield


def observed_model(directory):
    result = model_identity(directory)
    for file in sorted(directory.iterdir()):
        if file.suffix in ('.txt', '.py', '.md') or file.name == 'LICENSE':
            result[file.name] = {'bytes':file.stat().st_size, 'mtime_ns':file.stat().st_mtime_ns,
                                 'sha256':digest(file)}
    return result


def quiet_preflight(needed_gb):
    active = [name.strip() for name in subprocess.check_output(['ps','-axo','comm='],text=True).splitlines()
              if Path(name.strip()).name in ('swift-frontend','swift-driver','slotstream','slotstream-checks')]
    if active: raise RuntimeError('competing compiler or model process; refusing capacity launch')
    return preflight(needed_gb)


def validate(protocol):
    retained = protocol.get('kind') == 'configurable-context-retained-capacity'
    if protocol.get('schema') != 1 or protocol.get('kind') not in (
            'configurable-context-capacity', 'configurable-context-retained-capacity'):
        raise ValueError('unknown context qualification protocol')
    if protocol.get('mtp') != 'off' or protocol.get('vision') != 'off':
        raise ValueError('this protocol qualifies text only; mode gates are independent')
    if protocol.get('prefix_cache') is not retained or protocol.get('max_prefill_wait_minutes') != 0:
        raise ValueError('capacity protocol requires explicit matching retention and a disabled estimate policy')
    if not isinstance(protocol.get('optimizations'), dict) or not protocol['optimizations']:
        raise ValueError('freeze the exact resolved optimization controls before qualification')
    rungs = protocol['prompt_tokens']
    if not rungs or rungs != sorted(set(rungs)):
        raise ValueError('rungs must be strictly increasing')
    reply = protocol['reply_tokens']
    if type(reply) is not int or not 16 <= reply <= 128:
        raise ValueError('16..128 required reply tokens')
    if any(type(n) is not int or not 16 <= n <= 262144-reply for n in rungs):
        raise ValueError('prompt plus reply must fit the model window')
    if retained:
        if type(protocol.get('warm_conversations')) is not int or protocol['warm_conversations'] != 4 \
                or type(protocol.get('warm_tokens')) is not int \
                or not 16 <= protocol['warm_tokens'] <= min(rungs)+reply-4:
            raise ValueError('retained capacity requires four complete conversations with explicit bounded warm prompts')
    elif protocol.get('warm_conversations', 0) != 0:
        raise ValueError('cold capacity cannot carry warm-up conversations')
    if type(protocol['wall_seconds']) is not int or not 30 <= protocol['wall_seconds'] <= 7200:
        raise ValueError('each rung needs an independent bounded wall ceiling')
    memory = protocol['memory_gb']
    if type(memory) not in (float,int) or not 8.1 <= memory <= 26:
        raise ValueError('explicit 8.1..26 GB capacity target required')
    binary = Path(protocol['binary']).resolve()
    identity = json.loads((binary.parent/'build-identity.json').read_text())
    for file, key in [(binary,'binary_sha256'), (binary.parent/'mlx.metallib','metallib_sha256'),
                      (binary.parent/'build-source.tar.gz','source_archive_sha256')]:
        if digest(file) != protocol[key] or identity[key] != protocol[key]:
            raise ValueError(f'protocol identity mismatch: {key}')
    with tarfile.open(binary.parent/'build-source.tar.gz', 'r:gz') as archive:
        pinned = archive.extractfile('Sources/Slotstream/PinnedModel.swift').read()
    if hashlib.sha256(pinned).hexdigest() != protocol['model_manifest_sha256']:
        raise ValueError('protocol model manifest does not match the frozen binary source')
    revision = re.search(rb'public static let revision = "([a-f0-9]+)"', pinned)
    if not revision or protocol['model_revision'] != revision.group(1).decode():
        raise ValueError('protocol revision is absent from its pinned model source')
    model = Path(protocol['model_dir'])
    known = {name.decode() for name in re.findall(rb'File\(path: "([^"/]+)"', pinned)}
    if {file.name for file in model.glob('*.safetensors')} - known:
        raise ValueError('unpinned weight files are present in the qualification model')
    if observed_model(model) != protocol['model_identity']:
        raise ValueError('model metadata changed since protocol freeze; full verification is still independently required')
    if protocol['driver_sources'] != {name:digest(ROOT/name) for name in DRIVERS}:
        raise ValueError('qualification driver changed since protocol freeze')
    return binary


def validate_delivery(result, protocol, n):
    """Independent completed-work and allocation checks, never a text verdict."""
    stats = result['stats']
    if result['fits'] is not True or result['aborted'] is not None or stats.get('runtimeError') or stats.get('requestFailure'):
        raise ValueError('capacity rung was incomplete, aborted or over its plan')
    if stats.get('memoryPressureCancelled') or stats.get('reusedPrefixTokens',0) != 0:
        raise ValueError('cold qualification was cancelled or reused state')
    if len(result['prompt_ids']) != n or stats['promptTokens'] != n or stats['prefillTokens'] != n:
        raise ValueError('observed input differs from the frozen prompt count')
    if len(result['output_ids']) != protocol['reply_tokens'] or stats['decodeTokens'] != protocol['reply_tokens']:
        raise ValueError('required reply was not fully delivered')
    if result['configured_context'] != n+protocol['reply_tokens']:
        raise ValueError('candidate window was not priced before load')
    if result['model_revision'] != protocol['model_revision']:
        raise ValueError('delivered model revision differs from protocol')
    if json.dumps(result.get('optimizations'), sort_keys=True) != json.dumps(protocol['optimizations'], sort_keys=True):
        raise ValueError('delivered arithmetic/runtime controls differ from the frozen protocol')
    validate_compute(result['compute_passes'], result['compute_key_extents'], result['compute_query_rows'], n, 0, stats)
    peak = result['memory_ledger']['expected_peak_bytes']
    if type(peak) is not int or peak <= 0 or peak > protocol['memory_gb']*1e9:
        raise ValueError('ledger exceeds the frozen total-memory target')
    retained = protocol.get('kind') == 'configurable-context-retained-capacity'
    warm_memory = validate_retention(result, protocol, peak) if retained else []
    if not retained and result.get('warmup'):
        raise ValueError('cold qualification unexpectedly performed warm-up work')
    return {**memory_check({'stats':stats}, peak/1e9), 'warmup_memory': warm_memory}


def validate_compute(passes, extents, queries, total, reused, stats):
    if len(passes) != len(extents) or len(passes) != len(queries) or not passes:
        raise ValueError('missing actual attention query rows or key extents')
    position = reused
    uses_small_arithmetic = False
    for count, extent, query in zip(passes, extents, queries):
        if type(count) is not int or type(extent) is not int or type(query) is not int or not 0 < count <= query <= 4096:
            raise ValueError('invalid actual compute pass')
        uses_small_arithmetic |= 256 * (position + 256) > 4096 * 8016
        position += count
        if not position <= extent <= 262144 or query*extent > 4096*8016:
            raise ValueError('unbounded actual query-by-key product, including padding')
    if position != total: raise ValueError('compute pass counts do not close prompt')
    expected_arithmetic = 'reference-256-v1' if uses_small_arithmetic else 'standard'
    if stats.get('contextArithmetic') != expected_arithmetic:
        raise ValueError('generation did not report the required qualified context arithmetic')


def validate_retention(result, protocol, peak):
    """Prove four actual completed, interleaved conversations, not synthetic cache entries."""
    def cache(snapshot, require_full=False):
        if snapshot['enabled'] is not True or snapshot['max_conversations'] != 4:
            raise ValueError('retention was disabled or its four-state ceiling changed')
        counts = ['conversations', 'held_tokens', 'charged_token_capacity', 'allocated_sequence_bytes', 'max_tokens']
        if any(type(snapshot[key]) is not int or snapshot[key] < 0 for key in counts):
            raise ValueError('invalid retained ownership observation')
        if not snapshot['held_tokens'] <= snapshot['charged_token_capacity'] <= snapshot['max_tokens'] \
                or snapshot['allocated_sequence_bytes'] > snapshot['charged_token_capacity']*27648 \
                or not 0 <= snapshot['conversations'] <= 4:
            raise ValueError('retained allocation exceeds its bounded budget')
        if require_full and (snapshot['conversations'] != 4 or snapshot['held_tokens'] < 4*protocol['warm_tokens']):
            raise ValueError('capacity request did not start with four filled conversations')

    warmup = result['warmup']
    if len(warmup) != 8: raise ValueError('missing complete interleaved warm-up matrix')
    first_turns, memories = {}, []
    for ordinal, row in enumerate(warmup):
        phase, conversation = divmod(ordinal, 4)
        if row['phase'] != phase or row['conversation'] != conversation or row['fits'] is not True:
            raise ValueError('warm-up order or completed-work verdict changed')
        stats, ids, output, reuse = row['stats'], row['prompt_ids'], row['output_ids'], row['expected_reuse']
        if type(reuse) is not int or reuse < 0 or stats.get('runtimeError') or stats.get('requestFailure') \
                or stats.get('memoryPressureCancelled') or len(output) != 1 or stats['decodeTokens'] != 1 \
                or stats['promptTokens'] != len(ids) or stats['prefillTokens'] != len(ids)-reuse \
                or stats.get('reusedPrefixTokens', 0) != reuse:
            raise ValueError('warm-up delivery or exact prefix reuse failed')
        if phase == 0:
            if len(ids) != protocol['warm_tokens'] or reuse != 0 or any(ids == previous[0] for previous in first_turns.values()):
                raise ValueError('first warm-up turns must be distinct cold prompts of the frozen length')
            first_turns[conversation] = (ids, output)
        else:
            initial, answer = first_turns[conversation]
            if ids != initial+answer+[1000+conversation] or not len(initial) <= reuse <= len(initial)+len(answer):
                raise ValueError('follow-up does not extend the exact prior delivery and retained state')
        cache(row['retained'])
        validate_compute(stats['prefillComputePasses'], stats['prefillComputeKeyExtents'],
                         stats['prefillComputeQueryRows'], len(ids), reuse, stats)
        memories.append(memory_check({'stats': stats}, peak/1e9))
    cache(result['retained_before'], require_full=True)
    cache(result['retained_after'])
    return memories


def run(protocol, out):
    binary = validate(protocol)
    out.mkdir(parents=True, exist_ok=False)
    (out/'protocol.json').write_text(json.dumps(protocol,indent=2)+'\n')
    (out/'protocol.sha256').write_text(digest(out/'protocol.json')+'\n')
    for name in DRIVERS:
        target = out/name; target.parent.mkdir(exist_ok=True)
        target.write_bytes((ROOT/name).read_bytes())
    results = []
    env = {k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
    # These controls change reservations, not any experimental arithmetic.
    retained = protocol.get('kind') == 'configurable-context-retained-capacity'
    env['SLOTSTREAM_PREFIX_CACHE'] = '1' if retained else '0'
    verification = out/'model-verification'; verification.mkdir()
    # Verify every pinned payload, not only header/stat identities. This is
    # read-only but belongs to the exclusive local-storage interval.
    command = [str(binary),'pull','--verify','--dir',str(Path(protocol['model_dir']).resolve())]
    receipt = {'command':command, 'passed':False}
    try:
        receipt['before'] = quiet_preflight(protocol['memory_gb']+3)
        with verification_lock():
            receipt['exit_code'] = run_child(command,env,verification,600)
        if receipt['exit_code']: raise ValueError('full model verification failed')
        receipt['passed'] = True
    except Exception as error:
        receipt['error'] = f'{type(error).__name__}: {error}'
    finally:
        receipt['after'] = vm_snapshot()
        for name in ['stdout.txt','stderr.txt']:
            if (verification/name).exists(): receipt[name+'_sha256'] = digest(verification/name)
        (verification/'manifest.json').write_text(json.dumps(receipt,indent=2)+'\n')
    if not receipt['passed']:
        (out/'manifest.json').write_text(json.dumps({'passed':False,
            'error':receipt.get('error','model verification incomplete'), 'results':[],
            'completed_full_model_window':False})+'\n')
        return 1
    for n in protocol['prompt_tokens']:
        cell = out/str(n); cell.mkdir()
        row = {'prompt_tokens':n, 'passed':False, 'started_unix':time.time()}
        results.append(row)
        try:
            # Recheck frozen driver/model identities before each next rung;
            # no later edit can silently join an already running protocol.
            validate(protocol)
            row['before'] = quiet_preflight(protocol['memory_gb']+3)
            command = [str(binary),'context-check','--tokens',str(n),'--reply-tokens',str(protocol['reply_tokens']),
                       '--memory-gb',str(protocol['memory_gb']),'--mtp','off','--vision','off',
                       '--model',str(Path(protocol['model_dir']).resolve()),
                       '--max-prefill-wait','0','--wall-seconds',str(protocol['wall_seconds']),
                       '--sample-footprint','--json']
            if retained:
                command += ['--warm-conversations','4','--warm-tokens',str(protocol['warm_tokens'])]
            row['command'] = command
            print(json.dumps({'phase':'starting','prompt_tokens':n,'reclaimable_gb':row['before']['reclaimable_bytes']/1e9}),flush=True)
            row['exit_code'] = run_child(command,env,cell,protocol['wall_seconds']+120)
            result = json.loads((cell/'stdout.txt').read_text())
            # Validate the exact completed work independently of the binary's
            # verdict. A normal EOS before required output is a failed capacity
            # delivery, never an excuse to adjust the reply requirement.
            if row['exit_code']: raise ValueError('context-check exited unsuccessfully')
            row['memory'] = validate_delivery(result, protocol, n)
            row['passed'] = True
        except Exception as error:
            row['error'] = f'{type(error).__name__}: {error}'
        finally:
            row['after'] = vm_snapshot(); row['ended_unix'] = time.time()
            if row['after']['swapins'] != row.get('before',row['after'])['swapins'] or row['after']['swapouts'] != row.get('before',row['after'])['swapouts']:
                row['passed'] = False; row['swap_activity'] = True
            (cell/'manifest.json').write_text(json.dumps(row,indent=2)+'\n')
            summary={'passed':all(r['passed'] for r in results),'results':results,
                     'completed_full_model_window':bool(row['passed'] and n+protocol['reply_tokens']==262144)}
            (out/'manifest.json').write_text(json.dumps(summary,indent=2)+'\n')
            print(json.dumps({k:v for k,v in row.items() if k in ('prompt_tokens','passed','error','swap_activity')}),flush=True)
        if not row['passed']: return 1
    return 0


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('protocol',type=Path);parser.add_argument('--out',type=Path,required=True)
    args=parser.parse_args()
    return run(json.loads(args.protocol.read_text()),args.out)

if __name__=='__main__': raise SystemExit(main())

````

Artifact `/Users/carlos/Projects/slotstream/Tools/context_qualification_checks.py` — 11849 bytes; SHA-256 `570b1e0fc0f52a91de4d3b8e45cea74e3f4d2aeeb0658fb522b77e56867615c3`.

````text
#!/usr/bin/env python3
"""Weight-free rejection tests for the capacity evidence boundary."""
import copy
import fcntl
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import context_qualification as gate


def delivery():
    vm = {'swapins': 3, 'swapouts': 4}
    return {
        'fits': True, 'aborted': None, 'prompt_ids': list(range(16)),
        'output_ids': list(range(16)), 'configured_context': 32,
        'model_revision': 'frozen', 'compute_passes': [16], 'compute_key_extents': [16], 'compute_query_rows': [16],
        'memory_ledger': {'expected_peak_bytes': 8_000_000_000},
        'optimizations': {'workspaceTokenTile': 256, 'compactStateWindows': False},
        'stats': {'promptTokens': 16, 'prefillTokens': 16, 'decodeTokens': 16,
                  'contextArithmetic': 'standard',
                  'sampledFootprint': {'peakBytes': 7_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                  'lifetimeRSSPeakBytes': 7_000_000_000, 'physicalFootprintEndBytes': 6_000_000_000,
                  'generatorVMBefore': vm.copy(), 'generatorVMAfter': vm.copy()}}


def retained_delivery():
    result = delivery()
    snapshot = {'enabled': True, 'max_conversations': 4, 'conversations': 4,
                'held_tokens': 80, 'charged_token_capacity': 4096,
                'allocated_sequence_bytes': 4096*27648, 'max_tokens': 8192}
    warmup = []
    for phase in (0, 1):
        for conversation in range(4):
            ids = list(range(conversation*16, (conversation+1)*16))
            reuse = 0
            if phase == 1:
                ids += [123, 1000+conversation]; reuse = 17
            stats = delivery()['stats']
            stats.update(promptTokens=len(ids), prefillTokens=len(ids)-reuse, decodeTokens=1,
                         reusedPrefixTokens=reuse, prefillComputePasses=[len(ids)-reuse],
                         prefillComputeKeyExtents=[len(ids)], prefillComputeQueryRows=[len(ids)-reuse])
            warmup.append({'phase': phase, 'conversation': conversation, 'fits': True,
                           'prompt_ids': ids, 'output_ids': [123], 'expected_reuse': reuse,
                           'stats': stats, 'retained': copy.deepcopy(snapshot)})
    result.update(warmup=warmup, retained_before=copy.deepcopy(snapshot), retained_after=copy.deepcopy(snapshot))
    return result


class CapacityEvidence(unittest.TestCase):
    protocol = {'reply_tokens': 16, 'memory_gb': 8.1, 'model_revision': 'frozen',
                'optimizations': {'workspaceTokenTile': 256, 'compactStateWindows': False}}

    def test_complete_delivery(self):
        self.assertTrue(gate.validate_delivery(delivery(), self.protocol, 16)['passed'])

    def test_incomplete_or_forged_observations_are_rejected(self):
        cases = [
            ('fits', False), ('aborted', 'deadline'), ('prompt_ids', [1]),
            ('output_ids', [1]), ('configured_context', 16), ('model_revision', 'changed'),
            ('compute_passes', [16, 1]), ('compute_key_extents', []),
            ('compute_passes', [True]), ('compute_key_extents', [262145]),
            ('compute_query_rows', [True]), ('compute_query_rows', [15]), ('compute_query_rows', []),
            ('optimizations', {'workspaceTokenTile': 128, 'compactStateWindows': False}),
            ('memory_ledger', {'expected_peak_bytes': 8_100_000_001})]
        for key, value in cases:
            with self.subTest(key=key, value=value):
                result = delivery(); result[key] = value
                with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)
        for key, value in [('runtimeError', 'fault'), ('requestFailure', {'code': 'fault'}),
                           ('memoryPressureCancelled', True), ('reusedPrefixTokens', 1),
                           ('promptTokens', 15), ('prefillTokens', 15), ('decodeTokens', 15),
                           ('contextArithmetic', 'reference-256-v1'),
                           ('lifetimeRSSPeakBytes', 8_000_000_001)]:
            with self.subTest(stat=key):
                result = delivery(); result['stats'][key] = value
                with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)

    def test_padding_is_inside_product_bound(self):
        result = delivery()
        n = 128256
        result.update(prompt_ids=[0]*n, configured_context=n+16,
                      compute_passes=[256]*(n//256),
                      compute_query_rows=[256]*(n//256),
                      compute_key_extents=list(range(256,n+1,256)))
        result['stats'].update(promptTokens=n, prefillTokens=n)
        self.assertTrue(gate.validate_delivery(result, self.protocol, n)['passed'])
        # Only 256 extra masked columns break the product at this boundary.
        result['compute_key_extents'][-1] += 256
        with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, n)
        result['compute_key_extents'][-1] -= 256
        result['compute_query_rows'][-1] += 1
        with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, n)

    def test_swap_and_missing_memory_observations_fail(self):
        result = delivery(); result['stats']['generatorVMAfter']['swapins'] += 1
        with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)
        result = delivery(); del result['stats']['sampledFootprint']
        with self.assertRaises(KeyError): gate.validate_delivery(result, self.protocol, 16)

    def test_retained_capacity_requires_complete_interleaved_ownership(self):
        protocol = {**self.protocol, 'kind': 'configurable-context-retained-capacity',
                    'warm_conversations': 4, 'warm_tokens': 16}
        self.assertEqual(len(gate.validate_delivery(retained_delivery(), protocol, 16)['warmup_memory']), 8)
        mutations = [
            lambda r: r['warmup'].pop(),
            lambda r: r['warmup'][0].update(fits=False),
            lambda r: r['warmup'][1].update(conversation=0),
            lambda r: r['warmup'][1].update(prompt_ids=r['warmup'][0]['prompt_ids']),
            lambda r: r['warmup'][4]['prompt_ids'].__setitem__(0, 999),
            lambda r: r['warmup'][4].update(expected_reuse=0),
            lambda r: r['warmup'][4]['stats'].update(reusedPrefixTokens=0),
            lambda r: r['warmup'][0]['stats']['generatorVMAfter'].update(swapins=999),
            lambda r: r['warmup'][0]['stats'].update(prefillComputeKeyExtents=[262144], prefillComputeQueryRows=[4096]),
            lambda r: r['retained_before'].update(conversations=3),
            lambda r: r['retained_before'].update(enabled=False),
            lambda r: r['retained_before'].update(charged_token_capacity=8193),
            lambda r: r['retained_after'].update(allocated_sequence_bytes=4096*27648+1),
        ]
        for mutate in mutations:
            result = retained_delivery(); mutate(result)
            with self.assertRaises(ValueError): gate.validate_delivery(result, protocol, 16)
        with self.assertRaises(ValueError): gate.validate_delivery(retained_delivery(), self.protocol, 16)

    def test_failed_first_rung_never_launches_the_next(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)/'run'; calls = []
            protocol = {**self.protocol, 'prompt_tokens': [16, 32], 'wall_seconds': 30, 'model_dir': directory}
            def child(command, env, cell, timeout):
                calls.append(command)
                result = delivery(); result['fits'] = False
                (cell/'stdout.txt').write_text(json.dumps(result))
                (cell/'stderr.txt').write_text('')
                return 0
            snapshot = {'reclaimable_bytes': 20_000_000_000, 'swapins': 3, 'swapouts': 4}
            with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
                 patch.object(gate, 'MODEL_LOCK', Path(directory)/'model.lock'), \
                 patch.object(gate, 'quiet_preflight', return_value=copy.deepcopy(snapshot)), \
                 patch.object(gate, 'vm_snapshot', return_value=copy.deepcopy(snapshot)), \
                 patch.object(gate, 'run_child', side_effect=child):
                self.assertEqual(gate.run(protocol, out), 1)
            self.assertEqual(len(calls), 2)  # full verification, then first rung
            self.assertFalse((out/'32').exists())
            result = json.loads((out/'manifest.json').read_text())
            self.assertFalse(result['passed'])
            self.assertFalse(result['completed_full_model_window'])
            self.assertEqual(result['results'][0]['prompt_tokens'], 16)
            self.assertTrue((out/'16/stdout.txt').is_file())
            self.assertEqual((out/'protocol.sha256').read_text().strip(), gate.digest(out/'protocol.json'))

    def test_failed_verification_preflight_retains_failure_without_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)/'run'
            protocol = {**self.protocol, 'prompt_tokens': [16], 'wall_seconds': 30, 'model_dir': directory}
            with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
                 patch.object(gate, 'MODEL_LOCK', Path(directory)/'model.lock'), \
                 patch.object(gate, 'quiet_preflight', side_effect=RuntimeError('competing build')), \
                 patch.object(gate, 'vm_snapshot', return_value={}), \
                 patch.object(gate, 'run_child') as child:
                self.assertEqual(gate.run(protocol, out), 1)
                child.assert_not_called()
            result = json.loads((out/'manifest.json').read_text())
            self.assertFalse(result['passed'])
            self.assertFalse(result['completed_full_model_window'])
            self.assertEqual(result['results'], [])
            self.assertIn('competing build', result['error'])
            self.assertTrue((out/'model-verification/manifest.json').exists())

    def test_full_verification_holds_and_releases_the_model_lock(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)/'model.lock'
            with patch.object(gate, 'MODEL_LOCK', path):
                with gate.verification_lock(), path.open('a') as competitor:
                    with self.assertRaises(BlockingIOError):
                        fcntl.flock(competitor, fcntl.LOCK_EX | fcntl.LOCK_NB)
                with path.open('a') as successor:
                    fcntl.flock(successor, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_busy_verification_lock_preserves_failure_without_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)/'run'; path = Path(directory)/'model.lock'
            protocol = {**self.protocol, 'prompt_tokens': [16], 'wall_seconds': 30, 'model_dir': directory}
            with path.open('a') as owner:
                fcntl.flock(owner, fcntl.LOCK_EX | fcntl.LOCK_NB)
                with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
                     patch.object(gate, 'MODEL_LOCK', path), \
                     patch.object(gate, 'quiet_preflight', return_value={}), \
                     patch.object(gate, 'vm_snapshot', return_value={}), \
                     patch.object(gate, 'run_child') as child:
                    self.assertEqual(gate.run(protocol, out), 1)
                    child.assert_not_called()
            result = json.loads((out/'manifest.json').read_text())
            self.assertFalse(result['passed'])
            self.assertEqual(result['results'], [])
            self.assertIn('holds the lock', result['error'])


if __name__ == '__main__': unittest.main()

````

