---
type: run
id: 01m23zkeedzxbfwkswvszh1t8f
created: 2026-09-09T21:01:25.325803+00:00
updated: 2026-09-09T21:01:25.698367+00:00
summary: Final readiness times out with sufficient memory and no model launch
binary: /Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream
captured_at: 2026-09-09
command: Unchanged bounded thermal observer, followed by read-only terminal and source identity audit
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Final readiness times out with sufficient memory and no model launch
tool: Slotstream exact native and source qualification capture
---
The original observer requires 120 sampled nominal seconds within a 600 second bound. It terminates without launching any model or compiler. Every thermal sample is preserved, together with actual memory, VM, pressure and competing-job observations. The following audit independently checks current conditions, free model ownership and unchanged candidate, installed, shared release and unapplied activation patch identities. The seven-stage continuation remains unrun. Prior qualified evidence and failed cohorts are unchanged. No application is closed, no permission is inferred from an unanswered quiet-window question, and no application-level cause for thermal events is established. This is an environment readiness result, not an inference performance measurement.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-readiness-v574/result.json",
    "bytes": 164,
    "sha256": "b138188335f54ee82c07a97e5025cdb221f10494166481a347179e794b3d8088"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-readiness-v574/run.py",
    "bytes": 902,
    "sha256": "d6e79d94bb4b0fa0113b0af93add280766102ab7454abf86e402205002c1d24e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-readiness-v574/samples.jsonl",
    "bytes": 64355,
    "sha256": "9c72637daadb54fbcaca6c90f69aa0dc52afba2c56389a94a48534e1fc236365"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-readiness-v574/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-readiness-v574/stdout.txt",
    "bytes": 164,
    "sha256": "b138188335f54ee82c07a97e5025cdb221f10494166481a347179e794b3d8088"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/readiness-terminal-audit-v575.json",
    "bytes": 4236,
    "sha256": "60d38cea71ed1821b0d66036c79b7cc61847c4821633b1602294c532721d40eb"
  }
]
```

## Artifact SHA-256 b138188335f54ee82c07a97e5025cdb221f10494166481a347179e794b3d8088

Encoding: `utf-8`. Original bytes: 164.

````````````text
{
  "passed": false,
  "model_launched": false,
  "error": "TimeoutError: bounded thermal settling expired; no model launched",
  "elapsed_seconds": 600.03108375
}

````````````

## Artifact SHA-256 d6e79d94bb4b0fa0113b0af93add280766102ab7454abf86e402205002c1d24e

Encoding: `utf-8`. Original bytes: 902.

````````````text
from pathlib import Path
import json,sys,time
HERE=Path(__file__).resolve().parent
sys.path.insert(0,'/Users/carlos/Projects/slotstream/Tools')
sys.path.insert(0,'/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388')
import thermal_settle
started=time.monotonic()
with (HERE/'samples.jsonl').open('x') as output:
 def record(value):
  output.write(json.dumps(value)+'\n');output.flush()
 try:
  result=thermal_settle.wait({'stable_seconds':120,'maximum_wait_seconds':600,'poll_seconds':2},22.2,record=record)
  result.update(passed=True,model_launched=False)
 except Exception as error:
  result={'passed':False,'model_launched':False,'error':type(error).__name__+': '+str(error),'elapsed_seconds':time.monotonic()-started}
(HERE/'result.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2),flush=True)
raise SystemExit(0 if result['passed'] else 1)

````````````

## Artifact SHA-256 9c72637daadb54fbcaca6c90f69aa0dc52afba2c56389a94a48534e1fc236365

Encoding: `utf-8`. Original bytes: 64355.

````````````text
{"seconds": 0.033425208000000005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29448945664, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 2.075089083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29431726080, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 4.106902915999999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29310992384, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 6.149006207999999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29425270784, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 8.182345583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29418602496, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 10.221938750000001, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29426106368, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 12.267873833000001, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29427417088, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 14.308036750000001, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29591273472, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 16.344945832999997, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29601398784, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 18.390234832999997, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29433380864, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 20.432699333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29429530624, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 22.475214291, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29433446400, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 24.516417416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29422665728, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 26.561887582999997, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29473177600, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 28.600232249999998, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29436215296, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 30.645643541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29423190016, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 32.682272624999996, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29428367360, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 34.720008082999996, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29425025024, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 36.760055416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29429383168, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 38.799732041, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29429907456, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 40.83629825, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29610262528, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 42.87290575, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29661167616, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 44.911908458, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29493198848, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 46.947286208, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29656055808, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 48.986761625, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29513187328, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 51.022447207999996, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29507600384, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 53.068033875, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29507354624, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 55.112958708, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29507338240, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 57.150954333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29551837184, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 59.202664583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29507895296, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 61.240412, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29503029248, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 63.279738291, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29370892288, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 65.325017333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29379395584, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 67.364432416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29670440960, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 69.409881083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29489938432, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 71.447947541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29488807936, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 73.492945333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29652762624, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 75.529254458, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29495181312, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 77.564252416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29493313536, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 79.604075458, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29493051392, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 81.640066291, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29491167232, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 83.681615125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29491331072, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 85.719935291, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29488939008, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 87.764121, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29514743808, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 89.800513208, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29487939584, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 91.839927291, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29490823168, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 93.877292416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29664116736, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 95.922656583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29487398912, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 97.958604125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29377593344, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 99.994842083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29661839360, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 102.034240458, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29667344384, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 104.078641541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29487792128, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 106.114540875, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29486333952, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 108.15503575, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29488201728, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 110.194974666, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29486612480, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 112.231150375, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29487546368, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 114.267072, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29489364992, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 116.31248612499999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29465051136, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 118.349423208, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29484023808, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 120.385737333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29643390976, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 122.420974916, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29463281664, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 124.457465166, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29337468928, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 126.494223458, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29617684480, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 128.531636083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29620600832, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 130.570396166, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29456138240, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 132.6081505, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29457104896, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 134.6471755, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29457776640, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 136.684052583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29470097408, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 138.72002504099999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29469147136, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 140.764994791, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29465722880, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 142.80974125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29467918336, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 144.847097958, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29468803072, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 146.88834325, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29674897408, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 148.932243, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29468213248, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 150.969286, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29468688384, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 153.005337208, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29647912960, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 155.047047708, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29648977920, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 157.086598125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29465001984, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 159.120829083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29460447232, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 161.160955416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29457219584, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 163.197914583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29457858560, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 165.242657125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29460594688, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 167.282548541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29461397504, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 169.319203833, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29465903104, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 171.354867916, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29463101440, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 173.39148875, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29639344128, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 175.44415025, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29461233664, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 177.481145666, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29496672256, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 179.517729291, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29620191232, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 181.556654291, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29628858368, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 183.602101375, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29336633344, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 185.638435375, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29451550720, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 187.679655083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29458563072, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 189.729172208, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29452500992, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 191.774965125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29453500416, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 193.810426208, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29455581184, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 195.853470333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29458776064, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 197.88945925, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29466558464, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 199.926200125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29630398464, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 201.959717541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29466492928, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 203.995707833, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29465182208, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 206.0350975, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29643505664, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 208.075170958, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29671030784, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 210.113532666, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29462528000, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 212.149873083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29455384576, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 214.185756166, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29461463040, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 216.229588375, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29452320768, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 218.266620291, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29193011200, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 220.311358, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29375840256, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 222.348207375, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29382819840, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 224.394442083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29382180864, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 226.430829708, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29381001216, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 228.478485875, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29381836800, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 230.524312583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29381345280, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 232.561627625, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29483466752, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 234.604563458, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29497982976, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 236.649338875, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29369581568, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 238.686512875, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29331144704, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 240.732500583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29323608064, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 242.778802625, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29189636096, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 244.819197166, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29202546688, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 246.85866612499998, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29284630528, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 248.901408541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29261185024, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 250.94871370799999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29259268096, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 252.990711083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29260070912, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 255.032741416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29247209472, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 257.06913520800003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29248471040, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 259.112380583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29424189440, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 261.14706816600005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29249880064, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 263.19054183300005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29249175552, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 265.23266995800003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29403496448, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 267.26890187500004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29298802688, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 269.33515787500005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29245276160, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 271.37423212500005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29249945600, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 273.41158358300004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29247897600, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 275.45082795800005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29245833216, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 277.49519608300005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29342810112, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 279.54097162500005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29347807232, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 281.579256416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29342154752, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 283.61919108300003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29339516928, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 285.65941570800004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29499801600, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 287.71449950000004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29299507200, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 289.75987458300006, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29314023424, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 291.803162708, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29478731776, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 293.84123095800004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29536092160, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 295.87428175, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29373890560, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 297.91039883300004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29421486080, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 299.947820916, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29385408512, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 301.993289666, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29384507392, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 304.03144537500003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29256630272, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 306.07171316600005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29374021632, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 308.11111029100005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29381509120, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 310.148583791, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29387489280, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 312.19362295800005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29564551168, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 314.23451375, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29386588160, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 316.276197416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29389504512, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 318.31607037500004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29575643136, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 320.358767541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29579919360, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 322.40288354100005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29401513984, "swapins": 44360708, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 324.44025162500003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29400596480, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 326.47615541600004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29402497024, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 328.513880583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29421895680, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 330.55130941600004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29403643904, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 332.59102191600005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29400612864, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 334.628306666, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29400285184, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 336.66597700000005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29399252992, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 338.70663708300003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29573644288, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 340.748443791, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29397942272, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 342.789348958, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29395779584, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 344.827202, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29556244480, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 346.87154704100004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29563813888, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 348.91594104100005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29398548480, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 350.950292583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29404676096, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 352.985683875, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29401513984, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 355.028084083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29400432640, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 357.06801983300005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29453778944, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 359.11263979100005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29404512256, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 361.14948675000005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29402644480, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 363.195431125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29275013120, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 365.24232925, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29441818624, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 367.279907791, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29395828736, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 369.317272541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29357342720, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 371.36248645800003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29536944128, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 373.39902462500004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29540220928, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 375.44421587500005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29370499072, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 377.48928158300004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29354049536, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 379.529623958, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29355982848, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 381.56795041600003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29355950080, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 383.61424750000003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29361487872, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 385.650627625, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29378674688, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 387.69048754100004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29427875840, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 389.754084583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29381001216, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 391.7949125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29389733888, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 393.828678625, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29383688192, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 395.86506254100004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29387718656, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 397.911704708, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29546676224, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 399.956491, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29547167744, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 401.992458, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29386571776, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 404.030125833, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29543481344, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 406.06586150000004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29387931648, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 408.109987583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29387882496, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 410.14582595800005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29388439552, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 412.183504458, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29391175680, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 414.22399845800004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29385129984, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 416.26032133300004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29385490432, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 418.296287833, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29305946112, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 420.33238395800004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29381050368, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 422.36962445800003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29383655424, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 424.427962541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29438771200, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 426.463419708, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29379887104, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 428.503547, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29376430080, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 430.539908833, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29556899840, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 432.575007625, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29402464256, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 434.617781125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29402267648, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 436.65410308300005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29402169344, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 438.695192458, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29401956352, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 440.728742208, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29398663168, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 442.769671833, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29399302144, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 444.814590833, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29398745088, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 446.859498916, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29399826432, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 448.90137400000003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29419290624, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 450.94169333300005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29581459456, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 452.980360666, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29400924160, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 455.019364041, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29398499328, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 457.056244166, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29560111104, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 459.111270916, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29565501440, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 461.14927400000005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29400907776, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 463.18784233300005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29398810624, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 465.230146916, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29402791936, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 467.268780041, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29401530368, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 469.3090915, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29402759168, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 471.348134333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29386604544, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 473.388522958, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29385228288, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 475.424559708, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29389668352, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 477.461002333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29614751744, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 479.50108645800003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29393928192, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 481.54177200000004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29390110720, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 483.57854608300005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29442932736, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 485.62415587500004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29457612800, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 487.668458375, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29381263360, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 489.705435791, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29379821568, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 491.74305537500004, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29385523200, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 493.788244791, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29385703424, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 495.824854666, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29387522048, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 497.864353375, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29390127104, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 499.900603583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29390798848, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 501.939543791, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29384687616, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 503.97520945800005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29564370944, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 506.01118420800003, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29383409664, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 508.048691791, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29419569152, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 510.11277495800005, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29553328128, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 512.15484925, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29553262592, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 514.200628416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29406887936, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 516.2382665, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29406494720, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 518.2741609999999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29213753344, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 520.314392875, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29399121920, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 522.350726916, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29403054080, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 524.390651541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29405167616, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 526.4302494159999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29402267648, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 528.465235833, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29407379456, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 530.502636791, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29586964480, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 532.5387845409999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29402644480, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 534.584550125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29335388160, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 536.620488, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29509386240, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 538.6600522909999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29544890368, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 540.6993599159999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29330636800, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 542.736400375, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29205331968, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 544.780587791, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29219602432, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 546.825869541, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29329178624, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 548.862635166, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29330669568, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 550.899567583, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29260955648, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 552.94449975, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29251469312, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 554.990061708, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29258825728, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 557.026581041, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29257760768, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 559.0650573749999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29257613312, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 561.103958625, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29258612736, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 563.149688041, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29418455040, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 565.1944280829999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29421158400, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 567.23697225, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29315088384, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 569.280518875, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29266149376, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 571.3175565409999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29261217792, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 573.3634879159999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29256351744, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 575.398808458, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29258104832, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 577.434760916, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29267361792, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 579.4729844159999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29270900736, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 581.5236216249999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29269245952, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 583.5593675829999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29261873152, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 585.598039958, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29259759616, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 587.63634525, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29068656640, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 589.673874041, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29414572032, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 591.713290625, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29420437504, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 593.759275, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29304684544, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 595.797019416, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29459841024, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 597.834496208, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29344595968, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 599.8794527079999, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 29309911040, "swapins": 44360712, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 60d38cea71ed1821b0d66036c79b7cc61847c4821633b1602294c532721d40eb

Encoding: `utf-8`. Original bytes: 4236.

````````````text
{
  "observed_at_utc": "2026-09-09T21:01:19.404616+00:00",
  "prior_bounded_observer": {
    "result": {
      "passed": false,
      "model_launched": false,
      "error": "TimeoutError: bounded thermal settling expired; no model launched",
      "elapsed_seconds": 600.03108375
    },
    "samples": 295,
    "thermal_counts": {
      "fair": 295
    },
    "minimum_reclaimable_bytes": 29068656640,
    "last_reclaimable_bytes": 29309911040,
    "swapins_first_last": [
      44360708,
      44360712
    ],
    "swapouts_first_last": [
      77895019,
      77895019
    ],
    "all_pressure_normal": true,
    "all_competing_jobs_empty": true
  },
  "current_thermal": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T21:01:19.405172+00:00",
    "conditions": {
      "thermalState": "fair",
      "lowPowerModeEnabled": false
    },
    "ready": false,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "current_vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29294919680,
    "swapins": 44360724,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   253270.\nPages active:                                1102505.\nPages inactive:                              1121471.\nPages speculative:                             81193.\nPages throttled:                                   0.\nPages wired down:                             222553.\nPages purgeable:                               18717.\n\"Translation faults\":                    19067946161.\nPages copy-on-write:                      1130507721.\nPages zero filled:                       31357532766.\nPages reactivated:                        6154133544.\nPages purged:                              100371265.\nFile-backed pages:                           1516033.\nAnonymous pages:                              789136.\nPages stored in compressor:                   805809.\nPages occupied by compressor:                 303478.\nDecompressions:                           1522478770.\nCompressions:                             1866364272.\nPageins:                                 10433110109.\nPageouts:                                   11728805.\nSwapins:                                    44360724.\nSwapouts:                                   77895019.\nPages tagged:                                 177535.\nPages tagged resident:                        152369.\nPages tagged compressed:                       25166.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7842.\nPages tag-storage free:                         1494.\nPages tag-storage non-tag pageable:            88957.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    4079872.\nTagged compressions:                        15451747.\nTagged decompressions:                      14390540.\n"
  },
  "current_pressure": {
    "command": [
      "sysctl",
      "-n",
      "kern.memorystatus_vm_pressure_level"
    ],
    "level": 1,
    "name": "normal",
    "stdout": "1\n",
    "stderr": ""
  },
  "current_competing_jobs": [],
  "model_lock_free": true,
  "artifacts": {
    "candidate": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
      "sha256": "9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673"
    },
    "installed": {
      "path": "/Users/carlos/.slotstream/bin/slotstream",
      "sha256": "7f540b73b5ff4cf48975ff122a3d17f57e53103e616ad84a76cfc71d551be5b8"
    },
    "shared_release": {
      "path": "/Users/carlos/Projects/slotstream/.build/release/slotstream",
      "sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9"
    },
    "activation_patch": {
      "path": "/tmp/slotstream-optimization-execution/final-activation-preparation-v572/activation.patch",
      "sha256": "45ec2fa8ac234f047d22d67f70c04e69c467cdc9ed60feaa76bde17ac8a8af30"
    }
  },
  "continuation_has_no_new_launch": true,
  "new_model_or_build_launched": false,
  "apps_closed": false
}

````````````
