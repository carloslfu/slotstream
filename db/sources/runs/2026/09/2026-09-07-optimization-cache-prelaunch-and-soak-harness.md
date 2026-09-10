---
type: run
id: 01m1wre8rkjwfyektwdxq91qz6
created: 2026-09-07T01:41:34.611417+00:00
updated: 2026-09-07T01:41:34.908233+00:00
summary: Zero-cell cache preflight refusal and pure soak harness checks
binary: No native executable launched
captured_at: 2026-09-07
command: python3 /tmp/slotstream-optimization-execution/run_ngram_v205.py; python3 Tools/optimization_soak_test.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Zero-cell cache preflight refusal and pure soak harness checks
tool: Bounded preflight wrapper and pure Python fixture tests
---
# Full-cache study refused before launch; pure lifetime harness checks

V205's explicit machine interval reached only the outer preflight. It refused
with 10.72 GB reclaimable against the unchanged 12 GB prerequisite. The wrapper
elapsed 0.004829541 seconds, created no child PID, and never invoked the study
driver. The study output directory remains absent. Zero cache cells, model
layers, GPU kernels, servers or builds ran. The frozen protocol is unchanged;
the first refusal is preserved and the machine interval was returned promptly.
This is a resource-preflight observation, not a failed cache implementation or
a performance result. No retry, replacement pair or weakened memory gate ran.

V222 separately passes all 11 existing pure lifetime-harness tests after V219's
eighth final-study requirement. It uses mock process/request fixtures and loads
no model or GPU. Tests cover the exact 60-request sequence, complete cleanup,
startup/request failures and cancellation, independent peak/growth limits,
prefix/embedding charges, missing prerequisites, per-position early/late
coverage, and correctness failures even on resource-excluded requests.

The run is discarded for performance; no inference, capacity, adoption or
whole-program completion claim follows. The independent read-only machine
inventory is retained privately under /tmp and is not copied into this public
engineering store because it includes unrelated application/process details.

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/ngram-cache-v205-launch.json",
    "bytes": 3159,
    "sha256": "1bba1ee9534c1efb76a0e90951781ba35d48cffec476cf4ee4b292ce39662d4b"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/ngram-cache-v205-protocol.json",
    "bytes": 2140,
    "sha256": "5c5e74e4da45811cce9acff02ae25acd8adb5b20422d481ed1d512cde60ff61b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/run_ngram_v205.py",
    "bytes": 3061,
    "sha256": "157cce2d47b63ba962edadd9a8fefff2abb8957de5ffb357843a68139eb973f6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/soak-pure-v222/manifest.json",
    "bytes": 410,
    "sha256": "f8005056c6790e5debf45b5257873fe3e36dd944169d18fbc1d7e364d5474daf"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/soak-pure-v222/stderr.txt",
    "bytes": 110,
    "sha256": "47d6ad1719dcc615c8a045e73a56c7b1e582b15b434fd3c18b49aa5e059921b7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/soak-pure-v222/stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  }
]
```

## /Users/carlos/Projects/slotstream/.build/optimization/ngram-cache-v205-launch.json

SHA-256 `1bba1ee9534c1efb76a0e90951781ba35d48cffec476cf4ee4b292ce39662d4b`; 3159 bytes.

````text
{
  "classification": "full-cache PLE component only; no model layers, server, build or activation",
  "command": [
    "python3",
    "/Users/carlos/Projects/slotstream/Tools/ngram_cache_probe.py",
    "--protocol",
    "/Users/carlos/Projects/slotstream/.build/optimization/ngram-cache-v205-protocol.json",
    "--out",
    "/Users/carlos/Projects/slotstream/.build/optimization/ngram-cache-v205"
  ],
  "protocol_sha256": "5c5e74e4da45811cce9acff02ae25acd8adb5b20422d481ed1d512cde60ff61b",
  "wrapper_sha256": "157cce2d47b63ba962edadd9a8fefff2abb8957de5ffb357843a68139eb973f6",
  "wrapper_pid": 65810,
  "work_seconds": 5400,
  "cleanup_seconds": 60,
  "drivers": {
    "ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  },
  "completed": false,
  "error": "InsufficientHeadroom: 10.72 GB reclaimable; need 12.00 GB",
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10717495296,
    "swapins": 43969987,
    "swapouts": 77430336,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   133721.\nPages active:                                1205341.\nPages inactive:                              1116721.\nPages speculative:                             97168.\nPages throttled:                                   0.\nPages wired down:                             271530.\nPages purgeable:                               26977.\n\"Translation faults\":                    15065760976.\nPages copy-on-write:                       707191369.\nPages zero filled:                       20924117675.\nPages reactivated:                        3459011816.\nPages purged:                               71427196.\nFile-backed pages:                            493446.\nAnonymous pages:                             1925784.\nPages stored in compressor:                  1143485.\nPages occupied by compressor:                 260304.\nDecompressions:                           1165190182.\nCompressions:                             1477359382.\nPageins:                                  7585899602.\nPageouts:                                   11024500.\nSwapins:                                    43969987.\nSwapouts:                                   77430336.\nPages tagged:                                 179194.\nPages tagged resident:                        160936.\nPages tagged compressed:                       18258.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 9542.\nPages tag-storage free:                          876.\nPages tag-storage non-tag pageable:            87878.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3159616.\nTagged compressions:                        11067669.\nTagged decompressions:                      10241391.\n"
  },
  "drivers_unchanged": true,
  "within_interval": true,
  "elapsed_seconds": 0.004829541
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/ngram-cache-v205-protocol.json

SHA-256 `5c5e74e4da45811cce9acff02ae25acd8adb5b20422d481ed1d512cde60ff61b`; 2140 bytes.

````text
{
  "classification": "Real full-cache PLE component; no language-model layers or serving benefit claim",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "arms": [
    "reference",
    "compact",
    "reference-ring",
    "compact-ring"
  ],
  "rounds": 7,
  "minimum_clean_pairs": 5,
  "replacement_cells": 0,
  "fill_tokens": 32768,
  "tile_tokens": 256,
  "eviction_tokens": 4096,
  "warm_calls": 128,
  "initial_quiet_seconds": 180,
  "between_cells_seconds": 60,
  "cell_timeout_seconds": 300,
  "whole_study_timeout_seconds": 5400,
  "preflight_reclaimable_gb": 12,
  "maximum_physical_bytes": 5000000000,
  "minimum_payload_savings_bytes": 100000000,
  "minimum_physical_filled_savings_bytes": 80000000,
  "minimum_physical_growth_savings_bytes": 80000000,
  "maximum_median_time_regression": 0.05,
  "minimum_ring_eviction_reduction": 0.05,
  "minimum_positive_fraction": 0.8,
  "maximum_ring_physical_growth_bytes": 16000000,
  "vm_or_power_exclusions": "Exclude the whole pair; retain all seven fixed rounds without replacement. Native errors or memory ceiling violations stop the study.",
  "native_prerequisites": {
    "ngram": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/merged-native-v202/ngram",
      "sha256": {
        "manifest.json": "d00d22f8b21d6028f7c2134a80c7792d4bc164db63746739a5e64f378ae5767d",
        "stdout.txt": "ac9fb1041d9dc7aa0d5af44f35ca72af352888fa2d2b43b59ffec2e17b6aad14"
      }
    },
    "cache-bookkeeping": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/merged-native-v202/cache-bookkeeping",
      "sha256": {
        "manifest.json": "7a9412ef9842353165ebc5165c0f78f0b0e67858e126449f2732b5cdc15f318d",
        "stdout.txt": "b8b8e411c6d6732e2180db0d88624fd23695cc1c93d155816ac351541e1bcb73"
      }
    }
  },
  "later_gates": "Compact storage requires ordinary serving nonregression; a ring benefit requires same-control serving guard. No automatic activation follows this component."
}

````

## /tmp/slotstream-optimization-execution/run_ngram_v205.py

SHA-256 `157cce2d47b63ba962edadd9a8fefff2abb8957de5ffb357843a68139eb973f6`; 3061 bytes.

````text
"""One bounded full-cache study under the explicit V205 machine handoff."""
from pathlib import Path
import json
import os
import signal
import subprocess
import sys
import time

ROOT=Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest, preflight, terminate_child_tree, vm_snapshot

PROTOCOL=ROOT/'.build/optimization/ngram-cache-v205-protocol.json'
OUTPUT=ROOT/'.build/optimization/ngram-cache-v205'
RECEIPT=ROOT/'.build/optimization/ngram-cache-v205-launch.json'
assert digest(PROTOCOL)=='5c5e74e4da45811cce9acff02ae25acd8adb5b20422d481ed1d512cde60ff61b'
assert not OUTPUT.exists() and not RECEIPT.exists()
started=time.monotonic()
command=['python3',str(ROOT/'Tools/ngram_cache_probe.py'),'--protocol',str(PROTOCOL),'--out',str(OUTPUT)]
record={'classification':'full-cache PLE component only; no model layers, server, build or activation',
        'command':command,'protocol_sha256':digest(PROTOCOL),'wrapper_sha256':digest(Path(__file__)),
        'wrapper_pid':os.getpid(),'work_seconds':5400,'cleanup_seconds':60,
        'drivers':{name:digest(ROOT/'Tools'/name) for name in ['ngram_cache_probe.py','prefill_bench.py','serve_bench.py']},
        'completed':False}
def save():
    record['elapsed_seconds']=time.monotonic()-started
    RECEIPT.write_text(json.dumps(record,indent=2)+'\n')
def interrupted(number,frame):
    raise KeyboardInterrupt(f'owned interval interrupted by signal {number}')
signal.signal(signal.SIGINT,interrupted)
signal.signal(signal.SIGTERM,interrupted)
child=None
try:
    record['before']=preflight(12)
    env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    child=subprocess.Popen(command,cwd=ROOT,env=env,start_new_session=True)
    record['child_pid']=child.pid;save()
    print(json.dumps({'phase':'full-cache study started','wrapper_pid':os.getpid(),'child_pid':child.pid}),flush=True)
    record['exit_code']=child.wait(timeout=max(1,5400-(time.monotonic()-started)))
    record['completed']=record['exit_code']==0
except BaseException as error:
    record['error']=f'{type(error).__name__}: {error}'
finally:
    if child is not None and child.poll() is None:
        # Let the study write its incomplete rows/receipt and drain the native
        # child before escalating through the existing owned-tree cleanup.
        os.kill(child.pid,signal.SIGINT)
        try: child.wait(timeout=25)
        except subprocess.TimeoutExpired: terminate_child_tree(child)
    if child is not None: record['child_exit_code']=child.returncode
    record['after']=vm_snapshot()
    record['drivers_unchanged']=all(digest(ROOT/'Tools'/name)==sha for name,sha in record['drivers'].items())
    record['within_interval']=time.monotonic()-started<=5460
    save()
print(json.dumps({k:record[k] for k in ['completed','elapsed_seconds','exit_code','error','drivers_unchanged','within_interval'] if k in record}),flush=True)
raise SystemExit(0 if record['completed'] and record['drivers_unchanged'] and record['within_interval'] else 1)

````

## /tmp/slotstream-optimization-execution/soak-pure-v222/manifest.json

SHA-256 `f8005056c6790e5debf45b5257873fe3e36dd944169d18fbc1d7e364d5474daf`; 410 bytes.

````text
{
  "command": [
    "python3",
    "/Users/carlos/Projects/slotstream/Tools/optimization_soak_test.py"
  ],
  "exit_code": 0,
  "seconds": 0.209989875,
  "source_sha256": "59737c1d9b85222c05517690230d519fc3904a18c7989ae89131539b468667c8",
  "test_sha256": "3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be",
  "classification": "pure fixture tests; no model, GPU, build or listening server"
}

````

## /tmp/slotstream-optimization-execution/soak-pure-v222/stderr.txt

SHA-256 `47d6ad1719dcc615c8a045e73a56c7b1e582b15b434fd3c18b49aa5e059921b7`; 110 bytes.

````text
...........
----------------------------------------------------------------------
Ran 11 tests in 0.085s

OK

````

## /tmp/slotstream-optimization-execution/soak-pure-v222/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````
