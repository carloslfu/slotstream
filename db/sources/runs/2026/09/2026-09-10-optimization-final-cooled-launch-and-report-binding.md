---
type: run
id: 01m25p1b41q9vp70dtd99vd9x6
created: 2026-09-10T12:52:43.777500+00:00
updated: 2026-09-10T12:52:44.165208+00:00
summary: Cooled MTP cohort passes actual readiness and final report preparation follows its exact identity
binary: /Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream
captured_at: 2026-09-10
command: python3 final-mtp-cooled-readiness-v628/launch.py; model-free exact-source rebinding of terminal extraction and calibration
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Cooled MTP cohort passes actual readiness and final report preparation follows its exact identity
tool: Slotstream exact native and source qualification capture
---
The unchanged Foundation readiness helper observes 121.405713917 sampled nominal seconds over 60 actual samples, with normal pressure and no competing model/compiler. It then executes the exact frozen V627 MTP-on cohort with a fresh full deadline. These files are closed prelaunch evidence; no live measurement directory is captured here. The complete cohort remains unqualified until its full original raw assessor and source/resource/deadline/cleanup gates finish.

V630 preserves the original terminal extractor with only its executor source path rebound to V627. V631 preserves the V621 calibration arithmetic and decision criteria, rebinding the MTP-on terminal report and executor, and adds the already reconciled 192-response prefill prerequisites and their input hashes. Python syntax passes and reversing the explicit amendments reproduces the old sources exactly. Neither report has executed or produced a final result. No engine source, candidate binary, inference algorithm, acceptance criterion, installation, stage, commit, push or release changes.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-calibration-decision-v631/close.py",
    "bytes": 10400,
    "sha256": "10574d3da371b2b0f9194f409b2ead968fbe9225c02363263bcb57fa45be13ca"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-calibration-decision-v631/preparation.json",
    "bytes": 2116,
    "sha256": "f9aca465ebafd5b1980da931a13e2a21669998ccd3728beeee2fcccc1c2cf155"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-cooled-mtp-report-v630/close.py",
    "bytes": 5032,
    "sha256": "6ef37fae7baa12efc0d86b4e523bd618ab4aebd920ff141856e3f4d9a913b89c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-readiness-v628/launch.json",
    "bytes": 477,
    "sha256": "e5856108c718339298f5d7dc670d44f04ce5af8b18589bbe0de53afd8a4cb1e7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-readiness-v628/launch.py",
    "bytes": 2563,
    "sha256": "628b2a5fec7506aca6bde5e99722fd5d3a3a0a0d031026f68c110d1db3f369ac"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-readiness-v628/result.json",
    "bytes": 201,
    "sha256": "b8a7639147e25e07e4d28508f43554f8a03e7d0bcd6c564f6bec95463e7b85eb"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-readiness-v628/samples.jsonl",
    "bytes": 13236,
    "sha256": "4b5de9bd51d4c1d66e4b69354c0ad7127125064ea920f9b72e7489073656bb48"
  }
]
```

## Artifact SHA-256 10574d3da371b2b0f9194f409b2ead968fbe9225c02363263bcb57fa45be13ca

Encoding: `utf-8`. Original bytes: 10400.

````````````text
"""Close the empirical envelope only after both exact sustained studies qualify.

This reads completed evidence. It cannot run a model, alter a protocol, fit
unmeasured anchors, change runtime controls, or activate an installation.
"""
from pathlib import Path
import datetime
import hashlib
import json
import math
import re

BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
PREPARATION = BASE / 'final-activation-preparation-v572'
CANDIDATE = '9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673'
INPUTS = {}


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def read(path):
    path = Path(path)
    data = path.read_bytes()
    INPUTS[str(path)] = hashlib.sha256(data).hexdigest()
    return json.loads(data)


def main():
    target = HERE / 'result.json'
    assert not target.exists(), 'Do not overwrite a completed calibration decision'
    # Require the new MTP-on terminal report first; partial data cannot close this.
    reports = {
        'on': read(BASE / 'final-cooled-mtp-report-v630/on-result.json'),
        'off': read(BASE / 'final-long-report-v608/off-result.json'),
    }
    prior = read(BASE / 'final-calibration-envelope-v603/result.json')
    for name, expected in prior['input_sha256'].items():
        assert digest(name) == expected, 'Calibration input changed: ' + name
        INPUTS[name] = expected
    prefill = read(BASE / 'final-prefill-report-v622/result.json')
    assert prefill['all192_responses_work_parity_geometry_and_sampled_caps_rechecked'] is True
    assert prefill['original_descriptive_results_exactly_reproduced'] is True
    for name, expected in prefill['input_sha256'].items():
        assert digest(name) == expected, 'Prefill evidence changed: ' + name
        INPUTS[name] = expected
    prepared = read(PREPARATION / 'manifest.json')
    identity = prepared['build']['identity']
    assert identity['binary_sha256'] == prior['candidate_sha256'] == CANDIDATE
    assert all(prior['source_family'][key] is True for key in (
        'parameters_byte_identical_to_441_case_family',
        'pure_policy_byte_identical_after_device_function_extraction',
        'matches_exact_final_qualified_public_consumer',
        'historical_behavior_comparison_all_exact'))

    cost_path = PREPARATION / 'after/Sources/Slotstream/PlannerCostModel.swift'
    cost_text = cost_path.read_text()
    INPUTS[str(cost_path)] = digest(cost_path)
    constants = {name: float(value.replace('_', '')) for name, value in re.findall(
        r'package static let (\w+) = ([\d_.]+)\n', cost_text)}
    family = re.search(r'package static let identity = "([^"]+)"', cost_text).group(1)
    assert family == 'm5-pro-reference-envelope-v1'
    assert len(constants) == 17, 'Review a changed parameter family explicitly'

    observations = []
    lifetime_envelopes = []
    for mode, report in reports.items():
        executor = BASE / ('final-long-adaptive-schedule-v581' if mode == 'off'
                           else 'final-mtp-cooled-evidence-v627')
        qualification = read(executor / mode / 'execution/qualification.json')
        assert all(qualification.get(key) is True for key in (
            'passed', 'completed', 'qualified', 'proofs_unchanged',
            'cleanup_complete', 'within_reservation'))
        assert qualification['remaining_jobs'] == []
        assert report['build_identity'] == identity
        assert report['original_executor_sha256'] == digest(executor / 'run.py')
        assert report['original_reporter_sha256'] == digest(
            BASE / 'long-decode-measurement-v340/long_decode.py')
        assert report['comparison_basis'] == 'fixed-total-memory'
        assert report['measured_responses'] == report['first_responses'] == 32
        assert report['outputs_per_response'] == 512
        assert report['total_observed_output_tokens'] == 32768
        assert report['no_rerun_replacement_or_rescore'] is True
        target_gb = 10 if mode == 'off' else 12
        assert report['memory_gb'] == target_gb
        peak = report['maximum_sampled_request_peak_bytes_including_first_and_excluded']
        assert 0 < peak <= target_gb * 10**9
        slots = report['effective_pool_slots_by_arm']
        assert slots['reference'] == slots['combined'] and len(slots['combined']) == 1
        per_layer = slots['combined'][0] / 48
        low = constants['decodeLowExpertsPerLayer']
        high = constants['decodePlateauPerLayer']
        r0 = constants['decodeLowTokensPerSecond']
        r1 = constants['decodePlateauTokensPerSecond']
        estimate = (r1 if per_layer >= high else r0 * max(per_layer, 1) / low
                    if per_layer <= low else
                    r0 * (r1 / r0) ** (math.log(per_layer / low) / math.log(high / low)))
        metrics = report['measurement']['metrics']
        assert all(v['measured'] is True and v['clean_pairs'] >= 8 for v in metrics.values())
        assert metrics['client_seconds']['median_improvement_percent'] >= -5
        observations.append({
            'mode': mode, 'target_gb': target_gb,
            'effective_pool_slots': slots['combined'][0], 'experts_per_layer': per_layer,
            'unchanged_plain_decode_family_estimate_tps': estimate,
            'estimate_scope': 'Historical plain-decode guide; not an MTP-specific prediction or a guaranteed lower bound.',
            'active': {k: v for k, v in metrics['active_tps'].items() if k != 'samples'},
            'late': {k: v for k, v in metrics['late_tps'].items() if k != 'samples'},
            'sampled_peak_bytes_including_first_and_timing_exclusions': peak,
            'target_minus_sampled_peak_bytes': target_gb * 10**9 - peak,
            'extra_permanent_pool_credit_bytes': 0,
        })
        lifetime = read(BASE / f'final-lifetime-report-v599/{mode}-result.json')
        assert lifetime['binary_sha256'] == CANDIDATE and lifetime['requests'] == 60
        assert lifetime['assessment']['passed'] is True
        assert lifetime['memory_gb'] == target_gb
        assert lifetime['maximum_sampled_request_peak_bytes'] <= target_gb * 10**9
        lifetime_envelopes.append({
            'mode': mode, 'target_gb': target_gb, 'requests': lifetime['requests'],
            'resource_clean_requests': lifetime['resource_clean_requests'],
            'maximum_sampled_peak_bytes': lifetime['maximum_sampled_request_peak_bytes'],
            'maximum_active_growth_bytes': max(p['observed_growth_bytes']['mlxActiveEndBytes']
                                               for p in lifetime['assessment']['positions']),
            'maximum_physical_end_growth_bytes': max(p['observed_growth_bytes']['physicalFootprintEndBytes']
                                                      for p in lifetime['assessment']['positions']),
        })
    result = {
        'classification': 'Empirical envelope decision on completed exact final evidence; retain the existing conservative parameter family without new capacity or throughput credit.',
        'created_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'candidate_sha256': CANDIDATE, 'family': family, 'parameters': constants,
        'source_family_continuity': prior['source_family'],
        'short_request_resource_envelopes': prior['final_closed_paired_resource_envelopes'],
        'actual_context_ledger': prior['exact_final_context_ledger_observation'],
        'automatic_prefill_prerequisites': prefill['profiles'],
        'bounded_lifetime_envelopes': lifetime_envelopes,
        'bounded_sustained_observations': observations,
        'decision': {
            'retain_existing_parameter_values': True,
            'new_resident_capacity_credit_bytes': 0,
            'prefill_or_decode_multiplier_added': False,
            'reasoning': [
                'All observed final profiles fit their declared physical ceilings, including first requests and timing exclusions. The actual context rung also fits its allocation ledger.',
                'The fixed allowance covers the supported context and coexisting transient buffers. A lower short-request peak does not establish spare resident capacity at every supported context or during vision, rollback, and resize.',
                'Prefix reuse removes known prefill work. It does not accelerate processing unseen tokens and cannot multiply the general prefill throughput anchors.',
                'Automatic read scopes require particular chronological pass shapes and sufficient workspace. Their isolated benefit is not a uniform gain at every planner chunk or memory target.',
                'These two sustained profiles observe a narrow range of actual cache sizes. They do not identify a replacement curve, the high-cache plateau, a changed automatic MTP crossover, or another machine.',
                'Preserving byte-identical cost and throughput parameters preserves the verified coupled planner decisions and their derived tables. This is a measured retention decision, not a newly fitted curve.',
            ],
        },
        'limits': [
            '512-output sustained runs and 60-request lifetimes are bounded observations, not unbounded equilibrium or leak-freedom proofs.',
            'Physical sampling can miss short peaks; allocation ownership checks and conservative reserves remain required.',
            '10/12 GB sustained targets do not qualify an unrestricted 48 GB machine configuration, higher automatic targets, or other GPU/OS families.',
            'No energy reduction, uniform tokens-per-second gain, or new cold-SSD claim is inferred.',
        ],
        'empirical_calibration_decision_complete': True,
        'optimization_program_complete': False, 'activation_performed': False,
        'remaining': ['final all-37 artifact/claim/projection closure',
                      'exact source and local installation activation and verification'],
        'input_sha256': INPUTS, 'analysis_sha256': digest(__file__),
    }
    with target.open('x') as handle:
        json.dump(result, handle, indent=2, allow_nan=False)
        handle.write('\n')
    print(json.dumps({k: result[k] for k in (
        'family', 'bounded_sustained_observations', 'empirical_calibration_decision_complete',
        'optimization_program_complete', 'activation_performed')}, indent=2))


if __name__ == '__main__':
    main()

````````````

## Artifact SHA-256 f9aca465ebafd5b1980da931a13e2a21669998ccd3728beeee2fcccc1c2cf155

Encoding: `utf-8`. Original bytes: 2116.

````````````text
{
  "classification": "Unexecuted final report extractors follow the exact current cooled cohort and add the closed prefill evidence to calibration. No acceptance, mathematical family, runtime source or binary change.",
  "mtp_extractor_source": "/tmp/slotstream-optimization-execution/final-mtp-startup-report-v620/close.py",
  "mtp_extractor_only_change": "SOURCE -> final-mtp-cooled-evidence-v627/run.py",
  "calibration_previous_source": "/tmp/slotstream-optimization-execution/final-calibration-decision-v621/close.py",
  "calibration_changes": [
    {
      "old": "final-mtp-startup-report-v620/on-result.json",
      "new": "final-cooled-mtp-report-v630/on-result.json"
    },
    {
      "old": "else 'final-mtp-long-startup-v616'",
      "new": "else 'final-mtp-cooled-evidence-v627'"
    },
    {
      "old": "    prepared = read(PREPARATION / 'manifest.json')",
      "new": "    prefill = read(BASE / 'final-prefill-report-v622/result.json')\n    assert prefill['all192_responses_work_parity_geometry_and_sampled_caps_rechecked'] is True\n    assert prefill['original_descriptive_results_exactly_reproduced'] is True\n    for name, expected in prefill['input_sha256'].items():\n        assert digest(name) == expected, 'Prefill evidence changed: ' + name\n        INPUTS[name] = expected\n    prepared = read(PREPARATION / 'manifest.json')"
    },
    {
      "old": "        'actual_context_ledger': prior['exact_final_context_ledger_observation'],",
      "new": "        'actual_context_ledger': prior['exact_final_context_ledger_observation'],\n        'automatic_prefill_prerequisites': prefill['profiles'],"
    }
  ],
  "python_syntax_valid": true,
  "prior_sources_reconstruct_exactly": true,
  "mtp_result_exists": false,
  "calibration_result_exists": false,
  "source_sha256": {
    "/tmp/slotstream-optimization-execution/final-cooled-mtp-report-v630/close.py": "6ef37fae7baa12efc0d86b4e523bd618ab4aebd920ff141856e3f4d9a913b89c",
    "/tmp/slotstream-optimization-execution/final-calibration-decision-v631/close.py": "10574d3da371b2b0f9194f409b2ead968fbe9225c02363263bcb57fa45be13ca"
  }
}

````````````

## Artifact SHA-256 6ef37fae7baa12efc0d86b4e523bd618ab4aebd920ff141856e3f4d9a913b89c

Encoding: `utf-8`. Original bytes: 5032.

````````````text
"""Extract a completed original long cohort; never launch or rescore a study."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json

BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
SOURCE = BASE / 'final-mtp-cooled-evidence-v627/run.py'


def read(path):
    return json.loads(path.read_text())


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('mode', choices=('on',))
    args = parser.parse_args()
    target = SOURCE.parent / args.mode / 'execution'
    # A live or failed cohort cannot produce this completed qualification report.
    qualification = read(target / 'qualification.json')
    for key in ('passed', 'completed', 'qualified', 'proofs_unchanged',
                'cleanup_complete', 'within_reservation'):
        assert qualification.get(key) is True, key
    assert qualification.get('remaining_jobs') == []
    assert qualification.get('exit_code') in (0, 1)
    assert not qualification.get('error') and not qualification.get('cleanup_error')

    spec = importlib.util.spec_from_file_location('original_final_long', SOURCE)
    original = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(original)
    binding, protocol = original.load(args.mode)
    raw = original.OUT / args.mode
    assessment = original.assess_raw(raw, protocol, binding['proof']['build'])
    assert assessment == read(target / 'assessment.json')
    assert assessment['qualified'] is True
    receipt = read(target / 'receipt.json')
    expected = dict(receipt,
                    execution_receipt_sha256=digest(target / 'receipt.json'),
                    artifact_sha256=digest(target / 'artifact-sha256.json'),
                    activation_qualified=False)
    assert qualification == expected
    assert original.c.artifact_hashes(raw) == read(target / 'artifact-sha256.json')
    memory = read(target / 'memory.json')
    assert memory['exit_code'] == memory['child_exit_code'] == qualification['exit_code']
    assert memory['passed'] is (memory['exit_code'] == 0)
    assert not any(memory.get(key) for key in (
        'error', 'cleanup_error', 'group_cleanup_error', 'after_cleanup_error',
        'receipt_error_before_cleanup', 'receipt_error_after_cleanup'))
    assert memory.get('remaining_owned_members_after_cleanup') == []

    rows = [json.loads(line) for line in (raw / 'results.jsonl').read_text().splitlines()]
    assert qualification['exit_code'] == (0 if all(row['valid'] for row in rows) else 1)
    warmups = [read(raw / f'{row["round"]}-{row["arm"]}/warmup.json') for row in rows]
    all_work = rows + warmups
    report = {
        'mode': args.mode,
        'classification': 'Completed original 512-output cohort, original raw assessor and outer qualification both verified.',
        'build_identity': binding['proof']['build']['identity'],
        'comparison_basis': protocol['comparison_basis'],
        'memory_gb': protocol['memory_gb'],
        'measured_responses': len(rows),
        'first_responses': len(warmups),
        'outputs_per_response': original.study.OUTPUTS,
        'total_observed_output_tokens': sum(len(r['metrics']['output_ids']) for r in all_work),
        'effective_pool_slots_by_arm': {
            arm: sorted({r['metrics']['effective_pool_slots'] for r in rows if r['arm'] == arm})
            for arm in ('reference', 'combined')},
        'measurement': assessment['measurement'],
        'original_acceptance': assessment['acceptance'],
        'maximum_sampled_request_peak_bytes_including_first_and_excluded': max(
            original.c.bench.sampled_request_peak(r['metrics']['stats']) for r in all_work),
        'readiness_seconds_observed': sum(r['thermal_settle']['seconds'] for r in rows),
        'execution': {key: receipt[key] for key in
                      ('exit_code', 'elapsed_seconds', 'proofs_unchanged',
                       'cleanup_complete', 'within_reservation', 'remaining_jobs')},
        'original_executor_sha256': digest(SOURCE),
        'original_reporter_sha256': digest(Path(original.study.__file__)),
        'extraction_sha256': digest(Path(__file__)),
        'no_rerun_replacement_or_rescore': True,
        'optimization_program_complete': False,
        'activation_performed': False,
    }
    with (HERE / (args.mode + '-result.json')).open('x') as output:
        json.dump(report, output, indent=2, allow_nan=False)
        output.write('\n')
    print(json.dumps({
        'mode': args.mode,
        'outputs': report['total_observed_output_tokens'],
        'excluded_rounds': report['measurement']['excluded_rounds'],
        'metrics': {key: {k: v for k, v in value.items() if k != 'samples'}
                    for key, value in report['measurement']['metrics'].items()},
        'execution': report['execution'],
    }, indent=2, allow_nan=False))


if __name__ == '__main__':
    main()

````````````

## Artifact SHA-256 e5856108c718339298f5d7dc670d44f04ce5af8b18589bbe0de53afd8a4cb1e7

Encoding: `utf-8`. Original bytes: 477.

````````````text
{
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/run.py",
    "run",
    "--mode",
    "on",
    "--deadline",
    "2026-09-10T16:23:38.745315+00:00"
  ],
  "scope": "One complete frozen MTP-on cohort with 60-second cooldown plus 120 sampled nominal seconds per cell. All work and acceptance retained; no failed partial reuse, off rerun, replacement, retry or activation."
}

````````````

## Artifact SHA-256 628b2a5fec7506aca6bde5e99722fd5d3a3a0a0d031026f68c110d1db3f369ac

Encoding: `utf-8`. Original bytes: 2563.

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
RUNNER = BASE / 'final-mtp-cooled-evidence-v627/run.py'
sys.path.insert(0, str(ROOT / 'Tools'))
spec = importlib.util.spec_from_file_location('cooled_prelaunch_readiness', RUNNER.parent / 'driver/thermal_settle.py')
thermal = importlib.util.module_from_spec(spec)
spec.loader.exec_module(thermal)
assert not (RUNNER.parent / 'on/execution').exists()
assert not (ROOT / '.build/optimization/final-mtp-cooled-evidence-v627/on').exists()
qualification = json.loads((BASE / 'final-mtp-long-startup-v616/on/execution/qualification.json').read_text())
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
               'scope': 'One complete frozen MTP-on cohort with 60-second cooldown plus 120 sampled nominal seconds per cell. All work and acceptance retained; no failed partial reuse, off rerun, replacement, retry or activation.'},
              output, indent=2)
    output.write('\n')
print(json.dumps({'ready': result, 'launching': command}), flush=True)
os.execv(sys.executable, command)

````````````

## Artifact SHA-256 b8a7639147e25e07e4d28508f43554f8a03e7d0bcd6c564f6bec95463e7b85eb

Encoding: `utf-8`. Original bytes: 201.

````````````text
{
  "enabled": true,
  "reserved": true,
  "seconds": 121.435465334,
  "sampled_nominal_seconds": 121.405713917,
  "samples": 60,
  "before_launch_only": true,
  "request_acceptance_unchanged": true
}

````````````

## Artifact SHA-256 4b5de9bd51d4c1d66e4b69354c0ad7127125064ea920f9b72e7489073656bb48

Encoding: `utf-8`. Original bytes: 13236.

````````````text
{"seconds": 0.029751416999999995, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31044075520, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 2.090790417, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31243829248, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 4.148654667, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31238389760, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 6.200822084, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30841634816, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 8.255665417, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31326076928, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 10.315255749999999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31222235136, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 12.3545865, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31145099264, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 14.415101834, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31331287040, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 16.475123209, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31048990720, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 18.533081542, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31162105856, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 20.593023917, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31452856320, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 22.650495167000003, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31218270208, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 24.713579792, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31219761152, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 26.771717000000002, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31219548160, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 28.8302915, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31037538304, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 30.890950292, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31137447936, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 32.952201834, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31093096448, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 35.013547959, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31121620992, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 37.072344375, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31121571840, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 39.132585166999995, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31127715840, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 41.188667208999995, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31210094592, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 43.249718542, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31068618752, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 45.310309417, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31119966208, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 47.366664541999995, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31295815680, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 49.424463749999994, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31114182656, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 51.481556958999995, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31122784256, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 53.5394875, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31184093184, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 55.601369625, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31363809280, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 57.660219166999994, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31134056448, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 59.721890208999994, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31026561024, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 61.780615958999995, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31131992064, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 63.826295375, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31107792896, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 65.882089667, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31225757696, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 67.945111709, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31220973568, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 69.999931167, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31117918208, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 72.059330209, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31212830720, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 74.11856145899999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31200526336, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 76.16847175, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31178948608, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 78.223688334, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31424954368, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 80.28239624999999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31369641984, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 82.340963917, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31312494592, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 84.394725167, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31391432704, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 86.453974334, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31400509440, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 88.510222792, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31577784320, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 90.564585834, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31318720512, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 92.623725709, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31544147968, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 94.67922125, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31529795584, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 96.73504237499999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31486001152, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 98.793996584, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31521292288, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 100.853851292, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31416532992, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 102.913911709, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31458279424, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 104.9747035, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31455936512, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 107.028423959, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31425986560, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 109.088435584, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31462981632, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 111.143463042, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30898864128, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 113.20649095899999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31189991424, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 115.267458834, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31201509376, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 117.327228292, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30909480960, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 119.37415058399999, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31014502400, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 121.435465334, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30411390976, "swapins": 44362703, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}

````````````
