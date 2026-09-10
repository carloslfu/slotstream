#!/usr/bin/env python3
"""Execute a frozen, incremental capacity protocol; stop on the first failed rung.

This gate is capacity and completion evidence. Numerical parity, real-client
behavior and answer quality remain separate gates. Never loosens a failed
protocol, retries a rung, or refreshes a baseline.
"""
import argparse
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
    if protocol.get('schema') != 1 or protocol.get('kind') != 'configurable-context-capacity':
        raise ValueError('unknown context qualification protocol')
    if protocol.get('mtp') != 'off' or protocol.get('vision') != 'off':
        raise ValueError('this protocol qualifies text only; mode gates are independent')
    if protocol.get('prefix_cache') is not False or protocol.get('max_prefill_wait_minutes') != 0:
        raise ValueError('cold capacity protocol requires no prefix retention and an explicitly disabled estimate policy')
    rungs = protocol['prompt_tokens']
    if not rungs or rungs != sorted(set(rungs)):
        raise ValueError('rungs must be strictly increasing')
    reply = protocol['reply_tokens']
    if type(reply) is not int or not 16 <= reply <= 128:
        raise ValueError('16..128 required reply tokens')
    if any(type(n) is not int or not 16 <= n <= 262144-reply for n in rungs):
        raise ValueError('prompt plus reply must fit the model window')
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
    passes, extents = result['compute_passes'], result['compute_key_extents']
    if len(passes) != len(extents) or not passes:
        raise ValueError('missing actual attention key extents')
    position = 0
    for count, extent in zip(passes, extents):
        if type(count) is not int or type(extent) is not int or not 0 < count <= 4096:
            raise ValueError('invalid actual compute pass')
        position += count
        if not position <= extent <= 262144 or count*extent > 4096*8016:
            raise ValueError('unbounded actual query-by-key product, including padding')
    if position != n: raise ValueError('compute pass counts do not close prompt')
    peak = result['memory_ledger']['expected_peak_bytes']
    if type(peak) is not int or peak <= 0 or peak > protocol['memory_gb']*1e9:
        raise ValueError('ledger exceeds the frozen total-memory target')
    return memory_check({'stats':stats}, peak/1e9)


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
    env['SLOTSTREAM_PREFIX_CACHE'] = '0'
    verification = out/'model-verification'; verification.mkdir()
    # Verify every pinned payload, not only header/stat identities. This is
    # read-only but belongs to the exclusive local-storage interval.
    command = [str(binary),'pull','--verify','--dir',str(Path(protocol['model_dir']).resolve())]
    receipt = {'command':command, 'passed':False}
    try:
        receipt['before'] = quiet_preflight(protocol['memory_gb']+3)
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
