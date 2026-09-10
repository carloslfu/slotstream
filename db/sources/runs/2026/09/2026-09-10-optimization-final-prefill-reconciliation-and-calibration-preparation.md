---
type: run
id: 01m25npbjvjwww5mm56nq8m229
created: 2026-09-10T12:46:43.803723+00:00
updated: 2026-09-10T12:46:44.383398+00:00
summary: Closed automatic-prefill results reconciled and final calibration report prepared
binary: Prerequisite d3701afdb0540850f376ca9a696a2a0ffa31a67121362e341f87ebc9e27fd7dc; final candidate 9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673
captured_at: 2026-09-10
command: python3 final-prefill-report-v622/review.py; model-free calibration report syntax and exact source preimage review
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Closed automatic-prefill results reconciled and final calibration report prepared
tool: Slotstream exact native and source qualification capture
---
The three completed automatic-prefill prerequisite reports reproduce exactly from their original saved rows. All 192 first/measured responses retain full work, paired IDs/text, chronological compute geometry and sampled physical caps. Public plans still select the actual 256/512/1024 pass sizes at 10/12/16 GB and matched pools of 961/1491/2576 slots. These are prerequisite mechanism results, not a new final-build comparison. The two smaller targets use more temporary process memory. Existing complete run evidence remains authoritative.

V621 prepares a final empirical envelope decision that refuses to run before both exact sustained reports exist. Its syntax and all 150 shared source preimages pass review and the exact unapplied activation patch still applies. No calibration result, extra memory credit, source activation, model launch or install occurs. Its then-pending V616 binding is superseded after the thermal failure captured separately; the unused script is retained as preparation history.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-calibration-decision-v621/close.py",
    "bytes": 9926,
    "sha256": "2d5ce79a68a103cce81321942d877b5a05d047a4bf23c472bc96a5e37a9a27e5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-calibration-decision-v621/preparation.json",
    "bytes": 504,
    "sha256": "de9a10c4ed8d71b96807155756535310024cecee07b43f098b32c0d6ebbc9abc"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-prefill-report-v622/result.json",
    "bytes": 38524,
    "sha256": "da1650bf40d1173097a8c215da7a1959024667b70de2a121bbe777933f583da0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-prefill-report-v622/review.py",
    "bytes": 6432,
    "sha256": "31148716adbb3dcb82ad63e4e5e20f8883b33ee6740eea8cde2d2c021dc28c74"
  }
]
```

## Artifact SHA-256 2d5ce79a68a103cce81321942d877b5a05d047a4bf23c472bc96a5e37a9a27e5

Encoding: `utf-8`. Original bytes: 9926.

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
        'on': read(BASE / 'final-mtp-startup-report-v620/on-result.json'),
        'off': read(BASE / 'final-long-report-v608/off-result.json'),
    }
    prior = read(BASE / 'final-calibration-envelope-v603/result.json')
    for name, expected in prior['input_sha256'].items():
        assert digest(name) == expected, 'Calibration input changed: ' + name
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
                           else 'final-mtp-long-startup-v616')
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

## Artifact SHA-256 de9a10c4ed8d71b96807155756535310024cecee07b43f098b32c0d6ebbc9abc

Encoding: `utf-8`. Original bytes: 504.

````````````text
{
  "captured_utc": "2026-09-10T12:32:59.922329+00:00",
  "classification": "Model-free preparation only; final calibration is not executed while MTP-on remains live.",
  "analysis_sha256": "2d5ce79a68a103cce81321942d877b5a05d047a4bf23c472bc96a5e37a9a27e5",
  "python_syntax_valid": true,
  "shared_source_preimages_match": true,
  "source_inputs": 150,
  "exact_patch_still_applies": true,
  "activation_performed": false,
  "final_result_exists": false,
  "required_terminal_on_report_exists": false
}

````````````

## Artifact SHA-256 da1650bf40d1173097a8c215da7a1959024667b70de2a121bbe777933f583da0

Encoding: `utf-8`. Original bytes: 38524.

````````````text
{
  "classification": "Original three automatic-prefill prerequisite reports independently reproduced from their complete saved rows; no new inference or rescoring.",
  "profiles": [
    {
      "planner_chunk": 256,
      "target_gb": 10,
      "fixed_pool_slots": 961,
      "prompt_tokens": 1027,
      "output_tokens": 16,
      "first_and_measured_responses": 64,
      "maximum_sampled_peak_bytes": 8012975272,
      "clean_measured_pairs": 14,
      "clean_first_and_measured_pairs": 13,
      "metrics": {
        "request_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 14,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            6,
            7
          ],
          "median_reference": 14.217511062499966,
          "median_combined": 11.032386999999972,
          "median_improvement_percent": 21.892122229338796
        },
        "first_protocol_delta_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 14,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            6,
            7
          ],
          "median_reference": 12.11103258349982,
          "median_combined": 8.975965812500135,
          "median_improvement_percent": 25.65483411080369
        },
        "first_visible_text_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 14,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            6,
            7
          ],
          "median_reference": 12.11103258349982,
          "median_combined": 8.975965812500135,
          "median_improvement_percent": 25.65483411080369
        },
        "fresh_process_first_job_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 13,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            5,
            6,
            7
          ],
          "median_reference": 15.639058874999591,
          "median_combined": 12.456736125000134,
          "median_improvement_percent": 20.30221884435235
        },
        "prefill_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 14,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            6,
            7
          ],
          "median_reference": 12.1063861245,
          "median_combined": 8.9709796875,
          "median_improvement_percent": 25.66058850957055
        },
        "active_emission_tokens_per_second": {
          "unit": "tokens/second",
          "better": "higher",
          "clean_pairs": 14,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            6,
            7
          ],
          "median_reference": 7.147024940719544,
          "median_combined": 7.330356247052334,
          "median_improvement_percent": 1.0330498561391233
        },
        "decode_phase_tokens_per_second": {
          "unit": "tokens/second",
          "better": "higher",
          "clean_pairs": 14,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            6,
            7
          ],
          "median_reference": 7.620780965333179,
          "median_combined": 7.817232078515925,
          "median_improvement_percent": 1.0356387208254048
        },
        "sampled_process_peak_bytes": {
          "unit": "bytes",
          "better": "lower",
          "clean_pairs": 14,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            6,
            7
          ],
          "median_reference": 6864416128.0,
          "median_combined": 7975283916.0,
          "median_improvement_percent": -16.028924800976874
        },
        "active_tensor_bytes": {
          "unit": "bytes",
          "better": "lower",
          "clean_pairs": 14,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            6,
            7
          ],
          "median_reference": 5696310990.0,
          "median_combined": 5696130360.0,
          "median_improvement_percent": 0.0031709996226869652
        }
      },
      "scope": "Qualified automatic-prefill prerequisite candidate; not a new final-composition benchmark or sustained-throughput measurement."
    },
    {
      "planner_chunk": 512,
      "target_gb": 12,
      "fixed_pool_slots": 1491,
      "prompt_tokens": 2051,
      "output_tokens": 16,
      "first_and_measured_responses": 64,
      "maximum_sampled_peak_bytes": 9580268856,
      "clean_measured_pairs": 11,
      "clean_first_and_measured_pairs": 11,
      "metrics": {
        "request_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 11,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            3,
            5,
            8,
            12
          ],
          "median_reference": 19.728837249999742,
          "median_combined": 15.42967304100057,
          "median_improvement_percent": 18.649931460099246
        },
        "first_protocol_delta_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 11,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            3,
            5,
            8,
            12
          ],
          "median_reference": 17.64438541599975,
          "median_combined": 13.284941084000366,
          "median_improvement_percent": 20.905586537067133
        },
        "first_visible_text_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 11,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            3,
            5,
            8,
            12
          ],
          "median_reference": 17.64438541599975,
          "median_combined": 13.284941084000366,
          "median_improvement_percent": 20.905586537067133
        },
        "fresh_process_first_job_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 11,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            3,
            5,
            8,
            12
          ],
          "median_reference": 22.537909040999693,
          "median_combined": 17.34928200000013,
          "median_improvement_percent": 21.01184366732166
        },
        "prefill_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 11,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            3,
            5,
            8,
            12
          ],
          "median_reference": 17.635911792,
          "median_combined": 13.276897166,
          "median_improvement_percent": 20.913078529703412
        },
        "active_emission_tokens_per_second": {
          "unit": "tokens/second",
          "better": "higher",
          "clean_pairs": 11,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            3,
            5,
            8,
            12
          ],
          "median_reference": 7.1102820290522715,
          "median_combined": 7.1221053931520615,
          "median_improvement_percent": -0.4618070889098935
        },
        "decode_phase_tokens_per_second": {
          "unit": "tokens/second",
          "better": "higher",
          "clean_pairs": 11,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            3,
            5,
            8,
            12
          ],
          "median_reference": 7.582283922531094,
          "median_combined": 7.595134998367024,
          "median_improvement_percent": -0.46451268283846936
        },
        "sampled_process_peak_bytes": {
          "unit": "bytes",
          "better": "lower",
          "clean_pairs": 11,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            3,
            5,
            8,
            12
          ],
          "median_reference": 8464764264,
          "median_combined": 9527053672,
          "median_improvement_percent": -12.686041741463772
        },
        "active_tensor_bytes": {
          "unit": "bytes",
          "better": "lower",
          "clean_pairs": 11,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            3,
            5,
            8,
            12
          ],
          "median_reference": 7102974928,
          "median_combined": 7102925528,
          "median_improvement_percent": 0.000695483237667105
        }
      },
      "scope": "Qualified automatic-prefill prerequisite candidate; not a new final-composition benchmark or sustained-throughput measurement."
    },
    {
      "planner_chunk": 1024,
      "target_gb": 16,
      "fixed_pool_slots": 2576,
      "prompt_tokens": 4099,
      "output_tokens": 16,
      "first_and_measured_responses": 64,
      "maximum_sampled_peak_bytes": 13257035496,
      "clean_measured_pairs": 6,
      "clean_first_and_measured_pairs": 6,
      "metrics": {
        "request_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 6,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            2,
            3,
            4,
            7,
            8,
            11,
            14,
            15,
            16
          ],
          "median_reference": 24.63215843749981,
          "median_combined": 20.219215833499902,
          "median_improvement_percent": 16.70375455058452
        },
        "first_protocol_delta_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 6,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            2,
            3,
            4,
            7,
            8,
            11,
            14,
            15,
            16
          ],
          "median_reference": 22.71195539600012,
          "median_combined": 18.398137729499922,
          "median_improvement_percent": 17.94164236496565
        },
        "first_visible_text_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 6,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            2,
            3,
            4,
            7,
            8,
            11,
            14,
            15,
            16
          ],
          "median_reference": 22.835593229000096,
          "median_combined": 18.51196285449987,
          "median_improvement_percent": 17.824754200492016
        },
        "fresh_process_first_job_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 6,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            2,
            3,
            4,
            7,
            8,
            11,
            14,
            15,
            16
          ],
          "median_reference": 28.886650208000447,
          "median_combined": 24.04607831250007,
          "median_improvement_percent": 16.26686964140962
        },
        "prefill_seconds": {
          "unit": "seconds",
          "better": "lower",
          "clean_pairs": 6,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            2,
            3,
            4,
            7,
            8,
            11,
            14,
            15,
            16
          ],
          "median_reference": 22.694848583499997,
          "median_combined": 18.381660938,
          "median_improvement_percent": 17.94799964900455
        },
        "active_emission_tokens_per_second": {
          "unit": "tokens/second",
          "better": "higher",
          "clean_pairs": 6,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            2,
            3,
            4,
            7,
            8,
            11,
            14,
            15,
            16
          ],
          "median_reference": 7.975569871494267,
          "median_combined": 8.384490065557614,
          "median_improvement_percent": 3.1069224546734775
        },
        "decode_phase_tokens_per_second": {
          "unit": "tokens/second",
          "better": "higher",
          "clean_pairs": 6,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            2,
            3,
            4,
            7,
            8,
            11,
            14,
            15,
            16
          ],
          "median_reference": 8.504875848341147,
          "median_combined": 8.941051083455696,
          "median_improvement_percent": 3.1073176678942938
        },
        "sampled_process_peak_bytes": {
          "unit": "bytes",
          "better": "lower",
          "clean_pairs": 6,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            2,
            3,
            4,
            7,
            8,
            11,
            14,
            15,
            16
          ],
          "median_reference": 13227134636.0,
          "median_combined": 12667047284.0,
          "median_improvement_percent": 4.164014223809054
        },
        "active_tensor_bytes": {
          "unit": "bytes",
          "better": "lower",
          "clean_pairs": 6,
          "minimum_pairs": 5,
          "measured": true,
          "excluded_or_unavailable_rounds": [
            1,
            2,
            3,
            4,
            7,
            8,
            11,
            14,
            15,
            16
          ],
          "median_reference": 10216131280.0,
          "median_combined": 10216180440.0,
          "median_improvement_percent": -0.00048119976783222995
        }
      },
      "scope": "Qualified automatic-prefill prerequisite candidate; not a new final-composition benchmark or sustained-throughput measurement."
    }
  ],
  "all192_responses_work_parity_geometry_and_sampled_caps_rechecked": true,
  "original_descriptive_results_exactly_reproduced": true,
  "limits": [
    "Profile-specific gains cannot be added to final combined short-request or prefix-reuse percentages.",
    "The 10 and 12 GB profiles use more temporary request memory; those are not memory-saving results.",
    "Six clean pairs support the original 16 GB acceptance; they do not support a population tail estimate.",
    "These studies qualify the automatic-scope mechanism before final default composition, not the final build by themselves."
  ],
  "activation_performed": false,
  "input_sha256": {
    "/tmp/slotstream-optimization-execution/final-prefill-report-v622/review.py": "31148716adbb3dcb82ad63e4e5e20f8883b33ee6740eea8cde2d2c021dc28c74",
    "/Users/carlos/Projects/slotstream/Tools/optimization_results.py": "e2c5e813835792b1d0cfd28fb836528f556fb3d0219ea801570f2d00b7b9e8f3",
    "/tmp/slotstream-optimization-execution/public-plan-observed-cohort-v515/planner-256/protocol.json": "8b233276727c95fe472b1e690f882aef556fae4d208f2ce870b488a8da56312c",
    "/tmp/slotstream-optimization-execution/public-plan-observed-cohort-v515/planner-256/execution/qualification.json": "b0d7f96a45efd9d358384e9092bc356f3fece0c3cd135bae69b983dd28161a9a",
    "/tmp/slotstream-optimization-execution/public-planner-terminal-v513/planner-256/audit.json": "700c9367e87974297cd5168ebb71d25983b55b3a4aee0ad9095cf2a6f99e47f9",
    "/tmp/slotstream-optimization-execution/public-planner-terminal-v513/planner-256/descriptive-metrics.json": "ab9d7efa66817fb00d949fb892d39f436797666da09b40a97f8a48db49f84861",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/results.jsonl": "8577ae3f77648c5b32cb07738e93562ce2ca53e82b574c913ae0900844d21755",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/1-reference/warmup.json": "41c7ab68b1c739c572afc98f68231602e9af8148255ed01b9dec067d3e0093bb",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/1-automatic/warmup.json": "e2e02a1760f5a4d9655109110b9cd70b38ff50be2811be1f2e75b25b1caa652f",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/2-automatic/warmup.json": "418ad73003407cb0df417327df26134c12eee2fe81336fdbc71cf17ab1006d25",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/2-reference/warmup.json": "2b25f34dc26f792cd69f7d096332ca14a3c88f3959d7edb2e5d49a46c4e7d1a7",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/3-reference/warmup.json": "f657fdd2d196e8ded70b0fb8fa81c58d08ec30115ffe4b490ac18772b177c81b",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/3-automatic/warmup.json": "a9510ed134a66caa826233e50a252f3e4705085e94514011e530416fe783a0f7",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/4-automatic/warmup.json": "73d77f0dfda6af6662b6dc7cc446898dda5d42f918f1d34908eb9d49dbd9ffd7",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/4-reference/warmup.json": "3446637cbba55c210a3178c037ebc070552f0c9dd1d10b25a74896dc70ba0801",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/5-reference/warmup.json": "0d7d3f1913a9ff21e31394efb58054d20b9ec3ef0ab498671b890e03cfee3bc5",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/5-automatic/warmup.json": "d3a1dad6c7966d781c88efc7d95a816cd4c88ac2e3641a2b8fd1162de05d2853",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/6-automatic/warmup.json": "e8252d94d7f0d7f0d3b49ea7bdaca8e532e587740c6b434561ac38d7c3bc4900",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/6-reference/warmup.json": "04e10c6c9d52fdd77b3fcc3642d3d639a630a2455b409367ad53d844f961879d",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/7-reference/warmup.json": "8ddc2b209d08d5f6f66623d6e1d4e8b7ca2f3abf00e71c9bd9bee31b2d33d85e",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/7-automatic/warmup.json": "32dd3f64ec0346224bf994b8497bdb6ea62b0bc319fcc12edf16013e36845c43",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/8-automatic/warmup.json": "321ddd1bb9536da7a6fdeb8d8353f0a59cdf397951f2b41ecd0e6928caefeffb",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/8-reference/warmup.json": "a5dc162e10e990902eb9e3e024f24bddc7c46a1cd3896a89657b6b5adb4b0406",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/9-reference/warmup.json": "328e96a79ee7bf0d8345b61994c908be829883947005b793253758d5898ef476",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/9-automatic/warmup.json": "0abe92aaf20b6776f50350e5188cbdba8cb54075b35d7016731faed7112d857a",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/10-automatic/warmup.json": "914d657ede8a11259b32fd8d31af2c8dbcc90923b33a1cc1aac3f7abb8796076",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/10-reference/warmup.json": "960fd52d7db12abc08b3981e0085c7d6424f219a4d192983f34dcbe5f9266f67",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/11-reference/warmup.json": "ea2edb6c1f0cbf1b2b04fc9f707f65f7fa991a637371ac4e047685dab733135c",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/11-automatic/warmup.json": "9c648a3b6e42b0c03a63570692d7c939f87d3d2955d05ab53d65584ec0ea8281",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/12-automatic/warmup.json": "382b5c0efe19e98b5c093390e3c0536018b68060484ccb971d1bf5b552ac4365",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/12-reference/warmup.json": "3454c36f28491a4c14916c46e74471ed27be0ae06b22e548efebc194bf5f378d",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/13-reference/warmup.json": "e1107c29a43029af1848cc25ba7a93511da8b7bd557831828e8e692beecb5875",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/13-automatic/warmup.json": "05896014cb7c760329f99ecd935b48aaa31d1d1251a10d5d14451536fe08f884",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/14-automatic/warmup.json": "b172408279463140b6f751affa51742473ee945e94a618c48ccba5094fda8803",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/14-reference/warmup.json": "7ae5f0aa0ffb1c4753a691a03d46e0412610c7f468cebba0400eb9db7be4b99e",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/15-reference/warmup.json": "f5f44e7cc2a3de8e91ee1e9d460feb308079a0495bfd5e47e26bfe442ddccf9b",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/15-automatic/warmup.json": "0cb53dc1f7f3cd79c6a19461cb416ccea074b53194b29ff05b0732cacb8a96a2",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/16-automatic/warmup.json": "e400bb89f3298241252a0518a7a7461ad90840c18d985ba50db162e668a94447",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-plan-observed-cohort-v515/planner-256/16-reference/warmup.json": "a40d22fe669bae5b3fef9c688566c504c9a40a90080f870769e9f54a87a71ebc",
    "/tmp/slotstream-optimization-execution/public-planner-swapin-exclusion-cohort-v546/planner-512/protocol.json": "e6cd555654a1721417d56e6d3324344faa277e609ac693f544b4875d34fc0c79",
    "/tmp/slotstream-optimization-execution/public-planner-swapin-exclusion-cohort-v546/planner-512/execution/qualification.json": "48956b02f6d0aa54a60267587dc444370d55e81334b60bed7c8112cec1c37725",
    "/tmp/slotstream-optimization-execution/public-planner-swapin-terminal-v547/planner-512/audit.json": "01800f0aa8c40919781857a425f64b259122998ef16b9b3ff3198fe9f51ae4fd",
    "/tmp/slotstream-optimization-execution/public-planner-swapin-terminal-v547/planner-512/descriptive-metrics.json": "15503481806675aad9c276716df78e734bc834e70e74f7df87725f1c11dd8088",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/results.jsonl": "af712b63c361fa037436079896c702c296effcd5886efb998adb6a12ebf5bed7",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/1-reference/warmup.json": "a71010501b35c6eb3f2833102d378c2896721a041aa43d0e53f031d45d7d4202",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/1-automatic/warmup.json": "8693819eeb35de50de9a9c609e1d0e5ac4293b4b6039cf1594247d6072af48c9",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/2-automatic/warmup.json": "214eaca72f49aac9da468e8200ecc276e129604d811d2910bd44afbe9211b5d8",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/2-reference/warmup.json": "64f86b4812e4f903e1a0a77f14d982b2092375bf7d46d59e51de45771a6eefc5",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/3-reference/warmup.json": "175aa65ae9f8f87e00750eb0f40cb3e2ddec1ba5b2542a27f5c522148ec3d1da",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/3-automatic/warmup.json": "cfc3754c8ca4421935667cf894cf7977bd788cfb5a063e839781ca4916920804",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/4-automatic/warmup.json": "d8552ad54f49a31551ebfe27ac5af70b3f521929fadd111c70a29be7cd57005e",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/4-reference/warmup.json": "6e269615d0f00bec8808ec5827899008f4c691306215bbfe057efc5f2983859c",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/5-reference/warmup.json": "03b11e0dd64600746bbc50aecadc6f77480e201ab30b6dcf1c67a7a9140601db",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/5-automatic/warmup.json": "3d30d43f2059c87d735e1fe566de52476e8be18373ac314d4f854278d249b146",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/6-automatic/warmup.json": "318224d92d51a64f561a54d24a91528f9fb07f1bf79f230581ff9b00e63a6b7f",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/6-reference/warmup.json": "5d8ebb09d6075f74bb876e4b05054c77e9cd9394c40e4e7431e1c91a716f7045",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/7-reference/warmup.json": "d0963250beca402eff7fdf098df5455d62b63dfa7e2a9d951bc980af8994f21c",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/7-automatic/warmup.json": "3ba169733c4ce3d239ae9144ecc34f740b035704218c19e62593635981a6a31e",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/8-automatic/warmup.json": "a207bd4327b52bc4a2e1e44bd71c1789e3f8b3be21b711d71ab8ba552044e61d",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/8-reference/warmup.json": "e4dd0cf92d46feca056a2cea10af2f138bb45b1ed3ff5bb2bbd0da9f540e9333",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/9-reference/warmup.json": "9a6aa30863f3be788317767512a1e6700ccc511b7f186a384603e75998d291b6",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/9-automatic/warmup.json": "225bd44d779827ddf30fbfdbcd8aca07c07da3a0356783817fe639d11e32d551",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/10-automatic/warmup.json": "3a5c270e7b566e43c2fc8fc6e376abdc4754c149dfee96f35ef849afad731f9a",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/10-reference/warmup.json": "e24b3013fb716695ee1c6c9b016a7c8374bd059bfbf88a1cd1e887dfae1f268a",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/11-reference/warmup.json": "4c51206eb8bed064940eaddd1f0555404eb0a152b1f6227a0fa0dc54cec2ec45",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/11-automatic/warmup.json": "98c0bd16674ccd57ce4c4924dd7113333f8f239e8983ee4f4e714c6f8ddbff78",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/12-automatic/warmup.json": "1e4f6b4a5152e69c3ca38a7e4d347f92b82cb969b12d1b4172b5ba2d8d59b3a1",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/12-reference/warmup.json": "fc8ac44ff67e62dcd947f6797bf41e93a1a3f5be404decddceb5ec15c320cc0e",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/13-reference/warmup.json": "81d2e06abaec135c9f7a355c6cc07bfefc6fd0fbb55700282f03dda4a949f7b3",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/13-automatic/warmup.json": "8d521c9f46eafd802d0505d84a73c1cdecc58593c1ee0235099b7f49e90f3521",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/14-automatic/warmup.json": "bba2315405ade8dfb7e3bf6214c0b8b5adb64aaa7177b254091472e5bf776d5d",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/14-reference/warmup.json": "b395dedabbb733d8c9cc732a639981ade7cf5c46a1008aacc04fc6386a7ad3c9",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/15-reference/warmup.json": "3172385db0bb4809fd86709a42934455cf1bd343a7d6ec9f90b0aa5bc4db4b37",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/15-automatic/warmup.json": "0e9025fd7fc6017a9dc46b786e6f28a9c51869e1866ab0d58d1977641b09e948",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/16-automatic/warmup.json": "5b0ff17f42699d9704a8367043450671ee8e7b54363eaa04deff6a6cc63b72d8",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-512/16-reference/warmup.json": "441ba3aa352c47cbde2c005d0779c900ceec323da012611ab30f07412748e5bc",
    "/tmp/slotstream-optimization-execution/public-planner-swapin-exclusion-cohort-v546/planner-1024/protocol.json": "f8fac3d0b956d62c3733d6237504bc54a56c686fd2e452aa2731719b24b75568",
    "/tmp/slotstream-optimization-execution/public-planner-swapin-exclusion-cohort-v546/planner-1024/execution/qualification.json": "82d42970da90aaa96c16ad7a4545ef4474885613aca95d91538b431b2e79ede5",
    "/tmp/slotstream-optimization-execution/public-planner-swapin-terminal-v547/planner-1024/audit.json": "01cb77e09c69ef16892abc37cd473997e13053def27aa85fbf3d6f38ea84adbc",
    "/tmp/slotstream-optimization-execution/public-planner-swapin-terminal-v547/planner-1024/descriptive-metrics.json": "ebee41aa10af694b2731c7e756d5f3dfd2a0d30db92c848e6ffbd76cbdbebdb7",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/results.jsonl": "8879f9ff8b79f8d76ddb8cbcc4610c9db06cb0c3d390a4f1524142c5fefda49e",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/1-reference/warmup.json": "4d99a0f1ddabc75717e6324c441f0d6f12dbdc28661e5051cf7783df1f5733f8",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/1-automatic/warmup.json": "e7e8488ce20f3990802e5689458de9a5c685f6743342a999aeb2406495c7c3d2",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/2-automatic/warmup.json": "db819c561224895833cc369537c646eeb9c8262fcbbde085400ef3eb285813e8",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/2-reference/warmup.json": "42d059d1598762c136c6bf1d69eb9bb7bfdfb4ad6f460f5792100224eca0bd78",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/3-reference/warmup.json": "bc9f21e63010172f1f8c27c302621662925679a1ca52c7d5cd6c66d1b2602169",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/3-automatic/warmup.json": "35018d34a1faf14193f2981ef3408df565c295101247e36d5f56a66cf850bff0",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/4-automatic/warmup.json": "14a836b2095768c5150b07cc9d15d5388ab024f0f7e0d99b6e1d16992dcfae60",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/4-reference/warmup.json": "cd211663f3d4c91bc2c58cbbdc8190d2c24c09cc9cd5fd35735fddcf3f29752e",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/5-reference/warmup.json": "7e7c4c623e1d5cb0a40fc08e87ade3e0162ba907cc2e6e26cb0426d324c47902",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/5-automatic/warmup.json": "de624a35b45594c4f6a6cbee7a1fe028ac03855a84992ba12b1e16e4789a4a1b",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/6-automatic/warmup.json": "934cd6b5d1b24f6be9c1a2c608ed57328b339d998c4996ae7c43aedf6f471f34",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/6-reference/warmup.json": "ccd94d9eac3ccf94ced045d24a349546b3c6bad843f1e5ee5d6dc8150cb501de",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/7-reference/warmup.json": "0391e6c7c5a60dc94d2c73cb31fe83ea92d271e708afb8672215d479136e0f0b",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/7-automatic/warmup.json": "e1afb5723787d7cab492486e00d1c39f78a0ca26fa543a2b5cc3c6546fba88e2",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/8-automatic/warmup.json": "124f1513f87eda059221551ac5b1fc76f9f3a7915d9bd2359115f5ba5475fa69",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/8-reference/warmup.json": "6d425876055066c11b037126e6548e6fe93499361dabaf4a3ab395ff2e3378d9",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/9-reference/warmup.json": "e7260dc7ff184449d539b9e414ab30cc1d5cab1b1c96c4594ca0e7aa9b1873ad",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/9-automatic/warmup.json": "cbaacab592f02787888dc18e336db6a23f59bc90b3c78e383066cc5d6cf3a435",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/10-automatic/warmup.json": "fe84ff383f0ef647ee730b2896559f88f8d12cc1da56a43fb9005f477477d732",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/10-reference/warmup.json": "81789f74e94ffb609d5f7e37ae3986356f323f46c511d7b43b2aec9c5f14eb9f",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/11-reference/warmup.json": "4ede3aa73a74ce4c2a61cf85f23d79f71f16fde316c3eadd1d5fee9431b24629",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/11-automatic/warmup.json": "640424c91ecc5228774798c04c324d7c2ada624875d0e33cf41443927eb4b2be",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/12-automatic/warmup.json": "4400d67765397569a5bb06eb37ae29d5f6532adacf988c87a325bad11977ac85",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/12-reference/warmup.json": "f5ec861048bb3b7f7e875257b552277fc99357d403dc7cc1fcd963226671a175",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/13-reference/warmup.json": "631a49a4736a31472e98b1e04e1960f121cf6ebcac9ce3d03b5003a6f86fddbc",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/13-automatic/warmup.json": "c7bc88ab1bca21efc05ec45abe314c3bdb7f44cb67e505fa0e07beccacfed050",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/14-automatic/warmup.json": "2ac33e9ac610ee974e17dd05dab68e7ebfc9d97db910d79cc9a60c237625481e",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/14-reference/warmup.json": "cb0d47f38625b34f8e7f478cd30d81d58f221543f9ddee09ca36841562fc602e",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/15-reference/warmup.json": "ade6fd390e9c51cad34fdfb4a8f9e3bb1827474df26d464fced422638d91de6b",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/15-automatic/warmup.json": "94c6de7555a4ac1ee815e37b3cbc30387149a70c538771d6d5b6e818d8ec07f9",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/16-automatic/warmup.json": "74a408d2b484ec7b47a1bd84a3533305d250d97940586d5c66f56f57b85cb52b",
    "/Users/carlos/Projects/slotstream/.build/optimization/public-planner-swapin-exclusion-cohort-v546/planner-1024/16-reference/warmup.json": "0454a8d6cccf05a386a4c279ef031bee8564308b803cb64ca366e1f7cfddad5c"
  }
}

````````````

## Artifact SHA-256 31148716adbb3dcb82ad63e4e5e20f8883b33ee6740eea8cde2d2c021dc28c74

Encoding: `utf-8`. Original bytes: 6432.

````````````text
"""Reconcile the three completed automatic-prefill prerequisites from raw rows.

No benchmark, control, acceptance criterion, or final-composition claim changes.
"""
from pathlib import Path
import hashlib
import json
import sys

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / 'Tools'))
import optimization_results as reporter


def read(path):
    return json.loads(path.read_text())


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


rows_out = []
inputs = [Path(__file__), Path(reporter.__file__)]
for chunk, target, slots, folder, audit_folder in (
    (256, 10, 961, 'public-plan-observed-cohort-v515', 'public-planner-terminal-v513'),
    (512, 12, 1491, 'public-planner-swapin-exclusion-cohort-v546', 'public-planner-swapin-terminal-v547'),
    (1024, 16, 2576, 'public-planner-swapin-exclusion-cohort-v546', 'public-planner-swapin-terminal-v547'),
):
    name = f'planner-{chunk}'
    raw = ROOT / '.build/optimization' / folder / name
    protocol_path = BASE / folder / name / 'protocol.json'
    qualification_path = BASE / folder / name / 'execution/qualification.json'
    audit_path = BASE / audit_folder / name / 'audit.json'
    descriptive_path = BASE / audit_folder / name / 'descriptive-metrics.json'
    protocol = read(protocol_path)
    qualification = read(qualification_path)
    audit = read(audit_path)
    descriptive = read(descriptive_path)
    rows_path = raw / 'results.jsonl'
    rows = [json.loads(line) for line in rows_path.read_text().splitlines()]
    inputs.extend((protocol_path, qualification_path, audit_path, descriptive_path, rows_path))
    assert audit['results_sha256'] == descriptive['results_sha256'] == digest(rows_path)
    assert audit['protocol_sha256'] == digest(protocol_path)
    assert audit['terminal_receipt_sha256'] == digest(qualification_path)
    assert descriptive['reporter_sha256'] == digest(Path(reporter.__file__))
    assert audit['assessment']['qualified'] is True and qualification['qualified'] is True
    assert qualification['cleanup_complete'] is True and qualification['remaining_jobs'] == []
    assert len(rows) == 32 and protocol['memory_gb'] == target
    assert protocol['comparison_basis'] == 'fixed-pool'
    mapped = [dict(row, arm='combined' if row['arm'] == 'automatic' else row['arm'])
              for row in rows]
    metrics = {key: reporter.summarize_metric(mapped, key) for key in reporter.METRICS}
    assert metrics == descriptive['metrics'], 'Original descriptive calculation differs'
    assert [(r['round'], r['arm']) for r in rows] == [
        (n, a) for n in range(1, 17)
        for a in (('reference', 'automatic') if n % 2 else ('automatic', 'reference'))]
    observed = {}
    peaks = []
    for row in rows:
        coordinate = (row['round'], row['arm'])
        path = raw / f'{coordinate[0]}-{coordinate[1]}' / 'warmup.json'
        warm = read(path)
        inputs.append(path)
        observed[coordinate] = (warm, row)
        assert row['public_plan']['pool_slots'] == slots
        assert row['public_plan']['prefill_chunk'] == chunk
        assert row['public_plan']['target_gb'] == target
        for response in (warm, row):
            metric = response['metrics']
            assert len(metric['prompt_ids']) == 4 * chunk + 3
            assert len(metric['output_ids']) == metric['stats']['decodeTokens'] == 16
            assert metric['effective_pool_slots'] == slots
            assert metric['effective_prefill_chunk'] == chunk
            peak = metric['stats']['sampledFootprint']['peakBytes']
            assert 0 < peak <= target * 10**9
            peaks.append(peak)
    for n in range(1, 17):
        for a, b in zip(observed[n, 'reference'], observed[n, 'automatic']):
            for field in ('prompt_ids', 'output_ids'):
                assert a['metrics'][field] == b['metrics'][field]
            assert a['text'] == b['text']
            assert a['metrics']['stats']['prefillComputePasses'] == b['metrics']['stats']['prefillComputePasses']
    assert max(peaks) == audit['maximum_observed_sampled_peak_bytes']
    rows_out.append({
        'planner_chunk': chunk, 'target_gb': target, 'fixed_pool_slots': slots,
        'prompt_tokens': 4 * chunk + 3, 'output_tokens': 16,
        'first_and_measured_responses': len(peaks),
        'maximum_sampled_peak_bytes': max(peaks),
        'clean_measured_pairs': len(audit['clean_measured_pairs']),
        'clean_first_and_measured_pairs': len(audit['clean_first_and_measured_pairs']),
        'metrics': {key: {k: v for k, v in value.items() if k != 'samples'}
                    for key, value in metrics.items()},
        'scope': 'Qualified automatic-prefill prerequisite candidate; not a new final-composition benchmark or sustained-throughput measurement.',
    })

result = {
    'classification': 'Original three automatic-prefill prerequisite reports independently reproduced from their complete saved rows; no new inference or rescoring.',
    'profiles': rows_out,
    'all192_responses_work_parity_geometry_and_sampled_caps_rechecked': True,
    'original_descriptive_results_exactly_reproduced': True,
    'limits': [
        'Profile-specific gains cannot be added to final combined short-request or prefix-reuse percentages.',
        'The 10 and 12 GB profiles use more temporary request memory; those are not memory-saving results.',
        'Six clean pairs support the original 16 GB acceptance; they do not support a population tail estimate.',
        'These studies qualify the automatic-scope mechanism before final default composition, not the final build by themselves.',
    ],
    'activation_performed': False,
    'input_sha256': {str(path): digest(path) for path in inputs},
}
with (HERE / 'result.json').open('x') as output:
    json.dump(result, output, indent=2, allow_nan=False)
    output.write('\n')
print(json.dumps({'profiles': [{k: row[k] for k in (
    'planner_chunk', 'target_gb', 'fixed_pool_slots', 'clean_measured_pairs',
    'maximum_sampled_peak_bytes')} | {
        'paired_improvements': {k: row['metrics'][k]['median_improvement_percent'] for k in (
            'request_seconds', 'first_visible_text_seconds', 'prefill_seconds', 'sampled_process_peak_bytes')}}
    for row in rows_out], 'original_metrics_exactly_reproduced': True}, indent=2))

````````````
