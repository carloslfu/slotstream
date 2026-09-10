---
type: run
id: 01m25j26kkpgrp6c7kn0f4tbyc
created: 2026-09-10T11:43:17.619051+00:00
updated: 2026-09-10T11:43:17.992928+00:00
summary: Final MTP-on long cohort refuses incompatible legacy large-memory protocol before model launch
binary: 9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673
captured_at: 2026-09-10
command: Original final-long-adaptive-schedule-v581 MTP-on run
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Final MTP-on long cohort refuses incompatible legacy large-memory protocol before model launch
tool: Slotstream exact native and source qualification capture
---
The original MTP-on512-output/12GB study stops before creating a raw manifest or launching a model. The serving driver rejects the missing large-memory purpose declaration. Direct source inspection also shows the legacy large-pool profile permits only raw text with at most64outputs and a2048-byte fixture, whereas the frozen intended long workload uses chat framing,512outputs and2783fixture bytes. The outer receipt reports the absent manifest after that delivery refusal, remains unqualified, and proves cleanup with no remaining jobs. No inference failure, timing result, replacement data or completed MTP-on cohort is claimed. A future correction must support the exact complete frozen workload without weakening its12GB cap, output/parity/VM checks, full repetitions or cleanup.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/binding.json",
    "bytes": 12078,
    "sha256": "4dc80d43155fcf525d87f336219aca84efab42212e8f08d2d4bf6682ee686f47"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/long-on/completion.json",
    "bytes": 21,
    "sha256": "56296949d3a02e635b050fd6b4762f0f0b52c23d05b925203095f7daf8e19027"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/long-on/launch.json",
    "bytes": 269,
    "sha256": "62918d8ac02e3c2ba5232f114f2fa9e95acef6b8a87ce730e57d0642aab74143"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/long-on/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/long-on/stdout.txt",
    "bytes": 800,
    "sha256": "0f6015f8a0a1b6b85eda2d7e713cb7cd300f28fa1638a5ab8540450ef0fb6156"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/long-on-freeze/completion.json",
    "bytes": 21,
    "sha256": "81868a6e94ffc0178bf833deb1c9013d9fab4ee95ddb876a5e8ec4f1d26376d2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/long-on-freeze/launch.json",
    "bytes": 329,
    "sha256": "87bb9518726240d3fd4938ec2e11acf79e1ee6db7c54b11ace4348fefeed8029"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/long-on-freeze/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/long-on-freeze/stdout.txt",
    "bytes": 136,
    "sha256": "006887783eaf11863f0f1e43ef35d1b10a080074164fb26966b172fa9426191e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/long-on-readiness/result.json",
    "bytes": 211,
    "sha256": "b1b1568c35063ccf105d39d00c1ff4ab8037f4175bcb6e0458e978993ee7fb1d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/long-on-readiness/samples.jsonl",
    "bytes": 13459,
    "sha256": "a0263bf27e7afb7ea4fc49698830ca8967eea8728a6a28a742283d7c37c4200d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/run.py",
    "bytes": 6561,
    "sha256": "9ae63ff69ac20e2e8cf4819594d6a64695e86d959c96247d0eeb383713011bfc"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/driver/prefill_bench.py",
    "bytes": 19176,
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/driver/serve_bench.py",
    "bytes": 60716,
    "sha256": "69fa6d79a4f8919534a75f6f4827ad0c3160bafc134053f9de0ca02eccc17c8b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/driver/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/binding.json",
    "bytes": 239495,
    "sha256": "5fc8adc4e3aa8bd3c520b96f5fc1fc7d35dd9be54e7792d2d3efd768190e4911"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/execution/artifact-sha256.json",
    "bytes": 3,
    "sha256": "ca3d163bab055381827226140568f3bef7eaac187cebd76878e0b63e9e442356"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/execution/attempt.json",
    "bytes": 22863,
    "sha256": "72300f76dedbe50b86851a4ab24d155e8569df1319e480bcb83346357163d0ae"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/execution/memory.json",
    "bytes": 7525,
    "sha256": "570a6dd0e68784d44ea5fc77eb6548b0ac5ff0d8e97939e15940783e503355b3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/execution/memory.samples.jsonl",
    "bytes": 173,
    "sha256": "f29d2e6b70a9152f3f7dd8e2cf40ee17e75b82f6c94bc2e1ae9c5ae9c03d9e71"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/execution/qualification.json",
    "bytes": 2823,
    "sha256": "51f612f01251a0071f0d6122b7c7d5066e40cc7fc936740ef001d687a2665e09"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/execution/receipt.json",
    "bytes": 2603,
    "sha256": "d5df0a590f8f8f54bc3b29fe4fd520f64b92c8eff10180d4dfc8ff8c5da1bbeb"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/execution/stderr.txt",
    "bytes": 735,
    "sha256": "d3fa6cd31637b8d94c5097de4852a2e3e5978c541e0531f43ab8f01097088262"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/execution/stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/protocol.json",
    "bytes": 6899,
    "sha256": "407f1972b04fa5723f1a8933fcbcec6cd9cb3c96c1afb1c27e3e73cd367805e0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/run.py",
    "bytes": 18359,
    "sha256": "606806c950c9dc6e2fb8d7e3436a795ac75e396400ed971fc9969ff6eb625f6d"
  }
]
```

## Artifact SHA-256 4dc80d43155fcf525d87f336219aca84efab42212e8f08d2d4bf6682ee686f47

Encoding: `utf-8`. Original bytes: 12078.

````````````text
{
  "sources": {
    "/private/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/run.py": "9ae63ff69ac20e2e8cf4819594d6a64695e86d959c96247d0eeb383713011bfc",
    "/private/tmp/slotstream-optimization-execution/final-composition-continuation-v569/campaign.py": "711bd300a1b8dd38dbdbf7a202e5669ef760c9e9ee10f3fea4a1f95ab04b539b",
    "/private/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/qualification.py": "eb1f3516bda70b6667e5ba4d04e1da5f9731bc87410ff5b4cca85f94f7bf2650",
    "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/run.py": "606806c950c9dc6e2fb8d7e3436a795ac75e396400ed971fc9969ff6eb625f6d",
    "/private/tmp/slotstream-optimization-execution/final-paired-continuation-serial-v573/run.py": "010a1535a33d0dcbf4dddbf1596d20cdfdff34ac7534e75af765bce2b3792a9f",
    "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/thermal_settle.py": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  "initial_paired_status": {
    "scope": "V519 candidate qualification. Selected scope/vision defaults require all original paired studies, corrected lifetimes, resource/client families, sustained TPS and delivery before activation.",
    "stages": [
      {
        "stage": "native/combined-plain",
        "status": "passed",
        "assertions": 286,
        "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/combined-plain"
      },
      {
        "stage": "native/combined-mtp",
        "status": "passed",
        "assertions": 327,
        "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/combined-mtp"
      },
      {
        "stage": "native/read-failure-serving",
        "status": "passed",
        "assertions": 522,
        "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/read-failure-serving"
      },
      {
        "stage": "paired/short-one",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_reduction": true,
              "positive_fraction": true,
              "exact_outputs": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [
              3
            ],
            "median_first_job_reduction_fraction": 0.08442020957959684
          }
        ]
      },
      {
        "stage": "paired/unique-prose",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_non_regression": true,
              "positive_fraction": true,
              "exact_outputs": true,
              "minimum_active_savings_bytes": true,
              "minimum_sampled_peak_savings_bytes": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [
              4,
              5,
              6
            ],
            "median_first_job_reduction_fraction": 0.022507005578685457
          }
        ]
      },
      {
        "stage": "paired/sampled-short",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_non_regression": true,
              "positive_fraction": true,
              "exact_outputs": true,
              "minimum_active_savings_bytes": true,
              "minimum_sampled_peak_savings_bytes": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              4,
              5,
              6,
              7,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [
              3,
              8,
              9
            ],
            "median_first_job_reduction_fraction": 0.05202113876513248
          }
        ]
      },
      {
        "stage": "paired/mtp-resource",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_non_regression": true,
              "positive_fraction": true,
              "exact_outputs": true,
              "minimum_active_savings_bytes": true,
              "minimum_sampled_peak_savings_bytes": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [],
            "median_first_job_reduction_fraction": -0.024023171802248333
          }
        ]
      },
      {
        "stage": "paired/distinct-tail",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_reduction": true,
              "positive_fraction": true,
              "exact_outputs": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [],
            "median_first_job_reduction_fraction": 0.012726902808335105
          }
        ]
      },
      {
        "stage": "paired/complete-repeat",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_reduction": true,
              "positive_fraction": true,
              "exact_outputs": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [],
            "median_first_job_reduction_fraction": 0.023493821752745836
          }
        ]
      },
      {
        "stage": "paired/unique-with-retention",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_non_regression": true,
              "positive_fraction": true,
              "exact_outputs": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [],
            "median_first_job_reduction_fraction": 0.0271202938866435
          }
        ]
      },
      {
        "stage": "paired/actual-default-one-token",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_non_regression": true,
              "positive_fraction": true,
              "exact_outputs": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [],
            "median_first_job_reduction_fraction": 0.09078323373404107
          }
        ]
      },
      {
        "stage": "soak/off",
        "status": "unrun"
      },
      {
        "stage": "soak/on",
        "status": "unrun"
      }
    ],
    "qualification_complete": false,
    "activation_performed": false,
    "paired_matrix_complete": true,
    "final_composition_selected": true,
    "optimization_program_complete": false
  },
  "readiness": {
    "stable_seconds": 120,
    "maximum_wait_seconds": 600,
    "poll_seconds": 2
  },
  "required_startup_gb": {
    "off": 13,
    "on": 15
  },
  "lifetime_reserved_seconds": 1410,
  "long_reserved_seconds": 12840,
  "original_work_and_acceptance_preserved": true,
  "activation_performed": false
}

````````````

## Artifact SHA-256 56296949d3a02e635b050fd6b4762f0f0b52c23d05b925203095f7daf8e19027

Encoding: `utf-8`. Original bytes: 21.

````````````text
{
  "exit_code": 1
}

````````````

## Artifact SHA-256 62918d8ac02e3c2ba5232f114f2fa9e95acef6b8a87ce730e57d0642aab74143

Encoding: `utf-8`. Original bytes: 269.

````````````text
{
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/run.py",
    "run",
    "--mode",
    "on",
    "--deadline",
    "2026-09-10T09:49:39.034065+00:00"
  ]
}

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 0f6015f8a0a1b6b85eda2d7e713cb7cd300f28fa1638a5ab8540450ef0fb6156

Encoding: `utf-8`. Original bytes: 800.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "72300f76dedbe50b86851a4ab24d155e8569df1319e480bcb83346357163d0ae",
  "exit_code": 1,
  "error": "FileNotFoundError: [Errno 2] No such file or directory: '/Users/carlos/Projects/slotstream/.build/optimization/final-long-adaptive-schedule-v581/on/manifest.json'",
  "elapsed_seconds": 4.957489958,
  "proofs_unchanged": true,
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
  "execution_receipt_sha256": "d5df0a590f8f8f54bc3b29fe4fd520f64b92c8eff10180d4dfc8ff8c5da1bbeb",
  "artifact_sha256": "ca3d163bab055381827226140568f3bef7eaac187cebd76878e0b63e9e442356",
  "activation_qualified": false
}

````````````

## Artifact SHA-256 81868a6e94ffc0178bf833deb1c9013d9fab4ee95ddb876a5e8ec4f1d26376d2

Encoding: `utf-8`. Original bytes: 21.

````````````text
{
  "exit_code": 0
}

````````````

## Artifact SHA-256 87bb9518726240d3fd4938ec2e11acf79e1ee6db7c54b11ace4348fefeed8029

Encoding: `utf-8`. Original bytes: 329.

````````````text
{
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/run.py",
    "freeze",
    "--mode",
    "on",
    "--campaign",
    "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-continuation-v569"
  ]
}

````````````

## Artifact SHA-256 006887783eaf11863f0f1e43ef35d1b10a080074164fb26966b172fa9426191e

Encoding: `utf-8`. Original bytes: 136.

````````````text
{
  "frozen": "on",
  "binding_sha256": "5fc8adc4e3aa8bd3c520b96f5fc1fc7d35dd9be54e7792d2d3efd768190e4911",
  "model_launched": false
}

````````````

## Artifact SHA-256 b1b1568c35063ccf105d39d00c1ff4ab8037f4175bcb6e0458e978993ee7fb1d

Encoding: `utf-8`. Original bytes: 211.

````````````text
{
  "enabled": true,
  "reserved": true,
  "seconds": 121.51033683300011,
  "sampled_nominal_seconds": 121.48184554199997,
  "samples": 60,
  "before_launch_only": true,
  "request_acceptance_unchanged": true
}

````````````

## Artifact SHA-256 a0263bf27e7afb7ea4fc49698830ca8967eea8728a6a28a742283d7c37c4200d

Encoding: `utf-8`. Original bytes: 13459.

````````````text
{"seconds": 0.028491291000136698, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34609463296, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 2.088065750000169, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34614509568, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 4.150879791000079, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34354724864, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 6.213683416000094, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34539028480, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 8.27712262500063, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34544123904, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 10.340443250000135, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34539421696, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 12.403506625000773, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34534883328, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 14.441412041000149, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34489401344, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 16.5032951660005, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34489450496, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 18.56333020800048, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34488795136, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 20.62447179100036, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34352250880, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 22.685679000000164, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34353692672, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 24.745483458000308, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34364178432, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 26.807852541000102, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34541305856, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 28.871066375000737, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34537979904, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 30.935113500000625, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34470707200, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 32.991529750000154, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34463268864, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 35.048895666000135, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34543960064, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 37.11068820800028, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34462138368, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 39.17304554100065, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34454732800, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 41.225290000000314, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34456403968, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 43.28283633300089, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34454585344, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 45.34268091600006, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34455322624, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 47.40035525000076, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34454339584, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 49.45916345800015, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34449162240, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 51.52236512500076, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34449293312, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 53.58572812500006, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34528985088, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 55.65028291600083, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34447507456, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 57.713031083000715, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34447720448, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 59.77356125000006, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34511749120, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 61.8442553750001, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34510422016, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 63.90696066600049, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34443018240, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 65.96559408300072, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34444181504, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 68.0312053330008, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34443821056, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 70.09376425000028, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34442067968, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 72.15383154100073, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34438316032, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 74.21705179100081, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34487189504, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 76.27107020800031, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34482765824, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 78.32724762500038, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34484666368, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 80.38341670800037, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34419130368, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 82.4386359580003, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34416214016, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 84.49683883300077, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34288992256, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 86.55408654100029, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34476851200, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 88.61586087500018, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34389999616, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 90.67375912500029, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34396995584, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 92.73591308300001, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34462826496, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 94.79869804100053, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34475294720, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 96.85944075000043, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34393636864, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 98.91335875000004, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34398437376, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 100.94649908300016, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34398289920, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 103.00230212500082, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34393325568, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 105.0557104160007, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34385035264, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 107.1175873330003, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34388475904, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 109.17753112500031, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34371944448, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 111.24088287500035, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34378612736, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 113.30131820800034, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34373877760, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 115.33253012500063, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34374991872, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 117.38820904100066, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34377924608, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 119.45011958300074, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34456518656, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 121.51033683300011, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 34460762112, "swapins": 44362601, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}

````````````

## Artifact SHA-256 9ae63ff69ac20e2e8cf4819594d6a64695e86d959c96247d0eeb383713011bfc

Encoding: `utf-8`. Original bytes: 6561.

````````````text
"""Run the two original lifetimes and two prospective long cohorts serially.

Start only after the complete final paired campaign. Original executors retain
all work, source/acceptance checks, memory guards, deadlines and owned cleanup.
This queue cannot retry a study or activate the candidate.
"""
from pathlib import Path
import datetime
import hashlib
import importlib.util
import json
import signal
import sys

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
ROOT = Path('/Users/carlos/Projects/slotstream')
PAIRED = BASE / 'final-composition-continuation-v569/campaign.py'
LIFETIME = BASE / 'final-composition-lifetime-v570/qualification.py'
LONG = BASE / 'final-long-adaptive-schedule-v581/run.py'
SERIAL = BASE / 'final-paired-continuation-serial-v573/run.py'
THERMAL = BASE / 'thermal-settle-preparation-v388/thermal_settle.py'
sys.path.insert(0, str(ROOT / 'Tools'))


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec); spec.loader.exec_module(value)
    return value


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def write(path, value):
    with path.open('x') as output:
        json.dump(value, output, indent=2); output.write('\n')


class ProgressOutput:
    """Preserve every child byte and forward its existing long-cohort progress."""
    def __init__(self, output, label):
        self.output, self.label = output, label

    def write(self, line):
        result = self.output.write(line)
        if line.startswith('{"completed_cells":'):
            try:
                progress = json.loads(line)
            except ValueError:
                pass
            else:
                print(json.dumps(dict(progress, stage=self.label)), flush=True)
        return result

    def flush(self):
        self.output.flush()


def main():
    def interrupted(number, frame):
        raise KeyboardInterrupt(f'final lifetime/decode queue interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    paired = module('final_queue_paired', PAIRED)
    original = module('final_queue_original_serial', SERIAL)
    thermal = module('final_queue_original_readiness', THERMAL)
    state = paired.status()
    assert state['paired_matrix_complete'] is True
    assert all(row['status'] == 'passed' for row in state['stages'][:11])
    assert all(row['status'] == 'unrun' for row in state['stages'][11:])
    assert not paired.c.bench.competing_jobs()
    assert not (LIFETIME.parent / 'preparation.json').exists()
    for mode in ('off', 'on'):
        assert not (LIFETIME.parent / mode).exists() and not (LONG.parent / mode).exists()
    sources = {str(path.resolve()): digest(path) for path in
               (Path(__file__), PAIRED, LIFETIME, LONG, SERIAL, THERMAL)}
    write(HERE / 'binding.json', {
        'sources': sources, 'initial_paired_status': state,
        'readiness': {'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2},
        'required_startup_gb': {'off': 13, 'on': 15},
        'lifetime_reserved_seconds': 1410, 'long_reserved_seconds': 12840,
        'original_work_and_acceptance_preserved': True, 'activation_performed': False})

    def launch(label, command):
        assert all(digest(path) == sha for path, sha in sources.items())
        target = HERE / label; target.mkdir(exist_ok=False)
        write(target / 'launch.json', {'command': command})
        print(json.dumps({'starting': label, 'command': command}), flush=True)
        with (target / 'stdout.txt').open('x') as output, (target / 'stderr.txt').open('x') as error:
            code = original.launch(command, ProgressOutput(output, label), error, progress=True)
        write(target / 'completion.json', {'exit_code': code})
        print(json.dumps({'finished': label, 'exit_code': code}), flush=True)
        assert code == 0, f'{label} did not pass; queue stopped without retry'

    def settle(label, mode):
        target = HERE / (label + '-readiness'); target.mkdir(exist_ok=False)
        print(json.dumps({'settling_before': label, 'nominal_seconds': 120,
                          'required_startup_gb': 13 if mode == 'off' else 15}), flush=True)
        with (target / 'samples.jsonl').open('x') as output:
            def record(value):
                output.write(json.dumps(value) + '\n'); output.flush()
            result = thermal.wait({'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2},
                                  13 if mode == 'off' else 15, record=record)
        write(target / 'result.json', result)

    def deadline(seconds):
        return (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(seconds=seconds)).isoformat()

    launch('lifetime-prepare', [sys.executable, str(LIFETIME), 'prepare'])
    lifetime = module('final_queue_lifetime', LIFETIME)
    for mode in ('off', 'on'):
        label = 'lifetime-' + mode
        settle(label, mode)
        launch(label, [sys.executable, str(LIFETIME), 'run-one', '--deadline', deadline(1410)])
        state = lifetime.status()
        assert next(row for row in state['stages'] if row['stage'] == 'corrected-lifetime/' + mode)['status'] == 'passed'
    assert lifetime.status()['combined_matrix_complete'] is True
    for mode in ('off', 'on'):
        launch('long-' + mode + '-freeze', [sys.executable, str(LONG), 'freeze', '--mode', mode,
                                          '--campaign', str(paired.PACKET)])
        label = 'long-' + mode
        settle(label, mode)
        launch(label, [sys.executable, str(LONG), 'run', '--mode', mode, '--deadline', deadline(12840)])
        result = json.loads((LONG.parent / mode / 'execution/qualification.json').read_text())
        assert result['qualified'] is True and result['cleanup_complete'] is True
        assert result['within_reservation'] is True and result.get('remaining_jobs') == []
    write(HERE / 'completed.json', {
        'both_original_lifetimes_passed': True, 'both_original_long_workloads_passed': True,
        'all_sources_unchanged': all(digest(path) == sha for path, sha in sources.items()),
        'optimization_program_complete': False, 'activation_performed': False,
        'remaining': ['empirical calibration and envelope closure', 'all 37 dispositions',
                      'exact qualified local activation and installed compatibility checks']})
    return 0


if __name__ == '__main__':
    raise SystemExit(main())

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

## Artifact SHA-256 69fa6d79a4f8919534a75f6f4827ad0c3160bafc134053f9de0ca02eccc17c8b

Encoding: `utf-8`. Original bytes: 60716.

````````````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
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
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py'),
                   Path(__file__).with_name('thermal_settle.py'),
                   ROOT / 'Tools/thermal_readiness.py', ROOT / 'Tools/optimization_readiness.py']:
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

## Artifact SHA-256 5fc8adc4e3aa8bd3c520b96f5fc1fc7d35dd9be54e7792d2d3efd768190e4911

Encoding: `gzip+base64`. Original bytes: 239495.

````````````text
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
````````````

## Artifact SHA-256 ca3d163bab055381827226140568f3bef7eaac187cebd76878e0b63e9e442356

Encoding: `utf-8`. Original bytes: 3.

````````````text
{}

````````````

## Artifact SHA-256 72300f76dedbe50b86851a4ab24d155e8569df1319e480bcb83346357163d0ae

Encoding: `utf-8`. Original bytes: 22863.

````````````text
{
  "started_at": "2026-09-10T06:15:43.740074+00:00",
  "deadline_utc": "2026-09-10T09:49:39.034065+00:00",
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/driver/serve_bench.py",
    "--protocol",
    "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/protocol.json",
    "--out",
    "/Users/carlos/Projects/slotstream/.build/optimization/final-long-adaptive-schedule-v581/on"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "10b63deee430c1e1d5792221f128bea0a6158161911676679665a168116cf743",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "c4e09b8b6846abd3f6ac680c8c6723e9f123f84469ca4426afbab4375a2eb91c",
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
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "d3bef4297f9502a90866c04785c74ecb24659dc38d3f0062d90eaa72431a79df",
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
      "source_archive_sha256": "1013bd6d0bdc2e6236f04c9900599c58e8250e79a01518f987da6cdc963a9ea2",
      "binary_sha256": "9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34431582208,
    "swapins": 44362601,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   472142.\nPages active:                                 994524.\nPages inactive:                               781168.\nPages speculative:                            212109.\nPages throttled:                                   0.\nPages wired down:                             224653.\nPages purgeable:                                5053.\n\"Translation faults\":                    19749216358.\nPages copy-on-write:                      1230480921.\nPages zero filled:                       31961785620.\nPages reactivated:                        6272695058.\nPages purged:                              102063503.\nFile-backed pages:                           1624342.\nAnonymous pages:                              363459.\nPages stored in compressor:                  1039178.\nPages occupied by compressor:                 400249.\nDecompressions:                           1538738937.\nCompressions:                             1883652670.\nPageins:                                 10602547574.\nPageouts:                                   11746562.\nSwapins:                                    44362601.\nSwapouts:                                   77895019.\nPages tagged:                                 162792.\nPages tagged resident:                        112581.\nPages tagged compressed:                       50211.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7005.\nPages tag-storage free:                          850.\nPages tag-storage non-tag pageable:            90438.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8713152.\nTagged compressions:                        15695813.\nTagged decompressions:                      14599668.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-10T06:15:43.739919+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "policy": {
    "startup_reclaimable_bytes": 15000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 14000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 12600,
    "stop_on_new_swapouts": true
  },
  "binding_sha256": "5fc8adc4e3aa8bd3c520b96f5fc1fc7d35dd9be54e7792d2d3efd768190e4911",
  "classification": "One original fixed 512-output cohort on exact V519 after native and eight-paired acceptance. No replacement, cross-mode pooling, activation or broader steady-state claim."
}

````````````

## Artifact SHA-256 570a6dd0e68784d44ea5fc77eb6548b0ac5ff0d8e97939e15940783e503355b3

Encoding: `utf-8`. Original bytes: 7525.

````````````text
{
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/driver/serve_bench.py",
    "--protocol",
    "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/on/protocol.json",
    "--out",
    "/Users/carlos/Projects/slotstream/.build/optimization/final-long-adaptive-schedule-v581/on"
  ],
  "policy": {
    "startup_reclaimable_bytes": 15000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 14000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 12600,
    "stop_on_new_swapouts": true
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34430255104,
    "swapins": 44362601,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   472059.\nPages active:                                 994519.\nPages inactive:                               781183.\nPages speculative:                            212109.\nPages throttled:                                   0.\nPages wired down:                             224654.\nPages purgeable:                                5053.\n\"Translation faults\":                    19749217192.\nPages copy-on-write:                      1230481086.\nPages zero filled:                       31961785683.\nPages reactivated:                        6272695058.\nPages purged:                              102063503.\nFile-backed pages:                           1624344.\nAnonymous pages:                              363467.\nPages stored in compressor:                  1039178.\nPages occupied by compressor:                 400249.\nDecompressions:                           1538738937.\nCompressions:                             1883652670.\nPageins:                                 10602547575.\nPageouts:                                   11746562.\nSwapins:                                    44362601.\nSwapouts:                                   77895019.\nPages tagged:                                 162792.\nPages tagged resident:                        112581.\nPages tagged compressed:                       50211.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7005.\nPages tag-storage free:                          849.\nPages tag-storage non-tag pageable:            90439.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8713152.\nTagged compressions:                        15695813.\nTagged decompressions:                      14599668.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.001500541999999605,
      "owned_rss_bytes": 2981888,
      "owned_process_count": 1,
      "reclaimable_bytes": 34420047872,
      "swapins": 44362601,
      "swapouts": 77895019
    }
  ],
  "passed": false,
  "classification": "One original fixed 512-output cohort on exact V519 after native and eight-paired acceptance. No replacement, cross-mode pooling, activation or broader steady-state claim.",
  "child_pid": 11504,
  "owned_root_identity": {
    "pid": 11504,
    "start_abstime": 37774042863349
  },
  "exit_code": 1,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34353315840,
    "swapins": 44362601,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   470696.\nPages active:                                 989820.\nPages inactive:                               780023.\nPages speculative:                            212113.\nPages throttled:                                   0.\nPages wired down:                             231817.\nPages purgeable:                                1716.\n\"Translation faults\":                    19749223552.\nPages copy-on-write:                      1230482164.\nPages zero filled:                       31961789449.\nPages reactivated:                        6272695058.\nPages purged:                              102063503.\nFile-backed pages:                           1624348.\nAnonymous pages:                              357608.\nPages stored in compressor:                  1039178.\nPages occupied by compressor:                 400249.\nDecompressions:                           1538738937.\nCompressions:                             1883652670.\nPageins:                                 10602547597.\nPageouts:                                   11746562.\nSwapins:                                    44362601.\nSwapouts:                                   77895019.\nPages tagged:                                 162785.\nPages tagged resident:                        112574.\nPages tagged compressed:                       50211.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7005.\nPages tag-storage free:                          850.\nPages tag-storage non-tag pageable:            90438.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8713152.\nTagged compressions:                        15695813.\nTagged decompressions:                      14599668.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    11504
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 0.2896117499999997,
  "child_exit_code": 1,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34355462144,
    "swapins": 44362601,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   470813.\nPages active:                                 989827.\nPages inactive:                               780012.\nPages speculative:                            212113.\nPages throttled:                                   0.\nPages wired down:                             231820.\nPages purgeable:                                1730.\n\"Translation faults\":                    19749228952.\nPages copy-on-write:                      1230482977.\nPages zero filled:                       31961792346.\nPages reactivated:                        6272695058.\nPages purged:                              102063503.\nFile-backed pages:                           1624348.\nAnonymous pages:                              357604.\nPages stored in compressor:                  1039178.\nPages occupied by compressor:                 400249.\nDecompressions:                           1538738937.\nCompressions:                             1883652670.\nPageins:                                 10602547602.\nPageouts:                                   11746562.\nSwapins:                                    44362601.\nSwapouts:                                   77895019.\nPages tagged:                                 162785.\nPages tagged resident:                        112574.\nPages tagged compressed:                       50211.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7005.\nPages tag-storage free:                          850.\nPages tag-storage non-tag pageable:            90438.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8713152.\nTagged compressions:                        15695813.\nTagged decompressions:                      14599668.\n"
  }
}

````````````

## Artifact SHA-256 f29d2e6b70a9152f3f7dd8e2cf40ee17e75b82f6c94bc2e1ae9c5ae9c03d9e71

Encoding: `utf-8`. Original bytes: 173.

````````````text
{"elapsed_seconds": 0.001500541999999605, "owned_rss_bytes": 2981888, "owned_process_count": 1, "reclaimable_bytes": 34420047872, "swapins": 44362601, "swapouts": 77895019}

````````````

## Artifact SHA-256 51f612f01251a0071f0d6122b7c7d5066e40cc7fc936740ef001d687a2665e09

Encoding: `utf-8`. Original bytes: 2823.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "72300f76dedbe50b86851a4ab24d155e8569df1319e480bcb83346357163d0ae",
  "exit_code": 1,
  "error": "FileNotFoundError: [Errno 2] No such file or directory: '/Users/carlos/Projects/slotstream/.build/optimization/final-long-adaptive-schedule-v581/on/manifest.json'",
  "elapsed_seconds": 4.957489958,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34304278528,
    "swapins": 44362601,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   467670.\nPages active:                                 994729.\nPages inactive:                               782022.\nPages speculative:                            211559.\nPages throttled:                                   0.\nPages wired down:                             231832.\nPages purgeable:                                1721.\n\"Translation faults\":                    19749275685.\nPages copy-on-write:                      1230489496.\nPages zero filled:                       31961807289.\nPages reactivated:                        6272695178.\nPages purged:                              102063503.\nFile-backed pages:                           1624376.\nAnonymous pages:                              363934.\nPages stored in compressor:                  1033394.\nPages occupied by compressor:                 396556.\nDecompressions:                           1538744721.\nCompressions:                             1883652670.\nPageins:                                 10602547692.\nPageouts:                                   11746562.\nSwapins:                                    44362601.\nSwapouts:                                   77895019.\nPages tagged:                                 162795.\nPages tagged resident:                        112584.\nPages tagged compressed:                       50211.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7005.\nPages tag-storage free:                         1071.\nPages tag-storage non-tag pageable:            90217.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8713152.\nTagged compressions:                        15695813.\nTagged decompressions:                      14599668.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
  "execution_receipt_sha256": "d5df0a590f8f8f54bc3b29fe4fd520f64b92c8eff10180d4dfc8ff8c5da1bbeb",
  "artifact_sha256": "ca3d163bab055381827226140568f3bef7eaac187cebd76878e0b63e9e442356",
  "activation_qualified": false
}

````````````

## Artifact SHA-256 d5df0a590f8f8f54bc3b29fe4fd520f64b92c8eff10180d4dfc8ff8c5da1bbeb

Encoding: `utf-8`. Original bytes: 2603.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "72300f76dedbe50b86851a4ab24d155e8569df1319e480bcb83346357163d0ae",
  "exit_code": 1,
  "error": "FileNotFoundError: [Errno 2] No such file or directory: '/Users/carlos/Projects/slotstream/.build/optimization/final-long-adaptive-schedule-v581/on/manifest.json'",
  "elapsed_seconds": 4.957489958,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34304278528,
    "swapins": 44362601,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   467670.\nPages active:                                 994729.\nPages inactive:                               782022.\nPages speculative:                            211559.\nPages throttled:                                   0.\nPages wired down:                             231832.\nPages purgeable:                                1721.\n\"Translation faults\":                    19749275685.\nPages copy-on-write:                      1230489496.\nPages zero filled:                       31961807289.\nPages reactivated:                        6272695178.\nPages purged:                              102063503.\nFile-backed pages:                           1624376.\nAnonymous pages:                              363934.\nPages stored in compressor:                  1033394.\nPages occupied by compressor:                 396556.\nDecompressions:                           1538744721.\nCompressions:                             1883652670.\nPageins:                                 10602547692.\nPageouts:                                   11746562.\nSwapins:                                    44362601.\nSwapouts:                                   77895019.\nPages tagged:                                 162795.\nPages tagged resident:                        112584.\nPages tagged compressed:                       50211.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7005.\nPages tag-storage free:                         1071.\nPages tag-storage non-tag pageable:            90217.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8713152.\nTagged compressions:                        15695813.\nTagged decompressions:                      14599668.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
}

````````````

## Artifact SHA-256 d3fa6cd31637b8d94c5097de4852a2e3e5978c541e0531f43ab8f01097088262

Encoding: `utf-8`. Original bytes: 735.

````````````text
Traceback (most recent call last):
  File "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/driver/serve_bench.py", line 979, in <module>
    if __name__=='__main__': raise SystemExit(main())
  File "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/driver/serve_bench.py", line 774, in main
    required_memory = measurement_memory(protocol)
  File "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/driver/serve_bench.py", line 163, in measurement_memory
    raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
ValueError: above 10 GB requires a separately declared large-pool measurement purpose

````````````

## Artifact SHA-256 407f1972b04fa5723f1a8933fcbcec6cd9cb3c96c1afb1c27e3e73cd367805e0

Encoding: `utf-8`. Original bytes: 6899.

````````````text
{
  "label": "long-decode-on",
  "classification": "Prospective bounded 512-output study; final composition proofs and guarded executor required",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "frozen_binary_sha256": "9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673",
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "0",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "0",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
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
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "0",
        "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0",
        "SLOTSTREAM_DRAFT_DEPTH": "1"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
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
        "SLOTSTREAM_OPT_NGRAM_ROWS": "1",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1",
        "SLOTSTREAM_DRAFT_DEPTH": "1"
      }
    }
  },
  "mtp": "on",
  "memory_gb": 12,
  "raw": false,
  "think": false,
  "seed": 7,
  "rounds": 16,
  "max_tokens": 512,
  "minimum_output_tokens": 512,
  "fixture": "/private/tmp/slotstream-optimization-execution/long-decode-measurement-v340/prompt.txt",
  "fixture_sha256": "735497f5024129f9ebcf41af981eae6ec38035f24df4248c277d413e5c71b2c2",
  "comparison_basis": "fixed-total-memory",
  "require_nominal_power_state": true,
  "maximum_sampled_footprint_bytes": 12000000000,
  "abort_on_resource_failure": true,
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "between_cells_seconds": 0,
  "model_reservation_wait_seconds": 1800,
  "timeout_seconds": 600,
  "acceptance": {
    "minimum_pairs": 8,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "before_cell_thermal_settle": {
    "stable_seconds": 30,
    "maximum_wait_seconds": 600,
    "poll_seconds": 2
  }
}

````````````

## Artifact SHA-256 606806c950c9dc6e2fb8d7e3436a795ac75e396400ed971fc9969ff6eb625f6d

Encoding: `utf-8`. Original bytes: 18359.

````````````text
"""Guarded 512-output measurement after exact native/eight-paired qualification.

Check/freeze are model-free. A run needs an explicitly granted full interval.
The original V340 reporter and ownership guard stay unchanged. An isolated
serving driver adds sampled prelaunch readiness; only the two unfrozen
long cohorts replace the fixed sleep. Full work and acceptance remain intact.
V524 binds the exact final controls; V523 checks native output. The final
continuation additionally proves all seven original native cases and revalidates
the explicitly reused short-one cohort. This runner cannot activate or retry.
"""
import argparse
import datetime
import fcntl
import importlib.util
import inspect
import json
from pathlib import Path
import sys

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
OUT = ROOT / '.build/optimization/final-long-adaptive-schedule-v581'
sys.path.insert(0, str(ROOT / 'Tools'))
sys.path.insert(0, str(BASE / 'pressure-footprint-v341'))
import optimization_campaign as c
from prefill_bench import digest
from guard_with_footprint import guarded_run


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


core = module('long_original_executor', BASE / 'optional-current-serving-v330/run.py')
controls = module('long_selected_controls', BASE / 'final-composition-controls-v524/controls.py')
study = module('long_original_reporter', BASE / 'long-decode-measurement-v340/long_decode.py')
native = module('long_native_assertions', BASE / 'final-composition-native-v523/run.py')
adapter = module('long_final_continuation', BASE / 'final-composition-continuation-v569/campaign.py')
require, now, allowance = core.require, core.now, core.allowance
EXECUTE_SOURCE = inspect.getsource(core.execute)
SECONDS, CLEANUP_SECONDS = 12600, 60
MODES = {'off': 'unique-prose', 'on': 'mtp-resource'}


def policy(mode):
    require(mode in MODES, 'unknown decode mode')
    return {'startup_reclaimable_bytes': (13 if mode == 'off' else 15) * 10**9,
            'minimum_live_reclaimable_bytes': 3 * 10**9,
            'maximum_owned_rss_bytes': (12 if mode == 'off' else 14) * 10**9,
            'sample_interval_seconds': .2, 'maximum_build_seconds': SECONDS,
            'stop_on_new_swapouts': True}


def expected_protocol(mode):
    require(mode in MODES, 'unknown decode mode')
    selected = controls.materialize(MODES[mode])
    controls.validate(MODES[mode], selected)
    result = controls.materialize_long(selected, mode)
    # Reconstruct the existing unrun draft exactly; do not weaken or extend it.
    require(result == c.read(BASE / 'final-composition-controls-v524/drafts' / ('long-' + mode + '.json')),
            'long workload, selected controls or resource contract changed')
    result['between_cells_seconds'] = 0
    result['before_cell_thermal_settle'] = {
        'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2}
    return result


def validate_protocol(mode, value):
    require(value == expected_protocol(mode), 'frozen long protocol changed')


def dependencies():
    paths = [Path(__file__), Path(core.__file__), Path(controls.__file__),
             Path(study.__file__), Path(native.__file__),
             BASE / 'final-composition-controls-v524/preparation.json',
             BASE / 'final-composition-native-v523/preparation.json',
             BASE / 'long-decode-measurement-v340/preparation.json',
             BASE / 'long-decode-measurement-v340/prompt.txt',
             BASE / 'pressure-footprint-v341/guard_with_footprint.py',
             BASE / 'pressure-footprint-v341/pressure_footprint.py']
    paths += [ROOT / 'Tools' / n for n in c.DRIVERS + ('thermal_readiness.py', 'optimization_results.py')]
    paths += list((BASE / 'final-composition-controls-v524/drafts').glob('*.json'))
    paths += [Path(adapter.__file__), adapter.HERE / 'preparation.json',
              BASE / 'final-composition-campaign-v525/campaign.py',
              BASE / 'final-composition-campaign-v525/preparation.json',
              HERE / 'run_test.py', HERE / 'final_checks.py']
    paths += [HERE / name for name in ('prepare.py', 'schedule_checks.py',
              'thermal_checks.py', 'driver-transformation.json', 'schedule-transformation.json')]
    paths += [HERE / 'driver' / name for name in ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py')]
    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}


def campaign_proof(directory):
    """Recompute every native and paired result, including new native assertions.

    This reads the campaign format directly because the old load_packet validator
    intentionally requires the original disabled controls. Only V363's exact
    bounded amendment is accepted here. Lifetime, release and activation gates
    remain separate; no receipt boolean can substitute for raw qualification.
    """
    directory = Path(directory).resolve()
    packet = c.read(directory / 'packet.json')
    contract_path = directory / 'qualification-contract.json'
    build = c.bench.verified_build(controls.BINARY)
    require(packet.get('build') == build, 'campaign belongs to another build or source archive')
    require(packet.get('format') == 'slotstream-campaign-v1'
            and packet.get('stages') == list(c.STAGES)
            and packet.get('native_policy') == c.NATIVE_POLICY,
            'campaign scope or original native policy changed')
    require(packet.get('contract_sha256') == digest(contract_path), 'campaign contract changed')
    require(packet.get('drivers') == {n: digest(ROOT / 'Tools' / n) for n in c.DRIVERS}
            and packet.get('templates') == {p.name: digest(p) for p in sorted(c.TEMPLATES.glob('*.json'))},
            'original campaign drivers or templates changed')
    contract = c.read(contract_path)
    expected_native = {name: {'command': [build['binary'], 'optimization-state-check', '--variant', variant,
                                        '--model', controls.MODEL, '--json'], 'environment': {}}
                       for name, variant in c.NATIVE.items()}
    require(contract.get('format') == 'slotstream-qualification-v1'
            and contract.get('build_identity') == {k: build['identity'][k] for k in c.IDENTITY_KEYS}
            and contract.get('native') == expected_native,
            'native commands, controls, or build identity differ')
    expected_paired = {n: controls.materialize(n) for n in c.PAIRED}
    require(contract.get('paired_protocols') == expected_paired,
            'the exact eight final workloads and selected controls are required')
    stages, artifacts = {}, {}
    for stage in tuple('native/' + n for n in c.NATIVE) + tuple('paired/' + n for n in c.PAIRED):
        stages[stage] = c.assess_stage(directory, packet, contract, stage)
        kind, name = stage.split('/')
        if kind == 'native':
            native.assess(name, c.read(directory / stage / 'evidence/stdout.txt'))
        # Capture the complete prerequisite output, not only its green receipt.
        artifacts[stage] = c.artifact_hashes(directory / stage)
    return {'directory': str(directory), 'build': build,
            'packet_sha256': digest(directory / 'packet.json'),
            'contract_sha256': digest(contract_path), 'stages': stages,
            'stage_artifact_sha256': artifacts, 'activation_qualified': False}


def final_campaign_proof(directory):
    # Keep the original eleven-stage raw assessor intact, then require the full
    # final seven-native bridge and exact source of the reused short cohort.
    result = campaign_proof(directory)
    require(Path(directory).resolve() == adapter.PACKET.resolve(),
            'the exact final continuation is required')
    state = adapter.status()
    require(state['paired_matrix_complete'] is True
            and all(row['status'] == 'passed' for row in state['stages'][:11])
            and all(row['status'] == 'unrun' for row in state['stages'][11:]),
            'all eight final paired studies must pass and legacy lifetimes stay unrun')
    result['all_seven_native_proofs'] = adapter.native_proof()
    result['continuation_adapter_sha256'] = digest(adapter.__file__)
    result['continuation_preparation_sha256'] = digest(adapter.HERE / 'preparation.json')
    return result


def freeze(mode, campaign):
    require(mode in MODES, 'unknown decode mode')
    destination = HERE / mode
    require(not destination.exists() and not (OUT / mode).exists(), 'already frozen or attempted')
    protocol = expected_protocol(mode)
    proof = final_campaign_proof(campaign)
    for name, count in [('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6)]:
        check = (HERE / (name + '-checks.stderr')).read_text()
        require(f'Ran {count} tests' in check and check.rstrip().endswith('OK'),
                'prospective schedule qualification checks missing')
    value = {'format': 'slotstream-guarded-long-decode-v1', 'frozen_at': now(),
             'mode': mode, 'campaign': str(Path(campaign).resolve()), 'proof': proof,
             'dependencies': dependencies(), 'policy': policy(mode),
             'maximum_work_seconds': SECONDS, 'cleanup_seconds': CLEANUP_SECONDS,
             'classification': 'One original fixed 512-output cohort on exact V519 after native and eight-paired acceptance. No replacement, cross-mode pooling, activation or broader steady-state claim.'}
    destination.mkdir(parents=True, exist_ok=False)
    c.write_new(destination / 'protocol.json', protocol)
    value['protocol_sha256'] = digest(destination / 'protocol.json')
    c.write_new(destination / 'binding.json', value)
    return {'frozen': mode, 'binding_sha256': digest(destination / 'binding.json'), 'model_launched': False}


def load(mode):
    require(mode in MODES, 'unknown decode mode')
    destination = HERE / mode
    value = c.read(destination / 'binding.json')
    require(value.get('format') == 'slotstream-guarded-long-decode-v1' and value.get('mode') == mode,
            'binding mode or format changed')
    require(value.get('dependencies') == dependencies(), 'bound executor, fixture or dependency changed')
    require(value.get('policy') == policy(mode) and value.get('maximum_work_seconds') == SECONDS
            and value.get('cleanup_seconds') == CLEANUP_SECONDS, 'original guard or allowance changed')
    require(value.get('protocol_sha256') == digest(destination / 'protocol.json'), 'protocol bytes changed')
    protocol = c.read(destination / 'protocol.json')
    validate_protocol(mode, protocol)
    require(value.get('proof') == final_campaign_proof(value['campaign']), 'bound native/eight-paired evidence changed')
    return value, protocol


def assess_cohort(protocol, completion, rows, warmups):
    # The original reporter validates full output, all first jobs, both modes,
    # exact IDs/text, 511 emission intervals, resource/power/VM observations,
    # ordering and exclusions, including excluded cells' numerical correctness.
    report = study.analyze(rows, warmups, protocol, completion)
    summary = c.bench.summaries(rows, 'reference', protocol['comparison_basis'])
    acceptance = c.bench.acceptance_results(summary, protocol['acceptance'])
    require(acceptance == completion.get('acceptance')
            and completion.get('startup_acceptance') is None,
            'recorded acceptance differs from raw data or the original contract')
    metrics = report['metrics']
    enough = all(x['measured'] is True and x['clean_pairs'] >= study.MINIMUM_PAIRS for x in metrics.values())
    # Apply the same five-percent request bound to the stricter cohort whose
    # first jobs and measured requests are both eligible for long TPS reporting.
    regression = metrics['client_seconds']['median_improvement_percent']
    within_bound = enough and regression >= -100 * protocol['acceptance']['maximum_median_client_regression']
    passed = bool(acceptance and all(x.get('passed') is True for x in acceptance) and within_bound)
    return {'completed': True, 'passed': passed, 'qualified': passed, 'cells': len(rows),
            'all_metrics_measurable': enough, 'eligible_cohort_request_nonregression': bool(within_bound),
            'acceptance': acceptance, 'summary': summary, 'measurement': report,
            'activation_performed': False}


def assess_raw(raw, protocol, build):
    manifest, completion = c.read(raw / 'manifest.json'), c.read(raw / 'completion.json')
    require(manifest.get('protocol') == protocol
            and manifest.get('arm_builds') == {arm: build for arm in ('reference', 'combined')},
            'executed build, controls or protocol differs from the binding')
    rows = [json.loads(line) for line in (raw / 'results.jsonl').read_text().splitlines()]
    warmups = {(n, arm): c.read(raw / f'{n}-{arm}/warmup.json')
               for n in range(1, study.ROUNDS + 1) for arm in ('reference', 'combined')}
    validate_schedule_evidence(manifest, rows)
    return assess_cohort(protocol, completion, rows, warmups)


def execute_bound(mode, *args, **kwargs):
    # Keep the exercised ownership, environment restoration, progress, signals,
    # cleanup and receipt implementation exactly; explicitly bind V341 observer.
    namespace = dict(core.__dict__)
    namespace.update(load=lambda: load(mode), guarded_run=guarded_run)
    exec(compile(EXECUTE_SOURCE, str(core.__file__) + '::execute', 'exec'), namespace)
    return namespace['execute'](*args, **kwargs)


def run(mode, deadline):
    require(mode in MODES, 'unknown decode mode')
    allowance(deadline, SECONDS + CLEANUP_SECONDS)
    value, protocol = load(mode)
    destination, raw = HERE / mode / 'execution', OUT / mode
    require(not destination.exists() and not raw.exists(), 'attempted study cannot retry or resume')
    limit, before, thermal = core.readiness(deadline, SECONDS + CLEANUP_SECONDS,
                                           policy(mode)['startup_reclaimable_bytes'] / 10**9)
    command = [sys.executable, str(HERE / 'driver/serve_bench.py'), '--protocol',
               str(HERE / mode / 'protocol.json'), '--out', str(raw)]
    attempt = {'started_at': now(), 'deadline_utc': deadline, 'command': command,
               'environment': {}, 'build': value['proof']['build'], 'before': before,
               'thermal_prelaunch': thermal, 'policy': policy(mode),
               'binding_sha256': digest(HERE / mode / 'binding.json'),
               'classification': value['classification']}
    def assessment(code):
        load(mode)
        require(code in (0, 1), 'serving process did not complete normally')
        result = assess_raw(raw, protocol, value['proof']['build'])
        c.write_new(destination / 'assessment.json', result)
        return {k: v for k, v in result.items() if k not in ('measurement', 'summary')}
    result = execute_bound(mode, command, destination, SECONDS, policy(mode), assessment,
                           limit, attempt, progress_path=raw / 'results.jsonl')
    # Preserve every partial raw artifact too. Interrupted identities stay used.
    c.write_new(destination / 'artifact-sha256.json', c.artifact_hashes(raw))
    result['execution_receipt_sha256'] = digest(destination / 'receipt.json')
    result['artifact_sha256'] = digest(destination / 'artifact-sha256.json')
    result['activation_qualified'] = False
    c.write_new(destination / 'qualification.json', result)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=('check', 'freeze', 'run'))
    parser.add_argument('--mode', choices=tuple(MODES), required=True)
    parser.add_argument('--campaign', type=Path)
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.action == 'freeze':
            require(args.campaign is not None, 'qualified campaign path required')
            result = freeze(args.mode, args.campaign)
        elif args.action == 'check':
            if args.campaign is not None:
                proof = final_campaign_proof(args.campaign)
                result = {'native_and_paired_qualified': True, 'stages': len(proof['stages']), 'model_launched': False}
            else:
                load(args.mode)
                result = {'binding_valid': True, 'model_launched': False}
        else:
            require(args.deadline is not None, 'fresh explicitly granted deadline required')
            result = run(args.mode, args.deadline)
    print(json.dumps({k: v for k, v in result.items() if k not in ('before', 'after', 'summary')}, indent=2))
    return 0 if args.action != 'run' or result.get('qualified') else 1


def validate_schedule_evidence(manifest, rows):
    expected = {name: digest(HERE / 'driver' / name) for name in
                ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py')}
    expected.update({name: digest(ROOT / 'Tools' / name) for name in
                     ('thermal_readiness.py', 'optimization_readiness.py')})
    require(manifest.get('harness_sources') == expected
            and manifest.get('harness_sha256') == expected['serve_bench.py'],
            'actual scheduling driver/helper closure differs')
    require(len(rows) == 32, 'all original cells must carry readiness evidence')
    for row in rows:
        state = row.get('thermal_settle') or {}
        require(row.get('cooldown_seconds') == 0 and all(state.get(key) is True
                for key in ('enabled', 'reserved', 'before_launch_only', 'request_acceptance_unchanged')),
                'sampled readiness missing or bypassed')
        elapsed, stable, samples = (state.get(key) for key in
                                    ('seconds', 'sampled_nominal_seconds', 'samples'))
        require(type(elapsed) in (int, float) and type(stable) in (int, float)
                and 30 <= stable <= elapsed <= 600
                and type(samples) is int and samples >= 16,
                'readiness stability or bounded observation evidence is invalid')


if __name__ == '__main__':
    raise SystemExit(main())

````````````
