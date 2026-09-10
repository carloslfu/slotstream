---
type: run
id: 01m261xs59664g7etcrb605048
created: 2026-09-10T16:20:29.993665+00:00
updated: 2026-09-10T16:20:30.395394+00:00
summary: Full thermal-recovery MTP-on cohort launches after real bounded nominal and capacity readiness
binary: /Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream
captured_at: 2026-09-10
command: 'final-mtp-recovery-readiness-v668/launch.py: actual readiness then exec frozen full final-mtp-thermal-recovery-v667/run.py run --mode on'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Full thermal-recovery MTP-on cohort launches after real bounded nominal and capacity readiness
tool: Slotstream exact native and source qualification capture
---
Actual readiness delivers 121.559327708 sampled nominal seconds across sixty observations, normal pressure, no competing model or compiler and at least eighteen GB reclaimable before launching the single frozen complete MTP-on cohort. The full work reservation deadline is 2026-09-10T19:53:38.292254+00:00. Only closed startup samples, result and launch command are captured here; the live cohort is not qualified or captured. No app is closed, no previous partial observation is reused, and no source or installation is activated.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-recovery-readiness-v668/launch.json",
    "bytes": 631,
    "sha256": "75ab8dcbbeb16fdeaff30a1c0c04688b84498686b76f21eeb87c46d571771874"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-recovery-readiness-v668/launch.py",
    "bytes": 2720,
    "sha256": "31189979ffc96203ff2ec2c48e00f6a7576af5b99835bec0ea53d43be2501dcf"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-recovery-readiness-v668/result.json",
    "bytes": 200,
    "sha256": "bcf464f83e778da06c7c41342da073d83e4163271e345c251464ae3706fef6be"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-recovery-readiness-v668/samples.jsonl",
    "bytes": 13167,
    "sha256": "07f7b8a1fc759bf1c6ed8072d744f1b6ff4b1fbf1c53122b84479ad1be25f263"
  }
]
```

## Artifact SHA-256 75ab8dcbbeb16fdeaff30a1c0c04688b84498686b76f21eeb87c46d571771874

Encoding: `utf-8`. Original bytes: 631.

````````````text
{
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/tmp/slotstream-optimization-execution/final-mtp-thermal-recovery-v667/run.py",
    "run",
    "--mode",
    "on",
    "--deadline",
    "2026-09-10T19:53:38.292254+00:00"
  ],
  "scope": "One complete frozen MTP-on cohort with 60-second cooldown plus 30 sampled nominal seconds before the first request and 90 sampled nominal seconds between the two complete requests. Completed fair requests remain excluded, then require nominal readiness. All work and acceptance retained; no failed partial reuse, off rerun, replacement, retry or activation."
}

````````````

## Artifact SHA-256 31189979ffc96203ff2ec2c48e00f6a7576af5b99835bec0ea53d43be2501dcf

Encoding: `utf-8`. Original bytes: 2720.

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
RUNNER = BASE / 'final-mtp-thermal-recovery-v667/run.py'
sys.path.insert(0, str(ROOT / 'Tools'))
spec = importlib.util.spec_from_file_location('cooled_prelaunch_readiness', RUNNER.parent / 'driver/thermal_settle.py')
thermal = importlib.util.module_from_spec(spec)
spec.loader.exec_module(thermal)
assert not (RUNNER.parent / 'on/execution').exists()
assert not (ROOT / '.build/optimization/final-mtp-thermal-recovery-v667/on').exists()
qualification = json.loads((BASE / 'final-mtp-quiet-interval-v653/on/execution/qualification.json').read_text())
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
               'scope': 'One complete frozen MTP-on cohort with 60-second cooldown plus 30 sampled nominal seconds before the first request and 90 sampled nominal seconds between the two complete requests. Completed fair requests remain excluded, then require nominal readiness. All work and acceptance retained; no failed partial reuse, off rerun, replacement, retry or activation.'},
              output, indent=2)
    output.write('\n')
print(json.dumps({'ready': result, 'launching': command}), flush=True)
os.execv(sys.executable, command)

````````````

## Artifact SHA-256 bcf464f83e778da06c7c41342da073d83e4163271e345c251464ae3706fef6be

Encoding: `utf-8`. Original bytes: 200.

````````````text
{
  "enabled": true,
  "reserved": true,
  "seconds": 121.58842025,
  "sampled_nominal_seconds": 121.559327708,
  "samples": 60,
  "before_launch_only": true,
  "request_acceptance_unchanged": true
}

````````````

## Artifact SHA-256 07f7b8a1fc759bf1c6ed8072d744f1b6ff4b1fbf1c53122b84479ad1be25f263

Encoding: `utf-8`. Original bytes: 13167.

````````````text
{"seconds": 0.029092542000000002, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29741776896, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 2.092746792, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29760454656, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 4.152029542, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29772382208, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 6.207829084, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29765992448, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 8.249631791999999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29756948480, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 10.316352084, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29375119360, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 12.37242525, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29581279232, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 14.435433125, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29653565440, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 16.499496584, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29580525568, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 18.558792292, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29576986624, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 20.619043917, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29649895424, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 22.684837709, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29659496448, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 24.74941275, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29466591232, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 26.809369417, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29578067968, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 28.871843917, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29582983168, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 30.933830125, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29582786560, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 32.990625792, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29587095552, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 35.053925209, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29586128896, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 37.117125666999996, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29634183168, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 39.174941459, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29642752000, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 41.240175542, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29806084096, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 43.298624959, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29793517568, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 45.3607475, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29796581376, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 47.424291208999996, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29871341568, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 49.480421292, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29799153664, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 51.539429209, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29786750976, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 53.601427292, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29856497664, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 55.658614709, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29854793728, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 57.724319666999996, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29788504064, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 59.788381917, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29783605248, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 61.848432875, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29788602368, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 63.91638975, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29782327296, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 65.980822417, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29598564352, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 68.042517167, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29782835200, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 70.100056917, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29431889920, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 72.162820584, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29599711232, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 74.220921834, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29590650880, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 76.284089709, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29530292224, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 78.346196209, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29531635712, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 80.411541167, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29607673856, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 82.474263792, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29609443328, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 84.532547209, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29407641600, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 86.59843225, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29598121984, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 88.665407667, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29600006144, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 90.731688542, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29526523904, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 92.79001075, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29515497472, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 94.833917584, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29494968320, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 96.868814834, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29271506944, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 98.928123667, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29472768000, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 100.984762542, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29641654272, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 103.047863042, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29647650816, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 105.11137025, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29649223680, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 107.175758667, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29718609920, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 109.239193584, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29650550784, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 111.3021445, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29643096064, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 113.361690209, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29705158656, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 115.417979084, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29744431104, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 117.48362725, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29729570816, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 119.525502709, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 28127969280, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 121.58842025, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 28411559936, "swapins": 44363436, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}

````````````
