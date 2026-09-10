---
type: run
id: 01m25xv2c03p53zj3bqx0yb4y4
created: 2026-09-10T15:09:06.816421+00:00
updated: 2026-09-10T15:09:07.239293+00:00
summary: User-directed full MTP continuation starts after actual memory and nominal thermal readiness
binary: /Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream
captured_at: 2026-09-10
command: python3 -B final-mtp-quiet-readiness-v656/launch.py; execute frozen final-mtp-quiet-interval-v653/run.py run --mode on
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: User-directed full MTP continuation starts after actual memory and nominal thermal readiness
tool: Slotstream exact native and source qualification capture
---
The user directs immediate continuation based on available capacity, superseding the earlier quiet-window availability hold. This does not change the frozen workload, inference candidate, cooling schedule, physical memory/thermal guards, exclusions or original acceptance. No applications are closed.

The actual bounded readiness helper records 121.419873333 sampled nominal seconds across sixty observations, normal memory pressure and no competing model/compiler, then executes the full prepared V653 cohort under deadline 2026-09-10T18:41:33.844074+00:00. The readiness and launch files are closed and captured here. The live study directory is not captured or treated as qualified.

The cohort is a disclosed separate repetition after the preserved V637 failure; no partial observations are reused. Host load and power observations remain available in the original serving evidence. Nominal thermal readings do not prove an unloaded machine, and any final performance conclusions must retain those limits. Full MTP-on completion, final empirical calibration, final all-item/evidence closure and actual local activation remain required.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-quiet-readiness-v656/launch.json",
    "bytes": 556,
    "sha256": "dc990720f037b7e6a86ea59656b83eac3ff5888ddf7a4a659d7b69d4cfd2a80d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-quiet-readiness-v656/launch.py",
    "bytes": 2648,
    "sha256": "e6cab0a4b35900f741b93b19038ace8154d6a293e7be1a1e2b56e037b5cec94b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-quiet-readiness-v656/result.json",
    "bytes": 206,
    "sha256": "f48a5053bcbc57f248e708deb250a4f8bd559c08b2bc5ccd6196ec82169a7772"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-quiet-readiness-v656/samples.jsonl",
    "bytes": 13212,
    "sha256": "2f2e6e9857ca51f411106362db6343db764f451e73f4bcbd3b11b0c3c4e91945"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-user-directed-continuation-v661/decision.json",
    "bytes": 937,
    "sha256": "f0e5c46e9386dee70b0232567b6562ec03f43928e9701b8c6308694103defa2d"
  }
]
```

## Artifact SHA-256 dc990720f037b7e6a86ea59656b83eac3ff5888ddf7a4a659d7b69d4cfd2a80d

Encoding: `utf-8`. Original bytes: 556.

````````````text
{
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/tmp/slotstream-optimization-execution/final-mtp-quiet-interval-v653/run.py",
    "run",
    "--mode",
    "on",
    "--deadline",
    "2026-09-10T18:41:33.844074+00:00"
  ],
  "scope": "One complete frozen MTP-on cohort with 60-second cooldown plus 30 sampled nominal seconds before the first request and 90 sampled nominal seconds between the two complete requests. All work and acceptance retained; no failed partial reuse, off rerun, replacement, retry or activation."
}

````````````

## Artifact SHA-256 e6cab0a4b35900f741b93b19038ace8154d6a293e7be1a1e2b56e037b5cec94b

Encoding: `utf-8`. Original bytes: 2648.

````````````text
"""Observe real readiness, then execute one frozen complete cooled MTP cohort."""
from pathlib import Path
import datetime
import importlib.util
import json
import os
import sys

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
RUNNER = BASE / 'final-mtp-quiet-interval-v653/run.py'
sys.path.insert(0, str(ROOT / 'Tools'))
spec = importlib.util.spec_from_file_location('cooled_prelaunch_readiness', RUNNER.parent / 'driver/thermal_settle.py')
thermal = importlib.util.module_from_spec(spec)
spec.loader.exec_module(thermal)
assert not (RUNNER.parent / 'on/execution').exists()
assert not (ROOT / '.build/optimization/final-mtp-quiet-interval-v653/on').exists()
qualification = json.loads((BASE / 'final-mtp-distributed-cooling-v637/on/execution/qualification.json').read_text())
assert qualification['qualified'] is False
assert qualification['cleanup_complete'] is True and qualification['remaining_jobs'] == []
with (HERE / 'samples.jsonl').open('x', buffering=1) as samples:
    last_print = [-30.0]
    def record(value):
        samples.write(json.dumps(value) + '\n')
        if value['seconds'] - last_print[0] >= 30:
            print(json.dumps({'prelaunch_readiness': value}), flush=True)
            last_print[0] = value['seconds']
    try:
        result = thermal.wait({'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2},
                              18, record=record)
    except BaseException as error:
        with (HERE / 'result.json').open('x') as output:
            json.dump({'ready': False, 'error': f'{type(error).__name__}: {error}',
                       'model_launched': False}, output, indent=2)
            output.write('\n')
        raise
with (HERE / 'result.json').open('x') as output:
    json.dump(result, output, indent=2)
    output.write('\n')
deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(seconds=12840)).isoformat()
command = [sys.executable, str(RUNNER), 'run', '--mode', 'on', '--deadline', deadline]
with (HERE / 'launch.json').open('x') as output:
    json.dump({'command': command,
               'scope': 'One complete frozen MTP-on cohort with 60-second cooldown plus 30 sampled nominal seconds before the first request and 90 sampled nominal seconds between the two complete requests. All work and acceptance retained; no failed partial reuse, off rerun, replacement, retry or activation.'},
              output, indent=2)
    output.write('\n')
print(json.dumps({'ready': result, 'launching': command}), flush=True)
os.execv(sys.executable, command)

````````````

## Artifact SHA-256 f48a5053bcbc57f248e708deb250a4f8bd559c08b2bc5ccd6196ec82169a7772

Encoding: `utf-8`. Original bytes: 206.

````````````text
{
  "enabled": true,
  "reserved": true,
  "seconds": 121.44954387499999,
  "sampled_nominal_seconds": 121.419873333,
  "samples": 60,
  "before_launch_only": true,
  "request_acceptance_unchanged": true
}

````````````

## Artifact SHA-256 2f2e6e9857ca51f411106362db6343db764f451e73f4bcbd3b11b0c3c4e91945

Encoding: `utf-8`. Original bytes: 13212.

````````````text
{"seconds": 0.029670542, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26207567872, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 2.090465709, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26128760832, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 4.152255459, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26117685248, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 6.212489459, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26112606208, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 8.273857417, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26009370624, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 10.335312209, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26006290432, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 12.394147459000001, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26040270848, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 14.453147750000001, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26031767552, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 16.516156125000002, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26037944320, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 18.577638959, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26142883840, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 20.611155875, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25976438784, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 22.674494042, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 26021199872, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 24.733366334, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25870155776, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 26.789314334, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25707085824, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 28.848608, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25614254080, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 30.910701042, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25610797056, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 32.972228625, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25585401856, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 35.027194334, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25671991296, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 37.06958875, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25587023872, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 39.130269917, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25591398400, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 41.192549875, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25601245184, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 43.254952167, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25621512192, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 45.313939959, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25709494272, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 47.369319917, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25705938944, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 49.41290725, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25623576576, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 51.471164292, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25626968064, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 53.5293815, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25636159488, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 55.588067084, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25642024960, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 57.64709025, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25643237376, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 59.705568334, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25647759360, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 61.770147334, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25646170112, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 63.827921959, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25646514176, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 65.89082858399999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25505628160, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 67.95300758399999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25503219712, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 70.007297834, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25590464512, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 72.070178875, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25494405120, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 74.13254941699999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25410863104, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 76.19035154199999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25346949120, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 78.236891292, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25072320512, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 80.30022675, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25222660096, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 82.36217199999999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25221971968, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 84.423248625, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25248628736, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 86.48379608399999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25149931520, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 88.544920667, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25269878784, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 90.602000334, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25065979904, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 92.664327292, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25170771968, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 94.72517979199999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25434537984, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 96.787628542, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25442779136, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 98.84880708399999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25473662976, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 100.90848179199999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25139462144, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 102.975115834, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25351618560, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 105.0385165, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25249890304, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 107.09760258399999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25241812992, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 109.15934825, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25149718528, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 111.200439959, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25305808896, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 113.239519417, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25051168768, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 115.294956042, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25143820288, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 117.35523404199999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 24979734528, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 119.391333917, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 24981012480, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 121.44954387499999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 25226526720, "swapins": 44363062, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}

````````````

## Artifact SHA-256 f0e5c46e9386dee70b0232567b6562ec03f43928e9701b8c6308694103defa2d

Encoding: `utf-8`. Original bytes: 937.

````````````text
{
  "classification": "User-directed continuation now, subject to the existing frozen startup and request resource guards.",
  "user_instruction": "I mean why don't you continue? Is there enough capacity? Just do it man, no?",
  "prior_quiet_window_availability_hold_superseded": true,
  "prepared_cohort": "/tmp/slotstream-optimization-execution/final-mtp-quiet-interval-v653",
  "readiness_launcher": "/tmp/slotstream-optimization-execution/final-mtp-quiet-readiness-v656/launch.py",
  "protocol_changed": false,
  "inference_changed": false,
  "memory_or_thermal_guards_relaxed": false,
  "full_workload_or_acceptance_changed": false,
  "prior_failed_data_reused": false,
  "applications_closed": false,
  "background_activity_limit": "Nominal thermal readings do not prove an unloaded machine. Preserve observed host conditions, existing exclusions and explicit limits on performance conclusions.",
  "activation_performed": false
}

````````````
